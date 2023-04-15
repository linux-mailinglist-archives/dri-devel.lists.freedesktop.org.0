Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 070D06E33D6
	for <lists+dri-devel@lfdr.de>; Sat, 15 Apr 2023 23:27:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D882E10E194;
	Sat, 15 Apr 2023 21:27:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E74710E194
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Apr 2023 21:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681594064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X/ZEh/gaRh3fQzzbFf0RlpMIsmZyOYmW6KUmsBz1aW8=;
 b=Y4srbExQxyfSF8rnps/u2stGXkONOrc9kmb3PFCQvwfD1Z3ieOAOqZsahY+jUOXnnqi4OE
 M2ezPDd2uc1TYbRL+yGwTrcWL8GE5ieKkRATQwmvNpLKBlaqq0RCVugNT695JHrPOuhWkN
 0H2SaM30urflgDmO7wA+dUVdnR/VVCQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-454-a9sich0NOBOpYfAAcC9acQ-1; Sat, 15 Apr 2023 17:27:42 -0400
X-MC-Unique: a9sich0NOBOpYfAAcC9acQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-2f6d4e7faabso155212f8f.3
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Apr 2023 14:27:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681594061; x=1684186061;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X/ZEh/gaRh3fQzzbFf0RlpMIsmZyOYmW6KUmsBz1aW8=;
 b=JeGLQZkw+eca91IeZ1OwAqnV6MKwo6/UX5iBORcT3vjsENnn+bfJRyC+wYDAmY8gFw
 vKVs3OVGWopNxkBRLSTcPqHkt9BuYH3oAdW294wur350EZbk7jZb1ZEw0LpBI1JYLPjR
 XHW3xLLXMO0VVW/SHOhEU1Zq3H1I3+cGSmMR43TJi1x9IhKtyZEyzIXT7w4WI29DdgVf
 g03vv7hU+tHvkiWkIzpCHU9EsdCDPj1DST1Y+3CSYkKwUgHLpJW4PxVmDLcCLE4qsXkW
 K69iPqOGDARLf3YhlmqaczxnNuoUEvw5/ei+EN9QQBO75kkeegz9nfTg4mjv/qBAIFES
 u2Cg==
X-Gm-Message-State: AAQBX9cMTXS+c+AwW38+SuXcW5I5QAuIxu7WboLehGYRa/GBhc3mV7yS
 73NB13iCrNAEwW6g3FdOGpJITaY19dgdJYmm768P0QzvhC37kjNgyjRoSu5qohge5d5H7n6P5NG
 OUG8XHYfWZttbxJDE/6nuwq61RRDd
X-Received: by 2002:adf:ed4b:0:b0:2cf:f30f:cc04 with SMTP id
 u11-20020adfed4b000000b002cff30fcc04mr1942255wro.27.1681594061458; 
 Sat, 15 Apr 2023 14:27:41 -0700 (PDT)
X-Google-Smtp-Source: AKy350aQaOIJbvgDYmVVFEVC0Fi0JPLR5upaTpJinXoZDdFTqkY+5K5vn030gqDfaYkZP3Zb5el0Ug==
X-Received: by 2002:adf:ed4b:0:b0:2cf:f30f:cc04 with SMTP id
 u11-20020adfed4b000000b002cff30fcc04mr1942250wro.27.1681594061176; 
 Sat, 15 Apr 2023 14:27:41 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f17-20020adff8d1000000b002ef222822d5sm6553498wrq.74.2023.04.15.14.27.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Apr 2023 14:27:40 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel
 <p.zabel@pengutronix.de>
Subject: Re: [PATCH] drm/imx/lcdc: Fix compilation with CONFIG_OF=n
In-Reply-To: <20230320092234.knm2nbdcvrmyhbev@pengutronix.de>
References: <20230318221027.260115-1-u.kleine-koenig@pengutronix.de>
 <20230320092234.knm2nbdcvrmyhbev@pengutronix.de>
Date: Sat, 15 Apr 2023 23:27:39 +0200
Message-ID: <87bkjog7jo.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: kernel test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> writes:

Hello Uwe,

> Hello,
>
> On Sat, Mar 18, 2023 at 11:10:27PM +0100, Uwe Kleine-K=C3=B6nig wrote:
>> The driver needs the include <drm/drm_bridge.h>. WIth CONFIG_OF enabled
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>


> Just noticed: s/WIth/With/. Assuming no further review comments make a
> v2 necessary: Should I resend for that, or can you fixup when you apply
> this patch?
>

No need to resend, I'll fix it when pushing to drm-misc-next.

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

