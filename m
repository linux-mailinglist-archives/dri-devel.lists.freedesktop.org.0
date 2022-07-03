Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21940565B34
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:17:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BD1810E56A;
	Mon,  4 Jul 2022 16:14:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A884E10E027
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Jul 2022 11:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1656848728; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sXnapAA8AB7IePhGfDT35N7Hgo2H+tcnMEbnApSgbgc=;
 b=NrlNvnLQqaM9/3j5GyuFg5OW9YqnMc4LaDWtfmSJ+w/+y4rwR/bRs6CscjrRLvprIugR9f
 HTqN3nj4q/n/eDV5pTR8WQFolR6qQoFSwPuqgGWaLIwrX30n3SJyLgtumddYNmCkxDvSS+
 M3ZLmGd665inHTDo0y5E+dfT9rbwBgY=
Date: Sun, 03 Jul 2022 12:45:18 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] drm/ingenic: Use the highest possible DMA burst size
To: Sam Ravnborg <sam@ravnborg.org>
Message-Id: <IN0GER.UCST485AI2YD1@crapouillou.net>
In-Reply-To: <YsE6mZanHLy9LpBd@ravnborg.org>
References: <20220702230727.66704-1-paul@crapouillou.net>
 <YsE6mZanHLy9LpBd@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
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
Cc: David Airlie <airlied@linux.ie>, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, list@opendingux.net,
 Christophe Branchereau <cbranchereau@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Le dim., juil. 3 2022 at 08:43:37 +0200, Sam Ravnborg=20
<sam@ravnborg.org> a =E9crit :
> Hi Paul,
>=20
> On Sun, Jul 03, 2022 at 12:07:27AM +0100, Paul Cercueil wrote:
>>  Until now, when running at the maximum resolution of 1280x720 at=20
>> 32bpp
>>  on the JZ4770 SoC the output was garbled, the X/Y position of the
>>  top-left corner of the framebuffer warping to a random position with
>>  the whole image being offset accordingly, every time a new frame was
>>  being submitted.
>>=20
>>  This problem can be eliminated by using a bigger burst size for the=20
>> DMA.
>=20
> Are there any alignment constraints of the framebuffer that depends on
> the burst size? I am hit by this with some atmel IP - which is why I
> ask.

I would think that the framebuffer needs to be aligned with the burst=20
size, indeed. Here, our buffers are always page-aligned so that's not a=20
problem.

> Patch looks good and is a-b.

Thanks!

Cheers,
-Paul

>>=20
>>  Set in each soc_info structure the maximum burst size supported by=20
>> the
>>  corresponding SoC, and use it in the driver.
>>=20
>>  Set the new value using regmap_update_bits() instead of
>>  regmap_set_bits(), since we do want to override the old value of the
>>  burst size. (Note that regmap_set_bits() wasn't really valid before=20
>> for
>>  the same reason, but it never seemed to be a problem).
>>=20
>>  Cc: <stable@vger.kernel.org>
>>  Fixes: 90b86fcc47b4 ("DRM: Add KMS driver for the Ingenic JZ47xx=20
>> SoCs")
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>


