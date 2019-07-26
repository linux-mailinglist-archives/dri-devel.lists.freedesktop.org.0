Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8599C7686A
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 15:44:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC0446ED72;
	Fri, 26 Jul 2019 13:44:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08C416ED72;
 Fri, 26 Jul 2019 13:44:32 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2DBD022BF5;
 Fri, 26 Jul 2019 13:44:31 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 37/37] drm/nouveau: fix memory leak in
 nouveau_conn_reset()
Date: Fri, 26 Jul 2019 09:43:32 -0400
Message-Id: <20190726134332.12626-37-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190726134332.12626-1-sashal@kernel.org>
References: <20190726134332.12626-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1564148671;
 bh=sGdTX6qKLjso5PUS4UyRoXjmf1z7TAMwe0dJsMXsIs8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=u9V/c/YrW+FIXLslmUTT1TD8YGfTc0R16TKobI57+riL6rzGKRxwm08B5/O5HIU0h
 jlZF2HFvTsGEuXFRa/vN35TM4mBm5ufAC42xPEtRhXf2w2mjupv2eP/daSGfc9UWbJ
 pVuTXmb+qB0FpwYvDpElsmIiyjwc9R0KvxYJy9o8=
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
Cc: Sasha Levin <sashal@kernel.org>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Yongxin Liu <yongxin.liu@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogWW9uZ3hpbiBMaXUgPHlvbmd4aW4ubGl1QHdpbmRyaXZlci5jb20+CgpbIFVwc3RyZWFt
IGNvbW1pdCAwOWI5MGUyZmUzNWZhZWFjZTI0ODgyMzRlMmE3NzI4ZjJlYThiYTI2IF0KCkluIG5v
dXZlYXVfY29ubl9yZXNldCgpLCBpZiBjb25uZWN0b3ItPnN0YXRlIGlzIHRydWUsCl9fZHJtX2F0
b21pY19oZWxwZXJfY29ubmVjdG9yX2Rlc3Ryb3lfc3RhdGUoKSB3aWxsIGJlIGNhbGxlZCwKYnV0
IHRoZSBtZW1vcnkgcG9pbnRlZCBieSBhc3ljIGlzbid0IGZyZWVkLiBNZW1vcnkgbGVhayBoYXBw
ZW5zCmluIHRoZSBmb2xsb3dpbmcgZnVuY3Rpb24gX19kcm1fYXRvbWljX2hlbHBlcl9jb25uZWN0
b3JfcmVzZXQoKSwKd2hlcmUgbmV3bHkgYWxsb2NhdGVkIGFzeWMtPnN0YXRlIHdpbGwgYmUgYXNz
aWduZWQgdG8gY29ubmVjdG9yLT5zdGF0ZS4KClNvIHVzaW5nIG5vdXZlYXVfY29ubl9hdG9taWNf
ZGVzdHJveV9zdGF0ZSgpIGluc3RlYWQgb2YKX19kcm1fYXRvbWljX2hlbHBlcl9jb25uZWN0b3Jf
ZGVzdHJveV9zdGF0ZSB0byBmcmVlIHRoZSAib2xkIiBhc3ljLgoKSGVyZSB0aGUgaXMgdGhlIGxv
ZyBzaG93aW5nIG1lbW9yeSBsZWFrLgoKdW5yZWZlcmVuY2VkIG9iamVjdCAweGZmZmY4YzU0ODA0
ODNjODAgKHNpemUgMTkyKToKICBjb21tICJrd29ya2VyLzA6MiIsIHBpZCAxODgsIGppZmZpZXMg
NDI5NDY5NTI3OSAoYWdlIDUzLjE3OXMpCiAgaGV4IGR1bXAgKGZpcnN0IDMyIGJ5dGVzKToKICAg
IDAwIGYwIGJhIDdiIDU0IDhjIGZmIGZmIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwICAuLi57VC4u
Li4uLi4uLi4uCiAgICAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAw
MCAwMCAgLi4uLi4uLi4uLi4uLi4uLgogIGJhY2t0cmFjZToKICAgIFs8MDAwMDAwMDA1MDA1YzBk
MD5dIGttZW1fY2FjaGVfYWxsb2NfdHJhY2UrMHgxOTUvMHgyYzAKICAgIFs8MDAwMDAwMDBhMTIy
YmFlZD5dIG5vdXZlYXVfY29ubl9yZXNldCsweDI1LzB4YzAgW25vdXZlYXVdCiAgICBbPDAwMDAw
MDAwNGZkMTg5YTI+XSBub3V2ZWF1X2Nvbm5lY3Rvcl9jcmVhdGUrMHgzYTcvMHg2MTAgW25vdXZl
YXVdCiAgICBbPDAwMDAwMDAwYzczMzQzYTg+XSBudjUwX2Rpc3BsYXlfY3JlYXRlKzB4MzQzLzB4
OTgwIFtub3V2ZWF1XQogICAgWzwwMDAwMDAwMDJlMmIwM2MzPl0gbm91dmVhdV9kaXNwbGF5X2Ny
ZWF0ZSsweDUxZi8weDY2MCBbbm91dmVhdV0KICAgIFs8MDAwMDAwMDBjOTI0Njk5Yj5dIG5vdXZl
YXVfZHJtX2RldmljZV9pbml0KzB4MTgyLzB4N2YwIFtub3V2ZWF1XQogICAgWzwwMDAwMDAwMGNj
MDI5NDM2Pl0gbm91dmVhdV9kcm1fcHJvYmUrMHgyMGMvMHgyYzAgW25vdXZlYXVdCiAgICBbPDAw
MDAwMDAwN2U5NjFjM2U+XSBsb2NhbF9wY2lfcHJvYmUrMHg0Ny8weGEwCiAgICBbPDAwMDAwMDAw
ZGExNGQ1Njk+XSB3b3JrX2Zvcl9jcHVfZm4rMHgxYS8weDMwCiAgICBbPDAwMDAwMDAwMjhkYTQ4
MDU+XSBwcm9jZXNzX29uZV93b3JrKzB4MjdjLzB4NjYwCiAgICBbPDAwMDAwMDAwMWQ0MTViMDQ+
XSB3b3JrZXJfdGhyZWFkKzB4MjJiLzB4M2YwCiAgICBbPDAwMDAwMDAwMDNiNjlmMWY+XSBrdGhy
ZWFkKzB4MTJmLzB4MTUwCiAgICBbPDAwMDAwMDAwYzk0YzI5Yjc+XSByZXRfZnJvbV9mb3JrKzB4
M2EvMHg1MAoKU2lnbmVkLW9mZi1ieTogWW9uZ3hpbiBMaXUgPHlvbmd4aW4ubGl1QHdpbmRyaXZl
ci5jb20+ClNpZ25lZC1vZmYtYnk6IEJlbiBTa2VnZ3MgPGJza2VnZ3NAcmVkaGF0LmNvbT4KU2ln
bmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfY29ubmVjdG9yLmMgfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Nvbm5lY3Rvci5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvbm91dmVhdV9jb25uZWN0b3IuYwppbmRleCAyYzZkMTk2ODM2ODguLjRhN2Q1MGE5NmQzNiAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9jb25uZWN0b3IuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Nvbm5lY3Rvci5jCkBAIC0yNTEs
NyArMjUxLDcgQEAgbm91dmVhdV9jb25uX3Jlc2V0KHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25u
ZWN0b3IpCiAJCXJldHVybjsKIAogCWlmIChjb25uZWN0b3ItPnN0YXRlKQotCQlfX2RybV9hdG9t
aWNfaGVscGVyX2Nvbm5lY3Rvcl9kZXN0cm95X3N0YXRlKGNvbm5lY3Rvci0+c3RhdGUpOworCQlu
b3V2ZWF1X2Nvbm5fYXRvbWljX2Rlc3Ryb3lfc3RhdGUoY29ubmVjdG9yLCBjb25uZWN0b3ItPnN0
YXRlKTsKIAlfX2RybV9hdG9taWNfaGVscGVyX2Nvbm5lY3Rvcl9yZXNldChjb25uZWN0b3IsICZh
c3ljLT5zdGF0ZSk7CiAJYXN5Yy0+ZGl0aGVyLm1vZGUgPSBESVRIRVJJTkdfTU9ERV9BVVRPOwog
CWFzeWMtPmRpdGhlci5kZXB0aCA9IERJVEhFUklOR19ERVBUSF9BVVRPOwotLSAKMi4yMC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
