Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4894987220C
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 15:54:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BAF5112B84;
	Tue,  5 Mar 2024 14:54:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UnHTc2Pf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70729112B84
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 14:54:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A35D76156A;
 Tue,  5 Mar 2024 14:54:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00913C433F1;
 Tue,  5 Mar 2024 14:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709650477;
 bh=HQ2WjVLP40240wfB4GuwCEkSm/CSxSkycWGDnTM73Ew=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UnHTc2PfU0hNL3MW9wVtYAe09xoA89FMv1ScWbgadLVc7ioPUY2hx+WV02OhPT83E
 lmj82Ec0EWeW6p4jI7wCj4dd6dkND//YP7o7P8Dscgzwvz3+dq9YdcJ4JmBsjupt/s
 HzV8GO+Ye0U8DxqMx0zfC6KIezolxwXqrEc7ECtiiKXH5F6twxdF6PkiDRiGuGTA8p
 4nQrm490TbzBA+R8vH5j8AsyKcqgvElWu0jkCJ9QzKWMheSkQPLgEi7w3UO58YUfq9
 hP3Ac1JACfLUAMpyuKB6JRWRsiBYecp5wXkXjM3avqIwovZMbU0SzyjhzuVDtImicE
 1gfcTL4hQA1nA==
From: Robert Foss <rfoss@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Robert Foss <rfoss@kernel.org>, Marek Vasut <marex@denx.de>,
 dri-devel@lists.freedesktop.org,
 linux-amarula <linux-amarula@amarulasolutions.com>
Subject: Re: [PATCH v2 1/2] drm/bridge: Fix improper bridge init order with
 pre_enable_prev_first
Date: Tue,  5 Mar 2024 15:54:29 +0100
Message-ID: <170965031121.1013265.9438556735428022839.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230328170752.1102347-1-jagan@amarulasolutions.com>
References: <20230328170752.1102347-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Tue, 28 Mar 2023 22:37:51 +0530, Jagan Teki wrote:
> For a given bridge pipeline if any bridge sets pre_enable_prev_first
> flag then the pre_enable for the previous bridge will be called before
> pre_enable of this bridge and opposite is done for post_disable.
> 
> These are the potential bridge flags to alter bridge init order in order
> to satisfy the MIPI DSI host and downstream panel or bridge to function.
> However the existing pre_enable_prev_first logic with associated bridge
> ordering has broken for both pre_enable and post_disable calls.
> 
> [...]

Please excuse the delay, patches touching the core bridge code are a little
bit tougher to merge due to increased risks of breaking unrelated things.

Applied, thanks!

[1/2] drm/bridge: Fix improper bridge init order with pre_enable_prev_first
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=e18aeeda0b69
[2/2] drm/bridge: Document bridge init order with pre_enable_prev_first
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=113cc3ad8566



Rob

