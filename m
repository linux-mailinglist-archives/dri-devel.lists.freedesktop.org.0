Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E6E75ED32
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 10:17:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CBB610E1B5;
	Mon, 24 Jul 2023 08:17:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E0AE10E1B5
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 08:17:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3C5AC60FB0;
 Mon, 24 Jul 2023 08:17:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E5A5C433C8;
 Mon, 24 Jul 2023 08:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690186624;
 bh=Qi/DymkSC6mDUS+3IIFJJcXGnZB5VSfohCNuw53J69s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uB9tusxWtz2OC/IP+hp4pJTgoKnHXbz0Cv10cctchAB7XGxmXhWbaRW/VkAHr4Nzr
 NtKlx9d9REjD3ytXyfGZITZXCkDegadwn/pykN4AUIGZeee7JlG8RWJdW1wJOZHPfo
 j66WB7tbUntSL/YVboQ2a/NwaCbeQjm6S4FdZ4UP6QiucXN5YjorCysA6qqCGP2NlC
 El7aokJc3Wj6A7MI8HpMnWP/Ainxq6XrfZm43eNgWC7raE4ZyVQyRqmIbbWpeRtli6
 w6qrWRjw80cJlN7OgTv+bDpVrqaEMd8YY0xp5KXYfZCvcdXP0750pACYbVW1wteCis
 8pmr7cqYg2A7A==
From: Robert Foss <rfoss@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Xin Ji <xji@analogixsemi.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [PATCH v2] drm/bridge: anx7625: Drop device lock before
 drm_helper_hpd_irq_event()
Date: Mon, 24 Jul 2023 10:16:56 +0200
Message-ID: <169018660964.606978.4469347765082724733.b4-ty@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230710085922.1871465-1-wenst@chromium.org>
References: <20230710085922.1871465-1-wenst@chromium.org>
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
Cc: Robert Foss <rfoss@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 10 Jul 2023 16:59:21 +0800, Chen-Yu Tsai wrote:
> The device lock is used to serialize the low level power sequencing
> operations. Since drm_helper_hpd_irq_event() could end up calling
> .atomic_enable, which also calls power sequencing functions through
> runtime PM, this results in a real deadlock. This was observed on an
> MT8192-based Chromebook's external display (with appropriate patches [1]
> and DT changes applied).
> 
> [...]

Applied, thanks!

[1/1] drm/bridge: anx7625: Drop device lock before drm_helper_hpd_irq_event()
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=f2cca20f1fa3



Rob

