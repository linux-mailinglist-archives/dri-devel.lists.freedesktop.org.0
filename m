Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3EC2C7652
	for <lists+dri-devel@lfdr.de>; Sat, 28 Nov 2020 23:42:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD1B66ED0F;
	Sat, 28 Nov 2020 22:42:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 085036ECF9
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 22:42:11 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id l11so12775676lfg.0
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 14:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CjZfskooFlaX/DGp4t6swfhL0OZzCmQsrAHog/enb2E=;
 b=kbvH5lO6M/0b24ppZEXXjkELi137m8NHaDUi5sHcw9rgj9eEAMN+y8qSrVKSah43ZB
 kNzlmzEdaaOYOIiqJKn1QuTx4HECFGiNG5kIYtZVLjmzMMCYE8XksdHL9QrRejfF2L4k
 tc+pZ7F6yRNKZTfx/4k0M/8aHNQca6Le//TxOPNQg21tKPG0fpjao+tSkG0zUUx4C/p4
 Do2QuSanQTDFC5byyaFn272MmfSydSeWIcEeX7J1u6P/GHak3TWpJ9leOcXx3/rkepbU
 0rENcy6xxB0X63NjVUvqHntifA7cH13M+jadh0Cqw6o1lQjgi4jhld/Dj9XzIOnlgCBa
 Rg6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=CjZfskooFlaX/DGp4t6swfhL0OZzCmQsrAHog/enb2E=;
 b=gQ94WkUUphV7JL4+2aL3ItNw97XLyAAXwTA5myOD1A2KIb/Isvj1fftDtbJDQ/rROk
 ecoCirUmyrV4F3IykG/7M03eby0+lzWTycoE6L+SM4meKs6FMpnwAISNShZ53VfN3zBo
 1QxlWm3LXvC0P04RlaVPwQ3ubO+flxoLBIgGt9B/6BU3QfeyNmUiL2nZ0HvYF2e3Kzl8
 NSjncFJkpLydNr9BVrxjKmgsovhAEBanNNir4DcbuNJwyYH/g8MaLU0t2030usyRg/rX
 MQl7O1gcELui0wa6TWQEGaN3+VLi6SMe8WXD2VSDk25ilOZYRmBhV62I0ZqgYpnZ0ck4
 uF+A==
X-Gm-Message-State: AOAM530h+qIJTDUvetho2dAFA7VYBv/YLgCmYFDf0Sk6LQQxya3GI05A
 BOFrRagTYOP2ScGwiG4XFdU=
X-Google-Smtp-Source: ABdhPJw+VsDQ4zX/JWQzp6JQylXffQeZeYKR1WVyqNC7V1IDBPsnpo4ION23xSBTKahJANEMfTaLxA==
X-Received: by 2002:a05:6512:5d7:: with SMTP id
 o23mr6317203lfo.272.1606603329464; 
 Sat, 28 Nov 2020 14:42:09 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:a4c7:9ff9:a160:aad0])
 by smtp.gmail.com with ESMTPSA id
 w21sm1236857lff.280.2020.11.28.14.42.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 14:42:08 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v2 25/28] video: fbdev: uvesafb: Fix set but not used warning
Date: Sat, 28 Nov 2020 23:41:11 +0100
Message-Id: <20201128224114.1033617-26-sam@ravnborg.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201128224114.1033617-1-sam@ravnborg.org>
References: <20201128224114.1033617-1-sam@ravnborg.org>
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
 Michal Januszewski <spock@gentoo.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jiri Slaby <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
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
 Gustavo Silva <gustavoars@kernel.org>, Peter Rosin <peda@axentia.se>,
 George Kennedy <george.kennedy@oracle.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Alexander Klimov <grandmaster@al2klimov.de>, Jingoo Han <jingoohan1@gmail.com>,
 Joe Perches <joe@perches.com>, Peilin Ye <yepeilin.cs@gmail.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix W=1 warning by deleting unused local variable.

v2:
  - Updated subject (Lee)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Michal Januszewski <spock@gentoo.org>
Cc: linux-fbdev@vger.kernel.org
Cc: Lee Jones <lee.jones@linaro.org>
---
 drivers/video/fbdev/uvesafb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/uvesafb.c b/drivers/video/fbdev/uvesafb.c
index def14ac0ebe1..8ee0fc9c63cf 100644
--- a/drivers/video/fbdev/uvesafb.c
+++ b/drivers/video/fbdev/uvesafb.c
@@ -554,12 +554,12 @@ static int uvesafb_vbe_getmodes(struct uvesafb_ktask *task,
 static int uvesafb_vbe_getpmi(struct uvesafb_ktask *task,
 			      struct uvesafb_par *par)
 {
-	int i, err;
+	int i;
 
 	uvesafb_reset(task);
 	task->t.regs.eax = 0x4f0a;
 	task->t.regs.ebx = 0x0;
-	err = uvesafb_exec(task);
+	uvesafb_exec(task);
 
 	if ((task->t.regs.eax & 0xffff) != 0x4f || task->t.regs.es < 0xc000) {
 		par->pmi_setpal = par->ypan = 0;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
