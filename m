Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1671F4D511
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 19:25:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A08966E5D8;
	Thu, 20 Jun 2019 17:25:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB0086E5D8
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 17:25:43 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id n5so492536ioc.7
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 10:25:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Uk7ZIBjV+VR8aLMJpfzpl5Ntma1pb1M7AjThVeR3/Lw=;
 b=MyQb+DrCjFoiO1kCmjkkvib5cMl48O9teymM0rzgp/QMnxwA3lxtE2FQBAqRcFOKGe
 fyuxauNrsksl5Pa7N0CnxwxD3neaoMnGcMAWi6e0qVnfWSw73v3K4aBjlfQXG0iYZBl0
 iDcr6PVdXQUpqGtqo5Fs52Sc2GuWcljYJFJZJPe6aHWczU61GlzgZcWHpSLHQDUmaR+h
 L5wcDwVB+Bl2Fj5wABV9mF0RaudYfxoGrgwuzJDtc9+srMTumZzqk7Wfb5IlmfzNqUDs
 t+9mznuXJ8KNTmug2qYwlG7lZTbmJLFrbSimKWNf3Kfnc/OK+wJ3DDzSd0DEgWTQFZvK
 FtmA==
X-Gm-Message-State: APjAAAUEJRcEViVm7IVosrd/KEJmG3MWHbwy8wuuXQcdpdl9VubCQJ9F
 k+CkYam8ZZRLCEMblysWKBZBDhdFEZE=
X-Google-Smtp-Source: APXvYqz32noKiE7VkEB8M3RUr78tSVpwOe6m+jJEfCLXRIn72FMGx7ZKyMw33rRDDWW6K/Uc3XQCSw==
X-Received: by 2002:a02:a493:: with SMTP id d19mr9181206jam.22.1561051542645; 
 Thu, 20 Jun 2019 10:25:42 -0700 (PDT)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com.
 [209.85.166.53])
 by smtp.gmail.com with ESMTPSA id p63sm544706iof.45.2019.06.20.10.25.41
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Jun 2019 10:25:41 -0700 (PDT)
Received: by mail-io1-f53.google.com with SMTP id e5so61353iok.4
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 10:25:41 -0700 (PDT)
X-Received: by 2002:a5d:96d8:: with SMTP id r24mr31877702iol.269.1561051541200; 
 Thu, 20 Jun 2019 10:25:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190618213406.7667-1-ezequiel@collabora.com>
 <20190618213406.7667-3-ezequiel@collabora.com>
In-Reply-To: <20190618213406.7667-3-ezequiel@collabora.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 20 Jun 2019 10:25:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XoKNA4aW2LT7g8K2t+ABwgt=QJGAyiet1-Gyz3CgWmvg@mail.gmail.com>
Message-ID: <CAD=FV=XoKNA4aW2LT7g8K2t+ABwgt=QJGAyiet1-Gyz3CgWmvg@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/rockchip: Add optional support for CRTC gamma LUT
To: Ezequiel Garcia <ezequiel@collabora.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Uk7ZIBjV+VR8aLMJpfzpl5Ntma1pb1M7AjThVeR3/Lw=;
 b=lWHV/5eR2B3caBjxG4cP62L0BKX5+DFDOH9t5g8sI8uHgZiTX0lOT4X20fvXwSA5qJ
 A0pTf8M+e704lkfjlV26jPd6UAbvzhWdnGUrRTxvTt7qE6SNvM81e9y/2s2bRBYmnLmv
 /MFyEQsgp7eEwb/7xoLdGWppVk3xmWQpsCjdo=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Jacopo Mondi <jacopo@jmondi.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sean Paul <seanpaul@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 kernel@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBUdWUsIEp1biAxOCwgMjAxOSBhdCAyOjQzIFBNIEV6ZXF1aWVsIEdhcmNpYSA8ZXpl
cXVpZWxAY29sbGFib3JhLmNvbT4gd3JvdGU6Cj4KPiArc3RhdGljIHZvaWQgdm9wX2NydGNfZ2Ft
bWFfc2V0KHN0cnVjdCB2b3AgKnZvcCwgc3RydWN0IGRybV9jcnRjICpjcnRjLAo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKm9sZF9zdGF0ZSkK
PiArewo+ICsgICAgICAgaW50IGlkbGUsIHJldCwgaTsKPiArCj4gKyAgICAgICBzcGluX2xvY2so
JnZvcC0+cmVnX2xvY2spOwo+ICsgICAgICAgVk9QX1JFR19TRVQodm9wLCBjb21tb24sIGRzcF9s
dXRfZW4sIDApOwo+ICsgICAgICAgdm9wX2NmZ19kb25lKHZvcCk7Cj4gKyAgICAgICBzcGluX3Vu
bG9jaygmdm9wLT5yZWdfbG9jayk7Cj4gKwo+ICsgICAgICAgcmV0ID0gcmVhZHhfcG9sbF90aW1l
b3V0KHZvcF9kc3BfbHV0X2lzX2VuYWJsZSwgdm9wLAo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgIGlkbGUsICFpZGxlLCA1LCAzMCAqIDEwMDApOwo+ICsgICAgICAgaWYgKHJldCkKCldvcnRo
IGFuIGVycm9yIG1lc3NhZ2U/CgoKPiBAQCAtMTIwNSw2ICsxMjk0LDcgQEAgc3RhdGljIHZvaWQg
dm9wX2NydGNfYXRvbWljX2ZsdXNoKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKPgo+ICBzdGF0aWMg
Y29uc3Qgc3RydWN0IGRybV9jcnRjX2hlbHBlcl9mdW5jcyB2b3BfY3J0Y19oZWxwZXJfZnVuY3Mg
PSB7Cj4gICAgICAgICAubW9kZV9maXh1cCA9IHZvcF9jcnRjX21vZGVfZml4dXAsCj4gKyAgICAg
ICAuYXRvbWljX2NoZWNrID0gdm9wX2NydGNfYXRvbWljX2NoZWNrLAoKQXQgZmlyc3QgSSB3YXMg
d29ycmllZCB0aGF0IHRoZXJlIHdhcyBhIGJ1ZyBoZXJlIHNpbmNlIGluIHRoZSBjb250ZXh0Cm9m
IGR3X2hkbWkgKGFuIGVuY29kZXIpIGFkZGluZyAiLmF0b21pY19jaGVjayIgY2F1c2VkICIubW9k
ZV9maXh1cCIgdG8Kc3RvcCBnZXR0aW5nIGNhbGxlZCBhcyBwZXIgbW9kZV9maXh1cCgpIGluCiJk
cml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxwZXIuYyIuCgouLi5idXQgaXQgc2VlbXMgbGlr
ZSBpdCdzIE9LIGZvciBDUlRDcywgc28gSSB0aGluayB3ZSdyZSBmaW5lLgoKCj4gQEAgLTEzMjMs
NiArMTQxMyw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2NydGNfZnVuY3Mgdm9wX2NydGNf
ZnVuY3MgPSB7Cj4gICAgICAgICAuZGlzYWJsZV92YmxhbmsgPSB2b3BfY3J0Y19kaXNhYmxlX3Zi
bGFuaywKPiAgICAgICAgIC5zZXRfY3JjX3NvdXJjZSA9IHZvcF9jcnRjX3NldF9jcmNfc291cmNl
LAo+ICAgICAgICAgLnZlcmlmeV9jcmNfc291cmNlID0gdm9wX2NydGNfdmVyaWZ5X2NyY19zb3Vy
Y2UsCj4gKyAgICAgICAuZ2FtbWFfc2V0ID0gZHJtX2F0b21pY19oZWxwZXJfbGVnYWN5X2dhbW1h
X3NldCwKCkFyZSB0aGVyZSBhbnkgaXNzdWVzIGluIGFkZGluZyB0aGlzICIuZ2FtbWFfc2V0IiBw
cm9wZXJ0eSBldmVuIHRob3VnaAp3ZSBtYXkgb3IgbWF5IG5vdCBhY3R1YWxseSBoYXZlIHRoZSBh
YmlsaXR5IHRvIHNldCB0aGUgZ2FtbWEKKGRlcGVuZGluZyBvbiB3aGV0aGVyIG9yIG5vdCB0aGUg
TFVUIHJlZ2lzdGVyIHJhbmdlIHdhcyBwcm92aWRlZCBpbgp0aGUgZGV2aWNlIHRyZWUpPyAgSSBh
bSBhIERSTSBub29iIGJ1dApkcm1fYXRvbWljX2hlbHBlcl9sZWdhY3lfZ2FtbWFfc2V0KCkgaXMg
bm90IGEgdHJpdmlhbCBsaXR0bGUgZnVuY3Rpb24KYW5kIG5vdyB3ZSdsbCBiZSBydW5uaW5nIGl0
IGluIHNvbWUgY2FzZXMgd2hlcmUgd2UgZG9uJ3QgYWN0dWFsbHkgaGF2ZQpnYW1tYS4KCkkgYWxz
byBub3RpY2UgdGhhdCB0aGVyZSdzIGF0IGxlYXN0IG9uZSBiaXQgb2YgY29kZSB0aGF0IHNlZW1z
IHRvCmNoZWNrIGlmICIuZ2FtbWFfc2V0IiBpcyBOVUxMLiAgLi4uYW5kIGlmIGl0IGlzLCBpdCds
bCByZXR1cm4gLUVOT1NZUwpyaWdodCBhd2F5LiAgRG8gd2Ugc3RpbGwgcHJvcGVybHkgcmV0dXJu
IC1FTk9TWVMgb24gZGV2aWNlcyB0aGF0IGRvbid0CmhhdmUgdGhlIHJlZ2lzdGVyIHJhbmdlPwoK
SXQgc2VlbXMgbGlrZSB0aGUgYWJzb2x1dGUgc2FmZXN0IHdvdWxkIGJlIHRvIGhhdmUgdHdvIGNv
cGllcyBvZiB0aGlzCnN0cnVjdDogb25lIHVzZWQgZm9yIFZPUHMgdGhhdCBoYXZlIHRoZSByYW5n
ZSBhbmQgb25lIGZvciBWT1BzIHRoYXQKZG9uJ3QuCgouLi5idXQgcG9zc2libHkgSSdtIGp1c3Qg
cGFyYW5vaWQgYW5kIGFzIEkndmUgc2FpZCBJJ20gYSBjbHVlbGVzcwpub29iLiAgSWYgc29tZW9u
ZSBzYXlzIGl0J3MgZmluZSB0byBhbHdheXMgcHJvdmlkZSB0aGUgLmdhbW1hX3NldApwcm9wZXJ0
eSB0aGF0J3MgZmluZSB0b28uCgoKPiAgc3RhdGljIHZvaWQgdm9wX2ZiX3VucmVmX3dvcmtlcihz
dHJ1Y3QgZHJtX2ZsaXBfd29yayAqd29yaywgdm9pZCAqdmFsKQo+IEBAIC0xNDgwLDYgKzE1NzEs
MTAgQEAgc3RhdGljIGludCB2b3BfY3JlYXRlX2NydGMoc3RydWN0IHZvcCAqdm9wKQo+ICAgICAg
ICAgICAgICAgICBnb3RvIGVycl9jbGVhbnVwX3BsYW5lczsKPgo+ICAgICAgICAgZHJtX2NydGNf
aGVscGVyX2FkZChjcnRjLCAmdm9wX2NydGNfaGVscGVyX2Z1bmNzKTsKPiArICAgICAgIGlmICh2
b3BfZGF0YS0+bHV0X3NpemUpIHsKPiArICAgICAgICAgICAgICAgZHJtX21vZGVfY3J0Y19zZXRf
Z2FtbWFfc2l6ZShjcnRjLCB2b3BfZGF0YS0+bHV0X3NpemUpOwo+ICsgICAgICAgICAgICAgICBk
cm1fY3J0Y19lbmFibGVfY29sb3JfbWdtdChjcnRjLCAwLCBmYWxzZSwgdm9wX2RhdGEtPmx1dF9z
aXplKTsKClNob3VsZCB3ZSBvbmx5IGRvIHRoZSBhYm92ZSBjYWxscyBpZiB3ZSBzdWNjZXNzZnVs
bHkgbWFwcGVkIHRoZSByZXNvdXJjZXM/CgoKPiBAQCAtMTc3Niw2ICsxODcxLDE3IEBAIHN0YXRp
YyBpbnQgdm9wX2JpbmQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlICptYXN0ZXIs
IHZvaWQgKmRhdGEpCj4gICAgICAgICBpZiAoSVNfRVJSKHZvcC0+cmVncykpCj4gICAgICAgICAg
ICAgICAgIHJldHVybiBQVFJfRVJSKHZvcC0+cmVncyk7Cj4KPiArICAgICAgIHJlcyA9IHBsYXRm
b3JtX2dldF9yZXNvdXJjZV9ieW5hbWUocGRldiwgSU9SRVNPVVJDRV9NRU0sICJsdXQiKTsKCkFz
IHBlciBjb21tZW50cyBpbiB0aGUgYmluZGluZ3MsIHNob3VsZG4ndCB1c2UgdGhlIG5hbWUgImx1
dCIgYnV0CnNob3VsZCBqdXN0IHBpY2sgcmVzb3VyY2UgIzEuCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
