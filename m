Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0304E31C7F
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jun 2019 15:22:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDC1189598;
	Sat,  1 Jun 2019 13:22:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D2D489598
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jun 2019 13:22:09 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 452E5272E9;
 Sat,  1 Jun 2019 13:22:08 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 005/141] drm/pl111: Initialize clock spinlock
 early
Date: Sat,  1 Jun 2019 09:19:41 -0400
Message-Id: <20190601132158.25821-5-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190601132158.25821-1-sashal@kernel.org>
References: <20190601132158.25821-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1559395328;
 bh=s+Z98v9ivrDolaDrRNoRrO6t6pmUb/gBb80oUlBT2RM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YQkkVSnxBHZgz86HvHovgL2bXKLNSHb3JZTbECjqwBzcIrvVtKkiPjOcMvzHVnaD5
 54b8Xp6IfMSwfaqTmvQinBsVkrrE4xdBn83fuZYjvWxz3mn03VDScd5cjvk/k2AN1Q
 LarzYlK+5o7C9HMXnqGACZQRk3VBzZzfaP85eELM=
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
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0PgoKWyBVcHN0cmVhbSBjb21t
aXQgM2UwMWFlMjYxMmJkZDc5NzVjNzRlYzcxMjNkN2Y4ZjVlNmVlZDc5NSBdCgpUaGUgZm9sbG93
aW5nIHdhcm5pbmcgaXMgc2VlbiBvbiBzeXN0ZW1zIHdpdGggYnJva2VuIGNsb2NrIGRpdmlkZXIu
CgpJTkZPOiB0cnlpbmcgdG8gcmVnaXN0ZXIgbm9uLXN0YXRpYyBrZXkuCnRoZSBjb2RlIGlzIGZp
bmUgYnV0IG5lZWRzIGxvY2tkZXAgYW5ub3RhdGlvbi4KdHVybmluZyBvZmYgdGhlIGxvY2tpbmcg
Y29ycmVjdG5lc3MgdmFsaWRhdG9yLgpDUFU6IDAgUElEOiAxIENvbW06IHN3YXBwZXIgTm90IHRh
aW50ZWQgNS4xLjAtMDk2OTgtZzFmYjNiNTIgIzEKSGFyZHdhcmUgbmFtZTogQVJNIEludGVncmF0
b3IvQ1AgKERldmljZSBUcmVlKQpbPGMwMDExYmU4Pl0gKHVud2luZF9iYWNrdHJhY2UpIGZyb20g
WzxjMDAwZWJiOD5dIChzaG93X3N0YWNrKzB4MTAvMHgxOCkKWzxjMDAwZWJiOD5dIChzaG93X3N0
YWNrKSBmcm9tIFs8YzA3ZDNmZDA+XSAoZHVtcF9zdGFjaysweDE4LzB4MjQpCls8YzA3ZDNmZDA+
XSAoZHVtcF9zdGFjaykgZnJvbSBbPGMwMDYwZDQ4Pl0gKHJlZ2lzdGVyX2xvY2tfY2xhc3MrMHg2
NzQvMHg2ZjgpCls8YzAwNjBkNDg+XSAocmVnaXN0ZXJfbG9ja19jbGFzcykgZnJvbSBbPGMwMDVk
ZTJjPl0KCShfX2xvY2tfYWNxdWlyZSsweDY4LzB4MjEyOCkKWzxjMDA1ZGUyYz5dIChfX2xvY2tf
YWNxdWlyZSkgZnJvbSBbPGMwMDYwNDA4Pl0gKGxvY2tfYWNxdWlyZSsweDExMC8weDIxYykKWzxj
MDA2MDQwOD5dIChsb2NrX2FjcXVpcmUpIGZyb20gWzxjMDdmNzU1Yz5dIChfcmF3X3NwaW5fbG9j
aysweDM0LzB4NDgpCls8YzA3Zjc1NWM+XSAoX3Jhd19zcGluX2xvY2spIGZyb20gWzxjMDUzNmM4
Yz5dCgkocGwxMTFfZGlzcGxheV9lbmFibGUrMHhmOC8weDVmYykKWzxjMDUzNmM4Yz5dIChwbDEx
MV9kaXNwbGF5X2VuYWJsZSkgZnJvbSBbPGMwNTAyZjU0Pl0KCShkcm1fYXRvbWljX2hlbHBlcl9j
b21taXRfbW9kZXNldF9lbmFibGVzKzB4MWVjLzB4MjQ0KQoKU2luY2UgY29tbWl0IGVlZGQ2MDMz
YjRjOCAoImRybS9wbDExMTogU3VwcG9ydCB2YXJpYW50cyB3aXRoIGJyb2tlbiBjbG9jawpkaXZp
ZGVyIiksIHRoZSBzcGlubG9jayBpcyBub3QgaW5pdGlhbGl6ZWQgaWYgdGhlIGNsb2NrIGRpdmlk
ZXIgaXMgYnJva2VuLgpJbml0aWFsaXplIGl0IGVhcmxpZXIgdG8gZml4IHRoZSBwcm9ibGVtLgoK
Rml4ZXM6IGVlZGQ2MDMzYjRjOCAoImRybS9wbDExMTogU3VwcG9ydCB2YXJpYW50cyB3aXRoIGJy
b2tlbiBjbG9jayBkaXZpZGVyIikKQ2M6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGlu
YXJvLm9yZz4KU2lnbmVkLW9mZi1ieTogR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0
PgpTaWduZWQtb2ZmLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+
Ckxpbms6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC9tc2dpZC8xNTU3
NzU4NzgxLTIzNTg2LTEtZ2l0LXNlbmQtZW1haWwtbGludXhAcm9lY2stdXMubmV0ClNpZ25lZC1v
ZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vcGwxMTEvcGwxMTFfZGlzcGxheS5jIHwgNSArKystLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
cGwxMTEvcGwxMTFfZGlzcGxheS5jIGIvZHJpdmVycy9ncHUvZHJtL3BsMTExL3BsMTExX2Rpc3Bs
YXkuYwppbmRleCA3NTRmNmIyNWYyNjUyLi42ZDlmNzg2MTJkZWViIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vcGwxMTEvcGwxMTFfZGlzcGxheS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9w
bDExMS9wbDExMV9kaXNwbGF5LmMKQEAgLTUzMSwxNCArNTMxLDE1IEBAIHBsMTExX2luaXRfY2xv
Y2tfZGl2aWRlcihzdHJ1Y3QgZHJtX2RldmljZSAqZHJtKQogCQlkZXZfZXJyKGRybS0+ZGV2LCAi
Q0xDRDogdW5hYmxlIHRvIGdldCBjbGNkY2xrLlxuIik7CiAJCXJldHVybiBQVFJfRVJSKHBhcmVu
dCk7CiAJfQorCisJc3Bpbl9sb2NrX2luaXQoJnByaXYtPnRpbTJfbG9jayk7CisKIAkvKiBJZiB0
aGUgY2xvY2sgZGl2aWRlciBpcyBicm9rZW4sIHVzZSB0aGUgcGFyZW50IGRpcmVjdGx5ICovCiAJ
aWYgKHByaXYtPnZhcmlhbnQtPmJyb2tlbl9jbG9ja2RpdmlkZXIpIHsKIAkJcHJpdi0+Y2xrID0g
cGFyZW50OwogCQlyZXR1cm4gMDsKIAl9CiAJcGFyZW50X25hbWUgPSBfX2Nsa19nZXRfbmFtZShw
YXJlbnQpOwotCi0Jc3Bpbl9sb2NrX2luaXQoJnByaXYtPnRpbTJfbG9jayk7CiAJZGl2LT5pbml0
ID0gJmluaXQ7CiAKIAlyZXQgPSBkZXZtX2Nsa19od19yZWdpc3Rlcihkcm0tPmRldiwgZGl2KTsK
LS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
