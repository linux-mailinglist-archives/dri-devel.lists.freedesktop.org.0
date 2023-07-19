Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12530759F2D
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 22:02:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4499510E503;
	Wed, 19 Jul 2023 20:02:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26A9010E503
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 20:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689796922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F50ZRNO2TGVX8Kl6rozSN2J4zAo6+Tkfm50rtvi7/ZE=;
 b=gM7AGlWQgx7nTFxZOlUwUk+PpnPM30xxmn32fUnBs4UOa09hVRcz65LNrlaqiG0KYgWDLP
 NpqbCZcFIs/HfrFqwVn6ByK2TJ0xCy/zMRFmDq8HLrjJ9CPPHSG/Z1wv1eOZiHh/biFTpa
 Ufo/oujcsfjpYguB9efM92xPlSJvWcU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-230-hJsZC0VnO8edMmBBLElljA-1; Wed, 19 Jul 2023 16:02:00 -0400
X-MC-Unique: hJsZC0VnO8edMmBBLElljA-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3143a431a01so12862f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 13:02:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689796919; x=1690401719;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F50ZRNO2TGVX8Kl6rozSN2J4zAo6+Tkfm50rtvi7/ZE=;
 b=MVF1MsbVqA1lvMc98XvEHMFyebq9jOj0heapPe6Ih0YxkYRhK0Uojclivkrr8RVV4d
 eOevtT+b74AqlE08421cmmklwIMVogNyWyKRXiDc6WZd8lX6HiKBsblSDGHzoyHSn/qu
 MtYWqHXqR+brvoXAFdyGM/sQEe+T7wT527eYglAGAdJRV3zjWV6qsWMz9cN8xWyUgLNl
 Ij6SyeCPJ502/uaqEao+bh0e+CKhko5+u0cwzFsW7tltXE64pkYl/O7EdchL33SHTLUn
 nAOfiukxbyS8q1TzfkS0byw8v0/K7da6i3D0SIE0a2sLJWqvhcZkS16OOE9+3ZB1H+zA
 d96Q==
X-Gm-Message-State: ABy/qLYOz2KeMHapgeR4/nE7CBR1anQLFr/B7xwVKpFkPYYhNSlo3KBY
 KHfjXDyoAlIx1VyVwgrL1x1fj/yYzjidCQ2emjz5o+TAh1QOOykl2ZCCewqZ7CChw8/5A0pFABH
 Ulev3ONWmF4FYz63zdnbEi4w6KQp/gIJQevhB
X-Received: by 2002:adf:cc8a:0:b0:313:ee3e:50c5 with SMTP id
 p10-20020adfcc8a000000b00313ee3e50c5mr667538wrj.20.1689796919488; 
 Wed, 19 Jul 2023 13:01:59 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEh6qh2D+HDhq3T4nhad60k5o+fElA385D8f/zxvzb2G1xHV5DYobxgxRQ1y8JlPIHpCqcuDw==
X-Received: by 2002:adf:cc8a:0:b0:313:ee3e:50c5 with SMTP id
 p10-20020adfcc8a000000b00313ee3e50c5mr667526wrj.20.1689796919290; 
 Wed, 19 Jul 2023 13:01:59 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 i2-20020adffc02000000b0030c4d8930b1sm6122653wrr.91.2023.07.19.13.01.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 13:01:59 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>
Subject: Re: [PATCH 07/11] drm/vc4: tests: pv-muxing: Remove call to
 drm_kunit_helper_free_device()
In-Reply-To: <20230710-kms-kunit-actions-rework-v1-7-722c58d72c72@kernel.org>
References: <20230710-kms-kunit-actions-rework-v1-0-722c58d72c72@kernel.org>
 <20230710-kms-kunit-actions-rework-v1-7-722c58d72c72@kernel.org>
Date: Wed, 19 Jul 2023 22:01:58 +0200
Message-ID: <87fs5jhdqh.fsf@minerva.mail-host-address-is-not-set>
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

