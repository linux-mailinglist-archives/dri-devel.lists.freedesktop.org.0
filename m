Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A78D5FA84D
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 05:28:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 155BF6EC7C;
	Wed, 13 Nov 2019 04:28:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D6CC6EC6C
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 04:27:23 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dcb86220002>; Tue, 12 Nov 2019 20:27:14 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Tue, 12 Nov 2019 20:27:14 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Tue, 12 Nov 2019 20:27:14 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 13 Nov
 2019 04:27:14 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 13 Nov
 2019 04:27:14 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 13 Nov 2019 04:27:14 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dcb86210009>; Tue, 12 Nov 2019 20:27:13 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v4 23/23] mm/gup: remove support for gup(FOLL_LONGTERM)
Date: Tue, 12 Nov 2019 20:27:10 -0800
Message-ID: <20191113042710.3997854-24-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191113042710.3997854-1-jhubbard@nvidia.com>
References: <20191113042710.3997854-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1573619234; bh=+6XZ9/UpMiQMsyd6g5mrANaqNrp0zsSmDMnAyJRKi2s=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=jguBzetlNPWuzoeBXaqOLn+1f0v/x41+b55TFXan2xXV+ieIPIHEodL+04sHoLFoo
 Ntdx5sNURUhCjbeGEshvKXaIH5v8l90zbUD2nJvdgz+3NFE1I3/t0giDgwc5miWd7G
 cU1sGz4uIbPPRJqmixLSVlo54vmWOT/WV6sfifJML/xZRzJ3DbjBRK5Kg/bsYJoNMw
 HfxH090IR0JFffgnB/qTiJcHn1l6qSbQ4J8hYas3umYaDPqihguaQr9Myne38jaPmF
 UuPHBRT3OZ9EJOLMUq4LmeoMlmb55tkz2rXV0HBjMicsGlxLSnhDw6We4MW6129syp
 b73tCuGLh6A8w==
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

Tm93IHRoYXQgYWxsIG90aGVyIGtlcm5lbCBjYWxsZXJzIG9mIGdldF91c2VyX3BhZ2VzKEZPTExf
TE9OR1RFUk0pCmhhdmUgYmVlbiBjb252ZXJ0ZWQgdG8gcGluX2xvbmd0ZXJtX3BhZ2VzKCksIGxv
Y2sgaXQgZG93bjoKCjEpIEFkZCBhbiBhc3NlcnRpb24gdG8gZ2V0X3VzZXJfcGFnZXMoKSwgcHJl
dmVudGluZyBjYWxsZXJzIGZyb20KICAgcGFzc2luZyBGT0xMX0xPTkdURVJNIChpbiBhZGRpdGlv
biB0byB0aGUgZXhpc3RpbmcgYXNzZXJ0aW9uIHRoYXQKICAgcHJldmVudHMgRk9MTF9QSU4pLgoK
MikgUmVtb3ZlIHRoZSBhc3NvY2lhdGVkIEdVUF9MT05HVEVSTV9CRU5DSE1BUksgdGVzdC4KClNp
Z25lZC1vZmYtYnk6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KLS0tCiBtbS9n
dXAuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCA4ICsrKystLS0tCiBtbS9n
dXBfYmVuY2htYXJrLmMgICAgICAgICAgICAgICAgICAgICAgICAgfCA5ICstLS0tLS0tLQogdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMvdm0vZ3VwX2JlbmNobWFyay5jIHwgNyArKy0tLS0tCiAzIGZp
bGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvbW0vZ3VwLmMgYi9tbS9ndXAuYwppbmRleCA4MmU3ZTRjZTUwMjcuLjkwZjVmOTVlZTdhYyAx
MDA2NDQKLS0tIGEvbW0vZ3VwLmMKKysrIGIvbW0vZ3VwLmMKQEAgLTE3NTYsMTEgKzE3NTYsMTEg
QEAgbG9uZyBnZXRfdXNlcl9wYWdlcyh1bnNpZ25lZCBsb25nIHN0YXJ0LCB1bnNpZ25lZCBsb25n
IG5yX3BhZ2VzLAogCQlzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKip2bWFzKQogewogCS8qCi0JICog
Rk9MTF9QSU4gbXVzdCBvbmx5IGJlIHNldCBpbnRlcm5hbGx5IGJ5IHRoZSBwaW5fdXNlcl9wYWdl
KigpIGFuZAotCSAqIHBpbl9sb25ndGVybV8qKCkgQVBJcywgbmV2ZXIgZGlyZWN0bHkgYnkgdGhl
IGNhbGxlciwgc28gZW5mb3JjZSB0aGF0Ci0JICogd2l0aCBhbiBhc3NlcnRpb246CisJICogRk9M
TF9QSU4gYW5kIEZPTExfTE9OR1RFUk0gbXVzdCBvbmx5IGJlIHNldCBpbnRlcm5hbGx5IGJ5IHRo
ZQorCSAqIHBpbl91c2VyX3BhZ2UqKCkgYW5kIHBpbl9sb25ndGVybV8qKCkgQVBJcywgbmV2ZXIg
ZGlyZWN0bHkgYnkgdGhlCisJICogY2FsbGVyLCBzbyBlbmZvcmNlIHRoYXQgd2l0aCBhbiBhc3Nl
cnRpb246CiAJICovCi0JaWYgKFdBUk5fT05fT05DRShndXBfZmxhZ3MgJiBGT0xMX1BJTikpCisJ
aWYgKFdBUk5fT05fT05DRShndXBfZmxhZ3MgJiAoRk9MTF9QSU4gfCBGT0xMX0xPTkdURVJNKSkp
CiAJCXJldHVybiAtRUlOVkFMOwogCiAJcmV0dXJuIF9fZ3VwX2xvbmd0ZXJtX2xvY2tlZChjdXJy
ZW50LCBjdXJyZW50LT5tbSwgc3RhcnQsIG5yX3BhZ2VzLApkaWZmIC0tZ2l0IGEvbW0vZ3VwX2Jl
bmNobWFyay5jIGIvbW0vZ3VwX2JlbmNobWFyay5jCmluZGV4IDhmOTgwZDkxZGJmNS4uNjc5ZjBl
NmEwYWRiIDEwMDY0NAotLS0gYS9tbS9ndXBfYmVuY2htYXJrLmMKKysrIGIvbW0vZ3VwX2JlbmNo
bWFyay5jCkBAIC02LDcgKzYsNyBAQAogI2luY2x1ZGUgPGxpbnV4L2RlYnVnZnMuaD4KIAogI2Rl
ZmluZSBHVVBfRkFTVF9CRU5DSE1BUksJX0lPV1IoJ2cnLCAxLCBzdHJ1Y3QgZ3VwX2JlbmNobWFy
aykKLSNkZWZpbmUgR1VQX0xPTkdURVJNX0JFTkNITUFSSwlfSU9XUignZycsIDIsIHN0cnVjdCBn
dXBfYmVuY2htYXJrKQorLyogQ29tbWFuZCAyIGhhcyBiZWVuIGRlbGV0ZWQuICovCiAjZGVmaW5l
IEdVUF9CRU5DSE1BUksJCV9JT1dSKCdnJywgMywgc3RydWN0IGd1cF9iZW5jaG1hcmspCiAjZGVm
aW5lIFBJTl9GQVNUX0JFTkNITUFSSwlfSU9XUignZycsIDQsIHN0cnVjdCBndXBfYmVuY2htYXJr
KQogI2RlZmluZSBQSU5fTE9OR1RFUk1fQkVOQ0hNQVJLCV9JT1dSKCdnJywgNSwgc3RydWN0IGd1
cF9iZW5jaG1hcmspCkBAIC0yOCw3ICsyOCw2IEBAIHN0YXRpYyB2b2lkIHB1dF9iYWNrX3BhZ2Vz
KGludCBjbWQsIHN0cnVjdCBwYWdlICoqcGFnZXMsIHVuc2lnbmVkIGxvbmcgbnJfcGFnZXMpCiAK
IAlzd2l0Y2ggKGNtZCkgewogCWNhc2UgR1VQX0ZBU1RfQkVOQ0hNQVJLOgotCWNhc2UgR1VQX0xP
TkdURVJNX0JFTkNITUFSSzoKIAljYXNlIEdVUF9CRU5DSE1BUks6CiAJCWZvciAoaSA9IDA7IGkg
PCBucl9wYWdlczsgaSsrKQogCQkJcHV0X3BhZ2UocGFnZXNbaV0pOwpAQCAtOTcsMTEgKzk2LDYg
QEAgc3RhdGljIGludCBfX2d1cF9iZW5jaG1hcmtfaW9jdGwodW5zaWduZWQgaW50IGNtZCwKIAkJ
CW5yID0gZ2V0X3VzZXJfcGFnZXNfZmFzdChhZGRyLCBuciwgZ3VwLT5mbGFncywKIAkJCQkJCSBw
YWdlcyArIGkpOwogCQkJYnJlYWs7Ci0JCWNhc2UgR1VQX0xPTkdURVJNX0JFTkNITUFSSzoKLQkJ
CW5yID0gZ2V0X3VzZXJfcGFnZXMoYWRkciwgbnIsCi0JCQkJCSAgICBndXAtPmZsYWdzIHwgRk9M
TF9MT05HVEVSTSwKLQkJCQkJICAgIHBhZ2VzICsgaSwgTlVMTCk7Ci0JCQlicmVhazsKIAkJY2Fz
ZSBHVVBfQkVOQ0hNQVJLOgogCQkJbnIgPSBnZXRfdXNlcl9wYWdlcyhhZGRyLCBuciwgZ3VwLT5m
bGFncywgcGFnZXMgKyBpLAogCQkJCQkgICAgTlVMTCk7CkBAIC0xNTksNyArMTUzLDYgQEAgc3Rh
dGljIGxvbmcgZ3VwX2JlbmNobWFya19pb2N0bChzdHJ1Y3QgZmlsZSAqZmlsZXAsIHVuc2lnbmVk
IGludCBjbWQsCiAKIAlzd2l0Y2ggKGNtZCkgewogCWNhc2UgR1VQX0ZBU1RfQkVOQ0hNQVJLOgot
CWNhc2UgR1VQX0xPTkdURVJNX0JFTkNITUFSSzoKIAljYXNlIEdVUF9CRU5DSE1BUks6CiAJY2Fz
ZSBQSU5fRkFTVF9CRU5DSE1BUks6CiAJY2FzZSBQSU5fTE9OR1RFUk1fQkVOQ0hNQVJLOgpkaWZm
IC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvdm0vZ3VwX2JlbmNobWFyay5jIGIvdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMvdm0vZ3VwX2JlbmNobWFyay5jCmluZGV4IDAzOTI4ZTQ3YTg2
Zi4uODM2YjcwODJkYjEzIDEwMDY0NAotLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy92bS9n
dXBfYmVuY2htYXJrLmMKKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvdm0vZ3VwX2JlbmNo
bWFyay5jCkBAIC0xNSw3ICsxNSw3IEBACiAjZGVmaW5lIFBBR0VfU0laRSBzeXNjb25mKF9TQ19Q
QUdFU0laRSkKIAogI2RlZmluZSBHVVBfRkFTVF9CRU5DSE1BUksJX0lPV1IoJ2cnLCAxLCBzdHJ1
Y3QgZ3VwX2JlbmNobWFyaykKLSNkZWZpbmUgR1VQX0xPTkdURVJNX0JFTkNITUFSSwlfSU9XUign
ZycsIDIsIHN0cnVjdCBndXBfYmVuY2htYXJrKQorLyogQ29tbWFuZCAyIGhhcyBiZWVuIGRlbGV0
ZWQuICovCiAjZGVmaW5lIEdVUF9CRU5DSE1BUksJCV9JT1dSKCdnJywgMywgc3RydWN0IGd1cF9i
ZW5jaG1hcmspCiAKIC8qCkBAIC00OSw3ICs0OSw3IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFy
ICoqYXJndikKIAljaGFyICpmaWxlID0gIi9kZXYvemVybyI7CiAJY2hhciAqcDsKIAotCXdoaWxl
ICgob3B0ID0gZ2V0b3B0KGFyZ2MsIGFyZ3YsICJtOnI6bjpmOmFiY3RUTFV1d1NIIikpICE9IC0x
KSB7CisJd2hpbGUgKChvcHQgPSBnZXRvcHQoYXJnYywgYXJndiwgIm06cjpuOmY6YWJjdFRVdXdT
SCIpKSAhPSAtMSkgewogCQlzd2l0Y2ggKG9wdCkgewogCQljYXNlICdhJzoKIAkJCWNtZCA9IFBJ
Tl9GQVNUX0JFTkNITUFSSzsKQEAgLTc1LDkgKzc1LDYgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNo
YXIgKiphcmd2KQogCQljYXNlICdUJzoKIAkJCXRocCA9IDA7CiAJCQlicmVhazsKLQkJY2FzZSAn
TCc6Ci0JCQljbWQgPSBHVVBfTE9OR1RFUk1fQkVOQ0hNQVJLOwotCQkJYnJlYWs7CiAJCWNhc2Ug
J1UnOgogCQkJY21kID0gR1VQX0JFTkNITUFSSzsKIAkJCWJyZWFrOwotLSAKMi4yNC4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
