Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B11B8234632
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 14:51:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BDE36EA88;
	Fri, 31 Jul 2020 12:51:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FE0D6EA84;
 Fri, 31 Jul 2020 12:51:18 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id j22so10896311lfm.2;
 Fri, 31 Jul 2020 05:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=in3e/rhynkLwVD5V9PwoaNI3UJD8A73TVa8u/14UsAg=;
 b=dvGhnctdpY5kxFxb0suRBtGNcio8aozQM9kdwS+Lnwi6/6de1sgC6u7OXXgupL3KX2
 CzjQ8fZkjfpjEM8Ct/Rl4YPy3RXEMyiAxnq6w0+TAqibQWiMtXMmRYiVdbWlDCLDExp0
 oRSTR1udpBecZD7hP4CuP4fsW1WUZOXMyRpiX52GsPu8zk/CAJpl0Ozg9mQi94llxQ9A
 YDcTUgBuVLAXdjVPehaqgATExkYwQHpVbPFgQcFFGFYUxffiNQmOCqYF1R34fiJLe/+4
 bu77en9ko2W4Qny1ym2XxbQtdj/47CBtRgk9E5QWu0Vo7/i4SQO/zCHjVP+UYAjeOzTP
 F4rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=in3e/rhynkLwVD5V9PwoaNI3UJD8A73TVa8u/14UsAg=;
 b=mLjffrz6HMlE35+/HwCBSzEQWNyuL7bZmYgIy3SoZ9RSO7bsu6kgwUnHnB0ZAFZ1Ok
 pLSjKrG17LxNsrWQsDBIljRe7d3U9dG1TWxHlSmB/CIpUQZ6HPxtky3b3Tl/9LysMSgO
 bUCyRq99PD+ai6lZY0Vpz0a2eVEQtcVkr4j5SrdeFXT4QWgXVl9dXEHx+DpH0LH9dCTN
 YEWu5WLrwaZkDadd17BdQVHr9P3cTFQotfLFhfn/DeT9Aup2QnKcsJUQgc5FOs8Tb93H
 3PGYCcMENKdV1W/dlAo3/j/l2PlEY9busi60Krj0bcBG/cSnqBXP64NU3fwxlVWna9RD
 YsSg==
X-Gm-Message-State: AOAM531pV46/NuRUf26UQG8oRZfokxc4up2Odozbl32LzJKK8A3iu4RK
 KxxVvtdvaKTzHgEDUa3LEy8=
X-Google-Smtp-Source: ABdhPJxYkcBz7mtQ/VNmuWNPBGMmzaqks8S8snreTQ/Yahk5mchXkjcy3WbaQqY4RS/Kt1wg3P3OVw==
X-Received: by 2002:a19:ae06:: with SMTP id f6mr1992770lfc.42.1596199876892;
 Fri, 31 Jul 2020 05:51:16 -0700 (PDT)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id s2sm1923362lfs.4.2020.07.31.05.51.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 05:51:16 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, boris.ostrovsky@oracle.com, jgross@suse.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 3/6] drm/xen-front: Add YUYV to supported formats
Date: Fri, 31 Jul 2020 15:51:06 +0300
Message-Id: <20200731125109.18666-4-andr2000@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200731125109.18666-1-andr2000@gmail.com>
References: <20200731125109.18666-1-andr2000@gmail.com>
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
Cc: intel-gfx@lists.freedesktop.org, sstabellini@kernel.org,
 dan.carpenter@oracle.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Add YUYV to supported formats, so the frontend can work with the
formats used by cameras and other HW.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
 drivers/gpu/drm/xen/xen_drm_front_conn.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xen/xen_drm_front_conn.c b/drivers/gpu/drm/xen/xen_drm_front_conn.c
index 459702fa990e..44f1f70c0aed 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_conn.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_conn.c
@@ -33,6 +33,7 @@ static const u32 plane_formats[] = {
 	DRM_FORMAT_ARGB4444,
 	DRM_FORMAT_XRGB1555,
 	DRM_FORMAT_ARGB1555,
+	DRM_FORMAT_YUYV,
 };
 
 const u32 *xen_drm_front_conn_get_formats(int *format_count)
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
