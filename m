Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B95DB59D7B
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 16:07:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3A866E927;
	Fri, 28 Jun 2019 14:07:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 734756E927;
 Fri, 28 Jun 2019 14:07:24 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id n4so6473529wrs.3;
 Fri, 28 Jun 2019 07:07:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/6jW6fB4qBM1ltEdu2ACDjRjsBmJdRc1AykbkyWaR7c=;
 b=ESfHfnv4hhoyF/+2osO8lS4tYlItp2pi6CzzpYBE/r7s9n9mqE8SuO2/BxFNvSwcuI
 UOjX/KBteaHHOLlUvab+ZYvtSpat95w3F5x8hC1wXUqF9r56yYvnffUWwVldovv5opSk
 c6G17aOzCiKmWg0qgVNLqi5jq9hTvuJ0PT0Ik4hM18fW+zdtDmIW5co2qJ2/EnRhDYG8
 LoowzQzBKFY98KJt0BGNLtoa40J80u0ToD8WVCglS7jbX1XDkImyRytNJu28mKWfLzON
 uXl/o1WbzvxexbakSWnb9BU+j+AOSr37VQRFWtXEJIpYc7rOCHIGX/kQAqAfgrSDOhWk
 IqMQ==
X-Gm-Message-State: APjAAAWsyzg6D++dx8enx83fCgVpw9Jxtu/RANWOcmC8x2hzqexzrW5c
 TnCoQgZ7Yfx5tckbjAhWbTy0rczNwZou+26L5Gk=
X-Google-Smtp-Source: APXvYqy5v+daBdSZiNMJysCVnYu4Yb3AFNKs9v26dcnm3gDIIeAbNl8J/Ofwl1JUddZkKKQjAVFjv8bzrn7FfNzgwgc=
X-Received: by 2002:adf:dec3:: with SMTP id i3mr8017515wrn.74.1561730843076;
 Fri, 28 Jun 2019 07:07:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190620232127.25436-1-lyude@redhat.com>
In-Reply-To: <20190620232127.25436-1-lyude@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 28 Jun 2019 10:07:11 -0400
Message-ID: <CADnq5_ODsuKDRFyi5v5nOLmXCFnguaVYLXAn-Z2=bX6sK8DLsQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Don't skip display settings in hwmgr_resume()
To: Lyude Paul <lyude@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=/6jW6fB4qBM1ltEdu2ACDjRjsBmJdRc1AykbkyWaR7c=;
 b=an187nEon/JK/g5ZzKOxXQnPuUnO9U6A/T2nqKVyK2NO4SElnkHUJeZ5gSBOl78AUA
 JFWlQUG15flw/TVfg328lGdoWQFefyK8n77DGksSOK6CxZGQLLsUkICYJwpCXBYIbH3e
 ll9F3vXxoLCyl87K4WzFMCCnULY5+vLnCMgwdw+7iBin0JOSH7NovQ1kQ4Q5Xj2owEhG
 kT9NdI2p1PKRsL8IiBaO97kVpNZ42vwRKgg0ytHUo0ZS5jnZC6iGt6AXJ3LJ6pwsxMLt
 nTNQleZcYjh8Ue5Lieb4iW9Men3bcAOu7qTNKsTSMhS4WkrEg3beAdykiU86wPcYhqlO
 sz3Q==
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
Cc: David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, "for 3.8" <stable@vger.kernel.org>,
 Huang Rui <ray.huang@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 Evan Quan <evan.quan@amd.com>, Rex Zhu <rex.zhu@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMjAsIDIwMTkgYXQgNzoyMiBQTSBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQu
Y29tPiB3cm90ZToKPgo+IEknbSBub3QgZW50aXJlbHkgc3VyZSB3aHkgdGhpcyBpcywgYnV0IGZv
ciBzb21lIHJlYXNvbjoKPgo+IDkyMTkzNWRjNjQwNCAoImRybS9hbWQvcG93ZXJwbGF5OiBlbmZv
cmNlIGRpc3BsYXkgcmVsYXRlZCBzZXR0aW5ncyBvbmx5IG9uIG5lZWRlZCIpCj4KPiBCcmVha3Mg
cnVudGltZSBQTSByZXN1bWUgb24gdGhlIFJhZGVvbiBQUk8gV1ggMzEwMCAoTGV4YSkgaW4gb25l
IHRoZQo+IHByZS1wcm9kdWN0aW9uIGxhcHRvcHMgSSBoYXZlLiBUaGUgaXNzdWUgbWFuaWZlc3Rz
IGFzIHRoZSBmb2xsb3dpbmcKPiBtZXNzYWdlcyBpbiBkbWVzZzoKPgo+IFtkcm1dIFVWRCBhbmQg
VVZEIEVOQyBpbml0aWFsaXplZCBzdWNjZXNzZnVsbHkuCj4gYW1kZ3B1IDAwMDA6M2I6MDAuMDog
W2RybTphbWRncHVfcmluZ190ZXN0X2hlbHBlciBbYW1kZ3B1XV0gKkVSUk9SKiByaW5nIHZjZTEg
dGVzdCBmYWlsZWQgKC0xMTApCj4gW2RybTphbWRncHVfZGV2aWNlX2lwX3Jlc3VtZV9waGFzZTIg
W2FtZGdwdV1dICpFUlJPUiogcmVzdW1lIG9mIElQIGJsb2NrIDx2Y2VfdjNfMD4gZmFpbGVkIC0x
MTAKPiBbZHJtOmFtZGdwdV9kZXZpY2VfcmVzdW1lIFthbWRncHVdXSAqRVJST1IqIGFtZGdwdV9k
ZXZpY2VfaXBfcmVzdW1lIGZhaWxlZCAoLTExMCkuCj4KPiBBbmQgaGFwcGVucyBhZnRlciBhYm91
dCA2LTEwIHJ1bnRpbWUgUE0gc3VzcGVuZC9yZXN1bWUgY3ljbGVzIChzb21ldGltZXMKPiBzb29u
ZXIsIGlmIHlvdSdyZSBsdWNreSEpLiBVbmZvcnR1bmF0ZWx5IEkgY2FuJ3Qgc2VlbSB0byBwaW4g
ZG93bgo+IHByZWNpc2VseSB3aGljaCBwYXJ0IGluIHBzbV9hZGp1c3RfcG93ZXJfc3RhdGVfZHlu
YW1pYyB0aGF0IGlzIGNhdXNpbmcKPiB0aGUgaXNzdWUsIGJ1dCBub3Qgc2tpcHBpbmcgdGhlIGRp
c3BsYXkgc2V0dGluZyBzZXR1cCBzZWVtcyB0byBmaXggaXQuCj4gSG9wZWZ1bGx5IGlmIHRoZXJl
IGlzIGEgYmV0dGVyIGZpeCBmb3IgdGhpcywgdGhpcyBwYXRjaCB3aWxsIHNwYXJrCj4gZGlzY3Vz
c2lvbiBhcm91bmQgaXQuCj4KPiBGaXhlczogOTIxOTM1ZGM2NDA0ICgiZHJtL2FtZC9wb3dlcnBs
YXk6IGVuZm9yY2UgZGlzcGxheSByZWxhdGVkIHNldHRpbmdzIG9ubHkgb24gbmVlZGVkIikKPiBD
YzogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KPiBDYzogQWxleCBEZXVjaGVyIDxhbGV4
YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IENjOiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29t
Pgo+IENjOiBSZXggWmh1IDxSZXguWmh1QGFtZC5jb20+Cj4gQ2M6IExpa3VuIEdhbyA8TGlrdW4u
R2FvQGFtZC5jb20+Cj4gQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPiAjIHY1LjErCj4gU2ln
bmVkLW9mZi1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KCkkndmUgZ29uZSBhaGVh
ZCBhbmQgYXBwbGllZCB0aGlzLgoKVGhhbmtzLAoKQWxleAoKPiAtLS0KPiAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvaHdtZ3IuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvaHdtZ3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L2h3bWdyL2h3bWdyLmMKPiBpbmRleCA2Y2Q2NDk3YzZmYzIuLjBlMWIyZDkzMDgx
NiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci9od21n
ci5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvaHdtZ3IuYwo+
IEBAIC0zMjUsNyArMzI1LDcgQEAgaW50IGh3bWdyX3Jlc3VtZShzdHJ1Y3QgcHBfaHdtZ3IgKmh3
bWdyKQo+ICAgICAgICAgaWYgKHJldCkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPgo+
IC0gICAgICAgcmV0ID0gcHNtX2FkanVzdF9wb3dlcl9zdGF0ZV9keW5hbWljKGh3bWdyLCB0cnVl
LCBOVUxMKTsKPiArICAgICAgIHJldCA9IHBzbV9hZGp1c3RfcG93ZXJfc3RhdGVfZHluYW1pYyho
d21nciwgZmFsc2UsIE5VTEwpOwo+Cj4gICAgICAgICByZXR1cm4gcmV0Owo+ICB9Cj4gLS0KPiAy
LjIxLjAKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
