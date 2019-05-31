Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DD2310CE
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2019 17:03:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B008A893C9;
	Fri, 31 May 2019 15:03:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc44.google.com (mail-yw1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6620893C9
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2019 15:03:23 +0000 (UTC)
Received: by mail-yw1-xc44.google.com with SMTP id w18so4228083ywa.12
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2019 08:03:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ab4Nh0FZkrZQCQChzSfnebh5p0VEbtuG5pXGGr0tef0=;
 b=gGfuans7lyEGKb924JI5Ejomz8FpTmbhLarwe8WvmtPnbNGkgxVDRmXr1ozM1gh2Bn
 sCPfQp5QzxcZtpledu0UMDF5hvaOJqY059uTDHN0ol7PCZRTRBxjfQrIOJJ1UiKWF6dv
 aOSnhNLler0v9nQxDUcu5yR1ME93QMWbX1lCy0nGauwhmcSVZ+7fx2QrpkszoPbWBUFB
 X0NZMkCYluyWjp7WOxA2GhhRKJsT5of/NffR4QMTRZNEaurhQsasmRZl4CkJohdRkPV3
 mJy4xxIj3cpcDI3MdCQoo2vuBLhjV1rwGQAyEAY5BNLhAdG20yhjviEt9nkJSLafcGY5
 UP3w==
X-Gm-Message-State: APjAAAWuk4UY7luci3F8aNid5xv8/5CLoizrw2clwDnHDcb7rXVMEZvY
 CMSrzpn5/OXdyT1TOR3yYYiPWifoCjZr7Xee7w2SOw==
X-Google-Smtp-Source: APXvYqybMv6mcv53VLj6NtwjvPaXw2yuyOGNGxF8jSVmrF9SkBpO0tit0PBZ0tyPsIc8DdWX2gvUIvKgVeFchLXX/u8=
X-Received: by 2002:a81:3411:: with SMTP id b17mr5553993ywa.280.1559315002885; 
 Fri, 31 May 2019 08:03:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1559171394.git.mchehab+samsung@kernel.org>
 <f7378a751557277eab6f37f3f5692cf5f1aff8c6.1559171394.git.mchehab+samsung@kernel.org>
 <bf8163be-eb1f-f060-1c5a-405bc6d4c8c5@gmail.com>
In-Reply-To: <bf8163be-eb1f-f060-1c5a-405bc6d4c8c5@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 31 May 2019 11:03:11 -0400
Message-ID: <CADnq5_O8Dh-6Mpz=_+5iTOz+UuVUid44=S-SrHenoVzFB77u-A@mail.gmail.com>
Subject: Re: [PATCH 11/22] gpu: amdgpu: fix broken amdgpu_dma_buf.c references
To: Christian Koenig <christian.koenig@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ab4Nh0FZkrZQCQChzSfnebh5p0VEbtuG5pXGGr0tef0=;
 b=nOS3EcqnXLPrMLW6+22jRFGGaRQwwdCB/1abNj75WPFLIRLjChddHEySgEYPQXe9JX
 p0FwzrOeuV94MZd/n0FBYFK7l41UQNumuusNoqyNL27LJyksNahNFySC36sqq689t4HS
 8/U+1ce19isNXjqktokyPRJNOyIDfVswImh66/uJ+2yv+GKO2ICQEfYlEa69+cBtfciH
 JJ8IQNd+OBwKRSB0JfOgJS6iSScpHS2UstEGxBgeKfCMbGZcKp/ytuj4E50pGT8zqde4
 8b5DQjmSjJIJLA51+bevM0UIs9E/ZMnZt9YD06X8L4dc6AZ65p0blxRwAiCzM0mxCr8P
 RWMA==
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
Cc: Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMzEsIDIwMTkgYXQgMTA6MDAgQU0gQ2hyaXN0aWFuIEvDtm5pZwo8Y2tvZW5p
Zy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gQW0gMzAuMDUuMTkgdW0gMDE6
MjMgc2NocmllYiBNYXVybyBDYXJ2YWxobyBDaGVoYWI6Cj4gPiBUaGlzIGZpbGUgd2FzIHJlbmFt
ZWQsIGJ1dCBkb2NzIHdlcmVuJ3QgdXBkYXRlZCBhY2NvcmRpbmdseS4KPiA+Cj4gPiAgICAgICBX
QVJOSU5HOiBrZXJuZWwtZG9jICcuL3NjcmlwdHMva2VybmVsLWRvYyAtcnN0IC1lbmFibGUtbGlu
ZW5vIC1mdW5jdGlvbiBQUklNRSBCdWZmZXIgU2hhcmluZyAuL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9wcmltZS5jJyBmYWlsZWQgd2l0aCByZXR1cm4gY29kZSAxCj4gPiAgICAg
ICBXQVJOSU5HOiBrZXJuZWwtZG9jICcuL3NjcmlwdHMva2VybmVsLWRvYyAtcnN0IC1lbmFibGUt
bGluZW5vIC1pbnRlcm5hbCAuL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wcmlt
ZS5jJyBmYWlsZWQgd2l0aCByZXR1cm4gY29kZSAyCj4gPgo+ID4gRml4ZXM6IDk4ODA3NmNkOGM1
YyAoImRybS9hbWRncHU6IHJlbmFtZSBhbWRncHVfcHJpbWUuW2NoXSBpbnRvIGFtZGdwdV9kbWFf
YnVmLltjaF0iKQo+ID4gU2lnbmVkLW9mZi1ieTogTWF1cm8gQ2FydmFsaG8gQ2hlaGFiIDxtY2hl
aGFiK3NhbXN1bmdAa2VybmVsLm9yZz4KPgo+IFJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmln
IDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4KCkFwcGxpZWQuICB0aGFua3MhCgpBbGV4Cgo+
ID4gLS0tCj4gPiAgIERvY3VtZW50YXRpb24vZ3B1L2FtZGdwdS5yc3QgfCA0ICsrLS0KPiA+ICAg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9ncHUvYW1kZ3B1LnJzdCBiL0RvY3VtZW50YXRpb24v
Z3B1L2FtZGdwdS5yc3QKPiA+IGluZGV4IGE3NDBlNDkxZGZjYy4uYTE1MTk5YjFiMDJlIDEwMDY0
NAo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9ncHUvYW1kZ3B1LnJzdAo+ID4gKysrIGIvRG9jdW1l
bnRhdGlvbi9ncHUvYW1kZ3B1LnJzdAo+ID4gQEAgLTM3LDEwICszNywxMCBAQCBCdWZmZXIgT2Jq
ZWN0cwo+ID4gICBQUklNRSBCdWZmZXIgU2hhcmluZwo+ID4gICAtLS0tLS0tLS0tLS0tLS0tLS0t
LQo+ID4KPiA+IC0uLiBrZXJuZWwtZG9jOjogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3ByaW1lLmMKPiA+ICsuLiBrZXJuZWwtZG9jOjogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2RtYV9idWYuYwo+ID4gICAgICA6ZG9jOiBQUklNRSBCdWZmZXIgU2hhcmluZwo+
ID4KPiA+IC0uLiBrZXJuZWwtZG9jOjogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3ByaW1lLmMKPiA+ICsuLiBrZXJuZWwtZG9jOjogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2RtYV9idWYuYwo+ID4gICAgICA6aW50ZXJuYWw6Cj4gPgo+ID4gICBNTVUgTm90aWZp
ZXIKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
ZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
