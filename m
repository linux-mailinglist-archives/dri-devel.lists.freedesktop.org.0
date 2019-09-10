Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A94AEE8F
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 17:34:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED1286E90E;
	Tue, 10 Sep 2019 15:34:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 556E66E90E
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2019 15:34:26 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id y91so17518984ede.9
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2019 08:34:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b4wnBlpeFgpGxUVqzfbdvP1S+Q+RawN3p7bTgqnZia8=;
 b=YF4NhUaSRhEvycRmiXvBKA4M8wY477hP3VM4rhKoIz0IvMrgHt5kZL1ZgDcCclAtRe
 097DwLl0V9WzlRj1rVWFlry5AiQRI7ZOjNshYjYkqg0bfMK1Lwn7JCFP6B3x0Y1naQQd
 1jBh/nZoHD8TXF7VTKzXFa7cY9bxW+W02IYn0sXmWJAWICOebvCUmwHy2q+RA7kobsMb
 nxCk1H1FXVRqh/vl9jh6q1C4DUQPxWnJWWsvHYyK+KIeXBryagqOHUBYwyXXmKKr5+tq
 kC1qZY6LGKZNrn0tNt6dyncC1GeMEisiOoVshEA4Dy4K0X4xZyg3He1vQU3kMp3Z7EXn
 eeAw==
X-Gm-Message-State: APjAAAVwOStPmJfSHL9eZdZrJXYE1zAS4FMRKcxZdhYTbuEX1nnJrZMT
 gj36mQ7Y0+zdDQp8ov/plmbM8sZLuoqmR7MNJag=
X-Google-Smtp-Source: APXvYqyyx6xWTkb16aLchOZtzOWws5iFVpGXm89mtst/lZo1kpZ1sLfKtvPombMjz1ZlKI1NrttKYsabF6z8hwrEYtQ=
X-Received: by 2002:a17:906:a3d5:: with SMTP id
 ca21mr25922239ejb.258.1568129664829; 
 Tue, 10 Sep 2019 08:34:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190906214409.26677-1-robdclark@gmail.com>
 <20190906214409.26677-2-robdclark@gmail.com>
 <20190910081415.GB3247@8bytes.org>
In-Reply-To: <20190910081415.GB3247@8bytes.org>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 10 Sep 2019 08:34:13 -0700
Message-ID: <CAF6AEGsFmuO5M_RWm-RjDT_F_1Z=MLYmNqRXqFNDR7aUoPaMdg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] iommu: add support for drivers that manage iommu
 explicitly
To: Joerg Roedel <joro@8bytes.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=b4wnBlpeFgpGxUVqzfbdvP1S+Q+RawN3p7bTgqnZia8=;
 b=tzUouiroRdJjO/r28/634yrQ4C8pWz/+BOZ+mEtUOK3kpyHqIRhDkUnyEQ71dGDzZd
 eV9r1PRFyP8IHgUbl9FqShjbwycRxAB0fwLv2qC7bme4DyOSOsM8HR2u8x2sI4UPumtG
 c0OlWiSyl2uwiL7uTXcNcWtQwoZ4hvX3jgw3VhaUOJjf3FlZgjIN68zIQso9eaGkmtTP
 /3GmXxjh0Fn7jkEanuaNrTfCjI+I3RqMMoKmq7qrrJjrlZg7YmxLdzpWZA4BjA4ivqxL
 s83bDaQOuAHvVXsmXCo9hHqsCcSA1CafKyd4S0M5LZYrxfey+98rQGYF5KXA6PmW3vyX
 foKw==
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
Cc: Rob Clark <robdclark@chromium.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Robin Murphy <robin.murphy@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sudeep Holla <sudeep.holla@arm.com>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joe Perches <joe@perches.com>,
 Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMTAsIDIwMTkgYXQgMToxNCBBTSBKb2VyZyBSb2VkZWwgPGpvcm9AOGJ5dGVz
Lm9yZz4gd3JvdGU6Cj4KPiBPbiBGcmksIFNlcCAwNiwgMjAxOSBhdCAwMjo0NDowMVBNIC0wNzAw
LCBSb2IgQ2xhcmsgd3JvdGU6Cj4gPiBAQCAtNjc0LDcgKzY3NCw3IEBAIGludCBpb21tdV9ncm91
cF9hZGRfZGV2aWNlKHN0cnVjdCBpb21tdV9ncm91cCAqZ3JvdXAsIHN0cnVjdCBkZXZpY2UgKmRl
dikKPiA+Cj4gPiAgICAgICBtdXRleF9sb2NrKCZncm91cC0+bXV0ZXgpOwo+ID4gICAgICAgbGlz
dF9hZGRfdGFpbCgmZGV2aWNlLT5saXN0LCAmZ3JvdXAtPmRldmljZXMpOwo+ID4gLSAgICAgaWYg
KGdyb3VwLT5kb21haW4pCj4gPiArICAgICBpZiAoZ3JvdXAtPmRvbWFpbiAmJiAhKGRldi0+ZHJp
dmVyICYmIGRldi0+ZHJpdmVyLT5kcml2ZXJfbWFuYWdlc19pb21tdSkpCj4KPiBIbW0sIHRoaXMg
Y29kZSB1c3VhbGx5IHJ1bnMgYXQgZW51bWVyYXRpb24gdGltZSB3aGVuIG5vIGRyaXZlciBpcwo+
IGF0dGFjaGVkIHRvIHRoZSBkZXZpY2UuIEFjdHVhbGx5IGl0IHdvdWxkIGJlIHByZXR0eSBkYW5n
ZXJvdXMgd2hlbiB0aGlzCj4gY29kZSBydW5zIHdoaWxlIGEgZHJpdmVyIGlzIGF0dGFjaGVkIHRv
IHRoZSBkZXZpY2UuIEhvdyBkb2VzIHRoYXQgY2hhbmdlCj4gbWFrZSB0aGluZ3Mgd29yayBmb3Ig
eW91Pwo+CgpJIHdhcyBzZWVpbmcgdGhpcyBnZXQgY2FsbGVkIHZpYSB0aGUgcGF0aCBkcml2ZXJf
cHJvYmVfZGV2aWNlKCkgLT4KcGxhdGZvcm1fZG1hX2NvbmZpZ3VyZSgpIC0+IG9mX2RtYV9jb25m
aWd1cmUoKSAtPiBvZl9pb21tdV9jb25maWd1cmUoKQotPiBpb21tdV9wcm9iZV9kZXZpY2UoKSAt
PiAuLi4KClRoZSBvbmx5IGNhc2VzIEkgd2FzIHNlZWluZyB3aGVyZSBkZXYtPmRyaXZlciBpcyBO
VUxMIHdoZXJlIGEgZmV3CnBsYWNlcyB0aGF0IGRyaXZlcnMgY2FsbCBvZl9kbWFfY29uZmlndXJl
KCkgb24gdGhlaXIgb3duIHN1Yi1kZXZpY2VzLgpCdXQgbWF5YmUgdGhlcmUgYXJlIHNvbWUgb3Ro
ZXIgcGF0aHMgdGhhdCBJIGRpZCBub3Qgbm90aWNlPwoKQlIsCi1SCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
