Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 112DB10DB48
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 22:45:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBD326E967;
	Fri, 29 Nov 2019 21:45:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7953B6E967
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 21:45:41 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id DC910292998;
 Fri, 29 Nov 2019 21:45:39 +0000 (GMT)
Date: Fri, 29 Nov 2019 22:45:36 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 2/8] drm/panfrost: Fix a race in panfrost_ioctl_madvise()
Message-ID: <20191129224536.6ba79df0@collabora.com>
In-Reply-To: <20191129200733.GQ624164@phenom.ffwll.local>
References: <20191129135908.2439529-1-boris.brezillon@collabora.com>
 <20191129135908.2439529-3-boris.brezillon@collabora.com>
 <dd8a946c-5666-a7b8-f7bc-06647e0d0bbc@arm.com>
 <20191129153310.2f9c80e1@collabora.com>
 <b159591d-1dd4-1ac7-e924-c02be1d8b1f3@arm.com>
 <20191129200733.GQ624164@phenom.ffwll.local>
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
Cc: Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyOSBOb3YgMjAxOSAyMTowNzozMyArMDEwMApEYW5pZWwgVmV0dGVyIDxkYW5pZWxA
ZmZ3bGwuY2g+IHdyb3RlOgoKPiBPbiBGcmksIE5vdiAyOSwgMjAxOSBhdCAwMjo0MDozNFBNICsw
MDAwLCBTdGV2ZW4gUHJpY2Ugd3JvdGU6Cj4gPiBPbiAyOS8xMS8yMDE5IDE0OjMzLCBCb3JpcyBC
cmV6aWxsb24gd3JvdGU6ICAKPiA+ID4gT24gRnJpLCAyOSBOb3YgMjAxOSAxNDoyNDo0OCArMDAw
MAo+ID4gPiBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmljZUBhcm0uY29tPiB3cm90ZToKPiA+ID4g
ICAKPiA+ID4+IE9uIDI5LzExLzIwMTkgMTM6NTksIEJvcmlzIEJyZXppbGxvbiB3cm90ZTogIAo+
ID4gPj4+IElmIDIgdGhyZWFkcyBjaGFuZ2UgdGhlIE1BRFZJU0UgcHJvcGVydHkgb2YgdGhlIHNh
bWUgQk8gaW4gcGFyYWxsZWwgd2UKPiA+ID4+PiBtaWdodCBlbmQgdXAgd2l0aCBhbiBzaG1lbS0+
bWFkdiB2YWx1ZSB0aGF0J3MgaW5jb25zaXN0ZW50IHdpdGggdGhlCj4gPiA+Pj4gcHJlc2VuY2Ug
b2YgdGhlIEJPIGluIHRoZSBzaHJpbmtlciBsaXN0LiAgICAKPiA+ID4+Cj4gPiA+PiBJJ20gYSBi
aXQgd29ycmllZCBmcm9tIHRoZSBwb2ludCBvZiB2aWV3IG9mIHVzZXIgc3BhY2Ugc2FuaXR5IHRo
YXQgeW91Cj4gPiA+PiBvYnNlcnZlZCB0aGlzIC0gYnV0IGNsZWFybHkgdGhlIGtlcm5lbCBzaG91
bGQgYmUgcm9idXN0ISAgCj4gPiA+IAo+ID4gPiBJdCdzIG5vdCBzb21ldGhpbmcgSSBvYnNlcnZl
ZCwganVzdCBmb3VuZCB0aGUgcmFjZSBieSBpbnNwZWN0aW5nIHRoZQo+ID4gPiBjb2RlLCBhbmQg
SSB0aG91Z2h0IGl0IHdhcyB3b3J0aCBmaXhpbmcgaXQuICAKPiA+IAo+ID4gR29vZCEgOykgWW91
ciBjb3ZlciBsZXR0ZXIgcmVmZXJyaW5nIHRvIGEgImRlYnVnIHNlc3Npb24iIG1hZGUgbWUgdGhp
bmsKPiA+IHlvdSdkIGFjdHVhbGx5IGhpdCBhbGwgdGhlc2UuICAKPiAKPiBUaW1lIGZvciBzb21l
IGlndCB0byBtYWtlIHN1cmUgdGhpcyBpcyBhY3R1YWxseSBjb3JyZWN0PwoKVGhhdCdzIG5vdCBz
b21ldGhpbmcgSSBjYW4gZWFzaWx5IHRyaWdnZXIgd2l0aG91dCBpbnN0cnVtZW50aW5nIHRoZQpj
b2RlOiBJIG5lZWQgMiB0aHJlYWRzIGRvaW5nIE1BRFZJU0Ugd2l0aCAyIGRpZmZlcmVudCB2YWx1
ZXMsCmFuZCB0aGVyZSBoYXMgdG8gYmUgYSBjb250ZXh0IHN3aXRjaCBiZXR3ZWVuIHRoZQpkcm1f
Z2VtX3NobWVtX21hZHZpc2UoKSBjYWxsIGFuZCB0aGUgbXV0ZXhfbG9jayhzaHJpbmtlcl9sb2Nr
KSBvbmUuIEFuZApsYXN0IGJ1dCBub3QgbGVhc3QsIEknbGwgbmVlZCBhIHdheSB0byByZXBvcnQg
c3VjaCBpbmNvbnNpc3RlbmNpZXMgdG8KdXNlcnNwYWNlICh0cmFjZT8pLgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
