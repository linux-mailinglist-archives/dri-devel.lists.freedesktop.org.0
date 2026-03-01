Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id vy7gJPrAo2neLgUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 05:30:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCB81CE836
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 05:30:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB0F510E0B1;
	Sun,  1 Mar 2026 04:30:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="LJLU2K0E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E7510E0B1
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Mar 2026 04:30:45 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 46e09a7af769-7d4c1d2123dso4169461a34.2
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 20:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772339444; x=1772944244;
 darn=lists.freedesktop.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sQFxGVZmWaMHo9qlrrNZNN2FVcLqgzxrf70qWHbleFg=;
 b=LJLU2K0EeUwpWrSYTH3n5hrj/znkf14GaYV/hj8OQCHBdZMvmt34WW7IipJSqv40jf
 vKz3HXnfGBbWuyzEzFoHKUsYLJRhgtI1qybVAVtEZvGyMRCd5kNUTzMfodqje2/ODBMS
 X6/JwETm4gP8q5nNMiR0JmPv7iPqqKfUunYBwVTIgEz1VZOLE9OPGz4G9UV2EJG5fJgB
 XOiZeqEodKAoV5kqbyiDsvAhgJqdZzTPYy0c+7QoZBDEQQXVp/+b16Yqywn8SMqpkWtl
 TFunBVCLKmMtWdEbYfooIk0GbMZkTr4SuB+9PR7z3lTbsA3YgvdfRQqN9UMlsNNOMCkH
 TvJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772339444; x=1772944244;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sQFxGVZmWaMHo9qlrrNZNN2FVcLqgzxrf70qWHbleFg=;
 b=Ph0aeQ9GKZcHvgLwkL1/OddP6emu/AF81s62G0+ukz0NKsPILnlGareADHXCBtz3hy
 /ZJzHwADx8pxzMBUMU2+ToflS5yguiTwpTF8VbkDj7rE4S/GnRnSWWSA306cHjS7Pay8
 v0LKdXRtYaoeXo6crmPglnJkigMoZEjbqTmNrhbcTZh6QqNgC27aKahGhHkr6hVhD10w
 U7NoAzH07reVBcGtXufA1ZEm4bqRQWKPT3sDqqQ84Kj+fnCw7EN2+K9e/9zyWWyoCtt5
 2JBicXlbrcoXRBKVkVRqj9fQjwOukw/Abxnn2gYeo8sEAwku0Y0cVVUctOA6X20+4HSR
 aYZg==
X-Gm-Message-State: AOJu0YwCpVeI6YST3APLDRm6qWNjZYS7COVBGiYDjovCM7kC14CuOhal
 /ZYgW3nlrIm6pPJHqONm4uQHOcAQqcM6i8b/lyQ+rh3pcNlsI3PLKcC0DM/GmOO3VzU=
X-Gm-Gg: ATEYQzzFga1eMJucNUWed0zkkoAYePV7XkG6mbghJmEMLcoNAIHunvAYltE737tk2qT
 2Jnultce8ZKr0PowCnmhOwwfMYYNaT7eUeqb6XuPX+EjOFeCavI6GPnky1qYOJgPs7zqzddgQG4
 Qyqen5HIiP7GcCG+mP9X019c/ylBqoGBEfJbmkmBDbuwaUqYYhSNCgn5YE93k1srC7di1S66Azs
 NBGhC5Y9pReeoevHJ1s0+GzZcjea9/KVxbvIdV3m+dG4tR1A/H3EPKiJYXtkZy9U5YhXWQzfC5t
 36E2BbglHBKk+Mx9rigCNy8Tqxvqg94i9QquqiVQYBfGEiwcRTbK6znKbEeGaWUBl+YZ7ijZANo
 1s1S+RnQVedSH7KdmD9AHXJ3BYCUQuQHYJ4nISf1V3eioyemKJcgXG1NL2xoyBUxT4FrIV4TXqz
 79g7FxYGbm9CTedCC3e28ialPkt1j/
X-Received: by 2002:a05:6870:b022:b0:409:40bb:6b75 with SMTP id
 586e51a60fabf-41626d6a0f0mr5262208fac.4.1772339443803; 
 Sat, 28 Feb 2026 20:30:43 -0800 (PST)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:8b9c:d657:204d:5a5f])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4160cf9b240sm8691324fac.8.2026.02.28.20.30.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Feb 2026 20:30:42 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Sat, 28 Feb 2026 22:30:30 -0600
Subject: [PATCH] drm/sitronix/st7586: fix bad pixel data due to byte swap
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260228-drm-mipi-dbi-fix-st7586-byte-swap-v1-1-e78f6c24cd28@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2NzQqDMBAGX0X23A+2EW3wVUoPmmzaPaghK/1Bf
 HdDjwPDzE4mRcVoaHYq8lbTdalwvTQUXuPyFGisTI5dz855xDJj1qyIkyLpF7bdOt9j+m0C+4w
 ZiSO3oUueOVDt5CLV+z/uj+M4AVKtzG1zAAAA
X-Change-ID: 20260228-drm-mipi-dbi-fix-st7586-byte-swap-f0d03c5f800c
To: David Lechner <david@lechnology.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 =?utf-8?q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2151; i=dlechner@baylibre.com; 
 h=from:subject:message-id;
 bh=168Vbra7DayOovNDOmdxdPeHFzYPFepW7t9oT9+Tlyk=; 
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBpo8DoLCMP+QuNycAxAYQKo6oRR6R77oo3Rf3Ga
 QSVEDP3nWCJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaaPA6AAKCRDCzCAB/wGP
 wBN/B/98DGdrBhwC+QmpKsBqYgt/LNqH685vMOsQz3A58BKyu+SO/TFvMctBHp+ytM/d5RoajvY
 QZqzhwbWf+UaQTcVxtZob4IOdGroboqPMB2vB01r/ZIz132qXB64gTrbUKzkOQiL1dBOoxAxqb9
 K71MD4BcSiEfL8uZseTRf7dOhiShG400AUEoGxfOJ8j2EaYryeH6UvAzQdqdSnHyQtG/engqbrx
 wgtckl3ijlbjU88A3mzTWNXLwYCvTI4NZIP2RISQ2TPbuSFlPRY1NJzcRPKMKxmmsiy6HtTcVTf
 ZC3sjoYTUD0tHWHApwxuGa4AgiShErSm35sGDce2oto1TJjR
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[lechnology.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,tronnes.org];
	FORGED_SENDER(0.00)[dlechner@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:david@lechnology.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:noralf@tronnes.org,m:lumag@kernel.org,m:linux-kernel@vger.kernel.org,m:dlechner@baylibre.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlechner@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre-com.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: BBCB81CE836
X-Rspamd-Action: no action

Correctly set dbi->write_memory_bpw for the ST7586 driver. This driver
is for a monochrome display that has an unusual data format, so the
default value set in mipi_dbi_spi_init() is not correct simply because
this controller is non-standard.

Previously, we were using dbi->swap_bytes to make the same sort of
workaround, but it was removed in the same commit that added
dbi->write_memory_bpw, so we need to use the latter now to have the
correct behavior.

This fixes every 3 columns of pixels being swapped on the display. There
are 3 pixels per byte, so the byte swap caused this effect.

Fixes: df3fb27a74a4 ("drm/mipi-dbi: Make bits per word configurable for pixel transfers")
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/gpu/drm/sitronix/st7586.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/sitronix/st7586.c b/drivers/gpu/drm/sitronix/st7586.c
index b57ebf37a664..16b6b4e368af 100644
--- a/drivers/gpu/drm/sitronix/st7586.c
+++ b/drivers/gpu/drm/sitronix/st7586.c
@@ -347,6 +347,12 @@ static int st7586_probe(struct spi_device *spi)
 	if (ret)
 		return ret;
 
+	/*
+	 * Override value set by mipi_dbi_spi_init(). This driver is a bit
+	 * non-standard, so best to set it explicitly here.
+	 */
+	dbi->write_memory_bpw = 8;
+
 	/* Cannot read from this controller via SPI */
 	dbi->read_commands = NULL;
 
@@ -356,15 +362,6 @@ static int st7586_probe(struct spi_device *spi)
 	if (ret)
 		return ret;
 
-	/*
-	 * we are using 8-bit data, so we are not actually swapping anything,
-	 * but setting mipi->swap_bytes makes mipi_dbi_typec3_command() do the
-	 * right thing and not use 16-bit transfers (which results in swapped
-	 * bytes on little-endian systems and causes out of order data to be
-	 * sent to the display).
-	 */
-	dbi->swap_bytes = true;
-
 	drm_mode_config_reset(drm);
 
 	ret = drm_dev_register(drm, 0);

---
base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
change-id: 20260228-drm-mipi-dbi-fix-st7586-byte-swap-f0d03c5f800c

Best regards,
-- 
David Lechner <dlechner@baylibre.com>

