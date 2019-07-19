Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2926D9B0
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 05:57:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 495276E4A5;
	Fri, 19 Jul 2019 03:57:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87A376E4A5;
 Fri, 19 Jul 2019 03:57:46 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 80D6821871;
 Fri, 19 Jul 2019 03:57:45 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 022/171] drm/amd/display: Fill plane attrs only
 for valid pxl format
Date: Thu, 18 Jul 2019 23:54:13 -0400
Message-Id: <20190719035643.14300-22-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719035643.14300-1-sashal@kernel.org>
References: <20190719035643.14300-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563508666;
 bh=UJ8o40MnRa0TvyAlLFj1vsaGUepF8iH+DWh2dyqDQKQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cQ3c8J9s19m9wijso+Gw3/ST3BLGkfqGzcRJdHIy4iChpRJBT01m/3eyVh8JcAUk6
 9o4T6fT0e4v4zvO7pm0BkHL6I5bAoi7S0YP9qhvVRDJygjLKpZrVGNuPjZnhBpdfqV
 ZHV899Ppj1fd6Q7BmhtCU6jDAkwhUhgwIK9SHpK4=
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
Cc: Sasha Levin <sashal@kernel.org>, David Francis <David.Francis@amd.com>,
 Roman Li <Roman.Li@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9tYW4gTGkgPFJvbWFuLkxpQGFtZC5jb20+CgpbIFVwc3RyZWFtIGNvbW1pdCAxODk0
NDc4YWQxZjhmZDczNjZlZGM1Y2VlNDllZTljYWVhMGUzZDUyIF0KCltXaHldCkluIGZpbGxfcGxh
bmVfYnVmZmVyX2F0dHJpYnV0ZXMoKSB3ZSBjYWxjdWxhdGUgY2hyb21hL2x1bWEKYXNzdW1pbmcg
dGhhdCB0aGUgc3VyZmFjZV9waXhlbF9mb3JtYXQgaXMgYWx3YXlzIHZhbGlkLgpJZiBpdCdzIG5v
dCB0aGUgY2FzZSwgdGhlcmUncyBhIHJpc2sgb2YgZGl2aWRlIGJ5IHplcm8gZXJyb3IuCgpbSG93
XQpDaGVjayBpZiBmb3JtYXQgdmFsaWQgYmVmb3JlIGNhbGN1bGF0aW5nIHBpeGVsIGZvcm1hdCBh
dHRyaWJ1dGVzCgpTaWduZWQtb2ZmLWJ5OiBSb21hbiBMaSA8Um9tYW4uTGlAYW1kLmNvbT4KUmV2
aWV3ZWQtYnk6IERhdmlkIEZyYW5jaXMgPERhdmlkLkZyYW5jaXNAYW1kLmNvbT4KQWNrZWQtYnk6
IEJoYXdhbnByZWV0IExha2hhIDxCaGF3YW5wcmVldC5MYWtoYUBhbWQuY29tPgpTaWduZWQtb2Zm
LWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1vZmYt
Ynk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKaW5kZXggZmEyNjhkZDczNmY0Li4zMTUz
MGJmZDAwMmEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVf
ZG0vYW1kZ3B1X2RtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9k
bS9hbWRncHVfZG0uYwpAQCAtMjU5Miw3ICsyNTkyLDcgQEAgZmlsbF9wbGFuZV9idWZmZXJfYXR0
cmlidXRlcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAkJYWRkcmVzcy0+dHlwZSA9IFBM
Tl9BRERSX1RZUEVfR1JBUEhJQ1M7CiAJCWFkZHJlc3MtPmdycGguYWRkci5sb3dfcGFydCA9IGxv
d2VyXzMyX2JpdHMoYWZiLT5hZGRyZXNzKTsKIAkJYWRkcmVzcy0+Z3JwaC5hZGRyLmhpZ2hfcGFy
dCA9IHVwcGVyXzMyX2JpdHMoYWZiLT5hZGRyZXNzKTsKLQl9IGVsc2UgeworCX0gZWxzZSBpZiAo
Zm9ybWF0IDwgU1VSRkFDRV9QSVhFTF9GT1JNQVRfSU5WQUxJRCkgewogCQl1aW50NjRfdCBjaHJv
bWFfYWRkciA9IGFmYi0+YWRkcmVzcyArIGZiLT5vZmZzZXRzWzFdOwogCiAJCXBsYW5lX3NpemUt
PnZpZGVvLmx1bWFfc2l6ZS54ID0gMDsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
