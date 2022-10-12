Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 184C05FCE93
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 00:49:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6813310E1D2;
	Wed, 12 Oct 2022 22:48:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D8EA10E1B8
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Oct 2022 22:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665614929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p5nfuKdPwrQVXi/vnKW1FCyCONTVZtF3Xa0tpdwXNtg=;
 b=T5hDaV15150hxKObhFeKN+XxoDHsE4/ilmXaSyvmiYPdeeKXdM3au/ezCPpfNeY91VBXuR
 OaKRjuQI/SsbclGZTimM+08OLaTbU0IglPQpQgZhOdvlWcwdeUkijEBdE+NaFrHMfdhpaT
 rCgRBYigwgU6NjLq/dI0ip+ZM/3qXaU=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-46-i4VlwFdfPZ-3VYsZgZUURA-1; Wed, 12 Oct 2022 18:48:48 -0400
X-MC-Unique: i4VlwFdfPZ-3VYsZgZUURA-1
Received: by mail-qk1-f197.google.com with SMTP id
 w10-20020a05620a444a00b006ce9917ea1fso85973qkp.16
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Oct 2022 15:48:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p5nfuKdPwrQVXi/vnKW1FCyCONTVZtF3Xa0tpdwXNtg=;
 b=4k4BtTQQ66XDcP7oT/7GG+zCk/6FOELyizvuu5MdvGAnWJBuUBG/5QQV1rLIWHLyQU
 qcmWbDrrL1UhTL5SVngAB2o5yTAoIQfszZCrcba/LTee5zcRP62dxgpzMIQQkYVX7h19
 LyIm48MeX+X/7BLJugUyCaUhZIRl2vvv0kzfjYIeFJ75MJ4vqbHx4yMcKmDsx60oOkxJ
 P4rZQ8VR1WYxiV/ZAt2qWs+Hz3CmgbZbyMYGsQOh8F7YG/wqF9EFdIBG4FKzbsa6Va9d
 DUXeTYq6+XqMXF2FmXBIM4om3dn9jbiiZ90y8cPVcV1t18I8eg8vbvQAhIjWVi14vnJ/
 nwUg==
X-Gm-Message-State: ACrzQf27Ji4B8N/FhjUFwv/ZQyuE6jdUnpxQJuGzwRYSxCIPoc1YzwFS
 bfvPo3YeqKkQdVOtx6e7RXPBj3TEbpUxX0I8oLBbgBt06ng0jeWb1pBamh3SC57z60Jr4TuMOnX
 qua06bJnHsiyg9dDvZRc+Gb/cw4Vw
X-Received: by 2002:a05:620a:27d2:b0:6cf:b644:f644 with SMTP id
 i18-20020a05620a27d200b006cfb644f644mr22536279qkp.35.1665614928503; 
 Wed, 12 Oct 2022 15:48:48 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM72AflosodYNtr/quj11dfW8xw1ovGZzl7sA9B7tx1ZGymI0DOPi1vu4e2bPcM1ZP1Q5MC8dg==
X-Received: by 2002:a05:620a:27d2:b0:6cf:b644:f644 with SMTP id
 i18-20020a05620a27d200b006cfb644f644mr22536261qkp.35.1665614928240; 
 Wed, 12 Oct 2022 15:48:48 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c68:4300:fdba:af4a:bbcd:7e28?
 ([2600:4040:5c68:4300:fdba:af4a:bbcd:7e28])
 by smtp.gmail.com with ESMTPSA id
 l10-20020ac8148a000000b0039cc47752casm1669626qtj.77.2022.10.12.15.48.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Oct 2022 15:48:47 -0700 (PDT)
Message-ID: <9c36a93654c5aa9c850cd5d42681aa951df9e769.camel@redhat.com>
Subject: Re: [PATCH -next] drm/nouveau/disp: fix cast removes address space
 of expression warnings
From: Lyude Paul <lyude@redhat.com>
To: ruanjinjie <ruanjinjie@huawei.com>, bskeggs@redhat.com,
 kherbst@redhat.com,  airlied@linux.ie, linux-kernel@vger.kernel.org,
 daniel@ffwll.ch,  jani.nikula@intel.com, airlied@redhat.com,
 tzimmermann@suse.de,  hverkuil-cisco@xs4all.nl, greenfoo@u92.eu,
 seanpaul@chromium.org,  dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Date: Wed, 12 Oct 2022 18:48:46 -0400
In-Reply-To: <20220924092516.10007-1-ruanjinjie@huawei.com>
References: <20220924092516.10007-1-ruanjinjie@huawei.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

...oops, totally forgot to actually give you the magic tag so patchwork knows
I reviewed it:

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Sat, 2022-09-24 at 17:25 +0800, ruanjinjie wrote:
> When build Linux kernel with 'make C=2', encounter the following warnings:
> 
> ./drivers/gpu/drm/nouveau/dispnv50/disp.c:134:34: warning: cast removes address space '__iomem' of expression
> ./drivers/gpu/drm/nouveau/dispnv50/disp.c:197:34: warning: cast removes address space '__iomem' of expression
> 
> The data type of dmac->_push.mem.object.map.ptr is 'void __iomem *', but
> converted to 'u32 *' directly and cause above warnings, now
> recover their data types to fix these warnings.
> 
> Signed-off-by: ruanjinjie <ruanjinjie@huawei.com>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/disp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index 33c97d510999..aa94f8e284dd 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -131,7 +131,7 @@ nv50_dmac_kick(struct nvif_push *push)
>  {
>  	struct nv50_dmac *dmac = container_of(push, typeof(*dmac), _push);
>  
> -	dmac->cur = push->cur - (u32 *)dmac->_push.mem.object.map.ptr;
> +	dmac->cur = push->cur - (u32 __iomem *)dmac->_push.mem.object.map.ptr;
>  	if (dmac->put != dmac->cur) {
>  		/* Push buffer fetches are not coherent with BAR1, we need to ensure
>  		 * writes have been flushed right through to VRAM before writing PUT.
> @@ -194,7 +194,7 @@ nv50_dmac_wait(struct nvif_push *push, u32 size)
>  	if (WARN_ON(size > dmac->max))
>  		return -EINVAL;
>  
> -	dmac->cur = push->cur - (u32 *)dmac->_push.mem.object.map.ptr;
> +	dmac->cur = push->cur - (u32 __iomem *)dmac->_push.mem.object.map.ptr;
>  	if (dmac->cur + size >= dmac->max) {
>  		int ret = nv50_dmac_wind(dmac);
>  		if (ret)

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

