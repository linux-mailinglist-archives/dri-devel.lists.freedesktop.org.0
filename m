Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D098540428
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 18:55:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E55B310EA6B;
	Tue,  7 Jun 2022 16:55:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 304 seconds by postgrey-1.36 at gabe;
 Tue, 07 Jun 2022 16:55:35 UTC
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F77910E03E
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 16:55:35 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4LHbvT0fRrz1qyc6;
 Tue,  7 Jun 2022 18:50:29 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4LHbvS6s9Wz1qqkC;
 Tue,  7 Jun 2022 18:50:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id OzqzI33oF718; Tue,  7 Jun 2022 18:50:28 +0200 (CEST)
X-Auth-Info: 1g4T+5031Hi3noBMLzrRy6buVNpO0fY89VJFB5X85JarwVF+T0y/Y419JziLBmyf
Received: from igel.home (ppp-46-244-165-19.dynamic.mnet-online.de
 [46.244.165.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue,  7 Jun 2022 18:50:27 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
 id 87E3A2C39FE; Tue,  7 Jun 2022 18:50:27 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [git pull] drm for 5.19-rc1
References: <CAPM=9tw62EZfAm0PbiOPmMrpfR98QMFTWGEQcA34G4ap4xxNkA@mail.gmail.com>
 <CAMuHMdXb5-gOVRsQx6tDqjQMD9cC-p=o56VuF2cBPWyMFRgHMA@mail.gmail.com>
X-Yow: Where do your SOCKS go when you lose them in th' WASHER?
Date: Tue, 07 Jun 2022 18:50:27 +0200
In-Reply-To: <CAMuHMdXb5-gOVRsQx6tDqjQMD9cC-p=o56VuF2cBPWyMFRgHMA@mail.gmail.com>
 (Geert Uytterhoeven's message of "Tue, 7 Jun 2022 12:22:41 +0200")
Message-ID: <877d5s2zak.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
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
Cc: Arnd Bergmann <arnd@arndb.de>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Jun 07 2022, Geert Uytterhoeven wrote:

> On Wed, May 25, 2022 at 4:49 PM Dave Airlie <airlied@gmail.com> wrote:
>>       drm/amdgpu: add nbio v7_7_0 ip headers
>
> These header files are heavy users of large constants lacking the "U"
> suffix e.g.:
>
>     #define NB_ADAPTER_ID__SUBSYSTEM_ID_MASK 0xFFFF0000L
>
> Assigning this to unsigned long on 32-bit will trigger a signed integer
> overflow, which is technically UB, and causes "error: initializer
> element is not constant" warnings with gcc-5 and -std-gnu11, cfr. [1]

That shouldn't happen here, as hexadecimal constants will be of unsigned
type if they don't fit in the corresponding signed type.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
