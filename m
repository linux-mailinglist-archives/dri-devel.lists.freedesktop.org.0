Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GamNts8oGmrhAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 13:30:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1EA1A5B18
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 13:30:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 514A510E917;
	Thu, 26 Feb 2026 12:30:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KESKtbb1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C49110E917
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 12:30:16 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-c6e1f417918so224895a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 04:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772109016; x=1772713816; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NqcwDzw5HN4ZLQrwd1zkwQ8pFoXvNQgRaA7hrn50J+c=;
 b=KESKtbb1iNloUxAiP3YW8eJqVxYgf2CjN8J5muQny6viLVSmvsODaEqE5qMKfBRP27
 9edsutQCNOstKY0YPrFBKXJ8dZWOQAcInAV3Me3cyJB6pmwwMqWMezkzfONKiKQvVp+M
 Dv6FEUavM6EiPNJ3X0fUkmhC3ZUe2lxRQMQ1F44f0RqL5MY8q2Hg2OLYc57t26nG0bAp
 jJzZ1hkKT7QTub+1RnzL76weJm7xoa6m0l4bzbNsJ1JTJo2SKLOZ/BWq2NUaK6iVVcIZ
 aVLbMjf/rb9b6CU3rxeaH1gvgs/vXeK1N7/inj/sNLsJOwDWxB6JmUjDuWnA4nRghp3m
 Dk1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772109016; x=1772713816;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NqcwDzw5HN4ZLQrwd1zkwQ8pFoXvNQgRaA7hrn50J+c=;
 b=DCzNPIxSbnJikiRIPSo3OAyXdwY6xfDab7E0TsGRoIzVE4fkJ+MVoJfRjjqLk15Li9
 m54Fd1dtzevzrZGrAEtbYnl+0fwXlDrMTlWt95GTfyQnV3WRxdMROCmZzA2U6DDR4zRS
 V15syzp9/Y6WswfyXwIwHxRpAVGIASiArlxg+o6FA5qqXrlN8rMEaAONUADAOyIP6gQk
 KxpHrIzuCvactMvVU2DaCZNMFTVzhn0qoPtsTClslKOu1a04B8aahoPjYfjcqCT8Nzmw
 pGYcN5yqLzm0zXyvS7PzllPCxgCee3fNVgKlTczIbVuu+QGMrrDKmGRvrh19MGdTliKi
 kyTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJGnRUK+AVQgqbslYmWg2b9BuQZN8dgCR2BMG9EhOoRKSkz+p8f2iPNbREbR2Gb95SygRsOqX6i6g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOUIzsc6nB1Ekthheo8emOOZ1bErUFJ5Jyn55kdQ32POqnqcOY
 pXXRosRPvLT4XA9/6XiSOMK3lmlTcOac4uTTbf0tVy/UVSryRP8pgV3D
X-Gm-Gg: ATEYQzzqLimHoJ2Z5+Bl8SwLF4OZiBQqqtQtpCFlRMzSdXUpb44e6465xlh1SEpP+n7
 rxflQTT62sk5j1Rs4wxkL4u+afvTZz3RgTHXZ65q/LeWqgLS8ZTFCX/Ery7FzKJuphJT2UWQZWZ
 7y2Qm5iT0yPz1Ezw2j7GJIY/8LU0kv6aEllAZ8tLlrVM0dMwAGJyAlldUNG37xstrkyNRtZRRM2
 f5QMpYpPEj/SnmrjvwqRe3FULac1l/Jw5BVodzjWOP5HClp9qxzKwn4qb1LZeAc+/qkNYCqVYRm
 JTWYVu4WHQBxf6Key4Gw3FmtYWENPhaSivp0ZdS3R4s9eQsKdyyGmeRGBqzSXtPnyX8bYI6mJ7B
 y4qSsg/VfhBNUwtd/k0dDV3IXlIN/TQbHxpuiRbImloHMWANqH98web3XqcCeSyoDEuznSIp14f
 bGZ7BeTg==
X-Received: by 2002:a17:903:904:b0:2ad:b98e:35e9 with SMTP id
 d9443c01a7336-2ade9a8ebffmr39412815ad.45.1772109015647; 
 Thu, 26 Feb 2026 04:30:15 -0800 (PST)
Received: from nuvole.lan ([2408:824c:a17:8230::c83])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2adfb5b22e7sm25504125ad.3.2026.02.26.04.30.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 04:30:14 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Pengyu Luo <mitltlatltl@gmail.com>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] drm/msm/dsi/phy: fix hardware revision
Date: Thu, 26 Feb 2026 20:29:56 +0800
Message-ID: <20260226122958.22555-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.53.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:mitltlatltl@gmail.com,m:broonie@kernel.org,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: AD1EA1A5B18
X-Rspamd-Action: no action

This series fixes hardware revision for DSI PHY. No functional change.

Pengyu Luo (2):
  drm/msm/dsi/phy: fix hardware version
  drm/msm/dsi/phy: rename DSI_PHY_7NM_QUIRK_PRE_V4_1 to
    DSI_PHY_7NM_QUIRK_V4_0

 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 38 +++++++++++------------
 1 file changed, 19 insertions(+), 19 deletions(-)

-- 
2.53.0

