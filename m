Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBB010ABD0
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 09:32:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A696D89C33;
	Wed, 27 Nov 2019 08:32:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3373C6E372
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 08:32:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id CE8CA41CE1;
 Wed, 27 Nov 2019 09:32:14 +0100 (CET)
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
 with ESMTP id 6TwXtQa_G2Zk; Wed, 27 Nov 2019 09:32:05 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 11C9B41BA4;
 Wed, 27 Nov 2019 09:32:02 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 378D3360140;
 Wed, 27 Nov 2019 09:32:02 +0100 (CET)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-graphics-maintainer@vmware.com
Subject: [RFC PATCH 0/7] Huge page-table entries for TTM
Date: Wed, 27 Nov 2019 09:31:13 +0100
Message-Id: <20191127083120.34611-1-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1574843522; bh=Og4luRQdluh+hAMeX8+BJha1sCbiLJlldQtmSpb2990=;
 h=From:To:Cc:Subject:Date:From;
 b=KFQNLPu2ssbAmbmSpaB/4Liu4TF37qg9ct9Iy4I7iR2RDRYvn6IUmptkZ5amxQbgW
 CEcw6ILpLYYfsjaNOriLp8hcEl+lVPKqDbUMwsP0w8+mVtPxs6o8RcV4Rs+oaA66y3
 mFL+3G6a6skaGARalHB7+HRkxOCyRD/aYPEeGXUQ=
X-Mailman-Original-Authentication-Results: pio-pvt-msa1.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="KFQNLPu2";
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
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas_os@shipmail.org>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
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
aWVzLAood2hpY2ggaXMgemFwcGluZyB0aGUgcGFnZS10YWJsZSBlbnRyeSBhbmQgcmVseSBvbiBy
ZS1mYXVsdGluZykuCgpQYXRjaCAyIG1ha2VzIHRoZSBtbSBjb2RlIHNwbGl0IGV4aXN0aW5nIGh1
Z2UgcGFnZS10YWJsZSBlbnRyaWVzCm9uIGh1Z2VfZmF1bHQgZmFsbGJhY2tzLiBUeXBpY2FsbHkg
b24gQ09XIG9yIG9uIGJ1ZmZlci1vYmplY3RzIHRoYXQgd2FudAp3cml0ZS1ub3RpZnkuIENPVyBh
bmQgd3JpdGUtbm90aWZpY2F0aW9uIGlzIGFsd2F5cyBkb25lIG9uIHRoZSBsb3dlc3QKcGFnZS10
YWJsZSBsZXZlbC4gU2VlIHRoZSBwYXRjaCBsb2cgbWVzc2FnZSBmb3IgYWRkaXRpb25hbCBjb25z
aWRlcmF0aW9ucy4KClBhdGNoIDMgaW50cm9kdWNlcyBmdW5jdGlvbnMgdG8gYWxsb3cgdGhlIGdy
YXBoaWNzIGRyaXZlcnMgdG8gbWFuaXB1bGF0ZQp0aGUgY2FjaGluZy0gYW5kIGVuY3J5cHRpb24g
ZmxhZ3Mgb2YgaHVnZSBwYWdlLXRhYmxlIGVudHJpZXMgd2l0aG91dCB1Z2x5CmhhY2tzLgoKUGF0
Y2ggNCBpbXBsZW1lbnRzIHRoZSBodWdlX2ZhdWx0IGhhbmRsZXIgaW4gVFRNLgoKVGhpcyBlbmFi
bGVzIGh1Z2UgcGFnZS10YWJsZSBlbnRyaWVzLCBwcm92aWRlZCB0aGF0IHRoZSBrZXJuZWwgaXMg
Y29uZmlndXJlZAp0byBzdXBwb3J0IHRyYW5zaHVnZSBwYWdlcywgZWl0aGVyIGJ5IGRlZmF1bHQg
b3IgdXNpbmcgbWFkdmlzZSgpLgpIb3dldmVyLCB0aGV5IGFyZSB1bmxpa2VseSB0byBiZSBpbnNl
cnRlZCB1bmxlc3MgdGhlIGtlcm5lbCBidWZmZXIgb2JqZWN0CnBmbnMgYW5kIHVzZXItc3BhY2Ug
YWRkcmVzc2VzIGFsaWduIHBlcmZlY3RseS4gVGhlcmUgYXJlIHZhcmlvdXMgb3B0aW9ucwpoZXJl
LCBidXQgc2luY2UgYnVmZmVyIG9iamVjdHMgdGhhdCByZXNpZGUgaW4gc3lzdGVtIHBhZ2VzIHR5
cGljYWxseSBzdGFydAphdCBodWdlIHBhZ2UgYm91bmRhcmllcyBpZiB0aGV5IGFyZSBiYWNrZWQg
YnkgaHVnZSBwYWdlcywgd2UgdHJ5IHRvIGVuZm9yY2UKYnVmZmVyIG9iamVjdCBzdGFydGluZyBw
Zm5zIGFuZCB1c2VyLXNwYWNlIGFkZHJlc3NlcyB0byBiZSBodWdlIHBhZ2Utc2l6ZQphbGlnbmVk
IGlmIHRoZWlyIHNpemUgZXhjZWVkcyBhIGh1Z2UgcGFnZS1zaXplLiBJZiBwdWQtc2l6ZSB0cmFu
c2h1Z2UKKCJnaWFudCIpIHBhZ2VzIGFyZSBlbmFibGVkIGJ5IHRoZSBhcmNoLCB0aGUgc2FtZSBo
b2xkcyBmb3IgdGhvc2UuCgpQYXRjaCA1IGltcGxlbWVudHMgYSBkcm0gaGVscGVyIHRvIGFsaWdu
IHVzZXItc3BhY2UgYWRkcmVzc2VzIGFjY29yZGluZwp0byB0aGUgYWJvdmUgc2NoZW1lLCBpZiBw
b3NzaWJsZS4KClBhdGNoIDYgaW1wbGVtZW50cyBhIFRUTSByYW5nZSBtYW5hZ2VyIHRoYXQgZG9l
cyB0aGUgc2FtZSBmb3IgZ3JhcGhpY3MgSU8KbWVtb3J5LgoKUGF0Y2ggNyBmaW5hbGx5IGhvb2tz
IHVwIHRoZSBoZWxwZXJzIG9mIHBhdGNoIDUgYW5kIDYgdG8gdGhlIHZtd2dmeCBkcml2ZXIuCkEg
c2ltaWxhciBjaGFuZ2UgaXMgbmVlZGVkIGZvciBncmFwaGljcyBkcml2ZXJzIHRoYXQgd2FudHMg
YSByZWFzb25hYmxlCmxpa2VseWhvb2Qgb2YgYWN0dWFsbHkgdXNpbmcgaHVnZSBwYWdlLXRhYmxl
IGVudHJpZXMuCgpGaW5hbGx5LCBpZiBhIGJ1ZmZlciBvYmplY3Qgc2l6ZSBpcyBub3QgaHVnZS1w
YWdlIG9yIGdpYW50LXBhZ2UgYWxpZ25lZCwKaXRzIHNpemUgd2lsbCBOT1QgYmUgaW5mbGF0ZWQg
YnkgdGhpcyBwYXRjaHNldC4gVGhpcyBtZWFucyB0aGF0IHRoZSBidWZmZXIKb2JqZWN0IHRhaWwg
d2lsbCB1c2Ugc21hbGxlciBzaXplIHBhZ2UtdGFibGUgZW50cmllcyBhbmQgdGh1cyBubyBtZW1v
cnkKb3ZlcmhlYWQgb2NjdXJzLiBEcml2ZXJzIHRoYXQgd2FudCB0byBwYXkgdGhlIG1lbW9yeSBv
dmVyaGVhZCBwcmljZSBuZWVkIHRvCmltcGxlbWVudCB0aGVpciBvd24gc2NoZW1lIHRvIGluZmxh
dGUgYnVmZmVyLW9iamVjdCBzaXplcy4KClBNRCBzaXplIGh1Z2UgcGFnZS10YWJsZS1lbnRyaWVz
IGhhdmUgYmVlbiB0ZXN0ZWQgd2l0aCB2bXdnZnggYW5kIGZvdW5kIHRvCndvcmsgd2VsbCBib3Ro
IHdpdGggc3lzdGVtIG1lbW9yeSBiYWNrZWQgYW5kIElPIG1lbW9yeSBiYWNrZWQgYnVmZmVyIG9i
amVjdHMuCgpQVUQgc2l6ZSBnaWFudCBwYWdlLXRhYmxlLWVudHJpZXMgaGF2ZSBzZWVuIGxpbWl0
ZWQgKGZhdWx0IGFuZCBDT1cpIHRlc3RpbmcKdXNpbmcgYSBtb2RpZmllZCBrZXJuZWwgYW5kIGEg
ZmFrZSB2bXdnZnggVFRNIG1lbW9yeSB0eXBlLiBUaGUgdm13Z2Z4IGRyaXZlcgpkb2VzIG90aGVy
d2lzZSBub3Qgc3VwcG9ydCAxR0Itc2l6ZSBJTyBtZW1vcnkgcmVzb3VyY2VzLgoKQ29tbWVudHMg
YW5kIHN1Z2dlc3Rpb25zIHdlbGNvbWUuClRob21hcwoKCkNjOiBBbmRyZXcgTW9ydG9uIDxha3Bt
QGxpbnV4LWZvdW5kYXRpb24ub3JnPgpDYzogTWljaGFsIEhvY2tvIDxtaG9ja29Ac3VzZS5jb20+
CkNjOiAiTWF0dGhldyBXaWxjb3ggKE9yYWNsZSkiIDx3aWxseUBpbmZyYWRlYWQub3JnPgpDYzog
IktpcmlsbCBBLiBTaHV0ZW1vdiIgPGtpcmlsbC5zaHV0ZW1vdkBsaW51eC5pbnRlbC5jb20+CkNj
OiBSYWxwaCBDYW1wYmVsbCA8cmNhbXBiZWxsQG52aWRpYS5jb20+CkNjOiAiSsOpcsO0bWUgR2xp
c3NlIiA8amdsaXNzZUByZWRoYXQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
