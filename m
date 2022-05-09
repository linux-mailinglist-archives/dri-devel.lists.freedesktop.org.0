Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E13C5201DB
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 18:04:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FC6410E8E0;
	Mon,  9 May 2022 16:04:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.180])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7C9AF10E8E0
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 16:04:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 31CE2202046;
 Mon,  9 May 2022 18:04:11 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id m9FqBxwWIBdx; Mon,  9 May 2022 18:04:11 +0200 (CEST)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPA id E662A202042;
 Mon,  9 May 2022 18:04:10 +0200 (CEST)
Received: from [127.0.0.1] by thor with esmtp (Exim 4.95)
 (envelope-from <michel@daenzer.net>) id 1no5rh-000fS0-2U;
 Mon, 09 May 2022 18:04:05 +0200
Message-ID: <6b7acc25-64b3-297d-7842-a8cd59c8d98d@daenzer.net>
Date: Mon, 9 May 2022 18:04:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-CA
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 lyude@redhat.com
References: <20220509094930.44613-1-jfalempe@redhat.com>
 <432710c7-04fd-7358-60c4-861cf3cfb5cf@suse.de>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH] mgag200: Enable atomic gamma lut update
In-Reply-To: <432710c7-04fd-7358-60c4-861cf3cfb5cf@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Reply-To: michel.daenzer@mailbox.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-05-09 16:22, Thomas Zimmermann wrote:
> 
> It might also make sense to adjust the starting value of the lut table such that its final entry is used for the final entry in the HW palette. For typical gamma ramps ~2, the curve is fairly flat for small values and goes up steeply at high values. (Please correct me if I'm misinterpreting the gamma ramps.)

I don't think that's accurate. The most common ramp should be a straight line from 0 to the maximum value, and others may be curved toward the top or bottom.


> For 15-bit case I'd do thing like this.
> 
>  lut += 7;
>  for (i < 0; i < 32; ++i, lut += 8) {
>     // write  lut
>  }
> 
> 16-bit is complicated and may better be done in 2 loops
> 
>  lutr += 7;
>  lutg += 3;
>  lutb += 7;
>  for (i < 0; i < 32; ++i, lutr += 8, lutg += 3, lutb += 8) {
>    // write  r/g/b lut
>  }
>  for (; i < 64; ++i, lutg += 3) {
>    // write  0/g/0 lut
>  }

That'll just drop the first 3-7 entries of the LUT instead of the last ones, i.e. generally the full black entries instead of the full white ones.

Ideally, the loop should start at 0 and then count as evenly as possible up to 255/63/31. I realize that's tricky though, and I don't have any specific suggestions for how to achieve this offhand.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer
