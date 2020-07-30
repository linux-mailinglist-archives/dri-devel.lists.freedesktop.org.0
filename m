Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4CD233111
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 13:41:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17BB66E8DC;
	Thu, 30 Jul 2020 11:41:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 508E76E1B9
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 11:40:59 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id p25so10467907oto.6
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 04:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nBnifv01zRZgE/4c8IHk2gLlrDMiSDCUOUbT0VvRPoM=;
 b=MktR/StSDY8xQL4/wwQK1MgkX8qvUA0+ZcZpgz7jzUX7xloEaMleHb2Ic9KqrPa0YO
 XVFifhjVRNCf5HgHxL6lwOU8hIJIsw6xsjpwIrP0xOVGzYaM8gQVTgffN7r4GmH4dGBL
 cuaPlJF7xO93fcbEiinukTz2hQoJU83hMy6dE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nBnifv01zRZgE/4c8IHk2gLlrDMiSDCUOUbT0VvRPoM=;
 b=CT6f2eFIbadsdWiBO/wxJmnb4KlDV+YX7FQProzlDtf1mEv5NwmLeZKhT3zQQYol4j
 aA/69etK79Xe8UorKSMnDACcI9ArPUmSlXAfh1d7nCogjLj7W5z25N7zUIbRfUvbOucP
 gC8pLGF5oykq4X2JD+hMnkIIh/xiBVCUPruJ+lW/lcOPemex+uT4G0VmeAXrE0zm9ym7
 eLfT8vtvnMD/s6kwfRk0df21E+JYK9Vq0aV9zyaypL5beUoUkf6lW+OABGyI79ucraLd
 ER8pn14WzWeL4z0MyRoQrwLjxXx5h5nN8repuh91lS7fcyKpCPNAcdk4Guegi8lAt10n
 u/fw==
X-Gm-Message-State: AOAM530ceyM2kZKIUx8/cbodeoCk40IaeJ/Cuz3hLUdHGEXihLCrXa+R
 KeRmk5d4j0pA63kHxS+0By2ffXQ7LtMmQdyoIDXWpA==
X-Google-Smtp-Source: ABdhPJwB/0BD6pCWvoNrZuRZ8MZwDHU6nh2kNIwsKx2RoRSrQ9OyjOpZyYMfT/5fBYLWFfKk2J2aMPJu6vTWikKdfjY=
X-Received: by 2002:a05:6830:1e71:: with SMTP id
 m17mr2064327otr.188.1596109258470; 
 Thu, 30 Jul 2020 04:40:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200728182704.1809-1-Felix.Kuehling@amd.com>
 <9994a650-8065-c51c-6454-47064d20c729@gmail.com>
 <7c389ab3-4322-ebd5-f042-e80204dbcfbc@amd.com>
 <MW3PR12MB4491D68CC4AEC80F9B724E46F7700@MW3PR12MB4491.namprd12.prod.outlook.com>
 <9b384c46-ec71-46be-ac60-1335e9682c05@email.android.com>
In-Reply-To: <9b384c46-ec71-46be-ac60-1335e9682c05@email.android.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 30 Jul 2020 13:40:47 +0200
Message-ID: <CAKMK7uEDPpqLtTqJztDNTUiG0UOZ7s75p3e4EqhMK98zc=fiAA@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm/ttm: fix offset in VMAs with a pg_offs in
 ttm_bo_vm_access
To: "Koenig, Christian" <Christian.Koenig@amd.com>
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Morichetti,
 Laurent" <Laurent.Morichetti@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMjksIDIwMjAgYXQgNTozNCBQTSBLb2VuaWcsIENocmlzdGlhbgo8Q2hyaXN0
aWFuLktvZW5pZ0BhbWQuY29tPiB3cm90ZToKPgo+IFN1cmUuCgpOb3RlIHRoYXQgZHJtLW1pc2Mt
bmV4dCBpc24ndCB0aGUgcmlnaHQgYnJhbmNoIGZvciBjYzogc3RhYmxlIHN0dWZmLCBzZWUKCmh0
dHBzOi8vZHJtLnBhZ2VzLmZyZWVkZXNrdG9wLm9yZy9tYWludGFpbmVyLXRvb2xzL2NvbW1pdHRl
ci1kcm0tbWlzYy5odG1sI3doZXJlLWRvLWktYXBwbHktbXktcGF0Y2gKCkp1c3QgdG8gYXZvaWQg
Y29uZnVzaW9uIGFuZCBuZWVkbGVzcyBjaGVycnlwaWNraW5nIGFjcm9zcyBicmFuY2hlcy4KLURh
bmllbAoKPgo+IENocmlzdGlhbi4KPgo+IEFtIDI5LjA3LjIwMjAgMTc6MzAgc2NocmllYiAiRGV1
Y2hlciwgQWxleGFuZGVyIiA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT46Cj4KPiBbQU1EIFB1
YmxpYyBVc2VdCj4KPgo+IENocmlzdGlhbiwgQ2FuIHlvdSBjYyBzdGFibGUgd2hlbiB5b3UgYXBw
bHkgaXQgdG8gZHJtLW1pc2M/Cj4KPiBBbGV4Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBGcm9tOiBLdWVobGluZywgRmVsaXggPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+Cj4g
U2VudDogV2VkbmVzZGF5LCBKdWx5IDI5LCAyMDIwIDEwOjE1IEFNCj4gVG86IEtvZW5pZywgQ2hy
aXN0aWFuIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+OyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnIDxkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPjsgYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcgPGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPjsgRGV1Y2hl
ciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPgo+IENjOiBNb3JpY2hldHRp
LCBMYXVyZW50IDxMYXVyZW50Lk1vcmljaGV0dGlAYW1kLmNvbT4KPiBTdWJqZWN0OiBSZTogW1BB
VENIIDEvMV0gZHJtL3R0bTogZml4IG9mZnNldCBpbiBWTUFzIHdpdGggYSBwZ19vZmZzIGluIHR0
bV9ib192bV9hY2Nlc3MKPgo+IEFtIDIwMjAtMDctMjkgdW0gNDowOCBhLm0uIHNjaHJpZWIgQ2hy
aXN0aWFuIEvDtm5pZzoKPiA+IEFtIDI4LjA3LjIwIHVtIDIwOjI3IHNjaHJpZWIgRmVsaXggS3Vl
aGxpbmc6Cj4gPj4gVk1BcyB3aXRoIGEgcGdfb2ZmcyB0aGF0J3Mgb2Zmc2V0IGZyb20gdGhlIHN0
YXJ0IG9mIHRoZSB2bWFfbm9kZSBuZWVkCj4gPj4gdG8gYWRqdXN0IHRoZSBvZmZzZXQgd2l0aGlu
IHRoZSBCTyBhY2NvcmRpbmdseS4gVGhpcyBtYXRjaGVzIHRoZQo+ID4+IG9mZnNldCBjYWxjdWxh
dGlvbiBpbiB0dG1fYm9fdm1fZmF1bHRfcmVzZXJ2ZWQuCj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5
OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4KPiA+PiBUZXN0ZWQtYnk6
IExhdXJlbnQgTW9yaWNoZXR0aSA8bGF1cmVudC5tb3JpY2hldHRpQGFtZC5jb20+Cj4gPgo+ID4g
UmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4K
PiA+Cj4gPiBHb2luZyB0byBwaWNrIHRoYXQgdXAgZm9yIGluY2x1c2lvbiBpbiBkcm0tbWlzYy1u
ZXh0Lgo+Cj4gVGhhbmtzLiBJJ2xsIHN1Ym1pdCBpdCB0byBhbWQtc3RhZ2luZy1kcm0tbmV4dCBz
byBpdCBtYWtlcyBpdHMgd2F5IGludG8KPiBvdXIgREtNUyBicmFuY2ggcXVpY2tseS4KPgo+IEFs
ZXgsIHdvdWxkIHlvdSBwdXNoIHRoaXMgdG8gZHJtLWZpeGVzPwo+Cj4gUmVnYXJkcywKPiAgIEZl
bGl4Cj4KPgo+ID4KPiA+PiAtLS0KPiA+PiAgIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3Zt
LmMgfCA0ICsrKy0KPiA+PiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9i
b192bS5jCj4gPj4gYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5jCj4gPj4gaW5kZXgg
Mzg5MTI4YjhjNGRkLi42MGI0MTQ0N2JlYzggMTAwNjQ0Cj4gPj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3R0bS90dG1fYm9fdm0uYwo+ID4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2Jv
X3ZtLmMKPiA+PiBAQCAtNDA1LDggKzQwNSwxMCBAQCBzdGF0aWMgaW50IHR0bV9ib192bV9hY2Nl
c3Nfa21hcChzdHJ1Y3QKPiA+PiB0dG1fYnVmZmVyX29iamVjdCAqYm8sCj4gPj4gICBpbnQgdHRt
X2JvX3ZtX2FjY2VzcyhzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwgdW5zaWduZWQgbG9uZyBh
ZGRyLAo+ID4+ICAgICAgICAgICAgICAgIHZvaWQgKmJ1ZiwgaW50IGxlbiwgaW50IHdyaXRlKQo+
ID4+ICAgewo+ID4+IC0gICAgdW5zaWduZWQgbG9uZyBvZmZzZXQgPSAoYWRkcikgLSB2bWEtPnZt
X3N0YXJ0Owo+ID4+ICAgICAgIHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8gPSB2bWEtPnZt
X3ByaXZhdGVfZGF0YTsKPiA+PiArICAgIHVuc2lnbmVkIGxvbmcgb2Zmc2V0ID0gKGFkZHIpIC0g
dm1hLT52bV9zdGFydCArCj4gPj4gKyAgICAgICAgKCh2bWEtPnZtX3Bnb2ZmIC0gZHJtX3ZtYV9u
b2RlX3N0YXJ0KCZiby0+YmFzZS52bWFfbm9kZSkpCj4gPj4gKyAgICAgICAgIDw8IFBBR0VfU0hJ
RlQpOwo+ID4+ICAgICAgIGludCByZXQ7Cj4gPj4gICAgICAgICBpZiAobGVuIDwgMSB8fCAob2Zm
c2V0ICsgbGVuKSA+PiBQQUdFX1NISUZUID4gYm8tPm51bV9wYWdlcykKPiA+Cj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgoKCi0tIApEYW5pZWwg
VmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5m
ZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
