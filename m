Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F512DB94
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 13:20:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 202896E0FA;
	Wed, 29 May 2019 11:20:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2076B6E072
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 04:13:39 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id c70so568453qkg.7
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 21:13:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ngVfzcL9ABAFEihNZh2xSqucsIOjuLs9bDYJ3YGjY9Q=;
 b=hYucRLw5EhnwXFe9gg0p7F7aikt/M/Go0Yqo8yG0o2MW2KDog0Odj7kg43zlF5yauj
 +jhRHIc7IIdQGetQKJV/Yt5aRGH6xB2dzc0yK6HfpJuc9WL+tX2gWuqtp233IXP1aBW6
 333Iy+kb0pfu+sSIP6OLs9isVc9nx/kJ2xQpd9K20RbqwR8ui7paK8MEF2QCZqUQr0wb
 l/RVvOM9D7I3vFESibFXFjkVBWSzAcuCYC5JdY8nXv/auRZADnEOT8dxjQRW0WVCAkUR
 gaoYLz0Bdc5Xoseb9DO/o+YAXN3qb4VunEZJ45yeEqMnD0DjdOmKLqdvF94tPCfwiv3P
 XtiA==
X-Gm-Message-State: APjAAAWeY1Psm5U9NpvK8yxrdtLED5Ls/ooR8v4ap4ku7twnISLZGpcF
 pPpVaM52BJwpU4Ssbukw11khrGrt/6hzcQppPCvgUlzpuEWNFw==
X-Google-Smtp-Source: APXvYqy+xrLrIWh1ypuhtM0OsRgSvv3LdNaJhdhBYvPVYPrtXMmWXw7cZ7Uw7Ssw4uPucZd11u4DhP+e2EgkxFrE2Dk=
X-Received: by 2002:ae9:ec10:: with SMTP id h16mr57494649qkg.215.1559103218155; 
 Tue, 28 May 2019 21:13:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190527045054.113259-1-hsinyi@chromium.org>
 <20190527045054.113259-2-hsinyi@chromium.org>
 <1559093711.11380.6.camel@mtksdaap41>
In-Reply-To: <1559093711.11380.6.camel@mtksdaap41>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 29 May 2019 12:13:12 +0800
Message-ID: <CAJMQK-inLLC+ePfgBJuGYro3z87hvQ8rLQJX-uiEDn_8svnQ1w@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm: mediatek: fix unbind functions
To: CK Hu <ck.hu@mediatek.com>
X-Mailman-Approved-At: Wed, 29 May 2019 11:20:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=ngVfzcL9ABAFEihNZh2xSqucsIOjuLs9bDYJ3YGjY9Q=;
 b=YIwTisss8OGpAsO5/2Od/ZAsztSaHuFNoETgc+pwz5tlfdo1jugcfhz8IblnQtmI4K
 bMfWMEZDSdCnRcJNDWns/FCcqv28+CGtNH13ERpno/IQKcFibz0nqdG40SbqJgLeEcSt
 UnAzXk7cJ1mcSKZetxESeze5pwTk2yKMtRoqM=
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
Cc: David Airlie <airlied@linux.ie>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMjksIDIwMTkgYXQgOTozNSBBTSBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29t
PiB3cm90ZToKPgo+IEhpLCBIc2luLXlpOgo+Cj4gT24gTW9uLCAyMDE5LTA1LTI3IGF0IDEyOjUw
ICswODAwLCBIc2luLVlpIFdhbmcgd3JvdGU6Cj4gPiBtb3ZlIG1pcGlfZHNpX2hvc3RfdW5yZWdp
c3RlcigpIHRvIC5yZW1vdmUgc2luY2UgbWlwaV9kc2lfaG9zdF9yZWdpc3RlcigpCj4gPiBpcyBj
YWxsZWQgaW4gLnByb2JlLgo+Cj4gSW4gdGhlIGxhdGVzdCBrZXJuZWwgWzFdLCBtaXBpX2RzaV9o
b3N0X3JlZ2lzdGVyKCkgaXMgY2FsbGVkIGluCj4gbXRrX2RzaV9iaW5kKCksIEkgdGhpbmsgd2Ug
ZG9uJ3QgbmVlZCB0aGlzIHBhcnQuCj4KPiBbMV0KPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jP2g9djUuMi1yYzIKClRoaXMgcGF0Y2ggaHR0cHM6Ly9w
YXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMDk0OTMwNS8gbW92ZXMKbWlwaV9kc2lfaG9zdF9y
ZWdpc3RlcigpIGZyb20gLmJpbmQgdG8gLnByb2JlLiBJJ2xsIHJlcGx5IHRoZXJlIHRvIGFzawp0
aGUgb3duZXIgdG8gZG8gdGhpcy4KCj4KPiA+Cj4gPiBkZXRhdGNoIHBhbmVsIGluIG10a19kc2lf
ZGVzdHJveV9jb25uX2VuYygpLCBzaW5jZSAuYmluZCB3aWxsIHRyeSB0bwo+ID4gYXR0YWNoIGl0
IGFnYWluLgo+ID4KPiA+IEZpeGVzOiAyZTU0YzE0ZTMxMGYgKCJkcm0vbWVkaWF0ZWs6IEFkZCBE
U0kgc3ViIGRyaXZlciIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBIc2luLVlpIFdhbmcgPGhzaW55aUBj
aHJvbWl1bS5vcmc+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rz
aS5jIHwgNCArKystCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+ID4gaW5kZXggYjAw
ZWIyZDJlMDg2Li5jOWI2ZDNhNjhjOGIgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RzaS5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RzaS5jCj4gPiBAQCAtODQ0LDYgKzg0NCw4IEBAIHN0YXRpYyB2b2lkIG10a19kc2lfZGVzdHJv
eV9jb25uX2VuYyhzdHJ1Y3QgbXRrX2RzaSAqZHNpKQo+ID4gICAgICAgLyogU2tpcCBjb25uZWN0
b3IgY2xlYW51cCBpZiBjcmVhdGlvbiB3YXMgZGVsZWdhdGVkIHRvIHRoZSBicmlkZ2UgKi8KPiA+
ICAgICAgIGlmIChkc2ktPmNvbm4uZGV2KQo+ID4gICAgICAgICAgICAgICBkcm1fY29ubmVjdG9y
X2NsZWFudXAoJmRzaS0+Y29ubik7Cj4gPiArICAgICBpZiAoZHNpLT5wYW5lbCkKPiA+ICsgICAg
ICAgICAgICAgZHJtX3BhbmVsX2RldGFjaChkc2ktPnBhbmVsKTsKPgo+IEkgdGhpbmsgbXRrX2Rz
aV9kZXN0cm95X2Nvbm5fZW5jKCkgaGFzIG11Y2ggdGhpbmcgdG8gZG8gYW5kIEkgd291bGQgbGlr
ZQo+IHlvdSB0byBkbyBtb3JlLiBZb3UgY291bGQgcmVmZXIgdG8gWzJdIGZvciBjb21wbGV0ZSBp
bXBsZW1lbnRhdGlvbi4KPgo+IFsyXQo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL2RyaXZlcnMvZ3B1L2RybS9l
eHlub3MvZXh5bm9zX2RybV9kc2kuYz9oPXY1LjItcmMyI24xNTc1CgpXaWxsIHVwZGF0ZSBpbiBu
ZXh0IHZlcnNpb24uCgpUaGFua3MKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
