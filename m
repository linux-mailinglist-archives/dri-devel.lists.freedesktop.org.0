Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD64B27E3
	for <lists+dri-devel@lfdr.de>; Sat, 14 Sep 2019 00:05:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F12A6F472;
	Fri, 13 Sep 2019 22:05:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BA676F46F;
 Fri, 13 Sep 2019 22:05:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1DC113CA19;
 Fri, 13 Sep 2019 22:05:14 +0000 (UTC)
Received: from malachite.bss.redhat.com (dhcp-10-20-1-34.bss.redhat.com
 [10.20.1.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1DC02600C6;
 Fri, 13 Sep 2019 22:05:10 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH 1/4] drm/nouveau: dispnv50: Don't create MSTMs for eDP
 connectors
Date: Fri, 13 Sep 2019 18:03:50 -0400
Message-Id: <20190913220355.6883-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Fri, 13 Sep 2019 22:05:14 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Ben Skeggs <bskeggs@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gdGhlIFRoaW5rUGFkIFA3MSwgd2UgaGF2ZSBvbmUgZURQIGNvbm5lY3RvciBleHBvc2VkIGFs
b25nIHdpdGggNSBEUApjb25uZWN0b3JzLCByZXN1bHRpbmcgaW4gYSB0b3RhbCBvZiAxMSBUTURT
IGVuY29kZXJzLiBTaW5jZSB0aGUgR1BVIG9uCnRoaXMgc3lzdGVtIGlzIGFsc28gY2FwYWJsZSBv
ZiBNU1QsIHdlIGNyZWF0ZSBhbiBhZGRpdGlvbmFsIDQgZmFrZSBNU1QKZW5jb2RlcnMgZm9yIGVh
Y2ggRFAgcG9ydC4gVW5mb3J0dW5hdGVseSwgd2UgYWxzbyBkbyB0aGlzIGZvciB0aGUgZURQCnBv
cnQgYXMgd2VsbCwgcmVzdWx0aW5nIGluOgoKICAxIGVEUCBwb3J0OiArMSBUTURTIGVuY29kZXIK
ICAgICAgICAgICAgICArNCBEUE1TVCBlbmNvZGVycwogIDUgRFAgcG9ydHM6ICsyIFRNRFMgZW5j
b2RlcnMKICAgICAgICAgICAgICArNCBEUE1TVCBlbmNvZGVycwoJICAgICAgKjUgcG9ydHMKCSAg
ICAgID09IDM1IGVuY29kZXJzCgpXaGljaCBicmVha3MgdGhpbmdzLCBzaW5jZSBEUk0gaGFzIGEg
aGFyZCBjb2RlZCBsaW1pdCBvZiAzMiBlbmNvZGVycy4KU28sIGZpeCB0aGlzIGJ5IG5vdCBjcmVh
dGluZyBNU1RNcyBmb3IgYW55IGVEUCBjb25uZWN0b3JzLiBUaGlzIGJyaW5ncwp1cyBkb3duIHRv
IDMxIGVuY29kZXJzLCBhbHRob3VnaCB3ZSBjYW4gZG8gYmV0dGVyLgoKVGhpcyBmaXhlcyBkcml2
ZXIgcHJvYmluZyBmb3Igbm91dmVhdSBvbiB0aGUgVGhpbmtQYWQgUDcxLgoKU2lnbmVkLW9mZi1i
eTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5v
cmcKLS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMgfCAzICsrLQog
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYyBiL2RyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYwppbmRleCAzMDc1ODQxMDdkNzcuLmI0NmJlOGEw
OTFlOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYwpAQCAtMTYwMyw3
ICsxNjAzLDggQEAgbnY1MF9zb3JfY3JlYXRlKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0
b3IsIHN0cnVjdCBkY2Jfb3V0cHV0ICpkY2JlKQogCQkJbnZfZW5jb2Rlci0+YXV4ID0gYXV4Owog
CQl9CiAKLQkJaWYgKChkYXRhID0gbnZiaW9zX2RwX3RhYmxlKGJpb3MsICZ2ZXIsICZoZHIsICZj
bnQsICZsZW4pKSAmJgorCQlpZiAobnZfY29ubmVjdG9yLT50eXBlICE9IERDQl9DT05ORUNUT1Jf
ZURQICYmCisJCSAgICAoZGF0YSA9IG52Ymlvc19kcF90YWJsZShiaW9zLCAmdmVyLCAmaGRyLCAm
Y250LCAmbGVuKSkgJiYKIAkJICAgIHZlciA+PSAweDQwICYmIChudmJpb3NfcmQwOChiaW9zLCBk
YXRhICsgMHgwOCkgJiAweDA0KSkgewogCQkJcmV0ID0gbnY1MF9tc3RtX25ldyhudl9lbmNvZGVy
LCAmbnZfY29ubmVjdG9yLT5hdXgsIDE2LAogCQkJCQkgICAgbnZfY29ubmVjdG9yLT5iYXNlLmJh
c2UuaWQsCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
