Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C599DD1BE
	for <lists+dri-devel@lfdr.de>; Sat, 19 Oct 2019 00:06:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE29689704;
	Fri, 18 Oct 2019 22:06:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8712289213;
 Fri, 18 Oct 2019 22:06:38 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 78629222C2;
 Fri, 18 Oct 2019 22:06:37 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 048/100] drm/amd/display: fix odm combine pipe
 reset
Date: Fri, 18 Oct 2019 18:04:33 -0400
Message-Id: <20191018220525.9042-48-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191018220525.9042-1-sashal@kernel.org>
References: <20191018220525.9042-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1571436398;
 bh=sP7BL7tqYErBOvL8W0EM0ifrxBAL2ZwmaMUBXDKCsdQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=valtOsQvBzlvgw7jNJ5cyJgTEKRNy5EHCpL5VXtTx1yj7OG3/oIUs5K82jSFZd5j9
 wMe4aMOj0mK9yEgHYn6YnwiBle0tTBAVmUoUa0mxRxmOXRTQmcUCwrSJTQaYgnCp6Y
 lnM+e4HsvKf7Gc6zCEaZngFN4TgolzqoR9WcE+fI=
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
Cc: Sasha Levin <sashal@kernel.org>, Tony Cheng <Tony.Cheng@amd.com>,
 amd-gfx@lists.freedesktop.org, Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRG15dHJvIExha3R5dXNoa2luIDxEbXl0cm8uTGFrdHl1c2hraW5AYW1kLmNvbT4KClsg
VXBzdHJlYW0gY29tbWl0IGYyNWYwNmI2N2JhMjM3Yjc2MDkyYTZmYzUyMmIxYTk0ZTg0YmZhODUg
XQoKV2UgZmFpbCB0byByZXNldCB0aGUgc2Vjb25kIG9kbSBjb21iaW5lIHBpcGUuIFRoaXMgY2hh
bmdlIGZpeGVzCm9kbSBwb2ludGVyIG1hbmFnZW1lbnQuCgpTaWduZWQtb2ZmLWJ5OiBEbXl0cm8g
TGFrdHl1c2hraW4gPERteXRyby5MYWt0eXVzaGtpbkBhbWQuY29tPgpSZXZpZXdlZC1ieTogVG9u
eSBDaGVuZyA8VG9ueS5DaGVuZ0BhbWQuY29tPgpBY2tlZC1ieTogQmhhd2FucHJlZXQgTGFraGEg
PEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8
YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNh
c2hhbEBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3Jl
L2RjX3Jlc291cmNlLmMgfCA2ICsrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvY29yZS9kY19yZXNvdXJjZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2NvcmUvZGNfcmVzb3VyY2UuYwppbmRleCBkNDQwYjI4ZWU0M2ZiLi42ODk2ZDY5YjhjMjQwIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19yZXNvdXJj
ZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX3Jlc291cmNl
LmMKQEAgLTEzOTksOSArMTM5OSw5IEBAIGJvb2wgZGNfcmVtb3ZlX3BsYW5lX2Zyb21fY29udGV4
dCgKIAkJCSAqIEZvciBoZWFkIHBpcGUgZGV0YWNoIHN1cmZhY2VzIGZyb20gcGlwZSBmb3IgdGFp
bAogCQkJICogcGlwZSBqdXN0IHplcm8gaXQgb3V0CiAJCQkgKi8KLQkJCWlmICghcGlwZV9jdHgt
PnRvcF9waXBlIHx8Ci0JCQkJKCFwaXBlX2N0eC0+dG9wX3BpcGUtPnRvcF9waXBlICYmCisJCQlp
ZiAoIXBpcGVfY3R4LT50b3BfcGlwZSB8fCAoIXBpcGVfY3R4LT50b3BfcGlwZS0+dG9wX3BpcGUg
JiYKIAkJCQkJcGlwZV9jdHgtPnRvcF9waXBlLT5zdHJlYW1fcmVzLm9wcCAhPSBwaXBlX2N0eC0+
c3RyZWFtX3Jlcy5vcHApKSB7CisJCQkJcGlwZV9jdHgtPnRvcF9waXBlID0gTlVMTDsKIAkJCQlw
aXBlX2N0eC0+cGxhbmVfc3RhdGUgPSBOVUxMOwogCQkJCXBpcGVfY3R4LT5ib3R0b21fcGlwZSA9
IE5VTEw7CiAJCQl9IGVsc2UgewpAQCAtMTgwMyw4ICsxODAzLDYgQEAgZW51bSBkY19zdGF0dXMg
ZGNfcmVtb3ZlX3N0cmVhbV9mcm9tX2N0eCgKIAkJCQlkYy0+cmVzX3Bvb2wtPmZ1bmNzLT5yZW1v
dmVfc3RyZWFtX2Zyb21fY3R4KGRjLCBuZXdfY3R4LCBzdHJlYW0pOwogCiAJCQltZW1zZXQoZGVs
X3BpcGUsIDAsIHNpemVvZigqZGVsX3BpcGUpKTsKLQotCQkJYnJlYWs7CiAJCX0KIAl9CiAKLS0g
CjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
