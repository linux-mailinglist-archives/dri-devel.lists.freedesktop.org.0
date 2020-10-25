Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECAD2987D2
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 09:08:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 957546E87A;
	Mon, 26 Oct 2020 08:08:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03FF16E0FD
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 23:33:51 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09PNPDUE078732;
 Sun, 25 Oct 2020 23:33:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : message-id :
 content-type : mime-version : subject : date : in-reply-to : cc : to :
 references; s=corp-2020-01-29;
 bh=ZhamaOXuVkARDz6Y/coDiz1ugeVWOsS9GaNJhL3iQx0=;
 b=KXgjFEmaSwGL1QRtjVkwY3o84FaVtHQu0lLenyl5AIZFqUr1iOIwlKf4HiwQEPGPDxzJ
 JPNTTAv3k5sFi3nYJt/XMGb8nK5LeF4vWo+3y5HtNgdx7RctDCHFhe9YqyldPVgDlCr4
 xICcvJLRS99eU85lR1E9I7CrwdkC4nfpO0ye+yKsDIMAf/wlwBYqi0ZHMXDRZeCNEpzA
 KPC/RoiQsBQl3o0GP8/OC1W2iwj9CZZTuFxJl5cJNkBF2hh/ZACEPTf51dfKPvbwz2Su
 tmQuoeTzm0h3rLmtuDU9C4S3kE/EekvQFmS3Gjw4ynVb5PDYnk3ZU8IjQTSHrheyannS HA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 34dgm3r3ke-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sun, 25 Oct 2020 23:33:44 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09PNJttU104769;
 Sun, 25 Oct 2020 23:31:43 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 34cx5vgvqg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 25 Oct 2020 23:31:43 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 09PNVWH8032033;
 Sun, 25 Oct 2020 23:31:32 GMT
Received: from dhcp-10-159-151-51.vpn.oracle.com (/10.159.151.51)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sun, 25 Oct 2020 16:31:31 -0700
From: Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>
Message-Id: <D8632766-13CA-4499-839A-AF21E247F5B9@oracle.com>
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [PATCH 1/1] video: fbdev: fix divide error in fbcon_switch
Date: Sun, 25 Oct 2020 16:31:30 -0700
In-Reply-To: <ad87c5c1-061d-8a81-7b2c-43a8687a464f@suse.de>
To: Thomas Zimmermann <tzimmermann@suse.de>, stable@vger.kernel.org
References: <20201021235758.59993-1-saeed.mirzamohammadi@oracle.com>
 <ad87c5c1-061d-8a81-7b2c-43a8687a464f@suse.de>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9785
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 mlxlogscore=999
 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010250177
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9785
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 suspectscore=0 clxscore=1011 mlxscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010250177
X-Mailman-Approved-At: Mon, 26 Oct 2020 08:08:06 +0000
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
Cc: linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com,
 jani.nikula@intel.com, daniel.vetter@ffwll.ch, gustavoars@kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 akpm@linux-foundation.org, rppt@kernel.org
Content-Type: multipart/mixed; boundary="===============0324873083=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0324873083==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_DCD68940-031B-4C2D-BBAE-1D2D330BDA5E"


--Apple-Mail=_DCD68940-031B-4C2D-BBAE-1D2D330BDA5E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Thanks, adding stable.

> On Oct 22, 2020, at 12:34 AM, Thomas Zimmermann <tzimmermann@suse.de> =
wrote:
>=20
> Hi
>=20
> On 22.10.20 01:57, saeed.mirzamohammadi@oracle.com =
<mailto:saeed.mirzamohammadi@oracle.com> wrote:
>> From: Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com =
<mailto:saeed.mirzamohammadi@oracle.com>>
>>=20
>> This patch fixes the issue due to:
>>=20
>> [   89.572883] divide_error: 0000 [#1] SMP KASAN PTI
>> [   89.572897] CPU: 3 PID: 16083 Comm: repro Not tainted =
5.9.0-rc7.20200930.rc1.allarch-19-g3e32d0d.syzk #5
>> [   89.572902] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), =
BIOS 0.5.1 01/01/2011
>> [   89.572934] RIP: 0010:cirrusfb_check_var+0x84/0x1260
>=20
> BTW, if you run qemu with cirrus, there's also a DRM driver named
> cirrus.ko. Might be a better choice than the old fbdev driver. If you
> just care about qemu, but not the actual graphics device, take a look =
at
>=20
>  =
https://urldefense.com/v3/__https://www.kraxel.org/blog/2014/10/qemu-using=
-cirrus-considered-harmful/__;!!GqivPVa7Brio!LmgeM-pVBVH80uVELF1P1nBGAbAlh=
vnxKKE_ZrEc9d76AznvAAgP1FAp3_zNa2frKaIUZteK$ =
<https://urldefense.com/v3/__https://www.kraxel.org/blog/2014/10/qemu-usin=
g-cirrus-considered-harmful/__;!!GqivPVa7Brio!LmgeM-pVBVH80uVELF1P1nBGAbAl=
hvnxKKE_ZrEc9d76AznvAAgP1FAp3_zNa2frKaIUZteK$>=20
>=20
> Anyway, thanks for your patch.
>=20
> Best regards
> Thomas
>=20
>>=20
>> The error happens when the pixels value is calculated before =
performing the sanity checks on bits_per_pixel.
>> A bits_per_pixel set to zero causes divide by zero error.
>>=20
>> This patch moves the calculation after the sanity check.
>>=20
>> Signed-off-by: Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>
>> Tested-by: Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>
>> ---
>> drivers/video/fbdev/cirrusfb.c | 3 ++-
>> 1 file changed, 2 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/video/fbdev/cirrusfb.c =
b/drivers/video/fbdev/cirrusfb.c
>> index 15a9ee7cd734..a7749101b094 100644
>> --- a/drivers/video/fbdev/cirrusfb.c
>> +++ b/drivers/video/fbdev/cirrusfb.c
>> @@ -531,7 +531,7 @@ static int cirrusfb_check_var(struct =
fb_var_screeninfo *var,
>> {
>> 	int yres;
>> 	/* memory size in pixels */
>> -	unsigned pixels =3D info->screen_size * 8 / var->bits_per_pixel;
>> +	unsigned int pixels;
>> 	struct cirrusfb_info *cinfo =3D info->par;
>>=20
>> 	switch (var->bits_per_pixel) {
>> @@ -573,6 +573,7 @@ static int cirrusfb_check_var(struct =
fb_var_screeninfo *var,
>> 		return -EINVAL;
>> 	}
>>=20
>> +	pixels =3D info->screen_size * 8 / var->bits_per_pixel;
>> 	if (var->xres_virtual < var->xres)
>> 		var->xres_virtual =3D var->xres;
>> 	/* use highest possible virtual resolution */
>>=20
>=20
> --=20
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--Apple-Mail=_DCD68940-031B-4C2D-BBAE-1D2D330BDA5E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D"">Thanks, adding stable.<br class=3D""><div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D"">On Oct =
22, 2020, at 12:34 AM, Thomas Zimmermann &lt;<a =
href=3D"mailto:tzimmermann@suse.de" class=3D"">tzimmermann@suse.de</a>&gt;=
 wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><span=
 style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">Hi</span><br style=3D"caret-color:=
 rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">On 22.10.20 01:57,<span =
class=3D"Apple-converted-space">&nbsp;</span></span><a =
href=3D"mailto:saeed.mirzamohammadi@oracle.com" style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;" =
class=3D"">saeed.mirzamohammadi@oracle.com</a><span style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D""><span =
class=3D"Apple-converted-space">&nbsp;</span>wrote:</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D""><blockquote type=3D"cite" style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">From: =
Saeed Mirzamohammadi &lt;<a =
href=3D"mailto:saeed.mirzamohammadi@oracle.com" =
class=3D"">saeed.mirzamohammadi@oracle.com</a>&gt;<br class=3D""><br =
class=3D"">This patch fixes the issue due to:<br class=3D""><br =
class=3D"">[ &nbsp;&nbsp;89.572883] divide_error: 0000 [#1] SMP KASAN =
PTI<br class=3D"">[ &nbsp;&nbsp;89.572897] CPU: 3 PID: 16083 Comm: repro =
Not tainted 5.9.0-rc7.20200930.rc1.allarch-19-g3e32d0d.syzk #5<br =
class=3D"">[ &nbsp;&nbsp;89.572902] Hardware name: QEMU Standard PC =
(i440FX + PIIX, 1996), BIOS 0.5.1 01/01/2011<br class=3D"">[ =
&nbsp;&nbsp;89.572934] RIP: 0010:cirrusfb_check_var+0x84/0x1260<br =
class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">BTW, if you run qemu with cirrus, there's also a DRM driver =
named</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">cirrus.ko. =
Might be a better choice than the old fbdev driver. If you</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">just care about qemu, but not =
the actual graphics device, take a look at</span><br style=3D"caret-color:=
 rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">&nbsp;</span><a =
href=3D"https://urldefense.com/v3/__https://www.kraxel.org/blog/2014/10/qe=
mu-using-cirrus-considered-harmful/__;!!GqivPVa7Brio!LmgeM-pVBVH80uVELF1P1=
nBGAbAlhvnxKKE_ZrEc9d76AznvAAgP1FAp3_zNa2frKaIUZteK$" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;" =
class=3D"">https://urldefense.com/v3/__https://www.kraxel.org/blog/2014/10=
/qemu-using-cirrus-considered-harmful/__;!!GqivPVa7Brio!LmgeM-pVBVH80uVELF=
1P1nBGAbAlhvnxKKE_ZrEc9d76AznvAAgP1FAp3_zNa2frKaIUZteK$</a><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D""><span =
class=3D"Apple-converted-space">&nbsp;</span></span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">Anyway, thanks for your =
patch.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">Best =
regards</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" =
class=3D"">Thomas</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br class=3D"">The error happens when =
the pixels value is calculated before performing the sanity checks on =
bits_per_pixel.<br class=3D"">A bits_per_pixel set to zero causes divide =
by zero error.<br class=3D""><br class=3D"">This patch moves the =
calculation after the sanity check.<br class=3D""><br =
class=3D"">Signed-off-by: Saeed Mirzamohammadi &lt;<a =
href=3D"mailto:saeed.mirzamohammadi@oracle.com" =
class=3D"">saeed.mirzamohammadi@oracle.com</a>&gt;<br =
class=3D"">Tested-by: Saeed Mirzamohammadi &lt;<a =
href=3D"mailto:saeed.mirzamohammadi@oracle.com" =
class=3D"">saeed.mirzamohammadi@oracle.com</a>&gt;<br class=3D"">---<br =
class=3D"">drivers/video/fbdev/cirrusfb.c | 3 ++-<br class=3D"">1 file =
changed, 2 insertions(+), 1 deletion(-)<br class=3D""><br class=3D"">diff =
--git a/drivers/video/fbdev/cirrusfb.c =
b/drivers/video/fbdev/cirrusfb.c<br class=3D"">index =
15a9ee7cd734..a7749101b094 100644<br class=3D"">--- =
a/drivers/video/fbdev/cirrusfb.c<br class=3D"">+++ =
b/drivers/video/fbdev/cirrusfb.c<br class=3D"">@@ -531,7 +531,7 @@ =
static int cirrusfb_check_var(struct fb_var_screeninfo *var,<br =
class=3D"">{<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>int yres;<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>/* memory =
size in pixels */<br class=3D"">-<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>unsigned pixels =3D =
info-&gt;screen_size * 8 / var-&gt;bits_per_pixel;<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>unsigned =
int pixels;<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>struct cirrusfb_info *cinfo =3D =
info-&gt;par;<br class=3D""><br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>switch (var-&gt;bits_per_pixel) =
{<br class=3D"">@@ -573,6 +573,7 @@ static int cirrusfb_check_var(struct =
fb_var_screeninfo *var,<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>return -EINVAL;<br class=3D""><span=
 class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>}<br =
class=3D""><br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>pixels =3D info-&gt;screen_size * =
8 / var-&gt;bits_per_pixel;<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>if (var-&gt;xres_virtual &lt; =
var-&gt;xres)<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>var-&gt;xres_virtual =3D =
var-&gt;xres;<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>/* use highest possible virtual =
resolution */<br class=3D""><br class=3D""></blockquote><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">--<span =
class=3D"Apple-converted-space">&nbsp;</span></span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">Thomas Zimmermann</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">Graphics Driver =
Developer</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">SUSE Software =
Solutions Germany GmbH</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">(HRB 36809, AG =
N=C3=BCrnberg)</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Gesch=C3=A4ftsf=C3=BChrer: Felix =
Imend=C3=B6rffer</span></div></blockquote></div><br =
class=3D""></body></html>=

--Apple-Mail=_DCD68940-031B-4C2D-BBAE-1D2D330BDA5E--

--===============0324873083==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0324873083==--
