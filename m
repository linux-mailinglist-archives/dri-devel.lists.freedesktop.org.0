Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D3F537760
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 10:55:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CCA710E1F6;
	Mon, 30 May 2022 08:55:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E57510E1F6
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 08:55:06 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 v5-20020a17090a7c0500b001df84fa82f8so10108844pjf.5
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 01:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0H0zQuhfwBWace/gM3VoJC+BnbGdiHLKJagjl3jEq3M=;
 b=EF62q7Q3oMoO+z+5RDfg5gzwDGy+5Mgc/CpZLLiKi1NmzSAIj9SUkUvNAi21n+ZC9S
 wWWwckJXijLwzTsX8uhvvVGKmJh35ObrgG7uVpZS1dh5ICCLGZx2b3juck9uVa/WyUv+
 r2FENoYuRXuzLnhZTGF2X1Dqhdoq2/YbhZJPMf0p0gWI4mf06Wjia6n1PPtFuvRGW1ZJ
 jK+EfuDmO7YrxPj1zk4iP+4qu6UAMLJ8OUR4AIWH6u7FTPZvc6RTH00cCF9cqZ83p3UZ
 JAZSlmOQ3JOkaxjHgdS1lF/E5ja19txVvaJI0JOYr/OYpxDzuZClmCfe/soEsca1mqqo
 3Now==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0H0zQuhfwBWace/gM3VoJC+BnbGdiHLKJagjl3jEq3M=;
 b=PKScoalsyQqDkZKfZk6zK5eXZgTguBGGp/lcbU+Ml4I6PuykHjQrq2YCGnTg2LpKUQ
 hcGyii6QIkXWfyPG3gQr4wQtjM9kDy9vzPBlcU8PSYlWzT5fMDI/w3iya5iSlEkK8DlJ
 iGeOHy9r9mzYuuBt/c96BEN+mSeCtkwE4nm69EnBuGzyyW+vuqpVF6lLIA/CGN2jT42V
 DBetC2MhoK5rRwBKTIPbofVfK0M+JjpLKlOe1AssiJA2SulsLTjaUs+02kr4tXQ6Q49m
 08R72gDtAkJhKm/BA9seJvsXJFUOpBXf6UGa8909mupjtjyzsfHsMI1/LkTpLoV5v4Vm
 tpxg==
X-Gm-Message-State: AOAM532y0to/TnxsUfQNhtRfoiI6rN8Fw2jYTX2uanWEOd524dzZWipJ
 BkwOAxBo3V2/dQ3lF3/429I=
X-Google-Smtp-Source: ABdhPJxrSACZi1MuyKXlNpU+Vh3dNJjQEQRDTaVFDuE5Gs9VXiolOOXmJWa12DeQhlyIbREinPT43Q==
X-Received: by 2002:a17:90b:2782:b0:1e2:97d4:53d7 with SMTP id
 pw2-20020a17090b278200b001e297d453d7mr13009781pjb.53.1653900905911; 
 Mon, 30 May 2022 01:55:05 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
 by smtp.googlemail.com with ESMTPSA id
 71-20020a17090a09cd00b001e25e3ba05csm9977319pjo.2.2022.05.30.01.55.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 01:55:05 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Alexey Brodkin <abrodkin@synopsys.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/arc: Fix refcount leak in arcpgu_load
Date: Mon, 30 May 2022 12:54:57 +0400
Message-Id: <20220530085458.44265-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: linmq006@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

of_graph_get_remote_port_parent() returns a node pointer with refcount
incremented, we should use of_node_put() on it when done.
Add missing of_node_put() to avoid refcount leak.

Fixes: 3ea66a794fdc ("drm/arc: Inline arcpgu_drm_hdmi_init")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpu/drm/tiny/arcpgu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
index f0fa3b15c341..6cbc4e9d382e 100644
--- a/drivers/gpu/drm/tiny/arcpgu.c
+++ b/drivers/gpu/drm/tiny/arcpgu.c
@@ -310,6 +310,7 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
 
 		/* Locate drm bridge from the hdmi encoder DT node */
 		bridge = of_drm_find_bridge(encoder_node);
+		of_node_put(encoder_node);
 		if (!bridge)
 			return -EPROBE_DEFER;
 
-- 
2.25.1

