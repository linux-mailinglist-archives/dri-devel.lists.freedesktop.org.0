Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 073BA6025B
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 10:41:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 925816E42E;
	Fri,  5 Jul 2019 08:41:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1358 seconds by postgrey-1.36 at gabe;
 Thu, 04 Jul 2019 16:00:53 UTC
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 687026E35F
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 16:00:53 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=flow.W.breakpoint.cc)
 by Galois.linutronix.de with esmtp (Exim 4.80)
 (envelope-from <bigeasy@linutronix.de>)
 id 1hj3oG-0004wg-2E; Thu, 04 Jul 2019 17:38:08 +0200
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] drm/vgem: Use spinlock_t instead of struct spinlock
Date: Thu,  4 Jul 2019 17:37:59 +0200
Message-Id: <20190704153803.12739-4-bigeasy@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190704153803.12739-1-bigeasy@linutronix.de>
References: <20190704153803.12739-1-bigeasy@linutronix.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 05 Jul 2019 08:41:20 +0000
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 tglx@linutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rm9yIHNwaW5sb2NrcyB0aGUgdHlwZSBzcGlubG9ja190IHNob3VsZCBiZSB1c2VkIGluc3RlYWQg
b2YgInN0cnVjdApzcGlubG9jayIuCgpVc2Ugc3BpbmxvY2tfdCBmb3Igc3BpbmxvY2sncyBkZWZp
bml0aW9uLgoKQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKU2lnbmVkLW9mZi1ieTogU2ViYXN0aWFuIEFuZHJ6ZWogU2lld2lvciA8YmlnZWFzeUBsaW51
dHJvbml4LmRlPgotLS0KIGRyaXZlcnMvZ3B1L2RybS92Z2VtL3ZnZW1fZmVuY2UuYyB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS92Z2VtL3ZnZW1fZmVuY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS92
Z2VtL3ZnZW1fZmVuY2UuYwppbmRleCBlYjE3YzBjZDM3MjdhLi40YjBiN2Q2MWJhYzk2IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmdlbS92Z2VtX2ZlbmNlLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL3ZnZW0vdmdlbV9mZW5jZS5jCkBAIC0yOSw3ICsyOSw3IEBACiAKIHN0cnVjdCB2Z2Vt
X2ZlbmNlIHsKIAlzdHJ1Y3QgZG1hX2ZlbmNlIGJhc2U7Ci0Jc3RydWN0IHNwaW5sb2NrIGxvY2s7
CisJc3BpbmxvY2tfdCBsb2NrOwogCXN0cnVjdCB0aW1lcl9saXN0IHRpbWVyOwogfTsKIAotLSAK
Mi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
