Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D87D6B92
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 00:12:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EF7A6E339;
	Mon, 14 Oct 2019 22:12:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 686DF6E330;
 Mon, 14 Oct 2019 22:12:53 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5da4f2e90000>; Mon, 14 Oct 2019 15:12:57 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 14 Oct 2019 15:12:52 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 14 Oct 2019 15:12:52 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 14 Oct
 2019 22:12:52 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 14 Oct 2019 22:12:52 +0000
Received: from jajones-aftershock.nvidia.com (Not Verified[172.20.40.63]) by
 hqnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5da4f2e40000>; Mon, 14 Oct 2019 15:12:52 -0700
From: James Jones <jajones@nvidia.com>
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm: Generalized NV Block Linear DRM format mod
Date: Mon, 14 Oct 2019 15:13:20 -0700
Message-ID: <20191014221321.8163-1-jajones@nvidia.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1571091177; bh=DpUsHNWgfOMHC7uh5vZMsW+lpKal+jwwkdVsjG7c57Q=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 MIME-Version:Content-Type;
 b=YsyndEm7Zcg75J3HUj4KkyQ+5ZC9tsx5gqRWnFOJv6T0i6t/4Wqd5YcEB9PZ3p1Ci
 1vbgl1oIJ4GrzSMANGAyoLX2kb4HJyHoK/y6liCsN/cH0ZQvXF9RlH5yUN8T96TBq1
 jyWdhiWKj3lg63kKnPEcszVYsdRAME+oYs5KZWWW/YVIOV4OhoBfhrbvFc8cQAixwp
 Kr8fKiRmSeJfuoN/Z14v9QHnVt2Ock90ET7V//jDXTYliZWubeFnjjWT0q/1X/t+iH
 a/UhSk2pf3qpdUVqUWDOuJCxsvNrNnJrwUII/3+CcIPHVOrMagnccT1YsZHlDUwb5j
 ZIPgLEiJCiUTg==
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QmV5b25kIGdlbmVyYWwgcmV2aWV3LCBJJ20gbG9va2luZyBmb3IgZmVlZGJhY2sgb24gYSBmZXcg
dGhpbmdzCnNwZWNpZmljYWxseSBoZXJlOgoKLUlzIHRoZSBsZXZlbCBvZiBiYWNrd2FyZHMgY29t
cGF0aWJpbGl0eSBkZXNjcmliZWQgaGVyZSBzdWZmaWNpZW50PwogVGVjaG5pY2FsbHkgSSBjYW4g
bWFrZSB0aGUgdXNlciBzcGFjZSBkcml2ZXJzIHN1cHBvcnQgdGhlIG9sZAogbW9kaWZpZXJzIHRv
bywgYnV0IHRoYXQgd291bGQgbWVhbiB0aGUgbGF5b3V0IHRoZXkgc3BlY2lmeSB3b3VsZAogbW9y
cGggYmFzZWQgb24gdGhlIEdQVSB0aGV5J3JlIGJlaW5nIHVzZWQgb24sIGFuZCBzaGFyaW5nIGJ1
ZmZlcnMKIGJldHdlZW4gdHdvIGRpZmZlcmVudCBOViBHUFVzLCB3aGljaCB3b3VsZCBhcHBlYXIg
dG8gYmUgcG9zc2libGUsCiB3b3VsZCByZXN1bHQgaW4gY29ycnVwdGlvbiBvbiBvbmUgc2lkZSBv
ciB0aGUgb3RoZXIuCgotSSB1c2VkICJtYWdpYyIgbnVtYmVycyBmb3IgYWxsIHRoZSBiaXQgc2hp
ZnRpbmcuICBXb3VsZCBpdCBiZQogYmV0dGVyIHRvIHVzZSBfX2ZvdXJjY19YWFggY29uc3RhbnRz
IGxpa2UgdGhlIGJyb2FkY29tIG1vZGlmaWVycwogZG8/ICBJIHdhc24ndCBzdXJlIHdoaWNoIHN0
eWxlIHdhcyBwcmVmZXJyZWQuICBUaGUgbm91dmVhdSBjb2RlIGlzCiBmdWxsIG9mIG1hZ2ljIG51
bWJlcnMsIGJ1dCB0aGF0J3MgYSBiaXQgbG93ZXIgbGV2ZWwgdGhhbiB0aGlzIGZpbGUuCgpJZiBw
cmVmZXJyZWQsIEkgY2FuIHNlbmQgdGhpcyBvdXQgYXMgcGFydCBvZiBhIHBhdGNoc2V0IHRoYXQg
YWRkcwpzdXBwb3J0IGZvciB0aGUgbW9kaWZpZXJzIHRvIG5vdXZlYXUgYW5kIFRlZ3JhRFJNLCBi
dXQgSSBoYXZlIHNvbWUKdGhpbmdzIHRvIGNsZWFuIHVwIHRoZXJlIGJlZm9yZSBpdCdzIHJlYWR5
IGZvciBwcm9wZXIgcmV2aWV3LCBhbmQKSSBkaWRuJ3Qgd2FudCB0byBibG9jayByZXZpZXcgb2Yg
dGhlIGJhc2ljIG1vZGlmaWVyIGxheW91dCBvbiB0aGF0CndvcmsuCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
