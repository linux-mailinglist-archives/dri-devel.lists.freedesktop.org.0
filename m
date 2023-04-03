Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C973D6D5942
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 09:14:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B134A10E5F1;
	Tue,  4 Apr 2023 07:13:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC7E810E53B
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 17:22:53 +0000 (UTC)
Received: (Authenticated sender: me@crly.cz)
 by mail.gandi.net (Postfix) with ESMTPSA id 047FD60005;
 Mon,  3 Apr 2023 17:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crly.cz; s=gm1;
 t=1680542570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gwmDaBfdpINbLHryMxBxZ5HFeF6lCAutGgrkNzu6I1E=;
 b=e9huTgoxQ8SPhnRT9uaDRNRnOX+mnX1uaH/2QYx0+2vNC8gnou5O/G1XE+q5x9Vvv9Qwzj
 gYx8jf30hlF4TKwmYgKxQbR865P3RIE6TwHRC+U5Jb7N3E8UPTn9T3qFTPmInMkt+ePICj
 tiKJUgLLi7Ik0ETtxHa1nb9f6fhhaT4DI94BOziZpaHjvP1p9kIxzzIwYHjboDL0j0bYmA
 gDmFd6bUmzor499mcb1bKJqfnzdf9dQGvtkFLdANepJKmLxz32zS8x/49OY0sa4r6cknfq
 FmO0RQZNtoX8YIIpo5eVceaNOi03MviX//NAR9uQ7lTGH/f7nUDjX3n4wHgs8Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 03 Apr 2023 19:22:47 +0200
Message-Id: <CRNAMDCKUUBK.3PPU45G9W5IRQ@iMac.local>
From: "Roman Beranek" <me@crly.cz>
To: "Frank Oltmanns" <frank@oltmanns.dev>
Subject: Re: [PATCH 3/3] drm: sun4i: calculate proper DCLK rate for DSI
X-Mailer: aerc 0.14.0
References: <20230331110245.43527-1-me@crly.cz>
 <20230331110245.43527-4-me@crly.cz> <87h6tya70h.fsf@oltmanns.dev>
 <CRN65FVKWIUG.1VSDAH8INXQMT@iMac.local> <87pm8lj709.fsf@oltmanns.dev>
In-Reply-To: <87pm8lj709.fsf@oltmanns.dev>
X-Mailman-Approved-At: Tue, 04 Apr 2023 07:13:47 +0000
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
Cc: Samuel Holland <samuel@sholland.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon Apr 3, 2023 at 5:08 PM CEST, Frank Oltmanns wrote:
>
> On 2023-04-03 at 15:52:36 +0200, "Roman Beranek" <me@crly.cz> wrote:
> > As little a change as setting .clock in the default mode of PP's panel
> > to 73500 can fix it. Better yet, dropping pll-video0-2x from the set
> > of acceptable parents for tcon0 fixes it universally. And that's what
> > megi's kernel does, though the measure was introduced with a different
> > rationale:
> > <https://github.com/megous/linux/commit/7374d5756aa0cc3f11e494e3cbc54f6=
c7c01e1a8>
>
> For sake of completeness, the patch you referenced builds on this patch:
> https://github.com/megous/linux/commit/45e0aa8d9e34
>
> Are you saying that your other boards and panels work without these
> patches?

Yes, that was a bit of an oversight on my side as I wrote drivers for
both panels already with the intention of them being used besides
an HDMI output in mind, so I've deliberately picked a timing in each
case such that the dotclock lines up nicely with pll-video0 at 297 MHz.

All the best
Roman Beranek
