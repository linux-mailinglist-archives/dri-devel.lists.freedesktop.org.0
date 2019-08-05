Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B07BE82262
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 18:30:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC3686E1BE;
	Mon,  5 Aug 2019 16:30:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F7E6E1BE
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 16:30:42 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id v15so79344441eds.9
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 09:30:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=YBukRrgQ+vn/4ywKc0JsCavd7b3dhY5NK8aF4xIA1I4=;
 b=t/hjqoD8YQz9+DzQKK2/RBOwhjdTpM1oVkZaORfdlF105L3BHzBUFRY7BGPgOfKLS/
 SE2laS18A4rcuLzpHBpx1v3FYyA7of0bJ2th8pEKSyYe9vpMm9wHNP73uNs6SV02pous
 cXyOlKQKe3yGT3h9rodHSegj6sQrlStcoBOU42LyrZjIiaSScDRAVJ8FCKn+zwJnjS8K
 bWuOIgz4rfqyNDr15PiepjpOcg0nl7sI/sQ7ZaBRI55oQV5NVhrmz3cxCzDePH7TrFpB
 xBQ8VUVc18U/+q9ZJAcMQCFyNREYebcYQjioIGqgTLbrRwo4T7rKNxjiT59edyzJF9Zq
 cDZQ==
X-Gm-Message-State: APjAAAV5C9L0YrDSKItcuLpMqigfhwUeAM61TNnQv+r+dRRlIWflFJ3b
 gWH+CjsmESMjrL6TeXsVzFR3D4Hs9Do=
X-Google-Smtp-Source: APXvYqwuzIe7vD/BfKzsNBQ0Dd8r9cDvaYipt5RlgiaHXJF8w8fFcxles1dhHtIgJKablS7yAzAIGg==
X-Received: by 2002:a17:906:4354:: with SMTP id
 z20mr77166196ejm.163.1565022641016; 
 Mon, 05 Aug 2019 09:30:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id a55sm20328449eda.70.2019.08.05.09.30.40
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 09:30:40 -0700 (PDT)
Date: Mon, 5 Aug 2019 18:30:38 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Subject: Re: [PATCH] dma-buf: fix stack corruption in dma_fence_chain_release
Message-ID: <20190805163038.GU7444@phenom.ffwll.local>
References: <20190805073657.1389-1-christian.koenig@amd.com>
 <1ad7ef20-0207-7f80-ee12-ec98c1d5dfcb@intel.com>
 <af470fba-fb46-e0c4-caa0-220d6083ffc3@gmail.com>
 <3fe2fe25-75f2-7461-8c33-01ffa1de29ba@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3fe2fe25-75f2-7461-8c33-01ffa1de29ba@intel.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=YBukRrgQ+vn/4ywKc0JsCavd7b3dhY5NK8aF4xIA1I4=;
 b=LNWUMn6YoIDLQVXoQwmjgMR6osQF3tFjhxv6uEqeGjfaVLnTgHG/ms7LHLRneWgWfo
 k+SYe2NvaXmXTatrK/Umt1zojpCiOE+D+2Sbgsf2O5GNmrw1eaxKEj6qC/wZ0GQcAqTB
 a1aTidW1lNAtaG9OjHfuXOKTUAAUM510uLsgs=
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
Cc: christian.koenig@amd.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMDUsIDIwMTkgYXQgMDQ6MzI6MjBQTSArMDMwMCwgTGlvbmVsIExhbmR3ZXJs
aW4gd3JvdGU6Cj4gVGhhdCBvbmUgdGVzdCBjcmVhdGVzIGEgMzJrIGNoYWluIG9mIGZlbmNlcyBJ
IHRoaW5rLgo+IEFueXdheSBteSBrZXJuZWwgY3Jhc2ggd2FzIHVucmVsYXRlZCA7KQoKSG0gSSdk
IGV4cGVjdCB0aGF0IHdpdGggY2xldmVyIHVzZSBvZiB2Z2VtIGZha2UgZmVuY2VzIHdlIHNob3Vs
ZCBiZSBhYmxlCnRvIHJlcHJvIHRoaXMgYnVnIGhlcmUgd2l0aCBhbiBpZ3QuIFdvdWxkIGJlIHJl
YWwgbmljZSwgYW55IHRha2Vycz8KLURhbmllbAoKPiAKPiAtTGlvbmVsCj4gCj4gT24gMDUvMDgv
MjAxOSAxNjowMiwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiA+IE5vdCBldmVuIHJlbW90ZWx5
IDopSSB0ZXN0ZWQgdGhpcyB3aXRoIG15IG93biBjcmFmdGVkIGNvZGUgaW5zaWRlIHRoZQo+ID4g
a2VybmVsLgo+ID4gCj4gPiBJdCdzIHByb2JhYmx5IHF1aXRlIHNvbWUgaGFzc2xlIHRvIGFjdHVh
bGx5IHRyaWdnZXIgdGhpcyBwcm9ibGVtIGZyb20KPiA+IHVzZXJzcGFjZSBhbmQgSSBvbmx5IGZv
dW5kIGl0IGJlY2F1c2UgSSBjcmVhdGVkIGEgdmVyeSB2ZXJ5IGxvbmcKPiA+IHNlcXVlbmNlIGNo
YWluIGJ5IGFjY2lkZW50Lgo+ID4gCj4gPiBDaHJpc3RpYW4uCj4gPiAKPiA+IEFtIDA1LjA4LjE5
IHVtIDE0OjAzIHNjaHJpZWIgTGlvbmVsIExhbmR3ZXJsaW46Cj4gPiA+IEJ5IGFueSBjaGFuZ2Us
IGRpZCB5b3UgcnVuIGludG8gdGhpcyB3aXRoIGEgQ1RTIHRlc3Qgd2hvc2UgbmFtZSBlbmRzCj4g
PiA+IHdpdGggIi5jaGFpbiIgPyA6KQo+ID4gPiAKPiA+ID4gLUxpb25lbAo+ID4gPiAKPiA+ID4g
T24gMDUvMDgvMjAxOSAxMDozNiwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiA+ID4gPiBXZSBj
YW4ndCBmcmVlIHVwIHRoZSBjaGFpbiB1c2luZyByZWN1cnNpb24gb3Igd2UgcnVuIGludG8gYQo+
ID4gPiA+IHN0YWNrIG92ZXJmbG93Lgo+ID4gPiA+IAo+ID4gPiA+IE1hbnVhbGx5IGZyZWUgdXAg
dGhlIGRhbmdsaW5nIGNoYWluIG5vZGVzIHRvIGF2b2lkIHJlY3Vyc2lvbi4KPiA+ID4gPiAKPiA+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFt
ZC5jb20+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gwqAgZHJpdmVycy9kbWEtYnVmL2RtYS1mZW5jZS1j
aGFpbi5jIHwgMjQgKysrKysrKysrKysrKysrKysrKysrKystCj4gPiA+ID4gwqAgMSBmaWxlIGNo
YW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+ID4gPiAKPiA+ID4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEtYnVmL2RtYS1mZW5jZS1jaGFpbi5jCj4gPiA+ID4gYi9k
cml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLWNoYWluLmMKPiA+ID4gPiBpbmRleCBiNTA4OWY2NGJl
MmEuLjQ0YTc0MTY3N2QyNSAxMDA2NDQKPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2RtYS1idWYvZG1h
LWZlbmNlLWNoYWluLmMKPiA+ID4gPiArKysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLWNo
YWluLmMKPiA+ID4gPiBAQCAtMTc4LDggKzE3OCwzMCBAQCBzdGF0aWMgYm9vbCBkbWFfZmVuY2Vf
Y2hhaW5fc2lnbmFsZWQoc3RydWN0Cj4gPiA+ID4gZG1hX2ZlbmNlICpmZW5jZSkKPiA+ID4gPiDC
oCBzdGF0aWMgdm9pZCBkbWFfZmVuY2VfY2hhaW5fcmVsZWFzZShzdHJ1Y3QgZG1hX2ZlbmNlICpm
ZW5jZSkKPiA+ID4gPiDCoCB7Cj4gPiA+ID4gwqDCoMKgwqDCoCBzdHJ1Y3QgZG1hX2ZlbmNlX2No
YWluICpjaGFpbiA9IHRvX2RtYV9mZW5jZV9jaGFpbihmZW5jZSk7Cj4gPiA+ID4gK8KgwqDCoCBz
dHJ1Y3QgZG1hX2ZlbmNlICpwcmV2Owo+ID4gPiA+ICsKPiA+ID4gPiArwqDCoMKgIC8qIE1hbnVh
bGx5IHVubGluayB0aGUgY2hhaW4gYXMgbXVjaCBhcyBwb3NzaWJsZSB0byBhdm9pZAo+ID4gPiA+
IHJlY3Vyc2lvbgo+ID4gPiA+ICvCoMKgwqDCoCAqIGFuZCBwb3RlbnRpYWwgc3RhY2sgb3ZlcmZs
b3cuCj4gPiA+ID4gK8KgwqDCoMKgICovCj4gPiA+ID4gK8KgwqDCoCB3aGlsZSAoKHByZXYgPSBy
Y3VfZGVyZWZlcmVuY2VfcHJvdGVjdGVkKGNoYWluLT5wcmV2LCB0cnVlKSkpIHsKPiA+ID4gPiAr
wqDCoMKgwqDCoMKgwqAgc3RydWN0IGRtYV9mZW5jZV9jaGFpbiAqcHJldl9jaGFpbjsKPiA+ID4g
PiArCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgIGlmIChrcmVmX3JlYWQoJnByZXYtPnJlZmNvdW50
KSA+IDEpCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4gPiA+
ID4gKwo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoCBwcmV2X2NoYWluID0gdG9fZG1hX2ZlbmNlX2No
YWluKHByZXYpOwo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoCBpZiAoIXByZXZfY2hhaW4pCj4gPiA+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4gPiA+ID4gKwo+ID4gPiA+ICvCoMKg
wqDCoMKgwqDCoCAvKiBObyBuZWVkIGZvciBhdG9taWMgb3BlcmF0aW9ucyBzaW5jZSB3ZSBob2xk
IHRoZSBsYXN0Cj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqAgKiByZWZlcmVuY2UgdG8gcHJldl9j
aGFpbi4KPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoCAqLwo+ID4gPiA+ICvCoMKgwqDCoMKgwqDC
oCBjaGFpbi0+cHJldiA9IHByZXZfY2hhaW4tPnByZXY7Cj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKg
IFJDVV9JTklUX1BPSU5URVIocHJldl9jaGFpbi0+cHJldiwgTlVMTCk7Cj4gPiA+ID4gK8KgwqDC
oMKgwqDCoMKgIGRtYV9mZW5jZV9wdXQocHJldik7Cj4gPiA+ID4gK8KgwqDCoCB9Cj4gPiA+ID4g
K8KgwqDCoCBkbWFfZmVuY2VfcHV0KHByZXYpOwo+ID4gPiA+IMKgIC3CoMKgwqAgZG1hX2ZlbmNl
X3B1dChyY3VfZGVyZWZlcmVuY2VfcHJvdGVjdGVkKGNoYWluLT5wcmV2LCB0cnVlKSk7Cj4gPiA+
ID4gwqDCoMKgwqDCoCBkbWFfZmVuY2VfcHV0KGNoYWluLT5mZW5jZSk7Cj4gPiA+ID4gwqDCoMKg
wqDCoCBkbWFfZmVuY2VfZnJlZShmZW5jZSk7Cj4gPiA+ID4gwqAgfQo+ID4gPiAKPiA+ID4gCj4g
PiAKPiA+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBv
cmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
