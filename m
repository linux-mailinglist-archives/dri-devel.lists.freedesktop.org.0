Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C300317BD53
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 13:55:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A7596E430;
	Fri,  6 Mar 2020 12:55:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B8416E430
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 12:55:34 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id q19so2091615ljp.9
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2020 04:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=APIC1Fz030U1YDyEpc6HSP/ud3+nGaKD+VywQcEvWPQ=;
 b=b39yXM3P5goM7b2EToMbF9ERcf1VcdLEapV+nwDFobIREKUyxLoakA4POzMJxqJ9wb
 /Hr0bZnlj3uFCizZsEsAlgRWx989gUSvYwLKw9/fRqeagQUXP+AZ3YaXqAq4PCh1SOXF
 aVJDPnNC7110sRh1e6E8p44l9iZN2LbDuSTMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=APIC1Fz030U1YDyEpc6HSP/ud3+nGaKD+VywQcEvWPQ=;
 b=m7TAWzM8G4kq3oU24J/XYjFLfQ00Rq86lpOu/nWwckkA8IGItSFjFDL4FkopcUt38M
 NIpaGNlcexDyCM04MO4Xk/qa6KN8+/XB0t6cpOrvTIvGuPM9LUWmL9ThYanjz6NmZ1GD
 0J/WZYicWujrBEYSTvqG053kKpZ+FeoH3gXlLYZzxqSQnQljXNxgk1RCzGHgCehuZe0a
 n+D/4P79W8tcJSrMu7akNiJN+Fnrr+S9O7Oz6ygch4mAzS9Y9XzCZg5UFJWxH3c6m7sA
 P7fY9GMvtDOfRM7xyAH2VXkPSFtXGVNiQaZR6/mcoZsHkKINWqnu1te30WrtL96QPi1C
 EjZw==
X-Gm-Message-State: ANhLgQ2AWuu47aspOyfRRy5fSYTx1QPoQmfEck5lk9DJBUDe69jNG4ne
 6QBEbPsp1a4NALbb0jVOcPpourIh5gBXfw==
X-Google-Smtp-Source: ADFU+vsrOrZLKqclcf5BKe5ueqGZU/M4TUrKywTmQqWtpxY6VtrJsMKshsaPc+moczcjOB0DLbIBgQ==
X-Received: by 2002:a2e:7213:: with SMTP id n19mr1881606ljc.148.1583499332288; 
 Fri, 06 Mar 2020 04:55:32 -0800 (PST)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com.
 [209.85.208.179])
 by smtp.gmail.com with ESMTPSA id m9sm7405964ljb.23.2020.03.06.04.55.22
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Mar 2020 04:55:25 -0800 (PST)
Received: by mail-lj1-f179.google.com with SMTP id a12so2114254ljj.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2020 04:55:22 -0800 (PST)
X-Received: by 2002:a2e:6819:: with SMTP id c25mr2018904lja.16.1583499321417; 
 Fri, 06 Mar 2020 04:55:21 -0800 (PST)
MIME-Version: 1.0
References: <20200304022429.37738-1-zhangxiaoxu5@huawei.com>
 <20200306103846.GS2363188@phenom.ffwll.local>
In-Reply-To: <20200306103846.GS2363188@phenom.ffwll.local>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 6 Mar 2020 06:55:05 -0600
X-Gmail-Original-Message-ID: <CAHk-=wgA7wCXf2s+ihRopi7dzfzc7hWQ0jGiQiV8vMW-XVdD-A@mail.gmail.com>
Message-ID: <CAHk-=wgA7wCXf2s+ihRopi7dzfzc7hWQ0jGiQiV8vMW-XVdD-A@mail.gmail.com>
Subject: Re: [v4] vgacon: Fix a UAF in vgacon_invert_region
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Andrew Morton <akpm@osdl.org>, Petr Mladek <pmladek@suse.com>,
 wangkefeng.wang@huawei.com,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Zhang Xiaoxu <zhangxiaoxu5@huawei.com>, linux-fbdev@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 6, 2020 at 4:38 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> Linus, since this missed the -fixes pull from Dave maybe double check I'm
> not grossly wrong here and apply directly?

Hmm. I don't have the original email, mind just sending it to me (with
the proper added sign-off chain)?

It does strike me that there's nothing that seems to check for
overflow in the "(width << 1) * height" calculation. Hmm?

            Linus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
