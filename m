Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 720476258E
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 18:03:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F53F89F97;
	Mon,  8 Jul 2019 16:03:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B33C289F89;
 Mon,  8 Jul 2019 16:03:22 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id p74so51560wme.4;
 Mon, 08 Jul 2019 09:03:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zwoXAr/YNraRlmud8ofRWI6jVpzq0UG/Go1e/PNZA/M=;
 b=MBcloU2RV2+FebazYs25tOwF/hgxpuvHSCrLQbDdSZrl9PtKGmqqTayZW26Do4U3lO
 M5mmmlzo6ncLYREExkeB+BIlBCYvhFe1r1UJ9Us2Najx6zZ4oOaVIIVPP7knlQ6T/MiE
 hP4s50FN7zInVDhmf+iG4ttLsiQVvvs04wCsPe8X0OPnBCIHpc9EX3CKads+wzuJE8mX
 VQaxFv7q7Hexqo+iE/8Vb7DuGebDuxRs8eCG9XorANGYRZAZ1v9uVDVCqKSyOu2XA8yb
 mEzORl3OQ+7LJUaHJyqRVY5ZuK313vUQrSylph9GshIU7fv7muEmijGaunqkcrv1Zf23
 rvUw==
X-Gm-Message-State: APjAAAUvOzlFgzeibNfMLc1ZbWjqn55e7sYtlmioa9mLOa+g5zHghY96
 pSyI0KZx8Aw2awxwzpvZWT24xw9ppgmunnGBKaAfng==
X-Google-Smtp-Source: APXvYqxvGyIVUErqo8OhUg9JaNXt2H+yturKvRRXX8m8NFeFsdtR9mdkMgFR2pXW6NIq+vpW5Sz7xUViqHqNMEfDJ5Q=
X-Received: by 2002:a1c:67c3:: with SMTP id b186mr16482999wmc.34.1562601800950; 
 Mon, 08 Jul 2019 09:03:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190708140816.1334640-1-arnd@arndb.de>
 <20190708140816.1334640-2-arnd@arndb.de>
In-Reply-To: <20190708140816.1334640-2-arnd@arndb.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 8 Jul 2019 12:03:09 -0400
Message-ID: <CADnq5_NGiM+Bs_AwBC5GUOv2Dx11_fvaqJXtQZKR_drVy68O8w@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amd/powerplay: vega20: fix uninitialized variable
 use
To: Arnd Bergmann <arnd@arndb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=zwoXAr/YNraRlmud8ofRWI6jVpzq0UG/Go1e/PNZA/M=;
 b=HEgp7AyTbjYWLeCAAQX1BlSI+ssrq+tgWEq10oiHUs1MLTYPNUuMgOS4QnBo07Vtz5
 wGiL74MWxOQirVB+oechXWQizTURBG2jh7ostX/okYLA70+7GJ3Qe4NsuGB133YRRaZZ
 7sbbsH8CDtSl+/x+nBsMocbSN5XYnpxifFKD2vQmMFd8/PGQpxkY9QCaSNdt0mKkfq1T
 FCKSWJjlMQA533NSTDZjDsG1csU4xH1RUNJj1+ihP9CoM1sClZ/6qmuAuzw816ziVfhr
 EXFYnylRFjGBEBJABxTmndHvDg39Ir0aqfU3ZQQuozRQNoMk+sWOxguK9gHBkpfFu8vh
 xFAg==
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
Cc: Chengming Gui <Jack.Gui@amd.com>, David Airlie <airlied@linux.ie>,
 Kevin Wang <kevin1.wang@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Huang Rui <ray.huang@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 Evan Quan <evan.quan@amd.com>, Rex Zhu <rex.zhu@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgOCwgMjAxOSBhdCAxMDowOCBBTSBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRi
LmRlPiB3cm90ZToKPgo+IElmIHNtdV9nZXRfY3VycmVudF9ycG0oKSBmYWlscywgd2UgY2FuJ3Qg
dXNlIHRoZSBvdXRwdXQsCj4gYXMgdGhhdCBtYXkgYmUgdW5pbml0aWFsaXplZDoKPgo+IGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL3Bvd2VycGxheS92ZWdhMjBfcHB0LmM6MzAyMzo4OiBl
cnJvcjogdmFyaWFibGUgJ2N1cnJlbnRfcnBtJyBpcyB1c2VkIHVuaW5pdGlhbGl6ZWQgd2hlbmV2
ZXIgJz86JyBjb25kaXRpb24gaXMgZmFsc2UgWy1XZXJyb3IsLVdzb21ldGltZXMtdW5pbml0aWFs
aXplZF0KPiAgICAgICAgIHJldCA9IHNtdV9nZXRfY3VycmVudF9ycG0oc211LCAmY3VycmVudF9y
cG0pOwo+ICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn4KPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9wb3dlcnBsYXkvaW5jL2FtZGdwdV9z
bXUuaDo3MzU6Mzogbm90ZTogZXhwYW5kZWQgZnJvbSBtYWNybyAnc211X2dldF9jdXJyZW50X3Jw
bScKPiAgICAgICAgICgoc211KS0+ZnVuY3MtPmdldF9jdXJyZW50X3JwbSA/IChzbXUpLT5mdW5j
cy0+Z2V0X2N1cnJlbnRfcnBtKChzbXUpLCAoc3BlZWQpKSA6IDApCj4gICAgICAgICAgXn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9w
b3dlcnBsYXkvdmVnYTIwX3BwdC5jOjMwMjQ6MTI6IG5vdGU6IHVuaW5pdGlhbGl6ZWQgdXNlIG9j
Y3VycyBoZXJlCj4gICAgICAgICBwZXJjZW50ID0gY3VycmVudF9ycG0gKiAxMDAgLyBwcHRhYmxl
LT5GYW5NYXhpbXVtUnBtOwo+ICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+Cj4gZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG93ZXJwbGF5L3ZlZ2EyMF9wcHQuYzozMDIzOjg6IG5v
dGU6IHJlbW92ZSB0aGUgJz86JyBpZiBpdHMgY29uZGl0aW9uIGlzIGFsd2F5cyB0cnVlCj4gICAg
ICAgICByZXQgPSBzbXVfZ2V0X2N1cnJlbnRfcnBtKHNtdSwgJmN1cnJlbnRfcnBtKTsKPiAgICAg
ICAgICAgICAgIF4KPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9wb3dlcnBsYXkvaW5j
L2FtZGdwdV9zbXUuaDo3MzU6Mzogbm90ZTogZXhwYW5kZWQgZnJvbSBtYWNybyAnc211X2dldF9j
dXJyZW50X3JwbScKPiAgICAgICAgICgoc211KS0+ZnVuY3MtPmdldF9jdXJyZW50X3JwbSA/IChz
bXUpLT5mdW5jcy0+Z2V0X2N1cnJlbnRfcnBtKChzbXUpLCAoc3BlZWQpKSA6IDApCj4gICAgICAg
ICAgXgo+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL3Bvd2VycGxheS92ZWdhMjBfcHB0
LmM6MzAyMDoyMjogbm90ZTogaW5pdGlhbGl6ZSB0aGUgdmFyaWFibGUgJ2N1cnJlbnRfcnBtJyB0
byBzaWxlbmNlIHRoaXMgd2FybmluZwo+ICAgICAgICAgdWludDMyX3QgY3VycmVudF9ycG07Cj4K
PiBQcm9wYWdhdGUgdGhlIGVycm9yIGNvZGUgaW4gdGhhdCBjYXNlLgo+Cj4gRml4ZXM6IGVlMGRi
ODIwMjdlZSAoImRybS9hbWQvcG93ZXJwbGF5OiBtb3ZlIFBQVGFibGVfdCB1c2VzIGludG8gYXNp
YyBsZXZlbCIpCj4gU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4K
CkFwcGxpZWQuICB0aGFua3MhCgpBbGV4Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bv
d2VycGxheS92ZWdhMjBfcHB0LmMgfCA1ICsrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS92ZWdhMjBfcHB0LmMKPiBpbmRleCA5Y2UzZjFjOGFlMGYuLjIwZDQ3N2Y4ZGM4NCAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMKPiBAQCAtMzAyMSwx
MCArMzAyMSwxMyBAQCBzdGF0aWMgaW50IHZlZ2EyMF9nZXRfZmFuX3NwZWVkX3BlcmNlbnQoc3Ry
dWN0IHNtdV9jb250ZXh0ICpzbXUsCj4gICAgICAgICBQUFRhYmxlX3QgKnBwdGFibGUgPSBzbXUt
PnNtdV90YWJsZS5kcml2ZXJfcHB0YWJsZTsKPgo+ICAgICAgICAgcmV0ID0gc211X2dldF9jdXJy
ZW50X3JwbShzbXUsICZjdXJyZW50X3JwbSk7Cj4gKyAgICAgICBpZiAocmV0KQo+ICsgICAgICAg
ICAgICAgICByZXR1cm4gcmV0Owo+ICsKPiAgICAgICAgIHBlcmNlbnQgPSBjdXJyZW50X3JwbSAq
IDEwMCAvIHBwdGFibGUtPkZhbk1heGltdW1ScG07Cj4gICAgICAgICAqc3BlZWQgPSBwZXJjZW50
ID4gMTAwID8gMTAwIDogcGVyY2VudDsKPgo+IC0gICAgICAgcmV0dXJuIHJldDsKPiArICAgICAg
IHJldHVybiAwOwo+ICB9Cj4KPiAgc3RhdGljIGludCB2ZWdhMjBfZ2V0X2dwdV9wb3dlcihzdHJ1
Y3Qgc211X2NvbnRleHQgKnNtdSwgdWludDMyX3QgKnZhbHVlKQo+IC0tCj4gMi4yMC4wCj4KPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
