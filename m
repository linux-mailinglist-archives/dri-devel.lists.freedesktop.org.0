Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 225E096BB8E
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 14:06:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 332BA10E74D;
	Wed,  4 Sep 2024 12:06:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="bJQ1H1Z4";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="EgJLm4Vx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5C3710E74D
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 12:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1725451558; x=1756987558;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LEo9NT2QaKp6ysjNqC2FOKskz54S/7F7786D6T7+EQQ=;
 b=bJQ1H1Z4u38v0xG3C2eSEr1T6BMLlUYY05GwJA81WVDgd22UXgUDstTT
 ZNgigGOnGPHcGSw+BhA46RvZsBjRFaxibozyyzFZVBJDN3pd5SR7pTIw+
 9L09gW/TxhIwklMcuyUcy/fhRZUFtjVtvdwUH28kqNVD1kpulIvhwESY6
 iv3TNrb+bMiq6macRHz4eUE2rwO9aLXla1XGw0vv+H6Wh/13Vl1shwCgR
 +1Q+5tO02fhC7PpqeuJnJcJUM0feFqjPjnlooodCs4bQEf1qPTYLmqovy
 CLp0k1Ex34r80P74ng6UFo0K8dpefL7ZNvbFSYf7GeAkoPZi3mR7SNMtn g==;
X-CSE-ConnectionGUID: gKxJkwfTQDul0yhBz7vS5A==
X-CSE-MsgGUID: puiGMuJhQkOBejqwzBjtsw==
X-IronPort-AV: E=Sophos;i="6.10,201,1719871200"; d="scan'208";a="38762440"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 04 Sep 2024 14:05:56 +0200
X-CheckPoint: {66D84D24-19-C661815F-E221238E}
X-MAIL-CPID: 92D548C943CAB3188E965922A18E2939_1
X-Control-Analysis: str=0001.0A782F21.66D84D24.00AE, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 09BF2160024; Wed,  4 Sep 2024 14:05:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1725451552; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=LEo9NT2QaKp6ysjNqC2FOKskz54S/7F7786D6T7+EQQ=;
 b=EgJLm4VxF3jMOklz0BCV4TxcieAXJYhG9gsIFAfKx/74oVGFHOfPntTEHCNw4kf9nNh2/5
 Utm+8MxE6xtQF8++Oc0ZQbxXT1spRolCa61bsOoYwa3C0CacYCeC74+BhWF+7j541Biq50
 6tWJYu49020tBjI/h5Z8rGhKuRljegqR/+qmzE9xmxkNETwwBRfeb6P1QItjT703Lu26BW
 ImoA9xSv11gNk5NXF1QcWKowAJ25MPcouMMDxZEnXD+IT3TpE9wu8nv9OCjP2yu+CIGTCz
 xkyEEF0bGOY/w+x6rlYIdcMz8H8eYPbQpXZfLRJryCLcs9moxFHY1Jj/iBon9w==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] Improve tc358767 debugging
Date: Wed,  4 Sep 2024 14:05:42 +0200
Message-Id: <20240904120546.1845856-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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

Hi,

this small series improves debugging the tc358767 driver by using
dev_err_probe for additional information (patch 1) and print IRQ
debug output only if hotplug status actually changed.

Changes inv 3:
* Collected Robert's and Dmitry' R-b

Changes in v2:
* Added patch for supporting write-only registers

Best regards,
Alexander

Alexander Stein (3):
  drm/bridge: tc358767: Use dev_err_probe
  drm/bridge: tc358767: Only print GPIO debug output if they actually
    occur
  drm/bridge: tc358767: Support write-only registers

 drivers/gpu/drm/bridge/tc358767.c | 56 +++++++++++++++++++------------
 1 file changed, 35 insertions(+), 21 deletions(-)

-- 
2.34.1

