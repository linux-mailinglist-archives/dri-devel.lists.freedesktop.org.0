Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB3F786165
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 22:26:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49E5D10E0DA;
	Wed, 23 Aug 2023 20:26:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E567010E0DA
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 20:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1692822360; x=1693427160; i=deller@gmx.de;
 bh=PhrGsHXGaQjIMk2bZf7/D8Uivx3B4otze2QEAyyNkds=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=F/x9+bQFRoQ+t4C+Z9PnO4tX9Ou852yHqFW6ec3/vWcW/JsjmxTHdl1hAPH1yHEUk5cQC5S
 kl46G6/0bYA+UODVrir/6AkCOuLn42LBuHW29e9wAX5InYqA+9xbs9KNcnMITJ9AXrGxR3m5s
 Ij2mAfRjJH/nXYtZsQvFb5OrdejkUBUlPG051T9HWCz1USUJY84tr89kC22iPrB2EivoElXe6
 kNQgs6+iGVdJ57Okyc9XgKqw0UU40f3EfDxB38GoJdTbi8CjiJnoS61/quDx06kiLeiAE+fw5
 gNzM/GMTipFzz4hlYqvcqjwliU9NYWy7l4/Sl9APnd+CuKt6H2bQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.150.103]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MYeMj-1qCXvP1kup-00Vhdv; Wed, 23
 Aug 2023 22:26:00 +0200
Message-ID: <5f33d29a-f5c7-0d35-3327-e31a26e5c8b4@gmx.de>
Date: Wed, 23 Aug 2023 22:25:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH -next] fbdev/core: Use list_for_each_entry() helper
Content-Language: en-US
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, sam@ravnborg.org,
 javierm@redhat.com, syoshida@redhat.com, Daniel Vetter <daniel@ffwll.ch>
References: <20230823072150.451189-1-ruanjinjie@huawei.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20230823072150.451189-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:keMXXUzzlqo3L2Az8U9hj7+vLEJYcKnOamLDCYZ0Fj7RsN4JojE
 7xDZ0W7Ggx/V/6QCcUWR/ofbsIgOvepYfEGa0jH0L0lhcFOjULbWGoWFOS7EVvCbzvYa3/G
 C/jNl2iiqwDUgqh1hMxYVF8gdmhQ7/vqe0AD7ilUnLpduecUFTjPUrT2t/A73vZ30e2Udui
 FjuMZvt/XpPCMyI+iAArA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:aj2K7ii9Gug=;dJtgR652gOPsH0WQ6OPzKL6LCs0
 5pZVzBXyGsHmCsSvokUOPmV+iSQsf8ECfntkYmDBMtnHatZrtjKpSX4WMJsKtBgcD5KJvbPuM
 nbDySfbe0UEnXZRbIPBzlcjsj5WxvUGbsfq9MbFXA8gy8/QJJzijDSHgECUzN/UbFiRJ6OXWf
 mwlXLXKdWzyzkHKFJ55jVXrfPHyL+yTlqq+p1rBomt0FQMhdqspXRGSextzFlJNYdo8Ibtsvx
 JZliboNWiTW67Drh146dgSZh2LyhtN4VWJju2Pr4t1AygLpToHh4PVtZCr5q/Mrr1GFlijmKp
 l7Jv7Aig2OrrKE8wNIqc7GSOT3AZ7vgXaSwHjVhSsNiI5L3mEqm2WB+zcQYI4bae0Udxu+rTo
 IdSmi26PyL44yxNeOvA9nWwqA2ZogK9dwxz8gMIXdAk9lkhii4GdqgpSTMijv5q2DSA1aRPs8
 1ka7tUVry5qkwf4Kh/B6NIa4xm/nKvfUkhCF6IO09C2hBaDD8pNUa58whX1D3RjMY+eXej9oN
 QRRYCnxmwVilLBXfq0w+NEOUW4dTlHj0Dqn/LTIsg721QlZfo7J5Y06pKgn0yeKw4ft6eZOdG
 ThcPjGVu7y4tyvmOrfWHzpLeGTUtnPhAPaIkOrVCCkPBXbcpf5X4djaNnJgwYD8tqsPL+1JQ7
 ZSTvRWuzDQvuNfkSrB1TNKVGKEnT++3qz24XksWK0tXCnNJq3Fmz4ehmQLqP1ItP6G7kUkWbw
 zAQflomM2zkkhSBrnUdXayM+9cksjY4BB9srV976en6nAFDgquJ//PXr3s7lsmIFRLlkrw7Lq
 XyvjiNopfPZhIqHg9KH526Fc2SPB25Xc6I6ewsbMtIsZZp30hVrrTV7GD9u/OJV7oYaqGt5gi
 5oqpWkE8zLLge/vPqVVLp+OGc0phSV1Fn5yz4cdKfPS8+zdaT3hVbuUBIQGcMOxtQlMfX07GL
 JVuCrQ==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/23/23 09:21, Jinjie Ruan wrote:
> Convert list_for_each() to list_for_each_entry() so that the pos
> list_head pointer and list_entry() call are no longer needed, which
> can reduce a few lines of code. No functional changed.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

applied.

Thanks!
Helge

