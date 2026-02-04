Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id rv/dFNj5gmlNgAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 08:48:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D677BE2CFB
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 08:48:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E474210E34B;
	Wed,  4 Feb 2026 07:48:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hQnWqrD2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A33DC10E34B
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 07:48:34 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id
 af79cd13be357-8c5384ee23fso731416185a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Feb 2026 23:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770191313; x=1770796113; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vFAyxlb4iCSkPw1pLsAtumnvdjzuriOCYM9dwXAoQ/M=;
 b=hQnWqrD2VHTOrrNcGpOg4bnT6rKTw1bC25N9SZ3xFj7PBmkCk7glyKajFW8N6OBKi4
 6dABcjCFRjyPKo4hdgU9uuOKmrRHLg9BE5K8viCFpXViShgSxpb7mQeGbl+a+/nAZk8x
 SuBNp6PRouOUyqmsRQWObLp69gHCUY/E/mUGB9GUPariM3meRG6MUddVAfePp2GDLg3n
 su32OHVjcTwFPhJefXUOJl5JG1/2IIhQlS97KmJclixIS+EaYzNLr9SozzdBHbnyRSzV
 FMJ03mQIEkziw5bMLkYCH750i+nekshVY2yHnqy4KV52B56SjAVsIV1BTaIHIZlAK3ce
 WtdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770191313; x=1770796113;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vFAyxlb4iCSkPw1pLsAtumnvdjzuriOCYM9dwXAoQ/M=;
 b=TuqApooEshYhVxieX+oQ8NHYdfKosD7uTykYj5a2SiY9N4TfP/WOo9RyOnR+33rSZF
 REtas90j5jwtsP/s0TPhPAybPgdJGl36bmsDXY7Q9Q4x3v7E2jlfiBdNYexwrVH0zrFy
 8+Tqazc2j1cQCwh4alRWg4IASR6FtrJahV3Vf8CtX55uHsJeT+TGU0wQhCaZCaMG1s1h
 k5Gt9tc5WwyvixKM7sbzONwjcB9WAUa4KNwu2I8zyGob9E8dJ+w9JDmPWI1v8RtZS1Ds
 HLiXr63IK6KfluAOIhlqLeYUNa/MFtW1wqQYU/SfAbSMaiETOdoqlY49mlRF/Gp54TNy
 1ILg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOiTLq37SJgGPj1t2j/dhlqRFsloyCtYDuLpdZJxoyub/qi6JeJ3mSj/1XxKtM8JzfDz0rqvgScs4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwaPh7gO7Wn1Zy8Lbn9TELuOFqKyb59ckiwuNdh4K07eAXVeo5A
 byVkZ2obbP491aH76sOXFyjb/E+Ov6w/nCmEhu3OOYM2gP8kLxCFrBJL
X-Gm-Gg: AZuq6aLnkleR/B+zsffO344uX8/mJKSEjLo1P2esLKJg8lFQbJnp2Lq9feUPRrwArC5
 Ylo82rq0n+Ttp07lXfsgmWS0l0XOCQgGuy+UvgZBEb4nO3YVqYMFm5nt4wJwLENa3O8YxUel7EX
 kFAeHF60ylNERsibbX3HPRNiPu6c5uh6UJmHYKVRyJ/ThA1QEckyh4QMLa8iYUs/VRzOlyJPMyY
 JQsMTzer482ajZ4f36B4YVbMrDpsbwlV/+bkH8iYP1Ck13hPHyj0/AOHhcXq4WO8ZIqHi1kq1rN
 4haai/tCC8K20FjaTyNTBnWEVZHF4HJPBMx36wehGTj/nPWnshXw/jnbJ2yaqD+G+U5vnwxOj7O
 0wCfDBs+WcR6V955WWbHRgvX44Na0VCCZbkWd2VMPmQwbIpkj+eAnJkqJgiiRHPWISjsXUQkUpV
 36qHC1HZ5n0/wVipCtjmARG4e/RRvzGQkH+z7ncVApv1X9x+METbpB5hVo/Mq5Fsa2vFz8YQM=
X-Received: by 2002:a05:620a:f15:b0:8c6:a539:55d7 with SMTP id
 af79cd13be357-8ca2f9cea3dmr248741785a.55.1770191313409; 
 Tue, 03 Feb 2026 23:48:33 -0800 (PST)
Received: from mighty.stonybrook.edu (nat-130-245-192-1.resnet.stonybrook.edu.
 [130.245.192.1]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-89521c19923sm14215576d6.23.2026.02.03.23.48.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 23:48:33 -0800 (PST)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: andreas@kemnade.info
Cc: aaro.koskinen@iki.fi, airlied@gmail.com, bavishimithil@gmail.com,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 khilman@baylibre.com, krzk+dt@kernel.org,
 laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, neil.armstrong@linaro.org, rfoss@kernel.org,
 robh@kernel.org, rogerq@kernel.org, simona@ffwll.ch,
 thierry.reding@gmail.com, tony@atomide.com, tzimmermann@suse.de
Subject: Re: [PATCH v5 5/8] ARM: dts: ti: omap: espresso-common: Add common
 device tree for Samsung Galaxy Tab 2 series
Date: Wed,  4 Feb 2026 02:48:31 -0500
Message-ID: <20260204074831.300311-1-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260202090408.4c3757cb@kemnade.info>
References: <20260202090408.4c3757cb@kemnade.info>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:andreas@kemnade.info,m:aaro.koskinen@iki.fi,m:airlied@gmail.com,m:bavishimithil@gmail.com,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:jernej.skrabec@gmail.com,m:jonas@kwiboo.se,m:khilman@baylibre.com,m:krzk+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:linux-kernel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:robh@kernel.org,m:rogerq@kernel.org,m:simona@ffwll.ch,m:thierry.reding@gmail.com,m:tony@atomide.com,m:tzimmermann@suse.de,m:conor@kernel.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER(0.00)[bavishimithil@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bavishimithil@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[iki.fi,gmail.com,kernel.org,vger.kernel.org,lists.freedesktop.org,kwiboo.se,baylibre.com,ideasonboard.com,linux.intel.com,linaro.org,ffwll.ch,atomide.com,suse.de];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: D677BE2CFB
X-Rspamd-Action: no action

> We had the discussion. This should be done via pinctrl irq if possible instead of
> specifying WAKEUP_EN here, You had some trouble to understand how it can be done,
> and we agreed to add the wakeup functionality as a follow-up concentrating just
> on that detail and for now just remove WAKEUP_EN.

I think I may have understood what is to be done.
For example we have 
pinctrl-single,pins = <
	OMAP4_IOPAD(0x0bc, WAKEUP_EN | PIN_INPUT | MUX_MODE3)
>;

for wlan_host_wake, so the change needed to be done is from
interrupt-parent = <&gpio3>;
interrupts = <17 IRQ_TYPE_LEVEL_HIGH>;
interrupt-names = "host-wake";
pinctrl-names = "default";
pinctrl-0 = <&wlan_host_wake>;

to

interrupts-extended = <&gpio3 17 IRQ_TYPE_LEVEL_HIGH>, 
			<&omap4_pmx_core 0x0bc>;
interrupt-names = "host-wake", "wakeup";

and remove the pinctrl?
Similarly for all in the omap4_pmx_core domain (wifi, bt, i2c as the
drivers support it)
No chnages for &omap4_pmx_wkup domain
