Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 574872C6C47
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 20:59:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2D886F3D8;
	Fri, 27 Nov 2020 19:59:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D555C6F3D8
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 19:59:17 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id s9so7093648ljo.11
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 11:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mRaQzSKHKEuFE/qSNI079F7TkEGyaY0pXgqjdW2jv1k=;
 b=F5kbqnNAjMLimvM6NUli0+DihWCFYsBD33fOr3p163gxIURDv8B6jteJoEoQ+geGjs
 MaShloEU1MtW6yhoNx/S2FtEUiP/7S0bg73YNb68VLyN+2NS/JHHXYq/MRDrl+j7d7Qs
 apXomIG4x8rmWcntA311Xv5TtIvKNpWMQ+cb2zkPlxhYuHglLRxZ+Xvh3yVfhmM9lD9W
 JllBNk9cOxuFLM2zmwQc8VfnmQYPwmQqBFcMfBMPTcNa7qxUor4JsVKfnWzCHQvP1QKT
 lb6tD8ZSHCEjGsUQXad9S939PolnZeDXHL8rxy8QaDpTsTyRy/dZxjqXXBF2+Bk4rC8g
 LuVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mRaQzSKHKEuFE/qSNI079F7TkEGyaY0pXgqjdW2jv1k=;
 b=PG8IMsRWqSMvjDKEOTZa95bFbLrun1nngANlsBIgRO0TpzXTDmshZlNoSNvMxUJggv
 LgrnsaIVrbDyQg42eC+7VdrCIhCQtJpyzWzDFhLc3lcerZv+D7gJGoeDsAiqoR4+946A
 lrG/x1ztUWK21Wd6PMdtV4Uu8uj2RORJjfHsNIO0qLOzPy8PZ89NfEs9c3Kbuek5yC4l
 tJBI1y9UWGkza8gNww65aL21Fr0QEHNmvHbxNn+n/etKzObtKFWYJW1D60C8URXvPeyZ
 HEpKBLaAmZAauAbfK58r2sa5kq1gRGK6Pg4i9KGrXIgYBsxz30QvByv+ymbtsxk+7py3
 W1eg==
X-Gm-Message-State: AOAM531OEVbkRxZ8vJUe13BxHJ0VKUZ3cEx3yZY1YawGo9OI6sv3CAHt
 EzvpyuILr6NOa9XI2V/L/GjcT8Wft2ZuShBA
X-Google-Smtp-Source: ABdhPJxny0VqK6KTdW128+jhrnmUhcAiAPM8ah698YeRpDAV9+q/qAnWBVSKNtaRbwkos5sr5AZ61Q==
X-Received: by 2002:a2e:8796:: with SMTP id n22mr4325949lji.345.1606507156297; 
 Fri, 27 Nov 2020 11:59:16 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:9d62:990:4557:451])
 by smtp.gmail.com with ESMTPSA id c6sm1070415ljj.140.2020.11.27.11.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 11:59:15 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v1 16/28] video: fbdev: hgafb: Fix W=1 warnings
Date: Fri, 27 Nov 2020 20:58:13 +0100
Message-Id: <20201127195825.858960-17-sam@ravnborg.org>
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

Fix kernel-doc comments.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Ferenc Bakonyi <fero@drama.obuda.kando.hu>
Cc: linux-nvidia@lists.surfsouth.com
---
 drivers/video/fbdev/hgafb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/hgafb.c b/drivers/video/fbdev/hgafb.c
index a45fcff1461f..69af72937844 100644
--- a/drivers/video/fbdev/hgafb.c
+++ b/drivers/video/fbdev/hgafb.c
@@ -358,7 +358,7 @@ static int hga_card_detect(void)
 /**
  *	hgafb_open - open the framebuffer device
  *	@info:pointer to fb_info object containing info for current hga board
- *	@int:open by console system or userland.
+ *	@init:open by console system or userland.
  */
 
 static int hgafb_open(struct fb_info *info, int init)
@@ -372,7 +372,7 @@ static int hgafb_open(struct fb_info *info, int init)
 /**
  *	hgafb_open - open the framebuffer device
  *	@info:pointer to fb_info object containing info for current hga board
- *	@int:open by console system or userland.
+ *	@init:open by console system or userland.
  */
 
 static int hgafb_release(struct fb_info *info, int init)
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
