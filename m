Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7426759F2A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 22:01:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8244510E502;
	Wed, 19 Jul 2023 20:01:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B186810E502
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 20:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689796895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sg6wZSinxe8r2P+uFq4KgcT9vXCAHVcOICFNECpMgro=;
 b=MNhOajlcipd3Ui+uJqa05iEko9V9zDYbZL0X5Rg2azLecIjL028LfjoDpaFRu+LtOpYFEF
 1ZvmuIlti0MmQci9ciEttmwS4oq+q7HmzR/DoNl0wpKI9hs8qyMuSP5N3comsGrnOaTDmm
 vI4nIOVSisdIsZIirGGIHBMsDbP2FuY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-KO4TlggmNJKD2D4_I5xL-w-1; Wed, 19 Jul 2023 16:01:30 -0400
X-MC-Unique: KO4TlggmNJKD2D4_I5xL-w-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3fbfc766a78so13145e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 13:01:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689796885; x=1690401685;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sg6wZSinxe8r2P+uFq4KgcT9vXCAHVcOICFNECpMgro=;
 b=g0yfFAwLTI4wGekTDlCLWK+2wkqlxk3/l0FAlCCycxUbghuNzBD+JFPFo2NfM7a8Fa
 kFZj+UPEfuoqkayJBlWt3bsjHEWj4dvTbBKFIiIFdTfmqZobIFFyeukc/TpJQpezFyV5
 97hyBPmmwv9G8PMb068l3mTSQOwheklsKV6ofvOpFJIoinAM4I6nV1tdHtdTs4dRcXKZ
 7jBb5m3YSHXtNUE1/KyCwP1PXDtDhqABD0NM3XAQJudiVKVMVINLxNW7qNz3V3LzJVnl
 A9RmFVG4u/gVuao0c7IxyvL1xdJJvFzzBf5qMtywCbtPPFz34yXD7qcNSimlJ0US70Ne
 x0iw==
X-Gm-Message-State: ABy/qLZ52XmaKBgz3zRWS4dMkE6NHiBtnHEuLov2vv2PzmwMxTO+xJFz
 8bkIGSiXYplGY/JMuyvOpghJrYQpNvjslWARHuVyzk6eqy3VTJA4htAtWHKhMt2jz3Gf0nncSHc
 3X+Wl8TwVcERU2RJuPjHSsCsD+s1v
X-Received: by 2002:a1c:7412:0:b0:3fb:dbd0:a7ea with SMTP id
 p18-20020a1c7412000000b003fbdbd0a7eamr5358874wmc.37.1689796885405; 
 Wed, 19 Jul 2023 13:01:25 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHwqBKuTLWtJTG125iBcGiKJyRQZhKpcKrRbtLnI3PtSW9DnwX2W7eJ7bjSr7Vo1B8R/7uLgA==
X-Received: by 2002:a1c:7412:0:b0:3fb:dbd0:a7ea with SMTP id
 p18-20020a1c7412000000b003fbdbd0a7eamr5358862wmc.37.1689796885087; 
 Wed, 19 Jul 2023 13:01:25 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 d5-20020a5d6445000000b00311299df211sm6074595wrw.77.2023.07.19.13.01.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 13:01:24 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>
Subject: Re: [PATCH 06/11] drm/tests: helpers: Create an helper to allocate
 an atomic state
In-Reply-To: <20230710-kms-kunit-actions-rework-v1-6-722c58d72c72@kernel.org>
References: <20230710-kms-kunit-actions-rework-v1-0-722c58d72c72@kernel.org>
 <20230710-kms-kunit-actions-rework-v1-6-722c58d72c72@kernel.org>
Date: Wed, 19 Jul 2023 22:01:24 +0200
Message-ID: <87ilafhdrf.fsf@minerva.mail-host-address-is-not-set>
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

> As we gain more tests, boilerplate to allocate an atomic state and free
> it starts to be there more and more as well.
>
> In order to reduce the allocation boilerplate, we can create an helper
> to create that atomic state, and call an action when the test is done.
> This will also clean up the exit path.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

