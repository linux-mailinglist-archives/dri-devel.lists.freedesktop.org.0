Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 447D4CFFFC9
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 21:20:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B35A10E2D2;
	Wed,  7 Jan 2026 20:20:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lS5mvSFQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011041.outbound.protection.outlook.com [52.101.62.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE46910E2D2;
 Wed,  7 Jan 2026 20:20:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Se40fD8XqZsSW09iJOwGW1n6IiPOBEgKSGr4rzjPurKFU43bSrIFYFS/q76sDW0WrrqffH9sr5fjYUMBOEZHKmy1YJ7BXoT7AxmSGogkuItFPqNdWauIsdkfHk853OJb3EpCDO7Qp4+W5FC8bTkYw7CHRBarZ4y9rMXHhink57pzpRLpknamktjhaxMa00dga/QB+g5a0B4oIkP04SNrno3GDKP+jjHxNhlpEDZbdXFufu2pe0jA1lPMnfGZg6CIRIhKRlKLddz2aV5MQGNk4fr8xKvc4zPDcKrektCUpuadz0aUijuwksoqMF2KQXl5NUVoi0m6CfOlMWUCnGawvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XWAbA3U5a7QAseeHncFszHt14OwDtua1LvgFFx6A4CE=;
 b=qGi4LPOxs9Ea/w9cPNUQo28px+Q8ysSeieCkeCpOmI/hRN4noPS7vGhVnHemSem091aINGmEh6r1WwgsDlyqBcfM7J064QZutwhp8FQykd9PvBIIU9ygGHw20MoYz1n9xuV9F/b6fBVq9GIZEgPZCY9khXNmbahF2tLJNH9qZtuJ2+Rvs7Mf99D2IGgjtKm8iMy7ogjMOMM8nA/azxyvpayFOdswX7RunRMrlULICHX1eK6FsVcpKW+TUsbMpXSDKwcnwoab//U5ulW6zKOal9eKRernsCcI0FnXcquNMAk9HQtapdfAeVV/0wiXfan9kGJGr9Pw0+Eu1moNgEoDhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XWAbA3U5a7QAseeHncFszHt14OwDtua1LvgFFx6A4CE=;
 b=lS5mvSFQvvj7a3CcK3EJNTEu201xPS0I6G2VnMYS4Y4slNvhrSmLJIO9h85VQanGadZiZ/zr0Q9YfBX4CM71BBa3eaMhRILsVcgyWfc5OBFk3g9InuwOg5c832SmE8i0U9AbRgLIg1041lghAdsWQ51mEp2Oe7Ackj3E00YPXAtIdbl88d2ImnyLWxm4d+uxnPhbRABDVp+OFqb0OOF5U+hxZEHumUJ2qlZo8oBGfnSiriD537PkMi8/2m7CKoZRTWobnB7nZmg8clHVwBA1juuF5zPT2hn9o4lB5T2E9+IrK7Vu/EI25AYYg5Mw90nCQnOc93PSpHpev+nQGyWDAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 BY5PR12MB4177.namprd12.prod.outlook.com (2603:10b6:a03:201::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 20:20:19 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.9478.004; Wed, 7 Jan 2026
 20:20:19 +0000
From: Zi Yan <ziy@nvidia.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Balbir Singh <balbirs@nvidia.com>, 
 linux-mm@kvack.org, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>
Subject: Re: [PATCH 1/4] mm/migrate: Add migrate_device_split_page
Date: Wed, 07 Jan 2026 15:20:15 -0500
X-Mailer: MailMate (2.0r6290)
Message-ID: <F4EAA470-C922-4066-A115-13D6D055C73A@nvidia.com>
In-Reply-To: <20251216201206.1660899-2-francois.dugast@intel.com>
References: <20251216201206.1660899-1-francois.dugast@intel.com>
 <20251216201206.1660899-2-francois.dugast@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SJ0PR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::27) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|BY5PR12MB4177:EE_
X-MS-Office365-Filtering-Correlation-Id: 53e35299-7134-4f9b-3be4-08de4e2a2d9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YytjTmVKRzk3em1WRlY5UnA0OEdscTNxSE9RN0ZIZCtzZ0UxdmdwdU9ibmtY?=
 =?utf-8?B?RktNOSttditXRk9GeEpBb1JiL2VLcHd6cGd4bnB5VXF2SUZWR1MwWmViK1N1?=
 =?utf-8?B?QytqTEZlZ1puYVVhdC9LWW14dU1pOGlCcG9iT0RVRVdxc2R0YTM1UThvY1Jr?=
 =?utf-8?B?QlBTdjhZdFhINzAwNUhSamErZ2dIQUMvaXZHMHVaU0pVZjExdC9MY0M4bGRU?=
 =?utf-8?B?Q212OXZhZFRuZ0JiZURwNWNRMHNDalgwSFF6enBsOURsYkpZY3EvQk9uNk1E?=
 =?utf-8?B?c1gyVTJwZmxNaXVlblFpN0ExckJLZEtkZ2w1aEpaZXJtNFZ5OUNBeUo1NHpt?=
 =?utf-8?B?ZFBHMG4xaDZPaEkwVFFEZW5ERDZtQkR5TkthbUhjelZEOFZ6eGJBT0JUK0xF?=
 =?utf-8?B?TU5WVzFkNllMa0p5ZXlUSmc1S3BGakVZaW1kQzUvVndBRkNQdEdlenp5dVhT?=
 =?utf-8?B?QUdCNHErdGpOcDhvbHlqU2NhajR1TGp2NXVRdlpaMXFzeFJzcXdXanUyeHJ2?=
 =?utf-8?B?SXp6TVBMWDZuRzMyWFA2TTN6c2JRdDhYRHN0Ly9QUzhhZmJGNXdjVmIrUFdw?=
 =?utf-8?B?d05pMTJuMkRXT2tqNXVJKysySHRNTzZ3a1lNS2RHaU9iTlJmdzJJc1FtU1U1?=
 =?utf-8?B?RWNZUGxUUXd0aFNGV20zM3RwTmdPRXRzcUV1dys2bUVpN0E5R0pBTmlOaDZO?=
 =?utf-8?B?NHB5L2hvZlpTaS9FcFBwVzVkU0JnaWVvaFpSS1JLRW9KOUJJMm9ua2xDbDRG?=
 =?utf-8?B?R3hHWmpPV0Y2T1FkcTU1d3Z0WVVDRHhucDV1clNVNlhETUhqMjI3RDZnSHdG?=
 =?utf-8?B?T3hDRkNUWXNnYlFPVUtRRXBKUkFjVFBuSGVVdi9kckpmS2R4aVJJcjB3aUN1?=
 =?utf-8?B?RmVnbGlBRzR6WDFEdkVYMHJNcjZYMXcyMGFmbDczSDlOWnFqbFFCNGY5Q1du?=
 =?utf-8?B?eTVhTjBSWW9mZ2RGaHJRdDVhWm5oV3JDY3Z2ZStjb3lBdnd5eTNrczVJWVkr?=
 =?utf-8?B?M1Uwa05HdUdvVUVqbzVpaWRCc2d3NjVuQUc1L1lWa0YrSml1ejBoTHNOc01t?=
 =?utf-8?B?ZzcyZjBCV0t5Mmo3dnE4UWZlOXZ6TnIyZUhPckpUWlNOTXRFZk1aM2tKaU5v?=
 =?utf-8?B?VFpSMjhRY0tsZGxKRkVzaC90MmxjVkxaaytTa3RhdjY5Q25BOEU1OTFBTGkw?=
 =?utf-8?B?NGtEN1VMbFUrNVU2RzQyZlNhNGdjZHA2RURHU1QzbGtYTGNMYkVqM3FDbjFB?=
 =?utf-8?B?dHB2dUtxQWEyaE45ZjZmVUkyOVI5Ym44T0VzamdtelYvbDFGSGdwbTViRVhD?=
 =?utf-8?B?SFdBY1BqcDRVZ3AyODhSM2h5bXJzSE5jdVJuNUJNRnVzeHhuZjZYWjJXODJO?=
 =?utf-8?B?WWMvRFk4VXhQVFAvWlUwQ0lEdVVLQ0QzeW5Ia1VQOEtsTnN0TXhNZThBNVVs?=
 =?utf-8?B?anFaUkNwaUtJVTJIQ2Y0a1NzUmJua3ZuN0hzNjNKVnBkQTEwRzQ0RHJleTNI?=
 =?utf-8?B?ZENCaHZZUkZUclgwOEl0U0dtQmZ5UlRDTkVRMnVQbXFTK1FLLzRsVGJ1eitI?=
 =?utf-8?B?SnhXUWxybStybWptdzQzdTFnV0QvMSszNzkvaE1nblpST05FQ29rcWN1cnRh?=
 =?utf-8?B?TnRkN3BvQWhRdXpacGhkeUlsTS8xYmxLN3d2bGdvc2hWRHZxY3grV3ZXRmEv?=
 =?utf-8?B?ekhVYVNibWRqMSszQUF3USszR3FmMnlrM1dKdHdhV05vTjhHSm4rbTJnNTA5?=
 =?utf-8?B?YUtkdy9MejJaeXdwZHlDcVh1Snc1VWhpSTlQcVhyQWs2UGpnTFNqNUcvYjBU?=
 =?utf-8?B?dGp1K1QwalFpdWJsWW1TbmNCdFFTN1UyQ29LQzVjdVBGZURCNU5qZjZnd2Ry?=
 =?utf-8?B?QVVuRmk5SUN2K3pNelZYdCtVUXp6c25EcWVmYW0veVM3c29Lc3U5VDBPQ0ky?=
 =?utf-8?Q?8eQbU8BGzY9ZDszaF+eDpUugInDq671C?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB9473.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDcrSWl0RzVIQzNYZXRZZFNHemVDVFlQeVoxRXoxM3BLOVZ0WFlGS3Z6YWsy?=
 =?utf-8?B?czlqekFrc3VadFhESDN2YThzUFVxZHZPRzM1N0xSMDlFLzZtRHRxR0VvSXhR?=
 =?utf-8?B?bFFwMXlLalZSNHc3NjRzaExlUllabS94N290Q0p2Mm1Zc1RGT1JQRDBvZGRs?=
 =?utf-8?B?SlI5VmFmMWQ2bnlkWXRKOU9ucjNGUVd5VXJFV1hvTkNRZmxpd051ZjRhZ3lU?=
 =?utf-8?B?bVFlNCtmY3V1WmNqdjA1VXVzNGhzL0xxQUgrOTdqNjRLQ2JnQjZ3cUoyZE5a?=
 =?utf-8?B?dnFJS2NWeTgvYWVnQThLRndkRndvZTVNa3E0REZiWW43WXhabkZvU2pHV1Jy?=
 =?utf-8?B?SzdVWmFUaHB4dUl5azdJTmFZY0tSWHJkSHBOYzdJWkNta2p0Z0pYby9WZ1px?=
 =?utf-8?B?RzBvc3lWUEVZNWV4cnZiakdVU3ZsQVljSnY4WTBVbDRmMzV6aUtQQjZSZEVp?=
 =?utf-8?B?QWROcHlWakNYOHhFNUJsQ2xrSnZJcjZFbThBRzVUVFRWUFNGd1FBSnJYaUFU?=
 =?utf-8?B?cGRad25sSVpKZkRNdCtSWFB6U3hmVHAzRmRVUUZiT0RTaTRZcEtHL2Rya2Nr?=
 =?utf-8?B?cXY1K2VOcW9HdlBLdDdJeVFlWUdLbjRGVFhHWVhLS1dkSm85djVDOENsdCto?=
 =?utf-8?B?ZlNCbVMrOVN3SDJNcWNSSFk0RHRrbHR1bnlnSmRHQXovSHlnanRyOEtHcjdr?=
 =?utf-8?B?aFBNVW1wbVU2dFBUUktRd1h1bndGMklCcUtDK3NUcWgvekpVQWJVV0EySHRJ?=
 =?utf-8?B?bW40eFdVUDNMZ2UrbEI0TzFYeW9EY1k2NWl1UmhBcTBadkJGWm9mVy9Eam9P?=
 =?utf-8?B?UVhyZkg0aXJwb0VVOXd6ajUzN3MveVZBcjBhdmxSb0ZCQ3E4dU9xaytXdjgz?=
 =?utf-8?B?U2lkZ3VsN0pUdlErZDNWQnFJM3VxYmtZb2VZTy9XS1U0VUlMNmQ3QnhuWndy?=
 =?utf-8?B?UTVOTzF5eUMzT1JyR2tTdktnbWFJQnpGWXUwQTUxMmJ3a0dscEp5Rnl2eFBD?=
 =?utf-8?B?R0VCMmpZVUFhMCtab3FGaG5Sa3JOcDZPT2NNaWNZWWNudkJ2eWh5T2FjQmFl?=
 =?utf-8?B?TGIwcjI2c2lwNDBLMmp0amdTZWhDSmkrVGJ3aDhYTmJzY1dyK05mSGpaYmwy?=
 =?utf-8?B?cDllOUNVenVoZEV6QlVMMmtrTDUxYkgxOEVhUDdzTklsa3NPR2ZIZCtuU1lV?=
 =?utf-8?B?Z3RsRTg2UXBaenZPdC9MM2lzOFpvc0lVWEt3bWhwMlpCZ0hBMTROMFU1ZDJj?=
 =?utf-8?B?UlhSL3BnRkRVbWxCNmJWZ2F4Uk1yRlA3NklHVEZmUXdEOGNpRUVpb0I0RVhW?=
 =?utf-8?B?TEp0aUFYbS8wSlpVWU4rc2k0VUJFRUxpSXhCUmg1NXIrRnNjVGwyOE9SdzhY?=
 =?utf-8?B?MWRBOWY4ZmpJNk9Jank4MXZaVWRReTZ0a3kzcEJUZGZnQ1I3VVZDMDZYK3dM?=
 =?utf-8?B?MTloc29QRFI3eUNLb3pXRXZxbVJER1ExZzRzU2xEZFlqZGVPZUpBNTEyRC9n?=
 =?utf-8?B?WUZUNG1xWS93UGdGcHgzbUZaRlZuNEVEUlRuSmdvNU1EUzNaWXd6Y1Y4SEww?=
 =?utf-8?B?d2JnczZNMWU1a0NVTUJBdFYrMUxuQSszYUhDbzA3YnRZNngwbVh5Ym5aaERW?=
 =?utf-8?B?TWlPckFBYWI4U0Y1ZGFOTWgyeGVpS3hCWlVDS1hUM3d6V0NBbWQ4SEVjd09x?=
 =?utf-8?B?WVJ6WXlKNzA3c3VwY04wc3NsTlI3OXdlMUYxL1p2QVRtZDJ5cUJWRE9zV0pT?=
 =?utf-8?B?eVlmZVAzZ2ozYlpsQjhxOGN1c2VlY0tYT0ZVS1FVQXlaSGR2emkrT05iNHJW?=
 =?utf-8?B?bWQ4U2taWkdwT1BTbVpCcXhUL3dUTGNSRXF6Y3JJbG1Icm43VEJFdy9Yc2Ez?=
 =?utf-8?B?VzAvVk9GU3FPQlhmbmZlTHRjWnl0K05lYkxMZmU5UjkwUlgxVk1oRW1lUmZp?=
 =?utf-8?B?VlF3bkNjaWNuYVBnbzh2alcyK20rTGRFalpSMnFWekQxRzNWQjFPSWs2Rjd0?=
 =?utf-8?B?dDFvOXp5bmZ3NEIvb1JOeGI1SmJLTHJhN0o4dkZBbVI2ZzVOc0dkL053WDZM?=
 =?utf-8?B?MmJBMEFlRVVSRDRmR205OFI1RW0zdE5OTlVJaHdpRUl3dlN3QjFVaWQxdXA3?=
 =?utf-8?B?Z2RCUFVjUlJySlNUNkZsYW55cTN5c0lGd213VFZxMnFFYW5PblpVRWlzdk9U?=
 =?utf-8?B?dzFBNFRQUHE4Znl3d2ZOdm5BN0htNnlBY01TamJLQkIxeEVQMGFwTWlrYWJu?=
 =?utf-8?B?OUV4UlNjaWladnR1dndQQW54Z2oyYUlUWFhiV3FtZTVtUGFOa3ord01hbThw?=
 =?utf-8?B?ZVl6eVpyeTR5QS9hZmhiaExBcWp6RllIMmk1QWhuYmJidmFGN1hwUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53e35299-7134-4f9b-3be4-08de4e2a2d9f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 20:20:19.5198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: reVVIcDOHDh20r1ogmhcmNpXBsBviR6FzWLku5wPGorAjKxiQ+4Ea3mHU5HoG1bj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4177
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+THP folks

On 16 Dec 2025, at 15:10, Francois Dugast wrote:

> From: Matthew Brost <matthew.brost@intel.com>
>
> Introduce migrate_device_split_page() to split a device page into
> lower-order pages. Used when a folio allocated as higher-order is freed
> and later reallocated at a smaller order by the driver memory manager.
>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Balbir Singh <balbirs@nvidia.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-mm@kvack.org
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  include/linux/huge_mm.h |  3 +++
>  include/linux/migrate.h |  1 +
>  mm/huge_memory.c        |  6 ++---
>  mm/migrate_device.c     | 49 +++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 56 insertions(+), 3 deletions(-)
>
> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> index a4d9f964dfde..6ad8f359bc0d 100644
> --- a/include/linux/huge_mm.h
> +++ b/include/linux/huge_mm.h
> @@ -374,6 +374,9 @@ int __split_huge_page_to_list_to_order(struct page *p=
age, struct list_head *list
>  int folio_split_unmapped(struct folio *folio, unsigned int new_order);
>  unsigned int min_order_for_split(struct folio *folio);
>  int split_folio_to_list(struct folio *folio, struct list_head *list);
> +int __split_unmapped_folio(struct folio *folio, int new_order,
> +			   struct page *split_at, struct xa_state *xas,
> +			   struct address_space *mapping, enum split_type split_type);
>  int folio_check_splittable(struct folio *folio, unsigned int new_order,
>  			   enum split_type split_type);
>  int folio_split(struct folio *folio, unsigned int new_order, struct page=
 *page,
> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
> index 26ca00c325d9..ec65e4fd5f88 100644
> --- a/include/linux/migrate.h
> +++ b/include/linux/migrate.h
> @@ -192,6 +192,7 @@ void migrate_device_pages(unsigned long *src_pfns, un=
signed long *dst_pfns,
>  			unsigned long npages);
>  void migrate_device_finalize(unsigned long *src_pfns,
>  			unsigned long *dst_pfns, unsigned long npages);
> +int migrate_device_split_page(struct page *page);
>
>  #endif /* CONFIG_MIGRATION */
>
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 40cf59301c21..7ded35a3ecec 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -3621,9 +3621,9 @@ static void __split_folio_to_order(struct folio *fo=
lio, int old_order,
>   * Return: 0 - successful, <0 - failed (if -ENOMEM is returned, @folio m=
ight be
>   * split but not to @new_order, the caller needs to check)
>   */
> -static int __split_unmapped_folio(struct folio *folio, int new_order,
> -		struct page *split_at, struct xa_state *xas,
> -		struct address_space *mapping, enum split_type split_type)
> +int __split_unmapped_folio(struct folio *folio, int new_order,
> +			   struct page *split_at, struct xa_state *xas,
> +			   struct address_space *mapping, enum split_type split_type)
>  {
>  	const bool is_anon =3D folio_test_anon(folio);
>  	int old_order =3D folio_order(folio);
> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> index 23379663b1e1..eb0f0e938947 100644
> --- a/mm/migrate_device.c
> +++ b/mm/migrate_device.c
> @@ -775,6 +775,49 @@ int migrate_vma_setup(struct migrate_vma *args)
>  EXPORT_SYMBOL(migrate_vma_setup);
>
>  #ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
> +/**
> + * migrate_device_split_page() - Split device page
> + * @page: Device page to split
> + *
> + * Splits a device page into smaller pages. Typically called when reallo=
cating a
> + * folio to a smaller size. Inherently racy=E2=80=94only safe if the cal=
ler ensures
> + * mutual exclusion within the page's folio (i.e., no other threads are =
using
> + * pages within the folio). Expected to be called a free device page and
> + * restores all split out pages to a free state.
> + */
> +int migrate_device_split_page(struct page *page)
> +{
> +	struct folio *folio =3D page_folio(page);
> +	struct dev_pagemap *pgmap =3D folio->pgmap;
> +	struct page *unlock_page =3D folio_page(folio, 0);
> +	unsigned int order =3D folio_order(folio), i;
> +	int ret =3D 0;
> +
> +	VM_BUG_ON_FOLIO(!order, folio);
> +	VM_BUG_ON_FOLIO(!folio_is_device_private(folio), folio);
> +	VM_BUG_ON_FOLIO(folio_ref_count(folio), folio);
> +
> +	folio_lock(folio);
> +
> +	ret =3D __split_unmapped_folio(folio, 0, page, NULL, NULL, SPLIT_TYPE_U=
NIFORM);
> +	if (ret) {
> +	       /*
> +		* We can't fail here unless the caller doesn't know what they
> +		* are doing.
> +		*/
> +		VM_BUG_ON_FOLIO(ret, folio);
> +
> +		return ret;
> +	}
> +
> +	for (i =3D 0; i < 0x1 << order; ++i, ++unlock_page) {
> +		page_folio(unlock_page)->pgmap =3D pgmap;
> +		folio_unlock(page_folio(unlock_page));
> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * migrate_vma_insert_huge_pmd_page: Insert a huge folio into @migrate->=
vma->vm_mm
>   * at @addr. folio is already allocated as a part of the migration proce=
ss with
> @@ -927,6 +970,11 @@ static int migrate_vma_split_unmapped_folio(struct m=
igrate_vma *migrate,
>  	return ret;
>  }
>  #else /* !CONFIG_ARCH_ENABLE_THP_MIGRATION */
> +int migrate_device_split_page(struct page *page)
> +{
> +	return 0;
> +}
> +
>  static int migrate_vma_insert_huge_pmd_page(struct migrate_vma *migrate,
>  					 unsigned long addr,
>  					 struct page *page,
> @@ -943,6 +991,7 @@ static int migrate_vma_split_unmapped_folio(struct mi=
grate_vma *migrate,
>  	return 0;
>  }
>  #endif
> +EXPORT_SYMBOL(migrate_device_split_page);
>
>  static unsigned long migrate_vma_nr_pages(unsigned long *src)
>  {
> --=20
> 2.43.0


Best Regards,
Yan, Zi
