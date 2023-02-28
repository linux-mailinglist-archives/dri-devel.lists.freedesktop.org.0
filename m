Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C816A5690
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 11:25:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 931DF10E0BD;
	Tue, 28 Feb 2023 10:25:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DAF210E0BD
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 10:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677579939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ww5D5euMHrbhX+ykYBbzRNb0k1VV4gnUZZsb9WzIR/0=;
 b=H714jsgvomwocPcojtEbPslqsUsCOcRUVJt5BZB5pcELpErQqWcOq9blvXqm/xqm52ZzYI
 OV5Gp7jGByGY7m3nJ7IOfMM1PPP05XficGIpAsBUUApM1ETOFlGWV/vdfPodlgYq3tVrQW
 KZeh6sGJeIKc86Sx2mmJfO1DCx+mTXw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-407-dUshMB_pNhOJsrv_hFaVQg-1; Tue, 28 Feb 2023 05:25:37 -0500
X-MC-Unique: dUshMB_pNhOJsrv_hFaVQg-1
Received: by mail-wr1-f69.google.com with SMTP id
 r3-20020a5d6c63000000b002bff57fc7fcso1431407wrz.19
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 02:25:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677579936;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ww5D5euMHrbhX+ykYBbzRNb0k1VV4gnUZZsb9WzIR/0=;
 b=2ZOCEN8SxWqVTe3TBJqixrDf6NZgnlL90VoP5ewiqHG7E0ElDjA6T184vzkclVOmSL
 q7jyT8Z/1NOPoZa5J2Q4OB4M6SAgm7yErAPW5LJ1CYogcDA7HGiSX4d7mnccP9ARJJ37
 mgxgW0Yjl4xTjP0s4AMfiraVshS0LG9MgoFvur89naekfXiX5R6sHKFE67+7SZ2a7h1q
 vfQzNu/nm++i5DE4XejYzinXymUINM0mJinBDN6ZKYszyeYkqpFCvHTWjKY7LMSn3r4q
 iNLn3Kfyh65qVipJImKVM1YwwV4A7I+xTFkDXF4yQnWsK45vr+UDemgbLy080kcxJJtC
 hhjA==
X-Gm-Message-State: AO0yUKVISBnoviL1HMkx9cHmfOauL6edWUKvGghgLshBzfItt2VJBna7
 GmdnQ556nWoBkS0hqjW2mw6iSMUB28y2Xk+Bu0dzLYCJtuj10Z6TvuYLYBlNHA6Ng9szGUsrruJ
 2zNuf9Jlo5KylbORi9TlLNcancMSz
X-Received: by 2002:a05:600c:746:b0:3ea:e554:77fe with SMTP id
 j6-20020a05600c074600b003eae55477femr1706767wmn.12.1677579936728; 
 Tue, 28 Feb 2023 02:25:36 -0800 (PST)
X-Google-Smtp-Source: AK7set8lViISROpIzQA9uFt5h1T0R7DDeFnxdspZ666nfdFEjSJYgwfptSPxCQF/zNgAyXSHi5cEjQ==
X-Received: by 2002:a05:600c:746:b0:3ea:e554:77fe with SMTP id
 j6-20020a05600c074600b003eae55477femr1706754wmn.12.1677579936449; 
 Tue, 28 Feb 2023 02:25:36 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 o6-20020a05600c510600b003e20a6fd604sm12898757wms.4.2023.02.28.02.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 02:25:36 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, jfalempe@redhat.com,
 airlied@redhat.com, airlied@gmail.com, daniel@ffwll.ch
Subject: Re: [PATCH 2/4] drm/ast: Rework definition of I/O read and write
 helpers
In-Reply-To: <20230221155745.27484-3-tzimmermann@suse.de>
References: <20230221155745.27484-1-tzimmermann@suse.de>
 <20230221155745.27484-3-tzimmermann@suse.de>
Date: Tue, 28 Feb 2023 11:25:35 +0100
Message-ID: <87y1oixf1c.fsf@minerva.mail-host-address-is-not-set>
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
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Ast defines a number of I/O helpers for accessing hardware. Only 4 of
> the many generated functions are actually used. Replace the respective
> generator macros with those 4 functions. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Nice change. It makes much more easy to read the code with the explicit
function definitions instead of defining them using the macros.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

