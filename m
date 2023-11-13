Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A907EA3C4
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 20:31:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72ADD10E196;
	Mon, 13 Nov 2023 19:31:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0878D10E18E;
 Mon, 13 Nov 2023 19:31:44 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-58962bf3f89so325713a12.0; 
 Mon, 13 Nov 2023 11:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699903903; x=1700508703; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y/ya4lKSeDeZMEtHM/vOqEa/CuouJ2vfBkewF1j97GI=;
 b=MEHo6sDz5tLAX9w1paDUd7I8lGMQl+XFuj4m9onPlpWIBQYN5vIS8Nodrrof46mopB
 mq7td3Fbopz5YQgRPYOU/Rn+t8l9OKdopaI2PePDBiMcz3S9+1UWhg4Q7YIcye+QvikE
 nGaifu3l62s0bGHAVKcWXymRP6zCHj6AKoNi+XWxc1eZ0MJAaDSocv636JpHJxjVprGx
 jUEdSb0VOMuJpZ0ZUcrlHu0AvKR9MY1rpSISIJYmmfV7IRLWA/CFamACB4jnbdWykIO8
 ZXytTA40EqNNlsEK2I2hNu68p9sqDWyqxdD8KF4Ae0FVd2ilHigNEIZ6vmh1TIpbfPMJ
 UqsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699903903; x=1700508703;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y/ya4lKSeDeZMEtHM/vOqEa/CuouJ2vfBkewF1j97GI=;
 b=k5jHry36Q/U6FSODRtvBXD1i7NlbRyVcC0f5vFyymIW/mtEva4t0l+6e2WmlU3fPKw
 z6jwdJEL1uMUM5asv9tQjPV1tNZ6S4rOzYNKla+G7e7XYXyLTKCIga8gaKzdEiaFd+Bz
 i+E3xU5shlud911NpLI3Kmw2a2EXgzkhT1E5H3zRinGzmbse0utEa2FC1FUnsqQSTJNc
 1GRy0TjyxzB4ch5v2vK6geNxeyemH9EfoIKwoUTyzB8r3ntp/q8hh4WPuRg1eE96ZuKJ
 GVeWGAocsKD8SSqcfrSLNIL5lotdlg+B/1feH6rdnNyYLrgxfvcTfoE6UPfOo1bvx2TY
 +GWA==
X-Gm-Message-State: AOJu0YyGS5EkfCzJ1oxpO2pA6CTHayBVhKRPDndQ45TZzpTXuXg1P6ah
 gizKZ2kbaLzO66FvLMtrvdc=
X-Google-Smtp-Source: AGHT+IHY3zaBuTI7fce0sQWhI+Z7AUzp84RcB6fLnCjZ28J35T5xGuGiZVl899gjrlTg6KyEo4oT3w==
X-Received: by 2002:a05:6a20:8406:b0:186:e43:c60e with SMTP id
 c6-20020a056a20840600b001860e43c60emr362303pzd.1.1699903903458; 
 Mon, 13 Nov 2023 11:31:43 -0800 (PST)
Received: from [192.168.0.152] ([103.75.161.208])
 by smtp.gmail.com with ESMTPSA id
 d17-20020a170902c19100b001c60c8d6b4asm4369489pld.149.2023.11.13.11.31.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Nov 2023 11:31:42 -0800 (PST)
Message-ID: <1b5836af-3dbd-4031-a759-01f9885777bf@gmail.com>
Date: Tue, 14 Nov 2023 01:01:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] driver: gpu: Fixing warning directly dereferencing a
 rcu pointer
Content-Language: en-US
To: kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com, airlied@gmail.com, 
 daniel@ffwll.ch
References: <8e9efe54-2799-4539-a8b0-aa199f8052f6@redhat.com>
 <20231113191303.3277733-1-singhabhinav9051571833@gmail.com>
From: Abhinav Singh <singhabhinav9051571833@gmail.com>
In-Reply-To: <20231113191303.3277733-1-singhabhinav9051571833@gmail.com>
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

On 11/14/23 00:43, Abhinav Singh wrote:
> This patch fixes a sparse warning with this message
> "warning:dereference of noderef expression". In this context it means we
> are dereferencing a __rcu tagged pointer directly.
> 
> We should not be directly dereferencing a rcu pointer. To get a normal
> (non __rcu tagged pointer) from a __rcu tagged pointer we are using the
> function unrcu_pointer(...). The non __rcu tagged pointer then can be
> dereferenced just like a normal pointer.
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
>             also removed the rcu locking and unlocking function call.
> v2 -> v3 : Changed the description of the patch to match it with the actual
> 	   implementation.
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
Hi, just for the sake of my own confirmation, the patch is merge ready 
right? once the CI runs successfully it will be merged right?


Thank You,
Abhinav Singh
