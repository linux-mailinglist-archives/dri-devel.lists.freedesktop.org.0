Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F80C35CE
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 15:35:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11EDB89D63;
	Tue,  1 Oct 2019 13:35:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB34089D63
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 13:35:14 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x91DXiR3058353;
 Tue, 1 Oct 2019 13:35:00 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 2va05rntuv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 01 Oct 2019 13:35:00 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x91DXZLj116417;
 Tue, 1 Oct 2019 13:34:59 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 2vbsm2048s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 01 Oct 2019 13:34:59 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x91DYq9J004937;
 Tue, 1 Oct 2019 13:34:53 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 01 Oct 2019 06:34:52 -0700
Date: Tue, 1 Oct 2019 16:34:43 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Navid Emamdoost <navid.emamdoost@gmail.com>
Subject: Re: [PATCH] Staging: fbtft: fix memory leak in fbtft_framebuffer_alloc
Message-ID: <20191001133408.GG22609@kadam>
References: <20190930030949.28615-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190930030949.28615-1-navid.emamdoost@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9396
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910010123
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9396
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910010123
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=2S6v0Da0UQZgNufjPiiwLYA37zV4TkfepApDSqjUYWM=;
 b=MkmSdRxckjXVch/Lb4V5fl6dWFO1n6k24LEg/MHve2pTIE8NKgqipnzP+PK51UQLisPT
 nb1dJ+eBDCTaUNmlO03g7I7A3maiFvx0rDDmXF4zoohocPSZ1XRpBTGzEmmEGsMKLIa1
 ycaCAlB5+jLCHjLJvYFGVT6dme359igny3P7+xCCMRPeAjUBNCReE2Ktx3Jrg176f1Ro
 aRfAXAmXWysgJdKK9ZYH7ug+djbZRAI+SY0GOD7OWk+Dk4l0J9loTm9Y9tQ+srMpn0L5
 LzrFhOe6ycli7WaNrXqHcpk1fg8Q6UbeKE29LCyX2rngRDuJvdMybm23h+hLFVBGwHp4 Uw== 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Jan Sebastian =?iso-8859-1?Q?G=F6tte?= <linux@jaseg.net>,
 devel@driverdev.osuosl.org, linux-fbdev@vger.kernel.org,
 Nishad Kamdar <nishadkamdar@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, smccaman@umn.edu,
 kjlu@umn.edu, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 emamd001@umn.edu, Bhanusree Pola <bhanusreemahesh@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Phil Reid <preid@electromag.com.au>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBTZXAgMjksIDIwMTkgYXQgMTA6MDk6NDVQTSAtMDUwMCwgTmF2aWQgRW1hbWRvb3N0
IHdyb3RlOgo+IEluIGZidGZ0X2ZyYW1lYnVmZmVyX2FsbG9jIHRoZSBlcnJvciBoYW5kbGluZyBw
YXRoIHNob3VsZCB0YWtlIGNhcmUgb2YKPiByZWxlYXNpbmcgZnJhbWUgYnVmZmVyIGFmdGVyIGl0
IGlzIGFsbG9jYXRlZCB2aWEgZnJhbWVidWZmZXJfYWxsb2MsIHRvby4KPiBUaGVyZWZvcmUsIGlu
IHR3byBmYWlsdXJlIGNhc2VzIHRoZSBnb3RvIGRlc3RpbmF0aW9uIGlzIGNoYW5nZWQgdG8KPiBh
ZGRyZXNzIHRoaXMgaXNzdWUuCj4gCj4gRml4ZXM6IGMyOTZkNWY5OTU3YyAoInN0YWdpbmc6IGZi
dGZ0OiBjb3JlIHN1cHBvcnQiKQo+IFNpZ25lZC1vZmYtYnk6IE5hdmlkIEVtYW1kb29zdCA8bmF2
aWQuZW1hbWRvb3N0QGdtYWlsLmNvbT4KCkxvb2tzIGdvb2QuCgpSZXZpZXdlZC1ieTogRGFuIENh
cnBlbnRlciA8ZGFuLmNhcnBlbnRlckBnbWFpbC5jb20+CgpyZWdhcmRzLApkYW4gY2FycGVudGVy
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
