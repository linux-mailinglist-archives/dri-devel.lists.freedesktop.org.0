Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8572C27D300
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 17:44:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E404B6E500;
	Tue, 29 Sep 2020 15:44:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9002A6E504
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 15:44:52 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id n2so5956058oij.1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 08:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GmccwYPvbTQr0lao9qdmlRwawj+lCQ+1QXiD0l/qUKM=;
 b=AvEKgyz1Mpr2Csbf03wB2afEPAxC22ZTlvhljJHzAj0BPTuqlRxgWwE7USW2AGrgho
 ezvaYXvQ9JzEwZhGwBXpfXwg4JSFE6mfLDimgQVZ8LU8sqJCEZTJqkkhRJp36tavL2Vl
 rlVv65YZ1m1v7DUXijKWB3ytuAGyfIIO5Qvwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GmccwYPvbTQr0lao9qdmlRwawj+lCQ+1QXiD0l/qUKM=;
 b=ihMCRuJKQUY1iepbizNNBhrx8jv/8g/pkpFYZCYP2SKzsgHqurKrkrFH7JdpWUzpxT
 aIjtH9ofK9unPthWY5zbdtFw+09sKNtd96bORTgX4DeqrrMzPB24rs/b4IeJk3yOrm9s
 UIIxKAjWLaD2HVhzSQ1Cu22v0K35uNw7IioNIWcc+ZIIhEz+/lUawp/webQ7jv68Cp/C
 LmgSb+a3NTYT3xePJ1x3Fh/a1BokeUGNLuhCRoa/V9VhKh9aglwyjVt34STh0Mnqy8zu
 M1XBV283gpEYZ0BYnWumoqelsblP54bBmrKJUUKA43lqHUvbq3TwxLFSHSuwZkyieAb2
 aoJQ==
X-Gm-Message-State: AOAM532U57SkqMHvImul4bAlhGWwwIsOyF1cg1iFfrV6fLGFgsRjQvpZ
 mbwTuSBr/2U8XW5xsOdfBh3ObrbkoQtDNpdZ8y9nBg==
X-Google-Smtp-Source: ABdhPJwP35vw5lT9neuydp7mvKwzDwhzvDxYO3obIhsVbbLOYCkSBjKqS3WXQ9gvZ6vnjTejVq7QMotIsIsxGWeL23s=
X-Received: by 2002:aca:6083:: with SMTP id u125mr3023784oib.14.1601394291599; 
 Tue, 29 Sep 2020 08:44:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200929151437.19717-1-tzimmermann@suse.de>
 <20200929151437.19717-3-tzimmermann@suse.de>
 <8fad0114-064a-4ed5-c21d-d1b4294de0a1@amd.com>
In-Reply-To: <8fad0114-064a-4ed5-c21d-d1b4294de0a1@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 29 Sep 2020 17:44:40 +0200
Message-ID: <CAKMK7uF8fYXzW3NUqR8Qkp8Z1Dk7xfwgXfUi7UdA5Cf++1HnOQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] drm/ttm: Add ttm_kmap_obj_to_dma_buf_map() for
 type conversion
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
Cc: Luben Tuikov <luben.tuikov@amd.com>, Dave Airlie <airlied@linux.ie>,
 Nouveau Dev <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Wilson,
 Chris" <chris@chris-wilson.co.uk>, Melissa Wen <melissa.srw@gmail.com>,
 Huang Rui <ray.huang@amd.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Joonyoung Shim <jy0922.shim@samsung.com>, lima@lists.freedesktop.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Steven Price <steven.price@arm.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Kukjin Kim <kgene@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>,
 "moderated list:DRM DRIVERS FOR XEN" <xen-devel@lists.xenproject.org>,
 "open list:VIRTIO CORE, NET..." <virtualization@lists.linux-foundation.org>,
 Sean Paul <sean@poorly.run>, apaneers@amd.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Sandy Huang <hjc@rock-chips.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Qinglang Miao <miaoqinglang@huawei.com>, Qiang Yu <yuq825@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMjksIDIwMjAgYXQgNTozNSBQTSBDaHJpc3RpYW4gS8O2bmlnCjxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+IHdyb3RlOgo+Cj4gQW0gMjkuMDkuMjAgdW0gMTc6MTQgc2Nocmll
YiBUaG9tYXMgWmltbWVybWFubjoKPiA+IFRoZSBuZXcgaGVscGVyIHR0bV9rbWFwX29ial90b19k
bWFfYnVmKCkgZXh0cmFjdHMgYWRkcmVzcyBhbmQgbG9jYXRpb24KPiA+IGZyb20gYW5kIGluc3Rh
bmNlIG9mIFRUTSdzIGttYXBfb2JqIGFuZCBpbml0aWFsaXplcyBzdHJ1Y3QgZG1hX2J1Zl9tYXAK
PiA+IHdpdGggdGhlc2UgdmFsdWVzLiBIZWxwZnVsIGZvciBUVE0tYmFzZWQgZHJpdmVycy4KPgo+
IFdlIGNvdWxkIGNvbXBsZXRlbHkgZHJvcCB0aGF0IGlmIHdlIHVzZSB0aGUgc2FtZSBzdHJ1Y3R1
cmUgaW5zaWRlIFRUTSBhcwo+IHdlbGwuCgo+IEFkZGl0aW9uYWwgdG8gdGhhdCB3aGljaCBkcml2
ZXIgaXMgZ29pbmcgdG8gdXNlIHRoaXM/CgpQYXRjaCAzIGluIHRoaXMgc2VyaWVzLgoKSSBhbHNv
IHRoaW5rIHRoaXMgbWFrZXMgc2Vuc2UgZm9yIGdyYWR1YWwgY29udmVyc2lvbjoKMS4gYWRkIHRo
aXMgaGVscGVyCjIuIGNvbnZlcnQgb3ZlciBhbGwgdXNlcnMgb2Ygdm1hcCwgdGhpcyBzaG91bGQg
Z2V0IHJpZCBvZiBpc19pb21lbQpmbGFncyAoYW5kIHdpbGwgcHJvYmFibHkgcmVzdWx0IGluIGEg
cGlsZSBvZiBzbWFsbCBhZGRpdGlvbnMgdG8KZG1hLWJ1Zi1tYXAuaCkKMy4gcHVzaCB0aGUgc3Ry
dWN0IGRtYV9idWZfbWFwIGRvd24gaW50byB0dG0gZHJpdmVycwoKQ2hlZXJzLCBEYW5pZWwKCj4g
UmVnYXJkcywKPiBDaHJpc3RpYW4uCj4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmlt
bWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KPiA+IC0tLQo+ID4gICBpbmNsdWRlL2RybS90
dG0vdHRtX2JvX2FwaS5oIHwgMjQgKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgIGluY2x1
ZGUvbGludXgvZG1hLWJ1Zi1tYXAuaCAgfCAyMCArKysrKysrKysrKysrKysrKysrKwo+ID4gICAy
IGZpbGVzIGNoYW5nZWQsIDQ0IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaCBiL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fYXBpLmgK
PiA+IGluZGV4IGM5NmEyNWQ1NzFjOC4uNjJkODlmMDVhODAxIDEwMDY0NAo+ID4gLS0tIGEvaW5j
bHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaAo+ID4gKysrIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9i
b19hcGkuaAo+ID4gQEAgLTM0LDYgKzM0LDcgQEAKPiA+ICAgI2luY2x1ZGUgPGRybS9kcm1fZ2Vt
Lmg+Cj4gPiAgICNpbmNsdWRlIDxkcm0vZHJtX2hhc2h0YWIuaD4KPiA+ICAgI2luY2x1ZGUgPGRy
bS9kcm1fdm1hX21hbmFnZXIuaD4KPiA+ICsjaW5jbHVkZSA8bGludXgvZG1hLWJ1Zi1tYXAuaD4K
PiA+ICAgI2luY2x1ZGUgPGxpbnV4L2tyZWYuaD4KPiA+ICAgI2luY2x1ZGUgPGxpbnV4L2xpc3Qu
aD4KPiA+ICAgI2luY2x1ZGUgPGxpbnV4L3dhaXQuaD4KPiA+IEBAIC00ODYsNiArNDg3LDI5IEBA
IHN0YXRpYyBpbmxpbmUgdm9pZCAqdHRtX2ttYXBfb2JqX3ZpcnR1YWwoc3RydWN0IHR0bV9ib19r
bWFwX29iaiAqbWFwLAo+ID4gICAgICAgcmV0dXJuIG1hcC0+dmlydHVhbDsKPiA+ICAgfQo+ID4K
PiA+ICsvKioKPiA+ICsgKiB0dG1fa21hcF9vYmpfdG9fZG1hX2J1Zl9tYXAKPiA+ICsgKgo+ID4g
KyAqIEBrbWFwOiBBIHN0cnVjdCB0dG1fYm9fa21hcF9vYmogcmV0dXJuZWQgZnJvbSB0dG1fYm9f
a21hcC4KPiA+ICsgKiBAbWFwOiBSZXR1cm5zIHRoZSBtYXBwaW5nIGFzIHN0cnVjdCBkbWFfYnVm
X21hcAo+ID4gKyAqCj4gPiArICogQ29udmVydHMgc3RydWN0IHR0bV9ib19rbWFwX29iaiB0byBz
dHJ1Y3QgZG1hX2J1Zl9tYXAuIElmIHRoZSBtZW1vcnkKPiA+ICsgKiBpcyBub3QgbWFwcGVkLCB0
aGUgcmV0dXJuZWQgbWFwcGluZyBpcyBpbml0aWFsaXplZCB0byBOVUxMLgo+ID4gKyAqLwo+ID4g
K3N0YXRpYyBpbmxpbmUgdm9pZCB0dG1fa21hcF9vYmpfdG9fZG1hX2J1Zl9tYXAoc3RydWN0IHR0
bV9ib19rbWFwX29iaiAqa21hcCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHN0cnVjdCBkbWFfYnVmX21hcCAqbWFwKQo+ID4gK3sKPiA+ICsgICAgIGJv
b2wgaXNfaW9tZW07Cj4gPiArICAgICB2b2lkICp2YWRkciA9IHR0bV9rbWFwX29ial92aXJ0dWFs
KGttYXAsICZpc19pb21lbSk7Cj4gPiArCj4gPiArICAgICBpZiAoIXZhZGRyKQo+ID4gKyAgICAg
ICAgICAgICBkbWFfYnVmX21hcF9jbGVhcihtYXApOwo+ID4gKyAgICAgZWxzZSBpZiAoaXNfaW9t
ZW0pCj4gPiArICAgICAgICAgICAgIGRtYV9idWZfbWFwX3NldF92YWRkcl9pb21lbShtYXAsICh2
b2lkIF9fZm9yY2UgX19pb21lbSAqKXZhZGRyKTsKPiA+ICsgICAgIGVsc2UKPiA+ICsgICAgICAg
ICAgICAgZG1hX2J1Zl9tYXBfc2V0X3ZhZGRyKG1hcCwgdmFkZHIpOwo+ID4gK30KPiA+ICsKPiA+
ICAgLyoqCj4gPiAgICAqIHR0bV9ib19rbWFwCj4gPiAgICAqCj4gPiBkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9saW51eC9kbWEtYnVmLW1hcC5oIGIvaW5jbHVkZS9saW51eC9kbWEtYnVmLW1hcC5oCj4g
PiBpbmRleCBmZDFhYmE1NDVmZGYuLjJlOGJiZWNiNTA5MSAxMDA2NDQKPiA+IC0tLSBhL2luY2x1
ZGUvbGludXgvZG1hLWJ1Zi1tYXAuaAo+ID4gKysrIGIvaW5jbHVkZS9saW51eC9kbWEtYnVmLW1h
cC5oCj4gPiBAQCAtNDUsNiArNDUsMTIgQEAKPiA+ICAgICoKPiA+ICAgICogIGRtYV9idWZfbWFw
X3NldF92YWRkcigmbWFwLiAweGRlYWRiZWFmKTsKPiA+ICAgICoKPiA+ICsgKiBUbyBzZXQgYW4g
YWRkcmVzcyBpbiBJL08gbWVtb3J5LCB1c2UgZG1hX2J1Zl9tYXBfc2V0X3ZhZGRyX2lvbWVtKCku
Cj4gPiArICoKPiA+ICsgKiAuLiBjb2RlLWJsb2NrOjogYwo+ID4gKyAqCj4gPiArICogICBkbWFf
YnVmX21hcF9zZXRfdmFkZHJfaW9tZW0oJm1hcC4gMHhkZWFkYmVhZik7Cj4gPiArICoKPiA+ICAg
ICogVGVzdCBpZiBhIG1hcHBpbmcgaXMgdmFsaWQgd2l0aCBlaXRoZXIgZG1hX2J1Zl9tYXBfaXNf
c2V0KCkgb3IKPiA+ICAgICogZG1hX2J1Zl9tYXBfaXNfbnVsbCgpLgo+ID4gICAgKgo+ID4gQEAg
LTExOCw2ICsxMjQsMjAgQEAgc3RhdGljIGlubGluZSB2b2lkIGRtYV9idWZfbWFwX3NldF92YWRk
cihzdHJ1Y3QgZG1hX2J1Zl9tYXAgKm1hcCwgdm9pZCAqdmFkZHIpCj4gPiAgICAgICBtYXAtPmlz
X2lvbWVtID0gZmFsc2U7Cj4gPiAgIH0KPiA+Cj4gPiArLyoqCj4gPiArICogZG1hX2J1Zl9tYXBf
c2V0X3ZhZGRyX2lvbWVtIC0gU2V0cyBhIGRtYS1idWYgbWFwcGluZyBzdHJ1Y3R1cmUgdG8gYW4g
YWRkcmVzcyBpbiBJL08gbWVtb3J5Cj4gPiArICogQG1hcDogICAgICAgICAgICAgVGhlIGRtYS1i
dWYgbWFwcGluZyBzdHJ1Y3R1cmUKPiA+ICsgKiBAdmFkZHJfaW9tZW06ICAgICBBbiBJL08tbWVt
b3J5IGFkZHJlc3MKPiA+ICsgKgo+ID4gKyAqIFNldHMgdGhlIGFkZHJlc3MgYW5kIHRoZSBJL08t
bWVtb3J5IGZsYWcuCj4gPiArICovCj4gPiArc3RhdGljIGlubGluZSB2b2lkIGRtYV9idWZfbWFw
X3NldF92YWRkcl9pb21lbShzdHJ1Y3QgZG1hX2J1Zl9tYXAgKm1hcCwKPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQgX19pb21lbSAqdmFkZHJfaW9t
ZW0pCj4gPiArewo+ID4gKyAgICAgbWFwLT52YWRkcl9pb21lbSA9IHZhZGRyX2lvbWVtOwo+ID4g
KyAgICAgbWFwLT5pc19pb21lbSA9IHRydWU7Cj4gPiArfQo+ID4gKwo+ID4gICAvKioKPiA+ICAg
ICogZG1hX2J1Zl9tYXBfaXNfZXF1YWwgLSBDb21wYXJlcyB0d28gZG1hLWJ1ZiBtYXBwaW5nIHN0
cnVjdHVyZXMgZm9yIGVxdWFsaXR5Cj4gPiAgICAqIEBsaHM6ICAgIFRoZSBkbWEtYnVmIG1hcHBp
bmcgc3RydWN0dXJlCj4KCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50
ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
