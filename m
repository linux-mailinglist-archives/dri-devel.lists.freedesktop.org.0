Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCBE234028
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 09:37:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3B6A6EA06;
	Fri, 31 Jul 2020 07:37:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B05B6E8DF
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 13:24:14 +0000 (UTC)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id A8389BDF52B708896333;
 Thu, 30 Jul 2020 21:24:09 +0800 (CST)
Received: from [127.0.0.1] (10.174.176.211) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0;
 Thu, 30 Jul 2020 21:24:04 +0800
Subject: Re: [PATCH] vgacon: Fix an out-of-bounds in vgacon_scrollback_update()
To: Jiri Slaby <jirislaby@kernel.org>, <b.zolnierkie@samsung.com>
References: <20200713105730.550334-1-yangyingliang@huawei.com>
 <220220f1-48f7-46f6-952f-ab41fa57d6a1@kernel.org>
From: Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <c3714d73-d5fe-c77a-e554-bb1ff4fd6980@huawei.com>
Date: Thu, 30 Jul 2020 21:24:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <220220f1-48f7-46f6-952f-ab41fa57d6a1@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.174.176.211]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 31 Jul 2020 07:36:08 +0000
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?B?5byg5LqR5rW3?= <zhangyunhai@nsfocus.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2020/7/30 19:04, Jiri Slaby wrote:
> On 13. 07. 20, 12:57, Yang Yingliang wrote:
>> I got a slab-out-of-bounds report when I doing fuzz test.
>>
>> [  334.989515] ==================================================================
>> [  334.989577] BUG: KASAN: slab-out-of-bounds in vgacon_scroll+0x57a/0x8ed
>> [  334.989588] Write of size 1766 at addr ffff8883de69ff3e by task test/2658
>> [  334.989593]
>> [  334.989608] CPU: 3 PID: 2658 Comm: test Not tainted 5.7.0-rc5-00005-g152036d1379f #789
>> [  334.989617] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.12.1-0-ga5cab58e9a3f-prebuilt.qemu.org 04/01/2014
>> [  334.989624] Call Trace:
>> [  334.989646]  dump_stack+0xe4/0x14e
>> [  334.989676]  print_address_description.constprop.5+0x3f/0x60
>> [  334.989699]  ? vgacon_scroll+0x57a/0x8ed
>> [  334.989710]  __kasan_report.cold.8+0x92/0xaf
>> [  334.989735]  ? vgacon_scroll+0x57a/0x8ed
>> [  334.989761]  kasan_report+0x37/0x50
>> [  334.989789]  check_memory_region+0x1c1/0x1e0
>> [  334.989806]  memcpy+0x38/0x60
>> [  334.989824]  vgacon_scroll+0x57a/0x8ed
>> [  334.989876]  con_scroll+0x4ef/0x5e0
> ...
>> Because vgacon_scrollback_cur->tail plus memcpy size is greater than
>> vgacon_scrollback_cur->size. Fix this by checking the memcpy size.
>>
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
>> ---
>>   drivers/video/console/vgacon.c | 11 ++++++++---
>>   1 file changed, 8 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/video/console/vgacon.c b/drivers/video/console/vgacon.c
>> index 998b0de1812f..b51ffb9a208d 100644
>> --- a/drivers/video/console/vgacon.c
>> +++ b/drivers/video/console/vgacon.c
>> @@ -243,6 +243,7 @@ static void vgacon_scrollback_startup(void)
>>   static void vgacon_scrollback_update(struct vc_data *c, int t, int count)
>>   {
>>   	void *p;
>> +	int size;
>>   
>>   	if (!vgacon_scrollback_cur->data || !vgacon_scrollback_cur->size ||
>>   	    c->vc_num != fg_console)
>> @@ -251,13 +252,17 @@ static void vgacon_scrollback_update(struct vc_data *c, int t, int count)
>>   	p = (void *) (c->vc_origin + t * c->vc_size_row);
>>   
>>   	while (count--) {
>> +		size = vgacon_scrollback_cur->size - vgacon_scrollback_cur->tail;
>> +		if (size > c->vc_size_row)
>> +			size = c->vc_size_row;
>> +
>>   		scr_memcpyw(vgacon_scrollback_cur->data +
>>   			    vgacon_scrollback_cur->tail,
>> -			    p, c->vc_size_row);
>> +			    p, size);
> Are you sure the consumer can handle split lines? As vgacon_scrolldelta
> (soff in particular) looks to me like it doesn't.
>
> Have you tested you patch? I mean with soft scrollback on the vga console?

I only test the patch with the reproduce program.


Thanks,

Yang

>
>>   		vgacon_scrollback_cur->cnt++;
>> -		p += c->vc_size_row;
>> -		vgacon_scrollback_cur->tail += c->vc_size_row;
>> +		p += size;
>> +		vgacon_scrollback_cur->tail += size;
>>   
>>   		if (vgacon_scrollback_cur->tail >= vgacon_scrollback_cur->size)
>>   			vgacon_scrollback_cur->tail = 0;
>>
> thanks,

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
