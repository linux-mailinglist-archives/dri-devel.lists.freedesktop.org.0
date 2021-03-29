Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C495E34D4A9
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 18:15:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF25E6E44C;
	Mon, 29 Mar 2021 16:15:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BF416E44C
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 16:15:55 +0000 (UTC)
Date: Mon, 29 Mar 2021 17:15:37 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 2/3] drm/encoder: Add macro drmm_plain_encoder_alloc()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Message-Id: <1UNQQQ.C8BL9EPXOLHR2@crapouillou.net>
In-Reply-To: <YF+6HY9dQbUBbXXG@pendragon.ideasonboard.com>
References: <20210327115742.18986-1-paul@crapouillou.net>
 <20210327115742.18986-3-paul@crapouillou.net>
 <YF+6HY9dQbUBbXXG@pendragon.ideasonboard.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 linux-mips@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>, od@zcrc.me,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Le dim. 28 mars 2021 =E0 1:05, Laurent Pinchart =

<laurent.pinchart@ideasonboard.com> a =E9crit :
> Hi Paul,
> =

> Thank you for the patch.
> =

> On Sat, Mar 27, 2021 at 11:57:41AM +0000, Paul Cercueil wrote:
>>  This performs the same operation as drmm_encoder_alloc(), but
>>  only allocates and returns a struct drm_encoder instance.
>> =

>>  v4: Rename macro drmm_plain_encoder_alloc() and move to
>>      <drm/drm_encoder.h>. Since it's not "simple" anymore it
>>      will now take funcs/name arguments as well.
>> =

>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> =

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Patchset applied to drm-misc-next.

Thanks!

-Paul

>>  ---
>>   include/drm/drm_encoder.h | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>> =

>>  diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
>>  index 5bf78b5bcb2b..6e91a0280f31 100644
>>  --- a/include/drm/drm_encoder.h
>>  +++ b/include/drm/drm_encoder.h
>>  @@ -224,6 +224,24 @@ void *__drmm_encoder_alloc(struct drm_device =

>> *dev,
>>   				      offsetof(type, member), funcs, \
>>   				      encoder_type, name, ##__VA_ARGS__))
>> =

>>  +/**
>>  + * drmm_plain_encoder_alloc - Allocate and initialize an encoder
>>  + * @dev: drm device
>>  + * @funcs: callbacks for this encoder (optional)
>>  + * @encoder_type: user visible type of the encoder
>>  + * @name: printf style format string for the encoder name, or NULL =

>> for default name
>>  + *
>>  + * This is a simplified version of drmm_encoder_alloc(), which =

>> only allocates
>>  + * and returns a struct drm_encoder instance, with no subclassing.
>>  + *
>>  + * Returns:
>>  + * Pointer to the new drm_encoder struct, or ERR_PTR on failure.
>>  + */
>>  +#define drmm_plain_encoder_alloc(dev, funcs, encoder_type, name, =

>> ...) \
>>  +	((struct drm_encoder *) \
>>  +	 __drmm_encoder_alloc(dev, sizeof(struct drm_encoder), \
>>  +			      0, funcs, encoder_type, name, ##__VA_ARGS__))
>>  +
>>   /**
>>    * drm_encoder_index - find the index of a registered encoder
>>    * @encoder: encoder to find index for
> =

> --
> Regards,
> =

> Laurent Pinchart


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
