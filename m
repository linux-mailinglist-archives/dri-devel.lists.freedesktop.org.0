Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF19878C0E1
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 11:02:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2834C10E0EB;
	Tue, 29 Aug 2023 09:02:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 995CC10E0EB
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 09:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693299716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CgdzgbOX3BwA1qsFQOYjucBlp+9396nKB8ZCFY6QyUM=;
 b=M7IG6tI4KWAPaTWTRR/MAsjBp7lL7+2W5+/xWTXpyDMDfSI60hsIQnzV7Bu+m6U/7VZ4ki
 uuyxyzOd8+zSY2n8XpOngPMT94swhR5UM9P9vbuBTNxdfZbeI9IauItjrIcxlZUEL3ng/p
 Z1cngPYtxBRk93v46f2PoYXQ8Rx4O9I=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-322-M9JBQlZFNjWOUSlWgI5d9w-1; Tue, 29 Aug 2023 05:01:55 -0400
X-MC-Unique: M9JBQlZFNjWOUSlWgI5d9w-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-31400956ce8so2625518f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 02:01:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693299714; x=1693904514;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CgdzgbOX3BwA1qsFQOYjucBlp+9396nKB8ZCFY6QyUM=;
 b=I4F/Sp5G/eczQptsOQQKECRhJnQqbkjFVGDLvgATjoaMO/yDKJs+gV/am/d7ONSqks
 MCWfqknAQ61w1zBm5iI6dGU1bEnsmHtaoND2YSF8UxjOB5/ALU5fF24HK+6FAv+qbHSd
 TxEb5BxDPpAj+Mtfa2B7S0YSVTdfl0qtPxitVofaSmeSziM+ZTd8ShevQ5n4ec86Mci/
 eF9/dCWWxmeg50Fv21ZT7K6/YnkgShgFqpYiqxuEAyHJrJ/0+2ADQ4mPJR2TGe3gVWn8
 n1yGfot661eZdeeJlKp/bY1qznPJBzYVD0AKjbeILdWlya1mRCBGnul5lrHDXbMNJ4vT
 bx7g==
X-Gm-Message-State: AOJu0YwRKgU/n5gtkdwtYNKAVwKMfRvmXRdnEtJpg0ReKe6mxTgyYpYv
 R3XJBEI8mr+HnU9IhknGZNZ0u9tc4IeziTyQToFA9SkDyNNB5I/eAjXygeH12kYFKMaBbbxDX3V
 AJP8scsl2mzOIfmguh7vtAD3fNzrm
X-Received: by 2002:a05:6000:1001:b0:313:eee0:89a4 with SMTP id
 a1-20020a056000100100b00313eee089a4mr19955846wrx.12.1693299714229; 
 Tue, 29 Aug 2023 02:01:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7519sgRuQahIjqmDIMpfo+pIFgWCd1xrVbXj5n+yxQWh+8JQX1GBtrdrGKcwK47RXFui/Cw==
X-Received: by 2002:a05:6000:1001:b0:313:eee0:89a4 with SMTP id
 a1-20020a056000100100b00313eee089a4mr19955828wrx.12.1693299713945; 
 Tue, 29 Aug 2023 02:01:53 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 z6-20020a5d4406000000b003143c6e09ccsm13098590wrq.16.2023.08.29.02.01.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 02:01:53 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 4/8] drm/ssd130x: Add support for DRM_FORMAT_R1
In-Reply-To: <d5f342b5382653c1f1fb72dbedb783f9ea42416e.1692888745.git.geert@linux-m68k.org>
References: <cover.1692888745.git.geert@linux-m68k.org>
 <d5f342b5382653c1f1fb72dbedb783f9ea42416e.1692888745.git.geert@linux-m68k.org>
Date: Tue, 29 Aug 2023 11:01:52 +0200
Message-ID: <87ttsite67.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> The native display format is monochrome light-on-dark (R1).
> Hence add support for R1, so monochrome applications not only look
> better, but also avoid the overhead of back-and-forth conversions
> between R1 and XR24.
>
> Do not allocate the intermediate conversion buffer when it is not
> needed, and reorder the two buffer allocations to streamline operation.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> v2:
>   - Rework on top op commit 8c3926367ac9df6c ("drm/ssd130x: Use
>     shadow-buffer helpers when managing plane's state") in drm/drm-next.
>     Hence I did not add Javier's tags given on v1.
>   - Do not allocate intermediate buffer when not needed.
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

