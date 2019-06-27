Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8337657EC9
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 10:59:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC2DC6E4B2;
	Thu, 27 Jun 2019 08:59:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A006E4B2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 08:59:05 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id a14so6282026edv.12
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 01:59:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=LGczOakCSLer9ILQE8tNaqgNPozV8pb7PqeHtCzn1g0=;
 b=CwCy2hcxLBJv97AF4mS4cWf2Lz5nbNwHsAXinXFErt/NdaGqU7DsDKhK+0UwMGNw2i
 1TXyTZOayJHNT6STeWJ6U2XuLMAcrLbdq6BhLQH7qT6Y4n+e6qXetsAip3JsD4+oRmxD
 JG2ge/o6dkV/LIGD+vAN2tShh3AKemtc5NNhYbTRu4wRX1Brgv/WabZXioe+buiDwjHn
 rXlNpVc3GNWRXnFb5JpxPTJXBavJtsAtj+Nn0Es2/Ry5p6nHdGY/KJ21gKMmUXggMh2T
 zpE+2F6pafQugrMWLXX7+mlBhLOXloYx9SmJj7VA0Kn7usAFwoQ9WdnyT4b656slHrfu
 bsbg==
X-Gm-Message-State: APjAAAU1OWafi14U3zwJF2g5LzzEEUyWrn3qng8rtV/SDJv4qJk0Fh4m
 wXlKDeS3cbckIfuQLdzUT5LlRw==
X-Google-Smtp-Source: APXvYqztF4cKNAF9DjpaD52JmFXj0BdZd5GbwscnxOS6ZW0fc4x9KnKm97t+ztQ3ANKwIhFX1OJPwA==
X-Received: by 2002:a17:906:2f0b:: with SMTP id
 v11mr1993434eji.200.1561625944030; 
 Thu, 27 Jun 2019 01:59:04 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id s26sm309794eja.81.2019.06.27.01.59.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 01:59:03 -0700 (PDT)
Date: Thu, 27 Jun 2019 10:59:00 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2] drm/bochs: fix framebuffer setup.
Message-ID: <20190627085900.GI12905@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR BOCHS VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, 
 open list <linux-kernel@vger.kernel.org>
References: <20190627081206.23135-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190627081206.23135-1-kraxel@redhat.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=LGczOakCSLer9ILQE8tNaqgNPozV8pb7PqeHtCzn1g0=;
 b=GsJ767+Bz59YQxnCnFMvFcSYh9soByANcFXUQ+dxUx5Q/FTIOZmR4kAWwuk9/HT1Gi
 raBZ4yVpCvC1kmTcyiq97Fnn6tEjrLxXJryKVmWHYVVzhGFre9eg61bQxVCoeFBrPx5W
 nbFSeFVId7v0Y/+FBuoxSRqzo2aQP3RbWafpk=
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
Cc: tzimmermann@suse.de, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 "open list:DRM DRIVER FOR BOCHS VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMjcsIDIwMTkgYXQgMTA6MTI6MDZBTSArMDIwMCwgR2VyZCBIb2ZmbWFubiB3
cm90ZToKPiBUaGUgZHJpdmVyIGRvZXNuJ3QgY29uc2lkZXIgZnJhbWVidWZmZXIgcGl0Y2ggYW5k
IG9mZnNldCwgbGVhZGluZyB0byBhCj4gd3JvbmcgZGlzcGxheSBpbiBjYXNlIG9mZnNldCAhPSAw
IG9yIHBpdGNoICE9IHdpZHRoICogYnBwLiAgRml4IGl0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEdl
cmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgoKWWVhaCB0aGlzIGxvb2tzIG1vcmUgbGlr
ZSBpdC4KClJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNo
PgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzLmggICAgIHwgIDIgKy0KPiAg
ZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzX2h3LmMgIHwgMTQgKysrKysrKysrKy0tLS0KPiAg
ZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzX2ttcy5jIHwgIDMgKystCj4gIDMgZmlsZXMgY2hh
bmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzLmggYi9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9j
aHMuaAo+IGluZGV4IGNjMzVkNDkyMTQyYy4uMmE2NTQzNDUwMGVlIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Nocy5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JvY2hz
L2JvY2hzLmgKPiBAQCAtODYsNyArODYsNyBAQCB2b2lkIGJvY2hzX2h3X3NldG1vZGUoc3RydWN0
IGJvY2hzX2RldmljZSAqYm9jaHMsCj4gIHZvaWQgYm9jaHNfaHdfc2V0Zm9ybWF0KHN0cnVjdCBi
b2Noc19kZXZpY2UgKmJvY2hzLAo+ICAJCQljb25zdCBzdHJ1Y3QgZHJtX2Zvcm1hdF9pbmZvICpm
b3JtYXQpOwo+ICB2b2lkIGJvY2hzX2h3X3NldGJhc2Uoc3RydWN0IGJvY2hzX2RldmljZSAqYm9j
aHMsCj4gLQkJICAgICAgaW50IHgsIGludCB5LCB1NjQgYWRkcik7Cj4gKwkJICAgICAgaW50IHgs
IGludCB5LCBpbnQgc3RyaWRlLCB1NjQgYWRkcik7Cj4gIGludCBib2Noc19od19sb2FkX2VkaWQo
c3RydWN0IGJvY2hzX2RldmljZSAqYm9jaHMpOwo+ICAKPiAgLyogYm9jaHNfbW0uYyAqLwo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHNfaHcuYyBiL2RyaXZlcnMvZ3B1
L2RybS9ib2Nocy9ib2Noc19ody5jCj4gaW5kZXggNzkxYWIyZjc5OTQ3Li5lYmZlYTg3NDRmZTYg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzX2h3LmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHNfaHcuYwo+IEBAIC0yNTUsMTYgKzI1NSwyMiBAQCB2
b2lkIGJvY2hzX2h3X3NldGZvcm1hdChzdHJ1Y3QgYm9jaHNfZGV2aWNlICpib2NocywKPiAgfQo+
ICAKPiAgdm9pZCBib2Noc19od19zZXRiYXNlKHN0cnVjdCBib2Noc19kZXZpY2UgKmJvY2hzLAo+
IC0JCSAgICAgIGludCB4LCBpbnQgeSwgdTY0IGFkZHIpCj4gKwkJICAgICAgaW50IHgsIGludCB5
LCBpbnQgc3RyaWRlLCB1NjQgYWRkcikKPiAgewo+IC0JdW5zaWduZWQgbG9uZyBvZmZzZXQgPSAo
dW5zaWduZWQgbG9uZylhZGRyICsKPiArCXVuc2lnbmVkIGxvbmcgb2Zmc2V0Owo+ICsJdW5zaWdu
ZWQgaW50IHZ4LCB2eSwgdndpZHRoOwo+ICsKPiArCWJvY2hzLT5zdHJpZGUgPSBzdHJpZGU7CgpN
aWdodCBiZSBuaWNlIHRvIGRpdGNoIHRoZXNlIGdsb2JhbC9ub3Qtc28tYXRvbWljIHRoaW5ncyBs
aWtlCmJvY2hzLT5zdHJpZGUvYnBwIGV2ZW50dWFsbHkuCi1EYW5pZWwKCj4gKwlvZmZzZXQgPSAo
dW5zaWduZWQgbG9uZylhZGRyICsKPiAgCQl5ICogYm9jaHMtPnN0cmlkZSArCj4gIAkJeCAqIChi
b2Nocy0+YnBwIC8gOCk7Cj4gLQlpbnQgdnkgPSBvZmZzZXQgLyBib2Nocy0+c3RyaWRlOwo+IC0J
aW50IHZ4ID0gKG9mZnNldCAlIGJvY2hzLT5zdHJpZGUpICogOCAvIGJvY2hzLT5icHA7Cj4gKwl2
eSA9IG9mZnNldCAvIGJvY2hzLT5zdHJpZGU7Cj4gKwl2eCA9IChvZmZzZXQgJSBib2Nocy0+c3Ry
aWRlKSAqIDggLyBib2Nocy0+YnBwOwo+ICsJdndpZHRoID0gc3RyaWRlICogOCAvIGJvY2hzLT5i
cHA7Cj4gIAo+ICAJRFJNX0RFQlVHX0RSSVZFUigieCAlZCwgeSAlZCwgYWRkciAlbGx4IC0+IG9m
ZnNldCAlbHgsIHZ4ICVkLCB2eSAlZFxuIiwKPiAgCQkJIHgsIHksIGFkZHIsIG9mZnNldCwgdngs
IHZ5KTsKPiArCWJvY2hzX2Rpc3BpX3dyaXRlKGJvY2hzLCBWQkVfRElTUElfSU5ERVhfVklSVF9X
SURUSCwgdndpZHRoKTsKPiAgCWJvY2hzX2Rpc3BpX3dyaXRlKGJvY2hzLCBWQkVfRElTUElfSU5E
RVhfWF9PRkZTRVQsIHZ4KTsKPiAgCWJvY2hzX2Rpc3BpX3dyaXRlKGJvY2hzLCBWQkVfRElTUElf
SU5ERVhfWV9PRkZTRVQsIHZ5KTsKPiAgfQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
Ym9jaHMvYm9jaHNfa21zLmMgYi9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHNfa21zLmMKPiBp
bmRleCA1OTA0ZWRkYzgzYTUuLmJjMTlkYmQ1MzFlZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYm9jaHMvYm9jaHNfa21zLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9j
aHNfa21zLmMKPiBAQCAtMzYsNyArMzYsOCBAQCBzdGF0aWMgdm9pZCBib2Noc19wbGFuZV91cGRh
dGUoc3RydWN0IGJvY2hzX2RldmljZSAqYm9jaHMsCj4gIAlib2Noc19od19zZXRiYXNlKGJvY2hz
LAo+ICAJCQkgc3RhdGUtPmNydGNfeCwKPiAgCQkJIHN0YXRlLT5jcnRjX3ksCj4gLQkJCSBnYm8t
PmJvLm9mZnNldCk7Cj4gKwkJCSBzdGF0ZS0+ZmItPnBpdGNoZXNbMF0sCj4gKwkJCSBzdGF0ZS0+
ZmItPm9mZnNldHNbMF0gKyBnYm8tPmJvLm9mZnNldCk7Cj4gIAlib2Noc19od19zZXRmb3JtYXQo
Ym9jaHMsIHN0YXRlLT5mYi0+Zm9ybWF0KTsKPiAgfQo+ICAKPiAtLSAKPiAyLjE4LjEKPiAKCi0t
IApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRw
Oi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
