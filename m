Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D454818279
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 08:43:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C1D110E179;
	Tue, 19 Dec 2023 07:43:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD8A310E179
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 07:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1702971807; x=1703576607; i=deller@gmx.de;
 bh=ao3lASXOiNWcc7cDKLYuzfMPAsA0HEJVIK0BWVEMLLc=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=r+Kf4vYixeIXa6UCNjgw+98vUWhaq8/hY1QiUt2t+wRJM6mQA45rTnKJBFcc6Seh
 iovi/lzSIc70rrFzksoZk1w6FUODGMIP9/EkCF78OQi5Swe9SgBeS2Du+3DCLgN3w
 HHPqrKhVsXPbFX6kXFVh/bisVCys+BgYg5ttNECFLMB3CxrtfDYeJts3jpMjMXLiq
 M8EhX3wEgB0uUG+MJBsiMP0POqbSmzg1bP0ShJbtPQw/DP21/3CHW9GVGDy8pSLMt
 oviGb7dslVPIOIOP0JzQ+WV1InPBgYNWsE2vUEU2lqnZ1iLiHkrd9BH196NMIGQPn
 HzdwC7JvCqxCmwfmYw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([94.134.148.220]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N7iCg-1rBlee41Ks-014mb8; Tue, 19
 Dec 2023 08:43:27 +0100
Message-ID: <4dd7ec87-eceb-4015-a0a0-45f6f0c12e9d@gmx.de>
Date: Tue, 19 Dec 2023 08:43:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] fb: flush deferred work in fb_deferred_io_fsync()
Content-Language: en-US
To: Nam Cao <namcao@linutronix.de>, Daniel Vetter <daniel@ffwll.ch>,
 Antonino Daplas <adaplas@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, Paul Mundt <lethal@linux-sh.org>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <cover.1702890493.git.namcao@linutronix.de>
 <d15187348e7d7f76b7a1adf95aa5e3e3ecfc10b4.1702890493.git.namcao@linutronix.de>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <d15187348e7d7f76b7a1adf95aa5e3e3ecfc10b4.1702890493.git.namcao@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:U75OHBIVqTUSxk9MGyO4MovlBguzl0rDduhnVmoBCtMXnVzK7E6
 CZjB/wq7rsbDmVN+9TfXcEIf55plUqCFHaKHoP7F/SIQA6k4PNHCE3mypVrpXGcRVZDQFkk
 T2j2i8a7+toZJd5VxuO1T1MJ6g4F5qM9VDHbmZ6GAXTbZy8xZ6ipFomrbgmS30YOXrHyzG2
 TGBZZeHqdG8i99r9krSow==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:akZ1uFC8LKI=;SYz2qC5Is+YGsi/0WP8MeST33CJ
 WRjUOtO3uj2MsdHcy/faov7wT0Blwg8j75A8ZON1mKk/EDWF7kSLd9Ai8q00td5c1pX6wwWCh
 Gs9FAxM2kL0q+aXy+Ik6qHziLhwdLk556oGhyH7hoROIWwX8g5q4DNIyk+1s+7SZ7IE2fYyd/
 UJdUTF4BgR1Wq3KT0ros9aNPqzzi8eaA58ZHLITkN/Nnw1vTGrHudj7+h3RmGooLcQDU3Prbh
 kWpBNCe9QGtSJN+/aOzwh70QxhAL0IuVrndKIso5fGWeECS1pgR648WbMqOFR3WJEh9FErK2y
 kJPSR88SKHleZqkkKGtz6QjSwbtUkpYB9BUERW+Vs/gxOKWWgOZef3PrlcKK+2Wx1WxPL5zao
 1vjlmKgrFhLYAkiNLuC3yvZm4uZTBADG+KGc+LJziTL/88A6Vqiuy+veAyC5B/9TRtdD368P2
 fZXnpp01NhrQxZnU+mgDdGBMGgfbQevWhPvktAJCEqba+48pUlvy/yOoiWfnF7nd9Ue6NZ3fn
 33ZHnIPB31x06XZ8CekmzCOt5hlblkCKEMAyVK53lMrBNgm+yZXusOyo10pJ/PdyDIr+qTm1f
 tQiUB30FDeoStV0RYIr7S/+mnULmDmPpZygwrXWbr529bxW6/P6nO78+/psWM9T2NCVzxnlSI
 kSI7SvkoXrtxVdQ2HstlPUJicre7LIuQMv4wMBcUvCiJUjqJwJcdi/Z1T0ghq/ETMNBSSl1JR
 w16kpNKulcRnOg6dqluM+k1tNylbLuQij6NLdSWEWq2Rg+RJ9XSsguyx8wbGM6WgNiq43gDoL
 Gyqv5YRNudf0jopADhODxWG9rMZ+az2FqH7joyrPiH6c4cfM3SxdZXuh00JDFyaAIBelcJ3+I
 9NzXfIa4/qWUoaCilteXMXHplsY5bzz5CLmrxV5iuzvUqQhy17Sf22iG6AO8zjpsOuA8Ph0vo
 1qrh3w==
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
Cc: bigeasy@linutronix.de, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/18/23 10:57, Nam Cao wrote:
> The driver's fsync() is supposed to flush any pending operation to
> hardware. It is implemented in this driver by cancelling the queued
> deferred IO first, then schedule it for "immediate execution" by calling
> schedule_delayed_work() again with delay=3D0. However, setting delay=3D0
> only means the work is scheduled immediately, it does not mean the work
> is executed immediately. There is no guarantee that the work is finished
> after schedule_delayed_work() returns. After this driver's fsync()
> returns, there can still be pending work. Furthermore, if close() is
> called by users immediately after fsync(), the pending work gets
> cancelled and fsync() may do nothing.
>
> To ensure that the deferred IO completes, use flush_delayed_work()
> instead. Write operations to this driver either write to the device
> directly, or invoke schedule_delayed_work(); so by flushing the
> workqueue, it can be guaranteed that all previous writes make it to the
> device.
>
> Fixes: 5e841b88d23d ("fb: fsync() method for deferred I/O flush.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>   drivers/video/fbdev/core/fb_defio.c | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)

both patches applied to fbdev for-next git tree.

Thanks!
Helge

