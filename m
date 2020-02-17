Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BB6161CD0
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 22:34:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DC856E062;
	Mon, 17 Feb 2020 21:34:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E46BE6E062
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2020 21:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds201912;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LSG1Iq8N1obR+YR75qqHS+7aBiuBOgINdCLfFhtere0=; b=GZUkM4FU4wWE5TjMqeAF2RLscV
 IrWHrslEgjKlTdqvA+HBGnMVdN1KLqAxUfYfUNJLxso5M+OdSty4KBNiiIWCjPpCBLE2As7QmrbFn
 egHhazv+JNV7/mprsHjjOE473PHUJNNfmGXKlByIXQDx/VCsPTWia+BEcul2+g/AkFRZpdiCFPgFj
 v+ZoK6L72kiJ3rypxpdYnsqskeD2zYeevFQoVsG9hermTtNOnQX2ye+2TvNMbAqM2vHfrFUv6VpBr
 iDYoyfN1l4V5WWK1XTldhF5WbkRssRWcr9PD+CUi8B6INELKlqnFzdvGkS3LzM2uUeTnlDnpmljwg
 3b6mz2JA==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:56860
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1j3o1g-0007qk-MZ; Mon, 17 Feb 2020 22:34:00 +0100
Subject: Re: [RFC 1/9] regmap: Add USB support
To: Mark Brown <broonie@kernel.org>
References: <20200216172117.49832-1-noralf@tronnes.org>
 <20200216172117.49832-2-noralf@tronnes.org>
 <20200217121149.GB9304@sirena.org.uk>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <f9cb6d05-300b-f6c8-8f88-2e6c014c1ba3@tronnes.org>
Date: Mon, 17 Feb 2020 22:33:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200217121149.GB9304@sirena.org.uk>
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



Den 17.02.2020 13.11, skrev Mark Brown:
> On Sun, Feb 16, 2020 at 06:21:09PM +0100, Noralf Tr=F8nnes wrote:
> =

>> Add support for regmap over USB for use with the Multifunction USB Devic=
e.
>> Two endpoints IN/OUT are used. Up to 255 regmaps are supported on one USB
>> interface. The register index width is always 32-bit, but the register
>> value can be 8, 16 or 32 bits wide. LZ4 compression is supported on bulk
>> transfers.

>> +static int regmap_usb_write(void *context, const void *data, size_t cou=
nt)
>> +{
>> +	struct regmap_usb_context *ctx =3D context;
>> +	size_t val_len =3D count - sizeof(u32);
>> +	void *val;
>> +	int ret;
>> +
>> +	/* buffer needs to be properly aligned for DMA use */
>> +	val =3D kmemdup(data + sizeof(u32), val_len, GFP_KERNEL);
>> +	if (!val)
>> +		return -ENOMEM;
>> +
>> +	ret =3D regmap_usb_gather_write(ctx, data, sizeof(u32), val, val_len);
>> +	kfree(val);
>> +
>> +	return ret;
>> +}
> =

> This looks like you just don't support a straight write operation, if
> you need to do this emulation push it up the stack.
> =


After going through the stack I realise that I have a problem.
What I have failed to fully comprehend is this regmap requirement:

	if (val_len % map->format.val_bytes)
		return -EINVAL;

There will be a spi and i2c driver down the line which will transfer
buffers of any size, and having to use 8-bit register values will not be
great.

When I started writing regmap-usb 6 months ago I didn't know where it
would take me. The result is now a Multifuntion USB device with an mfd
driver. So, no usage except for the children of the mfd device.

Dropping regmap won't lead to any increased code size to speak of, so
instead of trying to make regmap match my use case, I think I'll put
this code inside the mfd driver.

Oversights like this was one of the things I was hoping to unearth with
this RFC.

Thanks,

Noralf.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
