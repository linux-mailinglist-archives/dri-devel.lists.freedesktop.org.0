Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E127759E3F
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 21:11:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C14310E4FA;
	Wed, 19 Jul 2023 19:11:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F47B10E4FA
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 19:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689793900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F8XGxi53b0PEdlxoh7O8cl7xJyRMkcuJJYP/JuLoaN8=;
 b=SRxE7/HP8H//Wg/zEmb57Oh398h2MBvK63J5wbgE9mKOdEhkI0bCMqvvYkNVz7SiQdy1+n
 dkkJUo8EJUTKYE6LlVED4aztfbphjsgCrOwnKGc6OwzyeVMpV+h0Y/MJONSKxpD35PvhPF
 53Igcu5Op95vHE9uUHddu6LNj5U9Mkw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-210-UDNgblPUPeaQNuoUze_MsA-1; Wed, 19 Jul 2023 15:11:38 -0400
X-MC-Unique: UDNgblPUPeaQNuoUze_MsA-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-314291caa91so3946930f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 12:11:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689793897; x=1690398697;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F8XGxi53b0PEdlxoh7O8cl7xJyRMkcuJJYP/JuLoaN8=;
 b=iALW4kbXE3WXkHWvGhmkPpEH+6+Ik94UUrkbjZr8OgyTkPfMA7JHmb1dFPjz3zDLzH
 3u9n/06zwR8Gzf+YAHwJ+0O1ewjbPHPZEG7GhLdqZo/6Kh1UncmfhczYMAdPIET7Ws3o
 u0HgRM4C+bPISm0cC8QObLiTWIAL+2sy46cRD4/h4LbZaJtMpzqDJTzFJg99gJIr00F8
 FalJ9P5pGJvKHompki5CGnNSAb1uyH0PO9/rgtZmTTlExSH5gZOBfri9jjwPKfIE3lTp
 8Hezn1iYSB1l1M2+Qjz9WM3f8/bCenY3LnfhKHel2zc89r0vI2+O+87MJGCqFJ6WfTtT
 IrwA==
X-Gm-Message-State: ABy/qLbQAhiNZjTfvYt5ZspoX7wKACIjSn6wZGb3STxFhIO1hwgQXErC
 kbtlg9KTAYBaunPgMUOG2Y4HQPVfGQBGt6v25DiBs7/BA6uiz7kZqU5whR3gKF7pk+nilHvPpQa
 MdrhCQWXNrEmOXXzr9iAFElHVMNAW
X-Received: by 2002:adf:de85:0:b0:313:efed:9162 with SMTP id
 w5-20020adfde85000000b00313efed9162mr592380wrl.59.1689793897428; 
 Wed, 19 Jul 2023 12:11:37 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGAEpZ3HnNJFf0EXDQ6PiNnXG6pJ7iZ6T6kGVVDyiOZcpi7AONcMjyvvGq2mav4MkZGW/OMOw==
X-Received: by 2002:adf:de85:0:b0:313:efed:9162 with SMTP id
 w5-20020adfde85000000b00313efed9162mr592365wrl.59.1689793897094; 
 Wed, 19 Jul 2023 12:11:37 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c3-20020adfef43000000b00313f9a0c521sm5973293wrp.107.2023.07.19.12.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 12:11:36 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>
Subject: Re: [PATCH 05/11] drm/tests: helpers: Create an helper to allocate
 a locking ctx
In-Reply-To: <20230710-kms-kunit-actions-rework-v1-5-722c58d72c72@kernel.org>
References: <20230710-kms-kunit-actions-rework-v1-0-722c58d72c72@kernel.org>
 <20230710-kms-kunit-actions-rework-v1-5-722c58d72c72@kernel.org>
Date: Wed, 19 Jul 2023 21:11:36 +0200
Message-ID: <874jlzk97b.fsf@minerva.mail-host-address-is-not-set>
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Maxime Ripard <mripard@kernel.org> writes:

> As we get more and more tests, the locking context initialisation
> creates more and more boilerplate, both at creation and destruction.
>
> Let's create a helper that will allocate, initialise a context, and
> register kunit actions to clean up once the test is done.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

