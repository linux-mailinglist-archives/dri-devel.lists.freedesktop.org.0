Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 250854B9713
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 04:49:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA0DC10E795;
	Thu, 17 Feb 2022 03:48:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CFD710E78E;
 Thu, 17 Feb 2022 03:48:47 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id m185so2182860iof.10;
 Wed, 16 Feb 2022 19:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=losT24laQK9QPGecBoWrVc+10iJJY8vD90LsvY3Cts8=;
 b=YDLt3Q4XVCU3SNY6uD7/FtoBt1YQ4vttc8gh9hCegP9KTPTewYcgxbnMNm35qs3sAN
 83UuPyJiUycHSA5bqOW/TvnLpQ8ZL3hOV9hye+FMmwPZAsKyYaddsz4SNiz5qTk7zw+B
 V3zhfseOndqMAok28xM0o/fGD/E3AZIxhNC/DXcYBPUGtMnP1DEgi34hn45krZaAVCYh
 A0krsFznnlGBVOsrhLynW7/WtLAXCEiEqme6dgmGmAzf2kxKEThugOK0qfV1r2FpW2mD
 r8HYUa4v0OFsi6wanQA50eghIq6p284MDyFzJ4I76OeLxkDX1pmk806sJvl9H4j4X1Ln
 gf1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=losT24laQK9QPGecBoWrVc+10iJJY8vD90LsvY3Cts8=;
 b=SsAZ7o/KllrTej8DhgvMMf2YfK5iCNrnNwQUoaRaVNyJiKerH/jnsG5Q5dqNCUsbBa
 QuWmJpoTjPXTSCWP5zexnrIDhMK0Srck7LQrRIFLCLLgLSYtWVqnFMDUlcKkpKncsaNu
 +3RCaVFB4S5eUIzUCGWIyJsz/OxjCKGLRTZZwn6FxQEmVlVecV5RFcvRKKXxo3F3AzAf
 PHHhSCM+ogj+JESSpiSOIgHy6Yl8XY5m6N7Pa08KJ2MJDJsyh9G88EKKBp95iFmMcGAa
 7rJZg8slWJD1Ezoqa6rbDItJhTJuppnCUM+HDH0Y2/b4qDJibLi2/U11TCbHgUuy8pJF
 QeuA==
X-Gm-Message-State: AOAM532Xtp90DQNsX40cb8IeywVt0iTYbAKtMVpmUqnijEOrtW2h+mxA
 lDei+ZrNKvSXU1ThbPH79bQ=
X-Google-Smtp-Source: ABdhPJx/Tr8OkP8qQpMLDvFxZS1XzdR9P911qy0L55Cd/GZXU+ZPYahqdvxDhccEVXq+mEUJ/as2nA==
X-Received: by 2002:a05:6638:2387:b0:314:7ce4:1be8 with SMTP id
 q7-20020a056638238700b003147ce41be8mr745234jat.286.1645069726592; 
 Wed, 16 Feb 2022 19:48:46 -0800 (PST)
Received: from frodo.hsd1.co.comcast.net ([2601:284:8204:2010::1b19])
 by smtp.googlemail.com with ESMTPSA id l16sm1127874ilc.54.2022.02.16.19.48.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 19:48:46 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH 05/13] dyndbg: improve change-info to have old and new
Date: Wed, 16 Feb 2022 20:48:21 -0700
Message-Id: <20220217034829.64395-6-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220217034829.64395-1-jim.cromie@gmail.com>
References: <20220217034829.64395-1-jim.cromie@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk, seanpaul@chromium.org,
 joe@perches.com
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
index b72632212a65..77db640396a8 100644
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

