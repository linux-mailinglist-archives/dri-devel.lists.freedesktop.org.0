Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EABgOrmRqml0TQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 09:35:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEFC21D283
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 09:35:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2585510E3B9;
	Fri,  6 Mar 2026 08:35:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Y4VBIp4n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CD8310EC96
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 01:07:25 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-c70ea5e9e9dso3204949a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 17:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772759245; x=1773364045;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tt65nlyH2+056MIjJR2mDSU6Xjc3S4OPgUVzwFjh2sg=;
 b=Y4VBIp4n+H/98k63t8VRFImBloM2TbWcTghS2CJBdyLelwp4radXg36Eff3OBW9jXQ
 k9TVfe29Pd0UYQTurqULyP3FpjyjExxS4KyznC7M9I7I5rfcxwW4kgRyTCfIzMtYweFD
 h7LnV8XRIVHgXqRlaGLZu4HzT+HFJew5a7HTNX0IlrbwOA2AU4OATsN4m3OpNiToKYHU
 YJojEvVi22DVNuQtkA+jqLk+snce1ysj+4PGFXYzoUZhR0Aw0ZdtsmqdM217cGHyzjOV
 JHKDzP78u9MRgXAtmgEfEQDJbDxdUyz6WSijHuV8GKXgb95iod71jiHI372qqaQwKcnv
 +g2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772759245; x=1773364045;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Tt65nlyH2+056MIjJR2mDSU6Xjc3S4OPgUVzwFjh2sg=;
 b=Wsd9mZGgka0OLACdWxRkH8YiYGlSO1wfHF4RRC6YSJljPg7tXHVCakYlySOhyfnAXf
 ytruucpDqDeg/ObEELjLk/juTC9HCmqCri5bEb+2jVvFShHsvfdGx014VJQML/sGS41S
 XXPCqIJPVVa8MPAhsh24LCHVOR7Z94avqfd9XvnojaOnHXFhHe7u615NHmUmtXIulEaX
 HCuOwaES25joVV+PQV5V8cAmEt206iGY21RON5gNZE9L67z9TxS/9pnuJ9M1M8ALqSqk
 hHOaDFxcbvtpmthFIaQxXqdKwEyMaF5DQELQipAqIwzlIFWitF3LRBwLMWRFrqxcyrZ/
 CSBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+RXUiNl8DcM1Mu3jTx/n9rVR9GOQx3p2pZ/7xkP6A3EmSNATRX5jm/aOjA2eU9sITYNh7beBOst4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLxRy/N2PFwCEYgHr0F31kneHbpJD+xgINyCIS5AVOrakqmlZL
 8VyeJ31TfCRRw7zLgfAg+zaOpS+sL/JrYAneg+gcEQVVKVCdeGOau98zuG/nH6sXy3I=
X-Gm-Gg: ATEYQzxsbx85jrHZPrYP9ITMze7fkJf1PxcB+Tg90ivkI107ttqWVuoi+WAZ1IuQLEI
 3pgV1j2ZGx1qBFDtxr0iLR6HPxWmBZZGMN9vkkq0vJdPwdspoBF4TgKahgOIT4/rmHZ8aD7kH0S
 /duf0TX4mCBJXkQxQ0OwXanK3T2FU8YH7/5onmQ84ezm0kdWdwaeMGYvwy2zrIZAphvPkrST7a+
 xAbR1dbD7W0PS93LRH/a9pKIzRN44uuzfEcRWlqwMKtij/adMGVjkouGvkARDgnWkgbCyxWe/Ct
 D5nvlqFM9kTc9wNbouJD1Iu3jPMdpYQHlPxUTAvcPcp5R56LmmfBGhKu4dX3pPIVf4mKA+mzkp+
 MmJxWpRcDjD1w5aHOHZAJdnvLPJEiEcy6l0ySuoyR2RDeMxO6UR7CKdMESFbDJ6hp6ST2ZN8HYl
 viVAVVbYczvaMw1jzT5B1K
X-Received: by 2002:a17:902:e80b:b0:2ae:54b2:27d1 with SMTP id
 d9443c01a7336-2ae82467157mr4766475ad.44.1772759244771; 
 Thu, 05 Mar 2026 17:07:24 -0800 (PST)
Received: from localhost ([71.212.200.220]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ae45e07626sm172535595ad.39.2026.03.05.17.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 17:07:24 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 "Kory Maincent (TI)" <kory.maincent@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Bajjuri Praneeth <praneeth@ti.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
In-Reply-To: <20260216-feature_bbge-v2-1-22805cfdbf62@bootlin.com>
References: <20260216-feature_bbge-v2-1-22805cfdbf62@bootlin.com>
Subject: Re: [PATCH v2 1/3] ARM: dts: ti: Enable overlays for am335x
 BeagleBoard devicetrees
Message-Id: <177275924369.1445909.1029086854461649971.b4-ty@baylibre.com>
Date: Thu, 05 Mar 2026 17:07:23 -0800
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
X-Rspamd-Queue-Id: 4FEFC21D283
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[baylibre.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:aaro.koskinen@iki.fi,m:andreas@kemnade.info,m:rogerq@kernel.org,m:tony@atomide.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux@armlinux.org.uk,m:kory.maincent@bootlin.com,m:thomas.petazzoni@bootlin.com,m:linux-omap@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:luca.ceresoli@bootlin.com,m:praneeth@ti.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:louis.chauvet@bootlin.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[khilman@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[khilman@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,baylibre.com:mid,baylibre.com:email,baylibre-com.20230601.gappssmtp.com:dkim]
X-Rspamd-Action: no action


On Mon, 16 Feb 2026 17:55:52 +0100, Kory Maincent (TI) wrote:
> Allow overlays to be applied to am335x BeagleBoard boards. This adds
> around ~40% to the total size of the DTB files on average.
> 
> 

Applied, thanks!

[1/3] ARM: dts: ti: Enable overlays for am335x BeagleBoard devicetrees
      commit: 18161bb01ede109fed41c66efa2624a4c27377f7

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

