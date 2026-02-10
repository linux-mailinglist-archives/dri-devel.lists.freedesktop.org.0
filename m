Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFkiG8OYimkvMQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 03:32:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1623D1164EE
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 03:32:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCD0610E4A0;
	Tue, 10 Feb 2026 02:32:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="diF0s5hM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D9B210E4A8
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 02:32:31 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-897023602b1so4941806d6.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Feb 2026 18:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770690750; x=1771295550; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QwMu+F72u7N7yLtX52ANx3B33oLmrGPjxc879zIDdAs=;
 b=diF0s5hMNbhqO3nUqLIM+0z9UuX4MHcYrlP5dAUmxc9fXofMlWUGDVJt2wxNrWME+B
 Okm5e2zWNCTmbUWwz/Srbkk2Op2iLROj+mZMjpWJnFZAKRCLpGKUDSLNM0n6HFwQnwxp
 2NWX5t1FtOn06M3wRLOrPpV/tAiNWw0Xy1MKpOuHDkLNCgMq0YmIIr0QtRcuMlO6qVit
 TY/78cXGV7rAY0aI6nrpHRwORjMHM3w6o7S5pQLkOl55dbKc0cW1nzRRVqd7MCcWKhZj
 z3fwpc8PsggGNBLRK2jH4txYLCLqoxjAxA9VdpAPe9h66IWVFSNQsbsWR0i8+LjAPCuM
 g4Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770690750; x=1771295550;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QwMu+F72u7N7yLtX52ANx3B33oLmrGPjxc879zIDdAs=;
 b=XzV3hj2aEcy/dWFX376iQEMc4Sx7hl0PTt646Y4IPw/hXZ1JA0ROIkPXuaKzIFFRGF
 nOPBxcbnYqnul4GWtGBWb/Ph9RbfZ57CiJ9uLqygd/KiVsFSae4spm7NQCE3Hy1ZM4ag
 BuVhEcm5+I3mSNmZgFtasAuDg0az+XTJtbbUvnZvTtFYNY3+iSsogHogwNpX8gu0fV6D
 51FP5yROj+nZtoS6D29ODFC8er3x4ritED/acYjDO6psShhArntYIEVXcWI6km0YTOuK
 OrLhlQfIKaQNHfwvOKPT5oPhSFgSfxvBBTSVqPZ6638eFirFubcoJ3L2ihA/7u4Ratbg
 wxJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXutOledfL5qCJCx7GhfM8I4nkfJuiTMTr3x4gykElkz4PHJ664198cqFNwL3d56MxE5tjrYxQh5UM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLNCAFW/pZiiShoGJobj2Bb7PR4koTfj1AjMHJd8PilBdBa1ZC
 Q3cpB4BwBhgtmFaJkz9h2dRMjlVPzRF0rrXYcSBzGFSca73wI/bXjbEP
X-Gm-Gg: AZuq6aK5Z3CyyEF7+pMQ/URaHDCMHT0qKngeVQDtyLxR2ZXRMo1QD02Y768CgRNqg0Q
 vdY2qMcXvEuR0cONKEYu1IYfwJxy7thcCGtM2DY0nqNk/jz40C8s0Yb+GZsLUOiBAU+EUHfhW1D
 gRfZKyGg1tJAc/mjNcRGuJPNPvCXNuoE6S2JSkr+HEjrwB/3lxiSb/obMwx8Pqe/nw19eybJxd4
 T9VlNuVY8trKDrnoXK5gZ/A7kTvFdNbE/Zyu6/Gg3/j1yj49JqLMlvTZp6mDSwcB6up8cWb763c
 8qwXqgm3tMEdnQpUywRD+kn+w+cgYW15V1mCahrnBvXyZJ0Jz5A/dWL33dlVcGhSMm3FWkB3pB5
 Mh5VhgJLVoRfmlGx7kI1E33g1n5Dq9k2Pnkr8hror7JmjZij8T+0t6K2xbxDGQfybqs9GFzqA/p
 1Ebl+r7MnA4kWljCCDCQPQ5t9DRgIrFoLwoGFqHSNfzKIZWv4ATQnTCZtgv/rl13BLOwTHY4lCn
 pLo4GG1yhyq9Uw=
X-Received: by 2002:ad4:5c8c:0:b0:894:610c:3a22 with SMTP id
 6a1803df08f44-8953c805d13mr218451556d6.20.1770690750570; 
 Mon, 09 Feb 2026 18:32:30 -0800 (PST)
Received: from localhost
 (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-50640c60b3csm90470001cf.8.2026.02.09.18.32.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Feb 2026 18:32:29 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: yifei@zhan.science,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 2/6] dt-bindings: panel-simple-dsi: add nt37700f compatible
Date: Mon,  9 Feb 2026 21:32:56 -0500
Message-ID: <20260210023300.15785-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210023300.15785-1-mailingradian@gmail.com>
References: <20260210023300.15785-1-mailingradian@gmail.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,linux.intel.com,suse.de,ffwll.ch,ravnborg.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:thierry.reding@gmail.com,m:sam@ravnborg.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:yifei@zhan.science,m:mailingradian@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[mailingradian@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_CC(0.00)[zhan.science,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 1623D1164EE
X-Rspamd-Action: no action

Add the compatible for the NT37700F panel found on the Pixel 3a XL.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../devicetree/bindings/display/panel/panel-simple-dsi.yaml     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
index 8d668979b62d..e56865d2771b 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
@@ -49,6 +49,8 @@ properties:
       - lg,lh500wx1-sd03
         # Lincoln LCD197 5" 1080x1920 LCD panel
       - lincolntech,lcd197
+        # Novatek NT37700F 1080x2160 AMOLED panel
+      - novatek,nt37700f
         # One Stop Displays OSD101T2587-53TS 10.1" 1920x1200 panel
       - osddisplays,osd101t2587-53ts
         # Panasonic 10" WUXGA TFT LCD panel
-- 
2.53.0

