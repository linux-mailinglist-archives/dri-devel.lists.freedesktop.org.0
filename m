Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FAFE7133F4
	for <lists+dri-devel@lfdr.de>; Sat, 27 May 2023 12:19:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 250A310E0E3;
	Sat, 27 May 2023 10:19:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod2-cph3.one.com
 (mailrelay4-1.pub.mailoutpod2-cph3.one.com [46.30.211.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10C4E10E0E3
 for <dri-devel@lists.freedesktop.org>; Sat, 27 May 2023 10:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=IduYu/s4OsRw4K9shIM47E55lQUjY9kwJJiAFyGsw3M=;
 b=MhMDG/rdGDIKHi2bRUtfXp0cQE/i5HLPuqPC2ykla7IWHXrnpBqCynsN/+wK8uxyVm3w7/eHzMpFj
 Kcifi+dW29TtIr98+sMR+jJiU24bt0hMxdlLLVZCTC7gGF3kSq+a4ZOEI2KIjaFIVCI4LgVVwKHPry
 jhxzDbrmi96myN9rwEg10vpmYmlH1Cmdv1HPTqfPJbV7vfXqmxT5FQYkGZHCnbLm9AH4Y6Uk5hC01j
 9nbUDGuRA8iboLiwdHaN/XlieRLjpjo8ex1Z4NNS125Cku9nbXlh/0fpejKojXj/1H3zw9L54k4u2L
 q+v/I+rvqUIz24/MQk4vk7jVXt+O/HA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=IduYu/s4OsRw4K9shIM47E55lQUjY9kwJJiAFyGsw3M=;
 b=CyxvkPHn/peJUKCJlBVHPTMfL2kEhhCEtESqFbVgcG8wfHpC2t9jlsyLCCyPUS51d5LykXZ4yfS9S
 S+g38/+Bg==
X-HalOne-ID: c568d13f-fc77-11ed-bc9b-592bb1efe9dc
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay4 (Halon) with ESMTPSA
 id c568d13f-fc77-11ed-bc9b-592bb1efe9dc;
 Sat, 27 May 2023 10:18:08 +0000 (UTC)
Date: Sat, 27 May 2023 12:18:07 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] fbcon: Avoid showing softcursor if font not available
Message-ID: <20230527101807.GA1101718@ravnborg.org>
References: <ZHHLBpGkHBmIpGT9@ls3530>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZHHLBpGkHBmIpGT9@ls3530>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Helge,

On Sat, May 27, 2023 at 11:19:02AM +0200, Helge Deller wrote:
> syzbot repored this bug in the softcursor code:
> 
> BUG: KASAN: null-ptr-deref in soft_cursor+0x384/0x6b4 drivers/video/fbdev/core/softcursor.c:70
> Read of size 16 at addr 0000000000000200 by task kworker/u4:1/12
> 
> CPU: 0 PID: 12 Comm: kworker/u4:1 Not tainted 6.4.0-rc3-syzkaller-geb0f1697d729 #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/28/2023
> Workqueue: events_power_efficient fb_flashcursor
> Call trace:
>  dump_backtrace+0x1b8/0x1e4 arch/arm64/kernel/stacktrace.c:233
>  show_stack+0x2c/0x44 arch/arm64/kernel/stacktrace.c:240
>  __dump_stack lib/dump_stack.c:88 [inline]
>  dump_stack_lvl+0xd0/0x124 lib/dump_stack.c:106
>  print_report+0xe4/0x514 mm/kasan/report.c:465
>  kasan_report+0xd4/0x130 mm/kasan/report.c:572
>  kasan_check_range+0x264/0x2a4 mm/kasan/generic.c:187
>  __asan_memcpy+0x3c/0x84 mm/kasan/shadow.c:105
>  soft_cursor+0x384/0x6b4 drivers/video/fbdev/core/softcursor.c:70
>  bit_cursor+0x113c/0x1a64 drivers/video/fbdev/core/bitblit.c:377
>  fb_flashcursor+0x35c/0x54c drivers/video/fbdev/core/fbcon.c:380
>  process_one_work+0x788/0x12d4 kernel/workqueue.c:2405
>  worker_thread+0x8e0/0xfe8 kernel/workqueue.c:2552
>  kthread+0x288/0x310 kernel/kthread.c:379
>  ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:853
> 
> This fix let bit_cursor() bail out early when a font bitmap
> isn't available yet.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> Cc: stable@kernel.org
> Reported-by: syzbot+d910bd780e6efac35869@syzkaller.appspotmail.com
> ---
>  drivers/video/fbdev/core/bitblit.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/video/fbdev/core/bitblit.c b/drivers/video/fbdev/core/bitblit.c
> index f98e8f298bc1..8587c9da0670 100644
> --- a/drivers/video/fbdev/core/bitblit.c
> +++ b/drivers/video/fbdev/core/bitblit.c
> @@ -247,6 +247,9 @@ static void bit_cursor(struct vc_data *vc, struct fb_info *info, int mode,
> 
>  	cursor.set = 0;
> 
> +	if (!vc->vc_font.data)
> +		return;
> +
>   	c = scr_readw((u16 *) vc->vc_pos);
>  	attribute = get_attribute(info, c);
>  	src = vc->vc_font.data + ((c & charmask) * (w * vc->vc_font.height));

When browsing the code I noticed another use of vc->vc_font.data.

bit_putcs_{un}aligned() access vc->vc_font.data too, so I wonder if
bit_putcs() should also check for vc->vc_font.data?
bit_putcs() is the only user of bit_putcs_{un}aligned.


The actual patch here looks good from a quick browsing around, but I
cannot claim I did a review. But you have my:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

	Sam
