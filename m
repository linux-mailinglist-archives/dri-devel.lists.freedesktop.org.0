Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D49EAE3EEC
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 14:03:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E95FA10E383;
	Mon, 23 Jun 2025 12:02:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=gert.wollny@collabora.com header.b="MbwXf5+O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D04B10E386;
 Mon, 23 Jun 2025 12:02:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1750680167; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=YH4sFFDjORTCbDM4u5fyy9J6JR0S7GL5W1BoMk2HUurVuUccMNx03GXg7TbrAajidA3YPS/mdwHl9XP862u0IP1ww/Ox313PhN929auapZRG/Jj1DrTiwrNjx+BOtWlv2FYaf2A+9cHrw7eaq4UQhCj/Px19RkRcA4tYc4yU0Ok=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1750680167;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=+2G5Oc8bg9km4uo1iR9FAfo0ipQPmDTdZujVVUvZ5XE=; 
 b=kOXZAlZFX/PkvRe6bGJnTHkfYb+I8hIkP0Qf0a5UkIvN2zT3T/YP4bn2bqBgay8wER6zsPM4FuhDmuaQEkbwg8u4hC10T2r0bw7FijEBj/Bh6lmvfoxQgyTd5Nzcw6LjJMaZVPMNi7/KhhUb64QtE3BYXv7StBum+IYL7YwVlR4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=gert.wollny@collabora.com;
 dmarc=pass header.from=<gert.wollny@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750680167; 
 s=zohomail; d=collabora.com; i=gert.wollny@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=+2G5Oc8bg9km4uo1iR9FAfo0ipQPmDTdZujVVUvZ5XE=;
 b=MbwXf5+OHY+Z3psfEVqbT9vl0YWx21ykiHELbMkLpRdfCr1bkwzDxCn78QBFb9HX
 EGYFuDqAPnzZNYTT5GrDcFyy1GaAciy7FZPEIeUce/QEXxbsqOTdzYgLriTouDIqJbD
 4nvn+cbECL7gDWrPueO9SIwyKEWafsSo2fvJDMEg=
Received: by mx.zohomail.com with SMTPS id 1750680164845368.277656923059;
 Mon, 23 Jun 2025 05:02:44 -0700 (PDT)
Message-ID: <7c8b78f040d872f7f119f849e7969a7f2a4e9c86.camel@collabora.com>
Subject: Re: [PATCH v2 5/6] drm/etnaviv: Add PPU flop reset
From: Gert Wollny <gert.wollny@collabora.com>
To: Lucas Stach <l.stach@pengutronix.de>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Date: Mon, 23 Jun 2025 14:05:07 +0200
In-Reply-To: <3197df27de7438c67558060414bff16662cb155a.camel@pengutronix.de>
References: <20250618204400.21808-1-gert.wollny@collabora.com>
 <20250618204400.21808-6-gert.wollny@collabora.com>
 <3197df27de7438c67558060414bff16662cb155a.camel@pengutronix.de>
Organization: Collabora Ltd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 
MIME-Version: 1.0
X-ZohoMailClient: External
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

On Fri, 2025-06-20 at 22:22 +0200, Lucas Stach wrote:
>=20
> > @@ -1807,6 +1808,11 @@ static int etnaviv_gpu_bind(struct device
> > *dev, struct device *master,
> > =C2=A0		ret =3D -ENXIO;
> > =C2=A0		goto out_sched;
> > =C2=A0	}
> > +
> > +	if (etnaviv_flop_reset_ppu_require(&gpu->identity) &&
> > +	=C2=A0=C2=A0=C2=A0 !priv->flop_reset_data_ppu)
> > +		etnaviv_flop_reset_ppu_init(priv);
> > +
> I don't see why you would need to do this in the bind callback. You
> should be able to move this to etnaviv_gpu_init(), so you have the
> needed identification data. gpu_init is also executed serially over
> all GPUs in the device, so there is no problem with potential races
> there.

I moved this here because you wrote before:=20

> But then you should allocate this buffer
> in etnaviv_gpu_bind to avoid races between GPUs starting up and=20
> trying to allocate this global memory.

If etnaviv_gpu_init() is fine, I'll move it there.=20

Regards,
Gert=20

