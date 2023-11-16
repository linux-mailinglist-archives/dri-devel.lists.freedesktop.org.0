Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F5D7EDFE9
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 12:34:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C6BC10E053;
	Thu, 16 Nov 2023 11:34:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89E0610E053
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 11:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700134459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ispollcE/MJsw5tJHAndBweyVe132DivkP0ve6luwmA=;
 b=hWQ0zyqX7FwmqGz85gdhxnOqd0fU4sfWXfszEVwb9maZPwxLAT6wm9Sko8Iq8mkF6YD9iX
 0IQrdpsfMXDsH1aplctjxewnT0Y+TSQkdf8kmpd1sFOrfEHETPs8NlHlrkfi4TUqHMuSxe
 643kJbPHcEE/0B2MYmVkTC87Jp1Thjo=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-216-1bhQXMnEN3unKy2wc8UUAA-1; Thu, 16 Nov 2023 06:34:18 -0500
X-MC-Unique: 1bhQXMnEN3unKy2wc8UUAA-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-507c4c57567so669857e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 03:34:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700134456; x=1700739256;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ispollcE/MJsw5tJHAndBweyVe132DivkP0ve6luwmA=;
 b=srTxtYjLWl8gH/x2qqZ02MkHHuXt52BMWr8nXq6PyGWQhw5yvB7NWPhaGKyMXBOtT5
 6ljo1Y2tfj6ALDADDz5q5FnP5mMDgR/u/mq9VuP7egDf4C8eQt1l6atRX3lmpT/ZMQL6
 8Bf291miBROwFuqy6OV4Wj2FRhJO3wFHruh8WWvuA18eLRE85cpcoQ3JyagZXQWUSIEz
 KYxwfKPnxYHTOQNBLoce9IXsskDUK+xnufuQDGvp6gszdwJYjaKoaTr32F6TEtGm5vvh
 WCOULuKKCNmQ3ftKr49aU+jw91yrnY5PHuE6zSpryegIkzWZQQK87hEUM+k5XkC1SY/b
 jOpA==
X-Gm-Message-State: AOJu0Yw6Zmt4b85jfGVVoLPSgpAht+718QSNxFN7YJBYXAOMlxcwW/HT
 1xX484xT2ZIms8F8Uf2JOTiDHFEftzrvoAUMJbwxHL/bhYGOlhS4Drg795/fKtE+aAvZaNSw+6p
 Ntl5EKtzZZ2WTO/QCeJ7Zjrd9sQQMUoG8qSUD
X-Received: by 2002:a05:6512:1593:b0:50a:778b:590 with SMTP id
 bp19-20020a056512159300b0050a778b0590mr13338745lfb.68.1700134455923; 
 Thu, 16 Nov 2023 03:34:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEqkyytrftxGwNVsa7xU0GleeO6U1UIFEPfVMbUDzyf0WNqSUaiE4R7Iimixis8gkRzNHWQUw==
X-Received: by 2002:a05:6512:1593:b0:50a:778b:590 with SMTP id
 bp19-20020a056512159300b0050a778b0590mr13338724lfb.68.1700134455591; 
 Thu, 16 Nov 2023 03:34:15 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 r18-20020a056000015200b003258934a4bcsm13308726wrx.42.2023.11.16.03.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 03:34:15 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de
Subject: Re: [PATCH 23/32] fbdev/wm8505fb: Initialize fb_ops to fbdev
 I/O-memory helpers
In-Reply-To: <20231115102954.7102-24-tzimmermann@suse.de>
References: <20231115102954.7102-1-tzimmermann@suse.de>
 <20231115102954.7102-24-tzimmermann@suse.de>
Date: Thu, 16 Nov 2023 12:34:14 +0100
Message-ID: <87pm0a2aq1.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Initialize the instance of struct fb_ops with fbdev initializer
> macros for framebuffers in DMA-able address space. This explictily
> sets the read/write, draw and mmap callbacks to the correct default
> implementation. Also select the necessary helpers in Kconfig.
>
> Fbdev drivers sometimes rely on the callbacks being NULL for a
> default implementation to be invoked; hence requireing the I/O
> helpers to be built in any case. Setting all callbacks in all
> drivers explicitly will allow to make the I/O helpers optional.
> This benefits systems that do not use these functions.
>
> Set the callbacks via macros. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

