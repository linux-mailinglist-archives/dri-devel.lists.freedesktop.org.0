Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uB1sLD2JkWnHjgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 15 Feb 2026 09:52:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A55C13E521
	for <lists+dri-devel@lfdr.de>; Sun, 15 Feb 2026 09:52:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BF1710E358;
	Sun, 15 Feb 2026 08:52:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GRmSdtqo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B79D210E355
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 08:52:02 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-b883c8dfb00so425176766b.1
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 00:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771145521; x=1771750321; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MlvES5BQowFnveKWOlQvLxyVour2p9sJV5ltUYs6/Rk=;
 b=GRmSdtqo0rdhTsRaS/O7O1fZ6pOvIjnSV1DKjdgv4lafTewcN11fHxUh6AjetZriAd
 GBcGtFMoQB+dFZVkff5clHN29syr0O0IXhMw/9BAa5mlVDpqo0e3c2TMD16qILVf6rRH
 bgdyYKcJ75bRI7IVCh4qzFC+aSneTVTu++X4WsRkCtfX27qS0jhLPRfWvo8xDjZt1pbo
 wqF1oW03jDR8N0Mowd4CpVs4TbtLA350Y+o+B5dG1LLE1kxEFwIgYTigjKpBC+RFGWWE
 5ZJv1BIOn88VyOXkTXPvgKLh5WJVslSmEnxtDA+zPO3mJrrlf2suciyWDSkoc8ndzIlS
 MN7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771145521; x=1771750321;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MlvES5BQowFnveKWOlQvLxyVour2p9sJV5ltUYs6/Rk=;
 b=Oa/loNI8e67OqWKibYg9lulavxwz4iKF7wGNyrNm1Gw4oNvkix4O82e/ZU5P6dliEN
 5UeYRWtrgKuUFDIEfGKtM5wPuneNIR5VTtLFVf50Pm96UWoWeXU+EqDMydWZOsS/gs4m
 3ffejwMN3XLG5rqEFSp6hAOj+7CnqaWSMvyJbUUo4wzPfUiznDWUXeEQFlgNtl/d2CDh
 DkRKt2Wx8Ls7zBH5LplZflg3JJPLIJH+JE0Qqotn5Yqfyka4jwu5uc/6UqIC1bU3ng9G
 U+gH0Od75qbZjpTpekUQfCbWcipoe+DrLjV4qjfQjMu6cmJwiy+v1vevTV3hc30RUsgE
 K7hw==
X-Gm-Message-State: AOJu0YwixfKQI0TTMy1Xu5OXzEHS30OrUNLlakQQqPXJGs0PbonMn5cg
 9N0L4jnCsSHskMF5q3jE9IFRFIKHctBFKQ9sB/W8wEQy5R1ZOqg0FuIS
X-Gm-Gg: AZuq6aIOtY1BttbGC9aRUXiemwRzHjR/wa4IILMKs2A6Ne8AXBCEiQfkRBacPPDN/HQ
 d+XXKra9bMn/r1U390Q+qLNy3I3ldm+TVQZXMPtNyCVbmT0a5Wq2ghZNGNkbUnKOgAlSJkEsEw6
 lbTOoIDxh6yk30TCNRTNYzE1KUeKNRcd7aojYq+Mlb7k2mtPFR7iVnliyTjzE0aGIGaXJXbpHkR
 yd4+tipnF5PCyBxz64GBliFOZ+AI7MGIrbGaE8FB61N2RKtQpCm4a8UwDZ3M3a8RW8dNXFOLLfi
 HLDhLmKtYDwqH/hzvjOf8rhiyBqxVvJzXbK+2jSCSz3+M707Mo1aJ9L8Y3rlSi/XGEYCMTm+x+m
 qz+AKR2hh0eedlRg2QiilgbJ0UYiijTfg0+6+Vq9+OQwhHLqIyryI6ZAdqKykxA5MHrxSnpaJyF
 mhBlDqUNFC+Fgw
X-Received: by 2002:a17:907:86a9:b0:b87:6b9c:6386 with SMTP id
 a640c23a62f3a-b8fb4532632mr371016366b.56.1771145521058; 
 Sun, 15 Feb 2026 00:52:01 -0800 (PST)
Received: from xeon ([188.163.112.48]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8fc7629b63sm139799766b.35.2026.02.15.00.52.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Feb 2026 00:52:00 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/5] drm/panel: r61307: align with schema property
Date: Sun, 15 Feb 2026 10:51:35 +0200
Message-ID: <20260215085140.20499-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260215085140.20499-1-clamor95@gmail.com>
References: <20260215085140.20499-1-clamor95@gmail.com>
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
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:clamor95@gmail.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 8A55C13E521
X-Rspamd-Action: no action

Rename renesas,inversion to renesas,column-inversion according to schema.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/panel/panel-renesas-r61307.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-renesas-r61307.c b/drivers/gpu/drm/panel/panel-renesas-r61307.c
index 319415194839..873ef856184b 100644
--- a/drivers/gpu/drm/panel/panel-renesas-r61307.c
+++ b/drivers/gpu/drm/panel/panel-renesas-r61307.c
@@ -259,7 +259,7 @@ static int renesas_r61307_probe(struct mipi_dsi_device *dsi)
 		return dev_err_probe(dev, PTR_ERR(priv->reset_gpio),
 				     "Failed to get reset gpios\n");
 
-	if (device_property_read_bool(dev, "renesas,inversion"))
+	if (device_property_read_bool(dev, "renesas,column-inversion"))
 		priv->inversion = true;
 
 	if (device_property_read_bool(dev, "renesas,contrast"))
-- 
2.51.0

