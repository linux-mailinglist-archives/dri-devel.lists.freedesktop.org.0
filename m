Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BE598A107
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 13:46:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAEC310E3F4;
	Mon, 30 Sep 2024 11:46:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fXAXB9TA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15B4110E3F9
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 11:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1727696792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9dflzTnD9vkyLsgpnVQZfCLOfINJ0d45UnhsxkoL0jE=;
 b=fXAXB9TAjFJoYy83uA+olz9gDp/PFHmDY8Xxb5PyoeWpK1kJJTO0cfZdqoJYby7ZpZ+5qh
 G2o8XJBoqUt3HMse3gYCJrbFAKyDg0fRep37Ew3UZuNGe7H6oDIbVWBrrmX7/pGtrriJf0
 T7dHL0MhwkBbn2bvuwVH3Ph39GmqhPY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-77-wpOjdJzXN1eqU_u8ZLhu6w-1; Mon, 30 Sep 2024 07:46:31 -0400
X-MC-Unique: wpOjdJzXN1eqU_u8ZLhu6w-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-42cb080ab53so32638485e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 04:46:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727696789; x=1728301589;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9dflzTnD9vkyLsgpnVQZfCLOfINJ0d45UnhsxkoL0jE=;
 b=HaqkkymmMMUWUQa2wkZ82HZ2yvpoiSSAoIFHRP0a3ZjfMKwxVlHXv0sr/7hx1Acaq9
 3faFHco1XjqlwQaQCFCZMDYg35KAuzXedV2YDcr0VqMfEprQpdzEIZIxrzPomg+Wvsx6
 35GqOafBgKNqHkcv3GFm9avUTUON5AZtG6RUemFkMr0BsooyMe1Vkd1GTabm88WVJymR
 r4ZiIJ1l1n4oipFtxPX/hix7LJyyrcb4/BxmqKeS/+au5Y1WzlSgOHGl7GvNWEem7w7m
 6+Jn9H87iSdtsChFRJIqYToxuEqzqkFUtXSmHCPJETIKTF555za2yMf3xcZqZMaXsZD3
 B6pQ==
X-Gm-Message-State: AOJu0Yxsnpe/H28sokLclMAHeN9KeHmHEoQa34FNhJ8kZIC1FgOOQLsk
 jgDh6tFzW+Z2QKPPonGnTV7kxSBYiaE80NQgjzuSkL6Qm/R/6JteFnQ8lw4Ii5rNBpz78/1/sx/
 zxWY7hnFfqG6GjBWZ58oFdlHLjdl5EcjUAfgwechd5XYv7OJZ6c7r1lSmxIFwTx3Mnw==
X-Received: by 2002:a5d:4449:0:b0:37c:cbca:fd82 with SMTP id
 ffacd0b85a97d-37cd5a6bf37mr8142568f8f.1.1727696789127; 
 Mon, 30 Sep 2024 04:46:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCLLMP4eWziJje4qLxBniM/1l717DjN4rYkRrUfLNGvZq4irAlFPPhs47tndfAyLGLqSxLgA==
X-Received: by 2002:a5d:4449:0:b0:37c:cbca:fd82 with SMTP id
 ffacd0b85a97d-37cd5a6bf37mr8142547f8f.1.1727696788699; 
 Mon, 30 Sep 2024 04:46:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37cd565e767sm8897572f8f.38.2024.09.30.04.46.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Sep 2024 04:46:28 -0700 (PDT)
Message-ID: <9c025c92-36f2-4358-af24-b699bfa84b43@redhat.com>
Date: Mon, 30 Sep 2024 13:46:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] drm: Introduce DRM client library
To: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
 airlied@gmail.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20240927144252.31813-1-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240927144252.31813-1-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 27/09/2024 16:37, Thomas Zimmermann wrote:
> With the next DRM client coming soon (drm_log) and most of DRM's
> fbdev emulation consolidated in a few places, it's time to provide
> a single place for the clients.
> 
> The new module drm_client_lib.ko stores most of the common client
> code. It's designed such that drivers can opt into client support,
> but the presence of the client module depends on the user's kernel
> configuration. Without selected clients, no client module will be
> build.

Thanks for this work, I've rebased drm_log on top of this, and it works 
great.

My only nitpick is I would prefer it to be called drm_client.ko, to be a 
little shorter. So that the kernel parameter to change the default 
client can be "drm_client.default=fbdev".

Best regards,

-- 

Jocelyn

> 
> Thomas Zimmermann (5):
>    drm/i915: Select DRM_CLIENT_SELECTION
>    drm/xe: Select DRM_CLIENT_SELECTION
>    drm: Move client-device functions in to drm_client_dev.c
>    drm: Select fbdev helpers for modules that require them
>    drm: Add client-lib module
> 
>   Documentation/gpu/drm-client.rst   |   3 +
>   drivers/gpu/drm/Kconfig            |  34 +++++--
>   drivers/gpu/drm/Makefile           |  20 +++--
>   drivers/gpu/drm/amd/amdgpu/Kconfig |   1 +
>   drivers/gpu/drm/drm_client.c       | 122 +------------------------
>   drivers/gpu/drm/drm_client_dev.c   | 138 +++++++++++++++++++++++++++++
>   drivers/gpu/drm/drm_dumb_buffers.c |   2 +
>   drivers/gpu/drm/drm_file.c         |   2 +
>   drivers/gpu/drm/drm_framebuffer.c  |   2 +
>   drivers/gpu/drm/drm_gem.c          |   2 +
>   drivers/gpu/drm/i915/Kconfig       |   1 +
>   drivers/gpu/drm/xe/Kconfig         |   1 +
>   12 files changed, 196 insertions(+), 132 deletions(-)
>   create mode 100644 drivers/gpu/drm/drm_client_dev.c
> 

