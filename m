Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D621127BA
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 10:36:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F3E72A42;
	Wed,  4 Dec 2019 09:36:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CFAC72A46
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 09:36:40 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id a13so7239653ljm.10
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Dec 2019 01:36:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a6muq/zPpNAEonRaEF88djMSIQF7VCKBk84Ikfjo2iQ=;
 b=rI+JwGm5rTAejh+57q5lq0ZZNMg4soXuh/rreINM5rG3vQ7HmHN5Arpd5IdQ+qItvV
 e/uxLM1ygvrjD1RxwRsueMbGvL9qyWH3fR4dM0NNYioMPniKUYoVMhOrBFUYOxLF8qBX
 /gaSfeDRd1FdYq+9PE8YY19vlc1wDbZlMu3gRq/YsksFxas8Jd7PZD5F3p41mzkw1kpm
 qiCUEO9FcbJeSevmVXypSlNNecX7z86v+2DYSYoDou49KejhWqGbf1kc3n12LDWMDr7w
 XKD0oCptfje6B/i5+TZrE4vbaDktYRCQudi7SSZx0Mhph12I3tnzATm/ZYj4r5Laj0Mf
 2rVw==
X-Gm-Message-State: APjAAAWvHzVzkH/FJo5yK8yjydcN/woANNrl2bGX+ZEpQ9rtlqRKP0b+
 1Xlfhejr32MXa/+LHNPWXySa0P1UlmiAeAjWP/I=
X-Google-Smtp-Source: APXvYqxIqgrMwJzRV3IvDjPj34Bwo6E84F2KP8tIXLrJrMy6ZccVWyrqSHDgPejEiMe5RLi5q5pnDeU00H42Shfftmw=
X-Received: by 2002:a2e:980b:: with SMTP id a11mr1337015ljj.189.1575452198701; 
 Wed, 04 Dec 2019 01:36:38 -0800 (PST)
MIME-Version: 1.0
References: <20191126072545.22663-1-tzimmermann@suse.de>
 <20191126072545.22663-4-tzimmermann@suse.de>
 <20191126093710.GR29965@phenom.ffwll.local>
 <8099fad7-6b74-e769-9431-900a531c5d11@suse.de>
 <0FB4179F-B299-41A9-A75A-EF9294E0DD17@oracle.com>
 <edc3ed43-cede-e5ea-f2a4-b4fcfc8b8af7@suse.de>
In-Reply-To: <edc3ed43-cede-e5ea-f2a4-b4fcfc8b8af7@suse.de>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 4 Dec 2019 19:36:26 +1000
Message-ID: <CAPM=9tzPv8hxZg2m2ZO2tfPKRL=7NPvK9yO9jhHNeo==sEKUtA@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm/mgag200: Add workaround for HW that does not
 support 'startadd'
To: Thomas Zimmermann <tzimmermann@suse.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=a6muq/zPpNAEonRaEF88djMSIQF7VCKBk84Ikfjo2iQ=;
 b=k+wDkGsy4v/qihRTWxApBcIhvOqVFeRK+QbS7aZaYplSJAulrJuue+O3VIPw+NY5lz
 bRwtPikU7KRm0dC/LPzEqh0eYsu3i9R5utkDwk7KVacnAZ9l8CmBdPjfcq1+bcqUQSZx
 jhltrB7hfhnfqE48cuIwc0ApWjdMBQuGgIw9YBS/r9P4HfafmUiiKhgIaqTJXxU/d1WC
 +i3oKCYJij2aB9OAvU5cFnC4N5W1v4j0jJp8+lsVySeby9TxNSW8Rssdkb9PHrm+LwP3
 maJoc6LomBaDkKqCH6zMx/CfMtrOx3GDokK1u47kZLM6/y1iuVdiuE3ubLwbQvvXyNTY
 wUpQ==
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
Cc: John Donnelly <john.p.donnelly@oracle.com>, Sam Ravnborg <sam@ravnborg.org>,
 Gerd Hoffmann <kraxel@redhat.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCA0IERlYyAyMDE5IGF0IDE3OjMwLCBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1h
bm5Ac3VzZS5kZT4gd3JvdGU6Cj4KPiBIaSBKb2huCj4KPiBBbSAwMy4xMi4xOSB1bSAxODo1NSBz
Y2hyaWViIEpvaG4gRG9ubmVsbHk6Cj4gPiBIaSAsCj4gPgo+ID4gU2VlIGJlbG93ICwKPiA+Cj4g
Pgo+ID4+IE9uIE5vdiAyNiwgMjAxOSwgYXQgMzo1MCBBTSwgVGhvbWFzIFppbW1lcm1hbm4gPHR6
aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3RlOgo+ID4+Cj4gPj4gSGkKPiA+Pgo+ID4+IEFtIDI2LjEx
LjE5IHVtIDEwOjM3IHNjaHJpZWIgRGFuaWVsIFZldHRlcjoKPiA+Pj4gT24gVHVlLCBOb3YgMjYs
IDIwMTkgYXQgMDg6MjU6NDRBTSArMDEwMCwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6Cj4gPj4+
PiBUaGVyZSdzIGF0IGxlYXN0IG9uZSBzeXN0ZW0gdGhhdCBkb2VzIG5vdCBpbnRlcnByZXQgdGhl
IHZhbHVlIG9mCj4gPj4+PiB0aGUgZGV2aWNlJ3MgJ3N0YXJ0YWRkJyBmaWVsZCBjb3JyZWN0bHks
IHdoaWNoIGxlYWRzIHRvIGluY29ycmVjdGx5Cj4gPj4+PiBkaXNwbGF5ZWQgc2Nhbm91dCBidWZm
ZXJzLiBBbHdheXMgcGxhY2luZyB0aGUgYWN0aXZlIHNjYW5vdXQgYnVmZmVyCj4gPj4+PiBhdCBv
ZmZzZXQgMCB3b3JrcyBhcm91bmQgdGhlIHByb2JsZW0uCj4gPj4+Pgo+ID4+Pj4gU2lnbmVkLW9m
Zi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Cj4gPj4+PiBSZXBv
cnRlZC1ieTogSm9obiBEb25uZWxseSA8am9obi5wLmRvbm5lbGx5QG9yYWNsZS5jb20+Cj4gPj4+
PiBMaW5rOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL21pc2MvaXNzdWVzLzcK
PiA+Pj4KPiA+Pj4gVGVzdGVkLWJ5OiBKb2huIERvbm5lbGx5IDxqb2huLnAuZG9ubmVsbHlAb3Jh
Y2xlLmNvbT4KPiA+Pj4KPiA+Pj4gKE5vdCBxdWl0ZSB0aGlzIHBhdGNoLCBidXQgcHJldHR5IG11
Y2ggdGhlIGxvZ2ljLCBzbyBjb3VudHMpLgo+ID4+Pgo+ID4+PiBGaXhlczogODFkYTg3ZjYzYTFl
ICgiZHJtOiBSZXBsYWNlIGRybV9nZW1fdnJhbV9wdXNoX3RvX3N5c3RlbSgpIHdpdGgga3VubWFw
ICsgdW5waW4iKQo+ID4+PiBDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+ICMgdjUuMysKPiA+
Pj4KPiA+Pj4gQWxzbyB5b3UgbmVlZCB0aGUgc3RhYmxlIGxpbmUgb24gYm90aCBwcmVwIHBhdGNo
ZXMgdG9vLiBGb3IgbmV4dCB0aW1lCj4gPj4+IGFyb3VuZCwKPiA+Pj4KPiA+Pj4gJCBkaW0gZml4
ZXMgODFkYTg3ZjYzYTFlCj4gPj4+Cj4gPj4+IHdpbGwgZ2VuZXJhdGUgYWxsIHRoZSBzdHVmZiB5
b3UgbmVlZCwgaW5jbHVkaW5nIGEgZ29vZCBzZXQgb2Ygc3VnZ2VzdGVkCj4gPj4+IENjOiB5b3Ug
c2hvdWxkIGhhdmUuCj4gPj4+Cj4gPj4+IE9uIHRoZSBmaXJzdCAzIHBhdGNoZXMsIHdpdGggYWxs
IHRoYXQgc3R1ZmYgYWRkZWQ6Cj4gPj4+Cj4gPj4+IFJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVy
IDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+ID4+Cj4gPj4gVGhhbmtzIGZvciB0aGUgcmV2aWV3
Lgo+ID4+Cj4gPj4gU29ycnkgZm9yIGxlYXZpbmcgb3V0IHNvbWUgb2YgdGhlIHRhZ3MuIEkgd2Fu
dGVkIHRvIHdhaXQgZm9yIGZlZWRiYWNrCj4gPj4gYmVmb3JlIGFkZGluZyB0ZXN0ZWQtYnksIGZp
eGVzLCBzdGFibGUuIEknbGwgc3BsaXQgb2ZmIHBhdGNoIDQgZnJvbSB0aGUKPiA+PiBzZXJpZXMg
YW5kIGdldCAxIHRvIDMgbWVyZ2VkIEFTQVAuCj4gPj4KPiA+PiBCZXN0IHJlZ2FyZHMKPiA+PiBU
aG9tYXMKPiA+Pgo+ID4+Pgo+ID4+PiBQbGVhc2UgcHVzaCB0aGVzZSB0byBkcm0tbWlzYy1uZXh0
LWZpeGVzIHNvIHRoZXkgZ2V0IGJhY2twb3J0ZWQgYXMgcXVpY2tseQo+ID4+PiBhcyBwb3NzaWJs
ZS4KPiA+Pj4gLURhbmllbAo+ID4+Pgo+ID4+Pj4gLS0tCj4gPj4+PiBkcml2ZXJzL2dwdS9kcm0v
bWdhZzIwMC9tZ2FnMjAwX2Rydi5jIHwgMzYgKysrKysrKysrKysrKysrKysrKysrKysrKystCj4g
Pj4+PiBkcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2Rydi5oIHwgIDMgKysrCj4gPj4+
PiAyIGZpbGVzIGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+Pj4+
Cj4gPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9kcnYu
YyBiL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZHJ2LmMKPiA+Pj4+IGluZGV4IDM5
N2Y4YjBhOWFmOC4uZDQzOTUxY2FlZWEwIDEwMDY0NAo+ID4+Pj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL21nYWcyMDAvbWdhZzIwMF9kcnYuYwo+ID4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21n
YWcyMDAvbWdhZzIwMF9kcnYuYwo+ID4+Pj4gQEAgLTMwLDYgKzMwLDggQEAgbW9kdWxlX3BhcmFt
X25hbWVkKG1vZGVzZXQsIG1nYWcyMDBfbW9kZXNldCwgaW50LCAwNDAwKTsKPiA+Pj4+IHN0YXRp
YyBzdHJ1Y3QgZHJtX2RyaXZlciBkcml2ZXI7Cj4gPj4+Pgo+ID4+Pj4gc3RhdGljIGNvbnN0IHN0
cnVjdCBwY2lfZGV2aWNlX2lkIHBjaWlkbGlzdFtdID0gewo+ID4+Pj4gKyAgeyBQQ0lfVkVORE9S
X0lEX01BVFJPWCwgMHg1MjIsIFBDSV9WRU5ET1JfSURfU1VOLCAweDQ4NTIsIDAsIDAsCj4gPj4+
PiArICAgICAgICAgIEcyMDBfU0VfQSB8IE1HQUcyMDBfRkxBR19IV19CVUdfTk9fU1RBUlRBRER9
LAo+ID4KPiA+Cj4gPgo+ID4gSSB3aWxsIGhhdmUgYW4gYWRkaXRpb25hbCBsaXN0IG9mIHZlbmRv
ciBJRHMgKDB4NDg1MikgIEkgd2lsbCBwcm92aWRlIGluIGEgZm9sbG93IHVwIHBhdGNoIHNob3J0
bHkgLiAgVGhpcyBmaXhlcyBvbmx5IDEgZmxhdm9yICBvZiBzZXJ2ZXIuCj4KPiBUaGFuayB5b3Ug
Zm9yIGFsbCB0aGUgdGVzdGluZyB5b3UgZG8uIFdlIGNhbiBhZGQgdGhlc2UgaWRzIGFzIG5lY2Vz
c2FyeS4KPgo+IEJlZm9yZSwgSSBwb3N0ZWQgYSBwYXRjaCBhdCBbMV0gdGhhdCBwcmludHMgYW4g
aW50ZXJuYWwgdW5pcXVlIGlkLiBUaGUKPiBpZCBvZiB5b3VyIG9yaWdpbmFsIHRlc3QgbWFjaGlu
ZSB3YXMgMHgyIElJUkMuCj4KPiBNeSBndWVzcyBpcyB0aGF0IHRoZSBwcm9ibGVtIG1pZ2h0IGJl
IHJlbGF0ZWQgdG8gdGhlIGNoaXAncyByZXZpc2lvbi4gSWYKPiB5b3UgaGF2ZSB0aGUgb3B0aW9u
IG9mIGJvb3RpbmcgeW91ciBvd24ga2VybmVscyBvbiBhbGwgdGhlc2UgbWFjaGluZXMsCj4gY291
bGQgeW91IGFwcGx5IHRoZSBwYXRjaCBhbmQgbG9vayBmb3IgYSBwYXR0ZXJuIGluIHRoZXNlIGlk
cz8gTWF5YmUKPiBvbmx5IHJldmlzaW9uIDB4MiBpcyBhZmZlY3RlZC4KPgoKSSd2ZSBnb3QgYW4g
b2xkIGJ1ZyBJIG5ldmVyIGdvdCBhcm91bmQgdG8gdGhhdCBoYXMgYSBjb21tZW50IGZyb20gTWF0
cm94CgoiVGhlIGlzc3VlIGlzIHJlcHJvZHVjaWJsZSB3aXRoIEcyMDBlIGNoaXAuIFRoZSBkZXZp
Y2UgSUQgaXMgMHgwNTIyLiIKCnNvIGl0IG1pZ2h0IGJlIGEgYnJvYWRlciBwcm9ibGVtIHRoYW4g
d2UgdGhpbmsuCgpEYXZlLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
