Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD05493E34
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 17:17:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1F9810E344;
	Wed, 19 Jan 2022 16:16:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 163685 seconds by postgrey-1.36 at gabe;
 Wed, 19 Jan 2022 16:16:56 UTC
Received: from outbound5f.eu.mailhop.org (outbound5f.eu.mailhop.org
 [3.127.8.113])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FA9B10E334
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 16:16:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1642608951; cv=none;
 d=outbound.mailhop.org; s=arc-outbound20181012;
 b=lNGJ+U/AFaDAlxjJxWt6BMcFLrXT9YP3qjCW0+uXil0tUgN1+ZGxX6h2UNsxjRnS1Ir7V0QR2IqKt
 EUwW5YC8irEVGfEQilP5/MIyddlZjexGq+79UV0KBbqEFsTiPRQHOPz2wrnaafqOksJPqStIh4gsSP
 UQGYJuGOu4aG0jV+RkzqnkZRjRRWrD+LXVPRYW/tOZKPPa2rbpjBEBPseGo9QG0Hty3Yepedn80PCM
 /S00A+Duo6nX1efpLXNDr8CaItddJ0X9zkdMaUXasUlzBhiCrDBkUvGBz6UyuCPFho8GocKo0Qqp1P
 iVJTZKslF3UEVTw2Gtxzmuce7TcIrSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=outbound.mailhop.org; s=arc-outbound20181012;
 h=content-type:mime-version:message-id:in-reply-to:date:references:subject:cc:
 to:from:dkim-signature:dkim-signature:from;
 bh=VQkws5cfDXUAVloFG/KiXRI6miR49pWBsef8Tqe52gE=;
 b=DROucEpWMAWSNzreneKr2Wz/6RktSjothuyxVhBgglmkQDlPGbCp71wAK6+oz5diROqQGswUAKT5m
 g/M4NdoWG8iM7Fttgt2BugwZji6DRpvSNNx88Cx+sals5DtpDZpVzUIlDyOz7Te6jld5rpIEPqfAGo
 94ZmaoMff//l8NCDcC6SIQlP6lNh2q30MKOXyoTVyzwyb65EdwrhyBHO26DScc1mKU+YkTM0ivHGZ2
 pcY+g3AlmpFTfk0l8xHLP7e4TU120aemRVRz6hGURThae6EKkOjmdYW4dFThUsmchYJ258jfSyxpxP
 LyB33MK6NNz4gnMhgzdeSHNqLYT0MLQ==
ARC-Authentication-Results: i=1; outbound2.eu.mailhop.org;
 spf=pass smtp.mailfrom=stackframe.org smtp.remote-ip=91.207.61.48;
 dmarc=none header.from=stackframe.org;
 arc=none header.oldest-pass=0;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stackframe.org; s=duo-1634547266507-560c42ae;
 h=content-type:mime-version:message-id:in-reply-to:date:references:subject:cc:
 to:from:from; bh=VQkws5cfDXUAVloFG/KiXRI6miR49pWBsef8Tqe52gE=;
 b=TToPtR0bHKToDxiw8UMDGv10xrkXW8uyXFRYgxY5Mhkw4EsVhsQD4dK9xGYuzQRc1N8MKa8o8+BLr
 axYeMiqDMaIXozAFfQ7f/OA9CMgsERMBk/O4AH8dD+RqYujBUhK/u2s2pNPDx5QZN3VI6tOXU8uz8F
 vbS5DUXV0PsSM8Jo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=outbound.mailhop.org; s=dkim-high;
 h=content-type:mime-version:message-id:in-reply-to:date:references:subject:cc:
 to:from:from; bh=VQkws5cfDXUAVloFG/KiXRI6miR49pWBsef8Tqe52gE=;
 b=E0YaHv4GxVcZCjbY0tPAynCkZWuJgL947/czeFAJpN4/sK4xGesGsghce17+LLzjEOE8Lfd4PvU9D
 DBoxb7YuiSl4UjjzmEoG0wrYwZyIEgP5OSQYOHeniikKx4yJdqxhlDvKnTzxKUUekYkl2Burd6Oige
 c4MOegAiQeblQWiIsryC5qlvDQdrunVMF3be5dRC1McNCqwWyqSvazmL5I2DpBaPWOjwjVTOrcoehC
 zAewZqvn1/fNdp6d/5gTxH3dmYBdc7Xr1cuwOFE1UA/+LZAUgVSA3ngkdmjkzsqn6qL8yHNabTIQyj
 7sk2GAf9sV7gqPCQsowAsOyigxh2GZg==
X-Originating-IP: 91.207.61.48
X-MHO-RoutePath: dG9ta2lzdG5lcm51
X-MHO-User: 0f13a236-7943-11ec-a077-973b52397bcb
X-Report-Abuse-To: https://support.duocircle.com/support/solutions/articles/5000540958-duocircle-standard-smtp-abuse-information
X-Mail-Handler: DuoCircle Outbound SMTP
Received: from mail.duncanthrax.net (propper.duncanthrax.net [91.207.61.48])
 by outbound2.eu.mailhop.org (Halon) with ESMTPSA
 id 0f13a236-7943-11ec-a077-973b52397bcb;
 Wed, 19 Jan 2022 16:15:47 +0000 (UTC)
Received: from hsi-kbw-109-193-149-228.hsi7.kabel-badenwuerttemberg.de
 ([109.193.149.228] helo=x1.stackframe.org.stackframe.org)
 by mail.duncanthrax.net with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <svens@stackframe.org>)
 id 1nADcf-0059VO-M4; Wed, 19 Jan 2022 18:15:45 +0200
From: Sven Schnelle <svens@stackframe.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: fbdev: Garbage collect fbdev scrolling acceleration
References: <feea8303-2b83-fc36-972c-4fc8ad723bde@gmx.de>
 <87zgnz71ic.fsf@x1.stackframe.org>
 <Yegwl/rwRhjROxcy@phenom.ffwll.local>
Date: Wed, 19 Jan 2022 17:15:44 +0100
In-Reply-To: <Yegwl/rwRhjROxcy@phenom.ffwll.local> (Daniel Vetter's message of
 "Wed, 19 Jan 2022 16:39:03 +0100")
Message-ID: <87y23bitvz.fsf@x1.stackframe.org>
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
Cc: linux-fbdev@vger.kernel.org, Hamza Mahfooz <someguy@effective-light.com>,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

Daniel Vetter <daniel@ffwll.ch> writes:

> On Thu, Jan 13, 2022 at 10:46:03PM +0100, Sven Schnelle wrote:
>> Helge Deller <deller@gmx.de> writes:
>> > Maybe on fast new x86 boxes the performance difference isn't huge,
>> > but for all old systems, or when emulated in qemu, this makes
>> > a big difference.
>> >
>> > Helge
>> 
>> I second that. For most people, the framebuffer isn't important as
>> they're mostly interested in getting to X11/wayland as fast as possible.
>> But for systems like servers without X11 it's nice to have a fast
>> console.
>
> Fast console howto:
> - shadow buffer in cached memory
> - timer based upload of changed areas to the real framebuffer
>
> This one is actually fast, instead of trying to use hw bltcopy and having
> the most terrible fallback path if that's gone. Yes drm fbdev helpers has
> this (but not enabled on most drivers because very, very few people care).

Hmm.... Take my Laptop with a 4k (3180x2160) screen as an example:

Lets say on average the half of every line is filled with text.

So 3840/2*2160 pixels that change = 4147200 pixels. Every pixel takes 4
bytes = 16,588800 bytes per timer interrupt. In another Mail updating on
vsync was mentioned, so multiply that by 60 and get ~927MB. And even if
you only update the screen ony 4 times per second, that would be ~64MB
of data. I'm likely missing something here.
