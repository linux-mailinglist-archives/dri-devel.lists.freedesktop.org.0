Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2625154850C
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 14:06:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6091F10E6F3;
	Mon, 13 Jun 2022 12:05:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8804910E587;
 Mon, 13 Jun 2022 12:05:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 07595B80D3A;
 Mon, 13 Jun 2022 12:05:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C21FEC34114;
 Mon, 13 Jun 2022 12:05:48 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="OfX6t3CW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1655121947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ByYnF9j3FLadcXuK2jZpG7X4XVZluCb7LDeffa2/9ug=;
 b=OfX6t3CWYmdxen09J3purXW1S1gqtzth97oUb06pR824jHIMC/yiR/nnNS5nrXbXb4cm0q
 ZE34ExQY0qN+40ZPdVu7RiLf3LR2kfl98bwtcY6x6xBllzD9bzxRLv7VKSD8ORBDzOqyDU
 omX8+3Bs29Yi8cTabgujvDdl07zyTNg=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f83df531
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Mon, 13 Jun 2022 12:05:46 +0000 (UTC)
Date: Mon, 13 Jun 2022 14:05:41 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH] drm/i915/display: Re-add check for low voltage sku for
 max dp source rate
Message-ID: <Yqcn/YjVFDzE86j7@zx2c4.com>
References: <20220613102241.9236-1-Jason@zx2c4.com> <87edzszuvm.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87edzszuvm.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jani Saarinen <jani.saarinen@intel.com>, Uma Shankar <uma.shankar@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Animesh Manna <animesh.manna@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani,

On Mon, Jun 13, 2022 at 02:05:17PM +0300, Jani Nikula wrote:
> On Mon, 13 Jun 2022, "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
> > This reverts commit 73867c8709b569cdd7fda67f01dfe02c8d055521, which, on
> > an i7-11850H iGPU with a Thinkpad X1 Extreme Gen 4, attached to a LG
> > LP160UQ1-SPB1 embedded panel, causes wild flickering glitching
> > technicolor pyrotechnics on resumption from suspend. The display shows
> > strobing colors in an utter disaster explosion of pantone, as though
> > bombs were dropped on the leprechauns at the base of the rainbow.
> >
> > Rebooting the machine fixes the issue, presumably because the display is
> > initialized by firmware rather than by i915. Otherwise, the GPU appears
> > to work fine.
> >
> > Bisection traced it back to this commit, which makes sense given the
> > issues.
> 
> Thanks for putting in the effort to bisect, and the patch.
> 
> As the commit message of the regressing commit suggests, the VBT (Video
> BIOS Tables) should contain the info about max rates, filled in by the
> OEM. Unfortunately, we were missing some of the checks,
> e.g. 24b8b74eb2eb ("drm/i915: Parse max link rate from the eDP BDB
> block") added to drm-intel-next just recently.
> 
> Unfortunately, gitlab is down today so I can't check if you already
> tried drm-tip [1]; that might be helpful. Also, attaching
> /sys/kernel/debug/dri/0/i915_vbt might be useful to see if the
> limitation is there.
> 
> If your system works with the limitations from VBT, *and* the commits
> adding that support are trivial to backport to v5.19, I'm inclined to do
> that instead of the revert. But obviously the revert is the way to go if
> that doesn't happen.

I checked with drm-tip last week when I filed the bug, and I just
remerged the latest today, just in case there was anything new, and
alas, the problem still occurs.

Jason

