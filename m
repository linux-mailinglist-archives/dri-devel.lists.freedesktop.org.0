Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCB19A9E4
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 10:14:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59AB46EC07;
	Fri, 23 Aug 2019 08:13:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A7F06EC06
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 08:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 0A61E3F68A;
 Fri, 23 Aug 2019 10:13:52 +0200 (CEST)
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
 with ESMTP id T7PH3aOuLSRB; Fri, 23 Aug 2019 10:13:51 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 2BF323F451;
 Fri, 23 Aug 2019 10:13:51 +0200 (CEST)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 06B6C3601BA;
 Fri, 23 Aug 2019 10:13:48 +0200 (CEST)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] input/vmmouse: Update the backdoor call with support
 for new instructions
Date: Fri, 23 Aug 2019 10:13:16 +0200
Message-Id: <20190823081316.28478-5-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190823081316.28478-1-thomas_os@shipmail.org>
References: <20190823081316.28478-1-thomas_os@shipmail.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1566548030; bh=bf3bgDS7rnVcI3U6BuhcDA3KRvdQihS9aNCGQctW+KM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Q/eSAhtK5fOH1WxHIBN7ZKCCbO2XagE1WgIkDHvNQ+NX1Oa34XS4+yJ97+p1hjxTz
 P44NfsISI+g6WRdU3K9tXV4Dx9P2DF//58T51HnsvKLHA3QjA4c0xNOwWs7p3G8YQF
 x09Jx2U26C6iGjY0ojOfWWzaza3kDrPHxdy27aqo=
X-Mailman-Original-Authentication-Results: ste-pvt-msa1.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=Q/eSAhtK; 
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, pv-drivers@vmware.com,
 x86@kernel.org, dri-devel@lists.freedesktop.org,
 Doug Covelli <dcovelli@vmware.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-graphics-maintainer@vmware.com, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgoKVXNlIHRoZSBk
ZWZpbml0aW9uIHByb3ZpZGVkIGJ5IGluY2x1ZGUvYXNtL3Ztd2FyZS5oCgpDQzogVGhvbWFzIEds
ZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+CkNjOiBJbmdvIE1vbG5hciA8bWluZ29AcmVkaGF0
LmNvbT4KQ2M6IEJvcmlzbGF2IFBldGtvdiA8YnBAYWxpZW44LmRlPgpDYzogIkguIFBldGVyIEFu
dmluIiA8aHBhQHp5dG9yLmNvbT4KQ2M6IDx4ODZAa2VybmVsLm9yZz4KQ2M6IDxkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnPgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgSGVsbHN0cm9tIDx0
aGVsbHN0cm9tQHZtd2FyZS5jb20+ClJldmlld2VkLWJ5OiBEb3VnIENvdmVsbGkgPGRjb3ZlbGxp
QHZtd2FyZS5jb20+CkFja2VkLWJ5OiBEbWl0cnkgVG9yb2tob3YgPGRtaXRyeS50b3Jva2hvdkBn
bWFpbC5jb20+Ci0tLQogZHJpdmVycy9pbnB1dC9tb3VzZS92bW1vdXNlLmMgfCA2ICsrKy0tLQog
MSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2lucHV0L21vdXNlL3ZtbW91c2UuYyBiL2RyaXZlcnMvaW5wdXQvbW91c2Uv
dm1tb3VzZS5jCmluZGV4IDg3MWU1YjVhYjEyOS4uMTQ4MjQ1YzY5YmU3IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2lucHV0L21vdXNlL3ZtbW91c2UuYworKysgYi9kcml2ZXJzL2lucHV0L21vdXNlL3Zt
bW91c2UuYwpAQCAtMTYsMTIgKzE2LDEyIEBACiAjaW5jbHVkZSA8bGludXgvc2xhYi5oPgogI2lu
Y2x1ZGUgPGxpbnV4L21vZHVsZS5oPgogI2luY2x1ZGUgPGFzbS9oeXBlcnZpc29yLmg+CisjaW5j
bHVkZSA8YXNtL3Ztd2FyZS5oPgogCiAjaW5jbHVkZSAicHNtb3VzZS5oIgogI2luY2x1ZGUgInZt
bW91c2UuaCIKIAogI2RlZmluZSBWTU1PVVNFX1BST1RPX01BR0lDCQkJMHg1NjRENTg2OFUKLSNk
ZWZpbmUgVk1NT1VTRV9QUk9UT19QT1JUCQkJMHg1NjU4CiAKIC8qCiAgKiBNYWluIGNvbW1hbmRz
IHN1cHBvcnRlZCBieSB0aGUgdm1tb3VzZSBoeXBlcnZpc29yIHBvcnQuCkBAIC04NCw3ICs4NCw3
IEBAIHN0cnVjdCB2bW1vdXNlX2RhdGEgewogI2RlZmluZSBWTU1PVVNFX0NNRChjbWQsIGluMSwg
b3V0MSwgb3V0Miwgb3V0Mywgb3V0NCkJXAogKHsJCQkJCQkJXAogCXVuc2lnbmVkIGxvbmcgX19k
dW1teTEsIF9fZHVtbXkyOwkJXAotCV9fYXNtX18gX192b2xhdGlsZV9fICgiaW5sICUlZHgiIDoJ
CVwKKwlfX2FzbV9fIF9fdm9sYXRpbGVfXyAoVk1XQVJFX0hZUEVSQ0FMTCA6CVwKIAkJIj1hIihv
dXQxKSwJCQkJXAogCQkiPWIiKG91dDIpLAkJCQlcCiAJCSI9YyIob3V0MyksCQkJCVwKQEAgLTk0
LDcgKzk0LDcgQEAgc3RydWN0IHZtbW91c2VfZGF0YSB7CiAJCSJhIihWTU1PVVNFX1BST1RPX01B
R0lDKSwJCVwKIAkJImIiKGluMSksCQkJCVwKIAkJImMiKFZNTU9VU0VfUFJPVE9fQ01EXyMjY21k
KSwJCVwKLQkJImQiKFZNTU9VU0VfUFJPVE9fUE9SVCkgOgkJXAorCQkiZCIoMCkgOgkJCSAgICAg
ICAgXAogCQkibWVtb3J5Iik7CQkgICAgICAgICAgICAgICAgXAogfSkKIAotLSAKMi4yMC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
