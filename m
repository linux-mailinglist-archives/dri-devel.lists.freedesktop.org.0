Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BC03FAFC8
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 04:32:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1465389CD7;
	Mon, 30 Aug 2021 02:31:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9482D89CD7
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 02:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=Jxx+nBbp11l5ZDB/Fk4qIsZNM8MYtLgBg6pRgatfv2Q=; b=0lAb7dUTSjUGFtdCGkJOZ7T/lY
 KH+e0MnHt1mVLY6h/bVnvC/KqQGrzhwYPlKnlmDexWxewc7yo/QA88YW9DY5V93maaPvL4PNyHiRr
 +Qq7StwlBbBTQRJNIO4VGFfJ+Ba2Fo2aVVmXgGeHfFYThnk1xYptq00qbI4Gt5EpwpPb+At++T/x0
 tyP6XIXG/O/e9NVbEZnjs4bDMVHBIisPsnP+Z4K4x4MSXllhMZyppdthzXFG1XGodCKbOrG+V0cV1
 g8gXa0NCkv58VffaMGBmgmBlMDlUUTxHVXLCj1azyJ/OKUdkpO8yRToQqYH8gabWWABaNZVaU2VzA
 geiF3xew==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKX5W-00GJAa-62; Mon, 30 Aug 2021 02:31:54 +0000
Subject: Re: [syzbot] BUG: unable to handle kernel paging request in
 vga16fb_fillrect
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 syzbot <syzbot+04168c8063cfdde1db5e@syzkaller.appspotmail.com>,
 akpm@linux-foundation.org, b.zolnierkie@samsung.com,
 colin.king@canonical.com, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 masahiroy@kernel.org, syzkaller-bugs@googlegroups.com
References: <000000000000815b9605c70e74f8@google.com>
 <131b24e5-ee31-6f7b-42b4-c34583711913@infradead.org>
 <2fccb5d3-191c-924e-159f-1c9d423e282f@i-love.sakura.ne.jp>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <339bfb21-8e80-c7d9-46dd-c416f87c50c0@infradead.org>
Date: Sun, 29 Aug 2021 19:31:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <2fccb5d3-191c-924e-159f-1c9d423e282f@i-love.sakura.ne.jp>
Content-Type: text/plain; charset=utf-8; format=flowed
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

On 8/29/21 7:27 PM, Tetsuo Handa wrote:
> On 2021/08/30 9:24, Randy Dunlap wrote:
>> Note that yres_virtual is set to 0x10000000. Is there no practical limit
>> (hence limit check) that can be used here?
>>
>> Also, in vga16fb_check_var(), beginning at line 404:
>>
>>    404        if (yres > vyres)
>>    405            vyres = yres;
>>    406        if (vxres * vyres > maxmem) {
>>    407            vyres = maxmem / vxres;
>>    408            if (vyres < yres)
>>    409                return -ENOMEM;
>>    410        }
>>
>> At line 406, the product of vxres * vyres overflows 32 bits (is 0 in this
>> case/example), so any protection from this block is lost.
> 
> OK. Then, we can check overflow like below.
> 
> diff --git a/drivers/video/fbdev/vga16fb.c b/drivers/video/fbdev/vga16fb.c
> index e2757ff1c23d..e483a3f5fd47 100644
> --- a/drivers/video/fbdev/vga16fb.c
> +++ b/drivers/video/fbdev/vga16fb.c
> @@ -403,7 +403,7 @@ static int vga16fb_check_var(struct fb_var_screeninfo *var,
>   
>   	if (yres > vyres)
>   		vyres = yres;
> -	if (vxres * vyres > maxmem) {
> +	if ((u64) vxres * vyres > (u64) maxmem) {
>   		vyres = maxmem / vxres;
>   		if (vyres < yres)
>   			return -ENOMEM;
> 
> But I think we can check overflow in the common code like below. (Both patch fixed the oops.)

OK, great. Thanks.

> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index 1c855145711b..8899679bbc46 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -1008,6 +1008,11 @@ fb_set_var(struct fb_info *info, struct fb_var_screeninfo *var)
>   	if (var->xres < 8 || var->yres < 8)
>   		return -EINVAL;
>   
> +	/* Don't allow u32 * u32 to overflow. */
> +	if ((u64) var->xres * var->yres > (u64) UINT_MAX ||
> +	    (u64) var->xres_virtual * var->yres_virtual > (u64) UINT_MAX)
> +		return -EINVAL;
> +
>   	ret = info->fbops->fb_check_var(var, info);
>   
>   	if (ret)
> 
>>
>> But even if yres_virtual (aka vyres) is "only" 0x01000000, so no
>> multiplication overflow occurs, the resulting value of vyres "seems"
>> to still be too large and can cause an error [I'm not sure about this
>> last part -- I need to use a new gcc so that KASAN will work.]
> 


-- 
~Randy

