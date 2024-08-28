Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D793962953
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 15:54:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5815F10E52B;
	Wed, 28 Aug 2024 13:53:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="V7W89QRn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2063.outbound.protection.outlook.com [40.107.93.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65A0E10E200;
 Wed, 28 Aug 2024 13:53:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bFv6K0NGpPCzNihr1p1QK6a38DcSZtibwGTnFeOqU9nK8GPCESdjPTos3IpNrVoYbNslSc38xxvCAXcPnexTDsArmAymb1Mpyr+vJPelz2EKaydfbRZEppgKAgGcyYnOqLuDoSMUqJxuSbi2wM7uyO/Q4DEPXp2HFCY2u1dpN6efG6tTfhsPkvm0lnSsT4ay5qTB7hXhXqXIM31tPq8U6KlJ1qfxB6guu0wCF+k6CCRxt42VrRUm1RqeaGaK+ZyPM0UJCulwr3ZzBu662fUt+QKJcQ+FTlag7y3hYr0JzGtrbbzwKA2LvRzMafvrqwoUNw1eiCxEL9J9O6ZazlqEbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2gkJle5l2T/gAh5sbphJ+M6B+QzsuuGpu2o4PjSPU6Q=;
 b=aXK44d7+hrrgK8E2Kxa68kUWbDevdxExm+DcfGksr/KTMJslhcN0ed64BW7g9jKcw3llXTrTfObKpOt6mWmKVLQaRscdC/K0kAb++Vb0zwM3Jc5UuO6wuEQrDj01/KZ9nLnB7PZ2bx6kSs21LryQIU4kkuqu/NsqrRxpl+oMEiVtTguvSw19EH2M7NWVB/aTLimLvthNyBkAWkSxt8t64PuXQPDAC9WLnCro/OU12Ay1SY0VFeNxTAWN/YsH7leTzz0N2eLgdQP7xAnQWktJTk+2oAkg1Gqi8C7h1msWXC4tV/mxOusbDIArJYYqHKGCxZmSddJHxQq/LzyHQrnfmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2gkJle5l2T/gAh5sbphJ+M6B+QzsuuGpu2o4PjSPU6Q=;
 b=V7W89QRndcghCErKmdM2ubLogTZqsjwynC7S2n7+y19CK7JM8X4FjmDJANOQdvGfDdMBGFdYS7zOOOneY8wQPUi2bo0yadSQr5FJxWad1RvJNnkFPpCAn0I5V3W9drqQe5Cdobo9aH2Y2U50ZtxN6nZofT4fbmALR+L5/u7C2mw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB6839.namprd12.prod.outlook.com (2603:10b6:806:265::21)
 by CH3PR12MB8512.namprd12.prod.outlook.com (2603:10b6:610:158::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Wed, 28 Aug
 2024 13:53:46 +0000
Received: from SN7PR12MB6839.namprd12.prod.outlook.com
 ([fe80::eaf3:6d41:3ac0:b5f4]) by SN7PR12MB6839.namprd12.prod.outlook.com
 ([fe80::eaf3:6d41:3ac0:b5f4%4]) with mapi id 15.20.7897.021; Wed, 28 Aug 2024
 13:53:46 +0000
Message-ID: <dac8f408-6f13-4ee7-a54c-342d51ba88d1@amd.com>
Date: Wed, 28 Aug 2024 09:53:43 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND 3/3] drm/amd/display: switch to guid_gen() to generate
 valid GUIDs
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
References: <20240812122312.1567046-1-jani.nikula@intel.com>
 <20240812122312.1567046-3-jani.nikula@intel.com>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20240812122312.1567046-3-jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0187.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::30) To SN7PR12MB6839.namprd12.prod.outlook.com
 (2603:10b6:806:265::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB6839:EE_|CH3PR12MB8512:EE_
X-MS-Office365-Filtering-Correlation-Id: c6f6a20b-1844-4626-7278-08dcc768d631
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bHdyeC82Q204Z3JoT3VzMGc3Y0prYnR0N25SV2FoY2dXMFBVR2RDakptNk4w?=
 =?utf-8?B?RjRtdGNXZHFyNXFIbkcxZGRRRDJsZngwOFdpYTN3Tm12VFA4OWdzRFRSRTk2?=
 =?utf-8?B?WCtjOUNJalg2SEJuRkxOdWhTVk84eDFQRG5qZms3RzhEdk5ld2pUQVNoNE43?=
 =?utf-8?B?cGdxcE53QjVWZzdldzNRa09kYmpWdXl4dTdGOWRzcHR2UkZLSDJFMHlmNTBz?=
 =?utf-8?B?R0t5cHJUdDV3c2wrWlVHRk9vNHVYSjRaMXJMNlFTaFhpUDBXaGZycTIxbTcw?=
 =?utf-8?B?Q0dLRElERTNuNmV3Q0RQWjF5OXFxTmR5YUFGenluazlNdmgrWGNWaWh3aG5U?=
 =?utf-8?B?MkV1Q21jL0pwU2ZxSmsvMEVuVHpzd3lzQXFSYTNmWHFva29vZlJMQ043ZGJ6?=
 =?utf-8?B?V1laT3VjUjQ2NHlUemVVM1dCZmRTRXJXV3RNdUJQTzVsbWFNYVpHZ2pURW1r?=
 =?utf-8?B?Y1NNS3dEaUkyOTAyWkc3NEpXeEZZYUtkUUhvWVdiZDdWUG0xdmJyeENYRlc0?=
 =?utf-8?B?SkozbjYrZzJVRzFZTjQzcVBzbmFheTdxM28wNXRkbjJva0FrWTVpY25PNmcv?=
 =?utf-8?B?OTZ1elJ1NSs0QmppTU5rM25CbWpiSUpnZkpwR2RXQTEyZ0RwQ1B6b0pxYWd0?=
 =?utf-8?B?eGJJOXpnUnluRWxCb2svWlF0dHlTOHl1cnltbjAvRFJWYnFGdktvVWxySDN0?=
 =?utf-8?B?cGRCY2FZMjNhQjVWZEFhY2NlQndFNENRYXl6MG4xOGZMSzdPdzdtQ2ZWZ2lM?=
 =?utf-8?B?UVAyLzVaSThkK2pKdGNvSVJTa0JYQWx5TlZvT3BMVjJLODMyZVBMUHo3cFd0?=
 =?utf-8?B?QUY3K2ZvTmY3WGVuQmxGcnJ1UFpOUHdyTmVYTDhiZERDN0MwQmNJdmIvalBy?=
 =?utf-8?B?WjVSNVZZMjJEakxDMVNKTXF4eFBCOXhyR2Y3dGYvZjFMWktWbmpTdHZRUWZ3?=
 =?utf-8?B?SjVqbUJRSGtoK2VQQTBPeDNlc1pwUnpSTzBoZVhFUXpwNHBmZGtQYnRRamhp?=
 =?utf-8?B?ZjcySGFubnExbndVMDZicm1uV3lacDZzQ2M3VVJ6VzNISjlkZS93R2NFRXFL?=
 =?utf-8?B?NTJZbnNWMkdwUTBIbVFnc1Z5ekh1cjJHanRxSStHS0g2Z2ZXd3BYQ3lJYitv?=
 =?utf-8?B?T0NwQ2JSa1lIMHhsQmdNWWNmNEpqN3IxWmJ3QURub0V6eGxWM3p1YWs0NDZS?=
 =?utf-8?B?S1pXaUJJNW1UMWtaVnFJZlNrcUlOM1MxelBMT2pwSVMyckdWSFpYYU83ZXBN?=
 =?utf-8?B?bkZOWmZJeWN6RE01NGd4aktoYXVlU2hIUlFnUVhWbUhBTHJyQkIxc0RPU3hY?=
 =?utf-8?B?WHVTczFjbGxHMEhvMXM4YnRwMStSd2V6OFRVcEdma0laVXFVYlkvRUZiN01G?=
 =?utf-8?B?TDduNTZ1YzRHTEd4YnRia2pzRThiL0NZRWtBWFQrcUtsSnV4QUYvZmpZd3Zh?=
 =?utf-8?B?UFJNSGxDRFdNYzdJeEY0R0pIT2xTVmthZkNQT3hzUWM0TTh3NG9MVFZKeHox?=
 =?utf-8?B?eWZ0TUQzdzFZRDcveHdKWjRiQmpsbjBsUFBSWktyaE5UUVdOT3hWUTJDcUJK?=
 =?utf-8?B?K0tOblA3eUhDSTE4b3dlUmduM09ieW5TbjVJd3N4aWZBeHRydFREZmZOU052?=
 =?utf-8?B?L0lFWjU2WDhrd0RiL25tVFM1T0h6VVhuYXU2SlVNZWN6cmsvYUllVUZvL2Y3?=
 =?utf-8?B?ejJXWFZ3Nms3VGlISTNxbnRTVy95N1RVZUdjaTVQK3hCV09acVQ2RDdxb0hW?=
 =?utf-8?B?bk50bkpmL0E0YWx0NlNSRnQydGlsRmtWcWdZQVpOc2VnSThXbVRTM1VRUDNN?=
 =?utf-8?B?L016L3pUVjltaDg4dm9GZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB6839.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDZXelhOS2RFanh1UEVtbzFHWnM1NVRaZmhidHM1WXUraEMrSGdydVNaaVhO?=
 =?utf-8?B?TmZ1ZVAwaWhuazQ2WVBQV2M0azhQRVl0ZDBacXNhQjJIOXhNbnNRelYyWUlM?=
 =?utf-8?B?UEJxOXBTaDB4SHlybEIzSmdZMUwrWkJyK1ZCWjVGc0FLaTZEcjRjTEQydXVm?=
 =?utf-8?B?ajBUYk1IQnVYSk9TeWNHR21nY2haQk9RRWY2T2NSZ0dKUUtZMzZvSmhCeU9h?=
 =?utf-8?B?b3BncDN1TFBhUlRObTMwcTc5MitNL3kyelRlSGNRUndWNXpnaDZlT0tpc2tZ?=
 =?utf-8?B?RTdCNm9yMFRIL2JCS3ZONnB5V2RjS0tGNVVZb3Mzak1FRExqSDhjRDA5cklH?=
 =?utf-8?B?SnJhWk1JQmc1Y3lHdUdrSytyS2ZGQnpvRVZtWEcvZTFEQThiT0lKbVJHM2c4?=
 =?utf-8?B?emsxM2ltZnBlYWFqVDU3dFJxTnVONkkvUzl1Y3B1SWRIQ1lYK250ci8wVHVj?=
 =?utf-8?B?aEJ5VzE0d0tkWU9DNHFTeCtlTitqc2V2ckhNeFFkNXlXVVNvbHZMeEJuZ1Ez?=
 =?utf-8?B?cW4wOGYwcUVheE54THhWMTNwNWNiajhFNUNmeUFEVlI0eStKSncxWUlvNjZu?=
 =?utf-8?B?UlR0WGZmZ1hXQWlwdkIvb090WUtVdXNoQm1mc1VXY25xMnNpODNrRFNaYjhU?=
 =?utf-8?B?TmEwTjMySGdaMHdXdzhFY2lpMkRxSHVwT0JBc09CWEVLRzVveVNOZFZOREFF?=
 =?utf-8?B?N2NFUnI4amVzcGZlL0YreEpvd0I4Zmo1MWRlQTVTWkJmaGZBazdnYlZvZXc3?=
 =?utf-8?B?M1ZOdS9MTGc2eTA2bE5EOFNvVFcxVnFnQ0R2Qm03a1J0amlhMTFUVTZrQndj?=
 =?utf-8?B?TVMxbnRSQWR6SzRNS2NxNWw2aXBFTmROKzJzaWs4RENJKzhtOVdoQUZWMTkw?=
 =?utf-8?B?bm83ekNvN0JHVldrWFptZUp6UlJlZ1ltcWtCM2l2UXZSbXFVbzRnKzVORUZi?=
 =?utf-8?B?Y09NREh0MHpqUE5EYXg2RlJibWZERDlUZk9rVG56eFBtL1NmUHBQNnNVa3Qr?=
 =?utf-8?B?aWkvbmhnYWV0RTd0eDFxdzJ3c0I2ckFZbzNFOWpRK3NlODFNYStCTmlMNU1s?=
 =?utf-8?B?SXY3UUJ2MXdMalpyYWkvQ3o0MnFDR3drS3huZWk2cTRadGJuYUpTNzdGYitp?=
 =?utf-8?B?NnZSaEVtcGtpSGloL2cyQVVrNGFabmdTNkFRZ0hQcjNrMGMzdGJ0TUtIQUh1?=
 =?utf-8?B?WlNmU2pjNExjbWJ0TXZobEtOY2ZiQTBtRXV5clZxRmVvb2lCanNxSVg3L3RN?=
 =?utf-8?B?L2t5bm9HWkRyMCswaWpYVTlKR2VYaWpXWFJBK1FSaHFzK3ZIR0dreWwvbjNs?=
 =?utf-8?B?alVRYUx3ckE5RlBPbnErVVJjcVJlMndpSDBRSlJKalVxN1lIWmJreEw0YThw?=
 =?utf-8?B?Q1h0QVY1QTBETEZvSWpBd0lmTmRabXZ5TnFWYmpTR0JTY0pSYm9rcWliZ3lM?=
 =?utf-8?B?ZnpmQjJ2ZGU4RzV5OUV0Zk15cmtza3gycW0vSklpTTlwYmV1WkZTOHMxdi93?=
 =?utf-8?B?QmFrQS9KQ2xsdkVYMllWRmptbEx0eEt4S3F5aExhcEgwNFp6Ykh2eGVmalhQ?=
 =?utf-8?B?OExlQnROQldYVXp1UmlPZC9OWU1HVnI4MGVYYUU1VEduREZCWkZrS2NWTVF3?=
 =?utf-8?B?VGFneFFTbnlheG1TT3loQ3FHVEdCeWNZdE1HQ1lQNm55ZEpQSThuSkU4NWp4?=
 =?utf-8?B?SGpxOVlOaCt5MktIdHVZNVAyOWNxSm53MjNYa2l3ak9BZXlOUHhqQ3FQV3Fl?=
 =?utf-8?B?cTFtSlVaTnc4MC9nUUZHUVYvRGsyUlhQdVJYTGcyNkZReGNhYVNwanIreTh1?=
 =?utf-8?B?K1B3ZjA3bFptcjdxWGRnbGRzM1RNTHVsdkQrS21PUHhXeXFObFh5bFdtek1z?=
 =?utf-8?B?YXhrc0RzSFd5Y2o3UjFzNlhoTUt2VHFNSUhqUFNhL3ZPRDlFS0NjcThEa1g4?=
 =?utf-8?B?OGxKOUVZcEYvZ21BOW9zUytycmVrczR1Z29OODh0WURIeEFsdHNOZjdRQlUv?=
 =?utf-8?B?OXBEREtiS1QwTytlSmJRaEN4TStISU1oTEJIQnEwQXlOMkMxbnp4Qzg1K1lD?=
 =?utf-8?B?eWJYa2hBcEVqRkNCVTN2YnFkK09IRk56SklaK3VDWGdUYW45YWxUcnlXaTdt?=
 =?utf-8?Q?XWR1kFKuZNYjvL8zeCo1zl6jk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6f6a20b-1844-4626-7278-08dcc768d631
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB6839.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 13:53:46.5525 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ejIXz7ccal8bD1EsqCiZY7wKJhpMpV4f+iBeihjMkXDfUiTcFI1nHpypK3lS3haHiNGQ4QrntnxBE8YVrq7h6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8512
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

On 8/12/24 08:23, Jani Nikula wrote:
> Instead of just smashing jiffies into a GUID, use guid_gen() to generate
> RFC 4122 compliant GUIDs.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 
> ---

Acked-by: Hamza Mahfooz <hamza.mahfooz@amd.com>

I would prefer to take this series through the amdgpu tree though,
assuming nobody minds.

> 
> Side note, it baffles me why amdgpu has a copy of this instead of
> plumbing it into drm mst code.
> ---
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 23 ++++++++++---------
>   1 file changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 72c10fc2c890..ce05e7e2a383 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -2568,9 +2568,9 @@ static int dm_late_init(void *handle)
>   
>   static void resume_mst_branch_status(struct drm_dp_mst_topology_mgr *mgr)
>   {
> +	u8 buf[UUID_SIZE];
> +	guid_t guid;
>   	int ret;
> -	u8 guid[16];
> -	u64 tmp64;
>   
>   	mutex_lock(&mgr->lock);
>   	if (!mgr->mst_primary)
> @@ -2591,26 +2591,27 @@ static void resume_mst_branch_status(struct drm_dp_mst_topology_mgr *mgr)
>   	}
>   
>   	/* Some hubs forget their guids after they resume */
> -	ret = drm_dp_dpcd_read(mgr->aux, DP_GUID, guid, 16);
> -	if (ret != 16) {
> +	ret = drm_dp_dpcd_read(mgr->aux, DP_GUID, buf, sizeof(buf));
> +	if (ret != sizeof(buf)) {
>   		drm_dbg_kms(mgr->dev, "dpcd read failed - undocked during suspend?\n");
>   		goto out_fail;
>   	}
>   
> -	if (memchr_inv(guid, 0, 16) == NULL) {
> -		tmp64 = get_jiffies_64();
> -		memcpy(&guid[0], &tmp64, sizeof(u64));
> -		memcpy(&guid[8], &tmp64, sizeof(u64));
> +	import_guid(&guid, buf);
>   
> -		ret = drm_dp_dpcd_write(mgr->aux, DP_GUID, guid, 16);
> +	if (guid_is_null(&guid)) {
> +		guid_gen(&guid);
> +		export_guid(buf, &guid);
>   
> -		if (ret != 16) {
> +		ret = drm_dp_dpcd_write(mgr->aux, DP_GUID, buf, sizeof(buf));
> +
> +		if (ret != sizeof(buf)) {
>   			drm_dbg_kms(mgr->dev, "check mstb guid failed - undocked during suspend?\n");
>   			goto out_fail;
>   		}
>   	}
>   
> -	import_guid(&mgr->mst_primary->guid, guid);
> +	guid_copy(&mgr->mst_primary->guid, &guid);
>   
>   out_fail:
>   	mutex_unlock(&mgr->lock);
-- 
Hamza

