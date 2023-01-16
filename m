Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8DE66BC6A
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 12:08:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D799510E3C2;
	Mon, 16 Jan 2023 11:08:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2044.outbound.protection.outlook.com [40.107.244.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BCE310E06E;
 Mon, 16 Jan 2023 11:08:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j18AIS4p3RW4kpTvp+jdjSi58tVrq/e8TzAcavPNsaLrO6Oa3HMaG/BzEEmHa1Jik0Q7UbOMsCk0Rp09nWwR3ioQyof4j8KR242YtO7D03FX8QKPPzXwk4PGKNGYaMthRCLlvcpDwjmscmi/ia6X3Lsu6gMeCfXsJwsJSYQP76Ql0TiDntVl6TMKMQT9qk71TPmkiQ0tLkeJoXEgqKK9+NaxPUUQPKlJtzfSJm/JfcOzubIHw7IlDzeuJpwU696KfncMNF5qNm8GPl9wYeN3oYGBALTsHFOHiXrA04hWIJJzzM2c+hhdh4GKcfmhOBnywDHP1Vovh0LbrNW73rAxVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3R9nfvMfGCwt1CtJF0Vgt+WZx6pSdkI9Lc3pEAmOMFU=;
 b=KjNI0p2/gmE6zpqji073bdd/r1PT9H1SW/hAnxSF5u9N10gQ9IEAJV3GDPrVDpJXy2Ur0gShfI9iiFEyyQ8Mxn7966DPunsn8TRFrojmGdEOIfFP8/tqNCT50l9s3nY9LV82bi9F5OvjE2WQnQ0gg1iP31jVm2TUr6OPmyTdswqyIZuSJl4wcdHH4WjOLs6es3rJfXgPcIFXn3QWU4bsGPgQxIlxOXSZPNhN5q//qdCeEfakEAMAQlF+nXgzhvHgvsQbn+zDBmxxadm2PpHQl1peI7ho+k9sLXKQ57DleNggkSR2NcpN/SQPbU4KlWymOvrJ0ZU7RqEWn0hr2/7wCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3R9nfvMfGCwt1CtJF0Vgt+WZx6pSdkI9Lc3pEAmOMFU=;
 b=3mIP3TbFI+nt1zYPy9c0KHkek5YEcNYRHljq5AvD/626wivAXKqIHhy88kWpG6u80hM6jTUFhe45NBdcbBgEFu4GJXsqZ+e8Bd7w9iqZ19HXPxXMIxT6/T24boXZ4aOfApYu008JSJN+Le1RIr+FQxnKLHh8YSxQyzP6UExIBuQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB4357.namprd12.prod.outlook.com (2603:10b6:208:262::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Mon, 16 Jan
 2023 11:08:10 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0%3]) with mapi id 15.20.5986.022; Mon, 16 Jan 2023
 11:08:10 +0000
Message-ID: <562b3cc5-c8e8-1f93-589c-e6314ff647db@amd.com>
Date: Mon, 16 Jan 2023 12:08:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/2] drm/ttm: Check ttm_debugfs_root before creating files
 under it
Content-Language: en-US
To: "Ma, Jun" <majun@amd.com>, Ma Jun <Jun.Ma2@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20230113053416.2175988-1-Jun.Ma2@amd.com>
 <92a649eb-b812-a3c5-01dd-2cd6301fbf97@amd.com>
 <de99eae0-2a8d-f727-cb28-b5ded03521d1@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <de99eae0-2a8d-f727-cb28-b5ded03521d1@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0063.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::19) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MN2PR12MB4357:EE_
X-MS-Office365-Filtering-Correlation-Id: 940eebfc-0acb-4e4b-1c2b-08daf7b1f3ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jjl9tI6MTifVd1HPUhXQeskjFWxV4hx48fQEseZp7z0QPB6sD7XI5btZ+T1XRucCaTJ+/lprAtTAh+g7Nmd2dtsmu0G21rj+fydr3JZ8/lS+oy23SBeEGIUlyUlPAowWASWxPN7clwQ07VefGskhcdhhPUZ+p3eK0H/DKt/zx2iEveXFWRy5Lz0vfjw/iqsAynyp3zltb3QCFZWKpWQXbJfRZ62f6tdVOfh3slXMc+2g/sOBUKiIUA97vUe6CM7AhIu4hzeO2SrHnVa60YtktRXPXyX97YbotsHytNF5oPY17ekR/zt9I9MT06opJsV7KlVR3LePa3UgPBBskbPU5oPxNi1GOsRK5YlC/qMmjzJBwCOLy5PkeGS0zG3/dNmrMOV4l26aq5CvUGOoSqTNIrQoj1xPJJMec77pazwyAn9+NNetXmtSewmZotaph4I4I4UmdM+GVSB8vsRMZoopPhLSTx72nYE5zvDzYv/TGToEL7zpckLrWW7rAVtLWy6dz/wLCNiynGqHAYfsOs/QwrDG8Uf3ioDL/+98VG4d2+8Kcbfyc65utcAwDvAt2VXbEf3B1HueBft57TcMkAeQxrRvCyoopnFSCeHV1josSDJTiz1eQfbaNwqCAr19E4LTlDw9jfTxTidpp4FWGkhJpDiT7JLF8BWOxcsCHrR4LrVF17bNM3XSaYNA2ERqT2Aw6qFBt51jPGv3hrMXu0u/pS2WVmLkJPB+N392E+B1RH4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39860400002)(346002)(396003)(136003)(376002)(451199015)(83380400001)(38100700002)(5660300002)(86362001)(2906002)(8936002)(31696002)(8676002)(66556008)(66946007)(66476007)(6512007)(450100002)(186003)(6506007)(26005)(53546011)(2616005)(66574015)(6666004)(316002)(6486002)(478600001)(110136005)(41300700001)(36756003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlR1a1h6dVl5V1gwd2VEZmw4MFNNRlhkc3UzdGNyc01DTCttcEtIVXNYaEFp?=
 =?utf-8?B?TSt0M3RCblA2M0lqeURLcm9hbjFGUWliZnRWUDZwN0xDYU0xVlVVOXJCMzdE?=
 =?utf-8?B?MUpHdFR3SGRPKzNlSmpNK2pFUGQ3a2VFdHkrQ2xNN0hkelJQYmt5WkNqdC9u?=
 =?utf-8?B?dGYxVzYySndoK09hK2x1ajhkMXhqTklCVHZtbHJ1TkF5aERMVGFPYWxQMUx4?=
 =?utf-8?B?Z0RKNUo1NGhmQmFodGJrVkFZVDVtekFRYXBPZTVlbG5zUnUybTZ5RENtZVNR?=
 =?utf-8?B?M3g1ZVpiZ3YyUjdRR3FId1d3YW93VGFlZjVkS0laR0pITzhmRk5tcmZPUEQ1?=
 =?utf-8?B?V0JndWpNaGU1azFmMWVXaURtNFV2TjRKNzVyZWp4WndSWmJEY3hmYkhxWlBE?=
 =?utf-8?B?UlhEYzU5dkZYNVROd28zWlVQTnlVbkFpZmk0WlFUcDFKNHB2Q0tiNExvNmpn?=
 =?utf-8?B?azh2OVVFNklRR0FkNU11Z1VxWkhsaDM5c3ZNMmNIRnJ5dlBiKytEZGZZZUlE?=
 =?utf-8?B?MGZkcXE2UzNHM3VYTkExTHVLR1hMU1loNFJQUnllR3NQOExZMHh0YlFYNFRj?=
 =?utf-8?B?TzdwR091eGFadCtXSVdXMHdBbmFQVElqY2xRc2tESUdaWTNuVHJwcC8xY2hF?=
 =?utf-8?B?L2F2M3ZDYXhURklHcFF4TVVmREcyYlU3dXBFcTVFS21zekJSc1RnK2ZrZW1w?=
 =?utf-8?B?b3hlTm9zbDNmV1hGTk01dlZ0cXRqNllCRzREZDJ0VU82MkRqdVZJSjhjY20y?=
 =?utf-8?B?RDBuT1NiRmhIWEc0UnhUTEgyYVQxZ2VmK21takV6emRMYjVjQktxVWoxY3pj?=
 =?utf-8?B?NmN6UGlDMHdPbmlCZjdMVzN4Y2xpZ3BlWkk5K0FYOHoyOW85cWt5MS9HQVN2?=
 =?utf-8?B?cXNCaWR2K0puMkNkQTBxem5LRWpUaVlyczcwWG9JSXF2REVPWXIwbEd5TXdM?=
 =?utf-8?B?dzBEWXY4eTZyTnpNTEtXT0xJRVFjRC82a0J6ZVp3Wmkzb0ZYQVErclZHbFVk?=
 =?utf-8?B?aGdkYzFVSzFndUhSYmRRWm9UdkxNQTRvSEpFM01QbDEzYTRVQmgvOTA4YXpp?=
 =?utf-8?B?TmRSeTM5VzVvbnZPZ1F4QWk4U0hPNXBCb0Naa2Nqbmwzd3BLZWNDdnREcEEr?=
 =?utf-8?B?azZIRGJsOGZOMk1GVHFqRkxzb3lWN1htT08vdnhxVk5tRnNhWTgxSzdpdFFi?=
 =?utf-8?B?OThDcTZsZ1RpUzlVRnRKNkZBbEEvOUJxMjV6MzFCaTZTKzMzdlVqYnlpci9v?=
 =?utf-8?B?aVpHVlpTd0NvWlRaSFdweHJkTlIwa0ppcFE1cmh0cHhNbTB6Sjl6OFlFUFJN?=
 =?utf-8?B?cWlXK3JvVEN0U2M2S0tKdlVxWStXbHZVMzk1dzdMUGxiSENXMXhObmFVZHpz?=
 =?utf-8?B?VWczT0JLYVc3L2JJbzRNd0JCQnBaLzdhNjZjQlE0R1YrS0lDb2l6a1Y2aFBY?=
 =?utf-8?B?SWZGQlU5d2k4V1hsUmxSS1hYODBBQjlHY3FBN1JTNHdQeHNDVXB2WjBlbkQ1?=
 =?utf-8?B?SkZjQ0ptN2NtaW5rdGVwZlRzUkJXckc3RXo3bG0zWFVHR09Vdy93MDJkN2sv?=
 =?utf-8?B?b21OOW52aTVVL1NpY28vL3JhTDhmSDB4RjNJc0FDR2ZMRXBqZVMyOUNBRnZS?=
 =?utf-8?B?alFTWm1lL2RaVkNLbHF2TktGdk9KNmRoVng4cE55OXlCMmFkbnlGK1YwYmNF?=
 =?utf-8?B?TWNwajJSK0VGaVBUT2JKV29tR21QWnJZcjlWaU83aXFLeXZkbG1iL0dwWXdC?=
 =?utf-8?B?bmlzYVJjQVByakpYcW1Mb0o2bnFBUldITU1KeVhvU2NvSEhrd2s2Q01hWW0w?=
 =?utf-8?B?ZXFXODZxVjFpalZnMzJRVnJvUU45QVNLM2ZWS0VRT01jbDQzL1JZZC81azAv?=
 =?utf-8?B?dCt4clZmTjROc2ZkKzBKOUpxd2EwaUtaeGxSSXJjTXVPNDlVL1dkdXZQVTFk?=
 =?utf-8?B?L0t3V0trR0NQaGJGY3VKQ2hQRjI1ekY0ODlWaHhHSFNxS2tNd1BBbloyMzNM?=
 =?utf-8?B?S3FOejhCOTJ0V2V1Z3NJbnVkdTNoc0lyMVYyRkdZb1FNYkVabHlETVNSc1Iz?=
 =?utf-8?B?eCtxeEp4MmxqRnN2YUVnNDhEeURiUWNaQmxjelF4ZStiaGlnYVI2MTJwVzJR?=
 =?utf-8?Q?gLcxCI1PAs9dypO1lJ0CZHvIg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 940eebfc-0acb-4e4b-1c2b-08daf7b1f3ce
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 11:08:10.0333 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z455t1m9e7rBThBVJNtuJ5JDhWlVdLZN3/hdLk/ZZ2oFHqbB6UmSsvD2wbRfzzbt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4357
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

Am 16.01.23 um 03:44 schrieb Ma, Jun:
> On 1/13/2023 5:37 PM, Christian König wrote:
>> Am 13.01.23 um 06:34 schrieb Ma Jun:
>>> Check the ttm_debugfs_root before creating files under it.
>>> If the ttm_debugfs_root is NULL, all the files created for
>>> ttm/ will be placed in the /sys/kerne/debug/ but not
>>> /sys/kernel/debug/ttm/
>> Well NAK for upstreaming. Why should ttm_debugfs_root be NULL here?
>>
> In my case, when the ttm/ removal fails during amdgpu uninstall and then
> we try to modprobe the amdgpu again, the ttm_debugfs_root will be NULL
> because the ttm/ already exists.

Yeah, but this is just papering over a previous bug which in turn is not 
a valid argument for a code change.

What should happen instead is that the original bug needs to get fixed.

Regards,
Christian.

>
> Regards,
> Ma Jun
>
>> Regards,
>> Christian.
>>
>>> Signed-off-by: Ma Jun <Jun.Ma2@amd.com>
>>> ---
>>>    drivers/gpu/drm/ttm/ttm_device.c |  3 ++-
>>>    drivers/gpu/drm/ttm/ttm_pool.c   | 10 ++++++----
>>>    drivers/gpu/drm/ttm/ttm_tt.c     |  5 +++--
>>>    3 files changed, 11 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
>>> index e7147e304637..967bc2244df3 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_device.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_device.c
>>> @@ -105,7 +105,8 @@ static int ttm_global_init(void)
>>>    	INIT_LIST_HEAD(&glob->device_list);
>>>    	atomic_set(&glob->bo_count, 0);
>>>    
>>> -	debugfs_create_atomic_t("buffer_objects", 0444, ttm_debugfs_root,
>>> +	if(ttm_debugfs_root)
>>> +		debugfs_create_atomic_t("buffer_objects", 0444, ttm_debugfs_root,
>>>    				&glob->bo_count);
>>>    out:
>>>    	if (ret && ttm_debugfs_root)
>>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
>>> index 21b61631f73a..d95a65f759df 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>>> @@ -713,10 +713,12 @@ int ttm_pool_mgr_init(unsigned long num_pages)
>>>    	}
>>>    
>>>    #ifdef CONFIG_DEBUG_FS
>>> -	debugfs_create_file("page_pool", 0444, ttm_debugfs_root, NULL,
>>> -			    &ttm_pool_debugfs_globals_fops);
>>> -	debugfs_create_file("page_pool_shrink", 0400, ttm_debugfs_root, NULL,
>>> -			    &ttm_pool_debugfs_shrink_fops);
>>> +	if(ttm_debugfs_root) {
>>> +		debugfs_create_file("page_pool", 0444, ttm_debugfs_root, NULL,
>>> +				    &ttm_pool_debugfs_globals_fops);
>>> +		debugfs_create_file("page_pool_shrink", 0400, ttm_debugfs_root, NULL,
>>> +				    &ttm_pool_debugfs_shrink_fops);
>>> +	}
>>>    #endif
>>>    
>>>    	mm_shrinker.count_objects = ttm_pool_shrinker_count;
>>> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
>>> index d505603930a7..fec443494ef0 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_tt.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
>>> @@ -394,8 +394,9 @@ DEFINE_SHOW_ATTRIBUTE(ttm_tt_debugfs_shrink);
>>>    void ttm_tt_mgr_init(unsigned long num_pages, unsigned long num_dma32_pages)
>>>    {
>>>    #ifdef CONFIG_DEBUG_FS
>>> -	debugfs_create_file("tt_shrink", 0400, ttm_debugfs_root, NULL,
>>> -			    &ttm_tt_debugfs_shrink_fops);
>>> +	if(ttm_debugfs_root)
>>> +		debugfs_create_file("tt_shrink", 0400, ttm_debugfs_root, NULL,
>>> +				    &ttm_tt_debugfs_shrink_fops);
>>>    #endif
>>>    
>>>    	if (!ttm_pages_limit)

