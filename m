Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B22153132
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 13:54:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C62BD6F587;
	Wed,  5 Feb 2020 12:54:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C214F6F588
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2020 12:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 8B9E13F902;
 Wed,  5 Feb 2020 13:54:24 +0100 (CET)
Authentication-Results: ste-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=fZAGW+Cy; 
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
 with ESMTP id MEvIL9ksFeGq; Wed,  5 Feb 2020 13:54:23 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 7406E3F7D8;
 Wed,  5 Feb 2020 13:54:17 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id B2B743602D9;
 Wed,  5 Feb 2020 13:54:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1580907257; bh=uqpwBVcsjQJiQllfTnNIB29taJ+SX0+Loa9115iuq2E=;
 h=From:To:Cc:Subject:Date:From;
 b=fZAGW+CylBxPmNIOGvDmvzNEsRIRqylU2hsZLzXdaHyBORIBaf3JrP6rqGlZyk5Ox
 KkLIeb7fJ/hO45WbfeUWitOc44I9GMeCiOaAS2aEifx+fQatzUtheAmXOADL8dArIb
 yH6tgo3UsAQ1zkQy2hTP57dXlw0qgRDtDF/4uMV0=
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/9] Huge page-table entries for TTM
Date: Wed,  5 Feb 2020 13:53:44 +0100
Message-Id: <20200205125353.2760-1-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.21.1
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, Michal Hocko <mhocko@suse.com>,
 pv-drivers@vmware.com,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas_os@shipmail.org>,
 Dan Williams <dan.j.williams@intel.com>,
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

SW4gb3JkZXIgdG8gcmVkdWNlIFRMQiBtaXNzZXMgYW5kIENQVSB1c2FnZSB0aGlzIHBhdGNoc2V0
IGVuYWJsZXMgaHVnZS0KYW5kIGdpYW50IHBhZ2UtdGFibGUgZW50cmllcyBmb3IgVFRNIGFuZCBU
VE0tZW5hYmxlZCBncmFwaGljcyBkcml2ZXJzLgoKUGF0Y2ggMSBhbmQgMiBpbnRyb2R1Y2UgYSB2
bWFfaXNfc3BlY2lhbF9odWdlKCkgZnVuY3Rpb24gdG8gbWFrZSB0aGUgbW0gY29kZQp0YWtlIHRo
ZSBzYW1lIHBhdGggYXMgREFYIHdoZW4gc3BsaXR0aW5nIGh1Z2UtIGFuZCBnaWFudCBwYWdlIHRh
YmxlIGVudHJpZXMsCih3aGljaCBjdXJyZW50bHkgbWVhbnMgemFwcGluZyB0aGUgcGFnZS10YWJs
ZSBlbnRyeSBhbmQgcmVseSBvbiByZS1mYXVsdGluZykuCgpQYXRjaCAzIG1ha2VzIHRoZSBtbSBj
b2RlIHNwbGl0IGV4aXN0aW5nIGh1Z2UgcGFnZS10YWJsZSBlbnRyaWVzCm9uIGh1Z2VfZmF1bHQg
ZmFsbGJhY2tzLiBUeXBpY2FsbHkgb24gQ09XIG9yIG9uIGJ1ZmZlci1vYmplY3RzIHRoYXQgd2Fu
dAp3cml0ZS1ub3RpZnkuIENPVyBhbmQgd3JpdGUtbm90aWZpY2F0aW9uIGlzIGFsd2F5cyBkb25l
IG9uIHRoZSBsb3dlc3QKcGFnZS10YWJsZSBsZXZlbC4gU2VlIHRoZSBwYXRjaCBsb2cgbWVzc2Fn
ZSBmb3IgYWRkaXRpb25hbCBjb25zaWRlcmF0aW9ucy4KClBhdGNoIDQgaW50cm9kdWNlcyBmdW5j
dGlvbnMgdG8gYWxsb3cgdGhlIGdyYXBoaWNzIGRyaXZlcnMgdG8gbWFuaXB1bGF0ZQp0aGUgY2Fj
aGluZy0gYW5kIGVuY3J5cHRpb24gZmxhZ3Mgb2YgaHVnZSBwYWdlLXRhYmxlIGVudHJpZXMgd2l0
aG91dCB1Z2x5CmhhY2tzLgoKUGF0Y2ggNSBpbXBsZW1lbnRzIHRoZSBodWdlX2ZhdWx0IGhhbmRs
ZXIgaW4gVFRNLgpUaGlzIGVuYWJsZXMgaHVnZSBwYWdlLXRhYmxlIGVudHJpZXMsIHByb3ZpZGVk
IHRoYXQgdGhlIGtlcm5lbCBpcyBjb25maWd1cmVkCnRvIHN1cHBvcnQgdHJhbnNodWdlIHBhZ2Vz
LCBlaXRoZXIgYnkgZGVmYXVsdCBvciB1c2luZyBtYWR2aXNlKCkuCkhvd2V2ZXIsIHRoZXkgYXJl
IHVubGlrZWx5IHRvIGJlIGluc2VydGVkIHVubGVzcyB0aGUga2VybmVsIGJ1ZmZlciBvYmplY3QK
cGZucyBhbmQgdXNlci1zcGFjZSBhZGRyZXNzZXMgYWxpZ24gcGVyZmVjdGx5LiBUaGVyZSBhcmUg
dmFyaW91cyBvcHRpb25zCmhlcmUsIGJ1dCBzaW5jZSBidWZmZXIgb2JqZWN0cyB0aGF0IHJlc2lk
ZSBpbiBzeXN0ZW0gcGFnZXMgdHlwaWNhbGx5IHN0YXJ0CmF0IGh1Z2UgcGFnZSBib3VuZGFyaWVz
IGlmIHRoZXkgYXJlIGJhY2tlZCBieSBodWdlIHBhZ2VzLCB3ZSB0cnkgdG8gZW5mb3JjZQpidWZm
ZXIgb2JqZWN0IHN0YXJ0aW5nIHBmbnMgYW5kIHVzZXItc3BhY2UgYWRkcmVzc2VzIHRvIGJlIGh1
Z2UgcGFnZS1zaXplCmFsaWduZWQgaWYgdGhlaXIgc2l6ZSBleGNlZWRzIGEgaHVnZSBwYWdlLXNp
emUuIElmIHB1ZC1zaXplIHRyYW5zaHVnZQooImdpYW50IikgcGFnZXMgYXJlIGVuYWJsZWQgYnkg
dGhlIGFyY2gsIHRoZSBzYW1lIGhvbGRzIGZvciB0aG9zZS4KClBhdGNoIDYgaW1wbGVtZW50cyBh
IHNwZWNpYWxpemVkIGh1Z2VfZmF1bHQgaGFuZGxlciBmb3Igdm13Z2Z4LgpUaGUgdm13Z2Z4IGRy
aXZlciBtYXkgcGVyZm9ybSBkaXJ0eS10cmFja2luZyBhbmQgbmVlZHMgc29tZSBzcGVjaWFsIGNv
ZGUKdG8gaGFuZGxlIHRoYXQgY29ycmVjdGx5LgoKUGF0Y2ggNyBpbXBsZW1lbnRzIGEgZHJtIGhl
bHBlciB0byBhbGlnbiB1c2VyLXNwYWNlIGFkZHJlc3NlcyBhY2NvcmRpbmcKdG8gdGhlIGFib3Zl
IHNjaGVtZSwgaWYgcG9zc2libGUuCgpQYXRjaCA4IGltcGxlbWVudHMgYSBUVE0gcmFuZ2UgbWFu
YWdlciBmb3Igdm13Z2Z4IHRoYXQgZG9lcyB0aGUgc2FtZSBmb3IKZ3JhcGhpY3MgSU8gbWVtb3J5
LiBUaGlzIG1heSBsYXRlciBiZSByZXVzZWQgYnkgb3RoZXIgZ3JhcGhpY3MgZHJpdmVycwppZiBu
ZWNlc3NhcnkuCgpQYXRjaCA5IGZpbmFsbHkgaG9va3MgdXAgdGhlIGhlbHBlcnMgb2YgcGF0Y2gg
NyBhbmQgOCB0byB0aGUgdm13Z2Z4IGRyaXZlci4KQSBzaW1pbGFyIGNoYW5nZSBpcyBuZWVkZWQg
Zm9yIGdyYXBoaWNzIGRyaXZlcnMgdGhhdCB3YW50IGEgcmVhc29uYWJsZQpsaWtlbHlob29kIG9m
IGFjdHVhbGx5IHVzaW5nIGh1Z2UgcGFnZS10YWJsZSBlbnRyaWVzLgoKSWYgYSBidWZmZXIgb2Jq
ZWN0IHNpemUgaXMgbm90IGh1Z2UtcGFnZSBvciBnaWFudC1wYWdlIGFsaWduZWQsCml0cyBzaXpl
IHdpbGwgTk9UIGJlIGluZmxhdGVkIGJ5IHRoaXMgcGF0Y2hzZXQuIFRoaXMgbWVhbnMgdGhhdCB0
aGUgYnVmZmVyCm9iamVjdCB0YWlsIHdpbGwgdXNlIHNtYWxsZXIgc2l6ZSBwYWdlLXRhYmxlIGVu
dHJpZXMgYW5kIHRodXMgbm8gbWVtb3J5Cm92ZXJoZWFkIG9jY3Vycy4gRHJpdmVycyB0aGF0IHdh
bnQgdG8gcGF5IHRoZSBtZW1vcnkgb3ZlcmhlYWQgcHJpY2UgbmVlZCB0bwppbXBsZW1lbnQgdGhl
aXIgb3duIHNjaGVtZSB0byBpbmZsYXRlIGJ1ZmZlci1vYmplY3Qgc2l6ZXMuCgpQTUQgc2l6ZSBo
dWdlIHBhZ2UtdGFibGUtZW50cmllcyBoYXZlIGJlZW4gdGVzdGVkIHdpdGggdm13Z2Z4IGFuZCBm
b3VuZCB0bwp3b3JrIHdlbGwgYm90aCB3aXRoIHN5c3RlbSBtZW1vcnkgYmFja2VkIGFuZCBJTyBt
ZW1vcnkgYmFja2VkIGJ1ZmZlciBvYmplY3RzLgoKUFVEIHNpemUgZ2lhbnQgcGFnZS10YWJsZS1l
bnRyaWVzIGhhdmUgc2VlbiBsaW1pdGVkIChmYXVsdCBhbmQgQ09XKSB0ZXN0aW5nCnVzaW5nIGEg
bW9kaWZpZWQga2VybmVsICh0byBzdXBwb3J0IDFHQiBwYWdlIGFsbG9jYXRpb25zKSBhbmQgYSBm
YWtlIHZtd2dmeApUVE0gbWVtb3J5IHR5cGUuIFRoZSB2bXdnZnggZHJpdmVyIGRvZXMgb3RoZXJ3
aXNlIG5vdCBzdXBwb3J0IDFHQi1zaXplIElPCm1lbW9yeSByZXNvdXJjZXMuCgpDb21tZW50cyBh
bmQgc3VnZ2VzdGlvbnMgd2VsY29tZS4KVGhvbWFzCgpDaGFuZ2VzIHNpbmNlIFJGQzoKKiBDaGVj
ayBmb3IgYnVmZmVyIG9iamVjdHMgcHJlc2VudCBpbiBjb250aWdvdXMgSU8gTWVtb3J5IChDaHJp
c3RpYW4gS8O2bmlnKQoqIFJlYmFzZWQgb24gdGhlIHZtd2dmeCBlbXVsYXRlZCBjb2hlcmVudCBt
ZW1vcnkgZnVuY3Rpb25hbGl0eS4gVGhhdCByZWJhc2UKICBhZGRzIHBhdGNoIDUuCkNoYW5nZXMg
c2luY2UgdjE6CiogTWFrZSB0aGUgbmV3IFRUTSByYW5nZSBtYW5hZ2VyIHZtd2dmeC1zcGVjaWZp
Yy4gKENocmlzdGlhbiBLw7ZuaWcpCiogTWlub3IgZml4ZXMgZm9yIGNvbmZpZ3MgdGhhdCBkb24n
dCBzdXBwb3J0IG9yIG9ubHkgcGFydGlhbGx5IHN1cHBvcnQKICB0cmFuc2h1Z2UgcGFnZXMuCkNo
YW5nZXMgc2luY2UgdjI6CiogTWlub3IgY29kaW5nIHN0eWxlIGFuZCBkb2MgZml4ZXMgaW4gcGF0
Y2ggNS85IChDaHJpc3RpYW4gS8O2bmlnKQoqIFBhdGNoIDUvOSBkb2Vzbid0IHRvdWNoIG1tLiBS
ZW1vdmUgZnJvbSB0aGUgcGF0Y2ggdGl0bGUuCgpDYzogQW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51
eC1mb3VuZGF0aW9uLm9yZz4KQ2M6IE1pY2hhbCBIb2NrbyA8bWhvY2tvQHN1c2UuY29tPgpDYzog
Ik1hdHRoZXcgV2lsY294IChPcmFjbGUpIiA8d2lsbHlAaW5mcmFkZWFkLm9yZz4KQ2M6ICJLaXJp
bGwgQS4gU2h1dGVtb3YiIDxraXJpbGwuc2h1dGVtb3ZAbGludXguaW50ZWwuY29tPgpDYzogUmFs
cGggQ2FtcGJlbGwgPHJjYW1wYmVsbEBudmlkaWEuY29tPgpDYzogIkrDqXLDtG1lIEdsaXNzZSIg
PGpnbGlzc2VAcmVkaGF0LmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtv
ZW5pZ0BhbWQuY29tPgpDYzogRGFuIFdpbGxpYW1zIDxkYW4uai53aWxsaWFtc0BpbnRlbC5jb20+
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
