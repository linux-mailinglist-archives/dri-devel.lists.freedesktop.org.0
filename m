Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BB676811F
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jul 2023 20:59:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D5A510E1F5;
	Sat, 29 Jul 2023 18:59:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B461410E1F5
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 18:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690657161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IvO+/WMBr8HColenI9OuzU4QhXQcDCKpmNrQvlBghTs=;
 b=Hqu1kyKSARl7qkDTHsCQS0LCsUY1Pr6rrAxHrRcQyW9TDASeIMdZjj+WB8Bt6BY5xajhIx
 pBdAL9RL8BpyDrRWjk0bcIL7rKtPE/ziaDUhhe34vGHKUfXVKzzdmTnv1Xib4GSGGOoBFq
 s48gBL1VUdvNl03sxLp0BFysiK2ZRT0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-203-aD2fOSRJMxmS7-6iLG92aQ-1; Sat, 29 Jul 2023 14:59:19 -0400
X-MC-Unique: aD2fOSRJMxmS7-6iLG92aQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3fa8cd898e0so20176165e9.3
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 11:59:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690657158; x=1691261958;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IvO+/WMBr8HColenI9OuzU4QhXQcDCKpmNrQvlBghTs=;
 b=Qan569pctbs5EqLPRMqvbRYp6/6+Qz7QFLhU07cY2Q1JCXfUjqWAhQHgAvdSQbTM3h
 PzJb/fQ6CXpMmkm6glt7sBovvyeO8rsrAp4S97Nzqx/uBbaw5RxJc07T+pP3Zx6IpUUo
 KuHZiTt4rMTS9qoBC56zAp7DgYmkDKBaS71aaShgdhC/MreX8rG/sa6NAkbZIIPzMGiK
 +ioBzmCG6e9LG77ezrG4hTNaGwFtA8DFreFnjJ2gt9BkKNh2gBPe9awN+k7VQ3pKM9z4
 go1JI/Uz4CryyhqoDPg3CgcKSm8NGL0JR5rPJHJWeiJSsdBWgG9JKNIfjBEENdqsG55T
 Z8mQ==
X-Gm-Message-State: ABy/qLYaoLp2RwQMZPZlBkwsNGuua3zoC6XerfHaaG91QEeHM2rt4dh6
 3eGB+Gz9fhTVDplMm9FSezCCHYuiKu+OFLXFavHFy/z9eWJvDGpIPW26EQQ0zxjZa0Lv/ihNdMI
 UJ1RCVV21uPt6LSgjksuIo+5N1+gj
X-Received: by 2002:a05:600c:a388:b0:3fb:b008:2003 with SMTP id
 hn8-20020a05600ca38800b003fbb0082003mr4745718wmb.38.1690657158805; 
 Sat, 29 Jul 2023 11:59:18 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFMSsOTmpZlNxwG0WIVCOABpKQSgEWATeoEszwnUFQT9MVfjwAu8aJ8bSjvP5EsjeJOVAOVwQ==
X-Received: by 2002:a05:600c:a388:b0:3fb:b008:2003 with SMTP id
 hn8-20020a05600ca38800b003fbb0082003mr4745705wmb.38.1690657158438; 
 Sat, 29 Jul 2023 11:59:18 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 o3-20020adfe803000000b003143b7449ffsm4469090wrm.25.2023.07.29.11.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jul 2023 11:59:17 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v3] drm/bridge_connector: Handle
 drm_connector_init_with_ddc() failures
In-Reply-To: <3a7e9540d8dc94298d021aa2fb046ae8616ca4dd.1689599701.git.geert+renesas@glider.be>
References: <3a7e9540d8dc94298d021aa2fb046ae8616ca4dd.1689599701.git.geert+renesas@glider.be>
Date: Sat, 29 Jul 2023 20:59:17 +0200
Message-ID: <87cz0ay262.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert+renesas@glider.be> writes:

Hello Geert,

> drm_connector_init_with_ddc() can fail, but the call in
> drm_bridge_connector_init() does not check that.  Fix this by adding
> the missing error handling.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> ---

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

