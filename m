Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 547C37DD9C1
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 01:26:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A5B210E5F7;
	Wed,  1 Nov 2023 00:26:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F3D10E5E6;
 Wed,  1 Nov 2023 00:26:20 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-357ccaf982eso23040915ab.0; 
 Tue, 31 Oct 2023 17:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698798380; x=1699403180; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5ctyB3lbzkdQhDzqOoTWBErv3Q5efkvJrKvFBj8oTC8=;
 b=OTFw6BCImYNXtQcsh+6jLiW1/s+/PSxfEbVbYwFEsilZJmnLaju1AoeY9LOy24Fnas
 p0RvRr0s/hRkB1+9L74/f966gRV/n/1iaDkl01/Fm1qOnUzspO+nE1wJ2528/xIVIh6e
 fw4I3G+qSnJ5dpTL1nnqLxr6kNsnE69NhTgHS5abpQOwHLX1bFlzxy5prlcSKDvXeaf5
 cHRY57nlmtFmCYDxIRtXFMGmCwcn3a8+mrmKOigVZvgoTRfjH/zEv0jOFEEo0l96iOoe
 1MfaHWej9U4nIeoZaaveEDlnxRps2gtrwYZZ8ucvRdzpMRmx+PYV/mU4blx4NjvlNKf7
 e6aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698798380; x=1699403180;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5ctyB3lbzkdQhDzqOoTWBErv3Q5efkvJrKvFBj8oTC8=;
 b=U6tHvAOa8nRQ0CVN9YVrWKAA40MRmq8vvGHKMtk3NL1yyzLFkD5siOEDtYcmj/nr2z
 FhlRS84NIzEkVf2zSgBHPGI9exRhrwReQKxrqMppvn16oXXF7JP1SE5AgG1qYFccWC4C
 IFGtj+AtWsMVAT7CDh7wAipfuyjAPQCz07Dl4JaTVwt5oiead1zoBtX9bLM1Osjl5CX9
 BQlLIdbAww3SbDnRa32SgWobdNeW7peEdPEysxOgDHaCBxPVsWeCA6xaZYxmWsmTwMoD
 ep9OzeY0ISqcC9Z2M1qjqxsyCvCSai8Xg7CRMhRe8P3hxXe+xzI6uD57MrqivYxQwTUT
 Lowg==
X-Gm-Message-State: AOJu0YyS+MZJ1/hwsZaZWQAWsjJzpihOQqDZ0zhQZzit66u/KMK4MuWf
 y22wbkaLOznZmjNKN/qbh+8=
X-Google-Smtp-Source: AGHT+IG5G7BowN3Rpu885onUhpHkQ9UETEZL9Zm3ofejMSXEUgMCUpUSTiNmvcnzK3Nf0uyP3Nh8FA==
X-Received: by 2002:a05:6e02:308d:b0:359:3ee6:a909 with SMTP id
 bf13-20020a056e02308d00b003593ee6a909mr2009828ilb.13.1698798380022; 
 Tue, 31 Oct 2023 17:26:20 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 t1-20020a92c901000000b00357cc8df1d5sm141701ilp.68.2023.10.31.17.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 17:26:19 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v7d 02/23] dyndbg: reword "class unknown,
 " to "class:_UNKNOWN_"
Date: Tue, 31 Oct 2023 18:25:48 -0600
Message-ID: <20231101002609.3533731-3-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231101002609.3533731-1-jim.cromie@gmail.com>
References: <20231101002609.3533731-1-jim.cromie@gmail.com>
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
Cc: quic_saipraka@quicinc.com, linux-doc@vger.kernel.org,
 daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk, will@kernel.org,
 groeck@google.com, maz@kernel.org, mcgrof@kernel.org, mingo@redhat.com,
 catalin.marinas@arm.com, arnd@arndb.de, jani.nikula@intel.com,
 linux-arm-msm@vger.kernel.org, seanpaul@chromium.org,
 linux-arm-kernel@lists.infradead.org, lb@semihalf.com, yanivt@google.com,
 quic_psodagud@quicinc.com, joe@perches.com, bleung@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This appears in the control-file to report an unknown class-name, which
indicates that the class_id is not authorized, and dyndbg will ignore
changes to it.  Generally, this means that a DYNDBG_CLASSMAP_DEFINE or
DYNDBG_CLASSMAP_USE is missing.

But the word "unknown" appears in quite a few prdbg formats, so thats
a suboptimal search term to find occurrences of the problem.  Thus
change it to "_UNKNOWN_" which properly shouts the condition.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 6fba6423cc10..ceb3067a5c83 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1151,7 +1151,7 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
 		if (class)
 			seq_printf(m, " class:%s", class);
 		else
-			seq_printf(m, " class unknown, _id:%d", dp->class_id);
+			seq_printf(m, " class:_UNKNOWN_ _id:%d", dp->class_id);
 	}
 	seq_puts(m, "\n");
 
-- 
2.41.0

