Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EF514CC29
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2020 15:15:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C98389BA9;
	Wed, 29 Jan 2020 14:15:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F42989B0C
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 14:15:21 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id y73so201135pfg.2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 06:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=VVbzzG0X6Ket27YVQDpoYGdZSbXo+DC3nnTq4FkdtZo=;
 b=I4CeqxN5dAk6/08hdqcE8P00etE7Vb7WQs5alGHfNFiZR+lO4mhNk9l4beVqAHxxY0
 QlPEozoMIglOjkvFQYrkLl41bOBtHYiaHhoWkbj0Txuih6mO2A3ZWZlU+CGULQb6gPEp
 xgpVQsx3GfLSzF10BIMdrenNh4l0u/qfQEunZnSrb51R6MyKyKTMBFv3T/Y2I1uO2ONP
 v239qoxswlBoLHjdbnP5Q/F1aQbnkm4n8D5hIHdZ+w1+kT9Ys5HTEk7EMfPIQPPcypNO
 wdPJnv+mbI2W903tNUQyzhREuwBlncxwMYNmBW536c7JUyXs+sr4dtOv+SsTsjQ3EGtq
 kKkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VVbzzG0X6Ket27YVQDpoYGdZSbXo+DC3nnTq4FkdtZo=;
 b=rFymJth7dnggaygS2j3hyWo6c0VVpM5iz33FYaCaUKEmBgrJwV4vqlZd8wjble481D
 Gogo8QNw+sK2Tqebe5bYqdjK/NCGmdhQbbJrzj5bngVWXt6k4TgtF8O0kw6ddOr9xXvV
 ZXzCGt9KFCNThJmGY986lvjVwqvIOAzh515Ghjkamf5uopgS9WrP+zpl0J8uDYD+dRp6
 EDK1mCYjKizAB/VCcntIzWeuU4+yQDaO5FYfVUlWD2en3WCCdSKoKG4ulsf62CrKGF9s
 MA4hG7k0Y/OFAWu8VKFIrezQizrVdYPgIUTqxQBtykAyKOT/JsQfgg6cDazfnUKLk55S
 6hIg==
X-Gm-Message-State: APjAAAXPkeNQ5i0Hza6MnewtFmyNDbftbzIpSeScF1THgsSAKSRhWZMi
 EEEuOlAZtrEu+sX4WgOYrxU=
X-Google-Smtp-Source: APXvYqyTDXo/6RaGs+c+wYhxBhyJhEJcaTTgG9q+fTKW8Tk7Agy5LbFJ2OqN5YCuxHUvJMBopVMWIA==
X-Received: by 2002:a63:6c09:: with SMTP id h9mr29888623pgc.34.1580307320595; 
 Wed, 29 Jan 2020 06:15:20 -0800 (PST)
Received: from localhost (167.117.30.125.dy.iij4u.or.jp. [125.30.117.167])
 by smtp.gmail.com with ESMTPSA id g7sm3057573pfq.33.2020.01.29.06.15.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2020 06:15:19 -0800 (PST)
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
X-Google-Original-From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Date: Wed, 29 Jan 2020 23:15:17 +0900
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: KASAN: slab-out-of-bounds Write in vgacon_scroll
Message-ID: <20200129141517.GA13721@jagdpanzerIV.localdomain>
References: <CAA=061EoW8AmjUrBLsJy5nTDz-1jeArLeB+z6HJuyZud0zZXug@mail.gmail.com>
 <CGME20200128124918eucas1p1f0ce2b2b7b33a5d63d33f876ef30f454@eucas1p1.samsung.com>
 <20200128124912.chttagasucdpydhk@pathway.suse.cz>
 <4ab69855-6112-52f4-bee2-3358664d0c20@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4ab69855-6112-52f4-bee2-3358664d0c20@samsung.com>
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
Cc: Petr Mladek <pmladek@suse.com>, wangkefeng.wang@huawei.com,
 linux-kernel@vger.kernel.org, anon anon <742991625abc@gmail.com>,
 sergey.senozhatsky@gmail.com, syzkaller@googlegroups.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On (20/01/28 15:58), Bartlomiej Zolnierkiewicz wrote:
[..]
> 
> Help is welcomed as I'm not going to look at it in the foreseeable future
> (I'm busy enough with other things).
> 
> > (dri-devel@lists.freedesktop.org or linux-fbdev@vger.kernel.org) into CC?
> 
> Added to Cc:, thanks.

Hmm. There is something strange about it. I use vga console quite
often, and scrolling happens all the time, yet I can't get the same
out-of-bounds report (nor have I ever seen it in the past), even with
the reproducer. Is it supposed to be executed as it is, or are there
any preconditions? Any chance that something that runs prior to that
reproducer somehow impacts the system? Just asking.

	-ss
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
