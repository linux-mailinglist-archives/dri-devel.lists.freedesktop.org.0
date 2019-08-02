Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA8D7FB89
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 15:50:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B50366EE67;
	Fri,  2 Aug 2019 13:50:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2019F6EE67;
 Fri,  2 Aug 2019 13:50:00 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id az7so33651205plb.5;
 Fri, 02 Aug 2019 06:50:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=mQtLIJgj8qnmq16hHV2/Di60nqvabcpIT2vTK21437M=;
 b=ike+0636w/a79ZsjTC3mDsx3aVmh5Iy+oapl5GlJ+G+7GIlXiD+B3YEoeBLhSQNVDv
 VdvggfzAiHRySmfJmNzCSuSIo5ik/rm5tN8+L+5u21INy45eRtUplJs8ZEJrrcfa5g75
 IzrDfkYNVwpGeL4N3SW2pYJn2Zt4fKHhr/IkIZItb7UYBmkqumX1hYyGivv92yw0kbhT
 4bmdK+ZcWCb3admbiQAmMCHHZt1MaE4uDaXR46yxOO0hEK+hxBgOltKRtPQgOrM7U3HW
 j4bweEmyUdt+Gf22hUpW1h/P7zUTPLzPiDelNIVc2EYNGHaCmslt1/yWFb+FK+eG+7CQ
 DymQ==
X-Gm-Message-State: APjAAAUqK6loCqcVfynE1sOq2fP1HmHPTVOspOSTEw20nHhPFaHdK4RA
 GuTk8li40v5vO+t6gPdO7Go=
X-Google-Smtp-Source: APXvYqwZBcDnDQYwRDu0HUM/22nE7jgEVt0d2AijMAExL0f5PjopObxqzpla+GgxHcYOLzcB2qAMqg==
X-Received: by 2002:a17:902:d81:: with SMTP id
 1mr136710123plv.323.1564753799488; 
 Fri, 02 Aug 2019 06:49:59 -0700 (PDT)
Received: from localhost ([121.137.63.184])
 by smtp.gmail.com with ESMTPSA id c98sm8955254pje.1.2019.08.02.06.49.58
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 02 Aug 2019 06:49:58 -0700 (PDT)
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
X-Google-Original-From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Date: Fri, 2 Aug 2019 22:49:55 +0900
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH 2/2] i915: do not leak module ref counter
Message-ID: <20190802134955.GA23032@tigerII.localdomain>
References: <20190802123956.2450-1-sergey.senozhatsky@gmail.com>
 <20190802123956.2450-2-sergey.senozhatsky@gmail.com>
 <156475071634.6598.8668583907388398632@skylake-alporthouse-com>
 <156475141863.6598.6809215010139776043@skylake-alporthouse-com>
 <20190802131523.GB466@tigerII.localdomain>
 <20190802133503.GA18318@tigerII.localdomain>
 <156475327511.6598.417403815598052974@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <156475327511.6598.417403815598052974@skylake-alporthouse-com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=mQtLIJgj8qnmq16hHV2/Di60nqvabcpIT2vTK21437M=;
 b=hsZhqrgEi6dAqzOpjWJOvXYoTzsshkLCAgAiTytNSLPy48j75sU3Wss+dGI1RCJ7Gu
 0lB1sgp6Vtmaprc/rWNSSz0f9cFzB0p0iOH2MhvMCUAhQmPwELT+GtvkSe4gdSKkAiy6
 McxrTVLN8dPBY5JwfAkmhVWIf1go91hSOOyb1uy5m6m8PUxj5TqTeitDugYcVDapPgYC
 HvhD2XPmWoXmgfzBWAA4FhB9352AwaPB2c2NhMEYA2YC2lbrkK1RLNxYyDX1M8B40pOE
 XHTQ9zP9em0SuRbmiG+4fgjfN2F5CPQxYNPbIDo3CcOp1DtVgcd1G4MK8kK+Co+eshUq
 9+hQ==
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gKDA4LzAyLzE5IDE0OjQxKSwgQ2hyaXMgV2lsc29uIHdyb3RlOgpbLi5dCj4gc3RydWN0IHZm
c21vdW50ICprZXJuX21vdW50KHN0cnVjdCBmaWxlX3N5c3RlbV90eXBlICp0eXBlKQo+IHsKPiAg
ICAgICAgIHN0cnVjdCB2ZnNtb3VudCAqbW50Owo+ICAgICAgICAgbW50ID0gdmZzX2tlcm5fbW91
bnQodHlwZSwgU0JfS0VSTk1PVU5ULCB0eXBlLT5uYW1lLCBOVUxMKTsKPiAgICAgICAgIGlmICgh
SVNfRVJSKG1udCkpIHsKPiAgICAgICAgICAgICAgICAgLyoKPiAgICAgICAgICAgICAgICAgICog
aXQgaXMgYSBsb25ndGVybSBtb3VudCwgZG9uJ3QgcmVsZWFzZSBtbnQgdW50aWwKPiAgICAgICAg
ICAgICAgICAgICogd2UgdW5tb3VudCBiZWZvcmUgZmlsZSBzeXMgaXMgdW5yZWdpc3RlcmVkCj4g
ICAgICAgICAgICAgICAgICovCj4gICAgICAgICAgICAgICAgIHJlYWxfbW91bnQobW50KS0+bW50
X25zID0gTU5UX05TX0lOVEVSTkFMOwo+ICAgICAgICAgfQo+ICAgICAgICAgcmV0dXJuIG1udDsK
PiB9Cj4gCj4gV2l0aCB0aGUgZXhjZXB0aW9uIG9mIGZpZGRsaW5nIHdpdGggTU5UX05TX0lOVEVS
TkFMLCBpdCBzZWVtcwo+IGFtZW5hYmxlIGZvciBvdXIgbmVlZHMuCgpTb3JyeSwgbm90IHN1cmUg
SSB1bmRlcnN0YW5kLiBpOTE1IHVzZSBrZXJuX21vdW50KCkgYXQgdGhlIG1vbWVudC4KClNpbmNl
IHdlIHN0aWxsIG5lZWQgdG8gcHV0X2ZpbGVzeXN0ZW0oKSwgSSdkIHByb2JhYmx5IGFkZCBvbmUg
bW9yZQpwYXRjaAoJLSBleHBvcnQgcHV0X2ZpbGVzeXN0ZW0oKQoKc28gdGhlbiB3ZSBjYW4gcHV0
X2ZpbGVzeXN0ZW0oKSBpbiBpOTE1LiBXb25kZXIgd2hhdCB3b3VsZCBoYXBwZW4KaWYgc29tZW9u
ZSB3b3VsZCBkbwoJCW1vZHByb2JlIGk5MTUKCQlybW1vZCBpOTE2CkluIGEgbG9vcC4KClNvIHNv
bWV0aGluZyBsaWtlIHRoaXMgKHRoaXMgaXMgYWdhaW5zdCBjdXJyZW50IHBhdGNoIHNldCkuCgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbWZzLmMgfCA1ICsrLS0tCiBmcy9m
aWxlc3lzdGVtcy5jICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtZnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9p
OTE1X2dlbWZzLmMKaW5kZXggZDQzNzE4OGQxNzM2Li40ZWE3YTZmNzUwZjQgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbWZzLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtZnMuYwpAQCAtMjQsMTAgKzI0LDkgQEAgaW50IGk5MTVfZ2Vt
ZnNfaW5pdChzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqaTkxNSkKIAkJcmV0dXJuIC1FTk9ERVY7
CiAKIAlnZW1mcyA9IGtlcm5fbW91bnQodHlwZSk7Ci0JaWYgKElTX0VSUihnZW1mcykpIHsKLQkJ
cHV0X2ZpbGVzeXN0ZW0odHlwZSk7CisJcHV0X2ZpbGVzeXN0ZW0odHlwZSk7CisJaWYgKElTX0VS
UihnZW1mcykpCiAJCXJldHVybiBQVFJfRVJSKGdlbWZzKTsKLQl9CiAKIAkvKgogCSAqIEVuYWJs
ZSBodWdlLXBhZ2VzIGZvciBvYmplY3RzIHRoYXQgYXJlIGF0IGxlYXN0IEhQQUdFX1BNRF9TSVpF
LCBtb3N0CmRpZmYgLS1naXQgYS9mcy9maWxlc3lzdGVtcy5jIGIvZnMvZmlsZXN5c3RlbXMuYwpp
bmRleCA5MTM1NjQ2ZTQxYWMuLjQ4MzdlZGE3NDhiNSAxMDA2NDQKLS0tIGEvZnMvZmlsZXN5c3Rl
bXMuYworKysgYi9mcy9maWxlc3lzdGVtcy5jCkBAIC00NSw2ICs0NSw3IEBAIHZvaWQgcHV0X2Zp
bGVzeXN0ZW0oc3RydWN0IGZpbGVfc3lzdGVtX3R5cGUgKmZzKQogewogCW1vZHVsZV9wdXQoZnMt
Pm93bmVyKTsKIH0KK0VYUE9SVF9TWU1CT0wocHV0X2ZpbGVzeXN0ZW0pOwogCiBzdGF0aWMgc3Ry
dWN0IGZpbGVfc3lzdGVtX3R5cGUgKipmaW5kX2ZpbGVzeXN0ZW0oY29uc3QgY2hhciAqbmFtZSwg
dW5zaWduZWQgbGVuKQogewpAQCAtMjgwLDUgKzI4MSw0IEBAIHN0cnVjdCBmaWxlX3N5c3RlbV90
eXBlICpnZXRfZnNfdHlwZShjb25zdCBjaGFyICpuYW1lKQogCX0KIAlyZXR1cm4gZnM7CiB9Ci0K
IEVYUE9SVF9TWU1CT0woZ2V0X2ZzX3R5cGUpOwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
