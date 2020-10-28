Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E113D29CFB2
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 12:29:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30D226EC85;
	Wed, 28 Oct 2020 11:29:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0335C6EC85
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 11:29:21 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id e2so4415823wme.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 04:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=WLWDWfUn62HuyKL78MLrBuM1P4gEN0IVPMugnmjyIpc=;
 b=Oj55s1u+HirbuDDCtgGf2TCwNQs1t7Hb/dfEAbtoX4rp6Vi9YOyYi0ZR6vyFEJnv46
 srMzjKdpNzPMuK/b/uwsPoV8xLsInM+031sEoA5Uns+jUhqfFFLnA1zctrfKyId7XHGc
 IbDB6x5ghe+8hsKenVf6Dwci2fYo3m0yskyWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=WLWDWfUn62HuyKL78MLrBuM1P4gEN0IVPMugnmjyIpc=;
 b=fhcprrZ1vQSvGnbN9FRt9FK3gvuzeeBuYuBzVRt3UKGUc7KUV5lK99+fd+RE4QTlmA
 OBkvJyzxClCefar0wzSDlTwGTbGyDeJ1CmCSJxG5H7hZXx09Lrje/tr8GACy794hJ0Xw
 mI78oubyvBFkfTx1JvFhcmcFCbVBjetzzGRYu9pCPWwDBu08kn8F7/B4MjSN2HZeP+rG
 JJ8GuE26sb4JHsUMhcGowBLxfebXA4ulj1kHuBWWkR4z3ti3uThaGuDXdc7H7fOBR91v
 gPzLnWQfd3aJ3E8NQm6ZrRv21VbYkgsLX1xM4xjS0eb45CMRZgvOFRwfuEePYwT0H/4n
 XIqw==
X-Gm-Message-State: AOAM530YQOnciF1UJ8FiE8IfjBZoD36m3dB0rTk+sMHCV6N0L8BFQ+H0
 ACJf9RoizxWepqArLuUz8dgcxQ==
X-Google-Smtp-Source: ABdhPJz+EU8YlisomHF2zSjkLF+2zPf9qTQiMauCyQazYiNEgL02k8jKGZP/kZkcr+tV3wxSwpQU7g==
X-Received: by 2002:a7b:cbc8:: with SMTP id n8mr7567498wmi.186.1603884560710; 
 Wed, 28 Oct 2020 04:29:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g5sm5698229wmi.4.2020.10.28.04.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 04:29:19 -0700 (PDT)
Date: Wed, 28 Oct 2020 12:29:17 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 1/1] drm/vc4: drv: Add error handding for bind
Message-ID: <20201028112917.GW401619@phenom.ffwll.local>
Mail-Followup-To: Maxime Ripard <maxime@cerno.tech>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>, eric@anholt.net,
 airlied@linux.ie, robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com,
 dave.stevenson@raspberrypi.com, sungguk.na@samsung.com
References: <20201027041442.30352-1-hoegeun.kwon@samsung.com>
 <CGME20201027041535epcas1p489bbfe80b461f1e5c5deca1a571f1f35@epcas1p4.samsung.com>
 <20201027041442.30352-2-hoegeun.kwon@samsung.com>
 <20201027145431.zasv2oiydglz3n63@gilmour.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201027145431.zasv2oiydglz3n63@gilmour.lan>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: devicetree@vger.kernel.org, sungguk.na@samsung.com,
 dave.stevenson@raspberrypi.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 27, 2020 at 03:54:31PM +0100, Maxime Ripard wrote:
> Hi,
> 
> On Tue, Oct 27, 2020 at 01:14:42PM +0900, Hoegeun Kwon wrote:
> > There is a problem that if vc4_drm bind fails, a memory leak occurs on
> > the drm_property_create side. Add error handding for drm_mode_config.
> > 
> > Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> 
> Applied, thanks!

Switching over to drmm_ version of this would also be good I think.
Together with the devm_ version for allocating the drm_device you could
delete a pile of that fragile cleanup code.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
