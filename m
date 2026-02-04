Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QEfCJFqOgmkMWQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 01:10:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1384DFE6D
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 01:10:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7F8D10E144;
	Wed,  4 Feb 2026 00:09:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bbHcHMeQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2290810E144
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 00:09:57 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-8c6f21c2d81so625637985a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Feb 2026 16:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770163796; x=1770768596; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r7f2YJ7miQLMROmcW15Cnr/tWaxkZgZRaVrAYVnvYQ8=;
 b=bbHcHMeQGHKTA943VZyB9AioloifFZG6wSmt75+GD7j50lYnWw5IxBIjUuzbxZFSLy
 4YHp+UZS52z8ZWNT4i89M4Hfc66J+lT6jFTcHu3ek1Qi39m+h/IISZUyTVKTIUACEweg
 fZWyEnWfLLaF9DZux4KxXtUW8GzgAp75U8AlBhYNX39Y/wQn88J42XWh1qVOh+giU42J
 HQB+he4v9PrAIQd2meZ9SAxKPeInQWzJimxRC77FJnHCoTcWzfxiLCuZ3XrsrTINBDUZ
 AC/BPmyJJNYOdmENbPCinIRtQTbpLhXL+oTklbc2kulr+p8m4406/nATYa667ui1FXkG
 6lFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770163796; x=1770768596;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=r7f2YJ7miQLMROmcW15Cnr/tWaxkZgZRaVrAYVnvYQ8=;
 b=OzexAG/4W7FgAv3KNwNZ5VyOhApMVGtvKFwCrBdwcItd58CLhN2FXSBYzcp9uIkNX1
 Faidk3QbY0vKLWfgja1q682R8r4neZJGHwm1OUDcdkQRzGxSB0m347SGKFjQnS4ltFS4
 PcDEct7dBkh4+w0YrR4VFOaYXJBuzTfyInlOYzL8FziicTsiY+8kiiCTaIjllXuNRN1B
 VIvzomBK1hijhzZ1tLqCVabxguV1zc9HRsiy8YNUguGI7tF9wwiCEMqN+cZ0j+UbPQTY
 snZvxiFsqfKrZwiiPhVEXYFDYyW8W2VMrLxwF8rfcj7umidb1I04SarkeC+2GnTGNA7d
 ZRsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtLp1lR7PDml7T5lq5kL5TffaAdyPCoMvAPV9SWVjkLhgsckD9qdbeVaddSrO9QbxLE472S/JILJw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyDKncTtZMNs3gwIi8QSR8t0LYUegtaRvfZhvQpUyL/vg3xyGmS
 T4ug4VCgUtl6qNTJHVZnPKc8I9/AGsXB/3zedq/ftSmwDTLNv1xkD7FD
X-Gm-Gg: AZuq6aJLKD1s+KgNYnUw7aCbtYu15gDIZ58GKCUgR8XKv/9horWOb6YXzqtGu/T3f3A
 sfZ3GKujHc5hou1v1d0Hww62RA5ZIjMqQud2LZmjZ5r2MlaIzolpqdinjlrrxvX2LBq25d/oRTJ
 ZVDCkSd6hY/M7j9E5CN3OlRGuGGlOhHelwfVLaBeC2wkOzXRUHblGQs4/CPsF9n35IUaXIfvCgI
 3A3WC3Z8vvLOei3Q4stig/XSo0K/VcU4t5KphL0hzauEXlVZDAt2bu7QqnWlf6G24IMsH6iFYUa
 4eBzguIX0gW9xywPa0X9/ciVMvCFC/3OCw9hhME/dyF3NrJN9idsmmfIhj9hB47CZn5bFHejqBC
 xI9I/Bk6FEHx+4TFr6nfGumrJ9MK6VuiHIMbYa+xul+j2a4pT6oe0efCV4XKxaUVe2KyvKfYgYz
 f0tlzunKJflvcrcGi/kWBE+DrV/V9ajViMSyjmjc4B0abr6UukXBNP26lA8xBhlfoFacepXRA=
X-Received: by 2002:a05:620a:4084:b0:8c6:a82e:16ba with SMTP id
 af79cd13be357-8ca2fa94d53mr165063385a.84.1770163795867; 
 Tue, 03 Feb 2026 16:09:55 -0800 (PST)
Received: from mighty.stonybrook.edu (nat-130-245-192-1.resnet.stonybrook.edu.
 [130.245.192.1]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8ca2fd5382csm70897485a.50.2026.02.03.16.09.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 16:09:55 -0800 (PST)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: andreas@kemnade.info
Cc: aaro.koskinen@iki.fi, airlied@gmail.com, andrzej.hajda@intel.com,
 bavishimithil@gmail.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jernej.skrabec@gmail.com,
 jesszhan0024@gmail.com, jonas@kwiboo.se, khilman@baylibre.com,
 krzk+dt@kernel.org, laurent.pinchart@ideasonboard.com,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 neil.armstrong@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
 rfoss@kernel.org, robh@kernel.org, rogerq@kernel.org, simona@ffwll.ch,
 thierry.reding@gmail.com, tony@atomide.com, tzimmermann@suse.de
Subject: Re: [PATCH v5 5/8] ARM: dts: ti: omap: espresso-common: Add common
 device tree for Samsung Galaxy Tab 2 series
Date: Tue,  3 Feb 2026 19:09:53 -0500
Message-ID: <20260204000953.299628-1-bavishimithil@gmail.com>
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[bavishimithil@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:andreas@kemnade.info,m:aaro.koskinen@iki.fi,m:airlied@gmail.com,m:andrzej.hajda@intel.com,m:bavishimithil@gmail.com,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:jernej.skrabec@gmail.com,m:jesszhan0024@gmail.com,m:jonas@kwiboo.se,m:khilman@baylibre.com,m:krzk+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:linux-kernel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:neil.armstrong@linaro.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:rfoss@kernel.org,m:robh@kernel.org,m:rogerq@kernel.org,m:simona@ffwll.ch,m:thierry.reding@gmail.com,m:tony@atomide.com,m:tzimmermann@suse.de,m:conor@kernel.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[iki.fi,gmail.com,intel.com,kernel.org,vger.kernel.org,lists.freedesktop.org,kwiboo.se,baylibre.com,ideasonboard.com,linux.intel.com,linaro.org,bp.renesas.com,ffwll.ch,atomide.com,suse.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bavishimithil@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: F1384DFE6D
X-Rspamd-Action: no action

> We had the discussion. This should be done via pinctrl irq if possible instead of
> specifying WAKEUP_EN here, You had some trouble to understand how it can be done,
> and we agreed to add the wakeup functionality as a follow-up concentrating just
> on that detail and for now just remove WAKEUP_EN.

Alright, I misunderstood as keeping it and chaning it next time. I'll
remove it.

> still this strange matrix. This is no rotation matrix. Determinant is -1.
> Something is strange here, so also the idea in our earlier discussion was to
> also postpone it and maybe separately discuss it with iio.

Similarly, will remove it for v6.

Best,
Mithil
