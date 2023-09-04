Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3E6791815
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 15:29:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B00610E359;
	Mon,  4 Sep 2023 13:29:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4539E10E359
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 13:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693834137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ogc35j5wnFZjYknca/Dmxrctu7aJYOr7uX6tINC9GWs=;
 b=eVMR9mHWlE+I25vv9vjngZNjD2SmjS/XMAZrK8cTk7kD0sdVAcRBcFfxzL9T0UsOYvkrOB
 EqHSot500snx9SFPg50x42o8lsq7tDv+ig1u48ATVv56U+Tp/4vt5YAJvJJXI098KEylsM
 hVSQnMU3WuR9fJbI1equGbue5uVtSUo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-wUN2us3ZMPiwkiHgaLId6g-1; Mon, 04 Sep 2023 09:28:55 -0400
X-MC-Unique: wUN2us3ZMPiwkiHgaLId6g-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-31aef4011cfso820952f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Sep 2023 06:28:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693834134; x=1694438934;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ogc35j5wnFZjYknca/Dmxrctu7aJYOr7uX6tINC9GWs=;
 b=C9GlmLIO2qyjw7fY73r2P/FYjMMpMpXbyViXq07gBfj4pxXv1m7M0Lmm+6BKCM6rlq
 fUQHAXm4VsgcuvO8HUstyiKXRLSjorG8AcLXNOsBaDLM8vy90LM2YG1IX7i4B+zR7ERL
 y2Q3kK3KzRfVAlnuDas1qaXEyU8NppQgn6Jk/ex0oLhZJrcazsQUEJmjsPdT1O2++qpZ
 ifB+HbfFELUhY7GUK5aznPD+SoaJhkLWJf1RprKMbXwY6MtKuSCfaUTxtP4wCdxTHSHO
 B1C332GXA5HmFVa3c+ueMSzdAsAD1yTM9zs5bLKvUuc0MLQ3aRJrfMzQJlneGXM7kjOS
 KjnA==
X-Gm-Message-State: AOJu0Ywdlv7zg+hLingPxY2Nks49iqe2pr8iSpIPRLgj0fzgLJKv4xNw
 //fcCxOjGzFalch15sCIE2VFbGPeqSFRf0qtFOuqCJXXbFjzjqlR+JgVuL/WplRTNf5yZBGwlqF
 ewzIAIf+MPVJCHXrXZNxTKUq9wR2M
X-Received: by 2002:a5d:43c3:0:b0:317:3d36:b2cd with SMTP id
 v3-20020a5d43c3000000b003173d36b2cdmr6107640wrr.71.1693834134386; 
 Mon, 04 Sep 2023 06:28:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3pL/7M37MZ8DDYOtxB0J933cOF0hsfKFCSqFaXm8ULHyrObL/1Lf5LyHUOXJD35lTdHtBaw==
X-Received: by 2002:a5d:43c3:0:b0:317:3d36:b2cd with SMTP id
 v3-20020a5d43c3000000b003173d36b2cdmr6107629wrr.71.1693834134083; 
 Mon, 04 Sep 2023 06:28:54 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 p3-20020a05600c1d8300b00401e32b25adsm14407260wms.4.2023.09.04.06.28.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Sep 2023 06:28:53 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, daniel@ffwll.ch,
 sam@ravnborg.org
Subject: Re: [PATCH 8/8] staging/fbtft: Use fb_ops helpers for deferred I/O
In-Reply-To: <20230828132131.29295-9-tzimmermann@suse.de>
References: <20230828132131.29295-1-tzimmermann@suse.de>
 <20230828132131.29295-9-tzimmermann@suse.de>
Date: Mon, 04 Sep 2023 15:28:53 +0200
Message-ID: <874jkacbje.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-input@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Generate callback functions for struct fb_ops with the fbdev macro
> FB_GEN_DEFAULT_DEFERRED_SYSMEM_OPS(). Initialize struct fb_ops to
> the generated functions with an fbdev initializer macro.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

