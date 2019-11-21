Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC316104B36
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 08:14:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D51F96EB13;
	Thu, 21 Nov 2019 07:14:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEFBA6EB1B
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 07:14:01 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dd639320003>; Wed, 20 Nov 2019 23:13:54 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Wed, 20 Nov 2019 23:13:58 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Wed, 20 Nov 2019 23:13:58 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 21 Nov
 2019 07:13:57 +0000
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 21 Nov
 2019 07:13:57 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 21 Nov 2019 07:13:57 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dd639350003>; Wed, 20 Nov 2019 23:13:57 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v7 22/24] mm/gup_benchmark: support pin_user_pages() and
 related calls
Date: Wed, 20 Nov 2019 23:13:52 -0800
Message-ID: <20191121071354.456618-23-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191121071354.456618-1-jhubbard@nvidia.com>
References: <20191121071354.456618-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1574320434; bh=2VikNfsXV53SqX6j47kop4rTtKhfcK4SlvrERtv5mQ4=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=OBYRSNb7XvkjtCHQfyNXnCXDl0b23Ba1L7n3qnKSSYA8cwKX8I23T3VKw6rJ0d9Mv
 294+RQqWq8IF3BtmkSZjyZT4KsT8zj4cIMD2hhGv4KG0W10lLklySApaY+IsnURCi1
 AR19nJz0WdvTNUiAmKezg9RWiLeOsUXgTGlDJIpRItC2S5xZkeq7riaBnAACmZf4HR
 Km/cwqVEEljPZ0c1uzfmkMzXS0md1z8g+MuSWABaC9tu5nVsp/mmP+ITpgZuFqJ2zn
 xrD1TYMqvZsjJKh7Hhd6JRxiI/8IGF+V7LYf77tkMzU4xpFJXD5B7kbogQwRbTuDlq
 7G4AzUgK/J9Jw==
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Paul
 Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXAgdW50aWwgbm93LCBndXBfYmVuY2htYXJrIHN1cHBvcnRlZCB0ZXN0aW5nIG9mIHRoZQpmb2xs
b3dpbmcga2VybmVsIGZ1bmN0aW9uczoKCiogZ2V0X3VzZXJfcGFnZXMoKTogdmlhIHRoZSAnLVUn
IGNvbW1hbmQgbGluZSBvcHRpb24KKiBnZXRfdXNlcl9wYWdlc19sb25ndGVybSgpOiB2aWEgdGhl
ICctTCcgY29tbWFuZCBsaW5lIG9wdGlvbgoqIGdldF91c2VyX3BhZ2VzX2Zhc3QoKTogYXMgdGhl
IGRlZmF1bHQgKG5vIG9wdGlvbnMgcmVxdWlyZWQpCgpBZGQgdGVzdCBjb3ZlcmFnZSBmb3IgdGhl
IG5ldyBjb3JyZXNwb25kaW5nIHBpbl8qKCkgZnVuY3Rpb25zOgoKKiBwaW5fdXNlcl9wYWdlcygp
OiB2aWEgdGhlICctYycgY29tbWFuZCBsaW5lIG9wdGlvbgoqIHBpbl91c2VyX3BhZ2VzX2Zhc3Qo
KTogdmlhIHRoZSAnLWInIGNvbW1hbmQgbGluZSBvcHRpb24KCkFsc28sIGFkZCBhbiBvcHRpb24g
Zm9yIGNsYXJpdHk6ICctdScgZm9yIHdoYXQgaXMgbm93IChzdGlsbCkgdGhlCmRlZmF1bHQgY2hv
aWNlOiBnZXRfdXNlcl9wYWdlc19mYXN0KCkuCgpBbHNvLCBmb3IgdGhlIGNvbW1hbmRzIHRoYXQg
c2V0IEZPTExfUElOLCB2ZXJpZnkgdGhhdCB0aGUgcGFnZXMKcmVhbGx5IGFyZSBkbWEtcGlubmVk
LCB2aWEgdGhlIG5ldyBpc19kbWFfcGlubmVkKCkgcm91dGluZS4KVGhvc2UgY29tbWFuZHMgYXJl
OgoKICAgIFBJTl9GQVNUX0JFTkNITUFSSyAgICAgOiBjYWxscyBwaW5fdXNlcl9wYWdlc19mYXN0
KCkKICAgIFBJTl9CRU5DSE1BUksgICAgICAgICAgOiBjYWxscyBwaW5fdXNlcl9wYWdlcygpCgpJ
biBiZXR3ZWVuIHRoZSBjYWxscyB0byBwaW5fKigpIGFuZCBwdXRfdXNlcl9wYWdlcygpLApjaGVj
ayBlYWNoIHBhZ2U6IGlmIHBhZ2VfZG1hX3Bpbm5lZCgpIHJldHVybnMgZmFsc2UsIHRoZW4KV0FS
TiBhbmQgcmV0dXJuLgoKRG8gdGhpcyBvdXRzaWRlIG9mIHRoZSBiZW5jaG1hcmsgdGltZXN0YW1w
cywgc28gdGhhdCBpdCBkb2Vzbid0CmFmZmVjdCByZXBvcnRlZCB0aW1lcy4KCkNjOiBJcmEgV2Vp
bnkgPGlyYS53ZWlueUBpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IEpvaG4gSHViYmFyZCA8amh1
YmJhcmRAbnZpZGlhLmNvbT4KLS0tCiBtbS9ndXBfYmVuY2htYXJrLmMgICAgICAgICAgICAgICAg
ICAgICAgICAgfCA2NSArKysrKysrKysrKysrKysrKysrKy0tCiB0b29scy90ZXN0aW5nL3NlbGZ0
ZXN0cy92bS9ndXBfYmVuY2htYXJrLmMgfCAxNSArKysrLQogMiBmaWxlcyBjaGFuZ2VkLCA3NCBp
bnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21tL2d1cF9iZW5jaG1h
cmsuYyBiL21tL2d1cF9iZW5jaG1hcmsuYwppbmRleCA3ZmM0NGQyNWVjYTcuLjFhYzA4OWFkODE1
ZiAxMDA2NDQKLS0tIGEvbW0vZ3VwX2JlbmNobWFyay5jCisrKyBiL21tL2d1cF9iZW5jaG1hcmsu
YwpAQCAtOCw2ICs4LDggQEAKICNkZWZpbmUgR1VQX0ZBU1RfQkVOQ0hNQVJLCV9JT1dSKCdnJywg
MSwgc3RydWN0IGd1cF9iZW5jaG1hcmspCiAjZGVmaW5lIEdVUF9MT05HVEVSTV9CRU5DSE1BUksJ
X0lPV1IoJ2cnLCAyLCBzdHJ1Y3QgZ3VwX2JlbmNobWFyaykKICNkZWZpbmUgR1VQX0JFTkNITUFS
SwkJX0lPV1IoJ2cnLCAzLCBzdHJ1Y3QgZ3VwX2JlbmNobWFyaykKKyNkZWZpbmUgUElOX0ZBU1Rf
QkVOQ0hNQVJLCV9JT1dSKCdnJywgNCwgc3RydWN0IGd1cF9iZW5jaG1hcmspCisjZGVmaW5lIFBJ
Tl9CRU5DSE1BUksJCV9JT1dSKCdnJywgNSwgc3RydWN0IGd1cF9iZW5jaG1hcmspCiAKIHN0cnVj
dCBndXBfYmVuY2htYXJrIHsKIAlfX3U2NCBnZXRfZGVsdGFfdXNlYzsKQEAgLTE5LDYgKzIxLDQy
IEBAIHN0cnVjdCBndXBfYmVuY2htYXJrIHsKIAlfX3U2NCBleHBhbnNpb25bMTBdOwkvKiBGb3Ig
ZnV0dXJlIHVzZSAqLwogfTsKIAorc3RhdGljIHZvaWQgcHV0X2JhY2tfcGFnZXMoaW50IGNtZCwg
c3RydWN0IHBhZ2UgKipwYWdlcywgdW5zaWduZWQgbG9uZyBucl9wYWdlcykKK3sKKwlpbnQgaTsK
KworCXN3aXRjaCAoY21kKSB7CisJY2FzZSBHVVBfRkFTVF9CRU5DSE1BUks6CisJY2FzZSBHVVBf
TE9OR1RFUk1fQkVOQ0hNQVJLOgorCWNhc2UgR1VQX0JFTkNITUFSSzoKKwkJZm9yIChpID0gMDsg
aSA8IG5yX3BhZ2VzOyBpKyspCisJCQlwdXRfcGFnZShwYWdlc1tpXSk7CisJCWJyZWFrOworCisJ
Y2FzZSBQSU5fRkFTVF9CRU5DSE1BUks6CisJY2FzZSBQSU5fQkVOQ0hNQVJLOgorCQlwdXRfdXNl
cl9wYWdlcyhwYWdlcywgbnJfcGFnZXMpOworCQlicmVhazsKKwl9Cit9CisKK3N0YXRpYyB2b2lk
IHZlcmlmeV9kbWFfcGlubmVkKGludCBjbWQsIHN0cnVjdCBwYWdlICoqcGFnZXMsCisJCQkgICAg
ICB1bnNpZ25lZCBsb25nIG5yX3BhZ2VzKQoreworCWludCBpOworCisJc3dpdGNoIChjbWQpIHsK
KwljYXNlIFBJTl9GQVNUX0JFTkNITUFSSzoKKwljYXNlIFBJTl9CRU5DSE1BUks6CisJCWZvciAo
aSA9IDA7IGkgPCBucl9wYWdlczsgaSsrKSB7CisJCQlpZiAoV0FSTighcGFnZV9kbWFfcGlubmVk
KHBhZ2VzW2ldKSwKKwkJCQkgInBhZ2VzWyVkXSBpcyBOT1QgZG1hLXBpbm5lZFxuIiwgaSkpCisJ
CQkJYnJlYWs7CisJCX0KKwkJYnJlYWs7CisJfQorfQorCiBzdGF0aWMgaW50IF9fZ3VwX2JlbmNo
bWFya19pb2N0bCh1bnNpZ25lZCBpbnQgY21kLAogCQlzdHJ1Y3QgZ3VwX2JlbmNobWFyayAqZ3Vw
KQogewpAQCAtNjUsNiArMTAzLDE0IEBAIHN0YXRpYyBpbnQgX19ndXBfYmVuY2htYXJrX2lvY3Rs
KHVuc2lnbmVkIGludCBjbWQsCiAJCQluciA9IGdldF91c2VyX3BhZ2VzKGFkZHIsIG5yLCBndXAt
PmZsYWdzLCBwYWdlcyArIGksCiAJCQkJCSAgICBOVUxMKTsKIAkJCWJyZWFrOworCQljYXNlIFBJ
Tl9GQVNUX0JFTkNITUFSSzoKKwkJCW5yID0gcGluX3VzZXJfcGFnZXNfZmFzdChhZGRyLCBuciwg
Z3VwLT5mbGFncywKKwkJCQkJCSBwYWdlcyArIGkpOworCQkJYnJlYWs7CisJCWNhc2UgUElOX0JF
TkNITUFSSzoKKwkJCW5yID0gcGluX3VzZXJfcGFnZXMoYWRkciwgbnIsIGd1cC0+ZmxhZ3MsIHBh
Z2VzICsgaSwKKwkJCQkJICAgIE5VTEwpOworCQkJYnJlYWs7CiAJCWRlZmF1bHQ6CiAJCQlyZXR1
cm4gLTE7CiAJCX0KQEAgLTc1LDE1ICsxMjEsMjIgQEAgc3RhdGljIGludCBfX2d1cF9iZW5jaG1h
cmtfaW9jdGwodW5zaWduZWQgaW50IGNtZCwKIAl9CiAJZW5kX3RpbWUgPSBrdGltZV9nZXQoKTsK
IAorCS8qIFNoaWZ0aW5nIHRoZSBtZWFuaW5nIG9mIG5yX3BhZ2VzOiBub3cgaXQgaXMgYWN0dWFs
IG51bWJlciBwaW5uZWQ6ICovCisJbnJfcGFnZXMgPSBpOworCiAJZ3VwLT5nZXRfZGVsdGFfdXNl
YyA9IGt0aW1lX3VzX2RlbHRhKGVuZF90aW1lLCBzdGFydF90aW1lKTsKIAlndXAtPnNpemUgPSBh
ZGRyIC0gZ3VwLT5hZGRyOwogCisJLyoKKwkgKiBUYWtlIGFuIHVuLWJlbmNobWFyay10aW1lZCBt
b21lbnQgdG8gdmVyaWZ5IERNQSBwaW5uZWQKKwkgKiBzdGF0ZTogcHJpbnQgYSB3YXJuaW5nIGlm
IGFueSBub24tZG1hLXBpbm5lZCBwYWdlcyBhcmUgZm91bmQ6CisJICovCisJdmVyaWZ5X2RtYV9w
aW5uZWQoY21kLCBwYWdlcywgbnJfcGFnZXMpOworCiAJc3RhcnRfdGltZSA9IGt0aW1lX2dldCgp
OwotCWZvciAoaSA9IDA7IGkgPCBucl9wYWdlczsgaSsrKSB7Ci0JCWlmICghcGFnZXNbaV0pCi0J
CQlicmVhazsKLQkJcHV0X3BhZ2UocGFnZXNbaV0pOwotCX0KKworCXB1dF9iYWNrX3BhZ2VzKGNt
ZCwgcGFnZXMsIG5yX3BhZ2VzKTsKKwogCWVuZF90aW1lID0ga3RpbWVfZ2V0KCk7CiAJZ3VwLT5w
dXRfZGVsdGFfdXNlYyA9IGt0aW1lX3VzX2RlbHRhKGVuZF90aW1lLCBzdGFydF90aW1lKTsKIApA
QCAtMTAxLDYgKzE1NCw4IEBAIHN0YXRpYyBsb25nIGd1cF9iZW5jaG1hcmtfaW9jdGwoc3RydWN0
IGZpbGUgKmZpbGVwLCB1bnNpZ25lZCBpbnQgY21kLAogCWNhc2UgR1VQX0ZBU1RfQkVOQ0hNQVJL
OgogCWNhc2UgR1VQX0xPTkdURVJNX0JFTkNITUFSSzoKIAljYXNlIEdVUF9CRU5DSE1BUks6CisJ
Y2FzZSBQSU5fRkFTVF9CRU5DSE1BUks6CisJY2FzZSBQSU5fQkVOQ0hNQVJLOgogCQlicmVhazsK
IAlkZWZhdWx0OgogCQlyZXR1cm4gLUVJTlZBTDsKZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL3ZtL2d1cF9iZW5jaG1hcmsuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Zt
L2d1cF9iZW5jaG1hcmsuYwppbmRleCAzODkzMjdlOWIzMGEuLjQzYjRkZmUxNjFhMiAxMDA2NDQK
LS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvdm0vZ3VwX2JlbmNobWFyay5jCisrKyBiL3Rv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3ZtL2d1cF9iZW5jaG1hcmsuYwpAQCAtMTgsNiArMTgsMTAg
QEAKICNkZWZpbmUgR1VQX0xPTkdURVJNX0JFTkNITUFSSwlfSU9XUignZycsIDIsIHN0cnVjdCBn
dXBfYmVuY2htYXJrKQogI2RlZmluZSBHVVBfQkVOQ0hNQVJLCQlfSU9XUignZycsIDMsIHN0cnVj
dCBndXBfYmVuY2htYXJrKQogCisvKiBTaW1pbGFyIHRvIGFib3ZlLCBidXQgdXNlIEZPTExfUElO
IGluc3RlYWQgb2YgRk9MTF9HRVQuICovCisjZGVmaW5lIFBJTl9GQVNUX0JFTkNITUFSSwlfSU9X
UignZycsIDQsIHN0cnVjdCBndXBfYmVuY2htYXJrKQorI2RlZmluZSBQSU5fQkVOQ0hNQVJLCQlf
SU9XUignZycsIDUsIHN0cnVjdCBndXBfYmVuY2htYXJrKQorCiAvKiBKdXN0IHRoZSBmbGFncyB3
ZSBuZWVkLCBjb3BpZWQgZnJvbSBtbS5oOiAqLwogI2RlZmluZSBGT0xMX1dSSVRFCTB4MDEJLyog
Y2hlY2sgcHRlIGlzIHdyaXRhYmxlICovCiAKQEAgLTQwLDggKzQ0LDE0IEBAIGludCBtYWluKGlu
dCBhcmdjLCBjaGFyICoqYXJndikKIAljaGFyICpmaWxlID0gIi9kZXYvemVybyI7CiAJY2hhciAq
cDsKIAotCXdoaWxlICgob3B0ID0gZ2V0b3B0KGFyZ2MsIGFyZ3YsICJtOnI6bjpmOnRUTFV3U0gi
KSkgIT0gLTEpIHsKKwl3aGlsZSAoKG9wdCA9IGdldG9wdChhcmdjLCBhcmd2LCAibTpyOm46Zjph
YnRUTFV1d1NIIikpICE9IC0xKSB7CiAJCXN3aXRjaCAob3B0KSB7CisJCWNhc2UgJ2EnOgorCQkJ
Y21kID0gUElOX0ZBU1RfQkVOQ0hNQVJLOworCQkJYnJlYWs7CisJCWNhc2UgJ2InOgorCQkJY21k
ID0gUElOX0JFTkNITUFSSzsKKwkJCWJyZWFrOwogCQljYXNlICdtJzoKIAkJCXNpemUgPSBhdG9p
KG9wdGFyZykgKiBNQjsKIAkJCWJyZWFrOwpAQCAtNjMsNiArNzMsOSBAQCBpbnQgbWFpbihpbnQg
YXJnYywgY2hhciAqKmFyZ3YpCiAJCWNhc2UgJ1UnOgogCQkJY21kID0gR1VQX0JFTkNITUFSSzsK
IAkJCWJyZWFrOworCQljYXNlICd1JzoKKwkJCWNtZCA9IEdVUF9GQVNUX0JFTkNITUFSSzsKKwkJ
CWJyZWFrOwogCQljYXNlICd3JzoKIAkJCXdyaXRlID0gMTsKIAkJCWJyZWFrOwotLSAKMi4yNC4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
