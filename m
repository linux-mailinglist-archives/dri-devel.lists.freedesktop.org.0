Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABC77259AD
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 11:11:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAB6910E48C;
	Wed,  7 Jun 2023 09:11:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F8E710E48A
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 09:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686129076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mH0V+GQH9u3hTOintFl8kIUIu94Srk8ZL012Xjzg5pc=;
 b=hy1ts/e4vaL+GxeT4gl0KEkJq7sahjb/dEt7ryFgn/ffoGA4kvnzuwuU4JgUUC/JSNX/EP
 dkCw/sb4bNsf6vLm2W2On/zCHHILQFmyecybdbNKOiqcRV4mqRP70YFpRyEsP3NhLDRQcX
 VHOAzHFmifNs9chifU16fPEWcSG0gIA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-oItknUW9N7uysa7H2VGVMw-1; Wed, 07 Jun 2023 05:11:15 -0400
X-MC-Unique: oItknUW9N7uysa7H2VGVMw-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-30ae4ed92eeso3108922f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 02:11:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686129074; x=1688721074;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mH0V+GQH9u3hTOintFl8kIUIu94Srk8ZL012Xjzg5pc=;
 b=DszyWrA6XljC8WPVi4gIaAYfwe72vugumKx6nGwvpbSARNm8M8t0b8s5o6qPLSb/R4
 hiwnLJ6KgZDGl4z4wNbxwdCv2IDut+DcCHg3oJGiLwhkYQtk7aDx+oWS8HpL74gefLGv
 isCZajApw9raGvpCweiunPqnfG0evWlFR1dZJsOLBkJB6yLfMf3YhZ9KX2Yui7qXKdh+
 uCwAhaQAxZc16j9na0m8LhQOpEKLe4dLO/1WIdKkWQNSJaA+LUVlMXH1d6bq32L/m/yC
 xbDXL3898P0+qpJTrKtCTsJija3nx112eNk6YzSoyQqM19IoUrErTMIAlOZOdwxFpuPl
 7O1A==
X-Gm-Message-State: AC+VfDxiDtwTWs8g++wezsrSNP89GSDzdlQukmCCFoFM6ejt/amdebHc
 wjt6VYp2mMwhYGrn4GaSFO7LFIIZftOAbi4rjLcyP2/EK3fFn9tsXCsnh2fxyXpryNUfU/87J1o
 rUp3rUBpzThaGDITgEJnk7BcCzvlA
X-Received: by 2002:adf:e688:0:b0:30e:32b4:88b1 with SMTP id
 r8-20020adfe688000000b0030e32b488b1mr3941816wrm.9.1686129074280; 
 Wed, 07 Jun 2023 02:11:14 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4KJfeyDxYfcACaVW0UaN5JNsg10BzGoz+FuMEljUH8CXhTXkm2kLiaHaEUmQ35VeCWg/34qw==
X-Received: by 2002:adf:e688:0:b0:30e:32b4:88b1 with SMTP id
 r8-20020adfe688000000b0030e32b488b1mr3941796wrm.9.1686129073975; 
 Wed, 07 Jun 2023 02:11:13 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k1-20020a05600c0b4100b003f735ba7736sm1412543wmr.46.2023.06.07.02.11.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jun 2023 02:11:13 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com
Subject: Re: [PATCH 19/30] fbdev/rivafb: Reorder backlight and framebuffer
 init/cleanup
In-Reply-To: <20230605144812.15241-20-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-20-tzimmermann@suse.de>
Date: Wed, 07 Jun 2023 11:11:12 +0200
Message-ID: <87ttvjeixb.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Antonino Daplas <adaplas@gmail.com>,
 linux-sh@vger.kernel.org, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> The driver's backlight code requires the framebuffer to be
> registered. Therefore reorder the init and cleanup calls for
> both data structures.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Antonino Daplas <adaplas@gmail.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

