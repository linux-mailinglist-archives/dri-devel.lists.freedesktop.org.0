Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A207C57CEE
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 09:12:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA0C06E7EA;
	Thu, 27 Jun 2019 07:11:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 751586E591
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 03:25:36 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id s184so473454oie.9
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 20:25:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DspknQs36A/5uQZX53aWrrdTwDH7n/43l0dEQF/NX0g=;
 b=rZZgXcfQ0O+uPgnIn15E6BFKUHAa52oOXXXXgmCg0098dm1TLc2tF3nLlE/iXA0LJe
 vPYPy4O2uOspZdM8ty4t3FIJHYTNRNdgSYq6UEYCuNLtoMl9c/4b0rEQPHcPf2F4h8t0
 MtHQW8xT2EpG0MG6yLVzUJk2aEMXJIlTLuOew1iCY7uKKZvm2A1KrCe505I9gw9igi/O
 ERoET++XXJtCddP18Xjy0cCa58jhgC9596LaBSeblTqYU3YCGREoJxSgH3AbfhleeIAL
 FLACJZqDIXX4gKc2KWKkUCXDMnr2hVCiDBu9BE9D3VQXTpMpoafVKcuf56Tfd38gUhWC
 XPuw==
X-Gm-Message-State: APjAAAVlAAud1Vnx6ollwNXFgkUU6xxbFApPxatLdo8GdBTUwqsA8Tyu
 O+N4xB5A9kE6pjQhyiy6dxo=
X-Google-Smtp-Source: APXvYqy3hg34R0jgTYAW4T1SMDgeAtq+nnmQVEoxqu2nLKH+jbuWe+E3KiBTJky9/6oXvYkKTVdf0Q==
X-Received: by 2002:a54:4f95:: with SMTP id g21mr303543oiy.23.1561605935712;
 Wed, 26 Jun 2019 20:25:35 -0700 (PDT)
Received: from rYz3n.attlocal.net ([2600:1700:210:3790::48])
 by smtp.googlemail.com with ESMTPSA id y184sm417647oie.33.2019.06.26.20.25.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 26 Jun 2019 20:25:35 -0700 (PDT)
From: Jiunn Chang <c0d1n61at3@gmail.com>
To: skhan@linuxfoundation.org
Subject: [Linux-kernel-mentees][PATCH v2] drm/amdkfd: Fix undefined behavior
 in bit shift
Date: Wed, 26 Jun 2019 22:25:31 -0500
Message-Id: <20190627032532.18374-3-c0d1n61at3@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190627010137.5612-3-c0d1n61at3@gmail.com>
References: <20190627010137.5612-3-c0d1n61at3@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 27 Jun 2019 07:11:26 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DspknQs36A/5uQZX53aWrrdTwDH7n/43l0dEQF/NX0g=;
 b=FnmR6S3UdvxSAXrt4YakXY+vA/wkVhU4l9+b1MXMa7h47IiKVdslEShfoIOjhVAu+A
 CHE+plwYBAfdLkY7mCGM2sBx+LHdtyh3KQNMcT1egYV6b3/82KUnTlGJIm9IcfZlGrvE
 aYCkPHKdxlFQGh5+5WTbawbIFIJHDRsskbAp6a3oQn1XcLXFfDDAdcZXF3kIA9xExHUD
 uW4jwOgqNAC5JiKaqpKFNetlim8XkuaYVoStRsdp9W9uFkc76yRwEJ+5UrYEF9VB67jy
 YpT8T+29gg6/tS9FTzjwY9s/5T8VjnjN6HxxkfONF+7Hvs5DNjJdgS0MRRlk0Z3uH1Qc
 IG9A==
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
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2hpZnRpbmcgc2lnbmVkIDMyLWJpdCB2YWx1ZSBieSAzMSBiaXRzIGlzIHVuZGVmaW5lZC4gIENo
YW5naW5nIG1vc3QKc2lnbmlmaWNhbnQgYml0IHRvIHVuc2lnbmVkLgoKQ2hhbmdlcyBpbmNsdWRl
ZCBpbiB2MjoKICAtIHVzZSBzdWJzeXN0ZW0gc3BlY2lmaWMgc3ViamVjdCBsaW5lcwogIC0gQ0Mg
cmVxdWlyZWQgbWFpbGluZyBsaXN0cwoKU2lnbmVkLW9mZi1ieTogSml1bm4gQ2hhbmcgPGMwZDFu
NjFhdDNAZ21haWwuY29tPgotLS0KIGluY2x1ZGUvdWFwaS9saW51eC9rZmRfaW9jdGwuaCB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2luY2x1ZGUvdWFwaS9saW51eC9rZmRfaW9jdGwuaCBiL2luY2x1ZGUvdWFwaS9saW51
eC9rZmRfaW9jdGwuaAppbmRleCBkYzA2N2VkMGI3MmQuLmFlNTY2OTI3MjMwMyAxMDA2NDQKLS0t
IGEvaW5jbHVkZS91YXBpL2xpbnV4L2tmZF9pb2N0bC5oCisrKyBiL2luY2x1ZGUvdWFwaS9saW51
eC9rZmRfaW9jdGwuaApAQCAtMzM5LDcgKzMzOSw3IEBAIHN0cnVjdCBrZmRfaW9jdGxfYWNxdWly
ZV92bV9hcmdzIHsKICNkZWZpbmUgS0ZEX0lPQ19BTExPQ19NRU1fRkxBR1NfVVNFUlBUUgkJKDEg
PDwgMikKICNkZWZpbmUgS0ZEX0lPQ19BTExPQ19NRU1fRkxBR1NfRE9PUkJFTEwJKDEgPDwgMykK
IC8qIEFsbG9jYXRpb24gZmxhZ3M6IGF0dHJpYnV0ZXMvYWNjZXNzIG9wdGlvbnMgKi8KLSNkZWZp
bmUgS0ZEX0lPQ19BTExPQ19NRU1fRkxBR1NfV1JJVEFCTEUJKDEgPDwgMzEpCisjZGVmaW5lIEtG
RF9JT0NfQUxMT0NfTUVNX0ZMQUdTX1dSSVRBQkxFCSgxVSA8PCAzMSkKICNkZWZpbmUgS0ZEX0lP
Q19BTExPQ19NRU1fRkxBR1NfRVhFQ1VUQUJMRQkoMSA8PCAzMCkKICNkZWZpbmUgS0ZEX0lPQ19B
TExPQ19NRU1fRkxBR1NfUFVCTElDCQkoMSA8PCAyOSkKICNkZWZpbmUgS0ZEX0lPQ19BTExPQ19N
RU1fRkxBR1NfTk9fU1VCU1RJVFVURQkoMSA8PCAyOCkKLS0gCjIuMjIuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
