Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A341C9CBC0
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 20:13:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C73210E67E;
	Tue,  2 Dec 2025 19:13:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=cse-iitm-ac-in.20230601.gappssmtp.com header.i=@cse-iitm-ac-in.20230601.gappssmtp.com header.b="KNA0Sc5J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F00210E67E
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 19:12:58 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-7b80fed1505so6847768b3a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Dec 2025 11:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cse-iitm-ac-in.20230601.gappssmtp.com; s=20230601; t=1764702778; x=1765307578;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PoDvJkziLciYTaasrjPuBKQQWe6VunhAtZWNX1bE3Xc=;
 b=KNA0Sc5JtaFtZFx/Tc1J7BoZS5u94AgVdMSoB4YFRJL0FamsXXb2E0aqEl/cn3r45f
 Y5u+1UlD5wy8inybAnBEyYPLVbWwjRngOIQUr+7hWsTVdoh7wDghPmCeSlOVR75t+665
 3HM/XpAJrHfIFtM91EX6vvhwNmsiydzdjO0vUCqJYARuFcIBTxGOL3XCYlMIlnf1Uvsq
 b0KuLGoxz/v+R6SQYjU/tCWaFHRevWDTqCz8Sz6AvfudJxvP7k6zg3UUnWE3opPTyDzK
 AyaHi3eLPSpweHkslFdkR0QE1JpG41LLwiHmM6kDiJ6BAaLAsjCUElo6pDbZ1yHx0nsf
 YtVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764702778; x=1765307578;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PoDvJkziLciYTaasrjPuBKQQWe6VunhAtZWNX1bE3Xc=;
 b=G+2S82P8hyksF3aW/ZDFHXJQt7sz0sdMUNGNIcds8XdzX0tO7yoZq5anOxHlZIJaPs
 31oYz55E9UDxJplseOK7lDcspDOnCkroGJB3KCisvwxH7mWS/bZQbAp13iMCGui5CJyS
 aEYnwHXEzGrdBTS1NH4XOvCXq/0LznsGLjjDSp7JFMHhjs8X+mSSJX1QmpC9cJ5j8WGb
 vgTit6Qp71Gs48myuT3BMHU0Mnr1QigMkEMytIQHqwFca5Dtp2HTlcPOyY1wxr6J3DPJ
 ShVh1bKkBPTleqG/R0mIG9eT83Ta7UjDuzmldQqCfTpFJkqKbKhzlpNmfJLVVuW4yExo
 g1iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXepq29OvQiJtGxWQc+eMujaRDKTQ27Sghe3lqKxMDXNaUM/nhAyLrj5MO4SZYsbQKKdSoZwMLmdYk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqxA6hKBWdiQWGucBsR0q+OTE26Z2UNltxNCAx7o4xPAv22uVn
 l7y6hJB3i3qcGr3PnJyPIPUTQCVyVwVhCo8KGAdl+2jsgUtJDWDgyFOsqbe3DB7XDtY=
X-Gm-Gg: ASbGncvuCiSH6j/Nm6+pOLq5KE+Ly0W+4SVg0LcUy4IKBkKXO2EAoHzK+Uu/d7kFDpf
 HkJ/pMwCRsQgs9SGk8G53rXJ2tDPkFl0PBA/tWFTneXUldgiGX62t1RFpTdLJJEQ3haAVkFFYwf
 gNo7F3J9Hi0mwaXjmCHcsHj+0bz/ERtW4/+D3ut7fXoFdtXli9lz1JexYv60tyiRhqtc50U2Ybd
 LSg176/6LBjFXSafYsr7mUXBeWBA7gpU8LIy0Wi/VhaJCPpeTegmOD5On77KJ3BqUJmqSWpDnfz
 lkn3h61xU/c0RTP61qbdPewQwoF7Hxgplo+KvDLm04KsJwQM9/9knU58vV7mZUALBpKnd2tmkbp
 DrU6EN1Jc/022ge84vW5rrjNBF54wTWB48QRLWLR4X4LOheYE95R5xfvSv6viLXmuNwRrR7I9ru
 TVhmV2kOH66CG7j9Z31Aw5W9YD
X-Google-Smtp-Source: AGHT+IGHE284hn7+9senBlcCjJEc3rGRR9ZhVxdNo/lvuyqVWFH3WIFqOw9lMAheJoHvJpVQbmA5cg==
X-Received: by 2002:a05:6a20:9389:b0:35d:8881:e6c6 with SMTP id
 adf61e73a8af0-3614eb0ff86mr49211981637.19.1764702777406; 
 Tue, 02 Dec 2025 11:12:57 -0800 (PST)
Received: from localhost.localdomain ([49.37.219.248])
 by smtp.googlemail.com with ESMTPSA id
 41be03b00d2f7-be4fb248be1sm16064567a12.3.2025.12.02.11.12.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Dec 2025 11:12:56 -0800 (PST)
From: Abdun Nihaal <nihaal@cse.iitm.ac.in>
To: deller@gmx.de
Cc: Abdun Nihaal <nihaal@cse.iitm.ac.in>, niederp@physik.uni-kl.de,
 maxime.ripard@free-electrons.com, tomi.valkeinen@ti.com,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] fbdev: ssd1307fb: fix potential page leak in ssd1307fb_probe()
Date: Wed,  3 Dec 2025 00:42:22 +0530
Message-ID: <20251202191225.111661-1-nihaal@cse.iitm.ac.in>
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

The page allocated for vmem using __get_free_pages() is not freed on the
error paths after it. Fix that by adding a corresponding __free_pages()
call to the error path.

Fixes: facd94bc458a ("fbdev: ssd1307fb: Allocate page aligned video memory.")
Signed-off-by: Abdun Nihaal <nihaal@cse.iitm.ac.in>
---
Compile tested only. Not tested on hardware.

 drivers/video/fbdev/ssd1307fb.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/ssd1307fb.c b/drivers/video/fbdev/ssd1307fb.c
index aa6cc0a8151a..66da8a1a0941 100644
--- a/drivers/video/fbdev/ssd1307fb.c
+++ b/drivers/video/fbdev/ssd1307fb.c
@@ -680,7 +680,7 @@ static int ssd1307fb_probe(struct i2c_client *client)
 	if (!ssd1307fb_defio) {
 		dev_err(dev, "Couldn't allocate deferred io.\n");
 		ret = -ENOMEM;
-		goto fb_alloc_error;
+		goto fb_defio_error;
 	}
 
 	ssd1307fb_defio->delay = HZ / refreshrate;
@@ -757,6 +757,8 @@ static int ssd1307fb_probe(struct i2c_client *client)
 		regulator_disable(par->vbat_reg);
 reset_oled_error:
 	fb_deferred_io_cleanup(info);
+fb_defio_error:
+	__free_pages(__va(info->fix.smem_start), get_order(info->fix.smem_len));
 fb_alloc_error:
 	framebuffer_release(info);
 	return ret;
-- 
2.43.0

