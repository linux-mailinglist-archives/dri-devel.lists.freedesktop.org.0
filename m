Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5B27EDEC4
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 11:46:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 241B710E5B7;
	Thu, 16 Nov 2023 10:46:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6087310E5B7
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 10:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700131602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+mneAN+O3HdG8FQxpQR7zP/PBFf56Dx1XY7777+VaPU=;
 b=FYHURmUoasuKrEPkxTvyls3xK4h/Vy2qB48xMkW3EWxNkGiAktbaqXFIZiYfOWLQRqDrkp
 Z7MLv1OfAF0k4ZffEUu/dMXGrDkf1EaErvShe84SG0r7+AO38KXSxHFx38vY8FrrV8AaxZ
 k88MYKKX9PTO1PIPvliZxW+7e0efQ5k=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-471-TRzDDnr5MGuq3b_12elkzw-1; Thu, 16 Nov 2023 05:46:41 -0500
X-MC-Unique: TRzDDnr5MGuq3b_12elkzw-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-408524e2368so3761005e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 02:46:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700131600; x=1700736400;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+mneAN+O3HdG8FQxpQR7zP/PBFf56Dx1XY7777+VaPU=;
 b=JsEabKeoDWjMxGOuwRbnPzmMRlQDZG8iEydnqclJ7GGM5goIeVPJI+9M2SSelBJFWK
 IejaiAQDQzKEbWbGhwuWRsaQW9HuOY07QHNNfAf+2GHpuLEIiS+/P6eC2F22LL7uSeLO
 R6VFcE2yBgE5b4U76pz/l/kUoIeKJKZSOeUkkwzDFsjXKcdr0otm2SqVZ9QTTpgAkBo0
 lFsV3ZC7i/wNHRm7rNVNJLokLq7f6ZMZm+Dgn2Dt1vVCeSGfAY9c9Digz0co8/P+2ONP
 gjf5vuSgoXxcnyab8vbKC5sVxXOz6m63JhReMt4kupYNSbtstMvpaBzJTXrLiZBA6IN6
 ZbrA==
X-Gm-Message-State: AOJu0Yy2iXInrZAK1B1mdsXEtn/yz56gsqXreKOgckXzc/PfJbKoeB2p
 BR3JbC+rIoH2nAVQg4bOGf2CP9MqaxSrDkJeSUOCihQJuONtY5sGTQ4F2iJ0etakP5Q6FbBuTOq
 vaQZ2ggrtVaXklr7DW9L0Ly0CeBOiSsK5H3ej
X-Received: by 2002:a05:600c:2d8b:b0:406:4573:81d2 with SMTP id
 i11-20020a05600c2d8b00b00406457381d2mr13142560wmg.39.1700131599905; 
 Thu, 16 Nov 2023 02:46:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJvM8rhQKzWrZoagRxIFnr0SKSWCA5gH5y63+vsVbbw01jWkd/7p2tTGbqEixDkcdZKgAwmg==
X-Received: by 2002:a05:600c:2d8b:b0:406:4573:81d2 with SMTP id
 i11-20020a05600c2d8b00b00406457381d2mr13142547wmg.39.1700131599624; 
 Thu, 16 Nov 2023 02:46:39 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 q9-20020a05600c330900b0040a3f9862e3sm2812796wmp.1.2023.11.16.02.46.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 02:46:39 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de
Subject: Re: [PATCH 14/32] fbdev/smscufx: Select correct helpers
In-Reply-To: <20231115102954.7102-15-tzimmermann@suse.de>
References: <20231115102954.7102-1-tzimmermann@suse.de>
 <20231115102954.7102-15-tzimmermann@suse.de>
Date: Thu, 16 Nov 2023 11:46:38 +0100
Message-ID: <87fs163rht.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> The driver uses deferred I/O. Select the correct helpers via
> FB_SYSMEM_HELPERS_DEFERRED in the Kconfig file.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

