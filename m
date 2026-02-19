Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePHRCuZ6l2m7zAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 22:04:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC7F1628D2
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 22:04:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6C3A10E754;
	Thu, 19 Feb 2026 21:04:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cKmddoE1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85D1210E758
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 21:04:32 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-506251815a3so12627591cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 13:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771535071; x=1772139871; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oNC2r/k4VYyNvAPrupzATpkdJnOwaq0ecIMgKhToJ2I=;
 b=cKmddoE1NOLdje8ykJ+JDG+qvkn59wvu+oNdTLAVxjWUu7E5qXD/ZWikpNirmgOp7b
 L3W/9whVAMxXFPwt8RvP5yumTnGDsARp1NrJCB4pLYxHNmUB4KcEzUkQJkpAVfpY/EEX
 p0fyeVGANzutlVRWTf5elHAnGAvSN22G23bD7+cN3PqnIUmRqyk9aGTbBo4uFX9nM00q
 8PBEjtrBSxSpt8M9Af1IzEMHKb3E9+ijjPJBymqrYfkbVJn9oZSwMpzHe1xTPOgQdBNK
 e0OA2QlsmDP2Zlo/QNNd7oDGrxif93K/WQe/1adff1MQZYgSNE3OWDaIrxT+bE7DE0+O
 cCtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771535071; x=1772139871;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=oNC2r/k4VYyNvAPrupzATpkdJnOwaq0ecIMgKhToJ2I=;
 b=n14S3CRqJW7cfg/pj/NU/jcqsi6T7ZP2KTrAnnhV8kmd/M3/1wfyAXnwiPkg2Fie3l
 hjYZTWKBOPxeFTwmfCVe+OGsZz/IzV8VGFaUO3lU7yxGCACNoUMe9gz6ECQlehxwlsvA
 L3ZGrbYTeWhguBA5QINybswTWzeP/Nx/1EujA6jbMD7BJasq7jRVD4lylRxMtI52H7Sq
 ZHnql6LnvedpBsWrLYMrJvOLbmnvyVmlbo9akJIdqb4n0/9lUzGGL8KA8jhLi8tgnGwe
 tryYSaEGT5ZVkoksaTa7gUaDnPt8AFx9xOR32CJTPJ+URv/LTlcU3jrdLv+IsvEFpBbQ
 UBYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUO2HUNPRpXyRn35W0k5wGXuyhfkcyMi3kmHhmd0udT1Rp5IZTts+8LnM2yLNP5YIGi3v6B3Dl/NiI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyEmPtb8G5SNFGqEjH0c14UQCP6QlhtpIDhxzERdDhITkSVh2z/
 1rCYOAG/pjlNgx1eN3aQ7WAqkeFffj8tjG/mGKSapSJj+zBDQXjaniBI
X-Gm-Gg: AZuq6aJRY5Stq6oDWXbjOKJxuqDRtQoOML3G1QT7FP2lIxrq/FCzCt9mWiDw+JNQar2
 0a4H9wp1yPTkaILQqmkZVpdO/gCO2GQv+8kvb0VUqE+Z2Fj8SordNKQ8OiKXvGiUiyQTnP9I3yb
 pY8cvXqmlyyXr1f/yBtHWVzG4gcpgOaz9eX5fPAxWtTeWNbvAX4E/09BE5NNxpV+OoMygXXyAtz
 D/nfCPXfUXXFGEtGNG5l6vYzj+E0sJRDRuL6VtaSBinFxaOEvRlkoip5+nZAaKLBwidr++EnSA9
 0c/UZLTTDBYVUXMQMecRHIGim/vUiiKJ4Pvs1Vca84YizVMtR1xZ51ahJfF8Vo0AZ8ceEVu6nr7
 kPQTts0WFQghASZMaQssYT7dgkch4JCFnMLDuDCL8N5lo72o/vVv/ECEE3p7UZc+aOYDE3v2J9V
 82WXpSmN5Uleq360ofwRafRNku0jFkajwMy9jGnuMrre3WJ17I9tF9rLKLknYhVYrWk0mlUyMpo
 mkMm3xUk60=
X-Received: by 2002:a05:622a:113:b0:506:bd04:4a6f with SMTP id
 d75a77b69052e-506f05ee3admr62280481cf.12.1771535071374; 
 Thu, 19 Feb 2026 13:04:31 -0800 (PST)
Received: from mighty.stonybrook.edu (nat-130-245-192-1.resnet.stonybrook.edu.
 [130.245.192.1]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-506b275d59fsm153971511cf.32.2026.02.19.13.04.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 13:04:31 -0800 (PST)
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
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 6/8] dt-bindings: omap: Add Samsung Galaxy Tab 2 7.0 and
 10.1
Date: Thu, 19 Feb 2026 16:04:05 -0500
Message-ID: <20260219210408.5451-7-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219210408.5451-1-bavishimithil@gmail.com>
References: <20260219210408.5451-1-bavishimithil@gmail.com>
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
	FORGED_RECIPIENTS(0.00)[m:aaro.koskinen@iki.fi,m:airlied@gmail.com,m:andreas@kemnade.info,m:conor+dt@kernel.org,m:jernej.skrabec@gmail.com,m:jonas@kwiboo.se,m:khilman@baylibre.com,m:krzk+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:neil.armstrong@linaro.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:jesszhan0024@gmail.com,m:rfoss@kernel.org,m:robh@kernel.org,m:rogerq@kernel.org,m:simona@ffwll.ch,m:thierry.reding@gmail.com,m:tony@atomide.com,m:tzimmermann@suse.de,m:andrzej.hajda@intel.com,m:bavishimithil@gmail.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:conor@kernel.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[iki.fi,gmail.com,kemnade.info,kernel.org,kwiboo.se,baylibre.com,ideasonboard.com,linux.intel.com,linaro.org,bp.renesas.com,ffwll.ch,atomide.com,suse.de,intel.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER(0.00)[bavishimithil@gmail.com,dri-devel-bounces@lists.freedesktop.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 9FC7F1628D2
X-Rspamd-Action: no action

Add samsung-espresso7 codename for the 7 inch variant
Add samsung-espresso10 codename for the 10 inch variant

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/ti/omap.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml b/Documentation/devicetree/bindings/arm/ti/omap.yaml
index 14f1b9d8f..f694dcbf2 100644
--- a/Documentation/devicetree/bindings/arm/ti/omap.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/omap.yaml
@@ -144,6 +144,8 @@ properties:
               - motorola,droid-bionic   # Motorola Droid Bionic XT875
               - motorola,xyboard-mz609
               - motorola,xyboard-mz617
+              - samsung,espresso7
+              - samsung,espresso10
               - ti,omap4-panda
               - ti,omap4-sdp
           - const: ti,omap4430
-- 
2.43.0

