Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mC1YCj84kGkuXgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 14 Feb 2026 09:54:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 566A213B789
	for <lists+dri-devel@lfdr.de>; Sat, 14 Feb 2026 09:54:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5EAF10E140;
	Sat, 14 Feb 2026 08:54:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="gxo6fmRF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C3B710E140
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Feb 2026 08:54:17 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-35621aa8c7fso1015364a91.2
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Feb 2026 00:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1771059257; x=1771664057; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Lc57BIyf+rpMQq/MZFlMnmSDpsnEdM6gcXuGUQPWrdM=;
 b=gxo6fmRFYstNWgk5mPxcZOM5LQ5cmtqbC483txSd7jmNqBhVn+1xQq6AHTX9NRm1PC
 Zvhg/aMitzOKoFnGc3YvGj6gAUHNpbSu7EvXDj+tQeQBmNgBIkKHcg6tYXjAqGPoGert
 JcRf07brqX7t6rSGKUSTmAp/V0Nn7m80dQOsr+V1p5JIIbaRHMKJZdojoI3KK//lThyQ
 XKPLd2z7wrQdxHXNZPtwI/P+G6Iv8eLnCXwoy+1MuDND2gRoAC0WDQJ0vbQ7shQq7g6e
 3MwEsCDsOjXAy6n8TIMCtuk8SP6FBJa/gcNi7MI+/ZJRqSPxkRFVUrebp9fqU9POGSPr
 yH4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771059257; x=1771664057;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lc57BIyf+rpMQq/MZFlMnmSDpsnEdM6gcXuGUQPWrdM=;
 b=NDYHGzDJyu/kLI4A34CkgJm8BlpZYG6HzUAzqKZGC40iLf+NqbeXTbr4Dw0uQolSt/
 FlE3shyWRRGhhnAK2Pv8IO2wpSt8Yx15F6RB0jky26u1tRRBOCp0oc81HwjrOwhU3h3e
 qYK4XGDHFj1x5Ag4Z+E/X+9Ubw6+tszoNi5YPeh3OhJaBE3rbEBLlzooL8x/MRcfzDRb
 e/6hyrUWbk9JSY4xT3yLZ2Cfcdw96vSiIr6qSdez8KylVZ0kb9B8GkbHczpj8bpNKwHs
 2vncalSnSoA8Rr9NkhaV23WLdkWrZ4n61nqo9u8cLJ/aBFAMPS4ZwMcjWD/4Tpd6A9PR
 R2BA==
X-Gm-Message-State: AOJu0Yx3DRU9rP6UkMVKHu/sSwHpxdjAdYj9v8wLU15Zma2Tmj1eKZBH
 iGozRGaKVjOacFtrfOkSBooLxNpvCfZFYy7OVonoJWKQH4IW/bKTbKCn5UNkFYnaaLM=
X-Gm-Gg: AZuq6aKGGtKrwiTAbEaHYCuxyoxDIj350BL7+SrPtZqhKCfGfyYMjFX2kQii4b79Fer
 c/hZp3igLC3TMA5GidPgPTNMSKERGfMs3L4Z61j3u4/64/lhYqgIQyCsurokzOQjVtUMVRoQYuF
 nOMdTNYhUVtcbueg3b0F66lUbzuAXr6WVHff8JggzfRQc0hbg3n12ARN5VWIFHZSqn8oTzAqvw4
 jRn9BhHDS/rS/smGNrlmLRK5REn+kayhZThS185JZaGrwoR1s1NUnAGb0I3GF1RPNH/wc75F/g/
 7SVbxKmwB66r0f4wVQ0iJ3g7pFwSmyVsrveKjQYgIWNYCM6nEXR/EXh8AK+JzcKdOjOvs0ymzPY
 kFr5z1meI9F4NOpKqgcuHQY81TNMpCSznc8Sw1UsRNPTig3uyc+RDsMcX6B52/ePdXcfPfkZ/uf
 1zLFjRpb+XoOUlVDvHbVhebwO7Jf7eMQDnhJA5kY1bybHDnEGS5tagOYr5svyvGKyLLFEQWA==
X-Received: by 2002:a17:90b:2b4c:b0:356:2c7b:c010 with SMTP id
 98e67ed59e1d1-35844a4c620mr2090265a91.11.1771059256848; 
 Sat, 14 Feb 2026 00:54:16 -0800 (PST)
Received: from dgp100339560-01.huaqin.com ([103.117.77.121])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3567ebc3af1sm10256622a91.15.2026.02.14.00.54.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Feb 2026 00:54:16 -0800 (PST)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
 mani@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, dev@kael-k.io,
 kever.yang@rock-chips.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dianders@chromium.org,
 Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH v3 0/3] support for taiguan-xti05101-01a MIPI-DSI panel
Date: Sat, 14 Feb 2026 16:54:06 +0800
Message-Id: <20260214085409.3489057-1-yelangyan@huaqin.corp-partner.google.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[huaqin-corp-partner-google-com.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:heiko@sntech.de,m:mani@kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:dev@kael-k.io,m:kever.yang@rock-chips.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dianders@chromium.org,m:yelangyan@huaqin.corp-partner.google.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER(0.00)[yelangyan@huaqin.corp-partner.google.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[yelangyan@huaqin.corp-partner.google.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[huaqin-corp-partner-google-com.20230601.gappssmtp.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 566A213B789
X-Rspamd-Action: no action

The panel uses the Jadard JD9365DA-H3 display controller, which is already
supported by the existing panel driver. This series introduces a new
vendor prefix, adds the corresponding devicetree compatible, and extends
the panel driver to support this specific panel variant.

Changes in v3:
- Use vendor prefix "taiguanck" to match the verifiable company domain
  as requested during review.
- Link to v2: https://lore.kernel.org/all/20260213071946.1436852-1-yelangyan@huaqin.corp-partner.google.com/

Changes in v2:
- PATCH 1/3: Clarify the origin of the "taiguan" vendor prefix as requested during review.
- Link to v1: https://lore.kernel.org/all/20260205154657.3085820-1-yelangyan@huaqin.corp-partner.google.com/

Langyan Ye (3):
  dt-bindings: vendor: add taiguanck
  dt-bindings: display: panel: Add compatible for TAIGUAN XTI05101-01A
  drm/panel: panel-jadard-jd9365da-h3: support for taiguan-xti05101-01a
    MIPI-DSI panel

 .../display/panel/jadard,jd9365da-h3.yaml     |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 .../gpu/drm/panel/panel-jadard-jd9365da-h3.c  | 244 ++++++++++++++++++
 3 files changed, 247 insertions(+)

-- 
2.34.1

