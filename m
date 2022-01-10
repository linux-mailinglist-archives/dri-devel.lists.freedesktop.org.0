Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD10489068
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 07:53:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1228011A8B6;
	Mon, 10 Jan 2022 06:53:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18A6111A8B3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 06:53:22 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 c14-20020a17090a674e00b001b31e16749cso19767816pjm.4
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Jan 2022 22:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=y8qyK9Z1xdNQlga6YeRs4Ebp3n/3+IX2v6kqUk3/oSc=;
 b=Cr7WEcflIJBG/7P3XHctuvDTTVxF9JqvZi0hyBxz6tEKEgJaAefi4qKIxkAFn0Drf6
 UimMAPjrYQm3XhyWATzqAMX7bIlspftZHJZBhOY+mGhHI1ajEAiKcjU4I/hmu8x58QtW
 o+egbDqiuRAdYIcaHY0/vcBI9Z+PapWwowh/PkKhqI19Wx/VDRNH8uuOrZYm9jTUGymF
 vLvNNMaeOkuhBxwSt0Y6pk96ozOPK4DCDK1QDXK1PnjELkEFfWHcf+H8dXCJj20v1coy
 +u2dsjMqC7Qizsr06eNEOo5IU1/fgqijb/UIiJ2Pw9HXghrJkyGG85U17q6ivzKGtZaO
 +e0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=y8qyK9Z1xdNQlga6YeRs4Ebp3n/3+IX2v6kqUk3/oSc=;
 b=MCuvC7SvF2PYeuwFhIc4/p9cecuoU4FH4qqPN3yVJR45V+lqwK2A6CN7Lxb55ILzPO
 BdUDYxd3GrOwf9gkTubM9xt+VekzNdfTIdg0K83zm8IoxS4mDLwl8m4ewnTN2a/xO8Hi
 RuU201C384u9gB5KsEhq4SjhMlBAncGH/tFZtC9MVI52+p/Gygqi3lnJ5KwxLLEXnzd2
 V35Kf53kQCKhLJHCNxAHyXdLIaefgkHa3ZjtXiXEVxVbWOFszEZbqbCEhV0Mc7ncjEZF
 kxcUEuSbS6lTuT/ozx0xcWoQ8jJPaCMRMcJlJtU0clq/bm4P78VC78N9RthIImlLeYI3
 7IqA==
X-Gm-Message-State: AOAM533n8s9RfIs67f03AVBlE9pSFth6TkXQF5NaYwb3cRHdUxp+tbn+
 5Jq6D++USvkuomQNI3XSAO4LrwS2mJ4QQFIT
X-Google-Smtp-Source: ABdhPJyD/SU7nRKBl+/czf25l/KE05P6+YzALyMSx5Y1DQzALekriTvfDZTscUp1R64rAwbo6oWrig==
X-Received: by 2002:a17:90b:1d8b:: with SMTP id
 pf11mr22900394pjb.119.1641797601781; 
 Sun, 09 Jan 2022 22:53:21 -0800 (PST)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id y16sm1083219pfi.7.2022.01.09.22.53.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 22:53:21 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: 
Subject: [PATCH] drm/tegra: Fix reference leak in tegra_dsi_ganged_probe
Date: Mon, 10 Jan 2022 06:53:16 +0000
Message-Id: <20220110065316.6023-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: linmq006@gmail.com, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The reference taken by 'of_find_device_by_node()' must be released when
not needed anymore. Add put_device() call to fix this.

Fixes: e94236cde4d5 ("drm/tegra: dsi: Add ganged mode support")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpu/drm/tegra/dsi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index f46d377f0c30..de1333dc0d86 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -1538,8 +1538,10 @@ static int tegra_dsi_ganged_probe(struct tegra_dsi *dsi)
 		dsi->slave = platform_get_drvdata(gangster);
 		of_node_put(np);
 
-		if (!dsi->slave)
+		if (!dsi->slave) {
+			put_device(&gangster->dev);
 			return -EPROBE_DEFER;
+		}
 
 		dsi->slave->master = dsi;
 	}
-- 
2.17.1

