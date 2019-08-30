Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B8BA4125
	for <lists+dri-devel@lfdr.de>; Sat, 31 Aug 2019 01:46:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9F4C6E132;
	Fri, 30 Aug 2019 23:46:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF096E132
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2019 23:46:08 +0000 (UTC)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BF92F6CFCD
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2019 23:46:07 +0000 (UTC)
Received: by mail-qt1-f198.google.com with SMTP id l22so8841758qtq.5
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2019 16:46:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=NHk/ZFhPJDgajux374nDmDxY+4wQktEQCQJTnLiSENg=;
 b=KoLO1AMxoLI0tZeo5ebwAnXNPtARdeSP0SNLMNMoW4avrL3QmadEJJgpeFO177xF4+
 lbThgOfpO5HOlXantom8Kbww1OLaKF/ZvhCvddacQA/k75ddOT4yGGbexuQeSKZOwnar
 fVVTlt8UKpk67PVzYmjNLq2HtLkiPhzWGOZVA+x669x615YKYrYwMpadmsPvBg8vW9Y5
 12aPHA44koEuhGmQIDeG/XDlwxPN3z6a1D9muHjVWOcryX1bOaBonplPLoQZf2a5bAud
 sENf8+LsrbmXZAFE3WhpMphCr7L5hb+zN+hlGIEm2B5aI61jwaj5Pn7ZDuTp0/FaU8/3
 llTA==
X-Gm-Message-State: APjAAAVRCnPgpMT3/jAleYDaYGWmbCE1cp/34MLJz9vvbKqD4gxI7ead
 x8opFMS9qc7XLjfRBnjB+8X+QSFEI3vCN3fUDLhdI2bor77KgB+mi7BTzXkFcPE1dFc4KppdN6D
 RDo3PHjhxNTwsvTumG1Th+ZnH5lwA
X-Received: by 2002:ac8:60c3:: with SMTP id i3mr16757307qtm.212.1567208767080; 
 Fri, 30 Aug 2019 16:46:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzoviyvC+xR2agZKeaymSJkq36ljKHHlDBuQ6nbSW+EmzFczkgSSM52mnQjK+maQ0wJrzLFcw==
X-Received: by 2002:ac8:60c3:: with SMTP id i3mr16757283qtm.212.1567208766775; 
 Fri, 30 Aug 2019 16:46:06 -0700 (PDT)
Received: from dhcp-10-20-1-34.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id c15sm3141459qkm.32.2019.08.30.16.46.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2019 16:46:05 -0700 (PDT)
Message-ID: <2e29ba5490815f2098d9aa50bb84470aac7ba08b.camel@redhat.com>
Subject: Re: [PATCH 06/26] drm/dp_mst: Move PDT teardown for ports into
 destroy_connector_work
From: Lyude Paul <lyude@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 30 Aug 2019 19:46:03 -0400
In-Reply-To: <20190813145242.GW7444@phenom.ffwll.local>
References: <20190718014329.8107-1-lyude@redhat.com>
 <20190718014329.8107-7-lyude@redhat.com>
 <20190813145242.GW7444@phenom.ffwll.local>
Organization: Red Hat
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Juston Li <juston.li@intel.com>,
 Harry Wentland <hwentlan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDE5LTA4LTEzIGF0IDE2OjUyICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+
IE9uIFdlZCwgSnVsIDE3LCAyMDE5IGF0IDA5OjQyOjI5UE0gLTA0MDAsIEx5dWRlIFBhdWwgd3Jv
dGU6Cj4gPiBUaGlzIHdpbGwgYWxsb3cgdXMgdG8gYWRkIHNvbWUgbG9ja2luZyBmb3IgcG9ydCBQ
RFRzLCB3aGljaCBjYW4ndCBiZQo+ID4gZG9uZSBmcm9tIGRybV9kcF9kZXN0cm95X3BvcnQoKSBz
aW5jZSB3ZSBkb24ndCBrbm93IHdoYXQgbG9ja3MgdGhlCj4gPiBjYWxsZXIgbWlnaHQgYmUgaG9s
ZGluZy4gQWxzbywgdGhpcyBnZXRzIHJpZCBvZiBhIGdvb2QgYml0IG9mIHVubmVlZGVkCj4gPiBj
b2RlLgo+ID4gCj4gPiBDYzogSnVzdG9uIExpIDxqdXN0b24ubGlAaW50ZWwuY29tPgo+ID4gQ2M6
IEltcmUgRGVhayA8aW1yZS5kZWFrQGludGVsLmNvbT4KPiA+IENjOiBWaWxsZSBTeXJqw6Rsw6Qg
PHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+ID4gQ2M6IEhhcnJ5IFdlbnRsYW5kIDxo
d2VudGxhbkBhbWQuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVk
aGF0LmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5
LmMgfCA0MiArKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwg
MTcgaW5zZXJ0aW9ucygrKSwgMjUgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCj4gPiBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKPiA+IGluZGV4IGRlZmM1ZTA5ZmI5YS4uMDI5NWUwMDdj
ODM2IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3ku
Ywo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+ID4gQEAg
LTE1MDksMzEgKzE1MDksMjIgQEAgc3RhdGljIHZvaWQgZHJtX2RwX2Rlc3Ryb3lfcG9ydChzdHJ1
Y3Qga3JlZiAqa3JlZikKPiA+ICAJCWNvbnRhaW5lcl9vZihrcmVmLCBzdHJ1Y3QgZHJtX2RwX21z
dF9wb3J0LCB0b3BvbG9neV9rcmVmKTsKPiA+ICAJc3RydWN0IGRybV9kcF9tc3RfdG9wb2xvZ3lf
bWdyICptZ3IgPSBwb3J0LT5tZ3I7Cj4gPiAgCj4gPiAtCWlmICghcG9ydC0+aW5wdXQpIHsKPiA+
IC0JCWtmcmVlKHBvcnQtPmNhY2hlZF9lZGlkKTsKPiA+IC0KPiA+IC0JCS8qCj4gPiAtCQkgKiBU
aGUgb25seSB0aW1lIHdlIGRvbid0IGhhdmUgYSBjb25uZWN0b3IKPiA+IC0JCSAqIG9uIGFuIG91
dHB1dCBwb3J0IGlzIGlmIHRoZSBjb25uZWN0b3IgaW5pdAo+ID4gLQkJICogZmFpbHMuCj4gPiAt
CQkgKi8KPiA+IC0JCWlmIChwb3J0LT5jb25uZWN0b3IpIHsKPiA+IC0JCQkvKiB3ZSBjYW4ndCBk
ZXN0cm95IHRoZSBjb25uZWN0b3IgaGVyZSwgYXMKPiA+IC0JCQkgKiB3ZSBtaWdodCBiZSBob2xk
aW5nIHRoZSBtb2RlX2NvbmZpZy5tdXRleAo+ID4gLQkJCSAqIGZyb20gYW4gRURJRCByZXRyaWV2
YWwgKi8KPiA+IC0KPiA+IC0JCQltdXRleF9sb2NrKCZtZ3ItPmRlc3Ryb3lfY29ubmVjdG9yX2xv
Y2spOwo+ID4gLQkJCWxpc3RfYWRkKCZwb3J0LT5uZXh0LCAmbWdyLT5kZXN0cm95X2Nvbm5lY3Rv
cl9saXN0KTsKPiA+IC0JCQltdXRleF91bmxvY2soJm1nci0+ZGVzdHJveV9jb25uZWN0b3JfbG9j
ayk7Cj4gPiAtCQkJc2NoZWR1bGVfd29yaygmbWdyLT5kZXN0cm95X2Nvbm5lY3Rvcl93b3JrKTsK
PiA+IC0JCQlyZXR1cm47Cj4gPiAtCQl9Cj4gPiAtCQkvKiBubyBuZWVkIHRvIGNsZWFuIHVwIHZj
cGkKPiA+IC0JCSAqIGFzIGlmIHdlIGhhdmUgbm8gY29ubmVjdG9yIHdlIG5ldmVyIHNldHVwIGEg
dmNwaSAqLwo+ID4gLQkJZHJtX2RwX3BvcnRfdGVhcmRvd25fcGR0KHBvcnQsIHBvcnQtPnBkdCk7
Cj4gPiAtCQlwb3J0LT5wZHQgPSBEUF9QRUVSX0RFVklDRV9OT05FOwo+ID4gKwkvKiBUaGVyZSdz
IG5vdGhpbmcgdGhhdCBuZWVkcyBsb2NraW5nIHRvIGRlc3Ryb3kgYW4gaW5wdXQgcG9ydCB5ZXQg
Ki8KPiA+ICsJaWYgKHBvcnQtPmlucHV0KSB7Cj4gPiArCQlkcm1fZHBfbXN0X3B1dF9wb3J0X21h
bGxvYyhwb3J0KTsKPiA+ICsJCXJldHVybjsKPiA+ICAJfQo+ID4gLQlkcm1fZHBfbXN0X3B1dF9w
b3J0X21hbGxvYyhwb3J0KTsKPiA+ICsKPiA+ICsJa2ZyZWUocG9ydC0+Y2FjaGVkX2VkaWQpOwo+
ID4gKwo+ID4gKwkvKgo+ID4gKwkgKiB3ZSBjYW4ndCBkZXN0cm95IHRoZSBjb25uZWN0b3IgaGVy
ZSwgYXMgd2UgbWlnaHQgYmUgaG9sZGluZyB0aGUKPiA+ICsJICogbW9kZV9jb25maWcubXV0ZXgg
ZnJvbSBhbiBFRElEIHJldHJpZXZhbAo+ID4gKwkgKi8KPiA+ICsJbXV0ZXhfbG9jaygmbWdyLT5k
ZXN0cm95X2Nvbm5lY3Rvcl9sb2NrKTsKPiA+ICsJbGlzdF9hZGQoJnBvcnQtPm5leHQsICZtZ3It
PmRlc3Ryb3lfY29ubmVjdG9yX2xpc3QpOwo+ID4gKwltdXRleF91bmxvY2soJm1nci0+ZGVzdHJv
eV9jb25uZWN0b3JfbG9jayk7Cj4gPiArCXNjaGVkdWxlX3dvcmsoJm1nci0+ZGVzdHJveV9jb25u
ZWN0b3Jfd29yayk7Cj4gCj4gU28gaWYgSSdtIG5vdCBjb21wbGV0ZWx5IGJsaW5kIHRoaXMganVz
dCBmbGF0dGVucyB0aGUgYWJvdmUgY29kZSBmbG93IChieQo+IGludmVydGluZyB0aGUgaWYgKHBv
cnQtPmlucHV0KSkuCgpOb3cgSSdtIHJlYWxseSByZW1lbWJlcmluZyB3aHkgSSByZWZhY3RvcmVk
IHRoaXMuIFRoZSBjb250cm9sIGZsb3cgb24gdGhlCnByZXZpb3VzIHZlcnNpb24gb2YgdGhpcyBp
cyBwcmV0dHkgbWlzbGVhZGluZy4gVG8gc3VtbWFyaXplIHNvIGl0J3MgYSBiaXQgbW9yZQpvYnZp
b3VzOgoKaWYgKHBvcnQtPmlucHV0KSB7Cglkcm1fZHBfbXN0X3B1dF9wb3J0X21hbGxvYyhwb3J0
KTsKCXJldHVybjsKfSBlbHNlIGlmIChwb3J0LT5jb25uZWN0b3IpIHsKCWFkZF9jb25uZWN0b3Jf
dG9fZGVzdHJveV9saXN0KCk7CglyZXR1cm47CgkvKiBeIG5vdywgdGhpcyBpcyB3aGVyZSBQRFQg
dGVhcmRvd24gaGFwcGVucyAqLwp9IGVsc2UgewoJZHJtX2RwX3BvcnRfdGVhcmRvd25fcGR0KHBv
cnQsIHBvcnQtPnBkdCk7Cn0KLyogZnJlZSBlZGlkIGV0YyBldGMgKi8KClNvLCBJIHN1cHBvc2Ug
dGhlIHRpdGxlIG9mIHRoaXMgcGF0Y2ggd291bGQgYmUgbW9yZSBhY2N1cmF0ZSBpZiBpdCB3YXMK
ImRybS9kcF9tc3Q6IFJlbW92ZSBQRFQgdGVhcmRvd24gaW4gZGVzdHJveV9wb3J0KCkgYW5kIHJl
ZmFjdG9yIgpJJ2xsIGdvIGFoZWFkIGFuZCBjaGFuZ2UgdGhhdAoKPiAKPiA+ICB9Cj4gPiAgCj4g
PiAgLyoqCj4gPiBAQCAtMzg4MSw3ICszODcyLDggQEAgZHJtX2RwX2ZpbmlzaF9kZXN0cm95X3Bv
cnQoc3RydWN0IGRybV9kcF9tc3RfcG9ydAo+ID4gKnBvcnQpCj4gPiAgewo+ID4gIAlJTklUX0xJ
U1RfSEVBRCgmcG9ydC0+bmV4dCk7Cj4gPiAgCj4gPiAtCXBvcnQtPm1nci0+Y2JzLT5kZXN0cm95
X2Nvbm5lY3Rvcihwb3J0LT5tZ3IsIHBvcnQtPmNvbm5lY3Rvcik7Cj4gPiArCWlmIChwb3J0LT5j
b25uZWN0b3IpCj4gCj4gQW5kIHRoaXMgaGVyZSBJIGNhbid0IGNvbm5lY3Qgd2l0aCB0aGUgY29t
bWl0IG1lc3NhZ2UuIEknbSBjb25mdXNlZCwgZGlkCj4gc29tZXRoaW5nIGdvIHdyb25nIHdpdGgg
c29tZSByZWJhc2UgaGVyZSwgYW5kIHRoaXMgcGF0Y2ggc2hvdWxkIGhhdmUgYQo+IGRpZmZlcmVu
dCB0aXRsZS9zdW1tYXJ5Pwo+IC1EYW5pZWwKCk5vLCB0aGlzIGlzIGNvcnJlY3QuIEluIHRoZSBw
cmV2aW91cyBkcm1fZHBfZGVzdHJveV9wb3J0KCkgZnVuY3Rpb24gd2Ugb25seQphZGRlZCBhIHBv
cnQgdG8gdGhlIGRlbGF5ZWQgZGVzdHJveSB3b3JrIGlmIGl0IGhhZCBhIGNvbm5lY3RvciBvbiBp
dC4gTm93IHRoYXQKd2UgYWRkIHBvcnRzIHVuY29uZGl0aW9uYWxseSwgd2UgaGF2ZSB0byBjaGVj
ayBwb3J0LT5jb25uZWN0b3IgYmVmb3JlIHRyeWluZwp0byBjYWxsIHBvcnQtPm1nci0+Y2JzLT5k
ZXN0cm95X2Nvbm5lY3RvcigpIHNpbmNlIHBvcnQtPmNvbm5lY3RvciBpcyBubyBsb25nZXIKZ3Vh
cmFudGVlZCB0byBiZSAhPSBOVUxMLgoKPiAKPiA+ICsJCXBvcnQtPm1nci0+Y2JzLT5kZXN0cm95
X2Nvbm5lY3Rvcihwb3J0LT5tZ3IsIHBvcnQtPmNvbm5lY3Rvcik7Cj4gPiAgCj4gPiAgCWRybV9k
cF9wb3J0X3RlYXJkb3duX3BkdChwb3J0LCBwb3J0LT5wZHQpOwo+ID4gIAlwb3J0LT5wZHQgPSBE
UF9QRUVSX0RFVklDRV9OT05FOwo+ID4gLS0gCj4gPiAyLjIxLjAKPiA+IAotLSAKQ2hlZXJzLAoJ
THl1ZGUgUGF1bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
