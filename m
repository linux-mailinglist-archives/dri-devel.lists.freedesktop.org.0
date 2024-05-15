Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA988C6609
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 13:59:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EE6A10E7F6;
	Wed, 15 May 2024 11:59:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Tpp5fleW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B088310E7F6
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 11:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1715774360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VUhk4FBZTGngllQrOrcD4bEooGd9vEDrHij+Cxg0n4I=;
 b=Tpp5fleWV0N+xdD1wsoGfpAM+WzbqMhyiWnV4YLLdMH4eL/uFKnmubpgQ9hpLGjxZVpN5J
 ZgvyPSlsgFV3l3BqF/s9h7VyzhNWM5RSUA3uGlWIh1HonxKpW/2pwjmdtoOMgZazhiZ550
 3FhN/wId0RSd3fkpdQzRHbMSaGOr0Ew=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-vZIFTqbXMSSppu8oOmoXEg-1; Wed, 15 May 2024 07:59:19 -0400
X-MC-Unique: vZIFTqbXMSSppu8oOmoXEg-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2e21d6edfe9so59400811fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 04:59:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715774358; x=1716379158;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VUhk4FBZTGngllQrOrcD4bEooGd9vEDrHij+Cxg0n4I=;
 b=mPiczL4vBuj8ubtrwzwjUeHBGY05AA1fjwKvJgg/X3zqxtl/AxbgZehzTsyVoWbxEF
 GUWY55ZBvjM5APHTOlryUhoLSnylGNTj+YGmZ9ZUHACI+VuxgFyxV+ua98VpUiFtNt16
 ciEH+1YtzuzFxK0mpGABglFSnDRHryJ2mRxDThL+uo2ExfS4FAdO2KgTfgv8py80T4uY
 /RjzhpvgZhf1yXvJ49PbitJaDE1eHDD9fUnD/a8b0EumsNKQcImD6wlsUYwUsK6CowDe
 g4h1oQpwd6H69Oq+WHDgm+KIckw9m+7+yGCw9An/75UuPY4PYEm+hHp/80R29Lv0IVTK
 bcKA==
X-Gm-Message-State: AOJu0YxfP2vRcbckBiyEa+sqgQKS1fMyedcG9UI5smIz11B3PixeAeLz
 rbOEhqNxzmZLkLVOu2mt7LERHeTAcQQZarEWbbY0KqVPOXe7hc5U/8GuWx8zNuWUhC0oFYMkyRG
 dqheOTPOaWb99tNZ+Az7+MqBsZxM8k9ETFOIdESosqXaL3a65rFsK9YakAPmF0xl8AA==
X-Received: by 2002:a2e:b74e:0:b0:2e2:466b:1a51 with SMTP id
 38308e7fff4ca-2e52039bad9mr99327291fa.37.1715774357831; 
 Wed, 15 May 2024 04:59:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXi3L+JTkVMJyuHrW4iVdlHklfycVCwzW8BvS+grsWnsjeaCcyZJJ1moi4GkpxQ8QqLdbqtQ==
X-Received: by 2002:a2e:b74e:0:b0:2e2:466b:1a51 with SMTP id
 38308e7fff4ca-2e52039bad9mr99327181fa.37.1715774357292; 
 Wed, 15 May 2024 04:59:17 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42004d7ab53sm128322005e9.0.2024.05.15.04.59.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 May 2024 04:59:17 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH] drm/fbdev-dma: Clean up deferred I/O
In-Reply-To: <20240507145529.31368-1-tzimmermann@suse.de>
References: <20240507145529.31368-1-tzimmermann@suse.de>
Date: Wed, 15 May 2024 13:59:15 +0200
Message-ID: <87le4b1e24.fsf@minerva.mail-host-address-is-not-set>
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

> Call fb_deferred_io_cleanup() upon destroying the framebuffer
> device. Releases the internal memory.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 808a40b69468 ("drm/fbdev-dma: Implement damage handling and deferred I/O")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_fbdev_dma.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

