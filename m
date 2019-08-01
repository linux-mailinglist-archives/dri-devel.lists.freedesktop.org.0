Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBE17E2CE
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 20:55:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C4C46E77F;
	Thu,  1 Aug 2019 18:55:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F10186E77F;
 Thu,  1 Aug 2019 18:55:54 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id n4so74768698wrs.3;
 Thu, 01 Aug 2019 11:55:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XLDUQPAarNvEYMITiXzpnSJXfvDRcc50bI5EKnKqsKE=;
 b=RHlZTbkMXZc9+B1YETS5uik+TjxGBKd15nKcD6gEJve1dOr6h84wVh4XETkxv6VSeB
 RB/enUJFZAKnICITuX8lWCAHribZDZw6emcttvmlKduyAsnpPv/XGuaJ2blWq2Hwzih3
 vG1tfIFV21KZKWAhXEmm1rUPGi7IYd90ynOqXW6hXa+epWEMDX6xPcT30dhJAqo2wggw
 69+z9+maVFVSSyfUmc8/hkZRrTLBriEZyXxowpXI0KIUmqCY3cFaz8PU/23f+4spAbhC
 oosP7SnFF93HOrmsWuLzddGMi992yV12qXu8j548MrL2VvKclc76vu5UpIh5HayDyycB
 X/jA==
X-Gm-Message-State: APjAAAVKyANAeshjpyV342pyCehhbuIRX4m4TUCWXe7TZ3qITPpYxpoJ
 7SLzv/WfaDACpLo5JigNdXzqkK9Tbsb0YfoXDSc=
X-Google-Smtp-Source: APXvYqzkkgT5tP7neI5/thRq8Z8tl7mKoMEea2IoQpPgVU0tlEhxkCRevSubS9rdBNXGPL4jHr6RlNbiu9tuCqVLaCI=
X-Received: by 2002:adf:a299:: with SMTP id s25mr134452086wra.74.1564685753415; 
 Thu, 01 Aug 2019 11:55:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190729083644.29160-1-baijiaju1990@gmail.com>
In-Reply-To: <20190729083644.29160-1-baijiaju1990@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 1 Aug 2019 14:55:42 -0400
Message-ID: <CADnq5_ND4=Vtkfxhxj0OAmUFT33NR+QuV7_Uv-yc-xzhZCWSbA@mail.gmail.com>
Subject: Re: [PATCH] gpu: drm: radeon: Fix a possible null-pointer dereference
 in radeon_connector_set_property()
To: Jia-Ju Bai <baijiaju1990@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=XLDUQPAarNvEYMITiXzpnSJXfvDRcc50bI5EKnKqsKE=;
 b=XsPY4rhIKCMCCnMcZl4ZRgfWcK6xBMvhuMPwKm52SbUJaJ2LapPlJ4rLIiow9EBzA5
 +3JRFt03n5pxTjmeQ7VITCykdIyRhoUS7bp/kdfGgaetzICsmM5lbYXxH1+NWh0SaxF6
 Bneth6+76bmNSliwf12qh1/YBzn6Lt9lGX17tq5SBbAz/vmpgYnAcDBb75LbXUQrHipv
 d7p/LGOwG4Fh0lXI+sGZXsEeuWqn/iCPqnTwYjn88wCEWxG48WOImtGggUDYRzm9gE+j
 qFCvzrKIKuloglZC5gCNj5SgUJPX9Lkm2mLHdDf34oX8wC9ulAO8tWc/eu/6xiG6Ph+L
 vwow==
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
Cc: Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMjksIDIwMTkgYXQgMTE6MDggQU0gSmlhLUp1IEJhaSA8YmFpamlhanUxOTkw
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBJbiByYWRlb25fY29ubmVjdG9yX3NldF9wcm9wZXJ0eSgp
LCB0aGVyZSBpcyBhbiBpZiBzdGF0ZW1lbnQgb24gbGluZSA3NDMKPiB0byBjaGVjayB3aGV0aGVy
IGNvbm5lY3Rvci0+ZW5jb2RlciBpcyBOVUxMOgo+ICAgICBpZiAoY29ubmVjdG9yLT5lbmNvZGVy
KQo+Cj4gV2hlbiBjb25uZWN0b3ItPmVuY29kZXIgaXMgTlVMTCwgaXQgaXMgdXNlZCBvbiBsaW5l
IDc1NToKPiAgICAgaWYgKGNvbm5lY3Rvci0+ZW5jb2Rlci0+Y3J0YykKPgo+IFRodXMsIGEgcG9z
c2libGUgbnVsbC1wb2ludGVyIGRlcmVmZXJlbmNlIG1heSBvY2N1ci4KPgo+IFRvIGZpeCB0aGlz
IGJ1ZywgY29ubmVjdG9yLT5lbmNvZGVyIGlzIGNoZWNrZWQgYmVmb3JlIGJlaW5nIHVzZWQuCj4K
PiBUaGlzIGJ1ZyBpcyBmb3VuZCBieSBhIHN0YXRpYyBhbmFseXNpcyB0b29sIFNUQ2hlY2sgd3Jp
dHRlbiBieSB1cy4KCkkgYmVsaWV2ZSB3ZSBhbHdheXMgaGF2ZSBhbiBlbmNvZGVyIGZvciBldmVy
eSBjb25uZWN0b3IsIGJ1dCBuZXZlcgpodXJ0cyB0byBiZSBzYWZlLiAgVGhhbmtzLiAgQXBwbGll
ZC4KCkFsZXgKCj4KPiBTaWduZWQtb2ZmLWJ5OiBKaWEtSnUgQmFpIDxiYWlqaWFqdTE5OTBAZ21h
aWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9jb25uZWN0b3Jz
LmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Nvbm5lY3Rv
cnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Nvbm5lY3RvcnMuYwo+IGluZGV4
IGM2MGQxYTQ0ZDIyYS4uYjY4NGNkNzE5NjEyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9yYWRlb24vcmFkZW9uX2Nvbm5lY3RvcnMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRl
b24vcmFkZW9uX2Nvbm5lY3RvcnMuYwo+IEBAIC03NTIsNyArNzUyLDcgQEAgc3RhdGljIGludCBy
YWRlb25fY29ubmVjdG9yX3NldF9wcm9wZXJ0eShzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVj
dG9yLCBzdHJ1Y3QKPgo+ICAgICAgICAgICAgICAgICByYWRlb25fZW5jb2Rlci0+b3V0cHV0X2Nz
YyA9IHZhbDsKPgo+IC0gICAgICAgICAgICAgICBpZiAoY29ubmVjdG9yLT5lbmNvZGVyLT5jcnRj
KSB7Cj4gKyAgICAgICAgICAgICAgIGlmIChjb25uZWN0b3ItPmVuY29kZXIgJiYgY29ubmVjdG9y
LT5lbmNvZGVyLT5jcnRjKSB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGRybV9j
cnRjICpjcnRjICA9IGNvbm5lY3Rvci0+ZW5jb2Rlci0+Y3J0YzsKPiAgICAgICAgICAgICAgICAg
ICAgICAgICBzdHJ1Y3QgcmFkZW9uX2NydGMgKnJhZGVvbl9jcnRjID0gdG9fcmFkZW9uX2NydGMo
Y3J0Yyk7Cj4KPiAtLQo+IDIuMTcuMAo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
