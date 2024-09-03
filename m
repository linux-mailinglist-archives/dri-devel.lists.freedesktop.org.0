Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20485969BF4
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 13:35:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E824110E3B5;
	Tue,  3 Sep 2024 11:35:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="TIstK9UM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 750F410E3AF
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 11:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725363350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TSTF58qr8+XEIh+oYno8E8uAlH24T+aQUMezZd/qxQM=;
 b=TIstK9UME90S4xbTo4QN4d5nQFeXahrwLTfRwygAcO5N+VGd7o+xXm6dvkW0jf3q3r4Y8l
 f2MyjcMRV071rvpMNuXET4SNxCMXtSTZG9QsNgXt7MIPYZLP9SVcRaSMT6zyYv08Is/eih
 5y70NjCijN2VcF5aB9T4qvW9fCB7RBc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-177-7NMMwAUkPOiHTe4Da8d8Gg-1; Tue, 03 Sep 2024 07:35:49 -0400
X-MC-Unique: 7NMMwAUkPOiHTe4Da8d8Gg-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-42bb8610792so46131105e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 04:35:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725363348; x=1725968148;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TSTF58qr8+XEIh+oYno8E8uAlH24T+aQUMezZd/qxQM=;
 b=Dwjt6r3qqJ/csiS8e0rJjszP7dbYGtwOtCl3xFpQ/ivUfxRMAcmAaUenMcusp3pVKu
 2AEFoDy4EyX3vL55Nc0+HQGvVu6TfwVha39R6WiRaG8Vykf+rj39P9Uf8kQjCs6KCbH9
 h2ItMol2Mg2EAg9Bc4onS/ccnbMSnr5y9r9geC+oQ5j3bdzdkHXLZaH01oWCGovDnUDF
 pSU+xnskY+7DQY0qKcTMrVYHTpNtXG2KYdHAqBZDlnMEnwoCmykWcM0+L4InhI7l7CqQ
 juBYyvtBEf7pijaOAB1b0CaAmIuYKd4PERHn2zMQ/MNFetBwNE4CTTihUSqcTB+7K0Uf
 y/Eg==
X-Gm-Message-State: AOJu0Yz01YQvhSNJoK+G5VLNh/QN36DHh6Tuf1i1L1iXDYmAnBFRKXiX
 ueKUMGTFgpY/ct2t8PD6XIaOnGrfUDYvGyJsTU8wOWZHsxkHhkSBmddkHewoqGS+h0Rn9kqmNoM
 vwAfBFboAC67DLsuH0XB2AL3MkqWHYHd0GJYVEgOcwj/YpB/WvH82wy87bDsGfJSQ2g==
X-Received: by 2002:a05:600c:1ca8:b0:426:6f17:531 with SMTP id
 5b1f17b1804b1-42bb02edaf6mr130000895e9.13.1725363348477; 
 Tue, 03 Sep 2024 04:35:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtyX2uOKVFE476IZPot6lc0AMFObvLiZGeI1TgAffaxGluqt7ZPRIl9eZVAwWXt4J+zTGPbA==
X-Received: by 2002:a05:600c:1ca8:b0:426:6f17:531 with SMTP id
 5b1f17b1804b1-42bb02edaf6mr130000635e9.13.1725363347900; 
 Tue, 03 Sep 2024 04:35:47 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6df0a42sm165399665e9.11.2024.09.03.04.35.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 04:35:47 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 49/81] drm/fbdev-dma: Remove obsolete setup function
In-Reply-To: <20240830084456.77630-50-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-50-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 13:35:46 +0200
Message-ID: <87o755dl65.fsf@minerva.mail-host-address-is-not-set>
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

> The old setup function drm_fbdev_dma_setup() is unused. Remove it and
> its internal callbacks. New drivers should call drm_client_setup()
> instead.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_fbdev_dma.c | 120 +-------------------------------
>  include/drm/drm_fbdev_dma.h     |   7 --
>  2 files changed, 1 insertion(+), 126 deletions(-)
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

