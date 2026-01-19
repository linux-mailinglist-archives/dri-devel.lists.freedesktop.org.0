Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7A2D3A4C2
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 11:21:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BBDC10E3F1;
	Mon, 19 Jan 2026 10:21:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="seIfoovS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012000.outbound.protection.outlook.com [40.107.209.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7036410E3EE;
 Mon, 19 Jan 2026 10:21:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dpwsu0Qx4j1EOfEy28uh69i4kJ7cKck+VkOmfQQgYbwR7bEaVCVAFQ+lYwHzpkIv2kUsd0wV83T+6i4iuoKoRd41MIASJE9KsJa4Vrymbz8KZmIiFxsrAwwhNoEyh0rPtyWU9NTNl1b5LyuExGTgKKgO9mUWhdPHlxxyUOkoJHs93HUtk4sTpdtaYItuQV0UpMAz8taYkiP1OSBIAKQ+Hzlfc8IZCZYprUCbaX+2ixE1uVQp04xmhEEovjAqj+HDraQ4OdQ/WDO4hZbmd/N59vt+vpNH1PH+Sv8ZnOQK5i73pvBJwj3VUmBglLx9vgRBUdhugpMI862yULdmDNaaOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H3zT9tFljbzDlNx+eEIGfkaPFN2/rMWsyvtZkYoz7pA=;
 b=CNj+fqvqm8TiAKVrtUSochdgAM3WQ8xvdXIm4u9ufeMsJ9s6AvRGzh7B9MQMvQvx/iXTh/NXfvd5y4Thit/f/OMIFF3OQQWevloCIOPn6u0emhT2YFZova6gxlCExMTmKaM4gOERkB/Q3wY0Y7LG5M/3nWKRtrQ3P7NiiHThtZc9pb63bm/Cx6BOj19+vKqYZD97EPxTrffItEnoznFHl+WrPYYs3swLr73rexMqj0KoLesXN25a8SptUfMUE1S3vNTXS6zWBSsolml81jfByIP1o2qeLyvsmZwW3L5yvLl6Q0C2Ko/XRXNf7dvviAMZkZc/0+h42DoXHc+ZMirYvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H3zT9tFljbzDlNx+eEIGfkaPFN2/rMWsyvtZkYoz7pA=;
 b=seIfoovSOJ2J1RHS+fE6om6eTxCF3pNuCJ9icv9m2lrNqV3OSx3JF/mk78NVYN80RKtETMJPTend8ZnolNAohHItJ+hFj3r6LtHwiumDz9iGOc1LCqwP3ONOZBGrV2UYHPSLXOR+2N4tu0wfQ2yrmhsfOuSMagLdOWzVFh0ruy8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB8186.namprd12.prod.outlook.com (2603:10b6:610:129::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 10:21:14 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 10:21:14 +0000
Message-ID: <78035892-758d-4104-9dd5-aed9a045d481@amd.com>
Date: Mon, 19 Jan 2026 11:20:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] dma-buf: document revoke mechanism to invalidate
 shared buffers
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Leon Romanovsky <leon@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Alex Williamson <alex@shazbot.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux.dev, intel-xe@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, iommu@lists.linux.dev, kvm@vger.kernel.org
References: <20260118-dmabuf-revoke-v2-0-a03bb27c0875@nvidia.com>
 <f115c91bbc9c6087d8b32917b9e24e3363a91f33.camel@linux.intel.com>
 <20260119075229.GE13201@unreal>
 <9112a605d2ee382e83b84b50c052dd9e4a79a364.camel@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <9112a605d2ee382e83b84b50c052dd9e4a79a364.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0395.namprd03.prod.outlook.com
 (2603:10b6:408:111::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB8186:EE_
X-MS-Office365-Filtering-Correlation-Id: 430daee4-03ac-40e9-4099-08de574479a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UEtGNzVVeUpja243UVQ4L2l0NlRaWTZ2Q1JJYnR3QzRxMEF5WmI5V0FKbDVO?=
 =?utf-8?B?WGgwQ1ZEdkd4R1FMalprUlFJUFd1VGxoa2dqOUNtcVRoRzRDdWRoWWpkbjlq?=
 =?utf-8?B?SDRERUpxSlZlQjV6S1k0NjdFTjYyRERvTjZkc3daRVNSRk1UU2Q4RXhzWmFR?=
 =?utf-8?B?V1hmYldnc0JRYlVEMU02WE5aNEVBb3hqR0M3YkFIOWpDUkdwYld4QVlDSFpr?=
 =?utf-8?B?MVcxTDNvbDM5WHplNXZOUjZHMlJPMysxdmhJUFNFR05yWmtrZ2lDNVJ2ZWRQ?=
 =?utf-8?B?cHBzVlFCbnIxRVk2QnQ5WlJGcEJpYmt3MXJ6ODJvdjJBUnlyQWNDQXptL0dZ?=
 =?utf-8?B?M0psZ2dZUFVmc0EzMHlRcHk5TFpERzlrSnFqTUxsajBQUlA5bktLUGRQQ2pq?=
 =?utf-8?B?RFFqTGMrRkRDbUFLazhYM0ZTQnhPWTN6VEtzeWhJWlE2ekxtaFZFeEorN3A1?=
 =?utf-8?B?cWc4bHJBTHlNUW1uam1YLzllSTM3cVFwdjVpYTZyTmRndHFWUzQzRUJPaTlW?=
 =?utf-8?B?TlJzUDEyTnEyNjVOLzNUbStGZVlVaXR3MVR3N2x0Tk1abWpERzRuaWh5MmRI?=
 =?utf-8?B?aHR0cXNEN2NWZVIvNU1iTWEycTVZUWxlN1dBWmdiZFcybDlLdGx1NHU3UUlZ?=
 =?utf-8?B?RE1xWDRsMXVkakFONU1DS0w4SmNoUENxZERCeFhhbXZtWHZXVFVPVGhKSFVZ?=
 =?utf-8?B?WjBwZStSdHZZQ3RHbThKeDBWS3pwdURUYWJIb21oOG5HV1J3TUhTVzJEWFk5?=
 =?utf-8?B?Y2N2OE81Y3lza0ZXakF3a0ZxdW1BWDNML0hVVDdUSitHdjdtTVEvWXc3Wmkr?=
 =?utf-8?B?NEgwaTd6MXpCcWd4MUR6QVBsZ0NvRFEvc3VjY29wdWRDUFlJcnJTNEttY3NP?=
 =?utf-8?B?RjJvMHhMa2ZVT3NoRk9Zb2UvbXBrVkloZ1ZQUnZNUCt3YWp0ck1PekRxSnFF?=
 =?utf-8?B?NWZuZXIybzQvbjVlZjVYckFjUVlHc2lIUklVdDdxNFJBYW9UUTlDaGY5TklJ?=
 =?utf-8?B?UzJEdG4xVXdtQ2MvVG1RT215dHBUMW5tL1J6N3JyMG1UN2NGbzBPZ3lUVUU3?=
 =?utf-8?B?bmorR2pQNWl1YTZxY0FiSjBIYzJHbGJaU0ZycUQwQUFRanNwUmhFQ0YzWS9Z?=
 =?utf-8?B?QTB1dlhjaWhaOG1SNTJUNjhJWnlwRTVTSXhHZ1FDNnY1UExUWWJJYUExTWIw?=
 =?utf-8?B?RkZVUTFxRkp2ZEp6T2paQmJnSmt4T2ZMV1Y3UGY4emFPYXp0R2NwV1BOeWRa?=
 =?utf-8?B?SEx6Qmw0a1FNSGRvbUhXZm1pQjBQQ3BDZUhUTVI1OUR3N1U3UWJuQ0NvcWF1?=
 =?utf-8?B?NTVpckowNmZheEJ6ZUdWU1FKd05hc3Z2bmdsOGkrb1krODc5VHFrTzcxZHNo?=
 =?utf-8?B?UUU1bHFaMjBOTEk3N0dNNkVKT3dsY3lXZEQyZlBvc0tQemozVFU0R0h6WWZJ?=
 =?utf-8?B?bDhrMWVadnM4eFo4Z0FLeTZ0aXhuS0ZiL0ZiR0ViNEFVVjdISFdGZkljYk5I?=
 =?utf-8?B?WlQvUWUzZlF1RDBLT1dDcWhyeDE5SS8ycWZPSXZZcVUxcmN6N3BUbHVEdk9H?=
 =?utf-8?B?VjZULzlWUm9nVkpwV0hteTJ2bEVQRDBqSDlRY0pTNitEVjIyOVBaNTltUUV0?=
 =?utf-8?B?RzFYSkRtVTlrdEVINVQ4RlBBbytrMFRMRzZsdzIwMW1ab2oydUhKK0hTWDFM?=
 =?utf-8?B?YU04cmdDT1U3STR3QlB3SDhmV1dXNXZQT2ZSRFErd2JoNVU1OXhMbDJmWkw4?=
 =?utf-8?B?VzZaS1dCbDZLWk1WaCtGbXNSOHVFUWdhaXNiUUkxTXM4MzFuRS9ZQ2xFNzVV?=
 =?utf-8?B?SWlORjdNWms0SW1FSnVjMTlGcnJHYlBzR3JSNEtFRUdQTzNjTkNqVERDaXMz?=
 =?utf-8?B?RUxEaTlXYlRkSHg5cHZJWjFLQVhjcmdlM2czdXNrb1ZweVlYVm5LeVh2WW5D?=
 =?utf-8?B?WENJeWcrL0Z4V0NhUHdXdGp3d0VPdEo1cWVNazZJM3BTcnlNRkpKR1EvditM?=
 =?utf-8?B?K3p2V3NIbUkrWlF2WU9qeE9CRk1WNXpoMUdhMFRkVEJQN3ByaWdKc2J4NExP?=
 =?utf-8?Q?xzweni?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cW1sZ0dsOVNDMG1pS3ZLbHJPUDNjMCtOWHVET1RHcTB3K3c2V3Z4aFRIZ2p2?=
 =?utf-8?B?OTNkQlU4TG1zbmF2eUJraDh5NEw2ZkczT0hKbUhGL0JWNVRtTmJaTW0xTXd6?=
 =?utf-8?B?eU5Hbkc3c1BNTkd0VkNsM2xGOGRGSlg3WWw1eW4wVFcvM3JsYnJhZko1ZlJt?=
 =?utf-8?B?Ynp0dFI0OGVBdWF6MElWeFJwOHgydFFHODUwLzhxKzV0eUk4bC9uOHBtbzJW?=
 =?utf-8?B?by9Ha1dyYmRlYnk2TjExeEUxeFo4OTBpL3BYZjFqRE5GaEF5MzJJRjQ1WkZS?=
 =?utf-8?B?cnJDTWRnOXBHc3Fvd1JJZlB5MXdUY2dKVnB6MGc0QitHb1p6YUlZcDMrZUg1?=
 =?utf-8?B?dGQxRURqUC80Z1ZuOFFJenZNdE9RcWV0SEZ6eGx0ME1Nc1E1TW9PR2xQWWlp?=
 =?utf-8?B?MHhPb3MwUUVVZWNrZmZueHo3RGw4RDhZSEt0UjFVMVd0K1VZVzhlVExZMjE2?=
 =?utf-8?B?UkJuS29hWFZVT0pmR0RDajRnc0ZpUXZSMnFkWmpJYlBPZ3RNbkY2cnltQ2ZK?=
 =?utf-8?B?YzNpUGpJbFBEbHB5Y3g5cC9RcTI4RURXWlRvZEpOR1FmSDVpZy9YV1hjZSsx?=
 =?utf-8?B?ckZJdVVaUW52MEt6elU1dTkrMUU4SUJRQmk2UXRRbWxaK0lIa2oxeDl1eTBl?=
 =?utf-8?B?MEpMUnRKVEpDTllwYTZSQ3VGdVIxN0dPYXA4TXFtc0VDakRac1hacllRNWZH?=
 =?utf-8?B?ZkFWQWFSdUt2MHcyNVh1Y29rY2RYMTJpOStONVlnL2pDaHNDR1BFMFdaakhy?=
 =?utf-8?B?emV4VTVqVEUwd0Zoei81M1F1RlRLdmN2dUJFUkhFM3JQK3A5K0dzbmljWm9K?=
 =?utf-8?B?STZxVlBkOGsyU3JzTlFGaDNpKzgwdDZxWnpaZUZoMXNELzlXeThVbHIyRkJH?=
 =?utf-8?B?S1AvRi8xTnVNeDQrcUoxZ3RBTVFHYTZ1b1JBMFlLUWlBSDl0RUxVRGp2QUNt?=
 =?utf-8?B?NzRjZ0Z0WmpxVm5MUDc5TzQvMHE2blB5OFJVUWg5RTVJYktxWlp2UThaUjF0?=
 =?utf-8?B?MXY2d0cvL1AwRGllWEhkanIvdDdCb2Q4Njh0WnVNaDFCQVhPRTFLK3F5WmJ1?=
 =?utf-8?B?VThnMG1lL21naVpQYmUzZHRZOHlBWnFWSlZvR2p1RTBaYWxrYmF2dXdzY3FX?=
 =?utf-8?B?TkhrOEo2cFJLQVk0Q2hjQW9RRm1EUE4yU2hsNEszNkNZckY3dTZ5b1FFR05L?=
 =?utf-8?B?UmxrSnVCUnNKczVIc1ZXOVpSOS9ab3ZqMjUyT01Yam1ERytHa2VwVXVkd1Z6?=
 =?utf-8?B?QWZsVnlXWkRZVjhZS0ZsRHA4anpPSmJ5UElBYU9mcU40N3krc0lYNE9hMERE?=
 =?utf-8?B?d2YyNW1BQ1dxa2Jqd1JVYjNCL1BDVzBaT3F0Wm8ramNWV0hqSElzUnhyZzlq?=
 =?utf-8?B?VXhvUitFY0laT24zREVtQkJiWFl0czRsVjU0Qnk4di9PM2VIUnZuU3ZHTXdT?=
 =?utf-8?B?cmg1TXdETlh2ZzIzdFdHL0ZwcjZQWEFYdEpSd01XWGRqeDVmV1NtMTdFS1NQ?=
 =?utf-8?B?Z0dQdDF3dGcvR2k4dlNLOExwZHZpa3dwU3J5YTVha0lVQnYzcG5YcU1MT0pO?=
 =?utf-8?B?MUltVEFOa0YzNzJEU21sVHpLRldxZG8zQmVINHc3R3NGZW1oWnNEUy83RlJz?=
 =?utf-8?B?R2lUeTRkcDRxNWY4WXRTT0VGRWh2Vk05U1NveG45MnNheTBoZ05WcnhDSUxG?=
 =?utf-8?B?TEVzZ0thYjNIV0NqWDVGOElLaUhQTWpHT1FjZGcvbCtYNkFaUDhHQmE4NlBm?=
 =?utf-8?B?c3RoOExRbUNESDBtYnJxWVQ3RnQyV2xSVVdFY3lacFRwdTNqWkkyUUVNTm1j?=
 =?utf-8?B?elBCaFFJTSs3MTVLTlJWMUxSbnZnSThOZjBqY1V4ejJyUWRNUk91UDcrZHpX?=
 =?utf-8?B?dk0yQXYvc09rNURFN2xrL21KNWhNTTZvZldxSWxqZ0tpNWJjS2xEK3hINHBi?=
 =?utf-8?B?Qkc0S2VwQkM4VXJkeUlKTkhHdmdiWVgwNGkxdlFLWmhZdmNxeWF5N00yVWxF?=
 =?utf-8?B?cHNKWDNkSEVuY3lWZk9leG1KRWVTTjZwV3NqMVdoVVBLNDhZYlFyVys1SWRk?=
 =?utf-8?B?cVdDYWV4aHZrZ0t2aDBrSG5SQjRVYzFVMjdjK1VmcHBUcW83b3JEM2FuckdQ?=
 =?utf-8?B?dnFjM2NJM0FsWGgraTFSaFk3RVQvTmRQNUFDNTFVZjkxd1NVZ1M3UmZFdE5m?=
 =?utf-8?B?RXlqL1VEWnBtWTV1enZlaXl1SkhBSmtrTGcydmVBbW1ubHBTVng0MEx4c0Vz?=
 =?utf-8?B?ZXFJWGFUSHZBamJ3ZDFyR3doUXVrcUp2cmVPazN6NFhLWGtESkJkbzBlWFBD?=
 =?utf-8?Q?VFsJlj4DRUUSo6g5Yj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 430daee4-03ac-40e9-4099-08de574479a8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 10:21:14.4733 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pDoP0HsgaPcHOSMw8DzayAZ2DyjdTnoN1S5F9rqZo8GkTXUA9833+NOKeyS74hkk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8186
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

On 1/19/26 10:27, Thomas Hellström wrote:
> On Mon, 2026-01-19 at 09:52 +0200, Leon Romanovsky wrote:
>> On Sun, Jan 18, 2026 at 03:16:25PM +0100, Thomas Hellström wrote:
>>> Hi, Leon,
>>>
>>> On Sun, 2026-01-18 at 14:08 +0200, Leon Romanovsky wrote:
>>>> Changelog:
>>>> v2:
>>>>  * Changed series to document the revoke semantics instead of
>>>>    implementing it.
>>>> v1:
>>>> https://patch.msgid.link/20260111-dmabuf-revoke-v1-0-fb4bcc8c259b@nvidia.com
>>>>
>>>> -----------------------------------------------------------------
>>>> ----
>>>> ----
>>>> This series documents a dma-buf “revoke” mechanism: to allow a
>>>> dma-
>>>> buf
>>>> exporter to explicitly invalidate (“kill”) a shared buffer after
>>>> it
>>>> has
>>>> been distributed to importers, so that further CPU and device
>>>> access
>>>> is
>>>> prevented and importers reliably observe failure.
>>>>
>>>> The change in this series is to properly document and use
>>>> existing
>>>> core
>>>> “revoked” state on the dma-buf object and a corresponding
>>>> exporter-
>>>> triggered
>>>> revoke operation. Once a dma-buf is revoked, new access paths are
>>>> blocked so
>>>> that attempts to DMA-map, vmap, or mmap the buffer fail in a
>>>> consistent way.
>>>
>>> This sounds like it does not match how many GPU-drivers use the
>>> move_notify() callback.
>>
>> No change for them.
>>
>>>
>>> move_notify() would typically invalidate any device maps and any
>>> asynchronous part of that invalidation would be complete when the
>>> dma-
>>> buf's reservation object becomes idle WRT DMA_RESV_USAGE_BOOKKEEP
>>> fences.
>>
>> This part has not changed and remains the same for the revocation
>> flow as well.
>>
>>>
>>> However, the importer could, after obtaining the resv lock, obtain
>>> a
>>> new map using dma_buf_map_attachment(), and I'd assume the CPU maps
>>> work in the same way, I.E. move_notify() does not *permanently*
>>> revoke
>>> importer access.
>>
>> This part diverges by design and is documented to match revoke
>> semantics.  

Please don't document that. This is specific exporter behavior and doesn't belong into DMA-buf at all.

>> It defines what must occur after the exporter requests that the
>> buffer be  
>> "killed". An importer that follows revoke semantics will not attempt
>> to call  
>> dma_buf_map_attachment(), and the exporter will block any remapping
>> attempts  
>> regardless. See the priv->revoked flag in the VFIO exporter.

I have to clearly reject that.

It's the job of the exporter to reject such calls with an appropriate error and not the importer to not make them.

>> In addition, in this email thread, Christian explains that revoke
>> semantics already exists, with the combination of dma_buf_pin and
>> dma_buf_move_notify, just not documented:
>> https://lore.kernel.org/all/f7f1856a-44fa-44af-b496-eb1267a05d11@amd.com/
> 
> 
> Hmm,
> 
> Considering 
> 
> https://elixir.bootlin.com/linux/v6.19-rc5/source/drivers/infiniband/core/umem_dmabuf.c#L192

Yes, that case is well known.

> this sounds like it's not just undocumented but also in some cases
> unimplemented. The xe driver for one doesn't expect move_notify() to be
> called on pinned buffers,

And that is what we need to change. See move_notify can happen on pinned buffers currently as well.

For example in the case of PCI hot unplug. After pinning we just don't call it for memory management needs any more.

We just haven't documented that properly.

> so if that is indeed going to be part of the
> dma-buf protocol,  wouldn't support for that need to be advertised by
> the importer?

That's what this patch set here should do, yes.

Regards,
Christian.

> 
> Thanks,
> Thomas
> 
>>
>> Thanks
>>
>>>
>>> /Thomas
>>>
>>>
>>>>
>>>> Thanks
>>>>
>>>> Cc: linux-media@vger.kernel.org
>>>> Cc: dri-devel@lists.freedesktop.org
>>>> Cc: linaro-mm-sig@lists.linaro.org
>>>> Cc: linux-kernel@vger.kernel.org
>>>> Cc: amd-gfx@lists.freedesktop.org
>>>> Cc: virtualization@lists.linux.dev
>>>> Cc: intel-xe@lists.freedesktop.org
>>>> Cc: linux-rdma@vger.kernel.org
>>>> Cc: iommu@lists.linux.dev
>>>> Cc: kvm@vger.kernel.org
>>>> To: Sumit Semwal <sumit.semwal@linaro.org>
>>>> To: Christian König <christian.koenig@amd.com>
>>>> To: Alex Deucher <alexander.deucher@amd.com>
>>>> To: David Airlie <airlied@gmail.com>
>>>> To: Simona Vetter <simona@ffwll.ch>
>>>> To: Gerd Hoffmann <kraxel@redhat.com>
>>>> To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>>> To: Gurchetan Singh <gurchetansingh@chromium.org>
>>>> To: Chia-I Wu <olvaffe@gmail.com>
>>>> To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>> To: Maxime Ripard <mripard@kernel.org>
>>>> To: Thomas Zimmermann <tzimmermann@suse.de>
>>>> To: Lucas De Marchi <lucas.demarchi@intel.com>
>>>> To: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>> To: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> To: Jason Gunthorpe <jgg@ziepe.ca>
>>>> To: Leon Romanovsky <leon@kernel.org>
>>>> To: Kevin Tian <kevin.tian@intel.com>
>>>> To: Joerg Roedel <joro@8bytes.org>
>>>> To: Will Deacon <will@kernel.org>
>>>> To: Robin Murphy <robin.murphy@arm.com>
>>>> To: Alex Williamson <alex@shazbot.org>
>>>>
>>>> ---
>>>> Leon Romanovsky (4):
>>>>       dma-buf: Rename .move_notify() callback to a clearer
>>>> identifier
>>>>       dma-buf: Document revoke semantics
>>>>       iommufd: Require DMABUF revoke semantics
>>>>       vfio: Add pinned interface to perform revoke semantics
>>>>
>>>>  drivers/dma-buf/dma-buf.c                   |  6 +++---
>>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c |  4 ++--
>>>>  drivers/gpu/drm/virtio/virtgpu_prime.c      |  2 +-
>>>>  drivers/gpu/drm/xe/tests/xe_dma_buf.c       |  6 +++---
>>>>  drivers/gpu/drm/xe/xe_dma_buf.c             |  2 +-
>>>>  drivers/infiniband/core/umem_dmabuf.c       |  4 ++--
>>>>  drivers/infiniband/hw/mlx5/mr.c             |  2 +-
>>>>  drivers/iommu/iommufd/pages.c               | 11 +++++++++--
>>>>  drivers/vfio/pci/vfio_pci_dmabuf.c          | 16
>>>> ++++++++++++++++
>>>>  include/linux/dma-buf.h                     | 25
>>>> ++++++++++++++++++++++---
>>>>  10 files changed, 60 insertions(+), 18 deletions(-)
>>>> ---
>>>> base-commit: 9ace4753a5202b02191d54e9fdf7f9e3d02b85eb
>>>> change-id: 20251221-dmabuf-revoke-b90ef16e4236
>>>>
>>>> Best regards,
>>>> --  
>>>> Leon Romanovsky <leonro@nvidia.com>
>>>>
>>>
> 

