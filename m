Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1046C4851E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 16:18:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DACD089209;
	Mon, 17 Jun 2019 14:18:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB20589209
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 14:18:10 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id k8so16400623eds.7
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 07:18:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=U2V9LJPWxdq3Nk0NdolFrZTzs3MZNPXv0KUg5LpciuY=;
 b=q+/AaEHpQ4YsfsAAMVPsAAeO2l0EYdZ/oEbafMMdqWDYpF4ASDFoAhrlKtYu1rZhns
 L4dG2syI0QIXKvpn2iL8Iq0KP7tmTI4ILtHFNX+p4GbWT4FLdjd+zM8/TnS6B0srSdf6
 /DyQByXD6vO0UrhMe8mQhlPJdBeybNPy6g0JxGltnbv4HZLZfi4sZ3hAFFRl98IR2FEE
 eyTKkq3CNVZb5fJfI0GXy/sATiKPqIR2gnwF3GPOE3K9+Hr21uOFge2L37SVUbT5vW2r
 qRV6LK39WBGIyCumfJ9iXyi22VX7CUx5E1yc5U4Gc9lckFG92IBrxT4qnMbXCx2hXDSO
 aDBg==
X-Gm-Message-State: APjAAAXis9yCdt6mDGoJOQtcaxDxtLI0I03NZ/RrS94zmXSe3sHkWH+j
 kUJdE+7VgaEE3G2NealbLzeSkg==
X-Google-Smtp-Source: APXvYqxt2wSFUMgJfQfTbf6PTQBIyVKZ3jLP6op9fPVtWFiQN/oXdv9RZbjIFHvLB1CrQt7BljrzOg==
X-Received: by 2002:a50:9168:: with SMTP id f37mr11016448eda.242.1560781089631; 
 Mon, 17 Jun 2019 07:18:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id 14sm1868433ejj.12.2019.06.17.07.18.08
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 07:18:08 -0700 (PDT)
Date: Mon, 17 Jun 2019 16:18:06 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 3/4] drm/virtio: simplify cursor updates
Message-ID: <20190617141806.GG12905@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20190617111406.14765-1-kraxel@redhat.com>
 <20190617111406.14765-4-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190617111406.14765-4-kraxel@redhat.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=U2V9LJPWxdq3Nk0NdolFrZTzs3MZNPXv0KUg5LpciuY=;
 b=TX9y/JY5+hWC5Xm03AWZ7CFI378GG+jP0eC99ozrl7NkaoFW7f2OyEKmFeRlTvFdZT
 mdBp9hIJKhB/xFbTv3WTXFNOIL+SPWdM7qHW4Yl7/gp+275Kk4xi7OuN+a9JSaDJfGDY
 DR3ea0qGW/U8eTxdzsyRLfEoBA3bDdI7LjFHw=
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgMDE6MTQ6MDVQTSArMDIwMCwgR2VyZCBIb2ZmbWFubiB3
cm90ZToKPiBObyBuZWVkIHRvIGRvIHRoZSByZXNlcnZhdGlvbiBkYW5jZSwKPiB3ZSBjYW4ganVz
dCB3YWl0IG9uIHRoZSBmZW5jZSBkaXJlY3RseS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBHZXJkIEhv
ZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3ZpcnRp
by92aXJ0Z3B1X3BsYW5lLmMgfCAxMyArKystLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfcGxhbmUuYyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8v
dmlydGdwdV9wbGFuZS5jCj4gaW5kZXggMDI0YzJhYTBjOTI5Li40YjgwNWJmNDY2ZDMgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3BsYW5lLmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfcGxhbmUuYwo+IEBAIC0xODQsNyArMTg0LDYg
QEAgc3RhdGljIHZvaWQgdmlydGlvX2dwdV9jdXJzb3JfcGxhbmVfdXBkYXRlKHN0cnVjdCBkcm1f
cGxhbmUgKnBsYW5lLAo+ICAJc3RydWN0IHZpcnRpb19ncHVfZnJhbWVidWZmZXIgKnZnZmI7Cj4g
IAlzdHJ1Y3QgdmlydGlvX2dwdV9vYmplY3QgKmJvID0gTlVMTDsKPiAgCXVpbnQzMl90IGhhbmRs
ZTsKPiAtCWludCByZXQgPSAwOwo+ICAKPiAgCWlmIChwbGFuZS0+c3RhdGUtPmNydGMpCj4gIAkJ
b3V0cHV0ID0gZHJtX2NydGNfdG9fdmlydGlvX2dwdV9vdXRwdXQocGxhbmUtPnN0YXRlLT5jcnRj
KTsKPiBAQCAtMjA4LDE1ICsyMDcsOSBAQCBzdGF0aWMgdm9pZCB2aXJ0aW9fZ3B1X2N1cnNvcl9w
bGFuZV91cGRhdGUoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCj4gIAkJCSBjcHVfdG9fbGUzMihw
bGFuZS0+c3RhdGUtPmNydGNfdyksCj4gIAkJCSBjcHVfdG9fbGUzMihwbGFuZS0+c3RhdGUtPmNy
dGNfaCksCj4gIAkJCSAwLCAwLCB2Z2ZiLT5mZW5jZSk7Cj4gLQkJcmV0ID0gdmlydGlvX2dwdV9v
YmplY3RfcmVzZXJ2ZShibywgZmFsc2UpOwo+IC0JCWlmICghcmV0KSB7Cj4gLQkJCXJlc2VydmF0
aW9uX29iamVjdF9hZGRfZXhjbF9mZW5jZShiby0+dGJvLnJlc3YsCj4gLQkJCQkJCQkgICZ2Z2Zi
LT5mZW5jZS0+Zik7Cj4gLQkJCWRtYV9mZW5jZV9wdXQoJnZnZmItPmZlbmNlLT5mKTsKPiAtCQkJ
dmdmYi0+ZmVuY2UgPSBOVUxMOwo+IC0JCQl2aXJ0aW9fZ3B1X29iamVjdF91bnJlc2VydmUoYm8p
Owo+IC0JCQl2aXJ0aW9fZ3B1X29iamVjdF93YWl0KGJvLCBmYWxzZSk7Cj4gLQkJfQo+ICsJCWRt
YV9mZW5jZV93YWl0KCZ2Z2ZiLT5mZW5jZS0+ZiwgdHJ1ZSk7Cj4gKwkJZG1hX2ZlbmNlX3B1dCgm
dmdmYi0+ZmVuY2UtPmYpOwo+ICsJCXZnZmItPmZlbmNlID0gTlVMTDsKCkV2ZW4gbmljZXIgd291
bGQgYmUgdG8gYWRkIHRoZSBmZW5jZSB1c2luZwpkcm1fYXRvbWljX3NldF9mZW5jZV9mb3JfcGxh
bmUoKSBpbiB0aGUgcHJlcGFyZV9mYiBob29rLiBBc3N1bWluZyB0aGlzCmlzbid0IG5lY2Vzc2Fy
eSBmb3IgY29ycmVjdG5lc3MgKGJ1dCB0aGVuIEkga2luZGEgaGF2ZSBxdWVzdGlvbnMgYWJvdXQK
cmFjZXMgYW5kIHN0dWZmKS4KCkJ1dCB0aGlzIGdldHMgdGhlIGpvYiBkb25lIHRvbyBJIHRoaW5r
LCBzbzoKClJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNo
PgoKPiAgCX0KPiAgCj4gIAlpZiAocGxhbmUtPnN0YXRlLT5mYiAhPSBvbGRfc3RhdGUtPmZiKSB7
Cj4gLS0gCj4gMi4xOC4xCj4gCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwg
SW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
