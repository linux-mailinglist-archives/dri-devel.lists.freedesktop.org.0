Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BFF394B8D
	for <lists+dri-devel@lfdr.de>; Sat, 29 May 2021 12:14:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F059A6E162;
	Sat, 29 May 2021 10:14:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C365C6F5C0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 13:06:19 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id jt22so5247689ejb.7
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 06:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hXF0Ts56dwHAndcdIXFBR1E/2W75Wukvn1BbkoOuP3s=;
 b=GIzRpEPP+mEiI+M7ckcQ/slkmUTYqGmhOGTej6PmDuhSzka2kqH41IB1DFJenbMi1c
 08ibSUvl0mnhV5YWffgTXeQY/b0mHGuEu9whZc1J8WyOhUjtY2A53tENr4RfRImNGeOq
 2yL9aS0/uLvlnXr360MhMjytDsjv2kx3XiDZyE0BbjV8SfSGEei9HI7z6TzuDZjdPFz9
 QaHGCreUCG2Ux1fw/Rw9V3FnaHFjh2tXXm4HpAX+lyYSiwqwbby+gKK0vbxl4YYkW8+2
 k0HLuqj+NOf746VAW2+sOEsWj2t7Udi/sgeFq1XS3ZMQQSsQtb64NL7bpGRV9vzQ5ZTq
 0kNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hXF0Ts56dwHAndcdIXFBR1E/2W75Wukvn1BbkoOuP3s=;
 b=GnursUaSvSxGeKiF/WBN/68uFlFBqS7x6PAvhEKFwHg2EIpn0dCm/AW+BJwHADmAHg
 lpj7ZHzC7NeGKOmPDIDKhuK3ATUhkM0DlH7SUQY8GYDrq1mmZVmSQi/BF51SdQARWctn
 b62yNTsQJxu3ww7O5SRZeTQL4XARvU5qKkQfdNYOzw+xTt39T+JLtPglAuJZliGVk7Jn
 Jh1wtMYnBIjA8svn7XOM6I59LDCRqDf9v1GixEnBd5R4PTQEjKokFtiqBZY3mX1QorSl
 OGKQmhzMI1LRKB/qDT0DOrFvtDpDOs5oNkiNLVFQjjZvJdEznPl63Y9C4syvYYdbBXrI
 kmuQ==
X-Gm-Message-State: AOAM531E1We3lnQoCw7aHotN4bYT984EY5c5mL5IXyUqMu44Dthm/+uQ
 FHZ0AbtI20nGofe+XqjKtkmgfRReQUO7
X-Google-Smtp-Source: ABdhPJybEOzv6Dmyb9n/L+ylVeUxGip+f0N75LsX5IiJGN1MgjT0EIL2I29E+yM3bVVb6uPrQgTgeQ==
X-Received: by 2002:a17:906:1796:: with SMTP id
 t22mr3529966eje.304.1622207178511; 
 Fri, 28 May 2021 06:06:18 -0700 (PDT)
Received: from localhost.localdomain (ip4d17b4b8.dynamic.kabel-deutschland.de.
 [77.23.180.184])
 by smtp.googlemail.com with ESMTPSA id u21sm2322778ejg.50.2021.05.28.06.06.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 06:06:17 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org
Subject: [PATCH v3 5/5] drm: rockchip: set alpha_en to 0 if it is not used
Date: Fri, 28 May 2021 15:05:54 +0200
Message-Id: <20210528130554.72191-6-knaerzche@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210528130554.72191-1-knaerzche@gmail.com>
References: <20210528130554.72191-1-knaerzche@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 29 May 2021 10:14:11 +0000
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
Cc: David Airlie <airlied@linux.ie>, Alex Bee <knaerzche@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

alpha_en should be set to 0 if it is not used, i.e. to disable alpha
blending if it was enabled before and should be disabled now.

Fixes: 2aae8ed1f390 ("drm/rockchip: Add per-pixel alpha support for the PX30 VOP")

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---

 Changes in v2:
 - capitalize "F" of "Fixes" in the commit message

 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index 64469439ddf2..f5b9028a16a3 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -1022,6 +1022,7 @@ static void vop_plane_atomic_update(struct drm_plane *plane,
 		VOP_WIN_SET(vop, win, alpha_en, 1);
 	} else {
 		VOP_WIN_SET(vop, win, src_alpha_ctl, SRC_ALPHA_EN(0));
+		VOP_WIN_SET(vop, win, alpha_en, 0);
 	}
 
 	VOP_WIN_SET(vop, win, enable, 1);
-- 
2.27.0

