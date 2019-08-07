Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6858485649
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 01:07:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 738106E02C;
	Wed,  7 Aug 2019 23:06:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
 [209.85.222.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E886E02C;
 Wed,  7 Aug 2019 23:06:58 +0000 (UTC)
Received: by mail-ua1-f66.google.com with SMTP id 34so35699338uar.8;
 Wed, 07 Aug 2019 16:06:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=43Aq/YF2tIrtqKgn8oFkjtKlQy3xXtGroSwKLL+Qp8Y=;
 b=FrocH65OxQX5EeAsCzD4pnMR0Bs1su7tjImW5wRRMvUAYpB72Ebph0BwIgs80l4mzy
 pY0fXdKJHNZr3n9Gl00QM7uCYrcBotvwhIhm1RzCNzWZ5lBV4YcUC1nhSc8i09KYMBbQ
 d+tyUZZS1OOsc9IUpWPlXmRjYwYJPzgEMM0fu+gD1/O+WIiyiKRoEYOpmUgd/onZ8OcP
 YZrfQzUQb4adZ3Jx3jq/KwluC2OpTSS6GqNS5Y9RpoG/mIC6B+YfothpJng+qih/NQnR
 14zmOeFWtS/fYYqPUCM/UvnosPPMI4yQWVaMNL1WVj6Nz6bjG/wkg2uw11RbIw8Fl9FO
 VDlA==
X-Gm-Message-State: APjAAAXQHLB+qffrL3gPlMRnudim7iwl00MUFd3xJWse3YmSfPGFMU+E
 ESzCN1Zho/eoPapLJVDqsXun3v8EMtbpzqJUNZM=
X-Google-Smtp-Source: APXvYqzl3orDNzE16cYGmE/BexM9QmyfXaTvVHHuwOpUJstgexY+yev1lKWaixib7dLSKn4WM7oScOY1S3ixUusR4VI=
X-Received: by 2002:ab0:7848:: with SMTP id y8mr7729807uaq.58.1565219217606;
 Wed, 07 Aug 2019 16:06:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190807213304.9255-1-lyude@redhat.com>
 <20190807213304.9255-2-lyude@redhat.com>
 <20190807215508.GK7444@phenom.ffwll.local>
In-Reply-To: <20190807215508.GK7444@phenom.ffwll.local>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Wed, 7 Aug 2019 19:06:46 -0400
Message-ID: <CAKb7UviCg7jeEyWqsHxygfPuqTg4ybFgTH8cRdx2O==tTEUD9Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/nouveau/dispnv04: Grab/put runtime PM refs on
 DPMS on/off
To: Lyude Paul <lyude@redhat.com>, nouveau <nouveau@lists.freedesktop.org>, 
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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

T24gV2VkLCBBdWcgNywgMjAxOSBhdCA1OjU1IFBNIERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZnds
bC5jaD4gd3JvdGU6Cj4KPiBPbiBXZWQsIEF1ZyAwNywgMjAxOSBhdCAwNTozMzowMFBNIC0wNDAw
LCBMeXVkZSBQYXVsIHdyb3RlOgo+ID4gVGhlIGNvZGUgY2xhaW1zIHRvIGdyYWIgYSBydW50aW1l
IFBNIHJlZiB3aGVuIGF0IGxlYXN0IG9uZSBDUlRDIGlzCj4gPiBhY3RpdmUsIGJ1dCB0aGF0J3Mg
bm90IGFjdHVhbGx5IHRoZSBjYXNlIGFzIHdlIGdyYWIgYSBydW50aW1lIFBNIHJlZgo+ID4gd2hl
bmV2ZXIgYSBDUlRDIGlzIGVuYWJsZWQgcmVnYXJkbGVzcyBvZiBpdCdzIERQTVMgc3RhdGUuIE1l
YW5pbmcgdGhhdAo+ID4gd2UgY2FuIGVuZCB1cCBrZWVwaW5nIHRoZSBHUFUgYXdha2Ugd2hlbiB0
aGVyZSBhcmUgbm8gc2NyZWVucyBlbmFibGVkLAo+ID4gc29tZXRoaW5nIHdlIGRvbid0IHJlYWxs
eSB3YW50IHRvIGRvLgo+ID4KPiA+IE5vdGUgdGhhdCB3ZSBmaXhlZCB0aGlzIHNhbWUgaXNzdWUg
Zm9yIG52NTAgYSB3aGlsZSBhZ28gaW46Cj4gPgo+ID4gY29tbWl0IGU1ZDU0ZjE5MzU3MiAoImRy
bS9ub3V2ZWF1L2RybS9ub3V2ZWF1OiBGaXggcnVudGltZSBQTSBsZWFrIGluCj4gPiBudjUwX2Rp
c3BfYXRvbWljX2NvbW1pdCgpIikKPiA+Cj4gPiBTaW5jZSB3ZSdyZSBhYm91dCB0byByZW1vdmUg
bm91dmVhdV9kcm0tPmhhdmVfZGlzcF9wb3dlcl9yZWYgaW4gdGhlIG5leHQKPiA+IGNvbW1pdCwg
bGV0J3MgYWxzbyBzaW1wbGlmeSB0aGUgUlBNIGNvZGUgaGVyZSB3aGlsZSB3ZSdyZSBhdCBpdDog
Z3JhYiBhCj4gPiByZWYgZHVyaW5nIGEgbW9kZXNldCwgZ3JhYiBhZGRpdGlvbmFsIFJQTSByZWZz
IGZvciBlYWNoIENSVEMgZW5hYmxlZCBieQo+ID4gc2FpZCBtb2Rlc2V0LCBhbmQgZHJvcCBhbiBS
UE0gcmVmIGZvciBlYWNoIENSVEMgZGlzYWJsZWQgYnkgc2FpZAo+ID4gbW9kZXNldC4gVGhpcyBh
bGxvd3MgdXMgdG8ga2VlcCB0aGUgR1BVIGF3YWtlIHdoZW5ldmVyIHNjcmVlbnMgYXJlCj4gPiB0
dXJuZWQgb24sIHdpdGhvdXQgbmVlZGluZyB0byB1c2Ugbm91dmVhdV9kcm0tPmhhdmVfZGlzcF9w
b3dlcl9yZWYuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0
LmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjA0L2NydGMu
YyB8IDE4ICsrKystLS0tLS0tLS0tLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKyksIDE0IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9kaXNwbnYwNC9jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNw
bnYwNC9jcnRjLmMKPiA+IGluZGV4IGYyMmYwMTAyMDYyNS4uMDhhZDhlM2I5Y2QyIDEwMDY0NAo+
ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52MDQvY3J0Yy5jCj4gPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnYwNC9jcnRjLmMKPiA+IEBAIC0xODMsNiAr
MTgzLDEwIEBAIG52X2NydGNfZHBtcyhzdHJ1Y3QgZHJtX2NydGMgKmNydGMsIGludCBtb2RlKQo+
ID4gICAgICAgICAgICAgICByZXR1cm47Cj4gPgo+ID4gICAgICAgbnZfY3J0Yy0+bGFzdF9kcG1z
ID0gbW9kZTsKPiA+ICsgICAgIGlmIChtb2RlID09IERSTV9NT0RFX0RQTVNfT04pCj4gPiArICAg
ICAgICAgICAgIHBtX3J1bnRpbWVfZ2V0X25vcmVzdW1lKGRldi0+ZGV2KTsKPiA+ICsgICAgIGVs
c2UKPiA+ICsgICAgICAgICAgICAgcG1fcnVudGltZV9wdXRfbm9pZGxlKGRldi0+ZGV2KTsKPgo+
IGl0J3MgYWZ0ZXIgd2UgZmlsdGVyIG91dCBkdXBsaWNhdGUgb3BlcmF0aW9ucywgc28gdGhhdCBw
YXJ0IGxvb2tzIGdvb2QuCj4gQnV0IG5vdCBhbGwgb2Ygbm91dmVhdSdzIGxlZ2FjeSBoZWxwZXIg
Y3J0YyBjYWxsYmFja3MgZ28gdGhyb3VoIC0+ZHBtcyBJCj4gdGhpbms6IG52X2NydGNfZGlzYWJs
ZSBkb2Vzbid0LCBhbmQgY3J0YyBoZWxwZXJzIHVzZSB0aGF0IGluIHByZWZlcmVuY2UKPiBvdmVy
IC0+ZHBtcyBpbiBzb21lIGNhc2VzLgo+Cj4gSSB0aGluayB0aGUgb25seSB3YXkgdG8gYWN0dWFs
bHkgaGl0IHRoYXQgcGF0aCBpcyBpZiB5b3Ugc3dpdGNoIGFuIGFjdGl2ZQo+IGNvbm5lY3RvciBm
cm9tIGFuIGFjdGl2ZSBDUlRDIHRvIGFuIGluYWN0aXZlIG9uZS4gVGhpcyBpbXBsaWNpdGx5IGRp
c2FibGVzCj4gdGhlIGNydGMgKHdlbGwsIHNob3VsZCwgbnZfY3J0Y19kaXNhYmxlIGRvZXNuJ3Qg
c2VlbSB0byBzaHV0IGRvd24gaHcpLCBhbmQKPiBJIHRoaW5rIHdvdWxkIGxlYWsgeW91ciBydW50
aW1lIFBNIHJlZmVyZW5jZSBoZXJlLiBBdCBsZWFzdCB0ZW1wb3JhcmlseS4KPgo+IE5vIGlkZWEg
aG93IHRvIGJlc3QgZml4IHRoYXQuIEFzaWRlIGZyb20gInVzZSBhdG9taWMiIDotKQoKTm90IHN1
cmUgaWYgdGhpcyBpcyByZWxldmFudCB0byB0aGUgZGlzY3Vzc2lvbiBhdCBoYW5kLCBidXQgSSdk
IGxpa2UKdG8gcG9pbnQgb3V0IHRoYXQgZGlzcG52MDQgaXMgZm9yIHByZS1udjUwIHRoaW5ncywg
d2hpY2ggZGVmaW5pdGVseQpkaWRuJ3Qgc3VwcG9ydCBhbnkga2luZCBvZiBBQ1BJLWJhc2VkIHJ1
bnRpbWUgc3VzcGVuZC4KCiAgLWlsaWEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
