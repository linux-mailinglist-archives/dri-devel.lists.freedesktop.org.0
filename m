Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF3E26C2C6
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 14:34:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2DF76E15E;
	Wed, 16 Sep 2020 12:34:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DE996E15E
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 12:34:46 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 709BC2224A;
 Wed, 16 Sep 2020 12:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600259686;
 bh=cGNtWAo22LwCSwjqAlF0X3q0KPrk7PCvy8F/Khpgj0U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p6F+Qdc4YH2FUK0R5O8EMOgm3+HLxnk/hnSC1fjpoXhVw3M77lVKwIiGLlwljOgt1
 MDvvlIRv8SrVlCxBOM9hdzO5DsUs+/dfQNPuCkskrBj3GhIsF1L0B1EN8IKzGMuUtK
 EzM4YvOTVhooc6tGVvOx+FC3SNW0l5DKudnkpj1g=
Date: Wed, 16 Sep 2020 14:35:19 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Subject: Re: [PATCH] fbcon: Fix user font detection test at fbcon_resize().
Message-ID: <20200916123519.GB2808885@kroah.com>
References: <00000000000024be1505ad487cbb@google.com>
 <f6e3e611-8704-1263-d163-f52c906a4f06@I-love.SAKURA.ne.jp>
 <7c52e8cd-e4cb-cd0b-40d5-b9654aec09f3@I-love.SAKURA.ne.jp>
 <20200916082624.GC509119@kroah.com>
 <3233dcc2-31d5-42e7-3d9d-b36a65b660ea@i-love.sakura.ne.jp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3233dcc2-31d5-42e7-3d9d-b36a65b660ea@i-love.sakura.ne.jp>
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

On Wed, Sep 16, 2020 at 07:06:31PM +0900, Tetsuo Handa wrote:
> On 2020/09/16 17:26, Greg KH wrote:
> > On Wed, Sep 16, 2020 at 09:01:06AM +0900, Tetsuo Handa wrote:
> >> Greg, will you pick up this patch?
> >>
> >> It seems that finding the real cause of [3] and actually fixing [3] will be difficult.
> >> Since I can't reproduce [3] locally, I will have to try flood of "#syz test" requests
> >> for debug printk() patches.
> > 
> > I agree with Daniel here, can you retest these against Linus's latest
> > tree please?
> > 
> 
> syzbot already reproduced these bugs using the latest commit. ;-)
> 
> You can find
> 
>   ci-upstream-kasan-gce-root 	2020/09/15 15:18 	upstream 	fc4f28bb 
> 
> record for "KASAN: global-out-of-bounds Read in bit_putcs" and
> 
>   ci-upstream-kasan-gce-root 	2020/09/16 09:54 	upstream 	fc4f28bb
> 
> record for "KASAN: global-out-of-bounds Read in fbcon_resize".

Ok, will pick it up now, thanks.

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
