Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 618A385A2AF
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 13:00:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A81A710E353;
	Mon, 19 Feb 2024 12:00:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=marliere.net header.i=@marliere.net header.b="r2yqU9sK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9968410E343
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 12:00:17 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-1d73066880eso41351265ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 04:00:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708344017; x=1708948817;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:dkim-signature:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+ceTuhqP93bH+p1U/4Nuj7uzSb4ni/tc46LUJgesgV0=;
 b=Ujb2u46cxPgve17IEljUbXRtszq99GB6HQ2NQRwlfzFvtMpWMVwGKayfwqqB7hxnPO
 jlcu5nVaIJT/KPBjiz31GmPnYmCaOxaav+YxKUkjzrZT/efogKk2VXil87hIatySYPKG
 gm9JvP4xVSAYJFl3Axbi+3wUmktaPszGLM7KUSQIvAiNZzCGGJttxBPZQuJWYAKkHwfC
 8Okre+Elp21xxmbLRyemTRnAFLCYtpTP/wzBpLpZ4FHVSTSVxDNE2drI7GO80fEfETyq
 ZejdJLUmFPo77TTvWamuj2twJ8OxvAaKM5lBg8dRzI+bFSSWsv2ei9gMYAUJA8plLQW2
 QIdg==
X-Gm-Message-State: AOJu0Yxx9mRbuxu7wxap7tFawFq/E9rsM8Ry8Vk3uIILojcj27n0Wc8S
 nO3uBpnirMIUpMU3iHOgzEM28/atd8H7j8JND9Q+BSDuk+2UgFTA
X-Google-Smtp-Source: AGHT+IEN9ChGeMnDJJIbUUp1Te4f0gqEOgxdvDik2FSQpy1djK61w/k2ZmjVgWA4Jr3lObS/PF3Bnw==
X-Received: by 2002:a17:902:d511:b0:1db:cf8c:d3c1 with SMTP id
 b17-20020a170902d51100b001dbcf8cd3c1mr8097410plg.57.1708344016487; 
 Mon, 19 Feb 2024 04:00:16 -0800 (PST)
Received: from mail.marliere.net ([24.199.118.162])
 by smtp.gmail.com with ESMTPSA id
 p3-20020a170902c70300b001db86c48221sm4224248plp.22.2024.02.19.04.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 04:00:15 -0800 (PST)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
 s=2024; t=1708344014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+ceTuhqP93bH+p1U/4Nuj7uzSb4ni/tc46LUJgesgV0=;
 b=r2yqU9sKWtNvOwenunllWDUFpDxanXCUgWNClVjK6HldtqKIL6EouJxLqOOE7WbSj7ACGQ
 uZI/bKP5PiznKj5n1NgSOzNwI7h6oUDtkqCG6W97HplmmSVbHR1hYT5wmrLXlpHyYQ7ehl
 ubzYWXldNTTBIYzrKebII0jKPHY8lZiZ1QEzzErOjLQAT2/czCjxHpywP6Uo5LwimlZRau
 KM9vltFTs3RsiRWc1t/Xq/3ikG+bIb6v9PzUv2jEGBIzAE1qY9KbuRXcDiqAJ+bkQwyHBL
 vl9WVBMfRLUt/GzVRC/+cPzHzDQv509mzlsfG9ieiXO5FRITSdBAHa6dtTzrSA==
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
Date: Mon, 19 Feb 2024 09:00:52 -0300
Subject: [PATCH drm-misc 2/3] drm/privacy_screen: constify the struct
 device_type usage
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240219-device_cleanup-drm-v1-2-e2f2acb38bff@marliere.net>
References: <20240219-device_cleanup-drm-v1-0-e2f2acb38bff@marliere.net>
In-Reply-To: <20240219-device_cleanup-drm-v1-0-e2f2acb38bff@marliere.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Hans de Goede <hdegoede@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Ricardo B. Marliere" <ricardo@marliere.net>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1047; i=ricardo@marliere.net; 
 h=from:subject:message-id;
 bh=Zbpl54vz+j7VK1lL7d8GEo/58z6p6dU/i6sdwxlkH9Q=; 
 b=owEBbQKS/ZANAwAKAckLinxjhlimAcsmYgBl00L1Yti36lbOzneUCF80ZmSkp/FO9XDLY3YU2
 JB1FS7moZaJAjMEAAEKAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZdNC9QAKCRDJC4p8Y4ZY
 pmu2EACilPwO+2JjpT7yUaLrxh0L/LqgGXLvq7nb3RkrM5xqys7r5yIwmqj5OphsgF9WlwSXxCt
 0KXP5J4ly0XfKtgI4IbSXeUlo2zXyqjG/qzYG4OQoS6v+V6v2+UuC2ax0L+pQC6EkKX979/eOSG
 io/NTZczgf5T8NeevmG/AIL7QgTtfkwtu0ZPT6gzExzL/5C+z3Mpeg2uiJM5XSSjJV8kv0pSa2a
 REUmpVtpCgIrdgRirp7bNcQk0fk15i3djGHQYhvgjoIlmC8oAnD/oS//tEq7SWmUgcI0LxQLT4G
 Sn31Tb3w6oXvsIAZFJKPKXAvblQIdB9furVbQD+QBUdrd7YbW79f6TDH3N+/6wAPipPuUn5T0Ju
 5sLycEeCWHy2+oErhGAYIGSeAfejS/2qHcy0y0f8zZuYNSkmH6zhd2yo+Vlm+Lo7XbtGRG0x/5m
 ZO3GJSNrGflLsCljf4BiPK7PJR6PVl4AAqyrTHD5V3pEbMZioFagpfitLtpH5/XdWWgFgQ8AfPT
 iQ84DADLdt3cBf2mReZRSXcq+xaaTmxGqGaubQMcudRz4Bz/34hJMi/qVZJuPlgtM+1bHvNDakO
 Ak6Bey4i9tCdQypPwuKEiJu1gfkVuVIDrbcqEc/g5XoZZEInDKCnU7fdStoc3Xt/j67zeDo8DcE
 23urScHg0588jKA==
X-Developer-Key: i=ricardo@marliere.net; a=openpgp;
 fpr=030A8E9E424EE3C0655787E1C90B8A7C638658A6
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

Since commit aed65af1cc2f ("drivers: make device_type const"), the driver
core can properly handle constant struct device_type. Move the
drm_privacy_screen_type variable to be a constant structure as well,
placing it into read-only memory which can not be modified at runtime.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
---
 drivers/gpu/drm/drm_privacy_screen.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_privacy_screen.c b/drivers/gpu/drm/drm_privacy_screen.c
index 6cc39e30781f..088a30b3b488 100644
--- a/drivers/gpu/drm/drm_privacy_screen.c
+++ b/drivers/gpu/drm/drm_privacy_screen.c
@@ -363,7 +363,7 @@ static struct attribute *drm_privacy_screen_attrs[] = {
 };
 ATTRIBUTE_GROUPS(drm_privacy_screen);
 
-static struct device_type drm_privacy_screen_type = {
+static const struct device_type drm_privacy_screen_type = {
 	.name = "privacy_screen",
 	.groups = drm_privacy_screen_groups,
 };

-- 
2.43.0

