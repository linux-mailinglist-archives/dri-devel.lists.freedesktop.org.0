Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8B8509E7E
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 13:23:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC69B10F3C4;
	Thu, 21 Apr 2022 11:23:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 66947 seconds by postgrey-1.36 at gabe;
 Wed, 20 Apr 2022 13:57:33 UTC
Received: from dog.elm.relay.mailchannels.net (dog.elm.relay.mailchannels.net
 [23.83.212.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 940AF10F123
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 13:57:33 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|ian@linux.cowan.aero
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id 0B90B221E4;
 Wed, 20 Apr 2022 13:57:30 +0000 (UTC)
Received: from pdx1-sub0-mail-a217.dreamhost.com (unknown [127.0.0.6])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id 9261622248;
 Wed, 20 Apr 2022 13:57:29 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1650463049; a=rsa-sha256;
 cv=none;
 b=wDJ8T1RrW94tb3F5q/HjlGw80GQg+akGkxna039IabBkBTnhD8IaXsgVQaoUhRg6YCPgUP
 qRvJVVHb5w+7vEB9eX56tQgVlYa4Gw4Me61lNtJuWA0ZSmcf6sYk8MynE5QZIrqSdqzFYM
 VraEQT5Btu70WQ6H93wMuzSERw+P/1TtVx/NmRNsL51ZAEcyy6weShmLkm818omX4GfsFG
 uluPEEEHXNG5c4cSa1U+Uzqgivjt34FnSCnXLbSISLlynYpogN9kpYXjkRsaDrkaXTC7ao
 5ZQSxizr4x7LJVJ4upcv2URNKO0K6lVirXEY1oEtsp7HO44VKGlrJl4witMJSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net; s=arc-2022; t=1650463049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:dkim-signature;
 bh=CHPbQq9vN2TTJFUujydoe/H+ez6bk4Q+mGjdxo7mNW8=;
 b=QEw+HQbEIMDy41Ks2bdF1yBNkO0WypuQir+a6d5aJvwOAkbSNDy2zI1WryeGNoVoPftbug
 dfHDDQC+n/txSJvFenbaTyM1xUTwCspsGvBIY9zylwqGRXJk7V8GZVXs0Y4BJbnXRqSHFS
 HEBrewAd3bsxkgGyKuMIiTKwD9W7OSpHo77hfZpH0ewmWbp5CzTFK6frQZUBRkl7L4pyvz
 ZOlzAf8xlbTXeJc61V8ZzX5BZy8prJrwhJ4gcZpQVgXiepOBzmk30zse0T6PAovuwi78au
 DvNgv9ljuEbomYaQ8Uh+kNb1/BHc+O5cEsxz2KY1wj4r1Z7Ij2vZkiyASZKbaw==
ARC-Authentication-Results: i=1; rspamd-5fd5798557-rlbc2;
 auth=pass smtp.auth=dreamhost smtp.mailfrom=ian@linux.cowan.aero
X-Sender-Id: dreamhost|x-authsender|ian@linux.cowan.aero
Received: from pdx1-sub0-mail-a217.dreamhost.com (pop.dreamhost.com
 [64.90.62.162]) (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.107.255.147 (trex/6.7.1); Wed, 20 Apr 2022 13:57:30 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|ian@linux.cowan.aero
X-MailChannels-Auth-Id: dreamhost
X-Befitting-Daffy: 459e2e7852abd21c_1650463049877_3672866740
X-MC-Loop-Signature: 1650463049877:3399031275
X-MC-Ingress-Time: 1650463049877
Received: from fedora (unknown [69.12.38.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: ian@linux.cowan.aero)
 by pdx1-sub0-mail-a217.dreamhost.com (Postfix) with ESMTPSA id 4Kk2L06Nf8z1QX; 
 Wed, 20 Apr 2022 06:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.cowan.aero;
 s=dreamhost; t=1650463049;
 bh=CHPbQq9vN2TTJFUujydoe/H+ez6bk4Q+mGjdxo7mNW8=;
 h=Date:From:To:Cc:Subject:Content-Type:Content-Transfer-Encoding;
 b=QEiPUVQ7tdtWKl06YpU9xxp1l4A/SAP1DjpUnbbM0mN68cQI4c4gxtJ+HADc7row+
 Zo1eLRE3S1Qywsddur2GvXVEp8KcPZqQwmBxUeX9uhUfkDnXNZ3HIcglwCPl6/Wv7E
 E5zYWQUAJYze8vti9BqSIN3UW01ogjO2vgTSp7jPkERHsAVS4gVR0MTFgqG0Qp1TAD
 Y075o88UB4ADA17cVoEd9ZQqWTcZ4d1lgN0thP4uSssx0eRWVYbApXVRmXULh6rryF
 TBzEy1I6pv+ELk4vq1vjc4AH6ZyStQd7x3BEpseATJQn3VhljwotCRgXuxwlX4rBrh
 /D451loRC7WnQ==
Date: Wed, 20 Apr 2022 09:57:27 -0400
From: Ian Cowan <ian@linux.cowan.aero>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] Staging: fbtft: Fix style problem in header
Message-ID: <YmARR6+XQeVqlusK@fedora>
References: <20220419192128.445023-1-ian@linux.cowan.aero>
 <20220420064711.xuhuyhtgcrs3avhk@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220420064711.xuhuyhtgcrs3avhk@pengutronix.de>
X-Mailman-Approved-At: Thu, 21 Apr 2022 11:22:59 +0000
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
Cc: gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 20, 2022 at 08:47:11AM +0200, Uwe Kleine-König wrote:
> On Tue, Apr 19, 2022 at 03:21:28PM -0400, Ian Cowan wrote:
> > Removed an unnecessary semicolon at the end of a macro call
> > 
> > Signed-off-by: Ian Cowan <ian@linux.cowan.aero>
> > ---
> >  drivers/staging/fbtft/fbtft.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/fbtft/fbtft.h b/drivers/staging/fbtft/fbtft.h
> > index 2c2b5f1c1df3..aa66760e1a9c 100644
> > --- a/drivers/staging/fbtft/fbtft.h
> > +++ b/drivers/staging/fbtft/fbtft.h
> > @@ -277,7 +277,7 @@ static const struct of_device_id dt_ids[] = {					\
> >  	{ .compatible = _compatible },						\
> >  	{},									\
> >  };										\
> > -MODULE_DEVICE_TABLE(of, dt_ids);
> > +MODULE_DEVICE_TABLE(of, dt_ids)
> 
> In fact the ; after MODULE_DEVICE_TABLE is necessary. There is only a
> single instance in the kernel without a semicolon[1]. That's in
> drivers/pci/controller/pcie-microchip-host.c and this only works because
> this driver cannot be compiled as a module and so MODULE_DEVICE_TABLE
> evaluates to nothing. Will send a patch for that one.
> 
> Best regards
> Uwe
> 
> [1] git grep -E '^[[:space:]]*MODULE_DEVICE_TABLE\([^;]*$'
> 
> -- 
> Pengutronix e.K.                           | Uwe Kleine-König            |
> Industrial Linux Solutions                 | https://www.pengutronix.de/ |

When I built this, it appeared to succeed. I used the command "make
M=/drivers/staging/fbtft modules". Is this incorrect? For reference this
is my first patch so it's highly likely I did this incorrectly.

---
Ian Cowan
