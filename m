Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81298101BB9
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:17:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDEAD6EC74;
	Tue, 19 Nov 2019 08:16:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A28B06EC7D
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 08:16:52 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dd3a4f10000>; Tue, 19 Nov 2019 00:16:49 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Tue, 19 Nov 2019 00:16:52 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Tue, 19 Nov 2019 00:16:52 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 19 Nov
 2019 08:16:51 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Tue, 19 Nov 2019 08:16:50 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dd3a4f10001>; Tue, 19 Nov 2019 00:16:50 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v6 04/24] mm: Cleanup __put_devmap_managed_page() vs
 ->page_free()
Date: Tue, 19 Nov 2019 00:16:23 -0800
Message-ID: <20191119081643.1866232-5-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191119081643.1866232-1-jhubbard@nvidia.com>
References: <20191119081643.1866232-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1574151409; bh=tsex47R2BQW/HRhxz4q5zTudp/GozzJHGnDF0/waCbA=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Type:Content-Transfer-Encoding;
 b=gp1SuuI66a3PONdY/pqKkgxYKXOfezgEqAEr9rPrdLuGxPmHb7ilMqLVoaeHD4LnO
 ZjOI1t5XS/C/Zd4vfaPb6e4PxFYZcPVGzhnQn6daxkNy8pE+LwcG0RlPBTgCeoFHjY
 /ca2D2ugd937CcZf0TjAt7BKiWNaalp3qxkabhpRsGos3lC2tsq0Tkvf7SIp1EQYDp
 acQVpOBMk7yUosdu0ZzEij5vpFX7qw07GT5VLUlILc+RirOJmf/vf+u9VVR+7Lt/zK
 gxgQVPpYam3E+UzFTN2K5dhowUXmTUQ8b5vbBXVAUxeABfLOr/FQLMlkjVrw9hnVGZ
 ie08E2O4oknlg==
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
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Christoph Hellwig <hch@lst.de>, Jonathan Corbet <corbet@lwn.net>,
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

RnJvbTogRGFuIFdpbGxpYW1zIDxkYW4uai53aWxsaWFtc0BpbnRlbC5jb20+CgpBZnRlciB0aGUg
cmVtb3ZhbCBvZiB0aGUgZGV2aWNlLXB1YmxpYyBpbmZyYXN0cnVjdHVyZSB0aGVyZSBhcmUgb25s
eSAyCi0+cGFnZV9mcmVlKCkgY2FsbCBiYWNrcyBpbiB0aGUga2VybmVsLiBPbmUgb2YgdGhvc2Ug
aXMgYSBkZXZpY2UtcHJpdmF0ZQpjYWxsYmFjayBpbiB0aGUgbm91dmVhdSBkcml2ZXIsIHRoZSBv
dGhlciBpcyBhIGdlbmVyaWMgd2FrZXVwIG5lZWRlZCBpbgp0aGUgREFYIGNhc2UuIEluIHRoZSBo
b3BlcyB0aGF0IGFsbCAtPnBhZ2VfZnJlZSgpIGNhbGxiYWNrcyBjYW4gYmUKbWlncmF0ZWQgdG8g
Y29tbW9uIGNvcmUga2VybmVsIGZ1bmN0aW9uYWxpdHksIG1vdmUgdGhlIGRldmljZS1wcml2YXRl
CnNwZWNpZmljIGFjdGlvbnMgaW4gX19wdXRfZGV2bWFwX21hbmFnZWRfcGFnZSgpIHVuZGVyIHRo
ZQppc19kZXZpY2VfcHJpdmF0ZV9wYWdlKCkgY29uZGl0aW9uYWwsIGluY2x1ZGluZyB0aGUgLT5w
YWdlX2ZyZWUoKQpjYWxsYmFjay4gRm9yIHRoZSBvdGhlciBwYWdlIHR5cGVzIGp1c3Qgb3Blbi1j
b2RlIHRoZSBnZW5lcmljIHdha2V1cC4KClllcywgdGhlIHdha2V1cCBpcyBvbmx5IG5lZWRlZCBp
biB0aGUgTUVNT1JZX0RFVklDRV9GU0RBWCBjYXNlLCBidXQgaXQKZG9lcyBubyBoYXJtIGluIHRo
ZSBNRU1PUllfREVWSUNFX0RFVkRBWCBhbmQgTUVNT1JZX0RFVklDRV9QQ0lfUDJQRE1BCmNhc2Uu
CgpDYzogSmFuIEthcmEgPGphY2tAc3VzZS5jej4KQ2M6IENocmlzdG9waCBIZWxsd2lnIDxoY2hA
bHN0LmRlPgpDYzogSXJhIFdlaW55IDxpcmEud2VpbnlAaW50ZWwuY29tPgpSZXZpZXdlZC1ieTog
Q2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+ClJldmlld2VkLWJ5OiBKw6lyw7RtZSBHbGlz
c2UgPGpnbGlzc2VAcmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1ieTogRGFuIFdpbGxpYW1zIDxkYW4u
ai53aWxsaWFtc0BpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IEpvaG4gSHViYmFyZCA8amh1YmJh
cmRAbnZpZGlhLmNvbT4KLS0tCiBkcml2ZXJzL252ZGltbS9wbWVtLmMgfCAgNiAtLS0tCiBtbS9t
ZW1yZW1hcC5jICAgICAgICAgfCA4MCArKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0t
LS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDQ0IGluc2VydGlvbnMoKyksIDQyIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbnZkaW1tL3BtZW0uYyBiL2RyaXZlcnMvbnZkaW1t
L3BtZW0uYwppbmRleCBmOWY3NmY2YmEwN2IuLjIxZGIxY2U4YzBhZSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9udmRpbW0vcG1lbS5jCisrKyBiL2RyaXZlcnMvbnZkaW1tL3BtZW0uYwpAQCAtMzM4LDEz
ICszMzgsNyBAQCBzdGF0aWMgdm9pZCBwbWVtX3JlbGVhc2VfZGlzayh2b2lkICpfX3BtZW0pCiAJ
cHV0X2Rpc2socG1lbS0+ZGlzayk7CiB9CiAKLXN0YXRpYyB2b2lkIHBtZW1fcGFnZW1hcF9wYWdl
X2ZyZWUoc3RydWN0IHBhZ2UgKnBhZ2UpCi17Ci0Jd2FrZV91cF92YXIoJnBhZ2UtPl9yZWZjb3Vu
dCk7Ci19Ci0KIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZGV2X3BhZ2VtYXBfb3BzIGZzZGF4X3BhZ2Vt
YXBfb3BzID0gewotCS5wYWdlX2ZyZWUJCT0gcG1lbV9wYWdlbWFwX3BhZ2VfZnJlZSwKIAkua2ls
bAkJCT0gcG1lbV9wYWdlbWFwX2tpbGwsCiAJLmNsZWFudXAJCT0gcG1lbV9wYWdlbWFwX2NsZWFu
dXAsCiB9OwpkaWZmIC0tZ2l0IGEvbW0vbWVtcmVtYXAuYyBiL21tL21lbXJlbWFwLmMKaW5kZXgg
MDNjY2JkZmViNjk3Li5lODk5ZmE4NzZhNjIgMTAwNjQ0Ci0tLSBhL21tL21lbXJlbWFwLmMKKysr
IGIvbW0vbWVtcmVtYXAuYwpAQCAtMjcsNyArMjcsOCBAQCBzdGF0aWMgdm9pZCBkZXZtYXBfbWFu
YWdlZF9lbmFibGVfcHV0KHZvaWQpCiAKIHN0YXRpYyBpbnQgZGV2bWFwX21hbmFnZWRfZW5hYmxl
X2dldChzdHJ1Y3QgZGV2X3BhZ2VtYXAgKnBnbWFwKQogewotCWlmICghcGdtYXAtPm9wcyB8fCAh
cGdtYXAtPm9wcy0+cGFnZV9mcmVlKSB7CisJaWYgKHBnbWFwLT50eXBlID09IE1FTU9SWV9ERVZJ
Q0VfUFJJVkFURSAmJgorCSAgICAoIXBnbWFwLT5vcHMgfHwgIXBnbWFwLT5vcHMtPnBhZ2VfZnJl
ZSkpIHsKIAkJV0FSTigxLCAiTWlzc2luZyBwYWdlX2ZyZWUgbWV0aG9kXG4iKTsKIAkJcmV0dXJu
IC1FSU5WQUw7CiAJfQpAQCAtNDE0LDQ0ICs0MTUsNTEgQEAgdm9pZCBfX3B1dF9kZXZtYXBfbWFu
YWdlZF9wYWdlKHN0cnVjdCBwYWdlICpwYWdlKQogewogCWludCBjb3VudCA9IHBhZ2VfcmVmX2Rl
Y19yZXR1cm4ocGFnZSk7CiAKLQkvKgotCSAqIElmIHJlZmNvdW50IGlzIDEgdGhlbiBwYWdlIGlz
IGZyZWVkIGFuZCByZWZjb3VudCBpcyBzdGFibGUgYXMgbm9ib2R5Ci0JICogaG9sZHMgYSByZWZl
cmVuY2Ugb24gdGhlIHBhZ2UuCi0JICovCi0JaWYgKGNvdW50ID09IDEpIHsKLQkJLyogQ2xlYXIg
QWN0aXZlIGJpdCBpbiBjYXNlIG9mIHBhcmFsbGVsIG1hcmtfcGFnZV9hY2Nlc3NlZCAqLwotCQlf
X0NsZWFyUGFnZUFjdGl2ZShwYWdlKTsKLQkJX19DbGVhclBhZ2VXYWl0ZXJzKHBhZ2UpOworCS8q
IHN0aWxsIGJ1c3kgKi8KKwlpZiAoY291bnQgPiAxKQorCQlyZXR1cm47CiAKLQkJbWVtX2Nncm91
cF91bmNoYXJnZShwYWdlKTsKKwkvKiBvbmx5IHRyaWdnZXJlZCBieSB0aGUgZGV2X3BhZ2VtYXAg
c2h1dGRvd24gcGF0aCAqLworCWlmIChjb3VudCA9PSAwKSB7CisJCV9fcHV0X3BhZ2UocGFnZSk7
CisJCXJldHVybjsKKwl9CiAKLQkJLyoKLQkJICogV2hlbiBhIGRldmljZV9wcml2YXRlIHBhZ2Ug
aXMgZnJlZWQsIHRoZSBwYWdlLT5tYXBwaW5nIGZpZWxkCi0JCSAqIG1heSBzdGlsbCBjb250YWlu
IGEgKHN0YWxlKSBtYXBwaW5nIHZhbHVlLiBGb3IgZXhhbXBsZSwgdGhlCi0JCSAqIGxvd2VyIGJp
dHMgb2YgcGFnZS0+bWFwcGluZyBtYXkgc3RpbGwgaWRlbnRpZnkgdGhlIHBhZ2UgYXMKLQkJICog
YW4gYW5vbnltb3VzIHBhZ2UuIFVsdGltYXRlbHksIHRoaXMgZW50aXJlIGZpZWxkIGlzIGp1c3QK
LQkJICogc3RhbGUgYW5kIHdyb25nLCBhbmQgaXQgd2lsbCBjYXVzZSBlcnJvcnMgaWYgbm90IGNs
ZWFyZWQuCi0JCSAqIE9uZSBleGFtcGxlIGlzOgotCQkgKgotCQkgKiAgbWlncmF0ZV92bWFfcGFn
ZXMoKQotCQkgKiAgICBtaWdyYXRlX3ZtYV9pbnNlcnRfcGFnZSgpCi0JCSAqICAgICAgcGFnZV9h
ZGRfbmV3X2Fub25fcm1hcCgpCi0JCSAqICAgICAgICBfX3BhZ2Vfc2V0X2Fub25fcm1hcCgpCi0J
CSAqICAgICAgICAgIC4uLmNoZWNrcyBwYWdlLT5tYXBwaW5nLCB2aWEgUGFnZUFub24ocGFnZSkg
Y2FsbCwKLQkJICogICAgICAgICAgICBhbmQgaW5jb3JyZWN0bHkgY29uY2x1ZGVzIHRoYXQgdGhl
IHBhZ2UgaXMgYW4KLQkJICogICAgICAgICAgICBhbm9ueW1vdXMgcGFnZS4gVGhlcmVmb3JlLCBp
dCBpbmNvcnJlY3RseSwKLQkJICogICAgICAgICAgICBzaWxlbnRseSBmYWlscyB0byBzZXQgdXAg
dGhlIG5ldyBhbm9uIHJtYXAuCi0JCSAqCi0JCSAqIEZvciBvdGhlciB0eXBlcyBvZiBaT05FX0RF
VklDRSBwYWdlcywgbWlncmF0aW9uIGlzIGVpdGhlcgotCQkgKiBoYW5kbGVkIGRpZmZlcmVudGx5
IG9yIG5vdCBkb25lIGF0IGFsbCwgc28gdGhlcmUgaXMgbm8gbmVlZAotCQkgKiB0byBjbGVhciBw
YWdlLT5tYXBwaW5nLgotCQkgKi8KLQkJaWYgKGlzX2RldmljZV9wcml2YXRlX3BhZ2UocGFnZSkp
Ci0JCQlwYWdlLT5tYXBwaW5nID0gTlVMTDsKKwkvKiBub3RpZnkgcGFnZSBpZGxlIGZvciBkYXgg
Ki8KKwlpZiAoIWlzX2RldmljZV9wcml2YXRlX3BhZ2UocGFnZSkpIHsKKwkJd2FrZV91cF92YXIo
JnBhZ2UtPl9yZWZjb3VudCk7CisJCXJldHVybjsKKwl9CiAKLQkJcGFnZS0+cGdtYXAtPm9wcy0+
cGFnZV9mcmVlKHBhZ2UpOwotCX0gZWxzZSBpZiAoIWNvdW50KQotCQlfX3B1dF9wYWdlKHBhZ2Up
OworCS8qIENsZWFyIEFjdGl2ZSBiaXQgaW4gY2FzZSBvZiBwYXJhbGxlbCBtYXJrX3BhZ2VfYWNj
ZXNzZWQgKi8KKwlfX0NsZWFyUGFnZUFjdGl2ZShwYWdlKTsKKwlfX0NsZWFyUGFnZVdhaXRlcnMo
cGFnZSk7CisKKwltZW1fY2dyb3VwX3VuY2hhcmdlKHBhZ2UpOworCisJLyoKKwkgKiBXaGVuIGEg
ZGV2aWNlX3ByaXZhdGUgcGFnZSBpcyBmcmVlZCwgdGhlIHBhZ2UtPm1hcHBpbmcgZmllbGQKKwkg
KiBtYXkgc3RpbGwgY29udGFpbiBhIChzdGFsZSkgbWFwcGluZyB2YWx1ZS4gRm9yIGV4YW1wbGUs
IHRoZQorCSAqIGxvd2VyIGJpdHMgb2YgcGFnZS0+bWFwcGluZyBtYXkgc3RpbGwgaWRlbnRpZnkg
dGhlIHBhZ2UgYXMgYW4KKwkgKiBhbm9ueW1vdXMgcGFnZS4gVWx0aW1hdGVseSwgdGhpcyBlbnRp
cmUgZmllbGQgaXMganVzdCBzdGFsZQorCSAqIGFuZCB3cm9uZywgYW5kIGl0IHdpbGwgY2F1c2Ug
ZXJyb3JzIGlmIG5vdCBjbGVhcmVkLiAgT25lCisJICogZXhhbXBsZSBpczoKKwkgKgorCSAqICBt
aWdyYXRlX3ZtYV9wYWdlcygpCisJICogICAgbWlncmF0ZV92bWFfaW5zZXJ0X3BhZ2UoKQorCSAq
ICAgICAgcGFnZV9hZGRfbmV3X2Fub25fcm1hcCgpCisJICogICAgICAgIF9fcGFnZV9zZXRfYW5v
bl9ybWFwKCkKKwkgKiAgICAgICAgICAuLi5jaGVja3MgcGFnZS0+bWFwcGluZywgdmlhIFBhZ2VB
bm9uKHBhZ2UpIGNhbGwsCisJICogICAgICAgICAgICBhbmQgaW5jb3JyZWN0bHkgY29uY2x1ZGVz
IHRoYXQgdGhlIHBhZ2UgaXMgYW4KKwkgKiAgICAgICAgICAgIGFub255bW91cyBwYWdlLiBUaGVy
ZWZvcmUsIGl0IGluY29ycmVjdGx5LAorCSAqICAgICAgICAgICAgc2lsZW50bHkgZmFpbHMgdG8g
c2V0IHVwIHRoZSBuZXcgYW5vbiBybWFwLgorCSAqCisJICogRm9yIG90aGVyIHR5cGVzIG9mIFpP
TkVfREVWSUNFIHBhZ2VzLCBtaWdyYXRpb24gaXMgZWl0aGVyCisJICogaGFuZGxlZCBkaWZmZXJl
bnRseSBvciBub3QgZG9uZSBhdCBhbGwsIHNvIHRoZXJlIGlzIG5vIG5lZWQKKwkgKiB0byBjbGVh
ciBwYWdlLT5tYXBwaW5nLgorCSAqLworCXBhZ2UtPm1hcHBpbmcgPSBOVUxMOworCXBhZ2UtPnBn
bWFwLT5vcHMtPnBhZ2VfZnJlZShwYWdlKTsKIH0KIEVYUE9SVF9TWU1CT0woX19wdXRfZGV2bWFw
X21hbmFnZWRfcGFnZSk7CiAjZW5kaWYgLyogQ09ORklHX0RFVl9QQUdFTUFQX09QUyAqLwotLSAK
Mi4yNC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
