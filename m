Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E446798DF4
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 10:38:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89CC26EAA8;
	Thu, 22 Aug 2019 08:38:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D386EAA8
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 08:38:13 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id e8so6574177wme.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 01:38:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=pBgr40k/dxBcegiAGus0u9bRddQPCAqd1MtKHJNo7yM=;
 b=tdYe7Jq/ydAdaSNIlnyZX/w8iBK0XQvHqAt9HQFSi669n8PrDmmWHQqmHKWR6Fno54
 GWi4jClsvSb62jbjV0O4uiay8LaK0X3LYwqTUr9KUkDn+e6ueUbprShArTD9fTQ6kSNS
 0/S670snUHVRoQAX2TcbrOWKU/IeOq4EAEnzAEbxruPS2q1/bgmM7kIlCSkaTu8Le+m2
 NhhUzGGzxxneeJXpQsU6MeWJuOAMT+Yq3+7Uvl8DcdiT5EHA/lxBLUGkNXvc5B3zn/m7
 0O3aQH9X07+4Z1QNbAZjleGVPBVsqJtxuS9GQngCYx7xFhIPpVkJ4X8HroEJ3tJ72Ski
 79nQ==
X-Gm-Message-State: APjAAAUQJqBrU464dh5lElran3F91/Na7mRRoXgMmGFsPTe3D5ajRtKC
 fpBo8N5Dh5Kq7x2oae2kTiQ=
X-Google-Smtp-Source: APXvYqwPPCOyjIeNtO+fLXPbYZgVGjB7CmFRpNKkdg8stT5kbXvPdv6T52gvb1WF4FthLhRVFIbe9A==
X-Received: by 2002:a05:600c:48b:: with SMTP id
 d11mr5103593wme.124.1566463092102; 
 Thu, 22 Aug 2019 01:38:12 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id o129sm7046294wmb.41.2019.08.22.01.38.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 22 Aug 2019 01:38:11 -0700 (PDT)
Subject: Re: [PATCH 03/10] dma-buf: add dma_fence_array_recycle
To: Chris Wilson <chris@chris-wilson.co.uk>, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org, sumit.semwal@linaro.org
References: <20190821123147.110736-1-christian.koenig@amd.com>
 <20190821123147.110736-4-christian.koenig@amd.com>
 <156640466565.20466.15873039258008813430@skylake-alporthouse-com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <852e9e9f-5e33-f1e6-f7ee-06c38df4a62e@gmail.com>
Date: Thu, 22 Aug 2019 10:38:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <156640466565.20466.15873039258008813430@skylake-alporthouse-com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=pBgr40k/dxBcegiAGus0u9bRddQPCAqd1MtKHJNo7yM=;
 b=WMwtFgtsdzJP2uRi1kFLFpZBkWJ9zt0n1vvhnzYaX3UPocvVqQj0LxuxAPl1p6NnQR
 TL0FLeOvLedqWb8BM3DRbNh4RUA0uJrrR25B8LIsKsaYZ7G1kq/C9MyGh4kY47LE0Zlg
 sIxbR5qO+vgCIVQDB7VInpZcNkwlBsXqDRPSWHo+Vr2UfBcpQQEbnuVBqzQ6zrQZ1HdZ
 jCBELzOZ1HkC/69SL1H3v2OyAPjK0ND5E/erlfEh3UtTWiibEusohyIBbi1xrPKaBeBi
 FmMiwyN8UoaASCX9kviesUPuSbsNaD8OLJr/YpQe0xkcet9OX5P8UBkxUzrt9aykvb+S
 jVeA==
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
Reply-To: christian.koenig@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjEuMDguMTkgdW0gMTg6MjQgc2NocmllYiBDaHJpcyBXaWxzb246Cj4gUXVvdGluZyBDaHJp
c3RpYW4gS8O2bmlnICgyMDE5LTA4LTIxIDEzOjMxOjQwKQo+PiBUcnkgdG8gcmVjeWNsZSBhbiBk
bWFfZmVuY2VfYXJyYXkgb2JqZWN0IGJ5IGRyb3BwaW5nIHRoZSBsYXN0Cj4+IHJlZmVyZW5jZSB0
byBpdCB3aXRob3V0IGZyZWVpbmcgaXQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBL
w7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPj4gLS0tCj4+ICAgZHJpdmVycy9kbWEt
YnVmL2RtYS1mZW5jZS1hcnJheS5jIHwgMjcgKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+
ICAgaW5jbHVkZS9saW51eC9kbWEtZmVuY2UtYXJyYXkuaCAgIHwgIDEgKwo+PiAgIDIgZmlsZXMg
Y2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEt
YnVmL2RtYS1mZW5jZS1hcnJheS5jIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1mZW5jZS1hcnJheS5j
Cj4+IGluZGV4IGU4MmYzMDU1MWFhMS4uMzE0Y2YwZTg4MWQ5IDEwMDY0NAo+PiAtLS0gYS9kcml2
ZXJzL2RtYS1idWYvZG1hLWZlbmNlLWFycmF5LmMKPj4gKysrIGIvZHJpdmVycy9kbWEtYnVmL2Rt
YS1mZW5jZS1hcnJheS5jCj4+IEBAIC0xODgsNiArMTg4LDMzIEBAIHZvaWQgZG1hX2ZlbmNlX2Fy
cmF5X2luaXQoc3RydWN0IGRtYV9mZW5jZV9hcnJheSAqYXJyYXksIHU2NCBjb250ZXh0LAo+PiAg
IH0KPj4gICBFWFBPUlRfU1lNQk9MKGRtYV9mZW5jZV9hcnJheV9pbml0KTsKPj4gICAKPj4gKy8q
Kgo+PiArICogZG1hX2ZlbmNlX2FycmF5X3JldXNlIC0gZHVtbXkgZm9yIGRtYV9mZW5jZV9hcnJh
eV9yZWN5Y2xlCj4+ICsgKi8KPj4gK3N0YXRpYyB2b2lkIGRtYV9mZW5jZV9hcnJheV9yZXVzZShz
dHJ1Y3Qga3JlZiAqa3JlZikKPj4gK3sKPj4gKyAgICAgICBzdHJ1Y3QgZG1hX2ZlbmNlX2FycmF5
ICphcnJheSA9IGNvbnRhaW5lcl9vZihrcmVmLCB0eXBlb2YoKmFycmF5KSwKPj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBiYXNlLnJlZmNvdW50
KTsKPj4gKwo+PiArICAgICAgIFdBUk5fT05fT05DRSghbGlzdF9lbXB0eSgmYXJyYXktPmJhc2Uu
Y2JfbGlzdCkpOwo+IFsgICA3Ny41ODQ2OTRdIFdBUk5JTkc6IENQVTogMyBQSUQ6IDYyNyBhdCBk
cml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLWFycmF5LmM6MTk5IGRtYV9mZW5jZV9hcnJheV9yZWN5
Y2xlKzB4MWQvMHgyMAo+IFsgICA3Ny41ODQ3MDJdIE1vZHVsZXMgbGlua2VkIGluOiBubHNfYXNj
aWkgbmxzX2NwNDM3IHZmYXQgZmF0IGNyY3QxMGRpZl9wY2xtdWwgaTkxNSBjcmMzMl9wY2xtdWwg
Y3JjMzJjX2ludGVsIGFlc25pX2ludGVsIGFlc194ODZfNjQgZ2x1ZV9oZWxwZXIgY3J5cHRvX3Np
bWQgY3J5cHRkIGludGVsX2NzdGF0ZSBpbnRlbF9ndHQgZHJtX2ttc19oZWxwZXIgaW50ZWxfdW5j
b3JlIGludGVsX3JhcGxfcGVyZiBhaGNpIGkyY19pODAxIGxpYmFoY2kgZWZpdmFycyB2aWRlbyBi
dXR0b24gZWZpdmFyZnMKPiBbICAgNzcuNTg0NzE2XSBDUFU6IDMgUElEOiA2MjcgQ29tbTogZ2Vt
X2J1c3kgVGFpbnRlZDogRyAgICAgVSAgICAgICAgICAgIDUuMy4wLXJjNSsgIzcyCj4gWyAgIDc3
LjU4NDcxOV0gSGFyZHdhcmUgbmFtZTogSW50ZWwgQ29ycG9yYXRpb24gTlVDN2k1Qk5LL05VQzdp
NUJOQiwgQklPUyBCTktCTDM1Ny44NkEuMDA1Mi4yMDE3LjA5MTguMTM0NiAwOS8xOC8yMDE3Cj4g
WyAgIDc3LjU4NDcyM10gUklQOiAwMDEwOmRtYV9mZW5jZV9hcnJheV9yZWN5Y2xlKzB4MWQvMHgy
MAo+IFsgICA3Ny41ODQ3MjZdIENvZGU6IDVkIGMzIDViIDVkIGU5IDU0IGY1IGZmIGZmIDBmIDFm
IDQwIDAwIGYwIGZmIDRmIDM4IDBmIDg4IGQzIDg1IDE0IDAwIDBmIDk0IGMwIDc0IDAxIGMzIDQ4
IDhiIDU3IDEwIDQ4IDgzIGM3IDEwIDQ4IDM5IGQ3IDc0IGYyIDwwZj4gMGIgYzMgNDggYzcgYzAg
NjIgODggYmUgODEgYzMgMGYgMWYgODQgMDAgMDAgMDAgMDAgMDAgNDggYzcgYzAKPiBbICAgNzcu
NTg0NzMwXSBSU1A6IDAwMTg6ZmZmZmM5MDAwMDFjM2M3OCBFRkxBR1M6IDAwMDEwMjkyCj4gWyAg
IDc3LjU4NDczM10gUkFYOiAwMDAwMDAwMDAwMDAwMDAxIFJCWDogZmZmZjg4ODg1YWMxNGI0MCBS
Q1g6IGNjY2NjY2NjY2NjY2NjY2QKPiBbICAgNzcuNTg0NzM1XSBSRFg6IDAwMDAwMDEyMTA1YjBh
NzcgUlNJOiAwMDAwMDAwMDAwMDAwMDAwIFJESTogZmZmZjg4ODg1YWMxNGI1MAo+IFsgICA3Ny41
ODQ3MzddIFJCUDogMDAwMDAwMDAwMDAwMDAwMCBSMDg6IDAwMDAwMDAwMDAwMDAwMDQgUjA5OiAw
MDAwMDAwMDAwMDFkZTAwCj4gWyAgIDc3LjU4NDc0MF0gUjEwOiAwMDAwMDAzMGY1MjI0MDEyIFIx
MTogMDAwMDAwMDAwMDAwMDJkZiBSMTI6IGZmZmY4ODg4NWI1OGFmZjAKPiBbICAgNzcuNTg0NzQy
XSBSMTM6IDAwMDAwMDAwMDAwMDAwMDAgUjE0OiAwMDAwMDAwMDAwMDAwMDAwIFIxNTogZmZmZjg4
ODg1NzQ4ZTEwMAo+IFsgICA3Ny41ODQ3NDVdIEZTOiAgMDAwMDdmMWNkNDdiMTljMCgwMDAwKSBH
UzpmZmZmODg4ODVlYjgwMDAwKDAwMDApIGtubEdTOjAwMDAwMDAwMDAwMDAwMDAKPiBbICAgNzcu
NTg0NzQ4XSBDUzogIDAwMTAgRFM6IDAwMDAgRVM6IDAwMDAgQ1IwOiAwMDAwMDAwMDgwMDUwMDMz
Cj4gWyAgIDc3LjU4NDc1MF0gQ1IyOiAwMDAwN2YxY2Q2NzE5MDAwIENSMzogMDAwMDAwMDg1YWM1
YjAwMiBDUjQ6IDAwMDAwMDAwMDAxNjA2ZTAKPiBbICAgNzcuNTg0NzUzXSBDYWxsIFRyYWNlOgo+
IFsgICA3Ny41ODQ3NThdICBkbWFfcmVzdl9mZW5jZXNfYXNzaWduLmlzcmEuNysweDhkLzB4MjIw
Cj4gWyAgIDc3LjU4NDc2MV0gIGRtYV9yZXN2X3BydW5lX2ZlbmNlcysweGJhLzB4YzAKPiBbICAg
NzcuNTg0Nzk2XSAgaTkxNV9nZW1fb2JqZWN0X3dhaXRfcmVzZXJ2YXRpb24rMHgyMjYvMHgyNDAg
W2k5MTVdCj4gWyAgIDc3LjU4NDgyN10gIGk5MTVfZ2VtX29iamVjdF93YWl0KzB4MjMvMHg0MCBb
aTkxNV0KPiBbICAgNzcuNTg0ODU0XSAgaTkxNV9nZW1fc2V0X2RvbWFpbl9pb2N0bCsweGJmLzB4
MjQwIFtpOTE1XQo+Cj4gSWYgd2Ugc2lnbmFsIHRoZSBmZW5jZS1hcnJheSwgdGhlIGNiX2xpc3Qg
aXMgcmVwbGFjZWQgYnkgdGhlIHRpbWVzdGFtcAo+IGFuZCBpcyBubyBsb25nZXIgY29uc2lkZXJl
ZCBlbXB0eS4KCkFoLCB5ZWFoIGdvb2QgcG9pbnQgSSBhY3R1YWxseSB3cm90ZSB0aGF0IGJlZm9y
ZSBjYl9saXN0IGFuZCB0aW1lc3RhbXAgCnNoYXJlZCB0aGUgc2FtZSBtZW1vcnkuCgpDaHJpc3Rp
YW4uCgo+IC1DaHJpcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
