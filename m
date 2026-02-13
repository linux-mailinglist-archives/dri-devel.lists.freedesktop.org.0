Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KbRNJ7QjmnJFAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 08:19:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41940133758
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 08:19:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F66A10E79C;
	Fri, 13 Feb 2026 07:19:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="wVW0rV6h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9362A10E79C
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 07:19:54 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-8249fc726e9so384458b3a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 23:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1770967194; x=1771571994; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3lW8gU22RJlHiiHCQ4m8SQJKmfEcMw1lgWIJxtTx6dI=;
 b=wVW0rV6hlttXOVzLRvPZ+rhaoyTW4MDNd8cojbVTWFErhfXCxeh7QX3cSThdgPLm3M
 6MJrY3k3xM4z8O4cHJqe0t+ZsFYKoZ3CA1e6d/muGXZ3qnpqD7Q3Fl6jcrVDVZnRmuNO
 8NtgT9YQGXyAlgJjMo95mEtoFBhCOxhlyCNf4B9e89D7+eq6l7zCe8gq9vkoYyRtti01
 9p1wh4cli1ix63WTxpKTMYDTZdRVKqe92IVqfaeJ4ksTcabOOE5+nsUm8wcnoXi+9AEu
 zug3/NJDCjyHMQHAjrk0pdYTzo68//HKSCYZhSQZjxfuMbFmK2WZpropUlBXz9eyU2jt
 c2Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770967194; x=1771571994;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3lW8gU22RJlHiiHCQ4m8SQJKmfEcMw1lgWIJxtTx6dI=;
 b=b5AjD+IPCG+mlLoOmGxUE/OoJJsTMdqGFKyUFQso++IpSokMCD5W9g5C0LvNARrk3m
 xNTLj0XX5XfCC+2VAcq3tH2gFXEEdnWG7nxkHeJP59TU2+3iyUF0G6u0O2Ugn5p7OFVh
 9apGieB+X/uCdlXFR7y4raEqnUhbdInKjZ5HUKDZdmfnckLYyb9SVTBWX8P424K7XVpi
 tq7xS/OKCaGxLTCjeJ9oHL1YGy5rf1KU//gknG0AQfNOzda1fa/edT3N4WlR8eDZrR2h
 BxbX+T0EOny0Lmk04opGy1f18T6dGU46mpn/8mb/kPbaz0kjXLRnnKFZOKOYtOMq2z61
 6Xnw==
X-Gm-Message-State: AOJu0YznBlrAZT0MLslTxGDVJ0S4IW4HSzuuCjwHJ3FSpurEeJjIalQy
 wUHgvCkSc/4WrxlXbiyp2tbCdkLwOM7BaDW4Gy1dJ/jhRBIgz9bYz9lmtuFM+tNfYfo=
X-Gm-Gg: AZuq6aIJCWlxWgjaUSqaBNzHBImCsgM6be6JWHisyMdBr196zRTtRisTgDaikTAcwPj
 Ij848MK/VxVOPhIhrg6mbgixcDfSIkwJklOa74eE+T7wnQJNJo9M9rdxysKT/rokkEdGIfbn0wB
 slhigmFxO6r+p7hBEC4n/Fxh1eV+/3I0cP+SWfamR6WhRVYz1hdM5zIBowdlPHbz0MewbaqygNq
 MiyVCSfTmvh98kNvRPYp5vCMQhbbsA61uIIueWRNF+7uwN3FTPuh7zgklPBypm+6+TmK+IDezRU
 NlAhsL0jFTw6dqr1ExNbmWhdkxzfXApZtEnSDBnTYo31qJjx5JnI2lr8jZGtHCv73Z9DeFcnDL/
 KFpOryMd0AatctEdSWJcHaQa8pXK4ilDy3C5M8vsgWAQGQHh86mkQU63jmhw5xwvScW3lVMzlJU
 ZcUh/SoX/6kIKL4Z3Fq6ShGOAuIX090BCJbM8dPZcJS6k6WI3JhUz1rsS7ZteqX+6YHEfQtA==
X-Received: by 2002:a05:6a00:852:b0:823:ad3:4ff4 with SMTP id
 d2e1a72fcca58-824c959656emr1185258b3a.37.1770967193782; 
 Thu, 12 Feb 2026 23:19:53 -0800 (PST)
Received: from dgp100339560-01.huaqin.com ([103.117.77.121])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-824c6b95278sm1856936b3a.53.2026.02.12.23.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Feb 2026 23:19:53 -0800 (PST)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
 mani@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, dev@kael-k.io,
 kever.yang@rock-chips.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dianders@chromium.org,
 Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH v2 0/3] support for taiguan-xti05101-01a MIPI-DSI panel
Date: Fri, 13 Feb 2026 15:19:43 +0800
Message-Id: <20260213071946.1436852-1-yelangyan@huaqin.corp-partner.google.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.19 / 15.00];
	DMARC_POLICY_REJECT(2.00)[google.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[huaqin-corp-partner-google-com.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,huaqin-corp-partner-google-com.20230601.gappssmtp.com:dkim,huaqin.corp-partner.google.com:mid];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:heiko@sntech.de,m:mani@kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:dev@kael-k.io,m:kever.yang@rock-chips.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dianders@chromium.org,m:yelangyan@huaqin.corp-partner.google.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[yelangyan@huaqin.corp-partner.google.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yelangyan@huaqin.corp-partner.google.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[huaqin-corp-partner-google-com.20230601.gappssmtp.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 41940133758
X-Rspamd-Action: no action

The panel uses the Jadard JD9365DA-H3 display controller, which is already
supported by the existing panel driver. This series introduces a new
vendor prefix, adds the corresponding devicetree compatible, and extends
the panel driver to support this specific panel variant.

Changes in v2:
- PATCH 1/3: Clarify the origin of the "taiguan" vendor prefix as requested during review.
- Link to v1: https://lore.kernel.org/all/20260205154657.3085820-1-yelangyan@huaqin.corp-partner.google.com/

Langyan Ye (3):
  dt-bindings: vendor: add taiguan
  dt-bindings: display: panel: Add compatible for TAIGUAN XTI05101-01A
  drm/panel: panel-jadard-jd9365da-h3: support for taiguan-xti05101-01a
    MIPI-DSI panel

 .../display/panel/jadard,jd9365da-h3.yaml     |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 .../gpu/drm/panel/panel-jadard-jd9365da-h3.c  | 244 ++++++++++++++++++
 3 files changed, 247 insertions(+)

-- 
2.34.1

