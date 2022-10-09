Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3418F5F8CBA
	for <lists+dri-devel@lfdr.de>; Sun,  9 Oct 2022 20:00:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D01B010E03B;
	Sun,  9 Oct 2022 18:00:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2054.outbound.protection.outlook.com [40.107.94.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C737210E03B;
 Sun,  9 Oct 2022 18:00:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V9uYky2k8k4gSPg5kv03QF4kQEGhPLS22nbl7PypOtI+d3JM6CVSsA5AIPM9XTlm5ui42K5LFlt14LiUDqXLAkgMHNyfaLswB85a6MrXtLcECzmILTnclSgqXLmbCDM7rXP2mSa2J8kFZ4Oj0vI7KkWxLF/EtvzBZONRPQnlhxP7krxmRZgG8sPTxMQR6Mh59FJUamEONCqyP21ZRABwUsYK7SJRXWchMjmaBwPvvYbqPPnaddF+ymX54w+Xv7rRoPXaKfBc7xEL8LIcyOkBgfC84UZbLTXS/j1Luw0J6vnMBGT1vf2nH8XKwu9eehEKEszFdP1bxSU46am4iTJKtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lxPN350qJogkCP4k2iffPZVw3d1EEurHeu6GeYa5VTk=;
 b=B4DBb36OL8PJgPYR111yWSZN8hYfkQCL6EYI91XxLGL6tu6QQUvUREMAyVOFHI+gPmhhwSXkzNDUFhGuZ2R/cw25wQ6qcqMyJePWP/nhx6dhVIZz+a/Xls3s9LGQaSS/BLAR6rl847C2T2yz81Y5V0tnsuUmcu5UBPob8ISjuwM67DhJVnIotuwsn0B+MhHKzbw3wdL4tThMqRhJ+INPjNtAezWEqgEMQy6jPjq7LbdlozgabOQy+S02Tyzcg//33UhP2s4UETpEbPkqVwXIWaimXrjFLjeweycniBRtAZqIXlLCgrUDN5apDxz1GFO2Um0z972NGSFsBTHc/q5QYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lxPN350qJogkCP4k2iffPZVw3d1EEurHeu6GeYa5VTk=;
 b=bNcTcbVZWjoa9KbUmwlXkXWSFG0Q+VguMe8aHGl48jOSAAYbgYMXt1VZHc5sNWbgABKhJlbiu2FZTcta8OUGirufTJITKXZJKCyhXGm1xjiGAkL78KQ1fEv0Q4vKUDw45JIv25ruMzUfCzu72jJmV/PrCTbwZSLx5vbramSiEy8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB4239.namprd12.prod.outlook.com (2603:10b6:208:1d2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Sun, 9 Oct
 2022 18:00:16 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::805b:58b6:1f27:d644]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::805b:58b6:1f27:d644%6]) with mapi id 15.20.5709.015; Sun, 9 Oct 2022
 18:00:14 +0000
Message-ID: <09e87ee7-4500-df21-1e20-641303a67b5c@amd.com>
Date: Sun, 9 Oct 2022 20:00:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC PATCH] drm/syncobj: add IOCTL to register an eventfd for a
 timeline
Content-Language: en-US
To: Simon Ser <contact@emersion.fr>, dri-devel@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org
References: <20221009144001.161124-1-contact@emersion.fr>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20221009144001.161124-1-contact@emersion.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0169.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::8) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MN2PR12MB4239:EE_
X-MS-Office365-Filtering-Correlation-Id: e2823e61-3ddb-4d02-4e3d-08daaa201da7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0GKmRDhhGKiMWDS7nOLMD2HKmQrTCWzk6W880ogTjdb5gIEF8E8Td9gX66FqZ8yZA+pqXXhaR+FInjzEGKUqB5vow2J8QduUyv+zICcRMoNK5r3sTZGXIevk0xa1fjCtnKaHWd2u87vKIhf/RnWVEsS7k49ltd2kEJ3NwQfpnKkkIjLIHfDL8ZJnYvvWPISxIAt1cnXG/JbwYi1ZrAbjW2u6swwQ4xOqpFOLGRI20IFXWzJyIT0hSCsiJgPJAUPtwl/jPZ2F15oQVHRuOkgJf2E53zHjXOPq88PUMTgrpjRsYz2U9FUk5EJbubYga9CodXubHNaM27eaK+XmMKf8uLga3upSncz41wIrfjXTKPyg7FC9YJMeBGGKsBWFhSUHhmJxz+EZq9QzNMtBVNCbS/U5Cm8bn7ETbMCoyahHvVmmQ0xx8to9kpdz1lSX44swcLezmBonaPjs+CDFJ6zbIuGci7ddOLAJ9Qhvn6lCt6U0tTXMEbEHQBMSmrxz/2PW3XlMN22s+ulkN2KrWPn71Bb7d7sIY4XHVYEC4LhQ4SKRRxhScUv4X9qeRnTiUDPBJy/uS0YOlyXQsCupD5vKIcRhzO+ZzUWv0LbGMJRDEXRNEIc7ocgCrx9H+cFo+UkGLz5vSZYoNR6c7qu0egqa6cPsi1vzTdqASfXOWBasDJmfdQJXglmbB1hEm9CsSYiF4wYaVK1la4NneK7oyQU76dMkDx73UPjpvOI9GwovouDIgW0AnXvQhVvHKASH3XtHfK58V2cBY5WxkmacXXyVFQXVpdiNdvjv+A0dhtJsEbE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(396003)(366004)(346002)(39860400002)(451199015)(36756003)(316002)(38100700002)(66946007)(4326008)(8676002)(66556008)(31696002)(66476007)(86362001)(54906003)(2906002)(41300700001)(8936002)(66574015)(5660300002)(83380400001)(2616005)(30864003)(186003)(6486002)(478600001)(6512007)(6666004)(6506007)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1dXTTd2UTdvcmxiL3BTVE5VYmVqdGgwamc1V1IzNjhTcnpuMjNLaXphOGdO?=
 =?utf-8?B?UlpSaldVUEFtUlYzVDJSWG9vTlBGdVNHNUVldGRyc215UGV1bDBFQ0psTTJL?=
 =?utf-8?B?SzBOT0JmL3l5RDVzSFB5bm0zNXIyR2IwU3BLWUMrTm5JNkgrVFRsZW5Rekwx?=
 =?utf-8?B?TnZJb1RCSXRnM1J3dGtPdEppK3ZSMWFuQ2FvZ2RtMVhKTU5XRHdzY2ppSnVj?=
 =?utf-8?B?KytyelROQVRNYW1rVm01MFFFSFNHRit5Vm1UTHZFdjFHUWM2NlhzYUtZbnR5?=
 =?utf-8?B?ZkxicStPZXFSVkdLaVl2bVh5dGdTb3M0M1VSM01NdnpMUUszTGU2V0JSaFJx?=
 =?utf-8?B?ZkpuclcyUlBoV0p1Zk1DdXhzUjkzYkMyOHh4VFhSMVRiekF5a1BNL0ZHdHdH?=
 =?utf-8?B?YWhmRC82K0xTMlZGdlNHeUJaV0tLUnZWdU9pb1BrK0xmaXV3QWxJaFRhZGMr?=
 =?utf-8?B?eUJWVy9YMExYZnArTmlJbk40bzdFSEhDZStiSGNYeVVjOE1hTkluYmphTHN0?=
 =?utf-8?B?ZlRsTFFjSGRmKzRhQjRnOTNDMGxhUVY5ZTFmSyswSEV1Mlp4bmpDZWkvS01J?=
 =?utf-8?B?dXRNdXhTUzZwa1NzNnVqRURScGM2WDkyUm1ZWTR5cGFpa0RNRUpYd25SSkVp?=
 =?utf-8?B?OVRCRk1IN0tmSXFUUXpucWY2SThyLzBZSUNSbDFWbzl2V3MxU1FFTUNyYUhv?=
 =?utf-8?B?UUZRc2JzMDkyRWtxTlN5djF6a0NuZ3Zlek5lS25iWnRwS29oNkRZbGx1cTVP?=
 =?utf-8?B?QXJQOTRieGJCSE0zaUlOaXpnSVFLUXkzYjZWSDh2RjJ1cnF1YXM0NGJ2Y29J?=
 =?utf-8?B?OXdGV1ZBVjZudTRFUnh2VmFvc05ERVUxVGkveWtrOXhEcjJmU212SHRJQ1E0?=
 =?utf-8?B?UUlZcUZnT1VkT2xRSmdDNktKejVpbU1CejhwbDY0YU1NRVhvdkVvZEFFckg5?=
 =?utf-8?B?WWlxejRUMys3d0t1aGxBVXRMYStkazRoVmZNWjEvdC9KWDFYc0pHSzdNc3lK?=
 =?utf-8?B?L2hqckhlTkZUVjAyblBhNWhMVWZ3a1JHVXZoaktKSWZtZE5tOTBFS0Jram1C?=
 =?utf-8?B?RVdwYkRDRHlqS0t0UDBReURGVWR1N0JFa3ZlamFQU0RsVXphallrMFcwTHg3?=
 =?utf-8?B?Ukd1bEJEbkpLbmd5UzNETE5SYTNZUkI0dDFKYURwN2Jmalk5eis4RVBoeEg4?=
 =?utf-8?B?bkF0L054ZGxnRWJZQ3d4STVEN2JYQXdrSGt4RERHejkzOXBkWlRHOFhwL1VG?=
 =?utf-8?B?d0RGby85eFYrREllYVJ1dXpzM01sNkZYOUFWcUpxSmQ2b1JWOVJjZjczWU9N?=
 =?utf-8?B?Y0F4WG93S3Z4SXZlbnFvaTdFS1FZcmNxem83Y1FUem1FYVhUSkIyUGlXK1hs?=
 =?utf-8?B?MnhUbmNERmlOcURNNlFNbXoreXBJdWlJc0pRWHBvbCt5ZTEvODM5NjkxQldz?=
 =?utf-8?B?T2M1T1VhL0xlT0N6S3pUUW5zdnVrTVBpZ3VjMFJtR3lpOXZXVlB0RjMwNWR5?=
 =?utf-8?B?QTZvZVE3Y3ptTk85UFRpRU9VN3FGVDBLZEIwczg2UVZBcUZGbEhhN1VLSmZ5?=
 =?utf-8?B?S3I0djdWYU52dXRSc2QrTGZFQnpkVVBCRERxN2tIMTcrdjEyd05nNWYwMFY0?=
 =?utf-8?B?aXBxZFNlSFBNWThyOEtHdlhTaTNwUXgvN2d2cGhvdVZvd2FJd3BKTUlqaWJJ?=
 =?utf-8?B?bVhkMGZ3MVBoTmg4aWJjRnFyN3NKTGw2ZmRXdzNSeTlza3NDU0ZMSFVUdFdJ?=
 =?utf-8?B?aW9RRWhJeW42dzU0NjVVVERPMWY5MUlHTzBlWVNGZU5YSzVFdk1TNERLb3Qw?=
 =?utf-8?B?ZFBLMUFFRlFwWVllNnlaR0g2RWlLaUdEL2dUa1ZyOWxGT3BGOTVPYW5uNjNs?=
 =?utf-8?B?SzcxZDR4djc5VDhCWHZubzR1ZHRqRDk0V0hxRjVFSlQ2cmpSeDZodVR0MWNj?=
 =?utf-8?B?MFlzZlR4U1VWcjBsQXhFcmNaWFRKejQxbG1MZXVKNXFOanpxcWxMTThTMGVl?=
 =?utf-8?B?SFZGWnB1cGYxaTN2eXFmTHU3VHg3OUhpbGNJZXdGZ1h5K2dtczlEaS9Zbzh5?=
 =?utf-8?B?eHlvMEJuLzNzVit0K3J1MlordUxWWDBXQnBNTHFwU2NSVWdiL3AwdHkyREV2?=
 =?utf-8?B?UVpwelZDM2R4R1JiR0JkM1V5UjF4dDdQdnphOUFHUWhCTHJQaUJ5QUtLM0xE?=
 =?utf-8?Q?qrBA0MPsfUyDQoHU1t64hbfGW4Hy6xjJYWktBNRW/DWS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2823e61-3ddb-4d02-4e3d-08daaa201da7
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2022 18:00:14.1556 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CMCNNqfig7uUSKFr20DcSKbwDaz1wwhkk6O4CrnVyonMCpO/9nb0Dh3KsmiL4pVG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4239
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
Cc: Jason Ekstrand <jason@jlekstrand.net>, James Jones <jajones@nvidia.com>,
 Pekka Paalanen <ppaalanen@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 09.10.22 um 16:40 schrieb Simon Ser:
> Introduce a new DRM_IOCTL_SYNCOBJ_TIMELINE_REGISTER_EVENTFD IOCTL
> which signals an eventfd when a timeline point completes.

I was entertaining the same though for quite a while, but I would even 
go a step further and actually always base the wait before signal 
functionality of the drm_syncobj and the eventfd functionality. That 
would save us quite a bit of complexity I think.

As a general note I think the name 
DRM_IOCTL_SYNCOBJ_TIMELINE_REGISTER_EVENTFD is just to long, just make 
that DRM_IOCTL_SYNCOBJ_EVENTFD. Same for the function names as well.

Additional to that I think we should also always have a graceful 
handling for binary syncobjs. So please try to avoid making this special 
for the timeline case (the timeline case should of course still be 
supported).

Regards,
Christian.


>
> This is useful for Wayland compositors to handle wait-before-submit.
> Wayland clients can send a timeline point to the compositor
> before the point has materialized yet, then compositors can wait
> for the point to materialize via this new IOCTL.
>
> The existing DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT IOCTL is not suitable
> because it blocks. Compositors want to integrate the wait with
> their poll(2)-based event loop.
>
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> Cc: Daniel Stone <daniel@fooishbar.org>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: James Jones <jajones@nvidia.com>
> ---
>   drivers/gpu/drm/drm_internal.h |   3 +
>   drivers/gpu/drm/drm_ioctl.c    |   3 +
>   drivers/gpu/drm/drm_syncobj.c  | 113 +++++++++++++++++++++++++++++++--
>   include/drm/drm_syncobj.h      |   6 +-
>   include/uapi/drm/drm.h         |  15 +++++
>   5 files changed, 133 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> index 1fbbc19f1ac0..4244e929b7f9 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -242,6 +242,9 @@ int drm_syncobj_wait_ioctl(struct drm_device *dev, void *data,
>   			   struct drm_file *file_private);
>   int drm_syncobj_timeline_wait_ioctl(struct drm_device *dev, void *data,
>   				    struct drm_file *file_private);
> +int drm_syncobj_timeline_register_eventfd_ioctl(struct drm_device *dev,
> +						void *data,
> +						struct drm_file *file_private);
>   int drm_syncobj_reset_ioctl(struct drm_device *dev, void *data,
>   			    struct drm_file *file_private);
>   int drm_syncobj_signal_ioctl(struct drm_device *dev, void *data,
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index ca2a6e6101dc..dcd18dba28b7 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -702,6 +702,9 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
>   		      DRM_RENDER_ALLOW),
>   	DRM_IOCTL_DEF(DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT, drm_syncobj_timeline_wait_ioctl,
>   		      DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF(DRM_IOCTL_SYNCOBJ_TIMELINE_REGISTER_EVENTFD,
> +		      drm_syncobj_timeline_register_eventfd_ioctl,
> +		      DRM_RENDER_ALLOW),
>   	DRM_IOCTL_DEF(DRM_IOCTL_SYNCOBJ_RESET, drm_syncobj_reset_ioctl,
>   		      DRM_RENDER_ALLOW),
>   	DRM_IOCTL_DEF(DRM_IOCTL_SYNCOBJ_SIGNAL, drm_syncobj_signal_ioctl,
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index 0c2be8360525..401d09b56cf1 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -185,6 +185,7 @@
>   
>   #include <linux/anon_inodes.h>
>   #include <linux/dma-fence-unwrap.h>
> +#include <linux/eventfd.h>
>   #include <linux/file.h>
>   #include <linux/fs.h>
>   #include <linux/sched/signal.h>
> @@ -212,6 +213,17 @@ struct syncobj_wait_entry {
>   static void syncobj_wait_syncobj_func(struct drm_syncobj *syncobj,
>   				      struct syncobj_wait_entry *wait);
>   
> +struct syncobj_eventfd_entry {
> +	struct list_head node;
> +	struct dma_fence_cb fence_cb;
> +	struct eventfd_ctx *ev_fd_ctx;
> +	u64 point;
> +};
> +
> +static void
> +syncobj_eventfd_entry_func(struct drm_syncobj *syncobj,
> +			   struct syncobj_eventfd_entry *entry);
> +
>   /**
>    * drm_syncobj_find - lookup and reference a sync object.
>    * @file_private: drm file private pointer
> @@ -274,6 +286,25 @@ static void drm_syncobj_remove_wait(struct drm_syncobj *syncobj,
>   	spin_unlock(&syncobj->lock);
>   }
>   
> +static void
> +syncobj_eventfd_entry_free(struct syncobj_eventfd_entry *entry)
> +{
> +	eventfd_ctx_put(entry->ev_fd_ctx);
> +	/* This happens inside the syncobj lock */
> +	list_del(&entry->node);
> +	kfree(entry);
> +}
> +
> +static void
> +drm_syncobj_add_eventfd(struct drm_syncobj *syncobj,
> +			struct syncobj_eventfd_entry *entry)
> +{
> +	spin_lock(&syncobj->lock);
> +	list_add_tail(&entry->node, &syncobj->cb_list);
> +	syncobj_eventfd_entry_func(syncobj, entry);
> +	spin_unlock(&syncobj->lock);
> +}
> +
>   /**
>    * drm_syncobj_add_point - add new timeline point to the syncobj
>    * @syncobj: sync object to add timeline point do
> @@ -288,7 +319,8 @@ void drm_syncobj_add_point(struct drm_syncobj *syncobj,
>   			   struct dma_fence *fence,
>   			   uint64_t point)
>   {
> -	struct syncobj_wait_entry *cur, *tmp;
> +	struct syncobj_wait_entry *wait_cur, *wait_tmp;
> +	struct syncobj_eventfd_entry *ev_fd_cur, *ev_fd_tmp;
>   	struct dma_fence *prev;
>   
>   	dma_fence_get(fence);
> @@ -302,8 +334,10 @@ void drm_syncobj_add_point(struct drm_syncobj *syncobj,
>   	dma_fence_chain_init(chain, prev, fence, point);
>   	rcu_assign_pointer(syncobj->fence, &chain->base);
>   
> -	list_for_each_entry_safe(cur, tmp, &syncobj->cb_list, node)
> -		syncobj_wait_syncobj_func(syncobj, cur);
> +	list_for_each_entry_safe(wait_cur, wait_tmp, &syncobj->cb_list, node)
> +		syncobj_wait_syncobj_func(syncobj, wait_cur);
> +	list_for_each_entry_safe(ev_fd_cur, ev_fd_tmp, &syncobj->ev_fd_list, node)
> +		syncobj_eventfd_entry_func(syncobj, ev_fd_cur);
>   	spin_unlock(&syncobj->lock);
>   
>   	/* Walk the chain once to trigger garbage collection */
> @@ -323,7 +357,8 @@ void drm_syncobj_replace_fence(struct drm_syncobj *syncobj,
>   			       struct dma_fence *fence)
>   {
>   	struct dma_fence *old_fence;
> -	struct syncobj_wait_entry *cur, *tmp;
> +	struct syncobj_wait_entry *wait_cur, *wait_tmp;
> +	struct syncobj_eventfd_entry *ev_fd_cur, *ev_fd_tmp;
>   
>   	if (fence)
>   		dma_fence_get(fence);
> @@ -335,8 +370,10 @@ void drm_syncobj_replace_fence(struct drm_syncobj *syncobj,
>   	rcu_assign_pointer(syncobj->fence, fence);
>   
>   	if (fence != old_fence) {
> -		list_for_each_entry_safe(cur, tmp, &syncobj->cb_list, node)
> -			syncobj_wait_syncobj_func(syncobj, cur);
> +		list_for_each_entry_safe(wait_cur, wait_tmp, &syncobj->cb_list, node)
> +			syncobj_wait_syncobj_func(syncobj, wait_cur);
> +		list_for_each_entry_safe(ev_fd_cur, ev_fd_tmp, &syncobj->ev_fd_list, node)
> +			syncobj_eventfd_entry_func(syncobj, ev_fd_cur);
>   	}
>   
>   	spin_unlock(&syncobj->lock);
> @@ -472,7 +509,13 @@ void drm_syncobj_free(struct kref *kref)
>   	struct drm_syncobj *syncobj = container_of(kref,
>   						   struct drm_syncobj,
>   						   refcount);
> +	struct syncobj_eventfd_entry *ev_fd_cur, *ev_fd_tmp;
> +
>   	drm_syncobj_replace_fence(syncobj, NULL);
> +
> +	list_for_each_entry_safe(ev_fd_cur, ev_fd_tmp, &syncobj->ev_fd_list, node)
> +		syncobj_eventfd_entry_free(ev_fd_cur);
> +
>   	kfree(syncobj);
>   }
>   EXPORT_SYMBOL(drm_syncobj_free);
> @@ -501,6 +544,7 @@ int drm_syncobj_create(struct drm_syncobj **out_syncobj, uint32_t flags,
>   
>   	kref_init(&syncobj->refcount);
>   	INIT_LIST_HEAD(&syncobj->cb_list);
> +	INIT_LIST_HEAD(&syncobj->ev_fd_list);
>   	spin_lock_init(&syncobj->lock);
>   
>   	if (flags & DRM_SYNCOBJ_CREATE_SIGNALED) {
> @@ -1304,6 +1348,63 @@ drm_syncobj_timeline_wait_ioctl(struct drm_device *dev, void *data,
>   	return ret;
>   }
>   
> +static void
> +syncobj_eventfd_entry_func(struct drm_syncobj *syncobj,
> +			   struct syncobj_eventfd_entry *entry)
> +{
> +	int ret;
> +	struct dma_fence *fence;
> +
> +	/* This happens inside the syncobj lock */
> +	fence = dma_fence_get(rcu_dereference_protected(syncobj->fence, 1));
> +	ret = dma_fence_chain_find_seqno(&fence, entry->point);
> +	dma_fence_put(fence);
> +
> +	if (ret != 0)
> +		return;
> +
> +	eventfd_signal(entry->ev_fd_ctx, 1);
> +	syncobj_eventfd_entry_free(entry);
> +}
> +
> +int
> +drm_syncobj_timeline_register_eventfd_ioctl(struct drm_device *dev,
> +					    void *data,
> +					    struct drm_file *file_private)
> +{
> +	struct drm_syncobj_timeline_register_eventfd *args = data;
> +	struct drm_syncobj *syncobj;
> +	struct eventfd_ctx *ev_fd_ctx;
> +	struct syncobj_eventfd_entry *entry;
> +
> +	if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE))
> +		return -EOPNOTSUPP;
> +
> +	/* TODO: support other flags? */
> +	if (args->flags != DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE)
> +		return -EINVAL;
> +
> +	syncobj = drm_syncobj_find(file_private, args->handle);
> +	if (!syncobj)
> +		return -ENOENT;
> +
> +	ev_fd_ctx = eventfd_ctx_fdget(args->fd);
> +	if (IS_ERR(ev_fd_ctx))
> +		return PTR_ERR(ev_fd_ctx);
> +
> +	entry = kzalloc(sizeof(*entry), GFP_KERNEL);
> +	if (!entry) {
> +		eventfd_ctx_put(ev_fd_ctx);
> +		return -ENOMEM;
> +	}
> +	entry->ev_fd_ctx = ev_fd_ctx;
> +	entry->point = args->point;
> +
> +	drm_syncobj_add_eventfd(syncobj, entry);
> +	drm_syncobj_put(syncobj);
> +
> +	return 0;
> +}
>   
>   int
>   drm_syncobj_reset_ioctl(struct drm_device *dev, void *data,
> diff --git a/include/drm/drm_syncobj.h b/include/drm/drm_syncobj.h
> index 6cf7243a1dc5..b40052132e52 100644
> --- a/include/drm/drm_syncobj.h
> +++ b/include/drm/drm_syncobj.h
> @@ -54,7 +54,11 @@ struct drm_syncobj {
>   	 */
>   	struct list_head cb_list;
>   	/**
> -	 * @lock: Protects &cb_list and write-locks &fence.
> +	 * @ev_fd_list: List of registered eventfd.
> +	 */
> +	struct list_head ev_fd_list;
> +	/**
> +	 * @lock: Protects &cb_list and &ev_fd_list, and write-locks &fence.
>   	 */
>   	spinlock_t lock;
>   	/**
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 642808520d92..359e21414196 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -909,6 +909,20 @@ struct drm_syncobj_timeline_wait {
>   	__u32 pad;
>   };
>   
> +/**
> + * struct drm_syncobj_timeline_register_eventfd
> + *
> + * Register an eventfd to be signalled when a timeline point completes. The
> + * eventfd counter will be incremented by one.
> + */
> +struct drm_syncobj_timeline_register_eventfd {
> +	__u32 handle;
> +	__u32 flags;
> +	__u64 point;
> +	__s32 fd;
> +	__u32 pad;
> +};
> +
>   
>   struct drm_syncobj_array {
>   	__u64 handles;
> @@ -1095,6 +1109,7 @@ extern "C" {
>   #define DRM_IOCTL_SYNCOBJ_QUERY		DRM_IOWR(0xCB, struct drm_syncobj_timeline_array)
>   #define DRM_IOCTL_SYNCOBJ_TRANSFER	DRM_IOWR(0xCC, struct drm_syncobj_transfer)
>   #define DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL	DRM_IOWR(0xCD, struct drm_syncobj_timeline_array)
> +#define DRM_IOCTL_SYNCOBJ_TIMELINE_REGISTER_EVENTFD	DRM_IOWR(0xCE, struct drm_syncobj_timeline_register_eventfd)
>   
>   /**
>    * DRM_IOCTL_MODE_GETFB2 - Get framebuffer metadata.

