Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C39528DD9
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 21:21:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3013C10EB83;
	Mon, 16 May 2022 19:21:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2075.outbound.protection.outlook.com [40.107.244.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E7D10EC04
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 19:21:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FtSAl7ODjQk6IL0s9vNkPJxf0kyG0C1Gz8iQA/WnkkMbJtsHBWGl2mh4BCuNMcCq5UlZFC4RpotKAwWDJLPHfHnQpXQ5njaq0/gkeTiT6WaKFxOvNXw7iLrQIyILi3TNxXPvBXSj5F6gjd4gJSbjFAkfWg8LCifC7V4vIhhxFQAKcBxpgf5H07g1pJ5XsNxodQ3xQltuodx5p/3BSoQ3g006SnjMUCq96SwJ5pxNjnq4jgrYDuipE5SNi8GnL9AVElNoyc1VYLXpNNZvU4DesNIQ9lPR6p0Xf+g/niRDf4Wq0ORSWV8nReWRGBfEQ3MzlSxAE3hsOLGKvdKDQXRl6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6PX6hDR9L1rpUB+MOkMfQi2Q+XKRtuTq4VcgFYA5JcI=;
 b=CcXxXcc8dpU9NcXVGj+q51ximhsV6iz+9xum9ah9mj+9dSzoiSpJ07ecoJcBFQYXbsZ00QaL7M5E3rM95OHivRU7aMQC1LxOg09s78ATFxUO1+EXJ9VUZseCzOb7cEPVt2gFCiPumd4wlyZwoCJ1kOyvKvVg70O1TWh90bJx/VeJwzsdJTp/YQEfNYNcx7df9wFySAGynPBzOS2CCgUQabdxQBMIzr6xUzOAVp6cLgkJD7W8CNPIkZpbu0dZwqQYylMOA6nQt3Zx5kySMF2hM9AQXQ9loc1XwBov+1dhYNfY34bp8cljJRl9+kc7kBlyBwWeISFj7586jHeGjRs/tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6PX6hDR9L1rpUB+MOkMfQi2Q+XKRtuTq4VcgFYA5JcI=;
 b=dtUP5xmu83FqawCBswRp9BE2TYVy989JosWrtIi4cyMlXjc52Yf9F8zQ2jw129FlOaIbdbsNLkDrIefbhPHquIydj0iPA2FL+51AdGJSH1+BWHtT5y5XDARrjX2QJSGH41sD0vweG6lLYzxaL9/HkBuTZdlRoDkQoClYJclV8sI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SA0PR12MB4509.namprd12.prod.outlook.com (2603:10b6:806:9e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Mon, 16 May
 2022 19:21:26 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03%4]) with mapi id 15.20.5250.018; Mon, 16 May 2022
 19:21:26 +0000
Message-ID: <0875fa95-3a25-a354-1433-201fca81ed3e@amd.com>
Date: Mon, 16 May 2022 21:21:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2] dma-buf: Move sysfs work out of DMA-BUF export path
Content-Language: en-US
To: "T.J. Mercier" <tjmercier@google.com>
References: <20220516171315.2400578-1-tjmercier@google.com>
 <175c5af3-9224-9c8e-0784-349dad9a2954@amd.com>
 <CABdmKX2GcgCs1xANYPBp8OEtk9qqH7AvCzpdppj9rHXvMqWSAw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CABdmKX2GcgCs1xANYPBp8OEtk9qqH7AvCzpdppj9rHXvMqWSAw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0153.eurprd06.prod.outlook.com
 (2603:10a6:20b:45c::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5261c67-b0b3-464d-a8f2-08da37714546
X-MS-TrafficTypeDiagnostic: SA0PR12MB4509:EE_
X-Microsoft-Antispam-PRVS: <SA0PR12MB450932F0ED6CCE9ABE641FC783CF9@SA0PR12MB4509.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TThEDnqH72PjjeUUoogYQVCm1MGHRugJRqhXv8dqrbQnRhPCbltHuRKTbDS4qlWDhfS8jf6lGrTNlrRVRF2HN1qU9PKErUrJXllMI+CSqFgQQ70HHvGsURkMz/92NVV6foYHuqqwZdUByV4zAyeXCryr/h07HfDo3ftz11PccVetoYCqFucEAihdOx1jovova1O48XuZxWM6QivvSpUadUM0rbRy0exVZgujjDKHoCjJsuCeaPDh6qDFdZON8dvg22zqQJyZCwNfQrMnGEKYEU1H6fnDR+WPUwKm/tU0TN//lCkOo0jNHI1gfbiLuDhISGraioJa4bF4TA1yjdtlQobE5gW1P29VL4spz30EN9PWrtNuySEIkUqzttqa1reCuU0QrwwBCmGAaQr6YnrVN4rWIoez8FY6qJhmSa5hJbyZKwsFRICQvxjG05CgbDrH6cRWkOGavAdP5mvN4e0xLJcxMZh7AgfZVGgSFBtX9P7Mgy4vvp4Qzl3Nf2pHFosGqCk6gytetCRGE1dbPvf5awVsgol1sQdfD1YLsjd4V8QdtYH7dS8nr6oyiFYqG1C0FQrRqi/PwQ+3p2tcvCTLGjhNqo6DD2UHi3wSJuiq6OtwN6xqLBlNfNjy0XAaBJGZbzizjMmrb1yXPbUEVCZO4Vhdnt5wNyz/eZygZjEO6WiNFdkk0iLknuV5uiXA0JH2j6cYb9ilwgCNmTXvjzLgkOq+phNXYpkJKnjwWHrk76hBgw6UTbw3pr+m/vByOVlAULFg+PAo2JuDJQJXiFylWLQC8hjc3K+vomnyEnntJJ1vmDYl0k0aoYOc8H+u6sHdvIb2Y+5Qi7NFLS3hnMco/5Kag0ylxhua2mihfqUXNOQQ3O7zZ6vEz0Xn6VFqxEwZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(4326008)(26005)(8676002)(66476007)(66556008)(66946007)(31696002)(6486002)(966005)(53546011)(8936002)(508600001)(186003)(6916009)(7416002)(5660300002)(38100700002)(45080400002)(2906002)(54906003)(6666004)(6512007)(316002)(2616005)(36756003)(83380400001)(31686004)(66574015)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzEzRjhDbTdJSUY0ek1wMHgybDQxQXZ0ZDhjUkMvbll0RlNrR0twamRKZGMx?=
 =?utf-8?B?eVhubVgyRE1OOWc1R0o2S3k5T0REczM5TEN0YUk5Qit5cmRZY2VFazU5dTcw?=
 =?utf-8?B?N2t0MVdGLzFScWtPNlUreDBIcVoxZk5jZHd4NEQ3dlAyYnJZUU5adzdDenpv?=
 =?utf-8?B?YW4vcFFhb0hhN2tjUXNWaGIxTThZVDZNdHRDMm5LaEFFVDQ4clZaeUNrUGxQ?=
 =?utf-8?B?OXNpOVd6My92VHJBZTk3U1BDV0RyNlBuQjFnRHhTMzZEekFQZUlOUVM5a0Ny?=
 =?utf-8?B?L2hRT0s5U1VnNFBod1A2RHkxQldXNVFPMFJ3NnFXSG14N0I1QWN5SjdUYUlY?=
 =?utf-8?B?R2M0aWdzS25oUHI4MTIwS0Rmd3gvN0hUY0dUdC90cmRTTkttTGNpNjkxNkFo?=
 =?utf-8?B?U0tWdkp0ajhudm5MMjlCeTZ5eCtDeW0ybXU5RUhMNURTZkhRUlViWXZ1RFha?=
 =?utf-8?B?TTBZV1FPSXIxU01PWlY1L1hGZ0pMSHdyUmhvRUNLVHpaZ2JUU3puRnNRMWFi?=
 =?utf-8?B?QnF6UU8rdWl4c2c4MENncFc4WTcyZTNrZ3d1THhpbmEzbEZicnpaQnVhZU9y?=
 =?utf-8?B?ODg2R2NqS1dVNkluNDdTb2FETWZ6NUFvajc1R3Jmck9oRW1VWUdZSmNuaURx?=
 =?utf-8?B?TldDbjZxR0hWWDVWTTZIaUNsSktBY2hqQTNDV3Vtdytpb0hLUXBWNTVHWWow?=
 =?utf-8?B?dlFKeU5pVkdHTTRRTlFveWt1bCsvZk8wbjgzNVIxMjhoQUpzRmdhQnJLTk8y?=
 =?utf-8?B?TGV0aWhDcmtIK3M1SkcveVkzc05XbTRMNlliS21ic3FnOFl4R2Z0YmxoekZL?=
 =?utf-8?B?eVdtQzk2UjF4REJVV3dUbDV0SFZwWml3L0hvSXNwN2NpYlJ4bkhlSnlncmY0?=
 =?utf-8?B?bGhPc1R3NHVkOEw0M3pnanJnOHE4Z0R2R3RSaWpralZuUWVBc1ZjMkRHck5L?=
 =?utf-8?B?SjBwcit1RzVUK09ERGVIa291Q1hkK3AxTS80bUJhdW1lVjR6eDdmTU55dTdV?=
 =?utf-8?B?VnlXM3JmOE1rN3E5SkpzVnd3TEJHNlFmWFNab0hycmRlQ3owNEFzOGh6Zldl?=
 =?utf-8?B?NjFsNTJ1WnJaWmxCckhjOWZnMzA3NXVUbWkrcHl2b3lnUW5IazdGeXJOQk5H?=
 =?utf-8?B?T3JTQzl3Mmx5VndQZUYyR0tOQkhWd3VIdG5OR2I0bHRMTlU0OTNtZmlyTVYr?=
 =?utf-8?B?WGwyd0ppa2EwZXZ6QXJzdTVFcmU0UGIveU9PSDN3d0pBb2FlandMVnNHVmlZ?=
 =?utf-8?B?Vllza3MvcUp2cGU3a3BFTGNIOFNuNU1YeHJxT1pzMWkrQ2Z3OEczMDQyMnRF?=
 =?utf-8?B?amYrN1FEQ2Z3eU96c2hZZmlmVkpyWFBZUmRzbW9GcXQ2RE1XVWVob1ovNWhU?=
 =?utf-8?B?bDYyR05HR2pZd0h6NkwrOEZtMVdYR1hQblFCZ2hnZm12TmsrSytsRzMrVTFM?=
 =?utf-8?B?RFF3VGlEQ3pGdEIvMVByNUczMkt6d3lkUGR0SFNHRXhMd0N0Y1NEQ2dhVW11?=
 =?utf-8?B?MXp0RVdpV2JETXI2K25Na2xacm1QQXFZcWdvRktFUThMMUQ2OGpjM095emdE?=
 =?utf-8?B?UDhORVdXcjVoRm5XWTdtTGRleDFDOFBYRkdtNGRyV3pVbkRZYmR4L1JsWlRh?=
 =?utf-8?B?V083QjhmRHVJUkFiWm9wU2ZPazBQTDdOaENyNTRFeExkYlVaSnNUT1loSHlF?=
 =?utf-8?B?Wm1pbFVEcUlya3o3Q0FTUVpPTFdTRWNYNEJ5WHZDVnZmcWdnZUFEbzgwcUVJ?=
 =?utf-8?B?TlVnaXFHTWQ2bVVvNzdhQ1JnWTFTT3VkODJ5enQ5Rnp4ZmljYjdtcmdsZXc2?=
 =?utf-8?B?eVI1YnlpSTlRY2gxZFhTM21TSDBNb0JhRms3MUJzd0YxRHlHVFBBcUVxd0p6?=
 =?utf-8?B?ZHdkZldjeFo0RFBJNzNabFR3Um9VVFhlbEpXV013TzVyMTE2NHo3ZXR4R0Fs?=
 =?utf-8?B?SGZTRVJCMzZwYng2cDllVzlyS2pYemd6dGwwWTR5b2tQKzNDRmo2ekFBemo2?=
 =?utf-8?B?d2QxRWx0dU05eEliN0FLUnMrM1U2emZRNjB2OHZ6VVBtQ1JLL2JmVWJ5UlYv?=
 =?utf-8?B?a1BJSGF5NFZBb1IvcThLcm5TNUJIQllMOWx2cmZQUk1jdWt1Z2dwM2ZlNXNR?=
 =?utf-8?B?eGdEMVorbS9yY3lUMFhQK3hzUit1S1lKWkROSVcwZnhCRXVLaEd6cmdkcHRW?=
 =?utf-8?B?REtpQy9EMVJCY0lBME11YlBhMnJDZ1JvYXFOaWRFUVBOcVp5bE10TG1HNktD?=
 =?utf-8?B?VmhObVlCZWMycUpLZ0dtMVU0TG1qWkNHbCtCVTBXUnhoQW5TOGh2OWtVMWR3?=
 =?utf-8?B?dWVrRTU4VzFoOHZiWTFaMTdPRlcxREFIbU5ybkkrQ2dHWjMzWVZKZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5261c67-b0b3-464d-a8f2-08da37714546
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2022 19:21:26.1468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L9dA5gCVbFcHT2TKIEB+BHzrk9qrAIciuvDtm4jWDDkEaCXYQZMrjU1v4Ys+Df4H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4509
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
Cc: kernel-team@android.com, Minchan Kim <minchan@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 John Stultz <jstultz@google.com>, Kalesh Singh <kaleshsingh@google.com>,
 Hridya Valsaraju <hridya@google.com>, Greg Kroah-Hartman <gregkh@google.com>,
 Suren Baghdasaryan <surenb@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 16.05.22 um 20:08 schrieb T.J. Mercier:
> On Mon, May 16, 2022 at 10:20 AM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 16.05.22 um 19:13 schrieb T.J. Mercier:
>>> Recently, we noticed an issue where a process went into direct reclaim
>>> while holding the kernfs rw semaphore for sysfs in write (exclusive)
>>> mode. This caused processes who were doing DMA-BUF exports and releases
>>> to go into uninterruptible sleep since they needed to acquire the same
>>> semaphore for the DMA-BUF sysfs entry creation/deletion. In order to avoid
>>> blocking DMA-BUF export for an indeterminate amount of time while
>>> another process is holding the sysfs rw semaphore in exclusive mode,
>>> this patch moves the per-buffer sysfs file creation to the default work
>>> queue. Note that this can lead to a short-term inaccuracy in the dmabuf
>>> sysfs statistics, but this is a tradeoff to prevent the hot path from
>>> being blocked. A work_struct is added to dma_buf to achieve this, but as
>>> it is unioned with the kobject in the sysfs_entry, dma_buf does not
>>> increase in size.
>> I'm still not very keen of this approach as it strongly feels like we
>> are working around shortcoming somewhere else.
>>
> My read of the thread for the last version is that we're running into
> a situation where sysfs is getting used for something it wasn't
> originally intended for, but we're also stuck with this sysfs
> functionality for dmabufs.
>
>>> Fixes: bdb8d06dfefd ("dmabuf: Add the capability to expose DMA-BUF stats in sysfs")
>>> Originally-by: Hridya Valsaraju <hridya@google.com>
>>> Signed-off-by: T.J. Mercier <tjmercier@google.com>
>>>
>>> ---
>>> See the originally submitted patch by Hridya Valsaraju here:
>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flkml.org%2Flkml%2F2022%2F1%2F4%2F1066&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C794614324d114880a25508da37672e4b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637883213566903705%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=bGlA2FeubfSeL5XDHYyWMZqUXfScoCphZjjK4jrqQJs%3D&amp;reserved=0
>>>
>>> v2 changes:
>>> - Defer only sysfs creation instead of creation and teardown per
>>> Christian König
>>>
>>> - Use a work queue instead of a kthread for deferred work per
>>> Christian König
>>> ---
>>>    drivers/dma-buf/dma-buf-sysfs-stats.c | 56 ++++++++++++++++++++-------
>>>    include/linux/dma-buf.h               | 14 ++++++-
>>>    2 files changed, 54 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.c b/drivers/dma-buf/dma-buf-sysfs-stats.c
>>> index 2bba0babcb62..67b0a298291c 100644
>>> --- a/drivers/dma-buf/dma-buf-sysfs-stats.c
>>> +++ b/drivers/dma-buf/dma-buf-sysfs-stats.c
>>> @@ -11,6 +11,7 @@
>>>    #include <linux/printk.h>
>>>    #include <linux/slab.h>
>>>    #include <linux/sysfs.h>
>>> +#include <linux/workqueue.h>
>>>
>>>    #include "dma-buf-sysfs-stats.h"
>>>
>>> @@ -168,10 +169,46 @@ void dma_buf_uninit_sysfs_statistics(void)
>>>        kset_unregister(dma_buf_stats_kset);
>>>    }
>>>
>>> +static void sysfs_add_workfn(struct work_struct *work)
>>> +{
>>> +     struct dma_buf_sysfs_entry *sysfs_entry =
>>> +             container_of(work, struct dma_buf_sysfs_entry, sysfs_add_work);
>>> +     struct dma_buf *dmabuf = sysfs_entry->dmabuf;
>>> +
>>> +     /*
>>> +      * A dmabuf is ref-counted via its file member. If this handler holds the only
>>> +      * reference to the dmabuf, there is no need for sysfs kobject creation. This is an
>>> +      * optimization and a race; when the reference count drops to 1 immediately after
>>> +      * this check it is not harmful as the sysfs entry will still get cleaned up in
>>> +      * dma_buf_stats_teardown, which won't get called until the final dmabuf reference
>>> +      * is released, and that can't happen until the end of this function.
>>> +      */
>>> +     if (file_count(dmabuf->file) > 1) {
>> Please completely drop that. I see absolutely no justification for this
>> additional complexity.
>>
> This case gets hit around 5% of the time in my testing so the else is
> not a completely unused branch.

Well I can only repeat myself: This means that your userspace is 
severely broken!

DMA-buf are meant to be long living objects and when you create and 
destroy it faster than a work item can create the sysfs entries than 
there is some serious design issue here.

My suspicion is that your IOCTL to create the DMA-buf is somehow 
interrupted/aborted after it was already exported which results in it's 
immediate destruction.

Regards,
Christian.

>   It's only 3 extra lines of actual
> code. I'd prefer to keep it, but I'll remove it to reduce complexity.
> This means doing work that we know is useless some of the time, and
> adding contention for a global kernfs lock which this patch is aimed
> at avoiding (on the hot path), but at least that work is on a worker
> thread with this patch.


>
>>> +             /*
>>> +              * kobject_init_and_add expects kobject to be zero-filled, but we have populated it
>>> +              * (the sysfs_add_work union member) to trigger this work function.
>>> +              */
>>> +             memset(&dmabuf->sysfs_entry->kobj, 0, sizeof(dmabuf->sysfs_entry->kobj));
>>> +             dmabuf->sysfs_entry->kobj.kset = dma_buf_per_buffer_stats_kset;
>>> +             if (kobject_init_and_add(&dmabuf->sysfs_entry->kobj, &dma_buf_ktype, NULL,
>>> +                                             "%lu", file_inode(dmabuf->file)->i_ino)) {
>>> +                     kobject_put(&dmabuf->sysfs_entry->kobj);
>>> +                     dmabuf->sysfs_entry = NULL;
>>> +             }
>>> +     } else {
>>> +             /*
>>> +              * Free the sysfs_entry and reset the pointer so dma_buf_stats_teardown doesn't
>>> +              * attempt to operate on it.
>>> +              */
>>> +             kfree(dmabuf->sysfs_entry);
>>> +             dmabuf->sysfs_entry = NULL;
>>> +     }
>>> +     dma_buf_put(dmabuf);
>>> +}
>>> +
>>>    int dma_buf_stats_setup(struct dma_buf *dmabuf)
>>>    {
>>>        struct dma_buf_sysfs_entry *sysfs_entry;
>>> -     int ret;
>>>
>>>        if (!dmabuf || !dmabuf->file)
>>>                return -EINVAL;
>>> @@ -181,25 +218,16 @@ int dma_buf_stats_setup(struct dma_buf *dmabuf)
>>>                return -EINVAL;
>>>        }
>>>
>>> -     sysfs_entry = kzalloc(sizeof(struct dma_buf_sysfs_entry), GFP_KERNEL);
>>> +     sysfs_entry = kmalloc(sizeof(struct dma_buf_sysfs_entry), GFP_KERNEL);
>>>        if (!sysfs_entry)
>>>                return -ENOMEM;
>>>
>>> -     sysfs_entry->kobj.kset = dma_buf_per_buffer_stats_kset;
>>>        sysfs_entry->dmabuf = dmabuf;
>>> -
>>>        dmabuf->sysfs_entry = sysfs_entry;
>>>
>>> -     /* create the directory for buffer stats */
>>> -     ret = kobject_init_and_add(&sysfs_entry->kobj, &dma_buf_ktype, NULL,
>>> -                                "%lu", file_inode(dmabuf->file)->i_ino);
>>> -     if (ret)
>>> -             goto err_sysfs_dmabuf;
>>> +     INIT_WORK(&dmabuf->sysfs_entry->sysfs_add_work, sysfs_add_workfn);
>>> +     get_dma_buf(dmabuf); /* This reference will be dropped in sysfs_add_workfn. */
>>> +     schedule_work(&dmabuf->sysfs_entry->sysfs_add_work);
>>>
>>>        return 0;
>>> -
>>> -err_sysfs_dmabuf:
>>> -     kobject_put(&sysfs_entry->kobj);
>>> -     dmabuf->sysfs_entry = NULL;
>>> -     return ret;
>>>    }
>>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
>>> index 2097760e8e95..0200caa3c515 100644
>>> --- a/include/linux/dma-buf.h
>>> +++ b/include/linux/dma-buf.h
>>> @@ -22,6 +22,7 @@
>>>    #include <linux/fs.h>
>>>    #include <linux/dma-fence.h>
>>>    #include <linux/wait.h>
>>> +#include <linux/workqueue.h>
>>>
>>>    struct device;
>>>    struct dma_buf;
>>> @@ -365,7 +366,7 @@ struct dma_buf {
>>>         */
>>>        const char *name;
>>>
>>> -     /** @name_lock: Spinlock to protect name acces for read access. */
>>> +     /** @name_lock: Spinlock to protect name access for read access. */
>>>        spinlock_t name_lock;
>>>
>>>        /**
>>> @@ -441,6 +442,7 @@ struct dma_buf {
>>>
>>>                __poll_t active;
>>>        } cb_in, cb_out;
>>> +
>> Those changes are unrelated.
>>
> I included it here because I thought it was bad form to submit a
> typo-only patch. Will remove.
>
>
>
>
>> Regards,
>> Christian.
>>
>>>    #ifdef CONFIG_DMABUF_SYSFS_STATS
>>>        /**
>>>         * @sysfs_entry:
>>> @@ -449,7 +451,15 @@ struct dma_buf {
>>>         * `DMA-BUF statistics`_ for the uapi this enables.
>>>         */
>>>        struct dma_buf_sysfs_entry {
>>> -             struct kobject kobj;
>>> +             union {
>>> +                     struct kobject kobj;
>>> +
>>> +                     /** @sysfs_add_work:
>>> +                      *
>>> +                      * For deferred sysfs kobject creation using a workqueue.
>>> +                      */
>>> +                     struct work_struct sysfs_add_work;
>>> +             };
>>>                struct dma_buf *dmabuf;
>>>        } *sysfs_entry;
>>>    #endif

