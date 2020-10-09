Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4752288458
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 10:00:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CC836EC80;
	Fri,  9 Oct 2020 08:00:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A0B06ECA5
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 08:00:11 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id j2so9240343wrx.7
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Oct 2020 01:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mkr+QLHrHRyzDeEuLV6zjmHQ3ublwStz21KQT1DOayM=;
 b=GGX55N304bFNQXT7vE1ggs1hCrNO4kTCwZL12SxHZag0+p+9wIk4MXiU4skay+LXim
 49xSp0FO/9WgeR/sK6Fi90U35plzqw+Vb29HBAZuQNOnvJt3IwmsbNCeAFjlMohevOl4
 MeSmpBQPKt0omjgQbvLdsGQUrxbNL/9LDoUKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mkr+QLHrHRyzDeEuLV6zjmHQ3ublwStz21KQT1DOayM=;
 b=isYh3zHsdb+R8trK/Sv/67W0a16T34/zLBQmWieLPVUBS9sAv41oUcCI8FJwFHCOzs
 8EPi4NvW5xj2ntXebhjPiabXrGQU+OyP6pEHl0Ju7jeFGk2pRxKjvs4CxuCL3eJGAYXi
 EEQ2gl9fcyt0X6f+PBaEz+EES3C1pon5/gMORTPTOzT499FpCAJDhYVb4pL0PmZdvj8X
 q30o25PzxBQF+iFb6FeJ4nLcdimuxXYe5Be07F2lRULZJxdBeMZfzzfQS5JemFd1MoE0
 9V7hBA4qhhMoUXg11A7I6Sm9ryqb6sOYlrGFJUGT/MGCwDO6YJsowLMHG8F7EyCfzlX0
 ioMQ==
X-Gm-Message-State: AOAM531FkBqALFAGxPysEs2MP25eNOcYv+HMI3zCz+iybG/1QALg4pk4
 ObO+62vky0kA2A8NsMaLWq496bbu7kKXyB7j
X-Google-Smtp-Source: ABdhPJyDv2qPX/s1a3mWcZq1GdiuGUlSH1qbeC8CG58tJ0NKdoFcESH1X88ElvgtpyqLXEEr3X8XWQ==
X-Received: by 2002:adf:d841:: with SMTP id k1mr13481898wrl.227.1602230409528; 
 Fri, 09 Oct 2020 01:00:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u17sm11634118wri.45.2020.10.09.01.00.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2020 01:00:08 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 12/17] PCI: Obey iomem restrictions for procfs mmap
Date: Fri,  9 Oct 2020 09:59:29 +0200
Message-Id: <20201009075934.3509076-13-daniel.vetter@ffwll.ch>
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
 Jan Kara <jack@suse.cz>, Kees Cook <keescook@chromium.org>,
 kvm@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-pci@vger.kernel.org,
 linux-mm@kvack.org, =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 John Hubbard <jhubbard@nvidia.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlcmUncyB0aHJlZSB3YXlzIHRvIGFjY2VzcyBQQ0kgQkFScyBmcm9tIHVzZXJzcGFjZTogL2Rl
di9tZW0sIHN5c2ZzCmZpbGVzLCBhbmQgdGhlIG9sZCBwcm9jIGludGVyZmFjZS4gVHdvIGNoZWNr
IGFnYWluc3QKaW9tZW1faXNfZXhjbHVzaXZlLCBwcm9jIG5ldmVyIGRpZC4gQW5kIHdpdGggQ09O
RklHX0lPX1NUUklDVF9ERVZNRU0sCnRoaXMgc3RhcnRzIHRvIG1hdHRlciwgc2luY2Ugd2UgZG9u
J3Qgd2FudCByYW5kb20gdXNlcnNwYWNlIGhhdmluZwphY2Nlc3MgdG8gUENJIEJBUnMgd2hpbGUg
YSBkcml2ZXIgaXMgbG9hZGVkIGFuZCB1c2luZyBpdC4KCkZpeCB0aGlzIGJ5IGFkZGluZyB0aGUg
c2FtZSBpb21lbV9pc19leGNsdXNpdmUoKSBjaGVjayB3ZSBhbHJlYWR5IGhhdmUKb24gdGhlIHN5
c2ZzIHNpZGUgaW4gcGNpX21tYXBfcmVzb3VyY2UoKS4KClJlZmVyZW5jZXM6IDkwYTU0NWU5ODEy
NiAoInJlc3RyaWN0IC9kZXYvbWVtIHRvIGlkbGUgaW8gbWVtb3J5IHJhbmdlcyIpClNpZ25lZC1v
ZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgpDYzogSmFzb24g
R3VudGhvcnBlIDxqZ2dAemllcGUuY2E+CkNjOiBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVt
Lm9yZz4KQ2M6IERhbiBXaWxsaWFtcyA8ZGFuLmoud2lsbGlhbXNAaW50ZWwuY29tPgpDYzogQW5k
cmV3IE1vcnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4KQ2M6IEpvaG4gSHViYmFyZCA8
amh1YmJhcmRAbnZpZGlhLmNvbT4KQ2M6IErDqXLDtG1lIEdsaXNzZSA8amdsaXNzZUByZWRoYXQu
Y29tPgpDYzogSmFuIEthcmEgPGphY2tAc3VzZS5jej4KQ2M6IERhbiBXaWxsaWFtcyA8ZGFuLmou
d2lsbGlhbXNAaW50ZWwuY29tPgpDYzogbGludXgtbW1Aa3ZhY2sub3JnCkNjOiBsaW51eC1hcm0t
a2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKQ2M6IGxpbnV4LXNhbXN1bmctc29jQHZnZXIua2Vy
bmVsLm9yZwpDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCkNjOiBCam9ybiBIZWxnYWFz
IDxiaGVsZ2Fhc0Bnb29nbGUuY29tPgpDYzogbGludXgtcGNpQHZnZXIua2VybmVsLm9yZwotLQp2
MjogSW1wcm92ZSBjb21taXQgbWVzc2FnZSAoQmpvcm4pCi0tLQogZHJpdmVycy9wY2kvcHJvYy5j
IHwgNSArKysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvcGNpL3Byb2MuYyBiL2RyaXZlcnMvcGNpL3Byb2MuYwppbmRleCBkMzUxODZiMDFk
OTguLjNhMmY5MGJlYjRjYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9wY2kvcHJvYy5jCisrKyBiL2Ry
aXZlcnMvcGNpL3Byb2MuYwpAQCAtMjc0LDYgKzI3NCwxMSBAQCBzdGF0aWMgaW50IHByb2NfYnVz
X3BjaV9tbWFwKHN0cnVjdCBmaWxlICpmaWxlLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkK
IAkJZWxzZQogCQkJcmV0dXJuIC1FSU5WQUw7CiAJfQorCisJaWYgKGRldi0+cmVzb3VyY2VbaV0u
ZmxhZ3MgJiBJT1JFU09VUkNFX01FTSAmJgorCSAgICBpb21lbV9pc19leGNsdXNpdmUoZGV2LT5y
ZXNvdXJjZVtpXS5zdGFydCkpCisJCXJldHVybiAtRUlOVkFMOworCiAJcmV0ID0gcGNpX21tYXBf
cGFnZV9yYW5nZShkZXYsIGksIHZtYSwKIAkJCQkgIGZwcml2LT5tbWFwX3N0YXRlLCB3cml0ZV9j
b21iaW5lKTsKIAlpZiAocmV0IDwgMCkKLS0gCjIuMjguMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
