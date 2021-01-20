Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6A22FD229
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jan 2021 15:05:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 540E4899F2;
	Wed, 20 Jan 2021 14:05:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 478DB899F2
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 14:05:11 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id p5so25103629oif.7
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 06:05:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=v0qGg49xcemOBrVvnnaWkXpY/JV5c3kQ4FhI1tZLljI=;
 b=Up4bCwslyUO1C38MQBy3fIDSbjU/4lFAxHitiUGJ4IJDcoR9rYcZX2pZirlZ8iEv9b
 rBVGzCViqGvaXL7pjzuRsEjf/vXQW/nIK3Bm4oMHl9AuLWfzlYbzyya/rXbcqJeQiyl8
 ngNpKZinV5kIxB4sVGTAaHUiBZ7y0FdoMXFr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=v0qGg49xcemOBrVvnnaWkXpY/JV5c3kQ4FhI1tZLljI=;
 b=Rcg1nFx1A0ihXj1gnr9cttuQOhLCIOwPDUMafCPojXAK0dKB04imcXrfJPK82h774d
 haFmI4HS/ocCMeazKL7j0xWsotyd6lSrD2Vrlro2/jVrgdabXXVTf+0GCC702O3t1ugr
 Tca/R5GCzZHEcYr+ePQtcAEU8ffb653m3DHMSzqLGgEei5ozSRKOglriaUxheEZixY61
 xtswhpb9aOKoawohgHFvbUqU2CKBSDoWNbfbRKuWWux5lrXJQCa7rjqygkyE6CfbzeAE
 c04PYSk+mR2fkw1QCsx8hM2e1nPWY2y1JKhhYCofB8QWK2UZtVOCazdzY631d/OW+HLa
 nZhA==
X-Gm-Message-State: AOAM531EtuZwGJIq0tGWDINsi7bYqw/Jkssa4J1TMFONW5hhLfETzlR8
 iALvCgH2yVbgvIczu0HLRvxb5WcBooDMyOisUKIcJA==
X-Google-Smtp-Source: ABdhPJy4wUehRTbpqEsfH4wUxDt6KdLiUIwx1fWbLM2A8Sh6vZbctMrLBY6UAx1C6E1Ip+PRi85OoS8WMyWH2YlYCA8=
X-Received: by 2002:aca:1906:: with SMTP id l6mr2902295oii.101.1611151510577; 
 Wed, 20 Jan 2021 06:05:10 -0800 (PST)
MIME-Version: 1.0
References: <20210120123535.40226-1-paul@crapouillou.net>
 <20210120123535.40226-3-paul@crapouillou.net>
 <CAKMK7uFaP7xcw90=KqiGJd7Mt-gD-spvcxvOZr2Txhyv5vcBvw@mail.gmail.com>
 <TFI8NQ.468S4PLHPA963@crapouillou.net>
In-Reply-To: <TFI8NQ.468S4PLHPA963@crapouillou.net>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 20 Jan 2021 15:04:59 +0100
Message-ID: <CAKMK7uEu7vWcJFC6S_hmKB4UMwPocwiOEy1iFnftOs5zfsRNYQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm/ingenic: Register devm action to cleanup
 encoders
To: Paul Cercueil <paul@crapouillou.net>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, od@zcrc.me,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 stable <stable@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKYW4gMjAsIDIwMjEgYXQgMjoyMSBQTSBQYXVsIENlcmN1ZWlsIDxwYXVsQGNyYXBv
dWlsbG91Lm5ldD4gd3JvdGU6Cj4KPgo+Cj4gTGUgbWVyLiAyMCBqYW52LiAyMDIxIMOgIDE0OjAx
LCBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+IGEKPiDDqWNyaXQgOgo+ID4gT24gV2Vk
LCBKYW4gMjAsIDIwMjEgYXQgMTozNiBQTSBQYXVsIENlcmN1ZWlsIDxwYXVsQGNyYXBvdWlsbG91
Lm5ldD4KPiA+IHdyb3RlOgo+ID4+Cj4gPj4gIFNpbmNlIHRoZSBlbmNvZGVycyBoYXZlIGJlZW4g
ZGV2bS1hbGxvY2F0ZWQsIHRoZXkgd2lsbCBiZSBmcmVlZCB3YXkKPiA+PiAgYmVmb3JlIGRybV9t
b2RlX2NvbmZpZ19jbGVhbnVwKCkgaXMgY2FsbGVkLiBUbyBhdm9pZCB1c2UtYWZ0ZXItZnJlZQo+
ID4+ICBjb25kaXRpb25zLCB3ZSB0aGVuIG11c3QgZW5zdXJlIHRoYXQgZHJtX2VuY29kZXJfY2xl
YW51cCgpIGlzIGNhbGxlZAo+ID4+ICBiZWZvcmUgdGhlIGVuY29kZXJzIGFyZSBmcmVlZC4KPiA+
Pgo+ID4+ICB2MjogVXNlIHRoZSBuZXcgX19kcm1tX3NpbXBsZV9lbmNvZGVyX2FsbG9jKCkgZnVu
Y3Rpb24KPiA+Pgo+ID4+ICBGaXhlczogYzM2OWNiMjdjMjY3ICgiZHJtL2luZ2VuaWM6IFN1cHBv
cnQgbXVsdGlwbGUgcGFuZWxzL2JyaWRnZXMiKQo+ID4+ICBDYzogPHN0YWJsZUB2Z2VyLmtlcm5l
bC5vcmc+ICMgNS44Kwo+ID4+ICBTaWduZWQtb2ZmLWJ5OiBQYXVsIENlcmN1ZWlsIDxwYXVsQGNy
YXBvdWlsbG91Lm5ldD4KPiA+PiAgLS0tCj4gPj4KPiA+PiAgTm90ZXM6Cj4gPj4gICAgICBVc2Ug
dGhlIFYxIG9mIHRoaXMgcGF0Y2ggdG8gZml4IHY1LjExIGFuZCBvbGRlciBrZXJuZWxzLiBUaGlz
Cj4gPj4gVjIgb25seQo+ID4+ICAgICAgYXBwbGllcyBvbiB0aGUgY3VycmVudCBkcm0tbWlzYy1u
ZXh0IGJyYW5jaC4KPiA+Pgo+ID4+ICAgZHJpdmVycy9ncHUvZHJtL2luZ2VuaWMvaW5nZW5pYy1k
cm0tZHJ2LmMgfCAxNiArKysrKysrLS0tLS0tLS0tCj4gPj4gICAxIGZpbGUgY2hhbmdlZCwgNyBp
bnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+ID4+Cj4gPj4gIGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vaW5nZW5pYy9pbmdlbmljLWRybS1kcnYuYwo+ID4+IGIvZHJpdmVycy9ncHUv
ZHJtL2luZ2VuaWMvaW5nZW5pYy1kcm0tZHJ2LmMKPiA+PiAgaW5kZXggN2JiMzFmYmVlMjlkLi4x
NTg0MzNiNGMwODQgMTAwNjQ0Cj4gPj4gIC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pbmdlbmljL2lu
Z2VuaWMtZHJtLWRydi5jCj4gPj4gICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pbmdlbmljL2luZ2Vu
aWMtZHJtLWRydi5jCj4gPj4gIEBAIC0xMDE0LDIwICsxMDE0LDE4IEBAIHN0YXRpYyBpbnQgaW5n
ZW5pY19kcm1fYmluZChzdHJ1Y3QgZGV2aWNlCj4gPj4gKmRldiwgYm9vbCBoYXNfY29tcG9uZW50
cykKPiA+PiAgICAgICAgICAgICAgICAgICAgICAgICAgYnJpZGdlID0KPiA+PiBkZXZtX2RybV9w
YW5lbF9icmlkZ2VfYWRkX3R5cGVkKGRldiwgcGFuZWwsCj4gPj4KPiA+PiBEUk1fTU9ERV9DT05O
RUNUT1JfRFBJKTsKPiA+Pgo+ID4+ICAtICAgICAgICAgICAgICAgZW5jb2RlciA9IGRldm1fa3ph
bGxvYyhkZXYsIHNpemVvZigqZW5jb2RlciksCj4gPj4gR0ZQX0tFUk5FTCk7Cj4gPj4gIC0gICAg
ICAgICAgICAgICBpZiAoIWVuY29kZXIpCj4gPj4gIC0gICAgICAgICAgICAgICAgICAgICAgIHJl
dHVybiAtRU5PTUVNOwo+ID4+ICArICAgICAgICAgICAgICAgZW5jb2RlciA9IF9fZHJtbV9zaW1w
bGVfZW5jb2Rlcl9hbGxvYyhkcm0sCj4gPj4gc2l6ZW9mKCplbmNvZGVyKSwgMCwKPiA+Cj4gPiBQ
bGVhc2UgZG9uJ3QgdXNlIHRoZSBfXyBwcmVmaXhlZCBmdW5jdGlvbnMsIHRob3NlIGFyZSB0aGUg
aW50ZXJuYWwKPiA+IG9uZXMuIFRoZSBvZmZpY2lhbCBvbmUgY29tZXMgd2l0aCB0eXBlIGNoZWNr
aW5nIGFuZCBhbGwgdGhhdCBpbmNsdWRlZC4KPiA+IE90aGVyd2lzZSBsZ3RtLgo+ID4gLURhbmll
bAo+Cj4gVGhlIG5vbi1wcmVmaXhlZCBvbmUgYXNzdW1lcyB0aGF0IEkgd2FudCB0byBhbGxvY2F0
ZSBhIHN0cnVjdCB0aGF0Cj4gY29udGFpbnMgdGhlIGVuY29kZXIsIG5vdCBqdXN0IHRoZSBkcm1f
ZW5jb2RlciBpdHNlbGYuCgpIbSwgYnV0IHVzaW5nIHRoZSBpbnRlcm5hbCBvbmUgaXMgYWxzbyBh
IGJpdCB0b28gdWdseS4gQQpkcm1fcGxhaW5fc2ltcGxlX2Vub2NkZXJfYWxsb2MoZHJtLCB0eXBl
KSB3cmFwcGVyIHdvdWxkIGJlIHRoZSByaWdodAp0aGluZyBoZXJlIEkgdGhpbms/IFNldHRpbmcg
dGhlIG9mZnNldHMgYW5kIHN0cnVjdCBzaXplcyBkaXJlY3RseSBpbgp0aGVzZSBpbiBkcml2ZXJz
IHJlYWxseSBkb2Vzbid0IGZlZWwgbGlrZSBhIGdvb2QgaWRlYS4gSSB0aGluayBzaW1wbGUKZW5j
b2RlciBpcyB0aGUgb25seSBjYXNlIHdoZXJlIHdlIHJlYWxseSBoYXZlIGEgbmVlZCBmb3IgYQpu
b24tZW1iZWRkYWJsZSBzdHJ1Y3QuCi1EYW5pZWwKCj4KPiAtUGF1bAo+Cj4gPj4gICsKPiA+PiBE
Uk1fTU9ERV9FTkNPREVSX0RQSSk7Cj4gPj4gICsgICAgICAgICAgICAgICBpZiAoSVNfRVJSKGVu
Y29kZXIpKSB7Cj4gPj4gICsgICAgICAgICAgICAgICAgICAgICAgIHJldCA9IFBUUl9FUlIoZW5j
b2Rlcik7Cj4gPj4gICsgICAgICAgICAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiRmFpbGVk
IHRvIGluaXQgZW5jb2RlcjoKPiA+PiAlZFxuIiwgcmV0KTsKPiA+PiAgKyAgICAgICAgICAgICAg
ICAgICAgICAgcmV0dXJuIHJldDsKPiA+PiAgKyAgICAgICAgICAgICAgIH0KPiA+Pgo+ID4+ICAg
ICAgICAgICAgICAgICAgZW5jb2Rlci0+cG9zc2libGVfY3J0Y3MgPSAxOwo+ID4+Cj4gPj4gICAg
ICAgICAgICAgICAgICBkcm1fZW5jb2Rlcl9oZWxwZXJfYWRkKGVuY29kZXIsCj4gPj4gJmluZ2Vu
aWNfZHJtX2VuY29kZXJfaGVscGVyX2Z1bmNzKTsKPiA+Pgo+ID4+ICAtICAgICAgICAgICAgICAg
cmV0ID0gZHJtX3NpbXBsZV9lbmNvZGVyX2luaXQoZHJtLCBlbmNvZGVyLAo+ID4+IERSTV9NT0RF
X0VOQ09ERVJfRFBJKTsKPiA+PiAgLSAgICAgICAgICAgICAgIGlmIChyZXQpIHsKPiA+PiAgLSAg
ICAgICAgICAgICAgICAgICAgICAgZGV2X2VycihkZXYsICJGYWlsZWQgdG8gaW5pdCBlbmNvZGVy
Ogo+ID4+ICVkXG4iLCByZXQpOwo+ID4+ICAtICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4g
cmV0Owo+ID4+ICAtICAgICAgICAgICAgICAgfQo+ID4+ICAtCj4gPj4gICAgICAgICAgICAgICAg
ICByZXQgPSBkcm1fYnJpZGdlX2F0dGFjaChlbmNvZGVyLCBicmlkZ2UsIE5VTEwsIDApOwo+ID4+
ICAgICAgICAgICAgICAgICAgaWYgKHJldCkgewo+ID4+ICAgICAgICAgICAgICAgICAgICAgICAg
ICBkZXZfZXJyKGRldiwgIlVuYWJsZSB0byBhdHRhY2ggYnJpZGdlXG4iKTsKPiA+PiAgLS0KPiA+
PiAgMi4yOS4yCj4gPj4KPiA+Cj4gPgo+ID4gLS0KPiA+IERhbmllbCBWZXR0ZXIKPiA+IFNvZnR3
YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgo+ID4gaHR0cDovL2Jsb2cuZmZ3bGwuY2gK
Pgo+CgoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0
aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
