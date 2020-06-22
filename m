Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E05A2040AE
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 21:48:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D96A76E8D8;
	Mon, 22 Jun 2020 19:48:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A49F96E8D7;
 Mon, 22 Jun 2020 19:48:41 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id g75so693843wme.5;
 Mon, 22 Jun 2020 12:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=311SvhxGkudFsc5pZh72Ar1Ei6DXigWyevFxNk4TjS4=;
 b=b3Jora8WMLEdv59PF2q4nujrOs3tlnuUqkKvokx+u0eQxgvS1A2uymksDZIK2zCHzF
 KZLMY7iI0qb/M3CyonLx6+6Lua6NVW2r5BL3BBTJu+RQmRluabaA7IcXg7zE2qcok0sl
 x56M128Y8Fpn2iwCjeHU19u0MQlU/fyUGvrQXm92FuWt+dnSybdw+NFcthA6ym4YrKIo
 PmIChv4mwoyruCWUlAP8m2lh/y2ZDNxnPOjPKPPVp8ZxVAiPedzytsyBMrOZpfUB5COn
 TG43KS1BxWniwLpTIGmjEPyhlgZJmKqNB7zuqvptLz96dDg+cEX8OestkVqFlQeMnjPe
 Sx6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=311SvhxGkudFsc5pZh72Ar1Ei6DXigWyevFxNk4TjS4=;
 b=FTnPP6aitCUUef+vzdmPU2CGPspq1I3qmyrraCnIqAWU6eH4fEuc4OotdaRpZ35tKH
 QCQ/pffyue2ntPOzQMzOUxwtMEbYL0gO2ojfZ1yRYQ4jRnC7/iOP9zlSG9KcIMyaDUWl
 rPOMGekw0a6hbcXfwT9ngtKplb6lePfsJXLnXed0zNmSFBpdazzkPXrV6N/ZgVwAzwry
 HguNWw2eSBzzIgyRnDO+MFfCBICdpByaSbLFXmow1vlBV2DKNpYYr/MQfPN3AEb9RoW6
 hjDCD9AH/dHb6MovpCl3cWKWnv7J7283kuB8OVB5VXphuhKrcON+J/NRIIawLy+uZNdn
 aqsw==
X-Gm-Message-State: AOAM530U/dGz11okuzsxZ5jncYhWU0tDntZEavzWJa/TI2uX/p1deLp5
 KHOwybQwkDhXcbw23OCP7t5VgA9sTo2TWqVMWrKiBg==
X-Google-Smtp-Source: ABdhPJw7GvPZha0yIkF0qwQeOLruLOGZ7Pj/G6FXm1Xa83g18fWWKgdY6oZIym/g/36El7x7QAWjPVzCc7yBePYPTzw=
X-Received: by 2002:a1c:32c4:: with SMTP id y187mr20390328wmy.79.1592855320363; 
 Mon, 22 Jun 2020 12:48:40 -0700 (PDT)
MIME-Version: 1.0
References: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
 <1592719388-13819-7-git-send-email-andrey.grodzovsky@amd.com>
 <ec7dc51a-231f-f9e7-6082-5aad02965c67@gmail.com>
In-Reply-To: <ec7dc51a-231f-f9e7-6082-5aad02965c67@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 22 Jun 2020 15:48:29 -0400
Message-ID: <CADnq5_Oz_858bq-PRc=DsL62=TiqFaONw4qARK8NVbUVzMfuCw@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] drm/amdgpu: Unmap entire device address space on
 device remove.
To: Christian Koenig <christian.koenig@amd.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMjIsIDIwMjAgYXQgMzozOCBQTSBDaHJpc3RpYW4gS8O2bmlnCjxja29lbmln
LmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBBbSAyMS4wNi4yMCB1bSAwODow
MyBzY2hyaWViIEFuZHJleSBHcm9kem92c2t5Ogo+ID4gVXNlIHRoZSBuZXcgVFRNIGludGVyZmFj
ZSB0byBpbnZhbGlkYXRlIGFsbCBleHNpc3RpbmcgQk8gQ1BVIG1hcHBpbmdzCj4gPiBmb3JtIGFs
bCB1c2VyIHByb2NjZXNzZXMuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zz
a3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+Cj4KPiBSZXZpZXdlZC1ieTogQ2hyaXN0aWFu
IEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+Cj4gSSB0aGluayB0aG9zZSB0d28g
cGF0Y2hlcyBjb3VsZCBhbHJlYWR5IGxhbmQgaW4gYW1kLXN0YWdpbmctZHJtLW5leHQKPiBzaW5j
ZSB0aGV5IGFyZSBhIGdvb2QgaWRlYSBpbmRlcGVuZGVudCBvZiBob3cgZWxzZSB3ZSBmaXggdGhl
IG90aGVyIGlzc3Vlcy4KClBsZWFzZSBtYWtlIHN1cmUgdGhleSBsYW5kIGluIGRybS1taXNjIGFz
IHdlbGwuCgpBbGV4Cgo+Cj4gPiAtLS0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2Rydi5jIHwgMSArCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+
ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKPiA+IGluZGV4IDQz
NTkyZGMuLjY5MzJkNzUgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZHJ2LmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kcnYuYwo+ID4gQEAgLTExMzUsNiArMTEzNSw3IEBAIGFtZGdwdV9wY2lfcmVtb3ZlKHN0cnVj
dCBwY2lfZGV2ICpwZGV2KQo+ID4gICAgICAgc3RydWN0IGRybV9kZXZpY2UgKmRldiA9IHBjaV9n
ZXRfZHJ2ZGF0YShwZGV2KTsKPiA+Cj4gPiAgICAgICBkcm1fZGV2X3VucGx1ZyhkZXYpOwo+ID4g
KyAgICAgdHRtX2JvX3VubWFwX3ZpcnR1YWxfYWRkcmVzc19zcGFjZSgmYWRldi0+bW1hbi5iZGV2
KTsKPiA+ICAgICAgIGFtZGdwdV9kcml2ZXJfdW5sb2FkX2ttcyhkZXYpOwo+ID4KPiA+ICAgICAg
IHBjaV9kaXNhYmxlX2RldmljZShwZGV2KTsKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
