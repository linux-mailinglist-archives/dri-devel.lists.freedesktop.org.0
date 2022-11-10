Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0964624E6E
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 00:27:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08FDB10E0F9;
	Thu, 10 Nov 2022 23:27:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 872C510E0F7
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 23:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668122815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R5WN4LPTWCYcMdrX9hnDvdz97iHmFZw67GhV8oh/zXQ=;
 b=inwtbP4Bds4OUxWIccDY9Aj/rCyMVEsvigYGeMxZBvbqTpoO/HU6TO3NQ1GtV1j435exaP
 R/scw/6X29Pk6PVxAH9ujRs5Z8HuvPr+YUxmvnUAxLOsN3sWSQnKqMH6RZj/8LFnWFrRT5
 1/Z2GO5Y/HCLwPk6icgCSsrCE7l/MRw=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-675-PmmPckueNx6Zra1tdB6PKQ-1; Thu, 10 Nov 2022 18:26:54 -0500
X-MC-Unique: PmmPckueNx6Zra1tdB6PKQ-1
Received: by mail-qt1-f199.google.com with SMTP id
 bb32-20020a05622a1b2000b003a56991a048so2529361qtb.6
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 15:26:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R5WN4LPTWCYcMdrX9hnDvdz97iHmFZw67GhV8oh/zXQ=;
 b=2OeA8SSDwcn3902s/7eMcy4v4J8gWPG1XzK97uzBUwdbQNDLPDN8TIgjcrwATSUa8l
 mcnIBX4/dOBMOirFXpuUXn9AeHpoLUXwK50lDdGzkjtKm1bxvy6r3Ddh8FbX7kR3dCad
 TIKGjrK8w/lw6Oo5jQlKlpp3EdMCsMQRBU2cD0oSjVeK8rQoxED8V2hS6hb60tndX68q
 cSKJMAQsh1kmE/7NgVDS66I2BPUXvB3JV4Uf5QdynaUBuePr9/8ERPfy1W1gUgIt7wNb
 NmwOp7z/C6uqbWAPAvuOlFV00BtUE/AZAVtTZ58m7kleK/9gXFrqyQwUl/QZFtTQQ9qr
 Z5Sw==
X-Gm-Message-State: ACrzQf2yF5yuaLMxah7S698bBDGSweSx8OQO8Hcp49N+FIoDrke0Z4fc
 u1AYfrNcmF/XyjqSwWHUN6LCvKtlKYMsuXku3xxd/dPj/xGNIdqE5Qmmt5d8a3NeAn/Br9q7+p9
 j3bpLY1k6Wgmok+dWupJOPS2oVJ3w
X-Received: by 2002:a0c:f705:0:b0:4bb:e74a:f640 with SMTP id
 w5-20020a0cf705000000b004bbe74af640mr2346642qvn.36.1668122813943; 
 Thu, 10 Nov 2022 15:26:53 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5C/4Y6FsgWT5rfg/jlvHdWtAhulEuTJJYCkGz+95RHakEnYKpzqTN1z8IntSBsFaB4AZxHVQ==
X-Received: by 2002:a0c:f705:0:b0:4bb:e74a:f640 with SMTP id
 w5-20020a0cf705000000b004bbe74af640mr2346627qvn.36.1668122813668; 
 Thu, 10 Nov 2022 15:26:53 -0800 (PST)
Received: from ?IPv6:2600:4040:5c6c:9200::feb? ([2600:4040:5c6c:9200::feb])
 by smtp.gmail.com with ESMTPSA id
 x13-20020a05620a258d00b006bb82221013sm474423qko.0.2022.11.10.15.26.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 15:26:52 -0800 (PST)
Message-ID: <31b4e74148fbd719a55ebe9e2e05715ab453c0a9.camel@redhat.com>
Subject: Re: [PATCH 2/2] drm: Fix potential null-ptr-deref in
 drm_vblank_destroy_worker()
From: Lyude Paul <lyude@redhat.com>
To: Shang XiaoJing <shangxiaojing@huawei.com>, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, sam@ravnborg.org, 
 dri-devel@lists.freedesktop.org
Date: Thu, 10 Nov 2022 18:26:51 -0500
In-Reply-To: <20221101070716.9189-3-shangxiaojing@huawei.com>
References: <20221101070716.9189-1-shangxiaojing@huawei.com>
 <20221101070716.9189-3-shangxiaojing@huawei.com>
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

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Tue, 2022-11-01 at 15:07 +0800, Shang XiaoJing wrote:
> drm_vblank_init() call drmm_add_action_or_reset() with
> drm_vblank_init_release() as action. If __drmm_add_action() failed, will
> directly call drm_vblank_init_release() with the vblank whose worker is
> NULL. As the resule, a null-ptr-deref will happen in
> kthread_destroy_worker(). Add the NULL check before calling
> drm_vblank_destroy_worker().
> 
> BUG: null-ptr-deref
> KASAN: null-ptr-deref in range [0x0000000000000068-0x000000000000006f]
> CPU: 5 PID: 961 Comm: modprobe Not tainted 6.0.0-11331-gd465bff130bf-dirty
> RIP: 0010:kthread_destroy_worker+0x25/0xb0
>   Call Trace:
>     <TASK>
>     drm_vblank_init_release+0x124/0x220 [drm]
>     ? drm_crtc_vblank_restore+0x8b0/0x8b0 [drm]
>     __drmm_add_action_or_reset+0x41/0x50 [drm]
>     drm_vblank_init+0x282/0x310 [drm]
>     vkms_init+0x35f/0x1000 [vkms]
>     ? 0xffffffffc4508000
>     ? lock_is_held_type+0xd7/0x130
>     ? __kmem_cache_alloc_node+0x1c2/0x2b0
>     ? lock_is_held_type+0xd7/0x130
>     ? 0xffffffffc4508000
>     do_one_initcall+0xd0/0x4f0
>     ...
>     do_syscall_64+0x35/0x80
>     entry_SYSCALL_64_after_hwframe+0x46/0xb0
> 
> Fixes: 5e6c2b4f9161 ("drm/vblank: Add vblank works")
> Signed-off-by: Shang XiaoJing <shangxiaojing@huawei.com>
> ---
>  drivers/gpu/drm/drm_internal.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> index 7bb98e6a446d..5ea5e260118c 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -104,7 +104,8 @@ static inline void drm_vblank_flush_worker(struct drm_vblank_crtc *vblank)
>  
>  static inline void drm_vblank_destroy_worker(struct drm_vblank_crtc *vblank)
>  {
> -	kthread_destroy_worker(vblank->worker);
> +	if (vblank->worker)
> +		kthread_destroy_worker(vblank->worker);
>  }
>  
>  int drm_vblank_worker_init(struct drm_vblank_crtc *vblank);

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

