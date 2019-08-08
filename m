Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB2587396
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 10:00:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8AA46ED14;
	Fri,  9 Aug 2019 08:00:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 088806E586
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 12:57:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 851BC15A2;
 Thu,  8 Aug 2019 05:57:38 -0700 (PDT)
Received: from [10.1.196.133] (e112269-lin.cambridge.arm.com [10.1.196.133])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9CA193F694;
 Thu,  8 Aug 2019 05:57:35 -0700 (PDT)
Subject: Re: [PATCH v3 6/8] drm/panfrost: Convert MMU IRQ handler to threaded
 handler
To: Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org
References: <20190802195150.23207-1-robh@kernel.org>
 <20190802195150.23207-7-robh@kernel.org>
From: Steven Price <steven.price@arm.com>
Message-ID: <2c53170f-157c-311d-7131-816f8ab1e079@arm.com>
Date: Thu, 8 Aug 2019 13:57:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190802195150.23207-7-robh@kernel.org>
Content-Language: en-GB
X-Mailman-Approved-At: Fri, 09 Aug 2019 08:00:17 +0000
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Robin Murphy <robin.murphy@arm.com>,
 David Airlie <airlied@linux.ie>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDIvMDgvMjAxOSAyMDo1MSwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gSW4gcHJlcGFyYXRpb24g
dG8gaGFuZGxlIG1hcHBpbmcgb2YgcGFnZSBmYXVsdHMsIHdlIG5lZWQgdGhlIE1NVSBoYW5kbGVy
Cj4gdG8gYmUgdGhyZWFkZWQgYXMgY29kZSBwYXRocyB0YWtlIGEgbXV0ZXguCj4gCj4gQXMgdGhl
IElSUSBtYXkgYmUgc2hhcmVkLCB3ZSBjYW4ndCB1c2UgdGhlIGRlZmF1bHQgaGFuZGxlciBhbmQg
bXVzdAo+IGRpc2FibGUgdGhlIE1NVSBpbnRlcnJ1cHRzIGxvY2FsbHkuCj4gCj4gQ2M6IFRvbWV1
IFZpem9zbyA8dG9tZXUudml6b3NvQGNvbGxhYm9yYS5jb20+Cj4gQ2M6IEJvcmlzIEJyZXppbGxv
biA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+Cj4gQ2M6IFJvYmluIE11cnBoeSA8cm9i
aW4ubXVycGh5QGFybS5jb20+Cj4gQ2M6IFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNlQGFybS5j
b20+Cj4gQ2M6IEFseXNzYSBSb3Nlbnp3ZWlnIDxhbHlzc2Eucm9zZW56d2VpZ0Bjb2xsYWJvcmEu
Y29tPgo+IFNpZ25lZC1vZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+CgpSZXZp
ZXdlZC1ieTogU3RldmVuIFByaWNlIDxzdGV2ZW4ucHJpY2VAYXJtLmNvbT4KCj4gLS0tCj4gIGRy
aXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9tbXUuYyB8IDIwICsrKysrKysrKysrKysr
Ky0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11
LmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11LmMKPiBpbmRleCBlYmE2
Y2U3ODVlZjAuLjdkNDQzMjhiMjgwZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFu
ZnJvc3QvcGFuZnJvc3RfbW11LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFu
ZnJvc3RfbW11LmMKPiBAQCAtMzAwLDEyICszMDAsMjAgQEAgc3RhdGljIGNvbnN0IGNoYXIgKmFj
Y2Vzc190eXBlX25hbWUoc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYsCj4gIHN0YXRpYyBp
cnFyZXR1cm5fdCBwYW5mcm9zdF9tbXVfaXJxX2hhbmRsZXIoaW50IGlycSwgdm9pZCAqZGF0YSkK
PiAgewo+ICAJc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYgPSBkYXRhOwo+IC0JdTMyIHN0
YXR1cyA9IG1tdV9yZWFkKHBmZGV2LCBNTVVfSU5UX1NUQVQpOwo+IC0JaW50IGk7Cj4gIAo+IC0J
aWYgKCFzdGF0dXMpCj4gKwlpZiAoIW1tdV9yZWFkKHBmZGV2LCBNTVVfSU5UX1NUQVQpKQo+ICAJ
CXJldHVybiBJUlFfTk9ORTsKPiAgCj4gKwltbXVfd3JpdGUocGZkZXYsIE1NVV9JTlRfTUFTSywg
MCk7Cj4gKwlyZXR1cm4gSVJRX1dBS0VfVEhSRUFEOwo+ICt9Cj4gKwo+ICtzdGF0aWMgaXJxcmV0
dXJuX3QgcGFuZnJvc3RfbW11X2lycV9oYW5kbGVyX3RocmVhZChpbnQgaXJxLCB2b2lkICpkYXRh
KQo+ICt7Cj4gKwlzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldiA9IGRhdGE7Cj4gKwl1MzIg
c3RhdHVzID0gbW11X3JlYWQocGZkZXYsIE1NVV9JTlRfUkFXU1RBVCk7Cj4gKwlpbnQgaTsKPiAr
Cj4gIAlkZXZfZXJyKHBmZGV2LT5kZXYsICJtbXUgaXJxIHN0YXR1cz0leFxuIiwgc3RhdHVzKTsK
PiAgCj4gIAlmb3IgKGkgPSAwOyBzdGF0dXM7IGkrKykgewo+IEBAIC0zNTAsNiArMzU4LDcgQEAg
c3RhdGljIGlycXJldHVybl90IHBhbmZyb3N0X21tdV9pcnFfaGFuZGxlcihpbnQgaXJxLCB2b2lk
ICpkYXRhKQo+ICAJCXN0YXR1cyAmPSB+bWFzazsKPiAgCX0KPiAgCj4gKwltbXVfd3JpdGUocGZk
ZXYsIE1NVV9JTlRfTUFTSywgfjApOwo+ICAJcmV0dXJuIElSUV9IQU5ETEVEOwo+ICB9Owo+ICAK
PiBAQCAtMzY4LDggKzM3Nyw5IEBAIGludCBwYW5mcm9zdF9tbXVfaW5pdChzdHJ1Y3QgcGFuZnJv
c3RfZGV2aWNlICpwZmRldikKPiAgCWlmIChpcnEgPD0gMCkKPiAgCQlyZXR1cm4gLUVOT0RFVjsK
PiAgCj4gLQllcnIgPSBkZXZtX3JlcXVlc3RfaXJxKHBmZGV2LT5kZXYsIGlycSwgcGFuZnJvc3Rf
bW11X2lycV9oYW5kbGVyLAo+IC0JCQkgICAgICAgSVJRRl9TSEFSRUQsICJtbXUiLCBwZmRldik7
Cj4gKwllcnIgPSBkZXZtX3JlcXVlc3RfdGhyZWFkZWRfaXJxKHBmZGV2LT5kZXYsIGlycSwgcGFu
ZnJvc3RfbW11X2lycV9oYW5kbGVyLAo+ICsJCQkJCXBhbmZyb3N0X21tdV9pcnFfaGFuZGxlcl90
aHJlYWQsCj4gKwkJCQkJSVJRRl9TSEFSRUQsICJtbXUiLCBwZmRldik7Cj4gIAo+ICAJaWYgKGVy
cikgewo+ICAJCWRldl9lcnIocGZkZXYtPmRldiwgImZhaWxlZCB0byByZXF1ZXN0IG1tdSBpcnEi
KTsKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
