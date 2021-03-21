Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B45634341C
	for <lists+dri-devel@lfdr.de>; Sun, 21 Mar 2021 19:46:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E00689FEC;
	Sun, 21 Mar 2021 18:46:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FD6A89FED
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Mar 2021 18:46:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id AA3483F63C;
 Sun, 21 Mar 2021 19:46:10 +0100 (CET)
Authentication-Results: ste-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=RmWTAfau; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Authentication-Results: ste-ftg-msa2.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iRxq6b07VQNg; Sun, 21 Mar 2021 19:46:09 +0100 (CET)
Received: by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 535103FEC9;
 Sun, 21 Mar 2021 19:46:08 +0100 (CET)
Received: from localhost.localdomain (2.70.38.73.mobile.tre.se [2.70.38.73])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 60178361E58;
 Sun, 21 Mar 2021 19:46:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1616352368; bh=tpeEGuLEfQbIt3oYJJ199Odz5KIao0YiVWQXjQK8Lz8=;
 h=From:To:Cc:Subject:Date:From;
 b=RmWTAfauY4F3Mp79+y8c8xmdXcwmIyMEawbzs1nWiS50q/d34+9fMyikQDrWwmL7r
 JQewrmix+tKc9qc01LwSAIazwqYJGlwnJ4hOQ5q5C7AkB9dAJN3Tm4HQ9qyX1TQ6rI
 +SrDCDkneIo5NT8q+PUBouUIxexKDxTFW7yihLuE=
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28Intel=29?=
 <thomas_os@shipmail.org>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 0/2] mm,drm/ttm: Always block GUP to TTM pages
Date: Sun, 21 Mar 2021 19:45:27 +0100
Message-Id: <20210321184529.59006-1-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.30.2
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
Cc: Jason Gunthorpe <jgg@nvidia.com>, David Airlie <airlied@linux.ie>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28Intel=29?= <thomas_os@shipmail.org>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Z2V0X3VzZXJfcGFnZXMoKSB0byBUVE0gcGFnZXMgaXMgdXdhbnRlZCBzaW5jZSBUVE0gYXNzdW1l
cyBpdCBvd25zCnRoZSBwYWdlcyBleGNsdXNpdmVseSBhbmQgLyBvciBzZXRzIHVwIHBhZ2UtdGFi
bGUgbWFwcGluZ3MgdG8gaW8gbWVtb3J5LgoKVGhlIGZpcnN0IHBhdGNoIG1ha2Ugc3VyZXMgd2Ug
c3RvcCBmYXN0IGd1cCB0byBodWdlIFRUTSBwYWdlcyB1c2luZwphIHRyaWNrIHdpdGggcG1kX2Rl
dm1hcCgpIGFuZCBwdWRfZGV2bWFwKCkgd2l0aG91dCBhIGJhY2tpbmcKZGV2X3BhZ2VtYXAuCgpU
aGUgc2Vjb25kIHBhdGNoIG1ha2VzIHN1cmUgd2UgYmxvY2sgbm9ybWFsIGd1cCBieSBzZXR0aW5n
IFZNX1BGTk1BUAoKQ2M6IENocmlzdGlhbiBLb2VuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNv
bT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIg
PGRhbmllbEBmZndsbC5jaD4KQ2M6IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlv
bi5vcmc+CkNjOiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BudmlkaWEuY29tPgpDYzogbGludXgtbW1A
a3ZhY2sub3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBsaW51eC1r
ZXJuZWxAdmdlci5rZXJuZWwub3JnClNpZ25lZC1vZmYtYnk6IFRob21hcyBIZWxsc3Ryw7ZtIChJ
bnRlbCkgPHRob21hc19vc0BzaGlwbWFpbC5vcmc+Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
