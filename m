Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AB0793998
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 12:13:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CC0110E5FD;
	Wed,  6 Sep 2023 10:13:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DA2C10E5F0
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 10:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693995199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dSB+vCAalu3WUew7xxSbOR2TbNfeFmYmf0o3TX9uef8=;
 b=Pk8XQi3blkgqFS6R2N9h0UVvD+07IUEHQiM0REpHuU+zZOl4HbDBlHG8qNi/K/m/YuiusZ
 P3Nyb38nGcnsZ0I3JOY7fiD1B6L3IhST77LQBPAOUrYIXjJ2rwfIyE4sArmgL+JhAN68lC
 OoRLseyH8Gt+XWo9gJoQinxvtMTfyUU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-674-dsexPBp_O2a4u6S6r6aoEg-1; Wed, 06 Sep 2023 06:13:18 -0400
X-MC-Unique: dsexPBp_O2a4u6S6r6aoEg-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3fd0fa4d08cso21125265e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Sep 2023 03:13:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693995197; x=1694599997;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dSB+vCAalu3WUew7xxSbOR2TbNfeFmYmf0o3TX9uef8=;
 b=VTNK/UScznh35bb8ZPkUeXspsyQD/FDM+hxVTxL/1nzK7opgicLMfzJyiIV2h8pZ4Q
 ygzp+hze/sw1I8ycp2qYNSdCyzMOpkTH7vH45sv2eKlOckHv9IftqxM21d8RqW7Emmf3
 onWI8eYQDXwrdBIYnRazokLJ8avY+cQcIYdkCOPuH3nSn5DlnB/cbhhYEL3QvBo6OoMt
 lYq7uZ+RsBl8cqmQH3nHtaRx3lS9WmI0wje6ZLb+w3OM5cIcEEUpi0aSiVbFMWF9Yzna
 J2KbdDke+biQSGESO3ZS/fb3EggPqjvgVESYpT63hHeMNNIdzX1EdS42wlP6+x7za9s/
 o6IQ==
X-Gm-Message-State: AOJu0YwnZFXeycO3jjI9inJxUw0mBBx1ZNIhnd8Ku4Vn41072BZoXksA
 fZVI+TabaxFVJ5QOnx/ciZMjg/mx7SI/EitpZG7LsBRJxW/84j0Wsqg4WW6Ty4r27OqM7aveDW6
 h25kTteUKQ9kTx0UWf9cDfl6MH9ND
X-Received: by 2002:a05:600c:301:b0:3fc:60:7dbf with SMTP id
 q1-20020a05600c030100b003fc00607dbfmr1790120wmd.41.1693995196947; 
 Wed, 06 Sep 2023 03:13:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnVKep36NTxhm2Uz+EzZ6XCQaju2TJOZj/zg0bqn2Adp/5Scn3RpkEDRfRw4uwyOH1UrQfNA==
X-Received: by 2002:a05:600c:301:b0:3fc:60:7dbf with SMTP id
 q1-20020a05600c030100b003fc00607dbfmr1790100wmd.41.1693995196613; 
 Wed, 06 Sep 2023 03:13:16 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 z17-20020a7bc7d1000000b003fbdbd0a7desm22321298wmk.27.2023.09.06.03.13.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 03:13:16 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, daniel@ffwll.ch,
 sam@ravnborg.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 6/7] fbdev/core: Remove empty internal helpers from
 fb_logo.c
In-Reply-To: <20230829142109.4521-7-tzimmermann@suse.de>
References: <20230829142109.4521-1-tzimmermann@suse.de>
 <20230829142109.4521-7-tzimmermann@suse.de>
Date: Wed, 06 Sep 2023 12:13:15 +0200
Message-ID: <87a5tz4nk4.fsf@minerva.mail-host-address-is-not-set>
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

> Remove the two empty helpers for the case the CONFIG_FB_LOGO_EXTRA
> has not been set. They are internal functions and only called once.
> Providing empty replacements seems like overkill. Instead protect
> the call sites with a test for CONFIG_FB_LOGO_EXTRA.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

