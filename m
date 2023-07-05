Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B44374806F
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 11:07:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD9110E28E;
	Wed,  5 Jul 2023 09:07:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09EF710E28E
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 09:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688548071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qr/C5LtRvrDZoQId+bjsOh/ZaHhOujfRlisJ/yVhSwY=;
 b=UkLADN8es5IicEimAEAQzF1P1WWuT+db92nJR1xZAFcvaMLDLTmGTNW0dyaZ79cVFzw+62
 kdHrmhxntk8gn2NFiJJ7k+g5Qc/7P2a0Fz2ZWETjSbtXuirPdkYul6FuzKy4WDlTMWZEnE
 ia51HoWfR+5Le0LY6B2o155X3LxWUsI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-497-6zxSiP9JOASnc1qs2hnWJg-1; Wed, 05 Jul 2023 05:07:50 -0400
X-MC-Unique: 6zxSiP9JOASnc1qs2hnWJg-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-2f2981b8364so3685753f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jul 2023 02:07:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688548069; x=1691140069;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qr/C5LtRvrDZoQId+bjsOh/ZaHhOujfRlisJ/yVhSwY=;
 b=c0+zx04soUO8is1setV6T7qpYq99n5P7S6bo4990/UNi9PyAPPYs+cNxAPS5rLC1MU
 B66HLxWqDM25yoPrPNX2AGzWq2czCHh+m63WdJ9QbJJ9XFUIYvAQqxO5ynV8slsUEwYN
 lLUbm5eTJqlJ/xv8cAEhYGb4SHBLFM6TZFb2+6ihxAYKUKl2A6E3Lsj8h2T7HXlk80Sl
 WCYoVpbd+fu2MYy4h+XCnCfvyJrNoO0a4ryh4zCAOWqQbPQSAHGp6lFt7V31jTXSxaU+
 YlA0MvI04G7oGZxcN8OWcZ0YN5/zcrXEhr8I/C8RHNQCk2ho+r25x9I28OJ9lINm9pK1
 kHLg==
X-Gm-Message-State: ABy/qLYuBQqRfECpKUv8TzLgpDGPbknqcJX62aoZQ1RldgQSAul2UlDw
 zNzC1Gu1mOzq6dzE3tBRckx2tdqujEOBg3icbZkO55A/eG5HIuO0BqBCRg6CFk/6EABuFEfc5zC
 flXSr845M36qmvE0AV8CmS4Y5ad+s
X-Received: by 2002:adf:f504:0:b0:30f:d12a:d0b5 with SMTP id
 q4-20020adff504000000b0030fd12ad0b5mr13084514wro.55.1688548069027; 
 Wed, 05 Jul 2023 02:07:49 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHf2mlJzkynZeRnACKLZDj8dpbPaRQo1oHTkYMNq2t7OkGieb7M7VOESlbgxnGoXEMWu20AzQ==
X-Received: by 2002:adf:f504:0:b0:30f:d12a:d0b5 with SMTP id
 q4-20020adff504000000b0030fd12ad0b5mr13084501wro.55.1688548068811; 
 Wed, 05 Jul 2023 02:07:48 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n5-20020adfe345000000b0030e5bd253aasm30417562wrj.39.2023.07.05.02.07.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jul 2023 02:07:48 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: Re: [PATCH 10/10] fbdev: Remove FB_DEFAULT_SYS_OPS
In-Reply-To: <20230704160133.20261-11-tzimmermann@suse.de>
References: <20230704160133.20261-1-tzimmermann@suse.de>
 <20230704160133.20261-11-tzimmermann@suse.de>
Date: Wed, 05 Jul 2023 11:07:47 +0200
Message-ID: <87fs62rajg.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Remove the initializer macro FB_DEFAULT_SYS_OPS and its helper macro
> __FB_DEFAULT_SYS_OPS_MMAP. There are no users.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Helge Deller <deller@gmx.de> (maintainer:FRAMEBUFFER LAYER)
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

