Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D17A51D74F0
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 12:14:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CAEE6E40D;
	Mon, 18 May 2020 10:14:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 793CB89E1B
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 12:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1589717965; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m6rR31/j2rzqBrfWiu7P6GCD7jhwshKtwnMGtC/OSLY=;
 b=fuS89dnmSKIjpFcz/qNlJ+E8jHHaHdPlWnM24ibfuN+m1Jqhubn8n0Bh4nKT4jncckq/lQ
 FWcQUBihGzB60pDmo3T87kL/WrnWkNYFcrYwRsupHAJEDdKNKUTvdCTZgau7p1pudvpXTE
 gum5raRCQxfIwdDXQNnqai/sCrm6VPk=
Date: Sun, 17 May 2020 14:19:14 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 04/12] gpu/drm: ingenic: Fix bogus crtc_atomic_check
 callback
To: Sam Ravnborg <sam@ravnborg.org>
Message-Id: <286HAQ.VQDCISW6S4DW2@crapouillou.net>
In-Reply-To: <20200517061737.GC609600@ravnborg.org>
References: <20200516215057.392609-1-paul@crapouillou.net>
 <20200516215057.392609-4-paul@crapouillou.net>
 <20200517061737.GC609600@ravnborg.org>
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

Le dim. 17 mai 2020 =E0 8:17, Sam Ravnborg <sam@ravnborg.org> a =E9crit :
> On Sat, May 16, 2020 at 11:50:49PM +0200, Paul Cercueil wrote:
>>  The code was comparing the SoC's maximum height with the mode's =

>> width,
>>  and vice-versa. D'oh.
>> =

>>  Cc: stable@vger.kernel.org # v5.6
>>  Fixes: a7c909b7c037 ("gpu/drm: ingenic: Check for display size in =

>> CRTC atomic check")
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> =

> Looks correct.
> Acked-by: Sam Ravnborg <sam@ravnborg.org>

Pushed to drm-misc-fixes, thanks for the review.

-Paul

>>  ---
>> =

>>  Notes:
>>      This patch was previously sent standalone.
>>      I marked it as superseded in patchwork.
>>      Nothing has been changed here.
>> =

>>   drivers/gpu/drm/ingenic/ingenic-drm.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>> =

>>  diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c =

>> b/drivers/gpu/drm/ingenic/ingenic-drm.c
>>  index 632d72177123..0c472382a08b 100644
>>  --- a/drivers/gpu/drm/ingenic/ingenic-drm.c
>>  +++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
>>  @@ -330,8 +330,8 @@ static int ingenic_drm_crtc_atomic_check(struct =

>> drm_crtc *crtc,
>>   	if (!drm_atomic_crtc_needs_modeset(state))
>>   		return 0;
>> =

>>  -	if (state->mode.hdisplay > priv->soc_info->max_height ||
>>  -	    state->mode.vdisplay > priv->soc_info->max_width)
>>  +	if (state->mode.hdisplay > priv->soc_info->max_width ||
>>  +	    state->mode.vdisplay > priv->soc_info->max_height)
>>   		return -EINVAL;
>> =

>>   	rate =3D clk_round_rate(priv->pix_clk,
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
