Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2BE97C2D
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 16:10:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 632196E94B;
	Wed, 21 Aug 2019 14:10:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF4166E94A
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 14:10:35 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id r20so2168141ota.5
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 07:10:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=foa9/UGdQKCCyJg/vzVb8FRdyBU6bkeruca3HdlOCS4=;
 b=RxnU+YRDI0N3ZHu2hgCNv8Pwc+SO5YJaSWFydvqtsv6baRoHuGuvEg3DocN6kx3O1U
 uETPHMp0WXfkASdzdk3KPmknPS2QG756cvOzkDxJi7jK9z1a8BIjhlPf0tOBF7J0hTQT
 A9Bdli4T4RLgK6Sx461VAULhBLu7HZ3OP8jhzsiAX9At2PIfxAPs6k8dbG4J2dKaWPwq
 344bWDA0v51zdjhgKkmGbwaPCO9675rRJYimyVo5SCt4LyFZZkF+kuC41HUXCkegqyPJ
 PHpsdOfBc3fiEZ/EzfLAm72pb4Fs2G72j49OqO3CLVKCQbpqkYBNIgx9m5l2lyAzQ4Gy
 ZOsA==
X-Gm-Message-State: APjAAAV5tu2N84FHajpkgQuwoBie4rcwwT+9FePLSQI3hGOLWlG139HA
 X/2QkQNrGz8YoHleZGL0vdrcF/9Og/MN4s2QVIEQQw==
X-Google-Smtp-Source: APXvYqw4IvOhLEFBhZRZDa8q94WwD9BTWEABxb0tXTi6VRootc5xX40k16EoKtGX9nGtD0ipfNwNRqVBo+LzWRoxR3o=
X-Received: by 2002:a9d:6955:: with SMTP id p21mr28477873oto.204.1566396635066; 
 Wed, 21 Aug 2019 07:10:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190820145336.15649-1-daniel.vetter@ffwll.ch>
 <20190820145336.15649-4-daniel.vetter@ffwll.ch>
 <dbe0e8a6-573f-6628-0b9e-1c978611efce@shipmail.org>
In-Reply-To: <dbe0e8a6-573f-6628-0b9e-1c978611efce@shipmail.org>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 21 Aug 2019 16:10:23 +0200
Message-ID: <CAKMK7uH93XWbz7X6VJsvRB+pbgFEjH=iYAAgQc42gcAON8YXVw@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/ttm: remove ttm_bo_wait_unreserved
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m_=28VMware=29?= <thomas_os@shipmail.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=foa9/UGdQKCCyJg/vzVb8FRdyBU6bkeruca3HdlOCS4=;
 b=LAQQRCxI+dzXABbcvGauBmt1piQxjhFT1dAEx8nNE3rEaFTYvXed051i49USJHiErM
 4tfbO+tVYVO/vsgLut3gn9EwzcaoGedt7YGK1YwwG6PA6ihxhjt3VMRjK/F5Ky4dk3g8
 a2txa0ag9508UC0eh9ZrSQl1P6Y1ErNvOxTRg=
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Huang Rui <ray.huang@amd.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMjEsIDIwMTkgYXQgMzoxNiBQTSBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJl
KQo8dGhvbWFzX29zQHNoaXBtYWlsLm9yZz4gd3JvdGU6Cj4KPiBPbiA4LzIwLzE5IDQ6NTMgUE0s
IERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiBXaXRoIG5vdXZlYXUgZml4ZWQgYWxsIHR0bS11c2lu
ZyBkcml2ZXMgaGF2ZSB0aGUgY29ycmVjdCBuZXN0aW5nIG9mCj4gPiBtbWFwX3NlbSB2cyBkbWFf
cmVzdiwgYW5kIHdlIGNhbiBqdXN0IGxvY2sgdGhlIGJ1ZmZlci4KPiA+Cj4gPiBBc3N1bWluZyBJ
IGRpZG4ndCBzY3JldyB1cCBhbnl0aGluZyB3aXRoIG15IGF1ZGl0IG9mIGNvdXJzZS4KPiA+Cj4g
PiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4K
PiA+IENjOiBDaHJpc3RpYW4gS29lbmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gPiBD
YzogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KPiA+IENjOiBHZXJkIEhvZmZtYW5uIDxr
cmF4ZWxAcmVkaGF0LmNvbT4KPiA+IENjOiAiVk13YXJlIEdyYXBoaWNzIiA8bGludXgtZ3JhcGhp
Y3MtbWFpbnRhaW5lckB2bXdhcmUuY29tPgo+ID4gQ2M6IFRob21hcyBIZWxsc3Ryb20gPHRoZWxs
c3Ryb21Adm13YXJlLmNvbT4KPiA+IC0tLQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9i
by5jICAgIHwgMzQgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiAgIGRyaXZl
cnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMgfCAyNiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
Cj4gPiAgIGluY2x1ZGUvZHJtL3R0bS90dG1fYm9fYXBpLmggICAgfCAgMSAtCj4gPiAgIDMgZmls
ZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDYwIGRlbGV0aW9ucygtKQo+ID4KPiA+Cj4gPiAr
ICAgICBkbWFfcmVzdl9sb2NrKGJvLT5iYXNlLnJlc3YsIE5VTEwpOwo+Cj4gaW50ZXJydXB0aWJs
ZSwgb3IgYXQgbGVhc3Qga2lsbGFibGUuIChJSVJDIHRoaW5rIGtpbGxhYmxlIGlzIHRoZSByaWdo
dAo+IGNob2ljZSBpbiBmYXVsdCBjb2RlLCBldmVuIGlmIFRUTSBpbml0aWFsbHkgaW1wbGVtZW50
ZWQgaW50ZXJydXB0aWJsZSB0bwo+IGdldCByZWFzb25hYmxlIFhvcmcgInNpbGtlbiBtb3VzZSIg
bGF0ZW5jeSkuCgpJIHRoaW5rIGludGVycnVwdGlibGUgaXMgZmluZS4gSSBjaGlja2VuZCBvdXQg
b2YgdGhhdCBmb3IgdjEgYmVjYXVzZSBJCmFsd2F5cyBtaXggdXAgdGhlIHJldHVybiBjb2RlIGZv
ciBfbG9ja19pbnRlcnJ1cHRpYmwoKSA6LSkKCkknbGwgYWRkIHRoYXQgZm9yIHRoZSBuZXh0IHZl
cnNpb24gdG9vLgotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJ
bnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xs
LmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
