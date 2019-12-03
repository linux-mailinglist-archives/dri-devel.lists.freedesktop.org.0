Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB4A10FEA4
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 14:23:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08AA76E524;
	Tue,  3 Dec 2019 13:23:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD3C6E524
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 13:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id EFE6E3F490;
 Tue,  3 Dec 2019 14:23:02 +0100 (CET)
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
 with ESMTP id EpLTpw4cJgOd; Tue,  3 Dec 2019 14:22:51 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 0939C3F528;
 Tue,  3 Dec 2019 14:22:49 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id ECF713624F0;
 Tue,  3 Dec 2019 14:22:48 +0100 (CET)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 0/8] Huge page-table entries for TTM
Date: Tue,  3 Dec 2019 14:22:31 +0100
Message-Id: <20191203132239.5910-1-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1575379369; bh=LcP+CiM/H2qFU6XdEOkpDvMlsyScoUvfGPuZbgRkIhM=;
 h=From:To:Cc:Subject:Date:From;
 b=Ffcmxdyvf3CJxPEnVFfaz/xCs1ZBTpu9IO8AsYSEKxDCRX+EKzN+Urt2FqNbJTvhd
 scnDixrYtHjWC/93KWP3fG/TDC7slvA7vUGThO7Bc5e4mwVToMK/QtQmApVfm080Bk
 m1VWzvkfN8Zpxg+yJNg2gj8fMZPdIHKW1cyB8IlU=
X-Mailman-Original-Authentication-Results: pio-pvt-msa3.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=Ffcmxdyv; 
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, Michal Hocko <mhocko@suse.com>,
 pv-drivers@vmware.com,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas_os@shipmail.org>,
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

SW4gb3JkZXIgdG8gc2F2ZSBUTEIgc3BhY2UgYW5kIENQVSB1c2FnZSB0aGlzIHBhdGNoc2V0IGVu
YWJsZXMgaHVnZS0gYW5kIGdpYW50CnBhZ2UtdGFibGUgZW50cmllcyBmb3IgVFRNIGFuZCBUVE0t
ZW5hYmxlZCBncmFwaGljcyBkcml2ZXJzLgoKUGF0Y2ggMSBpbnRyb2R1Y2VzIGEgdm1hX2lzX3Nw
ZWNpYWxfaHVnZSgpIGZ1bmN0aW9uIHRvIG1ha2UgdGhlIG1tIGNvZGUKdGFrZSB0aGUgc2FtZSBw
YXRoIGFzIERBWCB3aGVuIHNwbGl0dGluZyBodWdlLSBhbmQgZ2lhbnQgcGFnZSB0YWJsZSBlbnRy
aWVzLAood2hpY2ggY3VycmVudGx5IGlzIHphcHBpbmcgdGhlIHBhZ2UtdGFibGUgZW50cnkgYW5k
IHJlbHkgb24gcmUtZmF1bHRpbmcpLgoKUGF0Y2ggMiBtYWtlcyB0aGUgbW0gY29kZSBzcGxpdCBl
eGlzdGluZyBodWdlIHBhZ2UtdGFibGUgZW50cmllcwpvbiBodWdlX2ZhdWx0IGZhbGxiYWNrcy4g
VHlwaWNhbGx5IG9uIENPVyBvciBvbiBidWZmZXItb2JqZWN0cyB0aGF0IHdhbnQKd3JpdGUtbm90
aWZ5LiBDT1cgYW5kIHdyaXRlLW5vdGlmaWNhdGlvbiBpcyBhbHdheXMgZG9uZSBvbiB0aGUgbG93
ZXN0CnBhZ2UtdGFibGUgbGV2ZWwuIFNlZSB0aGUgcGF0Y2ggbG9nIG1lc3NhZ2UgZm9yIGFkZGl0
aW9uYWwgY29uc2lkZXJhdGlvbnMuCgpQYXRjaCAzIGludHJvZHVjZXMgZnVuY3Rpb25zIHRvIGFs
bG93IHRoZSBncmFwaGljcyBkcml2ZXJzIHRvIG1hbmlwdWxhdGUKdGhlIGNhY2hpbmctIGFuZCBl
bmNyeXB0aW9uIGZsYWdzIG9mIGh1Z2UgcGFnZS10YWJsZSBlbnRyaWVzIHdpdGhvdXQgdWdseQpo
YWNrcy4KClBhdGNoIDQgaW1wbGVtZW50cyB0aGUgaHVnZV9mYXVsdCBoYW5kbGVyIGluIFRUTS4K
VGhpcyBlbmFibGVzIGh1Z2UgcGFnZS10YWJsZSBlbnRyaWVzLCBwcm92aWRlZCB0aGF0IHRoZSBr
ZXJuZWwgaXMgY29uZmlndXJlZAp0byBzdXBwb3J0IHRyYW5zaHVnZSBwYWdlcywgZWl0aGVyIGJ5
IGRlZmF1bHQgb3IgdXNpbmcgbWFkdmlzZSgpLgpIb3dldmVyLCB0aGV5IGFyZSB1bmxpa2VseSB0
byBiZSBpbnNlcnRlZCB1bmxlc3MgdGhlIGtlcm5lbCBidWZmZXIgb2JqZWN0CnBmbnMgYW5kIHVz
ZXItc3BhY2UgYWRkcmVzc2VzIGFsaWduIHBlcmZlY3RseS4gVGhlcmUgYXJlIHZhcmlvdXMgb3B0
aW9ucwpoZXJlLCBidXQgc2luY2UgYnVmZmVyIG9iamVjdHMgdGhhdCByZXNpZGUgaW4gc3lzdGVt
IHBhZ2VzIHR5cGljYWxseSBzdGFydAphdCBodWdlIHBhZ2UgYm91bmRhcmllcyBpZiB0aGV5IGFy
ZSBiYWNrZWQgYnkgaHVnZSBwYWdlcywgd2UgdHJ5IHRvIGVuZm9yY2UKYnVmZmVyIG9iamVjdCBz
dGFydGluZyBwZm5zIGFuZCB1c2VyLXNwYWNlIGFkZHJlc3NlcyB0byBiZSBodWdlIHBhZ2Utc2l6
ZQphbGlnbmVkIGlmIHRoZWlyIHNpemUgZXhjZWVkcyBhIGh1Z2UgcGFnZS1zaXplLiBJZiBwdWQt
c2l6ZSB0cmFuc2h1Z2UKKCJnaWFudCIpIHBhZ2VzIGFyZSBlbmFibGVkIGJ5IHRoZSBhcmNoLCB0
aGUgc2FtZSBob2xkcyBmb3IgdGhvc2UuCgpQYXRjaCA1IGltcGxlbWVudHMgYSBzcGVjaWFsaXpl
ZCBodWdlX2ZhdWx0IGhhbmRsZXIgZm9yIHZtd2dmeC4KVGhlIHZtd2dmeCBkcml2ZXIgbWF5IHBl
cmZvcm0gZGlydHktdHJhY2tpbmcgYW5kIG5lZWRzIHNvbWUgc3BlY2lhbCBjb2RlCnRvIGhhbmRs
ZSB0aGF0IGNvcnJlY3RseS4KClBhdGNoIDYgaW1wbGVtZW50cyBhIGRybSBoZWxwZXIgdG8gYWxp
Z24gdXNlci1zcGFjZSBhZGRyZXNzZXMgYWNjb3JkaW5nCnRvIHRoZSBhYm92ZSBzY2hlbWUsIGlm
IHBvc3NpYmxlLgoKUGF0Y2ggNyBpbXBsZW1lbnRzIGEgVFRNIHJhbmdlIG1hbmFnZXIgdGhhdCBk
b2VzIHRoZSBzYW1lIGZvciBncmFwaGljcyBJTwptZW1vcnkuCgpQYXRjaCA4IGZpbmFsbHkgaG9v
a3MgdXAgdGhlIGhlbHBlcnMgb2YgcGF0Y2ggNiBhbmQgNyB0byB0aGUgdm13Z2Z4IGRyaXZlci4K
QSBzaW1pbGFyIGNoYW5nZSBpcyBuZWVkZWQgZm9yIGdyYXBoaWNzIGRyaXZlcnMgdGhhdCB3YW50
IGEgcmVhc29uYWJsZQpsaWtlbHlob29kIG9mIGFjdHVhbGx5IHVzaW5nIGh1Z2UgcGFnZS10YWJs
ZSBlbnRyaWVzLgoKRmluYWxseSwgaWYgYSBidWZmZXIgb2JqZWN0IHNpemUgaXMgbm90IGh1Z2Ut
cGFnZSBvciBnaWFudC1wYWdlIGFsaWduZWQsCml0cyBzaXplIHdpbGwgTk9UIGJlIGluZmxhdGVk
IGJ5IHRoaXMgcGF0Y2hzZXQuIFRoaXMgbWVhbnMgdGhhdCB0aGUgYnVmZmVyCm9iamVjdCB0YWls
IHdpbGwgdXNlIHNtYWxsZXIgc2l6ZSBwYWdlLXRhYmxlIGVudHJpZXMgYW5kIHRodXMgbm8gbWVt
b3J5Cm92ZXJoZWFkIG9jY3Vycy4gRHJpdmVycyB0aGF0IHdhbnQgdG8gcGF5IHRoZSBtZW1vcnkg
b3ZlcmhlYWQgcHJpY2UgbmVlZCB0bwppbXBsZW1lbnQgdGhlaXIgb3duIHNjaGVtZSB0byBpbmZs
YXRlIGJ1ZmZlci1vYmplY3Qgc2l6ZXMuCgpQTUQgc2l6ZSBodWdlIHBhZ2UtdGFibGUtZW50cmll
cyBoYXZlIGJlZW4gdGVzdGVkIHdpdGggdm13Z2Z4IGFuZCBmb3VuZCB0bwp3b3JrIHdlbGwgYm90
aCB3aXRoIHN5c3RlbSBtZW1vcnkgYmFja2VkIGFuZCBJTyBtZW1vcnkgYmFja2VkIGJ1ZmZlciBv
YmplY3RzLgoKUFVEIHNpemUgZ2lhbnQgcGFnZS10YWJsZS1lbnRyaWVzIGhhdmUgc2VlbiBsaW1p
dGVkIChmYXVsdCBhbmQgQ09XKSB0ZXN0aW5nCnVzaW5nIGEgbW9kaWZpZWQga2VybmVsIGFuZCBh
IGZha2Ugdm13Z2Z4IFRUTSBtZW1vcnkgdHlwZS4gVGhlIHZtd2dmeCBkcml2ZXIKZG9lcyBvdGhl
cndpc2Ugbm90IHN1cHBvcnQgMUdCLXNpemUgSU8gbWVtb3J5IHJlc291cmNlcy4KCkNvbW1lbnRz
IGFuZCBzdWdnZXN0aW9ucyB3ZWxjb21lLgpUaG9tYXMKCkNoYW5nZXMgc2luY2UgUkZDOgoqIENo
ZWNrIGZvciBidWZmZXIgb2JqZWN0cyBwcmVzZW50IGluIGNvbnRpZ291cyBJTyBNZW1vcnkgKENo
cmlzdGlhbiBLw7ZuaWcpCiogUmViYXNlZCBvbiB0aGUgdm13Z2Z4IGVtdWxhdGVkIGNvaGVyZW50
IG1lbW9yeSBmdW5jdGlvbmFsaXR5LiBUaGF0IHJlYmFzZQogIGFkZHMgcGF0Y2ggNS4KCkNjOiBB
bmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPgpDYzogTWljaGFsIEhvY2tv
IDxtaG9ja29Ac3VzZS5jb20+CkNjOiAiTWF0dGhldyBXaWxjb3ggKE9yYWNsZSkiIDx3aWxseUBp
bmZyYWRlYWQub3JnPgpDYzogIktpcmlsbCBBLiBTaHV0ZW1vdiIgPGtpcmlsbC5zaHV0ZW1vdkBs
aW51eC5pbnRlbC5jb20+CkNjOiBSYWxwaCBDYW1wYmVsbCA8cmNhbXBiZWxsQG52aWRpYS5jb20+
CkNjOiAiSsOpcsO0bWUgR2xpc3NlIiA8amdsaXNzZUByZWRoYXQuY29tPgpDYzogIkNocmlzdGlh
biBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
