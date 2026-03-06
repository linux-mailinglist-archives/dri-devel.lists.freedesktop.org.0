Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAl3G76Rqml0TQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 09:35:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E493D21D298
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 09:35:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D0B110E3C0;
	Fri,  6 Mar 2026 08:35:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="j+MU36sa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1922F10EC96
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 01:07:24 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-8297c035d28so765561b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 17:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772759243; x=1773364043;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7kRcXgVkSQhw0XQs+BeJwsxiCbRmgYGK7GY+i24Yku0=;
 b=j+MU36saay5GVMcCRYiTALlydWchCPpGlHiq7gTpZlSx8OPc/sxv9553cM8iyGwlV0
 5qcXk8Dua3mKA7bL+jh9Qn6I0KUJkqlfpoI/aoew/WTx5V15GYYhh/IrznQLOEmi491/
 u9xMw2vp2rcgtiNMe7/EwSWWr7oNPdlIT18Fpu/JLyZromIM/yFaSUveCdrGP+Syt4zq
 i1PMOsRu9msG6ZJmZ0ld05cU6G3m7VyAJh/0ONlDvKOVqdpJfmNrhER0X5sXjne/tsC5
 i0o2bWYvvyNmduGZzcd96qeUadonOl3zwag9DGB+c+xmCNliFzDr0HE3DoxmznnOpHYb
 vvZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772759243; x=1773364043;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7kRcXgVkSQhw0XQs+BeJwsxiCbRmgYGK7GY+i24Yku0=;
 b=GDCiLkjsFnbb02nvyle7Sxsw68bEZUylDEFOxHb9s8G1CyZUz+ny7qTDCHswCj9319
 mgvAksN/+BOgkCFGFAysvViSVS+HBwkX1SEnP9PoG5L40hyg5rn0Ah70dXYY7eGSuecP
 Q1M6XZ5V02F1VvS3RxixPZefIwXDKr61LgdEVcivS8BilXsk33V+LLeBBMlNYN+qXB2b
 tzCV2tCy6p/MIZKrhbf886tK8KKnW6Yd4a/Ix9K237cJWVOQQKjLBLKOiKW8SNlb4Y1l
 Q207LuaCaZtP2sNOTEesdpfFAne0PlNK8mZjl5M4jv/DpWzJl+HOkUOiRFDIxGRgPUUG
 qvYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMEc1u2VXgGSgFoNHBY1X77IooAp74ZzSJ83ZyWos3eMXnizSvfsHcrtN1M88OWGvmy/qmv4dQmeQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzfk95YfABxnVxhJguVOvu9ywUg+RPs1pz39zjN/HyOvqDU0ZPs
 X2FOfTGsK3k0V35VWqUR7cynEC8WnWZy2E6e5BAA8li7kHDBRL1m5tox4tNqDrTnO9dVv70L8cg
 SOql8pds=
X-Gm-Gg: ATEYQzws9ku9IKaj3wzMapG4zy1UruGuDHO5glWNvYsK694SM0RmYq3fvfXmuXaHqDb
 8zEt7SzDsANfNNXG487PZfcmUNJ5AQzw29vDtgYo2z+YY4wPOjPKGItZ0KWgEkt6uFflbMDUsrV
 08/c5HyiKmn+YAtVLM09oAnKpVzCkmTbgUOPW34iMDzmjvVUAbFR6PYYkmGzF2GSM40nfzx4odD
 zDeRkxTaXjMb2WFPdYgCu6nRiOm5mC2kAusdgid5sSgBs3DrWP+/yYpI/PGPO0tsJyUHcGyydEq
 v3O45g2AxFojD8Vm1Lgaed+M706eVXSrJmFye5B/TT9a5dqhZ35zBJUg8d5ig2mTmEoOF8Vu6YM
 APIyiKro9Cg4cZ8+j5uReN4X30jWf/P1E8XKdkoNkf/6MhjDLJE77E8fWXAwOzxrB8iAHDN/zPl
 IyYm4Bb4mb63HzCVAzmvbi
X-Received: by 2002:a05:6a00:1a8c:b0:823:efa:a657 with SMTP id
 d2e1a72fcca58-829a2f6fbd1mr253851b3a.40.1772759243445; 
 Thu, 05 Mar 2026 17:07:23 -0800 (PST)
Received: from localhost ([71.212.200.220]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8273a010996sm22242994b3a.44.2026.03.05.17.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 17:07:22 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: aaro.koskinen@iki.fi, airlied@gmail.com, andreas@kemnade.info, 
 conor+dt@kernel.org, jernej.skrabec@gmail.com, jonas@kwiboo.se, 
 krzk+dt@kernel.org, laurent.pinchart@ideasonboard.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 neil.armstrong@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com, 
 jesszhan0024@gmail.com, rfoss@kernel.org, robh@kernel.org, 
 rogerq@kernel.org, simona@ffwll.ch, thierry.reding@gmail.com, 
 tony@atomide.com, tzimmermann@suse.de, andrzej.hajda@intel.com, 
 Mithil Bavishi <bavishimithil@gmail.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
In-Reply-To: <20260303203017.511-1-bavishimithil@gmail.com>
References: <20260303203017.511-1-bavishimithil@gmail.com>
Subject: Re: [PATCH v9 0/8] Initial support for Samsung Galaxy Tab 2 series
Message-Id: <177275924237.1445909.16957765309928368128.b4-ty@baylibre.com>
Date: Thu, 05 Mar 2026 17:07:22 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
X-Mailman-Approved-At: Fri, 06 Mar 2026 08:35:02 +0000
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
X-Rspamd-Queue-Id: E493D21D298
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:aaro.koskinen@iki.fi,m:airlied@gmail.com,m:andreas@kemnade.info,m:conor+dt@kernel.org,m:jernej.skrabec@gmail.com,m:jonas@kwiboo.se,m:krzk+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:neil.armstrong@linaro.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:jesszhan0024@gmail.com,m:rfoss@kernel.org,m:robh@kernel.org,m:rogerq@kernel.org,m:simona@ffwll.ch,m:thierry.reding@gmail.com,m:tony@atomide.com,m:tzimmermann@suse.de,m:andrzej.hajda@intel.com,m:bavishimithil@gmail.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[iki.fi,gmail.com,kemnade.info,kernel.org,kwiboo.se,ideasonboard.com,linux.intel.com,linaro.org,bp.renesas.com,ffwll.ch,atomide.com,suse.de,intel.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER(0.00)[khilman@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[khilman@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:mid,baylibre.com:email,baylibre-com.20230601.gappssmtp.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action


On Tue, 03 Mar 2026 15:30:09 -0500, Mithil Bavishi wrote:
> This series adds initial support for the Samsung Galaxy Tab 2
> (samsung-espresso7/10) series of devices. It adds support for 6 variants
> (P3100, P3110, P3113, P5100, P5110, P5113). Downstream categorised them
> based on 3G and WiFi, but since they use different panel, touch
> controllers, batteries, I decided to categorise them based on screen
> size as espresso7 and espresso10.
> 
> [...]

Applied, thanks!

[1/8] ARM: dts: twl6032: Add DTS file for TWL6032 PMIC
      commit: 3b142fdcae780cb67ab4cab61cf71647e9566411
[2/8] dt-bindings: vendor-prefixes: Add Doestek
      commit: e17a1b049128274386ebcc9bc88e2fe4fb81a4db
[3/8] dt-bindings: display: bridge: lvds-codec: add doestek,dtc34lm85am
      commit: 3e375496c6d0f8c506afebc7de6bbfc392a6de00
[4/8] dt-bindings: display: panel-lvds: Add compatibles for Samsung LTN070NL01 and LTN101AL03 panels
      commit: bd861514cafab553b7b4dcc3b436a8036c90150f
[5/8] ARM: dts: ti: omap: espresso-common: Add common device tree for Samsung Galaxy Tab 2 series
      commit: f768d54723d13a10e7c7556aeb6087e8938f2951
[6/8] dt-bindings: omap: Add Samsung Galaxy Tab 2 7.0 and 10.1
      commit: 9b2ee6dd895625155ad90c2430e85e9a8885c2c6
[7/8] ARM: dts: ti: omap: samsung-espresso7: Add initial support for Galaxy Tab 2 7.0
      commit: f1bf8f53355411d5afbf0421b59c7218d68e081e
[8/8] ARM: dts: ti: omap: samsung-espresso10: Add initial support for Galaxy Tab 2 10.1
      commit: 16dcd2c7535ed09e97fc075cad97814f0e8968ed

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

