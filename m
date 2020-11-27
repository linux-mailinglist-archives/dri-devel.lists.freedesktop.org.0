Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B17742C6C45
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 20:59:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C14A6F3DD;
	Fri, 27 Nov 2020 19:59:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA71A6F3CB
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 19:58:56 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id z1so7129960ljn.4
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 11:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3DqPrwDONktOgwN/CoiXWyViY/Qg5UYX+rJPHgpGJjk=;
 b=P+RaYsbOnx2acYAr3uSsgohDNBxSOaEg2p+n2du3Hw9r2lHgqBPN6uoIYzal4dnKPO
 n/72hIZvM5k86IY6eUYZovHeKZjX8JZedbxZF+MsFbRByjtZiO31SwXk1TPL3UVit0j0
 XwTFPFIRGyVaDUSN1Fb3dA2p4y873sq2IrEEXCE2XKc/d9nhLphkUfWi/jAEkPSt377I
 COlmuA9oHxtWkMNQ/Gk8lG3Vt98mr+BIAzo1LdBSNDc75umBhEMDphDOH3C71v2RCwEJ
 xfKSnfq/CwSw3GT8qMAzvJ6qxcGCwergB6dRle+04X1r1S0U/UrOaOelkmujE7c5c+AM
 Vdlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3DqPrwDONktOgwN/CoiXWyViY/Qg5UYX+rJPHgpGJjk=;
 b=iGQoq1Ntjm4osUbWRkqnP4bX3i7GeZ2MxXDmXvE5jwwjMJ2zqi1bYLJdQAnU8e6s1z
 ydL8Eevn5KTjzyYLVjewmrm0Zw5ks49U3Ojl4FQdY5FLiX8+um+M56smWg1WP30BKH/O
 YJlEVYs5pB9iMzM43sbuaXpMVe0Lb+QFH9CA+Cxsv0GxgnsQ3kTG6tKsXVEeGDJNDNiH
 rosNUuGPDpKyjwvjgYyrb4NElFw9BRjoE8nEnu+DDy/FHBewN6y7NwAGYL+L2haLcMu8
 KEPjQBeEmEslzsE8wxvR97zbM1U8r9g4DeRnFzlsvA+4MfmB859OPPtMD1pcpqd2vkQ8
 7xhw==
X-Gm-Message-State: AOAM530BfMsqS/tG52Ik/FZNyj9r3wClQGjWd1I/3c4iDS7Vfd3x1dy/
 oubzebfjQ4VDZKrJyX3Ytlg=
X-Google-Smtp-Source: ABdhPJzuQ2Prv1GUopct6yqHR86fQNHT0/F1E6ioU4/Kz0f0Fap2yxzWa6Upc/90vmj8G3YzFJJBsg==
X-Received: by 2002:a2e:164b:: with SMTP id 11mr2781307ljw.34.1606507135224;
 Fri, 27 Nov 2020 11:58:55 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:9d62:990:4557:451])
 by smtp.gmail.com with ESMTPSA id c6sm1070415ljj.140.2020.11.27.11.58.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 11:58:54 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v1 08/28] video: fbdev: sis: Fix W=1 warning about SiS_TVDelay
Date: Fri, 27 Nov 2020 20:58:05 +0100
Message-Id: <20201127195825.858960-9-sam@ravnborg.org>
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

Fix W=1 warning by commenting unused SiS_TVDelay* variables.

The SiS_TVDelay* variables seem to contain some magic numbers
so looks like data worth keeping around but not as code we build.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Winischhofer <thomas@winischhofer.net>
---
 drivers/video/fbdev/sis/oem310.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/video/fbdev/sis/oem310.h b/drivers/video/fbdev/sis/oem310.h
index 8fce56e4482c..ed28755715ce 100644
--- a/drivers/video/fbdev/sis/oem310.h
+++ b/drivers/video/fbdev/sis/oem310.h
@@ -200,6 +200,7 @@ static const unsigned char SiS310_TVDelayCompensation_651302LV[] =	/* M650, 651,
 	0x33,0x33
 };
 
+#if 0 /* Not used */
 static const unsigned char SiS_TVDelay661_301[] =			/* 661, 301 */
 {
 	0x44,0x44,
@@ -219,6 +220,7 @@ static const unsigned char SiS_TVDelay661_301B[] =			/* 661, 301B et al */
 	0x44,0x44,
 	0x44,0x44
 };
+#endif
 
 static const unsigned char SiS310_TVDelayCompensation_LVDS[] =		/* LVDS */
 {
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
