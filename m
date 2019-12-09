Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C081179FA
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 23:54:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 920446E5A9;
	Mon,  9 Dec 2019 22:54:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78CB46E5A0
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 22:53:58 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5deed07f0002>; Mon, 09 Dec 2019 14:53:52 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 09 Dec 2019 14:53:57 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 09 Dec 2019 14:53:57 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 9 Dec
 2019 22:53:57 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 9 Dec
 2019 22:53:56 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Mon, 9 Dec 2019 22:53:56 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5deed0830002>; Mon, 09 Dec 2019 14:53:55 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v8 07/26] vfio: fix FOLL_LONGTERM use,
 simplify get_user_pages_remote() call
Date: Mon, 9 Dec 2019 14:53:25 -0800
Message-ID: <20191209225344.99740-8-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191209225344.99740-1-jhubbard@nvidia.com>
References: <20191209225344.99740-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1575932032; bh=8L6xDPC0B530xp/MTT0aA3xB5v7i2RtCewyab6Z4Hgg=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=Yr7rnMyP9nuJBW/roKy+70R1QH1xPYt7cT5b3NmcMit5wvFElqNAZ7Snz2sWvvVy7
 6Yh3d6zgXNGmtvZqjsmA6es64h9a8u6TMyLPhBHDlW3o5G5JGlJZUzT4G2YQN0ElhJ
 M74Lu94G7MHDwiXBP5nzKgBnvuwLPWrxJzr7w/VhBmvI+iYPpkH1Oe2UoxZusyZWW8
 dxWo9gbaLViTIo2IDCzCFGedH7Tm1vD787dlT3Ez73wIHQ1uuw+4NEad9sRDLADDLO
 NV7lshKCHkEyy8n9++u3nJk2vzho4m56YWzJMlqbY9aI5KV88eqDR10FBgoMHHIPkv
 ETlsss72YMETA==
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

VXBkYXRlIFZGSU8gdG8gdGFrZSBhZHZhbnRhZ2Ugb2YgdGhlIHJlY2VudGx5IGxvb3NlbmVkIHJl
c3RyaWN0aW9uIG9uCkZPTExfTE9OR1RFUk0gd2l0aCBnZXRfdXNlcl9wYWdlc19yZW1vdGUoKS4g
QWxzbywgbm93IGl0IGlzIHBvc3NpYmxlIHRvCmZpeCBhIGJ1ZzogdGhlIFZGSU8gY2FsbGVyIGlz
IGxvZ2ljYWxseSBhIEZPTExfTE9OR1RFUk0gdXNlciwgYnV0IGl0Cndhc24ndCBzZXR0aW5nIEZP
TExfTE9OR1RFUk0uCgpBbHNvLCByZW1vdmUgYW4gdW5uZXNzYXJ5IHBhaXIgb2YgY2FsbHMgdGhh
dCB3ZXJlIHJlbGVhc2luZyBhbmQKcmVhY3F1aXJpbmcgdGhlIG1tYXBfc2VtLiBUaGVyZSBpcyBu
byBuZWVkIHRvIGF2b2lkIGhvbGRpbmcgbW1hcF9zZW0KanVzdCBpbiBvcmRlciB0byBjYWxsIHBh
Z2VfdG9fcGZuKCkuCgpBbHNvLCBub3cgdGhhdCB0aGUgdGhlIERBWCBjaGVjayAoImlmIGEgVk1B
IGlzIERBWCwgZG9uJ3QgYWxsb3cgbG9uZwp0ZXJtIHBpbm5pbmciKSBpcyBpbiB0aGUgaW50ZXJu
YWxzIG9mIGdldF91c2VyX3BhZ2VzX3JlbW90ZSgpIGFuZApfX2d1cF9sb25ndGVybV9sb2NrZWQo
KSwgdGhlcmUncyBubyBuZWVkIGZvciBpdCBhdCB0aGUgVkZJTyBjYWxsIHNpdGUuClNvIHJlbW92
ZSBpdC4KClRlc3RlZC1ieTogQWxleCBXaWxsaWFtc29uIDxhbGV4LndpbGxpYW1zb25AcmVkaGF0
LmNvbT4KQWNrZWQtYnk6IEFsZXggV2lsbGlhbXNvbiA8YWxleC53aWxsaWFtc29uQHJlZGhhdC5j
b20+ClJldmlld2VkLWJ5OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+ClJldmll
d2VkLWJ5OiBJcmEgV2VpbnkgPGlyYS53ZWlueUBpbnRlbC5jb20+ClN1Z2dlc3RlZC1ieTogSmFz
b24gR3VudGhvcnBlIDxqZ2dAemllcGUuY2E+CkNjOiBEYW4gV2lsbGlhbXMgPGRhbi5qLndpbGxp
YW1zQGludGVsLmNvbT4KQ2M6IEplcm9tZSBHbGlzc2UgPGpnbGlzc2VAcmVkaGF0LmNvbT4KU2ln
bmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgotLS0KIGRyaXZl
cnMvdmZpby92ZmlvX2lvbW11X3R5cGUxLmMgfCAzMCArKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDI1IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmZpby92ZmlvX2lvbW11X3R5cGUxLmMgYi9kcml2ZXJzL3Zm
aW8vdmZpb19pb21tdV90eXBlMS5jCmluZGV4IDJhZGE4ZTZjZGI4OC4uYjgwMGZjOWEwMjUxIDEw
MDY0NAotLS0gYS9kcml2ZXJzL3ZmaW8vdmZpb19pb21tdV90eXBlMS5jCisrKyBiL2RyaXZlcnMv
dmZpby92ZmlvX2lvbW11X3R5cGUxLmMKQEAgLTMyMiw3ICszMjIsNiBAQCBzdGF0aWMgaW50IHZh
ZGRyX2dldF9wZm4oc3RydWN0IG1tX3N0cnVjdCAqbW0sIHVuc2lnbmVkIGxvbmcgdmFkZHIsCiB7
CiAJc3RydWN0IHBhZ2UgKnBhZ2VbMV07CiAJc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWE7Ci0J
c3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWFzWzFdOwogCXVuc2lnbmVkIGludCBmbGFncyA9IDA7
CiAJaW50IHJldDsKIApAQCAtMzMwLDMzICszMjksMTQgQEAgc3RhdGljIGludCB2YWRkcl9nZXRf
cGZuKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBsb25nIHZhZGRyLAogCQlmbGFncyB8
PSBGT0xMX1dSSVRFOwogCiAJZG93bl9yZWFkKCZtbS0+bW1hcF9zZW0pOwotCWlmIChtbSA9PSBj
dXJyZW50LT5tbSkgewotCQlyZXQgPSBnZXRfdXNlcl9wYWdlcyh2YWRkciwgMSwgZmxhZ3MgfCBG
T0xMX0xPTkdURVJNLCBwYWdlLAotCQkJCSAgICAgdm1hcyk7Ci0JfSBlbHNlIHsKLQkJcmV0ID0g
Z2V0X3VzZXJfcGFnZXNfcmVtb3RlKE5VTEwsIG1tLCB2YWRkciwgMSwgZmxhZ3MsIHBhZ2UsCi0J
CQkJCSAgICB2bWFzLCBOVUxMKTsKLQkJLyoKLQkJICogVGhlIGxpZmV0aW1lIG9mIGEgdmFkZHJf
Z2V0X3BmbigpIHBhZ2UgcGluIGlzCi0JCSAqIHVzZXJzcGFjZS1jb250cm9sbGVkLiBJbiB0aGUg
ZnMtZGF4IGNhc2UgdGhpcyBjb3VsZAotCQkgKiBsZWFkIHRvIGluZGVmaW5pdGUgc3RhbGxzIGlu
IGZpbGVzeXN0ZW0gb3BlcmF0aW9ucy4KLQkJICogRGlzYWxsb3cgYXR0ZW1wdHMgdG8gcGluIGZz
LWRheCBwYWdlcyB2aWEgdGhpcwotCQkgKiBpbnRlcmZhY2UuCi0JCSAqLwotCQlpZiAocmV0ID4g
MCAmJiB2bWFfaXNfZnNkYXgodm1hc1swXSkpIHsKLQkJCXJldCA9IC1FT1BOT1RTVVBQOwotCQkJ
cHV0X3BhZ2UocGFnZVswXSk7Ci0JCX0KLQl9Ci0JdXBfcmVhZCgmbW0tPm1tYXBfc2VtKTsKLQor
CXJldCA9IGdldF91c2VyX3BhZ2VzX3JlbW90ZShOVUxMLCBtbSwgdmFkZHIsIDEsIGZsYWdzIHwg
Rk9MTF9MT05HVEVSTSwKKwkJCQkgICAgcGFnZSwgTlVMTCwgTlVMTCk7CiAJaWYgKHJldCA9PSAx
KSB7CiAJCSpwZm4gPSBwYWdlX3RvX3BmbihwYWdlWzBdKTsKLQkJcmV0dXJuIDA7CisJCXJldCA9
IDA7CisJCWdvdG8gZG9uZTsKIAl9CiAKLQlkb3duX3JlYWQoJm1tLT5tbWFwX3NlbSk7Ci0KIAl2
YWRkciA9IHVudGFnZ2VkX2FkZHIodmFkZHIpOwogCiAJdm1hID0gZmluZF92bWFfaW50ZXJzZWN0
aW9uKG1tLCB2YWRkciwgdmFkZHIgKyAxKTsKQEAgLTM2Niw3ICszNDYsNyBAQCBzdGF0aWMgaW50
IHZhZGRyX2dldF9wZm4oc3RydWN0IG1tX3N0cnVjdCAqbW0sIHVuc2lnbmVkIGxvbmcgdmFkZHIs
CiAJCWlmIChpc19pbnZhbGlkX3Jlc2VydmVkX3BmbigqcGZuKSkKIAkJCXJldCA9IDA7CiAJfQot
Citkb25lOgogCXVwX3JlYWQoJm1tLT5tbWFwX3NlbSk7CiAJcmV0dXJuIHJldDsKIH0KLS0gCjIu
MjQuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
