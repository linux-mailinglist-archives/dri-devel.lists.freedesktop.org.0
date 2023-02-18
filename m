Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E02B969BBAF
	for <lists+dri-devel@lfdr.de>; Sat, 18 Feb 2023 20:56:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E980C10E559;
	Sat, 18 Feb 2023 19:56:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A72D10E556;
 Sat, 18 Feb 2023 19:56:19 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-171a987211aso1746464fac.6; 
 Sat, 18 Feb 2023 11:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pJ2ZMFT38vQViijO27B/tLBsjsHvVaQo7moB9cPzCPI=;
 b=kkYv88Rk/ek6WMP5BZFrfc59ksAbIz8IGepDiQMdc4Rp1s5tXvHgxbdkY8tO3cH2r1
 HnlQS7Y/+Ju0u2/Z1JOBTbQsAMoQ+QVAVFIeUl+2eBTbYjKPY1X1i+YJDqttkRsr8jE4
 LfAlqniUfJHZ+n2sPfgWCy8bYIULwV+mPOEyJn5Fsre9gXQHdoMU/gxEnZmp/dyU+b9b
 YXjKjS/0NU9rFqL4AzYZSBpFpKBALkzefHlOSw9WtSy4OUNAqyRj5z3scI5V7sGZkU87
 //WUjwHCG5Pm67CeP5vhUhDL1UZ3HkfP/2RFkiE5Uf8rqxiqnMPzSnogxnMp1MREliqg
 D7nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pJ2ZMFT38vQViijO27B/tLBsjsHvVaQo7moB9cPzCPI=;
 b=AV6PQ28cWJQ4IAdxwftdBv8lztlQ7WRCaahLzB3Ouqm/WhuS7EgoQQGypaiLxRRAAq
 VN6Ya5fmyr8tJyWcIMs4WelxOGcSXMB8ODTqfqJe5p3OAHCZMxLbd6TM5SGpaYHewIHV
 xC6g3ZxpRnnHaVZz/UpG1eB93fuIV1gx3HrRTYqCAzINDAJrNXGYdttZeDHTvhO5A6tY
 P647aXiikmlVMSNaKVaYyqvz4B64onOFiTl0pK0mcRO7246ItxMnuklZ4ckbU9GGFlrr
 zfE6s8o4k4tP5z49n/aI4fR0/1R5+XanOn6DUfYYQQ28aqfKLn2nEc3Mhh61eYX2YC5D
 WqSg==
X-Gm-Message-State: AO0yUKVBSHTOFySxl7KfbYA8d5YDN2EChMy5YZ3y6MUA/jZujmosQ/WD
 P//Pw3Gdqog6+jCU1CJ5uj0wRVlTyCRUka6yg+I=
X-Google-Smtp-Source: AK7set+9gqrKCFDsFXPO/agK1KnLO9P4A9SgvMdJ7NqxrEPJmG7k2u1mcEu3WhKEsKj2kVsJvSswp02yoegKxEhrPxc=
X-Received: by 2002:a05:6870:32d4:b0:16e:5e5a:49da with SMTP id
 r20-20020a05687032d400b0016e5e5a49damr797956oac.58.1676750178489; Sat, 18 Feb
 2023 11:56:18 -0800 (PST)
MIME-Version: 1.0
References: <20230216105921.624960-1-tvrtko.ursulin@linux.intel.com>
 <20230216105921.624960-7-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230216105921.624960-7-tvrtko.ursulin@linux.intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Sat, 18 Feb 2023 11:56:39 -0800
Message-ID: <CAF6AEGuXNCXL5cNy4nS8sd6iVj7E62C93o+HZLVkeqpOcWGdKw@mail.gmail.com>
Subject: Re: [Intel-gfx] [RFC 6/9] drm/syncobj: Mark syncobj waits as external
 waiters
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 16, 2023 at 2:59 AM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> Use the previously added dma-fence tracking of explicit waiters.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>  drivers/gpu/drm/drm_syncobj.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index 0c2be8360525..776b90774a64 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -1065,9 +1065,9 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
>                         if ((flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE) ||
>                             dma_fence_is_signaled(fence) ||
>                             (!entries[i].fence_cb.func &&
> -                            dma_fence_add_callback(fence,
> -                                                   &entries[i].fence_cb,
> -                                                   syncobj_wait_fence_func))) {
> +                            dma_fence_add_wait_callback(fence,
> +                                                        &entries[i].fence_cb,
> +                                                        syncobj_wait_fence_func))) {

I think this isn't really what you want if count > 1, because you
wouldn't be notifying the fence signaler of fence n+1 until the wait
on fence n completed

BR,
-R

>                                 /* The fence has been signaled */
>                                 if (flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL) {
>                                         signaled_count++;
> --
> 2.34.1
>
