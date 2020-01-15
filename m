Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C5713C138
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 13:41:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B65416E9A9;
	Wed, 15 Jan 2020 12:41:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ADF16E9A9
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 12:41:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 80C953F580;
 Wed, 15 Jan 2020 13:41:22 +0100 (CET)
Authentication-Results: pio-pvt-msa3.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=KXnyIQFV; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FkalIzvwkN6R; Wed, 15 Jan 2020 13:41:19 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id EE0D23F57C;
 Wed, 15 Jan 2020 13:41:17 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 26BC8360315;
 Wed, 15 Jan 2020 13:41:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1579092077; bh=GiTFW6X2twKG29NhsaA6D/1fvW6BZJTV6SkcljMbP24=;
 h=From:To:Cc:Subject:Date:From;
 b=KXnyIQFV7pe+g2TkxE9Lz4eksNtJkSUKeRGH4zMQ9ALfzGJCbUS24TlxP0e4aHh2G
 RVOsfCJjpDSh0+OBthv2E+hGrt5UuJGXvifbtpxH6QGr/9Up3cJ+4w9S7Vi+SbK+oy
 /yT1Fl77gDFqahmWtnfwCxwaYVphQEvc9b40bLlU=
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v5 0/2] mm,
 drm/ttm: Fix pte insertion with customized protection
Date: Wed, 15 Jan 2020 13:41:05 +0100
Message-Id: <20200115124107.3845-1-thomas_os@shipmail.org>
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
 Ralph Campbell <rcampbell@nvidia.com>,
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
cm90KCkgZm9yIHVzZSB3aXRoIGRybS90dG0uCgpQYXRjaGVzIGFyZSBhY2tlZCB0byBiZSBtZXJn
ZWQgdGhyb3VnaCBhIGRybSB0cmVlLgoKQ2hhbmdlcyBzaW5jZSB2MToKKikgRm9ybWF0dGluZyBm
aXhlcyBpbiBwYXRjaCAxCiopIFVwZGF0ZWQgY29tbWl0IG1lc3NhZ2Ugb2YgcGF0Y2ggMi4KQ2hh
bmdlcyBzaW5jZSB2MjoKKikgTW92ZWQgdm1mX2luc2VydF9taXhlZF9wcm90KCkgZXhwb3J0IHRv
IHBhdGNoIDIgKE1pY2hhbCBIb2NrbykKKikgRG9jdW1lbnRlZCB1bmRlciB3aGljaCBjb25kaXRp
b25zIGl0J3Mgc2FmZSB0byB1c2UgYSBwYWdlIHByb3RlY3Rpb24KICAgZGlmZmVyZW50IGZyb20g
c3RydWN0IHZtX2FyZWFfc3RydWN0Ojp2bV9wYWdlX3Byb3QuIChNaWNoYWwgSG9ja28pCkNoYW5n
ZXMgc2luY2UgdjM6CiopIE1vcmUgZG9jdW1lbnRhdGlvbiByZWdhcmRpbmcgdW5kZXIgd2hpY2gg
Y29uZGl0aW9ucyBpdCdzIHNhZmUgdG8gdXNlIGEKICAgcGFnZSBwcm90ZWN0aW9uIGRpZmZlcmVu
dCBmcm9tIHN0cnVjdCB2bV9hcmVhX3N0cnVjdDo6dm1fcGFnZV9wcm90LiBUaGlzCiAgIHRpbWUg
YWxzbyBpbiBjb3JlIHZtLiAoTWljaGFsIEhvY2tvKQpDaGFuZ2VzIHNpbmNlIHY0OgoqKSBGaXhl
ZCBhIHR5cG8KKikgQWRkZWQgYWNrcy4KCkNjOiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZv
dW5kYXRpb24ub3JnPgpDYzogTWljaGFsIEhvY2tvIDxtaG9ja29Ac3VzZS5jb20+CkNjOiAiTWF0
dGhldyBXaWxjb3ggKE9yYWNsZSkiIDx3aWxseUBpbmZyYWRlYWQub3JnPgpDYzogIktpcmlsbCBB
LiBTaHV0ZW1vdiIgPGtpcmlsbC5zaHV0ZW1vdkBsaW51eC5pbnRlbC5jb20+CkNjOiBSYWxwaCBD
YW1wYmVsbCA8cmNhbXBiZWxsQG52aWRpYS5jb20+CkNjOiAiSsOpcsO0bWUgR2xpc3NlIiA8amds
aXNzZUByZWRoYXQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+CgotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
