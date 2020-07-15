Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E383221FE3
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jul 2020 11:43:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CA876EC36;
	Thu, 16 Jul 2020 09:42:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A57446E16F
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jul 2020 11:17:54 +0000 (UTC)
Received: from fsav404.sakura.ne.jp (fsav404.sakura.ne.jp [133.242.250.103])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 06FBHk8c074032;
 Wed, 15 Jul 2020 20:17:46 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav404.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav404.sakura.ne.jp);
 Wed, 15 Jul 2020 20:17:46 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav404.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 06FBHk6A074027
 (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
 Wed, 15 Jul 2020 20:17:46 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [PATCH v2] fbdev: Detect integer underflow at "struct
 fbcon_ops"->clear_margins.
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <adff5d10-fe35-62d4-74c5-182958c5ada7@i-love.sakura.ne.jp>
 <20200715015102.3814-1-penguin-kernel@I-love.SAKURA.ne.jp>
 <20200715094836.GD2571@kadam>
From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <9e6eac10-c5c3-f518-36cc-9ea32fb5d7fe@i-love.sakura.ne.jp>
Date: Wed, 15 Jul 2020 20:17:44 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200715094836.GD2571@kadam>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 16 Jul 2020 09:42:42 +0000
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 syzbot <syzbot+e5fd3e65515b48c02a30@syzkaller.appspotmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 George Kennedy <george.kennedy@oracle.com>, Jiri Slaby <jslaby@suse.com>,
 Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020/07/15 18:48, Dan Carpenter wrote:
>> @@ -216,7 +216,7 @@ static void bit_clear_margins(struct vc_data *vc, struct fb_info *info,
>>  	region.color = color;
>>  	region.rop = ROP_COPY;
>>  
>> -	if (rw && !bottom_only) {
>> +	if ((int) rw > 0 && !bottom_only) {
>>  		region.dx = info->var.xoffset + rs;
>                             ^^^^^^^^^^^^^^^^^^^^^^
> 
> If you choose a very high positive "rw" then this addition can overflow.
> info->var.xoffset comes from the user and I don't think it's checked...

Well, I think it would be checked by "struct fb_ops"->check_var hook.
For example, vmw_fb_check_var() has

	if ((var->xoffset + var->xres) > par->max_width ||
	    (var->yoffset + var->yres) > par->max_height) {
		DRM_ERROR("Requested geom can not fit in framebuffer\n");
		return -EINVAL;
	}

check. Of course, there might be integer overflow in that check...
Having sanity check at caller of "struct fb_ops"->check_var might be nice.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
