Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACC51675D
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 18:04:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E38C89F31;
	Tue,  7 May 2019 16:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F63689F31
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 16:04:34 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:54033
 helo=[192.168.10.178])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hO2a0-0000wP-Fw; Tue, 07 May 2019 18:04:32 +0200
Subject: Re: [PATCH] drm/cma-helper: Fix drm_gem_cma_free_object()
To: dri-devel@lists.freedesktop.org
References: <20190426124753.53722-1-noralf@tronnes.org>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <67fc69cc-7db3-968e-2492-acd01dc3def5@tronnes.org>
Date: Tue, 7 May 2019 18:04:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190426124753.53722-1-noralf@tronnes.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=lyGqipjiRCFmDOF/jq1bWm79I2+7T2ZtPR/0i8mXddY=; 
 b=IsqaXW2x6yNVicJf1fLXuGfuvILaGB7wFWDik/c4y/nnQTbU8V78zlO0KYpqXDmuEJPVE0udortb/OT5c5MBka8uzjA2S95TFBNKysAKKjmmt9GI1LSC6Erv64vLgXEo17ND0k1EYAfB7KjDu6q54WkfX8SNqSdVVVnb3t2dxzx7y3CChFIJYoE2I4Y44AVCZPX+up5eXZHo4vMZR6IDgCNirdoyKdA0lwuCaJSnRLpHcengdHTmh2UJh8RywG9YvjY086iwAXLPUh5GveFX8szFvtfMCiSQoxPCf5aIUAAO80xpVhKd7DnEnARr0Ij8cHrmYOJklqqkjiEK8KLx/A==;
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
Cc: "Li, Tingqian" <tingqian.li@intel.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpDb3VsZCBzb21lb25lIHBsZWFzZSBoYXZlIGEgbG9vayBhdCB0aGlzIG9uZT8KCk5vcmFs
Zi4KCkRlbiAyNi4wNC4yMDE5IDE0LjQ3LCBza3JldiBOb3JhbGYgVHLDuG5uZXM6Cj4gVGhlIGxv
Z2ljIGZvciBmcmVlaW5nIGFuIGltcG9ydGVkIGJ1ZmZlciB3aXRoIGEgdmlydHVhbCBhZGRyZXNz
IGlzCj4gYnJva2VuLiBJdCB3aWxsIGZyZWUgdGhlIGJ1ZmZlciBpbnN0ZWFkIG9mIHVubWFwcGlu
ZyB0aGUgZG1hIGJ1Zi4KPiBGaXggYnkgcmV2ZXJzaW5nIHRoZSBpZiBsYWRkZXIgYW5kIGZpcnN0
IGNoZWNrIGlmIHRoZSBidWZmZXIgaXMgaW1wb3J0ZWQuCj4gCj4gRml4ZXM6IGI5MDY4Y2RlNTFl
ZSAoImRybS9jbWEtaGVscGVyOiBBZGQgRFJNX0dFTV9DTUFfVk1BUF9EUklWRVJfT1BTIikKPiBD
Yzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IFJlcG9ydGVkLWJ5OiAiTGksIFRpbmdxaWFuIiA8
dGluZ3FpYW4ubGlAaW50ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IE5vcmFsZiBUcsO4bm5lcyA8
bm9yYWxmQHRyb25uZXMub3JnPgo+IC0tLQo+IAo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9j
bWFfaGVscGVyLmMgfCA4ICsrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
Z2VtX2NtYV9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX2NtYV9oZWxwZXIuYwo+
IGluZGV4IGNjMjY2MjViNGIzMy4uZTAxY2VlZDA5ZTY3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZ2VtX2NtYV9oZWxwZXIuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1f
Z2VtX2NtYV9oZWxwZXIuYwo+IEBAIC0xODYsMTMgKzE4NiwxMyBAQCB2b2lkIGRybV9nZW1fY21h
X2ZyZWVfb2JqZWN0KHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqZ2VtX29iaikKPiAgCj4gIAljbWFf
b2JqID0gdG9fZHJtX2dlbV9jbWFfb2JqKGdlbV9vYmopOwo+ICAKPiAtCWlmIChjbWFfb2JqLT52
YWRkcikgewo+IC0JCWRtYV9mcmVlX3djKGdlbV9vYmotPmRldi0+ZGV2LCBjbWFfb2JqLT5iYXNl
LnNpemUsCj4gLQkJCSAgICBjbWFfb2JqLT52YWRkciwgY21hX29iai0+cGFkZHIpOwo+IC0JfSBl
bHNlIGlmIChnZW1fb2JqLT5pbXBvcnRfYXR0YWNoKSB7Cj4gKwlpZiAoZ2VtX29iai0+aW1wb3J0
X2F0dGFjaCkgewo+ICAJCWlmIChjbWFfb2JqLT52YWRkcikKPiAgCQkJZG1hX2J1Zl92dW5tYXAo
Z2VtX29iai0+aW1wb3J0X2F0dGFjaC0+ZG1hYnVmLCBjbWFfb2JqLT52YWRkcik7Cj4gIAkJZHJt
X3ByaW1lX2dlbV9kZXN0cm95KGdlbV9vYmosIGNtYV9vYmotPnNndCk7Cj4gKwl9IGVsc2UgaWYg
KGNtYV9vYmotPnZhZGRyKSB7Cj4gKwkJZG1hX2ZyZWVfd2MoZ2VtX29iai0+ZGV2LT5kZXYsIGNt
YV9vYmotPmJhc2Uuc2l6ZSwKPiArCQkJICAgIGNtYV9vYmotPnZhZGRyLCBjbWFfb2JqLT5wYWRk
cik7Cj4gIAl9Cj4gIAo+ICAJZHJtX2dlbV9vYmplY3RfcmVsZWFzZShnZW1fb2JqKTsKPiAKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
