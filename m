Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82548181593
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 11:13:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E0996E84B;
	Wed, 11 Mar 2020 10:13:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 465706E84B
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 10:13:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CD9D3B05C;
 Wed, 11 Mar 2020 10:13:34 +0000 (UTC)
Subject: Re: [PATCH] drm: sysfs: Use scnprintf() for avoiding potential buffer
 overflow
To: Takashi Iwai <tiwai@suse.de>
References: <20200311073540.7108-1-tiwai@suse.de>
 <d0e1fa20-6686-1cf9-33b2-eef4707420f0@suse.de> <s5h36af9u5a.wl-tiwai@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 mQENBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAG0J1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPokBVAQTAQgAPhYh
 BHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEGgNwR1TC3ojR80H/jH+vYavwQ+TvO8ksXL9JQWc3IFSiGpuSVXLCdg62AmR
 irxW+qCwNncNQyb9rd30gzdectSkPWL3KSqEResBe24IbA5/jSkPweJasgXtfhuyoeCJ6PXo
 clQQGKIoFIAEv1s8l0ggPZswvCinegl1diyJXUXmdEJRTWYAtxn/atut1o6Giv6D2qmYbXN7
 mneMC5MzlLaJKUtoH7U/IjVw1sx2qtxAZGKVm4RZxPnMCp9E1MAr5t4dP5gJCIiqsdrVqI6i
 KupZstMxstPU//azmz7ZWWxT0JzgJqZSvPYx/SATeexTYBP47YFyri4jnsty2ErS91E6H8os
 Bv6pnSn7eAq5AQ0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRH
 UE9eosYbT6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgT
 RjP+qbU63Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+R
 dhgATnWWGKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zb
 ehDda8lvhFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r
 12+lqdsAEQEAAYkBPAQYAQgAJhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkD
 wmcAAAoJEGgNwR1TC3ojpfcIAInwP5OlcEKokTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2
 h9ifw9Nf2TjCZ6AMvC3thAN0rFDj55N9l4s1CpaDo4J+0fkrHuyNacnT206CeJV1E7NYntxU
 n+LSiRrOdywn6erjxRi9EYTVLCHcDhBEjKmFZfg4AM4GZMWX1lg0+eHbd5oL1as28WvvI/uI
 aMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU2y3ZH2mf5suSKHAMtbE4jKJ8ZHFOo3GhLgjVrBW
 HE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/tsZvyEX6zN8CtirPdPWu/VXNRYAl/lat7lSI
 3H26qrE=
Message-ID: <b64e90bc-1ddf-3785-fee4-299a762a67ad@suse.de>
Date: Wed, 11 Mar 2020 11:13:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <s5h36af9u5a.wl-tiwai@suse.de>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0122819606=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0122819606==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="FmjS1A222AV09WFjDvQdyOo2KaqKAsQvT"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--FmjS1A222AV09WFjDvQdyOo2KaqKAsQvT
Content-Type: multipart/mixed; boundary="YztA9YFAUGtN77kDi7BjyxYAkhZbY2Zc4";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Takashi Iwai <tiwai@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Message-ID: <b64e90bc-1ddf-3785-fee4-299a762a67ad@suse.de>
Subject: Re: [PATCH] drm: sysfs: Use scnprintf() for avoiding potential buffer
 overflow
References: <20200311073540.7108-1-tiwai@suse.de>
 <d0e1fa20-6686-1cf9-33b2-eef4707420f0@suse.de> <s5h36af9u5a.wl-tiwai@suse.de>
In-Reply-To: <s5h36af9u5a.wl-tiwai@suse.de>

--YztA9YFAUGtN77kDi7BjyxYAkhZbY2Zc4
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 11.03.20 um 09:24 schrieb Takashi Iwai:
> On Wed, 11 Mar 2020 09:10:56 +0100,
> Thomas Zimmermann wrote:
>>
>> Hi Takashi
>>
>> Am 11.03.20 um 08:35 schrieb Takashi Iwai:
>>> Since snprintf() returns the would-be-output size instead of the
>>> actual output size, the succeeding calls may go beyond the given
>>> buffer limit.  Fix it by replacing with scnprintf().
>>>
>>> Signed-off-by: Takashi Iwai <tiwai@suse.de>
>>> ---
>>>  drivers/gpu/drm/drm_sysfs.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.=
c
>>> index dd2bc85f43cc..9b3180e8c12f 100644
>>> --- a/drivers/gpu/drm/drm_sysfs.c
>>> +++ b/drivers/gpu/drm/drm_sysfs.c
>>> @@ -230,7 +230,7 @@ static ssize_t modes_show(struct device *device,
>>> =20
>>>  	mutex_lock(&connector->dev->mode_config.mutex);
>>>  	list_for_each_entry(mode, &connector->modes, head) {
>>> -		written +=3D snprintf(buf + written, PAGE_SIZE - written, "%s\n",
>>> +		written +=3D scnprintf(buf + written, PAGE_SIZE - written, "%s\n",=

>>>  				    mode->name);
>>>  	}
>>>  	mutex_unlock(&connector->dev->mode_config.mutex);
>>>
>>
>> In drm_sysfs.c, there are more _show functions with calls to snprintf(=
)
>> that could be replaced by scnprintf(). ATM they don't return the corre=
ct
>> length for output that exceeds PAGE_SIZE. since you're at it, you may
>> replace them as well.
>=20
> Well, the rest snprintf() calls are single calls and can't be over
> PAGE_SIZE obviously.  IOW, they could be rather replaced with
> sprintf() instead, for a sake of simplicity.=20

Admittedly, none of these strings look as if they ever go beyond
PAGE_SIZE, but sncprintf() is still a simple way of defensive
programming here (and returns the correct value).

>=20
>> But in any case
>>
>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>>
>> for this patch.
>>
>> Do you want me to merge the patch into drm-misc-next?
>=20
> Yes, please.

OK, will do later today.

Best regards
Thomas

>=20
>=20
> thanks,
>=20
> Takashi
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--YztA9YFAUGtN77kDi7BjyxYAkhZbY2Zc4--

--FmjS1A222AV09WFjDvQdyOo2KaqKAsQvT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl5oucsACgkQaA3BHVML
eiMKWwf/eM5yzbt4PMMYAcGt9JGxUzmBSXQdN/dYO71mzLPzhSnkYzp7raJG62xK
/61udtL1kRAoV6U3mnkD9uXocb03b8zhVvNtieuDvdAQ7DXuiOND5dPCN8ZDPv/F
rWmdBADcaRAQKnIa286hOCjXuwf473xyzPDnr7079uqluNOz6XZ/b3rnkqhywT/m
GBytlUjj+DlSI3RTwQcikGqj7T/QBd1hwvZTRCSsVQuLBqnzd90qg4YvzTt7OzIY
4nNpHLnMS8x/ujcitahFbipoIS0BdaHUl8H5FrwBTrhvCjelthGi5XHchPvJJw8o
enr6lEX5ZxvRguFEnEiW8+FMyAdJGw==
=fIbv
-----END PGP SIGNATURE-----

--FmjS1A222AV09WFjDvQdyOo2KaqKAsQvT--

--===============0122819606==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0122819606==--
