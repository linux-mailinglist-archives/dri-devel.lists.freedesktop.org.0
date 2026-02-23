Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIk0Etj5m2l5+gMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 07:55:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5BD172676
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 07:55:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBED910E24C;
	Mon, 23 Feb 2026 06:55:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WB94yGlX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EA5110E197
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 06:55:14 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id
 2adb3069b0e04-59e60b3ccdfso5294706e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Feb 2026 22:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771829713; x=1772434513; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=doVbZE++VdGK8RGQd9Rvpkfk97KFPksDed8hWboToR4=;
 b=WB94yGlXqmv3DMR5PUqmz/an0GlIWr/2U4qh9t4+36smY3ajYIvd0XN6yZvUsrC4Xf
 1BVSLZSqVKTujyHfjUwk3gbX2V9H4Fi+wPnC9relMxBTkxil03XGvwvqQZeqRjbZKRU7
 VLI0xG/6hezjYwfCTCPYHBYR57tbz4VawjUgCZA6nZgYfMEMFTBcoBCqhQXuGhITffa1
 wifTGZSVmtqugm6wYHEqldnD813wPZDgt6VFibMvokjTJfqxW4cQo6m2WVrcvbWJfTR7
 SPMpV1jPdeB4Li7bWQ9LlBYsDa3danqtzYtC15V+OYjaqVN/1hoB7+6e7en0xj8P3EGg
 NOrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771829713; x=1772434513;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=doVbZE++VdGK8RGQd9Rvpkfk97KFPksDed8hWboToR4=;
 b=azadoow/MMSPV+fgwoQBOi4VoVGMByk5XHl7crz/LOPh3jmQmUvarW20e1XkoUoWrb
 tIt5Nqrq7+GMGD1uj8oOpQQYhwpadgvk3jlgqUcUf/8hNqjdByK2dnruzt0Hfb6ds2x/
 JRnbNnSIwNx0lNgUKS0sicYUkKJT+zKTLALFHTc9d9Yo1Pq01fRXCG0CspoXeCfDtFK3
 M9igwOxDFIccOrXlofJPzZABlaJvD4PT4hA1Lej8k0GG3dnLCT9CFtvzPhEFnS0uoKFL
 ftGBtayBnqzl1UpB5lVpv9cFYrzzQaq5CIpQdF+5ZEuRkssYJ5hu4FaohV8dm9pkrQMV
 ugSw==
X-Gm-Message-State: AOJu0YxZADLY8pKoPKzeFmGnaSMQt+7vzo7YlPqQoiRPEthnCAvZEXJn
 lniYlppdc57d34NBvHDr3scYxNr0PYdiuTIdEZnzn/g9Jb2tFQKXV9Db
X-Gm-Gg: AZuq6aLd/ZQOGWZ4v2Epa7dmw/fpHR9rECGaB8tpPdW6ZLXabNY3JfN++uZrlV9g0jc
 014vSgMfrrYwT3KV6FIoPIiI84m/1tjn71NeHJ2rHoSafUqAumj29nVcrTmZT3Pae4u3UAj9fjE
 qW8HY8dH8ipUfxNwyzFNG3pPm4YQ6aVZstXW0KmSKUl0cdhtwEjzgWasPzmkbXeVMHOf6H3ag6p
 ghdD0C7GmTDeAoL3KzmFCU5vZzQtVQ3IfJG2HKxcLBFknUFICe4PUWMzw5VtoKdCckvXUnSYM4p
 EGYlEDj6DSgDkG2U7/lgsaj0zOChAbHWG2TjoUBPf2gE+C9YOQb2qe2g72KivH+tTqgCqIUw1HQ
 Hcovt7N0z4AucpPsI9XubpoRWQy74ft+4cmBPb7zcW1RkNngs+lqW+MyLKteHtPVA4ylru8xmcP
 X0+FNSfDmV6Q8HrjrpBAokLkI=
X-Received: by 2002:a05:6512:3f12:b0:59e:5d0a:a29a with SMTP id
 2adb3069b0e04-5a0ed87faa9mr2440297e87.7.1771829712813; 
 Sun, 22 Feb 2026 22:55:12 -0800 (PST)
Received: from xeon ([188.163.112.76]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a0eeb4c60bsm1373802e87.84.2026.02.22.22.55.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Feb 2026 22:55:12 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: display: tegra: document Tegra20 HDMI port
Date: Mon, 23 Feb 2026 08:54:59 +0200
Message-ID: <20260223065500.13357-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260223065500.13357-1-clamor95@gmail.com>
References: <20260223065500.13357-1-clamor95@gmail.com>
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
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:thierry.reding@gmail.com,m:treding@nvidia.com,m:jonathanh@nvidia.com,m:clamor95@gmail.com,m:devicetree@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,nvidia.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: ED5BD172676
X-Rspamd-Action: no action

Tegra HDMI can be modeled using an OF graph. Reflect this in the bindings.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/display/tegra/nvidia,tegra20-hdmi.yaml | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hdmi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hdmi.yaml
index f77197e4869f..b4bf2662780b 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hdmi.yaml
@@ -82,6 +82,10 @@ properties:
     description: phandle of a display panel
     $ref: /schemas/types.yaml#/definitions/phandle
 
+  port:
+    description: HDMI output port for connection to HDMI connector or bridge
+    $ref: /schemas/graph.yaml#/properties/port
+
   "#sound-dai-cells":
     const: 0
 
@@ -97,8 +101,13 @@ required:
   - reset-names
   - pll-supply
   - vdd-supply
-  - nvidia,ddc-i2c-bus
-  - nvidia,hpd-gpio
+
+anyOf:
+  - required:
+      - nvidia,ddc-i2c-bus
+      - nvidia,hpd-gpio
+  - required:
+      - port
 
 examples:
   - |
-- 
2.51.0

