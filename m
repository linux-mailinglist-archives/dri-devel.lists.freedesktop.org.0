Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CB82E089
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 17:07:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23DE26E0E8;
	Wed, 29 May 2019 15:07:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72CA66E0E8;
 Wed, 29 May 2019 15:07:38 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1hW0Aw-0004FY-R3; Wed, 29 May 2019 15:07:34 +0000
From: Colin King <colin.king@canonical.com>
To: Oded Gabbay <oded.gabbay@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Oak Zeng <Oak.Zeng@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>
Subject: [PATCH][next] drm/amdkfd: fix null pointer dereference on dev
Date: Wed, 29 May 2019 16:07:34 +0100
Message-Id: <20190529150734.18120-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KClRoZSBwb2lu
dGVyIGRldiBpcyBzZXQgdG8gbnVsbCB5ZXQgaXQgaXMgYmVpbmcgZGVyZWZlcmVuY2VkIHdoZW4K
Y2hlY2tpbmcgZGV2LT5kcW0tPnNjaGVkX3BvbGljeS4gIEZpeCB0aGlzIGJ5IHBlcmZvcm1pbmcg
dGhlIGNoZWNrCm9uIGRldi0+ZHFtLT5zY2hlZF9wb2xpY3kgYWZ0ZXIgZGV2IGhhcyBiZWVuIGFz
c2lnbmVkIGFuZCBudWxsCmNoZWNrZWQuICBBbHNvIHJlbW92ZSB0aGUgcmVkdW5kYW50IG51bGwg
YXNzaWdubWVudCB0byBkZXYuCgpBZGRyZXNzZXMtQ292ZXJpdHk6ICgiRXhwbGljaXQgbnVsbCBk
ZXJlZmVyZW5jZSIpCkZpeGVzOiAxYTA1OGMzMzc2NzYgKCJkcm0vYW1ka2ZkOiBOZXcgSU9DVEwg
dG8gYWxsb2NhdGUgcXVldWUgR1dTIikKU2lnbmVkLW9mZi1ieTogQ29saW4gSWFuIEtpbmcgPGNv
bGluLmtpbmdAY2Fub25pY2FsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9r
ZmRfY2hhcmRldi5jIHwgNyArKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2Zk
L2tmZF9jaGFyZGV2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY2hhcmRldi5j
CmluZGV4IGFhYjJhYTZjMWRlZS4uZWE4MjgyOGZkYzc2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGtmZC9rZmRfY2hhcmRldi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1ka2ZkL2tmZF9jaGFyZGV2LmMKQEAgLTE1NzIsMTAgKzE1NzIsOSBAQCBzdGF0aWMgaW50IGtm
ZF9pb2N0bF9hbGxvY19xdWV1ZV9nd3Moc3RydWN0IGZpbGUgKmZpbGVwLAogewogCWludCByZXR2
YWw7CiAJc3RydWN0IGtmZF9pb2N0bF9hbGxvY19xdWV1ZV9nd3NfYXJncyAqYXJncyA9IGRhdGE7
Ci0Jc3RydWN0IGtmZF9kZXYgKmRldiA9IE5VTEw7CisJc3RydWN0IGtmZF9kZXYgKmRldjsKIAot
CWlmICghaHdzX2d3c19zdXBwb3J0IHx8Ci0JCWRldi0+ZHFtLT5zY2hlZF9wb2xpY3kgPT0gS0ZE
X1NDSEVEX1BPTElDWV9OT19IV1MpCisJaWYgKCFod3NfZ3dzX3N1cHBvcnQpCiAJCXJldHVybiAt
RUlOVkFMOwogCiAJZGV2ID0ga2ZkX2RldmljZV9ieV9pZChhcmdzLT5ncHVfaWQpOwpAQCAtMTU4
Myw2ICsxNTgyLDggQEAgc3RhdGljIGludCBrZmRfaW9jdGxfYWxsb2NfcXVldWVfZ3dzKHN0cnVj
dCBmaWxlICpmaWxlcCwKIAkJcHJfZGVidWcoIkNvdWxkIG5vdCBmaW5kIGdwdSBpZCAweCV4XG4i
LCBhcmdzLT5ncHVfaWQpOwogCQlyZXR1cm4gLUVJTlZBTDsKIAl9CisJaWYgKGRldi0+ZHFtLT5z
Y2hlZF9wb2xpY3kgPT0gS0ZEX1NDSEVEX1BPTElDWV9OT19IV1MpCisJCXJldHVybiAtRUlOVkFM
OwogCiAJbXV0ZXhfbG9jaygmcC0+bXV0ZXgpOwogCXJldHZhbCA9IHBxbV9zZXRfZ3dzKCZwLT5w
cW0sIGFyZ3MtPnF1ZXVlX2lkLCBhcmdzLT5udW1fZ3dzID8gZGV2LT5nd3MgOiBOVUxMKTsKLS0g
CjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
