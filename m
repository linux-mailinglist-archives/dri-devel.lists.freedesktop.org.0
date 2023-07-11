Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76AAD74EA7C
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 11:29:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B80610E34D;
	Tue, 11 Jul 2023 09:29:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 125CD10E34D
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 09:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689067765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ScNK1Ai1AQo1RxKaPMsH8fGKvEv6g/bLxIVdnSrKJew=;
 b=cOnVv9sUdZxxy2rJt0fJwc7rdguz/PSCmEEbYo23VOc8bxfgC1kTFTf7Mtqb3y7nxe54I9
 cXGBKYpuhxjkYHrigv0LyQbuqJrNxmatY2W4EBiaCRYh05qUVCQ4RoIUFRxJuYm0GQ+1TV
 HoBcN1Up1zDzYAzyZ55NfKJJPuaZsYs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-349-D0Wyr05vP06y5c4z3WLUGw-1; Tue, 11 Jul 2023 05:29:24 -0400
X-MC-Unique: D0Wyr05vP06y5c4z3WLUGw-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3fbefe1b402so34151015e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 02:29:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689067763; x=1691659763;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ScNK1Ai1AQo1RxKaPMsH8fGKvEv6g/bLxIVdnSrKJew=;
 b=IJ/RatKZoMw8kQ6SajijNsg8AJHDoUqZO4hdn7ixbwFh4ZNyryIN3YSzomgYqkBCZ6
 MxpQ+/zzpiCYh0uMqya/2NwedateBnwVVQ1xqK6w59frjOFD/hv9BD8bIbafpXxR4/Fq
 t1AS2VQY7hC9TsNW6UDDwM9vlaNio4gVjFsqEP1gru4ME95QZAkoHH5MnC3zOmMYSS7F
 ohUMgkF7BJhuF1+36LtE6mf8Nes06rjnRZA2Krjw7AGWIaqy7WYqLXzmnc1vuz/NrE87
 3c2ykvvddyAtFWp+XFn1O4fwW2SJ4nH7KfRaPRepYYmXik51SuKjk82UvzbKZKRFTzLE
 UtRg==
X-Gm-Message-State: ABy/qLZ0l4ZQOo422q0F/VFJOJDlzvHmCZh8aOKOErJbkeKdGjqZ/bkK
 jvLT3w2w2jQEqnvzSvxvYvMiFVa5MrUAMqe7/CH6jCngiBeIfyEyAJ3u75ccg3T9t+eLbKLhsMv
 6Rt+/v9Yoil/T0ZIYemUAorF5ZIr6
X-Received: by 2002:a1c:ed0d:0:b0:3fa:934c:8350 with SMTP id
 l13-20020a1ced0d000000b003fa934c8350mr13498380wmh.27.1689067763098; 
 Tue, 11 Jul 2023 02:29:23 -0700 (PDT)
X-Google-Smtp-Source: APBJJlF7NRV/m35zkkZpb2UhaNQTGj9kpg+rTHuDLL+a7Z51IaBaVs7CGyqd34Y++AyjSk7TOj+Txg==
X-Received: by 2002:a1c:ed0d:0:b0:3fa:934c:8350 with SMTP id
 l13-20020a1ced0d000000b003fa934c8350mr13498364wmh.27.1689067762768; 
 Tue, 11 Jul 2023 02:29:22 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k24-20020a05600c0b5800b003fc01189b0dsm1959301wmr.42.2023.07.11.02.29.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 02:29:22 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, tzimmermann@suse.de,
 airlied@redhat.com, yizhan@redhat.com
Subject: Re: [PATCH 2/2] drm/client: Fix memory leak in
 drm_client_modeset_probe
In-Reply-To: <20230711092203.68157-3-jfalempe@redhat.com>
References: <20230711092203.68157-1-jfalempe@redhat.com>
 <20230711092203.68157-3-jfalempe@redhat.com>
Date: Tue, 11 Jul 2023 11:29:21 +0200
Message-ID: <87351uiyoe.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Jocelyn Falempe <jfalempe@redhat.com> writes:

> When a new mode is set to modeset->mode, the previous mode should be freed.
> This fixes the following kmemleak report:
>
> drm_mode_duplicate+0x45/0x220 [drm]
> drm_client_modeset_probe+0x944/0xf50 [drm]
> __drm_fb_helper_initial_config_and_unlock+0xb4/0x2c0 [drm_kms_helper]
> drm_fbdev_client_hotplug+0x2bc/0x4d0 [drm_kms_helper]
> drm_client_register+0x169/0x240 [drm]
> ast_pci_probe+0x142/0x190 [ast]
> local_pci_probe+0xdc/0x180
> work_for_cpu_fn+0x4e/0xa0
> process_one_work+0x8b7/0x1540
> worker_thread+0x70a/0xed0
> kthread+0x29f/0x340
> ret_from_fork+0x1f/0x30
>
> cc: <stable@vger.kernel.org>
> Reported-by: Zhang Yi <yizhan@redhat.com>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

