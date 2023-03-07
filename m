Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDED6AE75E
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 17:54:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81FE110E131;
	Tue,  7 Mar 2023 16:54:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A49E710E168
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 13:09:02 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id h8so13933813plf.10
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 05:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678194542;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KDSasO/7mKvPMuHhaJ5dSUZlltLYrJQeoPhaTJiDZfs=;
 b=bmSSIW9KtOuI5eNLrnjoEZACB3ezrROssS5D2oU29FxEC+Rq/PHZCCckVcDHs3bLPK
 m8ZKz6PCvzZlRkhAIpwYYkr2wdRk0Ni6V3SMiz434xU0AzLdLP6FlI5F3Kz91p7Xqay1
 sFtr39ki8xM3n7OsY0BEmvQcdmIThIo0InXm6Vj5sSBisBybeBB1cdYhy6TL+jT1jgIO
 4BYIAIDC/QXhMxtIIrEECSZZK87cS4q8YNJFOqbqtgn54SbIYBkJD2c8bzStIKMiAIpF
 NMlFx9AH8ZWf/7ARyOcvmzmbcEyGI7RZ4KQ8VKGxZOmyLxtNwZs3pwr8fPUT7jmhXz2s
 x6Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678194542;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KDSasO/7mKvPMuHhaJ5dSUZlltLYrJQeoPhaTJiDZfs=;
 b=W+3rBL9DUxWzq+GfX8WNncmNiqiPEs46MmNifxl8Yt1mR+5TY35Z42Fi6q+/OvQUYw
 0upr4BSeorBtLuFfK0UPevY0ikUcRQYnfSszcYrgIpjpMVNYj2KkwGoZzksAfSy/DRXr
 S7OVxJ25p+JcQJN5VXx9WHckk2ysqQKpqqYKmZ9OCuAh5BjF6vC0ZCnk4fXhTxZHQKmf
 xalXZEqwBwJzdUtfO5M0f5K9QP4CsxCkBYIH/mNdHmrx0DqwShwQJ+mSHTRhRkpiP4O3
 ws/o7zaFmp/wNxhx15HtyI2KOmab+ciu4gKCYWIof4A9lsI9u2SpbScTEcTGZESBRkB8
 6c2w==
X-Gm-Message-State: AO0yUKWLf4dq1+YLFAwMJ8s8y/NRmWKRbQdVxiq+uFBInLq+b4qSigTn
 otlgKlVKSJP4UL8TJi0hEpM=
X-Google-Smtp-Source: AK7set/JbNt04raG3T5qoVOvWKW76KyCmnFyRTKZHkRGaWCu6DgctSZ48iDM0sCCnRF/zxEwnu0qcQ==
X-Received: by 2002:a17:903:22c1:b0:19e:ba2c:27ec with SMTP id
 y1-20020a17090322c100b0019eba2c27ecmr10944767plg.11.1678194542116; 
 Tue, 07 Mar 2023 05:09:02 -0800 (PST)
Received: from chcpu13.cse.ust.hk (191host119.mobilenet.cse.ust.hk.
 [143.89.191.119]) by smtp.gmail.com with ESMTPSA id
 y2-20020a170902ed4200b0019b0afc24e8sm8396190plb.250.2023.03.07.05.09.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 05:09:01 -0800 (PST)
From: harperchen <harperchen1110@gmail.com>
To: deller@gmx.de
Subject: [PATCH] fbdev: tgafb: Fix potential divide by zero
Date: Tue,  7 Mar 2023 13:08:56 +0000
Message-Id: <20230307130856.2295182-1-harperchen1110@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 07 Mar 2023 16:53:59 +0000
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
Cc: linux-fbdev@vger.kernel.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 harperchen <harperchen1110@gmail.com>, wsa+renesas@sang-engineering.com,
 tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

fb_set_var would by called when user invokes ioctl with cmd
FBIOPUT_VSCREENINFO. User-provided data would finally reach
tgafb_check_var. In case var->pixclock is assigned to zero,
divide by zero would occur when checking whether reciprocal
of var->pixclock is too high.

Similar crashes have happened in other fbdev drivers. There
is no check and modification on var->pixclock along the call
chain to tgafb_check_var. We believe it could also be triggered
in driver tgafb from user site.

Signed-off-by: harperchen <harperchen1110@gmail.com>
---
 drivers/video/fbdev/tgafb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/video/fbdev/tgafb.c b/drivers/video/fbdev/tgafb.c
index 14d37c49633c..b44004880f0d 100644
--- a/drivers/video/fbdev/tgafb.c
+++ b/drivers/video/fbdev/tgafb.c
@@ -173,6 +173,9 @@ tgafb_check_var(struct fb_var_screeninfo *var, struct fb_info *info)
 {
 	struct tga_par *par = (struct tga_par *)info->par;
 
+	if (!var->pixclock)
+		return -EINVAL;
+
 	if (par->tga_type == TGA_TYPE_8PLANE) {
 		if (var->bits_per_pixel != 8)
 			return -EINVAL;
-- 
2.25.1

