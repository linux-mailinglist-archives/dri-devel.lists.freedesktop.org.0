Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 755E32C7639
	for <lists+dri-devel@lfdr.de>; Sat, 28 Nov 2020 23:41:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 417016ECE7;
	Sat, 28 Nov 2020 22:41:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E28E46E0D9
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 22:41:42 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id y10so10588633ljc.7
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 14:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y9DoNLVD1VJdMvYkN8JAl3I/nCqyKUSn3u0XqPwML4w=;
 b=ZusRrASFECptUJSOveiHQvYDfWj66YcjXLdZqrYufzMQ6FYHpk5mUHtLtBasEaUMUE
 tw3OASadraNE+yTe0bzr7mJKOWcf8M0zyAc1AlYdy0g7uPnVc9LW2d2WYn3wNezvsPyB
 QmEwQkrcj+KR5Z5icz8mpns2eXNK1CM52JsAjkKg/uKNR3/BWr36Od2ITt2t23gaOKyx
 VR1X1oQFdNr0IqP9Omdsohq2d9SNWuvQbbm4GyVW+6+ADBlK6tb34hqdr1bczhPftGkR
 qlPSqQEseT3oYOQhcHciGAoFju1VPmS0k6OC5FuRRI/em0Z40+ynbJjbok+mAg1J5z4H
 a4LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=y9DoNLVD1VJdMvYkN8JAl3I/nCqyKUSn3u0XqPwML4w=;
 b=jcUAoowDXMCCcQnORnpA0BEGVzpQfE6irS3RiChJlxp22dgZUmxqwkFOeLUY3uHjFs
 w3vt0QNgMhq6IXnW4fCpaGBBiYYVqxWvcCdMnM6WfCg8ZcbwZFZEcyw9R6PqSZi/Xzid
 IdlFFtNxNpiwgwNVopU35RF9kYgiSR7zG4k6ZzeA1BWQ/zjCuOM87E/b3xeDp9RRYRAr
 NTaPabHU69zzaRfpQqHH+/jlcJWpgTjUanNKbaA+HmEsgyYATDLq4Aor7+Z9u1z3wg6I
 quEAStPeR8xCbVRLk+KTcgk6mVH1B8mHga36hTom6+S/mCfiog+SsUtMDcZ0jAGDUvxw
 6E8Q==
X-Gm-Message-State: AOAM531eZE4pzrOsBWnN37b6BhbZtg8zscjJUo0Y74SuX8SR3Whvr1bQ
 gWsUdBOgjqpbe6UCefK2dSDG06MB0bjGtA==
X-Google-Smtp-Source: ABdhPJxKPuOqOji6HCC4m60UbiB34g5mjv+rMTRpJMjPkv/jqh0DDmlaT45tvr7TU3Qydah7YP0J+g==
X-Received: by 2002:a2e:894b:: with SMTP id b11mr6467359ljk.439.1606603301363; 
 Sat, 28 Nov 2020 14:41:41 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:a4c7:9ff9:a160:aad0])
 by smtp.gmail.com with ESMTPSA id
 w21sm1236857lff.280.2020.11.28.14.41.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 14:41:40 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v2 10/28] video: fbdev: sis: Fix set but not used warnings in
 sis_main
Date: Sat, 28 Nov 2020 23:40:56 +0100
Message-Id: <20201128224114.1033617-11-sam@ravnborg.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201128224114.1033617-1-sam@ravnborg.org>
References: <20201128224114.1033617-1-sam@ravnborg.org>
MIME-Version: 1.0
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
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jiri Slaby <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Evgeny Novikov <novikov@ispras.ru>, Sam Ravnborg <sam@ravnborg.org>,
 Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 Thomas Zimemrmann <tzimmermann@suse.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jani Nikula <jani.nikula@intel.com>, Aditya Pakki <pakki001@umn.edu>,
 Xiaofei Tan <tanxiaofei@huawei.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Alex Dewar <alex.dewar90@gmail.com>, Jason Yan <yanaijie@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Qilong Zhang <zhangqilong3@huawei.com>, Randy Dunlap <rdunlap@infradead.org>,
 Gustavo Silva <gustavoars@kernel.org>, Peter Rosin <peda@axentia.se>,
 George Kennedy <george.kennedy@oracle.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Alexander Klimov <grandmaster@al2klimov.de>, Jingoo Han <jingoohan1@gmail.com>,
 Joe Perches <joe@perches.com>, Peilin Ye <yepeilin.cs@gmail.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix warnings by dropping unused variable and the
unused assignments.

v2:
  - Update subject (Lee)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Winischhofer <thomas@winischhofer.net>
Cc: Lee Jones <lee.jones@linaro.org>
---
 drivers/video/fbdev/sis/sis_main.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/sis/sis_main.c b/drivers/video/fbdev/sis/sis_main.c
index 03c736f6f3d0..266a5582f94d 100644
--- a/drivers/video/fbdev/sis/sis_main.c
+++ b/drivers/video/fbdev/sis/sis_main.c
@@ -5029,7 +5029,6 @@ static void sisfb_post_xgi_ddr2(struct sis_video_info *ivideo, u8 regb)
 	static const u8 cs168[8] = {
 		0x48, 0x78, 0x88, 0x00, 0x00, 0x00, 0x00, 0x00
 	};
-	u8 reg;
 	u8 v1;
 	u8 v2;
 	u8 v3;
@@ -5037,9 +5036,9 @@ static void sisfb_post_xgi_ddr2(struct sis_video_info *ivideo, u8 regb)
 	SiS_SetReg(SISCR, 0xb0, 0x80); /* DDR2 dual frequency mode */
 	SiS_SetReg(SISCR, 0x82, 0x77);
 	SiS_SetReg(SISCR, 0x86, 0x00);
-	reg = SiS_GetReg(SISCR, 0x86);
+	SiS_GetReg(SISCR, 0x86);
 	SiS_SetReg(SISCR, 0x86, 0x88);
-	reg = SiS_GetReg(SISCR, 0x86);
+	SiS_GetReg(SISCR, 0x86);
 	v1 = cs168[regb]; v2 = cs160[regb]; v3 = cs158[regb];
 	if (ivideo->haveXGIROM) {
 		v1 = bios[regb + 0x168];
@@ -5049,9 +5048,9 @@ static void sisfb_post_xgi_ddr2(struct sis_video_info *ivideo, u8 regb)
 	SiS_SetReg(SISCR, 0x86, v1);
 	SiS_SetReg(SISCR, 0x82, 0x77);
 	SiS_SetReg(SISCR, 0x85, 0x00);
-	reg = SiS_GetReg(SISCR, 0x85);
+	SiS_GetReg(SISCR, 0x85);
 	SiS_SetReg(SISCR, 0x85, 0x88);
-	reg = SiS_GetReg(SISCR, 0x85);
+	SiS_GetReg(SISCR, 0x85);
 	SiS_SetReg(SISCR, 0x85, v2);
 	SiS_SetReg(SISCR, 0x82, v3);
 	SiS_SetReg(SISCR, 0x98, 0x01);
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
