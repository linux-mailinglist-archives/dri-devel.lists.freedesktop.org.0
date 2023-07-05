Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F1A74806E
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 11:07:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2B5810E326;
	Wed,  5 Jul 2023 09:07:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F55810E326
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 09:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688548036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a06dM4DVhOWie+29y5OH6RTZsrC7pthC/bnsJb9dU4k=;
 b=TkctYdfkaG7vg82cKjocujjyNN5f97SGBL0O8qElhImGEztSuHPnXfne6t5x5MRb0EwqZp
 bX+PYReIO2No8v9pat+IOLaqHDow16jV/JVa0mEsQbq7YQIC/4jcGvumAG/r4yGdfqjIMi
 vNcelHt24pWiqCavtCB1LAIZSBf5pZg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-224-d1_ajFZ8Pd29qrUYsUAkgA-1; Wed, 05 Jul 2023 05:07:15 -0400
X-MC-Unique: d1_ajFZ8Pd29qrUYsUAkgA-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3143ac4a562so1483676f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jul 2023 02:07:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688548034; x=1691140034;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a06dM4DVhOWie+29y5OH6RTZsrC7pthC/bnsJb9dU4k=;
 b=LY+S3/DvR4ZzoPyit3pbDXpej95LpZLjzIIlQytuNtx7YfezxRI/pHCXiU05ZFT9IV
 ptIZ1HyFWtlaVlvGsC0Ovrah2C3IFNwYNPoYIl+GCFMU0Ejz6MOD6OtjZJ4Q154gV6r6
 ukblXJDW9LOw+9CdkqVQbm3dMtusrlgXPddACVA51XcoQTGCPP1RWpk7kihU20FvSO7k
 6E7OwPfM/aEO2QkhxQCHKCh9zxTJCWVeiyI+4/y28TgnBjI5YXFDPBO0deqt9NGGCjy6
 Fyooxv1UQqtJ9DlNu916gORC1Y+PBw/ALwzSZXh43x3ntHNdXaPLNB/yK9XUOS7mLMDX
 8Upw==
X-Gm-Message-State: ABy/qLZi5g6B13jECanRzacpuf8RgtkXrSgrzgebXgYnpCvePRbUvFUc
 BnrTAex+hKcEaJwL83kD2/ipXXoWy8gp+tazXw/sb/nowFjnb3vQ9OlTp0Sw3kYEinJcbCUmsT4
 ZjVKttcHVDWbLSh8FpsYU+HyAyysb
X-Received: by 2002:adf:f3c4:0:b0:313:ebf3:850e with SMTP id
 g4-20020adff3c4000000b00313ebf3850emr13765066wrp.37.1688548033939; 
 Wed, 05 Jul 2023 02:07:13 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHGcT0p8hhCDRF3h+9mFlbkiFbzXDC8/ZzlCbbtfV1aXJy0eKEzcQDMciMIa3WCioCrYV9vdg==
X-Received: by 2002:adf:f3c4:0:b0:313:ebf3:850e with SMTP id
 g4-20020adff3c4000000b00313ebf3850emr13765052wrp.37.1688548033678; 
 Wed, 05 Jul 2023 02:07:13 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m3-20020adff383000000b0031417b0d338sm16044699wro.87.2023.07.05.02.07.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jul 2023 02:07:13 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: Re: [PATCH 09/10] drm/omapdrm: Set fbdev flags
In-Reply-To: <20230704160133.20261-10-tzimmermann@suse.de>
References: <20230704160133.20261-1-tzimmermann@suse.de>
 <20230704160133.20261-10-tzimmermann@suse.de>
Date: Wed, 05 Jul 2023 11:07:12 +0200
Message-ID: <87ilayrakf.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Set fbdev default flags FBNFO_DEFAULT and mark the framebuffer with

FBINFO_DEFAULT. I noticed that the same typo is in patch 04/10 as well.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

