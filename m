Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5ADE875A2
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 11:18:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3998C6ED90;
	Fri,  9 Aug 2019 09:18:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 736B26ED45
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 09:17:18 +0000 (UTC)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1hw11O-00022a-OS; Fri, 09 Aug 2019 11:17:14 +0200
Message-ID: <1565342233.2323.60.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/8] drm/etnaviv: split out cmdbuf mapping into
 address space
From: Lucas Stach <l.stach@pengutronix.de>
To: Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Date: Fri, 09 Aug 2019 11:17:13 +0200
In-Reply-To: <20190808102625.GA4681@bogon.m.sigxcpu.org>
References: <20190705171727.27501-1-l.stach@pengutronix.de>
 <20190705171727.27501-2-l.stach@pengutronix.de>
 <20190808102625.GA4681@bogon.m.sigxcpu.org>
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 patchwork-lst@pengutronix.de, kernel@pengutronix.de,
 Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gRG9ubmVyc3RhZywgZGVuIDA4LjA4LjIwMTksIDEyOjI2ICswMjAwIHNjaHJpZWIgR3VpZG8g
R8O8bnRoZXI6Cj4gSGksCj4gT24gRnJpLCBKdWwgMDUsIDIwMTkgYXQgMDc6MTc6MjFQTSArMDIw
MCwgTHVjYXMgU3RhY2ggd3JvdGU6Cj4gPiBUaGlzIGFsbG93cyB0byBkZWNvdXBsZSB0aGUgY21k
YnVmIHN1YmFsbG9jYXRvciBjcmVhdGUgYW5kIG1hcHBpbmcKPiA+IHRoZSByZWdpb24gaW50byB0
aGUgR1BVIGFkZHJlc3Mgc3BhY2UuIEFsbG93aW5nIG11bHRpcGxlIEFTIHRvIHNoYXJlCj4gPiBh
IHNpbmdsZSBjbWRidWYgc3ViYWxsb2MuCj4gPiAKPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBMdWNh
cyBTdGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5kZT4KPiA+IC0tLQo+ID4gwqBkcml2ZXJzL2dw
dS9kcm0vZXRuYXZpdi9ldG5hdml2X2J1ZmZlci5jIHwgMjMgKysrKy0tLS0KPiA+IMKgZHJpdmVy
cy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9jbWRidWYuYyB8IDM1ICsrKysrKy0tLS0tLQo+ID4g
wqBkcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2NtZGJ1Zi5oIHwgMTEgKysrLQo+ID4g
wqBkcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2R1bXAuY8KgwqDCoHzCoMKgNiArLQo+
ID4gwqBkcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dwdS5jwqDCoMKgwqB8IDE5ICsr
KysrLS0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9ncHUuaMKgwqDCoMKg
fMKgwqAzICstCj4gPiDCoGRyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfbW11LmPCoMKg
wqDCoHwgNzAgKysrKysrKysrKysrKysrLS0tLS0tLS0tCj4gPiDCoGRyaXZlcnMvZ3B1L2RybS9l
dG5hdml2L2V0bmF2aXZfbW11LmjCoMKgwqDCoHwgMTIgKystLQo+ID4gwqA4IGZpbGVzIGNoYW5n
ZWQsIDExNCBpbnNlcnRpb25zKCspLCA2NSBkZWxldGlvbnMoLSkKWy4uLl0KPiA+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfY21kYnVmLmMKPiA+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9ldG5hdml2L2V0bmF2aXZfY21kYnVmLmMKPiA+IEBAIC04LDYgKzgsNyBAQAo+ID4g
wqAjaW5jbHVkZSA8ZHJtL2RybV9tbS5oPgo+ID4gwqAKPiA+IMKgI2luY2x1ZGUgImV0bmF2aXZf
Y21kYnVmLmgiCj4gPiArI2luY2x1ZGUgImV0bmF2aXZfZ2VtLmgiCj4gPiDCoCNpbmNsdWRlICJl
dG5hdml2X2dwdS5oIgo+ID4gwqAjaW5jbHVkZSAiZXRuYXZpdl9tbXUuaCIKPiA+IMKgCj4gPiBA
QCAtMjEsMTAgKzIyLDYgQEAgc3RydWN0IGV0bmF2aXZfY21kYnVmX3N1YmFsbG9jIHsKPiA+ID4g
PiDCoAl2b2lkICp2YWRkcjsKPiA+ID4gPiDCoAlkbWFfYWRkcl90IHBhZGRyOwo+ID4gwqAKPiA+
ID4gPiAtCS8qIEdQVSBtYXBwaW5nICovCj4gPiA+ID4gLQl1MzIgaW92YTsKPiA+ID4gPiAtCXN0
cnVjdCBkcm1fbW1fbm9kZSB2cmFtX25vZGU7IC8qIG9ubHkgdXNlZCBvbiBNTVV2MiAqLwo+ID4g
LQo+ID4gPiA+IMKgCS8qIGFsbG9jYXRpb24gbWFuYWdlbWVudCAqLwo+ID4gPiA+IMKgCXN0cnVj
dCBtdXRleCBsb2NrOwo+ID4gPiA+IMKgCURFQ0xBUkVfQklUTUFQKGdyYW51bGVfbWFwLCBTVUJB
TExPQ19HUkFOVUxFUyk7Cj4gPiBAQCAtNTMsMjYgKzUwLDMxIEBAIGV0bmF2aXZfY21kYnVmX3N1
YmFsbG9jX25ldyhzdHJ1Y3QgZXRuYXZpdl9ncHUgKiBncHUpCj4gPiA+ID4gwqAJCWdvdG8gZnJl
ZV9zdWJhbGxvYzsKPiA+ID4gPiDCoAl9Cj4gPiDCoAo+ID4gPiA+IC0JcmV0ID0gZXRuYXZpdl9p
b21tdV9nZXRfc3ViYWxsb2NfdmEoZ3B1LCBzdWJhbGxvYy0+cGFkZHIsCj4gPiA+ID4gLQkJCQkJ
wqDCoMKgwqAmc3ViYWxsb2MtPnZyYW1fbm9kZSwgU1VCQUxMT0NfU0laRSwKPiA+ID4gPiAtCQkJ
CQnCoMKgwqDCoCZzdWJhbGxvYy0+aW92YSk7Cj4gPiA+ID4gLQlpZiAocmV0KQo+ID4gPiA+IC0J
CWdvdG8gZnJlZV9kbWE7Cj4gPiAtCj4gCj4gVGhpcyByZW1vdmVkIHJldCBhbGwgcmV0IHVzZXMg
aW4gdGhhdCBmdW5jdGlvbiBzbyB0aGUgZGVjbGFyYXRpb24gb2YgcmV0Cj4gY2FuIGJlIGRyb3Bw
ZWQgYXMgd2VsbC4KCkFjdHVhbGx5LCBuby4gcmV0IGlzIHN0aWxsIHVzZWQgaW4gdGhlIGFsbG9j
YXRpb24gZmFpbHVyZSBwYXRoLgoKUmVnYXJkcywKTHVjYXMKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
