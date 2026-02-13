Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDsBFKHQjmnKFAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 08:20:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8F713375F
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 08:20:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6B2410E7A1;
	Fri, 13 Feb 2026 07:19:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="y+yhNEAu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04CF210E79E
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 07:19:57 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-824a9348603so266952b3a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 23:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1770967197; x=1771571997; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TPFhHlQf25CUUJ4+0ZM96yNWdSJHoJ5jC11en7p5Pzc=;
 b=y+yhNEAu7E1I7sTUaOXaBdZvxH3MccCYc3DJpw2eSLrQM9qrWXIKP0vrVPSqAOmHpa
 6MEF8PTLULsr1Pq/L6ZrqwHoeg867JK6Bunb/N5w+O2J5x+zhpe53QMc7yzzCDU1+BXp
 yyn+GRSZx+EVY3pKbL8wm50WI5csDLgJkzy4WiLVS2YSRuTkhs0Jyz31kJf1kytvtmmn
 P78e5vM0JKvjfTUOYESAu4eKHzm/kekI/QFX5+az5QO/2sqv/badbwJBfnXVcJS7dEsz
 nC+kLLISX86TOQWskMhQyQYxzh/oWWDUELtq1VNVkgzkuDALHgonyDWa8PTPK1/wHMxW
 mPnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770967197; x=1771571997;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TPFhHlQf25CUUJ4+0ZM96yNWdSJHoJ5jC11en7p5Pzc=;
 b=Dhe3yQb3yVIiCj83OsKw4ONJAzDPWltOM9mgh/MhXL7W6HriJqFV/7VP5v0kSTTEA8
 DFzecrdNWS8TsB23JHxr0/xBpSDZ7XdLOxK0zyk3k2m8h+OjmkJom4+lFZTlvKIq/oWq
 lfjKcDArmkuJNpUbD9kIb4tqgEuc+lTt+8P/PRSNFco8214xB6Jv4dppjGGzBat+TxBp
 p5t9LLB0gGh5+uHG1mydT+DwOXjziF5VsfCtHxS3yXnNVoJfs4uB7lHKBTyskmDIMQJw
 x8lAgq3Bg21DOV2j0SzbJYF5ssg1PxNmE1p8+yWV/Awi2nkGXn8tXH6SADnEypd5+8TR
 tGnw==
X-Gm-Message-State: AOJu0YwHL3DCs+qAxgSJYtxdViD3XRmdWCeyMiazqaOVmIhQ1ntiJkYN
 UePpvMdIjihKxwn1fUJ9aGYoYh7muRwUbCZwM+DCzG0zyez7CbZaYA1Hdr8v2X5eeaYd7bpl3oR
 PwVC5DlU=
X-Gm-Gg: AZuq6aIquEEATja5Y5r5r1OBzwJDIq0XikTutT37JWWOkvvq4NWIkUS6CtSBBMTCqSo
 PAu93TycEx6lZIW0FQDPcXdS8Yz9rd5I78nBZROKdWjBkjTEuKsueQ/9N6SeR1Mdjb+ggHcKEJi
 S7Y1f8mfE2PtYCZxF7W/CT94dF5GgVHU7cX7icKWb8ov+T3sn/2Tdz8cNlGfc6M72YUs1nYwCOn
 oNnm7blMUfUdYxEkuohMgTe2W36OxPM12nJmi/5A40HfuYN60SytESw78eWpmG32GsjiQsaKv2d
 U3HLQ4EyDHDY8TyQFoVGy6AOKHyshtmQqmSwR4BU3IDrv+AL+Q7pzspkBAE9CrGuR+JGEp2uoBD
 cXtY6gCCpKMpR+HJDYlVGOjcumUCA6m9m7d6GsOrCXpFYQjcmaKl4QNcGSdo5JoQn7D3NrDfgUd
 dRrcp1mDTCQX76ndRT/dHklVvB9M+XcncjW/OSEjWxHKlBjXXs/d0ZD8dC/Z1RE/IQLztmOFBgZ
 glAHBvN
X-Received: by 2002:a05:6a00:bc05:b0:81f:3d13:e07b with SMTP id
 d2e1a72fcca58-824c95b11aamr1004646b3a.43.1770967197524; 
 Thu, 12 Feb 2026 23:19:57 -0800 (PST)
Received: from dgp100339560-01.huaqin.com ([103.117.77.121])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-824c6b95278sm1856936b3a.53.2026.02.12.23.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Feb 2026 23:19:57 -0800 (PST)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
 mani@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, dev@kael-k.io,
 kever.yang@rock-chips.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dianders@chromium.org,
 Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH v2 1/3] dt-bindings: vendor: add taiguan
Date: Fri, 13 Feb 2026 15:19:44 +0800
Message-Id: <20260213071946.1436852-2-yelangyan@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260213071946.1436852-1-yelangyan@huaqin.corp-partner.google.com>
References: <20260213071946.1436852-1-yelangyan@huaqin.corp-partner.google.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,huaqin.corp-partner.google.com:mid,huaqin-corp-partner-google-com.20230601.gappssmtp.com:dkim,taiguanck.com:url];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:heiko@sntech.de,m:mani@kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:dev@kael-k.io,m:kever.yang@rock-chips.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dianders@chromium.org,m:yelangyan@huaqin.corp-partner.google.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[yelangyan@huaqin.corp-partner.google.com,dri-devel-bounces@lists.freedesktop.org];
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
X-Rspamd-Queue-Id: DB8F713375F
X-Rspamd-Action: no action

Add the "taiguan" vendor prefix for Shenzhen Top Group Technology Co., Ltd.

The prefix is derived from the vendor's website domain:
www.taiguanck.com/en/, which uses "taiguan" as the primary
identifier of the company.

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

