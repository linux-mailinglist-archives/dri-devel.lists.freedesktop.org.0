Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E4E1750AE
	for <lists+dri-devel@lfdr.de>; Sun,  1 Mar 2020 23:56:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82CAE6E235;
	Sun,  1 Mar 2020 22:56:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC9006E235
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Mar 2020 22:56:29 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id 15so4594438pfo.9
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Mar 2020 14:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:subject:in-reply-to:references:date:message-id:mime-version;
 bh=se0IyZ7gHAr6eXWZqvCMUC+l5nOCWe5ipTBvljrrVTM=;
 b=ASBynYC7447q00ZpeHqf2PKC8Nx2UdrkTwe0RQoPQwc2FGK20J4XhFfNTks5DS10lO
 vnURyOuqYSmzCj85qCBYJVjYWqM4OixHSHzEFQIb1McW86yT5HgyWTmUt0nPjwDiF6xZ
 NJGPec54E/F+jOz1aK2izc5qHceggkUAEf/kU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=se0IyZ7gHAr6eXWZqvCMUC+l5nOCWe5ipTBvljrrVTM=;
 b=jUJb+Q5qmegzMiKs4At6vrJmRH/M1mlNoUqE6X7zh9nribcXG2O8SBEUiqn9tVkFVH
 OJIYoKOlvS6vUwJjhGY7dbvAcP2IIC2SphGFP1wrPHpGzaSEaVex8JMuI5ltHq61tAAr
 RPuc9J3PrFAKcl+wGqcawhHvo8m6I2wA4OZDTR9vJHPj5PC4pw0T+1YvLqHEa80hwTD2
 NKTx6kHfmVhdzpOII825bQtobDUiPOcHmzKpTgIhXpehk8ERFurkLD0K574lJm4cDdCd
 bSGH3ZnFBsHNRKP1azGPfpUpsXn887H2KxadgYQNb0NJKdZ+2RQ+oVyHMDgw/xjPD4eW
 +qDA==
X-Gm-Message-State: APjAAAXeEn+1rRa4om4RkSJrN2YCOHcdp00OGxtNeg5wlW81S/1IGUZ2
 JPqEzAWN67e/u8qNapACJRMWfQ==
X-Google-Smtp-Source: APXvYqxmGuJMAlljhCbvCHsl4IAdZQSDpFGJgzYvIy9a//apUKwSSQZyYDPoDXfkSqr3LbplqokxrA==
X-Received: by 2002:a62:5bc7:: with SMTP id p190mr14926424pfb.16.1583103389485; 
 Sun, 01 Mar 2020 14:56:29 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-591b-db3f-06cb-776f.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:591b:db3f:6cb:776f])
 by smtp.gmail.com with ESMTPSA id h2sm17797020pgv.40.2020.03.01.14.56.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Mar 2020 14:56:28 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: syzbot <syzbot+be6ccf3081ce8afd1b56@syzkaller.appspotmail.com>,
 arve@android.com, christian@brauner.io, devel@driverdev.osuosl.org,
 dri-devel@lists.freedesktop.org, dvyukov@google.com,
 gregkh@linuxfoundation.org, joel@joelfernandes.org, kasan-dev@googlegroups.com,
 labbott@redhat.com, linaro-mm-sig-owner@lists.linaro.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, maco@android.com,
 sumit.semwal@linaro.org, syzkaller-bugs@googlegroups.com, tkjos@android.com
Subject: Re: BUG: unable to handle kernel paging request in
 ion_heap_clear_pages
In-Reply-To: <0000000000003eeb63059f9e41d2@google.com>
References: <0000000000003eeb63059f9e41d2@google.com>
Date: Mon, 02 Mar 2020 09:56:25 +1100
Message-ID: <87blpfr8fa.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

syzbot <syzbot+be6ccf3081ce8afd1b56@syzkaller.appspotmail.com> writes:

#syz fix: kasan: fix crashes on access to memory mapped by vm_map_ram()

> This bug is marked as fixed by commit:
> kasan: support vmalloc backing of vm_map_ram()
> But I can't find it in any tested tree for more than 90 days.
> Is it a correct commit? Please update it by replying:
> #syz fix: exact-commit-title
> Until then the bug is still considered open and
> new crashes with the same signature are ignored.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
