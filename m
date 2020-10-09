Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A3F288450
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 10:00:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDD436EC79;
	Fri,  9 Oct 2020 08:00:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 046806EC75
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 08:00:01 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id k18so8883190wmj.5
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Oct 2020 01:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VGrUY4m6p5xG/5TwFTmhTR39yvHelSEgKxkZWp9gwIE=;
 b=WPX0SQh+d+jDaKjHU8oXPWwTFZ6I9d8chtJOOB3w8FfTWBwLtHGTAa8q7Z5CACAZY3
 UkSQDp1/O2GnYgBbniIxNjhdXdLdXrAJABesUu7pGtQKY9YclRRFLDYKvNjJkG8Ypaxd
 nZyL986vmmMLudJmb5AlQdezveAb4RTPx7bHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VGrUY4m6p5xG/5TwFTmhTR39yvHelSEgKxkZWp9gwIE=;
 b=aBj1shRmnvvV4os+6aCe1/NtMxHyTSYKuv5j886a209m5FCFvwJWHANOMBamVGR945
 s+PAmLI9bYlTGnCT5v+FeAzM3Tdz8gJSm1W359z0cbZWWaQXodAsBrnws1R3YVu4zZTO
 TD3p6j1AYF0aVjvpq6MdGK3astvNk8eQqlP0IpCT0S579d3ow2daVPjA8fytxhHLYL7+
 wPuiYetBMQ24dyAVhgkotDNcCh66T+dz7q8/y0/eijTU/oWCO/JAG3nrC1uwK9PZlnVX
 ufrEj28ljUdgKzHGnmqZIO+tGUzHrkVhTy32pRw4moUlEuo/3bWf81eEln9UJKISGPa8
 lYXw==
X-Gm-Message-State: AOAM531r7FPt6eUphje+X6m2dDbfg+w3zPzqEKVOojIGPJ6Cxh9qkinb
 JPk2vsE/uacxnSF+AxJffYwPlGmKyJOfK0dC
X-Google-Smtp-Source: ABdhPJza4YHBFB+hGZoQR0pL1SAV181vUPmZGDI7HJVs1HjO1uxQPcpRwnUTFuwYtwPHyDbyitWzBQ==
X-Received: by 2002:a1c:e045:: with SMTP id x66mr12816887wmg.104.1602230399345; 
 Fri, 09 Oct 2020 00:59:59 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u17sm11634118wri.45.2020.10.09.00.59.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2020 00:59:58 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 05/17] mm/frame-vector: Use FOLL_LONGTERM
Date: Fri,  9 Oct 2020 09:59:22 +0200
Message-Id: <20201009075934.3509076-6-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
References: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
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
Cc: linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Jan Kara <jack@suse.cz>, Pawel Osciak <pawel@osciak.com>, kvm@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Tomasz Figa <tfiga@chromium.org>, linux-mm@kvack.org,
 Kyungmin Park <kyungmin.park@samsung.com>, John Hubbard <jhubbard@nvidia.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBpcyB1c2VkIGJ5IG1lZGlhL3ZpZGVidWYyIGZvciBwZXJzaXN0ZW50IGRtYSBtYXBwaW5n
cywgbm90IGp1c3QKZm9yIGEgc2luZ2xlIGRtYSBvcGVyYXRpb24gYW5kIHRoZW4gZnJlZWQgYWdh
aW4sIHNvIG5lZWRzCkZPTExfTE9OR1RFUk0uCgpVbmZvcnR1bmF0ZWx5IGN1cnJlbnQgcHVwX2xv
Y2tlZCBkb2Vzbid0IHN1cHBvcnQgRk9MTF9MT05HVEVSTSBkdWUgdG8KbG9ja2luZyBpc3N1ZXMu
IFJld29yayB0aGUgY29kZSB0byBwdWxsIHRoZSBwdXAgcGF0aCBvdXQgZnJvbSB0aGUKbW1hcF9z
ZW0gY3JpdGljYWwgc2VjdGlvbiBhcyBzdWdnZXN0ZWQgYnkgSmFzb24uCgpCeSByZWx5aW5nIGVu
dGlyZWx5IG9uIHRoZSB2bWEgY2hlY2tzIGluIHBpbl91c2VyX3BhZ2VzIGFuZCBmb2xsb3dfcGZu
Cihmb3Igdm1fZmxhZ3MgYW5kIHZtYV9pc19mc2RheCkgd2UgY2FuIGFsc28gc3RyZWFtbGluZSB0
aGUgY29kZSBhIGxvdC4KClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0
ZXJAaW50ZWwuY29tPgpDYzogSmFzb24gR3VudGhvcnBlIDxqZ2dAemllcGUuY2E+CkNjOiBQYXdl
bCBPc2NpYWsgPHBhd2VsQG9zY2lhay5jb20+CkNjOiBNYXJlayBTenlwcm93c2tpIDxtLnN6eXBy
b3dza2lAc2Ftc3VuZy5jb20+CkNjOiBLeXVuZ21pbiBQYXJrIDxreXVuZ21pbi5wYXJrQHNhbXN1
bmcuY29tPgpDYzogVG9tYXN6IEZpZ2EgPHRmaWdhQGNocm9taXVtLm9yZz4KQ2M6IE1hdXJvIENh
cnZhbGhvIENoZWhhYiA8bWNoZWhhYkBrZXJuZWwub3JnPgpDYzogQW5kcmV3IE1vcnRvbiA8YWtw
bUBsaW51eC1mb3VuZGF0aW9uLm9yZz4KQ2M6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlh
LmNvbT4KQ2M6IErDqXLDtG1lIEdsaXNzZSA8amdsaXNzZUByZWRoYXQuY29tPgpDYzogSmFuIEth
cmEgPGphY2tAc3VzZS5jej4KQ2M6IERhbiBXaWxsaWFtcyA8ZGFuLmoud2lsbGlhbXNAaW50ZWwu
Y29tPgpDYzogbGludXgtbW1Aa3ZhY2sub3JnCkNjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKQ2M6IGxpbnV4LXNhbXN1bmctc29jQHZnZXIua2VybmVsLm9yZwpDYzogbGlu
dXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCi0tCnYyOiBTdHJlYW1saW5lIHRoZSBjb2RlIGFuZCBm
dXJ0aGVyIHNpbXBsaWZ5IHRoZSBsb29wIGNoZWNrcyAoSmFzb24pCi0tLQogbW0vZnJhbWVfdmVj
dG9yLmMgfCA1MCArKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDM1IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL21tL2ZyYW1lX3ZlY3Rvci5jIGIvbW0vZnJhbWVfdmVjdG9yLmMKaW5kZXggMTBm
ODJkNTY0M2I2Li5kNDQ3NzllNTYzMTMgMTAwNjQ0Ci0tLSBhL21tL2ZyYW1lX3ZlY3Rvci5jCisr
KyBiL21tL2ZyYW1lX3ZlY3Rvci5jCkBAIC0zOCw3ICszOCw2IEBAIGludCBnZXRfdmFkZHJfZnJh
bWVzKHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGludCBucl9mcmFtZXMsCiAJc3RydWN0
IHZtX2FyZWFfc3RydWN0ICp2bWE7CiAJaW50IHJldCA9IDA7CiAJaW50IGVycjsKLQlpbnQgbG9j
a2VkOwogCiAJaWYgKG5yX2ZyYW1lcyA9PSAwKQogCQlyZXR1cm4gMDsKQEAgLTQ4LDQwICs0Nywy
NSBAQCBpbnQgZ2V0X3ZhZGRyX2ZyYW1lcyh1bnNpZ25lZCBsb25nIHN0YXJ0LCB1bnNpZ25lZCBp
bnQgbnJfZnJhbWVzLAogCiAJc3RhcnQgPSB1bnRhZ2dlZF9hZGRyKHN0YXJ0KTsKIAotCW1tYXBf
cmVhZF9sb2NrKG1tKTsKLQlsb2NrZWQgPSAxOwotCXZtYSA9IGZpbmRfdm1hX2ludGVyc2VjdGlv
bihtbSwgc3RhcnQsIHN0YXJ0ICsgMSk7Ci0JaWYgKCF2bWEpIHsKLQkJcmV0ID0gLUVGQVVMVDsK
LQkJZ290byBvdXQ7Ci0JfQotCi0JLyoKLQkgKiBXaGlsZSBnZXRfdmFkZHJfZnJhbWVzKCkgY291
bGQgYmUgdXNlZCBmb3IgdHJhbnNpZW50IChrZXJuZWwKLQkgKiBjb250cm9sbGVkIGxpZmV0aW1l
KSBwaW5uaW5nIG9mIG1lbW9yeSBwYWdlcyBhbGwgY3VycmVudAotCSAqIHVzZXJzIGVzdGFibGlz
aCBsb25nIHRlcm0gKHVzZXJzcGFjZSBjb250cm9sbGVkIGxpZmV0aW1lKQotCSAqIHBhZ2UgcGlu
bmluZy4gVHJlYXQgZ2V0X3ZhZGRyX2ZyYW1lcygpIGxpa2UKLQkgKiBnZXRfdXNlcl9wYWdlc19s
b25ndGVybSgpIGFuZCBkaXNhbGxvdyBpdCBmb3IgZmlsZXN5c3RlbS1kYXgKLQkgKiBtYXBwaW5n
cy4KLQkgKi8KLQlpZiAodm1hX2lzX2ZzZGF4KHZtYSkpIHsKLQkJcmV0ID0gLUVPUE5PVFNVUFA7
Ci0JCWdvdG8gb3V0OwotCX0KLQotCWlmICghKHZtYS0+dm1fZmxhZ3MgJiAoVk1fSU8gfCBWTV9Q
Rk5NQVApKSkgeworCXJldCA9IHBpbl91c2VyX3BhZ2VzX2Zhc3Qoc3RhcnQsIG5yX2ZyYW1lcywK
KwkJCQkgIEZPTExfRk9SQ0UgfCBGT0xMX1dSSVRFIHwgRk9MTF9MT05HVEVSTSwKKwkJCQkgIChz
dHJ1Y3QgcGFnZSAqKikodmVjLT5wdHJzKSk7CisJaWYgKHJldCA+IDApIHsKIAkJdmVjLT5nb3Rf
cmVmID0gdHJ1ZTsKIAkJdmVjLT5pc19wZm5zID0gZmFsc2U7Ci0JCXJldCA9IHBpbl91c2VyX3Bh
Z2VzX2xvY2tlZChzdGFydCwgbnJfZnJhbWVzLAotCQkJZ3VwX2ZsYWdzLCAoc3RydWN0IHBhZ2Ug
KiopKHZlYy0+cHRycyksICZsb2NrZWQpOwotCQlnb3RvIG91dDsKKwkJZ290byBvdXRfdW5sb2Nr
ZWQ7CiAJfQogCisJbW1hcF9yZWFkX2xvY2sobW0pOwogCXZlYy0+Z290X3JlZiA9IGZhbHNlOwog
CXZlYy0+aXNfcGZucyA9IHRydWU7CiAJZG8gewogCQl1bnNpZ25lZCBsb25nICpudW1zID0gZnJh
bWVfdmVjdG9yX3BmbnModmVjKTsKIAorCQl2bWEgPSBmaW5kX3ZtYV9pbnRlcnNlY3Rpb24obW0s
IHN0YXJ0LCBzdGFydCArIDEpOworCQlpZiAoIXZtYSkKKwkJCWJyZWFrOworCiAJCXdoaWxlIChy
ZXQgPCBucl9mcmFtZXMgJiYgc3RhcnQgKyBQQUdFX1NJWkUgPD0gdm1hLT52bV9lbmQpIHsKIAkJ
CWVyciA9IGZvbGxvd19wZm4odm1hLCBzdGFydCwgJm51bXNbcmV0XSk7CiAJCQlpZiAoZXJyKSB7
CkBAIC05MiwxNyArNzYsMTMgQEAgaW50IGdldF92YWRkcl9mcmFtZXModW5zaWduZWQgbG9uZyBz
dGFydCwgdW5zaWduZWQgaW50IG5yX2ZyYW1lcywKIAkJCXN0YXJ0ICs9IFBBR0VfU0laRTsKIAkJ
CXJldCsrOwogCQl9Ci0JCS8qCi0JCSAqIFdlIHN0b3AgaWYgd2UgaGF2ZSBlbm91Z2ggcGFnZXMg
b3IgaWYgVk1BIGRvZXNuJ3QgY29tcGxldGVseQotCQkgKiBjb3ZlciB0aGUgdGFpbCBwYWdlLgot
CQkgKi8KLQkJaWYgKHJldCA+PSBucl9mcmFtZXMgfHwgc3RhcnQgPCB2bWEtPnZtX2VuZCkKKwkJ
LyogQmFpbCBvdXQgaWYgVk1BIGRvZXNuJ3QgY29tcGxldGVseSBjb3ZlciB0aGUgdGFpbCBwYWdl
LiAqLworCQlpZiAoc3RhcnQgPCB2bWEtPnZtX2VuZCkKIAkJCWJyZWFrOwotCQl2bWEgPSBmaW5k
X3ZtYV9pbnRlcnNlY3Rpb24obW0sIHN0YXJ0LCBzdGFydCArIDEpOwotCX0gd2hpbGUgKHZtYSAm
JiB2bWEtPnZtX2ZsYWdzICYgKFZNX0lPIHwgVk1fUEZOTUFQKSk7CisJfSB3aGlsZSAocmV0IDwg
bnJfZnJhbWVzKTsKIG91dDoKLQlpZiAobG9ja2VkKQotCQltbWFwX3JlYWRfdW5sb2NrKG1tKTsK
KwltbWFwX3JlYWRfdW5sb2NrKG1tKTsKK291dF91bmxvY2tlZDoKIAlpZiAoIXJldCkKIAkJcmV0
ID0gLUVGQVVMVDsKIAlpZiAocmV0ID4gMCkKLS0gCjIuMjguMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
