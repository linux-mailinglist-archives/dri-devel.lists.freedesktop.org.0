Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 251A210A131
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 16:29:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCEBB6E41F;
	Tue, 26 Nov 2019 15:28:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AE3E6E41F
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 15:28:56 +0000 (UTC)
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44912)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1iZckV-0006LI-J9; Tue, 26 Nov 2019 15:27:32 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1iZckG-0007ie-KX; Tue, 26 Nov 2019 15:27:16 +0000
Date: Tue, 26 Nov 2019 15:27:16 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: Re: [PATCH 00/30] drm/bridge: Add device links for lifetime control
Message-ID: <20191126152716.GY25745@shell.armlinux.org.uk>
References: <20191126131541.47393-1-mihail.atanassov@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191126131541.47393-1-mihail.atanassov@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DlNhcJrW82VQLzwOQJiBrq1IxE5Asbw/cwpY6rFxlbs=; b=gLwe3PqLXZi9HxsLBEPWfxAIS
 a02nhyqsj6yY30KBz2UJtse9C8IqFlWTzE/aDxGxJVn+s1XVPe1zTiWAkCl5Fu4oITS+VWxLehqtB
 SD1ODgufQ3iJv0DlhX8Y2WvAmhkzk7D/Z89OKN5lESAPzRo3RQ6kx4TxCtDGpjtuJV8ZwquMYJtZw
 InZ29NEM9Uk9CraNUbXDKiYDNo6xXMgtE2DpsqKHmhgWMoyk4WlqVrX832+m69Cr81Q7nZrqnQ6hz
 vrvztKJ2mDxQ1fUnYEVarHuH5QQE8MFsCkCetEqOrAVhE1JZRF3Dk/Tb5P136b64Tj6KCeCfm0DHE
 zoPRKh4oQ==;
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
Cc: Martyn Welch <martyn.welch@collabora.co.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Philippe Cornu <philippe.cornu@st.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sam Ravnborg <sam@ravnborg.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Rob Clark <robdclark@chromium.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Vasily Khoruzhick <anarsoul@gmail.com>,
 Kukjin Kim <kgene@kernel.org>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 Thierry Reding <treding@nvidia.com>, Martin Donnelly <martin.donnelly@ge.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Brian Masney <masneyb@onstation.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, nd <nd@arm.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Dariusz Marcinkiewicz <darekm@google.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Douglas Anderson <dianders@chromium.org>,
 Matt Redfearn <matt.redfearn@thinci.com>,
 Yannick =?iso-8859-1?Q?Fertr=E9?= <yannick.fertre@st.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Torsten Duwe <duwe@lst.de>, Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hhdCBoYXBwZW5lZCB3aXRoIHRoZSBwYXRjaGVzIEkgcG9zdGVkIGRvaW5nIGV4YWN0bHkgdGhp
cz8KCk9uIFR1ZSwgTm92IDI2LCAyMDE5IGF0IDAxOjE1OjU4UE0gKzAwMDAsIE1paGFpbCBBdGFu
YXNzb3Ygd3JvdGU6Cj4gSGkgYWxsLAo+IAo+IFRoaXMgc2VyaWVzIGFkZHMgZGV2aWNlIGxpbmtz
IHN1cHBvcnQgdG8gZHJtX2JyaWRnZS4gVGhlIG1vdGl2YXRpb24KPiBiZWhpbmQgaXQgaXMgdGhh
dCBhIGRybV9icmlkZ2UgaW4gYSBtb2R1bGUgY291bGQgZ2V0IHJlbW92ZWQgdW5kZXIgdGhlCj4g
ZmVldCBvZiB0aGUgYnJpZGdlIHVzZXIgd2l0aG91dCB3YXJuaW5nLCBzbyB3ZSBuZWVkIGEgd2F5
IHRvIHJlbW92ZSBhbmQKPiByZXByb2JlIHRoZSBjbGllbnQgYXMgbmVlZGVkIHRvIGF2b2lkIHBl
ZXJpbmcgaW50byB0aGUgdm9pZC4KPiAKPiAxOiBBZGQgYSBkcm1fYnJpZGdlX2luaXQoKSBmdW5j
dGlvbiB3aGljaCB3cmFwcyBhbGwgaW5pdGlhbGlzYXRpb24gb2YKPiB0aGUgc3RydWN0dXJlIHBy
aW9yIHRvIGNhbGxpbmcgZHJtX2JyaWRnZV9hZGQoKS4KPiAKPiAyLTI2LDI4OiBBcHBseSB0aGUg
ZHJtX2JyaWRnZV9pbml0KCkgcmVmYWN0b3IgdG8gZXZlcnkgYnJpZGdlIHRoYXQgdXNlcwo+IGRy
bV9icmlkZ2VfYWRkKCkuCj4gCj4gMjc6IE1pbm9yIGNsZWFudXAgaW4gcmNhci1kdS4KPiAKPiAy
OTogQWRkIG9mX2RybV9maW5kX2JyaWRnZV9kZXZsaW5rKCkgd2hpY2ggZnVuY3Rpb25zIHRoZSBz
YW1lIGFzCj4gb2ZfZHJtX2ZpbmRfYnJpZGdlKCkgcGx1cyBhZGRzIGEgZGV2aWNlIGRldmljZSBs
aW5rIGZyb20gdGhlIG93bmluZwo+IGRybV9kZXZpY2UgdG8gdGhlIGJyaWRnZSBkZXZpY2UuCj4g
Cj4gMzA6IEFzIGEgbW90aXZhdGluZyBleGFtcGxlLCBjb252ZXJ0IGtvbWVkYSB0byBleGNsdXNp
dmVseSB1c2UKPiBkcm1fYnJpZGdlIGZvciBpdHMgcGlwZSBvdXRwdXRzOyB0aGlzIGlzbid0IGEg
cmVncmVzc2lvbiBpbiB1c2FiaWxpdHkKPiBhbnkgbW9yZSBzaW5jZSBkZXZpY2UgbGlua3MgYnJp
bmcgdGhlIHNhbWUgYXV0b21hdGljIHJlbW92ZS9yZXByb2JlCj4gZmVhdHVyZSBhcyBjb21wb25l
bnRzLgo+IAo+IE1paGFpbCBBdGFuYXNzb3YgKDI5KToKPiAgIGRybTogSW50cm9kdWNlIGRybV9i
cmlkZ2VfaW5pdCgpCj4gICBkcm0vYnJpZGdlOiBhZHY3NTExOiBVc2UgZHJtX2JyaWRnZV9pbml0
KCkKPiAgIGRybS9icmlkZ2U6IGFueDYzNDU6IFVzZSBkcm1fYnJpZGdlX2luaXQoKQo+ICAgZHJt
L2JyaWRnZTogYW54Nzh4eDogVXNlIGRybV9icmlkZ2VfaW5pdCgpCj4gICBkcm0vYnJpZGdlOiBj
ZG5zOiBVc2UgZHJtX2JyaWRnZV9pbml0KCkKPiAgIGRybS9icmlkZ2U6IGR1bWItdmdhLWRhYzog
VXNlIGRybV9icmlkZ2VfaW5pdCgpCj4gICBkcm0vYnJpZGdlOiBsdmRzLWVuY29kZXI6IFVzZSBk
cm1fYnJpZGdlX2luaXQoKQo+ICAgZHJtL2JyaWRnZTogbWVnYWNoaXBzLXN0ZHB4eHh4LWdlLWI4
NTB2My1mdzogVXNlIGRybV9icmlkZ2VfaW5pdCgpCj4gICBkcm0vYnJpZGdlOiBueHAtcHRuMzQ2
MDogVXNlIGRybV9icmlkZ2VfaW5pdCgpCj4gICBkcm0vYnJpZGdlOiBwYW5lbDogVXNlIGRybV9i
cmlkZ2VfaW5pdCgpCj4gICBkcm0vYnJpZGdlOiBwczg2MjI6IFVzZSBkcm1fYnJpZGdlX2luaXQo
KQo+ICAgZHJtL2JyaWRnZTogc2lpOTAyeDogVXNlIGRybV9icmlkZ2VfaW5pdCgpCj4gICBncHU6
IGRybTogYnJpZGdlOiBzaWk5MjM0OiBVc2UgZHJtX2JyaWRnZV9pbml0KCkKPiAgIGRybS9icmlk
Z2U6IHNpbF9zaWk4NjIwOiBVc2UgZHJtX2JyaWRnZV9pbml0KCkKPiAgIGRybS9icmlkZ2U6IGR3
LWhkbWk6IFVzZSBkcm1fYnJpZGdlX2luaXQoKQo+ICAgZHJtL2JyaWRnZS9zeW5vcHN5czogZHNp
OiBVc2UgZHJtX2JyaWRnZV9pbml0KCkKPiAgIGRybS9icmlkZ2U6IHRjMzU4NzY0OiBVc2UgZHJt
X2JyaWRnZV9pbml0KCkKPiAgIGRybS9icmlkZ2U6IHRjMzU4NzY3OiBVc2UgZHJtX2JyaWRnZV9p
bml0KCkKPiAgIGRybS9icmlkZ2U6IHRoYzYzOiBVc2UgZHJtX2JyaWRnZV9pbml0KCkKPiAgIGRy
bS9icmlkZ2U6IHRpLXNuNjVkc2k4NjogVXNlIGRybV9icmlkZ2VfaW5pdCgpCj4gICBkcm0vYnJp
ZGdlOiB0aS10ZnA0MTA6IFVzZSBkcm1fYnJpZGdlX2luaXQoKQo+ICAgZHJtL2V4eW5vczogbWlj
OiBVc2UgZHJtX2JyaWRnZV9pbml0KCkKPiAgIGRybS9pMmM6IHRkYTk5OHg6IFVzZSBkcm1fYnJp
ZGdlX2luaXQoKQo+ICAgZHJtL21jZGU6IGRzaTogVXNlIGRybV9icmlkZ2VfaW5pdCgpCj4gICBk
cm0vbWVkaWF0ZWs6IGhkbWk6IFVzZSBkcm1fYnJpZGdlX2luaXQoKQo+ICAgZHJtOiByY2FyLWR1
OiBsdmRzOiBVc2UgZHJtX2JyaWRnZV9pbml0KCkKPiAgIGRybTogcmNhci1kdTogbHZkczogRG9u
J3Qgc2V0IGRybV9icmlkZ2UgcHJpdmF0ZSBwb2ludGVyCj4gICBkcm0vc3RpOiBzdGlfdmRvOiBV
c2UgZHJtX2JyaWRnZV9pbml0KCkKPiAgIGRybS9rb21lZGE6IFVzZSBkcm1fYnJpZGdlIGludGVy
ZmFjZSBmb3IgcGlwZSBvdXRwdXRzCj4gCj4gUnVzc2VsbCBLaW5nICgxKToKPiAgIGRybS9icmlk
Z2U6IGFkZCBzdXBwb3J0IGZvciBkZXZpY2UgbGlua3MgdG8gYnJpZGdlCj4gCj4gIC4uLi9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZHJ2LmMgICB8IDU0ICsrKysrKy0tLS0tLS0K
PiAgLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuYyAgIHwgNzcgKysr
KysrKysrKysrKysrKy0tCj4gIC4uLi9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
a21zLmggICB8ICAyICsKPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTFf
ZHJ2LmMgIHwgIDUgKy0KPiAgLi4uL2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXgtYW54NjM0
NS5jICAgIHwgIDUgKy0KPiAgLi4uL2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXgtYW54Nzh4
eC5jICAgIHwgIDggKy0KPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9jZG5zLWRzaS5jICAgICAg
ICAgICAgIHwgIDQgKy0KPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9kdW1iLXZnYS1kYWMuYyAg
ICAgICAgIHwgIDYgKy0KPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9sdmRzLWVuY29kZXIuYyAg
ICAgICAgIHwgIDcgKy0KPiAgLi4uL2JyaWRnZS9tZWdhY2hpcHMtc3RkcHh4eHgtZ2UtYjg1MHYz
LWZ3LmMgIHwgIDQgKy0KPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9ueHAtcHRuMzQ2MC5jICAg
ICAgICAgIHwgIDQgKy0KPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9wYW5lbC5jICAgICAgICAg
ICAgICAgIHwgIDcgKy0KPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9wYXJhZGUtcHM4NjIyLmMg
ICAgICAgIHwgIDMgKy0KPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4LmMgICAgICAg
ICAgICAgIHwgIDUgKy0KPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MjM0LmMgICAgICAg
ICAgICAgIHwgIDMgKy0KPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWwtc2lpODYyMC5jICAg
ICAgICAgIHwgIDMgKy0KPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1p
LmMgICAgIHwgIDcgKy0KPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1taXBp
LWRzaS5jIHwgIDcgKy0KPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2NC5jICAgICAg
ICAgICAgIHwgIDQgKy0KPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jICAgICAg
ICAgICAgIHwgIDMgKy0KPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aGM2M2x2ZDEwMjQuYyAg
ICAgICAgIHwgIDcgKy0KPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS1zbjY1ZHNpODYuYyAg
ICAgICAgIHwgIDUgKy0KPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS10ZnA0MTAuYyAgICAg
ICAgICAgIHwgIDUgKy0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9icmlkZ2UuYyAgICAgICAgICAg
ICAgICAgIHwgNzggKysrKysrKysrKysrKysrLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZXh5bm9z
L2V4eW5vc19kcm1fbWljLmMgICAgICAgfCAgOCArLQo+ICBkcml2ZXJzL2dwdS9kcm0vaTJjL3Rk
YTk5OHhfZHJ2LmMgICAgICAgICAgICAgfCAgNiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWNkZS9t
Y2RlX2RzaS5jICAgICAgICAgICAgICAgfCAgMyArLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2hkbWkuYyAgICAgICAgICAgfCAgNCArLQo+ICBkcml2ZXJzL2dwdS9kcm0vcmNhci1k
dS9yY2FyX2x2ZHMuYyAgICAgICAgICAgfCAgNSArLQo+ICBkcml2ZXJzL2dwdS9kcm0vc3RpL3N0
aV9kdm8uYyAgICAgICAgICAgICAgICAgfCAgNCArLQo+ICBpbmNsdWRlL2RybS9kcm1fYnJpZGdl
LmggICAgICAgICAgICAgICAgICAgICAgfCAgOCArKwo+ICAzMSBmaWxlcyBjaGFuZ2VkLCAyMTcg
aW5zZXJ0aW9ucygrKSwgMTM0IGRlbGV0aW9ucygtKQo+IAo+IC0tIAo+IDIuMjMuMAo+IAo+IAoK
LS0gClJNSydzIFBhdGNoIHN5c3RlbTogaHR0cHM6Ly93d3cuYXJtbGludXgub3JnLnVrL2RldmVs
b3Blci9wYXRjaGVzLwpGVFRDIGJyb2FkYmFuZCBmb3IgMC44bWlsZSBsaW5lIGluIHN1YnVyYmlh
OiBzeW5jIGF0IDEyLjFNYnBzIGRvd24gNjIya2JwcyB1cApBY2NvcmRpbmcgdG8gc3BlZWR0ZXN0
Lm5ldDogMTEuOU1icHMgZG93biA1MDBrYnBzIHVwCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
