Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOheCh+rqWlSBwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 17:11:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5F62152FB
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 17:11:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A8FA10EC3A;
	Thu,  5 Mar 2026 16:11:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ipyjAKuJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3B9810EC1F
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 16:11:03 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-439b73f4ab4so5142548f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 08:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772727062; x=1773331862; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7Dy0HnPVie7HgXpLwSqXJDHNxRmTEZFh3hOUd7M+N2Y=;
 b=ipyjAKuJHaA37VoWInSBO+Uf0OTwdM2XjH5V3MhJLrvnudSJLa/yG45p6j1pVjZQ8J
 bpPAU7xeJuHITB0mmBiJy7r0+NQ2TYe30nv/OHcaQlFYg4PKt70LMsL+u9Lfi1bopAhl
 VvT0xEjz/9OcqPmbKnlySjYROLu1mZoKz6KEriz9gLq2epgzORM9L4I2D5M+5xQlAtKW
 dnFw1hzSy3AolHZ214nq78V9oO7ovvzalXM8WKtECCFEqwNgc8JEXWfLP15rajrU4FLt
 AngqyViqHAKGBQwFUQ6AU7Xv+HW4jO1pN8mGYdqiHRpqCWSVxzF4nuRuXo+q/iaEIpAI
 oO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772727062; x=1773331862;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7Dy0HnPVie7HgXpLwSqXJDHNxRmTEZFh3hOUd7M+N2Y=;
 b=Hv08PXqoJPbaHexFxieUbpm/iEmvao/TXdvte5qdHvzXAFNjZgtU5rjqsdbV9/iJnD
 0edGhq99rAj3eYW92ayt7svinp05WbM5BWKXl5U8LGjj+mqAAr8apxOveDHM5X3A3E+L
 L0ERig0anb642kNbRuLiXUjrO+7DkgOfKnKzKvdcOzey3vkZDZ9vfkQbGI3IgMt7z1Om
 jb2uKmYYN700N0JC8lZWiA/4pnn5JB6dytFOaJ1ezILqPgwl/gOsmWhT0/u/Xc6JPjjr
 buYVT0APymrbNRHcI4DMYCp27+Ib1BuKx4xX3psa5iqUtQa+1qgJpNUXT5pd2/3EdWDx
 eXyA==
X-Gm-Message-State: AOJu0YxWKtuvaqv6+XYNqdDxHjgvfUyYT6HohZROlQw23DyfwGy4gwYb
 DQR8E/7s0YgJhv7zRmire6SsS6Xc6JOC8Wyr3qt8Dt0lOvZATVcqmbiq
X-Gm-Gg: ATEYQzxP/3ak4/pCoLxyfwsOePRKAofMTtoBomRXIYeS0tgI774CU60Ic04TKHz4xiy
 gzYjd2BKnNS+LseaIKGE8h9w1ZhkySvSsfJZBvdCuQgWKPPi/54f6npT/Qu26y76DJQOFbu9LQs
 ldtJPSed1y1pr3Dk6sF7puVRiFTjqgO20yXQ2xQZLqkTM0JsBn3OrSEONi5/q2lgF/Al25QVTpx
 8S2v1HrzbYpgGC/1rya3C6GJVqZM3qi1mA2n1gvvifiK5/4mrLXPsw6Y6aDwpDVoZU6XO9C9zOI
 ZEnsemM3kp+jPIyROWrjCNbAomKq8cuVxo2JGeDAOZo3shwgLZG5AQPMM5aFvP4vhU5XD/OGyQl
 QsCykZJgRsI/1mLPfH3qtwRmhFA+8FFsnwm06nxguwtRu9eMXlBanIs3EKCnXBZ2tGilCv+ayBj
 iJrETbARd/eW4q
X-Received: by 2002:a5d:5f50:0:b0:439:c157:2577 with SMTP id
 ffacd0b85a97d-439d7247e84mr671194f8f.34.1772727062286; 
 Thu, 05 Mar 2026 08:11:02 -0800 (PST)
Received: from xeon ([188.163.112.72]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439b8807a4esm31426496f8f.4.2026.03.05.08.11.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 08:11:02 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
 Thierry Reding <treding@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: display: tegra: document Tegra20 DSI port
Date: Thu,  5 Mar 2026 18:10:34 +0200
Message-ID: <20260305161035.64548-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260305161035.64548-1-clamor95@gmail.com>
References: <20260305161035.64548-1-clamor95@gmail.com>
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
X-Rspamd-Queue-Id: BC5F62152FB
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
	FORGED_RECIPIENTS(0.00)[m:thierry.reding@kernel.org,m:treding@nvidia.com,m:mperttunen@nvidia.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jonathanh@nvidia.com,m:clamor95@gmail.com,m:devicetree@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,gmail.com,ffwll.ch,linux.intel.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	ARC_NA(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Document the optional port node, which is required for correctly modeling
a dual-mode panel.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/display/tegra/nvidia,tegra20-dsi.yaml          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml
index 59e1dc0813e7..0f4837648d17 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml
@@ -83,6 +83,12 @@ properties:
       gang up with in order to support up to 8 data lanes
     $ref: /schemas/types.yaml#/definitions/phandle
 
+  port:
+    description: specifies the connection port for the dual-mode panel
+      and is required only when the panel is operating in dual-mode
+      configuration.
+    $ref: /schemas/graph.yaml#/properties/port
+
 allOf:
   - $ref: ../dsi-controller.yaml#
   - if:
-- 
2.51.0

