Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEB048E006
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 23:02:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC9E910E56D;
	Thu, 13 Jan 2022 22:02:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 964 seconds by postgrey-1.36 at gabe;
 Thu, 13 Jan 2022 22:02:18 UTC
Received: from outbound1g.eu.mailhop.org (outbound1g.eu.mailhop.org
 [52.28.6.212])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D84010E56B
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 22:02:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1642110371; cv=none;
 d=outbound.mailhop.org; s=arc-outbound20181012;
 b=ttm1i6V4yyqdmSB5girKuc8ffh65oUj++Q0i+7TjlZ30msRDUc2Hhfbl7YH5NoCZklkk+4UwQsejJ
 /73QGItRmKrp4eZaruK8RuZUju81Pniwbsxtbbcf7aih0rhWSSqOtqF4y+3od+2ay29fiqkK3eqv3g
 2KkCKxh+Unjhb1X7B1CWVluAzRBVLto7VsKIBK+ftQlhLqGSU683D7lFAH3yubW56vyDmMfpEF4Z16
 ekAjcoiCLvayuapWftvU0bQXmhpZrT4pg3QHvkhsprt7QhYkwunlaUSGKSjaQYIiPZXOjA5sgp6dgH
 rImR30S9+V6zNsQu/gs9BLTWRGVCmfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=outbound.mailhop.org; s=arc-outbound20181012;
 h=content-type:mime-version:message-id:in-reply-to:date:references:subject:cc:
 to:from:dkim-signature:dkim-signature:from;
 bh=rNWUHGGDvJfQLWY/taj1SWuCMTjnvjFPnINSJEKI1nY=;
 b=umlXFqOegdeuW0i6SozAUVanrJXKIAq1QORnUnO4R+4cjIHdl3cJtZ5xq5UtEET2OjqQ+yEGonhQk
 IVosFw+tywLXvaBVLweVRWXILm+lPmoQxc/VOBNqZEx0nHFmuj2Td6NYeficIoLOEcrn2wnpV5+j/n
 QZFtGAXVPkwA3zOj6zrEiYZw6iJnCi9YBPEvOJiZhV03PDYZ/Uh1kHKUBUPExz3UllSl+seCC+kDJc
 4+CHwwaQ//I/Db79egLJemY7jWDBGVU2YEnBVI7a7tSpJdneTPrWSvqUtmNURFT00juGrqt1xct+P1
 XkpGRnomY54q63p02z8CoeXWP687JCQ==
ARC-Authentication-Results: i=1; outbound3.eu.mailhop.org;
 spf=pass smtp.mailfrom=stackframe.org smtp.remote-ip=91.207.61.48;
 dmarc=none header.from=stackframe.org;
 arc=none header.oldest-pass=0;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stackframe.org; s=duo-1634547266507-560c42ae;
 h=content-type:mime-version:message-id:in-reply-to:date:references:subject:cc:
 to:from:from; bh=rNWUHGGDvJfQLWY/taj1SWuCMTjnvjFPnINSJEKI1nY=;
 b=RZuusrOs3EEIxaRIEGZabYaW7WRXhVybWvqucjpgddag6UgRP0fGLtb/iHpIeBGWLOp+T1fVBlaWO
 FlUR0K1DsAhSF5TLmAu/Yxjus2U9T87D/i1+qmZLVCBBfGz+u2bnIJkN/Xcnx2g3XlSghD8Ly9cYTq
 U9wtIRwew2uYuavg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=outbound.mailhop.org; s=dkim-high;
 h=content-type:mime-version:message-id:in-reply-to:date:references:subject:cc:
 to:from:from; bh=rNWUHGGDvJfQLWY/taj1SWuCMTjnvjFPnINSJEKI1nY=;
 b=qzXT/BXVCWUn9Aj0QVMxnMm/giqAVWL+LdsEFu095+2rX7grGODOG4jeRf4KcziPEUrFkfkhDuH3M
 NOor7sHEYMd6nhJZInocaH8ibq3vVAVtJibB3UrJ63pLuFznpOf59cwWAZDSK/M0XxksUh30LM0v+5
 p19gRfpPqzpxagBjD2PS4kR5NAom/oCxLdMzO2HE3Fbj4TqlOEg+LZGKYpEZe0fpxRP42NnnuG2gjI
 z2cPCq0oKuzj+F5eCyMsUxKoNiHOtrofjofgpzUoLOOnNCxYlXyVggv2ZLQqQsnEkpitO4tWSTeqf2
 VNTtPvI/JAQEzwc6BPStWy7bglPtCQQ==
X-Originating-IP: 91.207.61.48
X-MHO-RoutePath: dG9ta2lzdG5lcm51
X-MHO-User: 35ec3706-74ba-11ec-ba80-95b64d6800c5
X-Report-Abuse-To: https://support.duocircle.com/support/solutions/articles/5000540958-duocircle-standard-smtp-abuse-information
X-Mail-Handler: DuoCircle Outbound SMTP
Received: from mail.duncanthrax.net (propper.duncanthrax.net [91.207.61.48])
 by outbound3.eu.mailhop.org (Halon) with ESMTPSA
 id 35ec3706-74ba-11ec-ba80-95b64d6800c5;
 Thu, 13 Jan 2022 21:46:07 +0000 (UTC)
Received: from hsi-kbw-109-193-149-228.hsi7.kabel-badenwuerttemberg.de
 ([109.193.149.228] helo=x1.stackframe.org.stackframe.org)
 by mail.duncanthrax.net with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <svens@stackframe.org>)
 id 1n87v3-004SHi-8E; Thu, 13 Jan 2022 23:46:05 +0200
From: Sven Schnelle <svens@stackframe.org>
To: Helge Deller <deller@gmx.de>
Subject: Re: fbdev: Garbage collect fbdev scrolling acceleration
References: <feea8303-2b83-fc36-972c-4fc8ad723bde@gmx.de>
Date: Thu, 13 Jan 2022 22:46:03 +0100
In-Reply-To: <feea8303-2b83-fc36-972c-4fc8ad723bde@gmx.de> (Helge Deller's
 message of "Thu, 13 Jan 2022 17:36:22 +0100")
Message-ID: <87zgnz71ic.fsf@x1.stackframe.org>
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
Cc: linux-fbdev@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Hamza Mahfooz <someguy@effective-light.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Helge Deller <deller@gmx.de> writes:

> I may have missed some discussions, but I'm objecting against this patch:
>
> 	b3ec8cdf457e5 ("fbdev: Garbage collect fbdev scrolling acceleration, part 1 (from TODO list)")
>
> Can we please (partly) revert it and restore the scrolling behaviour,
> where fbcon uses fb_copyarea() to copy the screen contents instead of
> redrawing the whole screen?
>
> I'm fine with dropping the ypan-functionality.
>
> Maybe on fast new x86 boxes the performance difference isn't huge,
> but for all old systems, or when emulated in qemu, this makes
> a big difference.
>
> Helge

I second that. For most people, the framebuffer isn't important as
they're mostly interested in getting to X11/wayland as fast as possible.
But for systems like servers without X11 it's nice to have a fast
console.
