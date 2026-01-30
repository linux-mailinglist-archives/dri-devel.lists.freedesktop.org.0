Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEtCJ2ggfWmkQQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 22:19:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0DCBEC57
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 22:19:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A7D10E085;
	Fri, 30 Jan 2026 21:19:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gZZ6jy44";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FB6810E085
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 21:19:31 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id
 5b1f17b1804b1-47fedb7c68dso27105395e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 13:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769807970; x=1770412770; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=g7emkTAOZf3RTCGxFWHqfyLFM5cRhc8/Waeh1SPd4fw=;
 b=gZZ6jy44DwmtvD/kfhu2EQjw27FjclhdgxBl/9+u1zV8UOVKmZbR7n0Nq4lK6eMKHj
 p/tgcNsxJHPfaFtldOJzeyA3W/ruIPufQtCQwHcdZOBB5HbBQwbcqjMjh8VreSlSOvB4
 oPsx0ZqljJF41ZoOcZjs/ZbHYKnHHMArozJcIzqYqwN3Eg2Ru78ZuS5cqb1HvMltewFZ
 V/CZLEXGYx7okC6mKIWQexfQ7a0bx3r+QVLztsE0gg9j58EoR4eWpiWn5gup8g+XEyya
 bWfms6WwEkTuWeByvqkWlovc6/76hKGNDTvtnGvEjbdY/5Gg1Lc4SiA6Yw+1sDgBroPX
 bQ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769807970; x=1770412770;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g7emkTAOZf3RTCGxFWHqfyLFM5cRhc8/Waeh1SPd4fw=;
 b=ZWUMPKe5wH8zULCEEH9M/hvO1lN/1bCmiMHi1ZKsIKiaYKU1Cn7KXLwaHR9scyzYL+
 3q55GDktQrVLfjNIDsBmV7uLQubRxvGUIevUsMSiv6v7Vw79wR9mvQQuDuYoYYnHPk5n
 ZKd5Mitxh4wYWlZaOvlk3stqOgViPU2EuvaNlsHOEraGeF/QgFI84EDlGDQzlfvO5fIP
 d1gH/tib9stOe4SshF///KjY1YVc1yzgZpRPTb+FsPM9SB2/r3eZ4epyDMM6CnT+uH+x
 y4ogyRP2/XNkpmvu0JH1W34lXeI/kTFhDJ3caueZHzvTbHL9mSkTo7ybdAljItdykpgE
 uSVA==
X-Gm-Message-State: AOJu0YxxwCh3J9lXXIn0AB0bb6qOSHM6iW7DKNrYDPjQAqZmpEJh8djj
 jj1Y+CY9n5OpXkCD0wVkh5m6dbGxpP4agYM1iJOFlwLzYBRA0qL0oq9P
X-Gm-Gg: AZuq6aIMJQhRTJDLvSyg3+jD7/qiXHs7RIHhIJgcCDhfx+UodwdRd6OeRErIpi6ubh5
 Ti+mOM7xuAAZ+vWKxMs4VTqmWsyqVw239c9d3lafKQZksqlnca5F/TJznmOSu/9mO9SF3FDyKCm
 qjSqaVF6dUOtoTocgaJo08iE4mkTW3YBzKwvBGEl+WnKMrNJQmKw3RNhkaszd5ejQqDi0sVkdOd
 TorCX+K0h1w+Va4xJZEZSAQ9bCmOqPGV6yYinWTG8LZ/9jizX8BSwTcWOzpGVA2u+ny5wiSrocY
 +qaZ+kzIjFZyiLYLgAY2DXRITwfleihSi7GZhnnoioGDO83J1hD6SClor7rHtRXDkiaQyfaLi10
 KQ5gaSUTQcmO4n4edPZGm35rju3LCR/YJ9ecxybhJYQIthtyHB6f6yJ70xObT48ulU30hj1MCR3
 bP4dHaQdfucD/waR5zBmoKsMv6qoYv82lYYZxd
X-Received: by 2002:a05:600c:b99:b0:47a:8154:33e3 with SMTP id
 5b1f17b1804b1-482db49a483mr50562055e9.28.1769807969652; 
 Fri, 30 Jan 2026 13:19:29 -0800 (PST)
Received: from localhost.localdomain ([196.235.250.51])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-482e256482esm22544215e9.12.2026.01.30.13.19.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jan 2026 13:19:28 -0800 (PST)
From: Salah Triki <salah.triki@gmail.com>
To: Koby Elbaz <koby.elbaz@intel.com>,
 Konstantin Sinyuk <konstantin.sinyuk@intel.com>,
 Oded Gabbay <ogabbay@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Salah Triki <salah.triki@gmail.com>
Subject: [PATCH] accel/habanalabs: fix device lifecycle handling in
 device_init_cdev()
Date: Fri, 30 Jan 2026 22:19:12 +0100
Message-ID: <20260130211912.220042-1-salah.triki@gmail.com>
X-Mailer: git-send-email 2.43.0
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:koby.elbaz@intel.com,m:konstantin.sinyuk@intel.com,m:ogabbay@kernel.org,m:linux-kernel@vger.kernel.org,m:salah.triki@gmail.com,m:salahtriki@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[salahtriki@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[salahtriki@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 0D0DCBEC57
X-Rspamd-Action: no action

`device_init_cdev()` calls device_initialize() on a newly allocated struct
device. The current release callback, `device_release_func()`, frees the
device directly with `kfree()`. This bypasses the device model reference
counting and violates the expected device lifecycle.

After `device_initialize()`, all cleanup must go `through put_device()` to
properly manage the reference count and invoke the release callback.

Fix the release callback to ensure that the device memory is freed
only when the reference count reaches zero, preserving proper device
model semantics and preventing potential use-after-free or double-free
issues.

Fixes: ea451f88ef9c8 ("habanalabs: Expose devices after initialization is
done")

Signed-off-by: Salah Triki <salah.triki@gmail.com>
---
 drivers/accel/habanalabs/common/device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index 999c92d7036e..df20a0bb63e5 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -698,7 +698,7 @@ static const struct file_operations hl_ctrl_ops = {
 
 static void device_release_func(struct device *dev)
 {
-	kfree(dev);
+	put_device(dev);
 }
 
 /*
-- 
2.43.0

