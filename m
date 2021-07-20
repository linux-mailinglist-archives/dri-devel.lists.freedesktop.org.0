Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 819263CF6A6
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 11:12:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A75946E156;
	Tue, 20 Jul 2021 09:11:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2068.outbound.protection.outlook.com [40.107.220.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E0186E194
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 09:11:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H/+uJeik87yG5cSkTGJiuwUs28TKRhJ8PSKmRQhJEJoqz6wE52RK1vjGfeGlYF2wPkHI+eCamDTVSCNrAD7eY/CUe3qS/UT9GOEQLQWHWfKxCCudAO8vbCPp0mcWP8GdaQxj7iAGOOBiJpo4G9N+/HCMhoxxisGCRKTeXqAHykRwRwOKIlEd1jmSDLhDuCw42cDLu57oBej4MOquN7WcmJY5hZ490PlVHuiAobWcnleeHL7f8FjG25i8g7h5s8Lq+GAoirRSr2V3kpFs8tl/6qvhTrgEkqDr/z3lLjDdT+sA+V0//kqomiCH+R7NAfX2pQCTYbxD0OqbgDRwuTN6fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VP5Uh7B0WBB1Q5Luhf+WTjIIDZWtiGb1EzxPRcerhds=;
 b=iier/3iti4SBYJzkXcGUHOM49DsZkn401J6C2Oro0+a/BjmTqd7yhvDvMzCFCQ4Aa8MakKRtKVBH9P/qKf8E8w1BhITnPTLWOS0zxjCgB8o7vaGAS4/qh/PCXusKI4WTX7EZJB+0HcVoN0P5NBEVVzfZGdV3pwc6PyQh5VuGep8pAf8Z7AC7vjQMdtDB2k31y5lRNSqawrAQmTMY3agH6verNW0wnLA5TF9tSmu35BfBLbzk2Bu2ew3HXMvpnwd0KaZPKXstRxfXV0iOXBrRyJEZQ4t9E/tMRDNnt2MvLJEEHu9jLqMHCIvlDhAS+O3btCWC0masOr5uLzHXW2kPDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VP5Uh7B0WBB1Q5Luhf+WTjIIDZWtiGb1EzxPRcerhds=;
 b=oIJVKEGHEFwlTkohIAh9DN6aSfCoMZIOcozarYG0w0Fa9XVYoIR7DswIJH93htOlehxRbJmqqaX2prVEkdvsSo3V8lyXbRWEiCm4AiIs5XZHL6VjaVGFxRQbSmJySGeGLDVOD/3N8QcIpUqKmHPKOqrZZ8uXnmJKgqxNYoV/mcI=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4205.namprd12.prod.outlook.com (2603:10b6:208:198::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23; Tue, 20 Jul
 2021 09:11:50 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 09:11:50 +0000
Subject: Re: [PATCH v2] dma-buf: Delete the DMA-BUF attachment sysfs statistics
To: Hridya Valsaraju <hridya@google.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20210713040742.2680135-1-hridya@google.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <35bf2a85-f699-7179-402e-c39ddf0d9106@amd.com>
Date: Tue, 20 Jul 2021 11:11:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210713040742.2680135-1-hridya@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: FR3P281CA0055.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::18) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:8651:5b5e:8648:2fd0]
 (2a02:908:1252:fb60:8651:5b5e:8648:2fd0) by
 FR3P281CA0055.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.10 via Frontend Transport; Tue, 20 Jul 2021 09:11:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f72a437-6c8c-4577-fd4c-08d94b5e6860
X-MS-TrafficTypeDiagnostic: MN2PR12MB4205:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4205C1C8892E92DCCEDE99BC83E29@MN2PR12MB4205.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VTKv/9LGUWyW0oz0R7HEyNbh+i58en4s0nQ/erNJjB6s3rEikZx+bOYpyalC0yeNtBVhyJCPPo8/EzPCfj0hZhmspy781bPfZR537P+F1l1E0TIbMtfCVJBsP3QVCOhUzlttQYeTI7VcI0pgeih2FoDD4sLtb3uKeazF9MinMf+1srkkbHBny3vWM9YggKgB8BfKxmbJxckxvhZT8AcyBLBFZsczuvzTKo0Y/wvEACh2eUC4iVieA1NuFQyAqwfBZrufrcl23ZX0JPS/DNmkOP+Cre2tayO8TiCUAL2MGfZQ/wI78rQNr8BFROvZAtcg/ICooMW+WFQFPuM1G4Tb2iPMsW4NggJQrGAIDUFmXlVhhNonyO5gpI10ssEzM+QTYfcZdsqgHUmuZMT++W42xsgag0HBY/Q6X9IdprgRhw/BZzkgp4DaXydaUAAsSCQi/WWfY35k8WJ8/Onz2xalV2EXfMm0XiQo8qRLt956gGqfp+7MCX2Rum6aO3+kHtjXdz3ijVpsEFJYkhYsQGvJqktb4lFEwroJRn571MbkEwthlFTlWSlRgH0STLvRmTRLsGK0PUo8YajajXuuLMIJY783J/ryNY8xOlWt7pMkgzl1SOfM7ucMxn7N1Srq0rfhnm61PfjNCQaZ3+zt9wxL8X+XMrMQIR3k8d85eQ8KzrUjR9OF7imDGqbv//StaEU1rX0ZtJ524UpdDnAnA1KWlCDt3kGlsuX8K+ImojA97OUBGV8wqlVm91LKqVTdy6Tp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(39860400002)(396003)(136003)(31696002)(7416002)(86362001)(31686004)(110136005)(316002)(36756003)(30864003)(5660300002)(186003)(83380400001)(66574015)(6486002)(66946007)(66476007)(8936002)(2906002)(4326008)(38100700002)(66556008)(8676002)(6666004)(2616005)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bk4xN0k3TmxxaGZIcGFNSlF1dWZBOCtLRHd5aStxR2VsUFNFTUhGODk1SHN3?=
 =?utf-8?B?dDNCVnYwSCtTcVlUQjE3K2Y2Wk5BZkcvMFBJRzRvNGROUEVacHo5VDZ0NG5j?=
 =?utf-8?B?RHB2WGxmeDM2QU1FMStjaWFXSUUzTUpCRzVGUThlaVBnVEpCU0JkOXJmZFkv?=
 =?utf-8?B?ZDM2V2tsL2FlSnkwN3RLWU1xdjBudTZMd3BGZGkrczBDNlNhRVJYQmI1ZmMr?=
 =?utf-8?B?MFo1VHlEQ0t0Z0JVb25DL1RBYTByNUpURmdUc1AwdUlXam5KamtxV0labmdz?=
 =?utf-8?B?NXZMazlCdEhOTDkyMi8xVVlOREdCejRaMGdRTFgyUHVqOW9hVjU3VXVEWjVZ?=
 =?utf-8?B?bUU1UnpZK1ltTWt0VXVNeGxWZzFiTU8zUmVIMGd0M05MWlBvQzhhU0ZGS20z?=
 =?utf-8?B?VHNoQ1dHc1NWMEd3SEJTUFZnZUk5NTBNNEgyQTVDRlBrQ2twN3cyRkNCTE1I?=
 =?utf-8?B?OXE5ZHpUT1NlUWxZdERmcEUzRjVjNGV0d01jNjcrWXl4VGRmNVRNOU4vMzNE?=
 =?utf-8?B?U3RuQTcrekhBYVZWM2dPckFNek1pL2tTMXhLRlREblVHdklNUlZ3OFRpajVK?=
 =?utf-8?B?dXgyUTliYmRjNEF5OU1SQ2xJakRieUo3em1oWVBKTzI1ajA5ZWZpWHBibTRS?=
 =?utf-8?B?QndabXI0SnF2RVduc0J2aXJUZXBXUkNoUGpjOHFhakZ2TXMzbUlPRDRGcDhl?=
 =?utf-8?B?L3VjWTFhNFRaMzZZVmJzOXlYRmorRDdZU1h0TXJINjRTZTdtZGRsN2J1Ky96?=
 =?utf-8?B?NDdkSjlWNEdSelp3Vm9TbnZ5QTNqcjhMMHNBczFHR0ttSW9NbkhEc3owQldx?=
 =?utf-8?B?QlBLbEp4SWI4b1dxcXkzZm1BUld6b3hWdENvcVhrYWdRbEM4TEQ3bXZTWUp5?=
 =?utf-8?B?NkxyYjhqdWpiU0QrbDJNNytCQWx6TVZnQUxhcmt6VS96cEdxbTFHaE81dE1x?=
 =?utf-8?B?LzM2Um11K0IrSTdhTk9BalgvaGw4eEJGQ1dlS09LenY5TTIxb3Z3QmpiejRo?=
 =?utf-8?B?YTlidXd0WmF0NVlUSjk5c1JzR3dLWWo1MmYwK25vazlhWDZVZlB1OG1HQnpy?=
 =?utf-8?B?dGxOcTQ0cHM5c2t4ZDhzYklha0tFbGxrSjYrbzVPZDYxRHpITGJPRjhSczlF?=
 =?utf-8?B?ZjlPVkZSRU9nU29IQ2p4Zm1sUG40NjZJY2szQzJ0VnpibDRxaGZ2MFJiZnVn?=
 =?utf-8?B?ZTBpYnZxZWhwYk1RNHpMbGtoZlZEeXZzMzk2SGVseFBHTi81M2JDdytyQ2ZK?=
 =?utf-8?B?QVBoQVc4MjQvZWZKNTRKV3VxNDRNRVhzVTFJcE1nektkTGs5aGpUUTk5N1ZK?=
 =?utf-8?B?bk5zRmhLQUFiYnhROWd1VzZKdGthN09nRlh4ZUlCZkR1eFllWHFtWDNUbVNy?=
 =?utf-8?B?cjRMVm5KRVNINmtHb0JCZHRUbk5uOWpKT1R1eFhVK1VyVHc1cXVFcDBNRUp6?=
 =?utf-8?B?S1BSQlkyNHpzQ3dhcDFrYTFSbnlZUjRIUEhpeUtRZ1U3MjU0TEZyenoyN0dx?=
 =?utf-8?B?MC93MzFVNDl6T1M2RGE0VmNuN1ZlcGlCR05TVUozQnMrMTZQRkNnaVZBVysx?=
 =?utf-8?B?bXJxYTMwbE9UbXluVnRVRWhtR0xab1ByM3VaT21lcUFCN3lVclZlZTRxcWYx?=
 =?utf-8?B?WDBKUHl3LzI2ZkJlUzhwTjIwK21XQUlUMWV5cnpKWEZQdEJzMjVLdVlnS0lV?=
 =?utf-8?B?aDZ2MkxKNlA1V2w2VU15T3NwVWRuRE9XQi9MMFVtQWlhbDU5YTZ0c0N3Y2tE?=
 =?utf-8?B?YURVcVN6WWdUQm50K0hHNE9BcTZoRlczM3hVSVRqaEpVdDV1d1VPRWZJQmVX?=
 =?utf-8?B?dTBBS3pMZmZOZUVjUlc1Ulc0MUxCeHVLbXBUWlRUaFZ3QlhDalhsc1hlMklQ?=
 =?utf-8?Q?GP+KcZlLXj90z?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f72a437-6c8c-4577-fd4c-08d94b5e6860
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 09:11:50.2899 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kZRpzQYOcl0OmWGCDlg9d5IZkOuwKdipuitUE2TmH+XZheeCz27Igc6ypkvXk3Cx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4205
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
Cc: surenb@google.com, kernel-team@android.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 13.07.21 um 06:07 schrieb Hridya Valsaraju:
> The DMA-BUF attachment statistics form a subset of the DMA-BUF
> sysfs statistics that recently merged to the drm-misc tree. They are not
> UABI yet since they have not merged to the upstream Linux kernel.
>
> Since there has been a reported a performance regression due to the
> overhead of sysfs directory creation/teardown during
> dma_buf_attach()/dma_buf_detach(), this patch deletes the DMA-BUF
> attachment statistics from sysfs.
>
> Fixes: bdb8d06dfefd (dmabuf: Add the capability to expose DMA-BUF stats
> in sysfs)
> Signed-off-by: Hridya Valsaraju <hridya@google.com>
> Reviewed-by: Christian König <christian.koenig@amd.com>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>
> Changes in v2:
> Updated commit message to clarify that the sysfs files being removed
> have not yet merged to upstream Linux and are hence not ABI.
>
> Hi Christian,
>
> I have updated the commit message as per your suggestion. Please do take
> another look when you get a chance.

I've just pushed that one to drm-misc-next. Sorry for the delay.

Regards,
Christian.

>
> Thanks,
> Hridya
>
>   .../ABI/testing/sysfs-kernel-dmabuf-buffers   |  28 ----
>   drivers/dma-buf/dma-buf-sysfs-stats.c         | 140 +-----------------
>   drivers/dma-buf/dma-buf-sysfs-stats.h         |  27 ----
>   drivers/dma-buf/dma-buf.c                     |  16 --
>   include/linux/dma-buf.h                       |  17 ---
>   5 files changed, 4 insertions(+), 224 deletions(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers b/Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers
> index a243984ed420..5d3bc997dc64 100644
> --- a/Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers
> +++ b/Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers
> @@ -22,31 +22,3 @@ KernelVersion:	v5.13
>   Contact:	Hridya Valsaraju <hridya@google.com>
>   Description:	This file is read-only and specifies the size of the DMA-BUF in
>   		bytes.
> -
> -What:		/sys/kernel/dmabuf/buffers/<inode_number>/attachments
> -Date:		May 2021
> -KernelVersion:	v5.13
> -Contact:	Hridya Valsaraju <hridya@google.com>
> -Description:	This directory will contain subdirectories representing every
> -		attachment of the DMA-BUF.
> -
> -What:		/sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attachment_uid>
> -Date:		May 2021
> -KernelVersion:	v5.13
> -Contact:	Hridya Valsaraju <hridya@google.com>
> -Description:	This directory will contain information on the attached device
> -		and the number of current distinct device mappings.
> -
> -What:		/sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attachment_uid>/device
> -Date:		May 2021
> -KernelVersion:	v5.13
> -Contact:	Hridya Valsaraju <hridya@google.com>
> -Description:	This file is read-only and is a symlink to the attached device's
> -		sysfs entry.
> -
> -What:		/sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attachment_uid>/map_counter
> -Date:		May 2021
> -KernelVersion:	v5.13
> -Contact:	Hridya Valsaraju <hridya@google.com>
> -Description:	This file is read-only and contains a map_counter indicating the
> -		number of distinct device mappings of the attachment.
> diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.c b/drivers/dma-buf/dma-buf-sysfs-stats.c
> index a2638e84199c..053baadcada9 100644
> --- a/drivers/dma-buf/dma-buf-sysfs-stats.c
> +++ b/drivers/dma-buf/dma-buf-sysfs-stats.c
> @@ -40,14 +40,11 @@
>    *
>    * * ``/sys/kernel/dmabuf/buffers/<inode_number>/exporter_name``
>    * * ``/sys/kernel/dmabuf/buffers/<inode_number>/size``
> - * * ``/sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attach_uid>/device``
> - * * ``/sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attach_uid>/map_counter``
>    *
> - * The information in the interface can also be used to derive per-exporter and
> - * per-device usage statistics. The data from the interface can be gathered
> - * on error conditions or other important events to provide a snapshot of
> - * DMA-BUF usage. It can also be collected periodically by telemetry to monitor
> - * various metrics.
> + * The information in the interface can also be used to derive per-exporter
> + * statistics. The data from the interface can be gathered on error conditions
> + * or other important events to provide a snapshot of DMA-BUF usage.
> + * It can also be collected periodically by telemetry to monitor various metrics.
>    *
>    * Detailed documentation about the interface is present in
>    * Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers.
> @@ -121,120 +118,6 @@ static struct kobj_type dma_buf_ktype = {
>   	.default_groups = dma_buf_stats_default_groups,
>   };
>   
> -#define to_dma_buf_attach_entry_from_kobj(x) container_of(x, struct dma_buf_attach_sysfs_entry, kobj)
> -
> -struct dma_buf_attach_stats_attribute {
> -	struct attribute attr;
> -	ssize_t (*show)(struct dma_buf_attach_sysfs_entry *sysfs_entry,
> -			struct dma_buf_attach_stats_attribute *attr, char *buf);
> -};
> -#define to_dma_buf_attach_stats_attr(x) container_of(x, struct dma_buf_attach_stats_attribute, attr)
> -
> -static ssize_t dma_buf_attach_stats_attribute_show(struct kobject *kobj,
> -						   struct attribute *attr,
> -						   char *buf)
> -{
> -	struct dma_buf_attach_stats_attribute *attribute;
> -	struct dma_buf_attach_sysfs_entry *sysfs_entry;
> -
> -	attribute = to_dma_buf_attach_stats_attr(attr);
> -	sysfs_entry = to_dma_buf_attach_entry_from_kobj(kobj);
> -
> -	if (!attribute->show)
> -		return -EIO;
> -
> -	return attribute->show(sysfs_entry, attribute, buf);
> -}
> -
> -static const struct sysfs_ops dma_buf_attach_stats_sysfs_ops = {
> -	.show = dma_buf_attach_stats_attribute_show,
> -};
> -
> -static ssize_t map_counter_show(struct dma_buf_attach_sysfs_entry *sysfs_entry,
> -				struct dma_buf_attach_stats_attribute *attr,
> -				char *buf)
> -{
> -	return sysfs_emit(buf, "%u\n", sysfs_entry->map_counter);
> -}
> -
> -static struct dma_buf_attach_stats_attribute map_counter_attribute =
> -	__ATTR_RO(map_counter);
> -
> -static struct attribute *dma_buf_attach_stats_default_attrs[] = {
> -	&map_counter_attribute.attr,
> -	NULL,
> -};
> -ATTRIBUTE_GROUPS(dma_buf_attach_stats_default);
> -
> -static void dma_buf_attach_sysfs_release(struct kobject *kobj)
> -{
> -	struct dma_buf_attach_sysfs_entry *sysfs_entry;
> -
> -	sysfs_entry = to_dma_buf_attach_entry_from_kobj(kobj);
> -	kfree(sysfs_entry);
> -}
> -
> -static struct kobj_type dma_buf_attach_ktype = {
> -	.sysfs_ops = &dma_buf_attach_stats_sysfs_ops,
> -	.release = dma_buf_attach_sysfs_release,
> -	.default_groups = dma_buf_attach_stats_default_groups,
> -};
> -
> -void dma_buf_attach_stats_teardown(struct dma_buf_attachment *attach)
> -{
> -	struct dma_buf_attach_sysfs_entry *sysfs_entry;
> -
> -	sysfs_entry = attach->sysfs_entry;
> -	if (!sysfs_entry)
> -		return;
> -
> -	sysfs_delete_link(&sysfs_entry->kobj, &attach->dev->kobj, "device");
> -
> -	kobject_del(&sysfs_entry->kobj);
> -	kobject_put(&sysfs_entry->kobj);
> -}
> -
> -int dma_buf_attach_stats_setup(struct dma_buf_attachment *attach,
> -			       unsigned int uid)
> -{
> -	struct dma_buf_attach_sysfs_entry *sysfs_entry;
> -	int ret;
> -	struct dma_buf *dmabuf;
> -
> -	if (!attach)
> -		return -EINVAL;
> -
> -	dmabuf = attach->dmabuf;
> -
> -	sysfs_entry = kzalloc(sizeof(struct dma_buf_attach_sysfs_entry),
> -			      GFP_KERNEL);
> -	if (!sysfs_entry)
> -		return -ENOMEM;
> -
> -	sysfs_entry->kobj.kset = dmabuf->sysfs_entry->attach_stats_kset;
> -
> -	attach->sysfs_entry = sysfs_entry;
> -
> -	ret = kobject_init_and_add(&sysfs_entry->kobj, &dma_buf_attach_ktype,
> -				   NULL, "%u", uid);
> -	if (ret)
> -		goto kobj_err;
> -
> -	ret = sysfs_create_link(&sysfs_entry->kobj, &attach->dev->kobj,
> -				"device");
> -	if (ret)
> -		goto link_err;
> -
> -	return 0;
> -
> -link_err:
> -	kobject_del(&sysfs_entry->kobj);
> -kobj_err:
> -	kobject_put(&sysfs_entry->kobj);
> -	attach->sysfs_entry = NULL;
> -
> -	return ret;
> -}
>   void dma_buf_stats_teardown(struct dma_buf *dmabuf)
>   {
>   	struct dma_buf_sysfs_entry *sysfs_entry;
> @@ -243,7 +126,6 @@ void dma_buf_stats_teardown(struct dma_buf *dmabuf)
>   	if (!sysfs_entry)
>   		return;
>   
> -	kset_unregister(sysfs_entry->attach_stats_kset);
>   	kobject_del(&sysfs_entry->kobj);
>   	kobject_put(&sysfs_entry->kobj);
>   }
> @@ -290,7 +172,6 @@ int dma_buf_stats_setup(struct dma_buf *dmabuf)
>   {
>   	struct dma_buf_sysfs_entry *sysfs_entry;
>   	int ret;
> -	struct kset *attach_stats_kset;
>   
>   	if (!dmabuf || !dmabuf->file)
>   		return -EINVAL;
> @@ -315,21 +196,8 @@ int dma_buf_stats_setup(struct dma_buf *dmabuf)
>   	if (ret)
>   		goto err_sysfs_dmabuf;
>   
> -	/* create the directory for attachment stats */
> -	attach_stats_kset = kset_create_and_add("attachments",
> -						&dmabuf_sysfs_no_uevent_ops,
> -						&sysfs_entry->kobj);
> -	if (!attach_stats_kset) {
> -		ret = -ENOMEM;
> -		goto err_sysfs_attach;
> -	}
> -
> -	sysfs_entry->attach_stats_kset = attach_stats_kset;
> -
>   	return 0;
>   
> -err_sysfs_attach:
> -	kobject_del(&sysfs_entry->kobj);
>   err_sysfs_dmabuf:
>   	kobject_put(&sysfs_entry->kobj);
>   	dmabuf->sysfs_entry = NULL;
> diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.h b/drivers/dma-buf/dma-buf-sysfs-stats.h
> index 5f4703249117..a49c6e2650cc 100644
> --- a/drivers/dma-buf/dma-buf-sysfs-stats.h
> +++ b/drivers/dma-buf/dma-buf-sysfs-stats.h
> @@ -14,23 +14,8 @@ int dma_buf_init_sysfs_statistics(void);
>   void dma_buf_uninit_sysfs_statistics(void);
>   
>   int dma_buf_stats_setup(struct dma_buf *dmabuf);
> -int dma_buf_attach_stats_setup(struct dma_buf_attachment *attach,
> -			       unsigned int uid);
> -static inline void dma_buf_update_attachment_map_count(struct dma_buf_attachment *attach,
> -						       int delta)
> -{
> -	struct dma_buf_attach_sysfs_entry *entry = attach->sysfs_entry;
>   
> -	entry->map_counter += delta;
> -}
>   void dma_buf_stats_teardown(struct dma_buf *dmabuf);
> -void dma_buf_attach_stats_teardown(struct dma_buf_attachment *attach);
> -static inline unsigned int dma_buf_update_attach_uid(struct dma_buf *dmabuf)
> -{
> -	struct dma_buf_sysfs_entry *entry = dmabuf->sysfs_entry;
> -
> -	return entry->attachment_uid++;
> -}
>   #else
>   
>   static inline int dma_buf_init_sysfs_statistics(void)
> @@ -44,19 +29,7 @@ static inline int dma_buf_stats_setup(struct dma_buf *dmabuf)
>   {
>   	return 0;
>   }
> -static inline int dma_buf_attach_stats_setup(struct dma_buf_attachment *attach,
> -					     unsigned int uid)
> -{
> -	return 0;
> -}
>   
>   static inline void dma_buf_stats_teardown(struct dma_buf *dmabuf) {}
> -static inline void dma_buf_attach_stats_teardown(struct dma_buf_attachment *attach) {}
> -static inline void dma_buf_update_attachment_map_count(struct dma_buf_attachment *attach,
> -						       int delta) {}
> -static inline unsigned int dma_buf_update_attach_uid(struct dma_buf *dmabuf)
> -{
> -	return 0;
> -}
>   #endif
>   #endif // _DMA_BUF_SYSFS_STATS_H
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 510b42771974..b1a6db71c656 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -738,7 +738,6 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
>   {
>   	struct dma_buf_attachment *attach;
>   	int ret;
> -	unsigned int attach_uid;
>   
>   	if (WARN_ON(!dmabuf || !dev))
>   		return ERR_PTR(-EINVAL);
> @@ -764,13 +763,8 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
>   	}
>   	dma_resv_lock(dmabuf->resv, NULL);
>   	list_add(&attach->node, &dmabuf->attachments);
> -	attach_uid = dma_buf_update_attach_uid(dmabuf);
>   	dma_resv_unlock(dmabuf->resv);
>   
> -	ret = dma_buf_attach_stats_setup(attach, attach_uid);
> -	if (ret)
> -		goto err_sysfs;
> -
>   	/* When either the importer or the exporter can't handle dynamic
>   	 * mappings we cache the mapping here to avoid issues with the
>   	 * reservation object lock.
> @@ -797,7 +791,6 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
>   			dma_resv_unlock(attach->dmabuf->resv);
>   		attach->sgt = sgt;
>   		attach->dir = DMA_BIDIRECTIONAL;
> -		dma_buf_update_attachment_map_count(attach, 1 /* delta */);
>   	}
>   
>   	return attach;
> @@ -814,7 +807,6 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
>   	if (dma_buf_is_dynamic(attach->dmabuf))
>   		dma_resv_unlock(attach->dmabuf->resv);
>   
> -err_sysfs:
>   	dma_buf_detach(dmabuf, attach);
>   	return ERR_PTR(ret);
>   }
> @@ -864,7 +856,6 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
>   			dma_resv_lock(attach->dmabuf->resv, NULL);
>   
>   		__unmap_dma_buf(attach, attach->sgt, attach->dir);
> -		dma_buf_update_attachment_map_count(attach, -1 /* delta */);
>   
>   		if (dma_buf_is_dynamic(attach->dmabuf)) {
>   			dmabuf->ops->unpin(attach);
> @@ -878,7 +869,6 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
>   	if (dmabuf->ops->detach)
>   		dmabuf->ops->detach(dmabuf, attach);
>   
> -	dma_buf_attach_stats_teardown(attach);
>   	kfree(attach);
>   }
>   EXPORT_SYMBOL_GPL(dma_buf_detach);
> @@ -1020,10 +1010,6 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
>   		}
>   	}
>   #endif /* CONFIG_DMA_API_DEBUG */
> -
> -	if (!IS_ERR(sg_table))
> -		dma_buf_update_attachment_map_count(attach, 1 /* delta */);
> -
>   	return sg_table;
>   }
>   EXPORT_SYMBOL_GPL(dma_buf_map_attachment);
> @@ -1061,8 +1047,6 @@ void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
>   	if (dma_buf_is_dynamic(attach->dmabuf) &&
>   	    !IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY))
>   		dma_buf_unpin(attach);
> -
> -	dma_buf_update_attachment_map_count(attach, -1 /* delta */);
>   }
>   EXPORT_SYMBOL_GPL(dma_buf_unmap_attachment);
>   
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index 2b814fde0d11..678b2006be78 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -444,15 +444,6 @@ struct dma_buf {
>   	struct dma_buf_sysfs_entry {
>   		struct kobject kobj;
>   		struct dma_buf *dmabuf;
> -
> -		/**
> -		 * @sysfs_entry.attachment_uid:
> -		 *
> -		 * This is protected by the dma_resv_lock() on @resv and is
> -		 * incremented on each attach.
> -		 */
> -		unsigned int attachment_uid;
> -		struct kset *attach_stats_kset;
>   	} *sysfs_entry;
>   #endif
>   };
> @@ -504,7 +495,6 @@ struct dma_buf_attach_ops {
>    * @importer_ops: importer operations for this attachment, if provided
>    * dma_buf_map/unmap_attachment() must be called with the dma_resv lock held.
>    * @importer_priv: importer specific attachment data.
> - * @sysfs_entry: For exposing information about this attachment in sysfs.
>    *
>    * This structure holds the attachment information between the dma_buf buffer
>    * and its user device(s). The list contains one attachment struct per device
> @@ -525,13 +515,6 @@ struct dma_buf_attachment {
>   	const struct dma_buf_attach_ops *importer_ops;
>   	void *importer_priv;
>   	void *priv;
> -#ifdef CONFIG_DMABUF_SYSFS_STATS
> -	/* for sysfs stats */
> -	struct dma_buf_attach_sysfs_entry {
> -		struct kobject kobj;
> -		unsigned int map_counter;
> -	} *sysfs_entry;
> -#endif
>   };
>   
>   /**

