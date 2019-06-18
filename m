Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD70E4A714
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 18:36:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 887956E1B9;
	Tue, 18 Jun 2019 16:36:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6B4F6E1B9
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 16:36:17 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BF91FD5;
 Tue, 18 Jun 2019 18:36:14 +0200 (CEST)
Date: Tue, 18 Jun 2019 19:35:57 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH] drm: rcar-du: Replace drm_driver GEM ops with GEM object
 functions
Message-ID: <20190618163557.GF21105@pendragon.ideasonboard.com>
References: <20190618131329.30336-1-laurent.pinchart+renesas@ideasonboard.com>
 <6d60ba59-60a2-58b3-c78b-5bd85e3a660b@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6d60ba59-60a2-58b3-c78b-5bd85e3a660b@tronnes.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1560875774;
 bh=F2+CknpW90Qtzn/iua1VMeTWHYGplrCGzDZKCZLVgGU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a9D0AvIJDHI9BnraSYmctjuFvOlsGasv/2Pv1f5oqSJjGukbV97NTH11Wxfz5Vge8
 1kSS9rA1UnPh/HtBPDHok9Oo0PLF2ITP4mtxwfK2wcvgZOPWz4jOumvr3In1mdvXNa
 FfHtQvKP1iXr9uiUqdfY7iCNVGcYZSTbar3UCBJw=
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
Cc: linux-renesas-soc@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTm9yYWxmLAoKT24gVHVlLCBKdW4gMTgsIDIwMTkgYXQgMDM6NTY6MTlQTSArMDIwMCwgTm9y
YWxmIFRyw7hubmVzIHdyb3RlOgo+IERlbiAxOC4wNi4yMDE5IDE1LjEzLCBza3JldiBMYXVyZW50
IFBpbmNoYXJ0Ogo+ID4gVGhlIHJlY29tbWVuZGVkIHdheSB0byBzcGVjaWZ5IEdFTSBvYmplY3Qg
ZnVuY3Rpb25zIGlzIHRvIHByb3ZpZGUgYQo+ID4gZHJtX2dlbV9vYmplY3RfZnVuY3Mgc3RydWN0
dXJlIGluc3RhbmNlIGFuZCBzZXQgdGhlIEdFTSBvYmplY3QgdG8gcG9pbnQKPiA+IHRvIGl0LiBU
aGUgZHJtX2NtYV9nZW1fY3JlYXRlX29iamVjdF9kZWZhdWx0X2Z1bmNzKCkgZnVuY3Rpb24gcHJv
dmlkZWQKPiA+IGJ5IHRoZSBHRU0gQ01BIGhlbHBlciBkb2VzIHNvIHdoZW4gY3JlYXRpbmcgdGhl
IEdFTSBvYmplY3QsIHNpbXBsaWZ5aW5nCj4gPiB0aGUgZHJpdmVyIGltcGxlbWVudGF0aW9uLiBT
d2l0Y2ggdG8gaXQsIGFuZCByZW1vdmUgdGhlIHRoZW4gdW5uZWVkZWQKPiA+IEdFTS1yZWxhdGVk
IG9wZXJ0aW9ucyBmcm9tIHJjYXJfZHVfZHJpdmVyLgo+IAo+IHMvb3BlcnRpb25zL29wZXJhdGlv
bnMvCgpPb3BzLCB3aWxsIGZpeC4KCj4gPiBTdWdnZXN0ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRh
bmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBMYXVyZW50IFBpbmNoYXJ0
IDxsYXVyZW50LnBpbmNoYXJ0K3JlbmVzYXNAaWRlYXNvbmJvYXJkLmNvbT4KPiA+IC0tLQo+ID4g
IGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfZHJ2LmMgfCA4ICstLS0tLS0tCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA3IGRlbGV0aW9ucygtKQo+ID4gCj4gPiBE
YW5pZWwsIGlzIHRoaXMgd2hhdCB5b3UgaGFkIGluIG1pbmQgPwo+ID4gCj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9yY2FyLWR1L3JjYXJfZHVfZHJ2LmMKPiA+IGluZGV4IDNlNWU4MzVlYTJiNi4uNGNiYjgyMDA5
OTMxIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9kcnYu
Ywo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9kcnYuYwo+ID4gQEAg
LTQ0NSwxNiArNDQ1LDEwIEBAIERFRklORV9EUk1fR0VNX0NNQV9GT1BTKHJjYXJfZHVfZm9wcyk7
Cj4gPiAgc3RhdGljIHN0cnVjdCBkcm1fZHJpdmVyIHJjYXJfZHVfZHJpdmVyID0gewo+ID4gIAku
ZHJpdmVyX2ZlYXR1cmVzCT0gRFJJVkVSX0dFTSB8IERSSVZFUl9NT0RFU0VUIHwgRFJJVkVSX1BS
SU1FCj4gPiAgCQkJCXwgRFJJVkVSX0FUT01JQywKPiA+IC0JLmdlbV9mcmVlX29iamVjdF91bmxv
Y2tlZCA9IGRybV9nZW1fY21hX2ZyZWVfb2JqZWN0LAo+ID4gLQkuZ2VtX3ZtX29wcwkJPSAmZHJt
X2dlbV9jbWFfdm1fb3BzLAo+ID4gKwkuZ2VtX2NyZWF0ZV9vYmplY3QgICAgICA9IGRybV9jbWFf
Z2VtX2NyZWF0ZV9vYmplY3RfZGVmYXVsdF9mdW5jcywKPiA+ICAJLnByaW1lX2hhbmRsZV90b19m
ZAk9IGRybV9nZW1fcHJpbWVfaGFuZGxlX3RvX2ZkLAo+ID4gIAkucHJpbWVfZmRfdG9faGFuZGxl
CT0gZHJtX2dlbV9wcmltZV9mZF90b19oYW5kbGUsCj4gPiAtCS5nZW1fcHJpbWVfaW1wb3J0CT0g
ZHJtX2dlbV9wcmltZV9pbXBvcnQsCj4gPiAtCS5nZW1fcHJpbWVfZXhwb3J0CT0gZHJtX2dlbV9w
cmltZV9leHBvcnQsCj4gPiAtCS5nZW1fcHJpbWVfZ2V0X3NnX3RhYmxlCT0gZHJtX2dlbV9jbWFf
cHJpbWVfZ2V0X3NnX3RhYmxlLAo+ID4gIAkuZ2VtX3ByaW1lX2ltcG9ydF9zZ190YWJsZSA9IGRy
bV9nZW1fY21hX3ByaW1lX2ltcG9ydF9zZ190YWJsZSwKPiA+IC0JLmdlbV9wcmltZV92bWFwCQk9
IGRybV9nZW1fY21hX3ByaW1lX3ZtYXAsCj4gPiAtCS5nZW1fcHJpbWVfdnVubWFwCT0gZHJtX2dl
bV9jbWFfcHJpbWVfdnVubWFwLAo+ID4gIAkuZ2VtX3ByaW1lX21tYXAJCT0gZHJtX2dlbV9jbWFf
cHJpbWVfbW1hcCwKPiAKPiBJZiB5b3Ugd2FudCB0byBwaWNrIHVwIHlldCBhbm90aGVyIHJlY29t
bWVuZGF0aW9uLCB5b3UgY2FuIHVzZQo+IGRybV9nZW1fcHJpbWVfbW1hcCBoZXJlLgoKSSBjb21w
YXJlZCB0aGUgdHdvIGNhbGwgc3RhY2tzIGFuZCB0aGV5IGFwcGVhciBzaW1pbGFyLCBldmVuIGlm
CmRybV9nZW1fcHJpbWVfbW1hcCgpIGxlYWRzIHRvIGEgbW9yZSBjb252b2x1dGVkIGNvZGUgZmxv
dy4gRm9yIG15CmluZm9ybWF0aW9uLCB3aGF0J3MgdGhlIGFkdmFudGFnZSBpbiB1c2luZyBpdCA/
Cgo+IEVpdGhlciB3YXk6Cj4gCj4gUmV2aWV3ZWQtYnk6IE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxm
QHRyb25uZXMub3JnPgo+IAo+ID4gIAkuZHVtYl9jcmVhdGUJCT0gcmNhcl9kdV9kdW1iX2NyZWF0
ZSwKPiA+ICAJLmZvcHMJCQk9ICZyY2FyX2R1X2ZvcHMsCgotLSAKUmVnYXJkcywKCkxhdXJlbnQg
UGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
