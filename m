Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E3A58BBCE
	for <lists+dri-devel@lfdr.de>; Sun,  7 Aug 2022 18:09:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4940B11378F;
	Sun,  7 Aug 2022 16:08:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF4911A086;
 Sun,  7 Aug 2022 16:08:31 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id z187so6183678pfb.12;
 Sun, 07 Aug 2022 09:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=9lYXINAlxxMxWSbvsI8AJB5wGlCbPGWBgmb6qoY0xm4=;
 b=IH48HU+yBYTwc9qdZzvzUxgNlNeks30xd71AMuY3ez+dGWeGXnBepsiQpvwtEH5rSW
 lDYUOwdbEzdASRdPaLs2kUMdmKtWIdgjUAtr2W00kYAXlndCaFvef9O2DYYqAJwUE+Rv
 XOJJbQHJdWSn+/uV6CD8rlRSKVLruFZCD8ounOaJPF+lEeL9t0B1G7vCu1zCQ5FI6aC8
 RCsve2l7jsFutTZaFqrR8KqLjfhp83QYl+hZq68Tn9TyMSLvo5lOGJCxcZWTs9Pfc1UU
 iCNgeXquOLsLkcv9e/ciGDBH6JF7yDGsmdwK1IK5HieLrSPy12u2WKJ4vLr5vfO+fmx9
 SB3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=9lYXINAlxxMxWSbvsI8AJB5wGlCbPGWBgmb6qoY0xm4=;
 b=8G8AvcuPoa90GaaNMH/FgtVOJVjMyGamMN3VaiKjD7lZTehVd/c6Yego12A0/8T4LZ
 HED1pBdOkhdQen7KMVN0Cdh9Aqx+1lO9x/uMCgbIRlprYymiQiH0qRuX33VxjnvRdGtg
 OgB8Shs7EB5OF8yrXdh3qNS8qUxhG0DEykdyMDRWGfLc+fKevDP/vWU2PaHXebLUrFHp
 1cLIbQ5TLrE/VOrBxwunLUKcJEKk7bVQooJJpMyZeGM8GDKK5H8XTBKwfPo3PpSp61vH
 NiDj7vOJ/IcYGXiVf2maT5JMD32szTEKATkM7K2qQCTZT41Fxp1WER1RSImh1fOBogz7
 aRyQ==
X-Gm-Message-State: ACgBeo2FiLttpRgwdB8pLoZgmHJhLiJpdMyq2FbIuG2Fl+H/77uX+8wp
 j7gH42cH7oTTp1cBpkM6+IpXyziD1f8=
X-Google-Smtp-Source: AA6agR56DsDoQD7dIlG0cvuCFwpuPtU4SPqqFkEziNS2V0+r1vJoPi5RRMirTbA0oKKqpwuk/ACe0A==
X-Received: by 2002:a63:6e81:0:b0:419:f7b1:4b12 with SMTP id
 j123-20020a636e81000000b00419f7b14b12mr12551127pgc.406.1659888510120; 
 Sun, 07 Aug 2022 09:08:30 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id
 g2-20020a1709026b4200b0016db51ca7dfsm6881539plt.15.2022.08.07.09.08.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Aug 2022 09:08:29 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/msm/rd: Fix FIFO-full deadlock
Date: Sun,  7 Aug 2022 09:09:01 -0700
Message-Id: <20220807160901.2353471-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220807160901.2353471-1-robdclark@gmail.com>
References: <20220807160901.2353471-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

If the previous thing cat'ing $debugfs/rd left the FIFO full, then
subsequent open could deadlock in rd_write() (because open is blocked,
not giving a chance for read() to consume any data in the FIFO).  Also
it is generally a good idea to clear out old data from the FIFO.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_rd.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_rd.c b/drivers/gpu/drm/msm/msm_rd.c
index a92ffde53f0b..db2f847c8535 100644
--- a/drivers/gpu/drm/msm/msm_rd.c
+++ b/drivers/gpu/drm/msm/msm_rd.c
@@ -196,6 +196,9 @@ static int rd_open(struct inode *inode, struct file *file)
 	file->private_data = rd;
 	rd->open = true;
 
+	/* Reset fifo to clear any previously unread data: */
+	rd->fifo.head = rd->fifo.tail = 0;
+
 	/* the parsing tools need to know gpu-id to know which
 	 * register database to load.
 	 *
-- 
2.36.1

