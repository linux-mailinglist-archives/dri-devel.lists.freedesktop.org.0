Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6B9BCA72B
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 19:58:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 225B810EAD3;
	Thu,  9 Oct 2025 17:58:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="N19mMDzr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E21E410EAD0
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 17:58:51 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id
 ca18e2360f4ac-8ca2e53c37bso119149439f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 10:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760032731; x=1760637531; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mCaJXGEEoKxacl2B/5AyBFFUSkEK+Qm7rR3SS8wI7Gk=;
 b=N19mMDzr9eKdR1/lfrzPkA1PvTBzmibNeRQ2Om8CMUNm3rLEqln14ORw/og1V72SQC
 4A+tPRp/xjsSMbPh2y3ckR1ZUjVGsyRoBs7SjxtdnrTCMKBFRkOT+6JqzNTiB9/N5saz
 WQkwElcXwZswFxbOmVzp1191IVa63r8EE8ZT625QErJ7ab+Akb7AnMx6RNsgq5Sszhe3
 uGrz3mpO2IV86DaAJuu43q0bXbtQ902zqGfu7YvWN8/eEW9ddYZETAzGLAC//EmBTFdA
 g6ViGc8Y6tyZ1XdCw6Rl0WZ761a5mnyIU0mWYucIi6NMgND8fJrFj5dZiSU+G66PO18M
 0VHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760032731; x=1760637531;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mCaJXGEEoKxacl2B/5AyBFFUSkEK+Qm7rR3SS8wI7Gk=;
 b=kfiMWnDL9ttdcKrETSu7ysHcPs/DGp9dQtXHV5aBBTfzV8w+fA4crABUJS8IBf7pcd
 S6cBcmdRK3Gv6sJe4aVGJe8r+u9a6HZcgLu2WRm8C79fq6g38S0+hR0DiT091iF4jBJ9
 YaPsEohq+cIkgUbOml54ofQnPLpnY+aljJThiV4d2K9py3cJBHlvhIIyh5XdQUgrDv9x
 hiNPLyizucXMOjgQX47Ap820idqjvQtZe+uC6+RP/CLFK6yd+am8VnFdLfCCFbwdiyNz
 VqNzSIIRo/zOIpVLJBl/WhfqqMfX3Q98BCagg94tXh20K7aOjZ+FHMW4cJLqP/cL2bfM
 hKpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwCy8+MRpulMuQ/5fmYuaVmH51f0LUAoyG1+B6CU1mKLW4rLt+GIxU7XxPYp7OgEo5wTYHPpPfWX8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbCy5nKRogyMtRJdEuRYrQSxtvFbYG+cWtLIdo7eYHzZfJneH5
 MKKwAMeJs1y94Hfj2T6BfxoONixVKvP2absh8/EpD6+TgUoZqT2y6BAp
X-Gm-Gg: ASbGncu+nnd5IyDl+yi4WStXf2/2zhbpUnXRXhz6xC90DoHkFp9wSlJBTfh3QiPAXYY
 Kjw0ubh1Kk1WiceN4XtibElT4947BhX1tYoBbm4dswRT5NGytjBaKpd6VbgvsalCtz+frmHcRtW
 SHSpBqHaTy0+VNcHP0oJzdqiHiXThQ+KwKojhtpTr4kg5HRTLrXe6LS/eta30gyWSz2pp91LTkh
 8BEh+phikKf/yOcKvMn+3f8p2MbNJAVTUFCqeOwUoCyNzzbu75OHFFFbQsuc4BIu/l1xZK0EnZR
 IuWqMm3XwjEQVgOkQNZVDEfODA2ZcwGFEZLblFLLV2dqfs8YqmV36DOdLHr8yGNzNSz+PjZPrbB
 +WCK0VpKD7tR9ocBdXYonhDHJ3ii2I/DozLbFyFRQOmNAbht3GMprcnh1A3Qq7gU+rmBidyfWV1
 rY8lmyTC6XcFQJ7ZvkaBXfl0GROc6tA1O+SveRTw==
X-Google-Smtp-Source: AGHT+IFGYwQAi6/+LnQSrv5XVqN8PJXx4dyNZG3PIv3e3G7kxepvzgPF7iyA+hTKfqnZ5PXXLeiArQ==
X-Received: by 2002:a05:6e02:4706:b0:42f:8eeb:499e with SMTP id
 e9e14a558f8ab-42f8eeb4a3amr54728835ab.13.1760032731025; 
 Thu, 09 Oct 2025 10:58:51 -0700 (PDT)
Received: from godzilla.raven-morpho.ts.net
 (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-58f7200c4afsm30256173.35.2025.10.09.10.58.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 10:58:50 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Cc: gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v5 04/30] dyndbg: reword "class unknown, " to "class:_UNKNOWN_"
Date: Thu,  9 Oct 2025 11:58:08 -0600
Message-ID: <20251009175834.1024308-5-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009175834.1024308-1-jim.cromie@gmail.com>
References: <20251009175834.1024308-1-jim.cromie@gmail.com>
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
make it uniquely greppable.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
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
2.51.0

