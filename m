Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCB81D331B
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 16:36:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 169306EB57;
	Thu, 14 May 2020 14:36:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABAE76EB54
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 14:36:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: rcn)
 with ESMTPSA id DE0952A2EE9
From: =?UTF-8?q?Ricardo=20Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To: Laurent.pinchart@ideasonboard.com
Subject: [PATCH v2 4/4] drm/bridge: tfp410: Fix setup and hold time calculation
Date: Thu, 14 May 2020 16:36:12 +0200
Message-Id: <20200514143612.2094-5-ricardo.canuelo@collabora.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200514143612.2094-1-ricardo.canuelo@collabora.com>
References: <20200514143612.2094-1-ricardo.canuelo@collabora.com>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, jason@lakedaemon.net, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, tomi.valkeinen@ti.com,
 kernel@collabora.com, shawnguo@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHRmcDQxMCBoYXMgYSBkYXRhIGRlLXNrZXcgZmVhdHVyZSB0aGF0IGFsbG93cyB0aGUgdXNl
ciB0byBjb21wZW5zYXRlCnRoZSBza2V3IGJldHdlZW4gSURDSyBhbmQgdGhlIHBpeGVsIGRhdGEg
YW5kIGNvbnRyb2wgc2lnbmFscy4KCkluIHRoZSBkcml2ZXIsIHRoZSBzZXR1cCBhbmQgaG9sZCB0
aW1lcyBhcmUgY2FsY3VsYXRlZCBmcm9tIHRoZSBkZS1za2V3CnZhbHVlLiBUaGlzIHJldHJpZXZl
cyB0aGUgZGVza2V3IHZhbHVlIGZyb20gdGhlIERUIHVzaW5nIHRoZSBwcm9wZXIKZGF0YXR5cGUg
YW5kIHJhbmdlIGNoZWNrIGFzIGRlc2NyaWJlZCBieSB0aGUgYmluZGluZyAodTMyIGZyb20gMCB0
byA3KQphbmQgZml4ZXMgdGhlIGNhbGN1bGF0aW9uIG9mIHRoZSBzZXR1cCBhbmQgaG9sZCB0aW1l
cy4KClNpZ25lZC1vZmYtYnk6IFJpY2FyZG8gQ2HDsXVlbG8gPHJpY2FyZG8uY2FudWVsb0Bjb2xs
YWJvcmEuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktdGZwNDEwLmMgfCAxMCAr
KysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktdGZwNDEwLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXRmcDQxMC5jCmluZGV4IGUzZWI2MzY0YzBmNy4uMjFkOTli
NGVhMGM5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXRmcDQxMC5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktdGZwNDEwLmMKQEAgLTIyMCw3ICsyMjAsNyBA
QCBzdGF0aWMgaW50IHRmcDQxMF9wYXJzZV90aW1pbmdzKHN0cnVjdCB0ZnA0MTAgKmR2aSwgYm9v
bCBpMmMpCiAJc3RydWN0IGRldmljZV9ub2RlICplcDsKIAl1MzIgcGNsa19zYW1wbGUgPSAwOwog
CXUzMiBidXNfd2lkdGggPSAyNDsKLQlzMzIgZGVza2V3ID0gMDsKKwl1MzIgZGVza2V3ID0gMDsK
IAogCS8qIFN0YXJ0IHdpdGggZGVmYXVsdHMuICovCiAJKnRpbWluZ3MgPSB0ZnA0MTBfZGVmYXVs
dF90aW1pbmdzOwpAQCAtMjc0LDEyICsyNzQsMTIgQEAgc3RhdGljIGludCB0ZnA0MTBfcGFyc2Vf
dGltaW5ncyhzdHJ1Y3QgdGZwNDEwICpkdmksIGJvb2wgaTJjKQogCX0KIAogCS8qIEdldCB0aGUg
c2V0dXAgYW5kIGhvbGQgdGltZSBmcm9tIHZlbmRvci1zcGVjaWZpYyBwcm9wZXJ0aWVzLiAqLwot
CW9mX3Byb3BlcnR5X3JlYWRfdTMyKGR2aS0+ZGV2LT5vZl9ub2RlLCAidGksZGVza2V3IiwgKHUz
MiAqKSZkZXNrZXcpOwotCWlmIChkZXNrZXcgPCAtNCB8fCBkZXNrZXcgPiAzKQorCW9mX3Byb3Bl
cnR5X3JlYWRfdTMyKGR2aS0+ZGV2LT5vZl9ub2RlLCAidGksZGVza2V3IiwgJmRlc2tldyk7CisJ
aWYgKGRlc2tldyA+IDcpCiAJCXJldHVybiAtRUlOVkFMOwogCi0JdGltaW5ncy0+c2V0dXBfdGlt
ZV9wcyA9IG1pbigwLCAxMjAwIC0gMzUwICogZGVza2V3KTsKLQl0aW1pbmdzLT5ob2xkX3RpbWVf
cHMgPSBtaW4oMCwgMTMwMCArIDM1MCAqIGRlc2tldyk7CisJdGltaW5ncy0+c2V0dXBfdGltZV9w
cyA9IDEyMDAgLSAzNTAgKiAoKHMzMilkZXNrZXcgLSA0KTsKKwl0aW1pbmdzLT5ob2xkX3RpbWVf
cHMgPSBtYXgoMCwgMTMwMCArIDM1MCAqICgoczMyKWRlc2tldyAtIDQpKTsKIAogCXJldHVybiAw
OwogfQotLSAKMi4xOC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
