Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C433FAFF7
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 05:12:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE74C89C84;
	Mon, 30 Aug 2021 03:12:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2690 seconds by postgrey-1.36 at gabe;
 Mon, 30 Aug 2021 03:12:43 UTC
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9945E89C84
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 03:12:43 +0000 (UTC)
Received: from fsav313.sakura.ne.jp (fsav313.sakura.ne.jp [153.120.85.144])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 17U2RT56028520;
 Mon, 30 Aug 2021 11:27:29 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav313.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav313.sakura.ne.jp);
 Mon, 30 Aug 2021 11:27:29 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav313.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 17U2RS7V028517
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 30 Aug 2021 11:27:28 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [syzbot] BUG: unable to handle kernel paging request in
 vga16fb_fillrect
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 syzbot <syzbot+04168c8063cfdde1db5e@syzkaller.appspotmail.com>,
 akpm@linux-foundation.org, b.zolnierkie@samsung.com,
 colin.king@canonical.com, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 masahiroy@kernel.org, syzkaller-bugs@googlegroups.com
References: <000000000000815b9605c70e74f8@google.com>
 <131b24e5-ee31-6f7b-42b4-c34583711913@infradead.org>
From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <2fccb5d3-191c-924e-159f-1c9d423e282f@i-love.sakura.ne.jp>
Date: Mon, 30 Aug 2021 11:27:27 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <131b24e5-ee31-6f7b-42b4-c34583711913@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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

On 2021/08/30 9:24, Randy Dunlap wrote:
> Note that yres_virtual is set to 0x10000000. Is there no practical limit
> (hence limit check) that can be used here?
> 
> Also, in vga16fb_check_var(), beginning at line 404:
> 
>   404        if (yres > vyres)
>   405            vyres = yres;
>   406        if (vxres * vyres > maxmem) {
>   407            vyres = maxmem / vxres;
>   408            if (vyres < yres)
>   409                return -ENOMEM;
>   410        }
> 
> At line 406, the product of vxres * vyres overflows 32 bits (is 0 in this
> case/example), so any protection from this block is lost.

OK. Then, we can check overflow like below.

diff --git a/drivers/video/fbdev/vga16fb.c b/drivers/video/fbdev/vga16fb.c
index e2757ff1c23d..e483a3f5fd47 100644
--- a/drivers/video/fbdev/vga16fb.c
+++ b/drivers/video/fbdev/vga16fb.c
@@ -403,7 +403,7 @@ static int vga16fb_check_var(struct fb_var_screeninfo *var,
 
 	if (yres > vyres)
 		vyres = yres;
-	if (vxres * vyres > maxmem) {
+	if ((u64) vxres * vyres > (u64) maxmem) {
 		vyres = maxmem / vxres;
 		if (vyres < yres)
 			return -ENOMEM;

But I think we can check overflow in the common code like below. (Both patch fixed the oops.)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 1c855145711b..8899679bbc46 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1008,6 +1008,11 @@ fb_set_var(struct fb_info *info, struct fb_var_screeninfo *var)
 	if (var->xres < 8 || var->yres < 8)
 		return -EINVAL;
 
+	/* Don't allow u32 * u32 to overflow. */
+	if ((u64) var->xres * var->yres > (u64) UINT_MAX ||
+	    (u64) var->xres_virtual * var->yres_virtual > (u64) UINT_MAX)
+		return -EINVAL;
+
 	ret = info->fbops->fb_check_var(var, info);
 
 	if (ret)

> 
> But even if yres_virtual (aka vyres) is "only" 0x01000000, so no
> multiplication overflow occurs, the resulting value of vyres "seems"
> to still be too large and can cause an error [I'm not sure about this
> last part -- I need to use a new gcc so that KASAN will work.]

