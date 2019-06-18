Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E284D4A2E2
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 15:56:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A3626E176;
	Tue, 18 Jun 2019 13:56:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6194F6E176
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 13:56:22 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:51204
 helo=[192.168.10.173])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hdEay-0001Vf-I8; Tue, 18 Jun 2019 15:56:20 +0200
Subject: Re: [PATCH] drm: rcar-du: Replace drm_driver GEM ops with GEM object
 functions
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20190618131329.30336-1-laurent.pinchart+renesas@ideasonboard.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <6d60ba59-60a2-58b3-c78b-5bd85e3a660b@tronnes.org>
Date: Tue, 18 Jun 2019 15:56:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190618131329.30336-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=Q/RwDQFrb3dcl/FL0bW4yFjiR6exH+nuBXsFFNpJbgc=; 
 b=eTy4pCdX4fFcXYVs9Om6zknzXKMYpj1h6JVf2+wHydBpCBGOgbaH/88yzjlyendqpbVdm7/DMIytKk+TBd3+tk3+gtIES1/ICKjBtnP5s4xizGoxvXoiCpHGyAs7XA6dhbHZkjZpCegVg/GAfgC9EgW/HlgHnlefJM+sUaKuCgWnySFjt+9Qw7urWJ2xIw0uD0fkX+zvdHxNsa50llYoDqAqDkQbCvLQGf9tx7o3DPpdDE5geFYuA0IGvjjAQYby54NXujpIDr1Ouaw4nk5bn3iQVbgcmiA3IEsr/x4svh8uQgGHf/k9qvie0EHSvMcYoPiiw6Wf79Ewdo1F7bMW+w==;
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
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMTguMDYuMjAxOSAxNS4xMywgc2tyZXYgTGF1cmVudCBQaW5jaGFydDoKPiBUaGUgcmVj
b21tZW5kZWQgd2F5IHRvIHNwZWNpZnkgR0VNIG9iamVjdCBmdW5jdGlvbnMgaXMgdG8gcHJvdmlk
ZSBhCj4gZHJtX2dlbV9vYmplY3RfZnVuY3Mgc3RydWN0dXJlIGluc3RhbmNlIGFuZCBzZXQgdGhl
IEdFTSBvYmplY3QgdG8gcG9pbnQKPiB0byBpdC4gVGhlIGRybV9jbWFfZ2VtX2NyZWF0ZV9vYmpl
Y3RfZGVmYXVsdF9mdW5jcygpIGZ1bmN0aW9uIHByb3ZpZGVkCj4gYnkgdGhlIEdFTSBDTUEgaGVs
cGVyIGRvZXMgc28gd2hlbiBjcmVhdGluZyB0aGUgR0VNIG9iamVjdCwgc2ltcGxpZnlpbmcKPiB0
aGUgZHJpdmVyIGltcGxlbWVudGF0aW9uLiBTd2l0Y2ggdG8gaXQsIGFuZCByZW1vdmUgdGhlIHRo
ZW4gdW5uZWVkZWQKPiBHRU0tcmVsYXRlZCBvcGVydGlvbnMgZnJvbSByY2FyX2R1X2RyaXZlci4K
CnMvb3BlcnRpb25zL29wZXJhdGlvbnMvCgo+IAo+IFN1Z2dlc3RlZC1ieTogRGFuaWVsIFZldHRl
ciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiBTaWduZWQtb2ZmLWJ5OiBMYXVyZW50IFBpbmNo
YXJ0IDxsYXVyZW50LnBpbmNoYXJ0K3JlbmVzYXNAaWRlYXNvbmJvYXJkLmNvbT4KPiAtLS0KPiAg
ZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9kcnYuYyB8IDggKy0tLS0tLS0KPiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA3IGRlbGV0aW9ucygtKQo+IAo+IERhbmllbCwg
aXMgdGhpcyB3aGF0IHlvdSBoYWQgaW4gbWluZCA/Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9y
Y2FyX2R1X2Rydi5jCj4gaW5kZXggM2U1ZTgzNWVhMmI2Li40Y2JiODIwMDk5MzEgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9kcnYuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfZHJ2LmMKPiBAQCAtNDQ1LDE2ICs0NDUsMTAgQEAg
REVGSU5FX0RSTV9HRU1fQ01BX0ZPUFMocmNhcl9kdV9mb3BzKTsKPiAgc3RhdGljIHN0cnVjdCBk
cm1fZHJpdmVyIHJjYXJfZHVfZHJpdmVyID0gewo+ICAJLmRyaXZlcl9mZWF0dXJlcwk9IERSSVZF
Ul9HRU0gfCBEUklWRVJfTU9ERVNFVCB8IERSSVZFUl9QUklNRQo+ICAJCQkJfCBEUklWRVJfQVRP
TUlDLAo+IC0JLmdlbV9mcmVlX29iamVjdF91bmxvY2tlZCA9IGRybV9nZW1fY21hX2ZyZWVfb2Jq
ZWN0LAo+IC0JLmdlbV92bV9vcHMJCT0gJmRybV9nZW1fY21hX3ZtX29wcywKPiArCS5nZW1fY3Jl
YXRlX29iamVjdCAgICAgID0gZHJtX2NtYV9nZW1fY3JlYXRlX29iamVjdF9kZWZhdWx0X2Z1bmNz
LAo+ICAJLnByaW1lX2hhbmRsZV90b19mZAk9IGRybV9nZW1fcHJpbWVfaGFuZGxlX3RvX2ZkLAo+
ICAJLnByaW1lX2ZkX3RvX2hhbmRsZQk9IGRybV9nZW1fcHJpbWVfZmRfdG9faGFuZGxlLAo+IC0J
LmdlbV9wcmltZV9pbXBvcnQJPSBkcm1fZ2VtX3ByaW1lX2ltcG9ydCwKPiAtCS5nZW1fcHJpbWVf
ZXhwb3J0CT0gZHJtX2dlbV9wcmltZV9leHBvcnQsCj4gLQkuZ2VtX3ByaW1lX2dldF9zZ190YWJs
ZQk9IGRybV9nZW1fY21hX3ByaW1lX2dldF9zZ190YWJsZSwKPiAgCS5nZW1fcHJpbWVfaW1wb3J0
X3NnX3RhYmxlID0gZHJtX2dlbV9jbWFfcHJpbWVfaW1wb3J0X3NnX3RhYmxlLAo+IC0JLmdlbV9w
cmltZV92bWFwCQk9IGRybV9nZW1fY21hX3ByaW1lX3ZtYXAsCj4gLQkuZ2VtX3ByaW1lX3Z1bm1h
cAk9IGRybV9nZW1fY21hX3ByaW1lX3Z1bm1hcCwKPiAgCS5nZW1fcHJpbWVfbW1hcAkJPSBkcm1f
Z2VtX2NtYV9wcmltZV9tbWFwLAoKSWYgeW91IHdhbnQgdG8gcGljayB1cCB5ZXQgYW5vdGhlciBy
ZWNvbW1lbmRhdGlvbiwgeW91IGNhbiB1c2UKZHJtX2dlbV9wcmltZV9tbWFwIGhlcmUuCgpFaXRo
ZXIgd2F5OgoKUmV2aWV3ZWQtYnk6IE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMub3Jn
PgoKPiAgCS5kdW1iX2NyZWF0ZQkJPSByY2FyX2R1X2R1bWJfY3JlYXRlLAo+ICAJLmZvcHMJCQk9
ICZyY2FyX2R1X2ZvcHMsCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
