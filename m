Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA331DE9D5
	for <lists+dri-devel@lfdr.de>; Fri, 22 May 2020 16:51:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A263C6EA00;
	Fri, 22 May 2020 14:51:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D9476EA00
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 14:51:02 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4A62022254;
 Fri, 22 May 2020 14:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590159062;
 bh=iGPnBlo8kyfDPRdtZjoXDIN1J6IGdWFa/3J4cMiOiuY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=xXu952wxgGcvxLtO1xvp1GziSDCDaIKTp+u0guNOyHs2b8t7AQ99rqq7M4yPTNEpG
 dmWuvFay4563ZVYU4IlLIOjE0WNgHQI2J1z83i7cytlNdekWZgaEaNCNqXqa1juOnY
 dqF/KXjjmQom2RS416/+a7Zo2I8L5lMKGLV9AMGA=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 15/32] drm/amdgpu: Use GEM obj reference for KFD
 BOs
Date: Fri, 22 May 2020 10:50:27 -0400
Message-Id: <20200522145044.434677-15-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200522145044.434677-1-sashal@kernel.org>
References: <20200522145044.434677-1-sashal@kernel.org>
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
Cc: Alex Sierra <alex.sierra@amd.com>, Sasha Levin <sashal@kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+CgpbIFVwc3RyZWFt
IGNvbW1pdCAzOWIzMTI4ZDdmZmQ0NGU0MDBlNTgxZTZmNDllODhjYjQyYmVmOWExIF0KClJlbGVh
c2luZyB0aGUgQU1ER1BVIEJPIHJlZiBkaXJlY3RseSBsZWFkcyB0byBwcm9ibGVtcyB3aGVuIEJP
cyB3ZXJlCmV4cG9ydGVkIGFzIERNQSBidWZzLiBSZWxlYXNpbmcgdGhlIEdFTSByZWZlcmVuY2Ug
bWFrZXMgc3VyZSB0aGF0IHRoZQpBTURHUFUvVFRNIEJPIGlzIG5vdCBmcmVlZCB0b28gZWFybHku
CgpBbHNvIHRha2UgYSBHRU0gcmVmZXJlbmNlIHdoZW4gaW1wb3J0aW5nIEJPcyBmcm9tIERNQUJ1
ZnMgdG8ga2VlcApyZWZlcmVuY2VzIHRvIGltcG9ydGVkIEJPcyBiYWxhbmNlcyBwcm9wZXJseS4K
ClNpZ25lZC1vZmYtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPgpU
ZXN0ZWQtYnk6IEFsZXggU2llcnJhIDxhbGV4LnNpZXJyYUBhbWQuY29tPgpBY2tlZC1ieTogQ2hy
aXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogQWxl
eCBTaWVycmEgPGFsZXguc2llcnJhQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hl
ciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4g
PHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9hbWRrZmRfZ3B1dm0uYyB8IDUgKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2FtZGtmZF9ncHV2bS5jCmluZGV4IDZkMDIxZWNjOGQ1OS4uZWRiNTYxYmFmOGI5IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jCkBA
IC0xMjg4LDcgKzEyODgsNyBAQCBpbnQgYW1kZ3B1X2FtZGtmZF9ncHV2bV9mcmVlX21lbW9yeV9v
Zl9ncHUoCiAJfQogCiAJLyogRnJlZSB0aGUgQk8qLwotCWFtZGdwdV9ib191bnJlZigmbWVtLT5i
byk7CisJZHJtX2dlbV9vYmplY3RfcHV0X3VubG9ja2VkKCZtZW0tPmJvLT50Ym8uYmFzZSk7CiAJ
bXV0ZXhfZGVzdHJveSgmbWVtLT5sb2NrKTsKIAlrZnJlZShtZW0pOwogCkBAIC0xNjMwLDcgKzE2
MzAsOCBAQCBpbnQgYW1kZ3B1X2FtZGtmZF9ncHV2bV9pbXBvcnRfZG1hYnVmKHN0cnVjdCBrZ2Rf
ZGV2ICprZ2QsCiAJCUFNREdQVV9WTV9QQUdFX1JFQURBQkxFIHwgQU1ER1BVX1ZNX1BBR0VfV1JJ
VEVBQkxFIHwKIAkJQU1ER1BVX1ZNX1BBR0VfRVhFQ1VUQUJMRSB8IEFNREdQVV9WTV9NVFlQRV9O
QzsKIAotCSgqbWVtKS0+Ym8gPSBhbWRncHVfYm9fcmVmKGJvKTsKKwlkcm1fZ2VtX29iamVjdF9n
ZXQoJmJvLT50Ym8uYmFzZSk7CisJKCptZW0pLT5ibyA9IGJvOwogCSgqbWVtKS0+dmEgPSB2YTsK
IAkoKm1lbSktPmRvbWFpbiA9IChiby0+cHJlZmVycmVkX2RvbWFpbnMgJiBBTURHUFVfR0VNX0RP
TUFJTl9WUkFNKSA/CiAJCUFNREdQVV9HRU1fRE9NQUlOX1ZSQU0gOiBBTURHUFVfR0VNX0RPTUFJ
Tl9HVFQ7Ci0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
