Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BEC10D6F3
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 15:24:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30E356E91F;
	Fri, 29 Nov 2019 14:24:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1220D6E91F
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 14:24:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A0BD1FB;
 Fri, 29 Nov 2019 06:24:50 -0800 (PST)
Received: from [10.1.194.43] (e112269-lin.cambridge.arm.com [10.1.194.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BEF803F52E;
 Fri, 29 Nov 2019 06:24:49 -0800 (PST)
Subject: Re: [PATCH 2/8] drm/panfrost: Fix a race in panfrost_ioctl_madvise()
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
References: <20191129135908.2439529-1-boris.brezillon@collabora.com>
 <20191129135908.2439529-3-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <dd8a946c-5666-a7b8-f7bc-06647e0d0bbc@arm.com>
Date: Fri, 29 Nov 2019 14:24:48 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191129135908.2439529-3-boris.brezillon@collabora.com>
Content-Language: en-US
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
Cc: dri-devel@lists.freedesktop.org, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjkvMTEvMjAxOSAxMzo1OSwgQm9yaXMgQnJlemlsbG9uIHdyb3RlOgo+IElmIDIgdGhyZWFk
cyBjaGFuZ2UgdGhlIE1BRFZJU0UgcHJvcGVydHkgb2YgdGhlIHNhbWUgQk8gaW4gcGFyYWxsZWwg
d2UKPiBtaWdodCBlbmQgdXAgd2l0aCBhbiBzaG1lbS0+bWFkdiB2YWx1ZSB0aGF0J3MgaW5jb25z
aXN0ZW50IHdpdGggdGhlCj4gcHJlc2VuY2Ugb2YgdGhlIEJPIGluIHRoZSBzaHJpbmtlciBsaXN0
LgoKSSdtIGEgYml0IHdvcnJpZWQgZnJvbSB0aGUgcG9pbnQgb2YgdmlldyBvZiB1c2VyIHNwYWNl
IHNhbml0eSB0aGF0IHlvdQpvYnNlcnZlZCB0aGlzIC0gYnV0IGNsZWFybHkgdGhlIGtlcm5lbCBz
aG91bGQgYmUgcm9idXN0IQoKPiAKPiBUaGUgZWFzaWVzdCBzb2x1dGlvbiB0byBmaXggdGhhdCBp
cyB0byBwcm90ZWN0IHRoZQo+IGRybV9nZW1fc2htZW1fbWFkdmlzZSgpIGNhbGwgd2l0aCB0aGUg
c2hyaW5rZXIgbG9jay4KPiAKPiBGaXhlczogMDEzYjY1MTAxMzE1ICgiZHJtL3BhbmZyb3N0OiBB
ZGQgbWFkdmlzZSBhbmQgc2hyaW5rZXIgc3VwcG9ydCIpCj4gQ2M6IDxzdGFibGVAdmdlci5rZXJu
ZWwub3JnPgo+IFNpZ25lZC1vZmYtYnk6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9u
QGNvbGxhYm9yYS5jb20+CgpSZXZpZXdlZC1ieTogU3RldmVuIFByaWNlIDxzdGV2ZW4ucHJpY2VA
YXJtLmNvbT4KCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYu
YyB8IDkgKysrKy0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDUgZGVs
ZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5m
cm9zdF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYuYwo+IGlu
ZGV4IGYyMWJjOGE3ZWUzYS4uZWZjMGEyNGQxZjRjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5m
cm9zdC9wYW5mcm9zdF9kcnYuYwo+IEBAIC0zNDcsMjAgKzM0NywxOSBAQCBzdGF0aWMgaW50IHBh
bmZyb3N0X2lvY3RsX21hZHZpc2Uoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwK
PiAgCQlyZXR1cm4gLUVOT0VOVDsKPiAgCX0KPiAgCj4gKwltdXRleF9sb2NrKCZwZmRldi0+c2hy
aW5rZXJfbG9jayk7Cj4gIAlhcmdzLT5yZXRhaW5lZCA9IGRybV9nZW1fc2htZW1fbWFkdmlzZShn
ZW1fb2JqLCBhcmdzLT5tYWR2KTsKPiAgCj4gIAlpZiAoYXJncy0+cmV0YWluZWQpIHsKPiAgCQlz
dHJ1Y3QgcGFuZnJvc3RfZ2VtX29iamVjdCAqYm8gPSB0b19wYW5mcm9zdF9ibyhnZW1fb2JqKTsK
PiAgCj4gLQkJbXV0ZXhfbG9jaygmcGZkZXYtPnNocmlua2VyX2xvY2spOwo+IC0KPiAgCQlpZiAo
YXJncy0+bWFkdiA9PSBQQU5GUk9TVF9NQURWX0RPTlRORUVEKQo+IC0JCQlsaXN0X2FkZF90YWls
KCZiby0+YmFzZS5tYWR2X2xpc3QsICZwZmRldi0+c2hyaW5rZXJfbGlzdCk7Cj4gKwkJCWxpc3Rf
YWRkX3RhaWwoJmJvLT5iYXNlLm1hZHZfbGlzdCwKPiArCQkJCSAgICAgICZwZmRldi0+c2hyaW5r
ZXJfbGlzdCk7Cj4gIAkJZWxzZSBpZiAoYXJncy0+bWFkdiA9PSBQQU5GUk9TVF9NQURWX1dJTExO
RUVEKQo+ICAJCQlsaXN0X2RlbF9pbml0KCZiby0+YmFzZS5tYWR2X2xpc3QpOwo+IC0KPiAtCQlt
dXRleF91bmxvY2soJnBmZGV2LT5zaHJpbmtlcl9sb2NrKTsKPiAgCX0KPiArCW11dGV4X3VubG9j
aygmcGZkZXYtPnNocmlua2VyX2xvY2spOwo+ICAKPiAgCWRybV9nZW1fb2JqZWN0X3B1dF91bmxv
Y2tlZChnZW1fb2JqKTsKPiAgCXJldHVybiAwOwo+IAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
