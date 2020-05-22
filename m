Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 748091DE9AE
	for <lists+dri-devel@lfdr.de>; Fri, 22 May 2020 16:50:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B68C6E9FB;
	Fri, 22 May 2020 14:50:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BC7A6E853
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 14:50:21 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A3F8022227;
 Fri, 22 May 2020 14:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590159021;
 bh=/5gUvaIeXL5/SvAcmLxJzXgwL0RfqCvuytXsSmHeWtk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Q/bJFEsx/zNRrb8UlPdlo0OXT0y+C1kRBchYO1zMh7P6H3F95ptzUuLYbcX3Z5mNE
 DSfGcKOdQbmi4keNVkX9OOkgVgSF6xFGJmmLjoGoHLf1+r5MiXyvtF+28PF6Ay3CM7
 h/KFQT2vOAnLK1immSxVBP6EQopd+Xg+y8wMEW44=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.6 19/41] drm/amdgpu: Use GEM obj reference for KFD
 BOs
Date: Fri, 22 May 2020 10:49:36 -0400
Message-Id: <20200522144959.434379-19-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200522144959.434379-1-sashal@kernel.org>
References: <20200522144959.434379-1-sashal@kernel.org>
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
Z3B1X2FtZGtmZF9ncHV2bS5jCmluZGV4IGZhOGFjOWQxOWE3YS4uNjMyNmMxNzkyMjcwIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jCkBA
IC0xMzA0LDcgKzEzMDQsNyBAQCBpbnQgYW1kZ3B1X2FtZGtmZF9ncHV2bV9mcmVlX21lbW9yeV9v
Zl9ncHUoCiAJfQogCiAJLyogRnJlZSB0aGUgQk8qLwotCWFtZGdwdV9ib191bnJlZigmbWVtLT5i
byk7CisJZHJtX2dlbV9vYmplY3RfcHV0X3VubG9ja2VkKCZtZW0tPmJvLT50Ym8uYmFzZSk7CiAJ
bXV0ZXhfZGVzdHJveSgmbWVtLT5sb2NrKTsKIAlrZnJlZShtZW0pOwogCkBAIC0xNjQ3LDcgKzE2
NDcsOCBAQCBpbnQgYW1kZ3B1X2FtZGtmZF9ncHV2bV9pbXBvcnRfZG1hYnVmKHN0cnVjdCBrZ2Rf
ZGV2ICprZ2QsCiAJCSBBTExPQ19NRU1fRkxBR1NfVlJBTSA6IEFMTE9DX01FTV9GTEFHU19HVFQp
IHwKIAkJQUxMT0NfTUVNX0ZMQUdTX1dSSVRBQkxFIHwgQUxMT0NfTUVNX0ZMQUdTX0VYRUNVVEFC
TEU7CiAKLQkoKm1lbSktPmJvID0gYW1kZ3B1X2JvX3JlZihibyk7CisJZHJtX2dlbV9vYmplY3Rf
Z2V0KCZiby0+dGJvLmJhc2UpOworCSgqbWVtKS0+Ym8gPSBibzsKIAkoKm1lbSktPnZhID0gdmE7
CiAJKCptZW0pLT5kb21haW4gPSAoYm8tPnByZWZlcnJlZF9kb21haW5zICYgQU1ER1BVX0dFTV9E
T01BSU5fVlJBTSkgPwogCQlBTURHUFVfR0VNX0RPTUFJTl9WUkFNIDogQU1ER1BVX0dFTV9ET01B
SU5fR1RUOwotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
