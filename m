Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6DB7EA30F
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 19:49:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EFC810E187;
	Mon, 13 Nov 2023 18:49:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8835010E187
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 18:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699901365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J9Fat91VCfWswbfB4dQoar2RJWXbpc4KeUVKZoklMG4=;
 b=UTnm1QUR5rZRRZ3/+AIS0gDlleJ7KCgUVGQWKZF2kuLq0vJnjIeitJRybnU7xAQezDxCZ/
 fE0Wl/IFE0W6OY5145a5jf8Zbl3tqWIvM4BYH0t5KSa/XYVdo4HHJiRruJSciIduvS+UvH
 JSOlBgFfWwunXRLOtiqUVOGLNgsltWo=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-694-sxnV8reXMsKkIYn2gMnjqQ-1; Mon, 13 Nov 2023 13:49:23 -0500
X-MC-Unique: sxnV8reXMsKkIYn2gMnjqQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-9e5dd91b0ebso216528466b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 10:49:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699901363; x=1700506163;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J9Fat91VCfWswbfB4dQoar2RJWXbpc4KeUVKZoklMG4=;
 b=sXDgqoI21CORchVeumy7gxzRV/e0gagDGjlsG3oxpMzFhDCZjPSyOec34ii/9+Z6nG
 uple3oMTNEvdTYfeNwnZQisZwuRLrYnVkE0sMRGXv0IU1BNp/Gcq8yVUDPbjdemQYw/B
 Gni7bBJrbqF0ghxGSzm0vE0FWpqzJSIa1OdwJrLuyQ/8M37gTez6ZGhZj1lrF8/QgAvC
 fpi0M748dszs8gLFTIbkgXJ8lEERwnGZmS4nm2h8GTSUvg7Boy736/FdMxMaTr5DexZA
 3RnlKnpzqOP1urks/LfgP/otRY1T4cuIl09g4CWIxrkBmKREHOGAc6cQUZwHZxjM9WCk
 zOuw==
X-Gm-Message-State: AOJu0YxwQi1OojlAD4cLU1PMneebEF2TI1QzwoPeZgvhclc9GcGsWUFK
 OjSmCqswK+tEEkFcFCsWH75vUNx8B2Bj6P4iYEVsQHaH+RJ/UhKAH7kdZhhOcaDcw4Ja7eYYHVd
 JvZTKwLYQAfQSceoxE86CrwHVQuQ9
X-Received: by 2002:a17:906:3bd7:b0:9dd:7ccf:77f8 with SMTP id
 v23-20020a1709063bd700b009dd7ccf77f8mr4957511ejf.20.1699901362781; 
 Mon, 13 Nov 2023 10:49:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQ0uVWVogauvgHwe0HaAW2uaROhlGctVUZQkTd5P1FixQh0Rbjuz2KkG7VPVhO+wwo/3DUDA==
X-Received: by 2002:a17:906:3bd7:b0:9dd:7ccf:77f8 with SMTP id
 v23-20020a1709063bd700b009dd7ccf77f8mr4957500ejf.20.1699901362466; 
 Mon, 13 Nov 2023 10:49:22 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 y24-20020a170906471800b009dda94509casm4368759ejq.102.2023.11.13.10.49.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Nov 2023 10:49:21 -0800 (PST)
Message-ID: <373d97fc-0612-40da-ae9d-6702aa4483ba@redhat.com>
Date: Mon, 13 Nov 2023 19:49:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] driver: gpu: Fixing warning directly dereferencing a
 rcu pointer
To: Abhinav Singh <singhabhinav9051571833@gmail.com>, kherbst@redhat.com,
 lyude@redhat.com, airlied@gmail.com, daniel@ffwll.ch
References: <d33fc41b-5a1f-4186-a0b2-3c82dcb8f00b@redhat.com>
 <20231113184238.3276835-1-singhabhinav9051571833@gmail.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20231113184238.3276835-1-singhabhinav9051571833@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: nouveau@lists.freedesktop.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

thanks for sending a v2.

On 11/13/23 19:42, Abhinav Singh wrote:
> This patch fixes a sparse warning with this message
> "warning:dereference of noderef expression". In this context it means we
> are dereferencing a __rcu tagged pointer directly.

Better use imperative here, e.g. "Fix a sparse warning ...".

Wouldn't ask you to send a v3 for that alone...

> 
> We should not be directly dereferencing a rcu pointer, rather we should
> be using rcu helper function rcu_dereferece() inside rcu read critical
> section to get a normal pointer which can be dereferenced.

...but this doesn't seem accurate anymore as well.

- Danilo

> 
> I tested with qemu with this command
> qemu-system-x86_64 \
> 	-m 2G \
> 	-smp 2 \
> 	-kernel bzImage \
> 	-append "console=ttyS0 root=/dev/sda earlyprintk=serial net.ifnames=0" \
> 	-drive file=bullseye.img,format=raw \
> 	-net user,host=10.0.2.10,hostfwd=tcp:127.0.0.1:10021-:22 \
> 	-net nic,model=e1000 \
> 	-enable-kvm \
> 	-nographic \
> 	-pidfile vm.pid \
> 	2>&1 | tee vm.log
> with lockdep enabled.
> 
> Signed-off-by: Abhinav Singh <singhabhinav9051571833@gmail.com>
> ---
> v1 -> v2 : Replaced the rcu_dereference(...) with unrcu_pointer(...) and
> also removed the rcu locking and unlocking function call.
> 
>   drivers/gpu/drm/nouveau/nv04_fence.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nv04_fence.c b/drivers/gpu/drm/nouveau/nv04_fence.c
> index 5b71a5a5cd85..cdbc75e3d1f6 100644
> --- a/drivers/gpu/drm/nouveau/nv04_fence.c
> +++ b/drivers/gpu/drm/nouveau/nv04_fence.c
> @@ -39,7 +39,7 @@ struct nv04_fence_priv {
>   static int
>   nv04_fence_emit(struct nouveau_fence *fence)
>   {
> -	struct nvif_push *push = fence->channel->chan.push;
> +	struct nvif_push *push = unrcu_pointer(fence->channel)->chan.push;
>   	int ret = PUSH_WAIT(push, 2);
>   	if (ret == 0) {
>   		PUSH_NVSQ(push, NV_SW, 0x0150, fence->base.seqno);

