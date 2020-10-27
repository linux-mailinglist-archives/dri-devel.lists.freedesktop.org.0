Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB6A29CED0
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 09:08:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D3056EC54;
	Wed, 28 Oct 2020 08:07:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75B846E201
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 17:13:03 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09RH9FUx104729;
 Tue, 27 Oct 2020 17:12:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : message-id :
 content-type : mime-version : subject : date : in-reply-to : cc : to :
 references; s=corp-2020-01-29;
 bh=MXsgVm9bqO9SuUdITSigOmb5+jYKv5M6pmjyWwvwqg4=;
 b=SU1rSbM4aCS5x+RF2Wddq/XR3Wxk0reF8F92BUbVErif1NXep+XrPoi2KD3hclpnichM
 BipSNPUw887L6XVDFYVDiP1as1nYWs5lQ8zVARQhIwdJw5yMdvjpNDm/aydNlxzhr6j9
 7r2jNH+1HOy4hd/iaC5YNz/M/U6DjjsxmOLnZuWYajI8Soav02+ob+bONfAvcdkZrav6
 L21b4yuw7X5H0WAIaRAv9jGVbtwd2KnEyp6BGMwqX916fPPI7egFReDyu48bi1CHa4ys
 2eypc8q6jCrzXV3qDebGztMq3HyU8ysnmUK+xC2B5oARX3u+JyyIArpWoFNOb9FQVvX3 Qg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 34cc7kuatj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 27 Oct 2020 17:12:54 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09RHARdK149176;
 Tue, 27 Oct 2020 17:12:54 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 34cwumn85q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Oct 2020 17:12:54 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 09RHCp67032332;
 Tue, 27 Oct 2020 17:12:51 GMT
Received: from dhcp-10-159-231-98.vpn.oracle.com (/10.159.231.98)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 27 Oct 2020 10:12:51 -0700
From: Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>
Message-Id: <2DA9AE6D-93D6-4142-9FC4-EEACB92B7203@oracle.com>
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [PATCH 1/1] video: fbdev: fix divide error in fbcon_switch
Date: Tue, 27 Oct 2020 10:12:49 -0700
In-Reply-To: <20201027062217.GE206502@kroah.com>
To: Greg KH <gregkh@linuxfoundation.org>
References: <20201021235758.59993-1-saeed.mirzamohammadi@oracle.com>
 <ad87c5c1-061d-8a81-7b2c-43a8687a464f@suse.de>
 <3294C797-1BBB-4410-812B-4A4BB813F002@oracle.com>
 <20201027062217.GE206502@kroah.com>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9787
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxscore=0 bulkscore=0
 spamscore=0 adultscore=0 malwarescore=0 mlxlogscore=999 suspectscore=3
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010270103
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9787
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 adultscore=0
 malwarescore=0 spamscore=0 clxscore=1015 mlxscore=0 suspectscore=3
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010270103
X-Mailman-Approved-At: Wed, 28 Oct 2020 08:06:31 +0000
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
Content-Type: multipart/mixed; boundary="===============2041977017=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2041977017==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_D77B2E3B-01D6-43FF-A8BF-973C1E66EEF6"


--Apple-Mail=_D77B2E3B-01D6-43FF-A8BF-973C1E66EEF6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi Greg,

Sorry for the confusion. I=E2=80=99m requesting stable maintainers to =
cherry-pick this patch into stable 5.4 and 5.8.
commit cc07057c7c88fb8eff3b1991131ded0f0bcfa7e3
Author: Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>
Date:   Wed Oct 21 16:57:58 2020 -0700

    video: fbdev: fix divide error in fbcon_switch

Thanks,
Saeed


> On Oct 26, 2020, at 11:22 PM, Greg KH <gregkh@linuxfoundation.org> =
wrote:
>=20
> On Mon, Oct 26, 2020 at 10:00:11AM -0700, Saeed Mirzamohammadi wrote:
>> Thanks, adding stable.
>=20
> Why?  What are we supposed to do with this?


--Apple-Mail=_D77B2E3B-01D6-43FF-A8BF-973C1E66EEF6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D"">Hi =
Greg,<div class=3D""><br class=3D""></div><div class=3D"">Sorry for the =
confusion. I=E2=80=99m requesting stable maintainers to cherry-pick this =
patch into stable 5.4 and 5.8.</div><div class=3D""><h1 class=3D"" =
style=3D"box-sizing: border-box; margin: 20px 0px 10px; line-height: =
1.1; font-variant-ligatures: normal; orphans: 2; widows: 2; =
background-color: rgb(255, 255, 255);"><div style=3D"margin: 0px; =
font-weight: normal; font-stretch: normal; line-height: normal; color: =
rgb(159, 160, 28);" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures; font-size: 12px;" class=3D"">commit =
cc07057c7c88fb8eff3b1991131ded0f0bcfa7e3</span></div><div style=3D"margin:=
 0px; font-weight: normal; font-stretch: normal; line-height: normal;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures; =
font-size: 12px;" class=3D"">Author: Saeed Mirzamohammadi &lt;<a =
href=3D"mailto:saeed.mirzamohammadi@oracle.com" =
class=3D"">saeed.mirzamohammadi@oracle.com</a>&gt;</span></div><div =
style=3D"margin: 0px; font-weight: normal; font-stretch: normal; =
line-height: normal;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures; font-size: 12px;" class=3D"">Date: &nbsp; Wed Oct =
21 16:57:58 2020 -0700</span></div><div style=3D"margin: 0px; =
font-weight: normal; font-stretch: normal; line-height: normal; =
min-height: 21px;" class=3D""><span style=3D"font-size: 12px;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D""></span><br class=3D""></span></div><div style=3D"margin: 0px; =
font-weight: normal; font-stretch: normal; line-height: normal;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures; =
font-size: 12px;" class=3D"">&nbsp; &nbsp; video: fbdev: fix divide =
error in fbcon_switch</span></div><div class=3D""><br =
class=3D""></div></h1></div><div class=3D""><div =
class=3D"">Thanks,</div><div class=3D"">Saeed</div><div class=3D""><br =
class=3D""></div></div><div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D"">On Oct 26, 2020, at 11:22 PM, Greg KH &lt;<a =
href=3D"mailto:gregkh@linuxfoundation.org" =
class=3D"">gregkh@linuxfoundation.org</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div class=3D"">On =
Mon, Oct 26, 2020 at 10:00:11AM -0700, Saeed Mirzamohammadi wrote:<br =
class=3D""><blockquote type=3D"cite" class=3D"">Thanks, adding =
stable.<br class=3D""></blockquote><br class=3D"">Why? &nbsp;What are we =
supposed to do with this?<br class=3D""></div></div></blockquote></div><br=
 class=3D""></body></html>=

--Apple-Mail=_D77B2E3B-01D6-43FF-A8BF-973C1E66EEF6--

--===============2041977017==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2041977017==--
