Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD7DC638FF
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 11:32:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F4D489238;
	Mon, 17 Nov 2025 10:32:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="e84udcCc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35A2989238
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 10:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1763375551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P0XBD0RgaW2cGHx+QzNrWzybZSw9/JBmPBIYsTf/QGM=;
 b=e84udcCclP87sb/2AsY28oB0SSqYKAkuzWferew+g5/3wvSdOZ3ti6RWTKE57pj4l3UaFm
 AjJrMUpUCMS76B3DQlqshr5SpurTS5I1Tn6KI/4tNyy783H6gEN2Mqy+JRgv9m48ud/PjO
 KnRvRFsRqTxVwUI9wXF2iDgPgO8ASno=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-324-B5F4VLBdPcGYzgSiUM5z-w-1; Mon, 17 Nov 2025 05:32:29 -0500
X-MC-Unique: B5F4VLBdPcGYzgSiUM5z-w-1
X-Mimecast-MFC-AGG-ID: B5F4VLBdPcGYzgSiUM5z-w_1763375548
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4779b432aecso7831835e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 02:32:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763375548; x=1763980348;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P0XBD0RgaW2cGHx+QzNrWzybZSw9/JBmPBIYsTf/QGM=;
 b=WOFk4uMWR8QhsyWaCRAjCd/u7MWpcy6o3moxlgGNFLA5TeZ8Ohi+wshNXTsDGFpmn9
 3yld5Lem03xmeu5Ok3LKxIKlKZOYgZlfGASEHy42GerqvLfmny8AVUXExGvq+RRaIcSp
 Vq2HlZnYEVZHaAeqOr17kFYR8AysMKn30yfhEnlhJamvp98KTLsd5MvSiU1UoDSbdqLN
 57zdpbgl1dz+HGWdKBZoz6gGi+BX70xI8k2AoDCcyIm/y5KVYxY6ibdsaur1lYLLSm9l
 ipmoAQ7lKZ1a2E8HdnlRzCgB9mF32KiXQyrSKE2klgNGWQIr0Ug6dzMvkA7ThnnC7Kw/
 32iw==
X-Gm-Message-State: AOJu0YxrvUfcAZCnRzlhHfaBCqkhULwxsxOjnRiHDpD1gaEKX5EBF16a
 lV5XLa/v/QvGfWcHi4M1M5vQxM4JJo4Mbi73lSupNIMsmzLbD6+9B2HILz7jHi5bCXkUxyGB7rt
 /Mb8qppFKFqlIiDBZYasSlQt2XgjqMMHBpvQ74kcxzXVe6suSxJhBpOZxOBFGDqlzJ1mVcA==
X-Gm-Gg: ASbGncuKfYPmPPW7x1tomj4MAYyS+eFfxw3GFNQWWFuoctU9pzbxyX/U+NZfWSAeFTr
 D59O1LwpDTJiE/j4mmAsuuE/3TpVsHGoxvtXjiPWkPpqhOwF4MfM1ZAe8bWVfTc1Jn+KORT7OpT
 rZuifyMvo+gQIj5vjJ+C2Ouzy65zyAzVg/TH+Cs1W/iSeiMVkwUJl/m5bNBzke9HSYTnoKpGeHT
 lZXHyNMFxiaGr0QcdZOkOK+AXlkpsNtVoq4avCA8BBMwhZMaI/uuDz1MOaFgdULmFUvcecBl1ou
 fNUjGzvUUr8hLhInco28dCVREtH9toUjR8rsYJ9zTh6ALnAmdqVpY48IJGDrm4MeinX56/k8A28
 sSYck7/B9ai9tBrzhZ46swqVabFu6RWX7rJma8vQt
X-Received: by 2002:a05:600c:8b38:b0:475:de14:db1e with SMTP id
 5b1f17b1804b1-4778fea2de7mr106847855e9.24.1763375548374; 
 Mon, 17 Nov 2025 02:32:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGnGB9P6XwFNFJpyxvyFcr1IsclfGk24GU77X7h/tXKSTtxct0mRYbVmgv2LusoMFuX2eiZ6A==
X-Received: by 2002:a05:600c:8b38:b0:475:de14:db1e with SMTP id
 5b1f17b1804b1-4778fea2de7mr106847495e9.24.1763375547978; 
 Mon, 17 Nov 2025 02:32:27 -0800 (PST)
Received: from localhost ([195.166.127.210]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4778bb34278sm107906635e9.4.2025.11.17.02.32.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Nov 2025 02:32:27 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, deller@gmx.de, lukas@wunner.de,
 ville.syrjala@linux.intel.com, sam@ravnborg.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, Thomas
 Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm, fbcon, vga_switcheroo: Avoid race condition in
 fbcon setup
In-Reply-To: <20251105161549.98836-1-tzimmermann@suse.de>
References: <20251105161549.98836-1-tzimmermann@suse.de>
Date: Mon, 17 Nov 2025 11:32:26 +0100
Message-ID: <87fradkkzp.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0q9jz1hlhp6qzGq9OFJZrTaUKI2jkjOs2XxnPOPONgk_1763375548
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Protect vga_switcheroo_client_fb_set() with console lock. Avoids OOB
> access in fbcon_remap_all(). Without holding the console lock the call
> races with switching outputs.
>
> VGA switcheroo calls fbcon_remap_all() when switching clients. The fbcon
> function uses struct fb_info.node, which is set by register_framebuffer().
> As the fb-helper code currently sets up VGA switcheroo before registering
> the framebuffer, the value of node is -1 and therefore not a legal value.
> For example, fbcon uses the value within set_con2fb_map() [1] as an index
> into an array.
>
> Moving vga_switcheroo_client_fb_set() after register_framebuffer() can
> result in VGA switching that does not switch fbcon correctly.
>
> Therefore move vga_switcheroo_client_fb_set() under fbcon_fb_registered(),
> which already holds the console lock. Fbdev calls fbcon_fb_registered()
> from within register_framebuffer(). Serializes the helper with VGA
> switcheroo's call to fbcon_remap_all().
>
> Although vga_switcheroo_client_fb_set() takes an instance of struct fb_info
> as parameter, it really only needs the contained fbcon state. Moving the
> call to fbcon initialization is therefore cleaner than before. Only amdgpu,
> i915, nouveau and radeon support vga_switcheroo. For all other drivers,
> this change does nothing.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Link: https://elixir.bootlin.com/linux/v6.17/source/drivers/video/fbdev/core/fbcon.c#L2942 # [1]
> ---

I'm not that familiar with fbcon and vga_switcheroo to properly review
your patch but after reading the explanation in the commit message and
reading the diff, the change does make sense to me.

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

But I think that would be good if you get some testing for the drivers
that make use of vga_switcheroo. Also, do you need a Fixes tag ?

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

