Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1191CB2D9E6
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 12:17:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6809A10E6E2;
	Wed, 20 Aug 2025 10:17:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JYWI6Y5W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E4E710E6E2;
 Wed, 20 Aug 2025 10:17:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9DE5861430;
 Wed, 20 Aug 2025 10:17:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35246C4CEEB;
 Wed, 20 Aug 2025 10:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755685064;
 bh=kSDVjnQ81cj9naFWaS/9f3m13rNIc7k0Niofcs5+1pU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JYWI6Y5Wn6XWRFMPt3btZdbT4xaIbyj/iod02gLg3y0pQ48qtscbzpUAGisWVgAS2
 dfpaoA3Zh5TwIo3VdGP851KVRLxNzNbg+W+EpC/URzarAPqP53tG9aEKKnZczX48hA
 Ip0m+919qFQrXqNscgO/D6HaG4Ibwhfl8M2NMxXnHxEKridOAzrYoptOLxzC/bcp9D
 RT9AHvc1QQjJuzKq/rmET8HrCO43Y6d/7dFmXpH+UBChYEzd3XLncGaCaTjpKVaP0R
 0TK3yWgDaR4n0dQBkiKGbdBwWkvyCgdm4sbKuP/HTLI9RD8ouMFBTbg6fdc91v7XXf
 GZn6wbTeDotJA==
Date: Wed, 20 Aug 2025 09:17:39 -0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Zhanjun Dong <zhanjun.dong@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH] drm/i915/guc: Add synchronization on interrupt enable flag
Message-ID: <lbmfdys7nox2zaookqtr5abqtd6octniabd63whf6orvhgvgi5@gm6pbo26nzfz>
References: <20250819160010.3386940-1-zhanjun.dong@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819160010.3386940-1-zhanjun.dong@intel.com>
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

Hi Zhanjun,

On Tue, Aug 19, 2025 at 12:00:10PM -0400, Zhanjun Dong wrote:
> Boolean flag access from interrupt context might have synchronous issue on

/synchronous/synchronization/
/issue/issues/

> multiple processor platform, flage modified by one core might be read as an

/flage/flags/

> old value by another core. This issue on interrupt enable flag might causes
> interrupt missing or leakage.

/missing/misses/

> Fixed by change the data type as automic to add memory synchronization.

This can be re-written: "Change the interrupts.enable type to
atomic to ensure memory synchronization."

> 
> Fixes: a187f13d51fa0 ("drm/i915/guc: handle interrupts from media GuC")

What issue are you exactly trying to fix? And have you tested
that this patch is this really fixing it? Where is the flag's
misalignment happening?

Please remember that when in interrupt context you are already
running in atomic, so that probably you don't need to have an
additional atomic access to variables.

Andi

> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
