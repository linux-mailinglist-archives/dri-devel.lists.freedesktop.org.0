Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0BA441D14
	for <lists+dri-devel@lfdr.de>; Mon,  1 Nov 2021 16:03:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CFA06EC07;
	Mon,  1 Nov 2021 15:03:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1844 seconds by postgrey-1.36 at gabe;
 Mon, 01 Nov 2021 10:11:32 UTC
Received: from outbound5h.eu.mailhop.org (outbound5h.eu.mailhop.org
 [18.156.94.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E8E489915
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Nov 2021 10:11:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1635761489; cv=none;
 d=outbound.mailhop.org; s=arc-outbound20181012;
 b=Hx2JJQV3XfNus3UOlNO2ER4TfLcptWcRZWJC3WxFGLmJBEbqOKbawWomsyU1x+7VcdrzOZrMijX57
 DQwlnmIunMVq/9CMTp6vWaXT4TPnvBdyQhCZIYRMevUqwnmZvrPAzw/vV7RWsPNYMlhAGxQJjg8paW
 Pn5KSB2eHfbVKF7lC6Ot11bv7Ip0vpg3EBaJwR+H0v9rifiDfg2uOvdIu3on472DMtfP9wUtqeawFV
 0fQYE9ITqmvmRwY4/QatVaxBOXc4O+Q7ymH+M4FpSZGdYUQjULbDyoAYIaWgohldp5l3kZhSvpqE4S
 7VOZa+DVqN9r8GnMHEMW7VMvkWHJVNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=outbound.mailhop.org; s=arc-outbound20181012;
 h=content-type:mime-version:message-id:in-reply-to:date:references:subject:cc:
 to:from:dkim-signature:dkim-signature:from;
 bh=qo6OKJzPQ3GHXEjx4uWdACygWPEVR6iwuI1csc2XXxY=;
 b=qcDMnfNaONS+lPowMVqlVo0xk9q9e3lBr9n38nO2gHojeu/+t3e+1yqZ5D5RlIrWsAOs+tc0sTLXz
 QXpHBoUhHNocqihB35jUaq36kWpEju8ms9dN5KaJaX+rQhZSRZCGjyYR474dbP/5/fs6vqHhAwtJIb
 LVCo/z1yAKKB4I6ZHJ4LtrYh1xLvhRQdmNTntBGF6jY98s6EqCmvIEvffBEzGOMcPJJ/SuMsOihJSK
 k0ogFHxcL8FTlqSXUSjF89iFc8itK2td0S/qw+hVAEx5T1+6UJ9S1y1gvtrD4TIGG1idEKcpzJ8DJm
 buhBC9jlvWk6/UlUwY9ZaVHQTWVCtUg==
ARC-Authentication-Results: i=1; outbound2.eu.mailhop.org;
 spf=pass smtp.mailfrom=stackframe.org smtp.remote-ip=91.207.61.48;
 dmarc=none header.from=stackframe.org;
 arc=none header.oldest-pass=0;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stackframe.org; s=duo-1634547266507-560c42ae;
 h=content-type:mime-version:message-id:in-reply-to:date:references:subject:cc:
 to:from:from; bh=qo6OKJzPQ3GHXEjx4uWdACygWPEVR6iwuI1csc2XXxY=;
 b=FUvOI540IO8bFt9BR0u1hp24YJbSAx2d9o+YtyF0cu35AXOK855TQD7s5+HC0WABD9XnimaRAa3WV
 IMv0OnHfpAuOu2rqfVlMVfiL29NdJ9jBgLmsINjn/8oN1NvjzSZp7GWbSpSVvWrP3+CiB5HOFQ2OP3
 XU2F83hAD7zhQ4xA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=outbound.mailhop.org; s=dkim-high;
 h=content-type:mime-version:message-id:in-reply-to:date:references:subject:cc:
 to:from:from; bh=qo6OKJzPQ3GHXEjx4uWdACygWPEVR6iwuI1csc2XXxY=;
 b=ckGeLFW1SVOpGcu9I7un5bAOotVzuRwBmkSJQ/RMHZVtJYGWVO4jXsGA62KduNdIz4Z2hZGDeanyb
 Pigml/UUhH5x2FAVkWmONRvymDzOzrxoFOt1iVVEfBMX4oiHNw8OGj55CcYtrsOWZc16Cbc0YSavnS
 waOMwirjrBxqeebtfIAWL5orV67p7fYEcuaHpOZoO315gd0HjBj5u/puJpCgjQTUwfcH2rdZdw8X0I
 Kw9k8PJf/vTdVhssySNtqZnDCUEV4GlH2cBFMS8a0Pp4Uz1b72o54CppuGdsGUIL5eeCMI/xuF9RIK
 HjPMxE1n+S/0q1YZj5OKo3tOzYH4BJg==
X-Originating-IP: 91.207.61.48
X-MHO-RoutePath: dG9ta2lzdG5lcm51
X-MHO-User: 12a54a57-3afc-11ec-a070-973b52397bcb
X-Report-Abuse-To: https://support.duocircle.com/support/solutions/articles/5000540958-duocircle-standard-smtp-abuse-information
X-Mail-Handler: DuoCircle Outbound SMTP
Received: from mail.duncanthrax.net (propper.duncanthrax.net [91.207.61.48])
 by outbound2.eu.mailhop.org (Halon) with ESMTPSA
 id 12a54a57-3afc-11ec-a070-973b52397bcb;
 Mon, 01 Nov 2021 10:11:26 +0000 (UTC)
Received: from hsi-kbw-109-193-149-228.hsi7.kabel-badenwuerttemberg.de
 ([109.193.149.228] helo=x1.stackframe.org.stackframe.org)
 by mail.duncanthrax.net with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <svens@stackframe.org>)
 id 1mhUHl-00DInm-DH; Mon, 01 Nov 2021 12:11:25 +0200
From: Sven Schnelle <svens@stackframe.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH/RFT] fbdev driver for HP Visualize FX cards
References: <20211031195347.13754-1-svens@stackframe.org>
 <cd0f90d9-7dba-af33-f88b-289fc6f80b51@suse.de>
 <87r1c0s1bt.fsf@x1.stackframe.org>
 <e21cdf83-2178-7c59-2585-a6012f861f68@suse.de>
Date: Mon, 01 Nov 2021 11:11:23 +0100
In-Reply-To: <e21cdf83-2178-7c59-2585-a6012f861f68@suse.de> (Thomas
 Zimmermann's message of "Mon, 1 Nov 2021 10:33:12 +0100")
Message-ID: <87lf28rxro.fsf@x1.stackframe.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Mon, 01 Nov 2021 15:03:36 +0000
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

Hi Thomas,

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Am 01.11.21 um 09:54 schrieb Sven Schnelle:
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
> XRGB8888 to 8-bit RGB332 and install a corresponding palette.

Right now the driver only supports 8 bit pseudocolor, because i wanted
to start with something easy to get the kernel fbcon running. I have no
idea (yet) how to switch the card into other color formats. And neither
how to do pseudo color with drm. But i'll figure it out i guess.

> Don't worry, it's easy. Take a look at the cirrus driver for a simple DRM
> driver. [1]

Great, i also picked that driver as a template. :-)

Thanks for your help and pointers, much appreciated!

Sven
