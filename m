Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC4F2FB490
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 09:51:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F106E071;
	Tue, 19 Jan 2021 08:51:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 563A76E02A;
 Tue, 19 Jan 2021 08:51:21 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id u19so20558842edx.2;
 Tue, 19 Jan 2021 00:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=E4K/7c/d0zG+ZKD1p+3n19G3l5RBZVxMsZ80deBL9hw=;
 b=DVo6NDWvEL33xIYSUTMdmCeD0vs7yEPGwR35VscSdEoZ5A+F0B5bHxo9GUH3r2vv6L
 VGbQounAN9UCRUd1+vcFsDCY2wEi/TwMGguSCpvZg2uRV1GG5EYelOM/6Kqm05YiLwES
 qNaNE3xn2biWfU+tPTq1eUJIBKXkyVzmZEdaHrSJVaW8dJrnRumwNy5/Gf1Lx8Rdr2Cb
 iqeCq+fyURZn0Z4VnrbLP/Bj6K9UUWa8SrftrNYcAGD9vXZYWNMR1VvfzGT3lJUkUcga
 IpOgtuoD25FZIYmlOhlWYlNo6kso1fJBPTZIMzzVTE30ST6Npxwzv8pnjlb3KIensNf1
 drMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=E4K/7c/d0zG+ZKD1p+3n19G3l5RBZVxMsZ80deBL9hw=;
 b=iIOtq1B7t8EfZNjV+ZsgrjU0PIfU+VunA9o2v/sYtsrFBJ9v5Qy6Xc1mal9ZMkJ1Ja
 Frpxx7fXguDx99ebEQjpahJCb/9jlfnUsa6D2oxVcA8HmG0Lj8qW1NRYvMyEvuU8+SH1
 hZhWrBxJqQuX/85AalIPODYTqE7Ty3Yzx5QecFMov7NdseiB2CaTIafgznOmZIhh9cWD
 hWQyNQ8o3WGs+7Y13CuPlDhEc/nG2r/DmDNmzm2s3tSTojKOphONFY8rrCl8h8aCgKAB
 lwcSLYQPjlm+XYGppkmPNiu1W8QbJln/l57HiACZ5TBhvfpw/akV/fPzcGKVbPF3xrzU
 8Wxw==
X-Gm-Message-State: AOAM531eUL2m9gwLngoUTh9H1m8afdUjIct5AaGadCEWxjbueSNYUQY8
 /oEwDQsnPybYuNfRq1MDvzo=
X-Google-Smtp-Source: ABdhPJwCHUSiXqU7JIXwJx/tVYq+n/XqeLHtzmTLyrsRSeTRCPvw0fqP79gJvVrii+x32cMGICPkoA==
X-Received: by 2002:a05:6402:3188:: with SMTP id
 di8mr2675455edb.318.1611046280108; 
 Tue, 19 Jan 2021 00:51:20 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id z6sm8765374ejx.17.2021.01.19.00.51.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 00:51:19 -0800 (PST)
Subject: Re: [PATCH v4 08/14] drm/amdgpu: Fix a bunch of sdma code crash post
 device unplug
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, robh@kernel.org, l.stach@pengutronix.de,
 yuq825@gmail.com, eric@anholt.net
References: <1611003683-3534-1-git-send-email-andrey.grodzovsky@amd.com>
 <1611003683-3534-9-git-send-email-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <b7526bf2-14de-74d9-c724-ae66263b3298@gmail.com>
Date: Tue, 19 Jan 2021 09:51:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1611003683-3534-9-git-send-email-andrey.grodzovsky@amd.com>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.01.21 um 22:01 schrieb Andrey Grodzovsky:
> We can't allocate and submit IBs post device unplug.
>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index ad91c0c..5096351 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -31,6 +31,7 @@
>   #include <linux/dma-buf.h>
>   
>   #include <drm/amdgpu_drm.h>
> +#include <drm/drm_drv.h>
>   #include "amdgpu.h"
>   #include "amdgpu_trace.h"
>   #include "amdgpu_amdkfd.h"
> @@ -1604,7 +1605,10 @@ static int amdgpu_vm_bo_update_mapping(struct amdgpu_device *adev,
>   	struct amdgpu_vm_update_params params;
>   	enum amdgpu_sync_mode sync_mode;
>   	uint64_t pfn;
> -	int r;
> +	int r, idx;
> +
> +	if (!drm_dev_enter(&adev->ddev, &idx))
> +		return -ENOENT;

Why not -ENODEV?

>   
>   	memset(&params, 0, sizeof(params));
>   	params.adev = adev;
> @@ -1647,6 +1651,8 @@ static int amdgpu_vm_bo_update_mapping(struct amdgpu_device *adev,
>   	if (r)
>   		goto error_unlock;
>   
> +
> +	drm_dev_exit(idx);

That's to early. You probably need to do this much further below after 
the commit.

Christian.

>   	do {
>   		uint64_t tmp, num_entries, addr;
>   

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
