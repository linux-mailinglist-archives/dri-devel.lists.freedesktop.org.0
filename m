Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAB2FD4A0
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 06:54:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAAAD6E1E5;
	Fri, 15 Nov 2019 05:53:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7710A6E061
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 05:53:45 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dce3d6b0005>; Thu, 14 Nov 2019 21:53:48 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Thu, 14 Nov 2019 21:53:45 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Thu, 14 Nov 2019 21:53:45 -0800
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 15 Nov
 2019 05:53:43 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 15 Nov 2019 05:53:43 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dce3d670006>; Thu, 14 Nov 2019 21:53:43 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v5 04/24] mm: Cleanup __put_devmap_managed_page() vs
 ->page_free()
Date: Thu, 14 Nov 2019 21:53:20 -0800
Message-ID: <20191115055340.1825745-5-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191115055340.1825745-1-jhubbard@nvidia.com>
References: <20191115055340.1825745-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1573797228; bh=AC3B+bSuSOhCIQMFfknGmFthqUy5L4DGDhYzXP1+5TU=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Type:Content-Transfer-Encoding;
 b=PnkyV7KPHnjlGKmKWZlCFBIb1BJayyY14T5CX6AKWcue93fl6RXlYobT5kG6PNAoZ
 xX/dHoqtl6AT1snPw8oFVYduWl58LLXqEj4vuL65LqWkmqD8Q0z4MMvp+Wg3QjoKN3
 /MVxiftg36Hh6jtV7H4mo+uF+79+TDwbhzW9bJKIgEKjWa1wid9lG1a1ddB/sBFDoM
 plpy/aI2XXxXb9oyFNBaHloX/lHtB5rHjIHVCRSEhHofMEO3fJl5OBK1ASoRtUgUp2
 YYyzrDQz46r7g/KOd1DXEZsHmuu177IG6ZXGrhxxUJoZIZx/TcDZf1kWXK5mOprcJw
 TIdm9+ED5DSzQ==
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
SsOpcsO0bWUgR2xpc3NlIDxqZ2xpc3NlQHJlZGhhdC5jb20+ClNpZ25lZC1vZmYtYnk6IERhbiBX
aWxsaWFtcyA8ZGFuLmoud2lsbGlhbXNAaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBKb2huIEh1
YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Ci0tLQogZHJpdmVycy9udmRpbW0vcG1lbS5jIHwg
IDYgLS0tLQogbW0vbWVtcmVtYXAuYyAgICAgICAgIHwgODAgKysrKysrKysrKysrKysrKysrKysr
KysrLS0tLS0tLS0tLS0tLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCA0NCBpbnNlcnRpb25zKCsp
LCA0MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL252ZGltbS9wbWVtLmMgYi9k
cml2ZXJzL252ZGltbS9wbWVtLmMKaW5kZXggZjlmNzZmNmJhMDdiLi4yMWRiMWNlOGMwYWUgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvbnZkaW1tL3BtZW0uYworKysgYi9kcml2ZXJzL252ZGltbS9wbWVt
LmMKQEAgLTMzOCwxMyArMzM4LDcgQEAgc3RhdGljIHZvaWQgcG1lbV9yZWxlYXNlX2Rpc2sodm9p
ZCAqX19wbWVtKQogCXB1dF9kaXNrKHBtZW0tPmRpc2spOwogfQogCi1zdGF0aWMgdm9pZCBwbWVt
X3BhZ2VtYXBfcGFnZV9mcmVlKHN0cnVjdCBwYWdlICpwYWdlKQotewotCXdha2VfdXBfdmFyKCZw
YWdlLT5fcmVmY291bnQpOwotfQotCiBzdGF0aWMgY29uc3Qgc3RydWN0IGRldl9wYWdlbWFwX29w
cyBmc2RheF9wYWdlbWFwX29wcyA9IHsKLQkucGFnZV9mcmVlCQk9IHBtZW1fcGFnZW1hcF9wYWdl
X2ZyZWUsCiAJLmtpbGwJCQk9IHBtZW1fcGFnZW1hcF9raWxsLAogCS5jbGVhbnVwCQk9IHBtZW1f
cGFnZW1hcF9jbGVhbnVwLAogfTsKZGlmZiAtLWdpdCBhL21tL21lbXJlbWFwLmMgYi9tbS9tZW1y
ZW1hcC5jCmluZGV4IDAzY2NiZGZlYjY5Ny4uZTg5OWZhODc2YTYyIDEwMDY0NAotLS0gYS9tbS9t
ZW1yZW1hcC5jCisrKyBiL21tL21lbXJlbWFwLmMKQEAgLTI3LDcgKzI3LDggQEAgc3RhdGljIHZv
aWQgZGV2bWFwX21hbmFnZWRfZW5hYmxlX3B1dCh2b2lkKQogCiBzdGF0aWMgaW50IGRldm1hcF9t
YW5hZ2VkX2VuYWJsZV9nZXQoc3RydWN0IGRldl9wYWdlbWFwICpwZ21hcCkKIHsKLQlpZiAoIXBn
bWFwLT5vcHMgfHwgIXBnbWFwLT5vcHMtPnBhZ2VfZnJlZSkgeworCWlmIChwZ21hcC0+dHlwZSA9
PSBNRU1PUllfREVWSUNFX1BSSVZBVEUgJiYKKwkgICAgKCFwZ21hcC0+b3BzIHx8ICFwZ21hcC0+
b3BzLT5wYWdlX2ZyZWUpKSB7CiAJCVdBUk4oMSwgIk1pc3NpbmcgcGFnZV9mcmVlIG1ldGhvZFxu
Iik7CiAJCXJldHVybiAtRUlOVkFMOwogCX0KQEAgLTQxNCw0NCArNDE1LDUxIEBAIHZvaWQgX19w
dXRfZGV2bWFwX21hbmFnZWRfcGFnZShzdHJ1Y3QgcGFnZSAqcGFnZSkKIHsKIAlpbnQgY291bnQg
PSBwYWdlX3JlZl9kZWNfcmV0dXJuKHBhZ2UpOwogCi0JLyoKLQkgKiBJZiByZWZjb3VudCBpcyAx
IHRoZW4gcGFnZSBpcyBmcmVlZCBhbmQgcmVmY291bnQgaXMgc3RhYmxlIGFzIG5vYm9keQotCSAq
IGhvbGRzIGEgcmVmZXJlbmNlIG9uIHRoZSBwYWdlLgotCSAqLwotCWlmIChjb3VudCA9PSAxKSB7
Ci0JCS8qIENsZWFyIEFjdGl2ZSBiaXQgaW4gY2FzZSBvZiBwYXJhbGxlbCBtYXJrX3BhZ2VfYWNj
ZXNzZWQgKi8KLQkJX19DbGVhclBhZ2VBY3RpdmUocGFnZSk7Ci0JCV9fQ2xlYXJQYWdlV2FpdGVy
cyhwYWdlKTsKKwkvKiBzdGlsbCBidXN5ICovCisJaWYgKGNvdW50ID4gMSkKKwkJcmV0dXJuOwog
Ci0JCW1lbV9jZ3JvdXBfdW5jaGFyZ2UocGFnZSk7CisJLyogb25seSB0cmlnZ2VyZWQgYnkgdGhl
IGRldl9wYWdlbWFwIHNodXRkb3duIHBhdGggKi8KKwlpZiAoY291bnQgPT0gMCkgeworCQlfX3B1
dF9wYWdlKHBhZ2UpOworCQlyZXR1cm47CisJfQogCi0JCS8qCi0JCSAqIFdoZW4gYSBkZXZpY2Vf
cHJpdmF0ZSBwYWdlIGlzIGZyZWVkLCB0aGUgcGFnZS0+bWFwcGluZyBmaWVsZAotCQkgKiBtYXkg
c3RpbGwgY29udGFpbiBhIChzdGFsZSkgbWFwcGluZyB2YWx1ZS4gRm9yIGV4YW1wbGUsIHRoZQot
CQkgKiBsb3dlciBiaXRzIG9mIHBhZ2UtPm1hcHBpbmcgbWF5IHN0aWxsIGlkZW50aWZ5IHRoZSBw
YWdlIGFzCi0JCSAqIGFuIGFub255bW91cyBwYWdlLiBVbHRpbWF0ZWx5LCB0aGlzIGVudGlyZSBm
aWVsZCBpcyBqdXN0Ci0JCSAqIHN0YWxlIGFuZCB3cm9uZywgYW5kIGl0IHdpbGwgY2F1c2UgZXJy
b3JzIGlmIG5vdCBjbGVhcmVkLgotCQkgKiBPbmUgZXhhbXBsZSBpczoKLQkJICoKLQkJICogIG1p
Z3JhdGVfdm1hX3BhZ2VzKCkKLQkJICogICAgbWlncmF0ZV92bWFfaW5zZXJ0X3BhZ2UoKQotCQkg
KiAgICAgIHBhZ2VfYWRkX25ld19hbm9uX3JtYXAoKQotCQkgKiAgICAgICAgX19wYWdlX3NldF9h
bm9uX3JtYXAoKQotCQkgKiAgICAgICAgICAuLi5jaGVja3MgcGFnZS0+bWFwcGluZywgdmlhIFBh
Z2VBbm9uKHBhZ2UpIGNhbGwsCi0JCSAqICAgICAgICAgICAgYW5kIGluY29ycmVjdGx5IGNvbmNs
dWRlcyB0aGF0IHRoZSBwYWdlIGlzIGFuCi0JCSAqICAgICAgICAgICAgYW5vbnltb3VzIHBhZ2Uu
IFRoZXJlZm9yZSwgaXQgaW5jb3JyZWN0bHksCi0JCSAqICAgICAgICAgICAgc2lsZW50bHkgZmFp
bHMgdG8gc2V0IHVwIHRoZSBuZXcgYW5vbiBybWFwLgotCQkgKgotCQkgKiBGb3Igb3RoZXIgdHlw
ZXMgb2YgWk9ORV9ERVZJQ0UgcGFnZXMsIG1pZ3JhdGlvbiBpcyBlaXRoZXIKLQkJICogaGFuZGxl
ZCBkaWZmZXJlbnRseSBvciBub3QgZG9uZSBhdCBhbGwsIHNvIHRoZXJlIGlzIG5vIG5lZWQKLQkJ
ICogdG8gY2xlYXIgcGFnZS0+bWFwcGluZy4KLQkJICovCi0JCWlmIChpc19kZXZpY2VfcHJpdmF0
ZV9wYWdlKHBhZ2UpKQotCQkJcGFnZS0+bWFwcGluZyA9IE5VTEw7CisJLyogbm90aWZ5IHBhZ2Ug
aWRsZSBmb3IgZGF4ICovCisJaWYgKCFpc19kZXZpY2VfcHJpdmF0ZV9wYWdlKHBhZ2UpKSB7CisJ
CXdha2VfdXBfdmFyKCZwYWdlLT5fcmVmY291bnQpOworCQlyZXR1cm47CisJfQogCi0JCXBhZ2Ut
PnBnbWFwLT5vcHMtPnBhZ2VfZnJlZShwYWdlKTsKLQl9IGVsc2UgaWYgKCFjb3VudCkKLQkJX19w
dXRfcGFnZShwYWdlKTsKKwkvKiBDbGVhciBBY3RpdmUgYml0IGluIGNhc2Ugb2YgcGFyYWxsZWwg
bWFya19wYWdlX2FjY2Vzc2VkICovCisJX19DbGVhclBhZ2VBY3RpdmUocGFnZSk7CisJX19DbGVh
clBhZ2VXYWl0ZXJzKHBhZ2UpOworCisJbWVtX2Nncm91cF91bmNoYXJnZShwYWdlKTsKKworCS8q
CisJICogV2hlbiBhIGRldmljZV9wcml2YXRlIHBhZ2UgaXMgZnJlZWQsIHRoZSBwYWdlLT5tYXBw
aW5nIGZpZWxkCisJICogbWF5IHN0aWxsIGNvbnRhaW4gYSAoc3RhbGUpIG1hcHBpbmcgdmFsdWUu
IEZvciBleGFtcGxlLCB0aGUKKwkgKiBsb3dlciBiaXRzIG9mIHBhZ2UtPm1hcHBpbmcgbWF5IHN0
aWxsIGlkZW50aWZ5IHRoZSBwYWdlIGFzIGFuCisJICogYW5vbnltb3VzIHBhZ2UuIFVsdGltYXRl
bHksIHRoaXMgZW50aXJlIGZpZWxkIGlzIGp1c3Qgc3RhbGUKKwkgKiBhbmQgd3JvbmcsIGFuZCBp
dCB3aWxsIGNhdXNlIGVycm9ycyBpZiBub3QgY2xlYXJlZC4gIE9uZQorCSAqIGV4YW1wbGUgaXM6
CisJICoKKwkgKiAgbWlncmF0ZV92bWFfcGFnZXMoKQorCSAqICAgIG1pZ3JhdGVfdm1hX2luc2Vy
dF9wYWdlKCkKKwkgKiAgICAgIHBhZ2VfYWRkX25ld19hbm9uX3JtYXAoKQorCSAqICAgICAgICBf
X3BhZ2Vfc2V0X2Fub25fcm1hcCgpCisJICogICAgICAgICAgLi4uY2hlY2tzIHBhZ2UtPm1hcHBp
bmcsIHZpYSBQYWdlQW5vbihwYWdlKSBjYWxsLAorCSAqICAgICAgICAgICAgYW5kIGluY29ycmVj
dGx5IGNvbmNsdWRlcyB0aGF0IHRoZSBwYWdlIGlzIGFuCisJICogICAgICAgICAgICBhbm9ueW1v
dXMgcGFnZS4gVGhlcmVmb3JlLCBpdCBpbmNvcnJlY3RseSwKKwkgKiAgICAgICAgICAgIHNpbGVu
dGx5IGZhaWxzIHRvIHNldCB1cCB0aGUgbmV3IGFub24gcm1hcC4KKwkgKgorCSAqIEZvciBvdGhl
ciB0eXBlcyBvZiBaT05FX0RFVklDRSBwYWdlcywgbWlncmF0aW9uIGlzIGVpdGhlcgorCSAqIGhh
bmRsZWQgZGlmZmVyZW50bHkgb3Igbm90IGRvbmUgYXQgYWxsLCBzbyB0aGVyZSBpcyBubyBuZWVk
CisJICogdG8gY2xlYXIgcGFnZS0+bWFwcGluZy4KKwkgKi8KKwlwYWdlLT5tYXBwaW5nID0gTlVM
TDsKKwlwYWdlLT5wZ21hcC0+b3BzLT5wYWdlX2ZyZWUocGFnZSk7CiB9CiBFWFBPUlRfU1lNQk9M
KF9fcHV0X2Rldm1hcF9tYW5hZ2VkX3BhZ2UpOwogI2VuZGlmIC8qIENPTkZJR19ERVZfUEFHRU1B
UF9PUFMgKi8KLS0gCjIuMjQuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
