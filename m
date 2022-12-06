Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F79643A55
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 01:37:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E45310E317;
	Tue,  6 Dec 2022 00:35:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC7B110E2D1;
 Tue,  6 Dec 2022 00:35:05 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id c7so8742061iof.13;
 Mon, 05 Dec 2022 16:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=77rO+gPzClLni+3S5wfokMLSj7yae/3fTCmXDN7kWCE=;
 b=TiaBDG/iwkW4nY50qzQnYVCQM+GXllb6LQZYIA7LYfsxyDMurUi+DF7P9LOM7eczHc
 6s8rUgW1vKR9OZFRQnfW/xDUycFjqLYYsAyh6TNhFRpJaODTYncz3lKMVyk44d9S3Pjk
 hIgdalI84wRexsne7FwvA05UuLiHmhBaASndNT1beSnAuBVLIasGvBJpmY/WNOr6rBEh
 B+LP8a29IKSDqL5UW48mZMZA1uN8qdcvIalZHPwkSlu/qvyiB1HzB2E4ggufmj6ojKTB
 oeo93CLxcHAMwAVjQYkkI5rg5shWbDhvS+IzkqCrX/la772AlLyWRsEoJyzUn9+aVMqY
 yrVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=77rO+gPzClLni+3S5wfokMLSj7yae/3fTCmXDN7kWCE=;
 b=CYQbK4ERM2b6oRZqWBNxEs9VlDrO9ZF4gp6uocTIJc30TZJL9gDVgNu3y5GULSFINl
 LXxdXhaEeeBcYrAviIvTnWxdkozkpZ1MENCJk7z9k7EMQ3n1MX89EEasRKmzx5e9UDwW
 HltOGDR2D/FRsUbLgkkBEoKDgSfeyXq0DrmEbhJcWGKdggHDSyQuJo1qQC8rDIOyMILj
 R25AGmJTkKPhi/f3spSQ+6bL/z3G0NYfNf0CVuXYkNSwFqTCViLr0L6+aOrYWnRyji7S
 eZ0TE99RKeo2TxKqdwn8bHELtnA7D7Df4a0e0Pb+r6FAq9zDM6wa45+qHWAgJkYp2WRc
 /9xA==
X-Gm-Message-State: ANoB5plwZp/bdf14aKQejOEmpsAlySYVs8r815fOStZGncwrXnScU2bN
 OVZBxtca38UYLutUSshZ5gQ=
X-Google-Smtp-Source: AA0mqf5X5c52RfvyVr/F0IB3pmeSK4ljjXvIHrXrVjgx32GMoi2rAfWpN8Jv8DYtXrWxb28qPa/muw==
X-Received: by 2002:a6b:fd0e:0:b0:6df:5e6c:f5c7 with SMTP id
 c14-20020a6bfd0e000000b006df5e6cf5c7mr20213554ioi.207.1670286903282; 
 Mon, 05 Dec 2022 16:35:03 -0800 (PST)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 x3-20020a056602160300b006bba42f7822sm6408213iow.52.2022.12.05.16.35.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 16:35:02 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 06/17] dyndbg: dynamic_debug_init - use pointer inequality,
 not strcmp
Date: Mon,  5 Dec 2022 17:34:13 -0700
Message-Id: <20221206003424.592078-7-jim.cromie@gmail.com>
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

dynamic_debug_init() currently uses strcmp to find the module
boundaries in the builtin _ddebug[] table.

The table is filled by the linker; for its content, pointer inequality
works, is faster, and communicates the data properties more tightly.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 5d609ff0d559..a0dc681cd215 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1410,7 +1410,7 @@ static int __init dynamic_debug_init(void)
 
 	for (; iter < __stop___dyndbg; iter++, i++, mod_sites++) {
 
-		if (strcmp(modname, iter->modname)) {
+		if (modname != iter->modname) {
 			mod_ct++;
 			di.num_descs = mod_sites;
 			di.descs = iter_mod_start;
-- 
2.38.1

