Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C2BA10EFD
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 19:04:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9B7C10E462;
	Tue, 14 Jan 2025 18:04:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DbCCXh32";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31FA110E463
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 18:04:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D51145C0402;
 Tue, 14 Jan 2025 18:03:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00426C4CEDD;
 Tue, 14 Jan 2025 18:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736877862;
 bh=xkfIr1vo7JpKBTtacRDzmwevAsmvF9aCIISE4Z2TlwA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DbCCXh32q05fRtiDm4zFfdsSaX7wq2lvcFxKwfaGoi1i1bKi91OQBwZ7g6Ih1ppP5
 GviqzbErlkRxR43AMh03LxAP6IE35u5OUrMjObH/udx0QBjOqgqhfK8EhGnjp1vtTL
 YQNWkKNhHAwDBaMuf5c2YNP4hQrL6fBBHOheDrbhytWiKqSYqSCUN8cfmYTo2ztkyz
 lBZuPScOrcDWhfv7nIiFrgNhZKvFYwsaRXYEzBO5rA+TEuvVxS9FkCAC12PW0Sx5CT
 XtsYwZFkfXiRjxUfBu9UOddTklJffSnxPN+T/bdzIIW5wc+oE2jYVJ8xlpQH38cm7W
 Hrqg1beav3nhA==
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maxime Ripard <mripard@kernel.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/display: hdmi: Do not read EDID on disconnected
 connectors
Date: Tue, 14 Jan 2025 19:04:15 +0100
Message-ID: <173687783359.2391958.6680427455549870565.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250113-hdmi-conn-edid-read-fix-v2-1-d2a0438a44ab@collabora.com>
References: <20250113-hdmi-conn-edid-read-fix-v2-1-d2a0438a44ab@collabora.com>
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

On Mon, 13 Jan 2025 15:36:18 +0200, Cristian Ciocaltea wrote:
> The recently introduced hotplug event handler in the HDMI Connector
> framework attempts to unconditionally read the EDID data, leading to a
> bunch of non-harmful, yet quite annoying DDC/I2C related errors being
> reported.
> 
> Ensure the operation is done only for connectors having the status
> connected or unknown.  Additionally, perform an explicit reset of the
> connector information when dealing with a disconnected status.
> 
> [...]

Applied to misc/kernel.git (drm-misc-next-fixes).

Thanks!
Maxime
