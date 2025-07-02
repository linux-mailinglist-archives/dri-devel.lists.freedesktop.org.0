Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A23AF0C42
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 09:10:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74F3710E00B;
	Wed,  2 Jul 2025 07:10:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="saMxtigv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2044.outbound.protection.outlook.com [40.107.94.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3DDF10E00B
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 07:10:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rdNRjM+DEpR0YLhgEDVQGck4NeMv0x74VA7NEAKw30GyQTKxfOR/A4GFtGAATqufDmybd8tTChkAE9AYuhOcFV6XphVBq5ZQLVs0Eihl5LAla3IVXVj4AnOxVAw/ZcUjMX9zvRsONABfollM0bn55Tn7ccyGPzqK0pz/gZqrrRByCzk53B6UROaZy1Hldj3qyBhXa+u4EBueG9Dn4RNNfiScMyqllnu5MkS6rVn1gL//StFzsQOREnikJgsMdOgr4L34h0oT1h6xVhxGa/o8DJBcIkAjUMlp0wuPIFcjCnRWLLnobNUzO+pxoV/CYeH+3yj3/eZuCrvB80nkDDb7aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vhBYsx5yyc/DaVTYTrGM9QB1nJYPs6a0suA5jqlwPI0=;
 b=Xe+bwjjV94j+Pt0SpulyH3pu5aon92t3b9nsN9U4ebw1lNSbj97XKTBvyfwnAf8JC8H603fQmypF9xwwQVXQBwlU2zEXuo3A8tQfC7rZYBUBONAFyqAEIfSPO1T7LK2bv1W7AtCX4D50od5TsY9RPEtdgPFE0IibCKqUkIuAKP6/c9KtDc2WqAFDRr9q4DFtZmMs3TDfaasR8ZuTQwtQEhIieXqXbkEFbwEd7QCB9ow2C0cl0NNyQ10/DQoO3hHjMhJA5F1o6zil9JQztefuiKiwgMmjn4GO+vF3u0MueD8ZGDcDNS1Dg1MBP17SoBLR9G2dM7oemOR2Hn2j/IQhtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vhBYsx5yyc/DaVTYTrGM9QB1nJYPs6a0suA5jqlwPI0=;
 b=saMxtigvuPx1+ghCSqHq3rjy/Xbv06LLOdaTbLZO0LyDS2VnKVVIUr4n8yb/wdwFwf+2zUUUDVa1esUfax5L6BLoKLalsml2XDpWHn2O5D2ZDVQgAsbPzetuiT03QrnTwqNLkxkXj9FDICZ0nEQl5PiVIuruRExk52t1F3eN2d4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB5814.namprd12.prod.outlook.com (2603:10b6:8:76::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.25; Wed, 2 Jul 2025 07:10:50 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 07:10:49 +0000
Message-ID: <bf90a216-de9c-41b0-804b-4881373280bf@amd.com>
Date: Wed, 2 Jul 2025 09:10:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/gem-shmem: Do not map s/g table by default
To: Thomas Zimmermann <tzimmermann@suse.de>, oushixiong@kylinos.cn,
 louis.chauvet@bootlin.com, zenghui.yu@linux.dev, hamohammed.sa@gmail.com,
 simona@ffwll.ch, melissa.srw@gmail.com, airlied@redhat.com,
 jfalempe@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 sean@poorly.run
Cc: dri-devel@lists.freedesktop.org, =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?=
 <jose.exposito89@gmail.com>
References: <20250630143537.309052-1-tzimmermann@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250630143537.309052-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB5814:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f2a73c4-fb87-456f-60a7-08ddb93792f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UC8zeXhwemFhWCsrbDFDaVRsMmRHeVJhckFmKzYwMHdtMUh1VzVQVmJjMDdT?=
 =?utf-8?B?NDJSd25jRnMrakFhTEozanhlTDY1aDUxM0luUmtNT1RpNlNxQ1FibjMwUGMr?=
 =?utf-8?B?RzV5V0Jodk1aZCs2NlhBYTI3dDM1WHdhZnIwSGpXdzdETjRudEs2ajRWUzNX?=
 =?utf-8?B?WDRJQmFaalBraDZLOERySXNYaDk0ZkFTK2dOK2p1OUlMcHdjMzZEN3B0SDdQ?=
 =?utf-8?B?c0FoNEZBbXVzUDBTRFhkUHhiQ2xzSU8vZURNUjB6Q0I4YUhLWlRFeTcyMi9x?=
 =?utf-8?B?RVJYRnlqbU1xNDl5aEh6Z0QvVmwvcnFjMks4NlFDTzZJS1ZCY1grM1NCdEx1?=
 =?utf-8?B?c1F3OUgyQTR5QmRZb1FYS2xJanV2VW1rMDFPREVxL3N1aVprQWhlYk8vRUhu?=
 =?utf-8?B?NkZXMzB3clk1cFJEa2dWZTJLREQ3aWJmMTZkcUszZzJNOHZuRzdiV1VHaVlO?=
 =?utf-8?B?SmhidFdqNUV2ekh4Rk45bzhoODNBVDI2MHR1Y0hyaCs0MDNsT1MxL0I1VjNz?=
 =?utf-8?B?OVU4Z21tVmRZV3pCNWZaSWFFK0EvWk85UkhrSVNmY2VuNkxtdXNubVo3d1Rm?=
 =?utf-8?B?bnZtTHltZ0lseGN4Z0VCWStlUkF4dG9XVnplaGxnRjFGWkFEbDl0b00wMWc4?=
 =?utf-8?B?WTR2emJsb1JIVkxjcno1MTRWMzRnb0c5eExLMVptenlSZ0x4VDloQlFkQ0F3?=
 =?utf-8?B?TlFQdUdDSGRYSnJGQnFSZjM4d0tzZk5wcVNWa0RjbDRuRU5IMjFHOEh3dzN6?=
 =?utf-8?B?d0N2MDJFbTQ0MEc3dUl3UlNaaWhEaVVza1ZhMjJWdERlUjk3YzREdmhSSXRi?=
 =?utf-8?B?QkJyRUdsUDZtMCtxdWRIWTY2aERXSnU5R0VkM2VZOE1LOVlkOFhybEpmTStu?=
 =?utf-8?B?RnkrNVJ1Zmh6MmVrY0NSRjVlL3ZwUDBUSFk3Y01OaERwcW5iRjNIZmh3OXdx?=
 =?utf-8?B?Nit1Z1RwNDlPNEl1OW4rejhpWWZ6dXNNTW1DbFVGQ1FOSjMxTStMMUoxNkhi?=
 =?utf-8?B?N2lQSTVQZk9kVkJzQjd5REtNNnBoOEQyaDdSYzI3aWpPYmpiUUlvWk9tWW9Y?=
 =?utf-8?B?eXRUSU1OdHBnRnFyVEt6MGRtVS9HN0pGZ0tKSklFcDYraUdoSGl4R0N2YW51?=
 =?utf-8?B?OXZNcjhkVElBNWJNbTFwMXB3QTBPS2NTV2JwSExub3RBNlVNblRHK0NKOGox?=
 =?utf-8?B?T1BOaHNVYksrd3IvRWswU2UxcXF4S0RIZXJiMExhNFM1dG9FUDcva0lkTXVF?=
 =?utf-8?B?WUhKQjM1em9EM2xKOGtKUllMYW9TMFRZWVZNTUdqWXUyYTF3WDlBSkJybVdi?=
 =?utf-8?B?Z3JzdVdrZThGK2FBdFBEMHRnbkVSWWsvVUdKYkY5a1V5c3N6ZXdkRkM2ZHlo?=
 =?utf-8?B?L1JxbXRDQy9leUIxU1lXNHdwQ2xkaTVUVC9vV3ZwOHZ6UFcvb3k4ZkFvYVRz?=
 =?utf-8?B?Vm1SQUY2alk2Smd0d0ZFR1U2S0JoN0FVWXhBR3MyaEtObEYvd3JmM0ZvTGtZ?=
 =?utf-8?B?SERWVEt5cUVlTnFUc1YzZjd6SEVwYTVQSitZZVFTSXovZWJqd25laHVGQnVO?=
 =?utf-8?B?alI0S3pCVHVtYUZaMzBaS1d6dmtrNUwyK05GN1Q5aExYZEEreG1uZ25SeUpH?=
 =?utf-8?B?K3dpRDJDMUVPTjY0MndhTy9qaGZtRFJKNmxqRmVuTTdnZ2RvajJKSXBHTVVW?=
 =?utf-8?B?aTdSVTlHMHpnNWhWdS9qZjNEdHU3alFrTXBoZW5Wb0RyNUpYVERqdVJJMVoz?=
 =?utf-8?B?MGhyVVRMREdJdkJKTzNodHBrcW4waFpyaUlTYjZ6WFBJN21nUG1GQzFQREVV?=
 =?utf-8?B?WGRGenE1OTJPYmJEdjdtWXk5cWxETTRocEpCbnQ4QVR6ZXNyeDZNL1NiNnlQ?=
 =?utf-8?B?YXUrUEhRZE5ocnZyeDFRVmxNNHJZTVVsNGVQYS81enczczBTNjZXVlhVQ0hI?=
 =?utf-8?B?dmtOcVYvbVV4WTFkdDRLRkJhaG5OU2dPeTF2eE9pRW9GZm9ld3QwbGhqVWtl?=
 =?utf-8?Q?jDWvFpwwUO8xCJUJpQF5MFOvBZ2ygs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1lMYWFhdUNSeUJsTW5PSVBuRlpvL0h4VW5WcWw5Y0F1Y0F2WnRMZ01MazRm?=
 =?utf-8?B?S3kvK2FzWDFyZXN4WkVKOUpBeHdYMjNkT25UYS82RTBydm5lNkhobWZTaWVj?=
 =?utf-8?B?Q0ZuUFowbzRtOFZnODNpdHRqaURablU5YnpmdnI5U1VEa0RNcHB0dUdFUnla?=
 =?utf-8?B?eWlaM1RrbDAyWUxHcU1NTjBweWVBTXFCem5yVC9vampaZ0wrZTdMYjllTUFF?=
 =?utf-8?B?RFFhbEZMWnFLZ2NHQzg4K0JHYm5pU04yak93NGRjNzd5V3ZVRUNvL3I5UVNG?=
 =?utf-8?B?T010ME1kY0xYYzVEcTVUaDQ4ck15MnpwU05GWld4S3ZNTWhyMGJNY0FSdW1p?=
 =?utf-8?B?YmRFL3BhaEUwK0JOSTNkQUkvNDMrbGxNdmhCRWI0Z3NwRDVHSXUwYWJXVmdJ?=
 =?utf-8?B?aDJJZE9GQnBQck9iUTJwTnpzUGhjU2JtTFlrdE1telJqTkttM1IyanVyc0Zq?=
 =?utf-8?B?UkhsZ1gxeFZQaUVoMTZkRmU2Vlp2MFJBaTAvRkYza3RPKzZpK3RKQ21NMWFO?=
 =?utf-8?B?bnVJdm5Tamg5Y0c5UTRocUxPYW9QcWVlelJhb2dwSW9zb1hmS0lYbU5ITThw?=
 =?utf-8?B?YW9YM3dpL1h0cmhPd2cwaVgxOGhpRnZ0dWdCZ2xSZGZQMURFVUFEdnljTlpz?=
 =?utf-8?B?eDJmb0EvSy9mamk3TnB3Z1ZsRm5US1M1RHNkWitZMjNsMVBheWpzekk0cjIv?=
 =?utf-8?B?Vmw1aHV4VU5Id05YTVdiVEVHZUFlR2xBNWViTzlLM0VIRGpFeHlNNmhUWnMx?=
 =?utf-8?B?QytQR0tnMUZxVkFhYmZoblR6eWR5czNwTWk4amhIQk5pU2FpUXFWdzBXcThZ?=
 =?utf-8?B?RkFJbEUrVTl2MEYyN1JIN05GUldXS3NrZlVEZGNMU2tGOTJ0b1dBalFySkxX?=
 =?utf-8?B?RWFDTWtJaVNBU0U5UzNXRE81aUI3N0hoL05QdTluK3lGTlJ2WDFJU3k1ZjlM?=
 =?utf-8?B?ZWJSdHZyOU5GM0d0NStRK0lBZk5NcytPNGFMQ0pNQ05DN29EV2tPSCt6Zlpn?=
 =?utf-8?B?WjUrNU9tbHl6NEJ5RkMvMmR1bzQ0M0Uxa3M1cGRJbnJTU1JKVEpUWlFWbTZt?=
 =?utf-8?B?b0JIVWdTVVBWYkcyRURKWEJPWjdUSkZZbEt3bUpza3VEc0F3RVdTRUdta0VV?=
 =?utf-8?B?QTJJNnNyUy9LRXk5Qm53OGpodDdFYVFLNlJHVDZGbEdjSlBFTUh3TG9lWFJH?=
 =?utf-8?B?UDFqVGdXcC9jTzJDYVNQOU8vN1I4RW9DRUhHeGlYVDJXK3dvSnBRdFhpNjNh?=
 =?utf-8?B?UG95RTJPMmw5TGNObFJkT2JoRGhlWmNlbHQ1TWV2QUVPUUQ5Z3FaR3BNYVB3?=
 =?utf-8?B?UENSM2tSWnZIZ3pnd1Z4MENQQUxrcHBxTWZjQTZGbHZKaWxqb0NvU3BBWVNm?=
 =?utf-8?B?cENlekxReU5JSzBrYm1hOGdaZ25nRUQ4K0tXQ3NDRHBBakVrT0xsOHlrVC9H?=
 =?utf-8?B?OXdNZmVyeHBpVkJiYys3djFWOHZkMXl3Slp2bmdhaHRKUGtYbUs0QjRLYzdm?=
 =?utf-8?B?Yy9XdzdzK01NM0xFV0NYZGgvK0NnY2pmOUV3Z0V0V0dXUCs3eE9paEhoKzBG?=
 =?utf-8?B?YlVyaElUcTVnMWxKQVlQK0V0ZmdycGlCSlRlTTFUTHRTWVRwZVI3YzZ2WXZE?=
 =?utf-8?B?dXV5eVVKdXRXUncydHE3WGRjenZhT2Z0dzBZaTROT2w2Wk45V0IzUFVEK2JG?=
 =?utf-8?B?b1JDUjM3Sk5wVUU1UVVQdGRnS3BsNzVhSy9Jd3laZjRzc2YweUJDemwzSUhu?=
 =?utf-8?B?NkROYUJFNFBob1VGZjBLOGFNT1hWZEg2TUd1Zi96QXQ3SGttNXQ2aEZNSUQ5?=
 =?utf-8?B?aUhXMWNnTWROYUp4TGZGSnRyVXJJaXFFSzMwK2kwVkt2dUtiaFlhN2t1NnFU?=
 =?utf-8?B?YWsvbE5kaTVjd1BJT2g5SVc4c0twQ3RTQ0RObG5uMjQvOWdjUjNZeThIVVNw?=
 =?utf-8?B?OXFQWGZldHN3blAwUldPd0dvWkNoNEtCVUZZWFFraVNic1dwZUJKcis0UENM?=
 =?utf-8?B?U0xHZlE5NThVOWRkNU1FVTVYOXlFeEdlZkJQMUNUb09XQTFyVFlCaXVnR2Rj?=
 =?utf-8?B?SGFpZnNINXc1NDVNcG02Ulovd25zOHRuZUFHMTAvVUZPRFVoSjhsRERoWHJN?=
 =?utf-8?Q?GWxk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f2a73c4-fb87-456f-60a7-08ddb93792f9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 07:10:49.8814 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lbm1/3oKNRJMS9B5HlnmOnID4TOtInMfS2cbmW6lce3c2tlTOSoSRMBS4L2vYA/u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5814
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

On 30.06.25 16:34, Thomas Zimmermann wrote:
> The vast majority of drivers that use GEM-SHMEM helpers do not use
> an s/g table for imported buffers; specifically all drivers that use
> DRM_GEM_SHMEM_DRIVER_OPS. Therefore convert the initializer macro
> to DRM_GEM_SHMEM_DRIVER_OPS_NO_MAP_SGT and remove the latter. This
> helps to avoid swiotbl errors, such as seen with some Aspeed systems
> 
>   ast 0000:07:00.0: swiotlb buffer is full (sz: 3145728 bytes), total 32768 (slots), used 0 (slots)
> 
> The error is caused by the system's limited DMA capabilities and can
> happen with any GEM-SHMEM-based driver. It results in a performance
> penalty.
> 
> In the case of vgem and vkms, the devices do not support DMA at all,
> which can result in failure to map the buffer object into the kernel's
> address space. [1][2] Avoiding the s/g table fixes this problem.
> 
> The other drivers based on GEM-SHMEM, imagination, lima, panfrost,
> panthor, v3d and virtio, use the s/g table of imported buffers. Neither
> driver uses the default initializer, so they won't be affected by
> this change.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reported-by: Zenghui Yu <zenghui.yu@linux.dev>
> Closes: https://lore.kernel.org/dri-devel/6d22bce3-4533-4cfa-96ba-64352b715741@linux.dev/ # [1]
> Reported-by: José Expósito <jose.exposito89@gmail.com>
> Closes: https://lore.kernel.org/dri-devel/20250311172054.2903-1-jose.exposito89@gmail.com/ # [2]

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/ast/ast_drv.c      |  2 +-
>  drivers/gpu/drm/udl/udl_drv.c      |  2 +-
>  include/drm/drm_gem_shmem_helper.h | 18 +++---------------
>  3 files changed, 5 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
> index 054acda41909..6fbf62a99c48 100644
> --- a/drivers/gpu/drm/ast/ast_drv.c
> +++ b/drivers/gpu/drm/ast/ast_drv.c
> @@ -64,7 +64,7 @@ static const struct drm_driver ast_driver = {
>  	.minor = DRIVER_MINOR,
>  	.patchlevel = DRIVER_PATCHLEVEL,
>  
> -	DRM_GEM_SHMEM_DRIVER_OPS_NO_MAP_SGT,
> +	DRM_GEM_SHMEM_DRIVER_OPS,
>  	DRM_FBDEV_SHMEM_DRIVER_OPS,
>  };
>  
> diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
> index ce5ae7cacb90..1922988625eb 100644
> --- a/drivers/gpu/drm/udl/udl_drv.c
> +++ b/drivers/gpu/drm/udl/udl_drv.c
> @@ -57,7 +57,7 @@ static const struct drm_driver driver = {
>  
>  	/* GEM hooks */
>  	.fops = &udl_driver_fops,
> -	DRM_GEM_SHMEM_DRIVER_OPS_NO_MAP_SGT,
> +	DRM_GEM_SHMEM_DRIVER_OPS,
>  	DRM_FBDEV_SHMEM_DRIVER_OPS,
>  
>  	.name = DRIVER_NAME,
> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
> index 35f7466dca84..92f5db84b9c2 100644
> --- a/include/drm/drm_gem_shmem_helper.h
> +++ b/include/drm/drm_gem_shmem_helper.h
> @@ -293,23 +293,11 @@ struct drm_gem_object *drm_gem_shmem_prime_import_no_map(struct drm_device *dev,
>  /**
>   * DRM_GEM_SHMEM_DRIVER_OPS - Default shmem GEM operations
>   *
> - * This macro provides a shortcut for setting the shmem GEM operations in
> - * the &drm_driver structure.
> + * This macro provides a shortcut for setting the shmem GEM operations
> + * in the &drm_driver structure. Drivers that do not require an s/g table
> + * for imported buffers should use this.
>   */
>  #define DRM_GEM_SHMEM_DRIVER_OPS \
> -	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table, \
> -	.dumb_create		   = drm_gem_shmem_dumb_create
> -
> -/**
> - * DRM_GEM_SHMEM_DRIVER_OPS_NO_MAP_SGT - shmem GEM operations
> - *                                       without mapping sg_table on
> - *                                       imported buffer.
> - *
> - * This macro provides a shortcut for setting the shmem GEM operations in
> - * the &drm_driver structure for drivers that do not require a sg_table on
> - * imported buffers.
> - */
> -#define DRM_GEM_SHMEM_DRIVER_OPS_NO_MAP_SGT \
>  	.gem_prime_import       = drm_gem_shmem_prime_import_no_map, \
>  	.dumb_create            = drm_gem_shmem_dumb_create
>  

