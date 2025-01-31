Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FA2A2412B
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 17:55:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93B8210E3B8;
	Fri, 31 Jan 2025 16:55:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uzIiXLKg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEBBD10E3D6
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 16:55:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 052C5A41E0D;
 Fri, 31 Jan 2025 16:54:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0782EC4CEE5;
 Fri, 31 Jan 2025 16:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738342552;
 bh=9sfX6hltXIEpM8CfQHUqmXVgOqI4/WhaFSfB01kyVac=;
 h=Date:From:To:Cc:Subject:From;
 b=uzIiXLKgnwQQzh785A5uZb4CZPgPN+LhirEhwE9K3HVIzsGpVF43ppZ+r9vWaBEFT
 sVHdBbQLJoal2Vo0RGDRVfo/7wnaMRiGFF3fsOKlUJg37AlNa5d5ou7GeMia1jhzeW
 ufmZqOWTxT9CFiMn6Gn+/E7uGMJl5Qzo5hX8CJbKcpyHJLqvImiPagokxHGGLzRxB8
 +1S433Ca5pEaR+Cht09spyWis2k+QWhU0R+MNJAeDxRm6n9J+S5fa4c0kHnzddE3Pw
 yw0DFFbI5pBWTkc95gHenWvLTcfdBTAVGoTgHHxp/HqJNpZHQxn2MuJb1+4jOpN9F1
 lQch1VwbARJsw==
Date: Fri, 31 Jan 2025 10:55:49 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: wait_event_timeout() usage in decon_wait_for_vblank()
Message-ID: <20250131165549.GA684322@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

I don't know this code at all, so this is likely just noise, but the
wait_event_timeout() usage in decon_wait_for_vblank() looks funny to
me.

decon_wait_for_vblank() waits on wait_vsync_queue for wait_vsync_event
to be cleared.

But decon_irq_handler() only clears wait_vsync_event and wakes up
wait_vsync_queue when !ctx->i80_if.

I don't see any i80_if connection in decon_wait_for_vblank().  Does
the wait always time out if i80_if is set?  Is there some reason we
don't use decon_wait_for_vblank() at all if i80_if is set?

Bjorn
