Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA870161D34
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 23:15:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C68A86E108;
	Mon, 17 Feb 2020 22:15:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10BA36E108
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2020 22:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds201912;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GnkgcqeZphOxYgQpECAwgmV1/mc+6TKBQf+yL2zPq5I=; b=BN6FPH2xuC3RYkerIRemXouw5L
 0o6GzyRmjN3fwc3/IPl9dfWsFuiBTac8zyAhlQzSSrh9stMp/YdldivMbMGfhdv2iHo1p3H+FGa29
 8UeIcIH/XYU1Zdq0XkQMzRO2xAw9uM50ZqV+HbT9RImhPzRrGk/uDXAIkhRj3hSfMXtxE/q4O7jle
 lxLs+e/CfjDMc5SEcLr6AYdZDCMvTmAmrwxpzaMDGzi+/WmbS1BzHq/vjp4laVQqa2syMnUFTC+YV
 ERmKWiy5STcUPwVMZpLGZkh1Zoh5Czk3nBMrHsQrvSw83NPteaQx9a9MOsvpxJZSZadoAqpQqcC4u
 Me5+WxlA==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:56978
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1j3ofy-0000Kz-5I; Mon, 17 Feb 2020 23:15:38 +0100
Subject: Re: [RFC 1/9] regmap: Add USB support
To: Mark Brown <broonie@kernel.org>
References: <20200216172117.49832-1-noralf@tronnes.org>
 <20200216172117.49832-2-noralf@tronnes.org>
 <20200217121149.GB9304@sirena.org.uk>
 <f9cb6d05-300b-f6c8-8f88-2e6c014c1ba3@tronnes.org>
 <20200217213911.GV9304@sirena.org.uk>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <34adf00c-a465-6d6d-23bd-a2a00290c1fa@tronnes.org>
Date: Mon, 17 Feb 2020 23:15:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200217213911.GV9304@sirena.org.uk>
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
Cc: balbi@kernel.org, linux-usb@vger.kernel.org, lee.jones@linaro.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 17.02.2020 22.39, skrev Mark Brown:
> On Mon, Feb 17, 2020 at 10:33:58PM +0100, Noralf Tr=F8nnes wrote:
>> Den 17.02.2020 13.11, skrev Mark Brown:
> =

>>> This looks like you just don't support a straight write operation, if
>>> you need to do this emulation push it up the stack.
> =

>> After going through the stack I realise that I have a problem.
>> What I have failed to fully comprehend is this regmap requirement:
> =

>> 	if (val_len % map->format.val_bytes)
>> 		return -EINVAL;
> =

>> There will be a spi and i2c driver down the line which will transfer
>> buffers of any size, and having to use 8-bit register values will not be
>> great.
> =

> Out of interest why are 8 bit registers going to be a problem?
> =


I have written 3 drivers so far and they all have some registers that
need to deal with values larger than 255. If I would need to add a lot
of code because of dropping regmap, then I would have looked at ways to
work around this in order to keep regmap, hi/lo registers perhaps with
wrapping access functions. But it looks like the LOC won't change much,
I need a few lines to ensure values are little endian, but I can also
remove some lines that's not needed anymore.

Noralf.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
