Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E9DF83F4
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 01:07:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A266D6EA0A;
	Tue, 12 Nov 2019 00:07:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CED96EA05
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 00:07:13 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dc9f7780003>; Mon, 11 Nov 2019 16:06:16 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 11 Nov 2019 16:07:12 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 11 Nov 2019 16:07:12 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 12 Nov
 2019 00:07:12 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Tue, 12 Nov 2019 00:07:11 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dc9f7ae0000>; Mon, 11 Nov 2019 16:07:11 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 08/23] vfio,
 mm: fix get_user_pages_remote() and FOLL_LONGTERM
Date: Mon, 11 Nov 2019 16:06:45 -0800
Message-ID: <20191112000700.3455038-9-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191112000700.3455038-1-jhubbard@nvidia.com>
References: <20191112000700.3455038-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1573517177; bh=LHd6nlstYt/+WO2arS2xO7M4BDaQ4oXhsosl4/alSFg=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=SJ2uh291o0n2KAathWWaARa6MvN+m/A73UL04mBGFpYz9dwZwEu2YOKZK/z6oR36f
 S4MmrBohFcW7M4U4sGwLAQQaa4ErNxr5zszFsv1ppGBtK5nFe0oidXZ1r/1d+C5hHD
 7OdWLPmiW5F6FVC/3nIr5wwa+GbS2yQdK9nseWpjIMdx642Wxvb5Kkid/PLVxBV3h0
 OGPpdpsgYBaWnEIgbpCi7rX0MmoFtgOyBhqm3y6VOtt9bGAvDRddLo4gcp8LgfWb9W
 RGx06m/cZaFaW7nNL6zPl1lRK04yV8Qj7tUjurbVty1S8No3Te9OtVs5tQeXtoroeI
 mB7ag0CyWpHAw==
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

QXMgaXQgc2F5cyBpbiB0aGUgdXBkYXRlZCBjb21tZW50IGluIGd1cC5jOiBjdXJyZW50IEZPTExf
TE9OR1RFUk0KYmVoYXZpb3IgaXMgaW5jb21wYXRpYmxlIHdpdGggRkFVTFRfRkxBR19BTExPV19S
RVRSWSBiZWNhdXNlIG9mIHRoZQpGUyBEQVggY2hlY2sgcmVxdWlyZW1lbnQgb24gdm1hcy4KCkhv
d2V2ZXIsIHRoZSBjb3JyZXNwb25kaW5nIHJlc3RyaWN0aW9uIGluIGdldF91c2VyX3BhZ2VzX3Jl
bW90ZSgpIHdhcwpzbGlnaHRseSBzdHJpY3RlciB0aGFuIGlzIGFjdHVhbGx5IHJlcXVpcmVkOiBp
dCBmb3JiYWRlIGFsbApGT0xMX0xPTkdURVJNIGNhbGxlcnMsIGJ1dCB3ZSBjYW4gYWN0dWFsbHkg
YWxsb3cgRk9MTF9MT05HVEVSTSBjYWxsZXJzCnRoYXQgZG8gbm90IHNldCB0aGUgImxvY2tlZCIg
YXJnLgoKVXBkYXRlIHRoZSBjb2RlIGFuZCBjb21tZW50cyBhY2NvcmRpbmdseSwgYW5kIHVwZGF0
ZSB0aGUgVkZJTyBjYWxsZXIKdG8gdGFrZSBhZHZhbnRhZ2Ugb2YgdGhpcywgZml4aW5nIGEgYnVn
IGFzIGEgcmVzdWx0OiB0aGUgVkZJTyBjYWxsZXIKaXMgbG9naWNhbGx5IGEgRk9MTF9MT05HVEVS
TSB1c2VyLgoKVGhhbmtzIHRvIEphc29uIEd1bnRob3JwZSBmb3IgcG9pbnRpbmcgb3V0IGEgY2xl
YW4gd2F5IHRvIGZpeCB0aGlzLgoKU3VnZ2VzdGVkLWJ5OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6
aWVwZS5jYT4KQ2M6IEplcm9tZSBHbGlzc2UgPGpnbGlzc2VAcmVkaGF0LmNvbT4KQ2M6IElyYSBX
ZWlueSA8aXJhLndlaW55QGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxq
aHViYmFyZEBudmlkaWEuY29tPgotLS0KIGRyaXZlcnMvdmZpby92ZmlvX2lvbW11X3R5cGUxLmMg
fCAzMCArKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0KIG1tL2d1cC5jICAgICAgICAgICAg
ICAgICAgICAgICAgfCAxMyArKysrKysrKy0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDIxIGluc2Vy
dGlvbnMoKyksIDIyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmZpby92Zmlv
X2lvbW11X3R5cGUxLmMgYi9kcml2ZXJzL3ZmaW8vdmZpb19pb21tdV90eXBlMS5jCmluZGV4IGQ4
NjQyNzdlYTE2Zi4uMDE3Njg5YjdjMzJiIDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZmaW8vdmZpb19p
b21tdV90eXBlMS5jCisrKyBiL2RyaXZlcnMvdmZpby92ZmlvX2lvbW11X3R5cGUxLmMKQEAgLTM0
OCwyNCArMzQ4LDIwIEBAIHN0YXRpYyBpbnQgdmFkZHJfZ2V0X3BmbihzdHJ1Y3QgbW1fc3RydWN0
ICptbSwgdW5zaWduZWQgbG9uZyB2YWRkciwKIAkJZmxhZ3MgfD0gRk9MTF9XUklURTsKIAogCWRv
d25fcmVhZCgmbW0tPm1tYXBfc2VtKTsKLQlpZiAobW0gPT0gY3VycmVudC0+bW0pIHsKLQkJcmV0
ID0gZ2V0X3VzZXJfcGFnZXModmFkZHIsIDEsIGZsYWdzIHwgRk9MTF9MT05HVEVSTSwgcGFnZSwK
LQkJCQkgICAgIHZtYXMpOwotCX0gZWxzZSB7Ci0JCXJldCA9IGdldF91c2VyX3BhZ2VzX3JlbW90
ZShOVUxMLCBtbSwgdmFkZHIsIDEsIGZsYWdzLCBwYWdlLAotCQkJCQkgICAgdm1hcywgTlVMTCk7
Ci0JCS8qCi0JCSAqIFRoZSBsaWZldGltZSBvZiBhIHZhZGRyX2dldF9wZm4oKSBwYWdlIHBpbiBp
cwotCQkgKiB1c2Vyc3BhY2UtY29udHJvbGxlZC4gSW4gdGhlIGZzLWRheCBjYXNlIHRoaXMgY291
bGQKLQkJICogbGVhZCB0byBpbmRlZmluaXRlIHN0YWxscyBpbiBmaWxlc3lzdGVtIG9wZXJhdGlv
bnMuCi0JCSAqIERpc2FsbG93IGF0dGVtcHRzIHRvIHBpbiBmcy1kYXggcGFnZXMgdmlhIHRoaXMK
LQkJICogaW50ZXJmYWNlLgotCQkgKi8KLQkJaWYgKHJldCA+IDAgJiYgdm1hX2lzX2ZzZGF4KHZt
YXNbMF0pKSB7Ci0JCQlyZXQgPSAtRU9QTk9UU1VQUDsKLQkJCXB1dF9wYWdlKHBhZ2VbMF0pOwot
CQl9CisJcmV0ID0gZ2V0X3VzZXJfcGFnZXNfcmVtb3RlKE5VTEwsIG1tLCB2YWRkciwgMSwgZmxh
Z3MgfCBGT0xMX0xPTkdURVJNLAorCQkJCSAgICBwYWdlLCB2bWFzLCBOVUxMKTsKKwkvKgorCSAq
IFRoZSBsaWZldGltZSBvZiBhIHZhZGRyX2dldF9wZm4oKSBwYWdlIHBpbiBpcworCSAqIHVzZXJz
cGFjZS1jb250cm9sbGVkLiBJbiB0aGUgZnMtZGF4IGNhc2UgdGhpcyBjb3VsZAorCSAqIGxlYWQg
dG8gaW5kZWZpbml0ZSBzdGFsbHMgaW4gZmlsZXN5c3RlbSBvcGVyYXRpb25zLgorCSAqIERpc2Fs
bG93IGF0dGVtcHRzIHRvIHBpbiBmcy1kYXggcGFnZXMgdmlhIHRoaXMKKwkgKiBpbnRlcmZhY2Uu
CisJICovCisJaWYgKHJldCA+IDAgJiYgdm1hX2lzX2ZzZGF4KHZtYXNbMF0pKSB7CisJCXJldCA9
IC1FT1BOT1RTVVBQOworCQlwdXRfcGFnZShwYWdlWzBdKTsKIAl9CisKIAl1cF9yZWFkKCZtbS0+
bW1hcF9zZW0pOwogCiAJaWYgKHJldCA9PSAxKSB7CmRpZmYgLS1naXQgYS9tbS9ndXAuYyBiL21t
L2d1cC5jCmluZGV4IDkzMzUyNGRlNjI0OS4uY2ZlNmRjNWZjMzQzIDEwMDY0NAotLS0gYS9tbS9n
dXAuYworKysgYi9tbS9ndXAuYwpAQCAtMTE2NywxMyArMTE2NywxNiBAQCBsb25nIGdldF91c2Vy
X3BhZ2VzX3JlbW90ZShzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRzaywgc3RydWN0IG1tX3N0cnVjdCAq
bW0sCiAJCXN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqKnZtYXMsIGludCAqbG9ja2VkKQogewogCS8q
Ci0JICogRklYTUU6IEN1cnJlbnQgRk9MTF9MT05HVEVSTSBiZWhhdmlvciBpcyBpbmNvbXBhdGli
bGUgd2l0aAorCSAqIEN1cnJlbnQgRk9MTF9MT05HVEVSTSBiZWhhdmlvciBpcyBpbmNvbXBhdGli
bGUgd2l0aAogCSAqIEZBVUxUX0ZMQUdfQUxMT1dfUkVUUlkgYmVjYXVzZSBvZiB0aGUgRlMgREFY
IGNoZWNrIHJlcXVpcmVtZW50IG9uCi0JICogdm1hcy4gIEFzIHRoZXJlIGFyZSBubyB1c2VycyBv
ZiB0aGlzIGZsYWcgaW4gdGhpcyBjYWxsIHdlIHNpbXBseQotCSAqIGRpc2FsbG93IHRoaXMgb3B0
aW9uIGZvciBub3cuCisJICogdm1hcy4gSG93ZXZlciwgdGhpcyBvbmx5IGNvbWVzIHVwIGlmIGxv
Y2tlZCBpcyBzZXQsIGFuZCB0aGVyZSBhcmUKKwkgKiBjYWxsZXJzIHRoYXQgZG8gcmVxdWVzdCBG
T0xMX0xPTkdURVJNLCBidXQgZG8gbm90IHNldCBsb2NrZWQuIFNvLAorCSAqIGFsbG93IHdoYXQg
d2UgY2FuLgogCSAqLwotCWlmIChXQVJOX09OX09OQ0UoZ3VwX2ZsYWdzICYgRk9MTF9MT05HVEVS
TSkpCi0JCXJldHVybiAtRUlOVkFMOworCWlmIChndXBfZmxhZ3MgJiBGT0xMX0xPTkdURVJNKSB7
CisJCWlmIChXQVJOX09OX09OQ0UobG9ja2VkKSkKKwkJCXJldHVybiAtRUlOVkFMOworCX0KIAog
CXJldHVybiBfX2dldF91c2VyX3BhZ2VzX2xvY2tlZCh0c2ssIG1tLCBzdGFydCwgbnJfcGFnZXMs
IHBhZ2VzLCB2bWFzLAogCQkJCSAgICAgICBsb2NrZWQsCi0tIAoyLjI0LjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
