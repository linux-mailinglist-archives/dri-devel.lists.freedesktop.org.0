Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6640BD20258
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 17:18:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F8F010E60A;
	Wed, 14 Jan 2026 16:18:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="i0rLl1bN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 445BF10E60A
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 16:18:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 70A8B600B0;
 Wed, 14 Jan 2026 16:18:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E412C4CEF7;
 Wed, 14 Jan 2026 16:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768407514;
 bh=SZ7IavkDNEXvgqXv1XAkTLGYy5HYR5dOiSBl1PLA3Jg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i0rLl1bNOHsWmbR5IQ0pydA3MIBwAALQs8wPwFcN52/TLP2hBxbaP8bn5oU3YGPnZ
 wR2XBcuhurT3wHsdWCxKSiZb02010ER6GcIFeYFWvVqIQCVCAH25gYgIxOhTA60glF
 YQkPAGCHFdcdjIY0KH/rh4k+4nhiVgFvw7J8hLvO0nMoYsS+hxbEjiUUrb2nQ7ofMx
 gasNLxlNoxC/j+AdoCFBZvKDLA/6ZD9XUDzOKM41SI5TeIXm9ncWG3sy29ltgS79nZ
 PBf76Ufe9qt0qO9k+zDGNiGreJEEQ6rgNgMvKhmRqNSR449UdGI0Z1PQMCz/e6Q/vB
 Djoycq7hth48g==
Date: Wed, 14 Jan 2026 16:18:29 +0000
From: Daniel Thompson <danielt@kernel.org>
To: Junjie Cao <junjie.cao@intel.com>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Pengyu Luo <mitltlatltl@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, caojunjie650@gmail.com,
 kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] backlight: aw99706: Fix build errors caused by wrong
 gpio header
Message-ID: <aWfB1ao4bVyRk97e@aspen.lan>
References: <20260111130117.5041-1-junjie.cao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260111130117.5041-1-junjie.cao@intel.com>
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

On Sun, Jan 11, 2026 at 09:01:17PM +0800, Junjie Cao wrote:
> The driver uses GPIO descriptor API (devm_gpiod_get,
> gpiod_set_value_cansleep, GPIOD_OUT_LOW) but includes the legacy
> <linux/gpio.h> header instead of <linux/gpio/consumer.h>.
>
> When CONFIG_GPIOLIB is not set, <linux/gpio.h> does not include
> <linux/gpio/consumer.h>, causing build errors:
>
>   error: implicit declaration of function 'gpiod_set_value_cansleep'
>   error: implicit declaration of function 'devm_gpiod_get'
>   error: 'GPIOD_OUT_LOW' undeclared
>
> Fix by including the correct header <linux/gpio/consumer.h>.
>
> Fixes: 147b38a5ad06 ("backlight: aw99706: Add support for Awinic AW99706 backlight")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202512171631.uKXlYwqu-lkp@intel.com/
> Signed-off-by: Junjie Cao <junjie.cao@intel.com>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.
