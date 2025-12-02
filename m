Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A87EC99B8B
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 02:20:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 225CA10E3B6;
	Tue,  2 Dec 2025 01:20:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="f0RPY+7Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011051.outbound.protection.outlook.com [52.101.52.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B15DA10E3B6
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 01:20:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tjwKmaKBA++LMRWWqeTlhJW71P0+PjMYH0gz34zvS4GkeswAAvjyKYPbV/KcMJfeL/Wtf99slLeAlQXIJsCh9tAYuxmpll10LC4qOKLHvdfvtPFIhat30KrEWDJnuL88t1YNLn+nWd6lyf/2QMszWEIpDT7HYLIpaRoMIb1muGnqmePaGOaQQ7gNaM84iPIda4Nd0/XvITWSfBf9/jxQmuWacq8Zdw98ScAyn6cVjPUUsjSwvyNiITNEWeUInjGEfbrzouyevLFacEDhN2nis6eKelOFpkSyHxhLA8DrKuMRxZRmU6zfgZBOPQAHUTOLIx2TLbHy++ImKaiAdaNj6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yYYHHcRTAxh3lxp7s6DTkWx0h3LRhMBtt7MXYWDAcr0=;
 b=FLr18v2JQzTShY0t3Kq2jBj+35ZwY89BEBd7t7TKc8ED6rHjWl7LP7hufBUdl8joaQRTl0TY4fSGdmp1S2zz6jqZFgK4MV/PHERWEoFUZoYOXJxfMBvZ3UWBhgzbA3avXKY3ZIQ3rYAqmge2vApKDka6+j98r1hDVic2WmvQh857PLEVGw5Qn1tN3Z5Lk7Z0LySSCKtQY4CXAipu60P/UbbakCH9RmsoRnE9/5E5CkNcKC7IxjF7Kx0uqECLNj8iofP9YoTsNItj+EzO3jmxiUP7G8LM7RV0c7VPLirU1RCG04nmISPUgzMg6+ToFvBqF+dTVbEm2hc4qMb9yVTLhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yYYHHcRTAxh3lxp7s6DTkWx0h3LRhMBtt7MXYWDAcr0=;
 b=f0RPY+7ZtVVXO81kIEJQB1yICW3haapO5FiuWEHpnJ8xY0pcE1XEQXzdTLEH5JaVJneKXXjqjIjIUuifKUpMwxkhGEOSXlLVbcexjb5znRUymqxyTm/2txqZOU4jvTibY2uU+vmjGcE3Wr3WMuCVAYkp45zw3SnPvOQOH7k+Xge3+AU5GoZh4ida9U383d1B8mxsMczffYzQvZAHGH55Y4yWR+LijlWmpOLX34Xmy56rRJqzP9Asp1NIAuAj3t2pD8e1jOgw9yZEKWR0acYGTCUPuJ0hl+FqPdv3fFQlRRNOP0emj0jTCgm7pY783NQHR/7MNocovPp1U94ogvpnqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 PH7PR12MB7940.namprd12.prod.outlook.com (2603:10b6:510:275::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 01:20:23 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%3]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 01:20:22 +0000
Message-ID: <75de1c7d-58d2-4a0f-b86c-b3dae65fb52f@nvidia.com>
Date: Tue, 2 Dec 2025 12:20:12 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/6] mm/hmm: Add flag to track device private PFNs
To: Matthew Brost <matthew.brost@intel.com>
Cc: linux-mm@kvack.org, balbirs@nvidia.com, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 david@redhat.com, ziy@nvidia.com, apopple@nvidia.com,
 lorenzo.stoakes@oracle.com, lyude@redhat.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com,
 mpenttil@redhat.com, jgg@nvidia.com, willy@infradead.org
References: <20251128044146.80050-1-jniethe@nvidia.com>
 <20251128044146.80050-2-jniethe@nvidia.com>
 <aSnrnyfr9fvst6eO@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: Jordan Niethe <jniethe@nvidia.com>
In-Reply-To: <aSnrnyfr9fvst6eO@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::12) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|PH7PR12MB7940:EE_
X-MS-Office365-Filtering-Correlation-Id: ac0476c7-2e9e-46a7-7856-08de3140f719
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ck11aDVmSmtCUVEzdWVxOXJTcVhRb01ISzFwMHNIWU9uOG9zNFBwYm9yUVo2?=
 =?utf-8?B?YndpeGNlNDZzNFdWdkJqbFBtaEg3UHNFV3N6eHpNRmg4WDV1VkQwVWNGM1Fz?=
 =?utf-8?B?Rm8reTMyWFo5WjBQZFkwT3VVK0NPQ29aTzA0azhUSXJMdlk5VjU4ZDllMTBa?=
 =?utf-8?B?WlE4WlY4WDVuUjdBbk12NzU3QTB5R0dWOFIyVTlUbkhuR3N1a3k3bW1EekhO?=
 =?utf-8?B?VDF5NHFwd2J3OW12ZUY0MWR6SVFUTnV4SzlLd0tRZWhwNVF6aGhHeC9QZERS?=
 =?utf-8?B?UklxSWdrYlJDbXJoaE54dkY0UjUwTFpGb2VrVmlZcHRoUzlsTzJHMUJtU1Zp?=
 =?utf-8?B?UGVzVW9NdlFtcGRMdklqTElXdXlJSWVLSnJnR2NMbklMTTA1VWZlRkttZlgz?=
 =?utf-8?B?cTFROXBmc0x5VHkvUHFxY3IvVEVSUmNVSCtnSGNBdFFkOG5YVXpFZy9lVU96?=
 =?utf-8?B?TFNtaktpR0xXMUdRVmZEdGxqOXkydHhNVWNyd0I2aURrUnhsS2NKZ3dHOTVP?=
 =?utf-8?B?RGcrTFR3a0ZGa29VNTFwMUc5Q002MzRKSVVCL2dVWDBzTi96NE1Hdkszbms0?=
 =?utf-8?B?MXQrdFlycm1OQTc2aFo3R3hMKzZVazRvNXdYeXdPbHNKeHB0NjBtNUo2YzNP?=
 =?utf-8?B?SjlydlFFSzZhaVc4djAxdXV4VEZ1QnNnYk1PUTBJRllDNFNYdEFhN0JtZEVy?=
 =?utf-8?B?NWFBZVRHalRoWFVzdm5PVGtYQjRDOVdZYUVrdTNGSnkzaUxYcWI2M0RWOUsr?=
 =?utf-8?B?eFNsdDFUOFdHNHhQOEJxa2NYNTZLZUs1elZPRW9BbjhneHQ4TUNvLzlGL281?=
 =?utf-8?B?RUdnbVlINTJsQ2c0NmxOaHZUT2dzMzlsM0hBaGtNU3BYMzU1Ynp0YzF1NW5t?=
 =?utf-8?B?ZDdRU0NUb2NtTktUUW0yRTBXMWVnSnI4UUxNbXJjblFwR3RCZVl5bWN2N1pH?=
 =?utf-8?B?YXQyUXBVZzlTbHVCaS84V1dZdXNPMnRXVzllekRrZFVzMnRhSDZUbGE4MVBH?=
 =?utf-8?B?QlgySGZzelIzTGc1akc5L0M1TXJMTU1NL0E3SHVFaGlLNGJ3cnVxeExPTVNR?=
 =?utf-8?B?ZGRCY2Q3R1BGelg2R1lSckNjaTAzSWVoOWR5RXplRU5NS0NwVVVDaDJuS0Uv?=
 =?utf-8?B?d3hud0kwNzdNQ1BzYjFBNHo4VFpjNDRCeGR4dStKYXRjTnROTjdrSmRIKzRs?=
 =?utf-8?B?d3I2cTNSRlRSNVBheHNDRnRlMGFlRWlKekh0aVVjc1gwUFBpMmx4bmRXZWJk?=
 =?utf-8?B?eXRRcS9ITkQzWUExNXYvMnRJdXVCd29xd0pRQ2UvUCtHY3ArcVRPSE1PNmZy?=
 =?utf-8?B?U0lUOXk2TGl5VHBqM1liY2VUVXcrWVh5MVdXTm52Zk1Kd3YrNVVnb3lqSjVY?=
 =?utf-8?B?aXVvRy8rcFN6b09oS1k5Sis3aXlhRjB5UmljODdON2h1L01IYXdtOHNVNXNy?=
 =?utf-8?B?WDBtd2V5ZFZCUCtCc21lVlZBNHp4UUtiQ2orcUU1TzVMenBBaWF2S1dvOCtV?=
 =?utf-8?B?dXVvS0E5M3dia3dqVkFrVGZqWUJ5azE4clh1Y2xqUGVXY1VyekltMDB0UGdp?=
 =?utf-8?B?U01rZ2kremNsd2llZVY1S2huS1NRa2Rqb3FtZS9xL04xNHhaSzFFM3pIRjNp?=
 =?utf-8?B?KzlVS01KQmR2L0JET3o1TXdMdEtDcGFhQUhXNGkrSHdYbVEwaWpBdnorNGt0?=
 =?utf-8?B?d1RjdjJRVWhvZjBFL3A5TDZibDc4YWpyUUwyVGpoN2NYaU4rc2FRMFV2a2I1?=
 =?utf-8?B?NGtxcjlqbnd1bTRCcVd4eEVIRzBzTTFwd0lzUkVsUnNjbWVyNk1zbzBPMWxF?=
 =?utf-8?B?dEpQcy9rY01rRjJWZnNnOTFXY2lpSzIzSW8wQVBVMDd2cERlOGlaOHBmMnVm?=
 =?utf-8?B?ZzhFOEJmTlVLZSt5SmZ1Nmw3cmVidVJnN3ZTalJ1Y1RCM2ZvSzFGa0tFZ3hV?=
 =?utf-8?Q?9FhRiJdLtoiv0rBOes9Jb4AVV/OfQf6W?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB9072.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEV2ZHdDK1VNNEhNVnBCeGJaMmppL1Y2eU9nTnovYUdIdllXTllFdVR3ckhZ?=
 =?utf-8?B?QzJ2TFovS3E1d2haZXlWb3VPWkQxNTAvaTYwemd4a3BsSVlGb3kwMjBxVkVW?=
 =?utf-8?B?RDJiTW9rUFp6bkNML0pSa0VVZjJISTZ1dldpbms5SzMxemwvbm9IUWswS2hN?=
 =?utf-8?B?MjdHSVo2VFdFVkRRMlZDemhCUERVTGl1T1RnSmd3b3NoNWhkSlVRQXp3U0Ns?=
 =?utf-8?B?RHVRZDBWMVArcG1KMGpuWTJXb1lUVU9UcHFVUFN3RkFCRW1PT0c2NVFmaHQr?=
 =?utf-8?B?V2lWU1ByZUlIckFvd3ozWDRMd1pCd1BVUGhmeHBibEJlb3phMnk5R21VN1Ev?=
 =?utf-8?B?K0p3Qk1zY0VWTzBrSXV0d2xTckVxdWwrRmZoS3M4TjNKNVorUDQ5Y0wweGJm?=
 =?utf-8?B?bzRiOHFkVzVUR3lKYjRBTFVFYVJSQk5Lc2F4eWlHVHVkZCtIZUxPWXhJZ0Yr?=
 =?utf-8?B?REQyTSsxcUVDb1ZaeVdGN1gwcTdrYVYrUkxmbUNZdHhYcVVIUUlvd3g3WUpE?=
 =?utf-8?B?VlRlTzkvTFp5bllpR2sxR1l0YWdMWFI3Qk1zcVY1MTVFY0ZLMjBqZURCU2ds?=
 =?utf-8?B?dk5YRHFUWUZsNGIyYnZvMjNvKzc3MldGM050ZXUwTjlNZUZFSEhmeW4vOVda?=
 =?utf-8?B?OUlISUtUSHpyNUoxVkdmUlJtVnZxYU05RkZrVDV3ZCtHR2FPNnNQVkd5OGFI?=
 =?utf-8?B?cG1BMWdjWmJpTG9DenRrVmJ4QnJEcUZGMXF5V0RYRmwzdEtPNW8reHF5a0Iz?=
 =?utf-8?B?WFlLamxHRGV5L056U0Mvc0VyRmplUThFZU9GclI4SEdjc09wWUtDTlJNQWxh?=
 =?utf-8?B?aENDbHQ5VHJZeGlBdHZkQVdzZW1uZEV2cW1ZWjVscHJXaUFQV3JjaXdlK2ph?=
 =?utf-8?B?bjN0QnE3YTh0ZzdrMUpqVCs3NmJvWlgzQ2xCUjFkdHpsd1dKanMwTFE2NVB6?=
 =?utf-8?B?aWJ5cWJjQmZFWXY0Rks5MUpHeXMwY1RaQWcyNEtBRHY0SEdrdnViZUp2ZDhM?=
 =?utf-8?B?Mzd5aWt5SHJyWU9scjd5MmladnVjOThYRlZkNXUzU0U0WVplM3pnMXdIY2Q2?=
 =?utf-8?B?NUdWRWFHVnNNQ0h0WkVQa2tjUUVTbzloTkxGQUxKUmxTTVdrMG5TZ2crL0Nz?=
 =?utf-8?B?T2RTWGFKcy9xMTFEYnlUNHRUM3o3SE9jWkJRZHhpRWM3ZVJrMDRMZElhdXpm?=
 =?utf-8?B?ZVF2a3I5dkEvTExXMm1OSGVlTThDejlScy85NnRleVkwaFpDWHlaS2F4Wi8y?=
 =?utf-8?B?VW1ZSG9CYW5DZ3VhOFBDNE9GSTg0bFV1eTJ1c1Q2N2ZlNWJnbHZwZ25GQ0M3?=
 =?utf-8?B?bWVCbXFZQi83QW9kcERIbEVOcVlJTWxJSUdxTWhxSHc4VUJ6a3dwSDdLUU1N?=
 =?utf-8?B?OHNZZHJUWWgvN0NWL2ZNRllVV0dEQ1pGSUhCd2VYVTQyN2gzQ0dIY0kra1JP?=
 =?utf-8?B?WUlEbEpRUXQ2eFdieHZiVlYvOXRjcERnbWl4ZjRabXM0N0JEZGh2MmM3SU1X?=
 =?utf-8?B?S3hTM2ZSOHZoRmJyRjUwTWEzWDhoUkgzY3BlUVVWS0k0bTdYTWg4bWVhaith?=
 =?utf-8?B?VTNnZi90KzJJVitiQnVTMnpkaGNyd0dYVWFXNzRtVkdxTmduemxpTmZ2ejVj?=
 =?utf-8?B?b0ptTWtjU1IwNlBHdEV6dnZWaG5vVEdlZDNZcWRKOSt0R1dXZHAxbVpVL0hi?=
 =?utf-8?B?bGRhZ1BzcFB1QkRNNjdVUmJ0N1YyWk9YbmtlWngzbTNXWTNIeVpQNFlZbTlo?=
 =?utf-8?B?c0U1MFB3bi9nZEI4VFZvRHo5ZG1wS3ZzOG43V1gwNTRQMnBoRDFVL1AraElD?=
 =?utf-8?B?Z3Bjb2M0cVROSkxnSWdPa1llcnVYMEZzT3hyTTdpOFJqR1hjR0Q4TDFvQlpB?=
 =?utf-8?B?WmMzMjVhTVFuc244Z1BVQVRtY3pzSnc4YnVyOVY4d09qRUg2aXpPMnlRWEtn?=
 =?utf-8?B?MmhtMjY3a1dYczB3QXI3cm1sNmxZbUpWdmIySkVwL1FsaGJLUFhnUzh4OXF4?=
 =?utf-8?B?bms1ZXpUbVZyZHlCV1NNdG4zaGtTZ1RWOHhnU0swMVgwb0J5dGVsbnpGTmNw?=
 =?utf-8?B?VlJjbTA4N3JXUXBEc2hJNFRSanE5TEIzUDI0cWNCcERBYlRRbC9zWXFLd1J2?=
 =?utf-8?Q?kaEZnTbYgJCoh+i7TOzlGJNeS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac0476c7-2e9e-46a7-7856-08de3140f719
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 01:20:22.8616 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /MXbb6UvV9yDAG3YBE16SGHIalUZJhUM7ge0J7Hg1mZwwPalnrMQdcATK2l1J/fJnJZbFq3xzulnbow90n3K/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7940
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

Hi,

On 29/11/25 05:36, Matthew Brost wrote:
> On Fri, Nov 28, 2025 at 03:41:41PM +1100, Jordan Niethe wrote:
>> A future change will remove device private pages from the physical
>> address space. This will mean that device private pages no longer have
>> normal PFN and must be handled separately.
>>
>> Prepare for this by adding a HMM_PFN_DEVICE_PRIVATE flag to indicate
>> that a hmm_pfn contains a PFN for a device private page.
>>
>> Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
>> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>> ---
>>   include/linux/hmm.h | 2 ++
>>   mm/hmm.c            | 2 +-
>>   2 files changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/linux/hmm.h b/include/linux/hmm.h
>> index db75ffc949a7..df571fa75a44 100644
>> --- a/include/linux/hmm.h
>> +++ b/include/linux/hmm.h
>> @@ -23,6 +23,7 @@ struct mmu_interval_notifier;
>>    * HMM_PFN_WRITE - if the page memory can be written to (requires HMM_PFN_VALID)
>>    * HMM_PFN_ERROR - accessing the pfn is impossible and the device should
>>    *                 fail. ie poisoned memory, special pages, no vma, etc
>> + * HMM_PFN_DEVICE_PRIVATE - the pfn field contains a DEVICE_PRIVATE pfn.
>>    * HMM_PFN_P2PDMA - P2P page
>>    * HMM_PFN_P2PDMA_BUS - Bus mapped P2P transfer
>>    * HMM_PFN_DMA_MAPPED - Flag preserved on input-to-output transformation
>> @@ -40,6 +41,7 @@ enum hmm_pfn_flags {
>>   	HMM_PFN_VALID = 1UL << (BITS_PER_LONG - 1),
>>   	HMM_PFN_WRITE = 1UL << (BITS_PER_LONG - 2),
>>   	HMM_PFN_ERROR = 1UL << (BITS_PER_LONG - 3),
>> +	HMM_PFN_DEVICE_PRIVATE = 1UL << (BITS_PER_LONG - 7),
>>   	/*
>>   	 * Sticky flags, carried from input to output,
>>   	 * don't forget to update HMM_PFN_INOUT_FLAGS
>> diff --git a/mm/hmm.c b/mm/hmm.c
>> index 87562914670a..1cff68ade1d4 100644
>> --- a/mm/hmm.c
>> +++ b/mm/hmm.c
>> @@ -262,7 +262,7 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
>>   		if (is_device_private_entry(entry) &&
>>   		    page_pgmap(pfn_swap_entry_to_page(entry))->owner ==
>>   		    range->dev_private_owner) {
>> -			cpu_flags = HMM_PFN_VALID;
>> +			cpu_flags = HMM_PFN_VALID | HMM_PFN_DEVICE_PRIVATE;
> 
> I think you’ll need to set this flag in hmm_vma_handle_absent_pmd as
> well. That function handles 2M device pages. Support for 2M device
> pages, I believe, will be included in the 6.19 PR, but
> hmm_vma_handle_absent_pmd is already upstream.

Thanks Matt, I agree. There will be a few more updates to this
series for 2MB device pages - I'll send the next revision on top of that
support.

Jordan.

> 
> Matt
> 
>>   			if (is_writable_device_private_entry(entry))
>>   				cpu_flags |= HMM_PFN_WRITE;
>>   			new_pfn_flags = swp_offset_pfn(entry) | cpu_flags;
>> -- 
>> 2.34.1
>>

