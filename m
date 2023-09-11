Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A7C79AC70
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 01:09:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E55F10E368;
	Mon, 11 Sep 2023 23:09:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C275410E37D;
 Mon, 11 Sep 2023 23:09:05 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-34bbc5eb310so18205485ab.2; 
 Mon, 11 Sep 2023 16:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694473745; x=1695078545; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zeh7PAP1bDfU/ByWs4XqsTralpUOih5UTW3jDedZc7E=;
 b=I207Q6vNSXApiphbh6jkAhsuJM1h1V8DWOes5CfGC4ezrfYJ2PExKRrbHxjXVlrl/k
 FRgBmdUfhhnyFUTDjDrIj9oWhrLNT+ON3tO/EtaNpIRaqnXI294iEfYD4na5SH1+XtLP
 0PUcsP2hn65UypnXXXY4s44sJBFq3JXIbwYPFxI5rJzC488GXeiosBVtLrEohZ4Ml6+t
 RGK1Odmpk+7VzVZWr5A5Id+EKuPAOQxSue8kTOqppyIlS3S8gUGTJGlXx1xkKv6LMucw
 WQ8mj5sC2HV5MOZv0rdYttNaXjj3X+ju1Ild7RJOKyCE6RQ+O9tjTIfRxyG2fnj9IsWx
 Jtuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694473745; x=1695078545;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zeh7PAP1bDfU/ByWs4XqsTralpUOih5UTW3jDedZc7E=;
 b=J2qMn1R3VNNuQRom0HW6QN5GTT7a7K3x1YkGJcIm8YYnjU2W35BnihMeitpydRMzuF
 BZ61PLppUdMB+qqy4iE9sjm7jIXNk41xg1RytcX3+gxjCP2VfiwO3eiiiSGZMq3kMv/1
 olw3BSvsEsxb1pizYf8EK2hm5zGQX4T+LyUjZkYL86dvMv8z/LwpImmwUA4xX+6eMCFQ
 d2Db/yiEiLkB8tbslSw/o9i5GqIlXeQRFDRobEhAG5p1my8K9TcRyyfrUKslbYkFQ6cf
 zWb0IBBxNgmY9OecuvXR6EVe1lU5VjxF/79SKVWcSSduhexxx0GJzjaSRRpe4428keRc
 0YBw==
X-Gm-Message-State: AOJu0YzKp0A8m6MI3bCJ7eAXB9z6QHWwYpSG4OjEMNcKkwor6ht+cwdA
 UAdfcS3J+PagPOCAT720cD8=
X-Google-Smtp-Source: AGHT+IFOVUo/VwcxfVY8ZADs8CkL6phLCtLh6KlZ/IQ/cX8VOt/0wmLERhDHtLnKqrozckRxSOEdzw==
X-Received: by 2002:a05:6e02:1053:b0:34c:f665:861e with SMTP id
 p19-20020a056e02105300b0034cf665861emr12027086ilj.21.1694473745039; 
 Mon, 11 Sep 2023 16:09:05 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 z4-20020a029f04000000b00423240c7296sm2512607jal.69.2023.09.11.16.09.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 16:09:04 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, mcgrof@kernel.org,
 daniel.vetter@ffwll.ch
Subject: [PATCH v6 18/22] dyndbg: reserve flag bit _DPRINTK_FLAGS_PREFIX_CACHED
Date: Mon, 11 Sep 2023 17:08:34 -0600
Message-ID: <20230911230838.14461-19-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230911230838.14461-1-jim.cromie@gmail.com>
References: <20230911230838.14461-1-jim.cromie@gmail.com>
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
Cc: linux-doc@vger.kernel.org, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reserve bit 7 to remember that a pr-debug callsite is/was:
- enabled, with +p
- wants a dynamic-prefix, with one+ of module:function:sourcfile
- was previously called
- was thus saved in the cache. NOT YET.

Its unclear whether any cache fetch would be faster than 2-3 field
fetches, but theres another factor; the 3 columns in the __dyndbg
section are highly redundant and compressible, but to get the
compression, we need field accessors, which will rebalance the
tradeoff.

So, for now, its just the bit reservation.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 15edac27cb56..bdb0d12b13ec 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -38,6 +38,7 @@ struct _ddebug {
 #define _DPRINTK_FLAGS_INCL_LINENO	(1<<3)
 #define _DPRINTK_FLAGS_INCL_TID		(1<<4)
 #define _DPRINTK_FLAGS_INCL_SOURCENAME	(1<<5)
+#define _DPRINTK_FLAGS_PREFIX_CACHED	(1<<7)
 
 #define _DPRINTK_FLAGS_INCL_ANY		\
 	(_DPRINTK_FLAGS_INCL_MODNAME | _DPRINTK_FLAGS_INCL_FUNCNAME |\
-- 
2.41.0

