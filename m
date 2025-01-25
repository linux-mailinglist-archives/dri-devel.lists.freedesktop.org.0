Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E668A1C169
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:47:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E30610EA6D;
	Sat, 25 Jan 2025 06:47:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eiyOlWI2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 917D410E2BC;
 Sat, 25 Jan 2025 06:47:06 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id
 ca18e2360f4ac-844bff5ba1dso225490439f.1; 
 Fri, 24 Jan 2025 22:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787626; x=1738392426; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z5ZcPXriLvyDxGd2w3FWLCNh742QlHcigDxyaXJyQ/k=;
 b=eiyOlWI27FGCaYW7VdMMHwlqOPdhD/mswGZl3spGtAsizRFH2V2CRwqQ9U1k+yBk6b
 ooEETzy7tc9jcN5hkCq0qDKb5HFCedQottIC+E9d18AlpHPecTH420RT7o7lqeH937nA
 8eFzk+087ZUWD4p5n15zAOEDPb+TChYjQZ7qIYnJDc0pTO8ilRcK3EC6sk+I94ePm5y6
 P8n1zKQqGAYk9eGlcIpssdky6U1tnbGJpWUBmvmkFAYOYtgTyC2weEdbrSOUHxOxwduL
 Ol6XcfAYZTU2AqWR8vn2xT6oCXbQBLNz/oGKhzCrUrj8N00ms7xg5pE7SO81I8qyTyM+
 JerA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787626; x=1738392426;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z5ZcPXriLvyDxGd2w3FWLCNh742QlHcigDxyaXJyQ/k=;
 b=RsoD8FkRdBQxnO23XGiQ598RJyLfDpkiZrkR4ylcrCRnwk2gWK+oCaQleiEYr/LzvE
 orcleZumV+JQNN/0UU4QmDqqrwnxzK06S4eYcEPS27/34ID2d+6qunJLSQ17lXzEhv1V
 Ncc8aua6dmYajflMTuWxNciKsAlfqXThgLZDGHH8BspBiI3uXigVL8KE8X6O4p/yQM8x
 4U/jnexreR8XPd4L0JlclPb4h3eeGheI7RKTkZ6pjNapHV2s+6bKNoOvfqirgAk8Lvde
 fzgvudoAu7OnZtvYVQd+Ei+0rnsyWh0OSZKUY/v/fz056QSIp+hwsurbDZCYO87dgPF/
 eaqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsOEFvGN90bp/O0xBZP8eg1QbY4XN1xypY6btG5E+9jWqvV9QT1DZXyxmKUwmgC4lUMCZqisINuAI1@lists.freedesktop.org,
 AJvYcCVCVlRh2oa0m+WkZDprT6Ert9SNzHgOe/unE7pWRwsaurOHyojSvcR4SyAQmZPT0RaRlojc3vsh@lists.freedesktop.org,
 AJvYcCWt4Cln2PLz3Xr64TwSPAA3rfuIyD7nqtaZBHHlb8dPjneDR7zJT35zR2aAMcdVUFbFWAbEIMgtoeewG8tFtg==@lists.freedesktop.org,
 AJvYcCXH0oQQC3dfPHdBkq5E5UP1YITJT/vwp1skHLbcDh7QSWjT6hNTzoq3SJyb3XVShKRJaIg/Ezi7bJ3u@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzv7BTvsn2KvL6BUEtvTOkV8F0Ea7lleo2T3PtUVCTyqLQJ8RkX
 sIcNhrnlUF47cFPd9IpEUo44tR8cn+RWMevmqX5pRIKEKBvliPAu
X-Gm-Gg: ASbGncsM9PmXBjXhIqI5lLuifAjbik+29gpLU31gUge0RSJCBq6qDwPcqoAleMm5nkf
 +mNwzJeM1E5tMLxGMhE/l9WsVgGQryQq/i6h36K+5Zi3+8SUgH+fjcsOg6s1WdOnAkxN4SAp+Y2
 5oYccumu6/mxM74YLgV0BDQdjBXw6wbhAY0gVk4n2TGd6zCY78QHyTHNNz6sWfPG5PcDIfUmSUi
 EZf0xL993KdUeY7ohaWAX+tjYoycLVQdgOSn4SvLx8bxAKMywsh8ozZ3+wqIAkSFTnbCF09vMjN
 XbKdLRHAPDoHjYZO28w8UK/CZjRbB2gdYqLBNQ==
X-Google-Smtp-Source: AGHT+IH7EX0Zd8kOjmd85jq7cPnyZB2Gxoa5M/XhjJ0tRWUuoKl8IDet9J12UuSAPni2ukC5wYaBbw==
X-Received: by 2002:a05:6602:418a:b0:84a:7906:21e3 with SMTP id
 ca18e2360f4ac-851b623c48bmr2846147139f.7.1737787624348; 
 Fri, 24 Jan 2025 22:47:04 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.47.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:47:03 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 25/63] ddebug: cleanup-range-overlap fails
Date: Fri, 24 Jan 2025 23:45:39 -0700
Message-ID: <20250125064619.8305-26-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125064619.8305-1-jim.cromie@gmail.com>
References: <20250125064619.8305-1-jim.cromie@gmail.com>
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

add cleanup block, to handle kfree before dt is added to list.
Once dt is on-list, do ddebug_remove_module to cleanup.

tbd. review some more.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index e57c05c9fb0a..781781835094 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1277,6 +1277,7 @@ static int ddebug_module_apply_class_users(struct ddebug_table *dt,
 	return 0;
 }
 
+static int ddebug_remove_module(const char *mod_name);
 /*
  * Allocate a new ddebug_table for the given module
  * and add it to the global list.
@@ -1318,32 +1319,37 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 	dd_mark_vector_subrange(i, dt, cm, di, maps);
 	dd_mark_vector_subrange(i, dt, cli, di, users);
 
-	for_subvec(i, cm, &dt->info, maps)
-		if (ddebug_class_range_overlap(cm, &reserved_ids))
-			return -EINVAL;
-	for_subvec(i, cli, &dt->info, users)
-		if (ddebug_class_range_overlap(cli->map, &reserved_ids))
-			return -EINVAL;
+	for_subvec(i, cm, &dt->info, maps) {
+		rc = ddebug_class_range_overlap(cm, &reserved_ids);
+		if (rc)
+			goto cleanup;
+	}
+	for_subvec(i, cli, &dt->info, users) {
+		rc = ddebug_class_range_overlap(cli->map, &reserved_ids);
+		if (rc)
+			goto cleanup;
+	}
 
 	if (dt->info.maps.len) {
 		rc = ddebug_module_apply_class_maps(dt, &reserved_ids);
-		if (rc) {
-			kfree(dt);
-			return rc;
-		}
+		if (rc)
+			goto cleanup;
 	}
-
 	mutex_lock(&ddebug_lock);
 	list_add_tail(&dt->link, &ddebug_tables);
 	mutex_unlock(&ddebug_lock);
 
 	if (dt->info.users.len) {
+		/* this needs to find the ref'd class on the ddebug-tables list */
 		rc = ddebug_module_apply_class_users(dt, &reserved_ids);
 		if (rc)
-			return rc;
+			return ddebug_remove_module(dt->mod_name);
 	}
 	vpr_info("%3u debug prints in module %s\n", di->descs.len, modname);
 	return 0;
+cleanup:
+	kfree(dt);
+	return rc; /* tbd might conflict w notify chain */
 }
 
 /* helper for ddebug_dyndbg_(boot|module)_param_cb */
-- 
2.48.1

