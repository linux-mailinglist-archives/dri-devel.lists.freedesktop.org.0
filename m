Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0042AE4A9F
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 13:59:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 176446E9CA;
	Fri, 25 Oct 2019 11:58:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFD766E9CA
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 11:58:57 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9PBhi8N080218;
 Fri, 25 Oct 2019 11:58:31 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 2vqswu2ndw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Oct 2019 11:58:31 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9PBgdp3161155;
 Fri, 25 Oct 2019 11:58:30 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 2vuun11sx6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Oct 2019 11:58:30 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x9PBwRqZ015711;
 Fri, 25 Oct 2019 11:58:27 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 25 Oct 2019 04:58:26 -0700
Date: Fri, 25 Oct 2019 14:58:20 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Colin King <colin.king@canonical.com>, Eric Anholt <eric@anholt.net>,
 David Airlie <airlied@linux.ie>,
 Navid Emamdoost <navid.emamdoost@gmail.com>,
 Iago Toral Quiroga <itoral@igalia.com>,
 dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] drm/v3d: fix double free of bin
Message-ID: <20191025115819.GA7244@kadam>
References: <20191024104801.3122-1-colin.king@canonical.com>
 <20191024123853.GH11828@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191024123853.GH11828@phenom.ffwll.local>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9420
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910250113
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9420
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910250113
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=OVCm2Qs1zv8zur/SF5/gMRMvq8CDHixNh16CKJ09A4M=;
 b=c0AEcHuEeFS56V1Dwq3qmcf4y8ksHyi5aTw1xw3LyGzpVWhkUPCsV7j731WYVjMoutBB
 L54TFh2yfbz3d4SWv8/xVtK4Hx60r3jlRsxJYaxg6cFoyMP0qx0LTL47Pzg8/9jmdxIp
 c6ADv73cLEBsgk1OcxBGZaKPrRuiG1uovRTqBDC/52SmB7FyQVKihCxfqTWHaL1T9TY4
 Z7wnfX6w1wRGXVatp+QPMyF3tcGYCWEEzcgHqFo1MTyN7kKKViHrDGnxuaasWyJmECXa
 Znxv1vrvtjGC316xcHDeN9gb5ymvt/OcdKO9/aN9W2FiYChGIlWM2dN2un2rlM4/CwDg Eg== 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMjQsIDIwMTkgYXQgMDI6Mzg6NTNQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBUaHUsIE9jdCAyNCwgMjAxOSBhdCAxMTo0ODowMUFNICswMTAwLCBDb2xpbiBL
aW5nIHdyb3RlOgo+ID4gRnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2Fs
LmNvbT4KPiA+IAo+ID4gVHdvIGRpZmZlcmVudCBmaXhlcyBoYXZlIGFkZHJlc3NlZCB0aGUgc2Ft
ZSBtZW1vcnkgbGVhayBvZiBiaW4gYW5kCj4gPiB0aGlzIG5vdyBjYXVzZXMgYSBkb3VibGUgZnJl
ZSBvZiBiaW4uICBXaGlsZSB0aGUgaW5kaXZpZHVhbCBtZW1vcnkKPiA+IGxlYWsgZml4ZXMgYXJl
IGZpbmUsIGJvdGggZml4ZXMgdG9nZXRoZXIgYXJlIHByb2JsZW1hdGljLgo+ID4gCj4gPiBBZGRy
ZXNzZXMtQ292ZXJpdHk6ICgiRG91YmxlIGZyZWUiKQo+ID4gRml4ZXM6IDI5Y2QxM2NmZDc2MiAo
ImRybS92M2Q6IEZpeCBtZW1vcnkgbGVhayBpbiB2M2Rfc3VibWl0X2NsX2lvY3RsIikKPiA+IEZp
eGVzOiAwZDM1MmEzYThhMWYgKCIgcm0vdjNkOiBkb24ndCBsZWFrIGJpbiBqb2IgaWYgdjNkX2pv
Yl9pbml0IGZhaWxzLiIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4u
a2luZ0BjYW5vbmljYWwuY29tPgo+IAo+IFRoYXQgc291bmRzIGxpa2Ugd3JvbmcgbWVyZ2UgcmVz
b2x1dGlvbiBzb21ld2hlcmUsIGFuZCB3ZSBkb24ndCBoYXZlIHRob3NlCj4gcGF0Y2hlcyBtZXJn
ZWQgdG9nZXRoZXIgaW4gYW55IGZpbmFsIHRyZWUgeWV0IGFueXdoZXJlLiBXaGF0J3MgdGhpcyBi
YXNlZAo+IG9uPwo+IC1EYW5pZWwKCmxpbnV4LW5leHQuCgpJIHNlbnQgdGhpcyBmaXggdG8geW91
IGFuZCBTdGVwaGVuIFJvdGh3ZWxsIHllc3RlcmRheSBzbyB0aGlzIG9uZSBpcwpzb3J0ZWQgYWxy
ZWFkeS4gIFN0ZXBoZW4gd2lsbCBhcHBseSBteSBwYXRjaCB1bnRpbCB5b3UgZ3V5cyBtZXJnZSB5
b3VyCmRybSB0cmVlcy4KCnJlZ2FyZHMsCmRhbiBjYXJwZW50ZXIKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
