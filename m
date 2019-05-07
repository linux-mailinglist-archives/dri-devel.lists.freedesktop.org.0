Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 337031592B
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 07:34:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F23EE89CB8;
	Tue,  7 May 2019 05:34:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6124D89CD7
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 05:34:31 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7758B2087F;
 Tue,  7 May 2019 05:34:30 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.0 60/99] drm: bridge: dw-hdmi: Fix overflow
 workaround for Rockchip SoCs
Date: Tue,  7 May 2019 01:31:54 -0400
Message-Id: <20190507053235.29900-60-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190507053235.29900-1-sashal@kernel.org>
References: <20190507053235.29900-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1557207271;
 bh=Nn5AKjwbyyKxt2/OxRqIHa1NJ6FZcLAmngoexODc1M0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uJyNplFHZ5Ady6rByIgATYSGS8a6SCT2Zae0O/yP67r0mpmk2/7+eikJpOJwPqIA8
 IC1KJFqkF/g0v8srDPuZMM0OukuWOkjImwkMQGQBgx+6V4V/PzgUiMEhmcEPmhA2ob
 NgMdVvu4RwacGm5oemp4SRs9joBaw38EP67LOk6w=
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSm9uYXMgS2FybG1hbiA8am9uYXNAa3dpYm9vLnNlPgoKWyBVcHN0cmVhbSBjb21taXQg
ZDE1ZDlmZDAyNTc1ZWNmYWRhOTJkNDJmNjU1OTQwYzRmMTBhZjg0MiBdCgpUaGUgUm9ja2NoaXAg
UkszMjg4IFNvQyAodjIuMDBhKSBhbmQgUkszMzI4L1JLMzM5OSBTb0NzICh2Mi4xMWEpIGhhdmUK
YWxzbyBiZWVuIGlkZW50aWZpZWQgYXMgbmVlZGluZyB0aGlzIHdvcmthcm91bmQgd2l0aCBhIHNp
bmdsZSBpdGVyYXRpb24uCgpGaXhlczogYmU0MWZjNTVmMWFhICgiZHJtOiBicmlkZ2U6IGR3LWhk
bWk6IEhhbmRsZSBvdmVyZmxvdyB3b3JrYXJvdW5kIGJhc2VkIG9uIGRldmljZSB2ZXJzaW9uIikK
U2lnbmVkLW9mZi1ieTogSm9uYXMgS2FybG1hbiA8am9uYXNAa3dpYm9vLnNlPgpUZXN0ZWQtYnk6
IEhlaWtvIFN0dWViZXIgPGhlaWtvQHNudGVjaC5kZT4KU2lnbmVkLW9mZi1ieTogQW5kcnplaiBI
YWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KTGluazogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRl
c2t0b3Aub3JnL3BhdGNoL21zZ2lkL0FNM1BSMDNNQjA5NjY4MThGQUFBRTYxOTJGRjRFRDExQUFD
N0QwQEFNM1BSMDNNQjA5NjYuZXVycHJkMDMucHJvZC5vdXRsb29rLmNvbQpTaWduZWQtb2ZmLWJ5
OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3
LWhkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jCmluZGV4
IDY0YzNjZjAyNzUxOC4uMTQyMjNjMGVlNzg0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5
bm9wc3lzL2R3LWhkbWkuYwpAQCAtMTY1NSw2ICsxNjU1LDggQEAgc3RhdGljIHZvaWQgZHdfaGRt
aV9jbGVhcl9vdmVyZmxvdyhzdHJ1Y3QgZHdfaGRtaSAqaGRtaSkKIAkgKiBpdGVyYXRpb24gZm9y
IG90aGVycy4KIAkgKiBUaGUgQW1sb2dpYyBNZXNvbiBHWCBTb0NzICh2Mi4wMWEpIGhhdmUgYmVl
biBpZGVudGlmaWVkIGFzIG5lZWRpbmcKIAkgKiB0aGUgd29ya2Fyb3VuZCB3aXRoIGEgc2luZ2xl
IGl0ZXJhdGlvbi4KKwkgKiBUaGUgUm9ja2NoaXAgUkszMjg4IFNvQyAodjIuMDBhKSBhbmQgUksz
MzI4L1JLMzM5OSBTb0NzICh2Mi4xMWEpIGhhdmUKKwkgKiBiZWVuIGlkZW50aWZpZWQgYXMgbmVl
ZGluZyB0aGUgd29ya2Fyb3VuZCB3aXRoIGEgc2luZ2xlIGl0ZXJhdGlvbi4KIAkgKi8KIAogCXN3
aXRjaCAoaGRtaS0+dmVyc2lvbikgewpAQCAtMTY2Myw3ICsxNjY1LDkgQEAgc3RhdGljIHZvaWQg
ZHdfaGRtaV9jbGVhcl9vdmVyZmxvdyhzdHJ1Y3QgZHdfaGRtaSAqaGRtaSkKIAkJYnJlYWs7CiAJ
Y2FzZSAweDEzMWE6CiAJY2FzZSAweDEzMmE6CisJY2FzZSAweDIwMGE6CiAJY2FzZSAweDIwMWE6
CisJY2FzZSAweDIxMWE6CiAJY2FzZSAweDIxMmE6CiAJCWNvdW50ID0gMTsKIAkJYnJlYWs7Ci0t
IAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
