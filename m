Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4416D9C3
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 05:58:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 127496E4BE;
	Fri, 19 Jul 2019 03:58:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DF2E6E4BA;
 Fri, 19 Jul 2019 03:58:11 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 188A12184E;
 Fri, 19 Jul 2019 03:58:10 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 035/171] drm/amd/display: Reset planes for color
 management changes
Date: Thu, 18 Jul 2019 23:54:26 -0400
Message-Id: <20190719035643.14300-35-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719035643.14300-1-sashal@kernel.org>
References: <20190719035643.14300-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563508691;
 bh=qM2zHBibiBBO03fWCDDQyTr6ziwHDkUz0cX/k5QHERA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FPhgJ1SYmS/Hn5MmOhfD5/eSUN9IJr6ZZhQp1LrYUbKN72DbK6hHl16325pX8VLSe
 MJx3NiqECbyw1Wj5okGhYLC8xVPEDUcYPPiyuZ7TXzgGkx4iGXGNU+24a6Ef3nQLVC
 IGw+pR7MzatuD+HrS7Avms4Cxm2ziQxBM/Ncq1r8=
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
Cc: Sasha Levin <sashal@kernel.org>, Leo Li <sunpeng.li@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPgoK
WyBVcHN0cmVhbSBjb21taXQgNzMxNmM0YWQyOTk2NjNhMTZjYTljZTEzZTVlODE3YjRjYTc2MDgw
OSBdCgpbV2h5XQpGb3IgY29tbWl0cyB3aXRoIGFsbG93X21vZGVzZXQ9ZmFsc2UgYW5kIENSVEMg
ZGVnYW1tYSBjaGFuZ2VzIHRoZSBwbGFuZXMKYXJlbid0IHJlc2V0LiBUaGlzIHJlc3VsdHMgaW4g
aW5jb3JyZWN0IHJlbmRlcmluZy4KCltIb3ddClJlc2V0IHRoZSBwbGFuZXMgd2hlbiBjb2xvciBt
YW5hZ2VtZW50IGhhcyBjaGFuZ2VkIG9uIHRoZSBDUlRDLgpUZWNobmljYWxseSB0aGlzIHdpbGwg
aW5jbHVkZSByZWdhbW1hIGNoYW5nZXMgYXMgd2VsbCwgYnV0IGl0IGRvZXNuJ3QKcmVhbGx5IGFm
dGVyIGxlZ2FjeSB1c2Vyc3BhY2Ugc2luY2UgdGhvc2UgY29tbWl0IHdpdGgKYWxsb3dfbW9kZXNl
dD10cnVlLgoKU2lnbmVkLW9mZi1ieTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6
bGF1c2thc0BhbWQuY29tPgpSZXZpZXdlZC1ieTogSGFycnkgV2VudGxhbmQgPEhhcnJ5LldlbnRs
YW5kQGFtZC5jb20+CkFja2VkLWJ5OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KU2lnbmVk
LW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpTaWduZWQt
b2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8IDQgKysrKwogMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCmluZGV4IDMxNTMwYmZkMDAyYS4uMGU0ODIzNDlhNWNi
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdw
dV9kbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1
X2RtLmMKQEAgLTYzMzEsNiArNjMzMSwxMCBAQCBzdGF0aWMgYm9vbCBzaG91bGRfcmVzZXRfcGxh
bmUoc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlLAogCWlmICghbmV3X2NydGNfc3RhdGUp
CiAJCXJldHVybiB0cnVlOwogCisJLyogQ1JUQyBEZWdhbW1hIGNoYW5nZXMgY3VycmVudGx5IHJl
cXVpcmUgdXMgdG8gcmVjcmVhdGUgcGxhbmVzLiAqLworCWlmIChuZXdfY3J0Y19zdGF0ZS0+Y29s
b3JfbWdtdF9jaGFuZ2VkKQorCQlyZXR1cm4gdHJ1ZTsKKwogCWlmIChkcm1fYXRvbWljX2NydGNf
bmVlZHNfbW9kZXNldChuZXdfY3J0Y19zdGF0ZSkpCiAJCXJldHVybiB0cnVlOwogCi0tIAoyLjIw
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
