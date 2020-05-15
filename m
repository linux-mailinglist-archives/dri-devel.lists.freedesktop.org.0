Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA56A1D4B15
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 12:33:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CEE16EC69;
	Fri, 15 May 2020 10:33:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 600036EC6A
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 10:33:31 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=localhost)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1jZXeg-00074l-0A; Fri, 15 May 2020 12:33:26 +0200
Message-ID: <ed4688343e443ff76644051be544c70fd8c5345b.camel@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: fix perfmon domain interation
From: Lucas Stach <l.stach@pengutronix.de>
To: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Fri, 15 May 2020 12:33:24 +0200
In-Reply-To: <CAH9NwWc6zUvoJ0xep9zO2Ocm8BzR7nRNx9=EQuwb5DXsX-J0Zw@mail.gmail.com>
References: <20200511123846.96594-1-christian.gmeiner@gmail.com>
 <CAH9NwWcJNhUVkzd0KAfJyxNZJ9a71KLzipW+qRwhgEWUmnnxmg@mail.gmail.com>
 <X0BDAQ.L99CTJZCDEJE3@crapouillou.net>
 <a51cb70623c4c2441bb8df8385f56c99392b8435.camel@pengutronix.de>
 <CAH9NwWc6zUvoJ0xep9zO2Ocm8BzR7nRNx9=EQuwb5DXsX-J0Zw@mail.gmail.com>
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 stable@vger.kernel.org, The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Paul Cercueil <paul@crapouillou.net>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gRnJlaXRhZywgZGVuIDE1LjA1LjIwMjAsIDEyOjI3ICswMjAwIHNjaHJpZWIgQ2hyaXN0aWFu
IEdtZWluZXI6Cj4gQW0gRnIuLCAxNS4gTWFpIDIwMjAgdW0gMTI6MjQgVWhyIHNjaHJpZWIgTHVj
YXMgU3RhY2ggPGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU+Ogo+ID4gQW0gRnJlaXRhZywgZGVuIDE1
LjA1LjIwMjAsIDEyOjEyICswMjAwIHNjaHJpZWIgUGF1bCBDZXJjdWVpbDoKPiA+ID4gSGkgQ2hy
aXN0aWFuLAo+ID4gPiAKPiA+ID4gTGUgdmVuLiAxNSBtYWkgMjAyMCDDoCAxMjowOSwgQ2hyaXN0
aWFuIEdtZWluZXIKPiA+ID4gPGNocmlzdGlhbi5nbWVpbmVyQGdtYWlsLmNvbT4gYSDDqWNyaXQg
Ogo+ID4gPiA+IEFtIE1vLiwgMTEuIE1haSAyMDIwIHVtIDE0OjM4IFVociBzY2hyaWViIENocmlz
dGlhbiBHbWVpbmVyCj4gPiA+ID4gPGNocmlzdGlhbi5nbWVpbmVyQGdtYWlsLmNvbT46Cj4gPiA+
ID4gPiAgVGhlIEdDODYwIGhhcyBvbmUgR1BVIGRldmljZSB3aGljaCBoYXMgYSAyZCBhbmQgM2Qg
Y29yZS4gSW4gdGhpcwo+ID4gPiA+ID4gY2FzZQo+ID4gPiA+ID4gIHdlIHdhbnQgdG8gZXhwb3Nl
IHBlcmZtb24gaW5mb3JtYXRpb24gZm9yIGJvdGggY29yZXMuCj4gPiA+ID4gPiAKPiA+ID4gPiA+
ICBUaGUgZHJpdmVyIGhhcyBvbmUgYXJyYXkgd2hpY2ggY29udGFpbnMgYWxsIHBvc3NpYmxlIHBl
cmZtb24gZG9tYWlucwo+ID4gPiA+ID4gIHdpdGggc29tZSBtZXRhIGRhdGEgLSBkb21zX21ldGEu
IEhlcmUgd2UgY2FuIHNlZSB0aGF0IGZvciB0aGUgR0M4NjAKPiA+ID4gPiA+ICB0d28gZWxlbWVu
dHMgb2YgdGhhdCBhcnJheSBhcmUgcmVsZXZhbnQ6Cj4gPiA+ID4gPiAKPiA+ID4gPiA+ICAgIGRv
bXNfM2Q6IGlzIGF0IGluZGV4IDAgaW4gdGhlIGRvbXNfbWV0YSBhcnJheSB3aXRoIDggcGVyZm1v
bgo+ID4gPiA+ID4gZG9tYWlucwo+ID4gPiA+ID4gICAgZG9tc18yZDogaXMgYXQgaW5kZXggMSBp
biB0aGUgZG9tc19tZXRhIGFycmF5IHdpdGggMSBwZXJmbW9uCj4gPiA+ID4gPiBkb21haW4KPiA+
ID4gPiA+IAo+ID4gPiA+ID4gIFRoZSB1c2Vyc3BhY2UgZHJpdmVyIHdhbnRzIHRvIGdldCBhIGxp
c3Qgb2YgYWxsIHBlcmZtb24gZG9tYWlucyBhbmQKPiA+ID4gPiA+ICB0aGVpciBwZXJmbW9uIHNp
Z25hbHMuIFRoaXMgaXMgZG9uZSBieSBpdGVyYXRpbmcgb3ZlciBhbGwgZG9tYWlucwo+ID4gPiA+
ID4gYW5kCj4gPiA+ID4gPiAgdGhlaXIgc2lnbmFscy4gSWYgdGhlIHVzZXJzcGFjZSBkcml2ZXIg
d2FudHMgdG8gYWNjZXNzIHRoZSBkb21haW4KPiA+ID4gPiA+IHdpdGgKPiA+ID4gPiA+ICBpZCA4
IHRoZSBrZXJuZWwgZHJpdmVyIGZhaWxzIGFuZCByZXR1cm5zIGludmFsaWQgZGF0YSBmcm9tIGRv
bXNfM2QKPiA+ID4gPiA+IHdpdGgKPiA+ID4gPiA+ICBhbmQgaW52YWxpZCBvZmZzZXQuCj4gPiA+
ID4gPiAKPiA+ID4gPiA+ICBUaGlzIHJlc3VsdHMgaW46Cj4gPiA+ID4gPiAgICBVbmFibGUgdG8g
aGFuZGxlIGtlcm5lbCBwYWdpbmcgcmVxdWVzdCBhdCB2aXJ0dWFsIGFkZHJlc3MgMDAwMDAwMDAK
PiA+ID4gPiA+IAo+ID4gPiA+ID4gIE9uIHN1Y2ggYSBkZXZpY2UgaXQgaXMgbm90IHBvc3NpYmxl
IHRvIHVzZSB0aGUgdXNlcnNwYWNlIGRyaXZlciBhdAo+ID4gPiA+ID4gYWxsLgo+ID4gPiA+ID4g
Cj4gPiA+ID4gPiAgVGhlIGZpeCBmb3IgdGhpcyBvZmYtYnktb25lIGVycm9yIGlzIHF1aXRlIHNp
bXBsZS4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gIFJlcG9ydGVkLWJ5OiBQYXVsIENlcmN1ZWlsIDxw
YXVsQGNyYXBvdWlsbG91Lm5ldD4KPiA+ID4gPiA+ICBUZXN0ZWQtYnk6IFBhdWwgQ2VyY3VlaWwg
PHBhdWxAY3JhcG91aWxsb3UubmV0Pgo+ID4gPiA+ID4gIEZpeGVzOiBlZDFkZDg5OWJhYTMgKCJk
cm0vZXRuYXZpdjogcmV3b3JrIHBlcmZtb24gcXVlcnkKPiA+ID4gPiA+IGluZnJhc3RydWN0dXJl
IikKPiA+ID4gPiA+ICBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+ID4gPiA+ID4gIFNpZ25l
ZC1vZmYtYnk6IENocmlzdGlhbiBHbWVpbmVyIDxjaHJpc3RpYW4uZ21laW5lckBnbWFpbC5jb20+
Cj4gPiA+ID4gPiAgLS0tCj4gPiA+ID4gPiAgIGRyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2
aXZfcGVyZm1vbi5jIHwgMiArLQo+ID4gPiA+ID4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKPiA+ID4gPiA+IAo+ID4gPiA+ID4gIGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X3BlcmZtb24uYwo+ID4gPiA+ID4gYi9kcml2
ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X3BlcmZtb24uYwo+ID4gPiA+ID4gIGluZGV4IGU2
Nzk1YmFmY2JiOS4uMzVmNzE3MWU3NzlhIDEwMDY0NAo+ID4gPiA+ID4gIC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9ldG5hdml2L2V0bmF2aXZfcGVyZm1vbi5jCj4gPiA+ID4gPiAgKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9wZXJmbW9uLmMKPiA+ID4gPiA+ICBAQCAtNDUzLDcg
KzQ1Myw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZXRuYXZpdl9wbV9kb21haW4KPiA+ID4gPiA+
ICpwbV9kb21haW4oY29uc3Qgc3RydWN0IGV0bmF2aXZfZ3B1ICpncHUsCj4gPiA+ID4gPiAgICAg
ICAgICAgICAgICAgIGlmICghKGdwdS0+aWRlbnRpdHkuZmVhdHVyZXMgJiBtZXRhLT5mZWF0dXJl
KSkKPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiA+ID4gPiA+
IAo+ID4gPiA+ID4gIC0gICAgICAgICAgICAgICBpZiAobWV0YS0+bnJfZG9tYWlucyA8IChpbmRl
eCAtIG9mZnNldCkpIHsKPiA+ID4gPiA+ICArICAgICAgICAgICAgICAgaWYgKChtZXRhLT5ucl9k
b21haW5zIC0gMSkgPCAoaW5kZXggLSBvZmZzZXQpKSB7Cj4gPiA+ID4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgb2Zmc2V0ICs9IG1ldGEtPm5yX2RvbWFpbnM7Cj4gPiA+ID4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gPiA+ID4gPiAgICAgICAgICAgICAgICAgIH0K
PiA+ID4gPiA+ICAtLQo+ID4gPiA+ID4gIDIuMjYuMgo+ID4gPiA+ID4gCj4gPiA+ID4gCj4gPiA+
ID4gcGluZwo+ID4gPiAKPiA+ID4gSSdsbCBtZXJnZSBpdCB0b21vcnJvdyBpZiB0aGVyZSdzIG5v
IGZ1cnRoZXIgZmVlZGJhY2suCj4gPiAKPiA+IEh1aD8gRXRuYXZpdiBwYXRjaGVzIGFyZSBnb2lu
ZyB0aHJvdWdoIHRoZSBldG5hdml2IHRyZWUuCj4gPiAKPiA+IFdlIG5vdyBoYXZlIHR3byBkaWZm
ZXJlbnQgc29sdXRpb25zIHRvIHRoZSBzYW1lIGlzc3VlLiBJIGZpcnN0IHdhbnQgdG8KPiA+IGRp
ZyBpbnRvIHRoZSBjb2RlIHRvIHNlZSB3aHkgdHdvIGRldmVsb3BlcnMgY2FuIGdldCBjb25mdXNl
ZCBlbm91Z2ggYnkKPiA+IHRoZSBjb2RlIHRvIGNvbWUgdXAgd2l0aCB0b3RhbGx5IGRpZmZlcmVu
dCBmaXhlcy4KPiA+IAo+IAo+IFlvdSB3aWxsIHNlZSB0aGF0IHRoZSBzb2x1dGlvbnMgYXJlIG5v
dCB0b3RhbGx5IGRpZmZlcmVudC4gSSByZWFsbHkgaG9wZWQgdG8KPiBnZXQgdGhpcyBmaXhlZCBp
biB0aGUgNS43IHJlbGVhc2UuLiBidXQgSSB0aGluayBpdHMgbm93IHRvbyBsYXRlLgoKSSBkaWRu
J3QgaGF2ZSB0aW1lIHRvIGxvb2sgYXQgdGhlIGZ1bGwgcGljdHVyZSwgeWV0LiBXZSBzdGlsbCBo
YXZlIGF0CmxlYXN0IGEgd2VlayB1bnRpbCB0aGUgZmluYWwgNS43IHJlbGVhc2UsIHdoeSB3b3Vs
ZCBpdCBiZSB0b28gbGF0ZSB0bwpnZXQgYSBmaXggdXBzdHJlYW0/CgpSZWdhcmRzLApMdWNhcwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
