Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9333329CE9A
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 09:06:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81A346E07B;
	Wed, 28 Oct 2020 08:06:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A1806E1CF
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 16:34:01 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09RGKWk2011655;
 Tue, 27 Oct 2020 16:33:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : message-id :
 content-type : mime-version : subject : date : in-reply-to : cc : to :
 references; s=corp-2020-01-29;
 bh=I7q2p2jRMn6HsHtmiM+IYEv8vqhICap8/epKjVMV+0E=;
 b=g1AOro9j9HRRd304FBtH9p7a9KJz/oTyJCD9ZEgeM20rMhffRMfDDpLCSaNviENyBlD4
 Xh+re99a3zjlDo7aAzD03ahLmKxostqNppiy5WB8x4mdPyu23tXv6W2kldZA1N9r2rez
 Hbgp2NLMCM3uXO5aIar04r5mCmHVfhe7xIb0qCgsbZ4Z+nmwXfYwyZ1sQhqin7uPGG4R
 cB/Wc/C1imiqJssnvtCoH+bFX59haN+a1sfXUfrUF0pVrb+eJViT9d9zOfnYLCanQ+zG
 kXQ4fP3azeD0ZSuNnp6Z0cUufcrAZ4lL1d294YYk8+AawEApUiEKy+o64rifZVtFCtjQ IA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 34dgm40qdc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 27 Oct 2020 16:33:51 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09RGKUDu168656;
 Tue, 27 Oct 2020 16:33:50 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 34cwumkunf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Oct 2020 16:33:50 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 09RGXmmM014159;
 Tue, 27 Oct 2020 16:33:48 GMT
Received: from dhcp-10-159-231-98.vpn.oracle.com (/10.159.231.98)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 27 Oct 2020 09:33:47 -0700
From: Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>
Message-Id: <0532C732-BD87-4E0D-A6D6-CB0926AEC0E1@oracle.com>
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [PATCH 1/1] video: fbdev: fix divide error in fbcon_switch
Date: Tue, 27 Oct 2020 09:33:44 -0700
In-Reply-To: <20201027062217.GE206502@kroah.com>
To: Greg KH <gregkh@linuxfoundation.org>, stable@vger.kernel.org
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
 definitions=main-2010270099
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9787
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 suspectscore=3 clxscore=1015 mlxscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010270099
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
 dri-devel@lists.freedesktop.org, gustavoars@kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, akpm@linux-foundation.org,
 rppt@kernel.org
Content-Type: multipart/mixed; boundary="===============0508443210=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0508443210==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_C44B9A7D-F6AE-4D9D-AFA4-575F843CD749"


--Apple-Mail=_C44B9A7D-F6AE-4D9D-AFA4-575F843CD749
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


--Apple-Mail=_C44B9A7D-F6AE-4D9D-AFA4-575F843CD749
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D"">Hi =
Greg,<div class=3D""><br class=3D""></div><div class=3D"">Sorry for the =
confusion. I=E2=80=99m requesting stable maintainers to cherry-pick this =
patch into stable 5.4 and 5.8. I=E2=80=99ll be more explicit.</div><div =
class=3D""><h1 class=3D"" style=3D"box-sizing: border-box; margin: 20px =
0px 10px; line-height: 1.1; font-variant-ligatures: normal; orphans: 2; =
widows: 2; background-color: rgb(255, 255, 255);"><span class=3D"" =
style=3D"color: rgb(51, 51, 51); font-weight: 500; font-size: =
12px;">Commit:&nbsp;<span class=3D"" style=3D"font-variant-ligatures: =
normal;">cc07057c7c88fb8eff3b1991131ded0f0bcfa7e3 ("</span></span><span =
class=3D"" style=3D"color: rgb(51, 51, 51); font-weight: 500; font-size: =
12px;">video: fbdev: fix divide error in&nbsp;</span><font =
color=3D"#333333" class=3D""><span class=3D"" style=3D"font-size: 12px; =
font-weight: 500;">fbcon_pswitch=E2=80=9D)</span></font></h1></div><div =
class=3D""><div class=3D""><br class=3D""></div><div =
class=3D"">Thanks,</div><div class=3D"">Saeed</div></div><div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D"">On Oct =
26, 2020, at 11:22 PM, Greg KH &lt;<a =
href=3D"mailto:gregkh@linuxfoundation.org" =
class=3D"">gregkh@linuxfoundation.org</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div class=3D"">On =
Mon, Oct 26, 2020 at 10:00:11AM -0700, Saeed Mirzamohammadi wrote:<br =
class=3D""><blockquote type=3D"cite" class=3D"">Thanks, adding =
stable.<br class=3D""></blockquote><br class=3D"">Why? &nbsp;What are we =
supposed to do with this?<br class=3D""></div></div></blockquote></div><br=
 class=3D""></body></html>=

--Apple-Mail=_C44B9A7D-F6AE-4D9D-AFA4-575F843CD749--

--===============0508443210==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0508443210==--
