Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EA72ACEEB
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 06:24:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 871A0892C1;
	Tue, 10 Nov 2020 05:24:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A14F892C1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 05:24:46 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id t11so11269027edj.13
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Nov 2020 21:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pPvFKnmn+KAlULG06WG2WqGByZbaS7xXfYA7849EOL8=;
 b=M1Dro8bf8w0Stuq8H/II5QZoQzxcoiLK84ppxVANwFl1RNAuzC2RNR9BeHX7p5Vp6I
 6ApOz4qlnnRwktACQmB05+sbHuaLFiBIcRj9/4tO/a0sIQpyxemZT+/SxVwaCiLEGfcb
 K+M0WIlhW/SrBvqbeqFEnI5jlytiIpBEmVtVQ/IA6AadMu3U5D3VORp8IxJPvqPB07sV
 WoGyC1wPx2qTpt9WAMc+mvjGAHsUkDl4yz/OLLs/rIy3ua5P+w7WSzQC14gpQiIJMUUA
 KiDsxK2hlbF32fZsi7PM6Xp8Bgz74lvE5AzmeqW3N3IDWGQqmCkF9RWHl2MccmUN5/A9
 ss+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pPvFKnmn+KAlULG06WG2WqGByZbaS7xXfYA7849EOL8=;
 b=mHlVJcBRVDpF7Aj+ckNuVAou2njl2HeQPM31TRDF5J5z6/m8vyvyM5vNml6e/4QEf4
 +f0qdnzGE0VnEpcjjyLYxcRS9WmggPhAtF6VQYz9jBvG/knjFAIfg1oezGw/sks6ecHt
 qX12J5moC2e/F2MJDzdmiA0mg4MgtdOJ2rGrHimZEpXzl5TAwuK3X6strWfOuapiamtQ
 omeQt2lVyJy6D4tz8bna2I0rtICvoD66Xitblg8qeIke10zMo/LVDhEY+Uu5O0g/rBf8
 NdWCMaiiT35TTUzafxwUPn79tCkECRnVQBXf1EI4fAX3Q1DBkWrbw2irPqaiDuUm5fMd
 k2kw==
X-Gm-Message-State: AOAM530GW+QdC66cBRy+LJWwGB4eixGLmJ7FNViah39sshGPNcEfeIdq
 y0s/CW0hzoGXcFm4bYgix+3DUb20xh/dVVbStQk=
X-Google-Smtp-Source: ABdhPJykUcFvRUm5Pf2s+IBF0aM5/JfZFdb6i8KJe/fg+SrEVMJ6fhvjNCSyQbRBga803MUpSaMWWXaP1s4wGKd7ndA=
X-Received: by 2002:a50:fc95:: with SMTP id f21mr18668553edq.383.1604985884603; 
 Mon, 09 Nov 2020 21:24:44 -0800 (PST)
MIME-Version: 1.0
References: <20201109005432.861936-1-airlied@gmail.com>
 <20201109005432.861936-2-airlied@gmail.com>
 <9fdcf880-be1a-5803-3e54-14a9910a91b7@amd.com>
 <20201109151650.GE6112@intel.com>
 <bec6848c-3ad5-41ca-d424-669a6797b972@amd.com>
 <20201109161825.GG6112@intel.com>
 <dfd0e641-392b-cab2-05d1-ae466ae08ba8@amd.com>
 <20201109164301.GI6112@intel.com>
 <a0179f84-8890-e694-b94c-dbe93605ace5@amd.com>
 <20201109212731.GQ6112@intel.com>
In-Reply-To: <20201109212731.GQ6112@intel.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 10 Nov 2020 15:24:32 +1000
Message-ID: <CAPM=9tyHOoQwhpfAtjREK6mg6zbmNkBuPGYVUpuv8MpP9UDXgA@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/ttm: add multihop infrastrucutre (v2)
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxMCBOb3YgMjAyMCBhdCAwNzoyNywgVmlsbGUgU3lyasOkbMOkCjx2aWxsZS5zeXJq
YWxhQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIE5vdiAwOSwgMjAyMCBhdCAw
OTo0ODowNFBNICswMTAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+ID4gQW0gMDkuMTEuMjAg
dW0gMTc6NDMgc2NocmllYiBWaWxsZSBTeXJqw6Rsw6Q6Cj4gPiA+IE9uIE1vbiwgTm92IDA5LCAy
MDIwIGF0IDA1OjIwOjE3UE0gKzAxMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gPiA+PiBB
bSAwOS4xMS4yMCB1bSAxNzoxOCBzY2hyaWViIFZpbGxlIFN5cmrDpGzDpDoKPiA+ID4+PiBPbiBN
b24sIE5vdiAwOSwgMjAyMCBhdCAwNDo1NzoyOVBNICswMTAwLCBDaHJpc3RpYW4gS8O2bmlnIHdy
b3RlOgo+ID4gPj4+PiBBbSAwOS4xMS4yMCB1bSAxNjoxNiBzY2hyaWViIFZpbGxlIFN5cmrDpGzD
pDoKPiA+ID4+Pj4+IE9uIFdlZCwgTm92IDExLCAyMDIwIGF0IDA2OjEzOjAyUE0gKzAxMDAsIENo
cmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gPiA+Pj4+Pj4gQW0gMDkuMTEuMjAgdW0gMDE6NTQgc2No
cmllYiBEYXZlIEFpcmxpZToKPiA+ID4+Pj4+Pj4gQEAgLTE0MzIsMTUgKzE0NzksMTggQEAgaW50
IHR0bV9ib19zd2Fwb3V0KHN0cnVjdCB0dG1fb3BlcmF0aW9uX2N0eCAqY3R4KQo+ID4gPj4+Pj4+
PiAgICAgICBpZiAoYm8tPm1lbS5tZW1fdHlwZSAhPSBUVE1fUExfU1lTVEVNKSB7Cj4gPiA+Pj4+
Pj4+ICAgICAgICAgICAgICAgc3RydWN0IHR0bV9vcGVyYXRpb25fY3R4IGN0eCA9IHsgZmFsc2Us
IGZhbHNlIH07Cj4gPiA+Pj4+Pj4+ICAgICAgICAgICAgICAgc3RydWN0IHR0bV9yZXNvdXJjZSBl
dmljdF9tZW07Cj4gPiA+Pj4+Pj4+ICsgICAgICAgICAgICAgc3RydWN0IHR0bV9wbGFjZSBob3Ag
PSB7fTsKPiA+ID4+Pj4+PiBQbGVhc2UgYWx3YXlzIHVzZSBtZW1zZXQoKSBpZiB5b3Ugd2FudCB0
byB6ZXJvIGluaXRpYWxpemUgc29tZXRoaW5nIGluCj4gPiA+Pj4+Pj4gdGhlIGtlcm5lbCwgd2Ug
aGFkIGVub3VnaCB0cm91YmxlIHdpdGggdGhhdC4KPiA+ID4+Pj4+IFdoYXQgdHJvdWJsZSBpcyB0
aGF0PyBJJ3ZlIG5vdCBoZWFyZCBvZiBhbnl0aGluZywgYW5kIHdlIHVzZQo+ID4gPj4+Pj4gPXt9
IHF1aXRlIGV4dGVuc2l2ZWx5IGluIGRybSBsYW5kLgo+ID4gPj4+PiA9e30gaW5pdGlhbGl6ZXMg
b25seSBuYW1lZCBmaWVsZHMsIG5vdCBwYWRkaW5nLgo+ID4gPj4+IEhhcyB0aGF0IGFjdHVhbGx5
IGhhcHBlbmVkPwo+ID4gPj4gWUVTISBOdW1lcm91cyB0aW1lcyEKPiA+ID4gWW91IHdvdWxkbid0
IGhhcHBlbiB0byBoYXZlIGxpbmtzL2V0Yy4gdG8gdGhlIGRpc2N1c3Npb24/Cj4gPiA+IEknZCBs
aWtlIHRvIGNoZWNrIHRoZW0gb3V0Lgo+ID4KPiA+IFVmZiwgdGhhdCB3YXMgeWVhcnMgYWdvLiBK
dXN0IGdvb2dsZSBmb3Igc29tZXRoaW5nIGxpa2UgIm1lc2EgbWVtc2V0Cj4gPiBoYXNoIiwgdGhl
cmUgd2FzIHJlY2VudGx5ICh+IHRoZSBsYXN0IHllYXIpIGFub3RoZXIgZGlzY3Vzc2lvbiBiZWNh
dXNlCj4gPiBzb21lYm9keSByYW4gaW50byBleGFjdGx5IHRoYXQgcHJvYmxlbSBvbmNlIG1vcmUu
Cj4KPiBGb3VuZCB0aGlzOgo+IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL21l
c2EvLS9pc3N1ZXMvMjA3MQo+IHdoaWNoIGRvZXMgc3VwcmlzZSBtZSBhIGJpdC4gVGhvdWdoIEkg
c3VzcGVjdCA9e30gbWlnaHQKPiBiZWhhdmUgZGlmZmVyZW50bHkgc2luY2UgdGhlIGNvbXBpbGVy
IG1pZ2h0IHRyZWF0IGl0Cj4gbW9yZSBsaWtlIGEgbWVtc2V0KCkuCgpJdCBkb2Vzbid0IHRoZXJl
J3MgYSBiaXQgb2YgaW5mbyBvdXQgdGhlcmUgb24gd2hhdCBoYXBwZW5zLCBpdCByZWFsbHkKb25s
eSBtYXR0ZXJzIGZvciBzdHJ1Y3RzIHdlIGFyZSBwYXNzaW5nIHRvIHVzZXJzcGFjZSwgYnV0IGl0
J3MKdW5saWtlbHkgdG8gbWF0dGVyIGhlcmUsCmJ1dCBJJ3ZlIGNoYW5nZWQgdGhpcyB0byBtZW1z
ZXQgaW4gbXkgbG9jYWwgdHJlZSwgYmVjYXVzZSB3aHkgbm90LgoKRGF2ZQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
