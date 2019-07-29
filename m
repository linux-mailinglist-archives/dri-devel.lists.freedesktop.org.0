Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C6878F71
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 17:36:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27DAF6E027;
	Mon, 29 Jul 2019 15:36:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C582389FDB
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2019 15:36:03 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1hs7gv-00030z-J3; Mon, 29 Jul 2019 17:36:01 +0200
Message-ID: <1564414561.7633.10.camel@pengutronix.de>
Subject: Re: [PATCH v2 6/8] drm/etnaviv: split out starting of FE idle loop
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Lucas Stach <l.stach@pengutronix.de>, etnaviv@lists.freedesktop.org
Date: Mon, 29 Jul 2019 17:36:01 +0200
In-Reply-To: <20190705171727.27501-6-l.stach@pengutronix.de>
References: <20190705171727.27501-1-l.stach@pengutronix.de>
 <20190705171727.27501-6-l.stach@pengutronix.de>
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
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
Cc: Russell King <linux+etnaviv@armlinux.org.uk>,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDE5LTA3LTA1IGF0IDE5OjE3ICswMjAwLCBMdWNhcyBTdGFjaCB3cm90ZToKPiBN
b3ZlIGJ1ZmZlciBzZXR1cCBhbmQgc3RhcnRpbmcgb2YgdGhlIEZFIGxvb3AgaW4gdGhlIGtlcm5l
bCByaW5nYnVmZmVyCj4gaW50byBhIHNlcGFyYXRlIGZ1bmN0aW9uLiBUaGlzIGlzIGEgcHJlcGFy
YXRpb24gdG8gc3RhcnQgdGhlIEZFIGxhdGVyCj4gaW4gdGhlIHN1Ym1pdCBwcm9jZXNzLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4LmRlPgo+IC0t
LQo+ICBkcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dwdS5jIHwgMjYgKysrKysrKysr
KysrKysrKy0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDEw
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9l
dG5hdml2X2dwdS5jIGIvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9ncHUuYwo+IGlu
ZGV4IGE1M2ZlY2QxN2ZhOS4uYjQ2ZDgyMDdmNmU2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9ldG5hdml2L2V0bmF2aXZfZ3B1LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZXRuYXZp
di9ldG5hdml2X2dwdS5jCj4gQEAgLTYwMCw2ICs2MDAsMjAgQEAgdm9pZCBldG5hdml2X2dwdV9z
dGFydF9mZShzdHJ1Y3QgZXRuYXZpdl9ncHUgKmdwdSwgdTMyIGFkZHJlc3MsIHUxNiBwcmVmZXRj
aCkKPiAgCX0KPiAgfQo+ICAKPiArc3RhdGljIHZvaWQgZXRuYXZpdl9ncHVfc3RhcnRfZmVfaWRs
ZWxvb3Aoc3RydWN0IGV0bmF2aXZfZ3B1ICpncHUpCj4gK3sKPiArCXUzMiBhZGRyZXNzID0gZXRu
YXZpdl9jbWRidWZfZ2V0X3ZhKCZncHUtPmJ1ZmZlciwgJmdwdS0+Y21kYnVmX21hcHBpbmcpOwo+
ICsJdTE2IHByZWZldGNoOwo+ICsKPiArCS8qIHNldHVwIHRoZSBNTVUgKi8KPiArCWV0bmF2aXZf
aW9tbXVfcmVzdG9yZShncHUsIGdwdS0+bW11KTsKPiArCj4gKwkvKiBTdGFydCBjb21tYW5kIHBy
b2Nlc3NvciAqLwo+ICsJcHJlZmV0Y2ggPSBldG5hdml2X2J1ZmZlcl9pbml0KGdwdSk7Cj4gKwo+
ICsJZXRuYXZpdl9ncHVfc3RhcnRfZmUoZ3B1LCBhZGRyZXNzLCBwcmVmZXRjaCk7Cj4gK30KPiAr
Cj4gIHN0YXRpYyB2b2lkIGV0bmF2aXZfZ3B1X3NldHVwX3B1bHNlX2VhdGVyKHN0cnVjdCBldG5h
dml2X2dwdSAqZ3B1KQo+ICB7Cj4gIAkvKgo+IEBAIC02MzMsOCArNjQ3LDYgQEAgc3RhdGljIHZv
aWQgZXRuYXZpdl9ncHVfc2V0dXBfcHVsc2VfZWF0ZXIoc3RydWN0IGV0bmF2aXZfZ3B1ICpncHUp
Cj4gIAo+ICBzdGF0aWMgdm9pZCBldG5hdml2X2dwdV9od19pbml0KHN0cnVjdCBldG5hdml2X2dw
dSAqZ3B1KQo+ICB7Cj4gLQl1MTYgcHJlZmV0Y2g7Cj4gLQo+ICAJaWYgKChldG5hdml2X2lzX21v
ZGVsX3JldihncHUsIEdDMzIwLCAweDUwMDcpIHx8Cj4gIAkgICAgIGV0bmF2aXZfaXNfbW9kZWxf
cmV2KGdwdSwgR0MzMjAsIDB4NTIyMCkpICYmCj4gIAkgICAgZ3B1X3JlYWQoZ3B1LCBWSVZTX0hJ
X0NISVBfVElNRSkgIT0gMHgyMDYyNDAwKSB7Cj4gQEAgLTY4MCwxNSArNjkyLDkgQEAgc3RhdGlj
IHZvaWQgZXRuYXZpdl9ncHVfaHdfaW5pdChzdHJ1Y3QgZXRuYXZpdl9ncHUgKmdwdSkKPiAgCS8q
IHNldHVwIHRoZSBwdWxzZSBlYXRlciAqLwo+ICAJZXRuYXZpdl9ncHVfc2V0dXBfcHVsc2VfZWF0
ZXIoZ3B1KTsKPiAgCj4gLQkvKiBzZXR1cCB0aGUgTU1VICovCj4gLQlldG5hdml2X2lvbW11X3Jl
c3RvcmUoZ3B1LCBncHUtPm1tdSk7Cj4gLQo+IC0JLyogU3RhcnQgY29tbWFuZCBwcm9jZXNzb3Ig
Ki8KPiAtCXByZWZldGNoID0gZXRuYXZpdl9idWZmZXJfaW5pdChncHUpOwo+IC0KPiAgCWdwdV93
cml0ZShncHUsIFZJVlNfSElfSU5UUl9FTkJMLCB+MFUpOwo+IC0JZXRuYXZpdl9ncHVfc3RhcnRf
ZmUoZ3B1LCBldG5hdml2X2NtZGJ1Zl9nZXRfdmEoJmdwdS0+YnVmZmVyLAo+IC0JCQkgICAgICZn
cHUtPmNtZGJ1Zl9tYXBwaW5nKSwgcHJlZmV0Y2gpOwo+ICsKPiArCWV0bmF2aXZfZ3B1X3N0YXJ0
X2ZlX2lkbGVsb29wKGdwdSk7Cj4gIH0KPiAgCj4gIGludCBldG5hdml2X2dwdV9pbml0KHN0cnVj
dCBldG5hdml2X2dwdSAqZ3B1KQoKUmV2aWV3ZWQtYnk6IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxA
cGVuZ3V0cm9uaXguZGU+CgpyZWdhcmRzClBoaWxpcHAKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
