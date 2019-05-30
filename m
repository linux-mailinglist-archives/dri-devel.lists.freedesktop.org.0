Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FC52F95B
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2019 11:25:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D12C66E13A;
	Thu, 30 May 2019 09:25:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 677BD6E13A;
 Thu, 30 May 2019 09:25:04 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 May 2019 02:25:03 -0700
Received: from jkrzyszt-desk.igk.intel.com ([172.22.244.18])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 May 2019 02:25:01 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 0/1] drm/i915: Split off pci_driver.remove() tail to
 drm_driver.release()
Date: Thu, 30 May 2019 11:24:25 +0200
Message-Id: <20190530092426.23880-1-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpJIGRvIHJlYWxpemUgbW9yZSB3b3JrIG5lZWRzIHRvIGJlIGRvbmUgdG8gZ2V0IGEgY2xl
YW4gaG90dW5wbHVnCnNvbHV0aW9uLCBob3dldmVyIEkgbmVlZCB5b3VyIGNvbW1lbnRzIHRvIG1h
a2Ugc3VyZSB0aGF0IEknbSBnb2luZyBpbgp0aGUgcmlnaHQgZGlyZWN0aW9uLgoKU28gZmFyIEkg
aGF2ZSBubyBnb29kIGlkZWEgaG93IHRvIHJlc29sdmUgcG1fcnVudGltZV9nZXRfc3luYygpCmZh
aWx1cmVzIG9uIG91dHN0YW5kaW5nIGRldmljZSBmaWxlIGNsb3NlIGFmdGVyIHN1Y2Nlc3NmdWxs
IGRyaXZlcgp1bmJpbmQuCgpUaGFua3MsCkphbnVzegoKCkphbnVzeiBLcnp5c3p0b2ZpayAoMSk6
CiAgZHJtL2k5MTU6IFNwbGl0IG9mZiBwY2lfZHJpdmVyLnJlbW92ZSgpIHRhaWwgdG8gZHJtX2Ry
aXZlci5yZWxlYXNlKCkKCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2Rydi5jIHwgMTcgKysr
KysrKysrKysrKy0tLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZHJ2LmggfCAgMSArCiBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2dlbS5jIHwgMTAgKysrKysrKysrLQogMyBmaWxlcyBj
aGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKLS0gCjIuMjEuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
