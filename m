Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8EF760287
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 00:43:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6209B10E145;
	Mon, 24 Jul 2023 22:43:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2076.outbound.protection.outlook.com [40.107.94.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2014A10E145
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 22:43:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FkjqqkEtFWyqQPo41wt9VWcHjzbslClIqMUbtva4MJ8pVrs9gh7GuuvY1OpBUy9f8CWJzrja6nUI3mCU3D9wE3MkzNiLy3lvG4UzcbXc3WlUpdHdth2juDofg+GgWyGyLNt/+1CybPSK37Ze/IeVDeQtbAUqJV+ITFzLOgC3XVjl1MLv7SFwwXa7kkKUz4tKxXZPwlHqnR+QFsFxnpuSQxpfRuzTZgSQ6gfPhKSXf7MtJ5rA6DPogG7dzEE6ZA8zCTRznEDuRC56IAQaXd/ioFkKPLEiLWaIlJL+dEGqn+OFO9NhAHGvj4bX1lufuqtgQ3dvm3IRTEsjVcQ9taf0Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n3Ncp7mgLZhv+PriFCRzd41tV/lhG6IRrjdqf4sTYu8=;
 b=Pzt67qTd4bCZvpM2lFYqroBljB4wY4s/L5rdqUtpmA7t+nRFDsGNQPJOtgmOaRmo7HteUc/bd8SF2mdv5KsRvQXih+mlUMZQ7UVmXWq0UrkgfkvrL1pwPLHsKVrNLo3eXrMm6Gxl1BY1b4sCF272NTYvJuOJqvB44UwJyKKArCRerIQqVF6zXqqN0DKr5VQkxVTGWXLJjbgEHI3+5yKkAKqxSXEl5UHzouBKoxuN0R8hGtDNEREOK/X0V6X/7R36qq0MxBY5zPGx02gOqsQeBtlLFey3vsAT44vqzlpwMUdregITGbtYnJ/mwmOEWVP49WSqTRHSQ2QFkPmUclVgIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n3Ncp7mgLZhv+PriFCRzd41tV/lhG6IRrjdqf4sTYu8=;
 b=Z7iI2T5YV8JLTzG1VoxmKvYhdgm6YR8efUgLGrueHppFkIvACuaIppFvTE1s3G0uXcYhYpKqCzjqWyi/ci6Qa44FnganzmZaZInbFS/76zG8Sm2/XA40WxFAokv1Rb97BLAbk3b0pMeey8X8RsDUFL7EsQCeLdV5DV4Eln4s/um7bm5RcTmqViXbVybL4E5aC066VB12KZQW77+SmQCrmrj/oMM2lzuLze3xc1XZXKDOMYu7YxdFlWh7cd7l7Y2mILO6nZ5KV40upo/t2751a06dNpPl2i1xP0de9QeXNybB/e13yDGJJfsSvP67yMME/KJ3wfdY8OBWjrO26t4wIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH0PR12MB5122.namprd12.prod.outlook.com (2603:10b6:610:bd::12)
 by SA1PR12MB6797.namprd12.prod.outlook.com (2603:10b6:806:259::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.31; Mon, 24 Jul
 2023 22:43:39 +0000
Received: from CH0PR12MB5122.namprd12.prod.outlook.com
 ([fe80::c858:af19:997:b12a]) by CH0PR12MB5122.namprd12.prod.outlook.com
 ([fe80::c858:af19:997:b12a%3]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 22:43:39 +0000
Message-ID: <ae2192ce-d279-c45e-d50a-e630ea14263f@nvidia.com>
Date: Mon, 24 Jul 2023 15:43:36 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/syncobj: add
 DRM_IOCTL_SYNCOBJ_IMPORT/EXPORT_SYNC_FILE
Content-Language: en-US
To: dri-devel@lists.freedesktop.org
References: <5e687ad8-78ad-0350-6052-a698b278cc8c@nvidia.com>
From: Erik Kurzinger <ekurzinger@nvidia.com>
In-Reply-To: <5e687ad8-78ad-0350-6052-a698b278cc8c@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0069.namprd05.prod.outlook.com
 (2603:10b6:a03:74::46) To CH0PR12MB5122.namprd12.prod.outlook.com
 (2603:10b6:610:bd::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR12MB5122:EE_|SA1PR12MB6797:EE_
X-MS-Office365-Filtering-Correlation-Id: c3bba8ad-b35d-4a86-8b95-08db8c976c55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wsL/+9hi6LLctN1Q20HJpq29LcUH5g0maBgyRDFTZnMXsBu5vJai4m62h1JB4EBNfNe+2wLFBDZirNOGDDyWNxC3TLfgqaLvZbi4wjvVOppe4w30pA3yEog4hsA2+WlTnhr0OSTbjIKtWjjx1d7JaMnnEuGYryD13ZcAIGSPwk5n61iH5dQY1QQHlWuiK44DIlEIN3v4Lex2OIoty+K9kjpbVd5DhsezYPDkn18m0YCZsenWBh5UXciLewKe2wpxFXUN6iu3eFIJi+FhqrXzaTlK/8IuxijdscZ0S5AevyUBtB7koYBOeEaxVKM1FZ+BHU1JXR+IfG8Zd2Q3o19UaInnqsRMjcJIMkyXVTnlogbecofnB81Nmd8SdxJvvw/s/azKH8+wGc2LCK50rvRhp3jueIUJm2T6ZOaUz1I5SAaSlcJ1JslMv5ovEcelujSF/bioKtXFVLfthCVBWZ8lRT8HqBspM6Au26tUK7H+nlMclnE5l3kWU3LZ/2pxfDQ78F4nFfQ/RaWfviUN0vDsPIDO8kBBkehPMcPychTIPu8gLfnFgec68q62tQCSc/VroH53CKftdG0HjgxG4JIICtBsSgy+/5jk5Wv7P4bK1fGT3+MceHu+n611WeyYBXws3BPsOIsbcMgTsk5BHZDOnLLKw29X5ktrXjOyap1zZpIwJmE0z+Uqtw6QHQcPtP/n
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5122.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(376002)(136003)(366004)(396003)(346002)(451199021)(83380400001)(38100700002)(36756003)(31696002)(86362001)(54906003)(478600001)(2906002)(186003)(6506007)(26005)(6512007)(966005)(6666004)(6486002)(31686004)(8936002)(5660300002)(8676002)(316002)(41300700001)(66476007)(6916009)(66556008)(4326008)(66946007)(53546011)(107886003)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVBSQ3hqUU5iRHhOKzNHSzZpWUFZSjVpbmp5SkVEeXdNQkJpWGc3dXgzRFVP?=
 =?utf-8?B?VUllNGNub2QrNGFuYm1veGsxbDNYOEJsV2lRbTdnVDVNdmNUVUI4VHdRa0RQ?=
 =?utf-8?B?WUg5N0pNanBrOURlZEsrckJFL09UczBGUlkzUFkrUEFZcjg5SURZM2pvNUc4?=
 =?utf-8?B?NVBqVzk0R1JCTlhsbllZRHhLdVhaNkRVVmk1bFhwMlUyc3RCaDBrQzczSERT?=
 =?utf-8?B?REhHeEpxOUF3N1JDc3c3RU5SSDRwZS96QWZOdlB6WnRPS1RMd2Vnc2NiSHdI?=
 =?utf-8?B?Z3g2RXpraHJnYkIvWlpFRGJmU1crWldaOXhXVklUZnR0VWVja3dkcUhobGhR?=
 =?utf-8?B?YWFQY0dXK0p2OXg0aWZuNTVGejVvQ0gxNjRKbzArWmEwMGpDT2pKUWI5RXE1?=
 =?utf-8?B?bDdkeVFYU0ZKd25sSWxGUThWdGVoTy9GVHlDQkZKZnR3KzNlZ3pKaWc2NTRr?=
 =?utf-8?B?T2padkVIWjRnQUhDdnZjQ1cvWHZRbUZuYUU1VjZNWE9vZDdwcTZZa2xmVGds?=
 =?utf-8?B?Qm1MZ1d1ZHJPSmNWMThxQTdSOGpPUlR5L0wxdXlxb3h0MG41YzZEOGtkdEJo?=
 =?utf-8?B?alZWWUlpOWdCeTJ6dm8rQnpMaml5TjMzWnJHdVdlMHc4SmNkS0JCMWRFRnhy?=
 =?utf-8?B?dDhlNW9ubVY5UXRubkZqUGVuQUFIbTJ3YUZjWXZkRTZ2STZDOTVEaUR5Y2xy?=
 =?utf-8?B?Vm10UHIrMnlGazVpaXlJN3FuUlp5VWIyQ2wzZzR4VWxxc3QwSzNFdUNRNVVT?=
 =?utf-8?B?aWZwdGZvbHcxNE45Q0wwSzJiRHE3cm9jRWl4M0dUdmVpc2lhc2xpc1prSk5N?=
 =?utf-8?B?VFBjelpMVmxxcWFlSzhZWlFuM1pjU2pmVW9GV3Z0eU1JaDhPcW5vUkplNHJs?=
 =?utf-8?B?Z1ZqSG1OQXFtVjlrOEVFL2doSEcrZlVTeTY5NHFOUWRmamdMSVFjVkNjK1kw?=
 =?utf-8?B?RndZWVZSZlhKUUFLZWhxL0RKK2pWUjZyTzkzZ3ZzTEJwbzI5Wi83NlZwTmJm?=
 =?utf-8?B?UUs0NzNPRUwwM2tWdmh3QWN1c1ZOVEwvakFvZ2xWRSt2NXAvSGRoemhCcDcz?=
 =?utf-8?B?cGd6TGw5ZUZlbUs1dzYya05VTGF2TGlrc1QzaFR2UUxYZFBPUnRIUkRUNHpS?=
 =?utf-8?B?TVdoUmNWM2pyWGh5SjFJNjcwSzdiRGlhT2tKOTZwcmlWN0JXRTZiUmZFL1FT?=
 =?utf-8?B?Z3RQVW5vdHdXUERPblJsRWpUeVZKUFZzUld2WFBxZkFtaWMzRjlxSUkwYzVs?=
 =?utf-8?B?S2ErRksybWZ3cXFTeWgrWi9Sd1d5TFQvSUNIOEZsc04xL0x3N0pYTVdKcDJ0?=
 =?utf-8?B?bGtUS212Ly9xdzc4UmxVRmpYVHhtcmRJaHNLVjVFVGUvbnJPWkZjekR1ZnVR?=
 =?utf-8?B?UC9MbXBUZTV0MmVXQURhdlRBS2MySDNiYlc4RDZURk4zbjFyQnVFRld4aU1j?=
 =?utf-8?B?RHJzWEF1M251eUhveTArQjdkcmxRVDhOWGZTNUhjU2QwWUdHQkZuUjI3RjEx?=
 =?utf-8?B?RjBmaks3MXc0YlBvWEJYd1d4SmtDTk9UbjY5R1h5SEJkTFRYK2dOQXpxYmE5?=
 =?utf-8?B?ZGh3ak13VHhVYVdDTnQyVlVTcm82a0FmU3c1SkZPK2dpUWM3dThJUyttbG9Q?=
 =?utf-8?B?RkczejEraVdCWVozTnlVNi90czN4VDIrUmdmdVo1REg5aEZKRmNqbWpUcXpM?=
 =?utf-8?B?V2dsV2xDMHNpZWxtRkxCOHY3eXJQVC9YM2RIVGFZU1d1d0xTMmtiWm5OUXBZ?=
 =?utf-8?B?T3B2K0NVcXVJVXpvUE04QWV4bDVqRnFKb01GU1Bza0VieCtSVmltZHNYOEhv?=
 =?utf-8?B?T1duKytzRi8zUkRtWUNaOFhZKzg4a3c0cXg1Q2t6UG5jakZMcGVGYzRQaXB2?=
 =?utf-8?B?anlweXdlSDN1TEladGZSVHpRTHloTU1sNzRUdjd2VG1UU3pNbVliS05kajMv?=
 =?utf-8?B?MWlDUXNNZ24wR01VTlFzMEpsZDFndEZ1cm5xTHpHYTcwQ2VGSm1iMm5tV3dX?=
 =?utf-8?B?YXJrRUt3eFpvaVJOSXk4V3p0enRUS2NHV3VrUzZncXVWUzNIVWI5bUI0L25C?=
 =?utf-8?B?NldId2kvTmZCSHJpMXBjbFp3WWYvako0Wk9ERWFTek9ETGtPL2xvNlMreFdF?=
 =?utf-8?B?N0hka3pVbFRwOVhqelVaaXlhY1B6TW14SlBCb1hwMVE0RE9JQy95dU9DRjlH?=
 =?utf-8?B?UGc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3bba8ad-b35d-4a86-8b95-08db8c976c55
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5122.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 22:43:39.0171 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a6f1kZ8C90i6jdJwlajnFhIaZBxZNkVObEli/6l2d1OPdjjd9JaXJLe+DlALDXwDAT2Spwo3p/Z/ABotxaLWRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6797
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
Cc: Austin Shafer <ashafer@nvidia.com>, James Jones <jajones@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Xwayland merge request linked below has been updated to the new interface (via pending libdrm wrappers).
I have also posted a revised IGT test here https://lists.freedesktop.org/archives/igt-dev/2023-July/058449.html

On 7/21/23 11:50, Erik Kurzinger wrote:
> These new ioctls perform a task similar to
> DRM_IOCTL_SYNCOBJ_HANDLE_TO_FD/FD_TO_HANDLE with the
> IMPORT/EXPORT_SYNC_FILE flag set, except that they allow specifying the
> timeline point to import or export the fence to or from on a timeline
> syncobj.
> 
> This eliminates the need to use a temporary binary syncobj along with
> DRM_IOCTL_SYNCOBJ_TRANSFER to achieve such a thing, which is the
> technique userspace has had to employ up to this point. While that does
> work, it is rather awkward from the programmer's perspective.  Since DRM
> syncobjs have been proposed as the basis for display server explicit
> synchronization protocols, e.g. [1] and [2], providing a more
> streamlined interface now seems worthwhile.
> 
> [1] https://gitlab.freedesktop.org/wayland/wayland-protocols/-/merge_requests/90
> [2] https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/967
> 
> Accompanying userspace patches...
> IGT: https://gitlab.freedesktop.org/ekurzinger/igt-gpu-tools/-/commit/8cbee0c1782d6232de129e78cece3b94113992a5
> libdrm: https://gitlab.freedesktop.org/ekurzinger/drm/-/commit/8e1ac8d831e2f7b202314c849a61a8e623657c0b
> 
> V1 -> V2:
> fixed conflict with DRM_IOCTL_MODE_GETFB2
> re-ordered arguments of drm_syncobj_import_sync_file_fence
> 
> V2 -> V3:
> add missing comma (whoops)
> 
> Signed-off-by: Erik Kurzinger <ekurzinger@nvidia.com>
> Reviewed-by: Simon Ser <contact@emersion.fr>
> ---
>  drivers/gpu/drm/drm_internal.h |  4 +++
>  drivers/gpu/drm/drm_ioctl.c    |  4 +++
>  drivers/gpu/drm/drm_syncobj.c  | 62 ++++++++++++++++++++++++++++++----
>  include/uapi/drm/drm.h         |  8 +++++
>  4 files changed, 71 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> index ba12acd55139..903731937595 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -255,6 +255,10 @@ int drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
>  				      struct drm_file *file_private);
>  int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
>  			    struct drm_file *file_private);
> +int drm_syncobj_import_sync_file_ioctl(struct drm_device *dev, void *data,
> +				       struct drm_file *file_private);
> +int drm_syncobj_export_sync_file_ioctl(struct drm_device *dev, void *data,
> +				       struct drm_file *file_private);
>  
>  /* drm_framebuffer.c */
>  void drm_framebuffer_print_info(struct drm_printer *p, unsigned int indent,
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index f03ffbacfe9b..92d6da811afd 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -711,6 +711,10 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
>  		      DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF(DRM_IOCTL_SYNCOBJ_QUERY, drm_syncobj_query_ioctl,
>  		      DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF(DRM_IOCTL_SYNCOBJ_IMPORT_SYNC_FILE, drm_syncobj_import_sync_file_ioctl,
> +		      DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF(DRM_IOCTL_SYNCOBJ_EXPORT_SYNC_FILE, drm_syncobj_export_sync_file_ioctl,
> +		      DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF(DRM_IOCTL_CRTC_GET_SEQUENCE, drm_crtc_get_sequence_ioctl, 0),
>  	DRM_IOCTL_DEF(DRM_IOCTL_CRTC_QUEUE_SEQUENCE, drm_crtc_queue_sequence_ioctl, 0),
>  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_CREATE_LEASE, drm_mode_create_lease_ioctl, DRM_MASTER),
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index be3e8787d207..ee87707e7587 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -185,6 +185,13 @@
>   * Note that if you want to transfer a struct &dma_fence_chain from a given
>   * point on a timeline syncobj from/into a binary syncobj, you can use the
>   * point 0 to mean take/replace the fence in the syncobj.
> + *
> + * &DRM_IOCTL_SYNCOBJ_IMPORT_SYNC_FILE and &DRM_IOCTL_SYNCOBJ_EXPORT_SYNC_FILE
> + * let the client import or export the struct &dma_fence_chain of a syncobj
> + * at a particular timeline point from or to a sync file.
> + * These behave similarly to &DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE
> + * and &DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE described above, except
> + * that they accommodate timeline syncobjs in addition to binary syncobjs.
>   */
>  
>  #include <linux/anon_inodes.h>
> @@ -736,10 +743,11 @@ static int drm_syncobj_fd_to_handle(struct drm_file *file_private,
>  }
>  
>  static int drm_syncobj_import_sync_file_fence(struct drm_file *file_private,
> -					      int fd, int handle)
> +					      int fd, int handle, u64 point)
>  {
>  	struct dma_fence *fence = sync_file_get_fence(fd);
>  	struct drm_syncobj *syncobj;
> +	int ret = 0;
>  
>  	if (!fence)
>  		return -EINVAL;
> @@ -750,14 +758,23 @@ static int drm_syncobj_import_sync_file_fence(struct drm_file *file_private,
>  		return -ENOENT;
>  	}
>  
> -	drm_syncobj_replace_fence(syncobj, fence);
> +	if (point == 0) {
> +		drm_syncobj_replace_fence(syncobj, fence);
> +	} else {
> +		struct dma_fence_chain *chain = dma_fence_chain_alloc();
> +		if (chain) {
> +			drm_syncobj_add_point(syncobj, chain, fence, point);
> +		} else {
> +			ret = -ENOMEM;
> +		}
> +	}
>  	dma_fence_put(fence);
>  	drm_syncobj_put(syncobj);
> -	return 0;
> +	return ret;
>  }
>  
>  static int drm_syncobj_export_sync_file(struct drm_file *file_private,
> -					int handle, int *p_fd)
> +					int handle, u64 point, int *p_fd)
>  {
>  	int ret;
>  	struct dma_fence *fence;
> @@ -767,7 +784,7 @@ static int drm_syncobj_export_sync_file(struct drm_file *file_private,
>  	if (fd < 0)
>  		return fd;
>  
> -	ret = drm_syncobj_find_fence(file_private, handle, 0, 0, &fence);
> +	ret = drm_syncobj_find_fence(file_private, handle, point, 0, &fence);
>  	if (ret)
>  		goto err_put_fd;
>  
> @@ -877,7 +894,7 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device *dev, void *data,
>  
>  	if (args->flags & DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE)
>  		return drm_syncobj_export_sync_file(file_private, args->handle,
> -						    &args->fd);
> +						    0 /* binary */, &args->fd);
>  
>  	return drm_syncobj_handle_to_fd(file_private, args->handle,
>  					&args->fd);
> @@ -902,7 +919,8 @@ drm_syncobj_fd_to_handle_ioctl(struct drm_device *dev, void *data,
>  	if (args->flags & DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE)
>  		return drm_syncobj_import_sync_file_fence(file_private,
>  							  args->fd,
> -							  args->handle);
> +							  args->handle,
> +							  0 /* binary */);
>  
>  	return drm_syncobj_fd_to_handle(file_private, args->fd,
>  					&args->handle);
> @@ -1651,3 +1669,33 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
>  
>  	return ret;
>  }
> +
> +int drm_syncobj_import_sync_file_ioctl(struct drm_device *dev, void *data,
> +				       struct drm_file *file_private)
> +{
> +	struct drm_syncobj_sync_file *args = data;
> +
> +	if (!drm_core_check_feature(dev, args->point == 0 ?
> +				    DRIVER_SYNCOBJ :
> +				    DRIVER_SYNCOBJ_TIMELINE))
> +		return -EOPNOTSUPP;
> +
> +	return drm_syncobj_import_sync_file_fence(file_private,
> +						  args->fd,
> +						  args->handle,
> +						  args->point);
> +}
> +
> +int drm_syncobj_export_sync_file_ioctl(struct drm_device *dev, void *data,
> +				       struct drm_file *file_private)
> +{
> +	struct drm_syncobj_sync_file *args = data;
> +
> +	if (!drm_core_check_feature(dev, args->point == 0 ?
> +				    DRIVER_SYNCOBJ :
> +				    DRIVER_SYNCOBJ_TIMELINE))
> +		return -EOPNOTSUPP;
> +
> +	return drm_syncobj_export_sync_file(file_private, args->handle,
> +					    args->point, &args->fd);
> +}
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 863e47200911..3a00eaa7cc33 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -884,6 +884,12 @@ struct drm_syncobj_transfer {
>  	__u32 pad;
>  };
>  
> +struct drm_syncobj_sync_file {
> +	__u32 handle;
> +	__u32 fd;
> +	__u64 point;
> +};
> +
>  #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL (1 << 0)
>  #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT (1 << 1)
>  #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE (1 << 2) /* wait for time point to become available */
> @@ -1191,6 +1197,8 @@ extern "C" {
>  #define DRM_IOCTL_MODE_GETFB2		DRM_IOWR(0xCE, struct drm_mode_fb_cmd2)
>  
>  #define DRM_IOCTL_SYNCOBJ_EVENTFD	DRM_IOWR(0xCF, struct drm_syncobj_eventfd)
> +#define DRM_IOCTL_SYNCOBJ_IMPORT_SYNC_FILE	DRM_IOWR(0xD0, struct drm_syncobj_sync_file)
> +#define DRM_IOCTL_SYNCOBJ_EXPORT_SYNC_FILE	DRM_IOWR(0xD1, struct drm_syncobj_sync_file)
>  
>  /*
>   * Device specific ioctls should only be in their respective headers

