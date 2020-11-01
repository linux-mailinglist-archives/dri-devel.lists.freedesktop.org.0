Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E03B2A1F97
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 17:44:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0334B6EAD7;
	Sun,  1 Nov 2020 16:44:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA9C06EAD7
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Nov 2020 16:43:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7AA09ACE5;
 Sun,  1 Nov 2020 16:43:58 +0000 (UTC)
Subject: Re: [PATCH] drivers/video: Fix -Wstringop-truncation in hdmi.c
To: Sam Ravnborg <sam@ravnborg.org>
References: <20201021121241.17623-1-tzimmermann@suse.de>
 <20201101095021.GE1166694@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <acbbfe44-4fdb-2c9f-2583-aebf5941d83b@suse.de>
Date: Sun, 1 Nov 2020 17:43:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <20201101095021.GE1166694@ravnborg.org>
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
Cc: linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com, bernard@vivo.com,
 dri-devel@lists.freedesktop.org, gwan-gyeong.mun@intel.com,
 laurent.pinchart@ideasonboard.com, daniel.vetter@ffwll.ch
Content-Type: multipart/mixed; boundary="===============1489963477=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1489963477==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="xj7DkDuyrO3oFqongjZ5nXabRlCMjkA3W"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--xj7DkDuyrO3oFqongjZ5nXabRlCMjkA3W
Content-Type: multipart/mixed; boundary="7yHDug7DDMqJ57mEmv1yW2ZsS1Vqwx7l3";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: b.zolnierkie@samsung.com, gwan-gyeong.mun@intel.com,
 daniel.vetter@ffwll.ch, bernard@vivo.com, laurent.pinchart@ideasonboard.com,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <acbbfe44-4fdb-2c9f-2583-aebf5941d83b@suse.de>
Subject: Re: [PATCH] drivers/video: Fix -Wstringop-truncation in hdmi.c
References: <20201021121241.17623-1-tzimmermann@suse.de>
 <20201101095021.GE1166694@ravnborg.org>
In-Reply-To: <20201101095021.GE1166694@ravnborg.org>

--7yHDug7DDMqJ57mEmv1yW2ZsS1Vqwx7l3
Content-Type: multipart/mixed;
 boundary="------------7B7D2D7D42A63E5F101E899B"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------7B7D2D7D42A63E5F101E899B
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi

Am 01.11.20 um 10:50 schrieb Sam Ravnborg:
> On Wed, Oct 21, 2020 at 02:12:41PM +0200, Thomas Zimmermann wrote:
>> Trying to copy into the string fields with strncpy() gives a warning f=
rom
>> gcc. Both fields are part of a packed HDMI header and do not require a=

>> terminating \0 character.
>>
>> ../drivers/video/hdmi.c: In function 'hdmi_spd_infoframe_init':
>> ../drivers/video/hdmi.c:230:2: warning: 'strncpy' specified bound 8 eq=
uals destination size [-Wstringop-truncation]
>>   230 |  strncpy(frame->vendor, vendor, sizeof(frame->vendor));
>>       |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> ../drivers/video/hdmi.c:231:2: warning: 'strncpy' specified bound 16 e=
quals destination size [-Wstringop-truncation]
>>   231 |  strncpy(frame->product, product, sizeof(frame->product));
>>       |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
>> Just use memcpy() instead.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> I assume vendor is guaranteed to be 0-termindated.

It's a fixed-length field in the protocol. There's similar code in
radeon IIRC. So it would be nice to disable the warning in these cases.
But that's probably to much fiddling.

> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Thanks.

Best regards
Thomas

>=20
>> ---
>>  drivers/video/hdmi.c | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/video/hdmi.c b/drivers/video/hdmi.c
>> index b7a1d6fae90d..1e4cb63d0d11 100644
>> --- a/drivers/video/hdmi.c
>> +++ b/drivers/video/hdmi.c
>> @@ -221,14 +221,18 @@ EXPORT_SYMBOL(hdmi_avi_infoframe_pack);
>>  int hdmi_spd_infoframe_init(struct hdmi_spd_infoframe *frame,
>>  			    const char *vendor, const char *product)
>>  {
>> +	size_t len;
>> +
>>  	memset(frame, 0, sizeof(*frame));
>> =20
>>  	frame->type =3D HDMI_INFOFRAME_TYPE_SPD;
>>  	frame->version =3D 1;
>>  	frame->length =3D HDMI_SPD_INFOFRAME_SIZE;
>> =20
>> -	strncpy(frame->vendor, vendor, sizeof(frame->vendor));
>> -	strncpy(frame->product, product, sizeof(frame->product));
>> +	len =3D strlen(vendor);
>> +	memcpy(frame->vendor, vendor, min(len, sizeof(frame->vendor)));
>> +	len =3D strlen(product);
>> +	memcpy(frame->product, product, min(len, sizeof(frame->product)));
>> =20
>>  	return 0;
>>  }
>> --=20
>> 2.28.0
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer

--------------7B7D2D7D42A63E5F101E899B
Content-Type: application/pgp-keys;
 name="OpenPGP_0x680DC11D530B7A23.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="OpenPGP_0x680DC11D530B7A23.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdgX=
H47
fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0BeB5B=
bqP
5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4YchdHm3bkPj=
z9E
ErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB9GluwvIhSezPg=
nEm
imZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEBAAHNKFRob21hcyBaa=
W1t
ZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmNvbT7CwI4EEwEIADgCGwMFCwkIBwIGFQoJCAsCB=
BYC
AwECHgECF4AWIQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCXvxIWAAKCRBoDcEdUwt6I+aZB/9ih=
Onf
G4Lgf1L87cvoXh95/bnaJ6aQhP6/ZeRleuCXflnyDajlm3c9loQr0r2bQUi7JeYwUKbBab2QS=
GJm
DMRGlLMnmzWB8mHmZ6bHAu+2Sth8SraE42p6BB9d8dlYEID+dl/D/xUBeulfkck5rloGtYqDi=
+1Q
DfkEZJaxVSZ6FFkXuQi/G9qcI4iklN2nv02iQ7mZe8WYAysix6s/6vIobhirEBreclSNxXqis=
p8n
91+v855JC11EgRdUXMRK81IAaCKXP8zLx3ixku7mvP9Om61yerHSbeU2HZbIggZYQlFh6llJm=
zF1
CjCWgPTJyk4t4kMTcNOw5ykD47vU/KW+wl0EEBECAB0WIQQn6OOmnzvP/7ktjmoud6EwEfXTw=
gUC
WzodVwAKCRAud6EwEfXTwidvAKDkOADDHfI0QNXqAZcg6i1kOndAYACeLXHBwpjnumkPSyoab=
IiL
+he8r3zCwHMEEAEIAB0WIQQeXZghmQijlU7YzFiqUDvJrg9HpwUCWznxsQAKCRCqUDvJrg9Hp=
42f
CADIvsZcAd04PDFclRltHr2huy6s7+ZZA6PgYlMblEBh4bJA+dNPBTvzpJ7FJv/bmHOa+phWy=
Urj
EpfFGuOKGuWAfzgVAEu52fMrW3/mm+O26z1AKIu8hiZ/x9OAe4AM71ZO2lZrV1/53ZdzWnRuO=
45N
GQcotU8oeVfT9okAfmozmWMmIMq7Q0K6bV8W3qiD5XfDNxjr2caxc/9WX1bZPUo3n0H23MNaA=
Tpy
Oz732UtDh6sKUAB1RfzBBd/REbjHD7+quwJGAdRScyDRncX1vNb2+wihy0ipA69XY3bkhR5iD=
u5r
A9enuiMe6J1IBMI1PZh+vOufB/M6cd2D9RULIJaJwsBzBBABCAAdFiEEuyNtt7Ge78bIRx1op=
/N8
GYw5MYEFAls6MrsACgkQp/N8GYw5MYEnLQf/dwqlDJVQL2q+i8FFaqTMAm0n9jLRV6pN8JxFH=
j0g
voyWUOnQuNdAFgtKd26ZhN8NkLoSMO8E19eBPfLoBIFK5yNNVmRHAZm07MzGbA0uNWINJhmdR=
bZM
RMh0nneXjcEU/IvUmd8TPFTAd24X2mbzHgcaHMLJSVx1ohd4alRJXHIqDobKmiVwekyPnInJn=
zWw
iuZUkIotTkQple1PT/dF3S+KtPXBL6ldQ4NkAeCjsz4wnzSa9+VKOxEhiHM0PMzXSbkCMP+4m=
Xy9
RMplBw9Dm9hN2PSouBPifIrSodiiSWZYXOEkzLiBAB0frCKR63Dnx9kvjCD9Pz5wLd/70rjqI=
c0n
VGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+wsCOBBMBCAA4AhsDBQsJC=
AcC
BhUKCQgLAgQWAgMBAh4BAheAFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl78SF4ACgkQaA3BH=
VML
eiOpGAgAih6C1OnWms/N8eBMC4Q93y/nyywe5vCL22Dr1rwgn6Iw2jOGziJSi7zhY4sEk2NKJ=
5cd
lFrx8mP//b+xO4AGffwBD0Vwpf38Hj2Gt0KjpzRYccqqU+tJPO5c0pjI52ZIV3+kOEFvYGfkN=
PHE
flE+b81T8L2dSXCLtj4WAGUM1rmHn3bCYl+/RwkB+8XnoL5AvrmMcU4Uhb3FJpM4DHExccYkd=
eSL
ojBppOCztBCUpBx3le+8QPVvAvJDuur4wRmjk3sjKClAwzeqoYyUKcN3JDdb3mt3QcJal9rSh=
VEI
7B25IvfmEbs42oGm8GPzPkaNJu3gcska+l5PSTfurNETGsJdBBARAgAdFiEEJ+jjpp87z/+5L=
Y5q
LnehMBH108IFAls6HVcACgkQLnehMBH108LTkACgjLQdDYMENi6BDjY/gd/LF9lMi8oAnR+o0=
FwE
Vb1K1tEMQ/1x+k1U6/xgwsBzBBABCAAdFiEEHl2YIZkIo5VO2MxYqlA7ya4PR6cFAls58bMAC=
gkQ
qlA7ya4PR6cvTAgAzY1N5QMKh8ECRtYcZNmilyV59uHTEY9hAR+203JqWnSGfUKtU7s6xfl5O=
NGq
DI5rULk4Cw2CEIzg9Sat+/lxn36w2f1tEznS5Vb0gVGWrzDAFjj7tB6MnmCzsNb/S1kgxnqJM=
Yor
RYQ7uB3Yr2Fdp08FJxN0ipd5YfzaZ6KoSWcRAv4r1R4ZQGuS77URAg7HDOIrBMOVO+HIn7GYQ=
qPS
5ZFw5yXbvEtL1c5Y8Zdw1AG2VmEXx78TWQVG3kI8/lQF1QI3yrJ1Rp2x5eK9I0OJihv13IlIW=
3sb
QGrj9pxF63kA20ZFaynzFglBGiyxExYvTD0/xKIhzYhj8mtCunPb2cLAcwQQAQgAHRYhBLsjb=
bex
nu/GyEcdaKfzfBmMOTGBBQJbOjLAAAoJEKfzfBmMOTGBBoMIALIW4EtBY28tPwZMOpN/+ARPO=
a2g
Qzpivw7iNtiDTnGIXMCoxly1CybfMdqTHYmuKbEO9AlFAlDOnkgInsn8E65IvgUTVI95Ah+Ob=
iPI
FkYc/9a+AexPl7f5kI9489k77eKtqtMpWFpo/vROmRroSw4JnM7ovwPq1QOSHExfTKbLunzD1=
i3V
4PShSZ6bGsp1LW6Wk0lRMHDuAk3xsyjBWfJwSbrCe3E6OsLG7BuQqEUt2fR6NxdDRSR9tQUp9=
Tri
AYG5LndmUzxeU6FAQjD8Wt1ezOFH5ODcCDXfRyYmE6uCGA4EvO8l9R3o68NPlUjPRAZsCbxJa=
UAg
iazX1nyQGwvOwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHU=
E9e
osYbT6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+q=
bU6
3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWWG=
KdD
egUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lvhFXod=
NFM
AgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsAEQEAAcLAf=
AQY
AQgAJhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkDwmcAAAoJEGgNwR1TC3ojp=
fcI
AInwP5OlcEKokTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2h9ifw9Nf2TjCZ6AMvC3thAN0r=
FDj
55N9l4s1CpaDo4J+0fkrHuyNacnT206CeJV1E7NYntxUn+LSiRrOdywn6erjxRi9EYTVLCHcD=
hBE
jKmFZfg4AM4GZMWX1lg0+eHbd5oL1as28WvvI/uIaMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU=
2y3
ZH2mf5suSKHAMtbE4jKJ8ZHFOo3GhLgjVrBWHE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/t=
sZv
yEX6zN8CtirPdPWu/VXNRYAl/lat7lSI3H26qrE=3D
=3DmxFq
-----END PGP PUBLIC KEY BLOCK-----

--------------7B7D2D7D42A63E5F101E899B--

--7yHDug7DDMqJ57mEmv1yW2ZsS1Vqwx7l3--

--xj7DkDuyrO3oFqongjZ5nXabRlCMjkA3W
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl+e5csFAwAAAAAACgkQaA3BHVMLeiN7
4gf/a6SFvTFnxPXPRtvgeQ+bSDsAhskO3o7R25E+P/yVWgZnCWzleVhbL5F+IXhN5nUsE1hkgZ2z
VhWgPkQ7LpCpBo0+w++H9vBYlEhrk+8agSDPU4DHL8RA1DWlizftPwhQkl0UJiciKF6HY44VXQF5
VF4qP4pZPRHuuFTM4M2rFWuh6ZxW/KbqAApoCojEoXIvBU5koRBRl2w6mUzp3tFBQ49t3t5fcfAG
bsV3x+i+7fbJoBgTdQP7YokPAGYlqyxyIewBWvwcYub42W5/TkW4mD9d06kxWleXmkPpRMMubeqH
4ZkGaUPQVVPuHEQ5gMWUlLWXAl5XyC4z72P05NgxCw==
=lrcK
-----END PGP SIGNATURE-----

--xj7DkDuyrO3oFqongjZ5nXabRlCMjkA3W--

--===============1489963477==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1489963477==--
