Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1BD4861B9
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 09:59:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE7A3113C01;
	Thu,  6 Jan 2022 08:59:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2056.outbound.protection.outlook.com [40.107.244.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01A5D113BFD
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 08:59:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jGFn3l+OPRHmWjc0rwTPaEQ/8tBioREW76GtaD2lrclADNjVALWkoO6+yGErRORl9cr6y2k8owLDK0SUjEaJie2FYj/jf2vevF9unK6GuccoXKQWk9oL135L/3EkkKQQakHk2zzftbPAbVRDgeZjd2XcfPLAcFRJ+y1j75xYbzxlE4PHDu/sGrKhjyP+hMDzdIeVghPsNsdWM4NtztA14Ajv/yz8DNyNH/IfhkSiVnCkudczGOMTyFRUJVv/BzDOUSLa0vY1xLLAQKFgzsudJydsInKC7CFJ5+HpPvUbfyWk3hSffHhbomyM+Z5qhyMX4ARZYjmb4T/jczhJ8wV4mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wh2Q95/gCGwsaly/z7MQYBgtsSSQxaaotYJv5Ll5c64=;
 b=M5Y+RQXyaIH3tjBWB3IO+39F8xefyZ7aEjlZor4rnTtrVBxmI113pDOQ2z5knSX+bDgPFVwnpPSFaK+v9bkYld8qOFSWughrM8NpadV4u5MfXV4hybGVw+MTYM1tdp4ivPAOhrmvrb7FYAWWKbZ4KYn47t7WDTfCoKg9hKVNWYlW+UnD9iw7Dk1Uq8YU3dwbo/WHGJpTzaquGmgDS6E1VARkjs4A48bnqt//ZDFk66++88w/LNUV/Hebv4eaAHtjRZiUOQjAu4pD4H5vLazEW/AnMj8GgLOdhUcY5oOjOn4aUiU2csiKvHaRYbuF/RYTbeBc1WUvEK15CiNMOApAqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wh2Q95/gCGwsaly/z7MQYBgtsSSQxaaotYJv5Ll5c64=;
 b=jdmEEi82BIxlPrH+qH4BaU02F/DwakAUAcD0YYg2FWIBbcWY+LhosdxP7uaQrfEDj0OUM3Ye0sEAWzi8nMMvLn/68FRhQKQpPlvScO9NzxT1+bGt9w5HzDVhGVCUJOJY7mlccKF+uNsoHngOm3OTBBjMq5AqS9qel/TNDZUflTY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR1201MB0110.namprd12.prod.outlook.com
 (2603:10b6:301:56::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Thu, 6 Jan
 2022 08:59:18 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::b4d6:f148:3798:6246]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::b4d6:f148:3798:6246%7]) with mapi id 15.20.4867.009; Thu, 6 Jan 2022
 08:59:18 +0000
Subject: Re: [PATCH] dma-buf: Move sysfs work out of DMA-BUF export/release
 path
To: Hridya Valsaraju <hridya@google.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20220104235148.21320-1-hridya@google.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <49b29081-42df-ffcd-8fea-bd819499ff1b@amd.com>
Date: Thu, 6 Jan 2022 09:59:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20220104235148.21320-1-hridya@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AS8PR04CA0017.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::22) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0779a5d4-a50d-4942-dacc-08d9d0f2d210
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0110:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0110F48D973011336A9EB8B5834C9@MWHPR1201MB0110.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5GqDfjFeDyqEchVXn3g/ItE2nXwEtnEq6K9D5pW5aHf3iezbYKD+2njm/neFnOPkz+6zg9ODzRxuwfpX4juuCa5c2p4YXqxI2iFrwAdi/DfjWh6vj22JZjjrok19Hs+MArzhaGe1gbTXvID5ArGTkZVsVUSJbCDbvMRys04Zzt3ejPCTz75Gg9g4xlKl80gbE1DL1B6rIK4uegNDfTZPs9ia1zB6BtEv26y7pU/59Pkitje0xP9kBQop7b2z6Ovu+Lz5OO9E6AkEcQ6YDN+qzGmkjfWQTwZLRHvMu5PfkVmOzEu+fjqZPV32qFBXbF0N6V2922M1hlIQm9G+NZS5XbsuLwvojE8rYYWhsSl8+RIl5rJuWaFUMv0XMZXzdDKE4T0TNd3CAaRyhAX4ymDXDPhDy8k+8FXz+4phglnH2B1TaOJnWfk5JcuFxkbMZKcUyok+DNdHHxgt2J2DFI2Hx05C/mqQAEFHgHG0KsmpCM/2/vuVqYIQC8D2jPIBPMEvO6TPWxRs8Hy5NVo7Uh9A1A5Fef9RZd8WBBSfMgIR98pXhmWTuVSfMq+rKEIAZl44LXnJExmpvcd/JZU3ExarQL8Gp8SXqO8E8PrB3AINB6LeiQmQZm6qayPOyewPq5ejIrg5oXoGI1qgtOFxlt0RcBnlK+b/0SYQTnv2yOmDzMUXYYPBGJiM3Hls0g8JZ4Kqkq3TKyPyssihuTc68QTCwP7JQG8uWmEGUghIXj6oQGE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6512007)(66946007)(4326008)(30864003)(26005)(86362001)(36756003)(5660300002)(2906002)(6666004)(66556008)(66476007)(31686004)(316002)(2616005)(6506007)(186003)(83380400001)(38100700002)(31696002)(8676002)(8936002)(508600001)(110136005)(6486002)(7416002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjBaNmMrZVFROWNjVXkxcm1zQVNreG1QMStkVmR0YXdOa2xjckwvUWRMQW9S?=
 =?utf-8?B?U3NLYm02SVk4ZUV2TytSM1pqMHB0OUNZbVl1bkJiek95SUs3TjJKV2VOZCt6?=
 =?utf-8?B?T1VxbXNmeXRDUDZXbjhXaENjT29TcDdmNXZ2czRybUo3bTN1dHNFYjV1akQw?=
 =?utf-8?B?T1FYeGZWeXlIbEJoN1NPZmE4aWl6NHlDaG1VYmVFLy9tQ1VGNnA4ZnRSTy85?=
 =?utf-8?B?UzJZTitEU3VjR3FKaEE4eFp2dHU2TEl0RWJYZ1lqaWp1NU1LZkxhRWhnZXJB?=
 =?utf-8?B?d3NheVRiYm9ibTJJVEJIdm5QYm05YWtpK1pLbGtaNmt6STBpYnFONU93SXp3?=
 =?utf-8?B?MTN3bnl4VzV4S1BKVVVCb1ZTc3hjYnFDUnJpNE9hSTJzSm5EclNTcyswT3hV?=
 =?utf-8?B?ZThoUE9wcjM4b0U1TFZxZkhkMFVXT29YY0tNd3FldmxuajVOUjFSREthaWV1?=
 =?utf-8?B?RFd3dTliNVlXK3VMSFltRjV3anZJcjRkYmNSRURTNzdIU1N1MlM5UFdrWlNR?=
 =?utf-8?B?enpBc2krK1RsWjNQWEl4K0d6dDliTUVkUmVybUQ4c2s2SmJYcHJuM21MN0tR?=
 =?utf-8?B?a2pyakNpVk9vZEswblQ1ck14MzVxaEFNTFJvVzA1R3ArSkMwNktsOUpibkdC?=
 =?utf-8?B?b1VnTFVRbFF3dmRNRHRlVitpNnhPSEpJd0NFa1lzQmJQV2RFOTBFZll6dTV3?=
 =?utf-8?B?K1NidFFnNmVTZFcreFNJTERBZ3dIem1YRFZoWGFwSGVOODNlQUxnd0FYbmFh?=
 =?utf-8?B?ZVZMd0NDdncyRGNBU3ZPR2RpUkhLUjJLRmFsWURHaVVmaU9ja3ZXNG9oR29r?=
 =?utf-8?B?K2VvbHdDVFl5cFdtTHNKbks5a2NTNmNuUHpwOHdhOVJDVERDeEpic3JYeHBE?=
 =?utf-8?B?ZG9ibUM2cFFQcXZ3V3ppeEdQcUJhelFBeTlQZzFaN0ttd20vUVZOaXRqNVRi?=
 =?utf-8?B?K00veHhXLzFjQUJ6d0VkUHViTWlGN0ZVcnc4RUpucDhNOHpiZnQ5MGZKMFo2?=
 =?utf-8?B?RGc0eXZsak1HVXZwRFY4RGxTdGxsSXdlTnN1QzdNTGlDTWgveHBDU2RUa1BM?=
 =?utf-8?B?UHFxN3pXbDM4c3BzRHp5eHV0VWtzQ0grSWRlK1NBSGlvTW5RSlZmemhVb1RN?=
 =?utf-8?B?N0Zqb1NZSUlnM3R4TTBtWTN4dGluTndQYjNIMnQ1b1J2cTdPM2IrREZXVVNy?=
 =?utf-8?B?VlV1aWZ6Ump4cXJoR2JwSmdEZ09obUVQWUFBU1dZTWRIM09Yc21nRTY3cGE1?=
 =?utf-8?B?bWl3TElJMndsMDVQc1Y0T0NMTXhXc3czOWpDc09lRXEvY3BWNCs2N01Ec05i?=
 =?utf-8?B?TzRFMUZHaC9yMjJZU3QzM2h2cWRkbi9GT3BZeEY4MGVMaXNYQWxvc2xMU1NJ?=
 =?utf-8?B?SVUzUEN5K2E5Ti9mTmk5YVpNYlAzWEgzbXlNeC8vbW9ZQlhrVHZhNjNiZ25I?=
 =?utf-8?B?bUdaR1dTZUw1bjRtV0VPbjl6UW1wVmd6dzlNdzlFdzVnSkFhV3NQNTkveCt0?=
 =?utf-8?B?VlZYYUNLekVnNjg5TmEyUE9WRUM0NTBFbW5sSGVyWEI0eXNUbjRIWTMwZUta?=
 =?utf-8?B?UGVDRDZPZk5INnprUlJWWU9hdGRST2ZXbHlUMDdYWktOVElUUG5GM1NNSFJC?=
 =?utf-8?B?SmFCRm13Zlo4NnpOdm15ZzN2aWdwalpvbWVsd2YrekhGdW5UYnVpNGNzVnM0?=
 =?utf-8?B?SXdmaW8rOHFnNVY2RU03djAxckl4bFFEb2VzdTNsMHc3QTNTc3hZUDFrM3pi?=
 =?utf-8?B?Vy80RG8xM1RBdWg3azZ0cmczS2hNdStLc09kVFc1TUxCUWNZL0JEM0VLbk91?=
 =?utf-8?B?VHdFRER0eXJFMVdOQ2pMcTkzWllON25zS3hrdzhHeGlTcmFPWU4xNGUxOEw3?=
 =?utf-8?B?VUtBZFBIVGFOOHJiUU51dTF4Wll6aXpXQmF2eWdlR2cxcHdaaTQyMU4yYWFX?=
 =?utf-8?B?SzRYMWwzZy9yMTI0NDMxYWQvdHd6NkxvdjMrakFZUjJiU0VKN3BGZ01zWkox?=
 =?utf-8?B?cXlNMUhZQWRhSlZMbVpJWUh3eng0TmFZcmRrK1dUb3dJSDNqOHhwRXBGd3pV?=
 =?utf-8?B?c1QvaHEwTXRiK2JTQ2MvQm1GMnJRUnQvOGFaQ3p0alIxdWluY3pVeTc4S21v?=
 =?utf-8?Q?Rlew=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0779a5d4-a50d-4942-dacc-08d9d0f2d210
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2022 08:59:17.8837 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q1KKIyFVS1xmLP14nlu80TwSeAilTLp0Qruijsaq0k9WbzUFmURUDJUh2PTPvMl+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0110
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
Cc: surenb@google.com, keescook@google.com, tjmercier@google.com,
 kaleshsingh@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 05.01.22 um 00:51 schrieb Hridya Valsaraju:
> Recently, we noticed an issue where a process went into direct reclaim
> while holding the kernfs rw semaphore for sysfs in write(exclusive)
> mode. This caused processes who were doing DMA-BUF exports and releases
> to go into uninterruptible sleep since they needed to acquire the same
> semaphore for the DMA-BUF sysfs entry creation/deletion. In order to avoid
> blocking DMA-BUF export/release for an indeterminate amount of time
> while another process is holding the sysfs rw semaphore in exclusive
> mode, this patch moves the per-buffer sysfs file creation/deleteion to
> a kthread.

Well I absolutely don't think that this is justified.

You adding tons of complexity here just to avoid the overhead of 
creating the sysfs files while exporting DMA-bufs which is an operation 
which should be done exactly once in the lifecycle for the most common 
use case.

Please explain further why that should be necessary.

Regards,
Christian.

>
> Fixes: bdb8d06dfefd ("dmabuf: Add the capability to expose DMA-BUF stats in sysfs")
> Signed-off-by: Hridya Valsaraju <hridya@google.com>
> ---
>   drivers/dma-buf/dma-buf-sysfs-stats.c | 343 ++++++++++++++++++++++++--
>   include/linux/dma-buf.h               |  46 ++++
>   2 files changed, 366 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.c b/drivers/dma-buf/dma-buf-sysfs-stats.c
> index 053baadcada9..3251fdf2f05f 100644
> --- a/drivers/dma-buf/dma-buf-sysfs-stats.c
> +++ b/drivers/dma-buf/dma-buf-sysfs-stats.c
> @@ -7,13 +7,39 @@
>   
>   #include <linux/dma-buf.h>
>   #include <linux/dma-resv.h>
> +#include <linux/freezer.h>
>   #include <linux/kobject.h>
> +#include <linux/kthread.h>
> +#include <linux/list.h>
>   #include <linux/printk.h>
> +#include <linux/sched/signal.h>
>   #include <linux/slab.h>
>   #include <linux/sysfs.h>
>   
>   #include "dma-buf-sysfs-stats.h"
>   
> +struct dmabuf_kobj_work {
> +	struct list_head list;
> +	struct dma_buf_sysfs_entry *sysfs_entry;
> +	struct dma_buf_sysfs_entry_metadata *sysfs_metadata;
> +	unsigned long uid;
> +};
> +
> +/* Both kobject setup and teardown work gets queued on the list. */
> +static LIST_HEAD(dmabuf_kobj_work_list);
> +
> +/* dmabuf_kobj_list_lock protects dmabuf_kobj_work_list. */
> +static DEFINE_SPINLOCK(dmabuf_kobj_list_lock);
> +
> +/*
> + * dmabuf_sysfs_show_lock prevents a race between a DMA-BUF sysfs file being
> + * read and the DMA-BUF being freed by protecting sysfs_entry->dmabuf.
> + */
> +static DEFINE_SPINLOCK(dmabuf_sysfs_show_lock);
> +
> +static struct task_struct *dmabuf_kobject_task;
> +static wait_queue_head_t dmabuf_kobject_waitqueue;
> +
>   #define to_dma_buf_entry_from_kobj(x) container_of(x, struct dma_buf_sysfs_entry, kobj)
>   
>   /**
> @@ -64,15 +90,26 @@ static ssize_t dma_buf_stats_attribute_show(struct kobject *kobj,
>   	struct dma_buf_stats_attribute *attribute;
>   	struct dma_buf_sysfs_entry *sysfs_entry;
>   	struct dma_buf *dmabuf;
> +	int ret;
>   
>   	attribute = to_dma_buf_stats_attr(attr);
>   	sysfs_entry = to_dma_buf_entry_from_kobj(kobj);
> +
> +	/*
> +	 * acquire dmabuf_sysfs_show_lock to prevent a race with the DMA-BUF
> +	 * being freed while sysfs_entry->dmabuf is being accessed.
> +	 */
> +	spin_lock(&dmabuf_sysfs_show_lock);
>   	dmabuf = sysfs_entry->dmabuf;
>   
> -	if (!dmabuf || !attribute->show)
> +	if (!dmabuf || !attribute->show) {
> +		spin_unlock(&dmabuf_sysfs_show_lock);
>   		return -EIO;
> +	}
>   
> -	return attribute->show(dmabuf, attribute, buf);
> +	ret = attribute->show(dmabuf, attribute, buf);
> +	spin_unlock(&dmabuf_sysfs_show_lock);
> +	return ret;
>   }
>   
>   static const struct sysfs_ops dma_buf_stats_sysfs_ops = {
> @@ -118,33 +155,275 @@ static struct kobj_type dma_buf_ktype = {
>   	.default_groups = dma_buf_stats_default_groups,
>   };
>   
> -void dma_buf_stats_teardown(struct dma_buf *dmabuf)
> +/* Statistics files do not need to send uevents. */
> +static int dmabuf_sysfs_uevent_filter(struct kset *kset, struct kobject *kobj)
>   {
> -	struct dma_buf_sysfs_entry *sysfs_entry;
> +	return 0;
> +}
>   
> -	sysfs_entry = dmabuf->sysfs_entry;
> -	if (!sysfs_entry)
> -		return;
> +static const struct kset_uevent_ops dmabuf_sysfs_no_uevent_ops = {
> +	.filter = dmabuf_sysfs_uevent_filter,
> +};
> +
> +/* setup of sysfs entries done asynchronously in the worker thread. */
> +static void dma_buf_sysfs_stats_setup_work(struct dmabuf_kobj_work *kobject_work)
> +{
> +	struct dma_buf_sysfs_entry *sysfs_entry = kobject_work->sysfs_entry;
> +	struct dma_buf_sysfs_entry_metadata *sysfs_metadata =
> +			kobject_work->sysfs_metadata;
> +	bool free_metadata = false;
> +
> +	int ret = kobject_init_and_add(&sysfs_entry->kobj, &dma_buf_ktype, NULL,
> +				       "%lu", kobject_work->uid);
> +	if (ret) {
> +		kobject_put(&sysfs_entry->kobj);
> +
> +		spin_lock(&sysfs_metadata->sysfs_entry_lock);
> +		if (sysfs_metadata->status == SYSFS_ENTRY_INIT_ABORTED) {
> +			/*
> +			 * SYSFS_ENTRY_INIT_ABORTED means that the DMA-BUF has already
> +			 * been freed. At this point, its safe to free the memory for
> +			 * the sysfs_metadata;
> +			 */
> +			free_metadata = true;
> +		} else {
> +			/*
> +			 * The DMA-BUF has not yet been freed, set the status to
> +			 * sysfs_entry_error so that when the DMA-BUF gets
> +			 * freed, we know there is no need to teardown the sysfs
> +			 * entry.
> +			 */
> +			sysfs_metadata->status = SYSFS_ENTRY_ERROR;
> +		}
> +		goto unlock;
> +	}
> +
> +	/*
> +	 * If the DMA-BUF has not yet been released, status would still be
> +	 * SYSFS_ENTRY_INIT_IN_PROGRESS. We set the status as initialized.
> +	 */
> +	spin_lock(&sysfs_metadata->sysfs_entry_lock);
> +	if (sysfs_metadata->status == SYSFS_ENTRY_INIT_IN_PROGRESS) {
> +		sysfs_metadata->status = SYSFS_ENTRY_INITIALIZED;
> +		goto unlock;
> +	}
>   
> +	/*
> +	 * At this point the status is SYSFS_ENTRY_INIT_ABORTED which means
> +	 * that the DMA-BUF has already been freed. Hence, we cleanup the
> +	 * sysfs_entry and its metadata since neither of them are needed
> +	 * anymore.
> +	 */
> +	free_metadata = true;
>   	kobject_del(&sysfs_entry->kobj);
>   	kobject_put(&sysfs_entry->kobj);
> +
> +unlock:
> +	spin_unlock(&sysfs_metadata->sysfs_entry_lock);
> +	if (free_metadata) {
> +		kfree(kobject_work->sysfs_metadata);
> +		kobject_work->sysfs_metadata = NULL;
> +	}
>   }
>   
> +/* teardown of sysfs entries done asynchronously in the worker thread. */
> +static void dma_buf_sysfs_stats_teardown_work(struct dmabuf_kobj_work *kobject_work)
> +{
> +	struct dma_buf_sysfs_entry *sysfs_entry = kobject_work->sysfs_entry;
>   
> -/* Statistics files do not need to send uevents. */
> -static int dmabuf_sysfs_uevent_filter(struct kset *kset, struct kobject *kobj)
> +	kobject_del(&sysfs_entry->kobj);
> +	kobject_put(&sysfs_entry->kobj);
> +
> +	kfree(kobject_work->sysfs_metadata);
> +	kobject_work->sysfs_metadata = NULL;
> +}
> +
> +/* do setup or teardown of sysfs entries as required */
> +static void do_kobject_work(struct dmabuf_kobj_work *kobject_work)
>   {
> +	struct dma_buf_sysfs_entry_metadata *sysfs_metadata;
> +	bool setup_needed = false;
> +	bool teardown_needed = false;
> +
> +	sysfs_metadata = kobject_work->sysfs_metadata;
> +	spin_lock(&sysfs_metadata->sysfs_entry_lock);
> +	if (sysfs_metadata->status == SYSFS_ENTRY_UNINITIALIZED) {
> +		setup_needed = true;
> +		sysfs_metadata->status = SYSFS_ENTRY_INIT_IN_PROGRESS;
> +	} else if (sysfs_metadata->status == SYSFS_ENTRY_INITIALIZED) {
> +		teardown_needed = true;
> +	}
> +
> +	/*
> +	 * It is ok to release the sysfs_entry_lock here.
> +	 *
> +	 * If setup_needed is true, we check the status again after the kobject
> +	 * initialization to see if it has been set to SYSFS_ENTRY_INIT_ABORTED
> +	 * and if so teardown the kobject.
> +	 *
> +	 * If teardown_needed is true, there are no more changes expected to the
> +	 * status.
> +	 *
> +	 * If neither setup_needed nor teardown needed are true, it
> +	 * means the DMA-BUF was freed before we got around to setting up the
> +	 * sysfs entry and hence we just need to release the metadata and
> +	 * return.
> +	 */
> +	spin_unlock(&kobject_work->sysfs_metadata->sysfs_entry_lock);
> +
> +	if (setup_needed)
> +		dma_buf_sysfs_stats_setup_work(kobject_work);
> +	else if (teardown_needed)
> +		dma_buf_sysfs_stats_teardown_work(kobject_work);
> +	else
> +		kfree(kobject_work->sysfs_metadata);
> +
> +	kfree(kobject_work);
> +}
> +
> +static struct dmabuf_kobj_work *get_next_kobj_work(void)
> +{
> +	struct dmabuf_kobj_work *kobject_work;
> +
> +	spin_lock(&dmabuf_kobj_list_lock);
> +	kobject_work = list_first_entry_or_null(&dmabuf_kobj_work_list,
> +						struct dmabuf_kobj_work, list);
> +	if (kobject_work)
> +		list_del(&kobject_work->list);
> +	spin_unlock(&dmabuf_kobj_list_lock);
> +	return kobject_work;
> +}
> +
> +static int kobject_work_thread(void *data)
> +{
> +	struct dmabuf_kobj_work *kobject_work;
> +
> +	while (1) {
> +		wait_event_freezable(dmabuf_kobject_waitqueue,
> +				     (kobject_work = get_next_kobj_work()));
> +		do_kobject_work(kobject_work);
> +	}
> +
>   	return 0;
>   }
>   
> -static const struct kset_uevent_ops dmabuf_sysfs_no_uevent_ops = {
> -	.filter = dmabuf_sysfs_uevent_filter,
> -};
> +static int kobject_worklist_init(void)
> +{
> +	init_waitqueue_head(&dmabuf_kobject_waitqueue);
> +	dmabuf_kobject_task = kthread_run(kobject_work_thread, NULL,
> +					  "%s", "dmabuf-kobject-worker");
> +	if (IS_ERR(dmabuf_kobject_task)) {
> +		pr_err("Creating thread for deferred sysfs entry creation/deletion failed\n");
> +		return PTR_ERR(dmabuf_kobject_task);
> +	}
> +	sched_set_normal(dmabuf_kobject_task, MAX_NICE);
> +
> +	return 0;
> +}
> +
> +static void deferred_kobject_create(struct dmabuf_kobj_work *kobject_work)
> +{
> +	INIT_LIST_HEAD(&kobject_work->list);
> +
> +	spin_lock(&dmabuf_kobj_list_lock);
> +
> +	list_add_tail(&kobject_work->list, &dmabuf_kobj_work_list);
> +
> +	spin_unlock(&dmabuf_kobj_list_lock);
> +
> +	wake_up(&dmabuf_kobject_waitqueue);
> +}
> +
> +
> +void dma_buf_stats_teardown(struct dma_buf *dmabuf)
> +{
> +	struct dma_buf_sysfs_entry *sysfs_entry;
> +	struct dma_buf_sysfs_entry_metadata *sysfs_metadata;
> +	struct dmabuf_kobj_work *kobj_work;
> +
> +	sysfs_entry = dmabuf->sysfs_entry;
> +	if (!sysfs_entry)
> +		return;
> +
> +	sysfs_metadata = dmabuf->sysfs_entry_metadata;
> +	if (!sysfs_metadata)
> +		return;
> +
> +	spin_lock(&sysfs_metadata->sysfs_entry_lock);
> +
> +	if (sysfs_metadata->status == SYSFS_ENTRY_UNINITIALIZED ||
> +	    sysfs_metadata->status == SYSFS_ENTRY_INIT_IN_PROGRESS) {
> +		/*
> +		 * The sysfs entry for this buffer has not yet been initialized,
> +		 * we set the status to SYSFS_ENTRY_INIT_ABORTED to abort the
> +		 * initialization.
> +		 */
> +		sysfs_metadata->status = SYSFS_ENTRY_INIT_ABORTED;
> +		spin_unlock(&sysfs_metadata->sysfs_entry_lock);
> +
> +		/*
> +		 * In case kobject initialization completes right as we release
> +		 * the sysfs_entry_lock, disable show() for the sysfs entry by
> +		 * setting sysfs_entry->dmabuf to NULL to prevent a race.
> +		 */
> +		spin_lock(&dmabuf_sysfs_show_lock);
> +		sysfs_entry->dmabuf = NULL;
> +		spin_unlock(&dmabuf_sysfs_show_lock);
> +
> +		return;
> +	}
> +
> +	if (sysfs_metadata->status == SYSFS_ENTRY_INITIALIZED) {
> +		/*
> +		 * queue teardown work only if sysfs_entry is fully inititalized.
> +		 * It is ok to release the sysfs_entry_lock here since the
> +		 * status can no longer change.
> +		 */
> +		spin_unlock(&sysfs_metadata->sysfs_entry_lock);
> +
> +		/*
> +		 * Meanwhile disable show() for the sysfs entry to avoid a race
> +		 * between teardown and show().
> +		 */
> +		spin_lock(&dmabuf_sysfs_show_lock);
> +		sysfs_entry->dmabuf = NULL;
> +		spin_unlock(&dmabuf_sysfs_show_lock);
> +
> +		kobj_work = kzalloc(sizeof(struct dmabuf_kobj_work), GFP_KERNEL);
> +		if (!kobj_work) {
> +			/* do the teardown immediately. */
> +			kobject_del(&sysfs_entry->kobj);
> +			kobject_put(&sysfs_entry->kobj);
> +			kfree(sysfs_metadata);
> +		} else {
> +			/* queue teardown work. */
> +			kobj_work->sysfs_entry = dmabuf->sysfs_entry;
> +			kobj_work->sysfs_metadata = dmabuf->sysfs_entry_metadata;
> +			deferred_kobject_create(kobj_work);
> +		}
> +
> +		return;
> +	}
> +
> +	/*
> +	 * status is SYSFS_ENTRY_INIT_ERROR so we only need to free the
> +	 * metadata.
> +	 */
> +	spin_unlock(&sysfs_metadata->sysfs_entry_lock);
> +	kfree(dmabuf->sysfs_entry_metadata);
> +	dmabuf->sysfs_entry_metadata = NULL;
> +}
>   
>   static struct kset *dma_buf_stats_kset;
>   static struct kset *dma_buf_per_buffer_stats_kset;
>   int dma_buf_init_sysfs_statistics(void)
>   {
> +	int ret;
> +
> +	ret = kobject_worklist_init();
> +	if (ret)
> +		return ret;
> +
>   	dma_buf_stats_kset = kset_create_and_add("dmabuf",
>   						 &dmabuf_sysfs_no_uevent_ops,
>   						 kernel_kobj);
> @@ -171,7 +450,8 @@ void dma_buf_uninit_sysfs_statistics(void)
>   int dma_buf_stats_setup(struct dma_buf *dmabuf)
>   {
>   	struct dma_buf_sysfs_entry *sysfs_entry;
> -	int ret;
> +	struct dma_buf_sysfs_entry_metadata *sysfs_metadata;
> +	struct dmabuf_kobj_work *kobj_work;
>   
>   	if (!dmabuf || !dmabuf->file)
>   		return -EINVAL;
> @@ -188,18 +468,35 @@ int dma_buf_stats_setup(struct dma_buf *dmabuf)
>   	sysfs_entry->kobj.kset = dma_buf_per_buffer_stats_kset;
>   	sysfs_entry->dmabuf = dmabuf;
>   
> +	sysfs_metadata = kzalloc(sizeof(struct dma_buf_sysfs_entry_metadata),
> +				 GFP_KERNEL);
> +	if (!sysfs_metadata) {
> +		kfree(sysfs_entry);
> +		return -ENOMEM;
> +	}
> +
>   	dmabuf->sysfs_entry = sysfs_entry;
>   
> -	/* create the directory for buffer stats */
> -	ret = kobject_init_and_add(&sysfs_entry->kobj, &dma_buf_ktype, NULL,
> -				   "%lu", file_inode(dmabuf->file)->i_ino);
> -	if (ret)
> -		goto err_sysfs_dmabuf;
> +	sysfs_metadata->status = SYSFS_ENTRY_UNINITIALIZED;
> +	spin_lock_init(&sysfs_metadata->sysfs_entry_lock);
>   
> -	return 0;
> +	dmabuf->sysfs_entry_metadata = sysfs_metadata;
>   
> -err_sysfs_dmabuf:
> -	kobject_put(&sysfs_entry->kobj);
> -	dmabuf->sysfs_entry = NULL;
> -	return ret;
> +	kobj_work = kzalloc(sizeof(struct dmabuf_kobj_work), GFP_KERNEL);
> +	if (!kobj_work) {
> +		kfree(sysfs_entry);
> +		kfree(sysfs_metadata);
> +		return -ENOMEM;
> +	}
> +
> +	kobj_work->sysfs_entry = dmabuf->sysfs_entry;
> +	kobj_work->sysfs_metadata = dmabuf->sysfs_entry_metadata;
> +	/*
> +	 * stash the inode number in struct dmabuf_kobj_work since setup
> +	 * might race with DMA-BUF teardown.
> +	 */
> +	kobj_work->uid = file_inode(dmabuf->file)->i_ino;
> +
> +	deferred_kobject_create(kobj_work);
> +	return 0;
>   }
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index 7ab50076e7a6..0597690023a0 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -287,6 +287,50 @@ struct dma_buf_ops {
>   	void (*vunmap)(struct dma_buf *dmabuf, struct dma_buf_map *map);
>   };
>   
> +#ifdef CONFIG_DMABUF_SYSFS_STATS
> +enum sysfs_entry_status {
> +	SYSFS_ENTRY_UNINITIALIZED,
> +	SYSFS_ENTRY_INIT_IN_PROGRESS,
> +	SYSFS_ENTRY_ERROR,
> +	SYSFS_ENTRY_INIT_ABORTED,
> +	SYSFS_ENTRY_INITIALIZED,
> +};
> +
> +/*
> + * struct dma_buf_sysfs_entry_metadata - Holds the current status for the
> + * DMA-BUF sysfs entry.
> + *
> + * @status: holds the current status for the DMA-BUF sysfs entry. The status of
> + * the sysfs entry has the following path.
> + *
> + *			SYSFS_ENTRY_UNINITIALIZED
> + *		 __________________|____________________
> + *		|					|
> + *	  SYSFS_ENTRY_INIT_IN_PROGRESS	    SYSFS_ENTRY_INIT_ABORTED (DMA-BUF
> + *		|						      gets freed
> + *		|						      before
> + *		|						      init)
> + *	________|_____________________________________
> + *	|			  |		      |
> + * SYSFS_ENTRY_INITIALIZED	  |	  SYSFS_ENTRY_INIT_ABORTED
> + *				  |		  (DMA-BUF gets freed during kobject
> + *				  |		  init)
> + *				  |
> + *				  |
> + *		      SYSFS_ENTRY_ERROR
> + *		      (error during kobject init)
> + *
> + * @sysfs_entry_lock: protects access to @status.
> + */
> +struct dma_buf_sysfs_entry_metadata {
> +	enum sysfs_entry_status status;
> +	/*
> +	 * Protects sysfs_entry_metadata->status
> +	 */
> +	spinlock_t sysfs_entry_lock;
> +};
> +#endif
> +
>   /**
>    * struct dma_buf - shared buffer object
>    *
> @@ -452,6 +496,8 @@ struct dma_buf {
>   		struct kobject kobj;
>   		struct dma_buf *dmabuf;
>   	} *sysfs_entry;
> +
> +	struct dma_buf_sysfs_entry_metadata *sysfs_entry_metadata;
>   #endif
>   };
>   

