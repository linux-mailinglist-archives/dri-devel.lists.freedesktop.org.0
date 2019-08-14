Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C54628DAD2
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 19:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80CD16E78D;
	Wed, 14 Aug 2019 17:20:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E72B56E78D
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 17:20:57 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id g8so1509729edm.6
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 10:20:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=2SSlhA8I2aJ8cn77MLFXPtF5FypHsv0kHKmSG620T2A=;
 b=ItmwPUT+F2SfBMGdNA02Dr98KQ2b9GbpO+lYP8LRKAA/p+yigBQ4ENw81GyOnRfGUe
 Q0mrcbJbqlNjBRIQAJ8B3wpAUf5U5Nk6JOmgAqlYULuOk4ChJlf+o+BQR8Cq+Lc2nd/r
 UAW/U/uEtoTeri7Qw1qxXcDGP8QYDNN+vkMqNjElF4bWkn5T+puQblRH9N4/v6R1WZvj
 7hpVSLxdcJb661qk5MkGGr4SkqXpkuzYqkzhzgbgSpk8PTwb/VXv/z3XU4UkRUDC5FvJ
 8JU9Ujoq1uYtdEjRv4HmVbt0I9cWyjcCgLsaMaIwxu8iEKzvGxW3hOAnOCTwY1Eii7RK
 5EWg==
X-Gm-Message-State: APjAAAWXe69Yc3aZsHW9/qJ0on10ybIx4/YM7zc2hhbvzUSvnqUC/40G
 pfrZmkX3w3hFJ5p8OMaZfsVyuA==
X-Google-Smtp-Source: APXvYqxlx4Rnq8Ghkt7yD5yGxgbHfqAu0pxJAgs4oMN1WEeQkA9QNKH2q6Ms+CASRKl29m8ze1UTpQ==
X-Received: by 2002:a17:907:39a:: with SMTP id
 ss26mr661750ejb.278.1565803256435; 
 Wed, 14 Aug 2019 10:20:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id i4sm30716ejs.39.2019.08.14.10.20.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 14 Aug 2019 10:20:55 -0700 (PDT)
Date: Wed, 14 Aug 2019 19:20:53 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH 5/4] dma-fence: Have dma_fence_signal call signal_locked
Message-ID: <20190814172053.GM7444@phenom.ffwll.local>
References: <3b4da1e6-b5df-0f0e-cf4d-21dd6fd33e32@amd.com>
 <20190811091523.9382-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190811091523.9382-1-chris@chris-wilson.co.uk>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=2SSlhA8I2aJ8cn77MLFXPtF5FypHsv0kHKmSG620T2A=;
 b=iTGOia/wImOqDf3M3cRHa3ihV4i08UnRlxXuTKsWy6u18x3KDZoGaRlwyyqzuC8rJR
 RWoB4uyeJrKx0ZbhjCpvRCQv9tGOKmthMh9VB8FnsrXcoJq+szAjkdz2yFAM8opC9xN4
 roWUmc6oTaLQvTfzaQo9v9nfHdUxW6NjwHDds=
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
Cc: intel-gfx@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBBdWcgMTEsIDIwMTkgYXQgMTA6MTU6MjNBTSArMDEwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IE5vdyB0aGF0IGRtYV9mZW5jZV9zaWduYWwgYWx3YXlzIHRha2VzIHRoZSBzcGlubG9j
ayB0byBmbHVzaCB0aGUKPiBjYl9saXN0LCBzaW1wbHkgdGFrZSB0aGUgc3BpbmxvY2sgYW5kIGNh
bGwgZG1hX2ZlbmNlX3NpZ25hbF9sb2NrZWQoKSB0bwo+IGF2b2lkIGNvZGUgcmVwZXRpdGlvbi4K
PiAKPiBTdWdnZXN0ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5j
by51az4KPiBDYzogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoK
SG0sIEkgdGhpbmsgdGhpcyBsYXJnZWx5IGRlZmVhdHMgdGhlIHBvaW50IG9mIGhhdmluZyB0aGUg
bG9ja2xlc3Mgc2lnbmFsCmVuYWJsaW5nIHRyaWNrZXJ5IGluIGRtYV9mZW5jZS4gTWF5YmUgdGhh
dCBwYXJ0IGlzbid0IG5lZWRlZCBieSBhbnlvbmUsCmJ1dCBmZWVscyBsaWtlIGEgdGhpbmcgdGhh
dCBuZWVkcyBhIG5vdGNoIG1vcmUgdGhvdWdodC4gQW5kIGlmIHdlIG5lZWQgaXQsCm1heWJlIGEg
Yml0IG1vcmUgY2xlYW51cC4KCkkgZ3Vlc3Mgd2l0aCB0aGUgYWRkaXRpb24gb2YgbW9yZSBmYW5j
eSBhdG9taWMgQklUcyB3ZSBjb3VsZCBhdm9pZCB0aGlzCnRvbyAuLi4gYnV0IG5vIGlkZWEgd2hl
dGhlciB0aGF0J3Mgd29ydGggdGhlIGVmZm9ydC4KLURhbmllbAoKPiAtLS0KPiAgZHJpdmVycy9k
bWEtYnVmL2RtYS1mZW5jZS5jIHwgMzIgKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0K
PiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMgYi9kcml2ZXJzL2RtYS1i
dWYvZG1hLWZlbmNlLmMKPiBpbmRleCBhYjRhNDU2YmJhMDQuLjM2N2I3MTA4NGQzNCAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMKPiArKysgYi9kcml2ZXJzL2RtYS1i
dWYvZG1hLWZlbmNlLmMKPiBAQCAtMTIyLDI2ICsxMjIsMTggQEAgRVhQT1JUX1NZTUJPTChkbWFf
ZmVuY2VfY29udGV4dF9hbGxvYyk7Cj4gICAqLwo+ICBpbnQgZG1hX2ZlbmNlX3NpZ25hbF9sb2Nr
ZWQoc3RydWN0IGRtYV9mZW5jZSAqZmVuY2UpCj4gIHsKPiAtCWludCByZXQgPSAwOwo+IC0KPiAt
CWxvY2tkZXBfYXNzZXJ0X2hlbGQoZmVuY2UtPmxvY2spOwo+IC0KPiAgCWlmIChXQVJOX09OKCFm
ZW5jZSkpCj4gIAkJcmV0dXJuIC1FSU5WQUw7Cj4gIAo+IC0JaWYgKCFfX2RtYV9mZW5jZV9zaWdu
YWwoZmVuY2UpKSB7Cj4gLQkJcmV0ID0gLUVJTlZBTDsKPiArCWxvY2tkZXBfYXNzZXJ0X2hlbGQo
ZmVuY2UtPmxvY2spOwo+ICAKPiAtCQkvKgo+IC0JCSAqIHdlIG1pZ2h0IGhhdmUgcmFjZWQgd2l0
aCB0aGUgdW5sb2NrZWQgZG1hX2ZlbmNlX3NpZ25hbCwKPiAtCQkgKiBzdGlsbCBydW4gdGhyb3Vn
aCBhbGwgY2FsbGJhY2tzCj4gLQkJICovCj4gLQl9IGVsc2Ugewo+IC0JCV9fZG1hX2ZlbmNlX3Np
Z25hbF9fdGltZXN0YW1wKGZlbmNlLCBrdGltZV9nZXQoKSk7Cj4gLQl9Cj4gKwlpZiAoIV9fZG1h
X2ZlbmNlX3NpZ25hbChmZW5jZSkpCj4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4gIAo+ICsJX19kbWFf
ZmVuY2Vfc2lnbmFsX190aW1lc3RhbXAoZmVuY2UsIGt0aW1lX2dldCgpKTsKPiAgCV9fZG1hX2Zl
bmNlX3NpZ25hbF9fbm90aWZ5KGZlbmNlKTsKPiAtCXJldHVybiByZXQ7Cj4gKwo+ICsJcmV0dXJu
IDA7Cj4gIH0KPiAgRVhQT1JUX1NZTUJPTChkbWFfZmVuY2Vfc2lnbmFsX2xvY2tlZCk7Cj4gIAo+
IEBAIC0xNjEsMTkgKzE1MywxOSBAQCBFWFBPUlRfU1lNQk9MKGRtYV9mZW5jZV9zaWduYWxfbG9j
a2VkKTsKPiAgaW50IGRtYV9mZW5jZV9zaWduYWwoc3RydWN0IGRtYV9mZW5jZSAqZmVuY2UpCj4g
IHsKPiAgCXVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4gKwlpbnQgcmV0Owo+ICAKPiAgCWlmICghZmVu
Y2UpCj4gIAkJcmV0dXJuIC1FSU5WQUw7Cj4gIAo+IC0JaWYgKCFfX2RtYV9mZW5jZV9zaWduYWwo
ZmVuY2UpKQo+IC0JCXJldHVybiAtRUlOVkFMOwo+IC0KPiAtCV9fZG1hX2ZlbmNlX3NpZ25hbF9f
dGltZXN0YW1wKGZlbmNlLCBrdGltZV9nZXQoKSk7Cj4gKwlpZiAodGVzdF9iaXQoRE1BX0ZFTkNF
X0ZMQUdfU0lHTkFMRURfQklULCAmZmVuY2UtPmZsYWdzKSkKPiArCQlyZXR1cm4gMDsKPiAgCj4g
IAlzcGluX2xvY2tfaXJxc2F2ZShmZW5jZS0+bG9jaywgZmxhZ3MpOwo+IC0JX19kbWFfZmVuY2Vf
c2lnbmFsX19ub3RpZnkoZmVuY2UpOwo+ICsJcmV0ID0gZG1hX2ZlbmNlX3NpZ25hbF9sb2NrZWQo
ZmVuY2UpOwo+ICAJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZShmZW5jZS0+bG9jaywgZmxhZ3MpOwo+
IC0JcmV0dXJuIDA7Cj4gKwo+ICsJcmV0dXJuIHJldDsKPiAgfQo+ICBFWFBPUlRfU1lNQk9MKGRt
YV9mZW5jZV9zaWduYWwpOwo+ICAKPiAtLSAKPiAyLjIzLjAucmMxCj4gCj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBs
aXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgotLSAKRGFuaWVsIFZldHRl
cgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwu
Y2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
