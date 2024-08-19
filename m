Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0FD957090
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 18:40:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C588910E1E3;
	Mon, 19 Aug 2024 16:40:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="chOtB/Ri";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D616F10E1E3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 16:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724085635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6aiAlEMlkVSgDq4kg8Uhoyt8PHhKwhvjGwHD+aR8CT0=;
 b=chOtB/Ri7zn3LeOtwIOPFWXNubqu4/5LmTdEkRHsBck5W7P1EKgV+MNEN3UdylMiWpI7d3
 pOeHjPO6r7nCwui0nBKsr2baYf/vG/r5GO7hP99ILktC2hCZ+FYvRyuaJfWaONxDu2kmOd
 sca6qGnXWDIN79KeZ3cCNI4dtBhsixI=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-y-9DH9esNpSWb8s-L0oMhQ-1; Mon, 19 Aug 2024 12:40:34 -0400
X-MC-Unique: y-9DH9esNpSWb8s-L0oMhQ-1
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-2d3d45c308fso3906335a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 09:40:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724085634; x=1724690434;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6aiAlEMlkVSgDq4kg8Uhoyt8PHhKwhvjGwHD+aR8CT0=;
 b=Prp/C9HU6w9i/2d+hs1nIL6rwlrPBwCFgZCJXRg/jQxbShzHKpN83+1BK5x2OvrYaI
 A5goDChRJW54FSGu6TxvAykPii6NDQANyYQjgm5KaliAd5Pl1Aul1lh1+Ml0QZv4VJ+L
 ygX2LGKfWWyeE0iumIfbf5p62/zWWhvBDTHEF6AHMXR6IPbnCyQ1XzPP7J/L+T8FDgmc
 3+9oDsKCczHzx55z6XFIvXlOgvh1VCUXkjlZ+uxJECrH3++YvBX3nwQS2a54gncTtOcO
 te8atBpTVOWmeRRWyBqd7DaSGFOHInrCZWfYDaa+wsWdlGPaQckY6Z5AJbyexqFnanSo
 ufkw==
X-Gm-Message-State: AOJu0Yx8uthJSFDpRGI1PcGhP4uzXetJIMjkY5uFGmWuPqYkxInGuesR
 pidTEEnYvZ31X5C9tuwFNwr7iV/ry6pVyw7ixoHCKEjrkTnDB5agHOrXYy3t1hIb/KoPpzIQM/J
 U77cNAHUBXHb2XO8MqnLps4fYMuKOdywd2/Xkij2fKGCApGPzUsRnS+++sMWg6vCQrg==
X-Received: by 2002:a17:90a:bb86:b0:2ca:8a93:a40b with SMTP id
 98e67ed59e1d1-2d4063e87e6mr8810670a91.31.1724085633793; 
 Mon, 19 Aug 2024 09:40:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGr6UwLRtlBXjaOWivmxZxfUPO4m8tw0lWZ8JSfXwSkB6KBvIXRvb1qTy/OQw15401HlQn4nw==
X-Received: by 2002:a17:90a:bb86:b0:2ca:8a93:a40b with SMTP id
 98e67ed59e1d1-2d4063e87e6mr8810646a91.31.1724085633478; 
 Mon, 19 Aug 2024 09:40:33 -0700 (PDT)
Received: from localhost ([2803:2a00:8:776f:3d96:6be:69c7:46c2])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d427efec73sm3604053a91.48.2024.08.19.09.40.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 09:40:33 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 57/86] drm/ofdrm: Use DRM default client setup
In-Reply-To: <20240816125408.310253-58-tzimmermann@suse.de>
References: <20240816125408.310253-1-tzimmermann@suse.de>
 <20240816125408.310253-58-tzimmermann@suse.de>
Date: Mon, 19 Aug 2024 18:40:27 +0200
Message-ID: <87o75oa2kk.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
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

> Call drm_client_setup() to run the kernel's default client setup
> for DRM. Set fbdev_probe in struct drm_driver, so that the client
> setup can start the common fbdev client.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> ---
>  drivers/gpu/drm/tiny/ofdrm.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

