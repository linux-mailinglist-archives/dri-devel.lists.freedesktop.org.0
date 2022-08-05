Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F7B58B19E
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 23:55:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4062D12ADB7;
	Fri,  5 Aug 2022 21:54:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3C9412A843;
 Fri,  5 Aug 2022 21:54:23 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id z8so680261ile.0;
 Fri, 05 Aug 2022 14:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=uAM2bHt8Z4xuRTvJFeLRexags7bboegRrLg3WgQNpl4=;
 b=GttURaGyNyjlXmWKacrpk22jV/0PvPsnt5RSXlSpOmWKIOS1FVVSqslXr8i7diNjqQ
 B8bkPGOWHdOKP350Spcfvc2YAsmiq/DcD5C1wo0gN9gkyB/bIob/YY66WXpxdtoM3lUZ
 adw/rX4gz+YhYkxP4A+dvAgGqGer5xJc0fzlLSxAvmp99IRcl8QU2Tw2cTyWIMWa3mbk
 +WLxYSAXcQKdm2uaaGJq1a4Ooltfmbb2XptYWsKw4nHWkF5LzoQn2PdHKR0NRyGelXun
 xlOcEXK3Sj29apYYZlO8KM9a8Mtb/H4JV9NYpZbd8JqlUhRtKjxvE8x7Bg+2g4wCPp3q
 fBfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=uAM2bHt8Z4xuRTvJFeLRexags7bboegRrLg3WgQNpl4=;
 b=XrHpivDLB9TC9FuZzWAMKXF976HXVkJQTEKdOI7Wr688nXF86X5zm2OYq4y07jLI7M
 Q0mb2Sxk2QIbG5KYHVNqp1RXtNZvlv3uguC4Fp6kAPohHXpIYvc1KOnlpSZ9Ene9sQnz
 rH1/BWadLaBEXsP2fYXIjwjhh0A2/Xa5S4wem+zyJfjaHh8qR23Zr5TtaVU86t1vL8j+
 c3+Jfp3vIMWC9LYFY0rtb0fZx0jsYoKGah1382r/31SFSYo1A4IhRUnYQtqUGU7X3S6m
 6qhuQWpu3aPC4Skw235MUNPV5dxb8skfpYeL+chkcYvQOqn4scZEfrohMSocjuM2+4ck
 VoZA==
X-Gm-Message-State: ACgBeo36FupzZ1PuYPhJLcxcA22lzOUzkxDSvl/1sdWmso8uWINNVLHr
 U7OMDu55WEN1TefsFesk9xM=
X-Google-Smtp-Source: AA6agR7/BqFC2YyWdpPet7vO1o3I+g5zfP53AO5Z/UYQa5Q4GCzcWqQvhq1jsWqDvHh+aYBwIiWqsw==
X-Received: by 2002:a05:6e02:194d:b0:2de:a54b:2e51 with SMTP id
 x13-20020a056e02194d00b002dea54b2e51mr3914987ilu.257.1659736463061; 
 Fri, 05 Aug 2022 14:54:23 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b0067c09fd0b53sm1765532iov.21.2022.08.05.14.54.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 14:54:22 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH v5 04/33] dyndbg: reverse module walk in cat control
Date: Fri,  5 Aug 2022 15:53:26 -0600
Message-Id: <20220805215355.3509287-5-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220805215355.3509287-1-jim.cromie@gmail.com>
References: <20220805215355.3509287-1-jim.cromie@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, seanpaul@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

/proc/dynamic_debug/control walks the prdbg catalog in "reverse",
fix this by adding new ddebug_tables to tail of list.

This puts init/main.c entries 1st, which looks more than coincidental.

no functional changes.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Acked-by: Jason Baron <jbaron@akamai.com>
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 8faf584f2f4b..7fb99492c16f 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -970,7 +970,7 @@ int ddebug_add_module(struct _ddebug *tab, unsigned int n,
 	dt->ddebugs = tab;
 
 	mutex_lock(&ddebug_lock);
-	list_add(&dt->link, &ddebug_tables);
+	list_add_tail(&dt->link, &ddebug_tables);
 	mutex_unlock(&ddebug_lock);
 
 	vpr_info("%3u debug prints in module %s\n", n, dt->mod_name);
-- 
2.37.1

