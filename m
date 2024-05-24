Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4868CE62C
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 15:26:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEB2910E1B4;
	Fri, 24 May 2024 13:26:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E31BE10E1B4
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 13:26:44 +0000 (UTC)
Received: from fsav313.sakura.ne.jp (fsav313.sakura.ne.jp [153.120.85.144])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 44ODQKlS037943;
 Fri, 24 May 2024 22:26:20 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav313.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav313.sakura.ne.jp);
 Fri, 24 May 2024 22:26:20 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav313.sakura.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 44ODQJtV037935
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 24 May 2024 22:26:19 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <0204a827-ca88-4cb6-839b-f4a637bcbf71@I-love.SAKURA.ne.jp>
Date: Fri, 24 May 2024 22:26:20 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linaro-mm-sig] [PATCH] dma-buf/sw-sync: don't enable IRQ from
 sync_print_obj()
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 syzbot <syzbot+a225ee3df7e7f9372dbe@syzkaller.appspotmail.com>,
 syzkaller-bugs@googlegroups.com, Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 Christian Konig <christian.koenig@amd.com>, Sean Paul
 <seanpaul@chromium.org>, Chris Wilson <chris@chris-wilson.co.uk>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org
References: <0000000000000946190610bf7bd5@google.com>
 <c2e46020-aaa6-4e06-bf73-f05823f913f0@I-love.SAKURA.ne.jp>
 <8980975d-87db-4d57-9e23-4fb7fbb62e7d@gmail.com>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <8980975d-87db-4d57-9e23-4fb7fbb62e7d@gmail.com>
Content-Type: text/plain; charset=UTF-8
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

On 2024/05/07 22:09, Christian König wrote:
> Am 05.05.24 um 16:08 schrieb Tetsuo Handa:
>> Since commit a6aa8fca4d79 ("dma-buf/sw-sync: Reduce irqsave/irqrestore from
>> known context") by error replaced spin_unlock_irqrestore() with
>> spin_unlock_irq() for both sync_debugfs_show() and sync_print_obj() despite
>> sync_print_obj() is called from sync_debugfs_show(), lockdep complains
>> inconsistent lock state warning.
>>
>> Use plain spin_{lock,unlock}() for sync_print_obj(), for
>> sync_debugfs_show() is already using spin_{lock,unlock}_irq().
>>
>> Reported-by: syzbot <syzbot+a225ee3df7e7f9372dbe@syzkaller.appspotmail.com>
>> Closes: https://syzkaller.appspot.com/bug?extid=a225ee3df7e7f9372dbe
>> Fixes: a6aa8fca4d79 ("dma-buf/sw-sync: Reduce irqsave/irqrestore from known context")
>> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> 
> Reviewed-by: Christian König <christian.koenig@amd.com>

Thank you. Who can take this patch?

> 
>> ---
>>   drivers/dma-buf/sync_debug.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/dma-buf/sync_debug.c b/drivers/dma-buf/sync_debug.c
>> index 101394f16930..237bce21d1e7 100644
>> --- a/drivers/dma-buf/sync_debug.c
>> +++ b/drivers/dma-buf/sync_debug.c
>> @@ -110,12 +110,12 @@ static void sync_print_obj(struct seq_file *s, struct sync_timeline *obj)
>>         seq_printf(s, "%s: %d\n", obj->name, obj->value);
>>   -    spin_lock_irq(&obj->lock);
>> +    spin_lock(&obj->lock); /* Caller already disabled IRQ. */
>>       list_for_each(pos, &obj->pt_list) {
>>           struct sync_pt *pt = container_of(pos, struct sync_pt, link);
>>           sync_print_fence(s, &pt->base, false);
>>       }
>> -    spin_unlock_irq(&obj->lock);
>> +    spin_unlock(&obj->lock);
>>   }
>>     static void sync_print_sync_file(struct seq_file *s,
> 

