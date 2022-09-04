Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5035AC7D1
	for <lists+dri-devel@lfdr.de>; Sun,  4 Sep 2022 23:50:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D069410EA41;
	Sun,  4 Sep 2022 21:44:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87C0D10E274;
 Sun,  4 Sep 2022 21:42:55 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id m16so861619ilg.3;
 Sun, 04 Sep 2022 14:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=jSafBWcpIkewykTpB/1313WvVuyh8yQZEmhBKVyM37c=;
 b=kbrF6hjoM+H17g9j3Wc1/6pJQXLvRnZ3Vs2WK1V3kWoZOwTfI3zERDRkFgtpBOrFAe
 aGn093m3smVeCRZc5LHalL7AoxbuS4AQdvZJaVIGnimvkEeM+rU3RRvd61Y/+6IWXHfl
 kzGQAdJFvZEfilUjxUNjkQBoZrnnNuWzDxd3Yt6Ikt65YhKsu8QQofbdJP1Nb7Jw0VW5
 kMVkkJh4rdB9IpjDMcRVjEMDMbxOf5ddpY8akTKF8dSThHmxapKpkB5IEwhZVzCE7tj7
 3JBKIi1e8jUIyR7UaiNXs4jjXjUOieSwp2MgZNZauf5xpbvtBGKzVaok6AF7eoTkzZnt
 HL9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=jSafBWcpIkewykTpB/1313WvVuyh8yQZEmhBKVyM37c=;
 b=Ux/oBWXjiQp/BI2yIpYb8ZY4JoeRA+6gA3oNygkVgE7z3cr/8RtS6CYmllyluveauK
 ry05MfXQHLvU6z7TpbUq/3MvnrMdkVfyxWgmP1tBvkOH4a10feMjLYd/eYEiuCTpK2Z+
 UzTTL42qR3l8GEVFRAfefnsA0LEWgHjg6UGKuTUl6v/XshMpPngqp1Fu3x1wtJfPDyJ6
 Un+tVq7MGZqD0F3R+CI8hKrqth75PoqKEXyNXQzM+YwY3kDAgL+5AiwDDHtRw57SPLJJ
 nmIRyghRRQic0AnemNnOxQrvfEKjhixmbw65NflGxU/Yeo7AI8Fkqe5eMSmd9beBSEkP
 hnhg==
X-Gm-Message-State: ACgBeo1zDez6qKe9BIX7IXDnbNstS4LUnO4kDRy5CQpQjdw4eQOR8AQZ
 Fjr/ZkOzwaAayIfn9wgAcGU=
X-Google-Smtp-Source: AA6agR5AVD3WIg2eP3iWjFE39m5/nR6rpJNEPwSMnDilTle2doeCtgXvqbPXlS48tak7nK63rsd6XQ==
X-Received: by 2002:a05:6e02:1b86:b0:2f1:76ec:4b91 with SMTP id
 h6-20020a056e021b8600b002f176ec4b91mr848152ili.191.1662327775227; 
 Sun, 04 Sep 2022 14:42:55 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b006889ea7be7bsm3727688iov.29.2022.09.04.14.42.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 14:42:54 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 47/57] dyndbg: demote iter->site in _init
Date: Sun,  4 Sep 2022 15:41:24 -0600
Message-Id: <20220904214134.408619-48-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220904214134.408619-1-jim.cromie@gmail.com>
References: <20220904214134.408619-1-jim.cromie@gmail.com>
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

---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 059212df68f9..65b0a1025ddf 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1547,7 +1547,7 @@ static int __init dynamic_debug_init(void)
 	}
 	iter = iter_mod_start = __start___dyndbg;
 	site = site_mod_start = __start___dyndbg_sites;
-	modname = iter->site->_modname;
+	modname = site->_modname;
 	i = mod_sites = mod_ct = site_base = 0;
 
 	for (; iter < __stop___dyndbg; iter++, site++, i++, mod_sites++) {
-- 
2.37.2

