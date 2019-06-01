Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6812E31D1D
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jun 2019 15:27:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5415889C49;
	Sat,  1 Jun 2019 13:27:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DA6089C49
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jun 2019 13:27:22 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 72ED2273E5;
 Sat,  1 Jun 2019 13:27:21 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 46/56] fbdev: fix divide error in
 fb_var_to_videomode
Date: Sat,  1 Jun 2019 09:25:50 -0400
Message-Id: <20190601132600.27427-46-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190601132600.27427-1-sashal@kernel.org>
References: <20190601132600.27427-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1559395642;
 bh=c9BS3yPV0ra5QvlyLBeJ8t3uanQxgL2aKNqONSy7bPQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pTPn51K5t+FbvwDfdZ+2+rZYl8mP9Ii/euj04/VmiRPv2hllJjMaS08eGUtv6k4rU
 ndbMThN36sqYX/AM6xTUPjfiClZovoo+SZBCDeeFPyjOZWE33Io/PsA/1V3zW0LTfo
 g47VLMvo+vt9DGW2Ryvq8mfuM6Qn63plSXu8WnmM=
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
Cc: Sasha Levin <sashal@kernel.org>, Fredrik Noring <noring@nocrew.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Mukesh Ojha <mojha@codeaurora.org>,
 Shile Zhang <shile.zhang@linux.alibaba.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2hpbGUgWmhhbmcgPHNoaWxlLnpoYW5nQGxpbnV4LmFsaWJhYmEuY29tPgoKWyBVcHN0
cmVhbSBjb21taXQgY2Y4NDgwN2Y2ZGQwYmU1MjE0Mzc4ZTY2NDYwY2ZjOTE4N2Y1MzJmOSBdCgpU
byBmaXggZm9sbG93aW5nIGRpdmlkZS1ieS16ZXJvIGVycm9yIGZvdW5kIGJ5IFN5emthbGxlcjoK
CiAgZGl2aWRlIGVycm9yOiAwMDAwIFsjMV0gU01QIFBUSQogIENQVTogNyBQSUQ6IDg0NDcgQ29t
bTogdGVzdCBLZHVtcDogbG9hZGVkIE5vdCB0YWludGVkIDQuMTkuMjQtOC5hbDcueDg2XzY0ICMx
CiAgSGFyZHdhcmUgbmFtZTogQWxpYmFiYSBDbG91ZCBBbGliYWJhIENsb3VkIEVDUywgQklPUyBy
ZWwtMS4xMi4wLTAtZ2E2OThjODk5NWYtcHJlYnVpbHQucWVtdS5vcmcgMDQvMDEvMjAxNAogIFJJ
UDogMDAxMDpmYl92YXJfdG9fdmlkZW9tb2RlKzB4YWUvMHhjMAogIENvZGU6IDA0IDQ0IDAzIDQ2
IDc4IDAzIDRlIDdjIDQ0IDAzIDQ2IDY4IDAzIDRlIDcwIDg5IGNlIGQxIGVlIDY5IGMwIGU4IDAz
IDAwIDAwIGY2IGMyIDAxIDBmIDQ1IGNlIDgzIGUyIDAyIDhkIDM0IDA5IDBmIDQ1IGNlIDMxIGQy
IDw0MT4gZjcgZjAgMzEgZDIgZjcgZjEgODkgNDcgMDggZjMgYzMgNjYgMGYgMWYgNDQgMDAgMDAg
MGYgMWYgNDQgMDAKICBSU1A6IDAwMTg6ZmZmZmI3ZTE4OTM0N2JmMCBFRkxBR1M6IDAwMDEwMjQ2
CiAgUkFYOiAwMDAwMDAwMGUxNjkyNDEwIFJCWDogZmZmZmI3ZTE4OTM0N2Q2MCBSQ1g6IDAwMDAw
MDAwMDAwMDAwMDAKICBSRFg6IDAwMDAwMDAwMDAwMDAwMDAgUlNJOiAwMDAwMDAwMDAwMDAwMDAw
IFJESTogZmZmZmI3ZTE4OTM0N2MxMAogIFJCUDogZmZmZjk5OTcyYTA5MWMwMCBSMDg6IDAwMDAw
MDAwMDAwMDAwMDAgUjA5OiAwMDAwMDAwMDAwMDAwMDAwCiAgUjEwOiAwMDAwMDAwMDAwMDAwMDAw
IFIxMTogMDAwMDAwMDAwMDAwMDAwMCBSMTI6IDAwMDAwMDAwMDAwMDAxMDAKICBSMTM6IDAwMDAw
MDAwMDAwMTAwMDAgUjE0OiAwMDAwN2ZmZDY2YmFmNmQwIFIxNTogMDAwMDAwMDAwMDAwMDAwMAog
IEZTOiAgMDAwMDdmMjA1NGQxMTc0MCgwMDAwKSBHUzpmZmZmOTk5NzJmYmMwMDAwKDAwMDApIGtu
bEdTOjAwMDAwMDAwMDAwMDAwMDAKICBDUzogIDAwMTAgRFM6IDAwMDAgRVM6IDAwMDAgQ1IwOiAw
MDAwMDAwMDgwMDUwMDMzCiAgQ1IyOiAwMDAwN2YyMDU0ODFmZDIwIENSMzogMDAwMDAwMDQyODhh
MDAwMSBDUjQ6IDAwMDAwMDAwMDAxNjA2YTAKICBDYWxsIFRyYWNlOgogICBmYl9zZXRfdmFyKzB4
MjU3LzB4MzkwCiAgID8gbG9va3VwX2Zhc3QrMHhiYi8weDJiMAogICA/IGZiX29wZW4rMHhjMC8w
eDE0MAogICA/IGNocmRldl9vcGVuKzB4YTYvMHgxYTAKICAgZG9fZmJfaW9jdGwrMHg0NDUvMHg1
YTAKICAgZG9fdmZzX2lvY3RsKzB4OTIvMHg1ZjAKICAgPyBfX2FsbG9jX2ZkKzB4M2QvMHgxNjAK
ICAga3N5c19pb2N0bCsweDYwLzB4OTAKICAgX194NjRfc3lzX2lvY3RsKzB4MTYvMHgyMAogICBk
b19zeXNjYWxsXzY0KzB4NWIvMHgxOTAKICAgZW50cnlfU1lTQ0FMTF82NF9hZnRlcl9od2ZyYW1l
KzB4NDQvMHhhOQogIFJJUDogMDAzMzoweDdmMjA1NDgyNThkNwogIENvZGU6IDQ0IDAwIDAwIDQ4
IDhiIDA1IGI5IDE1IDJkIDAwIDY0IGM3IDAwIDI2IDAwIDAwIDAwIDQ4IGM3IGMwIGZmIGZmIGZm
IGZmIGMzIDY2IDJlIDBmIDFmIDg0IDAwIDAwIDAwIDAwIDAwIGI4IDEwIDAwIDAwIDAwIDBmIDA1
IDw0OD4gM2QgMDEgZjAgZmYgZmYgNzMgMDEgYzMgNDggOGIgMGQgODkgMTUgMmQgMDAgZjcgZDgg
NjQgODkgMDEgNDgKCkl0IGNhbiBiZSB0cmlnZ2VyZWQgZWFzaWx5IHdpdGggZm9sbG93aW5nIHRl
c3QgY29kZToKCiAgI2luY2x1ZGUgPGxpbnV4L2ZiLmg+CiAgI2luY2x1ZGUgPGZjbnRsLmg+CiAg
I2luY2x1ZGUgPHN5cy9pb2N0bC5oPgogIGludCBtYWluKHZvaWQpCiAgewogICAgICAgICAgc3Ry
dWN0IGZiX3Zhcl9zY3JlZW5pbmZvIHZhciA9IHsuYWN0aXZhdGUgPSAweDEwMCwgLnBpeGNsb2Nr
ID0gNjB9OwogICAgICAgICAgaW50IGZkID0gb3BlbigiL2Rldi9mYjAiLCBPX1JEV1IpOwogICAg
ICAgICAgaWYgKGZkIDwgMCkKICAgICAgICAgICAgICAgICAgcmV0dXJuIDE7CgogICAgICAgICAg
aWYgKGlvY3RsKGZkLCBGQklPUFVUX1ZTQ1JFRU5JTkZPLCAmdmFyKSkKICAgICAgICAgICAgICAg
ICAgcmV0dXJuIDE7CgogICAgICAgICAgcmV0dXJuIDA7CiAgfQoKU2lnbmVkLW9mZi1ieTogU2hp
bGUgWmhhbmcgPHNoaWxlLnpoYW5nQGxpbnV4LmFsaWJhYmEuY29tPgpDYzogRnJlZHJpayBOb3Jp
bmcgPG5vcmluZ0Bub2NyZXcub3JnPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBm
ZndsbC5jaD4KUmV2aWV3ZWQtYnk6IE11a2VzaCBPamhhIDxtb2poYUBjb2RlYXVyb3JhLm9yZz4K
U2lnbmVkLW9mZi1ieTogQmFydGxvbWllaiBab2xuaWVya2lld2ljeiA8Yi56b2xuaWVya2llQHNh
bXN1bmcuY29tPgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+
Ci0tLQogZHJpdmVycy92aWRlby9mYmRldi9jb3JlL21vZGVkYi5jIHwgMyArKysKIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2
L2NvcmUvbW9kZWRiLmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvbW9kZWRiLmMKaW5kZXgg
ZGUxMTlmMTFiNzhmOS4uNDU1YTE1ZjcwMTcyMCAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9m
YmRldi9jb3JlL21vZGVkYi5jCisrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9tb2RlZGIu
YwpAQCAtOTMzLDYgKzkzMyw5IEBAIHZvaWQgZmJfdmFyX3RvX3ZpZGVvbW9kZShzdHJ1Y3QgZmJf
dmlkZW9tb2RlICptb2RlLAogCWlmICh2YXItPnZtb2RlICYgRkJfVk1PREVfRE9VQkxFKQogCQl2
dG90YWwgKj0gMjsKIAorCWlmICghaHRvdGFsIHx8ICF2dG90YWwpCisJCXJldHVybjsKKwogCWhm
cmVxID0gcGl4Y2xvY2svaHRvdGFsOwogCW1vZGUtPnJlZnJlc2ggPSBoZnJlcS92dG90YWw7CiB9
Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
