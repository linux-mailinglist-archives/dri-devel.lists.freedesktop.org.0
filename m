Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDHAIveZpmnfRgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 09:21:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF21E1EAB27
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 09:21:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C33810E15E;
	Tue,  3 Mar 2026 08:21:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="efT0auOY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 347E610E15E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 08:21:08 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-389e4330e32so79187311fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 00:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772526066; x=1773130866; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PV5yIQv/6bTdgVUZVXXsO9kP+vu/b8exNKt22mhgJ3E=;
 b=efT0auOY1i/qrbf3xHnfkAtNaRPlZBQuEuiHiPUX7HmNfJmQCBJ2ehCGAvyWBSY52Q
 4lzFR457qtDZWtxuO4sSb6zB/FR8xRGyERRlqR7/8UL/4HVhTxPWofbcP92M8yaoxIWz
 iNAGhrkhC8KquaQnn1Bta3F2CJH8uuxjbAMSOmIQcxYYx3Zn7MtkWEKqqnCbPcH3JdVy
 wyzazAFJSFYwgz9paQheHUWHqTd9jFL0dDQV08AkABFI7+G/vkde2cvDv/6P1uM/h5fg
 Yel149imYyZ1TDPT+JIphg2+ALk6RFDpxB5LRkAQgJZl2AsQ9TSbSJwKQNJsNgNh/qoq
 PxAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772526066; x=1773130866;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PV5yIQv/6bTdgVUZVXXsO9kP+vu/b8exNKt22mhgJ3E=;
 b=Uk19I75mnhupcPfq2HZUPLDFxgfi9x/4Mk7dMA1dUqLE01n12WCSRfhtccin9p9jtB
 FdPuJNUClKaVe7/RDF5+2d6QQmwGPl6fOzSSEMjUyHt5llCqxqeZUkJ0j1OHKfIIZro1
 8R66cQI7scSqW0NoJi8DNK43oCyeCIJdE2yfPQ6xzWYLVG7DYwDmOKPkBgGwY3jpsn65
 SjGLm+yAK2hV69Zys9+/bchnliUt4f2tE21TiBEvR/XfIKd13XFQk3fFUjjGO4+/PW2H
 8dCHQT5agogBsmtLd9fUcZbz3xEne2hG/yEQfluioUOozkwate5J/ueS5XFnwUSUPUBB
 39OA==
X-Gm-Message-State: AOJu0YwR+DcbBwk25a9vGooOD+9T4VS57VdQmmDToOZ2pxHzFNLa7jTh
 cuPqzH5z68q4ZSf0eQPHgI7VjHW6fPs0VFFRLTv7TMFiOPwehOwF02aB
X-Gm-Gg: ATEYQzy4h3C6umFrlmE3cAWuRRe6efgkP885M35x+krdnCKc0C2RtKAgWZMlG71J8Ej
 bku5I3LloRq/rX9d3a5UHknl/RvyRbvyBWvHwxg89J6nFtyKz/ImiAEcYw0bXiQUKYr1i9+6hit
 +B4mC80InhystvyHoKaEL9SvyuAxSWEXdhiSIeGkFIFfogjAOivsOTyUs1CzDNk1NcHZl/lYr5g
 Jli9u6NLDDqDw3GHLhZlpB2SUYP8M2kPPzXoPMDVIRlfvIK9BdyP1zf3HWAx76iKOuh4gi64FaS
 UoWvHk3nr347v9TbINoP3rXwchOzw5DcpzB1uSeH9aBqj1khB2bfqg815Cqgej1cac+OK09d6+X
 28CFzirSADYkrQQ1IH1nRIkJC6YQkhLTEl7tfhxYVmEXoeflLEBQCLu++eGrH0/hvTUAXp0DXil
 ZbwudytifQ8H2AuKiioEkFdLw=
X-Received: by 2002:a2e:8941:0:b0:389:ec55:8372 with SMTP id
 38308e7fff4ca-389ff136f55mr83841011fa.14.1772526066096; 
 Tue, 03 Mar 2026 00:21:06 -0800 (PST)
Received: from xeon ([188.163.112.72]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-389f2ffe02bsm30856171fa.27.2026.03.03.00.21.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 00:21:05 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] drm: bridge: add support for Triple 10-BIT
Date: Tue,  3 Mar 2026 10:20:35 +0200
Message-ID: <20260303082038.11352-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
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
X-Rspamd-Queue-Id: EF21E1EAB27
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:clamor95@gmail.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,ffwll.ch];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Action: no action

Triple 10-BIT LVDS Transmitter is used in Microsoft Surface RT and
MStar TSUMU88ADT3-LF-1 HDMI bridge is used in ASUS Transformer AiO
P1801-T.

Link to v3: https://lore.kernel.org/lkml/20250824092728.105643-1-clamor95@gmail.com/

---
Changes on switching from v3 to v4:
- rebased on top of v7.0

Changes on switching from v2 to v3:
- place mstar,tsumu88adt3-lf-1 alphabetically
- fix typos

Changes on switching from v1 to v2:
- sort compatible alphabetically in schema
---

David Heidelberg (1):
  dt-bindigs: display: extend the LVDS codec with Triple 10-BIT LVDS
    Transmitter

Maxim Schwalm (1):
  drm/bridge: simple-bridge: Add support for MStar TSUMU88ADT3-LF-1

Svyatoslav Ryhel (1):
  dt-bindigs: display: extend the simple bridge with MStar
    TSUMU88ADT3-LF-1 bridge

 .../devicetree/bindings/display/bridge/lvds-codec.yaml       | 1 +
 .../devicetree/bindings/display/bridge/simple-bridge.yaml    | 1 +
 drivers/gpu/drm/bridge/simple-bridge.c                       | 5 +++++
 3 files changed, 7 insertions(+)

-- 
2.51.0

