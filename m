Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB653A1C157
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:47:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3BDB10E2A2;
	Sat, 25 Jan 2025 06:47:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LAuJjnBT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
 [209.85.166.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8811410E2A2;
 Sat, 25 Jan 2025 06:46:59 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id
 e9e14a558f8ab-3ce868498d3so8477215ab.3; 
 Fri, 24 Jan 2025 22:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787619; x=1738392419; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AnDsc2vkEgs5Pp7pnDF60W8zrCwME0cZq6yzmPBvEV8=;
 b=LAuJjnBTn96+AFWROII+Gnc8uvmRhIbL06++9uI7gOAE3jrTDKHW1CFz61lAO0ka4/
 n86f8JZ46WYpxa0wvFYqgLOiQXmJAIyCX4MEc8BkxxiSDes/OOvIOxZqiCGZ1VbsL010
 ULKrp9cdXefG5EpI3kQ5bhXbcLACVfZmeLvKBYXFRZCdL0Z7or4xZNiAJ7oHTVLKfvva
 A1w2/OycfUSFeMpULzuul1Vp+vOSkfmMQsnYt1yhufkXfrqTzH3Lz01mBTNVkwfGtBOG
 PVqzz/3+cIhCrxEfQ+7uaDDhlH4DZacf67xBUOs8RnNhxm1C6a1LGjRBeGLyv/B+MFgZ
 gCTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787619; x=1738392419;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AnDsc2vkEgs5Pp7pnDF60W8zrCwME0cZq6yzmPBvEV8=;
 b=q8rfT2sVQ2zEqiTgQb+eLR+64fP58uWmbANwRkB2qoP/g/rmTuKvs5FGROU6VJ7h0K
 eH24QY61Sbcd0VOO4S6Xov61PI+19Ge9TgqgRKF71JSxws7QxU6cSNpuTkdiua9oKqcB
 RCaYd07n4o/C/IjWPXhsEKr94QJtZmlaXUzhO4MQ/56XeBaNVxVofPLEbmSA/ye7oMJX
 ZqKbC8voNB5UgFhuyGCMCEWa0jt7+IU0eFuSXe8iEpFxHY/k/366dsPU+FA87FFeuM/+
 SXGqdm53hRNsu2NwCYrcPKh+qFZxW3etSefSsv93h7C9NI5X9AecUUAT68GJ25GMxxDG
 fDfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnDkfOxcYsSbAJ6v+Jr9wP4aOfjaboPkkJ+LPhALjxKcttISq/FdBceAJrK2yBbAqiizQtNoOSQv28@lists.freedesktop.org,
 AJvYcCW5AYDxIaL+NNZ69zSzJCsFyih6B2Dd8DmhdAXvLfgtJ9cvCOx1lD9LSwVXADE/mPHVZW+M8KkH@lists.freedesktop.org,
 AJvYcCXktFmymTnCHRCW9zySVW+Vra0cVO4ZXS7CZ+Kxikxmst/bxE64Ba528B//Uw4PeN8Ol1zyeuHvap6/ybTzMg==@lists.freedesktop.org,
 AJvYcCXr1O4x+LjFk5uIAKRdYodCxeSTStm4bopZYfmKJ8M41dwz1F8fUde/4W7WBKz6L84qXUnA7eB8ZduU@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfooQfzxMXXQfKfHZViuMERXlgf1S+tC6mBDJRe4tHMFiHwXjE
 NrAliXLYeUNhwDfysHe2xPQmFw2s1B8sXRwmq2gAzHgy7aAZfkdv
X-Gm-Gg: ASbGncugALXeUAa/iRfHcD1r5p/7m6QvhugfEH/LkBShltRPafJSLuN2XtXXJ4XWE/R
 T3VRm2daI9DMEe6VDkDYcguM9pbmWi+B7Aea6Fl3o3IecvDErdCPkG4ydX6q3zJa0My9phf8jvA
 0VAA1nIfQvSQ1JmwIN+hSoBAX/kW86OASGaL1YpSAub/8SXyUMY0oypcO69wjcRDK/LVVjaFAsK
 65Z4g3w/gQgAOq5ypMjHx/H8hHJAqNyayC/yyOfPVdNCXAnqXojKfVSHk1BdPHLVjKgpVez5XXP
 HsSciZJXomYKnHZ1agbD2/dXHQBGjXriItOa7mV6PfL4NfYa
X-Google-Smtp-Source: AGHT+IFuXVplZTOidf6+FbrRWr0dJRuZPWucGNDLvhwgjrSV8lGvzy/PXtUkpXLhq4PmLDOpeMhA0A==
X-Received: by 2002:a05:6602:3c3:b0:84a:78ff:1247 with SMTP id
 ca18e2360f4ac-851b6286c35mr3044417339f.9.1737787618790; 
 Fri, 24 Jan 2025 22:46:58 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.46.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:46:58 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 20/63] dyndbg: drop premature optimization in ddebug_add_module
Date: Fri, 24 Jan 2025 23:45:34 -0700
Message-ID: <20250125064619.8305-21-jim.cromie@gmail.com>
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

The class_ct var was added to avoid 2 function calls, but to do this
it loops over all the module's debug callsites to determine the count.
But it doesn't really help, so remove it.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 067db504dd1d..16c9b752822b 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1284,8 +1284,6 @@ static void ddebug_attach_user_module_classes(struct ddebug_table *dt,
 static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 {
 	struct ddebug_table *dt;
-	struct _ddebug *iter;
-	int i, class_ct = 0;
 
 	if (!di->descs.len)
 		return 0;
@@ -1308,18 +1306,14 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 
 	INIT_LIST_HEAD(&dt->link);
 
-	for_subvec(i, iter, di, descs)
-		if (iter->class_id != _DPRINTK_CLASS_DFLT)
-			class_ct++;
-
-	if (class_ct && di->maps.len)
+	if (di->maps.len)
 		ddebug_attach_module_classes(dt, di);
 
 	mutex_lock(&ddebug_lock);
 	list_add_tail(&dt->link, &ddebug_tables);
 	mutex_unlock(&ddebug_lock);
 
-	if (class_ct && di->users.len)
+	if (di->users.len)
 		ddebug_attach_user_module_classes(dt, di);
 
 	vpr_info("%3u debug prints in module %s\n", di->descs.len, modname);
-- 
2.48.1

