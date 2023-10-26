Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF90D7D87DB
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 19:55:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA65810E837;
	Thu, 26 Oct 2023 17:55:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2089.outbound.protection.outlook.com [40.107.243.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7627110E837
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 17:55:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=da9buI6qSEbaw6lepSZeBc7yUNbvPIGL3B0IKMJobdsqCFsAORg5S7uEhSqj4uLNcNP4hrI7/lj5hDWnl+U7L5gtgj0Urm+BbgoRSLG9EglcwYDaw2IwaS+1Vgj00+TgdkqhrLjdSKn3eLZMYYBCaVhpqSMB5r1tJvgTishO5Hnsk6Reyu+xH4FRd9LQaoXDwGSH7f+2/ha1GCXTJKdNPFPug2coAArejNCtDo4GwPGm4pSUhTDUkqths6plFf3ZbsGnCHyidYI9jpXtGHnKgkCv5KoZlexwuW2LoyNwhBeh0Nd0/GqnqrvcGYrVeYFYmo9d+TGtonlJBuYfgc3odw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=REWCmfCeXYK9WarwqhCO3d8MMjeGGCoNrLn3N9mrhZg=;
 b=ZV0HmQfSM4QXsGkPH7DuzAaIxeBibrBkL/Dsm4aVHTCtDrusuYeQW4FP/4cRTJh5A1ZLq819AIAP+MPLMH8dP0PJCQzvDK4yehc4o7WGCPtX0L2PXABklzQrpaMD3nhLGjH0yTC+xNXMl30ozgkrdP5JdrrBA0swADxx89juKkdRmuajw+BlxvQxe3avtxWRpiaVmpPoCpgvQeFWacGKdyXLm1iHvaK1Y4j9PN9KEwZBBtmJw8O1qMrNuKRTDhzo5bclFbIi+7P/NppqsVagzdocPhLtsr3bVZ4CkVrrteIdN2BpiDPWEJlayX0cuVeu5wjmvUfWAjVOiCQl43331Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=REWCmfCeXYK9WarwqhCO3d8MMjeGGCoNrLn3N9mrhZg=;
 b=B0XKBdm0TviiAhb5BqlGAUtC1wL/h6FUHn/r7oVgEa63iJq7cCgJlxkIF+P98yWSPKvEC6AqVvYaZ6aoPSqfwiM8DLAvfHlEXgc/rbXvkGbwYUHXON2N5hc06k5H3HQB/kmalLlxH45m8UpKC/Z4Wq3+vXMB/6w7qTNEjRQbUaFMXDcyCi826u3l6rD5kcoEur1FXgs9H9ZlILMCa/71684mt9/uxAg8Bw03g+rq9nJn3R8/KYGwETjhSL2e4vBTaF8n/XwfhZb4HhBvmmI3HXIuyATY9p9YIt1T0bGUa+vxz+3XTuWxuYbdZNpDz4PA+rTxgqIls45vuR9YgwyUsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH0PR12MB5122.namprd12.prod.outlook.com (2603:10b6:610:bd::12)
 by SN7PR12MB7201.namprd12.prod.outlook.com (2603:10b6:806:2a8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.22; Thu, 26 Oct
 2023 17:55:42 +0000
Received: from CH0PR12MB5122.namprd12.prod.outlook.com
 ([fe80::521a:c84:2eee:dd87]) by CH0PR12MB5122.namprd12.prod.outlook.com
 ([fe80::521a:c84:2eee:dd87%6]) with mapi id 15.20.6907.032; Thu, 26 Oct 2023
 17:55:42 +0000
Message-ID: <a42f1e8d-2c9a-4511-ba10-64f494ba6920@nvidia.com>
Date: Thu, 26 Oct 2023 10:55:39 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/syncobj: fix DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE
Content-Language: en-US
To: dri-devel@lists.freedesktop.org
References: <1fac96f1-2f3f-f9f9-4eb0-340f27a8f6c0@nvidia.com>
From: Erik Kurzinger <ekurzinger@nvidia.com>
In-Reply-To: <1fac96f1-2f3f-f9f9-4eb0-340f27a8f6c0@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0118.namprd03.prod.outlook.com
 (2603:10b6:a03:333::33) To CH0PR12MB5122.namprd12.prod.outlook.com
 (2603:10b6:610:bd::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR12MB5122:EE_|SN7PR12MB7201:EE_
X-MS-Office365-Filtering-Correlation-Id: 122790d0-edc2-4130-b11b-08dbd64cc4fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U6+/zH4ZqXUIkFNyrZk8/4xNA7kN0ipWKsrLsIoy2CRYPjMaBVwOKVVE7vefobUkS2g/+ONtRXPbxCXXfuJHrRqjOl//TSOTzmlR5vxAT6J2HJV/Kh9TDQ5/fNLJ2q9gca4nRgDeOalZXytU+ComWy3Ik9DBWaKmh0rH5fMr7FFTWJc+ct48PRLk09yCOuS8echDOREn0nP4rbTR8+57hjjjJQ58sA06QY7eeWzq6n82j42e6DJ3RyLGEs6tDYTwnzHmLwCVsC8/7eiluj2OJd83HfeN48CT6AnHEeK4MjPpVYPDGiIGZeea3Ek/BVhi2mzHCEiP/gxRCGWWj6Z4ftybNDBjmDI6BjVykGeae7tZpsWrwAFiDEL1OIEvoPJykiQg4rriq0JGJXnpldjgpwL08xV/5v/VfeVBq6339QSdAI0wZfbpn7mxokcMAzjZEdBn1kl0OqEAlCh1aQ3roe1gc+dSYZddmmyI3n+3kG9Q7UUEEEDGGe/Jhi6o6mwCdS28i7w+aKl/6T+I2BPjrYh50grgaL5uCUApp5wrPTQWO5zpjwmSu/k/gF4f4AHxc8rAS7V3OFBqwOpy6IiOBKbZ0nTXuMViMtkMJRFBu7rkXt2pmtAD4pPrs/vrBE7NBguZHBozZsdTGunkePaBPOkdN835csuGdsyDs+8kIMD5XmTTkX3tYm/c7cOquPGX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5122.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(136003)(39860400002)(396003)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(36756003)(31696002)(86362001)(26005)(2616005)(6512007)(53546011)(6506007)(6666004)(38100700002)(83380400001)(316002)(2906002)(478600001)(966005)(6486002)(8936002)(8676002)(41300700001)(6916009)(66476007)(66946007)(66556008)(5660300002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2VhR3VvbEdDclRiUHNSL1laR1hlZU5NVmNmNktaMnRzVmdGMkl2K002am1W?=
 =?utf-8?B?YUdiN3VUYXFUSmZsR3Zpeml3ZitzdDJDNnFKNDErbERPMFMvMzBlNndpSkJ6?=
 =?utf-8?B?VnBWZkJhNjA3d3VDNGptaFZGUUJmbERHNHA2MnhPMHgvVjZZdkNPZk9yNTRx?=
 =?utf-8?B?THNNZ2tCT0hzTWF5STI5VmhLTTVqQjlpRFpCaXN3akxRcDBObWtiM0FTSjls?=
 =?utf-8?B?REh2UWViRDRTb3FBalBLZlRzUlBDZUlUSmdkdTdVNVNqNTYrU3ZjTjdmVllP?=
 =?utf-8?B?NWI5RGxYSzlFNnczcXJXTS9qZmRJcGVhVFBDQ3lZSVUyOE1MWHpOVWUvd1pa?=
 =?utf-8?B?Nmpjbmg2UjJ5YXEvUkpxaDAyZWZSdHVyUkpLNUtFNy8vSU9VWUZaa3B5SDc2?=
 =?utf-8?B?ZU5hejJ6bEplTFZTRHhPRFVKY0cyTTNXUld0OEVXOGNNdWRmVXNqNGFLcjds?=
 =?utf-8?B?OXg5UWJOMVVwVkN1QjZtYmlkZmp1OGYvNTkwSEJseUlscUpmb3dZSGFpSGsw?=
 =?utf-8?B?Z2NmYmc2WUpQLzB0Q0tNNWdsOEFSVFA2blNWdDlPNTRzYnNPM3ErK1BrTndj?=
 =?utf-8?B?Q1FpcmVZTGFRUmN1ZkhhSUw4Z1NMWUFSWGNPYnorRm1WcUJHNzVzMnlXQS9j?=
 =?utf-8?B?VDBWdjhJSDR6dlJxVENORW1zRlgrWE9zZWZ5cHFlNGFSSHd0UnhOWFc3UjM2?=
 =?utf-8?B?ZHQrSDFCaHFHRnFiMDIwS1RQMStUaVZGTk1ZRWZJd000YTdqaUxFZFNyMGs0?=
 =?utf-8?B?LzJGemxZa3NpQXNmR1gzVDNnM2VhSDBXRjJiaEYzM2lnOFpKOG9JRXJONldG?=
 =?utf-8?B?dGtPZHMrMFkyREVDZ3BvL1JIbUNTTFVqYUkwTW1ka3FGd3lSbWJqSmFVRi9P?=
 =?utf-8?B?T1Qrd2NadjdPR3NMWlFnOFJwRlRyQzZxYWJFcURSR3FMTmw5NG11aFNVWW5j?=
 =?utf-8?B?ci9OR3h4aEhTV2l0UkZhS3RaNG1yc3NEc0J0RUZXV05CTDVmQUtnZzR3cVNU?=
 =?utf-8?B?UEU0bktUdmxFL1c1Qk5WUDVpVmJ1YUprVFZoRUJWVE8wWXduYjVmK2RNQmls?=
 =?utf-8?B?YWZDaVNuQmE4aGRZUWRJSllmeEMwbXlvNmdrcmdmUHYxd0ZNcWV4VDkzNTd0?=
 =?utf-8?B?MStzckVNYUM1ek5LZGQzS0ROMXkwemRSaThSbmxlT3N6MkhqbWRPc2g5VFlz?=
 =?utf-8?B?MGs0L0h1MEs3QktXbFFwM280QU9sQjJuakRNQjhmL0hpWlVyNVNOSDdmNGdL?=
 =?utf-8?B?Y1hnMVdaOHlOQnBESEhtUVNuckFvRkFIaXdYQytVL0RuZEpHZlJWbSs1aVBz?=
 =?utf-8?B?MFo0d1VvMlo4V093U0I4OEp2VXR2c2JWSjBBVElMNnVLeTNValRIbDhrT25P?=
 =?utf-8?B?djJJOHBMSDRHV0NydTN6cmFHcjRYODhOVk1Vb3FlUW9JY3Z0NmdpRDRFWHRS?=
 =?utf-8?B?YUdmdnFJVTAwUXVXYTl3YjZ1eGJKQW5kWGdFbm9qcHBRaDcvUHJvUlFNUUVD?=
 =?utf-8?B?V3Y3b1ZEdWllK1ZXZVI2RHZOOFphZTF5eWI2TDFRREc5TDFpeXBXZEtLM0RW?=
 =?utf-8?B?S0o4SW1pSXlab0dHeTN6Um05UW1pYzZhNWVNUGdteUhOaVdkeDZYVjRLY0pC?=
 =?utf-8?B?WTZsQURiaDNmQXZnV2paMGFJcXpnRGZoRm9mK3Zialg0SlF6bEYyQy8renh2?=
 =?utf-8?B?U0x0Z2tkU2JqbCtFamNPY0VlUWU5SkJUeWZzUnZ3NjIxNnY1RXhyakcxSkFH?=
 =?utf-8?B?TlZIUk5iM09MR3k4ZDJhN0JCZXl3Zis3N3pacWJPa2xCdmtKOWd0MDgrTEox?=
 =?utf-8?B?SHF5OXE2SGI1ek9qK21DUC9uWlRBU1NRbWtSRzJ3V3BMOERQVWU1RzJWajAv?=
 =?utf-8?B?Ujh0UlcrZ3ErNjNjZjVhbXNMK0tpNzFSaVBHZFF1NlNPYmU0NzNDaEpEbDRp?=
 =?utf-8?B?Ni9iaVJlamNNUlNjZUkydnIrdFBlUzdSeGEyejNjV2F1YytJek9yY0Z6cGE5?=
 =?utf-8?B?M3VRRWtuSjlVZU5BZk9OK0pqSXEyRkRxMW1FMUI5WFhVaTVUb2V0UU5TeVQ2?=
 =?utf-8?B?N29TcU9VSnRDakFjRzdvbUc1UzJRRDB5WVZpeHlwS0dzRVVyZEExRklpR0Ju?=
 =?utf-8?Q?dHuAG0mzzOrfRuf+WKCYucLy9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 122790d0-edc2-4130-b11b-08dbd64cc4fc
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5122.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 17:55:41.9918 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nT/MbXLAoddnBura+G1ZumzHYmTP1O0buZpwG+CjBmA3AHEmbDBripjT6/1CFhXZGKL+5VOWgZ9A6THKMoz9Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7201
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

Is there anything else needed for this fix to be merged? I have shared an accompanying patch for the IGT test suite here https://lists.freedesktop.org/archives/igt-dev/2023-August/060154.html

On 8/16/23 09:26, Erik Kurzinger wrote:
> If DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT is invoked with the
> DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE flag set but no fence has yet been
> submitted for the given timeline point the call will fail immediately
> with EINVAL. This does not match the intended behavior where the call
> should wait until the fence has been submitted (or the timeout expires).
> 
> The following small example program illustrates the issue. It should
> wait for 5 seconds and then print ETIME, but instead it terminates right
> away after printing EINVAL.
> 
>   #include <stdio.h>
>   #include <fcntl.h>
>   #include <time.h>
>   #include <errno.h>
>   #include <xf86drm.h>
>   int main(void)
>   {
>       int fd = open("/dev/dri/card0", O_RDWR);
>       uint32_t syncobj;
>       drmSyncobjCreate(fd, 0, &syncobj);
>       struct timespec ts;
>       clock_gettime(CLOCK_MONOTONIC, &ts);
>       uint64_t point = 1;
>       if (drmSyncobjTimelineWait(fd, &syncobj, &point, 1,
>                                  ts.tv_sec * 1000000000 + ts.tv_nsec + 5000000000, // 5s
>                                  DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE, NULL)) {
>           printf("drmSyncobjTimelineWait failed %d\n", errno);
>       }
>   }
> 
> Fixes: 01d6c3578379 ("drm/syncobj: add support for timeline point wait v8")
> Signed-off-by: Erik Kurzinger <ekurzinger@nvidia.com>
> Reviewed by: Simon Ser <contact@emersion.fd>
> ---
>  drivers/gpu/drm/drm_syncobj.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index add45001e939..a8e6b61a188c 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -1087,7 +1087,8 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
>  		fence = drm_syncobj_fence_get(syncobjs[i]);
>  		if (!fence || dma_fence_chain_find_seqno(&fence, points[i])) {
>  			dma_fence_put(fence);
> -			if (flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT) {
> +			if (flags & (DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT |
> +				     DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE)) {
>  				continue;
>  			} else {
>  				timeout = -EINVAL;

