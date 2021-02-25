Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1410D324D15
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 10:43:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12A6A6E114;
	Thu, 25 Feb 2021 09:43:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 503606E114
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 09:43:24 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id b16so5130217otq.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 01:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nlt66PlWCk9/RWdJrwXB+Jkp0aarHFKV5bYF6JjCDGA=;
 b=NEa4cAEZft2Rzi1FMCvcm1bdLdDGdy3qJsz3MMjyPIYK2dzYWrzUiKU/2VS5tAxYRi
 FxZ5YzMnnD4LoZPVoFcct6Ll0DnIBRFZSlyGGvQ1Qb6UER8qW3IQmu77celTYdK1XREk
 hGw9jgKclE9ep9TqQ5Apye4hz+kErxTvMZ+BY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nlt66PlWCk9/RWdJrwXB+Jkp0aarHFKV5bYF6JjCDGA=;
 b=R5Q+MkYmhV6sgvjWhxhvjP+eD0b6mIjstLM/zeDCG2fHIZ+MDTux1PcIgaWqajY+Se
 OxSUdb7r9/GJuUplqunJeFBv2GtaO57OxRj7sc/khIvq1ncfUOm3r7dVt4g++xFHSbDz
 j096/KeaQiVF6+dq7farTs9zgLko1+0Z2Gj8t928DIuUXUjlYygTYNwajWBbCYYWDzEO
 i20nnL2vqpIQwceiIHwNx0mvvaMIce2ayjVDCaCDJL7rDl5EfaEchKVYvC6Ys5XoVDrj
 WZ+2oFzd5b2MsBsgaF/3mlMXi7vDz14bhytvv6QfCApaLvcZQaWs4ehKM88oCiJFG8P0
 HRGw==
X-Gm-Message-State: AOAM531+m2TbxEcdlG0bli4lxlQrorp/Ql6orRvoMPl7Bpa3IR1FIvEm
 okrA+0kD+ivUgcGHXCccbCAF0WKrtJ/4GhCuT+caYw==
X-Google-Smtp-Source: ABdhPJzm9NlmBL0Od4HrxuTXA4SMoOVMcdlf8v0kZS4XsRnOUZfPkVRLHpsDKt6yqmhZZ2QL0hVy5RaXDu7Jl26k8jM=
X-Received: by 2002:a9d:2265:: with SMTP id o92mr1570400ota.188.1614246203629; 
 Thu, 25 Feb 2021 01:43:23 -0800 (PST)
MIME-Version: 1.0
References: <20210219122203.51130-1-noralf@tronnes.org>
 <2eb66df9-05bc-c52c-b6b7-793cac59f4d3@suse.de>
 <5169579f-04cf-230d-f9be-f3eb068b0e51@tronnes.org>
In-Reply-To: <5169579f-04cf-230d-f9be-f3eb068b0e51@tronnes.org>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 25 Feb 2021 10:43:12 +0100
Message-ID: <CAKMK7uH06XqRUWOuyZCG+6X9zVs6FGYWOFE0RggfY7Jx91AQjw@mail.gmail.com>
Subject: Re: [PATCH] drm/shmem-helpers: vunmap: Don't put pages for dma-buf
To: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBGZWIgMjQsIDIwMjEgYXQgNjoxNCBQTSBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0
cm9ubmVzLm9yZz4gd3JvdGU6Cj4KPgo+Cj4gRGVuIDE5LjAyLjIwMjEgMTQuNTQsIHNrcmV2IFRo
b21hcyBaaW1tZXJtYW5uOgo+ID4gSGkKPiA+Cj4gPiBBbSAxOS4wMi4yMSB1bSAxMzoyMiBzY2hy
aWViIE5vcmFsZiBUcsO4bm5lczoKPiA+PiBkbWEtYnVmIGltcG9ydGluZyB3YXMgcmV3b3JrZWQg
aW4gY29tbWl0IDdkMmNkNzJhOWFhMwo+ID4+ICgiZHJtL3NobWVtLWhlbHBlcnM6IFNpbXBsaWZ5
IGRtYS1idWYgaW1wb3J0aW5nIikuIEJlZm9yZSB0aGF0IGNvbW1pdAo+ID4+IGRybV9nZW1fc2ht
ZW1fcHJpbWVfaW1wb3J0X3NnX3RhYmxlKCkgZGlkIHNldCAtPnBhZ2VzX3VzZV9jb3VudD0xIGFu
ZAo+ID4+IGRybV9nZW1fc2htZW1fdnVubWFwX2xvY2tlZCgpIGNvdWxkIGNhbGwgZHJtX2dlbV9z
aG1lbV9wdXRfcGFnZXMoKQo+ID4+IHVuY29uZGl0aW9uYWxseS4gTm93IHdpdGhvdXQgdGhlIHVz
ZSBjb3VudCBzZXQsIHB1dCBwYWdlcyBpcyBjYWxsZWQgYWxzbwo+ID4+IG9uIGRtYS1idWZzLiBG
aXggdGhpcyBieSBvbmx5IHB1dHRpbmcgcGFnZXMgaWYgaXQncyBub3QgaW1wb3J0ZWQuCj4gPj4K
PiA+PiBGaXhlczogN2QyY2Q3MmE5YWEzICgiZHJtL3NobWVtLWhlbHBlcnM6IFNpbXBsaWZ5IGRt
YS1idWYgaW1wb3J0aW5nIikKPiA+PiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBm
ZndsbC5jaD4KPiA+PiBDYzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+
Cj4gPj4gU2lnbmVkLW9mZi1ieTogTm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+
Cj4gPgo+ID4gSnVzdCB3aGVuIEkgc2F3IHRoZSBlcnJvci4gTmljZS4gOikKPiA+Cj4gPiBBY2tl
ZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Cj4gPiBUZXN0ZWQt
Ynk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+ID4KPgo+IFNob3Vs
ZCBJIGFwcGx5IHRoaXMgdG8gZHJtLW1pc2MtZml4ZXM/Cgpkcm0tbWlzYy1uZXh0LWZpeGVzIGJl
Y2F1c2Ugd2UncmUgaW4gdGhlIG1lcmdlIHdpbmRvdy4KLURhbmllbAoKPgo+IE5vcmFsZi4KPgo+
ID4gRm9yIHRlc3RpbmcgdGhlIEdVRCBkcml2ZXIsIHlvdSBtYXkgYWxzbyB3YW50IHRvIGtlZXAg
YW4gZXllIGF0IFsxXQo+ID4KPiA+IEJlc3QgcmVnYXJkcwo+ID4gVGhvbWFzCj4gPgo+ID4gWzFd
Cj4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9kcmktZGV2ZWwvMDJhNDVjMTEtZmM3My0xZTVh
LTM4MzktMzBiMDgwOTUwYWY4QGFtZC5jb20vVC8jdAo+ID4KPiA+Cj4gPj4gLS0tCj4gPj4gICBk
cml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYyB8IDcgKysrKy0tLQo+ID4+ICAg
MSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiA+Pgo+ID4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYwo+ID4+
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMKPiA+PiBpbmRleCA5ODI1
YzM3OGRmYTYuLmM4YTY1NDdhMTc1NyAxMDA2NDQKPiA+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2dlbV9zaG1lbV9oZWxwZXIuYwo+ID4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2Vt
X3NobWVtX2hlbHBlci5jCj4gPj4gQEAgLTM1NywxMyArMzU3LDE0IEBAIHN0YXRpYyB2b2lkIGRy
bV9nZW1fc2htZW1fdnVubWFwX2xvY2tlZChzdHJ1Y3QKPiA+PiBkcm1fZ2VtX3NobWVtX29iamVj
dCAqc2htZW0sCj4gPj4gICAgICAgaWYgKC0tc2htZW0tPnZtYXBfdXNlX2NvdW50ID4gMCkKPiA+
PiAgICAgICAgICAgcmV0dXJuOwo+ID4+ICAgLSAgICBpZiAob2JqLT5pbXBvcnRfYXR0YWNoKQo+
ID4+ICsgICAgaWYgKG9iai0+aW1wb3J0X2F0dGFjaCkgewo+ID4+ICAgICAgICAgICBkbWFfYnVm
X3Z1bm1hcChvYmotPmltcG9ydF9hdHRhY2gtPmRtYWJ1ZiwgbWFwKTsKPiA+PiAtICAgIGVsc2UK
PiA+PiArICAgIH0gZWxzZSB7Cj4gPj4gICAgICAgICAgIHZ1bm1hcChzaG1lbS0+dmFkZHIpOwo+
ID4+ICsgICAgICAgIGRybV9nZW1fc2htZW1fcHV0X3BhZ2VzKHNobWVtKTsKPiA+PiArICAgIH0K
PiA+PiAgICAgICAgIHNobWVtLT52YWRkciA9IE5VTEw7Cj4gPj4gLSAgICBkcm1fZ2VtX3NobWVt
X3B1dF9wYWdlcyhzaG1lbSk7Cj4gPj4gICB9Cj4gPj4gICAgIC8qCj4gPj4KPiA+CgoKCi0tIApE
YW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8v
YmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
