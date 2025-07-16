Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F2AB073E3
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 12:48:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0393910E70C;
	Wed, 16 Jul 2025 10:48:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wMshEeQp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2078.outbound.protection.outlook.com [40.107.96.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 490D210E70C;
 Wed, 16 Jul 2025 10:48:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uFVawjr6KGmei+Xs4T0tzJY+rCCc53nUB/mTuGlioytfRK7VjsDfMhIWF2IJwmkYmDj9hdc4PEWbSA0TcMLUr90AQ+U2afBqS0F7Z/jfZyWrZDdpnLwLEOM+j1vMfK3vd1TuP6isiUPvNjnVkxOOkZYKFJK05XEnqqxY/6Plh+59WEKhYSBywRVFU3phiw+jF2exWxUdfiRsnTbzdaFCnteP0i1oaIbcX7K1j06fa4rdmT0bRmSFnzXQtiKID1yiITzQ43tJabZKFyT6PjjXqKEb+kC38W5tRjEzzz4vV3ZJZ2Fo2iGXbuoaegbVhjprZEHX2P62ruXQpdx6fG+Jyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2KHaL3GdM0c2rXP9rWaiSPp4qxit8i2aNqHF+DxsVvU=;
 b=RYVSlk1FZ9DmOgE4xgm+AaEqZrSuYXA9fV3wNJ91d2RwSRDvbuDsgQocHya0QywgY5Lu9FzBbjzCVyM6vpnyEM+5DhtojOkbVTjr3Xvdh3qFBiSGElsVawhqks6WrHD4kK5vBaYbtkUAwf5rd7WvQJ+JYoiPVMsdI1EJktVj9+aTDYLdv2WqntN0pMFnrLtCKL0SlfxDBEm9UMp+0z4zOJQPzDqXNNMx1DYh6g9L186cpQLJQNTl7QgUW72y4VravZtPG2z6XoVa9NsF0MfcMLmu3qT7O7aQrIhIFDrXk5PfTw5+FwbURKqElkk5Q8ekX2PWtWrMAUgEKfmTzmeR2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2KHaL3GdM0c2rXP9rWaiSPp4qxit8i2aNqHF+DxsVvU=;
 b=wMshEeQpdPLSaiKt141TlGbVLHW6+zrVkEjPJfinDapvJ63/xhPbAeoqJ4EYQoXMyKPqxla24ltrs5HjPr9QC6bKzBznpbbA9dcV6FcrWqezv8sHeFzcaq7knIb5BM4392CYXo3/hA5oRLC1YrADqSnVOHF4eSAfY8s5NIK8AmI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH8PR12MB6915.namprd12.prod.outlook.com (2603:10b6:510:1bc::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.33; Wed, 16 Jul
 2025 10:47:56 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.033; Wed, 16 Jul 2025
 10:47:56 +0000
Message-ID: <9e9be088-fca0-4f31-bfa9-5201f46e1d12@amd.com>
Date: Wed, 16 Jul 2025 12:47:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] drm/amdgpu: Reset the clear flag in buddy during
 resume
To: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, matthew.brost@intel.com, airlied@gmail.com
Cc: alexander.deucher@amd.com, stable@vger.kernel.org
References: <20250716075125.240637-1-Arunpravin.PaneerSelvam@amd.com>
 <20250716075125.240637-2-Arunpravin.PaneerSelvam@amd.com>
 <05a2b3f0-2166-47cd-9964-53254e4df6ba@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <05a2b3f0-2166-47cd-9964-53254e4df6ba@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH8PR12MB6915:EE_
X-MS-Office365-Filtering-Correlation-Id: c43fa410-c492-40fd-9c74-08ddc456391a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bHMzOG9RY1ZUV3JvdHZRYjR4YmRlU2gwSitueE1Yb200N0Y3blg0RWR1TG5x?=
 =?utf-8?B?bG1zNUU4U0RPM1NpNGdqUGdmWC84L2QvdGl0d1JHUlBuWC9IaGdPL1ZkR1JL?=
 =?utf-8?B?c0l0WGVxY0IxakZENlBBM1hjUlNNV0hDb3gwQjRXbUZ6UzJTN0RNRSthR0JB?=
 =?utf-8?B?WWl6WUdnTlNBQ0F1ZTRWVFdOWFpuQU5iZWNlODdPTWIzZ20yMExKRjczRTZk?=
 =?utf-8?B?NjJUZksxVmV2cFVQeFRxTUlUNFZjQVlEa3gxY2FxYmhrRlRMSlpielQyak9l?=
 =?utf-8?B?UEZzdks5cE1RUnIySnZ4VTJCb0NBeXdTNERrNldyNnZsK2ZzQjhma2pLMDBh?=
 =?utf-8?B?R3dSWEkwVTFEZTVJUGt3ZzFocGkxbmtjTXlyQnJkQmVTa3RocUdRTTZDazVq?=
 =?utf-8?B?UlVFRi9ibWJYYzJZVFFMRjNYYmJKcnpqTU1MUUtYcEk5MlZ6ZzNUTFk1b2ZB?=
 =?utf-8?B?d3pFUEJOYUZJd3RtZ1pLSjhyc21jTlhxMTBhTXpMTFg1cFRUcUJTRFFMZFFR?=
 =?utf-8?B?RGFkMHNjTWRkYVU4cnUxZFBoOXNNcE0wKy9WUDZIM1pzTmlaUXJ4TElNanpG?=
 =?utf-8?B?SjZ5TUQ1eXJJc2RYTkNRbUJiWktiSm1TcllqNzJqRThxcFdGTVBTUXBWUVBE?=
 =?utf-8?B?OVArYlpyQWZIdVlpQ0RnTm15bUdZdFNIVk1BWTErdU55YjJraTFrNmFUYmh0?=
 =?utf-8?B?b1JHM2hEYmtWTDlUYkVUNlVUNHVNZUUrVzlqUEE5UXprWmtUakJzQkN6SDNy?=
 =?utf-8?B?Mnk0YnJqOGUzRW9TUFJ2c1NpOUdlWlJNTGIxc2dBbUFNTXl1S1RYYWkzUTVY?=
 =?utf-8?B?Vm1KWnp4WEU0a2Q4N3E3QjFYeE9HVit6ZTFEMjlqZ3VUSnNLcXB5ZG1KOXA2?=
 =?utf-8?B?K29KVk1KL1JWQjYzM3RHSWxNR0FoSFFvUkRvUHpzTnJldUtBYjVhcXFhbHMz?=
 =?utf-8?B?b0V4b2dFM25RUTBvMTlqbVRrOWpFNmgrL29mWjJrcngrZTZYRS9kZ0JQMEdl?=
 =?utf-8?B?Q3c1U3AyTnIyQmJyZ2M1V2FldG1DZzhSTmhtcVpNZm9OeTZEOUdJVnFsNXJ3?=
 =?utf-8?B?SWttNC85eldidFN2dURKc2dnYUgxSVNOck5QL0dSMHI0a2tnSFZWVzlOMUtu?=
 =?utf-8?B?ODJxOWhhMUdZaVNpWElpeFdzSnoxanJIbnpNV0d1eWFWZWZ6eXN6ZkFnS0dE?=
 =?utf-8?B?SjVqd1NGdVdSc1grK0RwbGN5a0txM1U5c1ovZXVBaHVmSVdPblNsQ25zRHB1?=
 =?utf-8?B?MStNUk9GVXIwb3hMRXpyVVJnTjZYZVRNNkZNRzkyK29IdGIzTWxST3VXSk8z?=
 =?utf-8?B?NDJsWUtRQVgzNzZFZzYwQ1BwQjhPWTRuYzViWXZrUTREZXhaU25FUG9DQ1pT?=
 =?utf-8?B?MVROdExlTGlhbGtVVU1vOFdEU2RxbXhCRmVORXdMZWVqUnNVcGpoN1ZWMEVz?=
 =?utf-8?B?WnNsdEVESG5NTDY2a0JPelk5b1JtY25NV1VDTlZVNnlmcDdxWE0wejFlUGVQ?=
 =?utf-8?B?c1hKTFArV2lPS1ZlMXBvenB5Y0pQcDM0aHNyUmQ1MzhDNWdzNXB1KzNhQ05r?=
 =?utf-8?B?M2xsajk3b2NPcXNORWVDZXRFemlpN1NOR0wrQWVKMjJLNklZZ1U0R2I4cW5Z?=
 =?utf-8?B?QklKc01LVkpNQUYvZGNiS1pyZjNQSyt3a3RjQ0R3WXA3TWRxN3VjZ2pma2p5?=
 =?utf-8?B?ZHRIYks1eEx0UVpJbDNXYUtSbTY5TDNVUmVOY3pUNEJKSmVleEEyNyszbzdq?=
 =?utf-8?B?VGZyQmRJK25kaGJWL2t1QnFtVnlNS1JyaTVFVndiaHg2WHpCVXVDZmRLMnVx?=
 =?utf-8?Q?gyp0FbMxYD6elVOmIEJtjo+GzKnB5livcZLJA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ME9EaWtoMW1aRFZjK1FBb2VWRnp4US93MVk4Yy8xWVYzZXI1Y2pYRVlIcGtN?=
 =?utf-8?B?a3laZU5qT0l0MFlKQ2RsQzFUNDVycDRPeXZtYThpQTc1SHMxWUJGMXhRUFg3?=
 =?utf-8?B?cU5CdEYwaUhUVDA1YWJwWVFGeGhEa1VPcis0MnkyeXhjUUJsN2JTQVdjOFU0?=
 =?utf-8?B?U3I1SDZyWDNqVWxaUzBjTlpUOGloWlpra25yOCsyM0VmTDRGeVBsTDBJZGRW?=
 =?utf-8?B?ZzNFR2MzdTRGZ1Yvb2N2R3UwNWh0NzFoZWZPMDVLR1dud0FmVWJyYlRQNmZZ?=
 =?utf-8?B?dXpwZm4yNGZoUTJpUEtOckVTRDIvaHoyR2p6TWMramtKMkRFUEJuanpkbll1?=
 =?utf-8?B?R3B3eTkzOGVIMk1obHV5QnFoeTIxMEdoa3pRWUtHbHRUMmltbnVyTGV0Nmp0?=
 =?utf-8?B?Ym1QZzVBYjhiWisreWQyVGNzUkZLRGM2NWs2UWtSNmFMMVVCZGJ4WUhkOW9U?=
 =?utf-8?B?UEFBb2IwSXFoQmdBTTJNRERZMmwvM3grSW9XY1lsVnF4WmNHU3JEME40SjB5?=
 =?utf-8?B?NVdoNnBRYXlIcDJuMFJQRzRMNUZVMzJQMVFwTW9DR1owK28zTGJkQUxWeHpU?=
 =?utf-8?B?TFg3Slpadm1GN2YzQU9Fb2hWSGNYQ0hnRDJpc2I4MkprUkJpTnVlb3V6TWg0?=
 =?utf-8?B?SEFwZTUwdGljUUZqYXhsS0s4bjZ5cCtibVdRaUxoNURiU0J3cXdja1FoaDN5?=
 =?utf-8?B?dzdMYmp4aytHSGJiQndjL1E0MmpZNkRYUW5oRXo2SEdocXNqQXRsL0Zlazk5?=
 =?utf-8?B?aklGOTYyMGpjRU9ySE1mcjZ5WHM3NGNMUkowc0I4ZmQ4UG5oTEtnb1FLeG5q?=
 =?utf-8?B?MnA2OWM3YnArV1k5OUREYnl3VEJ2RGpWaGE5V3gzaGxKdEFjRGRuSFB6eWt4?=
 =?utf-8?B?UUNoMzdtbi9aYkdJWGxIbGY0eVBqY0pYZ1lISXNlbFNlZjc0RzNBRGpVZDlD?=
 =?utf-8?B?bTJTbjhqRm1PTUNUMnpnb0lwZmhoWkR1RDJGbEFRSWh6UXowVFlpSm1YdXJr?=
 =?utf-8?B?UkNPUVF4alBOWWF4aG16cTgxM0hyanlTQ0xsenVrVXFzc2FTTlA4Z0VlVWJ3?=
 =?utf-8?B?dUgrSEg1cENmQlFSQ294RDYxUURBR2JUWXVNdTlka3ljS1ZFdUNISytIT3A4?=
 =?utf-8?B?cURNZWRmRjViclE5bnN5UmZHRGs0eS9tVU4xbWVNaklXWXIwUUs0RzZXamt0?=
 =?utf-8?B?V1RuRWRkWFozTFFKaUpkbWlqQ2FaaTVJbVZoeDF4cVBheGRyazkvaU1mQVZl?=
 =?utf-8?B?bjdCdEMzdG5DY3A1WEszL3puNWMvZ280by9TUFU5T0FRNEpoWXBwUUdheEdp?=
 =?utf-8?B?NnRYamgxQTd1OXhvUjRtVk5IZEVHS21WOHRFY2RsSWlIM1RicXEwa20rWjhy?=
 =?utf-8?B?WnMwc01RZkJQcjU2elNRUE9kWFdLVWlOU3hudzhZRmtwZlg5UTZVbVRvTEJq?=
 =?utf-8?B?OFVRNHJlb01LVUdHVFB5OWlKY2NadysyQkpiRGZxekRVSEJSZlJ6Z3VrcGNN?=
 =?utf-8?B?UmZDRWpsMitzMlhkWGxjRTE4NW9BOHFGMWFsWXQ3VWxMNXFhZ1BidkNseUFB?=
 =?utf-8?B?SFFIWkNZbjZqTUtqVmhjNXc3QnhMdkV5dFZ2WnUvdytwNmZUVkRKR3ZHeWN5?=
 =?utf-8?B?WHVCclhOa1hqUWRFdG1xOThyQWNSK2hBbnN4UURTVzNkZFBZbEk2TXplbXFw?=
 =?utf-8?B?RUhGcUFhS1RYQ0VibkdmcFA1UnBQdzNOOElMandnTW1iNExBMjZ1OEVLbjJM?=
 =?utf-8?B?dVRxaUsvSTlNZDEvcHZBbmdvcmp3UVlaQXNXMW9qMFhyTFVtdHFEaDg4bnps?=
 =?utf-8?B?Q3FIbUNjc3Y0a0VTeHR4US9nbUhranIyYzdGQXRQSnQrU2pWQjZibGhma2tB?=
 =?utf-8?B?MDlLZUMxRGg5RWdCSGlVQmdkbjl4V3F4Zyt1dlIybGlHMmhCWUdqREtYMVM4?=
 =?utf-8?B?QytFNlRvLzBEbmJ0YW5tVCswUGUwOXY4Sm9EMWp5WjNXZW4rRmNqY2lsbzlS?=
 =?utf-8?B?bEdyUmxQUHVTalBJVENZQWliR0hoRGFoQjFLUWZ1RXhaL2x1MmZMK2VXc080?=
 =?utf-8?B?WWpUMVZaeEI3MnIzOXhNenRwanlPLzZkREFlZVFCVGZsVTNEcjYrUUZiMEg0?=
 =?utf-8?Q?qx2zGxq1j9bm8LQbpjFzBS0Vu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c43fa410-c492-40fd-9c74-08ddc456391a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 10:47:56.2919 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jtpzdeuyg1zmC+W7LqK8AOKRCt7N9z/CbInWKF0VQBcDHHyiNilEzyB6a3SKk66G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6915
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

On 16.07.25 12:28, Arunpravin Paneer Selvam wrote:
> Hi Dave,
> 
> I am trying to push this series into drm-misc-fixes, but I get the below error when dim push-branch drm-misc-fixes.
> 
> dim:ERROR:e24c180b4300("drm/amdgpu:Reset the clear flag in buddy during resume"): Mandatory Maintainer Acked-by missing., aborting
> 
> Looks like maintainers Acked-by is required to push the patches into drm-misc-fixes ?

Strange, it should work with my Acked-by. Let me give it a try.

Regards,
Christian.

> 
> Regards,
> 
> Arun.
> 
> On 7/16/2025 1:21 PM, Arunpravin Paneer Selvam wrote:
>> - Added a handler in DRM buddy manager to reset the cleared
>>    flag for the blocks in the freelist.
>>
>> - This is necessary because, upon resuming, the VRAM becomes
>>    cluttered with BIOS data, yet the VRAM backend manager
>>    believes that everything has been cleared.
>>
>> v2:
>>    - Add lock before accessing drm_buddy_clear_reset_blocks()(Matthew Auld)
>>    - Force merge the two dirty blocks.(Matthew Auld)
>>    - Add a new unit test case for this issue.(Matthew Auld)
>>    - Having this function being able to flip the state either way would be
>>      good. (Matthew Brost)
>>
>> v3(Matthew Auld):
>>    - Do merge step first to avoid the use of extra reset flag.
>>
>> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
>> Suggested-by: Christian König <christian.koenig@amd.com>
>> Acked-by: Christian König <christian.koenig@amd.com>
>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: stable@vger.kernel.org
>> Fixes: a68c7eaa7a8f ("drm/amdgpu: Enable clear page functionality")
>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3812
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c   |  2 +
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h      |  1 +
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 17 ++++++++
>>   drivers/gpu/drm/drm_buddy.c                  | 43 ++++++++++++++++++++
>>   include/drm/drm_buddy.h                      |  2 +
>>   5 files changed, 65 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index 723ab95d8c48..ac92220f9fc3 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -5327,6 +5327,8 @@ int amdgpu_device_resume(struct drm_device *dev, bool notify_clients)
>>           dev->dev->power.disable_depth--;
>>   #endif
>>       }
>> +
>> +    amdgpu_vram_mgr_clear_reset_blocks(adev);
>>       adev->in_suspend = false;
>>         if (amdgpu_acpi_smart_shift_update(dev, AMDGPU_SS_DEV_D0))
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>> index 215c198e4aff..2309df3f68a9 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>> @@ -155,6 +155,7 @@ int amdgpu_vram_mgr_reserve_range(struct amdgpu_vram_mgr *mgr,
>>                     uint64_t start, uint64_t size);
>>   int amdgpu_vram_mgr_query_page_status(struct amdgpu_vram_mgr *mgr,
>>                         uint64_t start);
>> +void amdgpu_vram_mgr_clear_reset_blocks(struct amdgpu_device *adev);
>>     bool amdgpu_res_cpu_visible(struct amdgpu_device *adev,
>>                   struct ttm_resource *res);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>> index abdc52b0895a..07c936e90d8e 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>> @@ -782,6 +782,23 @@ uint64_t amdgpu_vram_mgr_vis_usage(struct amdgpu_vram_mgr *mgr)
>>       return atomic64_read(&mgr->vis_usage);
>>   }
>>   +/**
>> + * amdgpu_vram_mgr_clear_reset_blocks - reset clear blocks
>> + *
>> + * @adev: amdgpu device pointer
>> + *
>> + * Reset the cleared drm buddy blocks.
>> + */
>> +void amdgpu_vram_mgr_clear_reset_blocks(struct amdgpu_device *adev)
>> +{
>> +    struct amdgpu_vram_mgr *mgr = &adev->mman.vram_mgr;
>> +    struct drm_buddy *mm = &mgr->mm;
>> +
>> +    mutex_lock(&mgr->lock);
>> +    drm_buddy_reset_clear(mm, false);
>> +    mutex_unlock(&mgr->lock);
>> +}
>> +
>>   /**
>>    * amdgpu_vram_mgr_intersects - test each drm buddy block for intersection
>>    *
>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>> index a1e652b7631d..a94061f373de 100644
>> --- a/drivers/gpu/drm/drm_buddy.c
>> +++ b/drivers/gpu/drm/drm_buddy.c
>> @@ -405,6 +405,49 @@ drm_get_buddy(struct drm_buddy_block *block)
>>   }
>>   EXPORT_SYMBOL(drm_get_buddy);
>>   +/**
>> + * drm_buddy_reset_clear - reset blocks clear state
>> + *
>> + * @mm: DRM buddy manager
>> + * @is_clear: blocks clear state
>> + *
>> + * Reset the clear state based on @is_clear value for each block
>> + * in the freelist.
>> + */
>> +void drm_buddy_reset_clear(struct drm_buddy *mm, bool is_clear)
>> +{
>> +    u64 root_size, size, start;
>> +    unsigned int order;
>> +    int i;
>> +
>> +    size = mm->size;
>> +    for (i = 0; i < mm->n_roots; ++i) {
>> +        order = ilog2(size) - ilog2(mm->chunk_size);
>> +        start = drm_buddy_block_offset(mm->roots[i]);
>> +        __force_merge(mm, start, start + size, order);
>> +
>> +        root_size = mm->chunk_size << order;
>> +        size -= root_size;
>> +    }
>> +
>> +    for (i = 0; i <= mm->max_order; ++i) {
>> +        struct drm_buddy_block *block;
>> +
>> +        list_for_each_entry_reverse(block, &mm->free_list[i], link) {
>> +            if (is_clear != drm_buddy_block_is_clear(block)) {
>> +                if (is_clear) {
>> +                    mark_cleared(block);
>> +                    mm->clear_avail += drm_buddy_block_size(mm, block);
>> +                } else {
>> +                    clear_reset(block);
>> +                    mm->clear_avail -= drm_buddy_block_size(mm, block);
>> +                }
>> +            }
>> +        }
>> +    }
>> +}
>> +EXPORT_SYMBOL(drm_buddy_reset_clear);
>> +
>>   /**
>>    * drm_buddy_free_block - free a block
>>    *
>> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>> index 9689a7c5dd36..513837632b7d 100644
>> --- a/include/drm/drm_buddy.h
>> +++ b/include/drm/drm_buddy.h
>> @@ -160,6 +160,8 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>>                u64 new_size,
>>                struct list_head *blocks);
>>   +void drm_buddy_reset_clear(struct drm_buddy *mm, bool is_clear);
>> +
>>   void drm_buddy_free_block(struct drm_buddy *mm, struct drm_buddy_block *block);
>>     void drm_buddy_free_list(struct drm_buddy *mm,

