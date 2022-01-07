Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C15487566
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 11:23:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF44211324E;
	Fri,  7 Jan 2022 10:22:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2071.outbound.protection.outlook.com [40.107.236.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D4D2113273
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 10:22:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m0r+7S5qgYFeVTi4G+A1Gki9vZBPKiD9ZZRD5x0Nb1Vor5LGyDIu7yzXf6dPAJXiZuFjYHTYdLeYZ4fXEa9vVn/fZgqjnPWyVqg5ciR3PWtY3vVPaJeA6RjsXrYkkruicnVYqPBzf8zQhMHKw0uf2X8NeiJ7olfKnx4exCRSJk1NY83H2CTsU3Ry6raeQlDXEn4/BZR1OWHk2e+MfsilnqAlx4Y+/rLnrJ+BDrrn1uMQtY3gVI27uu0SN1dY9s/GaRCdFrl2MMJl68g9nzH6iePPy0RFrXtBcc+Qb0XHKhq83zPlTcfpL1RlsDEaU2RNxJkTuukSwC9EmZKOoruK/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9tt1iuL2W16EaprPmau7aPnLo5Vm1Dd9eQRAawXT++Q=;
 b=odsg/Itld1ZpilBfp57nV2n23FT/b+vIIXHifMrjpYguqEhcCEx/jSHIjjk08vgCvMvJbExlsc/VUxV9NRaN3uB4tNlMqddlnJHjzSPYYVYIwC8fVrtiCBNKAWbUKNjYynrDhL0OxbloXJu00IvjkUnRBIpE1Y8WrNuaE9+PmwTpnfT0n8p2aJ7aD7iPaf/lfqgd9ux3+wOP03EMpFwtRxHz87L5wYn6oXzo4YfCzMjVGf8TUL52QA095lZqSRHbyNSJExBGWM4z+kJ8lIbo9e/KqC3aW0Tu7wS2KR8+ATXiaBnrLcAkQOc7FccQEvVRnnKy0tivwdb5ULbgFSecaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9tt1iuL2W16EaprPmau7aPnLo5Vm1Dd9eQRAawXT++Q=;
 b=yA1Fu0DzshdQq1wXZu20L72gqFX4yvZyJ1BfOhEZXsoi7Yq40vtVZBd9hustNhvgQl2lKtUuaYpfkZKdnLqozdmODRUZUdQz8xmsWCWqFcEYqf3Ok+gRs0vipeQIbJD9yxB48SjISXEXNlz9j+EDpRLBycSa2c4mp3LLQaqejlA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1536.namprd12.prod.outlook.com
 (2603:10b6:301:6::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Fri, 7 Jan
 2022 10:22:50 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::b4d6:f148:3798:6246]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::b4d6:f148:3798:6246%7]) with mapi id 15.20.4867.011; Fri, 7 Jan 2022
 10:22:50 +0000
Subject: Re: [PATCH] dma-buf: Move sysfs work out of DMA-BUF export/release
 path
To: Hridya Valsaraju <hridya@google.com>
References: <20220104235148.21320-1-hridya@google.com>
 <49b29081-42df-ffcd-8fea-bd819499ff1b@amd.com>
 <CA+wgaPMWT0s0KNo_wM7jU+bH626OAVtn77f7_WX=E1wyU8aBzg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <3a29914d-0c7b-1f10-49cb-dbc1cc6e52b0@amd.com>
Date: Fri, 7 Jan 2022 11:22:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <CA+wgaPMWT0s0KNo_wM7jU+bH626OAVtn77f7_WX=E1wyU8aBzg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AS9PR06CA0320.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::33) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 57349e3d-6d63-4194-fe46-08d9d1c7a82f
X-MS-TrafficTypeDiagnostic: MWHPR12MB1536:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB15362D04A5BC22CD98D638DA834D9@MWHPR12MB1536.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IKTDtvF7qAXNjH0gnufVfKU/Fvhjg5K0EWrUw3QPM0h68/RIuQxa1BJhihP9EjaqYD59Fru8pVPhj5y9sDIPV5IwPgq0rJcSduVifcJiL+vdaorSXtU2PNO4UHK4dwdNJqOTXAlSAMXs86jeGt2X4BpjCXvT+IR9GcQq+gceNwQNhnrzbtpu3hSu3LDLY3njL3OpAbsESm4f5Bv6b7iKa5A2cK0g7pvQ1CycjNqX0KcAr+wltuxkeRd0xZyXesHkGxnjAbLLOLu9VG3g2EA40Y6tqWSYdS1XmTQWjqRukqNX7WN1bzNMPPXBkRbQBZi2TwdExGgM1Qtewm2ESl5Sp/S1dqRy+VjdinvLg1GuT6CC1bYUdJI22qKGqwNJCjbIIgA0828enqV0HhOysXrXuly32DGESMv3MnUNk4BgQtLgyLGoMtVE8p2N/AtWoJ7i3KAl95L5H2iuQfi7vi6GAEscKTgg6tmVZ/e++S0g9/nUX40Olb5JyJbkEv1rqhHUiGRsRvpMh9PPWTqH3bdmWEHxXmov8dGb6wK68656uAmn7JhNJWgJXxZT4tIjU4vAETrvRHUqxihA7tl8hxXQ+L65oCl9+wkgE91AMfhEVXMUZe/75ck91q8MPjhgx1PyUMM1YjMfNAV5IY412KSNPUM2hOkKYivj+v+qZd57oG8CJj/MJOU1ng1awfaiYTsEII1H+QXAFfMjJZDT4upQRw6XLEzKE/doMbrloOVmb0XzHl7x3aXU4K3jLIBYIBG3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(6666004)(2906002)(66574015)(54906003)(66556008)(31686004)(53546011)(86362001)(7416002)(66476007)(2616005)(66946007)(6506007)(4326008)(6512007)(508600001)(186003)(83380400001)(8676002)(30864003)(316002)(6916009)(31696002)(38100700002)(6486002)(36756003)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHVoSVRZZStnY0syZlVDYnEwbC9HbFg2SEJycmZ0amtiallsZVZNTCthczYy?=
 =?utf-8?B?QitYYkhQdVhDRDhvdG15Q1RrT01IdkkxTTA1WkxYUzd4cllDZDVjSDlMVmp4?=
 =?utf-8?B?WWFGVUxDOEhIZjk0UTBhWFk5YTlkMFlMbVFaVWpIQ3o0bWxxSlYvclpldEpT?=
 =?utf-8?B?T2NmTWxXMDVwYzVlNE5nY2x6V2F2WFhDS1MycTRwbEJXQlozQ21QNTRONkR6?=
 =?utf-8?B?d29OUXBxV1JWbVh1b2VsTTZEOUhaNnZhYjlBOFdwdDFiZEtQZmhmREZZSWRa?=
 =?utf-8?B?cndxc04vaG5FclI0THdtOHgydzZLdXlIbU8yeFBFa0tlWXR1SUhrdzUrOTRr?=
 =?utf-8?B?a2dLb1ZSRjVON1dleTJCMS90OFhRbnp1Y2U4ZXVieGNkZzhSSEZWcnRVWU1t?=
 =?utf-8?B?Y3kzMUNlUUJ3Zkp3LzFoODdOU2ZmSitrSFdVQWVhdGQzbjlvZklwK3crT2lF?=
 =?utf-8?B?NWhxRCtWWmdWYXpjaEZ3L3QxWk8vcTNDMjZJS3libnJvS3BjVVFDR2NIZklL?=
 =?utf-8?B?K05WWjYzNmF4VjJMZ3JrUlBvY1crd01DS21MazRaY1p5cFJHN0xxdkF6YVk5?=
 =?utf-8?B?N3RhbXh3ejlKVDg5NWpscGZNK1JJTVVpRWhPRC9BeGlaR2F5Qmd4M1R3RWZs?=
 =?utf-8?B?bU9yOVRUVXVLU1ROeG9tNnJsU0NkQjB3b0lFd3hidjVTeHVMRCtpOFIwSk80?=
 =?utf-8?B?MXQrRHZuUHdmMUNPbVNvSEs1eWVjZXRkQWVMbzM3VllaTk1RSmxKRStMdnVP?=
 =?utf-8?B?UnFKQVJ1VlBSSGRzN0JWVkRBS0x3YzZGM3ljVERjQy9oMjBGN0Jabm5vaDNX?=
 =?utf-8?B?d1R3Ky9lODg0dWNYNlk0Z080cWRyUFJJaTM4NXQvZnZkTGk2T0k2dFZVUm40?=
 =?utf-8?B?ald0SU1pcFhPUWFvN0FNdlVzSzI0RUgzZEdRNTlXSk5MUEc2ajRBczdRR0tJ?=
 =?utf-8?B?Z0JmUkdTRXRPYk1HbStCK051eEk3cnRxVUxxN1JQczFuYitXNU5Ob1JiRkNY?=
 =?utf-8?B?ZFJ2SlZVSmRUazYwTDcrWVdTanU4M0kxOHFmSWdYUTRSaWJRK05sS3g3MDZY?=
 =?utf-8?B?R3FvRkYvV1FYc3FjNmxTWEIwd0xmL1ZRNHJtMi8rbzM0RmdnZjAyZnZCZVNi?=
 =?utf-8?B?YnVuSEl0S2FLa2ViR2UvVDc2eDYyLzA4dnZEcnJlQWRNMXZmaDVIeiswU3FL?=
 =?utf-8?B?RzZNd2lGMUpFbnVJbWdsRkpmQjJYd1pWMHl4eWwxL3BybWlPMDRLYWVSZjk5?=
 =?utf-8?B?S0VBWnVEaW5sWjlSM0FLMDN6c3NUcWlaL08wNzdYTmlDc2xEUkZxYThEdTdr?=
 =?utf-8?B?alFPM2pCT04wSTkrR0plMFFIbjV4SUlHWnFCRnVPbWRQeDFXWUkyNWlIdTk5?=
 =?utf-8?B?ak5SZlVHeXd3NWZVSVpiZng3MnYrZExwazl3RWlsZTZ5VmV4TDR0djRkQjZ4?=
 =?utf-8?B?WlNta1hzRjVSMndqNDkxQUY2RG9SZS90VnViU0psNnB1WDArV05jak5uR1Bl?=
 =?utf-8?B?dXk1Rys0UUNmM2VqZnBpU1ZXNjlGb0FCTGFJVUdFZTBsQlpjMXNWeHJ4emMx?=
 =?utf-8?B?TCtxb21WMTlwbE1GTVdCOTFwSmE4YXJlQkU2elVOME5QQTJJeFRLc0Z3Ri8y?=
 =?utf-8?B?dmplWVo3N1F5bGxTQ3NoN2lpdjM4VFRoM0gzMm9Dd05SNjZQeFB6aEoyeW5N?=
 =?utf-8?B?blRkOSt6QTNOejFaYUkxZkM3NnBkUjlhSzZkVGI1T3dGUGRoT01IT0JLVUow?=
 =?utf-8?B?L0wwNnN1TUtWaWJtTXBlOGVDRnF4MU5GNVdna1owRlh6bUZzaDdvZmoxQSti?=
 =?utf-8?B?VHRMK2QzS1hRM0Y2V2t6VnY4aGxka1p1MzRnNlVZMUFVdjR1Z2U0U2Q3MEMy?=
 =?utf-8?B?dFVSTERBbWJ1QnFnUFI1U2lpYUxYYkJoUUtpVmtKanZWZFJqRE9ZSWNOVEt6?=
 =?utf-8?B?K1ZzdGpuN1I4YVFZaWVTOXZ4L0VQZlJjZjFYSGFITHVpM0NIVUpQOE9QZ3pz?=
 =?utf-8?B?N3YrY3pwenJMc3RPejdsS3ZqY0YxdnhCU011Rk1qRHdxeHF6Nkh6U2R0T1BK?=
 =?utf-8?B?engyaGxQb1JEZHIrK29vakU1Y2RUeXdpTnM2OU1XLytXUjhJdGg5K1VZMTla?=
 =?utf-8?B?RmRySThvTitWRzdCOFJNUjdDV3UrRERiYStJRDVlTVdjNzdWaFg2Z055OEcr?=
 =?utf-8?Q?BEkZlR11UOLDkxuqbqy1/Jk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57349e3d-6d63-4194-fe46-08d9d1c7a82f
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2022 10:22:50.3644 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ERkX/+nU4fxLxRMtNWtJkCEaXzIxBYyo7VRvvNEp4ICKWzN7kkbceU4IJDCaeF0V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1536
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
Cc: keescook@google.com, Daniel Vetter <daniel.vetter@ffwll.ch>,
 kaleshsingh@google.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tjmercier@google.com,
 linaro-mm-sig@lists.linaro.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, surenb@google.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 06.01.22 um 20:04 schrieb Hridya Valsaraju:
> On Thu, Jan 6, 2022 at 12:59 AM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 05.01.22 um 00:51 schrieb Hridya Valsaraju:
>>> Recently, we noticed an issue where a process went into direct reclaim
>>> while holding the kernfs rw semaphore for sysfs in write(exclusive)
>>> mode. This caused processes who were doing DMA-BUF exports and releases
>>> to go into uninterruptible sleep since they needed to acquire the same
>>> semaphore for the DMA-BUF sysfs entry creation/deletion. In order to avoid
>>> blocking DMA-BUF export/release for an indeterminate amount of time
>>> while another process is holding the sysfs rw semaphore in exclusive
>>> mode, this patch moves the per-buffer sysfs file creation/deleteion to
>>> a kthread.
>> Well I absolutely don't think that this is justified.
>>
>> You adding tons of complexity here just to avoid the overhead of
>> creating the sysfs files while exporting DMA-bufs which is an operation
>> which should be done exactly once in the lifecycle for the most common
>> use case.
>>
>> Please explain further why that should be necessary.
> Hi Christian,
>
> We noticed that the issue sometimes causes the exporting process to go
> to the uninterrupted sleep state for tens of milliseconds which
> unfortunately leads to user-perceptible UI jank. This is the reason
> why we are trying to move the sysfs entry creation and deletion out of
> the DMA-BUF export/release path. I will update the commit message to
> include the same in the next revision.

That is still not a justification for this change. The question is why 
do you need that in the first place?

Exporting a DMA-buf should be something would should be very rarely, 
e.g. only at the start of an application.

So this strongly looks like you are trying to optimize for an use case 
where we should probably rethink what userspace is doing here instead.

If we would want to go down this route you would need to change all the 
drivers implementing the DMA-buf export functionality to avoid 
uninterruptible sleep as well and that is certainly something I would NAK.

Regards,
Christian.

>
> Thanks,
> Hridya
>
>
>> Regards,
>> Christian.
>>
>>> Fixes: bdb8d06dfefd ("dmabuf: Add the capability to expose DMA-BUF stats in sysfs")
>>> Signed-off-by: Hridya Valsaraju <hridya@google.com>
>>> ---
>>>    drivers/dma-buf/dma-buf-sysfs-stats.c | 343 ++++++++++++++++++++++++--
>>>    include/linux/dma-buf.h               |  46 ++++
>>>    2 files changed, 366 insertions(+), 23 deletions(-)
>>>
>>> diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.c b/drivers/dma-buf/dma-buf-sysfs-stats.c
>>> index 053baadcada9..3251fdf2f05f 100644
>>> --- a/drivers/dma-buf/dma-buf-sysfs-stats.c
>>> +++ b/drivers/dma-buf/dma-buf-sysfs-stats.c
>>> @@ -7,13 +7,39 @@
>>>
>>>    #include <linux/dma-buf.h>
>>>    #include <linux/dma-resv.h>
>>> +#include <linux/freezer.h>
>>>    #include <linux/kobject.h>
>>> +#include <linux/kthread.h>
>>> +#include <linux/list.h>
>>>    #include <linux/printk.h>
>>> +#include <linux/sched/signal.h>
>>>    #include <linux/slab.h>
>>>    #include <linux/sysfs.h>
>>>
>>>    #include "dma-buf-sysfs-stats.h"
>>>
>>> +struct dmabuf_kobj_work {
>>> +     struct list_head list;
>>> +     struct dma_buf_sysfs_entry *sysfs_entry;
>>> +     struct dma_buf_sysfs_entry_metadata *sysfs_metadata;
>>> +     unsigned long uid;
>>> +};
>>> +
>>> +/* Both kobject setup and teardown work gets queued on the list. */
>>> +static LIST_HEAD(dmabuf_kobj_work_list);
>>> +
>>> +/* dmabuf_kobj_list_lock protects dmabuf_kobj_work_list. */
>>> +static DEFINE_SPINLOCK(dmabuf_kobj_list_lock);
>>> +
>>> +/*
>>> + * dmabuf_sysfs_show_lock prevents a race between a DMA-BUF sysfs file being
>>> + * read and the DMA-BUF being freed by protecting sysfs_entry->dmabuf.
>>> + */
>>> +static DEFINE_SPINLOCK(dmabuf_sysfs_show_lock);
>>> +
>>> +static struct task_struct *dmabuf_kobject_task;
>>> +static wait_queue_head_t dmabuf_kobject_waitqueue;
>>> +
>>>    #define to_dma_buf_entry_from_kobj(x) container_of(x, struct dma_buf_sysfs_entry, kobj)
>>>
>>>    /**
>>> @@ -64,15 +90,26 @@ static ssize_t dma_buf_stats_attribute_show(struct kobject *kobj,
>>>        struct dma_buf_stats_attribute *attribute;
>>>        struct dma_buf_sysfs_entry *sysfs_entry;
>>>        struct dma_buf *dmabuf;
>>> +     int ret;
>>>
>>>        attribute = to_dma_buf_stats_attr(attr);
>>>        sysfs_entry = to_dma_buf_entry_from_kobj(kobj);
>>> +
>>> +     /*
>>> +      * acquire dmabuf_sysfs_show_lock to prevent a race with the DMA-BUF
>>> +      * being freed while sysfs_entry->dmabuf is being accessed.
>>> +      */
>>> +     spin_lock(&dmabuf_sysfs_show_lock);
>>>        dmabuf = sysfs_entry->dmabuf;
>>>
>>> -     if (!dmabuf || !attribute->show)
>>> +     if (!dmabuf || !attribute->show) {
>>> +             spin_unlock(&dmabuf_sysfs_show_lock);
>>>                return -EIO;
>>> +     }
>>>
>>> -     return attribute->show(dmabuf, attribute, buf);
>>> +     ret = attribute->show(dmabuf, attribute, buf);
>>> +     spin_unlock(&dmabuf_sysfs_show_lock);
>>> +     return ret;
>>>    }
>>>
>>>    static const struct sysfs_ops dma_buf_stats_sysfs_ops = {
>>> @@ -118,33 +155,275 @@ static struct kobj_type dma_buf_ktype = {
>>>        .default_groups = dma_buf_stats_default_groups,
>>>    };
>>>
>>> -void dma_buf_stats_teardown(struct dma_buf *dmabuf)
>>> +/* Statistics files do not need to send uevents. */
>>> +static int dmabuf_sysfs_uevent_filter(struct kset *kset, struct kobject *kobj)
>>>    {
>>> -     struct dma_buf_sysfs_entry *sysfs_entry;
>>> +     return 0;
>>> +}
>>>
>>> -     sysfs_entry = dmabuf->sysfs_entry;
>>> -     if (!sysfs_entry)
>>> -             return;
>>> +static const struct kset_uevent_ops dmabuf_sysfs_no_uevent_ops = {
>>> +     .filter = dmabuf_sysfs_uevent_filter,
>>> +};
>>> +
>>> +/* setup of sysfs entries done asynchronously in the worker thread. */
>>> +static void dma_buf_sysfs_stats_setup_work(struct dmabuf_kobj_work *kobject_work)
>>> +{
>>> +     struct dma_buf_sysfs_entry *sysfs_entry = kobject_work->sysfs_entry;
>>> +     struct dma_buf_sysfs_entry_metadata *sysfs_metadata =
>>> +                     kobject_work->sysfs_metadata;
>>> +     bool free_metadata = false;
>>> +
>>> +     int ret = kobject_init_and_add(&sysfs_entry->kobj, &dma_buf_ktype, NULL,
>>> +                                    "%lu", kobject_work->uid);
>>> +     if (ret) {
>>> +             kobject_put(&sysfs_entry->kobj);
>>> +
>>> +             spin_lock(&sysfs_metadata->sysfs_entry_lock);
>>> +             if (sysfs_metadata->status == SYSFS_ENTRY_INIT_ABORTED) {
>>> +                     /*
>>> +                      * SYSFS_ENTRY_INIT_ABORTED means that the DMA-BUF has already
>>> +                      * been freed. At this point, its safe to free the memory for
>>> +                      * the sysfs_metadata;
>>> +                      */
>>> +                     free_metadata = true;
>>> +             } else {
>>> +                     /*
>>> +                      * The DMA-BUF has not yet been freed, set the status to
>>> +                      * sysfs_entry_error so that when the DMA-BUF gets
>>> +                      * freed, we know there is no need to teardown the sysfs
>>> +                      * entry.
>>> +                      */
>>> +                     sysfs_metadata->status = SYSFS_ENTRY_ERROR;
>>> +             }
>>> +             goto unlock;
>>> +     }
>>> +
>>> +     /*
>>> +      * If the DMA-BUF has not yet been released, status would still be
>>> +      * SYSFS_ENTRY_INIT_IN_PROGRESS. We set the status as initialized.
>>> +      */
>>> +     spin_lock(&sysfs_metadata->sysfs_entry_lock);
>>> +     if (sysfs_metadata->status == SYSFS_ENTRY_INIT_IN_PROGRESS) {
>>> +             sysfs_metadata->status = SYSFS_ENTRY_INITIALIZED;
>>> +             goto unlock;
>>> +     }
>>>
>>> +     /*
>>> +      * At this point the status is SYSFS_ENTRY_INIT_ABORTED which means
>>> +      * that the DMA-BUF has already been freed. Hence, we cleanup the
>>> +      * sysfs_entry and its metadata since neither of them are needed
>>> +      * anymore.
>>> +      */
>>> +     free_metadata = true;
>>>        kobject_del(&sysfs_entry->kobj);
>>>        kobject_put(&sysfs_entry->kobj);
>>> +
>>> +unlock:
>>> +     spin_unlock(&sysfs_metadata->sysfs_entry_lock);
>>> +     if (free_metadata) {
>>> +             kfree(kobject_work->sysfs_metadata);
>>> +             kobject_work->sysfs_metadata = NULL;
>>> +     }
>>>    }
>>>
>>> +/* teardown of sysfs entries done asynchronously in the worker thread. */
>>> +static void dma_buf_sysfs_stats_teardown_work(struct dmabuf_kobj_work *kobject_work)
>>> +{
>>> +     struct dma_buf_sysfs_entry *sysfs_entry = kobject_work->sysfs_entry;
>>>
>>> -/* Statistics files do not need to send uevents. */
>>> -static int dmabuf_sysfs_uevent_filter(struct kset *kset, struct kobject *kobj)
>>> +     kobject_del(&sysfs_entry->kobj);
>>> +     kobject_put(&sysfs_entry->kobj);
>>> +
>>> +     kfree(kobject_work->sysfs_metadata);
>>> +     kobject_work->sysfs_metadata = NULL;
>>> +}
>>> +
>>> +/* do setup or teardown of sysfs entries as required */
>>> +static void do_kobject_work(struct dmabuf_kobj_work *kobject_work)
>>>    {
>>> +     struct dma_buf_sysfs_entry_metadata *sysfs_metadata;
>>> +     bool setup_needed = false;
>>> +     bool teardown_needed = false;
>>> +
>>> +     sysfs_metadata = kobject_work->sysfs_metadata;
>>> +     spin_lock(&sysfs_metadata->sysfs_entry_lock);
>>> +     if (sysfs_metadata->status == SYSFS_ENTRY_UNINITIALIZED) {
>>> +             setup_needed = true;
>>> +             sysfs_metadata->status = SYSFS_ENTRY_INIT_IN_PROGRESS;
>>> +     } else if (sysfs_metadata->status == SYSFS_ENTRY_INITIALIZED) {
>>> +             teardown_needed = true;
>>> +     }
>>> +
>>> +     /*
>>> +      * It is ok to release the sysfs_entry_lock here.
>>> +      *
>>> +      * If setup_needed is true, we check the status again after the kobject
>>> +      * initialization to see if it has been set to SYSFS_ENTRY_INIT_ABORTED
>>> +      * and if so teardown the kobject.
>>> +      *
>>> +      * If teardown_needed is true, there are no more changes expected to the
>>> +      * status.
>>> +      *
>>> +      * If neither setup_needed nor teardown needed are true, it
>>> +      * means the DMA-BUF was freed before we got around to setting up the
>>> +      * sysfs entry and hence we just need to release the metadata and
>>> +      * return.
>>> +      */
>>> +     spin_unlock(&kobject_work->sysfs_metadata->sysfs_entry_lock);
>>> +
>>> +     if (setup_needed)
>>> +             dma_buf_sysfs_stats_setup_work(kobject_work);
>>> +     else if (teardown_needed)
>>> +             dma_buf_sysfs_stats_teardown_work(kobject_work);
>>> +     else
>>> +             kfree(kobject_work->sysfs_metadata);
>>> +
>>> +     kfree(kobject_work);
>>> +}
>>> +
>>> +static struct dmabuf_kobj_work *get_next_kobj_work(void)
>>> +{
>>> +     struct dmabuf_kobj_work *kobject_work;
>>> +
>>> +     spin_lock(&dmabuf_kobj_list_lock);
>>> +     kobject_work = list_first_entry_or_null(&dmabuf_kobj_work_list,
>>> +                                             struct dmabuf_kobj_work, list);
>>> +     if (kobject_work)
>>> +             list_del(&kobject_work->list);
>>> +     spin_unlock(&dmabuf_kobj_list_lock);
>>> +     return kobject_work;
>>> +}
>>> +
>>> +static int kobject_work_thread(void *data)
>>> +{
>>> +     struct dmabuf_kobj_work *kobject_work;
>>> +
>>> +     while (1) {
>>> +             wait_event_freezable(dmabuf_kobject_waitqueue,
>>> +                                  (kobject_work = get_next_kobj_work()));
>>> +             do_kobject_work(kobject_work);
>>> +     }
>>> +
>>>        return 0;
>>>    }
>>>
>>> -static const struct kset_uevent_ops dmabuf_sysfs_no_uevent_ops = {
>>> -     .filter = dmabuf_sysfs_uevent_filter,
>>> -};
>>> +static int kobject_worklist_init(void)
>>> +{
>>> +     init_waitqueue_head(&dmabuf_kobject_waitqueue);
>>> +     dmabuf_kobject_task = kthread_run(kobject_work_thread, NULL,
>>> +                                       "%s", "dmabuf-kobject-worker");
>>> +     if (IS_ERR(dmabuf_kobject_task)) {
>>> +             pr_err("Creating thread for deferred sysfs entry creation/deletion failed\n");
>>> +             return PTR_ERR(dmabuf_kobject_task);
>>> +     }
>>> +     sched_set_normal(dmabuf_kobject_task, MAX_NICE);
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static void deferred_kobject_create(struct dmabuf_kobj_work *kobject_work)
>>> +{
>>> +     INIT_LIST_HEAD(&kobject_work->list);
>>> +
>>> +     spin_lock(&dmabuf_kobj_list_lock);
>>> +
>>> +     list_add_tail(&kobject_work->list, &dmabuf_kobj_work_list);
>>> +
>>> +     spin_unlock(&dmabuf_kobj_list_lock);
>>> +
>>> +     wake_up(&dmabuf_kobject_waitqueue);
>>> +}
>>> +
>>> +
>>> +void dma_buf_stats_teardown(struct dma_buf *dmabuf)
>>> +{
>>> +     struct dma_buf_sysfs_entry *sysfs_entry;
>>> +     struct dma_buf_sysfs_entry_metadata *sysfs_metadata;
>>> +     struct dmabuf_kobj_work *kobj_work;
>>> +
>>> +     sysfs_entry = dmabuf->sysfs_entry;
>>> +     if (!sysfs_entry)
>>> +             return;
>>> +
>>> +     sysfs_metadata = dmabuf->sysfs_entry_metadata;
>>> +     if (!sysfs_metadata)
>>> +             return;
>>> +
>>> +     spin_lock(&sysfs_metadata->sysfs_entry_lock);
>>> +
>>> +     if (sysfs_metadata->status == SYSFS_ENTRY_UNINITIALIZED ||
>>> +         sysfs_metadata->status == SYSFS_ENTRY_INIT_IN_PROGRESS) {
>>> +             /*
>>> +              * The sysfs entry for this buffer has not yet been initialized,
>>> +              * we set the status to SYSFS_ENTRY_INIT_ABORTED to abort the
>>> +              * initialization.
>>> +              */
>>> +             sysfs_metadata->status = SYSFS_ENTRY_INIT_ABORTED;
>>> +             spin_unlock(&sysfs_metadata->sysfs_entry_lock);
>>> +
>>> +             /*
>>> +              * In case kobject initialization completes right as we release
>>> +              * the sysfs_entry_lock, disable show() for the sysfs entry by
>>> +              * setting sysfs_entry->dmabuf to NULL to prevent a race.
>>> +              */
>>> +             spin_lock(&dmabuf_sysfs_show_lock);
>>> +             sysfs_entry->dmabuf = NULL;
>>> +             spin_unlock(&dmabuf_sysfs_show_lock);
>>> +
>>> +             return;
>>> +     }
>>> +
>>> +     if (sysfs_metadata->status == SYSFS_ENTRY_INITIALIZED) {
>>> +             /*
>>> +              * queue teardown work only if sysfs_entry is fully inititalized.
>>> +              * It is ok to release the sysfs_entry_lock here since the
>>> +              * status can no longer change.
>>> +              */
>>> +             spin_unlock(&sysfs_metadata->sysfs_entry_lock);
>>> +
>>> +             /*
>>> +              * Meanwhile disable show() for the sysfs entry to avoid a race
>>> +              * between teardown and show().
>>> +              */
>>> +             spin_lock(&dmabuf_sysfs_show_lock);
>>> +             sysfs_entry->dmabuf = NULL;
>>> +             spin_unlock(&dmabuf_sysfs_show_lock);
>>> +
>>> +             kobj_work = kzalloc(sizeof(struct dmabuf_kobj_work), GFP_KERNEL);
>>> +             if (!kobj_work) {
>>> +                     /* do the teardown immediately. */
>>> +                     kobject_del(&sysfs_entry->kobj);
>>> +                     kobject_put(&sysfs_entry->kobj);
>>> +                     kfree(sysfs_metadata);
>>> +             } else {
>>> +                     /* queue teardown work. */
>>> +                     kobj_work->sysfs_entry = dmabuf->sysfs_entry;
>>> +                     kobj_work->sysfs_metadata = dmabuf->sysfs_entry_metadata;
>>> +                     deferred_kobject_create(kobj_work);
>>> +             }
>>> +
>>> +             return;
>>> +     }
>>> +
>>> +     /*
>>> +      * status is SYSFS_ENTRY_INIT_ERROR so we only need to free the
>>> +      * metadata.
>>> +      */
>>> +     spin_unlock(&sysfs_metadata->sysfs_entry_lock);
>>> +     kfree(dmabuf->sysfs_entry_metadata);
>>> +     dmabuf->sysfs_entry_metadata = NULL;
>>> +}
>>>
>>>    static struct kset *dma_buf_stats_kset;
>>>    static struct kset *dma_buf_per_buffer_stats_kset;
>>>    int dma_buf_init_sysfs_statistics(void)
>>>    {
>>> +     int ret;
>>> +
>>> +     ret = kobject_worklist_init();
>>> +     if (ret)
>>> +             return ret;
>>> +
>>>        dma_buf_stats_kset = kset_create_and_add("dmabuf",
>>>                                                 &dmabuf_sysfs_no_uevent_ops,
>>>                                                 kernel_kobj);
>>> @@ -171,7 +450,8 @@ void dma_buf_uninit_sysfs_statistics(void)
>>>    int dma_buf_stats_setup(struct dma_buf *dmabuf)
>>>    {
>>>        struct dma_buf_sysfs_entry *sysfs_entry;
>>> -     int ret;
>>> +     struct dma_buf_sysfs_entry_metadata *sysfs_metadata;
>>> +     struct dmabuf_kobj_work *kobj_work;
>>>
>>>        if (!dmabuf || !dmabuf->file)
>>>                return -EINVAL;
>>> @@ -188,18 +468,35 @@ int dma_buf_stats_setup(struct dma_buf *dmabuf)
>>>        sysfs_entry->kobj.kset = dma_buf_per_buffer_stats_kset;
>>>        sysfs_entry->dmabuf = dmabuf;
>>>
>>> +     sysfs_metadata = kzalloc(sizeof(struct dma_buf_sysfs_entry_metadata),
>>> +                              GFP_KERNEL);
>>> +     if (!sysfs_metadata) {
>>> +             kfree(sysfs_entry);
>>> +             return -ENOMEM;
>>> +     }
>>> +
>>>        dmabuf->sysfs_entry = sysfs_entry;
>>>
>>> -     /* create the directory for buffer stats */
>>> -     ret = kobject_init_and_add(&sysfs_entry->kobj, &dma_buf_ktype, NULL,
>>> -                                "%lu", file_inode(dmabuf->file)->i_ino);
>>> -     if (ret)
>>> -             goto err_sysfs_dmabuf;
>>> +     sysfs_metadata->status = SYSFS_ENTRY_UNINITIALIZED;
>>> +     spin_lock_init(&sysfs_metadata->sysfs_entry_lock);
>>>
>>> -     return 0;
>>> +     dmabuf->sysfs_entry_metadata = sysfs_metadata;
>>>
>>> -err_sysfs_dmabuf:
>>> -     kobject_put(&sysfs_entry->kobj);
>>> -     dmabuf->sysfs_entry = NULL;
>>> -     return ret;
>>> +     kobj_work = kzalloc(sizeof(struct dmabuf_kobj_work), GFP_KERNEL);
>>> +     if (!kobj_work) {
>>> +             kfree(sysfs_entry);
>>> +             kfree(sysfs_metadata);
>>> +             return -ENOMEM;
>>> +     }
>>> +
>>> +     kobj_work->sysfs_entry = dmabuf->sysfs_entry;
>>> +     kobj_work->sysfs_metadata = dmabuf->sysfs_entry_metadata;
>>> +     /*
>>> +      * stash the inode number in struct dmabuf_kobj_work since setup
>>> +      * might race with DMA-BUF teardown.
>>> +      */
>>> +     kobj_work->uid = file_inode(dmabuf->file)->i_ino;
>>> +
>>> +     deferred_kobject_create(kobj_work);
>>> +     return 0;
>>>    }
>>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
>>> index 7ab50076e7a6..0597690023a0 100644
>>> --- a/include/linux/dma-buf.h
>>> +++ b/include/linux/dma-buf.h
>>> @@ -287,6 +287,50 @@ struct dma_buf_ops {
>>>        void (*vunmap)(struct dma_buf *dmabuf, struct dma_buf_map *map);
>>>    };
>>>
>>> +#ifdef CONFIG_DMABUF_SYSFS_STATS
>>> +enum sysfs_entry_status {
>>> +     SYSFS_ENTRY_UNINITIALIZED,
>>> +     SYSFS_ENTRY_INIT_IN_PROGRESS,
>>> +     SYSFS_ENTRY_ERROR,
>>> +     SYSFS_ENTRY_INIT_ABORTED,
>>> +     SYSFS_ENTRY_INITIALIZED,
>>> +};
>>> +
>>> +/*
>>> + * struct dma_buf_sysfs_entry_metadata - Holds the current status for the
>>> + * DMA-BUF sysfs entry.
>>> + *
>>> + * @status: holds the current status for the DMA-BUF sysfs entry. The status of
>>> + * the sysfs entry has the following path.
>>> + *
>>> + *                   SYSFS_ENTRY_UNINITIALIZED
>>> + *            __________________|____________________
>>> + *           |                                       |
>>> + *     SYSFS_ENTRY_INIT_IN_PROGRESS      SYSFS_ENTRY_INIT_ABORTED (DMA-BUF
>>> + *           |                                                     gets freed
>>> + *           |                                                     before
>>> + *           |                                                     init)
>>> + *   ________|_____________________________________
>>> + *   |                         |                   |
>>> + * SYSFS_ENTRY_INITIALIZED     |       SYSFS_ENTRY_INIT_ABORTED
>>> + *                             |               (DMA-BUF gets freed during kobject
>>> + *                             |               init)
>>> + *                             |
>>> + *                             |
>>> + *                 SYSFS_ENTRY_ERROR
>>> + *                 (error during kobject init)
>>> + *
>>> + * @sysfs_entry_lock: protects access to @status.
>>> + */
>>> +struct dma_buf_sysfs_entry_metadata {
>>> +     enum sysfs_entry_status status;
>>> +     /*
>>> +      * Protects sysfs_entry_metadata->status
>>> +      */
>>> +     spinlock_t sysfs_entry_lock;
>>> +};
>>> +#endif
>>> +
>>>    /**
>>>     * struct dma_buf - shared buffer object
>>>     *
>>> @@ -452,6 +496,8 @@ struct dma_buf {
>>>                struct kobject kobj;
>>>                struct dma_buf *dmabuf;
>>>        } *sysfs_entry;
>>> +
>>> +     struct dma_buf_sysfs_entry_metadata *sysfs_entry_metadata;
>>>    #endif
>>>    };
>>>

