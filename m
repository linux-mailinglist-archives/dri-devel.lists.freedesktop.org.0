Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F50A34EC91
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 17:34:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 345EB6E921;
	Tue, 30 Mar 2021 15:34:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mengyan1223.wang (mengyan1223.wang [89.208.246.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6374B6E921;
 Tue, 30 Mar 2021 15:34:35 +0000 (UTC)
Received: from xry111-X57S1.. (unknown
 [IPv6:240e:35a:1037:8a00:70b2:e35d:833c:af3e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (Client did not present a certificate)
 (Authenticated sender: xry111@mengyan1223.wang)
 by mengyan1223.wang (Postfix) with ESMTPSA id 536386594D;
 Tue, 30 Mar 2021 11:34:20 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mengyan1223.wang;
 s=mail; t=1617118474;
 bh=E9uzJ2n1hFC18R1jMFthKg1gWzK5bofu21stYTwkJoo=;
 h=From:To:Cc:Subject:Date:From;
 b=1S7zq7qygFhaboB0wDdtkxcOCCrRWc5zG0DVbbjctvEIh2YPWGepr16K+DKQ34QtO
 vZSvzH2VaHuHvjBxj7zcRVXhBgXzh1+PmbhnayfNvWzih1l8VDztADbPCX3uG1ybP8
 X8HnU/OJPhli25bFWf2SZVE+U9XL1e28LecLCmY8ugdt7pB05IzVhYV1eG/zkWDH5v
 wNv58IpgrCL4B65Jthj8YqUnuccF7a4HxI2/ECrXnZXer38PDq5+MUzmuyjkjZ0esv
 FwXABm/1Uu1V9BtG2JWXIJpRgzeaWEsm23FAGerbK03jKG0HKuXKC6kcRnqay4c9+Y
 cte5a3GQ2R+Nw==
From: =?UTF-8?q?X=E2=84=B9=20Ruoyao?= <xry111@mengyan1223.wang>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 0/2] ensure alignment on CPU page for bo mapping
Date: Tue, 30 Mar 2021 23:33:32 +0800
Message-Id: <20210330153334.44570-1-xry111@mengyan1223.wang>
X-Mailer: git-send-email 2.31.1
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
Cc: =?UTF-8?q?Dan=20Hor=C3=A1k?= <dan@danny.cz>,
 Huacai Chen <chenhuacai@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 =?UTF-8?q?X=E2=84=B9=20Ruoyao?= <xry111@mengyan1223.wang>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gQU1ER1BVIGRyaXZlciwgdGhlIGJvIG1hcHBpbmcgc2hvdWxkIGFsd2F5cyBhbGlnbiB0byBD
UFUgcGFnZSBvcgp0aGUgcGFnZSB0YWJsZSBpcyBjb3JydXB0ZWQuCgpUaGUgZmlyc3QgcGF0Y2gg
aXMgY2hlcnJ5LXBpY2tlZCBmcm9tIExvb25nc29uIGNvbW11bml0eSwgd2hpY2ggc2V0cyBhCnN1
aXRhYmxlIGRldl9pbmZvLmdhcnRfcGFnZV9zaXplIHNvIE1lc2Egd2lsbCBoYW5kbGUgdGhlIGFs
aWdubWVudApjb3JyZWN0bHkuCgpUaGUgc2Vjb25kIHBhdGNoIGlzIGFkZGVkIHRvIGVuc3VyZSBh
biBpb2N0bCB3aXRoIHVuYWxpZ25lZCBwYXJhbWV0ZXIgdG8KYmUgcmVqZWN0ZWQgLUVJTlZBTCwg
aW5zdGVhZCBvZiBjYXVzaW5nIHBhZ2UgdGFibGUgY29ycnVwdGlvbi4KClRoZSBwYXRjaGVzIHNo
b3VsZCBiZSBhcHBsaWVkIGZvciBkcm0tbmV4dC4KCkh1YWNhaSBDaGVuICgxKToKICBkcm0vYW1k
Z3B1OiBTZXQgYSBzdWl0YWJsZSBkZXZfaW5mby5nYXJ0X3BhZ2Vfc2l6ZQoKWOKEuSBSdW95YW8g
KDEpOgogIGRybS9hbWRncHU6IGNoZWNrIGFsaWdubWVudCBvbiBDUFUgcGFnZSBmb3IgYm8gbWFw
CgogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ttcy5jIHwgNCArKy0tCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYyAgfCA4ICsrKystLS0tCiAyIGZpbGVz
IGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCgpiYXNlLWNvbW1pdDog
YTBjOGIxOTNiZmU4MWNjOGU5YzdjMTYyYmI4ZDc3N2JhMTI1OTZmMAotLSAKMi4zMS4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
