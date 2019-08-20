Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFCF9608E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 15:42:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 039D86E7D2;
	Tue, 20 Aug 2019 13:42:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F47F6E7D2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 13:41:58 +0000 (UTC)
Received: from sasha-vm.mshome.net (unknown [12.236.144.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AA53D22DA7;
 Tue, 20 Aug 2019 13:41:57 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 40/44] drm/scheduler: use job count instead of peek
Date: Tue, 20 Aug 2019 09:40:24 -0400
Message-Id: <20190820134028.10829-40-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190820134028.10829-1-sashal@kernel.org>
References: <20190820134028.10829-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1566308518;
 bh=pULf/NAYntD2MtpyYU9EQBMbQQn9+vSDDP6Lf4XG7O4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nedVEDSNL7wNplWLctnBEY2jd7JaODrWrK6TxF24zkKNJZiGR+F7y+dKCoH1lDp/a
 wvTh6quGYc5todUCvuLBzSHTGBRGBbGKwI9vrf3K12Xc4N6gpSoARNBLgZ4lZcv+KY
 EagH8F/HTeRM00oT7u/ImTOz7LwOgQhUHFhHk3cY=
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
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Monk.liu@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKWyBVcHN0
cmVhbSBjb21taXQgZTFiNGNlMjVkYmM5M2FiMGNiOGVkMGYyMzZhM2I5ZmY3YjAzODAyYyBdCgpU
aGUgc3BzY19xdWV1ZV9wZWVrIGZ1bmN0aW9uIGlzIGFjY2Vzc2luZyBxdWV1ZS0+aGVhZCB3aGlj
aCBiZWxvbmdzIHRvCnRoZSBjb25zdW1lciB0aHJlYWQgYW5kIHNob3VsZG4ndCBiZSBhY2Nlc3Nl
ZCBieSB0aGUgcHJvZHVjZXIKClRoaXMgaXMgZml4aW5nIGEgcmFyZSByYWNlIGNvbmRpdGlvbiB3
aGVuIGRlc3Ryb3lpbmcgZW50aXRpZXMuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmln
IDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkFja2VkLWJ5OiBBbmRyZXkgR3JvZHpvdnNreSA8
YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IE1vbmsubGl1QGFtZC5jb20K
U2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpT
aWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9lbnRpdHkuYyB8IDQgKystLQogMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX2VudGl0eS5jIGIvZHJpdmVycy9ncHUvZHJtL3NjaGVk
dWxlci9zY2hlZF9lbnRpdHkuYwppbmRleCAzNWRkYmVjMTM3NWFlLi42NzFjOTBmMzRlZGU2IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX2VudGl0eS5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfZW50aXR5LmMKQEAgLTk1LDcgKzk1LDcg
QEAgc3RhdGljIGJvb2wgZHJtX3NjaGVkX2VudGl0eV9pc19pZGxlKHN0cnVjdCBkcm1fc2NoZWRf
ZW50aXR5ICplbnRpdHkpCiAJcm1iKCk7IC8qIGZvciBsaXN0X2VtcHR5IHRvIHdvcmsgd2l0aG91
dCBsb2NrICovCiAKIAlpZiAobGlzdF9lbXB0eSgmZW50aXR5LT5saXN0KSB8fAotCSAgICBzcHNj
X3F1ZXVlX3BlZWsoJmVudGl0eS0+am9iX3F1ZXVlKSA9PSBOVUxMKQorCSAgICBzcHNjX3F1ZXVl
X2NvdW50KCZlbnRpdHktPmpvYl9xdWV1ZSkgPT0gMCkKIAkJcmV0dXJuIHRydWU7CiAKIAlyZXR1
cm4gZmFsc2U7CkBAIC0yODEsNyArMjgxLDcgQEAgdm9pZCBkcm1fc2NoZWRfZW50aXR5X2Zpbmko
c3RydWN0IGRybV9zY2hlZF9lbnRpdHkgKmVudGl0eSkKIAkvKiBDb25zdW1wdGlvbiBvZiBleGlz
dGluZyBJQnMgd2Fzbid0IGNvbXBsZXRlZC4gRm9yY2VmdWxseQogCSAqIHJlbW92ZSB0aGVtIGhl
cmUuCiAJICovCi0JaWYgKHNwc2NfcXVldWVfcGVlaygmZW50aXR5LT5qb2JfcXVldWUpKSB7CisJ
aWYgKHNwc2NfcXVldWVfY291bnQoJmVudGl0eS0+am9iX3F1ZXVlKSkgewogCQlpZiAoc2NoZWQp
IHsKIAkJCS8qIFBhcmsgdGhlIGtlcm5lbCBmb3IgYSBtb21lbnQgdG8gbWFrZSBzdXJlIGl0IGlz
bid0IHByb2Nlc3NpbmcKIAkJCSAqIG91ciBlbml0eS4KLS0gCjIuMjAuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
