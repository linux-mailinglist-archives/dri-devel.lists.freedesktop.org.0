Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0FC2D4C89
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 22:10:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1C1C89CAF;
	Wed,  9 Dec 2020 21:10:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8731589CAF
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 21:10:51 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id r3so3279167wrt.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Dec 2020 13:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QI5Qb3WEseNBh0hX2/hkl+dBOl/zJXauNrsskhAm/zU=;
 b=gZkNWKv2nc/iteQ4TtsQ7PZllG26GQrEkdppOZaKrDLO/L/fSuL/B1jvORwSoLd0zQ
 ZvDlvVXfcWnAvVGK22V9gjPCF7Boy3Bg2PxS7nYKzj/AM5Y4F/vaoAc3ZP+oQnvsZbSk
 MDljYQrNTpYRIaEAknw/o/ifhGrwNHckwohu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QI5Qb3WEseNBh0hX2/hkl+dBOl/zJXauNrsskhAm/zU=;
 b=QRUtlppKGFC1/yODJnuuw6RDEGxwdvo8XB/5ZIV28UQEhmu05LBTtPSVCXMF1G++xS
 yx2AXsdZ4sVFXb1k+vi8hYuPCjsOPFrXqvWg33rGIJD4svJGfo3zV6uBiGujQRTOQBZH
 ehkcd4fKY/KRbsIjvXZc/Dd+/w7/2IkAVkq6YEIrrNHxeLVjTSi5JWwIHbnJpdYmTvgl
 YxBQ2j0yc+4hUFTBG5Jp8RfenETfFYblylDrpnV6jl0OGAk/tzcaEDdbs6fit/zVqyLV
 gxQwLQS7440gN4xl2Pu4FRzYyjOzAMuKk4SGfiEzeSPQ29dnwFKpk073GsPSlnsV5MTm
 UsiQ==
X-Gm-Message-State: AOAM532MUN0oI3bivI0nhlo1DwL8JDWlzwFxVUZtvtOP2+aMuWlSPNKP
 +hEwpp+I+mbgf8F3zk91qrd6jQ==
X-Google-Smtp-Source: ABdhPJyxujed80JjnfcamVCtZAOPd4oxfGHymKYlCKP6riUFUUAXcTvfV2T5y4aA5wbcIv81uIRknw==
X-Received: by 2002:adf:ee4a:: with SMTP id w10mr3216903wro.81.1607548250185; 
 Wed, 09 Dec 2020 13:10:50 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h5sm6217432wrp.56.2020.12.09.13.10.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 13:10:49 -0800 (PST)
Date: Wed, 9 Dec 2020 22:10:47 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v4 00/19] drm: managed encoder/plane/crtc allocation
Message-ID: <20201209211047.GA401619@phenom.ffwll.local>
References: <20201208155451.8421-1-p.zabel@pengutronix.de>
 <4dbb86ffa92f7e1ab0a628a5ab09b91a265e64fc.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4dbb86ffa92f7e1ab0a628a5ab09b91a265e64fc.camel@pengutronix.de>
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
Cc: kernel@pengutronix.de, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 08, 2020 at 04:59:16PM +0100, Philipp Zabel wrote:
> On Tue, 2020-12-08 at 16:54 +0100, Philipp Zabel wrote:
> > Hi,
> > 
> > this is an update of the drmm_(simple_)encoder_alloc(),
> > drmm_universal_plane_alloc(), and drmm_crtc_alloc_with_plane()
> > functions in v3 [1] together with the imx-drm managed allocation
> > conversion from [2] as an example usage.
> > a bit.
>   ^^^^^^
> this is a left-over of ", reordered an squashed a bit." before I decided
> to move it into the list of changes below.
> 
> > 
> > Changes since v3:
> [...]
> >  - Reorder and squash the imx-drm managed allocation conversion patches
> >    to use the new functions directly.

imx parts all look good. One thing I spotted is that you could use
devm_drm_dev_alloc instead of drm_dev_alloc, at least my tree here doesn't
have that one yet. Feel free to add a-b: me on top of the imx patches too,
but probably not worth much :-)
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
