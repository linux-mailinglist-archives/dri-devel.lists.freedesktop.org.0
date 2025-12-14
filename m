Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3376CBCE12
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 08:59:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B79B810E389;
	Mon, 15 Dec 2025 07:58:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=peff.net header.i=@peff.net header.b="hehDLu1z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 401 seconds by postgrey-1.36 at gabe;
 Sun, 14 Dec 2025 20:01:03 UTC
Received: from cloud.peff.net (cloud.peff.net [104.130.231.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30C2110E011
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Dec 2025 20:01:03 +0000 (UTC)
Received: (qmail 356399 invoked by uid 109); 14 Dec 2025 19:54:21 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=peff.net;
 h=date:from:to:cc:subject:message-id:references:mime-version:content-type:in-reply-to;
 s=20240930; bh=b7ng+NC2J8gD287x+z6imrtBc8crXEzy06hKfxtO19I=;
 b=hehDLu1zXAXMApP2Hy8cx3j4kVumDoBpjOPPPcIKrvrDAXf3q99zZBp0oQlUZGLLp/EpL155/EY+ELidj2tI8OnmiYcmr3L1DIQWX3OdAIbSa3ynAJoKkJ7yRp2IoVI3TpvZ4uGtSeaqtKL5GEqLCOM7kGl+7qi9vyBn33D4W6LCyNhu9tjbYhSMfgSACUQhUJ+Biup1Sa5rnsCGxMUOq5ADGkYX/teKcQeK3TU0kZqgjzxPelTq3QE9ji3ayg1tiIb6u5SPE78XCt3pxI5Rs2kxEsrcWQvCw9MzkgxcG7Pxzfn3qspyHn5xrEk1cN/87qqU31zlnl6BnwR6G8uOcw==
Received: from Unknown (HELO peff.net) (10.0.1.2)
 by cloud.peff.net (qpsmtpd/0.94) with ESMTP; Sun, 14 Dec 2025 19:54:21 +0000
Authentication-Results: cloud.peff.net; auth=none
Received: (qmail 474269 invoked by uid 111); 14 Dec 2025 19:54:22 -0000
Received: from coredump.intra.peff.net (HELO coredump.intra.peff.net)
 (10.0.0.2)
 by peff.net (qpsmtpd/0.94) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPS;
 Sun, 14 Dec 2025 14:54:22 -0500
Authentication-Results: peff.net; auth=none
Date: Sun, 14 Dec 2025 14:54:20 -0500
From: Jeff King <peff@peff.net>
To: jim.cromie@gmail.com
Cc: Jason Baron <jbaron@akamai.com>, git@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com
Subject: Re: [PATCH v6 00/31] drm/dyndbg: Fix dynamic debug classmap regression
Message-ID: <20251214195420.GA791422@coredump.intra.peff.net>
References: <20251118201842.1447666-1-jim.cromie@gmail.com>
 <76038c97-39ca-4672-adc0-4e8fe0e39fc8@akamai.com>
 <CAJfuBxxFWD0rEjm-va+Bjmf-m2nfOD_+ZEqKy22WX6QdugQCUw@mail.gmail.com>
 <5b3d492c-7037-45a5-a001-0064f14d5f81@akamai.com>
 <CAJfuBxzW6TMmdS74ZPfPSe1w6S=oO17WYZc-Jgn_et=-Muw05A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJfuBxzW6TMmdS74ZPfPSe1w6S=oO17WYZc-Jgn_et=-Muw05A@mail.gmail.com>
X-Mailman-Approved-At: Mon, 15 Dec 2025 07:58:53 +0000
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

On Mon, Dec 15, 2025 at 07:24:34AM +1300, jim.cromie@gmail.com wrote:

> for some reason I cannot grasp,
> git am fails to process this mbox.
> 
> It entirely misses 13/31,
> then fails to apply 14, which needs 13

Can you show the exact input you fed to git-am?

Everything applied fine for me using this workflow:

  - grab the thread mbox from
    https://lore.kernel.org/dri-devel/CAJfuBxzW6TMmdS74ZPfPSe1w6S=oO17WYZc-Jgn_et=-Muw05A@mail.gmail.com/t.mbox.gz

  - view that mbox in mutt, tagging all of the 31 messages and then
    copying them into their own mbox 

  - git checkout v6.18 && git am <patches.mbox

-Peff
