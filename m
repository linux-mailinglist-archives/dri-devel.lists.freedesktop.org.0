Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A54DC60196
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 09:41:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E69BC10E2B0;
	Sat, 15 Nov 2025 08:40:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MTyB5Xsl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013001.outbound.protection.outlook.com
 [40.93.196.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C8C610E144
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 08:40:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wWOSp7SumocMDU1BW0tJrrGZ2rTaU6vdn8WCmEbd/e8lwLqr8BSAx2qRJRe7RckkdWniaCIpZQW8D47wXxqO2pNphuacSOPfs3TFBmKM0kPPc7ZAZgsfAY++2Qc1b+9txGpkP6BwhQvU+036KmbfC6SCboLGKxu7dN05QUju6A8pxHbws5xOjknVll66sNEPakxcnhHZXCO7o+Gi5VRAM98OmQzK3VyJZe7ir5dN1fhdeFrVjaT6i4baOjQLyDzSwQOaxe15bADrOgSvHwGV7/75JebgWrcC/9VCdCTCySC6fkZh98df3LvQpqXY+gU5o0yHtWeN2Rr3qK3Ski/95w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FCEfXha2XbGdD3YXnoFI/VTpGfFK5xtH6k75Gd0GIOA=;
 b=fOSdKrRYx/ObWduzqcZuhcD4zUoqE/vjvGloqP3qbuITYslXGCA3JRAtF3SoG349M8p7RT9uIlE22+vHBLUgZOK7lmeeJ+bIBd3AbumwLAEJr1c9bv7RqXsOiifAX/2/B4wpiiBbYXi0SInsYmmrXGDKS+BpaKWBAY7waJ/4HEdA4gmdvTC+LiYxaBe2QSO9fmH9otHAmKXx+t7umFgAdZhUnWGhmEG/PZcf0Wkyhu+RHpWsb0CV1LyDtI+s1bNZhI66fZKv3kO/FFMPkxuK2Ww+2fE6kPzKrYQ8DnfGV7z/lXc4lcfCjB+qSFMSkIt7AJA0Q1pOQvo94V3aD++xnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FCEfXha2XbGdD3YXnoFI/VTpGfFK5xtH6k75Gd0GIOA=;
 b=MTyB5XslhqKCgbRXMNgAsun5ilwsorIuUa+eM1aYYRJMdSJ5FxHnCnEf3m2lQ5tC04tjTklGON+JgKHQfXZLF2E/6M5rHbDyakTYR53vnjthOoawwj/DSdq+xRu5wC+RJlJdNXt74L4AOWJIV++C342ndOGgneE6rI1u97mm17l3XDx4XnrlNXATCjRlVsgaRw3pth6aryu9aJbprjU5TWe4np6myqb4Fdqr+65cAgtGZxV92sh2gaTWs0ruGW1bkg6T98vSVzFHSloQuiFWYKaMEFTKTFz1Iob+HnTyesa/5XngZoVMsgb1rYNg2+MNBZ1jncnexVdGc6QqA7RPDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by CH3PR12MB8509.namprd12.prod.outlook.com (2603:10b6:610:157::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Sat, 15 Nov
 2025 08:40:50 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9320.018; Sat, 15 Nov 2025
 08:40:50 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org
Cc: Balbir Singh <balbirs@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ralph Campbell <rcampbell@nvidia.com>,
 =?UTF-8?q?Mika=20Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v2] mm/huge_memory: introduce folio_split_unmapped
Date: Sat, 15 Nov 2025 19:40:41 +1100
Message-ID: <20251115084041.3914728-1-balbirs@nvidia.com>
X-Mailer: git-send-email 2.51.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SY5PR01CA0032.ausprd01.prod.outlook.com
 (2603:10c6:10:1f8::9) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|CH3PR12MB8509:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ace671c-dc22-4a87-1c59-08de2422ade5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TE5vQmlGSVR0ZDlwZnJIS1V4Y2RGamJkNVRLbUtrc0Nac25mbit4eXBoS1Jn?=
 =?utf-8?B?U1V5SWo2THZMOTI4aHJTNStPeGdlT1UrdCtodG4yTGFBQkN6eW4vWWRRTlZP?=
 =?utf-8?B?WmUyV0ZzYWp6MmJSNVJrZUpEVnB5VGwrNllRVTdUTjlMU3J6T1NuZms2UW55?=
 =?utf-8?B?aTVYVTB4M3FzcW4wenE2VFFEbzA5MmRZazFPUTNPVXkvM0JocXVwNytndTdm?=
 =?utf-8?B?a0hHamY3cDFSTlFwU2IwMFE0OEV3eVFrZUovbjc4QTd1M28zL3QwZjRlQlgr?=
 =?utf-8?B?cUVrNmpBYVk0T1JVcGErNXNXN2NOMUtTZklOZE5nNThDNEtnaStrQW5sOFJq?=
 =?utf-8?B?UTVwTDAxeFYvT3NUL3VyYjQ5UnZDOEVuTG1DbGhPaHNpbzc4dDFJUVlNSDU1?=
 =?utf-8?B?K2dDUXZKMFZpeVErdHB4YWhnOEN6VmZUdE01TzlhN1h3VVJvTVZETHpKaldy?=
 =?utf-8?B?MURBRUhSUzFXNHpudldHUjZLSjNNRjY4SGx2bGNIWjllMm9DRkw0R1FZeW4w?=
 =?utf-8?B?VWpubXA3c05xRzhyc3MzdTlKOWlZY1RxRkxEcGZ0RzNLRHlnaW5qWW5QMjVR?=
 =?utf-8?B?Y0lFR0MvMVhmUitqSnlsQjV1UktRMUtBTXBWMWxUb0x1eFZjdFZGbG9uOCtw?=
 =?utf-8?B?aWxRN1dIcmVSZlgyVmN4aUo4cVlzMjZaREhpcFZKT2U2OW45YUIxRUhjWXlh?=
 =?utf-8?B?bkt2L0RsSjZKV1pTRnBhMDIxbm45OVJuZFBBMkx6YkZsS21NWm0yVUd1R1BE?=
 =?utf-8?B?SE5pUE1KYVRSVm5zOUpVN08vQkl0N0l0QldoMjJOMW5GSWc1aC9jeTV6cVlv?=
 =?utf-8?B?U2dwK0JoZHRRSGMvS2xzSXdZMlRFWDFaMFNpSHJFRXRNdkU5Z3dnSFFDZmNC?=
 =?utf-8?B?WHdSUVRQdnJ3NStsRTdEaTdkNzJab3c5NnRFcFR3bWVjaDJTWG1wcG5pUitB?=
 =?utf-8?B?NDZUWXlFcDVpZWtocE5pdzZFTU9kYXBuVEpKMEp1eENrMjlQeU45Nks4c09m?=
 =?utf-8?B?d0h5TXBXTHhlVm1SN2Q4RVJRZ1B5WVJoencyQysvVFhUbjRiV0grY3pKdEpZ?=
 =?utf-8?B?WVNiTTlSc3QwYW1WVkpibmp5a3QxWVNOWEdoWnVHUnNDR1dzd29oWGlrb2Ez?=
 =?utf-8?B?eWpQc1FyeEJHME1CdkRCN01RUnViNXo1ZUpGK3B4c1I4UEQxM3lCcGlCVXda?=
 =?utf-8?B?MzgrYVhnTVZNZWhGRmFabFRxWDdMVGM2Rkh2d25uSTFBZzdaNkg3WjhWUDJJ?=
 =?utf-8?B?Qk9VcFB6dnQ3dHhZME9DL21LSnNSTk9ncXNsVXhUU014WWxOUlBMRXVvSzV1?=
 =?utf-8?B?NU1LRElOcThrak52b2kvMk5ZWjV1cCtLNHA1dGxMZis1SDVvZHZ6Vk9XRVFh?=
 =?utf-8?B?bEEzcldaN3AxejZmOUtKS2crQjd2cU1OZitoWG80bFRsZi9lR3hRWEJkbTha?=
 =?utf-8?B?ZEpYRUtOMXhINUt1RWdXa3huVUtENktzWGlNeVc2SGJyNmpEZVA5a3krTmdG?=
 =?utf-8?B?NnFDYlRkNWozZS82UnhsVzg3VkwwYmZMbHpaM3FGWGgyMVN3RkhKaXM2eWJx?=
 =?utf-8?B?S3Y0TkxTYm8xeVpkWW5BaXlnSGNzMjhVZ2xJRWRYTVQ4Vm9JaCtuUmdiOXdI?=
 =?utf-8?B?clRseW5aQ2N2S3NkaFBORXJRVWZHMXBvZkVVbUQ0UFBmaVd4N0x0MGduYmJG?=
 =?utf-8?B?eVgrelNlR3ZhMnl6L1dnOXV5cEtMQldHTGI1TlVKSkNlMWxFNEZWQ2xaMUli?=
 =?utf-8?B?aFlNQVowcjBvMkNpNUZPeVA0WEtFNk01Y3h3eXk5dHluc0JRc1N4THdZZFcx?=
 =?utf-8?B?WHdhM0lYdnltdmRnR1JuUnVTMVVQR0lxT21HS3VhakE5Tlp3bHNtZlp2OWxP?=
 =?utf-8?B?MlFvU1VNUngzN1BEWnRQdWh6OE0yemlocVQ1NG5WQ2VhcXdpdTlldzZta09O?=
 =?utf-8?Q?6FqqNsB6GOvf8rlRFJ2hD49pgqulaahs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3FEVWJSV0lidy9SRkpCa2Z3VDRsREFFQkE2OXZNT1pvdjNudERWZUs2QVpF?=
 =?utf-8?B?c1g3UG1ZNUV3SUx2ZVErV3hsMTlIblZGVXM4MEhOMkEvZU9HS202WW5pZnJp?=
 =?utf-8?B?OEc3VmhxSmx2YVdpZkNGN3ZGZlhoN0Y3dXplcktnOUFNUEsxNVdRV01oNFda?=
 =?utf-8?B?YWU2VzdicU5FbzZoRUVpV1Fxc0xRcW1JTEpua0gxSnpVdFR2ZDR5RHhYNzZL?=
 =?utf-8?B?N2VUUHRpeUFnOTNRdTZoOHJNZGN4S1QzcEhramh2dURxYmFsUDdMc01hdEh4?=
 =?utf-8?B?dDE5UVNyeE91RlBTcFV6UFJYL2hPSVlGclB4TGhlSitiQ0RrU0NYanRucEtr?=
 =?utf-8?B?WmhUMFVGWWMxUEFHMlJPNkp1MmJ1djZrLy9zdm1wYnpvc2tpMm9Eczh0S2wx?=
 =?utf-8?B?K0NjTjZKS3QzQk0valFNd3BEdzJwWnlMeStXbjR0alZzSVpLZDZkV0V3OXBp?=
 =?utf-8?B?bU53SDFjSVdwTy9URklOVnl1c1VMeHhHVytCWjMrZHcrcVZOenZvTXVoTWJj?=
 =?utf-8?B?VUdzbzNOR25tV2oxbk05Q2h6am9ldXlvdHlBcm1kdUJ5MGtDOEs0SHNZZE9o?=
 =?utf-8?B?UVR5cFlYSWVzaDZ2U282N3BySmNXTUFrdDR5NDZyc3ZrN2UrRkg4VFppQVow?=
 =?utf-8?B?dG9ZTTgrMHo2VkRVYmM1TTlidGlWOWtXRHh5Umg1bGVtUWNQbmtjd2hPdFVu?=
 =?utf-8?B?V2FjVkxxNjFpT1c1V3gyd21WdlZiRmRPSUZBd2ZMVnQzL0F3cU5SdUFaKzJM?=
 =?utf-8?B?dFZOaWJyVU04MkkzOFNyVTJoM1ltSFEzWWFNdlZGcXNTUmVianM4cnVJYTlS?=
 =?utf-8?B?TU56UmNScU56bGJHQThyajZpZ0taWmJvQ1libFd1NUZqZ3NiQVkvQWpSN3Uv?=
 =?utf-8?B?MW5YWGxMTTh2QWFxbDBuNUJLQmRITTFqWGh3cDhqb3ZmRmx0MzhmcVdsU2lY?=
 =?utf-8?B?aUpRMFNGSXdTN1krSi9IMERjMnRJVzhVYzdibVB1S1ZaMVU3VjBGVzNGQzJu?=
 =?utf-8?B?SGpGaW5oK0h3bGFTS0VRM3hwTFU1bWtmQUEweGk0YXRZOFhvbmZwUXBYd2Rv?=
 =?utf-8?B?L2JVK3pCcUVud010OHY4R2NvUzhhOTEyaHlYL3VscEtERG5ITEY2NUw4U1pt?=
 =?utf-8?B?RkJYVzNmVU92MHp3TFhKOGR0SXhLOVdUMGNjUXROdUdYbk5BaXRiSU5CUVJU?=
 =?utf-8?B?NXA2OXJORHU5akY4UjJQUGRBSUJUMHVyenJGb291dUloTzZ2eEFGRWFoWWFD?=
 =?utf-8?B?b280MCt3SEVOdWxydzRMQjZ5cTlqajJ6S3RoUHBFVEZMUWNEaFg4T3U3d0Ux?=
 =?utf-8?B?V3h0RkJBK0FoZC90UW1HVE5oR2hwZTZyc3YwdFhmb3dnRGtxd01iMnRCTTFE?=
 =?utf-8?B?cStidWxxODdOQTdRdFRteHpXWURLTVMvdy9mWWRYRkV2Nm56aHpwOUlyeENS?=
 =?utf-8?B?eVZwdExVU2tFY1pvRytodElUL1FNcEZ4YjE3S0Q3NW5CNGgrSXFSYjRQdFR1?=
 =?utf-8?B?VEhIVDhDb1RyMnNTcTJ1WkFma3kxRUh1V1NuM05TQUZES2RLY1h2Rjhjd1Ex?=
 =?utf-8?B?a0dtdVFveUJyWm84azBlODRKeGVlMVprSmJ6d05ZZG4zbjh1U0RMNXdnR2Jp?=
 =?utf-8?B?YU43SE9IOG1ITjdMazZSSnNQNlJYd0FRZXVKVmc1bko3dUlqR1ZTZmg0eGdN?=
 =?utf-8?B?NnRLaEFNT3ZyZGYrM1p1eGpGYUc2QlIxdHNjbmFuUDRqdUdWVlhDUGxOcFNo?=
 =?utf-8?B?MUt2ZFg4SE9vTFRyUXMwR1lJZnVYN0RKV2VUSG1kWVl4dE51R0NYQUlyeDll?=
 =?utf-8?B?MXFCM21GVW0yWTcyU0VYNDZhT2JNRENaVU16SzF2b3FKZTUxMUcyTEVXa2J1?=
 =?utf-8?B?TFZJY0tMcHVOeURaT0hyRTh4TnFPc2tzTVg1Q0hDOXkvNFlyUHRlUFhGTHBI?=
 =?utf-8?B?Vy9oOTg3eU9maEdDQk1qZ2lVQlI5R2VMMklnZTlyTjVpU3VsbGpyYmpjMkQ4?=
 =?utf-8?B?eFgrMUNwTUFCRXNqMytCL1RwWHcyVWRwNWgvZVlPK0ZJNGh5ZFBCd2NabWgx?=
 =?utf-8?B?bEdYOGNPRFBLNndrbER5TjA5VjI3QVJPVTVvTU9kbTdCWUdoNTVnQ1JvcG03?=
 =?utf-8?B?MXRwcVVyY013cHQvZEFKdVdJQytZZjRRRDl4a3FoUjVaY1QzeUM3VjV1QVNh?=
 =?utf-8?B?Tmc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ace671c-dc22-4a87-1c59-08de2422ade5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 08:40:50.0023 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kzEvgvuJRi1LdcZQJ3keve9CqgkoU+b5l5S2c20cDaMF64dqcg2jnhIJqSfHvyzWqHKImjvr6v9Fpei73XWNhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8509
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

Unmapped was added as a parameter to __folio_split() and related
call sites to support splitting of folios already in the midst
of a migration. This special case arose for device private folio
migration since during migration there could be a disconnect between
source and destination on the folio size.

Introduce folio_split_unmapped() to handle this special case. Also
refactor code and add __folio_freeze_and_split_unmapped() helper that
is common to both __folio_split() and folio_split_unmapped().

This in turn removes the special casing introduced by the unmapped
parameter in __folio_split().

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Rakie Kim <rakie.kim@sk.com>
Cc: Byungchul Park <byungchul@sk.com>
Cc: Gregory Price <gourry@gourry.net>
Cc: Ying Huang <ying.huang@linux.alibaba.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Nico Pache <npache@redhat.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Dev Jain <dev.jain@arm.com>
Cc: Barry Song <baohua@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Ralph Campbell <rcampbell@nvidia.com>
Cc: Mika Penttilä <mpenttil@redhat.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>

Suggested-by: Zi Yan <ziy@nvidia.com>
Acked-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: Balbir Singh <balbirs@nvidia.com>
---
Changelog v2
- Fix subject prefix to be mm/huge_memory
- Fix a bug reported by kernel-test-robot, nr_shmem_dropped needs to
  be updated and returned from the helper function
- Added a debug warning folio_split_unmapped() should be called only on
  anonymous folios

This patch should replace "mm-huge_memoryc-introduce-folio_split_unmapped.patch"
in mm/mm-new


 include/linux/huge_mm.h |   5 +-
 mm/huge_memory.c        | 334 +++++++++++++++++++++++-----------------
 mm/migrate_device.c     |   3 +-
 3 files changed, 193 insertions(+), 149 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index e2e91aa1a042..1d439de1ca2c 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -371,7 +371,8 @@ enum split_type {
 
 bool can_split_folio(struct folio *folio, int caller_pins, int *pextra_pins);
 int __split_huge_page_to_list_to_order(struct page *page, struct list_head *list,
-		unsigned int new_order, bool unmapped);
+		unsigned int new_order);
+int folio_split_unmapped(struct folio *folio, unsigned int new_order);
 int min_order_for_split(struct folio *folio);
 int split_folio_to_list(struct folio *folio, struct list_head *list);
 bool folio_split_supported(struct folio *folio, unsigned int new_order,
@@ -382,7 +383,7 @@ int folio_split(struct folio *folio, unsigned int new_order, struct page *page,
 static inline int split_huge_page_to_list_to_order(struct page *page, struct list_head *list,
 		unsigned int new_order)
 {
-	return __split_huge_page_to_list_to_order(page, list, new_order, false);
+	return __split_huge_page_to_list_to_order(page, list, new_order);
 }
 static inline int split_huge_page_to_order(struct page *page, unsigned int new_order)
 {
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 1f5f9a9e6045..78a31a476ad3 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3739,6 +3739,151 @@ bool folio_split_supported(struct folio *folio, unsigned int new_order,
 	return true;
 }
 
+static int __folio_freeze_and_split_unmapped(struct folio *folio, unsigned int new_order,
+					     struct page *split_at, struct xa_state *xas,
+					     struct address_space *mapping, bool do_lru,
+					     struct list_head *list, enum split_type split_type,
+					     pgoff_t end, int *nr_shmem_dropped, int extra_pins)
+{
+	struct folio *end_folio = folio_next(folio);
+	struct folio *new_folio, *next;
+	int old_order = folio_order(folio);
+	int ret = 0;
+	struct deferred_split *ds_queue;
+
+	/* Prevent deferred_split_scan() touching ->_refcount */
+	ds_queue = folio_split_queue_lock(folio);
+	if (folio_ref_freeze(folio, 1 + extra_pins)) {
+		struct swap_cluster_info *ci = NULL;
+		struct lruvec *lruvec;
+		int expected_refs;
+
+		if (old_order > 1) {
+			if (!list_empty(&folio->_deferred_list)) {
+				ds_queue->split_queue_len--;
+				/*
+				 * Reinitialize page_deferred_list after removing the
+				 * page from the split_queue, otherwise a subsequent
+				 * split will see list corruption when checking the
+				 * page_deferred_list.
+				 */
+				list_del_init(&folio->_deferred_list);
+			}
+			if (folio_test_partially_mapped(folio)) {
+				folio_clear_partially_mapped(folio);
+				mod_mthp_stat(old_order,
+					MTHP_STAT_NR_ANON_PARTIALLY_MAPPED, -1);
+			}
+		}
+		split_queue_unlock(ds_queue);
+		if (mapping) {
+			int nr = folio_nr_pages(folio);
+
+			if (folio_test_pmd_mappable(folio) &&
+			    new_order < HPAGE_PMD_ORDER) {
+				if (folio_test_swapbacked(folio)) {
+					__lruvec_stat_mod_folio(folio,
+							NR_SHMEM_THPS, -nr);
+				} else {
+					__lruvec_stat_mod_folio(folio,
+							NR_FILE_THPS, -nr);
+					filemap_nr_thps_dec(mapping);
+				}
+			}
+		}
+
+		if (folio_test_swapcache(folio)) {
+			if (mapping) {
+				VM_WARN_ON_ONCE_FOLIO(mapping, folio);
+				return -EINVAL;
+			}
+
+			ci = swap_cluster_get_and_lock(folio);
+		}
+
+		/* lock lru list/PageCompound, ref frozen by page_ref_freeze */
+		if (do_lru)
+			lruvec = folio_lruvec_lock(folio);
+
+		ret = __split_unmapped_folio(folio, new_order, split_at, xas,
+					     mapping, split_type);
+
+		/*
+		 * Unfreeze after-split folios and put them back to the right
+		 * list. @folio should be kept frozon until page cache
+		 * entries are updated with all the other after-split folios
+		 * to prevent others seeing stale page cache entries.
+		 * As a result, new_folio starts from the next folio of
+		 * @folio.
+		 */
+		for (new_folio = folio_next(folio); new_folio != end_folio;
+		     new_folio = next) {
+			unsigned long nr_pages = folio_nr_pages(new_folio);
+
+			next = folio_next(new_folio);
+
+			zone_device_private_split_cb(folio, new_folio);
+
+			expected_refs = folio_expected_ref_count(new_folio) + 1;
+			folio_ref_unfreeze(new_folio, expected_refs);
+
+			if (do_lru)
+				lru_add_split_folio(folio, new_folio, lruvec, list);
+
+			/*
+			 * Anonymous folio with swap cache.
+			 * NOTE: shmem in swap cache is not supported yet.
+			 */
+			if (ci) {
+				__swap_cache_replace_folio(ci, folio, new_folio);
+				continue;
+			}
+
+			/* Anonymous folio without swap cache */
+			if (!mapping)
+				continue;
+
+			/* Add the new folio to the page cache. */
+			if (new_folio->index < end) {
+				__xa_store(&mapping->i_pages, new_folio->index,
+					   new_folio, 0);
+				continue;
+			}
+
+			VM_WARN_ON_ONCE(!nr_shmem_dropped);
+			/* Drop folio beyond EOF: ->index >= end */
+			if (shmem_mapping(mapping) && nr_shmem_dropped)
+				*nr_shmem_dropped += nr_pages;
+			else if (folio_test_clear_dirty(new_folio))
+				folio_account_cleaned(
+					new_folio, inode_to_wb(mapping->host));
+			__filemap_remove_folio(new_folio, NULL);
+			folio_put_refs(new_folio, nr_pages);
+		}
+
+		zone_device_private_split_cb(folio, NULL);
+		/*
+		 * Unfreeze @folio only after all page cache entries, which
+		 * used to point to it, have been updated with new folios.
+		 * Otherwise, a parallel folio_try_get() can grab @folio
+		 * and its caller can see stale page cache entries.
+		 */
+		expected_refs = folio_expected_ref_count(folio) + 1;
+		folio_ref_unfreeze(folio, expected_refs);
+
+		if (do_lru)
+			unlock_page_lruvec(lruvec);
+
+		if (ci)
+			swap_cluster_unlock(ci);
+	} else {
+		split_queue_unlock(ds_queue);
+		return -EAGAIN;
+	}
+
+	return ret;
+}
+
 /**
  * __folio_split() - split a folio at @split_at to a @new_order folio
  * @folio: folio to split
@@ -3747,7 +3892,6 @@ bool folio_split_supported(struct folio *folio, unsigned int new_order,
  * @lock_at: a page within @folio to be left locked to caller
  * @list: after-split folios will be put on it if non NULL
  * @split_type: perform uniform split or not (non-uniform split)
- * @unmapped: The pages are already unmapped, they are migration entries.
  *
  * It calls __split_unmapped_folio() to perform uniform and non-uniform split.
  * It is in charge of checking whether the split is supported or not and
@@ -3763,9 +3907,8 @@ bool folio_split_supported(struct folio *folio, unsigned int new_order,
  */
 static int __folio_split(struct folio *folio, unsigned int new_order,
 		struct page *split_at, struct page *lock_at,
-		struct list_head *list, enum split_type split_type, bool unmapped)
+		struct list_head *list, enum split_type split_type)
 {
-	struct deferred_split *ds_queue;
 	XA_STATE(xas, &folio->mapping->i_pages, folio->index);
 	struct folio *end_folio = folio_next(folio);
 	bool is_anon = folio_test_anon(folio);
@@ -3809,14 +3952,12 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 		 * is taken to serialise against parallel split or collapse
 		 * operations.
 		 */
-		if (!unmapped) {
-			anon_vma = folio_get_anon_vma(folio);
-			if (!anon_vma) {
-				ret = -EBUSY;
-				goto out;
-			}
-			anon_vma_lock_write(anon_vma);
+		anon_vma = folio_get_anon_vma(folio);
+		if (!anon_vma) {
+			ret = -EBUSY;
+			goto out;
 		}
+		anon_vma_lock_write(anon_vma);
 		mapping = NULL;
 	} else {
 		unsigned int min_order;
@@ -3882,8 +4023,7 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 		goto out_unlock;
 	}
 
-	if (!unmapped)
-		unmap_folio(folio);
+	unmap_folio(folio);
 
 	/* block interrupt reentry in xa_lock and spinlock */
 	local_irq_disable();
@@ -3900,142 +4040,15 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 		}
 	}
 
-	/* Prevent deferred_split_scan() touching ->_refcount */
-	ds_queue = folio_split_queue_lock(folio);
-	if (folio_ref_freeze(folio, 1 + extra_pins)) {
-		struct swap_cluster_info *ci = NULL;
-		struct lruvec *lruvec;
-		int expected_refs;
-
-		if (old_order > 1) {
-			if (!list_empty(&folio->_deferred_list)) {
-				ds_queue->split_queue_len--;
-				/*
-				 * Reinitialize page_deferred_list after removing the
-				 * page from the split_queue, otherwise a subsequent
-				 * split will see list corruption when checking the
-				 * page_deferred_list.
-				 */
-				list_del_init(&folio->_deferred_list);
-			}
-			if (folio_test_partially_mapped(folio)) {
-				folio_clear_partially_mapped(folio);
-				mod_mthp_stat(old_order,
-					MTHP_STAT_NR_ANON_PARTIALLY_MAPPED, -1);
-			}
-		}
-		split_queue_unlock(ds_queue);
-		if (mapping) {
-			int nr = folio_nr_pages(folio);
-
-			if (folio_test_pmd_mappable(folio) &&
-			    new_order < HPAGE_PMD_ORDER) {
-				if (folio_test_swapbacked(folio)) {
-					__lruvec_stat_mod_folio(folio,
-							NR_SHMEM_THPS, -nr);
-				} else {
-					__lruvec_stat_mod_folio(folio,
-							NR_FILE_THPS, -nr);
-					filemap_nr_thps_dec(mapping);
-				}
-			}
-		}
-
-		if (folio_test_swapcache(folio)) {
-			if (mapping) {
-				VM_WARN_ON_ONCE_FOLIO(mapping, folio);
-				ret = -EINVAL;
-				goto fail;
-			}
-
-			ci = swap_cluster_get_and_lock(folio);
-		}
-
-		/* lock lru list/PageCompound, ref frozen by page_ref_freeze */
-		lruvec = folio_lruvec_lock(folio);
-
-		ret = __split_unmapped_folio(folio, new_order, split_at, &xas,
-					     mapping, split_type);
-
-		/*
-		 * Unfreeze after-split folios and put them back to the right
-		 * list. @folio should be kept frozon until page cache
-		 * entries are updated with all the other after-split folios
-		 * to prevent others seeing stale page cache entries.
-		 * As a result, new_folio starts from the next folio of
-		 * @folio.
-		 */
-		for (new_folio = folio_next(folio); new_folio != end_folio;
-		     new_folio = next) {
-			unsigned long nr_pages = folio_nr_pages(new_folio);
-
-			next = folio_next(new_folio);
-
-			zone_device_private_split_cb(folio, new_folio);
-
-			expected_refs = folio_expected_ref_count(new_folio) + 1;
-			folio_ref_unfreeze(new_folio, expected_refs);
-
-			if (!unmapped)
-				lru_add_split_folio(folio, new_folio, lruvec, list);
-
-			/*
-			 * Anonymous folio with swap cache.
-			 * NOTE: shmem in swap cache is not supported yet.
-			 */
-			if (ci) {
-				__swap_cache_replace_folio(ci, folio, new_folio);
-				continue;
-			}
-
-			/* Anonymous folio without swap cache */
-			if (!mapping)
-				continue;
-
-			/* Add the new folio to the page cache. */
-			if (new_folio->index < end) {
-				__xa_store(&mapping->i_pages, new_folio->index,
-					   new_folio, 0);
-				continue;
-			}
-
-			/* Drop folio beyond EOF: ->index >= end */
-			if (shmem_mapping(mapping))
-				nr_shmem_dropped += nr_pages;
-			else if (folio_test_clear_dirty(new_folio))
-				folio_account_cleaned(
-					new_folio, inode_to_wb(mapping->host));
-			__filemap_remove_folio(new_folio, NULL);
-			folio_put_refs(new_folio, nr_pages);
-		}
-
-		zone_device_private_split_cb(folio, NULL);
-		/*
-		 * Unfreeze @folio only after all page cache entries, which
-		 * used to point to it, have been updated with new folios.
-		 * Otherwise, a parallel folio_try_get() can grab @folio
-		 * and its caller can see stale page cache entries.
-		 */
-		expected_refs = folio_expected_ref_count(folio) + 1;
-		folio_ref_unfreeze(folio, expected_refs);
-
-		unlock_page_lruvec(lruvec);
-
-		if (ci)
-			swap_cluster_unlock(ci);
-	} else {
-		split_queue_unlock(ds_queue);
-		ret = -EAGAIN;
-	}
+	ret = __folio_freeze_and_split_unmapped(folio, new_order, split_at, &xas, mapping,
+						true, list, split_type, end, &nr_shmem_dropped,
+						extra_pins);
 fail:
 	if (mapping)
 		xas_unlock(&xas);
 
 	local_irq_enable();
 
-	if (unmapped)
-		return ret;
-
 	if (nr_shmem_dropped)
 		shmem_uncharge(mapping->host, nr_shmem_dropped);
 
@@ -4079,6 +4092,37 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 	return ret;
 }
 
+/*
+ * This function is a helper for splitting folios that have already been unmapped.
+ * The use case is that the device or the CPU can refuse to migrate THP pages in
+ * the middle of migration, due to allocation issues on either side
+ *
+ * The high level code is copied from __folio_split, since the pages are anonymous
+ * and are already isolated from the LRU, the code has been simplified to not
+ * burden __folio_split with unmapped sprinkled into the code.
+ *
+ * None of the split folios are unlocked
+ */
+int folio_split_unmapped(struct folio *folio, unsigned int new_order)
+{
+	int extra_pins, ret = 0;
+
+	VM_WARN_ON_ONCE_FOLIO(folio_mapped(folio), folio);
+	VM_WARN_ON_ONCE_FOLIO(!folio_test_locked(folio), folio);
+	VM_WARN_ON_ONCE_FOLIO(!folio_test_large(folio), folio);
+	VM_WARN_ON_ONCE_FOLIO(!folio_test_anon(folio), folio);
+
+	if (!can_split_folio(folio, 1, &extra_pins))
+		return -EAGAIN;
+
+	local_irq_disable();
+	ret = __folio_freeze_and_split_unmapped(folio, new_order, &folio->page, NULL,
+						NULL, false, NULL, SPLIT_TYPE_UNIFORM,
+						0, NULL, extra_pins);
+	local_irq_enable();
+	return ret;
+}
+
 /*
  * This function splits a large folio into smaller folios of order @new_order.
  * @page can point to any page of the large folio to split. The split operation
@@ -4127,12 +4171,12 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
  * with the folio. Splitting to order 0 is compatible with all folios.
  */
 int __split_huge_page_to_list_to_order(struct page *page, struct list_head *list,
-				     unsigned int new_order, bool unmapped)
+				     unsigned int new_order)
 {
 	struct folio *folio = page_folio(page);
 
 	return __folio_split(folio, new_order, &folio->page, page, list,
-			     SPLIT_TYPE_UNIFORM, unmapped);
+			     SPLIT_TYPE_UNIFORM);
 }
 
 /**
@@ -4163,7 +4207,7 @@ int folio_split(struct folio *folio, unsigned int new_order,
 		struct page *split_at, struct list_head *list)
 {
 	return __folio_split(folio, new_order, split_at, &folio->page, list,
-			     SPLIT_TYPE_NON_UNIFORM, false);
+			     SPLIT_TYPE_NON_UNIFORM);
 }
 
 int min_order_for_split(struct folio *folio)
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 46dd68cfc503..05ce95f43ab9 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -909,8 +909,7 @@ static int migrate_vma_split_unmapped_folio(struct migrate_vma *migrate,
 
 	folio_get(folio);
 	split_huge_pmd_address(migrate->vma, addr, true);
-	ret = __split_huge_page_to_list_to_order(folio_page(folio, 0), NULL,
-							0, true);
+	ret = folio_split_unmapped(folio, 0);
 	if (ret)
 		return ret;
 	migrate->src[idx] &= ~MIGRATE_PFN_COMPOUND;
-- 
2.51.1

