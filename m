Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QAmLIc+9hGnG4wMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 16:57:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C8EF4D51
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 16:57:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5866010E1EF;
	Thu,  5 Feb 2026 15:47:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="imTCUYxm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D03710E1EF
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 15:47:13 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-352f60d6c2fso647482a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Feb 2026 07:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1770306432; x=1770911232; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K0hF3OW+Yv0RrXHC9A+qZtxQcKZIs93sXxsfxaETwjI=;
 b=imTCUYxmRZtdsebOYXanbwF2LBHacZ/Zrr9RL+FesyQ3Gl+byvFTJKk0FK6NNHUCMO
 IQTVA8zCatZj9cv8f57Z6Snv3xXsQR83q1sD4BOz402bw3azMKVGSIoctMDG9YFwtP/h
 FyzQce5p/oD4TdYgt6K59+wyDm5nY+Xm8qNy4dxQOO/C9TDBhM8tVqfyJunhxXGHLtmK
 k0R2IEIPfj32Y/e89Vy4Vx4A+6ZQqzqOn+XsvDCVcYxvPx1Wud0FQRzFjYzxTQ9srhJ/
 IgbojcxuG4SD4UF3SHDYPkCDMHcp5pKyxGdDHXIcimhpG1nzgLotKeGIjWxmnUDP0qMk
 evyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770306432; x=1770911232;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=K0hF3OW+Yv0RrXHC9A+qZtxQcKZIs93sXxsfxaETwjI=;
 b=TaRjzjznZXGPnKccop4ev0JoaW1YnQewaxyFMrjSC5UPmWGIxloYf4sfK3PsXaUGrt
 bbAHP5Fgy8PKqV2kpFvBuEDmf+zBHJ41onb9n3ijN2jRzKwPIoN8MFLFYV+iYRJz7KCB
 nKOjof78xDHXg9au+x5dqdENw4j/KeymHACLsF6H2tsMjsBEn2mUtNTtR3O4t0nONXNS
 xac7zTb6YNPWPPMXH/Kjif4sMgqHtNxCT0DPG2VZZHuVitSq6QG+/1Z4FoyPfYjTi2Fu
 yZ2tzvWJ+WbiIG101MDL4ky2bVpc2d83ZYQ/jDdrITJrf8fsnQLVh2R1EjDv237XDLBI
 C8pg==
X-Gm-Message-State: AOJu0YzWyyxhv2vGqKpf77ssSI4821aqRKQIwGcZfXetQCv+eyyu0r9G
 Xe+lZH3pO4mIOkGrtWWRmxRg0NkEOFCHsm487GaiJpb801d+LyCAHzMD19KMslB4QMY=
X-Gm-Gg: AZuq6aKUL07ZE3GmifruLiKy9RqYXhC0ISsjygAjNDmSWE/gK3Y2EZ988HJkHsmbbgx
 k2u0pykN23165yE273SSc0mXTQf6ZruEIO9ho0udcU2bhw2YutB4UT5UkQwaHRrVTAzEmwB1lFp
 qqiQajbnvkP1bVvmCEYMQsi5qdrdn9X5epOhsISzk6cQ7+VZBQ4Y02m+Wjeu4K5aZM66XTA/0j2
 lZTVRTvbm/GOPMJVkqNUqvgNFdcrk4vNNi/juBNz263m1bV+zkj3T75ATw37yIMIBLiwvDxynrJ
 lJfXz7eaDH+jXKt876CbKGM08Jmw1tZ/tdTYaoOQhVkyFaaRxiewKJuDfU9G1BtAYZnkTEkkN6l
 GbSUuofVDtL9r2flLxOpqgN+mWEp/64o/nhBFQeOjQwbah8nXHqGGvJicwT1gH/uwaa62xCTS1x
 PuJKlGdFQxaMKhtatGraabrOi/TSBxXL136hudGPkmUDGlyTVbq+3Ev6DHiQ==
X-Received: by 2002:a17:90b:4b8c:b0:352:d168:fc4 with SMTP id
 98e67ed59e1d1-35487207d86mr5027605a91.32.1770306432572; 
 Thu, 05 Feb 2026 07:47:12 -0800 (PST)
Received: from dgp100339560-01.huaqin.com ([103.117.77.121])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3549c09df19sm2792675a91.1.2026.02.05.07.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Feb 2026 07:47:12 -0800 (PST)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, jesszhan0024@gmail.com, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, heiko@sntech.de, mani@kernel.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com, dev@kael-k.io,
 kever.yang@rock-chips.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dianders@chromium.org,
 Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH v1 1/3] dt-bindings: vendor: add taiguan
Date: Thu,  5 Feb 2026 23:46:55 +0800
Message-Id: <20260205154657.3085820-2-yelangyan@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260205154657.3085820-1-yelangyan@huaqin.corp-partner.google.com>
References: <20260205154657.3085820-1-yelangyan@huaqin.corp-partner.google.com>
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
X-Spamd-Result: default: False [4.19 / 15.00];
	DMARC_POLICY_REJECT(2.00)[google.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[huaqin-corp-partner-google-com.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	GREYLIST(0.00)[pass,body];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,sntech.de,bp.renesas.com,kael-k.io,rock-chips.com];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:heiko@sntech.de,m:mani@kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:dev@kael-k.io,m:kever.yang@rock-chips.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dianders@chromium.org,m:yelangyan@huaqin.corp-partner.google.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[yelangyan@huaqin.corp-partner.google.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FROM_NEQ_ENVFROM(0.00)[yelangyan@huaqin.corp-partner.google.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[huaqin-corp-partner-google-com.20230601.gappssmtp.com:+]
X-Rspamd-Queue-Id: C1C8EF4D51
X-Rspamd-Action: no action

Add "taiguan" to the Devicetree Vendor Prefix Registry.

Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index fc7985f3a549..a0fcd7154ff8 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1598,6 +1598,8 @@ patternProperties:
   "^synopsys,.*":
     description: Synopsys, Inc. (deprecated, use snps)
     deprecated: true
+  "^taiguan,.*":
+    description: Shenzhen Top Group Technology Co., Ltd.
   "^taos,.*":
     description: Texas Advanced Optoelectronic Solutions Inc.
   "^tbs,.*":
-- 
2.34.1

