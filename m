Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B89D4C90BB
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 17:47:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FD5910E68E;
	Tue,  1 Mar 2022 16:46:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4065210E67D;
 Tue,  1 Mar 2022 16:46:54 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id k7so6002623ilo.8;
 Tue, 01 Mar 2022 08:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z8u4MF+f5/cGlLGB0/vAj9alSkuZujSqlEVmUNGHTX4=;
 b=EoKe1Vmlza53p81HMtpffi/FybfHcwZEbuj/YR2K3DkCNQ8dNkbtA0D9ABl/k5l3CT
 iGyWhO/JC3xToc7WdDDe0J+ymBPPVaDNKXdQWnDoeKbt0KlRdtLDXXvQ5HSCTvDwPVzx
 ti+sbATfop4sNR8TEufa/jTcJ+HVvV1fANPunTC4VWAIpR0vZkosU5xD2ut9CmD9uJHI
 aIALlS8bGfvMoC6BLuRrKwww+3/sdpVpBhcVl/CQfvcn/H6oJY06xsn13OjGB8qV0RUY
 Kg1qEE/FBSjxSN/b6N6YsuuMx0aFX3nWar49uUGKCDkOzaSm3Ym1QpmVJLghds3pYZt9
 PPsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z8u4MF+f5/cGlLGB0/vAj9alSkuZujSqlEVmUNGHTX4=;
 b=jLtDkdM7mpzQA/JZepPWUELpETxQ0yGNlJe2fuWhssQZ1EPccR6DX/bx5yxmiEltom
 tZFaXWTNbQlGDOGmMcjIDdpXKO18OCBHXGqZflXdClWGIBDilGGbPzXO/f16U3jNL9Hj
 lB/dGGZoMV0Ae5xRuvl9wiKGO3l+8sVwQXPS3FceXffsabX76cWDyfTEyuPuNYhnsQAU
 n7QNgPUILZv3utoEHRHMIIb2+DolEQPsXK9B6+EjE728UXqXyboMy1IFkDzkN92XyilS
 9+2cIn9B17nfySOq4W7GMYEZFGEEGTqXjoSQDLS2aWRWyPySpI7QsmyxEc2ENPWDbY2n
 PkiQ==
X-Gm-Message-State: AOAM532TV19+qOKpf9cc+hOCe31gvhQoglg1Xy7SAq6HkVfQO7/h6IMk
 PkPdJHQVtR39lWozCbatmr3aJ0yfCnv5VQ==
X-Google-Smtp-Source: ABdhPJxK5WeEUVyEuTuND3j4vG/YJnSaxYEpQFY4ZNpRm7OJTrBmY08zUwihDnew7RXNG33rQR7jMw==
X-Received: by 2002:a05:6e02:1bc3:b0:2c1:a992:9ffa with SMTP id
 x3-20020a056e021bc300b002c1a9929ffamr25168133ilv.124.1646153213496; 
 Tue, 01 Mar 2022 08:46:53 -0800 (PST)
Received: from frodo.hsd1.co.comcast.net ([2601:284:8204:2010::f10e])
 by smtp.googlemail.com with ESMTPSA id
 o3-20020a6b5a03000000b00640a33c5b0dsm7272411iob.17.2022.03.01.08.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 08:46:53 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, robdclark@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH 05/13] dyndbg: improve change-info to have old and new
Date: Tue,  1 Mar 2022 09:46:21 -0700
Message-Id: <20220301164629.3814634-6-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220301164629.3814634-1-jim.cromie@gmail.com>
References: <20220301164629.3814634-1-jim.cromie@gmail.com>
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

move site.flag update after the v4pr_info("change") message, and
improve the message to print both old and new flag values.

Heres new form:
  dyndbg: changed net/ipv4/tcp.c:2424 [tcp]tcp_recvmsg_locked pT -> _

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 60b2572e64f0..ab93b370d489 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -158,7 +158,7 @@ static int ddebug_change(const struct ddebug_query *query,
 	struct ddebug_table *dt;
 	unsigned int newflags;
 	unsigned int nfound = 0;
-	struct flagsbuf fbuf;
+	struct flagsbuf fbuf, nbuf;
 
 	/* search for matching ddebugs */
 	mutex_lock(&ddebug_lock);
@@ -223,11 +223,12 @@ static int ddebug_change(const struct ddebug_query *query,
 				static_branch_enable(&dp->key.dd_key_true);
 			}
 #endif
+			v4pr_info("changed %s:%d [%s]%s %s -> %s\n",
+				  trim_prefix(dp->filename), dp->lineno,
+				  dt->mod_name, dp->function,
+				  ddebug_describe_flags(dp->flags, &fbuf),
+				  ddebug_describe_flags(newflags, &nbuf));
 			dp->flags = newflags;
-			v4pr_info("changed %s:%d [%s]%s =%s\n",
-				 trim_prefix(dp->filename), dp->lineno,
-				 dt->mod_name, dp->function,
-				 ddebug_describe_flags(dp->flags, &fbuf));
 		}
 	}
 	mutex_unlock(&ddebug_lock);
-- 
2.35.1

