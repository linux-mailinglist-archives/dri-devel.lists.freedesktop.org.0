Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D427938F7
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 11:54:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE91D10E5BD;
	Wed,  6 Sep 2023 09:54:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AC9010E5BD
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 09:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693994046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4tzibQVke0hKt8IOTav8MFtlZQ2trxpBqLxq9f+UJCg=;
 b=ic7okgh3jxac6Ce3X9bUBdxkyQngLiHqP0HnhhC6MqQRBs1ApHuJgj2vSCUW+RLJIQXpRJ
 ufR5b7abgJNJ0tXoHNeGrmoUfzb/zrIDQvABtuyJLz2WFOD/8MBCL5N7u5l2DmoC4+8bd0
 KRVFH7am9QjPIKodBwCPLAizP2Hz7ws=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-505-isne82fBMG2dMZe4U2pQeQ-1; Wed, 06 Sep 2023 05:54:03 -0400
X-MC-Unique: isne82fBMG2dMZe4U2pQeQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-30e3ee8a42eso1794206f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Sep 2023 02:54:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693994042; x=1694598842;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4tzibQVke0hKt8IOTav8MFtlZQ2trxpBqLxq9f+UJCg=;
 b=WuxYfQcAEnCKOGi5j7zw7G8oGQAzr7Yd6O+1MJtEDzaKEUIT5dwVJKsJtWMjvzhjNn
 pfj0nH8fRcTtKjpolD94bROY0qlxSjZxMXMy1zdb+2efaJS+2O7Kmt9ukd5G4krDOEAC
 /RxOkZa3xVQMd/+5UR1sVbq9xDrHeonQ2tBGCea0Y0m5lb9tKbtjSSkHVW/dSwETntWc
 lUT7tXIQ+jC7wcw6f5j9h17jCthE7x+N52HoAexUmkEnA43SiD7+PTYBy2Ek+tDZzLKG
 +J7yf1ywSahFQSTFJLva0SXAlIskR6FBmoJVaa2r7dC3tjGYmNFV4lKtUETbspkicepi
 Xc/A==
X-Gm-Message-State: AOJu0Yw/uCHh/qO08kpR4uxEdWndMH+GXD3FKUmGMl9YzKK1K3V8xI57
 LeFb6HzZoMn21c6dofXRGVMa+QPyOzfA9EATl+xzXVGmi6eN0+JVfn17t88qWY4wQZuhOr/Mtsm
 vYUE98vJokwCvfQmVpExWpjduSoOD
X-Received: by 2002:adf:f512:0:b0:31a:d871:7ae7 with SMTP id
 q18-20020adff512000000b0031ad8717ae7mr1954036wro.29.1693994042095; 
 Wed, 06 Sep 2023 02:54:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgP7ciy8RiRDljW7l6SGuO/N0itwoSv2n3TNrlmpxaanZjeoaWxrwp9lqX4hZlX6Ivt08wqQ==
X-Received: by 2002:adf:f512:0:b0:31a:d871:7ae7 with SMTP id
 q18-20020adff512000000b0031ad8717ae7mr1954025wro.29.1693994041793; 
 Wed, 06 Sep 2023 02:54:01 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 bt12-20020a056000080c00b0031433443265sm14238423wrb.53.2023.09.06.02.54.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 02:54:01 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, daniel@ffwll.ch,
 sam@ravnborg.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/7] fbdev/mmp/mmpfb: Do not display boot-up logo
In-Reply-To: <20230829142109.4521-3-tzimmermann@suse.de>
References: <20230829142109.4521-1-tzimmermann@suse.de>
 <20230829142109.4521-3-tzimmermann@suse.de>
Date: Wed, 06 Sep 2023 11:54:00 +0200
Message-ID: <87ledj4og7.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> The fbcon module takes care of displaying the logo, if any. Remove
> the code form mmpfb. If we want to display the logo without fbcon,

s/form/from

> we should implement this in the fbdev core code.
>

The commit message says the same than patch #1 but the driver will behave
differently right? That is, won't only show the logo when fbcon is not
enabled but unconditionally? So the logo will be duplicated when fbcon is
enabled?

If I understood that correctly, probably you should mention that in the
commit message since removing the fb_show_logo() will make the driver to
behave correctly.

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

