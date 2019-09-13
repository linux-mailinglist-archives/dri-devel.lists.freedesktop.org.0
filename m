Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C51CB1FD3
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 15:46:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D5836F3BB;
	Fri, 13 Sep 2019 13:46:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D5A9B6F3BB
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 13:46:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E0601000;
 Fri, 13 Sep 2019 06:46:48 -0700 (PDT)
Received: from [10.1.196.133] (e112269-lin.cambridge.arm.com [10.1.196.133])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB51C3F67D;
 Fri, 13 Sep 2019 06:46:47 -0700 (PDT)
Subject: Re: [PATCH 2/2] drm/panfrost: Extend the bo_wait() ioctl
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
References: <20190913111748.21071-1-boris.brezillon@collabora.com>
 <20190913111748.21071-2-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <2f9a6efa-2361-ebe0-3e28-64081dd5043b@arm.com>
Date: Fri, 13 Sep 2019 14:46:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190913111748.21071-2-boris.brezillon@collabora.com>
Content-Language: en-GB
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTMvMDkvMjAxOSAxMjoxNywgQm9yaXMgQnJlemlsbG9uIHdyb3RlOgo+IFNvIHdlIGNhbiBj
aG9vc2UgdG8gd2FpdCBmb3IgYWxsIEJPIHVzZXJzLCBvciBqdXN0IGZvciB3cml0ZXJzLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9y
YS5jb20+CgpMb29rcyBnb29kIHRvIG1lOgoKUmV2aWV3ZWQtYnk6IFN0ZXZlbiBQcmljZSA8c3Rl
dmVuLnByaWNlQGFybS5jb20+CgpBbHRob3VnaCBJIGRvbid0IGtub3cgaWYgdGhlIHRlcm0gIndy
aXRlcnMiIHNob3VsZCBiZSBpbiB0aGUgQVBJIG9yIGlmCiJleGNsdXNpdmUiIGlzIHRoZSBwcmVm
ZXJyZWQgdGVybT8KClN0ZXZlCgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFu
ZnJvc3RfZHJ2LmMgfCA4ICsrKysrKy0tCj4gIGluY2x1ZGUvdWFwaS9kcm0vcGFuZnJvc3RfZHJt
LmggICAgICAgICB8IDQgKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9z
dC9wYW5mcm9zdF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYu
Ywo+IGluZGV4IDA4MDgyZmQ1NTdjMy4uNmE5NGFlYTIxNDdmIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYuYwo+IEBAIC0zMjIsMTYgKzMyMiwyMCBAQCBwYW5mcm9z
dF9pb2N0bF93YWl0X2JvKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCj4gIAlz
dHJ1Y3QgZHJtX3BhbmZyb3N0X3dhaXRfYm8gKmFyZ3MgPSBkYXRhOwo+ICAJc3RydWN0IGRybV9n
ZW1fb2JqZWN0ICpnZW1fb2JqOwo+ICAJdW5zaWduZWQgbG9uZyB0aW1lb3V0ID0gZHJtX3RpbWVv
dXRfYWJzX3RvX2ppZmZpZXMoYXJncy0+dGltZW91dF9ucyk7Cj4gKwlib29sIHdhaXRfYWxsID0g
IShhcmdzLT5mbGFncyAmIFBBTkZST1NUX1dBSVRfQk9fV1JJVEVSUyk7Cj4gIAo+ICAJaWYgKGFy
Z3MtPnBhZCkKPiAgCQlyZXR1cm4gLUVJTlZBTDsKPiAgCj4gKwlpZiAoYXJncy0+ZmxhZ3MgJiB+
UEFORlJPU1RfV0FJVF9CT19XUklURVJTKQo+ICsJCXJldHVybiAtRUlOVkFMOwo+ICsKPiAgCWdl
bV9vYmogPSBkcm1fZ2VtX29iamVjdF9sb29rdXAoZmlsZV9wcml2LCBhcmdzLT5oYW5kbGUpOwo+
ICAJaWYgKCFnZW1fb2JqKQo+ICAJCXJldHVybiAtRU5PRU5UOwo+ICAKPiAtCXJldCA9IGRtYV9y
ZXN2X3dhaXRfdGltZW91dF9yY3UoZ2VtX29iai0+cmVzdiwgdHJ1ZSwKPiAtCQkJCQkJICB0cnVl
LCB0aW1lb3V0KTsKPiArCXJldCA9IGRtYV9yZXN2X3dhaXRfdGltZW91dF9yY3UoZ2VtX29iai0+
cmVzdiwgd2FpdF9hbGwsCj4gKwkJCQkJdHJ1ZSwgdGltZW91dCk7Cj4gIAlpZiAoIXJldCkKPiAg
CQlyZXQgPSB0aW1lb3V0ID8gLUVUSU1FRE9VVCA6IC1FQlVTWTsKPiAgCj4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvdWFwaS9kcm0vcGFuZnJvc3RfZHJtLmggYi9pbmNsdWRlL3VhcGkvZHJtL3BhbmZy
b3N0X2RybS5oCj4gaW5kZXggMDI5YzZhZTFiMWYwLi5hYzRmYWNiY2VlNDcgMTAwNjQ0Cj4gLS0t
IGEvaW5jbHVkZS91YXBpL2RybS9wYW5mcm9zdF9kcm0uaAo+ICsrKyBiL2luY2x1ZGUvdWFwaS9k
cm0vcGFuZnJvc3RfZHJtLmgKPiBAQCAtMTExLDYgKzExMSw5IEBAIHN0cnVjdCBkcm1fcGFuZnJv
c3Rfc3VibWl0IHsKPiAgCV9fdTMyIHBhZDsKPiAgfTsKPiAgCj4gKyNkZWZpbmUgUEFORlJPU1Rf
V0FJVF9BTExfQk9fVVNFUlMJKDAgPDwgMCkKPiArI2RlZmluZSBQQU5GUk9TVF9XQUlUX0JPX1dS
SVRFUlMJKDEgPDwgMCkKPiArCj4gIC8qKgo+ICAgKiBzdHJ1Y3QgZHJtX3BhbmZyb3N0X3dhaXRf
Ym8gLSBpb2N0bCBhcmd1bWVudCBmb3Igd2FpdGluZyBmb3IKPiAgICogY29tcGxldGlvbiBvZiB0
aGUgbGFzdCBEUk1fUEFORlJPU1RfU1VCTUlUIG9uIGEgQk8uCj4gQEAgLTEyMyw2ICsxMjYsNyBA
QCBzdHJ1Y3QgZHJtX3BhbmZyb3N0X3dhaXRfYm8gewo+ICAJX191MzIgaGFuZGxlOwo+ICAJX191
MzIgcGFkOwo+ICAJX19zNjQgdGltZW91dF9uczsJLyogYWJzb2x1dGUgKi8KPiArCV9fdTY0IGZs
YWdzOwo+ICB9Owo+ICAKPiAgI2RlZmluZSBQQU5GUk9TVF9CT19OT0VYRUMJMQo+IAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
