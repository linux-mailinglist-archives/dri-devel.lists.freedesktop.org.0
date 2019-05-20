Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0826243CB
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 00:58:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4702D8925F;
	Mon, 20 May 2019 22:58:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE8789259;
 Mon, 20 May 2019 22:58:29 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id u27so11528230lfg.10;
 Mon, 20 May 2019 15:58:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=wFlpn7xC500o+MnNbDztd8lM5gaACJx25Xoo+YOllBI=;
 b=l9E8WvqxxsgPDqsS4sEcV3Ius767RU7keA/EBECIrauREXVnxrKmHM/fHwI9Wdqn6o
 o9i4I7Dl6KWt9YVY7VW5D3bOYiebF35q8b3MLYxfcfZNdoP8KMpjzqxwwjXl8hewWXSg
 LMi0qoE6odBnp2rGid3oTMJu1szgJb7Nm/oVc2Md7l8c4sMtf22SHSiMYLKFNk/vToOq
 oh2pD0rhqJ1slxEoPkPy5EHFqbEdQsUCxZOoFHHXL+L8d2U93KbWog753EMA8795Ijkg
 IV+aZI+qH8KjObn/sh8hx3RVxq4WAb9Re+Q2/1A8KjZVFrYJeADNMvMxe8ScaPGGks8P
 0pWg==
X-Gm-Message-State: APjAAAUdtvekuOD0+DfQaVSBKeKGTh/f1OWYnWMt/JXVCfyH85a3CMxS
 l2or4aKKpEiDGjDljIr79omTXnDdB/YU0cVSKro=
X-Google-Smtp-Source: APXvYqxoXXwzUEDzBOA3oVW+04qt/mwn+6L1kkQIKHIE5/wXEZNzcIaBgwGhz+e4rh9m3m9XnyZUOm3JNyez1v/WUqs=
X-Received: by 2002:a19:c7c3:: with SMTP id
 x186mr21259251lff.107.1558393108270; 
 Mon, 20 May 2019 15:58:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190520225058.21406-1-nunes.erico@gmail.com>
In-Reply-To: <20190520225058.21406-1-nunes.erico@gmail.com>
From: Erico Nunes <nunes.erico@gmail.com>
Date: Tue, 21 May 2019 00:58:16 +0200
Message-ID: <CAK4VdL0n3OYAbvmfFvoy6owXi7ZeKANjaDHcdNFU_iopQbCBww@mail.gmail.com>
Subject: Re: [PATCH] drm/scheduler: Fix job cleanup without timeout handler
To: Qiang Yu <yuq825@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Nayan Deshmukh <nayan26deshmukh@gmail.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>, 
 Eric Anholt <eric@anholt.net>, Sharat Masetty <smasetty@codeaurora.org>, 
 dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=wFlpn7xC500o+MnNbDztd8lM5gaACJx25Xoo+YOllBI=;
 b=cLDEo37VcP7ch7QzKNQhLE0EVsCMKtkUUXnZij2xqUsAdvq9X2m5zdMdwLFS2IsfRl
 7CnXms4JzZ0CC1xFOI2iXXMEwM8j+fvuSXkHoJq0F256SAiOBgqiE+vVqkGOI7Ex9Y0M
 QQutLjCmpJiLzDmTgXMfSumAr/0gdgPgv/9JJRQMFbKjK8MxCHcH9htZg/9gHV75i5mm
 z7vDDivQC8cUbl8RIx3r5UiuwamSXdEZTSDl/MPjcb45lWlUMK8p4xMlhQb532FaHDE8
 nelsicNkQKBYgLk1Qcn9BWuuwFIku/cruElpq9sOGBcNV2Vq/2zu0+2y8kI+9V5xk4qD
 IFrw==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMjEsIDIwMTkgYXQgMTI6NTEgQU0gRXJpY28gTnVuZXMgPG51bmVzLmVyaWNv
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBBZnRlciAiNTkxODA0NWM0ZWQ0IGRybS9zY2hlZHVsZXI6
IHJld29yayBqb2IgZGVzdHJ1Y3Rpb24iLCBqb2JzIGFyZQo+IG9ubHkgZGVsZXRlZCB3aGVuIHRo
ZSB0aW1lb3V0IGhhbmRsZXIgaXMgYWJsZSB0byBiZSBjYW5jZWxsZWQKPiBzdWNjZXNzZnVsbHku
Cj4KPiBJbiBjYXNlIG5vIHRpbWVvdXQgaGFuZGxlciBpcyBydW5uaW5nICh0aW1lb3V0ID09IE1B
WF9TQ0hFRFVMRV9USU1FT1VUKSwKPiBqb2IgY2xlYW51cCB3b3VsZCBiZSBza2lwcGVkIHdoaWNo
IG1heSByZXN1bHQgaW4gbWVtb3J5IGxlYWtzLgo+Cj4gQWRkIHRoZSBoYW5kbGluZyBmb3IgdGhl
ICh0aW1lb3V0ID09IE1BWF9TQ0hFRFVMRV9USU1FT1VUKSBjYXNlIGluCj4gZHJtX3NjaGVkX2Ns
ZWFudXBfam9icy4KPgo+IFNpZ25lZC1vZmYtYnk6IEVyaWNvIE51bmVzIDxudW5lcy5lcmljb0Bn
bWFpbC5jb20+Cj4gQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNv
bT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMgfCAzICsr
LQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMgYi9kcml2
ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYwo+IGluZGV4IGY4ZjBlMWMxOTAwMi4u
MDdlY2FiYTE1MTI3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2No
ZWRfbWFpbi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMK
PiBAQCAtNjMwLDcgKzYzMCw4IEBAIHN0YXRpYyB2b2lkIGRybV9zY2hlZF9jbGVhbnVwX2pvYnMo
c3RydWN0IGRybV9ncHVfc2NoZWR1bGVyICpzY2hlZCkKPiAgICAgICAgIHVuc2lnbmVkIGxvbmcg
ZmxhZ3M7Cj4KPiAgICAgICAgIC8qIERvbid0IGRlc3Ryb3kgam9icyB3aGlsZSB0aGUgdGltZW91
dCB3b3JrZXIgaXMgcnVubmluZyAqLwo+IC0gICAgICAgaWYgKCFjYW5jZWxfZGVsYXllZF93b3Jr
KCZzY2hlZC0+d29ya190ZHIpKQo+ICsgICAgICAgaWYgKHNjaGVkLT50aW1lb3V0ICE9IE1BWF9T
Q0hFRFVMRV9USU1FT1VUICYmCj4gKyAgICAgICAgICAgY2FuY2VsX2RlbGF5ZWRfd29yaygmc2No
ZWQtPndvcmtfdGRyKSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuOwoKTmV2ZXJtaW5kIHRoaXMg
b25lLCB0aGVyZSBpcyBhIHR5cG8uIEknbGwgcmVzZW5kLgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
