Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AzhOOpEp2kNgAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 21:30:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F3A1F6CB8
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 21:30:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F09AF10E8B8;
	Tue,  3 Mar 2026 20:30:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hxeH/VoF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33A6010E8B9
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 20:30:30 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id
 af79cd13be357-8cb39647a70so577937485a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 12:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772569829; x=1773174629; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FWVCPo/EwWX5nyfgCTVstrGnhkLqhyh/3/ZgqXOIZ6A=;
 b=hxeH/VoFgDT4NWThcfFCc/imQOkE6pXAjOf0qFiqW7NxKL8jePPSP3hHZEr12shRlt
 8TfOk3TiIHcMXZ2YPoR7sgN8/vNiB57MqyQTx8LCnbdQqLZEGyoinEyz7zGL7TYWrOVf
 5tpoxhnYzvk3qFOfxE26XhauoBTdr4InvN0GsheKvBk0kUcAC5fSs1AcfXUt+x5J/fM3
 NoZzglaonGnyn7UrY6r68PO7yjMdgHa8rMH+ut4q4MKbo2aSuig8X6IejbEOCcSPKBPX
 ARq29q5ETiUhUS+5Y0j9cBIpsuK4bH2rqf/XC12V6SM/zOdYTg2Jk0iRZoum4PKFhF7o
 moZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772569829; x=1773174629;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FWVCPo/EwWX5nyfgCTVstrGnhkLqhyh/3/ZgqXOIZ6A=;
 b=gt9eCp4ExJV1M89mMMdlm4jzb/MxAuZmGTWALvS4UdgAq9M3WS3VhqstFy2r8u9Fg3
 qhUfO2a0aTIqUM43sVgTzTxujWct2RQssbZ0zq4XyQHF+ClCew4vvkFh+3Tcgk29k9Ra
 fMkpw5vW/P5f76QrkOjI5sFjFNRiKVXGbcs+hX3s0fsZJjCwrrbk6iTI2qw/vWChb8D9
 K3uospzZOw5sf4q+7YB8DfxqDLy72sHKvmwfl872zAq4aQ2SxquYNJ7QEClPa5bsHlU3
 vI+apkE7EPUrhySIQ3s1DlaJV+HgyfHOo8fTXNqbhjfFPwjiYPafgCbUnxMVcOIH2LMV
 2MyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsACxAJ4hfiI0B+tBJUEILJReP4viKyujO/5LeW0TUjXCNBupSRfTUL+hs85QbUyXyUuFXnXQV1hQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxxeEA2k8LSf0GAi1BX7Opg9AvSZdwaV0+wmk17cKBaBNQht3yW
 gLZs8YkaRpHvkKB/8dAlr4kIRHYD3ZuKUjKxCTZmKawsBk9FprR30bLX
X-Gm-Gg: ATEYQzzoIzcUIf1SsOstJJcxjWfE01wzlYDIQP6YKv70Htf8Uk7OqJEXSSpsGz7yYMS
 i7JMMAoF5hczUo59TnkU802Bjs3tuWOKWG9eiT/XfJrf1Z8Sv8x/B14jzUqjHKdeJR69lCBQpTk
 EQcowpIpQjR55IM6lb2Hv3FOKWPc4S0ThzI5QfoCNk4+lmi124XbKGb4P1a6pn0Zz2KEi0gdn6W
 iQK1OL3McURZa7V19f4Cy86ZKiqC2KB1OhepmLagy7T6NSR1/lzneviaqeN1li2RhLYOIYndvub
 jJieH+6QSf/xq1I+u1Wf15aaW4R9qbKjur0qSXEcxAUSQgo/13ZE4WtF4qJtRSo9BZnawmOYO6j
 bdh+TWGwx2FHQfzKahbU6d2XMqq9HFFAdg9XfFEkFlSJ/2tnRCNU6phfASDl8gHsD9+9SBAh/4w
 owUthsWnifkdF9H+T+dX28Iy0gWTvaTDHRzMZJG8m2IFmwWk2VnEkO4rLUhHe8B0q1qJ769q9zw
 Hmzz97iwyo=
X-Received: by 2002:a05:620a:489a:b0:8cb:9fd4:2ecb with SMTP id
 af79cd13be357-8cbc8e081ecmr2045708785a.54.1772569829106; 
 Tue, 03 Mar 2026 12:30:29 -0800 (PST)
Received: from mighty.stonybrook.edu (nat-130-245-192-1.resnet.stonybrook.edu.
 [130.245.192.1]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8cbbf564c27sm1465032085a.0.2026.03.03.12.30.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 12:30:28 -0800 (PST)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: aaro.koskinen@iki.fi, airlied@gmail.com, andreas@kemnade.info,
 conor+dt@kernel.org, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 khilman@baylibre.com, krzk+dt@kernel.org,
 laurent.pinchart@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, neil.armstrong@linaro.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com, jesszhan0024@gmail.com,
 rfoss@kernel.org, robh@kernel.org, rogerq@kernel.org, simona@ffwll.ch,
 thierry.reding@gmail.com, tony@atomide.com, tzimmermann@suse.de,
 andrzej.hajda@intel.com, bavishimithil@gmail.com
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v9 2/8] dt-bindings: vendor-prefixes: Add Doestek
Date: Tue,  3 Mar 2026 15:30:11 -0500
Message-ID: <20260303203017.511-3-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303203017.511-1-bavishimithil@gmail.com>
References: <20260303203017.511-1-bavishimithil@gmail.com>
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
X-Rspamd-Queue-Id: 56F3A1F6CB8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:aaro.koskinen@iki.fi,m:airlied@gmail.com,m:andreas@kemnade.info,m:conor+dt@kernel.org,m:jernej.skrabec@gmail.com,m:jonas@kwiboo.se,m:khilman@baylibre.com,m:krzk+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:neil.armstrong@linaro.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:jesszhan0024@gmail.com,m:rfoss@kernel.org,m:robh@kernel.org,m:rogerq@kernel.org,m:simona@ffwll.ch,m:thierry.reding@gmail.com,m:tony@atomide.com,m:tzimmermann@suse.de,m:andrzej.hajda@intel.com,m:bavishimithil@gmail.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[iki.fi,gmail.com,kemnade.info,kernel.org,kwiboo.se,baylibre.com,ideasonboard.com,linux.intel.com,linaro.org,bp.renesas.com,ffwll.ch,atomide.com,suse.de,intel.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[bavishimithil@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bavishimithil@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,doestek.co.kr:url]
X-Rspamd-Action: no action

Add vendor prefix for Doestek Co., Ltd.
Link: http://www.doestek.co.kr/

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ee7fd3cfe..5cc05d518 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -441,6 +441,8 @@ patternProperties:
     description: D-Link Corporation
   "^dmo,.*":
     description: Data Modul AG
+  "^doestek,.*":
+    description: Doestek Co., Ltd.
   "^domintech,.*":
     description: Domintech Co., Ltd.
   "^dongwoon,.*":
-- 
2.43.0

