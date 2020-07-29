Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE40232C5C
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 09:17:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 395466E875;
	Thu, 30 Jul 2020 07:17:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1154 seconds by postgrey-1.36 at gabe;
 Wed, 29 Jul 2020 08:19:05 UTC
Received: from nsfocus.com (unknown [221.122.62.131])
 by gabe.freedesktop.org (Postfix) with SMTP id CE46F89956
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 08:19:03 +0000 (UTC)
Received: (qmail 8939 invoked from network); 29 Jul 2020 08:17:41 -0000
Received: from unknown (HELO ?192.168.7.10?) (221.122.62.131)
 by nsfocus.com with SMTP; 29 Jul 2020 08:17:41 -0000
Subject: Re: [PATCH] vgacon: fix out of bounds write to the scrollback buffer
To: Jiri Slaby <jirislaby@kernel.org>, b.zolnierkie@samsung.com
References: <c1f267aa-dfb3-91fa-3111-30c1676f1a91@kernel.org>
From: =?UTF-8?B?5byg5LqR5rW3?= <zhangyunhai@nsfocus.com>
Autocrypt: addr=zhangyunhai@nsfocus.com; keydata=
 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
Message-ID: <c5a73038-f441-602b-584b-3d84622b1fb1@nsfocus.com>
Date: Wed, 29 Jul 2020 16:19:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c1f267aa-dfb3-91fa-3111-30c1676f1a91@kernel.org>
X-Mailman-Approved-At: Thu, 30 Jul 2020 07:16:49 +0000
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
Cc: Security Officers <security@kernel.org>, Kyungtae Kim <kt0755@gmail.com>,
 Anthony Liguori <aliguori@amazon.com>, Greg KH <greg@kroah.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-distros@vs.openwall.org,
 Solar Designer <solar@openwall.com>, Yang Yingliang <yangyingliang@huawei.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020/7/29 16:11, Jiri Slaby wrote:
> But the loop checks for the overflow:
>   if (vgacon_scrollback_cur->tail >= vgacon_scrollback_cur->size)
>         vgacon_scrollback_cur->tail = 0;
> 
> So the first 2 iterations would write to the end of the buffer and this
> 3rd one should have zeroed ->tail.

In the 2nd  iteration before the check:
vgacon_scrollback_cur->tail is 65360 which is still less then
vgacon_scrollback_cur->size(65440), so the ->tail won't be zeroed.

Then it gose to the 3rd  iteration, overflow occurs.

Regards,
Yunhai Zhang / NSFOCUS Security Team




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
