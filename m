Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F124977F1A2
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 10:00:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7C1410E416;
	Thu, 17 Aug 2023 08:00:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 055F110E406
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 08:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1692259250; x=1723795250;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6REGuhUQKhC3ehkTtyajj1takczN+I56CLfEDOF1mcA=;
 b=YV4uKn+zFQKlVVkhvJgGrgURa3xDeQeTv+tEQQCWyUONxFnrwzeovbFc
 9Sr6MaFKMBmDpqzulK24v7LPPEGkavjcHEAvDLB5vNXikKaoV+8t1MhOV
 i4X7p+p4iplqFCfbidaEu6ilyo0TVf9irHsfI31EP7e14I9D//3jVBYqX
 lIpcD1PorYJzCTXcjv9lcStmLSP+k/xNbzfYht/j0yxXYHzNoDk/estnS
 0WyKiT3ZTEAwlnEagxjcka50sajx8o887ofimdMvlQwduTNYbqDoH5LFO
 iF9TGAGNV6CQlVLQz3lsJbOw6guU86zcFklZG/fnx8tvv7uwK6XnqY4Fc w==;
X-IronPort-AV: E=Sophos;i="6.01,179,1684792800"; d="scan'208";a="32487209"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 17 Aug 2023 10:00:48 +0200
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id E8F75280075;
 Thu, 17 Aug 2023 10:00:47 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 0/7] Improve tc358767 regmap usage
Date: Thu, 17 Aug 2023 10:00:38 +0200
Message-Id: <20230817080045.1077600-1-alexander.stein@ew.tq-group.com>
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

Best regards,
Alexander

[1] https://lore.kernel.org/dri-devel/20230817075234.1075736-1-alexander.stein@ew.tq-group.com/T/#t

Alexander Stein (7):
  drm: bridge: tc358767: Use regmap_access_table for writeable registers
  drm: bridge: tc358767: Fix order of register defines
  drm: bridge: tc358767: Add more registers to non-writeable range
  drm: bridge: tc358767: Sort volatile registers according to address
  drm: bridge: tc358767: Add more volatile registers
  drm: bridge: tc358767: Add precious register SYSSTAT
  drm: bridge: tc358767: Add descriptions to register definitions

 drivers/gpu/drm/bridge/tc358767.c | 159 +++++++++++++++++++++++-------
 1 file changed, 126 insertions(+), 33 deletions(-)

-- 
2.34.1

