Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFC43028F3
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 18:33:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0AC289893;
	Mon, 25 Jan 2021 17:33:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD87089893
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 17:33:10 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1l45jb-0006rs-G3; Mon, 25 Jan 2021 18:33:03 +0100
Message-ID: <86de8471155f0d1e46d7048e40d80219da715e0e.camel@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: fix NULL check before some freeing
 functions is not needed
From: Lucas Stach <l.stach@pengutronix.de>
To: Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie, daniel@ffwll.ch, 
 sumit.semwal@linaro.org, christian.koenig@amd.com
Date: Mon, 25 Jan 2021 18:33:02 +0100
In-Reply-To: <1611545247-33487-1-git-send-email-tiantao6@hisilicon.com>
References: <1611545247-33487-1-git-send-email-tiantao6@hisilicon.com>
User-Agent: Evolution 3.38.3 (3.38.3-1.fc33) 
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gTW9udGFnLCBkZW0gMjUuMDEuMjAyMSB1bSAxMToyNyArMDgwMCBzY2hyaWViIFRpYW4gVGFv
Ogo+IGZpeGVkIHRoZSBiZWxvdyB3YXJuaW5nOgo+IGRyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0
bmF2aXZfZ2VtX3ByaW1lLmM6ODQ6Mi04OiBXQVJOSU5HOiBOVUxMIGNoZWNrCj4gYmVmb3JlIHNv
bWUgZnJlZWluZyBmdW5jdGlvbnMgaXMgbm90IG5lZWRlZC4KClRoYW5rcywgSSd2ZSBhZGRlZCB0
aGlzIHBhdGNoIHRvIG15IGV0bmF2aXYvbmV4dCBicmFuY2guCgpSZWdhcmRzLApMdWNhcwoKPiBT
aWduZWQtb2ZmLWJ5OiBUaWFuIFRhbyA8dGlhbnRhbzZAaGlzaWxpY29uLmNvbT4KPiAtLS0KPiDC
oGRyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ2VtX3ByaW1lLmMgfCAzICstLQo+IMKg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dlbV9wcmltZS5jIGIvZHJp
dmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9nZW1fcHJpbWUuYwo+IGluZGV4IGIzOTBkZDQu
LmQ3NDFiMWQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9n
ZW1fcHJpbWUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ2VtX3By
aW1lLmMKPiBAQCAtODAsOCArODAsNyBAQCBzdGF0aWMgdm9pZCBldG5hdml2X2dlbV9wcmltZV9y
ZWxlYXNlKHN0cnVjdCBldG5hdml2X2dlbV9vYmplY3QgKmV0bmF2aXZfb2JqKQo+IMKgCS8qIERv
bid0IGRyb3AgdGhlIHBhZ2VzIGZvciBpbXBvcnRlZCBkbWFidWYsIGFzIHRoZXkgYXJlIG5vdAo+
IMKgCSAqIG91cnMsIGp1c3QgZnJlZSB0aGUgYXJyYXkgd2UgYWxsb2NhdGVkOgo+IMKgCSAqLwo+
IC0JaWYgKGV0bmF2aXZfb2JqLT5wYWdlcykKPiAtCQlrdmZyZWUoZXRuYXZpdl9vYmotPnBhZ2Vz
KTsKPiArCWt2ZnJlZShldG5hdml2X29iai0+cGFnZXMpOwo+IMKgCj4gCj4gCj4gCj4gwqAJZHJt
X3ByaW1lX2dlbV9kZXN0cm95KCZldG5hdml2X29iai0+YmFzZSwgZXRuYXZpdl9vYmotPnNndCk7
Cj4gwqB9CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
