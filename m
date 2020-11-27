Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5132C6C4A
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 20:59:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 778496F3E3;
	Fri, 27 Nov 2020 19:59:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E9926F3D8
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 19:59:15 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id r18so7136347ljc.2
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 11:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bZVUjqZPvk9JmE5Zg9zhFjt8GTdbfi/4bsMjlewJUWk=;
 b=XrtZdKGu5/hNrxeMcY7JQje+7wV52fu30Ck/RUr5wsZpyQJcANFJZ39N0KWddETdEX
 fOPkmhKTz1DW+fwvSOBvpDKgWwNZ91XoVSfOPIDK33hQY0hcdC9JHsjlQdYjok5aakxe
 1lDcFQ05uuljUZIeMgpbYUPatcYhMAqNE6jakOSRD6eCrf/VCMhQPcWqVxtIQEk6WaS7
 /EuO9akDGzU266dv9OuffMUYSiox7QhVCEhyN3qTkL+CAKWNhEeQKfxGHd6uqH2Hz+EP
 T4PIJQr2oREk9yV+SGzpgGoKrWxRkM5vR9tVIniIgYrgPTHJ8/gR4vcb+WJm7nPWuFIT
 Jk3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=bZVUjqZPvk9JmE5Zg9zhFjt8GTdbfi/4bsMjlewJUWk=;
 b=o+9IJHD+IFYI7AwcsjPCZFt3XJ9+gH4WmqasR1p4/7IQ0ZO/PpZVruxREExuGP163u
 82IDjQKrhwlKa2TaalOd85RulUZTlB5tHvMNdSF9RjCMBDiksyyD4V10kWB0Wobis+TO
 BtRmR7GVFu/hhqxOQl5u21rQzx8ossxO2pbrxtSCpCWlTsRYhRUWuA8jCXz/iWKt9Ol+
 YYQiqeegW00Gdw2vxx3oc6WU+4CTBQanIhC1Q+ROEOficTQ04vH5Zu/tWEoqIF7igY8J
 IyyT/FA7NhQ0jw9br6swKLMvZo8gMEbkypXF9CyvAjDr+sq1C4rHiHLsZVZCI+KAzQ6r
 cmtA==
X-Gm-Message-State: AOAM5300Ie8fwjA+Q+YzXwZrpf/HWl8T8me197zzn9Lu71DfPTzo53O/
 Vf5tW5Jari2N08ItjZ6CP9w=
X-Google-Smtp-Source: ABdhPJzIf2J8nBqop7fmYzkcGAkj+y2xNYn0qrO6QCTJJblj1YqU+JBYf2vFEz2ZVBbbWeDXxgiKVw==
X-Received: by 2002:a2e:9510:: with SMTP id f16mr4618994ljh.408.1606507153729; 
 Fri, 27 Nov 2020 11:59:13 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:9d62:990:4557:451])
 by smtp.gmail.com with ESMTPSA id c6sm1070415ljj.140.2020.11.27.11.59.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 11:59:13 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v1 15/28] video: fbdev: neofb: Fix W=1 warnings
Date: Fri, 27 Nov 2020 20:58:12 +0100
Message-Id: <20201127195825.858960-16-sam@ravnborg.org>
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
 Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>,
 Peilin Ye <yepeilin.cs@gmail.com>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix W=1 warnigns by removing unused code

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Evgeny Novikov <novikov@ispras.ru>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Mike Rapoport <rppt@kernel.org>
---
 drivers/video/fbdev/neofb.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/video/fbdev/neofb.c b/drivers/video/fbdev/neofb.c
index 09a20d4ab35f..c0f4f402da3f 100644
--- a/drivers/video/fbdev/neofb.c
+++ b/drivers/video/fbdev/neofb.c
@@ -1843,7 +1843,6 @@ static int neo_init_hw(struct fb_info *info)
 	struct neofb_par *par = info->par;
 	int videoRam = 896;
 	int maxClock = 65000;
-	int CursorMem = 1024;
 	int CursorOff = 0x100;
 
 	DBG("neo_init_hw");
@@ -1895,19 +1894,16 @@ static int neo_init_hw(struct fb_info *info)
 	case FB_ACCEL_NEOMAGIC_NM2070:
 	case FB_ACCEL_NEOMAGIC_NM2090:
 	case FB_ACCEL_NEOMAGIC_NM2093:
-		CursorMem = 2048;
 		CursorOff = 0x100;
 		break;
 	case FB_ACCEL_NEOMAGIC_NM2097:
 	case FB_ACCEL_NEOMAGIC_NM2160:
-		CursorMem = 1024;
 		CursorOff = 0x100;
 		break;
 	case FB_ACCEL_NEOMAGIC_NM2200:
 	case FB_ACCEL_NEOMAGIC_NM2230:
 	case FB_ACCEL_NEOMAGIC_NM2360:
 	case FB_ACCEL_NEOMAGIC_NM2380:
-		CursorMem = 1024;
 		CursorOff = 0x1000;
 
 		par->neo2200 = (Neo2200 __iomem *) par->mmio_vbase;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
