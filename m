Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A1A2B94FC
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 15:42:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC1426E584;
	Thu, 19 Nov 2020 14:42:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 497E16E56A
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 14:42:07 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id c198so5534135wmd.0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 06:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BPpebch13YhiVnp0IIh0dviRE5BWGvg35r91rkcoUQ8=;
 b=ELbdBqB1EG22+DBZ236+jEYDLfaFG6cJxXjlIUTtjFkWJvA2aVBEoWS6IWrzxkmMsM
 CKByNISsBPBMATDUKMI7TEyj+1CLhDXRFwJA6/fSlSU1BhAJ2SWX+N/6DB9tHtFqLkw5
 FshKvlR41ZRkC2VvtrUC1WkZ8BWFL13fuLpBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BPpebch13YhiVnp0IIh0dviRE5BWGvg35r91rkcoUQ8=;
 b=YfWgQf3+Q/FBRbi6NIBth1B2th6FfKuRb4E9ADfiC7NtdFicq8iukdmFXt7SREGqtx
 oMvC+HX4QPxnNT4qICKET0n4V4IQnYmkWqZ9li20WH3Rdz4hhWQwrDW8FA20KGut+OId
 WkAWeN5M/H57iBKeqf8PVlDmRfEuGVa1VCZra5qLBZn0fEqvgsA/TpILitQmbga6QB2L
 KmiDVFft9MZ6kjwL8z9tQ6WG731wOw9okjpNRmeMEen5ydn3/xhhGFjkrzjfC3yShqB7
 KjZHD/w2d3t02wk9ShMvuoFHnKlSggy2N7pCb7Uu05semBw2i5U+lztvUXNzn0tyY2Kq
 dEnA==
X-Gm-Message-State: AOAM5317M9e4PeP+s53FRMsfseGo1dZSUKh27Gnh3Jmbb/DHiE9pRg45
 quGVNlel3FRum4XXRb2WLG7kBzSypy616g==
X-Google-Smtp-Source: ABdhPJzMPF18M0N+DMnBEmqMSs9nBuEKzZXNbWRMjp078DW1AZEBSH3uKLChga62boFb4JqdftRhGA==
X-Received: by 2002:a1c:1c3:: with SMTP id 186mr4901772wmb.39.1605796925671;
 Thu, 19 Nov 2020 06:42:05 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x63sm51292wmb.48.2020.11.19.06.42.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 06:42:04 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 09/17] media/videbuf1|2: Mark follow_pfn usage as unsafe
Date: Thu, 19 Nov 2020 15:41:38 +0100
Message-Id: <20201119144146.1045202-10-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201119144146.1045202-1-daniel.vetter@ffwll.ch>
References: <20201119144146.1045202-1-daniel.vetter@ffwll.ch>
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
Cc: Jan Kara <jack@suse.cz>, kvm@vger.kernel.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-mm@kvack.org,
 Daniel Vetter <daniel.vetter@intel.com>, Michel Lespinasse <walken@google.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Daniel Jordan <daniel.m.jordan@oracle.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Pawel Osciak <pawel@osciak.com>,
 John Hubbard <jhubbard@nvidia.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Laurent Dufour <ldufour@linux.ibm.com>, Vlastimil Babka <vbabka@suse.cz>,
 Tomasz Figa <tfiga@chromium.org>, Kyungmin Park <kyungmin.park@samsung.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIG1lZGlhIG1vZGVsIGFzc3VtZXMgdGhhdCBidWZmZXJzIGFyZSBhbGwgcHJlYWxsb2NhdGVk
LCBzbyB0aGF0CndoZW4gYSBtZWRpYSBwaXBlbGluZSBpcyBydW5uaW5nIHdlIG5ldmVyIG1pc3Mg
YSBkZWFkbGluZSBiZWNhdXNlIHRoZQpidWZmZXJzIGFyZW4ndCBhbGxvY2F0ZWQgb3IgYXZhaWxh
YmxlLgoKVGhpcyBtZWFucyB3ZSBjYW5ub3QgZml4IHRoZSB2NGwgZm9sbG93X3BmbiB1c2FnZSB0
aHJvdWdoCm1tdV9ub3RpZmllciwgd2l0aG91dCBicmVha2luZyBob3cgdGhpcyBhbGwgd29ya3Mu
IFRoZSBvbmx5IHJlYWwgZml4CmlzIHRvIGRlcHJlY2F0ZSB1c2VycHRyIHN1cHBvcnQgZm9yIFZN
X0lPIHwgVk1fUEZOTUFQIG1hcHBpbmdzIGFuZAp0ZWxsIGV2ZXJ5b25lIHRvIGN1dCBvdmVyIHRv
IGRtYS1idWYgbWVtb3J5IHNoYXJpbmcgZm9yIHplcm9jb3B5LgoKdXNlcnB0ciBmb3Igbm9ybWFs
IG1lbW9yeSB3aWxsIGtlZXAgd29ya2luZyBhcy1pcywgdGhpcyBvbmx5IGFmZmVjdHMKdGhlIHpl
cm9jb3B5IHVzZXJwdHIgdXNhZ2UgZW5hYmxlZCBpbiA1MGFjOTUyZDIyNjMgKCJbbWVkaWFdCnZp
ZGVvYnVmMi1kbWEtc2c6IFN1cHBvcnQgaW8gdXNlcnB0ciBvcGVyYXRpb25zIG9uIGlvIG1lbW9y
eSIpLgoKQWNrZWQtYnk6IFRvbWFzeiBGaWdhIDx0ZmlnYUBjaHJvbWl1bS5vcmc+ClNpZ25lZC1v
ZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgpDYzogSmFzb24g
R3VudGhvcnBlIDxqZ2dAemllcGUuY2E+CkNjOiBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVt
Lm9yZz4KQ2M6IERhbiBXaWxsaWFtcyA8ZGFuLmoud2lsbGlhbXNAaW50ZWwuY29tPgpDYzogQW5k
cmV3IE1vcnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4KQ2M6IEpvaG4gSHViYmFyZCA8
amh1YmJhcmRAbnZpZGlhLmNvbT4KQ2M6IErDqXLDtG1lIEdsaXNzZSA8amdsaXNzZUByZWRoYXQu
Y29tPgpDYzogSmFuIEthcmEgPGphY2tAc3VzZS5jej4KQ2M6IERhbiBXaWxsaWFtcyA8ZGFuLmou
d2lsbGlhbXNAaW50ZWwuY29tPgpDYzogbGludXgtbW1Aa3ZhY2sub3JnCkNjOiBsaW51eC1hcm0t
a2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKQ2M6IGxpbnV4LXNhbXN1bmctc29jQHZnZXIua2Vy
bmVsLm9yZwpDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCkNjOiBQYXdlbCBPc2NpYWsg
PHBhd2VsQG9zY2lhay5jb20+CkNjOiBNYXJlayBTenlwcm93c2tpIDxtLnN6eXByb3dza2lAc2Ft
c3VuZy5jb20+CkNjOiBLeXVuZ21pbiBQYXJrIDxreXVuZ21pbi5wYXJrQHNhbXN1bmcuY29tPgpD
YzogVG9tYXN6IEZpZ2EgPHRmaWdhQGNocm9taXVtLm9yZz4KQ2M6IExhdXJlbnQgRHVmb3VyIDxs
ZHVmb3VyQGxpbnV4LmlibS5jb20+CkNjOiBWbGFzdGltaWwgQmFia2EgPHZiYWJrYUBzdXNlLmN6
PgpDYzogRGFuaWVsIEpvcmRhbiA8ZGFuaWVsLm0uam9yZGFuQG9yYWNsZS5jb20+CkNjOiBNaWNo
ZWwgTGVzcGluYXNzZSA8d2Fsa2VuQGdvb2dsZS5jb20+ClNpZ25lZC1vZmYtYnk6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Ci0tCnYzOgotIFJlZmVyZW5jZSB0aGUgY29t
bWl0IHRoYXQgZW5hYmxlZCB0aGUgemVyb2NvcHkgdXNlcnB0ciB1c2UgY2FzZSB0bwogIG1ha2Ug
aXQgYWJ1bmRhbmR0bHkgY2xlYXIgdGhhdCB0aGlzIHBhdGNoIG9ubHkgYWZmZWN0cyB0aGF0LCBh
bmQgbm90CiAgbm9ybWFsIG1lbW9yeSB1c2VycHRyLiBUaGUgb2xkIGNvbW1pdCBtZXNzYWdlIGFs
cmVhZHkgZXhwbGFpbmVkIHRoYXQKICBub3JtYWwgbWVtb3J5IHVzZXJwdHIgaXMgdW5hZmZlY3Rl
ZCwgYnV0IEkgZ3Vlc3MgdGhhdCB3YXMgbm90IGNsZWFyCiAgZW5vdWdoLgotLS0KIGRyaXZlcnMv
bWVkaWEvY29tbW9uL3ZpZGVvYnVmMi9mcmFtZV92ZWN0b3IuYyB8IDIgKy0KIGRyaXZlcnMvbWVk
aWEvdjRsMi1jb3JlL3ZpZGVvYnVmLWRtYS1jb250aWcuYyB8IDIgKy0KIDIgZmlsZXMgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bWVkaWEvY29tbW9uL3ZpZGVvYnVmMi9mcmFtZV92ZWN0b3IuYyBiL2RyaXZlcnMvbWVkaWEvY29t
bW9uL3ZpZGVvYnVmMi9mcmFtZV92ZWN0b3IuYwppbmRleCBhMGU2NTQ4MWEyMDEuLjFhODJlYzEz
ZWEwMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9tZWRpYS9jb21tb24vdmlkZW9idWYyL2ZyYW1lX3Zl
Y3Rvci5jCisrKyBiL2RyaXZlcnMvbWVkaWEvY29tbW9uL3ZpZGVvYnVmMi9mcmFtZV92ZWN0b3Iu
YwpAQCAtNzAsNyArNzAsNyBAQCBpbnQgZ2V0X3ZhZGRyX2ZyYW1lcyh1bnNpZ25lZCBsb25nIHN0
YXJ0LCB1bnNpZ25lZCBpbnQgbnJfZnJhbWVzLAogCQkJYnJlYWs7CiAKIAkJd2hpbGUgKHJldCA8
IG5yX2ZyYW1lcyAmJiBzdGFydCArIFBBR0VfU0laRSA8PSB2bWEtPnZtX2VuZCkgewotCQkJZXJy
ID0gZm9sbG93X3Bmbih2bWEsIHN0YXJ0LCAmbnVtc1tyZXRdKTsKKwkJCWVyciA9IHVuc2FmZV9m
b2xsb3dfcGZuKHZtYSwgc3RhcnQsICZudW1zW3JldF0pOwogCQkJaWYgKGVycikgewogCQkJCWlm
IChyZXQgPT0gMCkKIAkJCQkJcmV0ID0gZXJyOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS92
NGwyLWNvcmUvdmlkZW9idWYtZG1hLWNvbnRpZy5jIGIvZHJpdmVycy9tZWRpYS92NGwyLWNvcmUv
dmlkZW9idWYtZG1hLWNvbnRpZy5jCmluZGV4IDUyMzEyY2UyYmEwNS4uODIxYzRhNzZhYjk2IDEw
MDY0NAotLS0gYS9kcml2ZXJzL21lZGlhL3Y0bDItY29yZS92aWRlb2J1Zi1kbWEtY29udGlnLmMK
KysrIGIvZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdmlkZW9idWYtZG1hLWNvbnRpZy5jCkBAIC0x
ODMsNyArMTgzLDcgQEAgc3RhdGljIGludCB2aWRlb2J1Zl9kbWFfY29udGlnX3VzZXJfZ2V0KHN0
cnVjdCB2aWRlb2J1Zl9kbWFfY29udGlnX21lbW9yeSAqbWVtLAogCXVzZXJfYWRkcmVzcyA9IHVu
dGFnZ2VkX2JhZGRyOwogCiAJd2hpbGUgKHBhZ2VzX2RvbmUgPCAobWVtLT5zaXplID4+IFBBR0Vf
U0hJRlQpKSB7Ci0JCXJldCA9IGZvbGxvd19wZm4odm1hLCB1c2VyX2FkZHJlc3MsICZ0aGlzX3Bm
bik7CisJCXJldCA9IHVuc2FmZV9mb2xsb3dfcGZuKHZtYSwgdXNlcl9hZGRyZXNzLCAmdGhpc19w
Zm4pOwogCQlpZiAocmV0KQogCQkJYnJlYWs7CiAKLS0gCjIuMjkuMgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
