Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB21325C5D
	for <lists+dri-devel@lfdr.de>; Fri, 26 Feb 2021 05:09:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F39B6E8D8;
	Fri, 26 Feb 2021 04:09:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B286E8D8
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Feb 2021 04:09:12 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id k22so4608994pll.6
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 20:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sS7O64Dax1Oof6uU+LILebhJ2b6dwBPbMV6PckIKTic=;
 b=SBfjWgcX7J4qKX7Tx/bBySKwNSomYsKyezXTnuznVIVzwnGIJhBnf+Q6aKLZklE010
 piLfpJ38GSZPZ04u3WRoGx6Dx/iXambXNJlWc10p5BJu0BkQisRIGletv6H5lAFWrucj
 gzU9iSRDzzcenUY9x2wowgr0zRYUXiLTv44+BLxGLx0Xor+xXaqi2N6H2iv+SGv2Z4ZC
 rmt4QWoPPXQy9J2PVfp7jFSeS9EwqLsqmOcBzHKTz4T1Tuo5q9paDQmHdhaz7ePPAh3y
 UlzVxEERei8fpd1u1UXtchb1bQ9knVi+9o4h85Hfpt2HGT3rdWg5NU5k/+WS71bPE4o+
 XYpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sS7O64Dax1Oof6uU+LILebhJ2b6dwBPbMV6PckIKTic=;
 b=QaBxWeE84Q/fzKqLQJ265Mmc8DNygqR1TEElb4KmLkRXRkZURV6hgCaYh4Sn6XAX8C
 8ofc8Kjs6lw9l7/6cqWiqBdtJ1z0z09FrG6gF2hhzEMG7TBLjmPVFMiirYmly/Y6tnO4
 0KeVCSJvLjb4yByiOeAxXCSLCaUa9qBuBZB6qwktWRyLf906U+zsI3yYnEf83g6SJuMn
 cf9PkuKcOHMy8lyIDPs/LSqpIhwGlNB2kCoDNaEscTKO7URIjmZerEXcc6fNZo3+EhnN
 N1l1rO6X5vJU9oRF+rPb7uE8C4BfmLi5mzB6Soz+da/telwmFjrIauQLaWdggjFcGjEA
 lOwg==
X-Gm-Message-State: AOAM533FlYQd1WY/X5wRTVmx/LFCtCyGYfGJJxkfOkbNALZOtaKoIREm
 JyQfz05CT1RfjeEAYiSAqNZpnA==
X-Google-Smtp-Source: ABdhPJzoeipTVrF8IbTxJwEupx0T2MyCKRlMEoY2FfiRRoVqjyRaqdsS61hiZWm94ZbjbWhgc9g5IQ==
X-Received: by 2002:a17:902:a985:b029:e3:8796:a128 with SMTP id
 bh5-20020a170902a985b02900e38796a128mr1326366plb.81.1614312551589; 
 Thu, 25 Feb 2021 20:09:11 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 z2sm7792202pfc.8.2021.02.25.20.09.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 20:09:10 -0800 (PST)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH] dma-buf: heaps: Set VM_PFNMAP in mmap for system and cma heaps
Date: Fri, 26 Feb 2021 04:09:08 +0000
Message-Id: <20210226040908.3274666-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: dri-devel@lists.freedesktop.org, Sandeep Patil <sspatil@google.com>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Ezequiel Garcia <ezequiel@collabora.com>, Robin Murphy <robin.murphy@arm.com>,
 James Jones <jajones@nvidia.com>, Liam Mark <lmark@codeaurora.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Laura Abbott <labbott@kernel.org>,
 Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?q?=C3=98rjan=20Eide?= <orjan.eide@arm.com>,
 linux-media@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Daniel Mentz <danielmentz@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UGVyIGRpc2N1c3Npb24gYW5kIHBhdGNoZXMgaGVyZToKICBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9kcmktZGV2ZWwvMjAyMTAyMjMxMDU5NTEuOTEyNTc3LTEtZGFuaWVsLnZldHRlckBmZndsbC5j
aC8KCkRhbmllbCBpcyBwbGFubmluZyBvbiBtYWtpbmcgVk1fUEZOTUFQIHJlcXVpcmVkIG9uIGRt
YWJ1ZnMuCgpUaHVzIHRvIGF2b2lkIHRoZSB3YXJuX29uIG5vaXNlLCBzZXQgdGhlIFZNX1BGTk1B
UCBpbiB0aGUKc3lzdGVtIGFuZCBjbWEgaGVhcCdzIG1tYXAgaGFuZGxlci4KCkNjOiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6aWVwZS5j
YT4KQ2M6IENocmlzdGlhbiBLb2VuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IFN1
bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+CkNjOiBMaWFtIE1hcmsgPGxtYXJr
QGNvZGVhdXJvcmEub3JnPgpDYzogQ2hyaXMgR29sZHN3b3J0aHkgPGNnb2xkc3dvQGNvZGVhdXJv
cmEub3JnPgpDYzogTGF1cmEgQWJib3R0IDxsYWJib3R0QGtlcm5lbC5vcmc+CkNjOiBCcmlhbiBT
dGFya2V5IDxCcmlhbi5TdGFya2V5QGFybS5jb20+CkNjOiBIcmlkeWEgVmFsc2FyYWp1IDxocmlk
eWFAZ29vZ2xlLmNvbT4KQ2M6IFN1cmVuIEJhZ2hkYXNhcnlhbiA8c3VyZW5iQGdvb2dsZS5jb20+
CkNjOiBTYW5kZWVwIFBhdGlsIDxzc3BhdGlsQGdvb2dsZS5jb20+CkNjOiBEYW5pZWwgTWVudHog
PGRhbmllbG1lbnR6QGdvb2dsZS5jb20+CkNjOiDDmHJqYW4gRWlkZSA8b3JqYW4uZWlkZUBhcm0u
Y29tPgpDYzogUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJtLmNvbT4KQ2M6IEV6ZXF1aWVs
IEdhcmNpYSA8ZXplcXVpZWxAY29sbGFib3JhLmNvbT4KQ2M6IFNpbW9uIFNlciA8Y29udGFjdEBl
bWVyc2lvbi5mcj4KQ2M6IEphbWVzIEpvbmVzIDxqYWpvbmVzQG52aWRpYS5jb20+CkNjOiBsaW51
eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKU2lnbmVkLW9mZi1ieTogSm9obiBTdHVsdHogPGpvaG4uc3R1bHR6QGxpbmFyby5vcmc+Ci0t
LQogZHJpdmVycy9kbWEtYnVmL2hlYXBzL2NtYV9oZWFwLmMgICAgfCAxICsKIGRyaXZlcnMvZG1h
LWJ1Zi9oZWFwcy9zeXN0ZW1faGVhcC5jIHwgNCArKystCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9o
ZWFwcy9jbWFfaGVhcC5jIGIvZHJpdmVycy9kbWEtYnVmL2hlYXBzL2NtYV9oZWFwLmMKaW5kZXgg
MzY0ZmMyZjNlNDk5Li4zNGJjMzk4N2Y5NDIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9o
ZWFwcy9jbWFfaGVhcC5jCisrKyBiL2RyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9jbWFfaGVhcC5jCkBA
IC0xODUsNiArMTg1LDcgQEAgc3RhdGljIGludCBjbWFfaGVhcF9tbWFwKHN0cnVjdCBkbWFfYnVm
ICpkbWFidWYsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQogCiAJdm1hLT52bV9vcHMgPSAm
ZG1hX2hlYXBfdm1fb3BzOwogCXZtYS0+dm1fcHJpdmF0ZV9kYXRhID0gYnVmZmVyOworCXZtYS0+
dm1fZmxhZ3MgfD0gVk1fUEZOTUFQOwogCiAJcmV0dXJuIDA7CiB9CmRpZmYgLS1naXQgYS9kcml2
ZXJzL2RtYS1idWYvaGVhcHMvc3lzdGVtX2hlYXAuYyBiL2RyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9z
eXN0ZW1faGVhcC5jCmluZGV4IDM1NDhiMjBjYjk4Yy4uODk5NWUzY2JmY2FmIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2RtYS1idWYvaGVhcHMvc3lzdGVtX2hlYXAuYworKysgYi9kcml2ZXJzL2RtYS1i
dWYvaGVhcHMvc3lzdGVtX2hlYXAuYwpAQCAtMjI4LDggKzIyOCwxMCBAQCBzdGF0aWMgaW50IHN5
c3RlbV9oZWFwX21tYXAoc3RydWN0IGRtYV9idWYgKmRtYWJ1Ziwgc3RydWN0IHZtX2FyZWFfc3Ry
dWN0ICp2bWEpCiAJCQlyZXR1cm4gcmV0OwogCQlhZGRyICs9IFBBR0VfU0laRTsKIAkJaWYgKGFk
ZHIgPj0gdm1hLT52bV9lbmQpCi0JCQlyZXR1cm4gMDsKKwkJCWJyZWFrOwogCX0KKworCXZtYS0+
dm1fZmxhZ3MgfD0gVk1fUEZOTUFQOwogCXJldHVybiAwOwogfQogCi0tIAoyLjI1LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
