Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F41449F435
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 08:17:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C8A210EC74;
	Fri, 28 Jan 2022 07:17:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1020910EC74
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 07:17:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5FFDDB824CE;
 Fri, 28 Jan 2022 07:17:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A656DC340E0;
 Fri, 28 Jan 2022 07:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1643354222;
 bh=+CQJj+Wy3FyhSrLEQk/MoP9KSnO3ECMLEzZsREv0YV4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U0RXEHZmQYrEOPIZ8T9JblN8HxHUbsBq9lYybraKlnLmvNw4CmQOJP7o1ZHF4pVHS
 byDvoCAIUMMHQ1J9DHwhkDM4C4r6Qj6jWYkslT1jQmINiqHMUEpkNre2SFwQq6Ov03
 f73drERTeNKmbGVB8ldMK92USjuiM53p8dUhR0YA=
Date: Fri, 28 Jan 2022 08:16:59 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 2/5] staging: fbtft: Deduplicate driver registration macros
Message-ID: <YfOYa/vX8cYKQxgo@kroah.com>
References: <20220123175201.34839-1-u.kleine-koenig@pengutronix.de>
 <20220123175201.34839-3-u.kleine-koenig@pengutronix.de>
 <20220127213607.xbggvbm454u7qfid@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220127213607.xbggvbm454u7qfid@pengutronix.de>
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
Cc: linux-fbdev@vger.kernel.org, kernel@pengutronix.de,
 Noralf Tronnes <notro@tronnes.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 27, 2022 at 10:36:07PM +0100, Uwe Kleine-König wrote:
> Hello Greg,
> 
> On Sun, Jan 23, 2022 at 06:51:58PM +0100, Uwe Kleine-König wrote:
> > The two macros FBTFT_REGISTER_DRIVER and FBTFT_REGISTER_SPI_DRIVER
> > contain quite some duplication: Both define an spi driver and an of device
> > table and the differences are quite subtle.
> > 
> > So create two new macros and use both twice.
> > 
> > Link: https://lore.kernel.org/r/20220118181338.207943-2-u.kleine-koenig@pengutronix.de
> > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> You picked this patch into your staging-next branch, I guess from the
> original submission. Not sure how Mark wants to continue with the series
> from this thread, but at least my plan was that he will create an
> immutable branch on top of 5.17-rc2 (assuming 5.17-rc2 will contain
> "staging: fbtft: Fix error path in fbtft_driver_module_init()") with the
> remaining 4 patches in this series.

That's fine, I can pull from that.

> In a private mail you agreed to this procedure, but this didn't stop you
> taking this patch?! What is your plan here? The obvious (to me) options
> are:
> 
>  - Delay this series until after the next merge window.
>  - You back out this patch from staging-next and ack here for Mark to
>    apply it to an immutable branch.
>  - You keep this patch in staging-next and still ack here for Mark to
>    apply it to an immutable branch. Then the patch would be included
>    twice.

Included twice is fine, or I can revert it in the staging tree.

Don't let staging tree issues prevent you from doing real work in the
other part of the kernel, I can manage merges and other issues like this
very easily.

thanks,

greg k-h
