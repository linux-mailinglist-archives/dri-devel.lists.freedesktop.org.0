Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 508074470A3
	for <lists+dri-devel@lfdr.de>; Sat,  6 Nov 2021 22:19:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83C4C6E0EF;
	Sat,  6 Nov 2021 21:19:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 964 seconds by postgrey-1.36 at gabe;
 Sat, 06 Nov 2021 21:19:10 UTC
Received: from outbound5g.eu.mailhop.org (outbound5g.eu.mailhop.org
 [18.156.67.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 222966E0EF
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Nov 2021 21:19:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1636232582; cv=none;
 d=outbound.mailhop.org; s=arc-outbound20181012;
 b=fKJbcRSPvivzXzpjFClwcWraeKec1c8V8Z2T24B+QaBS9o0DEE6RJjnK25jzmWiAz/XVCc7If3UAD
 kqzl/Csv2WyTyykWRUIxtWkekJzvQhNQBi9xC1J2osnkz/DtZiBPgqbqihQ8N0rSwQSlVCjjrDLLr1
 ORY3DW2h7TqxVvFgEqHkxFJJWBP11kBViKnbQzisq775QHhLcVrh33Bme66DJuHttVohwx7gPQyq7C
 j1P2Vy9LiIY00t60Y19mwhtxiFyCBxmFCRu1SXts/fAMNMvB+AhS9KfAsx14/vVs8qP/vNzSZZN/8o
 e5xPBnMqXf5v0Paz7nGoV08WUNPIIGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=outbound.mailhop.org; s=arc-outbound20181012;
 h=content-type:mime-version:message-id:in-reply-to:date:references:subject:cc:
 to:from:dkim-signature:dkim-signature:from;
 bh=0MBGuzUkLcp0R0JFWcdoVV3M1cQOHai/JPSjIYTAT8E=;
 b=mzN9jwicxZdDLtceUZKcpwKopJQkNcWh0HH54H1IzzS2UhD8LTtA20Jh0QHMdkyEgqQPGy69ogThH
 OSxqigGe+TiHpHbspGQk3xEYdL0AbUNf4VtMnBdWgf0815TNTXeTH8vZldBvWNRBVLIwECxVEhgHKq
 JJGFTFjafDOeS3u+4aBwhqh0WNpZGevPnZbC+nv/fqfhCWFx+6EhhsXdHazvMeSkyIdMjJ+mUzHsVJ
 eW85eXTQa4sJKiW6wAv4HEjXr6OfYCfi7pUsvXlY3pdUyyxpnd+OYgGa5t3I8xBKUgnA9h3EKn+NoR
 NUH7Yh5Z2oNGtej2/4+p+nXyAfKZ+0Q==
ARC-Authentication-Results: i=1; outbound2.eu.mailhop.org;
 spf=pass smtp.mailfrom=stackframe.org smtp.remote-ip=91.207.61.48;
 dmarc=none header.from=stackframe.org;
 arc=none header.oldest-pass=0;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stackframe.org; s=duo-1634547266507-560c42ae;
 h=content-type:mime-version:message-id:in-reply-to:date:references:subject:cc:
 to:from:from; bh=0MBGuzUkLcp0R0JFWcdoVV3M1cQOHai/JPSjIYTAT8E=;
 b=MVqmXoMdVPr7cf5dEXFnQGQ/b/K3TFDlLpBsANZKMNOSd426sTwfscBZCL6x1jd0gZrJhBxRLyiVW
 ONmy8o+JB/9pgS/3o+/MLaeLKok+Woick18FiCFiTPN7yfAjOYDCGKILgWPgSddrwFp9G82KxdoR0r
 O+i5scGa9B/PGW2g=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=outbound.mailhop.org; s=dkim-high;
 h=content-type:mime-version:message-id:in-reply-to:date:references:subject:cc:
 to:from:from; bh=0MBGuzUkLcp0R0JFWcdoVV3M1cQOHai/JPSjIYTAT8E=;
 b=kgUMDCynqrfNJUhtOXrwIKd0nM4Bn6P6iH1Jr2BapSnZkpN95suqxlX7GpSy0KmwkRBfgqi3u4PrG
 QDYq+XtE+MRCbO4tyWtERXJr7H1CcNUgzgSPHFScWQuKrS88QYoXmt5XXcdD7NmGx/pQ1AdC5qZ9sn
 Xlb7q9RaM2khbnyly+9Wp8c8DqIU6NADE82Rl5xbMP8MQdILVohmDXo2SB2JNPh6xGcwoNQD7K2SCa
 7xQz04ZwXWJmJHdEKOF8n/bV3LAk820zqo9dD2sk74Xl3y5cRMxRdujTrNw8vYQfRVCeS8kuwOoipJ
 3DHcHHflvS7RxEmjdod+/zGWBugSXXQ==
X-Originating-IP: 91.207.61.48
X-MHO-RoutePath: dG9ta2lzdG5lcm51
X-MHO-User: ec6f18a5-3f44-11ec-a072-973b52397bcb
X-Report-Abuse-To: https://support.duocircle.com/support/solutions/articles/5000540958-duocircle-standard-smtp-abuse-information
X-Mail-Handler: DuoCircle Outbound SMTP
Received: from mail.duncanthrax.net (propper.duncanthrax.net [91.207.61.48])
 by outbound2.eu.mailhop.org (Halon) with ESMTPSA
 id ec6f18a5-3f44-11ec-a072-973b52397bcb;
 Sat, 06 Nov 2021 21:03:00 +0000 (UTC)
Received: from hsi-kbw-109-193-149-228.hsi7.kabel-badenwuerttemberg.de
 ([109.193.149.228] helo=x1.stackframe.org.stackframe.org)
 by mail.duncanthrax.net with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <svens@stackframe.org>)
 id 1mjSq3-00DrWQ-3h; Sat, 06 Nov 2021 23:02:59 +0200
From: Sven Schnelle <svens@stackframe.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH/RFT] fbdev driver for HP Visualize FX cards
References: <20211031195347.13754-1-svens@stackframe.org>
 <cd0f90d9-7dba-af33-f88b-289fc6f80b51@suse.de>
 <87r1c0s1bt.fsf@x1.stackframe.org>
 <e21cdf83-2178-7c59-2585-a6012f861f68@suse.de>
Date: Sat, 06 Nov 2021 22:02:57 +0100
In-Reply-To: <e21cdf83-2178-7c59-2585-a6012f861f68@suse.de> (Thomas
 Zimmermann's message of "Mon, 1 Nov 2021 10:33:12 +0100")
Message-ID: <87o86x80am.fsf@x1.stackframe.org>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-fbdev@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 linux-parisc@vger.kernel.org, Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Hi
>
> Am 01.11.21 um 09:54 schrieb Sven Schnelle:
>> Hi Thomas,
>> Thomas Zimmermann <tzimmermann@suse.de> writes:
>> Thanks, i wasn't aware as i normally don't do any graphics related
>> development. I take a look at dri and port the driver, which is
>> hopefully not too hard.
>
> Sounds good.
>
> The one big difference when converting is that DRM really wants
> drivers to support 32-bit XRGB colors. It's not a DRM limitation per
> se, but a requirement of today's userspace programs. AFAICS your fbdev
> driver uses a 256-color palette format. So the DRM driver would have
> to convert
> XRGB8888 to 8-bit RGB332 and install a corresponding palette. Don't
> worry, it's easy. Take a look at the cirrus driver for a simple DRM
> driver. [1]

I have converted the driver, but am using FORMAT_C8 because i haven't
figured out yet how to switch the card to XRGB8888. That's still on the
TODO list.

One question about hw blitting: with the old fbdev framework one could
replace the fb_imageblit function. For normal console text, this
function gets called with a monochrome bitmap, and an fg/bg color value.
This makes it easy to use HW accelerated blitting for text. In the
gpu/drm drivers i think i found only one driver (nouveau) doing this and
that was via the drm fbdev layer.

Is that still the way to go, or is there a better way to do HW accelerated
text blitting?

Thanks
Sven
