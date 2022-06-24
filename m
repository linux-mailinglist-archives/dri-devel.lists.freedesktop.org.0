Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5701555A1ED
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 21:37:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7951510F20E;
	Fri, 24 Jun 2022 19:37:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com
 (mailrelay4-1.pub.mailoutpod1-cph3.one.com [46.30.210.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC7F210F20E
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 19:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=qqS6tMVWu0wHA8hLpr0yiEiWQ69Yua84ecNgLZiXe/s=;
 b=TTRUsw9zczug7S+iS0OQDfdh7f47dSDAPJhPlgzpwnYrsm1Pledmm5CmKLmkzDhr+RJo+SgnUuBNK
 V9jVjQ3qmwwxzxqRj2CA69NPjbHVg4+DP6V4+WV24tip9wJVfcjKQHxv8cJ4Hbe9yR2oemAlW+acz5
 dtBGHqEP3/QeXvuygZewn7a2Lbr8HaYOEv7aRvlTbnXwwR3SV5jV/gNWOWDxQIT3rSgHuS0ksCiLIM
 qZ130BIOFkKVCWXJ0PiRtagsKpwe7bWy/hATARM+UicArcShKt27YZWlJla6ULQXLQH6m+VMyghtb5
 s4bROb97npqB/C9kRbHqoNJ1tJZGdiA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=qqS6tMVWu0wHA8hLpr0yiEiWQ69Yua84ecNgLZiXe/s=;
 b=u/IYSHolyWSXQd/S7P5NcgpicAfoBvu9K86QWTTprbKnZkU6nz23dG9oI0VAL2bvHdQcEDCw9RKTO
 iVpfSimCQ==
X-HalOne-Cookie: 8e35d1b101e1b0cccc18e7e1a9e4165ba3e0e37e
X-HalOne-ID: 154b2a12-f3f5-11ec-8233-d0431ea8bb10
Received: from mailproxy2.cst.dirpod4-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 154b2a12-f3f5-11ec-8233-d0431ea8bb10;
 Fri, 24 Jun 2022 19:37:29 +0000 (UTC)
Date: Fri, 24 Jun 2022 21:37:27 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH] drm/ssd130x: Use new regmap bulk write support to drop
 custom bus
Message-ID: <YrYSd5x1JKJJeklJ@ravnborg.org>
References: <20220618174338.2253021-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220618174338.2253021-1-javierm@redhat.com>
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
Cc: Marek Vasut <marex@denx.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Mark Brown <broonie@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Sat, Jun 18, 2022 at 07:43:38PM +0200, Javier Martinez Canillas wrote:
> Data writes for the ssd130x 4-wire SPI protocol need special handling, due
> the Data/Command control (D/C) pin having to be toggled prior to the write.
> 
> The regmap API only allowed drivers to provide .reg_{read,write} callbacks
> to do per register read/write, but didn't provide a way for drivers to do
> the same for bulk read/writes.
> 
> For this reason, a custom regmap bus was used by the driver just to define
> a bulk write callback that implements the D/C pin toggling. But the regmap
> API has been extended to support defining bulk read/write handlers, so the
> custom regmap bus is not needed anymore and could just be dropped.
> 
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Patch looks good, but obviously needs the dependencies sorted out.
Acked-by: Sam Ravnborg <sam@ravnborg.org>

	Sam
