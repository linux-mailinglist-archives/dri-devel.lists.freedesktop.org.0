Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C3911C86C
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 09:48:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58A656ECB6;
	Thu, 12 Dec 2019 08:47:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1C486ECB9
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 08:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id C884A3F6CD;
 Thu, 12 Dec 2019 09:47:55 +0100 (CET)
Authentication-Results: pio-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="Mc3PJome";
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aCEnIeV4ScUj; Thu, 12 Dec 2019 09:47:54 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 4C2F03F6B7;
 Thu, 12 Dec 2019 09:47:51 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 58B18360058;
 Thu, 12 Dec 2019 09:47:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1576140471; bh=WCmaxQxE246ATYHNdSLCAZVTtLU+QzBOONzmhrSKgp0=;
 h=From:To:Cc:Subject:Date:From;
 b=Mc3PJomeKXRmiQW2ddGpYTi4r2bfKnJZSb0lSqs86LaVAhtgwqyw5BzrMf24Zjx0/
 zQxrf9pKLMxenmVrFb80rXG2yDDfbEab4Mkkk7Afubluix7y+yewt0D1IhZZu4l8rR
 1Ur3y9pp02CROTOoc2iOk0Yb3Eu+JsbjPVvkaODQ=
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v4 0/2] mm,
 drm/ttm: Fix pte insertion with customized protection
Date: Thu, 12 Dec 2019 09:47:39 +0100
Message-Id: <20191212084741.9251-1-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.21.0
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, Michal Hocko <mhocko@suse.com>,
 pv-drivers@vmware.com, Ralph Campbell <rcampbell@nvidia.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-graphics-maintainer@vmware.com,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgoKVGhlIGRybS90
dG0gbW9kdWxlIGlzIHVzaW5nIGEgbW9kaWZpZWQgb24tc3RhY2sgY29weSBvZiB0aGUKc3RydWN0
IHZtX2FyZWFfc3RydWN0IHRvIGJlIGFibGUgdG8gc2V0IGEgcGFnZSBwcm90ZWN0aW9uIHdpdGgg
Y3VzdG9taXplZApjYWNoaW5nLiBGaXggdGhhdCBieSBhZGRpbmcgYSB2bWZfaW5zZXJ0X21peGVk
X3Byb3QoKSBmdW5jdGlvbiBzaW1pbGFyCnRvIHRoZSBleGlzdGluZyB2bWZfaW5zZXJ0X3Bmbl9w
cm90KCkgZm9yIHVzZSB3aXRoIGRybS90dG0uCgpJJ2QgbGlrZSB0byBtZXJnZSB0aGlzIHRocm91
Z2ggYSBkcm0gdHJlZS4KCkNoYW5nZXMgc2luY2UgdjE6CiopIEZvcm1hdHRpbmcgZml4ZXMgaW4g
cGF0Y2ggMQoqKSBVcGRhdGVkIGNvbW1pdCBtZXNzYWdlIG9mIHBhdGNoIDIuCkNoYW5nZXMgc2lu
Y2UgdjI6CiopIE1vdmVkIHZtZl9pbnNlcnRfbWl4ZWRfcHJvdCgpIGV4cG9ydCB0byBwYXRjaCAy
IChNaWNoYWwgSG9ja28pCiopIERvY3VtZW50ZWQgdW5kZXIgd2hpY2ggY29uZGl0aW9ucyBpdCdz
IHNhZmUgdG8gdXNlIGEgcGFnZSBwcm90ZWN0aW9uCiAgIGRpZmZlcmVudCBmcm9tIHN0cnVjdCB2
bV9hcmVhX3N0cnVjdDo6dm1fcGFnZV9wcm90LiAoTWljaGFsIEhvY2tvKQpDaGFuZ2VzIHNpbmNl
IHYzOgoqKSBNb3JlIGRvY3VtZW50YXRpb24gcmVnYXJkaW5nIHVuZGVyIHdoaWNoIGNvbmRpdGlv
bnMgaXQncyBzYWZlIHRvIHVzZSBhCiAgIHBhZ2UgcHJvdGVjdGlvbiBkaWZmZXJlbnQgZnJvbSBz
dHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3Q6OnZtX3BhZ2VfcHJvdC4gVGhpcwogICB0aW1lIGFsc28gaW4g
Y29yZSB2bS4gKE1pY2hhbCBIb2NrbykKCkNjOiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZv
dW5kYXRpb24ub3JnPgpDYzogTWljaGFsIEhvY2tvIDxtaG9ja29Ac3VzZS5jb20+CkNjOiAiTWF0
dGhldyBXaWxjb3ggKE9yYWNsZSkiIDx3aWxseUBpbmZyYWRlYWQub3JnPgpDYzogIktpcmlsbCBB
LiBTaHV0ZW1vdiIgPGtpcmlsbC5zaHV0ZW1vdkBsaW51eC5pbnRlbC5jb20+CkNjOiBSYWxwaCBD
YW1wYmVsbCA8cmNhbXBiZWxsQG52aWRpYS5jb20+CkNjOiAiSsOpcsO0bWUgR2xpc3NlIiA8amds
aXNzZUByZWRoYXQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+CgotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
