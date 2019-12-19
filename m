Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 528E1126B2A
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 19:55:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E51EA8996F;
	Thu, 19 Dec 2019 18:55:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 713418996F
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 18:55:02 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BC2B1222C2;
 Thu, 19 Dec 2019 18:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576781702;
 bh=lxiLAwc3bq7yRsFDpS8Y/vXlzk3A1s79z7n/XxmpgZU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M04HltVi8w1WzySTFYCLneYGnfUjHaeOgfGU4jXb075J3ZmGFIkKipVVZuMFlMeqS
 Shpd4BYLSo5gvTwCaJ1xSE008COi+3g+5EUt9+1KojMB0RTCADeWWJyr+YgLuzkRlv
 BpEX40ap6iWS1dfdblQ4NdEdxvqHHpI7YjVhc6GA=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5.4 46/80] drm/mgag200: Extract device type from flags
Date: Thu, 19 Dec 2019 19:34:38 +0100
Message-Id: <20191219183113.297293802@linuxfoundation.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191219183031.278083125@linuxfoundation.org>
References: <20191219183031.278083125@linuxfoundation.org>
User-Agent: quilt/0.66
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
Cc: John Donnelly <john.p.donnelly@oracle.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Dave Airlie <airlied@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Cgpjb21taXQgM2E4
YTVhYmExNDJhNDRlYWViYTBjYjBlYzFiNGE4ZjE3N2I1ZTU5YSB1cHN0cmVhbS4KCkFkZHMgYSBj
b252ZXJzaW9uIGZ1bmN0aW9uIHRoYXQgZXh0cmFjdHMgdGhlIGRldmljZSB0eXBlIGZyb20gdGhl
ClBDSSBpZC10YWJsZSBmbGFncy4gQWxsb3dzIGZvciBzdG9yaW5nIGFkZGl0aW9uYWwgaW5mb3Jt
YXRpb24gaW4gdGhlCm90aGVyIGZsYWcgYml0cy4KClNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1t
ZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgpGaXhlczogODFkYTg3ZjYzYTFlICgiZHJtOiBS
ZXBsYWNlIGRybV9nZW1fdnJhbV9wdXNoX3RvX3N5c3RlbSgpIHdpdGgga3VubWFwICsgdW5waW4i
KQpSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KQ2M6
IEpvaG4gRG9ubmVsbHkgPGpvaG4ucC5kb25uZWxseUBvcmFjbGUuY29tPgpDYzogR2VyZCBIb2Zm
bWFubiA8a3JheGVsQHJlZGhhdC5jb20+CkNjOiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQu
Y29tPgpDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVs
LmNvbT4KQ2M6IE1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz4KQ2M6IERhdmlkIEFp
cmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9y
Zz4KQ2M6IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+CkNjOiAiWS5D
LiBDaGVuIiA8eWNfY2hlbkBhc3BlZWR0ZWNoLmNvbT4KQ2M6IExhdXJlbnQgUGluY2hhcnQgPGxh
dXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KQ2M6ICJKb3PDqSBSb2JlcnRvIGRlIFNv
dXphIiA8am9zZS5zb3V6YUBpbnRlbC5jb20+CkNjOiBBbmRyemVqIFBpZXRyYXNpZXdpY3ogPGFu
ZHJ6ZWoucEBjb2xsYWJvcmEuY29tPgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+ICMgdjUuMysKTGluazogaHR0cHM6Ly9wYXRj
aHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoL21zZ2lkLzIwMTkxMTI2MTAxNTI5LjIwMzU2LTIt
dHppbW1lcm1hbm5Ac3VzZS5kZQpTaWduZWQtb2ZmLWJ5OiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdy
ZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgoKLS0tCiBkcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9t
Z2FnMjAwX2Rydi5oICB8ICAgIDcgKysrKysrKwogZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdh
ZzIwMF9tYWluLmMgfCAgICAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQoKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9kcnYu
aAorKysgYi9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2Rydi5oCkBAIC0xNTksNiAr
MTU5LDggQEAgZW51bSBtZ2FfdHlwZSB7CiAJRzIwMF9FVzMsCiB9OwogCisjZGVmaW5lIE1HQUcy
MDBfVFlQRV9NQVNLCSgweDAwMDAwMGZmKQorCiAjZGVmaW5lIElTX0cyMDBfU0UobWRldikgKG1k
ZXYtPnR5cGUgPT0gRzIwMF9TRV9BIHx8IG1kZXYtPnR5cGUgPT0gRzIwMF9TRV9CKQogCiBzdHJ1
Y3QgbWdhX2RldmljZSB7CkBAIC0xODgsNiArMTkwLDExIEBAIHN0cnVjdCBtZ2FfZGV2aWNlIHsK
IAl1MzIgdW5pcXVlX3Jldl9pZDsKIH07CiAKK3N0YXRpYyBpbmxpbmUgZW51bSBtZ2FfdHlwZQor
bWdhZzIwMF90eXBlX2Zyb21fZHJpdmVyX2RhdGEoa2VybmVsX3Vsb25nX3QgZHJpdmVyX2RhdGEp
Cit7CisJcmV0dXJuIChlbnVtIG1nYV90eXBlKShkcml2ZXJfZGF0YSAmIE1HQUcyMDBfVFlQRV9N
QVNLKTsKK30KIAkJCQkvKiBtZ2FnMjAwX21vZGUuYyAqLwogaW50IG1nYWcyMDBfbW9kZXNldF9p
bml0KHN0cnVjdCBtZ2FfZGV2aWNlICptZGV2KTsKIHZvaWQgbWdhZzIwMF9tb2Rlc2V0X2Zpbmko
c3RydWN0IG1nYV9kZXZpY2UgKm1kZXYpOwotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9t
Z2FnMjAwX21haW4uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX21haW4u
YwpAQCAtOTQsNyArOTQsNyBAQCBzdGF0aWMgaW50IG1nYWcyMDBfZGV2aWNlX2luaXQoc3RydWN0
IGRyCiAJc3RydWN0IG1nYV9kZXZpY2UgKm1kZXYgPSBkZXYtPmRldl9wcml2YXRlOwogCWludCBy
ZXQsIG9wdGlvbjsKIAotCW1kZXYtPnR5cGUgPSBmbGFnczsKKwltZGV2LT50eXBlID0gbWdhZzIw
MF90eXBlX2Zyb21fZHJpdmVyX2RhdGEoZmxhZ3MpOwogCiAJLyogSGFyZGNvZGUgdGhlIG51bWJl
ciBvZiBDUlRDcyB0byAxICovCiAJbWRldi0+bnVtX2NydGMgPSAxOwoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
