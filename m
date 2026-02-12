Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AF12CZgbjWmkzAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:15:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD381288BB
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:15:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 296C710E6A3;
	Thu, 12 Feb 2026 00:15:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AVJg+dul";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f67.google.com (mail-oo1-f67.google.com
 [209.85.161.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE41410E685
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 00:15:10 +0000 (UTC)
Received: by mail-oo1-f67.google.com with SMTP id
 006d021491bc7-6729292dcd7so1268980eaf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 16:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770855310; x=1771460110; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ves6/eFJLAs0HG68Znj+VH4wZtUdDvx4ZnDak47UPW8=;
 b=AVJg+dulYxieDBAhsaxUh5GnUE0RpD7inZHgIU27pD2OzwT8xi/NiZwDKsiuRUhb3P
 B6qVOBSKe3yCc6vxmRmVOOuO7+jyCjY6BZdGQActmubvMFPatW1UpcYY69/vogjnNJck
 veL3sbor927KLGgOMxRImyAXXvyyicb8wbgo6pPivfvttlzgcU9Gz6KxklWLO+Ga13zp
 4UPH1naM6uPiaFgBPi4D8lgsKCs7mCWOuGoKfHaqNIOyy/s2py3a3ekkyCsXR/WvyvGH
 QXooYnF6fEqQBljGY5PCzHa8hyJb0DoJ//jgVwYr0LYIwLZoZReUfSSLFgMWGmdgH0Qu
 MGkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770855310; x=1771460110;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ves6/eFJLAs0HG68Znj+VH4wZtUdDvx4ZnDak47UPW8=;
 b=EDXo1L9BsslXYmTL4A60D/AWmEHlXFVT9f6FWZZEDsyiqLIbfs0EvBPufRY3QAqpkz
 gDlpVWbEq8JmcTBJKMr6fzkPt6Ohv4RG7EeC8i4PX6TRoDWyjntCFd2qzqCwcPsaDgEZ
 NHOP2tTbdUPhnhRLHdYbwCIG1AAHTkL11J2Zc/lDa9ruehndFTkzoFvC4QqvkU725t/Z
 NgRUcSQGIWbptHZeoCnjpFmqXKTqkILRfFY9yA6SdEpYzc3JCkhSMPoW5pcdzcggRU+B
 c/M2jvNY7xxJRQjeHUp1VkZsCmWfWnH3rbRRo5lHjxPeZwNwnHhTV5VgxK8ovXCcrDzE
 e1+Q==
X-Gm-Message-State: AOJu0YzdcuEANCw2/Aj7+64e2b+wzqn7yxbNg1tFaj5dIh9kgXFoC3OJ
 sjtMmSfyYy9EYYlqT8zsuEje2HkeACXfmWOj8AwPGZM8tQYEu+9bTwRw1af39EGo
X-Gm-Gg: AZuq6aK//VCFqmz8Ei4yvzyItIqGi/pB70JSHrWgJrrCkuj2gU01Whr2W6eIkmTCSlZ
 M6RaQXEmGb0M+SA7zkFmPcFzgbURW00IO7b2j7EQ0a9BcohBI8teyRKFPwP/usXwQhelkpi1KtI
 t+LJ5Xvwmvd8uVTx39AX77I3/aD1AQVUwU+4Uz4+cu+hRcNgNT+unbxI20yJjsG6M3Iv05gpQIe
 KF2V3zf3HtcwCJ95aaGvJ2PK/AZ6cBpkXfrdzqlAzLPGUj4t6fwazBRlyZNMHdGtcyF3IpoLXrn
 IZFaqLpqkdJxv89Veee+JKUKkdg8SWQfNIQWi1+tMd2rQHxM/q8/5o2ZklvW6aIsyoNjfUpaeZL
 Os6s+8qDS33dYJQ3Fz7x4WGYo71f0p6odVyPOPjbIgs4dMlrPn7u2u+sJzcZJUApdoIhHJDa9wM
 2AUzwI9Vz5bkWGQhcryMlY49dxdIMmv4jH3bgNSaxc2ckpMwnCGorA
X-Received: by 2002:a05:6820:188b:b0:662:f0cb:84c5 with SMTP id
 006d021491bc7-675dbafc487mr135753eaf.34.1770855310085; 
 Wed, 11 Feb 2026 16:15:10 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-40eaf1062ffsm2331939fac.13.2026.02.11.16.15.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Feb 2026 16:15:09 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx-trybot@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 55/61] drm-dyndbg: add DRM_CLASSMAP_USE to the qxl driver
Date: Wed, 11 Feb 2026 17:13:50 -0700
Message-ID: <20260212001359.97296-56-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260212001359.97296-55-jim.cromie@gmail.com>
References: <20260212001359.97296-1-jim.cromie@gmail.com>
 <20260212001359.97296-2-jim.cromie@gmail.com>
 <20260212001359.97296-3-jim.cromie@gmail.com>
 <20260212001359.97296-4-jim.cromie@gmail.com>
 <20260212001359.97296-5-jim.cromie@gmail.com>
 <20260212001359.97296-6-jim.cromie@gmail.com>
 <20260212001359.97296-7-jim.cromie@gmail.com>
 <20260212001359.97296-8-jim.cromie@gmail.com>
 <20260212001359.97296-9-jim.cromie@gmail.com>
 <20260212001359.97296-10-jim.cromie@gmail.com>
 <20260212001359.97296-11-jim.cromie@gmail.com>
 <20260212001359.97296-12-jim.cromie@gmail.com>
 <20260212001359.97296-13-jim.cromie@gmail.com>
 <20260212001359.97296-14-jim.cromie@gmail.com>
 <20260212001359.97296-15-jim.cromie@gmail.com>
 <20260212001359.97296-16-jim.cromie@gmail.com>
 <20260212001359.97296-17-jim.cromie@gmail.com>
 <20260212001359.97296-18-jim.cromie@gmail.com>
 <20260212001359.97296-19-jim.cromie@gmail.com>
 <20260212001359.97296-20-jim.cromie@gmail.com>
 <20260212001359.97296-21-jim.cromie@gmail.com>
 <20260212001359.97296-22-jim.cromie@gmail.com>
 <20260212001359.97296-23-jim.cromie@gmail.com>
 <20260212001359.97296-24-jim.cromie@gmail.com>
 <20260212001359.97296-25-jim.cromie@gmail.com>
 <20260212001359.97296-26-jim.cromie@gmail.com>
 <20260212001359.97296-27-jim.cromie@gmail.com>
 <20260212001359.97296-28-jim.cromie@gmail.com>
 <20260212001359.97296-29-jim.cromie@gmail.com>
 <20260212001359.97296-30-jim.cromie@gmail.com>
 <20260212001359.97296-31-jim.cromie@gmail.com>
 <20260212001359.97296-32-jim.cromie@gmail.com>
 <20260212001359.97296-33-jim.cromie@gmail.com>
 <20260212001359.97296-34-jim.cromie@gmail.com>
 <20260212001359.97296-35-jim.cromie@gmail.com>
 <20260212001359.97296-36-jim.cromie@gmail.com>
 <20260212001359.97296-37-jim.cromie@gmail.com>
 <20260212001359.97296-38-jim.cromie@gmail.com>
 <20260212001359.97296-39-jim.cromie@gmail.com>
 <20260212001359.97296-40-jim.cromie@gmail.com>
 <20260212001359.97296-41-jim.cromie@gmail.com>
 <20260212001359.97296-42-jim.cromie@gmail.com>
 <20260212001359.97296-43-jim.cromie@gmail.com>
 <20260212001359.97296-44-jim.cromie@gmail.com>
 <20260212001359.97296-45-jim.cromie@gmail.com>
 <20260212001359.97296-46-jim.cromie@gmail.com>
 <20260212001359.97296-47-jim.cromie@gmail.com>
 <20260212001359.97296-48-jim.cromie@gmail.com>
 <20260212001359.97296-49-jim.cromie@gmail.com>
 <20260212001359.97296-50-jim.cromie@gmail.com>
 <20260212001359.97296-51-jim.cromie@gmail.com>
 <20260212001359.97296-52-jim.cromie@gmail.com>
 <20260212001359.97296-53-jim.cromie@gmail.com>
 <20260212001359.97296-54-jim.cromie@gmail.com>
 <20260212001359.97296-55-jim.cromie@gmail.com>
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[jimcromie@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: CDD381288BB
X-Rspamd-Action: no action

The qxl driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/qxl/qxl_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
index 2bbb1168a3ff..73998bb331d9 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.c
+++ b/drivers/gpu/drm/qxl/qxl_drv.c
@@ -67,6 +67,8 @@ module_param_named(modeset, qxl_modeset, int, 0400);
 MODULE_PARM_DESC(num_heads, "Number of virtual crtcs to expose (default 4)");
 module_param_named(num_heads, qxl_num_crtc, int, 0400);
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 static struct drm_driver qxl_driver;
 static struct pci_driver qxl_pci_driver;
 
-- 
2.53.0

