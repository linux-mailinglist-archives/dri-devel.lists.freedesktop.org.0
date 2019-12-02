Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C0410EAD2
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 14:32:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7578A89AFF;
	Mon,  2 Dec 2019 13:32:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04E5989AF3
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 13:32:29 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B11C128F684;
 Mon,  2 Dec 2019 13:32:27 +0000 (GMT)
Date: Mon, 2 Dec 2019 14:32:24 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 8/8] drm/panfrost: Make sure the shrinker does not
 reclaim referenced BOs
Message-ID: <20191202143224.445ad75d@collabora.com>
In-Reply-To: <7258aca4-115d-d511-4c0a-fb3ba142f382@arm.com>
References: <20191129135908.2439529-1-boris.brezillon@collabora.com>
 <20191129135908.2439529-9-boris.brezillon@collabora.com>
 <7258aca4-115d-d511-4c0a-fb3ba142f382@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: stable@vger.kernel.org, Steven Price <steven.price@arm.com>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyIERlYyAyMDE5IDEyOjUwOjIwICswMDAwClJvYmluIE11cnBoeSA8cm9iaW4ubXVy
cGh5QGFybS5jb20+IHdyb3RlOgoKPiBPbiAyOS8xMS8yMDE5IDE6NTkgcG0sIEJvcmlzIEJyZXpp
bGxvbiB3cm90ZToKPiA+IFVzZXJzcGFjZSBtaWdodCB0YWcgYSBCTyBwdXJnZWFibGUgd2hpbGUg
aXQncyBzdGlsbCByZWZlcmVuY2VkIGJ5IEdQVQo+ID4gam9icy4gV2UgbmVlZCB0byBtYWtlIHN1
cmUgdGhlIHNocmlua2VyIGRvZXMgbm90IHB1cmdlIHN1Y2ggQk9zIHVudGlsCj4gPiBhbGwgam9i
cyByZWZlcmVuY2luZyBpdCBhcmUgZmluaXNoZWQuICAKPiAKPiBOaXQ6IGZvciBleHRyYSByb2J1
c3RuZXNzLCBwZXJoYXBzIGl0J3Mgd29ydGggdXNpbmcgdGhlIHJlZmNvdW50X3QgQVBJIAo+IHJh
dGhlciB0aGFuIGJhcmUgYXRvbWljX3Q/CgpJIGNvbnNpZGVyZWQgZG9pbmcgdGhhdC4gVGhlIHBy
b2JsZW0gaXMsIHdlIHN0YXJ0IGNvdW50aW5nIGZyb20gMCwgbm90CjEsIGFuZCB0aGUgcmVmY291
bnQgQVBJIGFzc3VtZXMgY291bnRlcnMgc3RhcnQgYXQgMCwgYW5kIHNob3VsZCBuZXZlcgpzZWUg
YSAwIC0+IDEgdHJhbnNpdGlvbi4gSSBndWVzcyB3ZSBjb3VsZCBkbwoKCWlmIChyZWZjb3VudF9p
bmNfbm90X3plcm8oKSkgewoJCS4uLgoJfSBlbHNlIHsKCQlyZWZjb3VudF9zZXQoMSk7CgkJLi4u
Cgl9CgpzbyB3ZSBhdCBsZWFzdCBnZXQgdGhlIGludGVnZXIgb3ZlcmZsb3cvdW5kZXJmbG93IHBy
b3RlY3Rpb24uCgpBbnl3YXksIEknbSByZXdvcmtpbmcgdGhlIGdlbV9zaG1lbSBjb2RlIHNvIHdl
IGNhbiByZWZjb3VudCB0aGUgc2d0CnVzZXJzIChJIGFjdHVhbGx5IHJlLXVzZSB0aGUgcGFnZV91
c2VfY291bnQgY291bnRlciBhbmQgdHVybiBpbnRvIGEKcmVmY291bnRfdCBzbyB3ZSBkb24ndCBu
ZWVkIHRvIHRha2UgdGhlIGxvY2sgaWYgaXQncyA+IDApLiBXaXRoIHRoaXMKY2hhbmdlIEkgdGhp
bmsgSSB3b24ndCBuZWVkIHRoZSBncHVfdXNlY291bnQuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
