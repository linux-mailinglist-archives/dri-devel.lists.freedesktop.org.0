Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C691CB191BF
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 05:58:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D438C10E05F;
	Sun,  3 Aug 2025 03:58:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TuuHDprL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAB3C10E3E5;
 Sun,  3 Aug 2025 03:58:39 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id
 ca18e2360f4ac-88120243d9cso156596539f.2; 
 Sat, 02 Aug 2025 20:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754193519; x=1754798319; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HHGyuGgnpKZsaheli1wyL5zDNg4zEDBviVdaC5XZBoc=;
 b=TuuHDprLA/PDC43dqd3L0Lzf8nFcUT8g7enBIguzrBGALrqs3dYBHtC43zl41acmFQ
 hKrndnVZ8/pN52Dansu/TG9RrTOZfoN/ZO6PEhGzKgUIVw10xzjlboBElxRXVyUxVmsx
 fKDyZCPkHPKlIHpHoGr3eIcpvDpK1K9UB7OEIqZatv3NSz168emKC6a3g6+EbWuaRTNT
 5WaclLku14m9S8GIxZePOGcVZTbRtodpw9PEJCXNoTXVi3S1MMLa7Ui+q2UR0Lpqg37/
 eqxzenEq3OaTlde0T19+zAG3tZHPAUb0Ut+eoqf1OQeBt78KVQT575iZ4vc/yZ2RKt24
 j+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754193519; x=1754798319;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HHGyuGgnpKZsaheli1wyL5zDNg4zEDBviVdaC5XZBoc=;
 b=o4ZdvbTIOl5V7dsntGh28OrKSzSDdFmgLVRNB3/PZdH2Pi8c07mmejc2LyC4eiGNrx
 7Ytph87PsKHqZyDYLQ0VkEMRrJC/C0JURIZq6sU0q+Bnp178US4EmEIG5OStNwW9hyXI
 3KWVZ+lU0pUOI1y/Wsjc//yr0i8ni9o/PMFF0LYSqwLg8kNit671He+9g4QsNkkCrzFT
 jrezjVLPzZe7eEssi/V3LcHTwIX7V5lA0OmrLggnDTEeBLt9QJ+dtYBfZA6jyUmjzEGX
 TDlce5KK0O302fSEdglyfc9ewP61zTzdJ9bQOV2WBHI5AeRPy4haGG1XrTK8f+O6wB5r
 nqaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVy38+qQpmfN+sHr3fba4iiU55u/FjnZ/A51K3UHCUhWfig2iujzz+PmFPSDwWiAbNESG/EeDLIdjG2@lists.freedesktop.org,
 AJvYcCWlQIREiUQ6wW0cqaeCD3bZK5s0p2Vv/sf6tNLHPkoPGSNPkarglgeSKMArOew/Hp5I6+0QL6U9@lists.freedesktop.org,
 AJvYcCX5bwm4KPhCHyGaaF0dBz5ClGQPXyh3Jdx8l9kivXNiQtIyHE6RsVL7mMzLNcNa8coziFdrOuhrwEDy0x3odA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwHgWUL3UaXxDY5AT6xmThp9LIdtysZIJeZC5Tw/XstXsa9TwKZ
 n7dqEdYmL6h1FtfsTzxjCA5yiVL/gHMgIyPsHa4fix1vh1olZQst+Wnk
X-Gm-Gg: ASbGncsalzXrpe1Gu7jo+I5a6p/Mi2wH+cSYYvZFK4/LuSRb/R349xGP8EAe9CsJrhl
 yVpr0xeWRUDBljArqJAB6BBejk9ng2zjAMQybnifdjFi+wi/xb+uxlqiYsbaNO3NLau1NyV08eE
 l92P/HWf3yL7NNaMRhDgvvIQGPYRl7lzTere0R6tpQ+COqNuBBzcnWPpvWwGPE7aAYaYR+Yic5T
 yitpWq/brfOdJ5WV+7/DJGmeRRUnWu0kkoJmpvAKNC29boJ3IF0PqjIormLiBuk02+IneYzYchq
 Ia6hpzeN/GW4c5R3y58xf32mejjmGMr+lQ4Qw8me7dOZetueiRbd49rH/TNPlcuBwSPQY4kvVkB
 uDYmS4JFR5yog0/6Vgf/UJia5nVopIjRgt4mtBh6brhC1moHDPOQckdwm/oUch7eedgvv8M7/QS
 NBvw==
X-Google-Smtp-Source: AGHT+IEGWj5ry9FocCclfChHk3bFL/qs2Ye9qIuJae5+Nv+8XnL0ndSBGTCV5nBBUROVehINujYa4Q==
X-Received: by 2002:a05:6e02:148b:b0:3e3:a1eb:4462 with SMTP id
 e9e14a558f8ab-3e416116bfcmr104124655ab.6.1754193518936; 
 Sat, 02 Aug 2025 20:58:38 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net.
 [67.165.245.5]) by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.58.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 20:58:38 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 seanpaul@chromium.org, robdclark@gmail.com, groeck@google.com,
 yanivt@google.com, bleung@google.com, quic_saipraka@quicinc.com,
 will@kernel.org, catalin.marinas@arm.com, quic_psodagud@quicinc.com,
 maz@kernel.org, arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, mingo@redhat.com, jim.cromie@gmail.com
Subject: [PATCH v4 04/58] dyndbg: reword "class unknown, " to "class:_UNKNOWN_"
Date: Sat,  2 Aug 2025 21:57:22 -0600
Message-ID: <20250803035816.603405-5-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
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
index 5a007952f7f24..147540c57154b 100644
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
2.50.1

