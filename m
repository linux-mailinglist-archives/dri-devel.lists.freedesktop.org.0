Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD61565C04
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:24:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0191F10FC8B;
	Mon,  4 Jul 2022 16:16:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2058.outbound.protection.outlook.com [40.107.244.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4927A10E0F1
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jul 2022 13:09:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X4X+GGB4xrP7PZ+nttPOhui3SCD6MTI+DYwM338mK/UqSRLKwBawjDi9U6sGt7LC+t3VUAx4WMCgdpQFNGmn+s5t+oW/0LSZiYCVqDbRlM9PGhF8p8xkCMkr+94cMct36h79WmIzdZFEE3oh1t2yivQzxGpw43T6V7IIXJw3oHzU9AnqnUdC400uU5qUugFfCb54UK+Zbo9q/nydsYW0wRsWD+/AKoVSi+VsKD8cwsOj6ZQoQJz39SLUeoSXPu/UodR83noq+tmf90IhVwbDtHg3XfVqFUak4vzukJyfosKWZneOsf/jFC6Ej+lYDYUII+GrogdtywcdhDYJuz3tww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dRIMYJgI5Yj48sMrPwjO/U+kOI9haNcyn9qD1joiynE=;
 b=d8KP1wWPkk/CxZoy1HSPUx0vZnClp0XnH0G63p8wkdw1ikrm9Xg+ZrVjTperKI1vk8UEePZhWlma9GSDammtEvz80USqlgYIRpwNEUsgnZ2TokJpPAE7nIXBtXOGyNTESkrT76dZGQnwepuEG+tope76uo0cxHjt7/l/9hAplcaUnh8Vy9132mJ63RZSXI2Tn68mOiR84d9cuPiSaz773muYKBmsEKHj4S/XtBJPysG2jFqPPPTz0U+H86ryRE+VeAyc3XXeW11sfJ7arRhrFJJwhKl+r87aECclPZEZDdlnpUSpS2BdT6lqvJemm4flcDT9rOh3Fbuwyz+o6kqucg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dRIMYJgI5Yj48sMrPwjO/U+kOI9haNcyn9qD1joiynE=;
 b=f1/nBrXNQly79z4CppTM8ptSs13AWUggWgjU3YHqlippVM2tyN2C8BoO/QLO8oq7J84V4UKZnLYwR6At5PVOivPaSAnG3jPSm3tNWQpRgszfxOslhjyCkiuw8N0y4hzHyu4oy5DuY7i1MReOQ05QzncylGTLHYBLmhCXQEOilA4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BY5PR12MB3716.namprd12.prod.outlook.com (2603:10b6:a03:1a1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Mon, 4 Jul
 2022 13:09:42 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5395.020; Mon, 4 Jul 2022
 13:09:42 +0000
Message-ID: <eb773959-b9f1-8fb0-305b-b9318d3d0055@amd.com>
Date: Mon, 4 Jul 2022 15:09:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 00/10] drm: use idr_init_base() over idr_init() if
 applicable
Content-Language: en-US
To: dakr@redhat.com, airlied@linux.ie, daniel@ffwll.ch, emma@anholt.net
References: <20220701185303.284082-1-dakr@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220701185303.284082-1-dakr@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0088.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 690b7e16-2963-4717-ab79-08da5dbe754c
X-MS-TrafficTypeDiagnostic: BY5PR12MB3716:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y7IdVfiNxTngeK2wk31on5B4jlCe40O1iME7KwEYcXAnQd32w9XSiZWkV/fo7ZQp8TcP5GRlZYoS+kFnO0EnpWfMqtofkD8PPp9oT4UZ7/hpVDl64zwXGqD+8D84yEsHOnqc2z9Fe6rmYgYLPJSwLV2kVdCidIBDmK+Rs+w6F7To5+LoVRBVegusKhNQ9a9VItGKCMBKmZpb1vS6l9n3+qAdcbrhdHssfe+QBuDFGdacXb0NRVINUhQ/WTiuRdXUbbJ4qLkyPvbAvCXy7lj310KFNrQ0fV1W9X6JSgP/Q2DYgvshWDuqwXNPSfWWTtvRfa5VgCU3My/vViy4w+rvMkDpS6bVgql6S8H5WZ2c3pJKlr1uPGq+Udvq0nklWsqCEzkFDojkmZFBaqE2oJT/XS7U4DAZ2I6p6tSYWcK1tj1Cf5gPUmWUWk1we4WwHLNzUlfAV9N5y7VaOHcvuhqDjNQp0yw4+X7xCV+n77cPD9rlfqeWWzjqqNqoElme2eARTlhKBkZIDHNJ+dLeOMpQGjPUxljYAm8BGDa4cO8sAQtonfXbRJ9dxbGrln0NdQiNiudL4Nc+2SWStIaBFScsKNUH1We9d6rQPGCcSge7ewT66cuDDLAJTgB8VUFediSPpvP2PRhwH2PICm6nAe892Ssf1ae/fx4rsrJJOP7lv6hbo8/9/BbLXfkIeNvpkGKknu6r1R9pEdxwusPkXqivRkvnNOv/Ke97S9FtYly60oln9BjP0ROlBquea2kpWl/clGXFHoWIuU5puSpvftTnFWqJLCSJ9FPktDE+jm/GvlftzTgKwNXjCCoeDTupFPEHSDWfSSaS8XzYXd5WeWwTIuyoa8e/MTAUe+Yre76+sHg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(346002)(366004)(396003)(39860400002)(6512007)(36756003)(83380400001)(41300700001)(6666004)(6506007)(38100700002)(2906002)(31686004)(6486002)(478600001)(186003)(2616005)(5660300002)(86362001)(4326008)(8676002)(8936002)(31696002)(66556008)(66476007)(66946007)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHBJRFFmUWN5YWRobzNONUVubEVjbTV4NnR0dkxvd3UzZDY0MEpLazVWNW1T?=
 =?utf-8?B?VmlFNE5Jbk96b1d0UmdMOGdkY29OdktvbnF5amZwMnBSbXMvL0ZTVlpwYlpv?=
 =?utf-8?B?SWdjR2JONDRhanFiM1paWjlMNEhNaXJEQU1wRG5aa2MyMnM5NWFJYTIzSkE5?=
 =?utf-8?B?a2FsV1Z6K0taN2tPME1jQ2F6UU9YUFY5LzVWSWtWc3loeW8wNStPekc5OHNB?=
 =?utf-8?B?bXV1RVZucVd1TlJEZ2dhdnJJY2hUZEdLYUU0Q25Xb2hROTRpc2VhT1R2ekxC?=
 =?utf-8?B?a2M4Y1dwWHVZNlM3WmlDWHdHOGZlaWp3dVZZeWtna09oajI2VFlSOGM2UWpM?=
 =?utf-8?B?bllzYjV5OEtrTzlySmRHdUdjME81SWNqMitjcFdLYW00dnNqU1E0MllyaVZ1?=
 =?utf-8?B?c2NIcm9jZlRRMlRoTU5aYUJidE1NMjVzZ3BvZmZ0RmZkYzJHYVdpOXNpVWxo?=
 =?utf-8?B?SGhJclhhY1dmVkFvU2x2ZExSYTc3THMrMnJJSnBsWFZaNU03RGczdFUxWTlX?=
 =?utf-8?B?akNZTWdKNUUxbUNVMjF2RFRFKzRYUVlHZldvVmZKdnpFRHBVSFJLYUVWTk5t?=
 =?utf-8?B?V1dOTUhYeTU3d1drVzk2YVRTMkMxbXIyNEtwSER4SktvZWNod01zVU4zTCt1?=
 =?utf-8?B?SEVEVTNBU3ljVGVsTTBVYk5jdGE4amV6ckI0ek05eGo2UDVYR05LUTNFMjdl?=
 =?utf-8?B?ZENaZC82Zi9ORUVNblRFTlNQMHNOTW1jcGgrcndJd05GcGoyQmIxak5BcWV4?=
 =?utf-8?B?S3RMNmt6UEdjM1ErYkQ2WlV5eW5kMlJiUCs1QzBkR0V2Y1B3emJlSWVXVXlG?=
 =?utf-8?B?eDcwOWZwUTRWeWM1T05COWd2WmNBSzJqOVNtMTdlYTNMZTZuK1hPY1RHZHor?=
 =?utf-8?B?eDVVYVZTUTgxZTE5UHYxVkNCSUxrc2xSTWdQK2VPQmhpbkZyRXNDeGxSV1ha?=
 =?utf-8?B?SVBFRStIK25KNXhNY1kyNEw0bE5wejlJWVNvdTYxSG96YStLdU5IVFVERXJK?=
 =?utf-8?B?UVNDVWNtSEtRb3E5TG5KcHhvWitXRTc4TjVkaFJzUEpYZlBHanEyblJzTjVj?=
 =?utf-8?B?aHFWdEZnSE1TUS9Ib2crZDh4RzNxMmpwQ3JXR2hQbHNWemxrQndLck45aW5j?=
 =?utf-8?B?NEtCK1JmblUvMkVSUXIrOFVYZjFncWNicElzd1pVb3VsTXhLdDZ1QTNmUkNG?=
 =?utf-8?B?SXRmcmpIV1M3RGQrZDBueEorNjNuakhFUkhYRmJrTkpwM3pud2RGSUtOT3JF?=
 =?utf-8?B?WXFLSGJuMUlvWmk0a0twckZzV0JtRFJtYk5WUWZ2aWlOQTBCd2JlMnFLL2J4?=
 =?utf-8?B?NUUxL3hiTHdLZC9OWm94K2lOYVlkNjFZbmFISkd3WWFsdnI3Zjd0bW5CMk1C?=
 =?utf-8?B?WlhZSDNzNnRxNHJ1UlBZQnQ1QTVuVWozd3NFZ0tsL0RpZVUyUVBEemFsZm9w?=
 =?utf-8?B?WCsyckcrK3AyeGhmb0J0dkd3VzRzajc5NlpJT1R3TDhRZW11QmdZK0xGVDdh?=
 =?utf-8?B?WEcwS2NNRlpBRHpKKzBYSDNPRFdUL2QwWFBocFlVWWNKdEZrL1R6RkkvMSt6?=
 =?utf-8?B?MFZwZk02UWFVTlQwejZHSXcxQTNJMzZ4RkdhTjJhSTZmcXBaVlMzWkhUM2VV?=
 =?utf-8?B?cCtXaC95VFRHSDQ4eGprOGpJZkNXMGdxdHdGenlUSVNNdkMvMUJKVGtYd0ds?=
 =?utf-8?B?b05BdVhnRGUyUnpxYXBWc3RxckZwZ09uMTVrcFFNWjlrVTJCN2NCa3ZJaFRh?=
 =?utf-8?B?enV4ZmVaeE1ONUlRMVByWWxNZGZ4c0U3MjhnNVNnRkJvWVMydGJ6cURlUnp0?=
 =?utf-8?B?K1MwOVhZbFVYM2FzV2w3cWRidkl0S2pJSEhGTXAvMlBLWHFjYUpBRktrai9Z?=
 =?utf-8?B?MTNhSktFZjBqSzVuUFBBOWZmMjBLL0NDWGJNdG16YnlYd2czc0s1c3pjMjBk?=
 =?utf-8?B?THV3UTdWZ1NlOTdmR2U3NjRxa0xLdVdmdUY5Y1gyeFY5QnIxMUc3MzFkbHJB?=
 =?utf-8?B?R3JBeThkWlNwWVRGTnZoamphZk9mVG1mUFMwdnZTRTM0ZWhiMmFXN1BjR01q?=
 =?utf-8?B?dncyVlQvYTZtYitaV3IreGxWVmhGOWRQN2lkRDRnNWdDYXVnaUV2a2QwTDNX?=
 =?utf-8?B?Z2VtNFc0ZmdrWW9Ja052SjViZ0VkM0ZRVVJzeU9JZEdGbHJwWVRpNHluZlZW?=
 =?utf-8?Q?WvwwY/ZRtutYWgvrD/FdDaHu2CPAVNN4czNA5YnBjsny?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 690b7e16-2963-4717-ab79-08da5dbe754c
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2022 13:09:42.1818 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1RxAK6qRuqOis52eVD7R+35FH3ruQCjTmV+zzMSmEIe8iosgALSAUAAwJdBGD+tb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3716
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 01.07.22 um 20:52 schrieb dakr@redhat.com:
> From: Danilo Krummrich <dakr@redhat.com>
>
> This patch series initializes IDRs with idr_init_base(&idr, 1) rather than
> idr_init(&idr) in case for the particular IDR no IDs < 1 are ever requested -
> this avoids unnecessary tree walks.

Feel free to add Reviewed-by: Christian König <christian.koenig@amd.com> 
for the two amdgpu patches.

And an Acked-by: Christian König <christian.koenig@amd.com> for the rest.

Regards,
Christian.

>
> Danilo Krummrich (10):
>    drm/amdgpu: use idr_init_base() to initialize mgr->ctx_handles
>    drm/amdgpu: use idr_init_base() to initialize fpriv->bo_list_handles
>    drm: use idr_init_base() to initialize master->magic_map
>    drm: use idr_init_base() to initialize master->lessee_idr
>    drm: use idr_init_base() to initialize mode_config.object_idr
>    drm: use idr_init_base() to initialize mode_config.tile_idr
>    drm/sis: use idr_init_base() to initialize dev_priv->object_idr
>    drm/v3d: use idr_init_base() to initialize v3d_priv->perfmon.idr
>    drm/via: use idr_init_base() to initialize dev_priv->object_idr
>    drm/todo: remove task for idr_init_base()
>
>   Documentation/gpu/todo.rst              | 12 ------------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c |  2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c |  2 +-
>   drivers/gpu/drm/drm_auth.c              |  4 ++--
>   drivers/gpu/drm/drm_mode_config.c       |  4 ++--
>   drivers/gpu/drm/sis/sis_drv.c           |  2 +-
>   drivers/gpu/drm/v3d/v3d_perfmon.c       |  2 +-
>   drivers/gpu/drm/via/via_map.c           |  2 +-
>   8 files changed, 9 insertions(+), 21 deletions(-)
>

