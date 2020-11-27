Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 192082C6C39
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 20:58:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D5A76F3B3;
	Fri, 27 Nov 2020 19:58:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E5676F3B3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 19:58:38 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id s30so8564382lfc.4
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 11:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mlrk2a7fx8lHdZe7HNocdybelF9nJ2xwpzGpya7/neM=;
 b=nbyG5HWv8PYaV2MYSK/V9y026abFr5qp19r6Mx+qPclojBrt+pbh0WG2/n1piQOA3P
 uiimF504mugGaPERuOR019mjir/88EOl6cR5iCAfGJTPcIV/2G+i+ESDivkT2zpess2j
 1zVJKOceqHS6J/oZQFCYH6/3zFxVW9iPqVljmIiQSu3iKYWtG1vTsRSoW9MjLNOTxidQ
 wncSiavaru70qkQme1ffLM4DzwQTHZpSpnNLSekMRwjhEuJKCVX9e8Hjqh4OpS5gIN1G
 yUBhSTjZ85t0S4j2PKLTjbd7Dk/oAsAN77B0d4QfWUSLXQslevnjmXOg7FipUasZZZj+
 Ub+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Mlrk2a7fx8lHdZe7HNocdybelF9nJ2xwpzGpya7/neM=;
 b=d3g7+Qih6idfw22Efo1OiSLGd3+i5ogTdx+GOM7OhXV2oEfMnKedfHuPFrk5xECaAQ
 HZpiR1B4mkEiPrxLc14nFIrED+9yvmb+dyrUzDNjFaUEFZ+ZAzIsDGIZN4LCKfv23E6z
 +xSs/Vul2PcU+oW2KMkoaD+XB8T9veFxD8sVsyLnzRJsQYGxKvnJ/p7az/pkU7shpp2Y
 LwNRIM2KiQ+YW5s4kD4Qvi/ORm5KpWLQf2VD44Tu9oEw7881zX+Jbl1B12hsY+eNZiNv
 95+Zw2wFI2osNPatVAsk8QY01PCw5bYucwa9A6kHVMHCw22L7Q3XXFMGbCzBcpFlBs2f
 bF8Q==
X-Gm-Message-State: AOAM531myj8WT17qVLLdlrDlW1yo4XExLirasXCJ02JwKckJ9YLithL4
 JLeHDVhoNNnL9qk1wjJKScs=
X-Google-Smtp-Source: ABdhPJy1IKpFfgA/xgo2/hiiEZA4+34JhNpEV0cwiEJVzRGd+sjjU7oUZDTPsmHJEcur9GoPNNk63w==
X-Received: by 2002:a19:f243:: with SMTP id d3mr3981629lfk.534.1606507116602; 
 Fri, 27 Nov 2020 11:58:36 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:9d62:990:4557:451])
 by smtp.gmail.com with ESMTPSA id c6sm1070415ljj.140.2020.11.27.11.58.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 11:58:36 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v1 01/28] video: Fix W=1 warnings in of_videomode +
 of_display_timing
Date: Fri, 27 Nov 2020 20:57:58 +0100
Message-Id: <20201127195825.858960-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201127195825.858960-1-sam@ravnborg.org>
References: <20201127195825.858960-1-sam@ravnborg.org>
MIME-Version: 1.0
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
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Peter Rosin <peda@axentia.se>, Michal Januszewski <spock@gentoo.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-nvidia@lists.surfsouth.com, Jiri Slaby <jirislaby@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Evgeny Novikov <novikov@ispras.ru>, Sam Ravnborg <sam@ravnborg.org>,
 Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 Thomas Zimemrmann <tzimmermann@suse.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jani Nikula <jani.nikula@intel.com>, Aditya Pakki <pakki001@umn.edu>,
 Xiaofei Tan <tanxiaofei@huawei.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Alex Dewar <alex.dewar90@gmail.com>, Jason Yan <yanaijie@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Qilong Zhang <zhangqilong3@huawei.com>, Randy Dunlap <rdunlap@infradead.org>,
 Gustavo Silva <gustavoars@kernel.org>,
 Ferenc Bakonyi <fero@drama.obuda.kando.hu>,
 George Kennedy <george.kennedy@oracle.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Alexander Klimov <grandmaster@al2klimov.de>, Jingoo Han <jingoohan1@gmail.com>,
 Joe Perches <joe@perches.com>, Peilin Ye <yepeilin.cs@gmail.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix trivial W=1 warnings.
Update kernel-doc to avoid the warnings.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-fbdev@vger.kernel.org
---
 drivers/video/of_display_timing.c | 1 +
 drivers/video/of_videomode.c      | 8 ++++----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/video/of_display_timing.c b/drivers/video/of_display_timing.c
index abc9ada798ee..f93b6abbe258 100644
--- a/drivers/video/of_display_timing.c
+++ b/drivers/video/of_display_timing.c
@@ -52,6 +52,7 @@ static int parse_timing_property(const struct device_node *np, const char *name,
 /**
  * of_parse_display_timing - parse display_timing entry from device_node
  * @np: device_node with the properties
+ * @dt: display_timing that contains the result. I may be partially written in case of errors
  **/
 static int of_parse_display_timing(const struct device_node *np,
 		struct display_timing *dt)
diff --git a/drivers/video/of_videomode.c b/drivers/video/of_videomode.c
index 67aff2421c29..a5bb02f02b44 100644
--- a/drivers/video/of_videomode.c
+++ b/drivers/video/of_videomode.c
@@ -13,10 +13,10 @@
 #include <video/videomode.h>
 
 /**
- * of_get_videomode - get the videomode #<index> from devicetree
- * @np - devicenode with the display_timings
- * @vm - set to return value
- * @index - index into list of display_timings
+ * of_get_videomode: get the videomode #<index> from devicetree
+ * @np: devicenode with the display_timings
+ * @vm: set to return value
+ * @index: index into list of display_timings
  *	    (Set this to OF_USE_NATIVE_MODE to use whatever mode is
  *	     specified as native mode in the DT.)
  *
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
