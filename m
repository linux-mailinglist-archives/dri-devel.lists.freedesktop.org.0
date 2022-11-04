Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 720BC6191A8
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 08:16:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B493E10E6FA;
	Fri,  4 Nov 2022 07:16:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2059.outbound.protection.outlook.com [40.107.220.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86E3310E6EA
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 07:16:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fEEiUEnQtkJ7xm0pRQI9Civ8oahu6f2WFmN2RxaHWIcIjMGORlRDKPNkjxXMMzLciIPHH8JtWgHAflCOb8J5VsjAWthPYyVczouy45NZku7ckPeHcezASms1vxBHm0TIKl/y2mOANALDZEm9Uz2faEJo4jn8Esbk5+4f/p/WKCmfWG7BDOdWw9cnrIdI5JIG+2J+zlW0VkGkqW+0t1qFpvcZrOuz2dmrDc8fX0ikfVEpBdGq4DZgD1xuAzCcpyWcSn2TdjbuLX+gW2M1VKg7G4l/MvPC+E7lfN9GzZloiYnbt5zyIsKXvwhEkUzo3qmblk0Qh4Wv3H7sHs5Pc/uv1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TXhNyRBaZTa/C9vLIsGWsT/MfokGSvA3sN1IzjGeDa0=;
 b=nTzmhAR71WIzsnknzV1gV3tyQ/WL0kudwAJEGRPh7M9t/fWiNIcWnmisturRo9nt8V5CKs8cTb4L2aNDg2vYhsX7PN4Q7ybXv2LX9hruduiWQPNeCaQkz8uDmMokkm60RTc114GswLAmRoYDrfN/Q/3IEdEg6TTMPADoCbIGi8XuobD/iMO9+xbhSUMz8M/Ithwq47ppiNhz5jfuOH1hVWzMheXdNV2WfrSgyJD5C1dWgvlGr3zBhLf8zlRqHqFlEw0dpUBOn5bAppj7T041jIScPkJ7/mqVUVc1ygZeYWFbU51Yi3/yuPPJFsJVJWLCqvR7v0G72GeTYyXn3hiIBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TXhNyRBaZTa/C9vLIsGWsT/MfokGSvA3sN1IzjGeDa0=;
 b=AveR1RJD/OxpH2E3DOLQ4aalWG7VmoLF1Y3mnrcBxI3avR2xywwfq9WRTwVd0q3CsvM4zTMVGTvX7QWXmOa5GmjIiICPXE8lIz0g2D5DqUMwyERNllt8qgYjR0K70lQY0SSIQCMfWWqEq4eVI76gF7MKLYbwQbqbpPqVlKc0PH0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY8PR12MB7313.namprd12.prod.outlook.com (2603:10b6:930:53::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Fri, 4 Nov
 2022 07:16:00 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421%7]) with mapi id 15.20.5791.020; Fri, 4 Nov 2022
 07:16:00 +0000
Message-ID: <d916e29d-d098-c3f3-940a-37be6772ecb5@amd.com>
Date: Fri, 4 Nov 2022 08:15:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [RFC][PATCH v3 12/33] timers: dma-buf: Use timer_shutdown_sync()
 before freeing timer
Content-Language: en-US
To: Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org
References: <20221104054053.431922658@goodmis.org>
 <20221104054914.085569465@goodmis.org>
 <20221104015444.57f73efb@rorschach.local.home>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20221104015444.57f73efb@rorschach.local.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PAZP264CA0188.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:236::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CY8PR12MB7313:EE_
X-MS-Office365-Filtering-Correlation-Id: ef7c8681-3113-408e-b74e-08dabe346ce6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oqHmCBG2R4oH4/GN1E52N2Wb/VwSAmjqMYlO//M6llZB9lth528OvmkR2RFzE4OKlnzQUlF+/fuL7zOnMzkHgtuXhiyNWeyQK5Pdghr3DuKrmMlxm+Yc4+5GmWiJDJbIyrwYovqyzWS2RRIGzEgIef4GjDOQO83OlMFmldURQQqDB1KlF7PloBlgH3iXwTKH6t5o+XqBWOfp9bZ5h8xkvmFO2EFwQj2atjdfoWjS5qzY++dbXIltyfJkkZMbxRsZT7g4Xe6O48eG1coTmejzqzt6O36AkI3ENPhoobxX8t5aYEWSzWWJmH3sT/L0NyYEpxl6KJhTF2oCa5q4K+bcdIMVdnJF+ZdCR1gRpK1AlqDW7fyGkW9j/djnBJFL5Pv0Xz/vlbVZa27SoaNcH/K2DaczrSaWrkOdwri3P5c5s3lIb/1mPMzbgqp91v39fxsdPj9X3Lc5S3vIc9CUyoHjsv2KcMAhAD7deDtH2RpnB8WupYQpfww80Ces59KOmn0kEhuoawzFFqbmJ5KhSn1g9Bw26v8EbiyGyZ8s1rRy1hZ1ox+vhBn8+lFEOp/e9slumeT9MGjvYkBafPPcibNwpUpexEE1lEz57dIcOp9AQdhiuKhsBAM2JWpLrc7sO3GSToco9bATeSSphs3GJLtYjyRYU3Yxsz10Ap4apij2iVV/iMVe3AhQqryHVo+miqn7BDNIV24XteHuBXtuaESKRS1NwJlsMqKczIYRrtDJkxp50ioqRnoZ6GjyhM4uQE/gRt/h1bvELPeZMSZ4MmLTCj59BhvVbw46wLzYDO+fPv6A6804uhC3qB8p4EbsW5Qr+yfZ2hZuoTEaL4SWs2/6qw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(396003)(376002)(366004)(39860400002)(346002)(451199015)(36756003)(45080400002)(2906002)(186003)(66556008)(66574015)(66476007)(6666004)(7416002)(478600001)(83380400001)(86362001)(6486002)(54906003)(41300700001)(5660300002)(316002)(966005)(8936002)(31696002)(31686004)(38100700002)(6512007)(8676002)(6506007)(66946007)(2616005)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXRQRDZjZE1LdW4rUEdadHdrYS9qK0lnQnh1QUU2Ujc1TCsycyttaGovR0Vr?=
 =?utf-8?B?MkNGRk1oUGFUdmVnUEw1emVoUEtvR2hKWmRSOGMrQjhldzhJVm5YS2krMkJ4?=
 =?utf-8?B?S1dzNk1UZXZldk1HMVBzU1VaOGt2UXR1Ti90ckVQNmNNendlS3Z3MUU0Zk0v?=
 =?utf-8?B?RGRmQUtoSytvdWJndjV3dEVVQ0FTb28xa0NsdXdmQ1Q5VzF2K2dJU0llWmZu?=
 =?utf-8?B?SndKRTRhT25FY1diTzhKR0FJeU0zV3BvNEJHZnhZSWJKbWtmNkNReE15d1FR?=
 =?utf-8?B?N0VxUm1OSnNHQWxLMExqSG9EUmxFWTZrWkpHcHlRbkJ5cnhYcmcrc0JzSG5s?=
 =?utf-8?B?Vmt1VWlQSFVFM0t2NWRBUHFtdk4wTlYreXJqOWxwcHNONmNVbkxqM2J6ZU0v?=
 =?utf-8?B?RC9jbGRBSERBOXlramYxL3YzZFVlVnZ4cERQc1B4SUhmTzdoenlpWGF1NWJX?=
 =?utf-8?B?Sloyd3ZlMmZCZGhnbE1SUjc1QUZMZWpQOXhoYTNHOHlyUGhVOGd2amZITE9y?=
 =?utf-8?B?aDYwYkR1bHArRFpETW1ZdFF6cWtBcDJkOFIzTWw4bmppM3hqbDZGTGgxdDVW?=
 =?utf-8?B?SGlLak9xb0xWcXNWSFBUUitKbjljUW93NC9BcFdaVTZnR1ljeXJKWmZMVTQ4?=
 =?utf-8?B?ODdxWXU3bURLcmdQd1ZLK2tZbTZYRW9EUnJKRnpUZnlvWnRPYjRZcTdOQkc4?=
 =?utf-8?B?RVBXTjNsRWg4TGozRFhsSWYwVUFKbmFmSkpQTW1LSVBSMkJuTklGZ1BIejhC?=
 =?utf-8?B?RzcvTEFjNWhmSUdCZk91Tm5ERlBody9Fb3dqODhKc0VoQWMyQWlMenQwVFlY?=
 =?utf-8?B?aDBmd0UxUUlKbHBlUGwvWng2YVdxNVJJWGhZTklWTHd5c2lQclFPa1lmaFh2?=
 =?utf-8?B?aUIyYVpGS25aREZOTmxKVStRdGUxbllQZFFsVjBtNWFweHFNTG95N2ZXNFZR?=
 =?utf-8?B?UVRhOWZtOU12SDRoU2tkbjc3K0U3b0RnZ2RvRTErMnUwNVhCRjJMNGNBeVI5?=
 =?utf-8?B?U3NFQ1MyMjc1YlgzZU91cG4yQlpQbFJTYTdHOVp4N040Sy9TWW5nUkhxRHVm?=
 =?utf-8?B?UnAwYWcrYkxKbUFqRG1rMGw2eklrYnpQamVxTUJEeEFNMkJkWTd5ZWx6Y3dx?=
 =?utf-8?B?VVpPUU8vL1A1VUpTNXFkRVJseU5JbXRQNHhHbXkvRzBOdnhVRVJFZkFGcTRF?=
 =?utf-8?B?OHN3UEFUV3BGaTBvNGhEdkpzSHNKMTBwRHFjSWEybnBiNjdWSGprUFRnb1Rp?=
 =?utf-8?B?eXB3ZW9US0tyYzVRdlp5dmdmcnN4cW9iNVVSbDVKV2o2R0l5WXR1dlBXVnB4?=
 =?utf-8?B?S2dHR1BoL0RwVTVPMU9TVHpmNHNhcUk5WjJQQ3NIaWdWd3RrNTdLeGJTWjBH?=
 =?utf-8?B?RjFqeWVIbWMyVXhROElCb2dPME8xdm1Qay9GajRSQXE0VFBZNm92VVJ5K2ZR?=
 =?utf-8?B?Sjh0K2tJVWwzQzNsTnlrQmo4elZkMDhZYjF6dm1BdFVJRm5kN3czNWQ0bDls?=
 =?utf-8?B?ZVpsLzYxaGlVekJ3K3ZwRVlXZWFWRkRNVkNIZUZUOGg4eTZZWFBBVmxBNGdY?=
 =?utf-8?B?WUQ4akloT2pFaHBMQW4vZ3ZiZXlVNmwvTHkwUnM3MVpidkVkOVM4ZlRBb1lL?=
 =?utf-8?B?WEpyd08xSEhPV3l6SVBjNEtXUlpQbGRrWXVoVHFYRVRkb3pxNjJSUEVoU0NG?=
 =?utf-8?B?eEVRV0RZc05WblJGOEx1dUNvelZNTnRQemJNZlBqZ21LRkFLWHM2QnZBQWt5?=
 =?utf-8?B?M2RicDNKdlB6RzdFNmp3VnJ5QkQzNDBVbGV1YmNBZ3hKcEQyYU41cVQyNFRX?=
 =?utf-8?B?djl1a2tvWVoySmVNNDZ2bDBITEpIajlsQ1owRXdEK2NGVFZnMEM3YnFJN3dL?=
 =?utf-8?B?cGZnUGllemRTWnRhSVBqRnNDZ1gxWWNMc1RFZEFjKzdNZEtjaTRISGRzdTh6?=
 =?utf-8?B?Um5FdHFyampoNU9aU2c2SHF5WFRqZ25tNzFSTFR2SXZFTlJXVy9oNTM4OXZW?=
 =?utf-8?B?WFcyS3VUVmhjcmozS05QdmlPM3dLazFXMEhxRW9CcndPbjhqMTlRTjVmMEw2?=
 =?utf-8?B?RHhMQThEL1NQVVpESTRoZUN2eWU0VGdnNWhkQ1FuQWRTYWk4MG9xTDNIeFhy?=
 =?utf-8?B?ZXk4Nkk5WG93bkRrTTVpNG1SMFlqaGI2Y0k5Y2tKS25NVG50WWsvSkN3ODhD?=
 =?utf-8?Q?ncFWzBpSJ3JG9/Jl44Q/fwoP+TFr4XJ6NI6QHK92hPAx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef7c8681-3113-408e-b74e-08dabe346ce6
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 07:16:00.3638 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +dcXcbWYGOQ8ul8fe3ZuZT5sdNvF+fchI5W6rGHiwUsLifaD2ckwjYKzvqmLkWnI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7313
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
Cc: Stephen Boyd <sboyd@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org, Thomas Gleixner <tglx@linutronix.de>,
 Anna-Maria Gleixner <anna-maria@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck <linux@roeck-us.net>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 04.11.22 um 06:54 schrieb Steven Rostedt:
> [ Once again, quilt fails the MIME coding ]
>
> From: "Steven Rostedt (Google)" <rostedt@goodmis.org>
>
> Before a timer is freed, timer_shutdown_sync() must be called.
>
> Link: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2F20220407161745.7d6754b3%40gandalf.local.home%2F&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7Ca18ff1d0a7e442a1283808dabe29148d%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638031380931371691%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=XZgwOy0u20L1AxOjhUpWICodbSn2VYhh6YGSykjUegQ%3D&amp;reserved=0
>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> ---
>   drivers/dma-buf/st-dma-fence.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/st-dma-fence.c b/drivers/dma-buf/st-dma-fence.c
> index fb6e0a6ae2c9..5d3e7b503501 100644
> --- a/drivers/dma-buf/st-dma-fence.c
> +++ b/drivers/dma-buf/st-dma-fence.c
> @@ -412,7 +412,7 @@ static int test_wait_timeout(void *arg)
>   
>   	err = 0;
>   err_free:
> -	del_timer_sync(&wt.timer);
> +	timer_shutdown_sync(&wt.timer);

Mhm, what exactly is the benefit of renaming the function?

Not that I'm against the change, but my thinking is more if there are 
more functions which don't re-arm the time than those which do that then 
why not forbid it in general?

Regards,
Christian.

>   	destroy_timer_on_stack(&wt.timer);
>   	dma_fence_signal(wt.f);
>   	dma_fence_put(wt.f);

