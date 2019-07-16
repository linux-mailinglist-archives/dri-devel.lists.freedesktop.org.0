Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E546AD53
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 19:04:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59F6A6E156;
	Tue, 16 Jul 2019 17:04:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4AC26E156
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 17:04:12 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id k8so21037159eds.7
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 10:04:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M5J1jCpDGLRMbPaFuVIDuJAsDJ3kZo81VHBUg/8gudo=;
 b=f9guwjfR0bv0K2xgRMo4henUyJNLEzMWxLnt9wFJbAXb7Dk/4XybwijDrj7oGFHqSJ
 ORKzE+7NqOijtCaz/4d1pR/4ucKLv3oqOZZ+yv4pGUsmlju1pH1STz0XHkc3L4Fb8axn
 Z+ZRffBdyuFL6hEBDHD74Obzt9XLB/uPmkHb4F8DmQoWBHpnspY0KAMt20QsYMi/XRg3
 040CntWkADYxzeFrn8HsXZAqCz8skSL6CBv0LmND69SSjSPfb4/DfrPUiIGMrJbGKJLl
 X1xiLLrEQsOAyuz62cg02GhInCcl9P3/HR2a8vrPtWYyYjRfqlVVYPx1gyXtXQ7Ny9dA
 ys0w==
X-Gm-Message-State: APjAAAWUM2g4PcRnU6Fyf8/BHig8ZrIzYW+GnifFT2x2f5LkRFz0VrRz
 BAGUimr8xfN37IVi6CHrUAt4M8bdEU1XMr6CB4U=
X-Google-Smtp-Source: APXvYqyrg6Z9Dz8LN0IPtG+u1HW2UmEvDSu3FXiog8bhjVz65CftM4480Ww4v2dogAMfniwMK/jSJb0crn9Fe2KUXWU=
X-Received: by 2002:a17:906:3f87:: with SMTP id
 b7mr26288651ejj.164.1563296651085; 
 Tue, 16 Jul 2019 10:04:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190716164221.15436-1-robdclark@gmail.com>
 <20190716164221.15436-2-robdclark@gmail.com>
 <156329635647.9436.7142001798245279241@skylake-alporthouse-com>
In-Reply-To: <156329635647.9436.7142001798245279241@skylake-alporthouse-com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 16 Jul 2019 10:03:59 -0700
Message-ID: <CAF6AEGuSZ9sRdBituUWbWNuzEav=ZCuMqan_sgP8JcaW_2aOOw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/vgem: use normal cached mmap'ings
To: Chris Wilson <chris@chris-wilson.co.uk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=M5J1jCpDGLRMbPaFuVIDuJAsDJ3kZo81VHBUg/8gudo=;
 b=oPPQSb4pew/H/AtnEeU9cvH+8yyLl7hIKuxjqBwPDdjpW2eAVrEw3390F/xtJMwRtJ
 RpBYPM0v9wuUUXECyCsUkJSJq546FB8TgqsnCH6I+QuV4GYCQEtVN1egdPSiecJdyh7/
 3Bs4ShQdGinhQuH1gbc2YPJtB5cL/BLOSnD09qFYByK1BWI3JEdz764l6+RE4Ru9kDKq
 eh84SWBp1R50G4AJ9P2xi++KlnacTvz+JAjPxgHevjzjV3JzBlcOok7qEeDsB1MPA1Ql
 LtrTIOAw0RjrSSEcFsp1dIneQ/EBst0GqDR/zXBV4TKOlK9t8g+/XUVkHevX9UCHIw0w
 DnVA==
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
Cc: Rob Clark <robdclark@chromium.org>, Deepak Sharma <deepak.sharma@amd.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Eric Biggers <ebiggers@google.com>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMTYsIDIwMTkgYXQgMTA6MDEgQU0gQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJp
cy13aWxzb24uY28udWs+IHdyb3RlOgo+Cj4gUXVvdGluZyBSb2IgQ2xhcmsgKDIwMTktMDctMTYg
MTc6NDI6MTUpCj4gPiBGcm9tOiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+Cj4g
Pgo+ID4gU2luY2UgdGhlcmUgaXMgbm8gcmVhbCBkZXZpY2UgYXNzb2NpYXRlZCB3aXRoIHZnZW0s
IGl0IGlzIGltcG9zc2libGUgdG8KPiA+IGVuZCB1cCB3aXRoIGFwcHJvcHJpYXRlIGRldi0+ZG1h
X29wcywgbWVhbmluZyB0aGF0IHdlIGhhdmUgbm8gd2F5IHRvCj4gPiBpbnZhbGlkYXRlIHRoZSBz
aG1lbSBwYWdlcyBhbGxvY2F0ZWQgYnkgdmdlbS4gIFNvLCBhdCBsZWFzdCBvbiBwbGF0Zm9ybXMK
PiA+IHdpdGhvdXQgZHJtX2NmbHVzaF9wYWdlcygpLCB3ZSBlbmQgdXAgd2l0aCBjb3JydXB0aW9u
IHdoZW4gY2FjaGUgbGluZXMKPiA+IGZyb20gcHJldmlvdXMgdXNhZ2Ugb2YgdmdlbSBibyBwYWdl
cyBnZXQgZXZpY3RlZCB0byBtZW1vcnkuCj4gPgo+ID4gVGhlIG9ubHkgc2FuZSBvcHRpb24gaXMg
dG8gdXNlIGNhY2hlZCBtYXBwaW5ncy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBSb2IgQ2xhcmsg
PHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+Cj4gPiAtLS0KPiA+IFBvc3NpYmx5IHdlIGNvdWxkIGRt
YV9zeW5jXypfZm9yX3tkZXZpY2UsY3B1fSgpIG9uIGRtYWJ1ZiBhdHRhY2gvZGV0YWNoLAo+ID4g
YWx0aG91Z2ggdGhlIC0+Z2VtX3ByaW1lX3twaW4sdW5waW59KCkgQVBJIGlzbid0IHF1aXRlIGlk
ZWFsIGZvciB0aGF0IGFzCj4gPiBpdCBpcy4gIEFuZCB0aGF0IGRvZXNuJ3QgcmVhbGx5IGhlbHAg
Zm9yIGRyaXZlcnMgdGhhdCBkb24ndCBhdHRhY2gvCj4gPiBkZXRhY2ggZm9yIGVhY2ggdXNlLgo+
ID4KPiA+IEJ1dCBBRkFJQ1QgdmdlbSBpcyBtYWlubHkgdXNlZCBmb3IgZG1hYnVmIHRlc3Rpbmcs
IHNvIG1heWJlIHdlIGRvbid0Cj4gPiBuZWVkIHRvIGNhcmUgdG9vIG11Y2ggYWJvdXQgdXNlIG9m
IGNhY2hlZCBtbWFwJ2luZ3MuCj4KPiBTYWRseSB0aGlzIHJlZ3Jlc3NlcyB3aXRoIGk5MTUgaW50
ZXJvcC4KPgo+IFN0YXJ0aW5nIHN1YnRlc3Q6IDRLaUItdGlueS12Z2VtLWJsdC1lYXJseS1yZWFk
LWNoaWxkCj4gKGdlbV9jb25jdXJyZW50X2JsaXQ6ODMwOSkgQ1JJVElDQUw6IFRlc3QgYXNzZXJ0
aW9uIGZhaWx1cmUgZnVuY3Rpb24gZG1hYnVmX2NtcF9ibywgZmlsZSAuLi90ZXN0cy9pOTE1L2dl
bV9jb25jdXJyZW50X2FsbC5jOjQwODoKPiAoZ2VtX2NvbmN1cnJlbnRfYmxpdDo4MzA5KSBDUklU
SUNBTDogRmFpbGVkIGFzc2VydGlvbjogdlsoKHkpKihiLT53aWR0aCkgKyAoKCh5KSArIHBhc3Mp
JShiLT53aWR0aCkpKV0gPT0gdmFsCj4gKGdlbV9jb25jdXJyZW50X2JsaXQ6ODMwOSkgQ1JJVElD
QUw6IGVycm9yOiAwICE9IDB4ZGVhZGJlZWYKPgo+IGFuZCBpZ3QvcHJpbWVfdmdlbQo+Cj4gQ2Fu
IHlvdSBwbGVhc2UgY2MgaW50ZWwtZ2Z4IHNvIENJIGNhbiBwaWNrIHVwIHRoZXNlIGNoYW5nZXM/
Cj4gLUNocmlzCgpJIHN1cHBvc2UgQ0kgaXMgYWN0dWFsbHkgcmVhZGluZyB0aGUgaW1wb3J0ZWQg
VkdFTSBibyBmcm9tIEdQVT8gIEkgY2FuCnRyeSB0byB3aXJlIHVwIHRoZSBhdHRhY2gvZGV0YWNo
IGRtYV9zeW5jLCB3aGljaCBtaWdodCBoZWxwLi4KCkJSLAotUgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
