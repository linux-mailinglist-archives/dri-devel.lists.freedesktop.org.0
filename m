Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 018B114D7B3
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2020 09:33:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 741E46F914;
	Thu, 30 Jan 2020 08:32:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 6728 seconds by postgrey-1.36 at gabe;
 Wed, 29 Jan 2020 19:27:29 UTC
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F5206F647
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 19:27:29 +0000 (UTC)
Received: from fsav109.sakura.ne.jp (fsav109.sakura.ne.jp [27.133.134.236])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 00THZ88v007101;
 Thu, 30 Jan 2020 02:35:08 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav109.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav109.sakura.ne.jp);
 Thu, 30 Jan 2020 02:35:08 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav109.sakura.ne.jp)
Received: from [192.168.1.9] (softbank126040062084.bbtec.net [126.40.62.84])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 00THZ1EC007062
 (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
 Thu, 30 Jan 2020 02:35:08 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: KASAN: slab-out-of-bounds Write in vgacon_scroll
To: Dmitry Vyukov <dvyukov@google.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
References: <CAA=061EoW8AmjUrBLsJy5nTDz-1jeArLeB+z6HJuyZud0zZXug@mail.gmail.com>
 <CGME20200128124918eucas1p1f0ce2b2b7b33a5d63d33f876ef30f454@eucas1p1.samsung.com>
 <20200128124912.chttagasucdpydhk@pathway.suse.cz>
 <4ab69855-6112-52f4-bee2-3358664d0c20@samsung.com>
 <20200129141517.GA13721@jagdpanzerIV.localdomain>
 <20200129141759.GB13721@jagdpanzerIV.localdomain>
 <20200129143754.GA15445@jagdpanzerIV.localdomain>
 <CACT4Y+bavHG8esK3jsv0V40+9+mUOFaSdOD1+prpw6L4Wv816g@mail.gmail.com>
 <CACT4Y+arS5GsyUa0A0s51OAWj7eJohZsCoY-7cuoU0HVsyeZ6Q@mail.gmail.com>
From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <0f852429-c69d-1520-2db5-6f2370799566@i-love.sakura.ne.jp>
Date: Thu, 30 Jan 2020 02:34:57 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <CACT4Y+arS5GsyUa0A0s51OAWj7eJohZsCoY-7cuoU0HVsyeZ6Q@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 30 Jan 2020 08:32:45 +0000
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
Cc: Petr Mladek <pmladek@suse.com>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 LKML <linux-kernel@vger.kernel.org>, anon anon <742991625abc@gmail.com>,
 syzkaller <syzkaller@googlegroups.com>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A fbcon bug found that allocation size was wrong.
  https://groups.google.com/d/msg/syzkaller-bugs/TVGAFDeUKJo/uchTlvbFAQAJ
You can try adding printk() for examining values because you have reproducers.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
