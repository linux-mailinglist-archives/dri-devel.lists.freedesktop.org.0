Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6EF233E82
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 06:56:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D42D6E9C1;
	Fri, 31 Jul 2020 04:56:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6110D6E9C1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 04:56:18 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id df16so5167276edb.9
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 21:56:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4H+oRSmTvEm6CIUgIK4P0aR3vjANz1UROQflSVQivnc=;
 b=j+wI7zTOgiUIhOaDRJiZJCdlHZA1k8m82lSrCAxb83C/pGkTjSETgRRpJ6iRvAZmgS
 ZgPyWIV2PcQtuTPB8ZYY9thT9z/6Xl47Iu/4gDg0j6/hbZIrA7yCNNqA1EpBh4weDo3c
 RbQ5J6+4KG1Z9+WhdkPUqw7IrhqOg+Rd1Jlbw58VUjlc2m+8knbS8JoSLPQDiGoBRBS2
 9NxEmihuhuSQmMaHC58tkme81wlbp2lZhRpB0zSjtO+Xmez9nkJh3eENMa3QLdWw9cG5
 UzYyyCw7k6NkM37uCPeqm7miFGCEwXjGReHHIWVFN5LT04J93dbsvLGa9m1AYbNblhCa
 bMhw==
X-Gm-Message-State: AOAM532EhElGq5+X1OAthKkYmN6Tv53yJ/BjF/dIRzmN8iCnxkvmaRLR
 wtcpF6JOJ8Nqjk38e17XSCw=
X-Google-Smtp-Source: ABdhPJyEGl1t8oZSMXGGJywcFvB6YfHnbZsZ2I+VAQnNpB4AzoQ2ukdWZucjy94em1xriCvhfy3x4A==
X-Received: by 2002:a05:6402:3110:: with SMTP id
 dc16mr2202194edb.218.1596171377036; 
 Thu, 30 Jul 2020 21:56:17 -0700 (PDT)
Received: from ?IPv6:2a0b:e7c0:0:107::49? ([2a0b:e7c0:0:107::49])
 by smtp.gmail.com with ESMTPSA id c7sm8096414ejr.77.2020.07.30.21.56.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2020 21:56:16 -0700 (PDT)
Subject: Re: [PATCH] vgacon: Fix an out-of-bounds in vgacon_scrollback_update()
To: Yang Yingliang <yangyingliang@huawei.com>, b.zolnierkie@samsung.com
References: <20200713105730.550334-1-yangyingliang@huawei.com>
 <220220f1-48f7-46f6-952f-ab41fa57d6a1@kernel.org>
 <c3714d73-d5fe-c77a-e554-bb1ff4fd6980@huawei.com>
 <9aecd7ac-5060-6b8d-61f8-393431eb243f@kernel.org>
 <3df26fed-5ade-df26-6417-380401b9650b@huawei.com>
From: Jiri Slaby <jirislaby@kernel.org>
Message-ID: <42bd14e3-ae2f-0c14-5d42-e3e7aeb11c78@kernel.org>
Date: Fri, 31 Jul 2020 06:56:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3df26fed-5ade-df26-6417-380401b9650b@huawei.com>
Content-Language: en-US
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?B?5byg5LqR5rW3?= <zhangyunhai@nsfocus.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 31. 07. 20, 5:23, Yang Yingliang wrote:
> void execute_one(void)
> {
> 		intptr_t res = 0;
> 	res = syz_open_dev(0xc, 4, 1);

open(/dev/tty1)

> 	if (res != -1)
> 		r[0] = res;
> *(uint16_t*)0x20000000 = 0xc;
> *(uint16_t*)0x20000002 = 0x373;
> *(uint16_t*)0x20000004 = 0x1442;
> 	syscall(__NR_ioctl, r[0], 0x5609ul, 0x20000000ul);

VT_RESIZE(12, 883)

> memcpy((void*)0x20003500, "\x7f\x45\x4c\x46\x00\x00\x00...
> 	syscall(__NR_write, r[0], 0x20003500ul, 0x381ul);

Write 381 bytes of some ELF to the tty.

OK, that's it. Thanks.

-- 
js
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
