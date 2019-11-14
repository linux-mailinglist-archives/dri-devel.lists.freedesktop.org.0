Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56134FC4C7
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 11:57:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2E716E799;
	Thu, 14 Nov 2019 10:56:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA1066E79D
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 10:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id DE9123F773;
 Thu, 14 Nov 2019 11:56:56 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LP8eKow9AsLK; Thu, 14 Nov 2019 11:56:55 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 9930D3F6C6;
 Thu, 14 Nov 2019 11:56:54 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 97FC536005B;
 Thu, 14 Nov 2019 11:56:54 +0100 (CET)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: dri-devel@lists.freedesktop.org,
	linux-graphics-maintainer@vmware.com
Subject: [PATCH 0/3] drm/vmwgfx: Clean- and fix up DMA mode selection
Date: Thu, 14 Nov 2019 11:56:42 +0100
Message-Id: <20191114105645.41578-1-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1573729014; bh=v6KqJMy82JykGwDV7E5pva3JTTHGJ7bSCussUy3mMh0=;
 h=From:To:Cc:Subject:Date:From;
 b=BqmH+ESZN05LPjOcob0EznCke02ybMBx3Sm0/+0ao8D9Jfb7zwFPJY1lMzOJzI6zw
 s+p9gByAn0al6vSLjsjOyMhPxvmXzY3ovzP7iVcJgzMWAhOEh2Wli8Eo7ZKC2Wicv9
 QABGBUQv78EJnMZbSe93E9KINFM74pYoXK8V7g18=
X-Mailman-Original-Authentication-Results: ste-pvt-msa1.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=BqmH+ESZ; 
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
Cc: Christoph Hellwig <hch@infradead.org>,
 Thomas Hellstrom <thomas_os@shipmail.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhvbWFzIEhlbGxzdHJvbSAoVk13YXJlKSA8dGhvbWFzX29zQHNoaXBtYWlsLm9yZz4K
CkNsZWFuIHVwIGFuZCBmaXggZG1hIG1vZGUgc2VsZWN0aW9uLiBXZSByZW1vdmUgYW4gdW51c2Vk
IG1vZGUsIGEgbGFyZ2VseQp1bnVzZWQgbW9kdWxlIG9wdGlvbiBhbmQgZmluYWxseSBhZGQgYSBj
aGVjayB0byBlbmFibGUgZG1hIGNvaGVyZW50IG1lbW9yeQppbiB0aG9zZSBjYXNlcyBzdHJlYW1p
bmcgZG1hIG1hcHBpbmdzIGFyZSB1bmRlc2lyZWQgb3Igd29uJ3Qgd29yay4KCk5vdGUgdGhhdCB0
aGlzIHNlcmllcyBpcyBpbnRlbmRlZCB0byBiZSBhcHBsaWVkIG9uIHRvcCBvZgpnaXQ6Ly9wZW9w
bGUuZnJlZWRlc2t0b3Aub3JnL350aG9tYXNoL2xpbnV4IGJyYW5jaCB2bXdnZngtbmV4dAoKbWVh
bmluZyB0aGF0IHRoZSB2bXdfZG1hX3NlbGVjdCBtb2RlIGZ1bmN0aW9uIHdvdWxkLCBhZnRlciBh
cHBseWluZyB0aGUgcGF0Y2hlcwpsb29rIGxpa2UKCnN0YXRpYyBpbnQgdm13X2RtYV9zZWxlY3Rf
bW9kZShzdHJ1Y3Qgdm13X3ByaXZhdGUgKmRldl9wcml2KQp7CglzdGF0aWMgY29uc3QgY2hhciAq
bmFtZXNbdm13X2RtYV9tYXBfbWF4XSA9IHsKCQlbdm13X2RtYV9hbGxvY19jb2hlcmVudF0gPSAi
VXNpbmcgY29oZXJlbnQgVFRNIHBhZ2VzLiIsCgkJW3Ztd19kbWFfbWFwX3BvcHVsYXRlXSA9ICJD
YWNoaW5nIERNQSBtYXBwaW5ncy4iLAoJCVt2bXdfZG1hX21hcF9iaW5kXSA9ICJHaXZpbmcgdXAg
RE1BIG1hcHBpbmdzIGVhcmx5LiJ9OwoKCS8qCgkgKiBkbWFfbWF4X21hcHBpbmdfc2l6ZSgpICE9
IFNJWkVfTUFYIG1lYW5zIHNvbWV0aGluZyBpcyBnb2luZwoJICogb24gaW4gdGhlIGRtYSBsYXll
ciB0aGF0IHRoZSBkbWFfbWFwX2JpbmQgb3IgZG1hX21hcF9wb3B1bGF0ZSBtb2RlcwoJICogYXJl
IG5vdCB3b3JraW5nIHdlbGwgd2l0aCwgb3IgaGF2ZW4ndCBiZWVuIHRlc3RlZCB3aXRoLgoJICog
VGhpcyB0eXBpY2FsbHkgaGFwcGVucyB3aGVuIHRoZSBTV0lPVExCIGlzIGFjdGl2ZS4gRmFsbCBi
YWNrIHRvCgkgKiBjb2hlcmVudCBtZW1vcnkgaW4gdGhvc2UgY2FzZXMuCgkgKi8KCWlmIChkbWFf
bWF4X21hcHBpbmdfc2l6ZShkZXZfcHJpdi0+ZGV2LT5kZXYpICE9IFNJWkVfTUFYIHx8CgkgICAg
dm13X2ZvcmNlX2NvaGVyZW50KQoJCWRldl9wcml2LT5tYXBfbW9kZSA9IHZtd19kbWFfYWxsb2Nf
Y29oZXJlbnQ7CgllbHNlIGlmICh2bXdfcmVzdHJpY3RfaW9tbXUpCgkJZGV2X3ByaXYtPm1hcF9t
b2RlID0gdm13X2RtYV9tYXBfYmluZDsKCWVsc2UKCQlkZXZfcHJpdi0+bWFwX21vZGUgPSB2bXdf
ZG1hX21hcF9wb3B1bGF0ZTsKCiAgICAgICAgaWYgKCFJU19FTkFCTEVEKENPTkZJR19EUk1fVFRN
X0RNQV9QQUdFX1BPT0wpICYmCgkgICAgKGRldl9wcml2LT5tYXBfbW9kZSA9PSB2bXdfZG1hX2Fs
bG9jX2NvaGVyZW50KSkKCQlyZXR1cm4gLUVJTlZBTDsKCglEUk1fSU5GTygiRE1BIG1hcCBtb2Rl
OiAlc1xuIiwgbmFtZXNbZGV2X3ByaXYtPm1hcF9tb2RlXSk7CglyZXR1cm4gMDsKfQoKQ2M6IENo
cmlzdG9waCBIZWxsd2lnIDxoY2hAaW5mcmFkZWFkLm9yZz4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
