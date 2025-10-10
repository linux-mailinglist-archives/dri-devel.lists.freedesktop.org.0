Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0E2BCC978
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 12:47:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7E2B10EBC2;
	Fri, 10 Oct 2025 10:47:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=huawei.com header.i=@huawei.com header.b="6V+p8MWS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 976 seconds by postgrey-1.36 at gabe;
 Fri, 10 Oct 2025 08:27:16 UTC
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83F7710EB7A
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 08:27:16 +0000 (UTC)
Received: from canpmsgout08.his.huawei.com (unknown [172.19.92.156])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4cjfT008FHzJsbN
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 16:06:12 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
 c=relaxed/relaxed; q=dns/txt; h=From;
 bh=MYXlAWEvSyN7eZhivp5e3os3yNQ8UaiQtka1Xgi30qU=;
 b=6V+p8MWS6G41pqdbKpjJ8z91bFa2d0+266K9faWvViycKBGR3p6qo40F1TiA9vI0RS0UX+nSX
 VGD00p4ZPb+lhAmybM1UNm9rotvBjMdtW2VqHtWmb2QPrxxzgKsWA2H1XNkNyCKKJNc67TpCPZL
 Pdj84E7a3ib3k3TlfFdG2E4=
Received: from mail.maildlp.com (unknown [172.19.88.163])
 by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4cjfZ500w5zmV6g;
 Fri, 10 Oct 2025 16:10:36 +0800 (CST)
Received: from dggpemf200018.china.huawei.com (unknown [7.185.36.31])
 by mail.maildlp.com (Postfix) with ESMTPS id 2D4531800CE;
 Fri, 10 Oct 2025 16:10:54 +0800 (CST)
Received: from [10.174.177.149] (10.174.177.149) by
 dggpemf200018.china.huawei.com (7.185.36.31) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 10 Oct 2025 16:10:53 +0800
Message-ID: <089646c2-0f11-4ad9-833b-c540383bec02@huawei.com>
Date: Fri, 10 Oct 2025 16:10:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbcon: Set fb_display[i]->mode to NULL when the mode is
 released
To: Thomas Zimmermann <tzimmermann@suse.de>, <simona@ffwll.ch>
CC: <deller@gmx.de>, <linux-kernel@vger.kernel.org>,
 <linux-fbdev@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <wangkefeng.wang@huawei.com>, <zuoze1@huawei.com>, <sunnanyong@huawei.com>
References: <20250923110608.3385083-1-yanquanmin1@huawei.com>
 <234d94ac-3984-4ff9-9743-9178f68370de@suse.de>
From: Quanmin Yan <yanquanmin1@huawei.com>
In-Reply-To: <234d94ac-3984-4ff9-9743-9178f68370de@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.149]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf200018.china.huawei.com (7.185.36.31)
X-Mailman-Approved-At: Fri, 10 Oct 2025 10:47:09 +0000
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

Hi Thomas,

在 2025/9/24 17:17, Thomas Zimmermann 写道:
> Hi,
>
> thanks for the report.
>
> Am 23.09.25 um 13:06 schrieb Quanmin Yan:
>> Recently, we discovered the following issue through syzkaller:
>>
>> BUG: KASAN: slab-use-after-free in fb_mode_is_equal+0x285/0x2f0
>> Read of size 4 at addr ff11000001b3c69c by task syz.xxx
>> ...
>> Call Trace:
>>   <TASK>
>>   dump_stack_lvl+0xab/0xe0
>>   print_address_description.constprop.0+0x2c/0x390
>>   print_report+0xb9/0x280
>>   kasan_report+0xb8/0xf0
>>   fb_mode_is_equal+0x285/0x2f0
>>   fbcon_mode_deleted+0x129/0x180
>>   fb_set_var+0xe7f/0x11d0
>>   do_fb_ioctl+0x6a0/0x750
>>   fb_ioctl+0xe0/0x140
>>   __x64_sys_ioctl+0x193/0x210
>>   do_syscall_64+0x5f/0x9c0
>>   entry_SYSCALL_64_after_hwframe+0x76/0x7e
>>
>> The issue occurs in the function fb_mode_is_equal(p->mode, mode), I also
>> noticed that when freeing the memory related to fb_info->modelist, 
>> there's
>> no attempt to set the corresponding fb_display[i]->mode to NULL after
>> freeing. Based on analysis, the root cause of this bug appears to be 
>> that
>> a certain p->mode has become a wild pointer.
>>
>> I've identified two code paths for freeing modelist->mode:
>> 1. fb_delete_videomode - removes videomode entry from modelist.
>> 2. fb_destroy_modelist - destroys the entire modelist.
>
> What about fb_new_modelist()? [1] It's called from store_modes() and 
> the whole logic in the caller seems fragile to me. This could leave 
> p->mode set when it should be cleared; and vice versa.
>
> [1] 
> https://elixir.bootlin.com/linux/v6.16.8/source/drivers/video/fbdev/core/fbmem.c#L712
> [2] 
> https://elixir.bootlin.com/linux/v6.16.8/source/drivers/video/fbdev/core/fbsysfs.c#L113 
>
>
After testing, this path does not exhibit the issue because in 
fbcon_new_modelist [1], the
modes in fb_display[] get refreshed and won't leave wild pointers. Even 
if fb_new_modelist()
fails, the original modelist will be restored [2].

[1] 
https://elixir.bootlin.com/linux/v6.16.8/source/drivers/video/fbdev/core/fbmem.c#L736
[2] 
https://elixir.bootlin.com/linux/v6.16.8/source/drivers/video/fbdev/core/fbsysfs.c#L115 

>>
>> Analysis shows that fb_delete_videomode path should have been fixed in
>> a previous patch[1]. Therefore, the current bug is likely triggered
>> through the fb_destroy_modelist path. I've found a reproducible test 
>> case:
>> 1. With /dev/fb0 already registered in the system, load a kernel module
>>     to register a new device /dev/fb1;
>> 2. Set fb1's mode to the global fb_display[] array (via 
>> FBIOPUT_CON2FBMAP);
>> 3. Switch console from fb to VGA (to allow normal rmmod of the ko);
>> 4. Unload the kernel module - at this point fb1's modelist is freed, 
>> leaving
>>     a wild pointer in fb_display[];
>> 5. Trigger the bug via system calls through fb0 attempting to delete 
>> a mode
>>     from fb0.
>>
>> To prevent similar issues from recurring, consider traversing 
>> fb_display[]
>> whenever releasing a mode from fb_info. If the corresponding mode exists
>> in fb_display[], set its pointer to NULL.
>>
>> [1] 
>> https://lore.kernel.org/all/20210712085544.2828-1-thunder.leizhen@huawei.com/
>>
>> Signed-off-by: Quanmin Yan <yanquanmin1@huawei.com>
>> ---
>> This is my first time working on fb issues. If there are any 
>> misunderstandings
>> in my analysis, I would appreciate corrections from the community.
>>
>>   drivers/video/fbdev/core/fbcon.c  | 11 +++++++++++
>>   drivers/video/fbdev/core/modedb.c |  7 +++++++
>>   include/linux/fbcon.h             |  2 ++
>>   3 files changed, 20 insertions(+)
>>
>> diff --git a/drivers/video/fbdev/core/fbcon.c 
>> b/drivers/video/fbdev/core/fbcon.c
>> index b062b05f4128..bfbf79d6cd05 100644
>> --- a/drivers/video/fbdev/core/fbcon.c
>> +++ b/drivers/video/fbdev/core/fbcon.c
>> @@ -2803,6 +2803,17 @@ int fbcon_mode_deleted(struct fb_info *info,
>>       return found;
>>   }
>>   +void fb_display_clean_videomode(struct fb_videomode *m)
>
> Rather fbcon_delete_mode
>
>> +{
>> +    struct fbcon_display *p;
>> +
>> +    for (int i = first_fb_vc; i <= last_fb_vc; i++) {
>
> I think this code also needs to test the fb_info, or it might clear 
> another display's mode. See [3] for an example
>
> [3] 
> https://elixir.bootlin.com/linux/v6.16.8/source/drivers/video/fbdev/core/fbcon.c#L2786
>
>> +        p = &fb_display[i];
>> +        if (p->mode == m)
>> +            p->mode = NULL;
>> +    }
>> +}
>> +
>>   #ifdef CONFIG_VT_HW_CONSOLE_BINDING
>>   static void fbcon_unbind(void)
>>   {
>> diff --git a/drivers/video/fbdev/core/modedb.c 
>> b/drivers/video/fbdev/core/modedb.c
>> index 53a610948c4a..5a0ee96ebefa 100644
>> --- a/drivers/video/fbdev/core/modedb.c
>> +++ b/drivers/video/fbdev/core/modedb.c
>> @@ -16,6 +16,7 @@
>>   #include <linux/slab.h>
>>   #include <linux/fb.h>
>>   #include <linux/kernel.h>
>> +#include <linux/fbcon.h>
>>     #undef DEBUG
>>   @@ -1100,6 +1101,7 @@ void fb_delete_videomode(const struct 
>> fb_videomode *mode,
>>           modelist = list_entry(pos, struct fb_modelist, list);
>>           m = &modelist->mode;
>>           if (fb_mode_is_equal(m, mode)) {
>> +            fb_display_clean_videomode(m);
>
> There's only one caller of fb_delete_videomode(). I think this call 
> should be right before fb_delete_videomode().
This path has already been fixed [3], so this modification is no longer 
necessary and will be
removed in the next version of the patch.

[3] 
https://lore.kernel.org/all/20210712085544.2828-1-thunder.leizhen@huawei.com/

Additionally, in the next version of the patch, I have incorporated your 
other suggestions
and made corresponding adjustments. I will send the updated patch set 
shortly.

Best regards,
Quanmin Yan
>
>>               list_del(pos);
>>               kfree(pos);
>>           }
>> @@ -1113,8 +1115,13 @@ void fb_delete_videomode(const struct 
>> fb_videomode *mode,
>>   void fb_destroy_modelist(struct list_head *head)
>>   {
>>       struct list_head *pos, *n;
>> +    struct fb_modelist *modelist;
>> +    struct fb_videomode *m;
>>         list_for_each_safe(pos, n, head) {
>> +        modelist = list_entry(pos, struct fb_modelist, list);
>> +        m = &modelist->mode;
>> +        fb_display_clean_videomode(m);
>
> Same here: I think fb_destroy_modelist() should only release the mode. 
> Clearing the fbcon mode should be done by the caller.
>
> Best regards
> Thomas
>
>>           list_del(pos);
>>           kfree(pos);
>>       }
>> diff --git a/include/linux/fbcon.h b/include/linux/fbcon.h
>> index 81f0e698acbf..2b5e93aeaaff 100644
>> --- a/include/linux/fbcon.h
>> +++ b/include/linux/fbcon.h
>> @@ -18,6 +18,7 @@ void fbcon_suspended(struct fb_info *info);
>>   void fbcon_resumed(struct fb_info *info);
>>   int fbcon_mode_deleted(struct fb_info *info,
>>                  struct fb_videomode *mode);
>> +void fb_display_clean_videomode(struct fb_videomode *m);
>>   void fbcon_new_modelist(struct fb_info *info);
>>   void fbcon_get_requirement(struct fb_info *info,
>>                  struct fb_blit_caps *caps);
>> @@ -38,6 +39,7 @@ static inline void fbcon_suspended(struct fb_info 
>> *info) {}
>>   static inline void fbcon_resumed(struct fb_info *info) {}
>>   static inline int fbcon_mode_deleted(struct fb_info *info,
>>                        struct fb_videomode *mode) { return 0; }
>> +static inline void fb_display_clean_videomode(struct fb_videomode 
>> *m) {}
>>   static inline void fbcon_new_modelist(struct fb_info *info) {}
>>   static inline void fbcon_get_requirement(struct fb_info *info,
>>                        struct fb_blit_caps *caps) {}
>
