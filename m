Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 517C110FC05
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 11:49:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 741146E057;
	Tue,  3 Dec 2019 10:49:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52DFB6E057
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 10:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 6BD9B3F54F;
 Tue,  3 Dec 2019 11:49:10 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OjqnXakQPOto; Tue,  3 Dec 2019 11:49:09 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id D6A713F522;
 Tue,  3 Dec 2019 11:49:05 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 264A1360305;
 Tue,  3 Dec 2019 11:49:05 +0100 (CET)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/2] mm,
 drm/ttm: Fix pte insertion with customized protection
Date: Tue,  3 Dec 2019 11:48:51 +0100
Message-Id: <20191203104853.4378-1-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1575370145; bh=gEAWX3bxsQ+0DHZpNEnqkkzzmaYw0NCL+IkRobqSyPI=;
 h=From:To:Cc:Subject:Date:From;
 b=YDgmWrLHazoWCTxOBvFDT6YYiOt3VqND08Ox4WddOwx8Zs1Hm+7/ziYe9GwwG2Kks
 PYN3/eYXPiW2jeRKgEBgtcErKrMUiGw07ZmWnz6q289jJ862I863onkb6m/31nuKi6
 V7eo6l9g14JJKrszmFt4WXw3FbA9NYdJCZRSHldw=
X-Mailman-Original-Authentication-Results: pio-pvt-msa1.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="YDgmWrLH";
 dkim-atps=neutral
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, Michal Hocko <mhocko@suse.com>,
 pv-drivers@vmware.com, Ralph Campbell <rcampbell@nvidia.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-graphics-maintainer@vmware.com,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgoKVGhlIGRybS90
dG0gbW9kdWxlIGlzIHVzaW5nIGEgbW9kaWZpZWQgb24tc3RhY2sgY29weSBvZiB0aGUKc3RydWN0
IHZtX2FyZWFfc3RydWN0IHRvIGJlIGFibGUgdG8gc2V0IGEgcGFnZSBwcm90ZWN0aW9uIHdpdGgg
Y3VzdG9taXplZApjYWNoaW5nLiBGaXggdGhhdCBieSBhZGRpbmcgYSB2bWZfaW5zZXJ0X21peGVk
X3Byb3QoKSBmdW5jdGlvbiBzaW1pbGFyCnRvIHRoZSBleGlzdGluZyB2bWZfaW5zZXJ0X3Bmbl9w
cm90KCkgZm9yIHVzZSB3aXRoIGRybS90dG0uCgpJJ2QgbGlrZSB0byBtZXJnZSB0aGlzIHRocm91
Z2ggYSBkcm0gdHJlZS4KCkNoYW5nZXMgc2luY2UgdjE6CiopIEZvcm1hdHRpbmcgZml4ZXMgaW4g
cGF0Y2ggMQoqKSBVcGRhdGVkIGNvbW1pdCBtZXNzYWdlIG9mIHBhdGNoIDIuCgpUaG9tYXMgSGVs
bHN0cm9tICgyKToKICBtbTogQWRkIGFuZCBleHBvcnQgdm1mX2luc2VydF9taXhlZF9wcm90KCkK
ICBkcm0vdHRtOiBGaXggdm0gcGFnZSBwcm90ZWN0aW9uIGhhbmRsaW5nCgogZHJpdmVycy9ncHUv
ZHJtL3R0bS90dG1fYm9fdm0uYyB8IDE0ICsrKysrKystLS0tLS0tCiBpbmNsdWRlL2xpbnV4L21t
LmggICAgICAgICAgICAgIHwgIDIgKysKIG1tL21lbW9yeS5jICAgICAgICAgICAgICAgICAgICAg
fCAxNSArKysrKysrKysrKy0tLS0KIDMgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwg
MTEgZGVsZXRpb25zKC0pCgpDYzogQW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0aW9u
Lm9yZz4KQ2M6IE1pY2hhbCBIb2NrbyA8bWhvY2tvQHN1c2UuY29tPgpDYzogIk1hdHRoZXcgV2ls
Y294IChPcmFjbGUpIiA8d2lsbHlAaW5mcmFkZWFkLm9yZz4KQ2M6ICJLaXJpbGwgQS4gU2h1dGVt
b3YiIDxraXJpbGwuc2h1dGVtb3ZAbGludXguaW50ZWwuY29tPgpDYzogUmFscGggQ2FtcGJlbGwg
PHJjYW1wYmVsbEBudmlkaWEuY29tPgpDYzogIkrDqXLDtG1lIEdsaXNzZSIgPGpnbGlzc2VAcmVk
aGF0LmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29t
PgoKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
