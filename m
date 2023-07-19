Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3504D759DF1
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 20:54:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C2510E4ED;
	Wed, 19 Jul 2023 18:54:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B2C610E4ED
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 18:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689792887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F50ZRNO2TGVX8Kl6rozSN2J4zAo6+Tkfm50rtvi7/ZE=;
 b=jQpqpYgmSivrKVtJD/BW5Lld3dbDhvtBdXJzUlgos2A2X80gu9g3lWdYctv7lyxG7vXpVU
 3js/HZOzw9xxNqEZpZnrpzBgb1b4WfOfhtNxS6f+hK8fT5bugzUB4PyqkfDxH+J69uYO1k
 qR3wC3lwT2OTh45uyDEOH4COhu/dACE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-497-EnrO6A1eO3yC9X21dgqMxA-1; Wed, 19 Jul 2023 14:54:46 -0400
X-MC-Unique: EnrO6A1eO3yC9X21dgqMxA-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-2f2981b8364so4344046f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 11:54:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689792885; x=1690397685;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F50ZRNO2TGVX8Kl6rozSN2J4zAo6+Tkfm50rtvi7/ZE=;
 b=Wlb9tXM7/DrEc1vhlSxXsik8+upLmkslPC01ioBpKa8y5beEtNm+KqaO2ZhttA5U8X
 aTm5UfiiuZnGmFN1qT5ZkHeto0uRleSbO9FoIwl18gNtYoiCe1Zf76bDY2XmQ68MWBm6
 Yd60/ZIvLOuKsoZRC371DkaXZ0O0POvmfuEZFoso4li1h/LKo3K/9v0TYrSqzdyoMsNv
 CDSH0iVOOHa1bzhdLU9hQiL74szru+bWPJqojAuW16oXQuUORTNmPSXJn7qTLQj/XBpr
 MPUJtZZ5jLEDHDgZ5kB710NOc81tJRSLmCAmsifjwhF9ax3arw9d2zT4IGg9R/KAGX/b
 3Rcg==
X-Gm-Message-State: ABy/qLZUKXw7thwvAS9hLTh6Dxh8GtpILm+Bm9NJ5dOlvC8ChMLK5nsJ
 qsaPbF8bAmXw1EOmR9XDArDa6Ta/j7hy5DXMae4W9sPV0dMGkvXrCDrowv8eOS/qn/84VqZ+e3r
 /3Qlvlvoov5dj2Lj3iqp1x7lqjNKK
X-Received: by 2002:adf:f710:0:b0:313:ea6b:6322 with SMTP id
 r16-20020adff710000000b00313ea6b6322mr598557wrp.9.1689792885724; 
 Wed, 19 Jul 2023 11:54:45 -0700 (PDT)
X-Google-Smtp-Source: APBJJlG2R/Xv30hj6XOpfiOSLt/lvChiKNZCGj3tPoo/DAdnjcpeiROEXlA9fxWU3sBuqdLXHC+8DA==
X-Received: by 2002:adf:f710:0:b0:313:ea6b:6322 with SMTP id
 r16-20020adff710000000b00313ea6b6322mr598550wrp.9.1689792885396; 
 Wed, 19 Jul 2023 11:54:45 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n13-20020adff08d000000b0031433443265sm6008647wro.53.2023.07.19.11.54.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 11:54:45 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>
Subject: Re: [PATCH 02/11] drm/tests: client-modeset: Remove call to
 drm_kunit_helper_free_device()
In-Reply-To: <20230710-kms-kunit-actions-rework-v1-2-722c58d72c72@kernel.org>
References: <20230710-kms-kunit-actions-rework-v1-0-722c58d72c72@kernel.org>
 <20230710-kms-kunit-actions-rework-v1-2-722c58d72c72@kernel.org>
Date: Wed, 19 Jul 2023 20:54:42 +0200
Message-ID: <87y1jbhgul.fsf@minerva.mail-host-address-is-not-set>
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

> Calling drm_kunit_helper_free_device() to clean up the resources
> allocated by drm_kunit_helper_alloc_device() is now optional and not
> needed in most cases.
>
> Remove it.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

