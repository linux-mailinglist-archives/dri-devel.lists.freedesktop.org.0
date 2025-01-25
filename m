Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E13A6A1C13E
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:46:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B27C110E296;
	Sat, 25 Jan 2025 06:46:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Y+3x+eGk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F2B010E296;
 Sat, 25 Jan 2025 06:46:40 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id
 ca18e2360f4ac-84cdacbc3dbso225254239f.2; 
 Fri, 24 Jan 2025 22:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787599; x=1738392399; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lC0bEfQkqUFUX2DEnhyRE7tZ3eJxkUlfRX/DOTIhCKw=;
 b=Y+3x+eGkp99FB/yz0zHWN+OkQXswDhWBl552D1lpxGTFQaGWjb6nt4VjKLKjDlNMXg
 o33kggs79qn0ziLDhkssS2J5yJ/TYSeEJA+R8UFiqOpu8I3//k7HeK0X1Sz5FwvXTfPW
 pnDt9Bu08fLq8CT/3VB9NoIUbCN9kgw1m5W67iJ1Abp/cdt9IC1rAl9Cw48xr/xPvoR/
 9/aRorSlAMkDUS8ExL3tGZk1uVT+SWCc71p1RekJvqimIsXnIzfJ4FOS0WYAAmbDfeqm
 pg9ginR/MQaNG5paYET6MniXvMXE3j8s/Vurw0cY56sZkzClLxEX7PIxd6TayUugG79H
 pdxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787599; x=1738392399;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lC0bEfQkqUFUX2DEnhyRE7tZ3eJxkUlfRX/DOTIhCKw=;
 b=qS4MBDRoWHc57juyNqiF2PJ58P7U0DliSVKNDPNByD8gPLbi/CJbYKCJcYu9sIkHTL
 CoEJHp190cJ4p2HhxEokBiSWn8p1unf2LS0pcJOsV7c6QbjS1FlLtC9DAyP2lbUigoND
 CCaVb6EkjOgSWZWUz9rT1Yjz2tpgSfSiu6JZRvHM1JcbWYyOAV7xcSrWJpg7+eo+D2cO
 bCr2LCtMntsuTicqDJaZxAsxhT4C6JZ+0YQlPFvhfv8ARyLT7awImHIU7uOL9WcA62y8
 aldJam7H3hWs1shdxO+RZaQfGqzM5tyKjcQAUWKu98rfKOuOmEugPflevXX6Msm+5lQ3
 +Y+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8f+1a9UjHqCl37kNQ9XjKlN+tlE0wweGlzQCgMGG33DUpAE5STFRH9r1rXc1x/fKl0h2+LWypVs+a@lists.freedesktop.org,
 AJvYcCUPVB9PaCg8INSWkVCYVl/1K4Ikx5Q5T7ELfTpn38aPyiYDli/syvjcy+XAjSSohaf2v7NG+vbWqp+FNcccSw==@lists.freedesktop.org,
 AJvYcCVVWTFhsVUf2VibROhsYKAK9Tr++4WPgZ/WXoredXPJJUtFvpbpjNwZUkjY72IZx2TFJe5lB2f9gyEC@lists.freedesktop.org,
 AJvYcCWdMpm3eZqwoQyuXwc+kWalexW2+3d5Wed2a/xhZlwAyJYb9tONru6Yu8DSaQ6sBjqqn/Wi0AZp@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkhcVOyTDLwhAjs/rm83u4c4TECrDsnecNDethp+HGtT8d9myO
 3jafQQqZbYFLIuRP0xUkqlcI6E+4vrEC2h4lshxMkIYNi9RBCD0e
X-Gm-Gg: ASbGncukvLxO3MaNAe31Ur0r5JrITnaP0WTA7FrHMivU3vNtY5Tdas7z67ZJPMxNEp8
 IUPOfCxDjLyx1gIC5peddOlU2l5TKTuBYpfRbHI1SDS2qVOs0v9COtsrgcCbyKcSzEL2NSbnYZT
 X2c4UEaqrSngCDb6jJCFgx3/wJbAcyaD0+HTZN3Y6ES/QQ0TMFmzoseXjqsYS4a3wW2r3WHtJdu
 7qFP43iHbPZ0fy2BxYnhQBh6uylBPclyuPNCsxnRVyIHV7hxiNZ+ZSM8s48hIrSI96/aJvOwJGV
 p706E1Ro13p00cz8V3yKnZUKGciIzuBrm0TUGA==
X-Google-Smtp-Source: AGHT+IGCJkMDi6QJz04QzrJP+6InsJu9u2vONXpHhIfvz9GYsm9WZO74SuyY8vqfLEAfr6A647uPAQ==
X-Received: by 2002:a05:6602:488d:b0:849:a2bb:ffdd with SMTP id
 ca18e2360f4ac-851b618abd4mr3617977939f.4.1737787599462; 
 Fri, 24 Jan 2025 22:46:39 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.46.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:46:39 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 03/63] dyndbg: reword "class unknown," to "class:_UNKNOWN_"
Date: Fri, 24 Jan 2025 23:45:17 -0700
Message-ID: <20250125064619.8305-4-jim.cromie@gmail.com>
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

When a dyndbg classname is unknown to a kernel module (as before
previous patch), the callsite is un-addressable via >control queries.

The control-file displays this condition as "class unknown,"
currently.  That spelling is sub-optimal/too-generic, so change it to
"class:_UNKNOWN_" to loudly announce the erroneous situation, and to
make it exceedingly greppable.

NB: pr_debugs are only alterable via >control, and to protect class'd
debug's from unintended alteration, "class name" must be given to
change them.  Classmaps map known classes to reserved .class_ids (the
1..64 val range per module).

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 5a007952f7f2..147540c57154 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1154,7 +1154,7 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
 		if (class)
 			seq_printf(m, " class:%s", class);
 		else
-			seq_printf(m, " class unknown, _id:%d", dp->class_id);
+			seq_printf(m, " class:_UNKNOWN_ _id:%d", dp->class_id);
 	}
 	seq_putc(m, '\n');
 
-- 
2.48.1

