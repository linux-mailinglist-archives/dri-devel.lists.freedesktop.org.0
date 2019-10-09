Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65530D138C
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 18:05:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3BA589CE3;
	Wed,  9 Oct 2019 16:05:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6796589C98;
 Wed,  9 Oct 2019 16:05:44 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1C4ED21929;
 Wed,  9 Oct 2019 16:05:44 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id u22so4112425qtq.13;
 Wed, 09 Oct 2019 09:05:44 -0700 (PDT)
X-Gm-Message-State: APjAAAVzbviUsxoOXu/+azkXe4vV9LPAwtv53vipHqerxVOoEt+PwnWQ
 LzYSJgRZF3qBoE9DvLvxoVf6K8J24qMCbh7P7w==
X-Google-Smtp-Source: APXvYqzWkTMtk//Qj9WbPM1EhoREw8+jBIDWZzniQXmbbVBtpanz/lzoj1XT+fEiwugYeIbS3705BVRux+vXeRFUalQ=
X-Received: by 2002:ac8:6782:: with SMTP id b2mr4479199qtp.143.1570637143177; 
 Wed, 09 Oct 2019 09:05:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190927134616.21899-1-yuq825@gmail.com>
 <20190927134616.21899-2-yuq825@gmail.com>
 <20191009150708.GE16989@phenom.ffwll.local>
In-Reply-To: <20191009150708.GE16989@phenom.ffwll.local>
From: Rob Herring <robh@kernel.org>
Date: Wed, 9 Oct 2019 11:05:31 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+dz1fU0TsiPB9qhCJpumf8Qz=ANmPyEL0SJiX+q1TXWw@mail.gmail.com>
Message-ID: <CAL_Jsq+dz1fU0TsiPB9qhCJpumf8Qz=ANmPyEL0SJiX+q1TXWw@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] drm/gem: refine drm_gem_objects_lookup
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1570637144;
 bh=OkD3atkfQf3NVN3DEejKTSQgq6T9EuvT2kk8OVhf6S0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=zGQxRBqyw2NFc/SdECOB8IS8oLWZTxnHVD9xvlDMwxW5Qwvxul/yjqXSt+0yaHqhU
 r4+O9WAEnNbtColq/nqy8prmjs77AA3LV1waI0gyiRlYCnTzAE9brnNgfvVCKizbVr
 tEsq8WbQlYTmfmisALgLHEfdJfT79xZWL69tDV6I=
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, lima@lists.freedesktop.org,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, David Airlie <airlied@linux.ie>,
 Qiang Yu <yuq825@gmail.com>, Sean Paul <sean@poorly.run>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgOSwgMjAxOSBhdCAxMDowNyBBTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3
bGwuY2g+IHdyb3RlOgo+Cj4gT24gRnJpLCBTZXAgMjcsIDIwMTkgYXQgMDk6NDY6MTFQTSArMDgw
MCwgUWlhbmcgWXUgd3JvdGU6Cj4gPiBkcm1fZ2VtX29iamVjdHNfbG9va3VwIGRvZXMgbm90IHVz
ZSB1c2VyIHNwYWNlIGJvIGhhbmRsZXMKPiA+IGRpcmVjdGx5IGFuZCBsZWZ0IHRoZSB1c2VyIHRv
IGtlcm5lbCBjb3B5IHdvcmsgdG8gYSBuZXcKPiA+IGludGVyZmFjZSBkcm1fZ2VtX29iamVjdHNf
bG9va3VwX3VzZXIuCj4gPgo+ID4gVGhpcyBpcyBmb3IgZHJpdmVyIGxpa2UgbGltYSB3aGljaCBk
b2VzIG5vdCBwYXNzIGdlbSBibwo+ID4gaGFuZGxlcyBjb250aW5vdXNseSBpbiBhbiBhcnJheSBp
biBpb2N0bCBhcmd1bWVudC4KPiA+Cj4gPiB2MjoKPiA+IDEuIGFkZCBkcm1fZ2VtX29iamVjdHNf
bG9va3VwX3VzZXIKPiA+IDIuIHJlbW92ZSBub25lLXplcm8gY2hlY2sgYXMgYWxsIGNhbGxlciB3
aWxsIGNoZWNrIGJlZm9yZQo+ID4gICAgY2FsbGluZyB0aGlzIGZ1bmN0aW9uCj4gPgo+ID4gQ2M6
IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gPiBDYzogVG9tZXUgVml6b3NvIDx0b21l
dS52aXpvc29AY29sbGFib3JhLmNvbT4KPiA+IENjOiBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmlj
ZUBhcm0uY29tPgo+ID4gQ2M6IEFseXNzYSBSb3Nlbnp3ZWlnIDxhbHlzc2Eucm9zZW56d2VpZ0Bj
b2xsYWJvcmEuY29tPgo+ID4gU3VnZ2VzdGVkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwu
b3JnPgo+ID4gU2lnbmVkLW9mZi1ieTogUWlhbmcgWXUgPHl1cTgyNUBnbWFpbC5jb20+Cj4gPiAt
LS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbS5jICAgICAgICAgICAgICAgfCA1NyArKysr
KysrKysrKysrKysrKysrLS0tLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZy
b3N0X2Rydi5jIHwgIDYgKy0tCj4gPiAgaW5jbHVkZS9kcm0vZHJtX2dlbS5oICAgICAgICAgICAg
ICAgICAgIHwgIDQgKy0KPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDQ5IGluc2VydGlvbnMoKyksIDE4
IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dl
bS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYwo+ID4gaW5kZXggNjg1NGY1ODY3ZDUxLi5h
NWU4OGMzZTZkMjUgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbS5jCj4g
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbS5jCj4gPiBAQCAtNjc5LDExICs2NzksMTEg
QEAgc3RhdGljIGludCBvYmplY3RzX2xvb2t1cChzdHJ1Y3QgZHJtX2ZpbGUgKmZpbHAsIHUzMiAq
aGFuZGxlLCBpbnQgY291bnQsCj4gPiAgLyoqCj4gPiAgICogZHJtX2dlbV9vYmplY3RzX2xvb2t1
cCAtIGxvb2sgdXAgR0VNIG9iamVjdHMgZnJvbSBhbiBhcnJheSBvZiBoYW5kbGVzCj4gPiAgICog
QGZpbHA6IERSTSBmaWxlIHByaXZhdGUgZGF0ZQo+ID4gLSAqIEBib19oYW5kbGVzOiB1c2VyIHBv
aW50ZXIgdG8gYXJyYXkgb2YgdXNlcnNwYWNlIGhhbmRsZQo+ID4gKyAqIEBib19oYW5kbGVzOiBh
cnJheSBvZiBHRU0gb2JqZWN0IGhhbmRsZXMKPiA+ICAgKiBAY291bnQ6IHNpemUgb2YgaGFuZGxl
IGFycmF5Cj4gPiAgICogQG9ianNfb3V0OiByZXR1cm5lZCBwb2ludGVyIHRvIGFycmF5IG9mIGRy
bV9nZW1fb2JqZWN0IHBvaW50ZXJzCj4gPiAgICoKPiA+IC0gKiBUYWtlcyBhbiBhcnJheSBvZiB1
c2Vyc3BhY2UgaGFuZGxlcyBhbmQgcmV0dXJucyBhIG5ld2x5IGFsbG9jYXRlZCBhcnJheSBvZgo+
ID4gKyAqIFRha2VzIGFuIGFycmF5IG9mIEdFTSBvYmplY3QgaGFuZGxlcyBhbmQgcmV0dXJucyBh
IG5ld2x5IGFsbG9jYXRlZCBhcnJheSBvZgo+ID4gICAqIEdFTSBvYmplY3RzLgo+ID4gICAqCj4g
PiAgICogRm9yIGEgc2luZ2xlIGhhbmRsZSBsb29rdXAsIHVzZSBkcm1fZ2VtX29iamVjdF9sb29r
dXAoKS4KPiA+IEBAIC02OTUsMjYgKzY5NSw1NiBAQCBzdGF0aWMgaW50IG9iamVjdHNfbG9va3Vw
KHN0cnVjdCBkcm1fZmlsZSAqZmlscCwgdTMyICpoYW5kbGUsIGludCBjb3VudCwKPiA+ICAgKiBm
YWlsdXJlLiAwIGlzIHJldHVybmVkIG9uIHN1Y2Nlc3MuCj4gPiAgICoKPiA+ICAgKi8KPiA+IC1p
bnQgZHJtX2dlbV9vYmplY3RzX2xvb2t1cChzdHJ1Y3QgZHJtX2ZpbGUgKmZpbHAsIHZvaWQgX191
c2VyICpib19oYW5kbGVzLAo+ID4gK2ludCBkcm1fZ2VtX29iamVjdHNfbG9va3VwKHN0cnVjdCBk
cm1fZmlsZSAqZmlscCwgdTMyICpib19oYW5kbGVzLAo+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgIGludCBjb3VudCwgc3RydWN0IGRybV9nZW1fb2JqZWN0ICoqKm9ianNfb3V0KQo+Cj4gWW91
IGNhbid0IGRvIHRoaXMgY2hhbmdlIHdpdGhvdXQgdXBkYXRpbmcgYWxsIHRoZSBkcml2ZXJzLiBT
aW1wbGVyIHRvIGtlZXAKPiB0aGlzIG9uZSBhcy1pcywgYW5kIGNyZWF0ZSBhIG5ldyBmdW5jdGlv
biB3aXRoIGFuIF9pbnRlcm5hbCBzdWZmaXguCgpUaGUgb25seSBkcml2ZXIgY3VycmVudGx5IGlz
IHBhbmZyb3N0IGFuZCBpdCBpcyB1cGRhdGVkIGluIHRoaXMgcGF0Y2guCgpSb2IKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
