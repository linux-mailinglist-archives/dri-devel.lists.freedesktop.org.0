Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A6637400B
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 18:33:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C6E56EC04;
	Wed,  5 May 2021 16:33:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACAF16EB6F;
 Wed,  5 May 2021 16:33:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 733AF61464;
 Wed,  5 May 2021 16:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620232422;
 bh=DiHdd7yDzIyuLxlC1zOMaexv0xacGPCFgIoI9D78zEU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RJSCZBwcINN5pLPZHOL0t7udHzeIbc4GzVMdQOrJ9OmFRmP4XkIK1rwCnX4AX3JIT
 AVFjtst9oaXqUfnPVPK0d5WDwv5hcM4R/TP+vV9zCGJM66NIVlIQ6K07f+eRfhcbXS
 4er5fwNZkswBCLZfCvkTyegwSgqoAMYKtkNLCWJ8UqBrvl25rHn6N1Ot94FTZVOz1D
 /vW1dh3CFJc0KQ2mIdhgf4AuVJM8grGK7LjjAdQIccr6z8ykh0LKMJ2Ceu5GTgP/Jk
 /AqEvu3N0Ezwj4weIJUT4gKI7Ju6/VXa6coAbMFMBS2d6TKJ/HpuiAG6S2rCABDxgH
 esq79UrPvDX4A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.12 097/116] drm/amdgpu: Add mem sync flag for IB
 allocated by SA
Date: Wed,  5 May 2021 12:31:05 -0400
Message-Id: <20210505163125.3460440-97-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505163125.3460440-1-sashal@kernel.org>
References: <20210505163125.3460440-1-sashal@kernel.org>
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
Cc: Jinzhou Su <Jinzhou.Su@amd.com>, Sasha Levin <sashal@kernel.org>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSmluemhvdSBTdSA8SmluemhvdS5TdUBhbWQuY29tPgoKWyBVcHN0cmVhbSBjb21taXQg
NWM4OGUzYjg2YTg4ZjE0ZWZhMGEzZGRkMjg2NDFjNmZmNDlmYjljNCBdCgpUaGUgYnVmZmVyIG9m
IFNBIGJvIHdpbGwgYmUgdXNlZCBieSBtYW55IGNhc2VzLiBTbyBpdCdzIGJldHRlcgp0byBpbnZh
bGlkYXRlIHRoZSBjYWNoZSBvZiBpbmRpcmVjdCBidWZmZXIgYWxsb2NhdGVkIGJ5IFNBIGJlZm9y
ZQpjb21taXQgdGhlIElCLgoKU2lnbmVkLW9mZi1ieTogSmluemhvdSBTdSA8SmluemhvdS5TdUBh
bWQuY29tPgpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0Bh
bWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFt
ZC5jb20+ClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfaWIuYyB8IDIgKysKIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfaWIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9p
Yi5jCmluZGV4IDc2NDUyMjNlYTBlZi4uOTdjMTFhYTQ3YWQwIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfaWIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfaWIuYwpAQCAtNzcsNiArNzcsOCBAQCBpbnQgYW1kZ3B1X2liX2dldChz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgc3RydWN0IGFtZGdwdV92bSAqdm0sCiAJCX0KIAog
CQlpYi0+cHRyID0gYW1kZ3B1X3NhX2JvX2NwdV9hZGRyKGliLT5zYV9ibyk7CisJCS8qIGZsdXNo
IHRoZSBjYWNoZSBiZWZvcmUgY29tbWl0IHRoZSBJQiAqLworCQlpYi0+ZmxhZ3MgPSBBTURHUFVf
SUJfRkxBR19FTUlUX01FTV9TWU5DOwogCiAJCWlmICghdm0pCiAJCQlpYi0+Z3B1X2FkZHIgPSBh
bWRncHVfc2FfYm9fZ3B1X2FkZHIoaWItPnNhX2JvKTsKLS0gCjIuMzAuMgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
