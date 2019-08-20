Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1EC95C5F
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 12:37:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAD296E69B;
	Tue, 20 Aug 2019 10:37:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F9776E69B
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 10:37:10 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id B389120038;
 Tue, 20 Aug 2019 12:37:07 +0200 (CEST)
Date: Tue, 20 Aug 2019 12:37:06 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 13/50] drm/bridge: panel: Implement bridge connector
 operations
Message-ID: <20190820103706.GB9745@ravnborg.org>
References: <20190820011721.30136-1-laurent.pinchart@ideasonboard.com>
 <20190820011721.30136-14-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190820011721.30136-14-laurent.pinchart@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=P1BnusSwAAAA:8
 a=e5mUnYsNAAAA:8 a=-zXe-LNFNRGSj8T4IjYA:9 a=CjuIK1q_8ugA:10
 a=D0XLA9XvdZm18NrgonBM:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudC4KCk9uIFR1ZSwgQXVnIDIwLCAyMDE5IGF0IDA0OjE2OjQ0QU0gKzAzMDAsIExh
dXJlbnQgUGluY2hhcnQgd3JvdGU6Cj4gSW1wbGVtZW50IHRoZSBuZXdseSBhZGRlZCBicmlkZ2Ug
Y29ubmVjdG9yIG9wZXJhdGlvbnMsIGFsbG93aW5nIHRoZQo+IHVzYWdlIG9mIGRybV9icmlkZ2Vf
cGFuZWwgd2l0aCBkcm1fYnJpZGdlX2Nvbm5lY3Rvci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBMYXVy
ZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4gLS0tCj4g
IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvcGFuZWwuYyB8IDE4ICsrKysrKysrKysrKysrKysrLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3BhbmVsLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3BhbmVsLmMKPiBpbmRleCBmNWI4ZTU1MzAxYWMuLjFjN2Y1YjY0OGYwNSAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3BhbmVsLmMKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3BhbmVsLmMKPiBAQCAtNjAsNyArNjAsNyBAQCBzdGF0aWMgaW50IHBh
bmVsX2JyaWRnZV9hdHRhY2goc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwKPiAgCWludCByZXQ7
Cj4gIAo+ICAJaWYgKGZsYWdzICYgRFJNX0JSSURHRV9BVFRBQ0hfTk9fQ09OTkVDVE9SKQo+IC0J
CXJldHVybiAtRUlOVkFMOwo+ICsJCXJldHVybiAwOwo+ICAKPiAgCWlmICghYnJpZGdlLT5lbmNv
ZGVyKSB7Cj4gIAkJRFJNX0VSUk9SKCJNaXNzaW5nIGVuY29kZXJcbiIpOwo+IEBAIC0xMjMsNiAr
MTIzLDE4IEBAIHN0YXRpYyB2b2lkIHBhbmVsX2JyaWRnZV9wb3N0X2Rpc2FibGUoc3RydWN0IGRy
bV9icmlkZ2UgKmJyaWRnZSkKPiAgCWRybV9wYW5lbF91bnByZXBhcmUocGFuZWxfYnJpZGdlLT5w
YW5lbCk7Cj4gIH0KPiAgCj4gK3N0YXRpYyBpbnQgcGFuZWxfYnJpZGdlX2dldF9tb2RlcyhzdHJ1
Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLAo+ICsJCQkJICBzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29u
bmVjdG9yKQo+ICt7Cj4gKwlzdHJ1Y3QgcGFuZWxfYnJpZGdlICpwYW5lbF9icmlkZ2UgPSBkcm1f
YnJpZGdlX3RvX3BhbmVsX2JyaWRnZShicmlkZ2UpOwo+ICsKPiArCS8qCj4gKwkgKiBGSVhNRTog
ZHJtX3BhbmVsX2dldF9tb2RlcygpIHNob3VsZCB0YWtlIHRoZSBjb25uZWN0b3IgYXMgYW4KPiAr
CSAqIGFyZ3VtZW50Lgo+ICsJICovCk5vdGVkLCBJIGhhdmUgcGF0Y2hlcyB0byBmaXggdGhpcy4g
TmVlZHMgYSBsaXR0bGUgdGVzdGluZy9wb2xpc2hpbmcKYmVmb3JlIEkgcG9zdCB0aGVtLgoKPiAr
CXJldHVybiBkcm1fcGFuZWxfZ2V0X21vZGVzKHBhbmVsX2JyaWRnZS0+cGFuZWwpOwo+ICt9Cj4g
Kwo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9icmlkZ2VfZnVuY3MgcGFuZWxfYnJpZGdlX2Jy
aWRnZV9mdW5jcyA9IHsKPiAgCS5hdHRhY2ggPSBwYW5lbF9icmlkZ2VfYXR0YWNoLAo+ICAJLmRl
dGFjaCA9IHBhbmVsX2JyaWRnZV9kZXRhY2gsCj4gQEAgLTEzMCw2ICsxNDIsNyBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IGRybV9icmlkZ2VfZnVuY3MgcGFuZWxfYnJpZGdlX2JyaWRnZV9mdW5jcyA9
IHsKPiAgCS5lbmFibGUgPSBwYW5lbF9icmlkZ2VfZW5hYmxlLAo+ICAJLmRpc2FibGUgPSBwYW5l
bF9icmlkZ2VfZGlzYWJsZSwKPiAgCS5wb3N0X2Rpc2FibGUgPSBwYW5lbF9icmlkZ2VfcG9zdF9k
aXNhYmxlLAo+ICsJLmdldF9tb2RlcyA9IHBhbmVsX2JyaWRnZV9nZXRfbW9kZXMsCj4gIH07Cj4g
IAo+ICAvKioKPiBAQCAtMTc1LDYgKzE4OCw5IEBAIHN0cnVjdCBkcm1fYnJpZGdlICpkcm1fcGFu
ZWxfYnJpZGdlX2FkZChzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCwKPiAgI2lmZGVmIENPTkZJR19P
Rgo+ICAJcGFuZWxfYnJpZGdlLT5icmlkZ2Uub2Zfbm9kZSA9IHBhbmVsLT5kZXYtPm9mX25vZGU7
Cj4gICNlbmRpZgo+ICsJcGFuZWxfYnJpZGdlLT5icmlkZ2Uub3BzID0gRFJNX0JSSURHRV9PUF9N
T0RFUzsKPiArCS8qIEZJWE1FOiBUaGUgcGFuZWwgc2hvdWxkIHJlcG9ydCBpdHMgdHlwZS4gKi8K
PiArCXBhbmVsX2JyaWRnZS0+YnJpZGdlLnR5cGUgPSBEUk1fTU9ERV9DT05ORUNUT1JfRFBJOwpD
b25mdXNlZC4KV2UgbW92ZSB0aGUgY29ubmVjdG9yIHRvIHRoZSBkaXNwbGF5IGNvbnRyb2xsZXIu
ClNvIHRoZSBwYW5lbCBkb2VzIG5vdCBrbm93IHRoZSB0eXBlLgoKSW4gb3RoZXJzIHdvcmRzIC0g
cGxlYXNlIHB1dCBhIGZldyBtb3JlIHdvcmRzIG9uIHRoaXMgRklYTUUuCgoJU2FtCgo+ICAKPiAg
CWRybV9icmlkZ2VfYWRkKCZwYW5lbF9icmlkZ2UtPmJyaWRnZSk7Cj4gIAo+IC0tIAo+IFJlZ2Fy
ZHMsCj4gCj4gTGF1cmVudCBQaW5jaGFydAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
