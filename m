Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7D7114D83
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 09:24:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 536FC6E1A4;
	Fri,  6 Dec 2019 08:24:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEBE76E1A4
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2019 08:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 287773F75E;
 Fri,  6 Dec 2019 09:24:40 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FQ2pQL1NH5QI; Fri,  6 Dec 2019 09:24:39 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 2874D3F474;
 Fri,  6 Dec 2019 09:24:35 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 3B8E8360444;
 Fri,  6 Dec 2019 09:24:35 +0100 (CET)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/2] mm,
 drm/ttm: Fix pte insertion with customized protection
Date: Fri,  6 Dec 2019 09:24:24 +0100
Message-Id: <20191206082426.2958-1-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1575620675; bh=FbjXjConCWpl9D7NzHUuQJAAWSH6BvlqXngEj2FOI2k=;
 h=From:To:Cc:Subject:Date:From;
 b=jtyozgdPg7eF4uwWKzoX6eopVxU0N8T+QqhLK557afs1OiH9jWZEFKGMVfd8rlROl
 B4k+tt3UvJzYA/lhDgBDf5nHSJSq5r8D8Jr1TEhJSEJ71lkCV9Z3o9i5nIPfbAGzZp
 lkw5F7LriybPk0K7wz2tpwtk/U6K50mRYC8nBoT0=
X-Mailman-Original-Authentication-Results: ste-pvt-msa1.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=jtyozgdP; 
 dkim-atps=neutral
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
bV9hcmVhX3N0cnVjdDo6dm1fcGFnZV9wcm90LiAoTWljaGFsIEhvY2tvKQoKQ2M6IEFuZHJldyBN
b3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+CkNjOiBNaWNoYWwgSG9ja28gPG1ob2Nr
b0BzdXNlLmNvbT4KQ2M6ICJNYXR0aGV3IFdpbGNveCAoT3JhY2xlKSIgPHdpbGx5QGluZnJhZGVh
ZC5vcmc+CkNjOiAiS2lyaWxsIEEuIFNodXRlbW92IiA8a2lyaWxsLnNodXRlbW92QGxpbnV4Lmlu
dGVsLmNvbT4KQ2M6IFJhbHBoIENhbXBiZWxsIDxyY2FtcGJlbGxAbnZpZGlhLmNvbT4KQ2M6ICJK
w6lyw7RtZSBHbGlzc2UiIDxqZ2xpc3NlQHJlZGhhdC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5p
ZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
