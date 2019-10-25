Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F073FE49DC
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 13:22:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B60EC6E9A1;
	Fri, 25 Oct 2019 11:22:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8314B6E9A1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 11:22:35 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:56420
 helo=[192.168.10.177])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1iNxft-0004Hb-34; Fri, 25 Oct 2019 13:22:33 +0200
Subject: Re: [PATCH 5/5] drm/udl: Replace fbdev code with generic emulation
To: Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20191024144237.8898-1-tzimmermann@suse.de>
 <20191024144237.8898-6-tzimmermann@suse.de>
 <20191025074746.GR11828@phenom.ffwll.local>
 <20191025080059.GS11828@phenom.ffwll.local>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <5242a6a7-1af7-6dbe-3f8e-69d45ce0eb63@tronnes.org>
Date: Fri, 25 Oct 2019 13:22:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191025080059.GS11828@phenom.ffwll.local>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org
 ; s=ds201810; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dAUh1HN/0QmC1ucXBHxj691E8VNf9tUaTRkOyV8nhy4=; b=Us9k2AGK6JvCawiumh3gZr1CSV
 PPln7OOy5p2o1D6S2vey6dFQb32zR97He/mAO0NhdGleNz5AQdgxmo5WiIfiKM4KsKaeonvM4DCnf
 p7v+9ISiPsWA8wshVWamcS2E5Yg0Tqpo2o0AQnz9s4iUzvZE3OpRZ4f5uhVoKNUHH5hPmHdhB+rRd
 ebmmWlvz2MgwBoIa7Xb1RAfqUsHZQiFaGOaMU33e9vYJbjlUbuHPgP7g+LA4Ukd5SkS3F2e5IUuM4
 AMeLL+MmfwbST5qfXAGWazgy1OXFkPuzmttYGRu2nBeIeqIj0/GhzFZWmkrVDC8rMcaj5zulT8d+m
 atW3t2Yw==;
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
Cc: airlied@redhat.com, sean@poorly.run, dri-devel@lists.freedesktop.org,
 sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMjUuMTAuMjAxOSAxMC4wMCwgc2tyZXYgRGFuaWVsIFZldHRlcjoKPiBPbiBGcmksIE9j
dCAyNSwgMjAxOSBhdCAwOTo0Nzo0NkFNICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+PiBP
biBUaHUsIE9jdCAyNCwgMjAxOSBhdCAwNDo0MjozN1BNICswMjAwLCBUaG9tYXMgWmltbWVybWFu
biB3cm90ZToKPj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFu
bkBzdXNlLmRlPgo+Pj4gLS0tCj4+PiAgZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZHJ2LmMgICAg
IHwgICAzICsKPj4+ICBkcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9kcnYuaCAgICAgfCAgIDQgLQo+
Pj4gIGRyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2ZiLmMgICAgICB8IDI2MyArLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KPj4+ICBkcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9tYWluLmMgICAg
fCAgIDIgLQo+Pj4gIGRyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX21vZGVzZXQuYyB8ICAgMyArLQo+
Pj4gIDUgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAyNjcgZGVsZXRpb25zKC0pCj4+
Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2Rydi5jIGIvZHJpdmVy
cy9ncHUvZHJtL3VkbC91ZGxfZHJ2LmMKPj4+IGluZGV4IDE1YWQ3YTMzOGY5ZC4uNmJlYWExMTA5
YzJjIDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZHJ2LmMKPj4+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2Rydi5jCj4+PiBAQCAtNyw2ICs3LDcgQEAKPj4+
ICAKPj4+ICAjaW5jbHVkZSA8ZHJtL2RybV9jcnRjX2hlbHBlci5oPgo+Pj4gICNpbmNsdWRlIDxk
cm0vZHJtX2Rydi5oPgo+Pj4gKyNpbmNsdWRlIDxkcm0vZHJtX2ZiX2hlbHBlci5oPgo+Pj4gICNp
bmNsdWRlIDxkcm0vZHJtX2ZpbGUuaD4KPj4+ICAjaW5jbHVkZSA8ZHJtL2RybV9pb2N0bC5oPgo+
Pj4gICNpbmNsdWRlIDxkcm0vZHJtX3Byb2JlX2hlbHBlci5oPgo+Pj4gQEAgLTYyLDYgKzYzLDgg
QEAgc3RhdGljIHN0cnVjdCBkcm1fZHJpdmVyIGRyaXZlciA9IHsKPj4+ICAJLmRyaXZlcl9mZWF0
dXJlcyA9IERSSVZFUl9NT0RFU0VUIHwgRFJJVkVSX0dFTSwKPj4+ICAJLnJlbGVhc2UgPSB1ZGxf
ZHJpdmVyX3JlbGVhc2UsCj4+PiAgCj4+PiArCS5sYXN0Y2xvc2UgPSBkcm1fZmJfaGVscGVyX2xh
c3RjbG9zZSwKPj4+ICsKPj4+ICAJLyogZ2VtIGhvb2tzICovCj4+PiAgCS5nZW1fZnJlZV9vYmpl
Y3RfdW5sb2NrZWQgPSB1ZGxfZ2VtX2ZyZWVfb2JqZWN0LAo+Pj4gIAkuZ2VtX3ZtX29wcyA9ICZ1
ZGxfZ2VtX3ZtX29wcywKPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9k
cnYuaCBiL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2Rydi5oCj4+PiBpbmRleCAxMmE5NzBmZDlh
ODcuLjVmOGE3YWMwODRmNiAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRs
X2Rydi5oCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9kcnYuaAo+Pj4gQEAgLTUw
LDggKzUwLDYgQEAgc3RydWN0IHVyYl9saXN0IHsKPj4+ICAJc2l6ZV90IHNpemU7Cj4+PiAgfTsK
Pj4+ICAKPj4+IC1zdHJ1Y3QgdWRsX2ZiZGV2Owo+Pj4gLQo+Pj4gIHN0cnVjdCB1ZGxfZGV2aWNl
IHsKPj4+ICAJc3RydWN0IGRybV9kZXZpY2UgZHJtOwo+Pj4gIAlzdHJ1Y3QgZGV2aWNlICpkZXY7
Cj4+PiBAQCAtNjUsNyArNjMsNiBAQCBzdHJ1Y3QgdWRsX2RldmljZSB7Cj4+PiAgCXN0cnVjdCB1
cmJfbGlzdCB1cmJzOwo+Pj4gIAlhdG9taWNfdCBsb3N0X3BpeGVsczsgLyogMSA9IGEgcmVuZGVy
IG9wIGZhaWxlZC4gTmVlZCBzY3JlZW4gcmVmcmVzaCAqLwo+Pj4gIAo+Pj4gLQlzdHJ1Y3QgdWRs
X2ZiZGV2ICpmYmRldjsKPj4+ICAJY2hhciBtb2RlX2J1ZlsxMDI0XTsKPj4+ICAJdWludDMyX3Qg
bW9kZV9idWZfbGVuOwo+Pj4gIAlhdG9taWNfdCBieXRlc19yZW5kZXJlZDsgLyogcmF3IHBpeGVs
LWJ5dGVzIGRyaXZlciBhc2tlZCB0byByZW5kZXIgKi8KPj4+IEBAIC0xMTEsNyArMTA4LDYgQEAg
aW50IHVkbF9pbml0KHN0cnVjdCB1ZGxfZGV2aWNlICp1ZGwpOwo+Pj4gIHZvaWQgdWRsX2Zpbmko
c3RydWN0IGRybV9kZXZpY2UgKmRldik7Cj4+PiAgCj4+PiAgaW50IHVkbF9mYmRldl9pbml0KHN0
cnVjdCBkcm1fZGV2aWNlICpkZXYpOwo+Pj4gLXZvaWQgdWRsX2ZiZGV2X2NsZWFudXAoc3RydWN0
IGRybV9kZXZpY2UgKmRldik7Cj4+PiAgdm9pZCB1ZGxfZmJkZXZfdW5wbHVnKHN0cnVjdCBkcm1f
ZGV2aWNlICpkZXYpOwo+Pj4gIHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKgo+Pj4gIHVkbF9mYl91
c2VyX2ZiX2NyZWF0ZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAo+Pj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS91ZGwvdWRsX2ZiLmMgYi9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9mYi5j
Cj4+PiBpbmRleCBlZjM1MDRkMDYzNDMuLjQzYTFkYTNhNTZjMyAxMDA2NDQKPj4+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS91ZGwvdWRsX2ZiLmMKPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS91ZGwv
dWRsX2ZiLmMKPj4+IEBAIC0xOSwxOSArMTksOSBAQAo+Pj4gIAo+Pj4gICNpbmNsdWRlICJ1ZGxf
ZHJ2LmgiCj4+PiAgCj4+PiAtI2RlZmluZSBETF9ERUZJT19XUklURV9ERUxBWSAgICAoSFovMjAp
IC8qIGZiX2RlZmVycmVkX2lvLmRlbGF5IGluIGppZmZpZXMgKi8KPj4+IC0KPj4+IC1zdGF0aWMg
aW50IGZiX2RlZmlvID0gMDsgIC8qIE9wdGlvbmFsbHkgZW5hYmxlIGV4cGVyaW1lbnRhbCBmYl9k
ZWZpbyBtbWFwIHN1cHBvcnQgKi8KPiAKPiBDb3JyZWN0aW9uIG9uIG15IGVudGh1c2lhc20sIHRo
aXMgaGVyZSBpcyBhIHByb2JsZW06Cj4gCj4gVGhlIHVkbCBkZWZpbyBzdXBwb3J0IGFzLWlzIGlz
IGJyb2tlbiwgZmJkZXYgZGVmaW8gYW5kIHNobWVtIGFyZSBmaWdodAo+IG92ZXIgdGhlIHBhZ2Ug
ZmxhZ3MuIE5vdCBhIHByb2JsZW0gd2l0aCB0aGUgb2xkIGNvZGUsIHNpbmNlIGRpc2FibGVkIGJ5
Cj4gZGVmYXVsdC4gQnV0IHdpbGwgYmUgYSBwcm9ibGVtIHdpdGggdGhlIG5ldyBjb2RlLiBJIGd1
ZXNzIHlvdSBkaWRuJ3QgdGVzdAo+IGZiZGV2IG1tYXA/IFdlIHVuZm9ydHVuYXRlbHkgYWxzbyBs
YWNrIGFuIGVhc3kgaWd0IHRlc3RjYXNlIGZvciB0aGlzIC4uLgoKVGhpcyBpcyB3aGVyZSB0aGUg
c2hhZG93IGJ1ZmZlciBjb21lcyB0byB0aGUgcmVzY3VlLiBmYmRldiBnZXRzIGEKdm1hbGxvYyBi
dWZmZXIgYW5kIHRoaXMgaXMgYmxpdHRlZCBvbiB0aGUgc2htZW0gYnVmZmVyIGluIHRoZSBkZWZp
bwpjYWxsYmFjayBiZWZvcmUgY2FsbGluZyB0aGUgZnJhbWVidWZmZXIgLmRpcnR5IGNhbGxiYWNr
LiBTbyB0aGUgZGVmaW8KaW50ZXJuYWxzIG5ldmVyIHNlZXMgdGhlIHNobWVtIGJ1ZmZlci4gQXQg
bGVhc3QgdGhpcyB3b3JrZWQgd2hlbiBJIHdhcwp3cml0aW5nIHRoZSBzaG1lbSBoZWxwZXIuCgpO
b3JhbGYuCgo+IAo+IFRoZSBwcm9ibGVtIGlzIGZhaXJseSB0cmlja3kgdG8gc29sdmUsIGhlcmUn
cyBhbiB1bnRlc3RlZCBpZGVhIHRoYXQgbWlnaHQKPiB3b3JrOgo+IAo+IGh0dHBzOi8vZHJpLmZy
ZWVkZXNrdG9wLm9yZy9kb2NzL2RybS9ncHUvdG9kby5odG1sI2dlbmVyaWMtZmJkZXYtZGVmaW8t
c3VwcG9ydAo+IAo+IENoZWVycywgRGFuaWVsCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
