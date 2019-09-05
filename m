Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB14BA9A0F
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 07:23:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82DCE89CBE;
	Thu,  5 Sep 2019 05:23:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0BAB89CBE
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 05:23:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 343963090FD1;
 Thu,  5 Sep 2019 05:23:43 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-72.ams2.redhat.com
 [10.36.117.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE9AF60606;
 Thu,  5 Sep 2019 05:23:41 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 84C01784F; Thu,  5 Sep 2019 07:23:40 +0200 (CEST)
Date: Thu, 5 Sep 2019 07:23:40 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Chia-I Wu <olvaffe@gmail.com>
Subject: Re: [PATCH] drm/virtio: fix command submission with objects but
 without fence.
Message-ID: <20190905052340.gfwmzkqwcpxtvzvu@sirius.home.kraxel.org>
References: <20190904074828.32502-1-kraxel@redhat.com>
 <CAPaKu7RWiEr5n_DWcg0H2PPnRs9CUn-ZgQV3NYe8VrdZgEAhTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPaKu7RWiEr5n_DWcg0H2PPnRs9CUn-ZgQV3NYe8VrdZgEAhTQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Thu, 05 Sep 2019 05:23:43 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMDQsIDIwMTkgYXQgMDQ6MTA6MzBQTSAtMDcwMCwgQ2hpYS1JIFd1IHdyb3Rl
Ogo+IE9uIFdlZCwgU2VwIDQsIDIwMTkgYXQgMTI6NDggQU0gR2VyZCBIb2ZmbWFubiA8a3JheGVs
QHJlZGhhdC5jb20+IHdyb3RlOgo+ID4KPiA+IE9ubHkgY2FsbCB2aXJ0aW9fZ3B1X2FycmF5X2Fk
ZF9mZW5jZSBpZiB3ZSBhY3R1YWxseSBoYXZlIGEgZmVuY2UuCj4gPgo+ID4gRml4ZXM6IGRhNzU4
ZDUxOTY4YSAoImRybS92aXJ0aW86IHJld29yayB2aXJ0aW9fZ3B1X2V4ZWNidWZmZXJfaW9jdGwg
ZmVuY2luZyIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0
LmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV92cS5jIHwg
OSArKysrKy0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0
aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRn
cHVfdnEuYyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV92cS5jCj4gPiBpbmRleCA1
OTVmYTZlYzJkNTguLjdmZDI4NTFmN2I5NyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS92aXJ0aW8vdmlydGdwdV92cS5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3Zp
cnRncHVfdnEuYwo+ID4gQEAgLTMzOSwxMSArMzM5LDEyIEBAIHN0YXRpYyB2b2lkIHZpcnRpb19n
cHVfcXVldWVfZmVuY2VkX2N0cmxfYnVmZmVyKHN0cnVjdCB2aXJ0aW9fZ3B1X2RldmljZSAqdmdk
ZXYsCj4gPiAgICAgICAgICAgICAgICAgZ290byBhZ2FpbjsKPiA+ICAgICAgICAgfQo+ID4KPiA+
IC0gICAgICAgaWYgKGZlbmNlKQo+ID4gKyAgICAgICBpZiAoZmVuY2UpIHsKPiA+ICAgICAgICAg
ICAgICAgICB2aXJ0aW9fZ3B1X2ZlbmNlX2VtaXQodmdkZXYsIGhkciwgZmVuY2UpOwo+ID4gLSAg
ICAgICBpZiAodmJ1Zi0+b2Jqcykgewo+ID4gLSAgICAgICAgICAgICAgIHZpcnRpb19ncHVfYXJy
YXlfYWRkX2ZlbmNlKHZidWYtPm9ianMsICZmZW5jZS0+Zik7Cj4gPiAtICAgICAgICAgICAgICAg
dmlydGlvX2dwdV9hcnJheV91bmxvY2tfcmVzdih2YnVmLT5vYmpzKTsKPiA+ICsgICAgICAgICAg
ICAgICBpZiAodmJ1Zi0+b2Jqcykgewo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgdmlydGlv
X2dwdV9hcnJheV9hZGRfZmVuY2UodmJ1Zi0+b2JqcywgJmZlbmNlLT5mKTsKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgIHZpcnRpb19ncHVfYXJyYXlfdW5sb2NrX3Jlc3YodmJ1Zi0+b2Jqcyk7
Cj4gPiArICAgICAgICAgICAgICAgfQo+IFRoaXMgbGVha3Mgd2hlbiBmZW5jZSA9PSBOVUxMIGFu
ZCB2YnVmLT5vYmpzICE9IE5VTEwgKHdoaWNoIGNhbiByZWFsbHkKPiBoYXBwZW4gSUlSQy4uLiBu
b3QgYXQgbXkgZGVzayB0byBjaGVjaykuCgpZZXMsIGl0IGNhbiBoYXBwZW4sIGZvciBleGFtcGxl
IHdoZW4gZmx1c2hpbmcgZHVtYiBidWZmZXJzLgoKQnV0IEkgZG9uJ3QgdGhpbmsgd2UgbGVhayBp
biB0aGlzIGNhc2UuICBUaGUgY29kZSBwYXRocyB3aGljaCBkb24ndCBuZWVkCmEgZmVuY2UgYWxz
byBkbyBub3QgY2FsbCB2aXJ0aW9fZ3B1X2FycmF5X2xvY2tfcmVzdigpLCBzbyB0aGluZ3MgYXJl
CmJhbGFuY2VkLiAgVGhlIGFjdHVhbCByZWxlYXNlIG9mIHRoZSBvYmpzIGhhcHBlbnMgaW4Kdmly
dGlvX2dwdV9kZXF1ZXVlX2N0cmxfZnVuYygpIHZpYSB2aXJ0aW9fZ3B1X2FycmF5X3B1dF9mcmVl
X2RlbGF5ZWQoKS4KCmNoZWVycywKICBHZXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
