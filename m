Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6961E6B9F5E
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 20:08:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA2B310E88A;
	Tue, 14 Mar 2023 19:08:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF22510E88A
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 19:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678820918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lNWYgyqpL0kkvls3E2pegU9Km1BHkvTF5mInuI5lUZI=;
 b=aFhwTl0PUzv/wsUYqS6QqmDq3DraQy6KBy6SW2S4d+aOwzbpAU7SDpuqzXjzTX/HsFF75j
 s/KlrdRTQ+kXpHmwLGu1BMPvJrYNGjixqHemkhyg2JW+vx0ljAW1WBZ7n8x8FKqs20D1Zj
 9K9QWcr0KbGmLlM9XvhP20x8Fsm2v+k=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-303-TKo94e8cPcqzCUnUkYUoPA-1; Tue, 14 Mar 2023 15:08:36 -0400
X-MC-Unique: TKo94e8cPcqzCUnUkYUoPA-1
Received: by mail-wm1-f71.google.com with SMTP id
 b8-20020a05600c4e0800b003ed2d729092so1154402wmq.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 12:08:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678820915;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lNWYgyqpL0kkvls3E2pegU9Km1BHkvTF5mInuI5lUZI=;
 b=OSfTNjsRgxVim/jfF+mu39uW+kSui4M4h2PCPk+Vwoc4a7AyX5W2tXpp8Avt2mQYhH
 wwn+AOyj6sDgBQQeZCF/wPhQcWY8fSFtCllYDMVMGArUo8dq4Vy858Z/3PvCYuGG5jNi
 t8G0iPzn+1e37Iao3mAGZDOWffG6AQ8PZon1ocQEWG7o8mynNIHZySDbb8uyANT7Dh3C
 ZmE7laLj2f+XRXz7P/qVvJ/cxF7SOJM56N9FyXeeP7rvlOTB1zlveT71Rdvx6SeKEcVS
 csoPZp38qWVlv/tj9LcfPf1uIhAkGVyuYUQY50gpq0keZDPf8IK7Kn+UgL4y8eq+tBhp
 11AA==
X-Gm-Message-State: AO0yUKX4M1N6/1IUUwTajfmAaJgMScwBtLprWSO/8RNU3s+nnzFxb7zH
 AWV8iUC5Xe/E2HrZtOsCHg/pecds2fe/wfQlCkvrAFbQIOmPx7IG6N8C02aFdr2647dvc8G+RFu
 KJITljsFDWX88AmDLWWj72QYAwOlh
X-Received: by 2002:a05:600c:1f0f:b0:3df:ef18:b0a1 with SMTP id
 bd15-20020a05600c1f0f00b003dfef18b0a1mr16024963wmb.12.1678820915325; 
 Tue, 14 Mar 2023 12:08:35 -0700 (PDT)
X-Google-Smtp-Source: AK7set/oJ3kHP6b9+XZidTEo5Mltane1EZAOPkHWz7r0OSgAihZ1HZi+Eya7qoiaIl4nYclowLmInA==
X-Received: by 2002:a05:600c:1f0f:b0:3df:ef18:b0a1 with SMTP id
 bd15-20020a05600c1f0f00b003dfef18b0a1mr16024944wmb.12.1678820915005; 
 Tue, 14 Mar 2023 12:08:35 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n6-20020a7bcbc6000000b003ed2fb86f85sm1105291wmi.47.2023.03.14.12.08.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 12:08:34 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Arthur Grillo <arthurgrillo@riseup.net>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 1/2] drm/format-helper: Add Kunit tests for
 drm_fb_xrgb8888_to_mono()
In-Reply-To: <20230311125141.564801-2-arthurgrillo@riseup.net>
References: <20230311125141.564801-1-arthurgrillo@riseup.net>
 <20230311125141.564801-2-arthurgrillo@riseup.net>
Date: Tue, 14 Mar 2023 20:08:33 +0100
Message-ID: <87cz5b40cu.fsf@minerva.mail-host-address-is-not-set>
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
Cc: davidgow@google.com, tales.aparecida@gmail.com, mairacanal@riseup.net,
 tzimmermann@suse.de, jose.exposito89@gmail.com, andrealmeid@riseup.net,
 Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Arthur Grillo <arthurgrillo@riseup.net> writes:

Hello Arthur,

> Extend the existing test cases to test the conversion from XRGB8888 to
> monochromatic.
>
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> ---

Patch looks good to me:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Please let me know if you need someone to push this to the drm-misc tree.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

