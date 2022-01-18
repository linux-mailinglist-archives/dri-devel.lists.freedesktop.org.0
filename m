Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 896B4492422
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 11:51:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C6710E22D;
	Tue, 18 Jan 2022 10:51:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from outbound1g.eu.mailhop.org (outbound1g.eu.mailhop.org
 [52.28.6.212])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9614A10E22D
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 10:51:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1642500314; cv=none;
 d=outbound.mailhop.org; s=arc-outbound20181012;
 b=A6fFRp/WCLXzcjvOjs4UNA4NUIfyXDnWy2DtNjNNP6KE/1aeRQAj0im6tYIUP8b6iTHzE4p47CAUr
 lQPqJEuUQHBaeS36zdQPYvgs+2RoI594BKpsH1U5ZtUgpHVB8hvuInB2vX/TM/ja+OSfzgpAqwObfI
 mV/WeL6xBpy8Hb0Fnv849O9ipCFXxHg53YFymeFOW4MhctZmM/k3SCgIHNEEID6RvorV4qGkjMOGgg
 /wADHjXj8CsY3JvG1A9SeisoXNttOVeAEcb9a6CU4pBl/V5GzK9BEs/DYPEn+W2wFsWrE6D7u3pNWw
 qi8NvZj0gaxlDlC2Kk4wwGV4Md5gSDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=outbound.mailhop.org; s=arc-outbound20181012;
 h=content-transfer-encoding:content-type:mime-version:message-id:in-reply-to:
 date:references:subject:cc:to:from:dkim-signature:dkim-signature:from;
 bh=+nnzxvvQj7+bvjQcSTQPnIo0ojYxhfwmrLpYQ8reS7o=;
 b=QEjX+HUTpBwhrngljwl9WJG7EVkw80G6K/hfqUXEbm7LC4qR7PwMmbLUfYewushFcT2hF8MCLu9mD
 hKOye5Bh/tNCzbQe13G755vq2I8+He2yPSv9SqS0C+6Sus/Loz9F07CeTsGMEi38Sasyof+B50IrQr
 hpQW8Mv+/dY/+6jqmUSJAeVUPDWk68IpayDJbrQdmHPR4BZlHzG+7H1d+4cvOEQqflCZiQ7gU9cV2r
 13GjMVV+N7jGd1WOnjiMKhNz1fgYyrWqndd9Flck788+NgJfNggq52PaILkxswwC67kds3a41iuD8Q
 gmuFWYer4mOYfiPxUzWVli5VLGEXSJA==
ARC-Authentication-Results: i=1; outbound3.eu.mailhop.org;
 spf=pass smtp.mailfrom=stackframe.org smtp.remote-ip=91.207.61.48;
 dmarc=none header.from=stackframe.org;
 arc=none header.oldest-pass=0;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stackframe.org; s=duo-1634547266507-560c42ae;
 h=content-transfer-encoding:content-type:mime-version:message-id:in-reply-to:
 date:references:subject:cc:to:from:from;
 bh=+nnzxvvQj7+bvjQcSTQPnIo0ojYxhfwmrLpYQ8reS7o=;
 b=bxHvMxbl5ntdEp+6XLmItF/hxD10ToBwYre08e+FlQmA74fF/ccBqQiMIcYe+d+Lyj4ybM4t0sQBt
 I/pNyEqVO9xn5rYE+naazMJ3LcX0m3EO7UTH6I5PIjuZ+opPjdXRxSaZfHAUvEJTer4SzxBwbs/VDZ
 gX0C1QKizq7goO3k=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=outbound.mailhop.org; s=dkim-high;
 h=content-transfer-encoding:content-type:mime-version:message-id:in-reply-to:
 date:references:subject:cc:to:from:from;
 bh=+nnzxvvQj7+bvjQcSTQPnIo0ojYxhfwmrLpYQ8reS7o=;
 b=pWEf8RqoSlJW6MG02oIJd0fcFPHtwGSAqcs+K0FqJVn1OTouF/8AYmJXZDeODEpQ0OxQPtX3HOhhc
 kfOrFkl/C+a2cw+jsgHoUOO9xxHAxJgpCn5wRTT7mv0U2mf7ybuOslv82HITN++NnrrKyNIQxYLImh
 x5EGL9mhemxmCX/sdBEBfQEkJdvvPkCSpHkZU2GHyQA2J3LgGmJFXrSt1hE19P+EAS3xcxvWyit6bA
 gxKPPfII/I6DwX2T6wx6I3u1ikBPqW6qno+I4tOBTCfE2HcCrERowc4UwXzn23Gl1Tomjmtf1l0S/z
 QA2/AwM9485CylFlf/1pf/bPk5TPWyA==
X-Originating-IP: 91.207.61.48
X-MHO-RoutePath: dG9ta2lzdG5lcm51
X-MHO-User: 1f77ca2d-7846-11ec-92ec-95b64d6800c5
X-Report-Abuse-To: https://support.duocircle.com/support/solutions/articles/5000540958-duocircle-standard-smtp-abuse-information
X-Mail-Handler: DuoCircle Outbound SMTP
Received: from mail.duncanthrax.net (propper.duncanthrax.net [91.207.61.48])
 by outbound3.eu.mailhop.org (Halon) with ESMTPSA
 id 1f77ca2d-7846-11ec-92ec-95b64d6800c5;
 Tue, 18 Jan 2022 10:05:12 +0000 (UTC)
Received: from hsi-kbw-109-193-149-228.hsi7.kabel-badenwuerttemberg.de
 ([109.193.149.228] helo=x1.stackframe.org.stackframe.org)
 by mail.duncanthrax.net with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <svens@stackframe.org>)
 id 1n9lMU-004ylN-Hg; Tue, 18 Jan 2022 12:05:10 +0200
From: Sven Schnelle <svens@stackframe.org>
To: Michel =?utf-8?Q?D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
References: <YeG8ydoJNWWkGrTb@ls3530>
 <c48ad8ae-aea5-43fa-882f-dccb90dde9a4@suse.de>
 <87bl0amc6s.fsf@x1.stackframe.org>
 <a922343d-8805-3446-c000-cf7969699823@mailbox.org>
Date: Tue, 18 Jan 2022 11:05:08 +0100
In-Reply-To: <a922343d-8805-3446-c000-cf7969699823@mailbox.org> ("Michel
 =?utf-8?Q?D=C3=A4nzer=22's?= message of "Tue, 18 Jan 2022 09:58:13 +0100")
Message-ID: <87h7a1l5pn.fsf@x1.stackframe.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: dri-devel@lists.freedesktop.org, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Michel,

Michel D=C3=A4nzer <michel.daenzer@mailbox.org> writes:

> On 2022-01-17 19:47, Sven Schnelle wrote:
>>=20
>>>  * There's no new development in fbdev and there are no new
>>>    drivers. Everyone works on DRM, which is better in most
>>>    regards. The consequence is that userspace is slowly loosing the
>>>   ability to use fbdev.
>>=20
>> That might be caused by the fact that no new drivers are accepted for
>> fbdev. I wrote a driver for the HP Visualize FX5/10 cards end of last
>> year which was rejected for inclusion into fbdev[1].
>>=20
>> Based on your recommendation i re-wrote the whole thing in DRM. This
>> works but has several drawbacks:
>>=20
>> - no modesetting. With fbdev, i can nicely switch resolutions with
>>   fbset. That doesn't work, and i've been told that this is not supporte=
d[2]
>>=20
>> - It is *much* slower than fbset with hardware blitting. I would have to
>>   dig out the numbers, but it's in the ratio of 1:15. The nice thing
>>   with fbdev blitting is that i get an array of pixels and the
>>   foreground/background colors all of these these pixels should have.
>>   With the help of the hardware blitting, i can write 32 pixels at once
>>   with every 32-bit transfer.
>>=20
>>   With DRM, the closest i could find was DRM_FORMAT_C8, which means one
>>   byte per pixel. So i can put 4 pixels into one 32-bit transfer.
>>=20
>>   fbdev also clears the lines with hardware blitting, which is much
>>   faster than clearing it with memcpy.
>>=20
>>   Based on your recommendation i also verified that pci coalescing is
>>   enabled.
>>=20
>>   These numbers are with DRM's unnatural scrolling behaviour - it seems
>>   to scroll several (text)lines at once if it takes to much time. I
>>   guess if DRM would scroll line by line it would be even slower.
>>=20
>>   If DRM would add those things - hardware clearing of memory regions,
>>   hw blitting for text with a FG/BG color and modesetting i wouldn't
>>   care about fbdev at all. But right now, it's working way faster for me.
>
> A DRM driver can implement the same fbdev acceleration hooks as an fbdev =
driver.

But i guess i can still only use the DRM_FORMAT_* encodings with that?
What i need is a pixel bitmap with separate FG/BG colors. Is that
possible?

/Sven
