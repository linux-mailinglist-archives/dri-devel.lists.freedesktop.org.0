Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB32791813
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 15:28:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE8D810E33D;
	Mon,  4 Sep 2023 13:28:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D45410E33D
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 13:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693834100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z8BbS0VR+viLE45lChE7wLN6LwznzmsTUr7hWT6afTU=;
 b=itcx4F+diU1g0zx/pFY2FX7rmBk3Dv+lKHraSnzx9mTQHUb00hDIW607Sd5SQ+hzndNGUs
 QGn5Qx4X1IN2HzlH/z6keFtDJgI3jErgBs4wh6o19IzNtUaWf3CZvemBkc16LSKby5SPY4
 9OM38/WpJsforqb2C5MaaWRhoyMRFJk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-303-8iWTQrujO_yS0bvCbKx8Sg-1; Mon, 04 Sep 2023 09:28:17 -0400
X-MC-Unique: 8iWTQrujO_yS0bvCbKx8Sg-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3fd0fa4d08cso9511955e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Sep 2023 06:28:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693834096; x=1694438896;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z8BbS0VR+viLE45lChE7wLN6LwznzmsTUr7hWT6afTU=;
 b=R4GW/DQRgL991hHnPclatp+BHOsyZ+TkUnIlVwy9uOLdZci9uAmxq1ush97H3ARbEX
 WVeNWwhERj5WCofvfjuJaaiCFim9kalSpaziv2ywzzSa2I3oe/ERJfgbgkljEdF54xDQ
 naA09fCJ66AgYMHrpICG2sQmh6kVgjvyOTWZ390Ihc1jj7FqeIERTtUDRjVMv3rLBIIj
 ktf04JO8GhAHz1jjpmVzlyqAM0UV/0eF+4Uj863HY3I7nC+chrwdJMySzDZURxGum6iY
 GQpvPrhhrzVnQvhGi9D5HOwqG8Jy1ph707p4Ko4BQ/LJjOExX7OxjiR4lmuLl6bhPtSK
 Esgg==
X-Gm-Message-State: AOJu0YxxSdnMJnwXsosaXCQvIxFgc2dNOEQZ+4xd2gTUreVG6PLLnPZo
 qg9DVMkaGiSCMpJ+I1KRAC1lE0XyBPWUEivXde6pfqdaH0EhpFTZmql81ERGsPY4Bnz2onjuGpK
 IziiMO0aFHU4XEOEDD+xDJXNX6kWP+hKR6whp
X-Received: by 2002:a05:600c:2945:b0:3fe:89be:cd3 with SMTP id
 n5-20020a05600c294500b003fe89be0cd3mr7455264wmd.22.1693834095942; 
 Mon, 04 Sep 2023 06:28:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHl7VfR/OsiuaD0NLKpcBP58yIezvg5tTwL4OjRo81CSensP8glNKF1MPDnFaTMcS52nY0Kpw==
X-Received: by 2002:a05:600c:2945:b0:3fe:89be:cd3 with SMTP id
 n5-20020a05600c294500b003fe89be0cd3mr7455246wmd.22.1693834095589; 
 Mon, 04 Sep 2023 06:28:15 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 p9-20020a1c7409000000b003fee53feab5sm14253513wmc.10.2023.09.04.06.28.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Sep 2023 06:28:15 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, daniel@ffwll.ch,
 sam@ravnborg.org
Subject: Re: [PATCH 7/8] staging/fbtft: Initialize fb_op struct as static const
In-Reply-To: <20230828132131.29295-8-tzimmermann@suse.de>
References: <20230828132131.29295-1-tzimmermann@suse.de>
 <20230828132131.29295-8-tzimmermann@suse.de>
Date: Mon, 04 Sep 2023 15:28:14 +0200
Message-ID: <877cp6cbkh.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-input@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Replace dynamic allocation of the fb_ops instance with static
> allocation. Initialize the fields at module-load time. The owner
> field changes to THIS_MODULE, as in all other fbdev drivers.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

