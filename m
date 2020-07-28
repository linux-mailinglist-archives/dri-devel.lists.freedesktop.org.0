Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E60A230BE7
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 15:58:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 654AD6E2DA;
	Tue, 28 Jul 2020 13:58:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C91189227
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 13:58:47 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id d190so778815wmd.4
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 06:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LTjUuKu28q4AP2apkOdAzx1cK7jJDnTHDeP/9uZly44=;
 b=KqeArdqygfldyaA4gJRiGfTgCwK4wgPCAMC7uombuUYQ1buL6zCp8yoRWk5H+Vp2qt
 M36J4wt9gCrJShAOCDVpPvxoVn5Osk7fRw15JUm/WE0gwcmaIwLFFiYS3d0f5MnFSxq/
 iQOkoFGM5zyBIuGT0vXj0lazqprYYPD+oNhM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LTjUuKu28q4AP2apkOdAzx1cK7jJDnTHDeP/9uZly44=;
 b=GfuGO1/FpJ/D47Q16I0AiOApfO/oQT4ptAd4H8zQKD2dmh5xOTAGlAhIjMalwTfqDs
 nsjyS5WrFQLkk4qEetxXafvuEqh2Hcd/tHfMkoimYmXNAGfk5rZ2bDaJd3D93X1PNexu
 ardBmP8TJnmZ8xdQ+BUKYorZjqqMEAluKnGJ/HjU3FENslsmjWctR5ol4NaQbXkLC4M6
 P1CSuWvUrAY6hNQAiJufBmssY93NALJOVZ2Kh7gwszI9gS30CHJxmh9GJsAKvqjX26Nr
 H4BNqRDXpSmrX55gH/mGA9IrkwDUjgm9snLqYZUqFMCpcQmRqacveVXCRSSFssoEBVVx
 bcfQ==
X-Gm-Message-State: AOAM533UkyzY3iKhfxeKmm7lGnt64YNU+Y+BgylpiDS46zd2MgeW51da
 tlgzKC4lBplz+Y2omSRjAtgzNMlq5Yw=
X-Google-Smtp-Source: ABdhPJzN7u/m6RCqY38cX52hSfOrqIs4C8PfjuXHcoP5UoM1XsD3zH2RZL3E9SBC/M2256p1vsiwQw==
X-Received: by 2002:a7b:c403:: with SMTP id k3mr4097843wmi.35.1595944725621;
 Tue, 28 Jul 2020 06:58:45 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q6sm4505414wma.22.2020.07.28.06.58.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 06:58:44 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] dma-resv: lockdep-prime address_space->i_mmap_rwsem for
 dma-resv
Date: Tue, 28 Jul 2020 15:58:39 +0200
Message-Id: <20200728135839.1035515-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.27.0
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
Cc: linux-xfs@vger.kernel.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas_os@shipmail.org>,
 linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Dave Chinner <david@fromorbit.com>, linaro-mm-sig@lists.linaro.org,
 linux-mm@kvack.org, Jason Gunthorpe <jgg@mellanox.com>, Qian Cai <cai@lca.pw>,
 linux-fsdevel@vger.kernel.org, Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

R1BVIGRyaXZlcnMgbmVlZCB0aGlzIGluIHRoZWlyIHNocmlua2VycywgdG8gYmUgYWJsZSB0byB0
aHJvdyBvdXQKbW1hcCdlZCBidWZmZXJzLiBOb3RlIHRoYXQgd2UgYWxzbyBuZWVkIGRtYV9yZXN2
X2xvY2sgaW4gc2hyaW5rZXJzLApidXQgdGhhdCBsb29wIGlzIHJlc29sdmVkIGJ5IHRyeWxvY2tp
bmcgaW4gc2hyaW5rZXJzLgoKU28gZnVsbCBoaWVyYXJjaHkgaXMgbm93IChpZ25vcmUgc29tZSBv
ZiB0aGUgb3RoZXIgYnJhbmNoZXMgd2UgYWxyZWFkeQpoYXZlIHByaW1lZCk6CgptbWFwX3JlYWRf
bG9jayAtPiBkbWFfcmVzdiAtPiBzaHJpbmtlcnMgLT4gaV9tbWFwX2xvY2tfd3JpdGUKCkkgaG9w
ZSB0aGF0J3Mgbm90IGluY29uc2lzdGVudCB3aXRoIGFueXRoaW5nIG1tIG9yIGZzIGRvZXMsIGFk
ZGluZwpyZWxldmFudCBwZW9wbGUuCgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWwudmV0dGVyQGludGVsLmNvbT4KQ2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFy
by5vcmc+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4K
Q2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwpDYzogbGluYXJvLW1tLXNpZ0BsaXN0cy5s
aW5hcm8ub3JnCkNjOiBEYXZlIENoaW5uZXIgPGRhdmlkQGZyb21vcmJpdC5jb20+CkNjOiBRaWFu
IENhaSA8Y2FpQGxjYS5wdz4KQ2M6IGxpbnV4LXhmc0B2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbnV4
LWZzZGV2ZWxAdmdlci5rZXJuZWwub3JnCkNjOiBUaG9tYXMgSGVsbHN0csO2bSAoSW50ZWwpIDx0
aG9tYXNfb3NAc2hpcG1haWwub3JnPgpDYzogQW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51eC1mb3Vu
ZGF0aW9uLm9yZz4KQ2M6IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KQ2M6IGxp
bnV4LW1tQGt2YWNrLm9yZwpDYzogbGludXgtcmRtYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IE1hYXJ0
ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Ci0tLQogZHJp
dmVycy9kbWEtYnVmL2RtYS1yZXN2LmMgfCA1ICsrKysrCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEtYnVmL2RtYS1yZXN2LmMgYi9kcml2
ZXJzL2RtYS1idWYvZG1hLXJlc3YuYwppbmRleCAwZTY2NzVlYzFkMTEuLjk2NzgxNjJhNGFjNSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9kbWEtYnVmL2RtYS1yZXN2LmMKKysrIGIvZHJpdmVycy9kbWEt
YnVmL2RtYS1yZXN2LmMKQEAgLTEwNCwxMiArMTA0LDE0IEBAIHN0YXRpYyBpbnQgX19pbml0IGRt
YV9yZXN2X2xvY2tkZXAodm9pZCkKIAlzdHJ1Y3QgbW1fc3RydWN0ICptbSA9IG1tX2FsbG9jKCk7
CiAJc3RydWN0IHd3X2FjcXVpcmVfY3R4IGN0eDsKIAlzdHJ1Y3QgZG1hX3Jlc3Ygb2JqOworCXN0
cnVjdCBhZGRyZXNzX3NwYWNlIG1hcHBpbmc7CiAJaW50IHJldDsKIAogCWlmICghbW0pCiAJCXJl
dHVybiAtRU5PTUVNOwogCiAJZG1hX3Jlc3ZfaW5pdCgmb2JqKTsKKwlhZGRyZXNzX3NwYWNlX2lu
aXRfb25jZSgmbWFwcGluZyk7CiAKIAltbWFwX3JlYWRfbG9jayhtbSk7CiAJd3dfYWNxdWlyZV9p
bml0KCZjdHgsICZyZXNlcnZhdGlvbl93d19jbGFzcyk7CkBAIC0xMTcsNiArMTE5LDkgQEAgc3Rh
dGljIGludCBfX2luaXQgZG1hX3Jlc3ZfbG9ja2RlcCh2b2lkKQogCWlmIChyZXQgPT0gLUVERUFE
TEspCiAJCWRtYV9yZXN2X2xvY2tfc2xvdygmb2JqLCAmY3R4KTsKIAlmc19yZWNsYWltX2FjcXVp
cmUoR0ZQX0tFUk5FTCk7CisJLyogZm9yIHVubWFwX21hcHBpbmdfcmFuZ2Ugb24gdHJ5bG9ja2Vk
IGJ1ZmZlciBvYmplY3RzIGluIHNocmlua2VycyAqLworCWlfbW1hcF9sb2NrX3dyaXRlKCZtYXBw
aW5nKTsKKwlpX21tYXBfdW5sb2NrX3dyaXRlKCZtYXBwaW5nKTsKICNpZmRlZiBDT05GSUdfTU1V
X05PVElGSUVSCiAJbG9ja19tYXBfYWNxdWlyZSgmX19tbXVfbm90aWZpZXJfaW52YWxpZGF0ZV9y
YW5nZV9zdGFydF9tYXApOwogCV9fZG1hX2ZlbmNlX21pZ2h0X3dhaXQoKTsKLS0gCjIuMjcuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
