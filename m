Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBBDB336E8
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 08:55:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D41610E349;
	Mon, 25 Aug 2025 06:55:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="F9qxVReP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE13F10E236
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 02:30:42 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-b49d46a8d05so1057898a12.0
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Aug 2025 19:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756089042; x=1756693842; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=zFHAHU/+z+yhl9VER8s4Wp+oPk3FiOJt9Cdy6eMoyvc=;
 b=F9qxVRePAY60Hr2h+w7SP1pP0hEuvyGOpWuVkCNkkuWa85qw0IIPMA5Rg5AVkQCe2+
 ktdwL+WcsX3Nb1RB/lnikJ9R8N0Lw79HrxfL3PezZ0VT2YJWFOwVF3Qdeg2YO5KTKPfJ
 WuvmW2TnUo6hesNRv7/AnQPeooK09xRKRyPjW/u6cTV2TwQxJEfNuhXNmJsfh9mk3Ox1
 dd4JtndfvjiqvurqlAMAPVikvMKzAZ7o1EwbC1dDlq7Cu/gzOriH4bv41OuH15ie3wvm
 igsFzooTcpaQ6kalYK7cPQjCxIpEHhA16UT4i8iNgFqaNjMlFDdtdU0RnSyzSRAeFssm
 80zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756089042; x=1756693842;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zFHAHU/+z+yhl9VER8s4Wp+oPk3FiOJt9Cdy6eMoyvc=;
 b=ksgH0f5IXvIM1fxshSl6jHfyYbIcyKxXPG953tC0bkN/KlCQY+Cvne4QlfsqCxfY7E
 Yf/fwSiKYe5XowTO6/iPgsuJYqkR8uVn8uqRuQtbPwaYlLZ7OTevNIX59BSzSNfhh7XM
 LHwI7/lbxlCeqCLVqprIwOuNL+KfOUDXfWBQJk/o3TqDlbF4TbQoWlKEZWZ9TJ7hVITd
 yMqgDfU03MAq5IHdJtYH543d7Mz2R9e6XBpmFhQK8Mh+rxlGUZMTVGiFR8MNBOlO5lcx
 5iTfk3SqMK/oBbtV4GDwo9xyzyUwyFJ/YY4KsOjz+Q/Uods1Jk892q9UNWufJ8s+wo6P
 ZdGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnkKd9Lnblg5W44S+SpsqiwUhkI/np0zbKx336LCKpXOPOuQ8ViFE8GdFnApFNa/Q84Nvp54L9E8M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUOkZW8N19qGvGJ02T/lM6FexzCH4LpD/wufybIzGyVncAmdTH
 JjOZ9XZ7BRegozoc/Fo+ixMcn5sAFUPgXjPYv5gh+NWVDFNS9TUAPpDL
X-Gm-Gg: ASbGnctFSwv8LSfHO4btYzlZkngbUGc1+SU0vo3EamfmKsmO/VvAqq7tZ3ySrE2sVf8
 XUyQ9XSrdbAGLpaxOF9k9KKD/B1We7T7kpus5NIzoOl313m27WbaLFg9Pd7s3N4hrBAd/1Yk1ii
 rsxzYF6HsJ48cH6qdRoipiS7BV0nN28rP0EbO0H/YTnGwi4n9tGNXZaXOFQ7gzlRtNDwLXql0VD
 t4HE6nMv6JO359Bmazi6wqvoVQTKFegHfeMfs0XZinQMF3VnbNLodrGQ9f828Qr4q8dEEGR973/
 6SkODYunmRMHiar1UFsDYidGYkrIQg2wGho7Mv/jSZt4mH8TR8JDTDLat4RUNYKOSRO7SSp3TSe
 eOCWx/PMGD90DhCK58hsUrUPe/U+NbASPpA81YYFReqRPvJa6Ed4829DPeOqzIY13LJRG4CA+eD
 U=
X-Google-Smtp-Source: AGHT+IHERO/1eHRkEF6AC+dBVfTjpOtqq/Unp7jmksVhNk83icoLby3erE1Gst+iT6A6gassubAXtA==
X-Received: by 2002:a17:903:41cc:b0:246:b58b:8b86 with SMTP id
 d9443c01a7336-246b58b8f44mr31066895ad.32.1756089042108; 
 Sun, 24 Aug 2025 19:30:42 -0700 (PDT)
Received: from localhost.localdomain ([114.242.33.243])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-246687af234sm53905175ad.48.2025.08.24.19.30.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Aug 2025 19:30:41 -0700 (PDT)
From: Jinchao Wang <wangjinchao600@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>,
 Yury Norov <yury.norov@gmail.com>, Qianqiang Liu <qianqiang.liu@163.com>,
 Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Shixiong Ou <oushixiong@kylinos.cn>,
 Jinchao Wang <wangjinchao600@gmail.com>, Zsolt Kajtar <soci@c64.rulez.org>,
 Ingo Molnar <mingo@kernel.org>, Nam Cao <namcao@linutronix.de>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Joel Granados <joel.granados@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Sohil Mehta <sohil.mehta@intel.com>,
 Feng Tang <feng.tang@linux.alibaba.com>,
 Sravan Kumar Gundu <sravankumarlpu@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Anna Schumaker <anna.schumaker@oracle.com>,
 "Darrick J. Wong" <djwong@kernel.org>,
 Max Kellermann <max.kellermann@ionos.com>,
 Yunhui Cui <cuiyunhui@bytedance.com>, Tejun Heo <tj@kernel.org>,
 Luo Gengkun <luogengkun@huaweicloud.com>, Li Huafei <lihuafei1@huawei.com>,
 Thorsten Blum <thorsten.blum@linux.dev>,
 Yicong Yang <yangyicong@hisilicon.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kexec@lists.infradead.org,
 linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/9] fbdev: Use panic_in_progress() helper
Date: Mon, 25 Aug 2025 10:29:30 +0800
Message-ID: <20250825022947.1596226-3-wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250825022947.1596226-1-wangjinchao600@gmail.com>
References: <20250825022947.1596226-1-wangjinchao600@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 25 Aug 2025 06:55:43 +0000
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

This patch updates the fbcon_skip_panic() function to use the
panic_in_progress() helper.

The previous direct access to panic_cpu is less readable and is being
replaced by a dedicated function that more clearly expresses the intent.

This change is part of a series to refactor the kernel's panic handling
logic for better clarity and robustness.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
Acked-by Qianqiang Liu <qianqiang.liu@163.com>
---
 drivers/video/fbdev/core/fbcon.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 55f5731e94c3..b062b05f4128 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -279,14 +279,7 @@ static int fbcon_get_rotate(struct fb_info *info)
 
 static bool fbcon_skip_panic(struct fb_info *info)
 {
-/* panic_cpu is not exported, and can't be used if built as module. Use
- * oops_in_progress instead, but non-fatal oops won't be printed.
- */
-#if defined(MODULE)
-	return (info->skip_panic && unlikely(oops_in_progress));
-#else
-	return (info->skip_panic && unlikely(atomic_read(&panic_cpu) != PANIC_CPU_INVALID));
-#endif
+	return (info->skip_panic && unlikely(panic_in_progress()));
 }
 
 static inline bool fbcon_is_active(struct vc_data *vc, struct fb_info *info)
-- 
2.43.0

