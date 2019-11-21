Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AE3104B30
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 08:14:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EADE96EB18;
	Thu, 21 Nov 2019 07:13:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E7176EAFE
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 07:13:57 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dd639310001>; Wed, 20 Nov 2019 23:13:53 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Wed, 20 Nov 2019 23:13:57 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Wed, 20 Nov 2019 23:13:57 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 21 Nov
 2019 07:13:55 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 21 Nov 2019 07:13:56 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dd63933000b>; Wed, 20 Nov 2019 23:13:55 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v7 09/24] vfio,
 mm: fix get_user_pages_remote() and FOLL_LONGTERM
Date: Wed, 20 Nov 2019 23:13:39 -0800
Message-ID: <20191121071354.456618-10-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191121071354.456618-1-jhubbard@nvidia.com>
References: <20191121071354.456618-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1574320433; bh=Uwl18s1SSepFZDEDvXpYEZES6pW0/uOIoLMPiWyv/Qc=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=Y6IwovW0VYU+VHJ2ZkZZO4WhiYcLlNJDLX3At5D7gGMjXxPYWMnfr+PP9N1AAfxLO
 98vur3h9JgtyRFONejciuxhxSQO1Pa14CyV7yQakfyXp0lFWlQzheM4YkVfWD+43IO
 j8hwojT+QlI1DFtKNbau0hn2YdoAVV3aerMAnO1THZmLR/I6OOm8dlbL0vb+gouocl
 lK12lrkUqW9V0l4c8dN7C2/K4n57zvr07C9hlu8zfG2pkhVgbNVW5GTuUpvcvAJWNJ
 4OWP/Nh3bpVtRXyIyFU7kBLJemn2iYUCWJhCg/vAFVkujLxZKNvmpZ5kxUprVWzRPR
 E6VI3Y54AZ71g==
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
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, Jason
 Gunthorpe <jgg@mellanox.com>, Vlastimil Babka <vbabka@suse.cz>,
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
TSB1c2VyLgoKQWxzbywgcmVtb3ZlIGFuIHVubmVzc2FyeSBwYWlyIG9mIGNhbGxzIHRoYXQgd2Vy
ZSByZWxlYXNpbmcgYW5kCnJlYWNxdWlyaW5nIHRoZSBtbWFwX3NlbS4gVGhlcmUgaXMgbm8gbmVl
ZCB0byBhdm9pZCBob2xkaW5nIG1tYXBfc2VtCmp1c3QgaW4gb3JkZXIgdG8gY2FsbCBwYWdlX3Rv
X3BmbigpLgoKQWxzbywgbW92ZSB0aGUgREFYIGNoZWNrICgiaWYgYSBWTUEgaXMgREFYLCBkb24n
dCBhbGxvdyBsb25nIHRlcm0KcGlubmluZyIpIGZyb20gdGhlIFZGSU8gY2FsbCBzaXRlLCBhbGwg
dGhlIHdheSBpbnRvIHRoZSBpbnRlcm5hbHMKb2YgZ2V0X3VzZXJfcGFnZXNfcmVtb3RlKCkgYW5k
IF9fZ3VwX2xvbmd0ZXJtX2xvY2tlZCgpLiBUaGF0IGlzOgpnZXRfdXNlcl9wYWdlc19yZW1vdGUo
KSBjYWxscyBfX2d1cF9sb25ndGVybV9sb2NrZWQoKSwgd2hpY2ggaW4gdHVybgpjYWxscyBjaGVj
a19kYXhfdm1hcygpLiBJdCdzIGxpZ2h0bHkgZXhwbGFpbmVkIGluIHRoZSBjb21tZW50cyBhcyB3
ZWxsLgoKVGhhbmtzIHRvIEphc29uIEd1bnRob3JwZSBmb3IgcG9pbnRpbmcgb3V0IGEgY2xlYW4g
d2F5IHRvIGZpeCB0aGlzLAphbmQgdG8gRGFuIFdpbGxpYW1zIGZvciBoZWxwaW5nIGNsYXJpZnkg
dGhlIERBWCByZWZhY3RvcmluZy4KClJldmlld2VkLWJ5OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0Bt
ZWxsYW5veC5jb20+ClJldmlld2VkLWJ5OiBJcmEgV2VpbnkgPGlyYS53ZWlueUBpbnRlbC5jb20+
ClN1Z2dlc3RlZC1ieTogSmFzb24gR3VudGhvcnBlIDxqZ2dAemllcGUuY2E+CkNjOiBEYW4gV2ls
bGlhbXMgPGRhbi5qLndpbGxpYW1zQGludGVsLmNvbT4KQ2M6IEplcm9tZSBHbGlzc2UgPGpnbGlz
c2VAcmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlk
aWEuY29tPgotLS0KIGRyaXZlcnMvdmZpby92ZmlvX2lvbW11X3R5cGUxLmMgfCAzMCArKysrKy0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIG1tL2d1cC5jICAgICAgICAgICAgICAgICAgICAgICAg
fCAyNyArKysrKysrKysrKysrKysrKysrKysrLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMjcgaW5z
ZXJ0aW9ucygrKSwgMzAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92ZmlvL3Zm
aW9faW9tbXVfdHlwZTEuYyBiL2RyaXZlcnMvdmZpby92ZmlvX2lvbW11X3R5cGUxLmMKaW5kZXgg
ZDg2NDI3N2VhMTZmLi5jN2ExMTFhZDk5NzUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmZpby92Zmlv
X2lvbW11X3R5cGUxLmMKKysrIGIvZHJpdmVycy92ZmlvL3ZmaW9faW9tbXVfdHlwZTEuYwpAQCAt
MzQwLDcgKzM0MCw2IEBAIHN0YXRpYyBpbnQgdmFkZHJfZ2V0X3BmbihzdHJ1Y3QgbW1fc3RydWN0
ICptbSwgdW5zaWduZWQgbG9uZyB2YWRkciwKIHsKIAlzdHJ1Y3QgcGFnZSAqcGFnZVsxXTsKIAlz
dHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYTsKLQlzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYXNb
MV07CiAJdW5zaWduZWQgaW50IGZsYWdzID0gMDsKIAlpbnQgcmV0OwogCkBAIC0zNDgsMzMgKzM0
NywxNCBAQCBzdGF0aWMgaW50IHZhZGRyX2dldF9wZm4oc3RydWN0IG1tX3N0cnVjdCAqbW0sIHVu
c2lnbmVkIGxvbmcgdmFkZHIsCiAJCWZsYWdzIHw9IEZPTExfV1JJVEU7CiAKIAlkb3duX3JlYWQo
Jm1tLT5tbWFwX3NlbSk7Ci0JaWYgKG1tID09IGN1cnJlbnQtPm1tKSB7Ci0JCXJldCA9IGdldF91
c2VyX3BhZ2VzKHZhZGRyLCAxLCBmbGFncyB8IEZPTExfTE9OR1RFUk0sIHBhZ2UsCi0JCQkJICAg
ICB2bWFzKTsKLQl9IGVsc2UgewotCQlyZXQgPSBnZXRfdXNlcl9wYWdlc19yZW1vdGUoTlVMTCwg
bW0sIHZhZGRyLCAxLCBmbGFncywgcGFnZSwKLQkJCQkJICAgIHZtYXMsIE5VTEwpOwotCQkvKgot
CQkgKiBUaGUgbGlmZXRpbWUgb2YgYSB2YWRkcl9nZXRfcGZuKCkgcGFnZSBwaW4gaXMKLQkJICog
dXNlcnNwYWNlLWNvbnRyb2xsZWQuIEluIHRoZSBmcy1kYXggY2FzZSB0aGlzIGNvdWxkCi0JCSAq
IGxlYWQgdG8gaW5kZWZpbml0ZSBzdGFsbHMgaW4gZmlsZXN5c3RlbSBvcGVyYXRpb25zLgotCQkg
KiBEaXNhbGxvdyBhdHRlbXB0cyB0byBwaW4gZnMtZGF4IHBhZ2VzIHZpYSB0aGlzCi0JCSAqIGlu
dGVyZmFjZS4KLQkJICovCi0JCWlmIChyZXQgPiAwICYmIHZtYV9pc19mc2RheCh2bWFzWzBdKSkg
ewotCQkJcmV0ID0gLUVPUE5PVFNVUFA7Ci0JCQlwdXRfcGFnZShwYWdlWzBdKTsKLQkJfQotCX0K
LQl1cF9yZWFkKCZtbS0+bW1hcF9zZW0pOwotCisJcmV0ID0gZ2V0X3VzZXJfcGFnZXNfcmVtb3Rl
KE5VTEwsIG1tLCB2YWRkciwgMSwgZmxhZ3MgfCBGT0xMX0xPTkdURVJNLAorCQkJCSAgICBwYWdl
LCBOVUxMLCBOVUxMKTsKIAlpZiAocmV0ID09IDEpIHsKIAkJKnBmbiA9IHBhZ2VfdG9fcGZuKHBh
Z2VbMF0pOwotCQlyZXR1cm4gMDsKKwkJcmV0ID0gMDsKKwkJZ290byBkb25lOwogCX0KIAotCWRv
d25fcmVhZCgmbW0tPm1tYXBfc2VtKTsKLQogCXZhZGRyID0gdW50YWdnZWRfYWRkcih2YWRkcik7
CiAKIAl2bWEgPSBmaW5kX3ZtYV9pbnRlcnNlY3Rpb24obW0sIHZhZGRyLCB2YWRkciArIDEpOwpA
QCAtMzg0LDcgKzM2NCw3IEBAIHN0YXRpYyBpbnQgdmFkZHJfZ2V0X3BmbihzdHJ1Y3QgbW1fc3Ry
dWN0ICptbSwgdW5zaWduZWQgbG9uZyB2YWRkciwKIAkJaWYgKGlzX2ludmFsaWRfcmVzZXJ2ZWRf
cGZuKCpwZm4pKQogCQkJcmV0ID0gMDsKIAl9Ci0KK2RvbmU6CiAJdXBfcmVhZCgmbW0tPm1tYXBf
c2VtKTsKIAlyZXR1cm4gcmV0OwogfQpkaWZmIC0tZ2l0IGEvbW0vZ3VwLmMgYi9tbS9ndXAuYwpp
bmRleCAxNGZjZGM1MDIxNjYuLmNjZTJjOTY3Njg1MyAxMDA2NDQKLS0tIGEvbW0vZ3VwLmMKKysr
IGIvbW0vZ3VwLmMKQEAgLTI5LDYgKzI5LDEzIEBAIHN0cnVjdCBmb2xsb3dfcGFnZV9jb250ZXh0
IHsKIAl1bnNpZ25lZCBpbnQgcGFnZV9tYXNrOwogfTsKIAorc3RhdGljIF9fYWx3YXlzX2lubGlu
ZSBsb25nIF9fZ3VwX2xvbmd0ZXJtX2xvY2tlZChzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRzaywKKwkJ
CQkJCSAgc3RydWN0IG1tX3N0cnVjdCAqbW0sCisJCQkJCQkgIHVuc2lnbmVkIGxvbmcgc3RhcnQs
CisJCQkJCQkgIHVuc2lnbmVkIGxvbmcgbnJfcGFnZXMsCisJCQkJCQkgIHN0cnVjdCBwYWdlICoq
cGFnZXMsCisJCQkJCQkgIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqKnZtYXMsCisJCQkJCQkgIHVu
c2lnbmVkIGludCBmbGFncyk7CiAvKgogICogUmV0dXJuIHRoZSBjb21wb3VuZCBoZWFkIHBhZ2Ug
d2l0aCByZWYgYXBwcm9wcmlhdGVseSBpbmNyZW1lbnRlZCwKICAqIG9yIE5VTEwgaWYgdGhhdCBm
YWlsZWQuCkBAIC0xMTY3LDEzICsxMTc0LDIzIEBAIGxvbmcgZ2V0X3VzZXJfcGFnZXNfcmVtb3Rl
KHN0cnVjdCB0YXNrX3N0cnVjdCAqdHNrLCBzdHJ1Y3QgbW1fc3RydWN0ICptbSwKIAkJc3RydWN0
IHZtX2FyZWFfc3RydWN0ICoqdm1hcywgaW50ICpsb2NrZWQpCiB7CiAJLyoKLQkgKiBGSVhNRTog
Q3VycmVudCBGT0xMX0xPTkdURVJNIGJlaGF2aW9yIGlzIGluY29tcGF0aWJsZSB3aXRoCisJICog
UGFydHMgb2YgRk9MTF9MT05HVEVSTSBiZWhhdmlvciBhcmUgaW5jb21wYXRpYmxlIHdpdGgKIAkg
KiBGQVVMVF9GTEFHX0FMTE9XX1JFVFJZIGJlY2F1c2Ugb2YgdGhlIEZTIERBWCBjaGVjayByZXF1
aXJlbWVudCBvbgotCSAqIHZtYXMuICBBcyB0aGVyZSBhcmUgbm8gdXNlcnMgb2YgdGhpcyBmbGFn
IGluIHRoaXMgY2FsbCB3ZSBzaW1wbHkKLQkgKiBkaXNhbGxvdyB0aGlzIG9wdGlvbiBmb3Igbm93
LgorCSAqIHZtYXMuIEhvd2V2ZXIsIHRoaXMgb25seSBjb21lcyB1cCBpZiBsb2NrZWQgaXMgc2V0
LCBhbmQgdGhlcmUgYXJlCisJICogY2FsbGVycyB0aGF0IGRvIHJlcXVlc3QgRk9MTF9MT05HVEVS
TSwgYnV0IGRvIG5vdCBzZXQgbG9ja2VkLiBTbywKKwkgKiBhbGxvdyB3aGF0IHdlIGNhbi4KIAkg
Ki8KLQlpZiAoV0FSTl9PTl9PTkNFKGd1cF9mbGFncyAmIEZPTExfTE9OR1RFUk0pKQotCQlyZXR1
cm4gLUVJTlZBTDsKKwlpZiAoZ3VwX2ZsYWdzICYgRk9MTF9MT05HVEVSTSkgeworCQlpZiAoV0FS
Tl9PTl9PTkNFKGxvY2tlZCkpCisJCQlyZXR1cm4gLUVJTlZBTDsKKwkJLyoKKwkJICogVGhpcyB3
aWxsIGNoZWNrIHRoZSB2bWFzIChldmVuIGlmIG91ciB2bWFzIGFyZyBpcyBOVUxMKQorCQkgKiBh
bmQgcmV0dXJuIC1FTk9UU1VQUCBpZiBEQVggaXNuJ3QgYWxsb3dlZCBpbiB0aGlzIGNhc2U6CisJ
CSAqLworCQlyZXR1cm4gX19ndXBfbG9uZ3Rlcm1fbG9ja2VkKHRzaywgbW0sIHN0YXJ0LCBucl9w
YWdlcywgcGFnZXMsCisJCQkJCSAgICAgdm1hcywgZ3VwX2ZsYWdzIHwgRk9MTF9UT1VDSCB8CisJ
CQkJCSAgICAgRk9MTF9SRU1PVEUpOworCX0KIAogCXJldHVybiBfX2dldF91c2VyX3BhZ2VzX2xv
Y2tlZCh0c2ssIG1tLCBzdGFydCwgbnJfcGFnZXMsIHBhZ2VzLCB2bWFzLAogCQkJCSAgICAgICBs
b2NrZWQsCi0tIAoyLjI0LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
