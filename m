Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBF433C7D7
	for <lists+dri-devel@lfdr.de>; Mon, 15 Mar 2021 21:39:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D24E89FDE;
	Mon, 15 Mar 2021 20:39:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C69289FDE
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 20:39:09 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id p24so7594702ota.11
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 13:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rFQXA1zyyymGn/qPUm03Zw+0IiOXrVbiE4z1lXnXrP8=;
 b=fqkUjASIUiOK7B7urWwTVS8PSJPKrtRbo4HeyGcgObx2Y1qBi4brHUZ/osTBAbYV3M
 rQGV/1fVZfRaJTtRYF6K/VzlG1JqWXoWr20vCRpMEr9GwUFAbAPaxswisrPlmzdqABgd
 yCo96VYrF2jvwcykKhUoxrdTIxeZU1V1jyfdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rFQXA1zyyymGn/qPUm03Zw+0IiOXrVbiE4z1lXnXrP8=;
 b=Evr04nNxLKVMJ6D41s3bjFsRHJ9e5nhHWCCRUpQMZSDAwD+GbefUOJcOijLMDrYaWe
 lwcgTtZRAaI6wsMAUGaZR/ZGF/svgESguTO6kJgDsovtwSWUZHIU9iSoPkKficL6mEfF
 w8yWpfHegkhMaQh+aFY/exYDywE7MAefGUgEnua1HEfmy1zW/1OJch8vO7Rs2a/njvUW
 ye9Dh7ngFGBnWj69eqh5dYDo/POlTxE0TtT44gOHXscXHNoK0faviPVifLjeZnZ0JOOV
 JkDK5BHJFLIvISFqSM5DtSCjf4zhhfXAEngl3rouu2Ac46oG8Vn5QGIooldr/lmSxz6n
 U6jA==
X-Gm-Message-State: AOAM531E7xqUrFmBzVbXMpNsy8ViYp6Xqmfy3K8cawYHebI+DQletSFO
 WI8F7ASM8Wu+c2n2tPyCSNpP+E4uJJD0s4AMfkFqEA==
X-Google-Smtp-Source: ABdhPJzLcOo6KKrshG6STQQOJWoc/5VQ7TpXLVApQSsOKd1pdu4sEjqh++nxewqAawUk9f6DzDqQv/HGvXW6eSI/V+8=
X-Received: by 2002:a9d:7b4e:: with SMTP id f14mr707914oto.281.1615840748727; 
 Mon, 15 Mar 2021 13:39:08 -0700 (PDT)
MIME-Version: 1.0
References: <09ebc5cf-3e2c-d233-2c58-ff4d72e01297@shipmail.org>
 <D04E8A53-C740-480D-9209-1CC6A40A10F2@vmware.com>
 <54448dd1-cfc3-626a-6480-4edfcf97b148@shipmail.org>
 <DCF8E67E-36D4-400A-88B7-63C6253179D6@vmware.com>
 <48d5e3f3-0b42-a9e4-6e5c-591806e873ff@shipmail.org>
 <3bb8b7f4-953a-b455-e148-009c2ff9f7b2@vmware.com>
In-Reply-To: <3bb8b7f4-953a-b455-e148-009c2ff9f7b2@vmware.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 15 Mar 2021 21:38:57 +0100
Message-ID: <CAKMK7uGY1-G_+CcaSfDqPhMpwbExugJj53A7xEn+LS5d398_3w@mail.gmail.com>
Subject: Re: vmwgfx leaking bo pins?
To: Zack Rusin <zackr@vmware.com>
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
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m_=28Intel=29?= <thomas_os@shipmail.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXIgMTUsIDIwMjEgYXQgNjo1NyBQTSBaYWNrIFJ1c2luIDx6YWNrckB2bXdhcmUu
Y29tPiB3cm90ZToKPgo+IE9uIDMvMTIvMjEgNTowNiBBTSwgVGhvbWFzIEhlbGxzdHLDtm0gKElu
dGVsKSB3cm90ZToKPiA+Cj4gPiBPbiAzLzEyLzIxIDEyOjAyIEFNLCBaYWNrIFJ1c2luIHdyb3Rl
Ogo+ID4+Cj4gPj4+IE9uIE1hciAxMSwgMjAyMSwgYXQgMTc6MzUsIFRob21hcyBIZWxsc3Ryw7Zt
IChJbnRlbCkKPiA+Pj4gPHRob21hc19vc0BzaGlwbWFpbC5vcmc+IHdyb3RlOgo+ID4+Pgo+ID4+
PiBIaSwgWmFjawo+ID4+Pgo+ID4+PiBPbiAzLzExLzIxIDEwOjA3IFBNLCBaYWNrIFJ1c2luIHdy
b3RlOgo+ID4+Pj4+IE9uIE1hciAxMSwgMjAyMSwgYXQgMDU6NDYsIFRob21hcyBIZWxsc3Ryw7Zt
IChJbnRlbCkKPiA+Pj4+PiA8dGhvbWFzX29zQHNoaXBtYWlsLm9yZz4gd3JvdGU6Cj4gPj4+Pj4K
PiA+Pj4+PiBIaSwKPiA+Pj4+Pgo+ID4+Pj4+IEkgdHJpZWQgbGF0ZXN0IGRybS1maXhlcyB0b2Rh
eSBhbmQgc2F3IGEgbG90IG9mIHRoZXNlOiBGYWxsb3V0IGZyb20KPiA+Pj4+PiB0dG0gcmV3b3Jr
Pwo+ID4+Pj4gWWVzLCBJIGZpeGVkIHRoaXMgaW4gZDFhNzNjNjQxYWZkMjYxN2JkODBiY2U4Yjcx
YTA5NmZjNWI3NGI3ZSBpdCB3YXMKPiA+Pj4+IGluIGRybS1taXNjLW5leHQgaW4gdGhlIGRybS1t
aXNjIHRyZWUgZm9yIGEgd2hpbGUgYnV0IGhhc27igJl0IGJlZW4KPiA+Pj4+IG1lcmdlZCBmb3Ig
NS4xMi4KPiA+Pj4+Cj4gPj4+PiB6Cj4gPj4+Pgo+ID4+PiBIbW0sIHllcyBidXQgZG9lc24ndCB0
aGF0IGZpeCB0cmlwIHRoZSB0dG1fYm9fdW5waW4oKQo+ID4+PiBkbWFfcmVzdl9hc3NlcnRfaGVs
ZChiby0+YmFzZS5yZXN2KT8KPiA+PiBObywgZG9lc27igJl0IHNlZW0gdG8uIFRCSCBJ4oCZbSBu
b3Qgc3VyZSB3aHkgbXlzZWxmLCBidXQgaXQgc2VlbXMgdG8gYmUKPiA+PiB3b3JraW5nIGZpbmUu
Cj4gPj4KPiA+Pgo+ID4gV2l0aCBDT05GSUdfUFJPVkVfTE9DS0lORz15IEkgc2VlIHRoaXM6Cj4g
Pgo+ID4gWyAgICA3LjExNzE0NV0gW2RybV0gRklGTyBhdCAweDAwMDAwMDAwZmUwMDAwMDAgc2l6
ZSBpcyA4MTkyIGtpQgo+ID4gWyAgICA3LjExNzI4NF0gW2RybV0gVlJBTSBhdCAweDAwMDAwMDAw
ZTgwMDAwMDAgc2l6ZSBpcyAxMzEwNzIga2lCCj4gPiBbICAgIDcuMTE3MjkxXSBJTkZPOiB0cnlp
bmcgdG8gcmVnaXN0ZXIgbm9uLXN0YXRpYyBrZXkuCj4gPiBbICAgIDcuMTE3Mjk1XSB0aGUgY29k
ZSBpcyBmaW5lIGJ1dCBuZWVkcyBsb2NrZGVwIGFubm90YXRpb24uCj4gPiBbICAgIDcuMTE3Mjk4
XSB0dXJuaW5nIG9mZiB0aGUgbG9ja2luZyBjb3JyZWN0bmVzcyB2YWxpZGF0b3IKPiA+Cj4gPiBX
aGljaCB3aWxsIHByb2JhYmx5IG1hc2sgdGhhdCBkbWFfcmVzdl9hc3NlcnRfaGVsZChiby0+YmFz
ZS5yZXN2KQo+ID4KPgo+IEFoLCB5ZXMsIHlvdSdyZSByaWdodC4gQWZ0ZXIgZml4aW5nIHRoYXQg
SSBkbyBzZWUgdGhlCj4gZG1hX3Jlc3ZfYXNzZXJ0X2hlbGQgdHJpZ2dlcmVkLiBUZWNobmljYWxs
eSB0cml2aWFsbHkgZml4YWJsZSB3aXRoCj4gdHRtX2JvX3Jlc2VydmUvdHRtX2JvX3VucmVzZXJ2
ZSBhcm91bmQgdHRtX2JvX3VucGluIGJ1dCBpdCdzIGEgbGl0dGxlCj4gdWdseSB0aGF0IHNvbWUg
cGxhY2VzIGUuZy4gdm13X2JvX3VucmVmZXJlbmNlIHdpbGwgcmVxdWlyZQo+IHR0bV9ib19yZXNl
cnZlL3R0bV9ib191bnJlc2VydmUgYXJvdW5kIHR0bV9ib191bnBpbiBidXQgc29tZSB3b24ndCBl
LmcuCj4gdm13X21vYl9kZXN0cm95IHdvbid0IGJlY2F1c2UgaXRzIGxvY2sgaXMgaGVsZCBieSB0
dG1fYm9fZGVsYXllZF9kZWxldGUKPiB3aXRob3V0IGEgdmVyeSBjbGVhciBpbmRpY2F0aW9uIHdp
dGhpbiB0aGUgZnVuY3Rpb24gd2hpY2ggaXMgd2hpY2guCgpOb3Qgc3VyZSBpdCBhcHBsaWVzIGhl
cmUsIGJ1dCBpZiB0aGUgcmVmY291bnQgaXMgZG93biB0byAwIHdlIGtub3cKd2UncmUgaW4gZGVz
dHJ1Y3Rpb24gY29kZSBhbmQgY2FuJ3QgcmFjZSB3aXRoIGFueXRoaW5nIGFueW1vcmUsIHNvCm1h
eWJlIHdlIGNhbiBsaWZ0IHRoZSBkZWJ1ZyBjaGVjay4KCk90b2ggSSB0aGluayBhdCB0aGF0IHBv
aW50IHdlIG1pZ2h0IHN0aWxsIGJlIG9uIGxydSBsaXN0cywgc28gdGhlCnJ1bGVzIGJlY29tZSBy
YXRoZXIgdHJpY2t5IHdoZXRoZXIgaXQncyByZWFsbHkgYWx3YXlzIGxlZ2FsIHRvIHNraXAKdGhl
IGRtYV9yZXN2X2xvY2suIEJ1dCB3ZSBjb3VsZCBwZXJoYXBzIGZpZ3VyZSBvdXQgc29tZXRoaW5n
IGlmIGl0J3MKdG9vIGFubm95aW5nIHRvIGhhdmUgYSBjb25zaXN0ZW50IGNhbGxpbmcgY29udGV4
dCBpbiBkcml2ZXJzLgoKSSdtIG5vdCBhIGh1Z2UgZmFuIG9mIGRyb3BwaW5nIHRoZSByZXF1aXJl
bWVudCBmcm9tIHVucGluIGFuZApzd2l0Y2hpbmcgdG8gYXRvbWljX3QgZm9yIHRoZSBwaW4gY291
bnQsIHNpbmNlIHBpbi91bnBpbiBpcyBhbgpleHRyZW1lbHkgc2xvdyBwYXRoLCBhZGRpbmcgY29t
cGxleGl0eSBpbiBob3cgd2UgcHJvdGVjdCBzdHVmZiBmb3IgYQpmdW5jdGlvbiB0aGF0J3MgbWF5
YmUgY2FsbGVkIDYwL3MgKGZvciBwYWdlIGZsaXBwaW5nIHdlIHBpbi91bnBpbikKZG9lc24ndCBz
dHJpa2UgbWUgYXMgdGhlIHJpZ2h0IGJhbGFuY2UuIEFuZCBhdG9taWMgY29tbWl0IGhlbHBlcnMg
YXJlCmV4cGxpY2l0bHkgZGVzaWduZWQgdG8gYWxsb3cgZHJpdmVycyB0byBncmFiIGRtYV9yZXN2
X2xvY2sgaW4gdGhlaXIKLT5jbGVhbnVwX2ZiIGhvb2ssIHNpbmNlIHRoYXQgcGFydCBpcyBfbm90
XyBpbiB0aGUgZG1hX2ZlbmNlCnNpZ25hbGxpbmcgY3JpdGljYWwgcGF0aCBmb3IgdGhlIGF0b21p
YyBmbGlwLiBCdXQgaWYgYWxsIGVsc2UgZmFpbHMgSQpndWVzcyB0aGF0J3MgYW4gb3B0aW9uIHRv
by4KLURhbmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29y
cG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
