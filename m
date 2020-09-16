Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC7326C489
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 17:49:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B25BC6EA50;
	Wed, 16 Sep 2020 15:49:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84CBA6E04E
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 10:06:48 +0000 (UTC)
Received: from fsav106.sakura.ne.jp (fsav106.sakura.ne.jp [27.133.134.233])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 08GA6XLm039361;
 Wed, 16 Sep 2020 19:06:33 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav106.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav106.sakura.ne.jp);
 Wed, 16 Sep 2020 19:06:33 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav106.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 08GA6WMi039358
 (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
 Wed, 16 Sep 2020 19:06:33 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [PATCH] fbcon: Fix user font detection test at fbcon_resize().
To: Greg KH <gregkh@linuxfoundation.org>
References: <00000000000024be1505ad487cbb@google.com>
 <f6e3e611-8704-1263-d163-f52c906a4f06@I-love.SAKURA.ne.jp>
 <7c52e8cd-e4cb-cd0b-40d5-b9654aec09f3@I-love.SAKURA.ne.jp>
 <20200916082624.GC509119@kroah.com>
From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <3233dcc2-31d5-42e7-3d9d-b36a65b660ea@i-love.sakura.ne.jp>
Date: Wed, 16 Sep 2020 19:06:31 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200916082624.GC509119@kroah.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 16 Sep 2020 15:49:22 +0000
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
 syzbot <syzbot+b38b1ef6edf0c74a8d97@syzkaller.appspotmail.com>,
 b.zolnierkie@samsung.com, daniel.vetter@ffwll.ch,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, george.kennedy@oracle.com,
 natechancellor@gmail.com, jirislaby@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020/09/16 17:26, Greg KH wrote:
> On Wed, Sep 16, 2020 at 09:01:06AM +0900, Tetsuo Handa wrote:
>> Greg, will you pick up this patch?
>>
>> It seems that finding the real cause of [3] and actually fixing [3] will be difficult.
>> Since I can't reproduce [3] locally, I will have to try flood of "#syz test" requests
>> for debug printk() patches.
> 
> I agree with Daniel here, can you retest these against Linus's latest
> tree please?
> 

syzbot already reproduced these bugs using the latest commit. ;-)

You can find

  ci-upstream-kasan-gce-root 	2020/09/15 15:18 	upstream 	fc4f28bb 

record for "KASAN: global-out-of-bounds Read in bit_putcs" and

  ci-upstream-kasan-gce-root 	2020/09/16 09:54 	upstream 	fc4f28bb

record for "KASAN: global-out-of-bounds Read in fbcon_resize".
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
