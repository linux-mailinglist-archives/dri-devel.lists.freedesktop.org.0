Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84769C0C655
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 09:46:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFB3B10E396;
	Mon, 27 Oct 2025 08:46:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dt0s5VNY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFF3510E396
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 08:46:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0F0E5605EC;
 Mon, 27 Oct 2025 08:46:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0EB5C4CEF1;
 Mon, 27 Oct 2025 08:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761554792;
 bh=wTUNdqGBpFLAqiC7mukUvqvsS+BTDhCzY1pxtj3ZT3Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dt0s5VNYVtFTxxZdebEu+wKIca0D1Ze4EZoEcMsN2ivUAm2TfO72ZubXUw0jLcV+k
 ttk9Uyqkpzz9NMVJDfFB1HBDV5CHEOrkYDIY9JwILAhRw41CJd61jD4IqiQs8SCieq
 tUe6aUFzt3TrPhY2MQkRv6tvTxbYLWTXcg7RdsrGAiYHpaiYEOVxP5z1Tn/uCYxGfn
 PWDYzzB731kl2WjwgXbHDpsbEeDP16k056V8RIBxxjXc0JILBQdc6eI5nU8i69KT0I
 V6k/tatFDFQI7cAjjbzTHGO4A+CNPmm7a2kjpSO/23nFA50A88c9bFexEJsObjbOdh
 gZPxuHnKPX1uw==
Received: from johan by xi.lan with local (Exim 4.98.2)
 (envelope-from <johan@kernel.org>) id 1vDIs7-000000000O1-3kBX;
 Mon, 27 Oct 2025 09:46:35 +0100
Date: Mon, 27 Oct 2025 09:46:35 +0100
From: Johan Hovold <johan@kernel.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: ninelore <9l@9lo.re>, "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: Re: [REGRESSION] 6.16 fae58d0155 prevents boot of google-tomato
 (mt8195)
Message-ID: <aP8xa3EBtAH6P9Rh@hovoldconsulting.com>
References: <QwcOPAuQZfqo0I9EwUu4tVCuhXRvtfAgFZ7Hq896xRKosseOz3wvuKJFV1YLUTTTwMANMW6bZPUfLwXQPPgBFiYEzKUjMGZ5D56349pz4m8=@9lo.re>
 <26bc2a33-2a45-468c-a3c1-6ef2ed414f44@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26bc2a33-2a45-468c-a3c1-6ef2ed414f44@leemhuis.info>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 16, 2025 at 01:54:54PM +0200, Thorsten Leemhuis wrote:
> On 16.09.25 01:22, ninelore wrote:

> > starting with the bisected commit
> > fae58d0155a979a8c414bbc12db09dd4b2f910d0 ("[v2] drm/mediatek: Fix
> > device/node reference count leaks in mtk_drm_get_all_drm_priv") on
> > 6.16.y my chromebook codenamed google-tomato with the SoC MT8195
> > seems to hang while initializing drm. Kernel messages over serial
> > show CPU stalls some minutes later. I am attaching the full kernel
> > logs below.
> > 
> > This issue is present in 6.16.7, however not in v6.17-rc6
> 
> A problem caused by the upstream commit of the change you mentioned
> above was fixed for v6.17-rc6, see 4de37a48b6b58f ("drm/mediatek: fix
> potential OF node use-after-free") or
> https://lore.kernel.org/all/20250829090345.21075-2-johan@kernel.org/
> 
> I wonder if that might fix your problem. It's currently scheduled to be
> included in the next 6.16.y release.

This is a regression in 6.17-rc4 and the offending commit has indeed
been backported to the stable trees.

A fix for the regression has been sitting here for a few weeks now:

	https://lore.kernel.org/lkml/20251006093937.27869-1-johan@kernel.org/

Johan
