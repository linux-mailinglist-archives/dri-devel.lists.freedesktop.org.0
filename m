Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3196CB191BD
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 05:58:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8781610E1BD;
	Sun,  3 Aug 2025 03:58:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fVoMk6Jv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EF0410E3E5;
 Sun,  3 Aug 2025 03:58:38 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id
 e9e14a558f8ab-3e3fcf5b150so25029815ab.1; 
 Sat, 02 Aug 2025 20:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754193517; x=1754798317; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cT8/zmXv/UqMduSo2scBRCmGp63Q5/YeQDv4ZhdIR2c=;
 b=fVoMk6JvmnWkzPEKxp6GViJNmOF7eqyZNZttYfSOTIqlKznLXyVCRmDpFoVyfAdKd2
 GH02QP0WMjcWQML8yvvFnl4P4bZEuZhdXtOo5C+Bp7jdFgxfhJuZ4wMCBNOW3At3zavG
 0Zvm6RgqTm1fGcnqgOJGnr2UUy0dH4MsHIT/vLez1cWcsh0H5r6w4rl6S7G9eEWuZ/Lb
 Cwq1eOrc+BJxDOahKWasXhZ1E9NQCBuvpsNI4lt/95KMq1mKLl7OgmKt/972ED0HzzoQ
 KdzMKFo3XZN0F4xInmjaDPd70csctv9pLAi8S4ny3Tyy8qmi1H0CBuMqfBgDCaZJCGOa
 cqjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754193517; x=1754798317;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cT8/zmXv/UqMduSo2scBRCmGp63Q5/YeQDv4ZhdIR2c=;
 b=bMdq3tZTRU+0bd11fo919fGDrMseoWjWetZgG1WT8uibpQtLVbI61EPUnYCfpcj30x
 We3ToIk3ZpYLQ5y1OJg5dKd+7x10/qmJ+P6ACsOcDY4eZicwepdJdTs6g9tM+exMiX5P
 V6ehAGUlmTIDUyVMrTqjsgM+DV3M0ikwVGbsnKE3lxZ5VtUNDw2xI1iJi+LuCfUQW4lx
 QrIFP5RL0kOdxnmRLMaI8uCA3u6eYlpxC9ndF4p1gBxteuPaJiiXUyUUofpIB3ZpyZub
 sHH4T0SLHL1ofKSTrnVGiXBn2Ap4DW7JP255wne1GpBXPHg7643YLmPU8oafTz14jhre
 VAAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVivaf7ZYNMTtA4Dohdia/70nnmpYsXVq4gyokQUFlRMKVylhlswgPhOWMsljraceWg26uROnZNwts9C8xHIQ==@lists.freedesktop.org,
 AJvYcCWmnQlHah0RlrttyxUP+k9lkRxZxHwxG6Fdt/xFeOXNGcLzwWzS3/KnxoB/a/LxpIha6cylUCsOjDzq@lists.freedesktop.org,
 AJvYcCXQAJe5YELIoDXT2/qlgxgpeDaAYxscV3aV7Sllrmz6TpNc+yStKN8a3wcT6+thEsmVmuiHWW/s@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxx8zP2pbtlgLJs0Yvx7KLOTgXng2vjtk3m+rQ7l9YUnW+8wNBB
 lc0u1Xlyz+PBK3lQfiaWtBMrA4Bh9gt7JmaxCjxdTYiJBDq2n1b8cUWb
X-Gm-Gg: ASbGncvv8NkEJIoaj4oOldM3EvRZNDQOwCii3Ql7mYIe5xpruzhHuo4Wwm9XImO4s5S
 8X1jDTy+cDZg2ly6BLn5txBtGsPPcBf3P7M2kWW/tsBB3D04bsvXnhh8ghJeZzYoC+21qmnWHJS
 1c5bwhvKLqDEqI501zbwTNp+z+E7adxXE29xfTrej8kO7Cd9ZoJMqiVg34DLiP6VY4xdDVlkPXK
 FReLsJbw6E+e6dUUV49IgF77KCTe9E2VPSfqN5vJNL87zUo7zgJQqlrov4TZ6S3Q8+xa6UaavRQ
 P8u/ssDyiyGve7ur4Xy9HlygXdWI2BWz58ypY77kk9ekH1s3BnETC/I+5vzm6Rf6Q7voZm2Jszm
 ULGkA6NDEW/Aj8J6PPVqw+UazVWRMxlF9Gtjt5FbGyfndvQCpbi3i+i+FNp9vxcY8dmhRTg8EU2
 7DLA==
X-Google-Smtp-Source: AGHT+IFfI6dv+/Dwk5MRfIQvsp2r14i0lroXxft+olSfZnx9fC58ENAn+6zSkYG0IWesgfHHIjV0TA==
X-Received: by 2002:a05:6e02:17ca:b0:3e3:ccfe:d597 with SMTP id
 e9e14a558f8ab-3e41610a07fmr100943495ab.1.1754193517393; 
 Sat, 02 Aug 2025 20:58:37 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net.
 [67.165.245.5]) by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.58.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 20:58:36 -0700 (PDT)
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
Subject: [PATCH v4 03/58] test-dyndbg: fixup CLASSMAP usage error
Date: Sat,  2 Aug 2025 21:57:21 -0600
Message-ID: <20250803035816.603405-4-jim.cromie@gmail.com>
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

commit 6ea3bf466ac6 ("dyndbg: test DECLARE_DYNDBG_CLASSMAP, sysfs nodes")

A closer look at test_dynamic_debug.ko logging output reveals a macro
usage error:

lib/test_dynamic_debug.c:105 [test_dynamic_debug]do_cats =p "LOW msg\n" class:MID
lib/test_dynamic_debug.c:106 [test_dynamic_debug]do_cats =p "MID msg\n" class:HI
lib/test_dynamic_debug.c:107 [test_dynamic_debug]do_cats =_ "HI msg\n" class unknown, _id:13

107 says: HI is unknown, and 105,106 have a LOW/MID and MID/HI skew.

DECLARE_DYNDBG_CLASSMAP() _base arg must equal the enum's 1st value,
in this case it was _base + 1.  This leaves HI class un-selectable.

NB: the macro could better validate its arguments.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Tested-by: Louis Chauvet<louis.chauvet@bootlin.com>
---
 lib/test_dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 77c2a669b6afd..396144cf351be 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -75,7 +75,7 @@ DD_SYS_WRAP(disjoint_bits, p);
 DD_SYS_WRAP(disjoint_bits, T);
 
 /* symbolic input, independent bits */
-enum cat_disjoint_names { LOW = 11, MID, HI };
+enum cat_disjoint_names { LOW = 10, MID, HI };
 DECLARE_DYNDBG_CLASSMAP(map_disjoint_names, DD_CLASS_TYPE_DISJOINT_NAMES, 10,
 			"LOW", "MID", "HI");
 DD_SYS_WRAP(disjoint_names, p);
-- 
2.50.1

