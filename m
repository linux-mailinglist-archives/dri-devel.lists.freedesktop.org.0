Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2685DB93204
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 21:48:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18E1810E501;
	Mon, 22 Sep 2025 19:48:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com
 [45.249.212.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 341A110E430
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 11:42:23 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.93.142])
 by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4cVh6c53xlzYQtth
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 19:42:16 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
 by mail.maildlp.com (Postfix) with ESMTP id E4CD51A0D76
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 19:42:20 +0800 (CST)
Received: from [10.174.176.88] (unknown [10.174.176.88])
 by APP4 (Coremail) with SMTP id gCh0CgAXKWEYNtFoiYXFAQ--.64696S3;
 Mon, 22 Sep 2025 19:42:18 +0800 (CST)
Message-ID: <394c720f-d23e-4208-b1d6-e0b98b03fc91@huaweicloud.com>
Date: Mon, 22 Sep 2025 19:42:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: Delay the setting of fbcon_ops to fix KASAN issues
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, lee@kernel.org,
 jani.nikula@intel.com, oushixiong@kylinos.cn, soci@c64.rulez.org
Cc: linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, yangerkun@huawei.com
References: <20250905024340.337521-1-wozizhi@huaweicloud.com>
 <97658279-73a4-4d30-817b-6dcd47a11d6b@suse.de>
From: Zizhi Wo <wozizhi@huaweicloud.com>
In-Reply-To: <97658279-73a4-4d30-817b-6dcd47a11d6b@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: gCh0CgAXKWEYNtFoiYXFAQ--.64696S3
X-Coremail-Antispam: 1UD129KBjvJXoWxKFyrtFykur4UKFy3GF43trb_yoWxGrWDpF
 10yryUtFy5Crn5Jw17Xr4UXFy5XwnrJa4DW397ta4YyFW5AF1jqw4UXF1qgFW8Grs7Jr18
 Xw1DJrWxuF47Ar7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkEb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
 6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
 vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
 xVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
 0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
 x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
 0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AF
 wI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
 xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43
 MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
 0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWU
 JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07UAwI
 DUUUUU=
X-CM-SenderInfo: pzr2x6tkl6x35dzhxuhorxvhhfrp/
X-Mailman-Approved-At: Mon, 22 Sep 2025 19:47:43 +0000
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



在 2025/9/22 14:31, Thomas Zimmermann 写道:
> Hi
> 
> Am 05.09.25 um 04:43 schrieb Zizhi Wo:
>> [BUG]
>> Recently, we encountered a KASAN warning as follows:
>>
>> kasan_report+0xaf/0xe0 mm/kasan/report.c:588
>> fb_pad_aligned_buffer+0x12f/0x150 drivers/video/fbdev/core/fbmem.c:116
>> ccw_putcs_aligned drivers/video/fbdev/core/fbcon_ccw.c:119 [inline]
>> ccw_putcs+0x9ac/0xbb0 drivers/video/fbdev/core/fbcon_ccw.c:175
>> fbcon_putcs+0x329/0x3f0 drivers/video/fbdev/core/fbcon.c:1297
>> do_update_region+0x3de/0x670 drivers/tty/vt/vt.c:623
>> invert_screen+0x1de/0x600 drivers/tty/vt/vt.c:748
>> highlight drivers/tty/vt/selection.c:57 [inline]
>> clear_selection+0x5e/0x70 drivers/tty/vt/selection.c:81
>> vc_do_resize+0xc8e/0xf40 drivers/tty/vt/vt.c:1206
>> fbcon_modechanged+0x489/0x7a0 drivers/video/fbdev/core/fbcon.c:2705
>> fbcon_set_all_vcs+0x1e0/0x600 drivers/video/fbdev/core/fbcon.c:2752
>> fbcon_rotate_all drivers/video/fbdev/core/fbcon.c:250 [inline]
>> ...
>>
>> reproduce[probabilistic, depending on the width and height of vc_font, as
>> well as the value of "p" in do_update_region()]:
> 
> Which font sizes trigger the bug?

As far as I can remember, op.width = 32 and op.height = 12;

And I also do the TIOCL_SETSEL ioctl to set vc_sel.start && vc_sel.end

> 
>> 1) echo 2 > /sys/devices/virtual/graphics/fbcon/rotate_all
>> 2) echo 3 > /sys/devices/virtual/graphics/fbcon/rotate_all
>>
>> [CAUSE]
>> The root cause is that fbcon_modechanged() first sets the current 
>> rotate's
>> corresponding ops. Subsequently, during vc_resize(), it may trigger
>> clear_selection(), and in fbcon_putcs->ccw_putcs[rotate=3], this can 
>> result
>> in an out-of-bounds access to "src". This happens because ops->fontbuffer
>> is reallocated in fbcon_rotate_font():
>> 1) When rotate=2, its size is (width + 7) / 8 * height
>> 2) When rotate=3, its size is (height + 7) / 8 * width
>>
>> And the call to fbcon_rotate_font() occurs after clear_selection(). In
>> other words, the fontbuffer is allocated using the size calculated 
>> from the
>> previous rotation[2], but before reallocating it with the new size,
>> con_putcs is already using the new rotation[3]:
> 
> We recently reworked the way rotation callbacks are set. [1] Does the 
> bug still happen with [1] applied?
> 
> [1] https://patchwork.freedesktop.org/series/153056/#rev2

Sorry, my reproduction script has been cleaned up because some time has
passed. But the root cause of the issue is still setting ops too early,
which leads to vc_resize() calling clear_selection(), then eventually
.putcs. This uses the updated rotation-related functions on the previous
region, which may cause out-of-bounds access.

If this patch series does not ensure that the old putcs is used in the
context of clear_selection() during vc_resize(), the problem may still 
exist?

Thanks,
Zizhi Wo

> 
> Best regards
> Thomas
> 
>>
>> rotate_all_store
>>   fbcon_rotate_all
>>    fbcon_set_all_vcs
>>     fbcon_modechanged
>>     ...
>>      fbcon_set_rotate
>>       fbcon_rotate_ccw
>>        ops->putcs = ccw_putcs // set rotate 3 ops
>>      vc_resize
>>      ...
>>       clear_selection
>>        highlight
>>        ...
>>         do_update_region
>>     fbcon_putcs
>>      ccw_putcs_aligned
>>       src = ops->fontbuffer + (scr_readw(s--) & charmask)*cellsize
>>       fb_pad_aligned_buffer----[src KASAN!!!]
>>         update_screen
>>          redraw_screen
>>      fbcon_switch
>>       fbcon_rotate_font
>>        dst = kmalloc_array(len, d_cellsize, GFP_KERNEL)
>>        ops->fontbuffer = dst
>>
>> [FIX]
>> Considering that when the rotation changes, clear_selection() should 
>> clear
>> the previously selected region and not consider the new rotation yet.
>> Therefore, the assignment to fbcon_ops for the newly set rotate can be
>> postponed to fbcon_rotate_font(), since the fontbuffer is regenerated
>> there. To avoid affecting other code paths, fbcon_set_rotate() will
>> temporarily continue assigning fbcon_ops based on cur_rotate not rotate.
>>
>> Signed-off-by: Zizhi Wo <wozizhi@huaweicloud.com>
>> ---
>>   drivers/video/fbdev/core/fbcon_rotate.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/video/fbdev/core/fbcon_rotate.c 
>> b/drivers/video/fbdev/core/fbcon_rotate.c
>> index ec3c883400f7..d76446da24d4 100644
>> --- a/drivers/video/fbdev/core/fbcon_rotate.c
>> +++ b/drivers/video/fbdev/core/fbcon_rotate.c
>> @@ -70,6 +70,7 @@ static int fbcon_rotate_font(struct fb_info *info, 
>> struct vc_data *vc)
>>               src += s_cellsize;
>>               dst += d_cellsize;
>>           }
>> +        fbcon_rotate_ud(ops);
>>           break;
>>       case FB_ROTATE_CW:
>>           for (i = len; i--; ) {
>> @@ -78,6 +79,7 @@ static int fbcon_rotate_font(struct fb_info *info, 
>> struct vc_data *vc)
>>               src += s_cellsize;
>>               dst += d_cellsize;
>>           }
>> +        fbcon_rotate_cw(ops);
>>           break;
>>       case FB_ROTATE_CCW:
>>           for (i = len; i--; ) {
>> @@ -86,6 +88,7 @@ static int fbcon_rotate_font(struct fb_info *info, 
>> struct vc_data *vc)
>>               src += s_cellsize;
>>               dst += d_cellsize;
>>           }
>> +        fbcon_rotate_ccw(ops);
>>           break;
>>       }
>> @@ -97,7 +100,7 @@ void fbcon_set_rotate(struct fbcon_ops *ops)
>>   {
>>       ops->rotate_font = fbcon_rotate_font;
>> -    switch(ops->rotate) {
>> +    switch (ops->cur_rotate) {
>>       case FB_ROTATE_CW:
>>           fbcon_rotate_cw(ops);
>>           break;
> 

