Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A5A8A6B0B
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 14:35:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C657112C32;
	Tue, 16 Apr 2024 12:35:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="KS1x59z/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 000D6112C32
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 12:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1713270914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1YCoIwUmLzovUo4BmYd25Db359c9nGlD5mjqcEK7W2k=;
 b=KS1x59z/hGOZp8cUj0MfIwXQLNbKn8wydZ5hAe7ZGXCus7TD4DP5i6GsHdcTz2ISqMpQlE
 Dpm8S5xEXRn+n34Vt55JgRPXlPQR98gKUg/BrPDOse96tIOJjM50/g2ZjOrAdcJInML7Mw
 8xmecajtRKwPqe1M+yFssnf86QgPoSQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-372-x5Dl8oOyPZ6a_zwSl12UUw-1; Tue, 16 Apr 2024 08:35:12 -0400
X-MC-Unique: x5Dl8oOyPZ6a_zwSl12UUw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4147de378b9so20386765e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 05:35:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713270911; x=1713875711;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1YCoIwUmLzovUo4BmYd25Db359c9nGlD5mjqcEK7W2k=;
 b=VhFfDZzpbne49mtE6EQkCQc6ZznZIwD/XErvqIroexR8LHfv8e6yUkPD0SNqYfnDD9
 /sr/LMZ8q2PJG3nQzaHZ2OVxyMyxgdNbSIFrV4HBhPN8L3uR+KgrSCUjCIhthzaH6Euo
 B2i5J3BbANSq7Hxc9OIIRsyzvxMp5avDkYaxO6tDm2Bkmy8ojpoJ8lFgCTFvfkxoEiXA
 LPn77/gU6+iMxuSgr8pEMDhXeUKnrfw4VCZ5gBZY3VOBjTSP2RBRkz1vQA4jfzzgkIQL
 P7mDVPEF0e/ieCIP7ZXhXKBu6+64ijLfUI0UQyEBfDQFfsfZgEi+XmkluduSkcDlIebO
 i1Bw==
X-Gm-Message-State: AOJu0YxO6ygMc5N7yxN7A2Bj95PEXm2FOUH4Tv6UyWHw4E2r3lsb3I0Z
 vbT46A/48FdFho1UNVXTWJ3HcZUvd6qzqxnr1KbRlqVJeQinQh0Pxr2jmWLR9LeqKuGEUH7tJCy
 swqw3oTjbp6Bk1yrVmma5mV4fT6hiRUpuk3vcNDQYe0/UvyZWZumkVTl0BhCqSPK6Jw==
X-Received: by 2002:a05:600c:3d08:b0:418:7e61:762f with SMTP id
 bh8-20020a05600c3d0800b004187e61762fmr2916040wmb.26.1713270911577; 
 Tue, 16 Apr 2024 05:35:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDbI6of2NRqQAiW2/9LLw8bGrHejGmoHcam6TOv4ECJ+kveLdl7v2vwyJUQlVBDPy9cDUMng==
X-Received: by 2002:a05:600c:3d08:b0:418:7e61:762f with SMTP id
 bh8-20020a05600c3d0800b004187e61762fmr2916027wmb.26.1713270911169; 
 Tue, 16 Apr 2024 05:35:11 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 e1-20020a5d5941000000b0034722442e60sm11277729wri.61.2024.04.16.05.35.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 05:35:10 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
 airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, Thomas
 Zimmermann <tzimmermann@suse.de>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v2 26/43] drm/mediatek: Use fbdev-dma
In-Reply-To: <20240410130557.31572-27-tzimmermann@suse.de>
References: <20240410130557.31572-1-tzimmermann@suse.de>
 <20240410130557.31572-27-tzimmermann@suse.de>
Date: Tue, 16 Apr 2024 14:35:09 +0200
Message-ID: <87plup5vuq.fsf@minerva.mail-host-address-is-not-set>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Implement fbdev emulation with fbdev-dma. Fbdev-dma now supports
> damage handling, which is required by ingenic. Avoids the overhead of
> fbdev-generic's additional shadow buffering. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

