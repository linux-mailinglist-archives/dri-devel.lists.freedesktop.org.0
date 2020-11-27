Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8C42C6C48
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 20:59:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFC516F3DF;
	Fri, 27 Nov 2020 19:59:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 453016F3D8
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 19:59:10 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id j205so8557848lfj.6
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 11:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DHnHNejv7AhApH+VUvGdbMBEjvsQK7oM4lZgYgyuVAY=;
 b=vCNLiQfeEvpoIJt7SkD1g+b4b3Ux90ZWyPNnAZRBnotTZmnTAUWU24s2YoBHrsdvZD
 HxCRM7514OVQW17o980p5GXoRkXivoEpKQ+Mbn1TsTqssE0/ETcE4LevBAFVQYCf3fxw
 8PDMHFg7CPWi6zn3b8FQAiFWakurLLmFHcHT4Iu5+Ly0rVqLJnOvvt63qr90NUTDZI0w
 3jU04Ie3q4YJyF+uyVwbgnBr45gi2ciRZhmOWquwHel6eJD8KH3teklR9iVM0UIH719O
 DtM7VwC1rO120zJbdy6NnmM65ymFjDpfT/hdbp9TLDP0uZAdNkfBZ/HoyN6o9Sq23tve
 w4cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DHnHNejv7AhApH+VUvGdbMBEjvsQK7oM4lZgYgyuVAY=;
 b=uJUBqLclf6d5D+kyYNu8ZqgVhIL4iG3Mku+iZsX/BKJodtzSiqm0hAX/dNLAJ0bRHs
 4nZqPB+TSv/hT4v+QWXhMzxu/t7atVS6XN7XdTmIv9txCo+yi2BxdmC+CSWib3IGppWk
 h9y2D/AfZnn0kNDgQHDWR1vXVZ0qhgIlCE9m2OtV/CJSAOflHhxJJerKu2J7HmUM6vOd
 hgLoMgdX7c44G6PZtRs9KtBWl7s+7eBVleuEVohi3W0m1IStStnLaae0ziT+fkYxfbY8
 CRs9y3GHjB9nHlG3E+J5JILAI/QtKcjtzwasQrocWVELZ8t29Wcl8yGCt1Do2oqJXQE5
 bUMQ==
X-Gm-Message-State: AOAM532NpsmfidLkqOL6g6ddieMb4OOqbu8PggXBnMUajdC0TyAqSAKw
 gfWtSB0bRZ6xwTckvDyqiyBnJh8X6bHZQkkV
X-Google-Smtp-Source: ABdhPJzmN19Ex+rToaLJQVEF+FVjbO2OJIoM/NZahowAyuob0kZlMAKXt1B+fW7Gczozaeltl7O2fA==
X-Received: by 2002:ac2:4acd:: with SMTP id m13mr4323957lfp.69.1606507148319; 
 Fri, 27 Nov 2020 11:59:08 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:9d62:990:4557:451])
 by smtp.gmail.com with ESMTPSA id c6sm1070415ljj.140.2020.11.27.11.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 11:59:07 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v1 13/28] video: fbdev: riva: Fix W=1 warnings
Date: Fri, 27 Nov 2020 20:58:10 +0100
Message-Id: <20201127195825.858960-14-sam@ravnborg.org>
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

Fix W=1 warnings:
- Fix kernel-doc
- Drop unused variables/code

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Antonino Daplas <adaplas@gmail.com>
Cc: linux-fbdev@vger.kernel.org
---
 drivers/video/fbdev/riva/fbdev.c   |  9 ++++-----
 drivers/video/fbdev/riva/riva_hw.c | 28 ++++++++--------------------
 2 files changed, 12 insertions(+), 25 deletions(-)

diff --git a/drivers/video/fbdev/riva/fbdev.c b/drivers/video/fbdev/riva/fbdev.c
index ce55b9d2e862..55554b0433cb 100644
--- a/drivers/video/fbdev/riva/fbdev.c
+++ b/drivers/video/fbdev/riva/fbdev.c
@@ -464,7 +464,7 @@ static inline void reverse_order(u32 *l)
 
 /**
  * rivafb_load_cursor_image - load cursor image to hardware
- * @data: address to monochrome bitmap (1 = foreground color, 0 = background)
+ * @data8: address to monochrome bitmap (1 = foreground color, 0 = background)
  * @par:  pointer to private data
  * @w:    width of cursor image in pixels
  * @h:    height of cursor image in scanlines
@@ -843,9 +843,9 @@ static void riva_update_var(struct fb_var_screeninfo *var,
 /**
  * rivafb_do_maximize - 
  * @info: pointer to fb_info object containing info for current riva board
- * @var:
- * @nom:
- * @den:
+ * @var: standard kernel fb changeable data
+ * @nom: nom
+ * @den: den
  *
  * DESCRIPTION:
  * .
@@ -1214,7 +1214,6 @@ static int rivafb_set_par(struct fb_info *info)
 /**
  * rivafb_pan_display
  * @var: standard kernel fb changeable data
- * @con: TODO
  * @info: pointer to fb_info object containing info for current riva board
  *
  * DESCRIPTION:
diff --git a/drivers/video/fbdev/riva/riva_hw.c b/drivers/video/fbdev/riva/riva_hw.c
index bcf9c4b4de31..8b829b720064 100644
--- a/drivers/video/fbdev/riva/riva_hw.c
+++ b/drivers/video/fbdev/riva/riva_hw.c
@@ -836,17 +836,17 @@ static void nv10CalcArbitration
     nv10_sim_state *arb
 )
 {
-    int data, pagemiss, cas,width, video_enable, bpp;
-    int nvclks, mclks, pclks, vpagemiss, crtpagemiss, vbs;
-    int nvclk_fill, us_extra;
+    int data, pagemiss, width, video_enable, bpp;
+    int nvclks, mclks, pclks, vpagemiss, crtpagemiss;
+    int nvclk_fill;
     int found, mclk_extra, mclk_loop, cbs, m1;
     int mclk_freq, pclk_freq, nvclk_freq, mp_enable;
-    int us_m, us_m_min, us_n, us_p, video_drain_rate, crtc_drain_rate;
-    int vus_m, vus_n, vus_p;
-    int vpm_us, us_video, vlwm, cpm_us, us_crt,clwm;
+    int us_m, us_m_min, us_n, us_p, crtc_drain_rate;
+    int vus_m;
+    int vpm_us, us_video, cpm_us, us_crt,clwm;
     int clwm_rnd_down;
-    int craw, m2us, us_pipe, us_pipe_min, vus_pipe, p1clk, p2;
-    int pclks_2_top_fifo, min_mclk_extra;
+    int m2us, us_pipe_min, p1clk, p2;
+    int min_mclk_extra;
     int us_min_mclk_extra;
 
     fifo->valid = 1;
@@ -854,16 +854,13 @@ static void nv10CalcArbitration
     mclk_freq = arb->mclk_khz;
     nvclk_freq = arb->nvclk_khz;
     pagemiss = arb->mem_page_miss;
-    cas = arb->mem_latency;
     width = arb->memory_width/64;
     video_enable = arb->enable_video;
     bpp = arb->pix_bpp;
     mp_enable = arb->enable_mp;
     clwm = 0;
-    vlwm = 1024;
 
     cbs = 512;
-    vbs = 512;
 
     pclks = 4; /* lwm detect. */
 
@@ -924,17 +921,11 @@ static void nv10CalcArbitration
       us_min_mclk_extra = min_mclk_extra *1000*1000 / mclk_freq;
       us_n = nvclks*1000*1000 / nvclk_freq;/* nvclk latency in us */
       us_p = pclks*1000*1000 / pclk_freq;/* nvclk latency in us */
-      us_pipe = us_m + us_n + us_p;
       us_pipe_min = us_m_min + us_n + us_p;
-      us_extra = 0;
 
       vus_m = mclk_loop *1000*1000 / mclk_freq; /* Mclk latency in us */
-      vus_n = (4)*1000*1000 / nvclk_freq;/* nvclk latency in us */
-      vus_p = 0*1000*1000 / pclk_freq;/* pclk latency in us */
-      vus_pipe = vus_m + vus_n + vus_p;
 
       if(video_enable) {
-        video_drain_rate = pclk_freq * 4; /* MB/s */
         crtc_drain_rate = pclk_freq * bpp/8; /* MB/s */
 
         vpagemiss = 1; /* self generating page miss */
@@ -993,7 +984,6 @@ static void nv10CalcArbitration
               else if(crtc_drain_rate * 100  >= nvclk_fill * 98) {
                   clwm = 1024;
                   cbs = 512;
-                  us_extra = (cbs * 1000 * 1000)/ (8*width)/mclk_freq ;
               }
           }
       }
@@ -1010,7 +1000,6 @@ static void nv10CalcArbitration
 
       m1 = clwm + cbs -  1024; /* Amount of overfill */
       m2us = us_pipe_min + us_min_mclk_extra;
-      pclks_2_top_fifo = (1024-clwm)/(8*width);
 
       /* pclk cycles to drain */
       p1clk = m2us * pclk_freq/(1000*1000); 
@@ -1038,7 +1027,6 @@ static void nv10CalcArbitration
               min_mclk_extra--;
         }
       }
-      craw = clwm;
 
       if(clwm < (1024-cbs+8)) clwm = 1024-cbs+8;
       data = (int)(clwm);
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
