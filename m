Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2586C44C1
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 09:20:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6F0010E389;
	Wed, 22 Mar 2023 08:20:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C845A10E256
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 04:26:32 +0000 (UTC)
Received: from fsav411.sakura.ne.jp (fsav411.sakura.ne.jp [133.242.250.110])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 32M4PHDa005049;
 Wed, 22 Mar 2023 13:25:17 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav411.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav411.sakura.ne.jp);
 Wed, 22 Mar 2023 13:25:17 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav411.sakura.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 32M4PHtS005046
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 22 Mar 2023 13:25:17 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <3912432e-bdf7-323a-03c6-46bb1e288b54@I-love.SAKURA.ne.jp>
Date: Wed, 22 Mar 2023 13:25:18 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [syzbot] [dri?] BUG: sleeping function called from invalid
 context in _vm_unmap_aliases
Content-Language: en-US
To: syzbot <syzbot+a9a2bb6afe9eb31efc56@syzkaller.appspotmail.com>,
 syzkaller-bugs@googlegroups.com, Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <lstoakes@gmail.com>
References: <0000000000006dc0c105f76c0a72@google.com>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <0000000000006dc0c105f76c0a72@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 22 Mar 2023 08:20:06 +0000
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
Cc: Baoquan He <bhe@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Liu Shixin <liushixin2@huawei.com>,
 "Uladzislau Rezki \(Sony\)" <urezki@gmail.com>, Jiri Olsa <jolsa@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit c53e98934f93 ("mm: vmalloc: use rwsem, mutex for vmap_area_lock and vmap_block->lock")
is broken. We can't take mutex (a sleeping lock) inside RCU read section (an atomic context).


@@ -2183,7 +2184,7 @@ static void _vm_unmap_aliases(unsigned long start, unsigned long end, int flush)

                rcu_read_lock();
                list_for_each_entry_rcu(vb, &vbq->free, free_list) {
-                       spin_lock(&vb->lock);
+                       mutex_lock(&vb->lock);
                        if (vb->dirty && vb->dirty != VMAP_BBMAP_BITS) {
                                unsigned long va_start = vb->va->va_start;
                                unsigned long s, e;
@@ -2196,7 +2197,7 @@ static void _vm_unmap_aliases(unsigned long start, unsigned long end, int flush)

                                flush = 1;
                        }
-                       spin_unlock(&vb->lock);
+                       mutex_unlock(&vb->lock);
                }
                rcu_read_unlock();
        }

#syz set subsystems: mm

On 2023/03/22 2:04, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    f3594f0204b7 Add linux-next specific files for 20230321
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=161552eec80000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=f22105589e896af1
> dashboard link: https://syzkaller.appspot.com/bug?extid=a9a2bb6afe9eb31efc56
> compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
> 
> Unfortunately, I don't have any reproducer for this issue yet.
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/0b755145006a/disk-f3594f02.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/fca26e328a81/vmlinux-f3594f02.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/39744d7d289f/bzImage-f3594f02.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+a9a2bb6afe9eb31efc56@syzkaller.appspotmail.com
> 

