Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EB42205AF
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jul 2020 09:00:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D6296E44B;
	Wed, 15 Jul 2020 07:00:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D19946E149
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 13:37:33 +0000 (UTC)
Received: from fsav301.sakura.ne.jp (fsav301.sakura.ne.jp [153.120.85.132])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 06EDbQxS094750;
 Tue, 14 Jul 2020 22:37:26 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav301.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav301.sakura.ne.jp);
 Tue, 14 Jul 2020 22:37:26 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav301.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 06EDbQm9094743
 (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
 Tue, 14 Jul 2020 22:37:26 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [PATCH] fbdev: Detect integer underflow at "struct
 fbcon_ops"->clear_margins.
From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
References: <189fc902-db7c-9886-cc31-c0348435303a@i-love.sakura.ne.jp>
 <20200712111013.11881-1-penguin-kernel@I-love.SAKURA.ne.jp>
 <20200712111013.11881-2-penguin-kernel@I-love.SAKURA.ne.jp>
 <CGME20200714072231eucas1p17c53f0a661346ebfd316ebd5796ca346@eucas1p1.samsung.com>
 <db4b3346-b9f8-a428-1445-1fcbd8521e1d@samsung.com>
 <e00078d1-e5fb-a019-3036-cb182ed2e40b@i-love.sakura.ne.jp>
Message-ID: <adff5d10-fe35-62d4-74c5-182958c5ada7@i-love.sakura.ne.jp>
Date: Tue, 14 Jul 2020 22:37:27 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e00078d1-e5fb-a019-3036-cb182ed2e40b@i-love.sakura.ne.jp>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 15 Jul 2020 06:59:56 +0000
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, George Kennedy <george.kennedy@oracle.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, Jiri Slaby <jslaby@suse.com>,
 Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020/07/14 19:27, Tetsuo Handa wrote:
> On 2020/07/14 16:22, Bartlomiej Zolnierkiewicz wrote:
>> How does this patch relate to:
>>
>> 	https://marc.info/?l=linux-fbdev&m=159415024816722&w=2
>>
>> ?
>>
>> It seems to address the same issue, I've added George and Dan to Cc:.
> 
> George Kennedy's patch does not help for my case.
> 

OK. You can add

Reported-and-tested-by: syzbot <syzbot+e5fd3e65515b48c02a30@syzkaller.appspotmail.com>

to my patch.

By the way, if

  /* bitfill_aligned() assumes that it's at least 8x8 */

is true, don't we need to also check that the rect to fill is at least
8x8 in bit_clear_margins() ? (Well, I feel did it mean multiple of 8x8 ?
Then, what is bitfill_unaligned() for ?)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
