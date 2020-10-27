Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FC029CEB5
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 09:07:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CCD36E49B;
	Wed, 28 Oct 2020 08:06:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 11912 seconds by postgrey-1.36 at gabe;
 Tue, 27 Oct 2020 19:41:28 UTC
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 660696E081
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 19:41:28 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09RGJOUO110334;
 Tue, 27 Oct 2020 16:22:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : message-id :
 content-type : mime-version : subject : date : in-reply-to : cc : to :
 references; s=corp-2020-01-29;
 bh=RraPsPchjYko1rN7AqDrq+xfb3+rtyb4aQ3acwGbWtw=;
 b=gFIWNJWgvwhTehNJOK99XtUuKI0KREiQjydqOEmXmU92j+Fnd6h5+moqNuN2c75iYFPx
 9AjFefZiYQ3KuhRDWgVCHOzNH7PlyGM4xfjOVOwvd57yolp7zl5+tc9PmTymkWqAYhpd
 8K6A4K/UnkClEDUOTCD/C42ULaCOGL4gWQ/2QcxlCScX3nAHcRa7jnHJ4LUFtS5mhQrh
 S1iHLUFoApnEoJjMgLI1GDt7vOgLGxxN5knbwMmnnLFDXP4Zi5N+XKeVBVg9LNy48byZ
 oysW59HkFJTR1sn6OA2FvnyPQtrDGxSyYYrHfRprMeUWjXweyolObMbxEUYOqT5u8mPx xw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 34c9sau6nu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 27 Oct 2020 16:22:44 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09RGLKOv096743;
 Tue, 27 Oct 2020 16:22:43 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 34cx6w6eap-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Oct 2020 16:22:43 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 09RGMfDe007629;
 Tue, 27 Oct 2020 16:22:42 GMT
Received: from dhcp-10-159-231-98.vpn.oracle.com (/10.159.231.98)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 27 Oct 2020 09:22:41 -0700
From: Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>
Message-Id: <3871E7E7-518B-460C-8CFE-8E302BF5EF80@oracle.com>
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [PATCH 1/1] video: fbdev: fix divide error in fbcon_switch
Date: Tue, 27 Oct 2020 09:22:37 -0700
In-Reply-To: <20201027062217.GE206502@kroah.com>
To: Greg KH <gregkh@linuxfoundation.org>
References: <20201021235758.59993-1-saeed.mirzamohammadi@oracle.com>
 <ad87c5c1-061d-8a81-7b2c-43a8687a464f@suse.de>
 <3294C797-1BBB-4410-812B-4A4BB813F002@oracle.com>
 <20201027062217.GE206502@kroah.com>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9787
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 spamscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 suspectscore=3
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010270099
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9787
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 impostorscore=0
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1011 suspectscore=3
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010270099
X-Mailman-Approved-At: Wed, 28 Oct 2020 08:06:30 +0000
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
 jani.nikula@intel.com, daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, gustavoars@kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, akpm@linux-foundation.org,
 rppt@kernel.org
Content-Type: multipart/mixed; boundary="===============0341192864=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0341192864==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_87DB7CFD-6FE1-4D87-891F-FB912B95A2F7"


--Apple-Mail=_87DB7CFD-6FE1-4D87-891F-FB912B95A2F7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi Greg,

Sorry for the confusion. I=E2=80=99m requesting stable maintainers to =
cherry-pick this patch into stable 5.4 and 5.8. I=E2=80=99ll be more =
explicit.
Commit: cc07057c7c88fb8eff3b1991131ded0f0bcfa7e3 ("video: fbdev: fix =
divide error in fbcon_pswitch=E2=80=9D)

Thanks,
Saeed

> On Oct 26, 2020, at 11:22 PM, Greg KH <gregkh@linuxfoundation.org> =
wrote:
>=20
> On Mon, Oct 26, 2020 at 10:00:11AM -0700, Saeed Mirzamohammadi wrote:
>> Thanks, adding stable.
>=20
> Why?  What are we supposed to do with this?


--Apple-Mail=_87DB7CFD-6FE1-4D87-891F-FB912B95A2F7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D"">Hi =
Greg,<div class=3D""><br class=3D""></div><div class=3D"">Sorry for the =
confusion. I=E2=80=99m requesting stable maintainers to cherry-pick this =
patch into stable 5.4 and 5.8. I=E2=80=99ll be more explicit.</div><div =
class=3D""><h1 style=3D"box-sizing: border-box; margin: 20px 0px 10px; =
line-height: 1.1; font-variant-ligatures: normal; orphans: 2; widows: 2; =
background-color: rgb(255, 255, 255);" class=3D""><span style=3D"color: =
rgb(51, 51, 51); font-weight: 500; font-size: 12px;" =
class=3D"">Commit:&nbsp;<span style=3D"font-variant-ligatures: normal;" =
class=3D"">cc07057c7c88fb8eff3b1991131ded0f0bcfa7e3 =
("</span></span><span style=3D"color: rgb(51, 51, 51); font-weight: 500; =
font-size: 12px;" class=3D"">video: fbdev: fix divide error =
in&nbsp;</span><font color=3D"#333333" class=3D""><span =
style=3D"font-size: 12px; font-weight: 500;" =
class=3D"">fbcon_pswitch=E2=80=9D)</span></font></h1></div><div =
class=3D""><div><br =
class=3D""></div><div>Thanks,</div><div>Saeed</div><div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D"">On Oct =
26, 2020, at 11:22 PM, Greg KH &lt;<a =
href=3D"mailto:gregkh@linuxfoundation.org" =
class=3D"">gregkh@linuxfoundation.org</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div class=3D"">On =
Mon, Oct 26, 2020 at 10:00:11AM -0700, Saeed Mirzamohammadi wrote:<br =
class=3D""><blockquote type=3D"cite" class=3D"">Thanks, adding =
stable.<br class=3D""></blockquote><br class=3D"">Why? &nbsp;What are we =
supposed to do with this?<br class=3D""></div></div></blockquote></div><br=
 class=3D""></div></body></html>=

--Apple-Mail=_87DB7CFD-6FE1-4D87-891F-FB912B95A2F7--

--===============0341192864==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0341192864==--
