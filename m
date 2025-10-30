Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB91C2099E
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 15:32:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D9BA10E9BF;
	Thu, 30 Oct 2025 14:31:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ibq3zwcx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011026.outbound.protection.outlook.com [52.101.52.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC1E010E9BD;
 Thu, 30 Oct 2025 14:31:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z5cQRov1JEbXBPWbYFdz9FV4rJzmhUUrHavYjrpVXJoHOqVSXKrNT+ObV6OZLF+lP9rq54jAAUsP70rw+zoYxhT72FRY5qu7LwSb3FibCAM82NjvmYjTUlCEMOuAK3F9cutUciic0KnimaD5Xh1TIe2p5emh6YPaBHniCh9XcNMJYkSU/6/+fl6estOl7BGRF/Xwz4Arqc1WYNzu18BVYOGlHyM80wAXc55GuEopXMduO21lH86/cxapxX7rke+oB4vGx+XgqTXfJ/yZWOlW3VlkcjOI9BGA2tWrPJS8HmPjaV3AbT22JSsuODkwL//kihfjWr2sQ5kqzXggQKZc7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WQtiGSuhqjNFoYk4CDV+zvjRE4lSdNRvR3RFA/kkf5s=;
 b=psHEinrTDu6ih9WKySItJ9N9y5m0C9vZrN9DwkA8p5RT6N/e/7n3Rx8Sm+VZbae89CbZ8IWbjZZm0Fn1+eFClg3LAN4Kveqd2hOYbpqgxeooFffOj/3SC76WlXx4o7Kn0CO5CllehCz+xdMN3qDAWyfzcZTOFa+MeMHa4DE4SVbeBahljZoWOjM9Hq1e8s2HjW/43KniSzlNbe4Exngz3A6s1hDkFtM99bKO4sfAhUchtdZF2AKG9Sij5GN8F4GqJ/fUhxkt5fW4XkJXEEMeMb2zxmfwi9Lg7eYEcVoxmKaYl3s7OEvCCKdK4vr/IuvAZqKw7FF6dmuPYB1qd6BLBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQtiGSuhqjNFoYk4CDV+zvjRE4lSdNRvR3RFA/kkf5s=;
 b=ibq3zwcxUJ7Gqcwis0ssEKPQZ/422S7bbawlejc9uHo9ERVY8jIv8OyJ59PvbHnqNN9c4DTt7CkFBuk7sDzjQLVthmVfxVYjwz9ehsGwGa9cHzHMasHbAZ/nAj1tmdJ0OlXJrRSmRagVYIpJPVVIvg/CrYYfKcFlXDLjT8/Dniw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH8PR12MB7231.namprd12.prod.outlook.com (2603:10b6:510:225::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 14:31:52 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 14:31:52 +0000
Message-ID: <abbd34de-cbbf-4188-a236-e3eccc357fab@amd.com>
Date: Thu, 30 Oct 2025 15:31:44 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/16] drm/shmem: Provide a generic
 {begin,end}_cpu_access() implementation
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Frank Binns <frank.binns@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 kernel@collabora.com
References: <20251030140525.366636-1-boris.brezillon@collabora.com>
 <20251030140525.366636-3-boris.brezillon@collabora.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251030140525.366636-3-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0077.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::25) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH8PR12MB7231:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a8e41de-861b-413b-29a8-08de17c11172
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?STljTU9oNTNwSXJUZWR2Zk5jWXlLZWJGZkpaYlhnY2pBd21kalNNeGJMUWpL?=
 =?utf-8?B?bHRIMzFVY05vSFhpUHVmdzFmYmhPQjV1TjVsOXBGQWhOVXFZUStWRVE1STdz?=
 =?utf-8?B?ZUxhRUZMWEFUVytTZEJWZ09qa2xPNHdOMWZvai9HZ2I5VnIrYi9DTnFrU0p1?=
 =?utf-8?B?Q1ZESm1MeVpQYUx6ZGNpWE9PTXU4NjA0L25rcFp4anhKelgwMEpyZW9OS0xM?=
 =?utf-8?B?RG9iSWwrVjBMd1dkZkFIczVBaWVOcEcrQXk3QVZUd285Q1lvTTc5TGtHbm52?=
 =?utf-8?B?dFVEMzkwcFBKQjI2WlQ5b3FZYllRTFIyLzZwZC9uUElVaENMcXlLWjZrby9i?=
 =?utf-8?B?THZqTG9oVmFCYlZ0NzZLSGtxd3YrMUEvZFo1T09rS3hmbVloamlEb0s2MmVp?=
 =?utf-8?B?Y1BsakFFZWtRanVUSzF1a1BtQ09GWWFwUzlWdXZ5UVEyWjgrSW9ubVM5Y1hn?=
 =?utf-8?B?ZGg0b0lKaXZLSEJXRHJCOCtZQU9WNjNLcU05akhIVEhHSUFsd1JqQ0FrQ3hD?=
 =?utf-8?B?L2pLaFZEYVF1MmQrdWtsakxGVnZOVXZMMnhlR0hPeUROZXZOc0c5WVU0b3hS?=
 =?utf-8?B?b0ZXbndRY3FQVHY3TXhsYTJuQVNNUjNzNFhRY2duSjVkZlBOekh6OE95WFBX?=
 =?utf-8?B?U094T2FkMTVjRDlBdEtXcyt2elZZSllJOGNOYkRwWUZtTnF1TElORjUyMVVz?=
 =?utf-8?B?Tm1pbFYzOEZDb0xHT3ozb0NxUmJqWVZSRVorazlTR2JkQ2VLY1FWWkpNb1lp?=
 =?utf-8?B?d2NVUkdwVGt5THJLUHE2M1d2eU5RS1c3WlpCRlRpSkJXZlpqMFpKcVNSaU9Z?=
 =?utf-8?B?OG9aNTdLdkx3MjJyTHFRcGl6RGZLd3daOUFuZjV0c2tWL3Izc0s2ajAzUWdr?=
 =?utf-8?B?ZGIwZUg1MUVxUFJLRlA2cEpDaFF6M3dydWZod3l0cXV4RkVxYU92L0RBKzhU?=
 =?utf-8?B?SXJwRDB4YzYyR3hPcWdMYUEyMTZaMDRRUGtMcEpPM2YvT0tmQ1MwY1JCRTNm?=
 =?utf-8?B?R3VtY3k4V3dHQ29xVEdnR2s3Y05Za05UUEM0SFJuTmxQckh4SEhrdnJrK01x?=
 =?utf-8?B?c0s2NlBldm1LMDZwN3BTRVZJRExCdG1ZRWhDdEswYVBlWThKbHUxNUQ4MFpG?=
 =?utf-8?B?a1Q2N0NBMHN3Smd2OENCaFZlMXl2UG9PN282azBVSjVrSEJCYUg1cm9zSkM5?=
 =?utf-8?B?V3Mwc3dmWDAwL2dLK3FQK1d1RDNxU0FXTGlEa2hMR3FQQkxuNkZIUkk5NzJ6?=
 =?utf-8?B?MGdHUXFOT3BIbStzSy9rZmNzK2kyVXV0RFFmd2tZajRVYnFIY0xzRGt2cy9X?=
 =?utf-8?B?QTB0dkxBOVFnbGl6SU81dmRWT1pTSDhGS0lhaE52UWdVbWN0S0E1ZGVXU3hL?=
 =?utf-8?B?aHE0VzZFeHMrUjRldmlVYnloL2xOLzFxVndYZlVSSEdSZXBNN2M1RUVaVzh2?=
 =?utf-8?B?eHJ1Y1BJSzR4RklHcHVPNTN4M0FWMjZYcGZGcGd5MGVzeFVZN0pzUXRVOEhZ?=
 =?utf-8?B?QmFUM1FJbStFV0lqV254dmpQd1JRdjlUWC9sdFRXVi9MNkZKN1gxM2MzTk8v?=
 =?utf-8?B?RUNMZmZYcmZZSFJOc3hrczhIZGY5dm8rck5mUlFqc01Rd3ZrWkFjTVUxRGE4?=
 =?utf-8?B?M2lwS1h0R1p3eG1nV2NyeEZOVURvSlBudEhuYmwvUU5ZZjZ5M3ZHdmd5Q3dK?=
 =?utf-8?B?U1lMNXJ5dHl5L1JOajlnb0ZkU0dISTIyMnFJenR4aTJJOXlXeDJ0bnN5MTJn?=
 =?utf-8?B?Vk0xRXZqdS9nQjBIdWsvVzNidEV1alB0VEtzd29UNmdPM1FjRitaQVNVWHUz?=
 =?utf-8?B?eUJsemMzZWt3dzA3blBBQm15K0ptUFJxTTVmRVpnZFlkZnlMUVZEd2ZwN3FG?=
 =?utf-8?B?dmhST3lPU0tqclozRFQ3dDFENURsTHQyRWtBbzZIaFRramQ2OWx3VTF0OVpI?=
 =?utf-8?Q?HIk2Y57iczjVwajppCBCjf4uqONrBXv+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXFHT3JlVjNEcENSWXlLbmN6ZXlBcFBoNi9Db0pTbkhDckdmbUhTZEhhK3Fq?=
 =?utf-8?B?dFZmME8yeTRUdDUyTDF2dzJwYjZndlpkZzVCdHUvKzJ3RU4rZDltenVqOEVJ?=
 =?utf-8?B?N2ZnbWQ1a3NVSWFSUi9GRnFxdi9JODVraUxUQUZqQnVqMTBOd2Yycy9qcWZm?=
 =?utf-8?B?ci9IUkdLWkNHTlJ4RTR2K01ML0VLZDM4LzdvNWJsR1BWeWYyNHNzZWMzVG0z?=
 =?utf-8?B?V1R6ZWZ5M01heU9KQVZxeDQ4NzJtZS94bG01MWhnN3ExTWwwdWUvU2tIVFYv?=
 =?utf-8?B?dlgrMjRVdGZRbklZTE8yekhhVk9OTnpxT0dVVkV5VFkzeVpYMWJ4aUx3dC8r?=
 =?utf-8?B?ZHlJaXQwVjFTOS8xc2pNQnhqRlZ3QkM4VlhnS1ZHVWZzQndxMnd4RzA1Smp2?=
 =?utf-8?B?TE9QaEh4Z29KMyt5bnFIdFQ0WVBHMFpkUERzdmVodnJpUFlPVGJHckRBbk02?=
 =?utf-8?B?YmhqUFhqWHlwNkVLai8zOHFZUkhSTGUyUHR1a2xhcjNlNmQ3cG4xOTBaNElI?=
 =?utf-8?B?b0YwOVVjdTEwTnR1UjlEYXB4bTNoUGZNL2lyWU00OUE4ZDVYaGVweE02ZXNZ?=
 =?utf-8?B?cnpZS3Fya3NTcTJ5ZnNzU3dxOWhaV0VqazRkb1pHV0ZuSm4xT2hLOG5BbThS?=
 =?utf-8?B?NlZDSXA1RU5IaVlqQWRlYTQ4bHdMLzNPczUydWtsTWN0RUpHQm43NlB2SVpP?=
 =?utf-8?B?dDkvSlpYQS9lNGFjRG1TeHUyNENqZm0wam1nVlVlY0xVanlEaW1YNVo3MEJw?=
 =?utf-8?B?TFJCejZic0ZjWWFVOTdsYjdHampOcHI3Wklhb1pPWVNZcDZacWM3bklHRWFr?=
 =?utf-8?B?VkpHRnpzbDcvRnBxdXFCbzczOGJVYVZtVW1WRExyQUVHdlFPdkM0N2pTZ1ZN?=
 =?utf-8?B?MFNBVlhXckVWRVJ3d0J5Q3hLQTJKMDJZSHF4ei9MRTJJakY4MjRhOVRiVTlU?=
 =?utf-8?B?VGlGYkF4aEc2NUp5Z3QreUhkcXBXbjAvcVdZNE0yb1BCU3BIakd4ZUFJcFRM?=
 =?utf-8?B?ZzY4Z0V5di9zVGFQUFFnOFNNc0Z5UGZWQ0c1SURDM2dCODR4TDh4aVZsRU5T?=
 =?utf-8?B?RHphVktQRDlIeFJKZ3ZoZm93WmZvMENuTFUwVlhIejFPS3I3Sm54eUZVbmdS?=
 =?utf-8?B?dXhuU3haYUYxK1dkUzdoV0R3Y2RUendSK09aMWw5b080N2JoSGZwR3FsVVpa?=
 =?utf-8?B?VXFwc2Nab2tabkZTanJocVN4aXlqMkNJdlJ6SWVqa0F6ZHpSbzFoSmFpWisy?=
 =?utf-8?B?OEhHcjNtWmRqcWZyODgwdVdsZzFUS0crOHEwOXY1M215OWJSUHkwamtCZkJH?=
 =?utf-8?B?TVI1L09xelpzOWZ0bWRyY3NPOFZwYVFzaE5wNlE3UHJtMjBraU1LMFVEalpI?=
 =?utf-8?B?YTdZV01FTG1wdEt5ZXhicjFTSWE5OXYwc2g0RjRLMzlhNllUY1E1MklOV245?=
 =?utf-8?B?OUUzNGxaR1hPVU1mUnUxeVNXOEpFd21JSGFZSmsrVUh1ZWRPY0tvd3ZMajJx?=
 =?utf-8?B?QmFTY3hZVGp2WWFQaklITzFXUFFWTFpQZVBwNzc2RXRZRmFMOWZOMlF0T2VG?=
 =?utf-8?B?RDEzMzBiNGFZYzl3SnlQN0MxNWNEb2dKUWNwbDh4cmFleHcyTkIzZ1lTNlRP?=
 =?utf-8?B?ZE5zYWUvRkRodFZqOVRieG9DVG9NWE5iZEN3ejZ2bkpRSVA5dmRVSFpRRmtY?=
 =?utf-8?B?c1FZOEJ4N1VvVjJmcXhXY1Z0ak1peitFRXF4aWNTNVdqTExZWko5cGRkaVA3?=
 =?utf-8?B?YnViUCtWOTAvQTJFaCtKVEpGQnlOdTBRYUdaVHRJSy9NeGp3L3FsSU9yZE1Y?=
 =?utf-8?B?V280dTc3L25VNjRKRVY4elVscXJ4UCtJaFIzOUEycWgzd1ZPeTBoZFpEVFlu?=
 =?utf-8?B?U0pRZXF5TVVuUVRuS0k0TjlxNVN2UkdKMkVNNExHbzRtUXZiSXpPMm9ZS3Nv?=
 =?utf-8?B?S2pnUk5hRWo0R2t5UUNsQ3JEMC8ycWdPZ09jc055M3llVFpZYUhBeHRmZjBp?=
 =?utf-8?B?NG4xWFJhYXhPTlRFMVdtWmM3OTByVjlxcHl1T0syWjllR1pBOW51MlpCSXBJ?=
 =?utf-8?B?KzNla0hRRzIzMkxtTWNqdjNHVzI5RzFpd1o3Qk1nNEQzbFBGS3ZBdlZBbjFv?=
 =?utf-8?Q?VmKj6OA0gN5D/BYWtmw0qJh/I?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a8e41de-861b-413b-29a8-08de17c11172
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 14:31:52.3425 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h7w4HXFcCNxl85TWm4wIpwiHAS8ryY13/M1l/k1aJCGMmvZIOITyMGMu4gi/EqWT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7231
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

On 10/30/25 15:05, Boris Brezillon wrote:
> The default implementation simply takes care of invalidating/flushing
> caches around CPU accesses. It takes care of both the exporter and
> the importers, which forces us to overload the default
> ::[un]map_dma_buf() implementation provided by drm_gem.c to store the
> sgt.
> 
> v5:
> - New patch
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 114 +++++++++++++++++++++++++
>  include/drm/drm_gem_shmem_helper.h     |  10 +++
>  2 files changed, 124 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index dc94a27710e5..e49c75739c20 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -893,6 +893,120 @@ struct drm_gem_object *drm_gem_shmem_prime_import_no_map(struct drm_device *dev,
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import_no_map);
>  
> +/**
> + * drm_gem_shmem_prime_unmap_dma_buf - Default unmap_dma_buf() for exported buffers
> + * @attach: attachment
> + * @sgt: SG table to unmap
> + * @dir: type of access done by this attachment
> + *
> + * Default implementation for dma_buf_ops::map_dma_buf(). This is just a wrapper
> + * around drm_gem_map_dma_buf() that lets us set the dma_buf_attachment::priv
> + * to the sgt so that drm_gem_shmem_prime_{begin,end}_cpu_access() can sync
> + * around CPU accesses.
> + */
> +struct sg_table *
> +drm_gem_shmem_prime_map_dma_buf(struct dma_buf_attachment *attach,
> +				enum dma_data_direction dir)
> +{
> +	struct sg_table *sgt = drm_gem_map_dma_buf(attach, dir);
> +
> +	if (!IS_ERR(sgt))
> +		attach->priv = sgt;
> +
> +	return sgt;
> +}
> +EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_map_dma_buf);
> +
> +/**
> + * drm_gem_shmem_prime_unmap_dma_buf - Default unmap_dma_buf() for exported buffers
> + * @attach: attachment
> + * @sgt: SG table to unmap
> + * @dir: type of access done by this attachment
> + *
> + * Default implementation for dma_buf_ops::unmap_dma_buf(). This is just a wrapper
> + * around drm_gem_unmap_dma_buf() that lets us reset the dma_buf_attachment::priv
> + * field so that drm_gem_shmem_prime_{begin,end}_cpu_access() don't consider it
> + * as a mapped attachment to sync against.
> + */
> +void drm_gem_shmem_prime_unmap_dma_buf(struct dma_buf_attachment *attach,
> +				       struct sg_table *sgt,
> +				       enum dma_data_direction dir)
> +{
> +	attach->priv = NULL;
> +	drm_gem_unmap_dma_buf(attach, sgt, dir);
> +}
> +EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_unmap_dma_buf);
> +
> +/**
> + * drm_gem_shmem_prime_begin_cpu_access - Default end_cpu_access() for exported buffers
> + * @dma_buf: The exported DMA buffer this acts on
> + * @dir: direction of the access
> + *
> + * Default implementation for dma_buf_ops::begin_cpu_access(). This only takes care of
> + * cache maintenance.
> + */
> +int drm_gem_shmem_prime_begin_cpu_access(struct dma_buf *dma_buf,
> +					 enum dma_data_direction dir)
> +{
> +	struct drm_gem_object *obj = dma_buf->priv;
> +	struct drm_device *dev = obj->dev;
> +	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
> +	struct dma_buf_attachment *attach;
> +
> +	dma_resv_lock(obj->resv, NULL);
> +	if (shmem->sgt)
> +		dma_sync_sgtable_for_cpu(dev->dev, shmem->sgt, dir);
> +
> +	if (shmem->vaddr)
> +		invalidate_kernel_vmap_range(shmem->vaddr, shmem->base.size);
> +


> +	list_for_each_entry(attach, &dma_buf->attachments, node) {
> +		struct sg_table *sgt = attach->priv;
> +
> +		if (sgt)
> +			dma_sync_sgtable_for_cpu(attach->dev, sgt, dir);
> +	}

This conflicts with the debugging hack in DMA-buf.

I've recently send out a patch to fix that, but it hasn't been pushed yet.

Apart from that looks absolutely reasonable to me.

Regards,
Christian.

> +	dma_resv_unlock(obj->resv);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_begin_cpu_access);
> +
> +/**
> + * drm_gem_shmem_prime_end_cpu_access - Default end_cpu_access() for exported buffers
> + * @dma_buf: The exported DMA buffer this acts on
> + * @dir: direction of the access
> + *
> + * Default implementation for dma_buf_ops::end_cpu_access(). This only takes care of
> + * cache maintenance.
> + */
> +int drm_gem_shmem_prime_end_cpu_access(struct dma_buf *dma_buf,
> +				       enum dma_data_direction dir)
> +{
> +	struct drm_gem_object *obj = dma_buf->priv;
> +	struct drm_device *dev = obj->dev;
> +	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
> +	struct dma_buf_attachment *attach;
> +
> +	dma_resv_lock(obj->resv, NULL);
> +	list_for_each_entry(attach, &dma_buf->attachments, node) {
> +		struct sg_table *sgt = attach->priv;
> +
> +		if (sgt)
> +			dma_sync_sgtable_for_device(attach->dev, sgt, dir);
> +	}
> +
> +	if (shmem->vaddr)
> +		flush_kernel_vmap_range(shmem->vaddr, shmem->base.size);
> +
> +	if (shmem->sgt)
> +		dma_sync_sgtable_for_device(dev->dev, shmem->sgt, dir);
> +
> +	dma_resv_unlock(obj->resv);
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_end_cpu_access);
> +
>  MODULE_DESCRIPTION("DRM SHMEM memory-management helpers");
>  MODULE_IMPORT_NS("DMA_BUF");
>  MODULE_LICENSE("GPL v2");
> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
> index 589f7bfe7506..075275d6b2fd 100644
> --- a/include/drm/drm_gem_shmem_helper.h
> +++ b/include/drm/drm_gem_shmem_helper.h
> @@ -291,6 +291,16 @@ int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
>  			      struct drm_mode_create_dumb *args);
>  struct drm_gem_object *drm_gem_shmem_prime_import_no_map(struct drm_device *dev,
>  							 struct dma_buf *buf);
> +struct sg_table *
> +drm_gem_shmem_prime_map_dma_buf(struct dma_buf_attachment *attach,
> +				enum dma_data_direction dir);
> +void drm_gem_shmem_prime_unmap_dma_buf(struct dma_buf_attachment *attach,
> +				       struct sg_table *sgt,
> +				       enum dma_data_direction dir);
> +int drm_gem_shmem_prime_begin_cpu_access(struct dma_buf *dma_buf,
> +					 enum dma_data_direction dir);
> +int drm_gem_shmem_prime_end_cpu_access(struct dma_buf *dma_buf,
> +				       enum dma_data_direction dir);
>  
>  /**
>   * DRM_GEM_SHMEM_DRIVER_OPS - Default shmem GEM operations

