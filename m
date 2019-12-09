Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CC911773D
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 21:18:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6DB56E523;
	Mon,  9 Dec 2019 20:18:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D9866E51C;
 Mon,  9 Dec 2019 20:18:05 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id dc19so13819812edb.10;
 Mon, 09 Dec 2019 12:18:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h2yqKOxOZBGE0XueAD5uhzXamZSICOv0vTonYy2m++Q=;
 b=LWGgKdR0qj0yoPelRfHikXDXLy1jMPt05Rt3kTn0m1dLRJc2dhRQB9AI/LgJwKkLnB
 aVXLPdKVmfbHYbr24b8f4KBlQYj6T/bhnC+ACUl+M0boNzyAxk7yquJigLRfGLn4ggOW
 dHRQ8VAQSOXxbY/oVeVpXAauC9MXI0U0f+1UZnl8PgBiXkKhs7MCztYKBfIVDxmywaUG
 ZXsYLaCjIfJ0unoOH5w94+YjFQibSrx6NH++Zev1qgy/1txYElI08Pn4gIMt1uGNX1Qw
 WvwyU7GIusONWq86flnHlN9DCE2L8by3gjZ10+VJLb1r3HP5INctlgXKhNJPjCkJxfd5
 1BBA==
X-Gm-Message-State: APjAAAVz6epZnfOBjwuqy41PTogN1jn1Uh0SkIfeXT/82Mo8aWDEMQsE
 OIwhcQkSj1mpczIfWyOCgUF+d7cu5dG0yQsXYcQ=
X-Google-Smtp-Source: APXvYqxJoAfWGwg6T+oY0GTnfrw6XGw523tgFtibpXV6QP979ZIcnXwmJaPC+BaZ7VZ5Fotc0CennR+6m2o6cXTwAmY=
X-Received: by 2002:a17:906:34d7:: with SMTP id
 h23mr33858892ejb.90.1575922684081; 
 Mon, 09 Dec 2019 12:18:04 -0800 (PST)
MIME-Version: 1.0
References: <1574465484-7115-1-git-send-email-jcrouse@codeaurora.org>
 <0101016e95754ea7-d6414f4c-9e25-4bc4-a852-7116a783bf63-000000@us-west-2.amazonses.com>
In-Reply-To: <0101016e95754ea7-d6414f4c-9e25-4bc4-a852-7116a783bf63-000000@us-west-2.amazonses.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 9 Dec 2019 12:17:53 -0800
Message-ID: <CAF6AEGuchn7fa+8j45sCH7Sd2_dz5WokeeinR8RYr8xvY4Uq+g@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] drm/msm/a6xx: Support split pagetables
To: Jordan Crouse <jcrouse@codeaurora.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=h2yqKOxOZBGE0XueAD5uhzXamZSICOv0vTonYy2m++Q=;
 b=SMQVSBiO2u7Fb5SpKffbCQvDZoPGHmi8wphxbwhMj4d0exd0owRkFxjpbTAwhxstzL
 PcIqghdn1ODiO38nNuxtULQ7kFYYBtlB4UTyHkeimMxte1v13RifPXHF6Vz93hb0dFTw
 ACxTBwDk8OuONNYiGCvtzif1RaZYg6S7no/8ZJr5Rtc1NyHshQ5O/L2XC5w4rsN5cuOy
 UmKUxOyzzh5Jwd2hdRRUhb01wcNmbvrXenst78KwnqSGgdt5W+GEltl7u0owv/ScCOCc
 B4cTZ0FbsZYQyOxRmVL59rrJqlBH7ff3R9ppLQRI0qy+wMia4LChmaIREb9OZJijeQKk
 TtTg==
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Mamta Shukla <mamtashukla555@gmail.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMjIsIDIwMTkgYXQgMzozMiBQTSBKb3JkYW4gQ3JvdXNlIDxqY3JvdXNlQGNv
ZGVhdXJvcmEub3JnPiB3cm90ZToKPgo+IEF0dGVtcHQgdG8gZW5hYmxlIHNwbGl0IHBhZ2V0YWJs
ZXMgaWYgdGhlIGFybS1zbW11IGRyaXZlciBzdXBwb3J0cyBpdC4KPiBUaGlzIHdpbGwgbW92ZSB0
aGUgZGVmYXVsdCBhZGRyZXNzIHNwYWNlIGZyb20gdGhlIGRlZmF1bHQgcmVnaW9uIHRvCj4gdGhl
IGFkZHJlc3MgcmFuZ2UgYXNzaWduZWQgdG8gVFRCUjEuIFRoZSBiZWhhdmlvciBzaG91bGQgYmUg
dHJhbnNwYXJlbnQKPiB0byB0aGUgZHJpdmVyIGZvciBub3cgYnV0IGl0IGdldHMgdGhlIGRlZmF1
bHQgYnVmZmVycyBvdXQgb2YgdGhlIHdheQo+IHdoZW4gd2Ugd2FudCB0byBzdGFydCBzd2FwcGlu
ZyBUVEJSMCBmb3IgY29udGV4dC1zcGVjaWZpYyBwYWdldGFibGVzLgo+Cj4gU2lnbmVkLW9mZi1i
eTogSm9yZGFuIENyb3VzZSA8amNyb3VzZUBjb2RlYXVyb3JhLm9yZz4KPiAtLS0KPgo+ICBkcml2
ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dwdS5jIHwgNDYgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDQ1IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9h
Nnh4X2dwdS5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9ncHUuYwo+IGluZGV4
IDVkYzBiMmMuLjk2YjNiMjggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJl
bm8vYTZ4eF9ncHUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ3B1
LmMKPiBAQCAtODExLDYgKzgxMSw1MCBAQCBzdGF0aWMgdW5zaWduZWQgbG9uZyBhNnh4X2dwdV9i
dXN5KHN0cnVjdCBtc21fZ3B1ICpncHUpCj4gICAgICAgICByZXR1cm4gKHVuc2lnbmVkIGxvbmcp
YnVzeV90aW1lOwo+ICB9Cj4KPiArc3RhdGljIHN0cnVjdCBtc21fZ2VtX2FkZHJlc3Nfc3BhY2Ug
Kgo+ICthNnh4X2NyZWF0ZV9hZGRyZXNzX3NwYWNlKHN0cnVjdCBtc21fZ3B1ICpncHUsIHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gK3sKPiArICAgICAgIHN0cnVjdCBpb21tdV9kb21h
aW4gKmlvbW11ID0gaW9tbXVfZG9tYWluX2FsbG9jKCZwbGF0Zm9ybV9idXNfdHlwZSk7Cj4gKyAg
ICAgICBzdHJ1Y3QgbXNtX2dlbV9hZGRyZXNzX3NwYWNlICphc3BhY2U7Cj4gKyAgICAgICBzdHJ1
Y3QgbXNtX21tdSAqbW11Owo+ICsgICAgICAgdTY0IHN0YXJ0LCBzaXplOwo+ICsgICAgICAgdTMy
IHZhbCA9IDE7Cj4gKyAgICAgICBpbnQgcmV0Owo+ICsKPiArICAgICAgIGlmICghaW9tbXUpCj4g
KyAgICAgICAgICAgICAgIHJldHVybiBFUlJfUFRSKC1FTk9NRU0pOwo+ICsKPiArICAgICAgIC8q
IFRyeSB0byByZXF1ZXN0IHNwbGl0IHBhZ2V0YWJsZXMgKi8KPiArICAgICAgIGlvbW11X2RvbWFp
bl9zZXRfYXR0cihpb21tdSwgRE9NQUlOX0FUVFJfU1BMSVRfVEFCTEVTLCAmdmFsKTsKPiArCj4g
KyAgICAgICBtbXUgPSBtc21faW9tbXVfbmV3KCZwZGV2LT5kZXYsIGlvbW11KTsKPiArICAgICAg
IGlmIChJU19FUlIobW11KSkgewo+ICsgICAgICAgICAgICAgICBpb21tdV9kb21haW5fZnJlZShp
b21tdSk7Cj4gKyAgICAgICAgICAgICAgIHJldHVybiBFUlJfQ0FTVChtbXUpOwo+ICsgICAgICAg
fQo+ICsKPiArICAgICAgIC8qIENoZWNrIHRvIHNlZSBpZiBzcGxpdCBwYWdldGFibGVzIHdlcmUg
c3VjY2Vzc2Z1bCAqLwo+ICsgICAgICAgcmV0ID0gaW9tbXVfZG9tYWluX2dldF9hdHRyKGlvbW11
LCBET01BSU5fQVRUUl9TUExJVF9UQUJMRVMsICZ2YWwpOwoKSSBhc3N1bWUgdGhlIHNwbGl0IGJl
dHdlZW4gdGhpcyBhbmQgaW9tbXVfZG9tYWluX3NldF9hdHRyKCkgaXMgYmVjYXVzZQphdHRhY2gg
bmVlZHMgdG8gaGFwcGVuIGluIGJldHdlZW4/ICBBdCBhbnkgcmF0ZSwgaWYgaXQgbmVlZHMgdG8g
YmUKbGlrZSB0aGlzLCBtYXliZSBhIGNvbW1lbnQgaXMgaW4gb3JkZXIuICBBcyBpdCBpcyBpdCBs
b29rcyBsaWtlCnNvbWV0aGluZyBmdXR1cmUtc2VsZiB3b3VsZCAiY2xlYW51cCIuLgoKQlIsCi1S
Cgo+ICsgICAgICAgaWYgKCFyZXQgJiYgdmFsKSB7Cj4gKyAgICAgICAgICAgICAgIC8qCj4gKyAg
ICAgICAgICAgICAgICAqIFRoZSBhcGVydHVyZSBzdGFydCB3aWxsIGJlIGF0IHRoZSBiZWdpbm5p
bmcgb2YgdGhlIFRUQlIxCj4gKyAgICAgICAgICAgICAgICAqIHNwYWNlIHNvIHVzZSB0aGF0IGFz
IGEgYmFzZQo+ICsgICAgICAgICAgICAgICAgKi8KPiArICAgICAgICAgICAgICAgc3RhcnQgPSBp
b21tdS0+Z2VvbWV0cnkuYXBlcnR1cmVfc3RhcnQ7Cj4gKyAgICAgICAgICAgICAgIHNpemUgPSAw
eGZmZmZmZmZmOwo+ICsgICAgICAgfSBlbHNlIHsKPiArICAgICAgICAgICAgICAgLyogT3RoZXJ3
aXNlIHVzZSB0aGUgbGVnYWN5IDMyIGJpdCByZWdpb24gKi8KPiArICAgICAgICAgICAgICAgc3Rh
cnQgPSBTWl8xNk07Cj4gKyAgICAgICAgICAgICAgIHNpemUgPSAweGZmZmZmZmZmIC0gU1pfMTZN
Owo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIGFzcGFjZSA9IG1zbV9nZW1fYWRkcmVzc19zcGFj
ZV9jcmVhdGUobW11LCAiZ3B1Iiwgc3RhcnQsIHNpemUpOwo+ICsgICAgICAgaWYgKElTX0VSUihh
c3BhY2UpKQo+ICsgICAgICAgICAgICAgICBpb21tdV9kb21haW5fZnJlZShpb21tdSk7Cj4gKwo+
ICsgICAgICAgcmV0dXJuIGFzcGFjZTsKPiArfQo+ICsKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBh
ZHJlbm9fZ3B1X2Z1bmNzIGZ1bmNzID0gewo+ICAgICAgICAgLmJhc2UgPSB7Cj4gICAgICAgICAg
ICAgICAgIC5nZXRfcGFyYW0gPSBhZHJlbm9fZ2V0X3BhcmFtLAo+IEBAIC04MzIsNyArODc2LDcg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhZHJlbm9fZ3B1X2Z1bmNzIGZ1bmNzID0gewo+ICAjaWYg
ZGVmaW5lZChDT05GSUdfRFJNX01TTV9HUFVfU1RBVEUpCj4gICAgICAgICAgICAgICAgIC5ncHVf
c3RhdGVfZ2V0ID0gYTZ4eF9ncHVfc3RhdGVfZ2V0LAo+ICAgICAgICAgICAgICAgICAuZ3B1X3N0
YXRlX3B1dCA9IGE2eHhfZ3B1X3N0YXRlX3B1dCwKPiAtICAgICAgICAgICAgICAgLmNyZWF0ZV9h
ZGRyZXNzX3NwYWNlID0gYWRyZW5vX2lvbW11X2NyZWF0ZV9hZGRyZXNzX3NwYWNlLAo+ICsgICAg
ICAgICAgICAgICAuY3JlYXRlX2FkZHJlc3Nfc3BhY2UgPSBhNnh4X2NyZWF0ZV9hZGRyZXNzX3Nw
YWNlLAo+ICAjZW5kaWYKPiAgICAgICAgIH0sCj4gICAgICAgICAuZ2V0X3RpbWVzdGFtcCA9IGE2
eHhfZ2V0X3RpbWVzdGFtcCwKPiAtLQo+IDIuNy40Cj4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
