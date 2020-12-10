Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E06B12D57C4
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 10:59:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1DA76EA61;
	Thu, 10 Dec 2020 09:59:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2040.outbound.protection.outlook.com [40.107.94.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 423786EA61
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 09:58:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jliJ/DJXaiGBfRTfxvmlYFuHLm98dfObeJH1A+NZGa1tDdnJGfhnW7dZ92uCS85WHZ+3l094yT0AxY3rYWgPNlh4RgzrBv1q/jW/YRRl3SIXjPoAkbWYpzbbQwPlrtEO+h7aHsEnOkwlqJ7teJ9Kkl7jX3pNDeVyarbUNLWqF5B2iPKXL3yofF53malTmIa5qqVGJkfKF8NcplHrNhg+TZECyuYJCRHx3TlyPEwDDjLesmdbsNCfPdR9b40GYKwtM4vTXxwZN/CPZDS16MYFeuhN8rlxR0+6GUmDs37Eenu0V5LH4omCckxKp6llPCc9oEvbJnlh37QecnF0IFo9WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xqWb4qoxoKwjYWadDsQWkQa90P1iG1yWeHP9vtBjPVQ=;
 b=O06rJ66ngB3UDnMotcIuz+3Wlt1qn9pJnx4oC+vMUkhveiNQknFtEKTH/6nnm5EZVJ4tSnOVNJDurhj0IchAHNfYD+kKcZ/JXjflsEQleO+M3p+YThCf65ZKvSh/scfAGVcKJDm3QGo3aCe3btf3LD3i5NX/hbvsuDp/ZQti3RsjcmvcI+NxU6ZVkgURkrtKLRNM/QgD48oczP4wLoxIEnL+zmOMc69618HZ0LeqmoTSPlTv5EEICnpB997CsO7ggVG79CIBPuVVZcEsuG6dk8Ck0s5jJTbxCkEipcyWkJiW1o/pYz3+gc/1imgjPsNGnb9uoCo6DQ25jgbdfzBjjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xqWb4qoxoKwjYWadDsQWkQa90P1iG1yWeHP9vtBjPVQ=;
 b=riWpdWJM24oI468XIvKz3Ou+ixAGZat27hwNu+TkFWMmu7932PtT4bXPlO5ESjUgZhr/hjENzjONu/yG8wAuDPUAhCir1v0z+POsq246Y0P8yuU/9VJze7Uc1ktIma3MOx+SDf+6CUTynQCDckVmCiQTzuMf9RaeljsyGUbcB3k=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2386.namprd12.prod.outlook.com (2603:10b6:207:47::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.15; Thu, 10 Dec
 2020 09:58:56 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3654.016; Thu, 10 Dec 2020
 09:58:56 +0000
Subject: Re: [PATCH] dmabuf: Add the capability to expose DMA-BUF stats in
 sysfs
To: Hridya Valsaraju <hridya@google.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20201210044400.1080308-1-hridya@google.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <b5adfe46-8615-5821-d092-2b93feed5b79@amd.com>
Date: Thu, 10 Dec 2020 10:58:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201210044400.1080308-1-hridya@google.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR04CA0011.eurprd04.prod.outlook.com
 (2603:10a6:208:122::24) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR04CA0011.eurprd04.prod.outlook.com (2603:10a6:208:122::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Thu, 10 Dec 2020 09:58:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 07e8f7d1-9016-43fe-a1ab-08d89cf23588
X-MS-TrafficTypeDiagnostic: BL0PR12MB2386:
X-Microsoft-Antispam-PRVS: <BL0PR12MB23867A41241F3E2C0B58268D83CB0@BL0PR12MB2386.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mikGaeFB93HyCK+Whv1R/8kWhhYLXPp10g2WPQPWzj4w4B+3TNSB+xaLqFvjDojNrOZ3cRwC2rpkbMCCGIIKCbcMsS/2IJAhpO4Hff5LWz5d8LiP8nrSVqHE0Q4saC1bPsBQSYUolPKzl+QleL4Mp9FzLRn4ZNwt4rSvaAnADHbpEJNv0wmEkqX4aiE0eU/f/QVV2zj8ewOHok+fwWMVC25J8ZbvSLm8a4aIjGOZPDMXnJAuhTtYzYiQ19CSOU20RskYqeZyqBK23+Mp07ssVkEKUyH+eWB2keYCqRc9X2zqutu8RebOGEcxLyN+yPQcjoo5/NWxKmtMIsrrXfd+9Kl+E4oITOAQ7QEoPIOU6lMr/qT7Ri4ACJZYT8dt4s1N4Rd/o1j/ypSnqWfJm4Q5iICY+D9ApJZZaHe3c2bnb8hIfIp2LjpVgpkQ1DqROHGDU5eMjjEyhldppQYiJTTby81HCwpDmty2pu0xIAwyQSEMqEDKGdBXosZWpZvh9Vp1vS3GJ+ixpD17WY6I4MEhew==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(366004)(31696002)(66946007)(66556008)(66476007)(8936002)(2906002)(31686004)(8676002)(30864003)(7416002)(4326008)(966005)(5660300002)(52116002)(508600001)(6486002)(110136005)(45080400002)(2616005)(34490700003)(86362001)(6666004)(83380400001)(16526019)(186003)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VWtBK3hTMDZSRzd6clRSRzBLa09lYnFIRTRkU3VORGwwZTMrdzFSUzZmcUdi?=
 =?utf-8?B?MnpjV25lZCt4ZmlCdlAyREVTZDFyckVra0NkRGFGcmZRamZZOW16SjRRTkZY?=
 =?utf-8?B?QXZ0RHRrSCtzWG04Q1UzcjViQlp0NTNGbHRiamhnMmxiZTZIeDV3ejJNcVFE?=
 =?utf-8?B?OXhObmtCR2tzbVkyU3ZEbTA0MGRVSlpIZ0VuOFVJdzhQQ3FsOXltTkdyR2ZZ?=
 =?utf-8?B?Y0FTM08wTVdhQllib2E1RUJUamh2djVZMHAzVGJKQUVpTGNjS1VUZ1dvb0NR?=
 =?utf-8?B?RXdiQkhEOW9DVEZ5M1o0b2tHSm53YjdxWnZpSDNwTVpEVVdBaG9qeXN5MEFD?=
 =?utf-8?B?TnhPUkRNV094WlkzcmNFREJsYnBZY1Z3LzJvZTRodnUvazdrRWROVVFFQVZS?=
 =?utf-8?B?SXpQM0tIVGVaYVpFUW1PZ283eFJOM1pIdEJVWGRxSEw0d0VqRmo3SExiVGpC?=
 =?utf-8?B?VmQ5VXRQZUR3c0VYZDlrSm9OdnMxS2kxcWVRYUZYTVhhRzZXL3FJWXpnQ1l0?=
 =?utf-8?B?bGhDQXBwSGE0NkNLSkJBMTBKRXRGaEgyZXNtUE9xOUwzNE9GeGhReDJ1VWk3?=
 =?utf-8?B?U29NOU9YQ21US0ovUnhZaFpuS3dlYlM3VjgweFlMUWNBbyt1WDBNOER1UThV?=
 =?utf-8?B?Y2Rtd3VoandJUUtLM0hWMWN4OU1QeXNEMWkzTU9mSEUzTEFWbGZyQ0ZPZmFx?=
 =?utf-8?B?Qk52Y2pMc2VQbUpMRjRFV2VWckdQZWl3azBYRnY2R1ZuYnpCZTIxTWE2TVl5?=
 =?utf-8?B?ajdFeEtrSU1lWXBxbFlXdU5DQXB0TDluM0w4SnpFcDY0NHZPcFpmNzhKY0Vr?=
 =?utf-8?B?eUVOM0tFbFM5WWVKWkh2Z2dCdjhwZjQ4Mk9scjJTWHNzVm9TS3IwZ3AxZmlQ?=
 =?utf-8?B?VjQrZUZ6OGw1S3haYkJnUmdVWkdtVHF5OWtuREJjbkgxSXBCOEZaMFE2VFB1?=
 =?utf-8?B?TWJGWGJoS0VRQ2ZLTTVSOWNxNlVpZjRxdzNTVGE1cklEVTJNY2RmN0g4ZXdG?=
 =?utf-8?B?SzRld1JoVlRRNEtURXo3VXd5alRucVp4b3VFZ0FLOWNiUU5aY2NkS285UG5E?=
 =?utf-8?B?SzViZ0ZabWpJcktTNHVvZDFma0VsTzlOQmhkbTEvOTh5OWkzUG5ySXZBbCtW?=
 =?utf-8?B?RlFTYnI0SFhMUmFyV1YvWnk5REpUdHRMMEt1ZE1lK1kxeHdSaUVmWGIwcWcy?=
 =?utf-8?B?R3c4TW5TUGtxNkZ3MFRFNG9PY3Q4UzF5cEJ4bXh6U3l1cFNwRVdXRDJ1VTBx?=
 =?utf-8?B?ZklPSGZWQzNCMm5GSi9PdjkxTzFQbEJsVnNHUzU4Z0l3OS9mYTVjWVA3d21W?=
 =?utf-8?B?OHdUb21PM0Q5UzhZNnFQd2hZN0QwTWlLWFZQckJnWUhSVDJHRmNpOFlQeng4?=
 =?utf-8?B?ZERGNGRicUo2ZTdCdk53OUU4RlJlbzRKUFVnb1o1ZStvZXNRMFVFT1Y2WjA0?=
 =?utf-8?Q?JdRw++5T?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2020 09:58:56.5651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 07e8f7d1-9016-43fe-a1ab-08d89cf23588
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sN/oI9mwXm/nT2K9PgoQXLInusPJqbkgbXT6GL5W1ZEJDLORy4CqJeThE3jQ19nb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2386
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
Cc: surenb@google.com, gregkh@linuxfoundation.org, kernel-team@android.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In general a good idea, but I have a few concern/comments here.

Am 10.12.20 um 05:43 schrieb Hridya Valsaraju:
> This patch allows statistics to be enabled for each DMA-BUF in
> sysfs by enabling the config CONFIG_DMABUF_SYSFS_STATS.
>
> The following stats will be exposed by the interface:
>
> /sys/kernel/dmabuf/<inode_number>/exporter_name
> /sys/kernel/dmabuf/<inode_number>/size
> /sys/kernel/dmabuf/<inode_number>/dev_map_info
>
> The inode_number is unique for each DMA-BUF and was added earlier [1]
> in order to allow userspace to track DMA-BUF usage across different
> processes.
>
> Currently, this information is exposed in
> /sys/kernel/debug/dma_buf/bufinfo.
> However, since debugfs is considered unsafe to be mounted in production,
> it is being duplicated in sysfs.

Mhm, this makes it part of the UAPI. What is the justification for this?

In other words do we really need those debug information in a production 
environment?

>
> This information is intended to help with root-causing
> low-memory kills and the debugging/analysis of other memory-related issues.
>
> It will also be used to derive DMA-BUF
> per-exporter stats and per-device usage stats for Android Bug reports.
>
> [1]: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fpatchwork%2Fpatch%2F1088791%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C30a0e015502b4d20e18208d89cc63f1a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637431722574983797%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=RdGMvj5VsFUwJcVOuSPaLuAr4eI3CR1YOaznupmpTqg%3D&amp;reserved=0
>
> Signed-off-by: Hridya Valsaraju <hridya@google.com>
> ---
>   Documentation/ABI/testing/sysfs-kernel-dmabuf |  32 ++++
>   drivers/dma-buf/Kconfig                       |  11 ++
>   drivers/dma-buf/Makefile                      |   1 +
>   drivers/dma-buf/dma-buf-sysfs-stats.c         | 162 ++++++++++++++++++
>   drivers/dma-buf/dma-buf-sysfs-stats.h         |  37 ++++
>   drivers/dma-buf/dma-buf.c                     |  29 ++++
>   include/linux/dma-buf.h                       |  13 ++
>   7 files changed, 285 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-kernel-dmabuf
>   create mode 100644 drivers/dma-buf/dma-buf-sysfs-stats.c
>   create mode 100644 drivers/dma-buf/dma-buf-sysfs-stats.h
>
> diff --git a/Documentation/ABI/testing/sysfs-kernel-dmabuf b/Documentation/ABI/testing/sysfs-kernel-dmabuf
> new file mode 100644
> index 000000000000..02d407d57aaa
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-kernel-dmabuf
> @@ -0,0 +1,32 @@
> +What:		/sys/kernel/dmabuf
> +Date:		November 2020
> +KernelVersion:	v5.11
> +Contact:	Hridya Valsaraju <hridya@google.com>
> +Description:	The /sys/kernel/dmabuf directory contains a
> +		snapshot of the internal state of every DMA-BUF.
> +		/sys/kernel/dmabuf/<inode_number> will contain the
> +		statistics for the DMA-BUF with the unique inode number
> +		<inode_number>
> +Users:		kernel memory tuning/debugging tools
> +
> +What:		/sys/kernel/dmabuf/<inode_number>/exporter_name
> +Date:		November 2020
> +KernelVersion:	v5.11
> +Contact:	Hridya Valsaraju <hridya@google.com>
> +Description:	This file is read-only and contains the name of the exporter of
> +		the DMA-BUF.
> +
> +What:		/sys/kernel/dmabuf/<inode_number>/size
> +Dat:		November 2020
> +KernelVersion:	v5.11
> +Contact:	Hridya Valsaraju <hridya@google.com>
> +Description:	This file is read-only and specifies the size of the DMA-BUF in
> +		bytes.
> +
> +What:		/sys/kernel/dmabuf/<inode_number>/dev_map_info
> +Dat:		November 2020
> +KernelVersion:	v5.11
> +Contact:	Hridya Valsaraju <hridya@google.com>
> +Description:	This file is read-only and lists the name of devices currently
> +		mapping the DMA-BUF in a space-separated format.
> +
> diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
> index 4f8224a6ac95..2fed26f14548 100644
> --- a/drivers/dma-buf/Kconfig
> +++ b/drivers/dma-buf/Kconfig
> @@ -64,6 +64,17 @@ menuconfig DMABUF_HEAPS
>   	  allows userspace to allocate dma-bufs that can be shared
>   	  between drivers.
>   
> +menuconfig DMABUF_SYSFS_STATS
> +	bool "DMA-BUF sysfs statistics"
> +	select DMA_SHARED_BUFFER
> +	help
> +	   Choose this option to enable DMA-BUF sysfs statistics
> +	   in location /sys/kernel/dmabuf.
> +
> +	   /sys/kernel/dmabuf/<inode_number> will contain
> +	   statistics for the DMA-BUF with the unique inode number
> +	   <inode_number>.
> +
>   source "drivers/dma-buf/heaps/Kconfig"
>   
>   endmenu
> diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
> index 995e05f609ff..40d81f23cacf 100644
> --- a/drivers/dma-buf/Makefile
> +++ b/drivers/dma-buf/Makefile
> @@ -6,6 +6,7 @@ obj-$(CONFIG_DMABUF_HEAPS)	+= heaps/
>   obj-$(CONFIG_SYNC_FILE)		+= sync_file.o
>   obj-$(CONFIG_SW_SYNC)		+= sw_sync.o sync_debug.o
>   obj-$(CONFIG_UDMABUF)		+= udmabuf.o
> +obj-$(CONFIG_DMABUF_SYSFS_STATS) += dma-buf-sysfs-stats.o
>   
>   dmabuf_selftests-y := \
>   	selftest.o \
> diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.c b/drivers/dma-buf/dma-buf-sysfs-stats.c
> new file mode 100644
> index 000000000000..bcbef81e0a5f
> --- /dev/null
> +++ b/drivers/dma-buf/dma-buf-sysfs-stats.c
> @@ -0,0 +1,162 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +
> +#include <linux/dma-buf.h>
> +#include <linux/dma-resv.h>
> +#include <linux/kobject.h>
> +#include <linux/printk.h>
> +#include <linux/slab.h>
> +#include <linux/sysfs.h>
> +
> +#define to_dma_buf_entry_from_kobj(x) container_of(x, struct dma_buf_sysfs_entry, kobj)
> +
> +struct dma_buf_stats_attribute {
> +	struct attribute attr;
> +	ssize_t (*show)(struct dma_buf *dmabuf,
> +			struct dma_buf_stats_attribute *attr, char *buf);
> +};
> +#define to_dma_buf_stats_attr(x) container_of(x, struct dma_buf_stats_attribute, attr)
> +
> +static ssize_t dma_buf_stats_attribute_show(struct kobject *kobj,
> +					    struct attribute *attr,
> +					    char *buf)
> +{
> +	struct dma_buf_stats_attribute *attribute;
> +	struct dma_buf_sysfs_entry *sysfs_entry;
> +	struct dma_buf *dmabuf;
> +
> +	attribute = to_dma_buf_stats_attr(attr);
> +	sysfs_entry = to_dma_buf_entry_from_kobj(kobj);
> +	dmabuf = sysfs_entry->dmabuf;
> +
> +	if (!dmabuf || !attribute->show)
> +		return -EIO;
> +
> +	return attribute->show(dmabuf, attribute, buf);
> +}
> +
> +static const struct sysfs_ops dma_buf_stats_sysfs_ops = {
> +	.show = dma_buf_stats_attribute_show,
> +};
> +
> +static ssize_t exporter_name_show(struct dma_buf *dmabuf,
> +				  struct dma_buf_stats_attribute *attr,
> +				  char *buf)
> +{
> +	return sysfs_emit(buf, "%s\n", dmabuf->exp_name);
> +}
> +
> +static ssize_t size_show(struct dma_buf *dmabuf,
> +			 struct dma_buf_stats_attribute *attr,
> +			 char *buf)
> +{
> +	return sysfs_emit(buf, "%zu\n", dmabuf->size);
> +}
> +
> +static ssize_t dev_map_info_show(struct dma_buf *dmabuf,
> +				 struct dma_buf_stats_attribute *attr,
> +				 char *buf)
> +{
> +	ssize_t ret;
> +	struct dma_buf_attachment *attachment;
> +
> +	ret = dma_resv_lock_interruptible(dmabuf->resv, NULL);
> +	if (ret)
> +		return ret;
> +
> +	list_for_each_entry(attachment, &dmabuf->attachments, node) {
> +		if (attachment->map_counter) {
> +			ret += sysfs_emit_at(buf, ret, "%s ",
> +					     dev_name(attachment->dev));
> +		}

Why do you emit this only when there is a mapping? It is perfectly valid 
and current practice that importers map things only on first use.

The number of mapping is in general rather interesting, but I would just 
print that together with the importer name.

And BTW I would rename the dev_map_info to something like "attachments".

Regards,
Christian.

> +	}
> +	dma_resv_unlock(dmabuf->resv);
> +
> +	ret += sysfs_emit_at(buf, ret, "\n");
> +	return ret;
> +}
> +
> +static struct dma_buf_stats_attribute exporter_name_attribute =
> +	__ATTR_RO(exporter_name);
> +static struct dma_buf_stats_attribute size_attribute = __ATTR_RO(size);
> +static struct dma_buf_stats_attribute dev_map_info_attribute =
> +	__ATTR_RO(dev_map_info);
> +
> +static struct attribute *dma_buf_stats_default_attrs[] = {
> +	&exporter_name_attribute.attr,
> +	&size_attribute.attr,
> +	&dev_map_info_attribute.attr,
> +	NULL,
> +};
> +ATTRIBUTE_GROUPS(dma_buf_stats_default);
> +
> +static void dma_buf_sysfs_release(struct kobject *kobj)
> +{
> +	struct dma_buf_sysfs_entry *sysfs_entry;
> +
> +	sysfs_entry = to_dma_buf_entry_from_kobj(kobj);
> +	kfree(sysfs_entry);
> +}
> +
> +static struct kobj_type dma_buf_ktype = {
> +	.sysfs_ops = &dma_buf_stats_sysfs_ops,
> +	.release = dma_buf_sysfs_release,
> +	.default_groups = dma_buf_stats_default_groups,
> +};
> +
> +void dma_buf_sysfs_free(struct dma_buf *dmabuf)
> +{
> +	struct dma_buf_sysfs_entry *sysfs_entry;
> +
> +	sysfs_entry = dmabuf->sysfs_entry;
> +	if (!sysfs_entry)
> +		return;
> +
> +	kobject_del(&sysfs_entry->kobj);
> +	kobject_put(&sysfs_entry->kobj);
> +}
> +
> +static struct kset *dma_buf_stats_kset;
> +int dma_buf_init_sysfs_statistics(void)
> +{
> +	dma_buf_stats_kset = kset_create_and_add("dmabuf", NULL, kernel_kobj);
> +	if (!dma_buf_stats_kset)
> +		return -ENOMEM;
> +
> +	return 0;
> +}
> +
> +void dma_buf_uninit_sysfs_statistics(void)
> +{
> +	kset_unregister(dma_buf_stats_kset);
> +}
> +
> +int dma_buf_init_stats_kobj(struct dma_buf *dmabuf)
> +{
> +	struct dma_buf_sysfs_entry *sysfs_entry;
> +	int ret;
> +
> +	if (!dmabuf || !dmabuf->file)
> +		return -EINVAL;
> +
> +	if (!dmabuf->exp_name) {
> +		pr_err("exporter name must not be empty if stats needed\n");
> +		return -EINVAL;
> +	}
> +
> +	sysfs_entry = kzalloc(sizeof(struct dma_buf_sysfs_entry), GFP_KERNEL);
> +	if (!sysfs_entry)
> +		return -ENOMEM;
> +
> +	sysfs_entry->kobj.kset = dma_buf_stats_kset;
> +	sysfs_entry->dmabuf = dmabuf;
> +
> +	dmabuf->sysfs_entry = sysfs_entry;
> +
> +	ret = kobject_init_and_add(&sysfs_entry->kobj, &dma_buf_ktype, NULL,
> +				   "%lu", file_inode(dmabuf->file)->i_ino);
> +	if (ret)
> +		kobject_put(&sysfs_entry->kobj);
> +
> +	return ret;
> +}
> diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.h b/drivers/dma-buf/dma-buf-sysfs-stats.h
> new file mode 100644
> index 000000000000..42fae7d1b11f
> --- /dev/null
> +++ b/drivers/dma-buf/dma-buf-sysfs-stats.h
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef _DMA_BUF_SYSFS_STATS_H
> +#define _DMA_BUF_SYSFS_STATS_H
> +
> +#ifdef CONFIG_DMABUF_SYSFS_STATS
> +
> +int dma_buf_init_sysfs_statistics(void);
> +void dma_buf_uninit_sysfs_statistics(void);
> +
> +int dma_buf_init_stats_kobj(struct dma_buf *dmabuf);
> +static inline void dma_buf_update_attachment_map_count(struct dma_buf_attachment *attach,
> +						       int delta)
> +{
> +	attach->map_counter += delta;
> +}
> +void dma_buf_sysfs_free(struct dma_buf *dmabuf);
> +
> +#else
> +
> +static inline int dma_buf_init_sysfs_statistics(void)
> +{
> +	return 0;
> +}
> +
> +static inline void dma_buf_uninit_sysfs_statistics(void) {}
> +
> +static inline int dma_buf_init_stats_kobj(struct dma_buf *dmabuf)
> +{
> +	return 0;
> +}
> +static inline void dma_buf_sysfs_free(struct dma_buf *dmabuf) {}
> +static inline void dma_buf_update_attachment_map_count(struct dma_buf_attachment *attach,
> +						       int delta) {}
> +
> +#endif
> +#endif // _DMA_BUF_SYSFS_STATS_H
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index e63684d4cd90..e93df0069bf8 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -29,6 +29,8 @@
>   #include <uapi/linux/dma-buf.h>
>   #include <uapi/linux/magic.h>
>   
> +#include "dma-buf-sysfs-stats.h"
> +
>   static inline int is_dma_buf_file(struct file *);
>   
>   struct dma_buf_list {
> @@ -83,6 +85,7 @@ static void dma_buf_release(struct dentry *dentry)
>   	if (dmabuf->resv == (struct dma_resv *)&dmabuf[1])
>   		dma_resv_fini(dmabuf->resv);
>   
> +	dma_buf_sysfs_free(dmabuf);
>   	module_put(dmabuf->owner);
>   	kfree(dmabuf->name);
>   	kfree(dmabuf);
> @@ -566,6 +569,10 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
>   	file->f_mode |= FMODE_LSEEK;
>   	dmabuf->file = file;
>   
> +	ret = dma_buf_init_stats_kobj(dmabuf);
> +	if (ret)
> +		goto err_sysfs;
> +
>   	mutex_init(&dmabuf->lock);
>   	INIT_LIST_HEAD(&dmabuf->attachments);
>   
> @@ -575,6 +582,14 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
>   
>   	return dmabuf;
>   
> +err_sysfs:
> +	/*
> +	 * Set file->f_path.dentry->d_fsdata to NULL so that when
> +	 * dma_buf_release() gets invoked by dentry_ops, it exits
> +	 * early before calling the release() dma_buf op.
> +	 */
> +	file->f_path.dentry->d_fsdata = NULL;
> +	fput(file);
>   err_dmabuf:
>   	kfree(dmabuf);
>   err_module:
> @@ -732,6 +747,7 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
>   			dma_resv_unlock(attach->dmabuf->resv);
>   		attach->sgt = sgt;
>   		attach->dir = DMA_BIDIRECTIONAL;
> +		dma_buf_update_attachment_map_count(attach, 1 /* delta */);
>   	}
>   
>   	return attach;
> @@ -786,6 +802,7 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
>   			dma_resv_lock(attach->dmabuf->resv, NULL);
>   
>   		dmabuf->ops->unmap_dma_buf(attach, attach->sgt, attach->dir);
> +		dma_buf_update_attachment_map_count(attach, -1 /* delta */);
>   
>   		if (dma_buf_is_dynamic(attach->dmabuf)) {
>   			dma_buf_unpin(attach);
> @@ -925,6 +942,9 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
>   	}
>   #endif /* CONFIG_DMA_API_DEBUG */
>   
> +	if (!IS_ERR(sg_table))
> +		dma_buf_update_attachment_map_count(attach, 1 /* delta */);
> +
>   	return sg_table;
>   }
>   EXPORT_SYMBOL_GPL(dma_buf_map_attachment);
> @@ -962,6 +982,8 @@ void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
>   	if (dma_buf_is_dynamic(attach->dmabuf) &&
>   	    !IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY))
>   		dma_buf_unpin(attach);
> +
> +	dma_buf_update_attachment_map_count(attach, -1 /* delta */);
>   }
>   EXPORT_SYMBOL_GPL(dma_buf_unmap_attachment);
>   
> @@ -1399,6 +1421,12 @@ static inline void dma_buf_uninit_debugfs(void)
>   
>   static int __init dma_buf_init(void)
>   {
> +	int ret;
> +
> +	ret = dma_buf_init_sysfs_statistics();
> +	if (ret)
> +		return ret;
> +
>   	dma_buf_mnt = kern_mount(&dma_buf_fs_type);
>   	if (IS_ERR(dma_buf_mnt))
>   		return PTR_ERR(dma_buf_mnt);
> @@ -1414,5 +1442,6 @@ static void __exit dma_buf_deinit(void)
>   {
>   	dma_buf_uninit_debugfs();
>   	kern_unmount(dma_buf_mnt);
> +	dma_buf_uninit_sysfs_statistics();
>   }
>   __exitcall(dma_buf_deinit);
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index cf72699cb2bc..f5cab13afdfc 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -294,6 +294,7 @@ struct dma_buf_ops {
>    * @poll: for userspace poll support
>    * @cb_excl: for userspace poll support
>    * @cb_shared: for userspace poll support
> + * @sysfs_entry: for exposing information about this buffer in sysfs
>    *
>    * This represents a shared buffer, created by calling dma_buf_export(). The
>    * userspace representation is a normal file descriptor, which can be created by
> @@ -329,6 +330,13 @@ struct dma_buf {
>   
>   		__poll_t active;
>   	} cb_excl, cb_shared;
> +#ifdef CONFIG_DMABUF_SYSFS_STATS
> +	/* for sysfs stats */
> +	struct dma_buf_sysfs_entry {
> +		struct kobject kobj;
> +		struct dma_buf *dmabuf;
> +	} *sysfs_entry;
> +#endif
>   };
>   
>   /**
> @@ -378,6 +386,8 @@ struct dma_buf_attach_ops {
>    * @importer_ops: importer operations for this attachment, if provided
>    * dma_buf_map/unmap_attachment() must be called with the dma_resv lock held.
>    * @importer_priv: importer specific attachment data.
> + * @map_counter: Number of times the buffer has been mapped through this
> + * dma_buf_map_attachment.
>    *
>    * This structure holds the attachment information between the dma_buf buffer
>    * and its user device(s). The list contains one attachment struct per device
> @@ -398,6 +408,9 @@ struct dma_buf_attachment {
>   	const struct dma_buf_attach_ops *importer_ops;
>   	void *importer_priv;
>   	void *priv;
> +#ifdef CONFIG_DMABUF_SYSFS_STATS
> +	unsigned int map_counter;
> +#endif
>   };
>   
>   /**

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
