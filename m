Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47444427EF
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 15:47:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 142DB89568;
	Wed, 12 Jun 2019 13:47:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com
 [IPv6:2607:f8b0:4864:20::944])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD2D989568
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 13:47:54 +0000 (UTC)
Received: by mail-ua1-x944.google.com with SMTP id a97so4121736uaa.9
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 06:47:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sndVF2QUnlwyAu3mY37sRIobOvgdUoDeHRo0N/uX+lo=;
 b=H0VGPO4M95gGIuswwvrq/wPj7om86JxwatuEF1XNx/HBYzrNNrogZGT41GaSjGHYJU
 OEJBajhmnhJ9x6sIahiq7UJoNywNtuhsEfyhxnGtftHUEujx5j4wDdNOHXrBJ05TON3m
 l9G0Cn2yVdhoJ8AupYJPme0MimO4Z2xzB+fwmSw8j4IG65i3gLSuEnJFBqowPeM0eMP0
 aElfTDH4fz2JfX5Iu1q/GKTJz3pNzkYqvnV29tp4pNKse7RYEPRojYOV9+A7H/5NbSzK
 taI0Xz7LOz/aUodr6L3jhuCpeyyUT/iuTZM59+5wCBjIg7y2u1/kKscGgc4xjVtbdBJ0
 HVdw==
X-Gm-Message-State: APjAAAVITpJvRqrBSYlc0CpLNd2MG8Gq5blQLXM1h1soQ8bfoamNihPh
 a5miktA/pne2HkIf4FL0KHKNWUDt8RlU7j5Qm3k=
X-Google-Smtp-Source: APXvYqwvjrxjdEEQ+OZHD0c1TjytlSFc1i/4Tbv3ZLTMF9YCuXdCO+WEs5RxxA6alrfce7JHX81fcmNmp7KX8hvdukU=
X-Received: by 2002:ab0:208c:: with SMTP id r12mr26604410uak.27.1560347273718; 
 Wed, 12 Jun 2019 06:47:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190606222751.32567-1-daniel.vetter@ffwll.ch>
 <20190606222751.32567-11-daniel.vetter@ffwll.ch>
In-Reply-To: <20190606222751.32567-11-daniel.vetter@ffwll.ch>
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Date: Wed, 12 Jun 2019 10:47:44 -0300
Message-ID: <CADKXj+510q3BaAADuhmcTMMnXs1qt28QVbEHT1mGxAhKHesYAw@mail.gmail.com>
Subject: Re: [PATCH 10/10] drm/vkms: No need for ->pages_lock in crc work
 anymore
To: Daniel Vetter <daniel.vetter@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=sndVF2QUnlwyAu3mY37sRIobOvgdUoDeHRo0N/uX+lo=;
 b=owPmvNpngy4tkt+6ddpE9J74pym0RJgQYB0QC3cNNW2Bfd85XIG/zA3Ev2kYhpU88Q
 MOhgkp7PaxMb0p1fFbINEIS5el7tBR8/b3rXMaCMF3bKVbnQIaWoGjfI2zEND3E/6F6D
 0ArM45YEoTubPUHS7QNLqlUrDuvLO8+ULCEYj39ZZOl/PHfB2NEU7jOGm8c5QyciSEhD
 9DAyfM+fheJvOSmL0NTmRmBsecSc603sFg+gpzhOdvRpaQ6J6gRq3U/7ybmkx/H1b9o+
 iqA8i7sqqJilEe7rA0fQHyeoNkxfbcxTcq25Sg3HBM0eEnqb2kyqPsjbl0ZK57M1BtL+
 PsaQ==
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Haneen Mohammed <hamohammed.sa@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gNiwgMjAxOSBhdCA3OjI4IFBNIERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0
ZXJAZmZ3bGwuY2g+IHdyb3RlOgo+Cj4gV2UncmUgbm93IGd1YXJhbnRlZWQgdG8gbm8gbG9uZ2Vy
IHJhY2UgYWdhaW5zdCBwcmVwYXJlX2ZiL2NsZWFudXBfZmIsCj4gd2hpY2ggbWVhbnMgd2UgY2Fu
IGFjY2VzcyAtPnZhZGRyIHdpdGhvdXQgaGF2aW5nIHRvIGhvbGQgYSBsb2NrLgo+Cj4gQmVmb3Jl
IHRoZSBwcmV2aW91cyBwYXRjaGVzIGl0IHdhcyBmYWlybHkgZWFzeSB0byBvYnNlcnZlIHRoZSBj
dXJzb3IKPiAtPnZhZGRyIGJlaW5nIGludmFsaWQsIGJ1dCB0aGF0J3Mgbm93IGdvbmUsIHNvIHdl
IGNhbiB1cGdyYWRlIHRvIGEKPiBmdWxsIFdBUk5fT04uCj4KPiBTaWduZWQtb2ZmLWJ5OiBEYW5p
ZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiBDYzogUm9kcmlnbyBTaXF1ZWly
YSA8cm9kcmlnb3NpcXVlaXJhbWVsb0BnbWFpbC5jb20+Cj4gQ2M6IEhhbmVlbiBNb2hhbW1lZCA8
aGFtb2hhbW1lZC5zYUBnbWFpbC5jb20+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZnds
bC5jaD4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19jcmMuYyB8IDEzICsrLS0t
LS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25z
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19jcmMuYyBiL2Ry
aXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfY3JjLmMKPiBpbmRleCAwZDMxY2ZjMzIwNDIuLjRiMzE0
NmQ4MzI2NSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2NyYy5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19jcmMuYwo+IEBAIC05NywxNiArOTcsMTAg
QEAgc3RhdGljIHZvaWQgY29tcG9zZV9jdXJzb3Ioc3RydWN0IHZrbXNfY3JjX2RhdGEgKmN1cnNv
cl9jcmMsCj4gICAgICAgICBjdXJzb3Jfb2JqID0gZHJtX2dlbV9mYl9nZXRfb2JqKCZjdXJzb3Jf
Y3JjLT5mYiwgMCk7Cj4gICAgICAgICBjdXJzb3Jfdmttc19vYmogPSBkcm1fZ2VtX3RvX3ZrbXNf
Z2VtKGN1cnNvcl9vYmopOwo+Cj4gLSAgICAgICBtdXRleF9sb2NrKCZjdXJzb3Jfdmttc19vYmot
PnBhZ2VzX2xvY2spOwo+IC0gICAgICAgaWYgKCFjdXJzb3Jfdmttc19vYmotPnZhZGRyKSB7Cj4g
LSAgICAgICAgICAgICAgIERSTV9XQVJOKCJjdXJzb3IgcGxhbmUgdmFkZHIgaXMgTlVMTCIpOwo+
IC0gICAgICAgICAgICAgICBnb3RvIG91dDsKPiAtICAgICAgIH0KPiArICAgICAgIGlmIChXQVJO
X09OKCFjdXJzb3Jfdmttc19vYmotPnZhZGRyKSkKPiArICAgICAgICAgICAgICAgcmV0dXJuOwo+
Cj4gICAgICAgICBibGVuZCh2YWRkcl9vdXQsIGN1cnNvcl92a21zX29iai0+dmFkZHIsIHByaW1h
cnlfY3JjLCBjdXJzb3JfY3JjKTsKPiAtCj4gLW91dDoKPiAtICAgICAgIG11dGV4X3VubG9jaygm
Y3Vyc29yX3ZrbXNfb2JqLT5wYWdlc19sb2NrKTsKPiAgfQo+Cj4gIHN0YXRpYyB1aW50MzJfdCBf
dmttc19nZXRfY3JjKHN0cnVjdCB2a21zX2NyY19kYXRhICpwcmltYXJ5X2NyYywKPiBAQCAtMTIz
LDE1ICsxMTcsMTIgQEAgc3RhdGljIHVpbnQzMl90IF92a21zX2dldF9jcmMoc3RydWN0IHZrbXNf
Y3JjX2RhdGEgKnByaW1hcnlfY3JjLAo+ICAgICAgICAgICAgICAgICByZXR1cm4gMDsKPiAgICAg
ICAgIH0KPgo+IC0gICAgICAgbXV0ZXhfbG9jaygmdmttc19vYmotPnBhZ2VzX2xvY2spOwo+ICAg
ICAgICAgaWYgKFdBUk5fT04oIXZrbXNfb2JqLT52YWRkcikpIHsKPiAtICAgICAgICAgICAgICAg
bXV0ZXhfdW5sb2NrKCZ2a21zX29iai0+cGFnZXNfbG9jayk7Cj4gICAgICAgICAgICAgICAgIGtm
cmVlKHZhZGRyX291dCk7Cj4gICAgICAgICAgICAgICAgIHJldHVybiBjcmM7Cj4gICAgICAgICB9
Cj4KPiAgICAgICAgIG1lbWNweSh2YWRkcl9vdXQsIHZrbXNfb2JqLT52YWRkciwgdmttc19vYmot
PmdlbS5zaXplKTsKPiAtICAgICAgIG11dGV4X3VubG9jaygmdmttc19vYmotPnBhZ2VzX2xvY2sp
Owo+Cj4gICAgICAgICBpZiAoY3Vyc29yX2NyYykKPiAgICAgICAgICAgICAgICAgY29tcG9zZV9j
dXJzb3IoY3Vyc29yX2NyYywgcHJpbWFyeV9jcmMsIHZhZGRyX291dCk7Cj4gLS0KPiAyLjIwLjEK
PgpSZXZpZXdlZC1ieTogUm9kcmlnbyBTaXF1ZWlyYSA8cm9kcmlnb3NpcXVlaXJhbWVsb0BnbWFp
bC5jb20+ClRlc3RlZC1ieTogUm9kcmlnbyBTaXF1ZWlyYSA8cm9kcmlnb3NpcXVlaXJhbWVsb0Bn
bWFpbC5jb20+CgotLSAKClJvZHJpZ28gU2lxdWVpcmEKaHR0cHM6Ly9zaXF1ZWlyYS50ZWNoCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
