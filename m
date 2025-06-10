Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 131ACAD3622
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 14:26:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E70D410E534;
	Tue, 10 Jun 2025 12:26:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rGXMSR5R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F29ED10E267
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 12:26:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3293AA511E2;
 Tue, 10 Jun 2025 12:26:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8651AC4CEEF;
 Tue, 10 Jun 2025 12:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749558401;
 bh=rHnF2H4xDxmzgJJK8ue4DNUikXpyNoPKMl4RAjR4bP0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rGXMSR5RNpmU77M870XfjsGPHYJr3+loL9DtfdlkOEdjEOBibj55R2+xY0BMXPRn8
 w5zm9nkTlfceX87y/Dl0c+lrz/9sN2daTxsZBTUhVh05L2X/pa22HX2Nl8rHwDhDNN
 B40lXLWDT24GvUVqRZgbAD3SD0TYEVtgtWq/qlN2PZ4T5JUhSTOBopcMRR2Juha3tR
 WgPU+FX8tMB7T8XDNC+YLCiFHxs5YSRcOZhj/Sj2VGIssFCPah5chPFs+Pg72KKJYF
 Vvfv+4APQ0mfZ4Jcg0qNlFzxTt3qFOUkmodr7eVGEPTr2HtTLNxIEnAyyiR/qL3vyO
 GwdIWTcD0xdPg==
From: Maxime Ripard <mripard@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Dmitry Baryshkov <lumag@kernel.org>,
 Gabriel Dalimonte <gabriel.dalimonte@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v2] drm/vc4: fix infinite EPROBE_DEFER loop
Date: Tue, 10 Jun 2025 14:26:37 +0200
Message-ID: <174955839350.2151021.5976827283402219676.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250601-vc4-audio-inf-probe-v2-1-9ad43c7b6147@gmail.com>
References: <20250601-vc4-audio-inf-probe-v2-1-9ad43c7b6147@gmail.com>
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

On Sun, 01 Jun 2025 12:45:36 -0400, Gabriel Dalimonte wrote:
> `vc4_hdmi_audio_init` calls `devm_snd_dmaengine_pcm_register` which may
> return EPROBE_DEFER. Calling `drm_connector_hdmi_audio_init` adds a
> child device. The driver model docs[1] state that adding a child device
> prior to returning EPROBE_DEFER may result in an infinite loop.
> 
> [1] https://www.kernel.org/doc/html/v6.14/driver-api/driver-model/driver.html
> 
> [...]

Applied to misc/kernel.git (drm-misc-fixes).

Thanks!
Maxime
