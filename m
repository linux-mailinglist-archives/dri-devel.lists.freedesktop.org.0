Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CE4441D81
	for <lists+dri-devel@lfdr.de>; Mon,  1 Nov 2021 16:40:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91FF16E4A5;
	Mon,  1 Nov 2021 15:40:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 23408 seconds by postgrey-1.36 at gabe;
 Mon, 01 Nov 2021 15:40:54 UTC
Received: from outbound5e.eu.mailhop.org (outbound5e.eu.mailhop.org
 [52.28.168.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C07EA6E4A5
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Nov 2021 15:40:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1635756878; cv=none;
 d=outbound.mailhop.org; s=arc-outbound20181012;
 b=GHOpMB2yRkR2IwdBCP2QvTbNvx/b46ES55jWKaaHKoLt0flU6SrRXYrRtt7K1nwBL8YD4uDkUwxho
 TFGYi5bRF86WTRL4WkqVgjfnKzsNtjkZjYP1XhICvMzTrewQtEi1srdG2BgU1bZaYMAjyUEXasFXmA
 C1q5SO8iajf4rGfF8u0+Jb0tyM3hH8T9xd3Zounv+ln24Fs3hCOkku7o92yB+MZZbmGLwI/MaqUITJ
 wMNMY3JGpQQrHyUX2fjOqIj3MAqjNEXmNlRMNYce0C+SzkElZe0O7b9d4t5f37SEVkGfqskK49e1Bq
 xNKx1XWCvHV3C0Wzw+LUNuAYoK5bptw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=outbound.mailhop.org; s=arc-outbound20181012;
 h=content-type:mime-version:message-id:in-reply-to:date:references:subject:cc:
 to:from:dkim-signature:dkim-signature:from;
 bh=U/T3aMOfisAvCp+Jrrv8IHsVMGPDCr1S7PcDgSgM39I=;
 b=tGDEfMN0yyvphA8sCPt0/3YdPD7idv9ZSBWj9wWAmN/PMN5nQBd0VXuB6z7dMg1z/WHPaKRyR61wr
 ELTD+JnjPXFtBuLzV8nDPZNEBn57/Gu8CTSY4jnkdyHsg69E48ultIKM2T6EIkryOrQDJicuIQzsun
 FGmh8Ma6jVXWDX1XDbaSiGANHoxg4GHF+ngfqN93YWEX2a2BWn3dP0wGcBxUgVbS+k0KkGJ30NDVr6
 BinX8/qI1CVp2i1Yu3OKBhRTRA7Yg2M+VRcxagFeG47Hp1NJ9ewjzLn9LCCraPwEw8JFcHth2l2dzX
 EEfooypjPEAb4DrbQDy66CNg8WhMPmA==
ARC-Authentication-Results: i=1; outbound2.eu.mailhop.org;
 spf=pass smtp.mailfrom=stackframe.org smtp.remote-ip=91.207.61.48;
 dmarc=none header.from=stackframe.org;
 arc=none header.oldest-pass=0;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stackframe.org; s=duo-1634547266507-560c42ae;
 h=content-type:mime-version:message-id:in-reply-to:date:references:subject:cc:
 to:from:from; bh=U/T3aMOfisAvCp+Jrrv8IHsVMGPDCr1S7PcDgSgM39I=;
 b=jQxRhkypWDINtYqQriPAbDixpNmKm1jyQ1nohPw+7/fsyXlLtfSRyPAToyKj4WGhXzGVLx2OG5H9/
 WwjDSCbxa7pbcN2vRhlvXIpXhWyimmtH3Ak49+9sErVydyUQ45H9PeVh/ADEi5nY2CbO+P0LIBQ4eq
 Vpncd/lQKwlpatp0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=outbound.mailhop.org; s=dkim-high;
 h=content-type:mime-version:message-id:in-reply-to:date:references:subject:cc:
 to:from:from; bh=U/T3aMOfisAvCp+Jrrv8IHsVMGPDCr1S7PcDgSgM39I=;
 b=P9VaAvkLh5+XCyblcg8hABgvTRxKChxuB/Si0oXHQMrCGKq28hgHvn2WryIzOl8j/567YRvGcKwRm
 yw9RSaRs3hOhHtQtNMeyZIloXBFzEjf4+UT9dEE8w21z38an64BawA//wUYChEX89X0+phJvkJLucH
 9U3S8pYSoop1ASPQZ0k34sI1f9AtBnX5+llJO3kbp7ZIBj7+kvDSINbFbd7H3GZWzk76uRAleIdE0H
 h1O9Fe+xdeJHsij2nbPKOAGDms34RFnX2tcmGOvz4gW8wnCmxzYPquSXo7BfonrrAzh5MyOIYRBNKa
 /00TDrJ5dWWcMOcoGykJ/yjNNlWf1TQ==
X-Originating-IP: 91.207.61.48
X-MHO-RoutePath: dG9ta2lzdG5lcm51
X-MHO-User: 553ce03f-3af1-11ec-a070-973b52397bcb
X-Report-Abuse-To: https://support.duocircle.com/support/solutions/articles/5000540958-duocircle-standard-smtp-abuse-information
X-Mail-Handler: DuoCircle Outbound SMTP
Received: from mail.duncanthrax.net (propper.duncanthrax.net [91.207.61.48])
 by outbound2.eu.mailhop.org (Halon) with ESMTPSA
 id 553ce03f-3af1-11ec-a070-973b52397bcb;
 Mon, 01 Nov 2021 08:54:35 +0000 (UTC)
Received: from hsi-kbw-109-193-149-228.hsi7.kabel-badenwuerttemberg.de
 ([109.193.149.228] helo=x1.stackframe.org.stackframe.org)
 by mail.duncanthrax.net with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <svens@stackframe.org>)
 id 1mhT5M-00DIPs-M3; Mon, 01 Nov 2021 10:54:32 +0200
From: Sven Schnelle <svens@stackframe.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH/RFT] fbdev driver for HP Visualize FX cards
References: <20211031195347.13754-1-svens@stackframe.org>
 <cd0f90d9-7dba-af33-f88b-289fc6f80b51@suse.de>
Date: Mon, 01 Nov 2021 09:54:30 +0100
In-Reply-To: <cd0f90d9-7dba-af33-f88b-289fc6f80b51@suse.de> (Thomas
 Zimmermann's message of "Mon, 1 Nov 2021 08:07:41 +0100")
Message-ID: <87r1c0s1bt.fsf@x1.stackframe.org>
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

Hi Thomas,

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Am 31.10.21 um 20:53 schrieb Sven Schnelle:
>> Hi List(s),
>> i wrote a fbdev driver for the HP Visualize FX cards used some of
>> the
>> PA-RISC workstations. It utilizes some of the 2D acceleration features
>> present in the card.
>> [..]
>
> Thanks for all the work you put into this. We welcome drivers even for
> older hardware, but not for fbdev. DRM is all the rage now and has
> been for a while. I'd like to ask you to convert the driver to DRM and
> resubmit to <dri-devel@lists.freedesktop.org>.
>
> I while ago, I made conversion helpers for this. You can look at [1]
> for a trivial DRM drivers that wraps existing fbdev drivers for use
> with DRM. Once you have that, it turns into a refactoring job.

Thanks, i wasn't aware as i normally don't do any graphics related
development. I take a look at dri and port the driver, which is
hopefully not too hard.

Sven
