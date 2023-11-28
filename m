Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6137FBBB7
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 14:38:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A846210E529;
	Tue, 28 Nov 2023 13:38:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B71010E52A
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 13:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1701178721; x=1732714721;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IIfUl/BAPwnGcMAJ7p9/2ML46udCnjw237pk/Bros2I=;
 b=q7iPGtJWkrTXWlq2u2L+6P2BTlYUWXQ/oi3i1TIMwgmTDRpfn+mzjDF5
 PdqRRyhgaut4/PbTarbkmT8iIqid9zmimEHeQb8TV5bWb+M12vkvIjeE3
 VHnRV0jqFQqYWOEZznDbXTa20wtBNfpKIKj1UGoFv728Sq92NpAIQXCIX
 si72Mf7sxWHR5wNgdb7ZeDbsqS8AOgxtch6WbrcyeyQcWTQgqto8mG6RC
 yP87QVTsp5jlBOltai+XiY1kChXZB8YDU+oFbQwSnNJ11WTDyHO90i4vR
 KLYmlPJInOvunot7UwRL9La2M/oaDK712wcHpsQ/BnhO9xHVV5bOiwgfv A==;
X-IronPort-AV: E=Sophos;i="6.04,233,1695679200"; d="scan'208";a="34216288"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 28 Nov 2023 14:38:39 +0100
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 28A0A280075;
 Tue, 28 Nov 2023 14:38:39 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 0/7] Improve tc358767 regmap usage
Date: Tue, 28 Nov 2023 14:38:29 +0100
Message-Id: <20231128133836.2923081-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

this series improves the regmap usage by cleaning up current usage as well as
adding more registers to the list of volatile registers. SYSSTAT is added
to the list of precious registers as it is cleared upon read.
This series is based on [1].

Changes in v2:
* Patch 3: Use more symbolic names instead of register address numbers
* Patch 3: Add register group description for 0x300 and 0x400 area

Best regards,
Alexander

[1] https://lore.kernel.org/dri-devel/20230817075234.1075736-1-alexander.stein@ew.tq-group.com/T/#t

Alexander Stein (7):
  drm/bridge: tc358767: Use regmap_access_table for writeable registers
  drm/bridge: tc358767: Fix order of register defines
  drm/bridge: tc358767: Add more registers to non-writeable range
  drm/bridge: tc358767: Sort volatile registers according to address
  drm/bridge: tc358767: Add more volatile registers
  drm/bridge: tc358767: Add precious register SYSSTAT
  drm/bridge: tc358767: Add descriptions to register definitions

 drivers/gpu/drm/bridge/tc358767.c | 171 +++++++++++++++++++++++-------
 1 file changed, 133 insertions(+), 38 deletions(-)

-- 
2.34.1

