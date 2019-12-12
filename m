Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 318EB11C6F1
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 09:19:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A49F16EC88;
	Thu, 12 Dec 2019 08:19:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 573AA6EC7C
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 08:19:22 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5df1f8000003>; Thu, 12 Dec 2019 00:19:14 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 12 Dec 2019 00:19:21 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 12 Dec 2019 00:19:21 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 12 Dec
 2019 08:19:19 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 12 Dec
 2019 08:19:19 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 12 Dec 2019 08:19:19 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5df1f8060004>; Thu, 12 Dec 2019 00:19:18 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v10 03/25] mm: Cleanup __put_devmap_managed_page() vs
 ->page_free()
Date: Thu, 12 Dec 2019 00:18:55 -0800
Message-ID: <20191212081917.1264184-4-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191212081917.1264184-1-jhubbard@nvidia.com>
References: <20191212081917.1264184-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1576138755; bh=x/Kgb8uO8/eCE7JtkHNAC1Axghcz0zREySppWRFqdXA=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Type:Content-Transfer-Encoding;
 b=sKRXVojg3+I7FlCef0Lxpvmc+PwYDqrxUJ9gRp4mUWYvf8tKynxcPy6YVfR/KQ8/Q
 pnrc13rkUDF0fChiIFyy6oxSZbvDLAl0Nf/rlAnn3nOW+Ugv81fl9rM21lgV72Fa++
 oD7e16SKJsJNUWNM1fFo/s+lZnUEmDA3h2K+jNLa3Gt6GAwclKC7DchaVYvrx5nrnN
 7s+o82xdrm5/YJZq1l0XkuIoRGLY8F1RvbVh5wrsAvvtKb4ULtKCE3479PkdrZm0Nt
 VtiTJyv40sLXguUV3fTdIWt8maBwGO6VFnwiyPDyHu5Uf9kGoISXa84HLrUTw4Ux80
 w4oUfOWTdEvZA==
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Paul
 Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Christoph Hellwig <hch@lst.de>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
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
CgpSZXZpZXdlZC1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+ClJldmlld2VkLWJ5
OiBKw6lyw7RtZSBHbGlzc2UgPGpnbGlzc2VAcmVkaGF0LmNvbT4KQ2M6IEphbiBLYXJhIDxqYWNr
QHN1c2UuY3o+CkNjOiBJcmEgV2VpbnkgPGlyYS53ZWlueUBpbnRlbC5jb20+ClNpZ25lZC1vZmYt
Ynk6IERhbiBXaWxsaWFtcyA8ZGFuLmoud2lsbGlhbXNAaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5
OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Ci0tLQogZHJpdmVycy9udmRpbW0v
cG1lbS5jIHwgIDYgLS0tLQogbW0vbWVtcmVtYXAuYyAgICAgICAgIHwgODAgKysrKysrKysrKysr
KysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCA0NCBpbnNl
cnRpb25zKCspLCA0MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL252ZGltbS9w
bWVtLmMgYi9kcml2ZXJzL252ZGltbS9wbWVtLmMKaW5kZXggYWQ4ZTRkZjEyODJiLi40ZWFlNDQx
Zjg2YzkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbnZkaW1tL3BtZW0uYworKysgYi9kcml2ZXJzL252
ZGltbS9wbWVtLmMKQEAgLTMzNywxMyArMzM3LDcgQEAgc3RhdGljIHZvaWQgcG1lbV9yZWxlYXNl
X2Rpc2sodm9pZCAqX19wbWVtKQogCXB1dF9kaXNrKHBtZW0tPmRpc2spOwogfQogCi1zdGF0aWMg
dm9pZCBwbWVtX3BhZ2VtYXBfcGFnZV9mcmVlKHN0cnVjdCBwYWdlICpwYWdlKQotewotCXdha2Vf
dXBfdmFyKCZwYWdlLT5fcmVmY291bnQpOwotfQotCiBzdGF0aWMgY29uc3Qgc3RydWN0IGRldl9w
YWdlbWFwX29wcyBmc2RheF9wYWdlbWFwX29wcyA9IHsKLQkucGFnZV9mcmVlCQk9IHBtZW1fcGFn
ZW1hcF9wYWdlX2ZyZWUsCiAJLmtpbGwJCQk9IHBtZW1fcGFnZW1hcF9raWxsLAogCS5jbGVhbnVw
CQk9IHBtZW1fcGFnZW1hcF9jbGVhbnVwLAogfTsKZGlmZiAtLWdpdCBhL21tL21lbXJlbWFwLmMg
Yi9tbS9tZW1yZW1hcC5jCmluZGV4IDAzY2NiZGZlYjY5Ny4uZTg5OWZhODc2YTYyIDEwMDY0NAot
LS0gYS9tbS9tZW1yZW1hcC5jCisrKyBiL21tL21lbXJlbWFwLmMKQEAgLTI3LDcgKzI3LDggQEAg
c3RhdGljIHZvaWQgZGV2bWFwX21hbmFnZWRfZW5hYmxlX3B1dCh2b2lkKQogCiBzdGF0aWMgaW50
IGRldm1hcF9tYW5hZ2VkX2VuYWJsZV9nZXQoc3RydWN0IGRldl9wYWdlbWFwICpwZ21hcCkKIHsK
LQlpZiAoIXBnbWFwLT5vcHMgfHwgIXBnbWFwLT5vcHMtPnBhZ2VfZnJlZSkgeworCWlmIChwZ21h
cC0+dHlwZSA9PSBNRU1PUllfREVWSUNFX1BSSVZBVEUgJiYKKwkgICAgKCFwZ21hcC0+b3BzIHx8
ICFwZ21hcC0+b3BzLT5wYWdlX2ZyZWUpKSB7CiAJCVdBUk4oMSwgIk1pc3NpbmcgcGFnZV9mcmVl
IG1ldGhvZFxuIik7CiAJCXJldHVybiAtRUlOVkFMOwogCX0KQEAgLTQxNCw0NCArNDE1LDUxIEBA
IHZvaWQgX19wdXRfZGV2bWFwX21hbmFnZWRfcGFnZShzdHJ1Y3QgcGFnZSAqcGFnZSkKIHsKIAlp
bnQgY291bnQgPSBwYWdlX3JlZl9kZWNfcmV0dXJuKHBhZ2UpOwogCi0JLyoKLQkgKiBJZiByZWZj
b3VudCBpcyAxIHRoZW4gcGFnZSBpcyBmcmVlZCBhbmQgcmVmY291bnQgaXMgc3RhYmxlIGFzIG5v
Ym9keQotCSAqIGhvbGRzIGEgcmVmZXJlbmNlIG9uIHRoZSBwYWdlLgotCSAqLwotCWlmIChjb3Vu
dCA9PSAxKSB7Ci0JCS8qIENsZWFyIEFjdGl2ZSBiaXQgaW4gY2FzZSBvZiBwYXJhbGxlbCBtYXJr
X3BhZ2VfYWNjZXNzZWQgKi8KLQkJX19DbGVhclBhZ2VBY3RpdmUocGFnZSk7Ci0JCV9fQ2xlYXJQ
YWdlV2FpdGVycyhwYWdlKTsKKwkvKiBzdGlsbCBidXN5ICovCisJaWYgKGNvdW50ID4gMSkKKwkJ
cmV0dXJuOwogCi0JCW1lbV9jZ3JvdXBfdW5jaGFyZ2UocGFnZSk7CisJLyogb25seSB0cmlnZ2Vy
ZWQgYnkgdGhlIGRldl9wYWdlbWFwIHNodXRkb3duIHBhdGggKi8KKwlpZiAoY291bnQgPT0gMCkg
eworCQlfX3B1dF9wYWdlKHBhZ2UpOworCQlyZXR1cm47CisJfQogCi0JCS8qCi0JCSAqIFdoZW4g
YSBkZXZpY2VfcHJpdmF0ZSBwYWdlIGlzIGZyZWVkLCB0aGUgcGFnZS0+bWFwcGluZyBmaWVsZAot
CQkgKiBtYXkgc3RpbGwgY29udGFpbiBhIChzdGFsZSkgbWFwcGluZyB2YWx1ZS4gRm9yIGV4YW1w
bGUsIHRoZQotCQkgKiBsb3dlciBiaXRzIG9mIHBhZ2UtPm1hcHBpbmcgbWF5IHN0aWxsIGlkZW50
aWZ5IHRoZSBwYWdlIGFzCi0JCSAqIGFuIGFub255bW91cyBwYWdlLiBVbHRpbWF0ZWx5LCB0aGlz
IGVudGlyZSBmaWVsZCBpcyBqdXN0Ci0JCSAqIHN0YWxlIGFuZCB3cm9uZywgYW5kIGl0IHdpbGwg
Y2F1c2UgZXJyb3JzIGlmIG5vdCBjbGVhcmVkLgotCQkgKiBPbmUgZXhhbXBsZSBpczoKLQkJICoK
LQkJICogIG1pZ3JhdGVfdm1hX3BhZ2VzKCkKLQkJICogICAgbWlncmF0ZV92bWFfaW5zZXJ0X3Bh
Z2UoKQotCQkgKiAgICAgIHBhZ2VfYWRkX25ld19hbm9uX3JtYXAoKQotCQkgKiAgICAgICAgX19w
YWdlX3NldF9hbm9uX3JtYXAoKQotCQkgKiAgICAgICAgICAuLi5jaGVja3MgcGFnZS0+bWFwcGlu
ZywgdmlhIFBhZ2VBbm9uKHBhZ2UpIGNhbGwsCi0JCSAqICAgICAgICAgICAgYW5kIGluY29ycmVj
dGx5IGNvbmNsdWRlcyB0aGF0IHRoZSBwYWdlIGlzIGFuCi0JCSAqICAgICAgICAgICAgYW5vbnlt
b3VzIHBhZ2UuIFRoZXJlZm9yZSwgaXQgaW5jb3JyZWN0bHksCi0JCSAqICAgICAgICAgICAgc2ls
ZW50bHkgZmFpbHMgdG8gc2V0IHVwIHRoZSBuZXcgYW5vbiBybWFwLgotCQkgKgotCQkgKiBGb3Ig
b3RoZXIgdHlwZXMgb2YgWk9ORV9ERVZJQ0UgcGFnZXMsIG1pZ3JhdGlvbiBpcyBlaXRoZXIKLQkJ
ICogaGFuZGxlZCBkaWZmZXJlbnRseSBvciBub3QgZG9uZSBhdCBhbGwsIHNvIHRoZXJlIGlzIG5v
IG5lZWQKLQkJICogdG8gY2xlYXIgcGFnZS0+bWFwcGluZy4KLQkJICovCi0JCWlmIChpc19kZXZp
Y2VfcHJpdmF0ZV9wYWdlKHBhZ2UpKQotCQkJcGFnZS0+bWFwcGluZyA9IE5VTEw7CisJLyogbm90
aWZ5IHBhZ2UgaWRsZSBmb3IgZGF4ICovCisJaWYgKCFpc19kZXZpY2VfcHJpdmF0ZV9wYWdlKHBh
Z2UpKSB7CisJCXdha2VfdXBfdmFyKCZwYWdlLT5fcmVmY291bnQpOworCQlyZXR1cm47CisJfQog
Ci0JCXBhZ2UtPnBnbWFwLT5vcHMtPnBhZ2VfZnJlZShwYWdlKTsKLQl9IGVsc2UgaWYgKCFjb3Vu
dCkKLQkJX19wdXRfcGFnZShwYWdlKTsKKwkvKiBDbGVhciBBY3RpdmUgYml0IGluIGNhc2Ugb2Yg
cGFyYWxsZWwgbWFya19wYWdlX2FjY2Vzc2VkICovCisJX19DbGVhclBhZ2VBY3RpdmUocGFnZSk7
CisJX19DbGVhclBhZ2VXYWl0ZXJzKHBhZ2UpOworCisJbWVtX2Nncm91cF91bmNoYXJnZShwYWdl
KTsKKworCS8qCisJICogV2hlbiBhIGRldmljZV9wcml2YXRlIHBhZ2UgaXMgZnJlZWQsIHRoZSBw
YWdlLT5tYXBwaW5nIGZpZWxkCisJICogbWF5IHN0aWxsIGNvbnRhaW4gYSAoc3RhbGUpIG1hcHBp
bmcgdmFsdWUuIEZvciBleGFtcGxlLCB0aGUKKwkgKiBsb3dlciBiaXRzIG9mIHBhZ2UtPm1hcHBp
bmcgbWF5IHN0aWxsIGlkZW50aWZ5IHRoZSBwYWdlIGFzIGFuCisJICogYW5vbnltb3VzIHBhZ2Uu
IFVsdGltYXRlbHksIHRoaXMgZW50aXJlIGZpZWxkIGlzIGp1c3Qgc3RhbGUKKwkgKiBhbmQgd3Jv
bmcsIGFuZCBpdCB3aWxsIGNhdXNlIGVycm9ycyBpZiBub3QgY2xlYXJlZC4gIE9uZQorCSAqIGV4
YW1wbGUgaXM6CisJICoKKwkgKiAgbWlncmF0ZV92bWFfcGFnZXMoKQorCSAqICAgIG1pZ3JhdGVf
dm1hX2luc2VydF9wYWdlKCkKKwkgKiAgICAgIHBhZ2VfYWRkX25ld19hbm9uX3JtYXAoKQorCSAq
ICAgICAgICBfX3BhZ2Vfc2V0X2Fub25fcm1hcCgpCisJICogICAgICAgICAgLi4uY2hlY2tzIHBh
Z2UtPm1hcHBpbmcsIHZpYSBQYWdlQW5vbihwYWdlKSBjYWxsLAorCSAqICAgICAgICAgICAgYW5k
IGluY29ycmVjdGx5IGNvbmNsdWRlcyB0aGF0IHRoZSBwYWdlIGlzIGFuCisJICogICAgICAgICAg
ICBhbm9ueW1vdXMgcGFnZS4gVGhlcmVmb3JlLCBpdCBpbmNvcnJlY3RseSwKKwkgKiAgICAgICAg
ICAgIHNpbGVudGx5IGZhaWxzIHRvIHNldCB1cCB0aGUgbmV3IGFub24gcm1hcC4KKwkgKgorCSAq
IEZvciBvdGhlciB0eXBlcyBvZiBaT05FX0RFVklDRSBwYWdlcywgbWlncmF0aW9uIGlzIGVpdGhl
cgorCSAqIGhhbmRsZWQgZGlmZmVyZW50bHkgb3Igbm90IGRvbmUgYXQgYWxsLCBzbyB0aGVyZSBp
cyBubyBuZWVkCisJICogdG8gY2xlYXIgcGFnZS0+bWFwcGluZy4KKwkgKi8KKwlwYWdlLT5tYXBw
aW5nID0gTlVMTDsKKwlwYWdlLT5wZ21hcC0+b3BzLT5wYWdlX2ZyZWUocGFnZSk7CiB9CiBFWFBP
UlRfU1lNQk9MKF9fcHV0X2Rldm1hcF9tYW5hZ2VkX3BhZ2UpOwogI2VuZGlmIC8qIENPTkZJR19E
RVZfUEFHRU1BUF9PUFMgKi8KLS0gCjIuMjQuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
