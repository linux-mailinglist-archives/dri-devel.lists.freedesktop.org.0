Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 814FD643A35
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 01:36:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4369510E2F7;
	Tue,  6 Dec 2022 00:35:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92BB510E2D8;
 Tue,  6 Dec 2022 00:35:06 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id h6so2988198iof.9;
 Mon, 05 Dec 2022 16:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E6tS42wKzHwFWcgmodnkZoyUX7n80tfZY9XLsxmA1Do=;
 b=k2iyRQqqWCIOrdGtkc621KTyw3Yr8i4hemurWthxx+uElc9rkOjhMkhs8AHFngTMCQ
 DfWICT9igcSRKiks8MRkStVkTnEnGVu8IxKxsxNdkh7fB8EFo0lqFMdEvIYom1OMEEnx
 X98+fIRvMweLWdzFtpDrqbHud15fbqJi2R5Ci4rcKWQaCrrXzysQ+fuzTLPkR8iP1ml2
 SPL/NVz0SSKg07HMy0YXbUs2Depj0h78qD79bjRgnT3SWAMB4HB/PdHCph86NMCeejN0
 Ru43E2K5KIKsm228N/Bmu/VimgR5R8oZhSxxyp+ltMAge/2LFzWVG9zNMN8qahivx0js
 z1Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E6tS42wKzHwFWcgmodnkZoyUX7n80tfZY9XLsxmA1Do=;
 b=NremqCZCd44osY77W+rQCWd2LexgZ6baAF+BiTocOauxbxFjHk57ilgzpLzHKpOCzn
 RALdH3ERFODpdn5fNqfWS/H5hP/M4YHpa+zISRAluqEoY2x6qQBkjOttU/Da+I0Czqkq
 N2gO/S3u6hsZ+zhCtURJLIlSM7xVdX1PgqjpMAqCUow/AwxATXK9TsnrQUMbWY8eHqoX
 20/dLE6lzT3G05C84jzEBGY2aklAci+6Z2lv2PIwghVKp8T5/xlhaExjma6ljpnXziTU
 3rD5Ahpb0FhECYAMtxonKc6S/6CasTE/HNvWhBv0Ldy6nbuge+0udwknn8/RGngEmUjo
 KX0g==
X-Gm-Message-State: ANoB5pleTpMuiyXJqyP+UX1yct/WEZf9QWaur6LNlXhuwRGo2paeGled
 jv2DpEmySIqCWMKGBuEh4/Q=
X-Google-Smtp-Source: AA0mqf5SSiea/v3tuOJJOGljXEUfXKu8GfsiFh446yniBR0E8M7koAgABT3b+7L6x+ynzdBVfki9mg==
X-Received: by 2002:a05:6638:3e87:b0:363:798f:a924 with SMTP id
 ch7-20020a0566383e8700b00363798fa924mr39236651jab.172.1670286905378; 
 Mon, 05 Dec 2022 16:35:05 -0800 (PST)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 x3-20020a056602160300b006bba42f7822sm6408213iow.52.2022.12.05.16.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 16:35:05 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 08/17] dyndbg: reduce verbose/debug clutter
Date: Mon,  5 Dec 2022 17:34:15 -0700
Message-Id: <20221206003424.592078-9-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221206003424.592078-1-jim.cromie@gmail.com>
References: <20221206003424.592078-1-jim.cromie@gmail.com>
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
Cc: jani.nikula@intel.com, daniel.vetter@ffwll.ch, jbaron@akamai.com,
 seanpaul@chromium.org, gregkh@linuxfoundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

currently, for verbose=3, this is logged:

[ 3832.333424] dyndbg: parsed: func="" file="" module="amdgpu" format="" lineno=0-0 class=DRM_UT_PRIME
[ 3832.333888] dyndbg: no matches for query
[ 3832.334093] dyndbg: no-match: func="" file="" module="amdgpu" format="" lineno=0-0 class=DRM_UT_PRIME
[ 3832.334570] dyndbg: processed 1 queries, with 0 matches, 0 errs

This patch removes 2nd & 3rd lines;
 3 differs from 1 only by status
 2 is just status, retold in 4, with more info.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index a0dc681cd215..445f25ef2461 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -265,9 +265,6 @@ static int ddebug_change(const struct ddebug_query *query,
 	}
 	mutex_unlock(&ddebug_lock);
 
-	if (!nfound && verbose)
-		pr_info("no matches for query\n");
-
 	return nfound;
 }
 
@@ -536,7 +533,7 @@ static int ddebug_exec_query(char *query_string, const char *modname)
 	struct flag_settings modifiers = {};
 	struct ddebug_query query = {};
 #define MAXWORDS 9
-	int nwords, nfound;
+	int nwords;
 	char *words[MAXWORDS];
 
 	nwords = ddebug_tokenize(query_string, words, MAXWORDS);
@@ -554,10 +551,7 @@ static int ddebug_exec_query(char *query_string, const char *modname)
 		return -EINVAL;
 	}
 	/* actually go and implement the change */
-	nfound = ddebug_change(&query, &modifiers);
-	vpr_info_dq(&query, nfound ? "applied" : "no-match");
-
-	return nfound;
+	return ddebug_change(&query, &modifiers);
 }
 
 /* handle multiple queries in query string, continue on error, return
-- 
2.38.1

