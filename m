Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D03BC1700A8
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 15:00:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE436E969;
	Wed, 26 Feb 2020 14:00:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0C306E969
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 14:00:19 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id g64so2957402otb.13
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 06:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gZbFrj4fht2dg5A6jWrRWxGf88chrz+8U8w5kkgh//8=;
 b=GCEyea/+bRH6INlCIDaRJoGK6dEFdn4GeaDTWGUs2baK0GDaPUIsPNcZR71r0QuIhR
 A+DiKbQhdUTRZww7xkT0E5wBRZ6ERYYQRdTt3HcVI31mV9LyVX06K6SesFbsic+82w7G
 /nhIjyW9L+8nnZ/9ydRDa6NLS4cfqGW7jTlfw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gZbFrj4fht2dg5A6jWrRWxGf88chrz+8U8w5kkgh//8=;
 b=nxPriP6BpHE0IuO/ZEw8hH3jOcN4f2yJ2s4gZkGYwT2VMDkWfW9eL1I7WhgfyW6EiC
 03JFuZybzGU/Ntl4C7+wQzJtqqUrg/0Nd26jv3Q+0e3TKpS30AgugrhDqnGZiwvaD2ek
 ojtpdiW9V6j9+6fI1Q7LZrn1nFYxj2SAFIx6tSgU048F8TfHU0xo4jl9wa4MX0NlNeTD
 E7U90ntUSK8hHievKIfceq35wkPFOkqb0s1HSo7CEyOzUEfJ3+E0+DlU9NTfnVj/pjuK
 BMSD6oNbppU4xlxjNKST9/sNd/ENY4awYhRGD8KSG3zqPclrdQUTRQFwfFvNhKkEHHW+
 tbXw==
X-Gm-Message-State: APjAAAU1v/47lMElTQeeONE6o16rx99Ibff/I+Zl7oVFhZO6enEZgc3a
 DWgxqOK1p3lcCAxSIWbY5Uxu9MV+7fjcIB8or06eag==
X-Google-Smtp-Source: APXvYqwUVpCg3bmncHxJCwNqbUTq9bA8MBfl80VDQyE4XVClHfMJ32bbMnQHoIlSqXyT1iAKhClcmE56rfb8WlIUqCg=
X-Received: by 2002:a05:6830:2015:: with SMTP id
 e21mr3039564otp.106.1582725618978; 
 Wed, 26 Feb 2020 06:00:18 -0800 (PST)
MIME-Version: 1.0
References: <20200225185614.1058688-1-alexander.deucher@amd.com>
 <0e6fa597-62c4-3dd3-27bf-fa5ddd6ec1a4@gmail.com>
 <CADnq5_Ox=8+drn8TKSYoo6iCF9fQK6rCtD+uRQSFH3qqGQgO9A@mail.gmail.com>
 <42760da2-ad4f-4bc1-ca25-d176fb94a52d@amd.com>
 <33f5a17b-c2f3-1a56-276d-675c520a83fc@gmail.com>
In-Reply-To: <33f5a17b-c2f3-1a56-276d-675c520a83fc@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 26 Feb 2020 15:00:07 +0100
Message-ID: <CAKMK7uE06VKMa7kyT3b1-p_nksF_FFnG8aCFpjrYB5eZuh6m2g@mail.gmail.com>
Subject: Re: [PATCH] drm/ttm: fix leaking fences via ttm_buffer_object_transfer
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Ahzo <Ahzo@tutanota.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBGZWIgMjYsIDIwMjAgYXQgMjozMCBQTSBDaHJpc3RpYW4gS8O2bmlnCjxja29lbmln
LmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBBbSAyNS4wMi4yMCB1bSAyMDox
MiBzY2hyaWViIENocmlzdGlhbiBLw7ZuaWc6Cj4gPiBBbSAyNS4wMi4yMCB1bSAyMDoxMSBzY2hy
aWViIEFsZXggRGV1Y2hlcjoKPiA+PiBPbiBUdWUsIEZlYiAyNSwgMjAyMCBhdCAyOjA5IFBNIENo
cmlzdGlhbiBLw7ZuaWcKPiA+PiA8Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdy
b3RlOgo+ID4+PiBBbSAyNS4wMi4yMCB1bSAxOTo1NiBzY2hyaWViIEFsZXggRGV1Y2hlcjoKPiA+
Pj4+IEZyb206IEFoem8gPEFoem9AdHV0YW5vdGEuY29tPgo+ID4+Pj4KPiA+Pj4+IFNldCB0aGUg
ZHJtX2RldmljZSB0byBOVUxMLCBzbyB0aGF0IHRoZSBuZXdseSBjcmVhdGVkIGJ1ZmZlciBvYmpl
Y3QKPiA+Pj4+IGRvZXNuJ3QgYXBwZWFyIHRvIHVzZSB0aGUgZW1iZWRkZWQgZ2VtIG9iamVjdC4K
PiA+Pj4+Cj4gPj4+PiBUaGlzIGlzIG5lY2Vzc2FyeSwgYmVjYXVzZSBvdGhlcndpc2Ugbm8gY29y
cmVzcG9uZGluZyBkbWFfcmVzdl9maW5pCj4gPj4+PiBmb3IKPiA+Pj4+IHRoZSBkbWFfcmVzdl9p
bml0IGlzIGNhbGxlZCwgcmVzdWx0aW5nIGluIGEgbWVtb3J5IGxlYWsuCj4gPj4+Pgo+ID4+Pj4g
VGhlIGRtYV9yZXN2X2ZpbmkgaW4gdHRtX2JvX3JlbGVhc2VfbGlzdCBpcyBvbmx5IGNhbGxlZCBp
ZiB0aGUKPiA+Pj4+IGVtYmVkZGVkCj4gPj4+PiBnZW0gb2JqZWN0IGlzIG5vdCB1c2VkLCB3aGlj
aCBpcyBkZXRlcm1pbmVkIGJ5IGNoZWNraW5nIGlmIHRoZQo+ID4+Pj4gZHJtX2RldmljZSBpcyBO
VUxMLgo+ID4+Pj4KPiA+Pj4+IEJ1ZzoKPiA+Pj4+IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnBy
b3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmdpdGxhYi5mcmVlZGVza3Rv
cC5vcmclMkZkcm0lMkZhbWQlMkZpc3N1ZXMlMkY5NTgmYW1wO2RhdGE9MDIlN0MwMSU3Q2Nocmlz
dGlhbi5rb2VuaWclNDBhbWQuY29tJTdDYWEzZjc3NGRhMDNlNGRmY2MwOWEwOGQ3YmEyNjgzMDUl
N0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3QzAlN0MwJTdDNjM3MTgyNTQ2ODc5
MTQ0MDMwJmFtcDtzZGF0YT1OOFd4WVpaUmo1b2JNVTVTTHYwZ2lvZzBhMXNDWWklMkZvdXhTdVdO
b20wZ3clM0QmYW1wO3Jlc2VydmVkPTAKPiA+Pj4+IEZpeGVzOiAxZTA1M2IxMGJhNjAgKCJkcm0v
dHRtOiB1c2UgZ2VtIHJlc2VydmF0aW9uIG9iamVjdCIpCj4gPj4+PiBTaWduZWQtb2ZmLWJ5OiBB
aHpvIDxBaHpvQHR1dGFub3RhLmNvbT4KPiA+Pj4+IFNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hl
ciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiA+Pj4gR29vZCBjYXRjaCBJIHdhcyB0cnlp
bmcgdG8gaHVudCB0aGF0IG9uZSBkb3duIGFzIHdlbGwuCj4gPj4+Cj4gPj4+IFJldmlld2VkLWJ5
OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gPj4gQ2FuIHlv
dSBhcHBseSBpdCB0byBkcm0tbWlzYz8KPiA+Cj4gPiBTdXJlLCBidXQgbm90IHRvZGF5LiBOZWVk
IHRvIGdldCB0aGUga2lkcyB0byBiZWQuCj4KPiBTbyBqdXN0IHB1c2hlZCB0byBkcm0tbWlzYy1m
aXhlcy4gRG8gd2UgYWxzbyBuZWVkIHRoYXQgb24KPiBhbWQtc3RhZ2luZy1kcm0tbmV4dD8KCkJh
Y2ttZXJnZSAtcmM0IChvbmNlIGl0J3MgcmVsZWFzZWQpIHByb2JhYmx5IGEgZ29vZCBpZGVhLiBP
cgpjaGVycnktcGljayB3aXRoIGEgbm90ZSB3aHkgeW91IG5lZWRlZCBpdCByZWFsIHF1aWNrLgot
RGFuaWVsCgo+Cj4gQ2hyaXN0aWFuLgo+Cj4gPgo+ID4gQ2hyaXN0aWFuLgo+ID4KPiA+Pgo+ID4+
IFRoYW5rcywKPiA+Pgo+ID4+IEFsZXgKPiA+Pgo+ID4+Pj4gLS0tCj4gPj4+PiAgICBkcml2ZXJz
L2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMgfCAxICsKPiA+Pj4+ICAgIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKQo+ID4+Pj4KPiA+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vdHRtL3R0bV9ib191dGlsLmMKPiA+Pj4+IGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9f
dXRpbC5jCj4gPj4+PiBpbmRleCBjOGUzNTlkZWQxZGYuLjQ0YzFlN2FkZmI3YyAxMDA2NDQKPiA+
Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwuYwo+ID4+Pj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdXRpbC5jCj4gPj4+PiBAQCAtNTE0LDYgKzUxNCw3
IEBAIHN0YXRpYyBpbnQgdHRtX2J1ZmZlcl9vYmplY3RfdHJhbnNmZXIoc3RydWN0Cj4gPj4+PiB0
dG1fYnVmZmVyX29iamVjdCAqYm8sCj4gPj4+PiAgICAgICAgICAgICAgICBmYm8tPmJhc2UuYmFz
ZS5yZXN2ID0gJmZiby0+YmFzZS5iYXNlLl9yZXN2Owo+ID4+Pj4KPiA+Pj4+ICAgICAgICBkbWFf
cmVzdl9pbml0KCZmYm8tPmJhc2UuYmFzZS5fcmVzdik7Cj4gPj4+PiArICAgICBmYm8tPmJhc2Uu
YmFzZS5kZXYgPSBOVUxMOwo+ID4+Pj4gICAgICAgIHJldCA9IGRtYV9yZXN2X3RyeWxvY2soJmZi
by0+YmFzZS5iYXNlLl9yZXN2KTsKPiA+Pj4+ICAgICAgICBXQVJOX09OKCFyZXQpOwo+ID4+Pj4K
PiA+Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
ID4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiA+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cj4gPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
ZngKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
ZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAoKCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRp
b24KKzQxICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
