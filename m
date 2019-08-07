Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 876F585572
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 23:55:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 150ED6E771;
	Wed,  7 Aug 2019 21:55:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38BF96E49C
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 21:55:13 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id v15so88014175eds.9
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2019 14:55:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=OrsO+gZAf7nFyvHox7p8seqF+I14+DYh+G0GXJPRhhU=;
 b=Iaf4S5lAzTTQFx8ikXH+39YqinEc0VENhZ4hiu4EcwGpbbwoFhOhJj+AM+hN7YD7b7
 fVrD0+Eq3MalQ03t+pxdXavHdASNI3VTM3h6LnaMZs8dAQstMMWMfpguGdOJX0RnTFnq
 TosWq4APMgS9Vcu/lM1ulqi93jWAIOvNFv1Hg+I89lQqMf7qVQMpHu3A3oxBEP+aPPMr
 +SVFgcZOzhHNtRCaUfNrl6JzKj6QUnJpmk8B4BO9EJWRY0T9RqrCdrY9rTcSBB3OTEuo
 PJ3U+D9medU3Y4xNfU6zTTxqtdmcILbMAE8C4pw2kU3a0WoafaQ+E1UMmSoUvQ+ddNvt
 VDvQ==
X-Gm-Message-State: APjAAAXHHpWTAGth7K3ic45Lp3h3GstDUM+u8xYjnAwdb6DEnkhd6DrL
 Wljcu+NZ1y/LL3mHTW2P5B0Qpw==
X-Google-Smtp-Source: APXvYqwOPOlLD6xxUbZQ+15QHAKL6zVsvhgoM0hS4XdLmgpFIINXEfioRbkcmn+Awviw5aDeMhCZ0g==
X-Received: by 2002:a17:906:f2d0:: with SMTP id
 gz16mr10122534ejb.21.1565214911758; 
 Wed, 07 Aug 2019 14:55:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id i21sm723738ejz.83.2019.08.07.14.55.10
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 07 Aug 2019 14:55:11 -0700 (PDT)
Date: Wed, 7 Aug 2019 23:55:09 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH 1/2] drm/nouveau/dispnv04: Grab/put runtime PM refs on
 DPMS on/off
Message-ID: <20190807215508.GK7444@phenom.ffwll.local>
Mail-Followup-To: Lyude Paul <lyude@redhat.com>,
 nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20190807213304.9255-1-lyude@redhat.com>
 <20190807213304.9255-2-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190807213304.9255-2-lyude@redhat.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=OrsO+gZAf7nFyvHox7p8seqF+I14+DYh+G0GXJPRhhU=;
 b=DLSRPLWxYdiWyPjT0wbQ3JBu00DxDtIGMUz4aZu0mkFUTot0lr3aQBW2CK8FZopABZ
 HpXN1lqQ9k5MtopdRAqQbf5w1lUoC5uZSJI0PqHPeEQbwt4qXDb19+142A3uQEStIkFy
 C2EzloO1y4mtQr+ZUNGwuHvSsiPBnWyszCUoQ=
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMDcsIDIwMTkgYXQgMDU6MzM6MDBQTSAtMDQwMCwgTHl1ZGUgUGF1bCB3cm90
ZToKPiBUaGUgY29kZSBjbGFpbXMgdG8gZ3JhYiBhIHJ1bnRpbWUgUE0gcmVmIHdoZW4gYXQgbGVh
c3Qgb25lIENSVEMgaXMKPiBhY3RpdmUsIGJ1dCB0aGF0J3Mgbm90IGFjdHVhbGx5IHRoZSBjYXNl
IGFzIHdlIGdyYWIgYSBydW50aW1lIFBNIHJlZgo+IHdoZW5ldmVyIGEgQ1JUQyBpcyBlbmFibGVk
IHJlZ2FyZGxlc3Mgb2YgaXQncyBEUE1TIHN0YXRlLiBNZWFuaW5nIHRoYXQKPiB3ZSBjYW4gZW5k
IHVwIGtlZXBpbmcgdGhlIEdQVSBhd2FrZSB3aGVuIHRoZXJlIGFyZSBubyBzY3JlZW5zIGVuYWJs
ZWQsCj4gc29tZXRoaW5nIHdlIGRvbid0IHJlYWxseSB3YW50IHRvIGRvLgo+IAo+IE5vdGUgdGhh
dCB3ZSBmaXhlZCB0aGlzIHNhbWUgaXNzdWUgZm9yIG52NTAgYSB3aGlsZSBhZ28gaW46Cj4gCj4g
Y29tbWl0IGU1ZDU0ZjE5MzU3MiAoImRybS9ub3V2ZWF1L2RybS9ub3V2ZWF1OiBGaXggcnVudGlt
ZSBQTSBsZWFrIGluCj4gbnY1MF9kaXNwX2F0b21pY19jb21taXQoKSIpCj4gCj4gU2luY2Ugd2Un
cmUgYWJvdXQgdG8gcmVtb3ZlIG5vdXZlYXVfZHJtLT5oYXZlX2Rpc3BfcG93ZXJfcmVmIGluIHRo
ZSBuZXh0Cj4gY29tbWl0LCBsZXQncyBhbHNvIHNpbXBsaWZ5IHRoZSBSUE0gY29kZSBoZXJlIHdo
aWxlIHdlJ3JlIGF0IGl0OiBncmFiIGEKPiByZWYgZHVyaW5nIGEgbW9kZXNldCwgZ3JhYiBhZGRp
dGlvbmFsIFJQTSByZWZzIGZvciBlYWNoIENSVEMgZW5hYmxlZCBieQo+IHNhaWQgbW9kZXNldCwg
YW5kIGRyb3AgYW4gUlBNIHJlZiBmb3IgZWFjaCBDUlRDIGRpc2FibGVkIGJ5IHNhaWQKPiBtb2Rl
c2V0LiBUaGlzIGFsbG93cyB1cyB0byBrZWVwIHRoZSBHUFUgYXdha2Ugd2hlbmV2ZXIgc2NyZWVu
cyBhcmUKPiB0dXJuZWQgb24sIHdpdGhvdXQgbmVlZGluZyB0byB1c2Ugbm91dmVhdV9kcm0tPmhh
dmVfZGlzcF9wb3dlcl9yZWYuCj4gCj4gU2lnbmVkLW9mZi1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVA
cmVkaGF0LmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52MDQvY3J0
Yy5jIHwgMTggKysrKy0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKyksIDE0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9kaXNwbnYwNC9jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnYw
NC9jcnRjLmMKPiBpbmRleCBmMjJmMDEwMjA2MjUuLjA4YWQ4ZTNiOWNkMiAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnYwNC9jcnRjLmMKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9kaXNwbnYwNC9jcnRjLmMKPiBAQCAtMTgzLDYgKzE4MywxMCBAQCBu
dl9jcnRjX2RwbXMoc3RydWN0IGRybV9jcnRjICpjcnRjLCBpbnQgbW9kZSkKPiAgCQlyZXR1cm47
Cj4gIAo+ICAJbnZfY3J0Yy0+bGFzdF9kcG1zID0gbW9kZTsKPiArCWlmIChtb2RlID09IERSTV9N
T0RFX0RQTVNfT04pCj4gKwkJcG1fcnVudGltZV9nZXRfbm9yZXN1bWUoZGV2LT5kZXYpOwo+ICsJ
ZWxzZQo+ICsJCXBtX3J1bnRpbWVfcHV0X25vaWRsZShkZXYtPmRldik7CgppdCdzIGFmdGVyIHdl
IGZpbHRlciBvdXQgZHVwbGljYXRlIG9wZXJhdGlvbnMsIHNvIHRoYXQgcGFydCBsb29rcyBnb29k
LgpCdXQgbm90IGFsbCBvZiBub3V2ZWF1J3MgbGVnYWN5IGhlbHBlciBjcnRjIGNhbGxiYWNrcyBn
byB0aHJvdWggLT5kcG1zIEkKdGhpbms6IG52X2NydGNfZGlzYWJsZSBkb2Vzbid0LCBhbmQgY3J0
YyBoZWxwZXJzIHVzZSB0aGF0IGluIHByZWZlcmVuY2UKb3ZlciAtPmRwbXMgaW4gc29tZSBjYXNl
cy4KCkkgdGhpbmsgdGhlIG9ubHkgd2F5IHRvIGFjdHVhbGx5IGhpdCB0aGF0IHBhdGggaXMgaWYg
eW91IHN3aXRjaCBhbiBhY3RpdmUKY29ubmVjdG9yIGZyb20gYW4gYWN0aXZlIENSVEMgdG8gYW4g
aW5hY3RpdmUgb25lLiBUaGlzIGltcGxpY2l0bHkgZGlzYWJsZXMKdGhlIGNydGMgKHdlbGwsIHNo
b3VsZCwgbnZfY3J0Y19kaXNhYmxlIGRvZXNuJ3Qgc2VlbSB0byBzaHV0IGRvd24gaHcpLCBhbmQK
SSB0aGluayB3b3VsZCBsZWFrIHlvdXIgcnVudGltZSBQTSByZWZlcmVuY2UgaGVyZS4gQXQgbGVh
c3QgdGVtcG9yYXJpbHkuCgpObyBpZGVhIGhvdyB0byBiZXN0IGZpeCB0aGF0LiBBc2lkZSBmcm9t
ICJ1c2UgYXRvbWljIiA6LSkKCkNoZWVycywgRGFuaWVsCgo+ICAKPiAgCWlmIChudl90d29faGVh
ZHMoZGV2KSkKPiAgCQlOVlNldE93bmVyKGRldiwgbnZfY3J0Yy0+aW5kZXgpOwo+IEBAIC0xMDQ1
LDcgKzEwNDksNiBAQCBub3V2ZWF1X2NydGNfc2V0X2NvbmZpZyhzdHJ1Y3QgZHJtX21vZGVfc2V0
ICpzZXQsCj4gIAo+ICAJZGV2ID0gc2V0LT5jcnRjLT5kZXY7Cj4gIAo+IC0JLyogZ2V0IGEgcG0g
cmVmZXJlbmNlIGhlcmUgKi8KPiAgCXJldCA9IHBtX3J1bnRpbWVfZ2V0X3N5bmMoZGV2LT5kZXYp
Owo+ICAJaWYgKHJldCA8IDAgJiYgcmV0ICE9IC1FQUNDRVMpCj4gIAkJcmV0dXJuIHJldDsKPiBA
QCAtMTA2MSwxOSArMTA2NCw2IEBAIG5vdXZlYXVfY3J0Y19zZXRfY29uZmlnKHN0cnVjdCBkcm1f
bW9kZV9zZXQgKnNldCwKPiAgCX0KPiAgCj4gIAlwbV9ydW50aW1lX21hcmtfbGFzdF9idXN5KGRl
di0+ZGV2KTsKPiAtCS8qIGlmIHdlIGhhdmUgYWN0aXZlIGNydGNzIGFuZCB3ZSBkb24ndCBoYXZl
IGEgcG93ZXIgcmVmLAo+IC0JICAgdGFrZSB0aGUgY3VycmVudCBvbmUgKi8KPiAtCWlmIChhY3Rp
dmUgJiYgIWRybS0+aGF2ZV9kaXNwX3Bvd2VyX3JlZikgewo+IC0JCWRybS0+aGF2ZV9kaXNwX3Bv
d2VyX3JlZiA9IHRydWU7Cj4gLQkJcmV0dXJuIHJldDsKPiAtCX0KPiAtCS8qIGlmIHdlIGhhdmUg
bm8gYWN0aXZlIGNydGNzLCB0aGVuIGRyb3AgdGhlIHBvd2VyIHJlZgo+IC0JICAgd2UgZ290IGJl
Zm9yZSAqLwo+IC0JaWYgKCFhY3RpdmUgJiYgZHJtLT5oYXZlX2Rpc3BfcG93ZXJfcmVmKSB7Cj4g
LQkJcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQoZGV2LT5kZXYpOwo+IC0JCWRybS0+aGF2ZV9k
aXNwX3Bvd2VyX3JlZiA9IGZhbHNlOwo+IC0JfQo+IC0JLyogZHJvcCB0aGUgcG93ZXIgcmVmZXJl
bmNlIHdlIGdvdCBjb21pbmcgaW4gaGVyZSAqLwo+ICAJcG1fcnVudGltZV9wdXRfYXV0b3N1c3Bl
bmQoZGV2LT5kZXYpOwo+ICAJcmV0dXJuIHJldDsKPiAgfQo+IC0tIAo+IDIuMjEuMAo+IAoKLS0g
CkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6
Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
