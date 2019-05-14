Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDF61E43A
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 23:58:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABD0E89327;
	Tue, 14 May 2019 21:58:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38C5389327;
 Tue, 14 May 2019 21:58:37 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id r4so396571wro.10;
 Tue, 14 May 2019 14:58:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9NVmY87YsNl5Doqv7XNGQ+SPMJOyZIesPiDpVpf5DtQ=;
 b=FJ+BiCUMcLgAC9jROZzWkiJGft9JxNFG1OZYCU4XThpkwDsdLH9i3bDL509X3B1qrC
 K3XV8rieuVY1m7jxZBtqsh53jBvh/ROa5lw0Cqgy35LD24yEmwuwdo1GpHNNggTnx+LZ
 g4v8UVSOTBUiXcYJXim66qj7iIa2a+e0SZCxaK9OrMKvrBirZ/4jywtNxVyY0Tok2Bxd
 vuX/o880aKojHSHTN4sB6tH458Fz1Wv0pI7gIgTXVtmr+kF0iPLpEkxD54u6//MmHLhJ
 +LX8dPBepZBjN5d/MaDA2Db4lZM626QO0zwx/zpMU5HH8B5naV3HqYnmadhEefAw/JuS
 mrLA==
X-Gm-Message-State: APjAAAVmgvsoChmvOyfoHyGNHt/QZ4atgWKRAEZeSFM13ie15B3VJmyK
 3TLoFppvIysPuLFhcwRS48nOLd+zr4+UlDSOgpg=
X-Google-Smtp-Source: APXvYqzwNprXN29DZ7UGIYwaCejcGQrj8odhje28fvO/bO2B72vQuPKfuJUO5maKd2GmXcWawmIeZOQxcW/uFJwbcOk=
X-Received: by 2002:adf:f44b:: with SMTP id f11mr6854913wrp.128.1557871115739; 
 Tue, 14 May 2019 14:58:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190510195258.9930-1-Felix.Kuehling@amd.com>
 <20190510195258.9930-3-Felix.Kuehling@amd.com>
 <20190510201403.GG4507@redhat.com>
 <65328381-aa0d-353d-68dc-81060e7cebdf@amd.com>
 <BN6PR12MB1809F26E6AF74BE9F96DB22DF70F0@BN6PR12MB1809.namprd12.prod.outlook.com>
 <cf8bdc0c-96b9-8a73-69ca-a4aae11f36d5@amd.com>
In-Reply-To: <cf8bdc0c-96b9-8a73-69ca-a4aae11f36d5@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 14 May 2019 17:58:23 -0400
Message-ID: <CADnq5_N_h6c5bkLRA9pmbhr4fcSUMe=3GCaO7JvsAsrCJ3vdLA@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm/hmm: Only set FAULT_FLAG_ALLOW_RETRY for
 non-blocking
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9NVmY87YsNl5Doqv7XNGQ+SPMJOyZIesPiDpVpf5DtQ=;
 b=ecKhJl+imSaJo+zZms2mo6MckmfFL+/QNhjARw87RGRa/NK8KMH8shTz+qNgdpWZjv
 jhQA1BpOZ8djGF6ar2lVXqWnfYvMOVvRG/sCDTwFp7NxDVvEIrYl3YBD6eiEo2CVot0X
 C/Np9tZee7Ak7pc7FTtRBvM66mqbRpaMAAbzb5Umq2R1DcfEvxoDBIcU247owR9kr4Dz
 h1GrPo2vZy0MEf0P6mzDTozqzIoyv5IiL4TaqplHH5XT3FruVZ/Geh1wUsSt343Cyhzp
 izveqb2mRpa/VoDoWw8WRXVGg+V6Z3r6S9VubY0iOlFikc8HRImOACexjC/iLiPsM/Bj
 r6bQ==
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
Cc: "alex.deucher@amd.com" <alex.deucher@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jerome Glisse <jglisse@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgNToxMiBQTSBLdWVobGluZywgRmVsaXggPEZlbGl4Lkt1
ZWhsaW5nQGFtZC5jb20+IHdyb3RlOgo+Cj4KPiBPbiAyMDE5LTA1LTEzIDQ6MjEgcC5tLiwgRGV1
Y2hlciwgQWxleGFuZGVyIHdyb3RlOgo+ID4gW0NBVVRJT046IEV4dGVybmFsIEVtYWlsXQo+ID4g
SSByZXZlcnRlZCBhbGwgdGhlIGFtZGdwdSBITU0gcGF0Y2hlcyBmb3IgNS4yIGJlY2F1c2UgdGhl
eSBhbHNvCj4gPiBkZXBlbmRlZCBvbiB0aGlzIHBhdGNoOgo+ID4gaHR0cHM6Ly9jZ2l0LmZyZWVk
ZXNrdG9wLm9yZy9+YWdkNWYvbGludXgvY29tbWl0Lz9oPWRybS1uZXh0LTUuMi13aXAmaWQ9Y2Uw
NWVmNzE1NjRmN2NiZTI3MGNkNDMzN2MzNmVlNzIwZWE1MzRkYgo+ID4gd2hpY2ggZGlkIG5vdCBo
YXZlIGEgY2xlYXIgbGluZSBvZiBzaWdodCBmb3IgNS4yIGVpdGhlci4KPgo+IFdoZW4gd2FzIHRo
YXQ/IEkgc2F3ICJVc2UgSE1NIGZvciB1c2VycHRyIiBpbiBEYXZlJ3MgNS4yLXJjMSBwdWxsCj4g
cmVxdWVzdCB0byBMaW51cy4KCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTA4
NzU1ODcvCgpBbGV4CgoKCj4KPgo+IFJlZ2FyZHMsCj4gICAgRmVsaXgKPgo+Cj4gPgo+ID4gQWxl
eAo+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiAqRnJvbToqIGFtZC1nZnggPGFtZC1nZngtYm91bmNl
c0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IG9uIGJlaGFsZiBvZgo+ID4gS3VlaGxpbmcsIEZlbGl4
IDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPgo+ID4gKlNlbnQ6KiBNb25kYXksIE1heSAxMywgMjAx
OSAzOjM2IFBNCj4gPiAqVG86KiBKZXJvbWUgR2xpc3NlCj4gPiAqQ2M6KiBsaW51eC1tbUBrdmFj
ay5vcmc7IGFpcmxpZWRAZ21haWwuY29tOwo+ID4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7Cj4gPiBhbGV4LmRldWNoZXJAYW1k
LmNvbQo+ID4gKlN1YmplY3Q6KiBSZTogW1BBVENIIDIvMl0gbW0vaG1tOiBPbmx5IHNldCBGQVVM
VF9GTEFHX0FMTE9XX1JFVFJZIGZvcgo+ID4gbm9uLWJsb2NraW5nCj4gPiBbQ0FVVElPTjogRXh0
ZXJuYWwgRW1haWxdCj4gPgo+ID4gSGkgSmVyb21lLAo+ID4KPiA+IERvIHlvdSB3YW50IG1lIHRv
IHB1c2ggdGhlIHBhdGNoZXMgdG8geW91ciBicmFuY2g/IE9yIGFyZSB5b3UgZ29pbmcgdG8KPiA+
IGFwcGx5IHRoZW0geW91cnNlbGY/Cj4gPgo+ID4gSXMgeW91ciBobW0tNS4yLXYzIGJyYW5jaCBn
b2luZyB0byBtYWtlIGl0IGludG8gTGludXggNS4yPyBJZiBzbywgZG8geW91Cj4gPiBrbm93IHdo
ZW4/IEknZCBsaWtlIHRvIGNvb3JkaW5hdGUgd2l0aCBEYXZlIEFpcmxpZSBzbyB0aGF0IHdlIGNh
biBhbHNvCj4gPiBnZXQgdGhhdCB1cGRhdGUgaW50byBhIGRybS1uZXh0IGJyYW5jaCBzb29uLgo+
ID4KPiA+IEkgc2VlIHRoYXQgTGludXMgbWVyZ2VkIERhdmUncyBwdWxsIHJlcXVlc3QgZm9yIExp
bnV4IDUuMiwgd2hpY2gKPiA+IGluY2x1ZGVzIHRoZSBmaXJzdCBjaGFuZ2VzIGluIGFtZGdwdSB1
c2luZyBITU0uIFRoZXkncmUgY3VycmVudGx5IGJyb2tlbgo+ID4gd2l0aG91dCB0aGVzZSB0d28g
cGF0Y2hlcy4KPiA+Cj4gPiBUaGFua3MsCj4gPiAgICBGZWxpeAo+ID4KPiA+IE9uIDIwMTktMDUt
MTAgNDoxNCBwLm0uLCBKZXJvbWUgR2xpc3NlIHdyb3RlOgo+ID4gPiBbQ0FVVElPTjogRXh0ZXJu
YWwgRW1haWxdCj4gPiA+Cj4gPiA+IE9uIEZyaSwgTWF5IDEwLCAyMDE5IGF0IDA3OjUzOjI0UE0g
KzAwMDAsIEt1ZWhsaW5nLCBGZWxpeCB3cm90ZToKPiA+ID4+IERvbid0IHNldCB0aGlzIGZsYWcg
YnkgZGVmYXVsdCBpbiBobW1fdm1hX2RvX2ZhdWx0LiBJdCBpcyBzZXQKPiA+ID4+IGNvbmRpdGlv
bmFsbHkganVzdCBhIGZldyBsaW5lcyBiZWxvdy4gU2V0dGluZyBpdCB1bmNvbmRpdGlvbmFsbHkK
PiA+ID4+IGNhbiBsZWFkIHRvIGhhbmRsZV9tbV9mYXVsdCBkb2luZyBhIG5vbi1ibG9ja2luZyBm
YXVsdCwgcmV0dXJuaW5nCj4gPiA+PiAtRUJVU1kgYW5kIHVubG9ja2luZyBtbWFwX3NlbSB1bmV4
cGVjdGVkbHkuCj4gPiA+Pgo+ID4gPj4gU2lnbmVkLW9mZi1ieTogRmVsaXggS3VlaGxpbmcgPEZl
bGl4Lkt1ZWhsaW5nQGFtZC5jb20+Cj4gPiA+IFJldmlld2VkLWJ5OiBKw6lyw7RtZSBHbGlzc2Ug
PGpnbGlzc2VAcmVkaGF0LmNvbT4KPiA+ID4KPiA+ID4+IC0tLQo+ID4gPj4gICBtbS9obW0uYyB8
IDIgKy0KPiA+ID4+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCj4gPiA+Pgo+ID4gPj4gZGlmZiAtLWdpdCBhL21tL2htbS5jIGIvbW0vaG1tLmMKPiA+ID4+
IGluZGV4IGI2NWMyN2Q1YzExOS4uM2M0ZjFkNjIyMDJmIDEwMDY0NAo+ID4gPj4gLS0tIGEvbW0v
aG1tLmMKPiA+ID4+ICsrKyBiL21tL2htbS5jCj4gPiA+PiBAQCAtMzM5LDcgKzMzOSw3IEBAIHN0
cnVjdCBobW1fdm1hX3dhbGsgewo+ID4gPj4gICBzdGF0aWMgaW50IGhtbV92bWFfZG9fZmF1bHQo
c3RydWN0IG1tX3dhbGsgKndhbGssIHVuc2lnbmVkIGxvbmcgYWRkciwKPiA+ID4+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGJvb2wgd3JpdGVfZmF1bHQsIHVpbnQ2NF90ICpwZm4pCj4gPiA+
PiAgIHsKPiA+ID4+IC0gICAgIHVuc2lnbmVkIGludCBmbGFncyA9IEZBVUxUX0ZMQUdfQUxMT1df
UkVUUlkgfCBGQVVMVF9GTEFHX1JFTU9URTsKPiA+ID4+ICsgICAgIHVuc2lnbmVkIGludCBmbGFn
cyA9IEZBVUxUX0ZMQUdfUkVNT1RFOwo+ID4gPj4gICAgICAgIHN0cnVjdCBobW1fdm1hX3dhbGsg
KmhtbV92bWFfd2FsayA9IHdhbGstPnByaXZhdGU7Cj4gPiA+PiAgICAgICAgc3RydWN0IGhtbV9y
YW5nZSAqcmFuZ2UgPSBobW1fdm1hX3dhbGstPnJhbmdlOwo+ID4gPj4gICAgICAgIHN0cnVjdCB2
bV9hcmVhX3N0cnVjdCAqdm1hID0gd2Fsay0+dm1hOwo+ID4gPj4gLS0KPiA+ID4+IDIuMTcuMQo+
ID4gPj4KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+ID4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiA+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
YW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
