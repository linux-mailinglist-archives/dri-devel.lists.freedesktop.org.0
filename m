Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D69876813A
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jul 2023 21:10:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3CE710E108;
	Sat, 29 Jul 2023 19:10:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB96410E108
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 19:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690657805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YOCFbmaqJDliMmq4qRXmQzpcNBbZ0rghMQxEBFeZeig=;
 b=JEXB2HrUkMgCyeFCzoeQ5LcomrPt1WYJyQMBmhgpUnN6b5jBHpvYXNi2dCZjFTl1wLJlXX
 nd4/8gIYNqPwHNu6+XoQ3wIqO6DN/dv0coPGs6eWkPdwAjWR7hK9o9kjuLtKPYZ6jhtatU
 xuJhTDZB+AFuXBgTeCtUFQEQwJlWhmg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-QXE2niydPY6a1fWPSWY42Q-1; Sat, 29 Jul 2023 15:10:03 -0400
X-MC-Unique: QXE2niydPY6a1fWPSWY42Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3fe11910e46so7645035e9.0
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 12:10:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690657802; x=1691262602;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YOCFbmaqJDliMmq4qRXmQzpcNBbZ0rghMQxEBFeZeig=;
 b=JuLyfvqLRttltGwODTUon7En+FuP5fwDfNi1OxfUrsX07rgiOZ6FBzFi785VibnKeg
 tWlSp4C8jCKayiI+HDyp5lvwcev6Q1EHY3I4stz9dqATUUMIkaAVzBd8Bi94DKMs3P+r
 8aZcHr89t4G3+gYt2rSrrIpK6yX8mAV+JZWo66HiNQe/BL3cujfGB8YcWbVHpcJpea2/
 iBI1SAkD1ZZIIbnB6xo9vGfYGiaBl0bkgUULLlQ3MYy6GsquEWIfCCpkUmEzdn9kqMam
 I00ErUENnLJwpZTFAEYv/HG02GtBe6xtv+xh9rYdprg4/5aFLYbzWBt1duMMbJeEynZK
 mQcw==
X-Gm-Message-State: ABy/qLYLqfjayYK0J8AqdLWidGa8KUJjNNyRl6c4/7gKlhe/7PpjGtuS
 C6ImEOnVSQEBigY26dMYqsOmanhcWJ+EQz9lCpTdbzpnEQnypDyGFghQxmejF06bzlAdLYrFLiu
 xykHtrp9teGwFbILYXHOsXRXis8u0
X-Received: by 2002:a05:600c:22c6:b0:3fc:1a6:79a9 with SMTP id
 6-20020a05600c22c600b003fc01a679a9mr4764482wmg.16.1690657802669; 
 Sat, 29 Jul 2023 12:10:02 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHLhWwdb9e5stl9mtFYazDKO5IGT18IwiQdgIdt9oSkXWPDup+CMG32gUcSUxlzRYbRdSzBsA==
X-Received: by 2002:a05:600c:22c6:b0:3fc:1a6:79a9 with SMTP id
 6-20020a05600c22c600b003fc01a679a9mr4764469wmg.16.1690657802420; 
 Sat, 29 Jul 2023 12:10:02 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 x20-20020a1c7c14000000b003fc01f7b415sm9897722wmc.39.2023.07.29.12.10.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jul 2023 12:10:02 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2] drm: Spelling s/sempahore/semaphore/
In-Reply-To: <8b0542c12a2427f34a792c41ac2d2a2922874bfa.1689600102.git.geert+renesas@glider.be>
References: <8b0542c12a2427f34a792c41ac2d2a2922874bfa.1689600102.git.geert+renesas@glider.be>
Date: Sat, 29 Jul 2023 21:10:01 +0200
Message-ID: <877cqiy1o6.fsf@minerva.mail-host-address-is-not-set>
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert+renesas@glider.be> writes:

> Fix misspellings of "semaphore".
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> ---
> v2:
>   - Add Reviewed-by.
> ---

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

