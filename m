Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E697A5E72E
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 16:54:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF1E86E152;
	Wed,  3 Jul 2019 14:54:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 836EC6E152
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 14:54:03 +0000 (UTC)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1higdz-0005mt-HL; Wed, 03 Jul 2019 16:53:59 +0200
Message-ID: <1562165639.2321.16.camel@pengutronix.de>
Subject: Re: [PATCH] drm/scheduler: put killed job cleanup to worker
From: Lucas Stach <l.stach@pengutronix.de>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>
Date: Wed, 03 Jul 2019 16:53:59 +0200
In-Reply-To: <186e567c-81e7-e874-2dae-4c4495bce224@amd.com>
References: <20190703102802.17004-1-l.stach@pengutronix.de>
 <e40563b4-3a0f-0370-4790-67328c6e5ad2@amd.com>
 <1562164325.2321.13.camel@pengutronix.de>
 <186e567c-81e7-e874-2dae-4c4495bce224@amd.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "patchwork-lst@pengutronix.de" <patchwork-lst@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gTWl0dHdvY2gsIGRlbiAwMy4wNy4yMDE5LCAxNDo0MSArMDAwMCBzY2hyaWViIEdyb2R6b3Zz
a3ksIEFuZHJleToKPiBPbiA3LzMvMTkgMTA6MzIgQU0sIEx1Y2FzIFN0YWNoIHdyb3RlOgo+ID4g
QW0gTWl0dHdvY2gsIGRlbiAwMy4wNy4yMDE5LCAxNDoyMyArMDAwMCBzY2hyaWViIEdyb2R6b3Zz
a3ksIEFuZHJleToKPiA+ID4gT24gNy8zLzE5IDY6MjggQU0sIEx1Y2FzIFN0YWNoIHdyb3RlOgo+
ID4gPiA+IGRybV9zY2hlZF9lbnRpdHlfa2lsbF9qb2JzX2NiKCkgaXMgY2FsbGVkIHJpZ2h0IGZy
b20gdGhlIGxhc3Qgc2NoZWR1bGVkCj4gPiA+ID4gam9iIGZpbmlzaGVkIGZlbmNlIHNpZ25hbGlu
Zy4gQXMgdGhpcyBtaWdodCBoYXBwZW4gZnJvbSBJUlEgY29udGV4dCB3ZQo+ID4gPiA+IG5vdyBl
bmQgdXAgY2FsbGluZyB0aGUgR1BVIGRyaXZlciBmcmVlX2pvYiBjYWxsYmFjayBpbiBJUlEgY29u
dGV4dCwgd2hpbGUKPiA+ID4gPiBhbGwgb3RoZXIgcGF0aHMgY2FsbCBpdCBmcm9tIG5vcm1hbCBw
cm9jZXNzIGNvbnRleHQuCj4gPiA+ID4gCj4gPiA+ID4gRXRuYXZpdiBpbiBwYXJ0aWN1bGFyIGNh
bGxzIGNvcmUga2VybmVsIGZ1bmN0aW9ucyB0aGF0IGFyZSBvbmx5IHZhbGlkIHRvCj4gPiA+ID4g
YmUgY2FsbGVkIGZyb20gcHJvY2VzcyBjb250ZXh0IHdoZW4gZnJlZWluZyB0aGUgam9iLiBPdGhl
ciBkcml2ZXJzIG1pZ2h0Cj4gPiA+ID4gaGF2ZSBzaW1pbGFyIGlzc3VlcywgYnV0IEkgZGlkIG5v
dCB2YWxpZGF0ZSB0aGlzLiBGaXggdGhpcyBieSBwdW50aW5nCj4gPiA+ID4gdGhlIGNsZWFudXAg
d29yayBpbnRvIGEgd29yayBpdGVtLCBzbyB0aGUgZHJpdmVyIGV4cGVjdGF0aW9ucyBhcmUgbWV0
Lgo+ID4gPiA+IAo+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBMdWNhcyBTdGFjaCA8bC5zdGFj
aEBwZW5ndXRyb25peC5kZT4KPiA+ID4gPiAKPiA+ID4gPiAtLS0KClsuLi5dCgo+ID4gPiBJIHJl
Y2hlY2tlZCB0aGUgbGF0ZXN0IGNvZGUgYW5kIGZpbmlzaF93b3JrIHdhcyByZW1vdmVkIGluIGZm
YWUzZTUKPiA+ID4gJ2RybS9zY2hlZHVsZXI6IHJld29yayBqb2IgZGVzdHJ1Y3Rpb24nCj4gPiAK
PiA+IEF3LCB0aGFua3MuIFNlZW1zIHRoaXMgcGF0Y2ggd2FzIHN0dWNrIGZvciBhIGJpdCB0b28g
bG9uZyBpbiBteQo+ID4gb3V0Z29pbmcgcXVldWUuIEkndmUganVzdCBjaGVja2VkIHRoZSBjb21t
aXQgeW91IHBvaW50ZWQgb3V0LCBpdCBzaG91bGQKPiA+IGFsc28gZml4IHRoZSBpc3N1ZSB0aGF0
IHRoaXMgcGF0Y2ggd2FzIHRyeWluZyB0byBmaXguCj4gCj4gCj4gTm90IHN1cmUgYWJvdXQgdGhp
cyBhcyB5b3UgcGF0Y2ggb25seSBjb25jZXJucyB1c2UgY2FzZSB3aGVuIGNsZWFuaW5nwqAKPiB1
bmZpbmlzaGVkIGpvYidzIGZvciBlbnRpdHkgYmVpbmcgZGVzdHJveWVkLgoKQUZBSUNTIGFmdGVy
IGZmYWUzZTUgYWxsIHRoZSBmcmVlX2pvYiBpbnZvY2F0aW9ucyBhcmUgZG9uZSBmcm9tIHByb2Nl
c3MKY29udGV4dCwgc28gdGhpbmdzIHNob3VsZCB3b3JrIGZvciBldG5hdml2LgoKUmVnYXJkcywK
THVjYXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
