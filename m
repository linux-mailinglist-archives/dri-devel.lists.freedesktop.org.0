Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A7E10375D
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 11:22:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C9166E1D5;
	Wed, 20 Nov 2019 10:22:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD0276E1D5
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 10:22:50 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id a14so22014382oid.5
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 02:22:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BV0Dmq9a5ZLBcDoMXu3gWA5h7O+rvncKss28FAfnKM4=;
 b=ubPxQvTbsA9YftRt+XVl8ACaVNnpZu8/qMdnW7NNjmwCKKtnnrZVG7Fgt0dbfue+bR
 Dc726eGtQOBo4C31G4Jw8wIjYfLgSWHjucGtU/Fnl4ZBBE9V4BcHjexybjIZ5ov/waKV
 mdGRfxPYutgp+7le8M3y5u+4NZFSxErJrPjZrKXrr1+gu6iPDv0y/6QnPWLxi5rmwTz0
 jK6P0o6yVa2k93wri4BRvkoaUL1b7UfO+L4SIf5+COW9uX1shixyW+uXTXjPayHx0Gev
 d5OhUSAYldksrd6Wzc15nl8tTjhiNCQgzjnjLlCPCDHJSxBhU63hPEVeUmnkjpk5O2Xd
 ZrPQ==
X-Gm-Message-State: APjAAAWkO4yE9LnFdqNtTIClPXSaSx+UHIVeowAiPocEvZsoOHsHPFd0
 docSyHY75Oev+HB7eM5SGrb1ZjrlWjNMQEo/FxIyGA==
X-Google-Smtp-Source: APXvYqxwCzhD+f/VRdNZDgTdikEw/QSOUaezH8+D3+zqS5lACoMkVtmYxZEyV4QBJ0VWUXfyTXQiFmMbEH3LqFhQaiQ=
X-Received: by 2002:aca:b805:: with SMTP id i5mr2170100oif.110.1574245369890; 
 Wed, 20 Nov 2019 02:22:49 -0800 (PST)
MIME-Version: 1.0
References: <20191119210844.16947-1-daniel.vetter@ffwll.ch>
 <20191119210844.16947-4-daniel.vetter@ffwll.ch>
 <CAF6AEGuPtwFjM12MRBf_X7GUqJBHt+Xb8vKrT+dddic093Ki6g@mail.gmail.com>
In-Reply-To: <CAF6AEGuPtwFjM12MRBf_X7GUqJBHt+Xb8vKrT+dddic093Ki6g@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 20 Nov 2019 11:22:38 +0100
Message-ID: <CAKMK7uGox6G1dhMZr1ykYQFeUHq842CF3R4sKoSiPs6mOs-OPg@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/msm: Don't init ww_mutec acquire ctx before needed
To: Rob Clark <robdclark@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=BV0Dmq9a5ZLBcDoMXu3gWA5h7O+rvncKss28FAfnKM4=;
 b=beR3qLZQ19xO6sXxpyJf7TjFMp80ju6iNXtGghM0GTSnbqSSZESiiq5NLP+e1jNMfl
 4MYS3uxZ5ihUjBRLLN0IvWIv750tyMIfNb0ZR6DPoe9oRTpF6rZwymLJiEJLF69nqw5A
 aOLlWVwtMUMSD6NLIaxN4IRpG9ctax8aTEh4I=
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
Cc: Sean Paul <sean@poorly.run>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMzowNyBBTSBSb2IgQ2xhcmsgPHJvYmRjbGFya0BnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBOb3YgMTksIDIwMTkgYXQgMTowOCBQTSBEYW5pZWwg
VmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPiB3cm90ZToKPiA+Cj4gPiBGb3IgbG9ja2lu
ZyBzZW1hbnRpY3MgaXQgcmVhbGx5IGRvZXNuJ3QgbWF0dGVyIHdoZW4gd2UgZ3JhYiB0aGUKPiA+
IHRpY2tldC4gQnV0IGZvciBsb2NrZGVwIHZhbGlkYXRpb24gaXQgZG9lczogdGhlIGFjcXVpcmUg
Y3R4IGlzIGEgZmFrZQo+ID4gbG9ja2RlcC4gU2luY2Ugb3RoZXIgZHJpdmVycyBtaWdodCB3YW50
IHRvIGRvIGEgZnVsbCBtdWx0aS1sb2NrIGRhbmNlCj4gPiBpbiB0aGVpciBmYXVsdC1oYW5kbGVy
LCBub3QganVzdCBsb2NrIGEgc2luZ2xlIGRtYV9yZXN2LiBUaGVyZWZvcmUgd2UKPiA+IG11c3Qg
aW5pdCB0aGUgYWNxdWlyZV9jdHggb25seSBhZnRlciB3ZSd2ZSBkb25lIGFsbCB0aGUgY29weV8q
X3VzZXIgb3IKPiA+IGFueXRoaW5nIGVsc2UgdGhhdCBtaWdodCB0cmlnZ2VyIGEgcGFnZWZhdWx0
LiBGb3IgbXNtIHRoaXMgbWVhbnMgd2UKPiA+IG5lZWQgdG8gbW92ZSBpdCBwYXN0IHN1Ym1pdF9s
b29rdXBfb2JqZWN0cy4KPgo+IHNlZW1zIHJlYXNvbmFibGUuLiBidXQgbWF5YmUgYSBjb21tZW50
IHdvdWxkIGJlIHVzZWZ1bCB0byBwcmV2ZW50Cj4gZnV0dXJlLW1lIGZyb20gImNsZWFuaW5nLXRo
aXMtdXAiIGJhY2sgdG8gdGhlIHdheSBpdCB3YXMKCkknbGwgYWRkIGEgY29tbWVudC4KCj4gd2l0
aCB0aGF0LCByLWIKCldlbGwgSSBzcG90dGVkIGEgYnVnIGZvciB0aGUgZXJyb3IgaGFuZGxpbmcs
IEknbGwgbmVlZCB0byByZXNwaW4uCi1EYW5pZWwKCj4KPiA+Cj4gPiBBc2lkZTogV2h5IGlzIG1z
bSBzdGlsbCB1c2luZyBzdHJ1Y3RfbXV0ZXgsIGl0IHNlZW1zIHRvIGJlIHVzaW5nCj4gPiBkbWFf
cmVzdl9sb2NrIGZvciBnZW5lcmFsIGJ1ZmZlciBzdGF0ZSBwcm90ZWN0aW9uPwo+Cj4gb25seSBi
ZWNhdXNlIEkgKG9yIGFueW9uZSBlbHNlKSBoYXNuJ3QgaGFkIHRpbWUgdG8gcmV2aXNpdCB0aGUK
PiBzdHJ1Y3RfbXV0ZXggdXNhZ2Ugc2luY2Ugd2UgbW92ZWQgdG8gcGVyLW9iamVjdC1sb2Nrcy4u
IHRoZSBkb3duc2lkZSwKPiBJIHN1cHBvc2UsIG9mIGtlcm5lbCBnZW5lcmFsbHkgd29ya2luZyBv
ayBhbmQgdGhpcyBub3QgYmVpbmcgYSBiaWcKPiBlbm91Z2ggZmlyZSB0byBidWJibGUgdXAgdG8g
dGhlIHRvcCBvZiBteSB0b2RvIGxpc3QKPgo+IEJSLAo+IC1SCj4KPiA+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiA+IENjOiBSb2Ig
Q2xhcmsgPHJvYmRjbGFya0BnbWFpbC5jb20+Cj4gPiBDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3Js
eS5ydW4+Cj4gPiBDYzogbGludXgtYXJtLW1zbUB2Z2VyLmtlcm5lbC5vcmcKPiA+IENjOiBmcmVl
ZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0v
bXNtL21zbV9nZW1fc3VibWl0LmMgfCAyICstCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9tc20vbXNtX2dlbV9zdWJtaXQuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2dlbV9zdWJt
aXQuYwo+ID4gaW5kZXggZmIxZmRkN2ZhM2VmLi4xMjZiMmY2MmJmZTcgMTAwNjQ0Cj4gPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9nZW1fc3VibWl0LmMKPiA+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9tc20vbXNtX2dlbV9zdWJtaXQuYwo+ID4gQEAgLTU0LDcgKzU0LDYgQEAgc3RhdGlj
IHN0cnVjdCBtc21fZ2VtX3N1Ym1pdCAqc3VibWl0X2NyZWF0ZShzdHJ1Y3QgZHJtX2RldmljZSAq
ZGV2LAo+ID4KPiA+ICAgICAgICAgSU5JVF9MSVNUX0hFQUQoJnN1Ym1pdC0+bm9kZSk7Cj4gPiAg
ICAgICAgIElOSVRfTElTVF9IRUFEKCZzdWJtaXQtPmJvX2xpc3QpOwo+ID4gLSAgICAgICB3d19h
Y3F1aXJlX2luaXQoJnN1Ym1pdC0+dGlja2V0LCAmcmVzZXJ2YXRpb25fd3dfY2xhc3MpOwo+ID4K
PiA+ICAgICAgICAgcmV0dXJuIHN1Ym1pdDsKPiA+ICB9Cj4gPiBAQCAtNDg5LDYgKzQ4OCw3IEBA
IGludCBtc21faW9jdGxfZ2VtX3N1Ym1pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpk
YXRhLAo+ID4gICAgICAgICBpZiAocmV0KQo+ID4gICAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+
ID4KPiA+ICsgICAgICAgd3dfYWNxdWlyZV9pbml0KCZzdWJtaXQtPnRpY2tldCwgJnJlc2VydmF0
aW9uX3d3X2NsYXNzKTsKPiA+ICAgICAgICAgcmV0ID0gc3VibWl0X2xvY2tfb2JqZWN0cyhzdWJt
aXQpOwo+ID4gICAgICAgICBpZiAocmV0KQo+ID4gICAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+
ID4gLS0KPiA+IDIuMjQuMAo+ID4KCgoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5l
ZXIsIEludGVsIENvcnBvcmF0aW9uCis0MSAoMCkgNzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Jsb2cu
ZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
