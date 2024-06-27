Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD77491AB05
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 17:21:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C14710E0D0;
	Thu, 27 Jun 2024 15:21:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="G4Ofjrz8";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="P6He/Ack";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 749CD10E19B
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 08:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1719477913; x=1751013913;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qKdL3I466UOarYENCEaVrpgGL8F7/4uronFKf9FxfDY=;
 b=G4Ofjrz8QKIMbEsU5tovD+H7vRhfhsOi1kS6CQrlTqyYH15mcOppzAty
 KcgxOU9K2Sq+YCrhBcHjF+MfNYUJO/H9J2ZlOQpmZ8JdKh7cHrxwudTTZ
 7JpKvko01gBma3YnfjgMYTxm3zklTDO8Ndo8/4T6BRyVduh4fTXUbxZTQ
 1E8h1+2Zzfar9ItjK0OKoaKbi6/r/CkckdYFgW6CGJ0iFqr/wQDc4Ba9r
 QsuKoyDKnWk+Mr4SEg/k1JnAMVhWhc75AUU1Cd6ORAyCMtYw0wldWg03Q
 HMHmgjox8ukRqayJ8XrX2frmu36JateGdP1h3679HpQhK7Afbw0DtVDv8 A==;
X-CSE-ConnectionGUID: min0TWq2QR6LXSFkDkLoZQ==
X-CSE-MsgGUID: pWSdAYrKQwaYjSzI19zzCQ==
X-IronPort-AV: E=Sophos;i="6.08,269,1712613600"; d="scan'208";a="37617935"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 27 Jun 2024 10:45:11 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2C9391643F3; Thu, 27 Jun 2024 10:45:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1719477906; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=qKdL3I466UOarYENCEaVrpgGL8F7/4uronFKf9FxfDY=;
 b=P6He/AcktrGJmS21zJh76T5I81o8oByDLbn7NG5niKlwypx72MnUJjp+p17D5cO12N+PB6
 RxcPxP2SBHh8XL6hsGVoJupCEg6US0tZcOf3KAELOOcW0LnBdk4wBUpUcas/z+6I+0jM/N
 h7brniKkrc8XdQZSQuRkoV7YknmDEcRH9ta3B75jGP5UWwyC5Iv7P91JntIIO12NrGtp3h
 P+wBfFuYTVEBZyc2OEAZn6D7msGPfg7CFLzCZnqvgZinUrdGb8zMEaCHLdnVsVXr/KqcJD
 N9QMTst6s+aoaEOWn7IBmCw5JzCbzltBGeDXVt6TvbRcJpICsQ+VMTGHsRqOGQ==
From: Paul Gerber <paul.gerber@ew.tq-group.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: Paul Gerber <paul.gerber@ew.tq-group.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] Add AUO G104STN01 panel
Date: Thu, 27 Jun 2024 10:44:42 +0200
Message-ID: <20240627084446.3197196-1-paul.gerber@ew.tq-group.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Approved-At: Thu, 27 Jun 2024 15:21:11 +0000
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

Changes in v2:
- put explanatory comment for display binding before the list entry
- collected Acked-by and Reviewed-by

Link to v1: https://lore.kernel.org/dri-devel/20240626044727.2330191-1-paul.gerber@ew.tq-group.com/

Paul Gerber (2):
  dt-bindings: display: simple: Add AUO G104STN01 panel
  drm/panel: simple: Add AUO G104STN01 panel entry

 .../bindings/display/panel/panel-simple.yaml  |  2 ++
 drivers/gpu/drm/panel/panel-simple.c          | 27 +++++++++++++++++++
 2 files changed, 29 insertions(+)

-- 
2.44.1

