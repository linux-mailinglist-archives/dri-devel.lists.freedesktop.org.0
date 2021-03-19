Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD6034134C
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 03:58:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A26CF6E96A;
	Fri, 19 Mar 2021 02:58:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B8196E96A;
 Fri, 19 Mar 2021 02:58:05 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id z15so3273316oic.8;
 Thu, 18 Mar 2021 19:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RBR7Hd3ySBna/Hfik3FWd3AmVPItNtAx2VnWQfQMOtA=;
 b=LOq+TL2bJjWRXKqEvOkTdJsgKy/13MqVE36N5iMH1Bj0llQbhko0YY5JAW+ReA0enl
 lr4gz4rDVj/4Jk3iUAa/8uG/ORTBVnp8g0SqR4I4yMM+asltswR9u9V2zz7kviPO3DpV
 CKTHhOiTaI6BUu8urpk1nQS6AnXMXeWZgKbPOD3ml5LIFV2XQb83hGT7l4193kB2oOXX
 Xsf+6mOk00zsUPaVGwpwhUA4NvUUwGbPjgSRZySRYJ+HmEMmRk3mBdSeFzQuaEq2p3Zy
 ro/CvU4cZMxeci5H8MqKNQCReOSPfUJt5LIQ3xRhIsuGF+/GDPLa5u9inWRE0a+a0mys
 XQrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RBR7Hd3ySBna/Hfik3FWd3AmVPItNtAx2VnWQfQMOtA=;
 b=HQUCdEwIveNjwisXRkJ1rqkwSotG6kMEToSPqGnTpfNR/mhQL3GcPS/iUTGra+2jGo
 Uml8nJ+3LdkCXPGmAfb4Iq3qnKeXlP6KIfhPOmrY2qKmLs0Ye2wJf1fIai+tP5Ada6zE
 SvAZXJLhFtTiyGGEWxy0yZJui5c3c13fQzPP1jTqJG5Owkjm2gg7rEjMMQEZBoYGUsm1
 gHvtRyKXBIXOxyUhbYuL1sjbq2awDierBrkqnQdO4vLtg2JdDzC+grF4+IeTTqa3laBv
 bOLxmZ39NXrmFrE7OxjXLs2YTKyiT9d/yper2mdSkb7blDJCn1g4E1uHaP9ScXBWgAMd
 m1bQ==
X-Gm-Message-State: AOAM533qjLEwSQZ3CJapLCsskC96F0rVGGY2A1VVgSz/tR7JxVRIq2rb
 gghSNIvbQtalfgBmDexrmngR/kCrtUWPnOMe4S8=
X-Google-Smtp-Source: ABdhPJx2GbinTfv76DyZyuRAxdzAwKPlKBZmrgdj9p9kzAlfdvldv5N3RtYGvTyTumpWIfrxDohF5Y61vyZWD/sX30s=
X-Received: by 2002:aca:4284:: with SMTP id p126mr5343160oia.123.1616122684736; 
 Thu, 18 Mar 2021 19:58:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210318083236.43578-1-daniel@qtec.com>
 <MN2PR12MB37755DAAB03FC0065E98EF1183699@MN2PR12MB3775.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB37755DAAB03FC0065E98EF1183699@MN2PR12MB3775.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 18 Mar 2021 22:57:53 -0400
Message-ID: <CADnq5_MMTBXt50sqJvYmXWn0uBALz2fNvpSrCfjSuMa99VLa=w@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon/ttm: Fix memory leak userptr pages
To: "Koenig, Christian" <Christian.Koenig@amd.com>
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
Cc: David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Daniel Gomez <daniel@qtec.com>,
 "dagmcr@gmail.com" <dagmcr@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCk9uIFRodSwgTWFyIDE4LCAyMDIxIGF0IDU6MDAgQU0g
S29lbmlnLCBDaHJpc3RpYW4KPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT4gd3JvdGU6Cj4KPiBS
ZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gVm9uOiBEYW5pZWwgR29tZXogPGRh
bmllbEBxdGVjLmNvbT4KPiBHZXNlbmRldDogRG9ubmVyc3RhZywgMTguIE3DpHJ6IDIwMjEgMDk6
MzIKPiBDYzogZGFnbWNyQGdtYWlsLmNvbSA8ZGFnbWNyQGdtYWlsLmNvbT47IERhbmllbCBHb21l
eiA8ZGFuaWVsQHF0ZWMuY29tPjsgRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hl
ckBhbWQuY29tPjsgS29lbmlnLCBDaHJpc3RpYW4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT47
IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT47IERhbmllbCBWZXR0ZXIgPGRhbmllbEBm
ZndsbC5jaD47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIDxhbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZz47IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcgPGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+OyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnIDxs
aW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPgo+IEJldHJlZmY6IFtQQVRDSF0gZHJtL3JhZGVv
bi90dG06IEZpeCBtZW1vcnkgbGVhayB1c2VycHRyIHBhZ2VzCj4KPiBJZiB1c2VycHRyIHBhZ2Vz
IGhhdmUgYmVlbiBwaW5uZWQgYnV0IG5vdCBib3VuZGVkLAo+IHRoZXkgcmVtYWluIHVuY2xlYXJl
ZC4KPgo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBHb21leiA8ZGFuaWVsQHF0ZWMuY29tPgo+IC0t
LQo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYyB8IDUgKysrLS0KPiAgMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9yYWRlb24vcmFkZW9uX3R0bS5jCj4gaW5kZXggZThjNjZkMTA0NzhmLi5iYmNjNjI2NGQ0OGYg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYwo+IEBAIC00ODUsMTMgKzQ4NSwx
NCBAQCBzdGF0aWMgdm9pZCByYWRlb25fdHRtX2JhY2tlbmRfdW5iaW5kKHN0cnVjdCB0dG1fYm9f
ZGV2aWNlICpiZGV2LCBzdHJ1Y3QgdHRtX3R0Cj4gICAgICAgICAgc3RydWN0IHJhZGVvbl90dG1f
dHQgKmd0dCA9ICh2b2lkICopdHRtOwo+ICAgICAgICAgIHN0cnVjdCByYWRlb25fZGV2aWNlICpy
ZGV2ID0gcmFkZW9uX2dldF9yZGV2KGJkZXYpOwo+Cj4gKyAgICAgICBpZiAoZ3R0LT51c2VycHRy
KQo+ICsgICAgICAgICAgICAgICByYWRlb25fdHRtX3R0X3VucGluX3VzZXJwdHIoYmRldiwgdHRt
KTsKPiArCj4gICAgICAgICAgaWYgKCFndHQtPmJvdW5kKQo+ICAgICAgICAgICAgICAgICAgcmV0
dXJuOwo+Cj4gICAgICAgICAgcmFkZW9uX2dhcnRfdW5iaW5kKHJkZXYsIGd0dC0+b2Zmc2V0LCB0
dG0tPm51bV9wYWdlcyk7Cj4KPiAtICAgICAgIGlmIChndHQtPnVzZXJwdHIpCj4gLSAgICAgICAg
ICAgICAgIHJhZGVvbl90dG1fdHRfdW5waW5fdXNlcnB0cihiZGV2LCB0dG0pOwo+ICAgICAgICAg
IGd0dC0+Ym91bmQgPSBmYWxzZTsKPiAgfQo+Cj4gLS0KPiAyLjMwLjIKPgo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcg
bGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
