Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD413740D3
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 18:38:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCD396EC1C;
	Wed,  5 May 2021 16:38:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C82A6EC1C;
 Wed,  5 May 2021 16:38:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0025A615FF;
 Wed,  5 May 2021 16:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620232709;
 bh=gYSpMSpcemkS+AZtk7k2jROkybl1/SgYrbZvQokyg7w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eZpf38lq/JMshitSOPAglShb7u8Dmi6IPH1q/GyrViG+qknPcRCfPie4jlr9ACzOR
 CSV1lYuA7LqVEW3wR87weRiKazsLMeNXSeKiHNz0GXb0+yNZQQMtbdXS34PE2+n13L
 6t4bcAbduXJvsbbCsXTYV6yNtfwX+kTTT325DmhraW0sRt2UCakfq6XLVvHFHOcnCO
 lclPNc9Ao3PLxZBriqccTANIO8L6i/rpYAivQOpni0ZP9wAFjcQ0nqbG8CARG+6/Cs
 KYxnzcOA7rRYADPx8tI5gIMhI3Mv0fgTz8TMU29LUyJBXs6T/v7tw2ar/nAGa4DKuW
 H/g0TMWgb2E/w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 68/85] drm/amdgpu: Add mem sync flag for IB
 allocated by SA
Date: Wed,  5 May 2021 12:36:31 -0400
Message-Id: <20210505163648.3462507-68-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505163648.3462507-1-sashal@kernel.org>
References: <20210505163648.3462507-1-sashal@kernel.org>
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
Yi5jCmluZGV4IDJmNTNmYTBhZTlhNi4uMjhmMjBmMGI3MjJmIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfaWIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfaWIuYwpAQCAtNzUsNiArNzUsOCBAQCBpbnQgYW1kZ3B1X2liX2dldChz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgc3RydWN0IGFtZGdwdV92bSAqdm0sCiAJCX0KIAog
CQlpYi0+cHRyID0gYW1kZ3B1X3NhX2JvX2NwdV9hZGRyKGliLT5zYV9ibyk7CisJCS8qIGZsdXNo
IHRoZSBjYWNoZSBiZWZvcmUgY29tbWl0IHRoZSBJQiAqLworCQlpYi0+ZmxhZ3MgPSBBTURHUFVf
SUJfRkxBR19FTUlUX01FTV9TWU5DOwogCiAJCWlmICghdm0pCiAJCQlpYi0+Z3B1X2FkZHIgPSBh
bWRncHVfc2FfYm9fZ3B1X2FkZHIoaWItPnNhX2JvKTsKLS0gCjIuMzAuMgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
