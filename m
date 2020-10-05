Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E092F28382E
	for <lists+dri-devel@lfdr.de>; Mon,  5 Oct 2020 16:45:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E63F589E5B;
	Mon,  5 Oct 2020 14:45:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE60589E5B;
 Mon,  5 Oct 2020 14:45:20 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 93C7021527;
 Mon,  5 Oct 2020 14:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601909120;
 bh=cC7A/1XNwMahsxsDjfK6e58NMOTVoy/bsg2dYBlczGA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Sv4lOxqFGJ1NzRt0/1uVAiQwR9o7HAFSr8VC6Uj0NFVYvO/Sa7KQFaum6sjrZ5wCE
 4ezhj6QwaIbNPUmcvtCtu5SkVbTK5al9uqSa1wpBoAPdL3WTxQ0m6BWSYgeXLioeyB
 QerHvtA+KPdjoOA7VCVpaiWqrhY2cUQP8RzKMODM=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 2/4] drm/amdgpu: prevent double kfree ttm->sg
Date: Mon,  5 Oct 2020 10:45:15 -0400
Message-Id: <20201005144517.2527627-2-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201005144517.2527627-1-sashal@kernel.org>
References: <20201005144517.2527627-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Philip Yang <Philip.Yang@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUGhpbGlwIFlhbmcgPFBoaWxpcC5ZYW5nQGFtZC5jb20+CgpbIFVwc3RyZWFtIGNvbW1p
dCAxZDBlMTZhYzFhOWU4MDA1OThkY2ZhNWI2YmM1M2I3MDRhMTAzMzkwIF0KClNldCB0dG0tPnNn
IHRvIE5VTEwgYWZ0ZXIga2ZyZWUsIHRvIGF2b2lkIG1lbW9yeSBjb3JydXB0aW9uIGJhY2t0cmFj
ZToKClsgIDQyMC45MzI4MTJdIGtlcm5lbCBCVUcgYXQKL2J1aWxkL2xpbnV4LWRvOWVMRi9saW51
eC00LjE1LjAvbW0vc2x1Yi5jOjI5NSEKWyAgNDIwLjkzNDE4Ml0gaW52YWxpZCBvcGNvZGU6IDAw
MDAgWyMxXSBTTVAgTk9QVEkKWyAgNDIwLjkzNTQ0NV0gTW9kdWxlcyBsaW5rZWQgaW46IHh0X2Nv
bm50cmFjayBpcHRfTUFTUVVFUkFERQpbICA0MjAuOTUxMzMyXSBIYXJkd2FyZSBuYW1lOiBEZWxs
IEluYy4gUG93ZXJFZGdlIFI3NTI1LzBQWVZUMSwgQklPUwoxLjUuNCAwNy8wOS8yMDIwClsgIDQy
MC45NTI4ODddIFJJUDogMDAxMDpfX3NsYWJfZnJlZSsweDE4MC8weDJkMApbICA0MjAuOTU0NDE5
XSBSU1A6IDAwMTg6ZmZmZmJlNDI2MjkxZmE2MCBFRkxBR1M6IDAwMDEwMjQ2ClsgIDQyMC45NTU5
NjNdIFJBWDogZmZmZjllMjkyNjNlOWMzMCBSQlg6IGZmZmY5ZTI5MjYzZTljMzAgUkNYOgowMDAw
MDAwMTgxMDAwMDRiClsgIDQyMC45NTc1MTJdIFJEWDogZmZmZjllMjkyNjNlOWMzMCBSU0k6IGZm
ZmZmM2QzM2U5OGZhNDAgUkRJOgpmZmZmOWUyOTdlNDA3YTgwClsgIDQyMC45NTkwNTVdIFJCUDog
ZmZmZmJlNDI2MjkxZmIwMCBSMDg6IDAwMDAwMDAwMDAwMDAwMDEgUjA5OgpmZmZmZmZmZmMwZDM5
YWRlClsgIDQyMC45NjA1ODddIFIxMDogZmZmZmJlNDI2MjkxZmIyMCBSMTE6IGZmZmY5ZTQ5ZmZk
ZDQwMDAgUjEyOgpmZmZmOWUyOTdlNDA3YTgwClsgIDQyMC45NjIxMDVdIFIxMzogZmZmZmYzZDMz
ZTk4ZmE0MCBSMTQ6IGZmZmY5ZTI5MjYzZTljMzAgUjE1OgpmZmZmOWUyOTU0NDY0ZmQ4ClsgIDQy
MC45NjM2MTFdIEZTOiAgMDAwMDdmYTJlYTA5Nzc4MCgwMDAwKSBHUzpmZmZmOWUyOTdlODQwMDAw
KDAwMDApCmtubEdTOjAwMDAwMDAwMDAwMDAwMDAKWyAgNDIwLjk2NTE0NF0gQ1M6ICAwMDEwIERT
OiAwMDAwIEVTOiAwMDAwIENSMDogMDAwMDAwMDA4MDA1MDAzMwpbICA0MjAuOTY2NjYzXSBDUjI6
IDAwMDA3ZjE2YmZmZmVmYjggQ1IzOiAwMDAwMDAxZmYwYzYyMDAwIENSNDoKMDAwMDAwMDAwMDM0
MGVlMApbICA0MjAuOTY4MTkzXSBDYWxsIFRyYWNlOgpbICA0MjAuOTY5NzAzXSAgPyBfX3BhZ2Vf
Y2FjaGVfcmVsZWFzZSsweDNjLzB4MjIwClsgIDQyMC45NzEyOTRdICA/IGFtZGdwdV90dG1fdHRf
dW5wb3B1bGF0ZSsweDVlLzB4ODAgW2FtZGdwdV0KWyAgNDIwLjk3Mjc4OV0gIGtmcmVlKzB4MTY4
LzB4MTgwClsgIDQyMC45NzQzNTNdICA/IGFtZGdwdV90dG1fdHRfc2V0X3VzZXJfcGFnZXMrMHg2
NC8weGMwIFthbWRncHVdClsgIDQyMC45NzU4NTBdICA/IGtmcmVlKzB4MTY4LzB4MTgwClsgIDQy
MC45Nzc0MDNdICBhbWRncHVfdHRtX3R0X3VucG9wdWxhdGUrMHg1ZS8weDgwIFthbWRncHVdClsg
IDQyMC45Nzg4ODhdICB0dG1fdHRfdW5wb3B1bGF0ZS5wYXJ0LjEwKzB4NTMvMHg2MCBbYW1kdHRt
XQpbICA0MjAuOTgwMzU3XSAgdHRtX3R0X2Rlc3Ryb3kucGFydC4xMSsweDRmLzB4NjAgW2FtZHR0
bV0KWyAgNDIwLjk4MTgxNF0gIHR0bV90dF9kZXN0cm95KzB4MTMvMHgyMCBbYW1kdHRtXQpbICA0
MjAuOTgzMjczXSAgdHRtX2JvX2NsZWFudXBfbWVtdHlwZV91c2UrMHgzNi8weDgwIFthbWR0dG1d
ClsgIDQyMC45ODQ3MjVdICB0dG1fYm9fcmVsZWFzZSsweDFjOS8weDM2MCBbYW1kdHRtXQpbICA0
MjAuOTg2MTY3XSAgYW1kdHRtX2JvX3B1dCsweDI0LzB4MzAgW2FtZHR0bV0KWyAgNDIwLjk4NzY2
M10gIGFtZGdwdV9ib191bnJlZisweDFlLzB4MzAgW2FtZGdwdV0KWyAgNDIwLjk4OTE2NV0gIGFt
ZGdwdV9hbWRrZmRfZ3B1dm1fYWxsb2NfbWVtb3J5X29mX2dwdSsweDljYS8weGIxMApbYW1kZ3B1
XQpbICA0MjAuOTkwNjY2XSAga2ZkX2lvY3RsX2FsbG9jX21lbW9yeV9vZl9ncHUrMHhlZi8weDJj
MCBbYW1kZ3B1XQoKU2lnbmVkLW9mZi1ieTogUGhpbGlwIFlhbmcgPFBoaWxpcC5ZYW5nQGFtZC5j
b20+ClJldmlld2VkLWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4K
UmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4K
U2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpT
aWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfdHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMKaW5k
ZXggZjE1ZGVkMWNlOTA1Ny4uYzZhMWRmZTc5ZTgwOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV90dG0uYwpAQCAtOTY3LDYgKzk2Nyw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3R0
bV90dF9waW5fdXNlcnB0cihzdHJ1Y3QgdHRtX3R0ICp0dG0pCiAKIHJlbGVhc2Vfc2c6CiAJa2Zy
ZWUodHRtLT5zZyk7CisJdHRtLT5zZyA9IE5VTEw7CiAJcmV0dXJuIHI7CiB9CiAKLS0gCjIuMjUu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
