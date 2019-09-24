Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F032BCCB4
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 18:42:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A8FE6EA59;
	Tue, 24 Sep 2019 16:42:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 443946EA59;
 Tue, 24 Sep 2019 16:42:17 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 378AC20872;
 Tue, 24 Sep 2019 16:42:16 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.3 10/87] drm/amd/display: fix not calling ppsmu to
 trigger PME
Date: Tue, 24 Sep 2019 12:40:26 -0400
Message-Id: <20190924164144.25591-10-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924164144.25591-1-sashal@kernel.org>
References: <20190924164144.25591-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569343337;
 bh=R/jTEcosIgI42IvSWc1LupVsH5P7htvyBIlQkVgNgvM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pLtpCjGF5v9cywe/HRjOMkArW5+pP/23Ub5e/eRMjxhrQqiot3d/+UPKwbDRwmpD5
 WRXY7tPlLw+UPytnpfSvXt0QQ6azSEiBI47GqucMREDNSo7WSJ2t7A95Kh6lMJvS4a
 tVe3DoIjHVIH6ItF1LUHiaFElYdEzEIcEOZru3Ck=
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
Cc: Sasha Levin <sashal@kernel.org>, Eric Yang <eric.yang2@amd.com>,
 Leo Li <sunpeng.li@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Su Sung Chung <Su.Chung@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU3UgU3VuZyBDaHVuZyA8U3UuQ2h1bmdAYW1kLmNvbT4KClsgVXBzdHJlYW0gY29tbWl0
IDE4YjQwMTg3NGFlZTEwYzgwYjU3NDVjOWI5MzI4MGRhZTVhNTk4MDkgXQoKW3doeV0KZGNuMjBf
Y2xrX21ncl9jb25zdHJ1Y3Qgd2FzIG5vdCBpbml0aWFsaXppbmcgcHBfc211LCBhbmQgUE1FIGNh
bGwgZ2V0cwpmaWx0ZXJlZCBvdXQgYnkgdGhlIG51bGwgY2hlY2sKCltob3ddCmluaXRpYWxpemUg
cHBfc211IGRjbjIwX2Nsa19tZ3JfY29uc3RydWN0CgpTaWduZWQtb2ZmLWJ5OiBTdSBTdW5nIENo
dW5nIDxTdS5DaHVuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogRXJpYyBZYW5nIDxlcmljLnlhbmcy
QGFtZC5jb20+CkFja2VkLWJ5OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KU2lnbmVkLW9m
Zi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpTaWduZWQtb2Zm
LWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNuMjAvZGNuMjBfY2xrX21nci5jIHwgMiArKwogMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9jbGtfbWdyL2RjbjIwL2RjbjIwX2Nsa19tZ3IuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9jbGtfbWdyL2RjbjIwL2RjbjIwX2Nsa19tZ3IuYwppbmRl
eCA1MGJmYjU5MjFkZTA3Li4yYWIwZjk3NzE5YjVhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvY2xrX21nci9kY24yMC9kY24yMF9jbGtfbWdyLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNuMjAvZGNuMjBfY2xrX21nci5j
CkBAIC0zNDgsNiArMzQ4LDggQEAgdm9pZCBkY24yMF9jbGtfbWdyX2NvbnN0cnVjdCgKIAogCWNs
a19tZ3ItPmJhc2UuZHByZWZjbGtfa2h6ID0gNzAwMDAwOyAvLyA3MDAgTUh6IHBsYW5uZWQgaWYg
VkNPIGlzIDMuODUgR0h6LCB3aWxsIGJlIHJldHJpZXZlZAogCisJY2xrX21nci0+cHBfc211ID0g
cHBfc211OworCiAJaWYgKElTX0ZQR0FfTUFYSU1VU19EQyhjdHgtPmRjZV9lbnZpcm9ubWVudCkp
IHsKIAkJZGNuMl9mdW5jcy51cGRhdGVfY2xvY2tzID0gZGNuMl91cGRhdGVfY2xvY2tzX2ZwZ2E7
CiAJCWNsa19tZ3ItPmRlbnRpc3RfdmNvX2ZyZXFfa2h6ID0gMzg1MDAwMDsKLS0gCjIuMjAuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
