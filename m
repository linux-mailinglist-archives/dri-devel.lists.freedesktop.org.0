Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F741D74EA
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 12:14:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3D3F6E152;
	Mon, 18 May 2020 10:14:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4A1489E1B
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 12:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1589718006; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9lAqsVvAIASjKFbEhPDBxhbFVPKcLMddVhVPAD4MtNs=;
 b=vG/oYm1r0CrhRofO/eXELE3n5/czRaZ1Mk0pnntlYvJyV4JqsSm+HtaxMXipIy2tzyGoYL
 s8Ob0J1DuXgXhwqeMWHTJGIt3Y6zzy7vUxrwt9qBFhCqAtz6wHeQ7Nj9rivo8NPUWvYWnq
 YAtndBgSbClCsZJN0j+Vcwm4HxmvV/w=
Date: Sun, 17 May 2020 14:19:54 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 05/12] gpu/drm: Ingenic: Fix opaque pointer casted to
 wrong type
To: Sam Ravnborg <sam@ravnborg.org>
Message-Id: <696HAQ.LSNC2851KFSC@crapouillou.net>
In-Reply-To: <20200517062105.GD609600@ravnborg.org>
References: <20200516215057.392609-1-paul@crapouillou.net>
 <20200516215057.392609-5-paul@crapouillou.net>
 <20200517062105.GD609600@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 18 May 2020 10:14:39 +0000
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
Cc: devicetree@vger.kernel.org, od@zcrc.me,
 "Rafael J . Wysocki" <rafael@kernel.org>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Le dim. 17 mai 2020 =E0 8:21, Sam Ravnborg <sam@ravnborg.org> a =E9crit :
> On Sat, May 16, 2020 at 11:50:50PM +0200, Paul Cercueil wrote:
>>  The opaque pointer passed to the IRQ handler is a pointer to the
>>  drm_device, not a pointer to our ingenic_drm structure.
>> =

>>  It still worked, because our ingenic_drm structure contains the
>>  drm_device as its first field, so the pointer received had the same
>>  value, but this was not semantically correct.
>> =

>>  Cc: stable@vger.kernel.org # v5.3
>>  Fixes: 90b86fcc47b4 ("DRM: Add KMS driver for the Ingenic JZ47xx =

>> SoCs")
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>

Pushed to drm-misc-fixes, thanks for the review.

-Paul

>>  ---
>>   drivers/gpu/drm/ingenic/ingenic-drm.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> =

>>  diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c =

>> b/drivers/gpu/drm/ingenic/ingenic-drm.c
>>  index 0c472382a08b..97244462599b 100644
>>  --- a/drivers/gpu/drm/ingenic/ingenic-drm.c
>>  +++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
>>  @@ -476,7 +476,7 @@ static int =

>> ingenic_drm_encoder_atomic_check(struct drm_encoder *encoder,
>> =

>>   static irqreturn_t ingenic_drm_irq_handler(int irq, void *arg)
>>   {
>>  -	struct ingenic_drm *priv =3D arg;
>>  +	struct ingenic_drm *priv =3D drm_device_get_priv(arg);
>>   	unsigned int state;
>> =

>>   	regmap_read(priv->map, JZ_REG_LCD_STATE, &state);
>>  --
>>  2.26.2
>> =

>>  _______________________________________________
>>  dri-devel mailing list
>>  dri-devel@lists.freedesktop.org
>>  https://lists.freedesktop.org/mailman/listinfo/dri-devel


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
