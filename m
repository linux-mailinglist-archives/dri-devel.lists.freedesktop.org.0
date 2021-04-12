Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9853635C95E
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 17:05:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 827D06E5D2;
	Mon, 12 Apr 2021 15:05:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 719 seconds by postgrey-1.36 at gabe;
 Mon, 12 Apr 2021 15:05:06 UTC
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8077D6E5D2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 15:05:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1618239184; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=cNaINwXxnVghLsF8j67RQfipyarpRrXdjRLv08quawZ1JnEvpU3FVbB/Pj21Wtwwvx
 JoYkADHZNz21L5PrkjmMvyS5ukFhnB8AFk7RaNraR+/IIfs31Pwc4GMALi5bq9eeABAp
 SlLKvYtu/X+wCjX0nbqp+aODDll5cIlQmszQbp1YeE8XydI8DqugElJYgb46rr55zLzb
 8YX+/f3uG7khdihEBgaTSevSzJUd4WR9ue54KOgNAWNcDzs28vIucZHkXY4bx2yQ0tJi
 kuD7+ydRmgUmY+D4akNsA2xPuBguQBuThTIxgEwR0ETohCLj3pXAzTKTnWQKxRTxKffc
 fcGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1618239184;
 s=strato-dkim-0002; d=strato.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=kBXF27gQ5ambp/CjjnXkp3yDX1JfgJeEl20/GXxeygk=;
 b=X+qBlBZuU75ynEa3CLTA8pcB8WnxTKHbQOkxS5dCwiEkiPj2+TPUv2aqEfOnkGAvlW
 JmE4z4cPf75iyXPfX+qPO+0JoBPzd6D2IaOW/OXnK7uB1c2ALx8HMUtbhXyNW884GGCS
 JVoDyLAotA621XesGluRPGXFc9blhckjWx64QvbTcT0ZtdmIoPLAfQs3KTL5s/XfgyOb
 Bpc15KV3fviXgV+TGx1YELessi+GQbzLBGbh1nh6IMQqVZU42tyoo6RE0VVFGsq+BODh
 9emgcjvz0ytJiwy6j4Y++Bzk+xYdBpuKmb6VAIeDZLCgvyTNExLL0RK+DSjcKfZigB8/
 N5AA==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1618239184;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=kBXF27gQ5ambp/CjjnXkp3yDX1JfgJeEl20/GXxeygk=;
 b=Vlndu1i331aQIWrdU8T6zP7TdERoD9P7I5/w/r3k9BaAuQAj9DuBq9DUf+Nd9D11k+
 jYBOW6YpIy+zQt7kwklGf73hsMccpNx8bSZS3uHzWF6wBpR+eD44h+y3xV/WzDxHGWg0
 RSZ7/1ls5QBHTuhVRLkzFrcwBN2np1An3zjHsMXwAH0Wc2VQIqAzYeUTQw5N3Dfq60J+
 bNlDp1FcRLK8It2k8C8TXK1Jenzp8m+D6y7LB8KR/tC87TVi1dqyQzLDSd7Fg7bnu2A9
 jTQm9vAdWdSEJldzz/cH4qLUUxcNPc6kRTvJCW/GzkX5KBLOg3jDH29YoKc66QUhhp+L
 Yp3Q==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmMlw47o5n4="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.24.0 DYNA|AUTH)
 with ESMTPSA id Z028d1x3CEr3K3E
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Mon, 12 Apr 2021 16:53:03 +0200 (CEST)
Subject: Re: [PATCH] drm/ingenic: Fix pixclock rate for 24-bit serial panels
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <VGGGRQ.1IX0AMZPBZBT3@crapouillou.net>
Date: Mon, 12 Apr 2021 16:53:03 +0200
Message-Id: <228D0565-DCFF-4314-A4AA-C58EBAD77D22@goldelico.com>
References: <20210323144008.166248-1-paul@crapouillou.net>
 <VGGGRQ.1IX0AMZPBZBT3@crapouillou.net>
To: Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3124)
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
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, od@zcrc.me,
 stable@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


> Am 12.04.2021 um 16:34 schrieb Paul Cercueil <paul@crapouillou.net>:
> =

> Hi,
> =

> Can I have an ACK for this patch?
> =

> Then I can apply it to drm-misc-next-fixes.
> =

> Cheers,
> -Paul
> =

> =

> Le mar. 23 mars 2021 =E0 14:40, Paul Cercueil <paul@crapouillou.net> a =
=E9crit :
>> When using a 24-bit panel on a 8-bit serial bus, the pixel clock
>> requested by the panel has to be multiplied by 3, since the subpixels
>> are shifted sequentially.
>> The code (in ingenic_drm_encoder_atomic_check) already computed
>> crtc_state->adjusted_mode->crtc_clock accordingly, but clk_set_rate()
>> used crtc_state->adjusted_mode->clock instead.
>> Fixes: 28ab7d35b6e0 ("drm/ingenic: Properly compute timings when using a=
 3x8-bit panel")
>> Cc: stable@vger.kernel.org # v5.10

Tested-by: H. Nikolaus Schaller <hns@goldelico.com>	# CI20/jz4780 (HDMI) an=
d Alpha400/jz4730 (LCD)

>> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>> ---
>> drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm=
/ingenic/ingenic-drm-drv.c
>> index d60e1eefc9d1..cba68bf52ec5 100644
>> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>> @@ -342,7 +342,7 @@ static void ingenic_drm_crtc_atomic_flush(struct drm=
_crtc *crtc,
>> 	if (priv->update_clk_rate) {
>> 		mutex_lock(&priv->clk_mutex);
>> 		clk_set_rate(priv->pix_clk,
>> -			     crtc_state->adjusted_mode.clock * 1000);
>> +			     crtc_state->adjusted_mode.crtc_clock * 1000);
>> 		priv->update_clk_rate =3D false;
>> 		mutex_unlock(&priv->clk_mutex);
>> 	}
>> --
>> 2.30.2
> =

> =


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
