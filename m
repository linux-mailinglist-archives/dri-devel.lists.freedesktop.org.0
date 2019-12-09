Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 920F4117A04
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 23:54:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D786E5C6;
	Mon,  9 Dec 2019 22:54:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0C546E5BB
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 22:54:09 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5deed07c0000>; Mon, 09 Dec 2019 14:53:48 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 09 Dec 2019 14:54:09 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 09 Dec 2019 14:54:09 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 9 Dec
 2019 22:54:08 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 9 Dec
 2019 22:54:08 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Mon, 9 Dec 2019 22:54:07 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5deed08e0000>; Mon, 09 Dec 2019 14:54:06 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v8 20/26] powerpc: book3s64: convert to pin_user_pages() and
 put_user_page()
Date: Mon, 9 Dec 2019 14:53:38 -0800
Message-ID: <20191209225344.99740-21-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191209225344.99740-1-jhubbard@nvidia.com>
References: <20191209225344.99740-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1575932029; bh=IrXYbV9R0vnJHGhlZjINDlSdvrs03wECmgURaURVtqE=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=WhsiSQ3UbR8GTS9scmwBNOQ/VjWAqEEZK2GbNKhscKkyJkniMbVphYecKC59S9YrX
 ufMC9MTwKq4Gp4zyHdkyeKaMuJMkrv7Ehp+e4gd8ndi924GMRltfG3U/zMTMCltoUa
 K15wFcxvvC86D0DI9eoa0+kOx0RfNTczuMCM7MMiH/qHiERgXSakVbMoEwGq4OvaFU
 YbdZ5NNdE4Yqe4nsIw2CamEhAngv2/zrToBWvdywK+54kSSIBO+f2a+OxHsRT1DRtt
 0rEVgLblQxXNtGO9+koQiwcw8bykNgsIgy/jl5HLId9MEksa2ZuWW1A72sJdteNmrN
 5jokdoze79MoA==
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

MS4gQ29udmVydCBmcm9tIGdldF91c2VyX3BhZ2VzKCkgdG8gcGluX3VzZXJfcGFnZXMoKS4KCjIu
IEFzIHJlcXVpcmVkIGJ5IHBpbl91c2VyX3BhZ2VzKCksIHJlbGVhc2UgdGhlc2UgcGFnZXMgdmlh
CnB1dF91c2VyX3BhZ2UoKS4gSW4gdGhpcyBjYXNlLCBkbyBzbyB2aWEgcHV0X3VzZXJfcGFnZXNf
ZGlydHlfbG9jaygpLgoKVGhhdCBoYXMgdGhlIHNpZGUgZWZmZWN0IG9mIGNhbGxpbmcgc2V0X3Bh
Z2VfZGlydHlfbG9jaygpLCBpbnN0ZWFkCm9mIHNldF9wYWdlX2RpcnR5KCkuIFRoaXMgaXMgcHJv
YmFibHkgbW9yZSBhY2N1cmF0ZS4KCkFzIENocmlzdG9waCBIZWxsd2lnIHB1dCBpdCwgInNldF9w
YWdlX2RpcnR5KCkgaXMgb25seSBzYWZlIGlmIHdlIGFyZQpkZWFsaW5nIHdpdGggYSBmaWxlIGJh
Y2tlZCBwYWdlIHdoZXJlIHdlIGhhdmUgcmVmZXJlbmNlIG9uIHRoZSBpbm9kZSBpdApoYW5ncyBv
ZmYuIiBbMV0KClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMTkwNzIzMTUzNjQwLkdC
NzIwQGxzdC5kZQoKQ2M6IEphbiBLYXJhIDxqYWNrQHN1c2UuY3o+ClNpZ25lZC1vZmYtYnk6IEpv
aG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KLS0tCiBhcmNoL3Bvd2VycGMvbW0vYm9v
azNzNjQvaW9tbXVfYXBpLmMgfCAxMiArKysrKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGlu
c2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL21t
L2Jvb2szczY0L2lvbW11X2FwaS5jIGIvYXJjaC9wb3dlcnBjL21tL2Jvb2szczY0L2lvbW11X2Fw
aS5jCmluZGV4IDU2Y2M4NDUyMDU3Ny4uZmMxNjcwYTZmYzNjIDEwMDY0NAotLS0gYS9hcmNoL3Bv
d2VycGMvbW0vYm9vazNzNjQvaW9tbXVfYXBpLmMKKysrIGIvYXJjaC9wb3dlcnBjL21tL2Jvb2sz
czY0L2lvbW11X2FwaS5jCkBAIC0xMDMsNyArMTAzLDcgQEAgc3RhdGljIGxvbmcgbW1faW9tbXVf
ZG9fYWxsb2Moc3RydWN0IG1tX3N0cnVjdCAqbW0sIHVuc2lnbmVkIGxvbmcgdWEsCiAJZm9yIChl
bnRyeSA9IDA7IGVudHJ5IDwgZW50cmllczsgZW50cnkgKz0gY2h1bmspIHsKIAkJdW5zaWduZWQg
bG9uZyBuID0gbWluKGVudHJpZXMgLSBlbnRyeSwgY2h1bmspOwogCi0JCXJldCA9IGdldF91c2Vy
X3BhZ2VzKHVhICsgKGVudHJ5IDw8IFBBR0VfU0hJRlQpLCBuLAorCQlyZXQgPSBwaW5fdXNlcl9w
YWdlcyh1YSArIChlbnRyeSA8PCBQQUdFX1NISUZUKSwgbiwKIAkJCQlGT0xMX1dSSVRFIHwgRk9M
TF9MT05HVEVSTSwKIAkJCQltZW0tPmhwYWdlcyArIGVudHJ5LCBOVUxMKTsKIAkJaWYgKHJldCA9
PSBuKSB7CkBAIC0xNjcsOSArMTY3LDggQEAgc3RhdGljIGxvbmcgbW1faW9tbXVfZG9fYWxsb2Mo
c3RydWN0IG1tX3N0cnVjdCAqbW0sIHVuc2lnbmVkIGxvbmcgdWEsCiAJcmV0dXJuIDA7CiAKIGZy
ZWVfZXhpdDoKLQkvKiBmcmVlIHRoZSByZWZlcmVuY2UgdGFrZW4gKi8KLQlmb3IgKGkgPSAwOyBp
IDwgcGlubmVkOyBpKyspCi0JCXB1dF9wYWdlKG1lbS0+aHBhZ2VzW2ldKTsKKwkvKiBmcmVlIHRo
ZSByZWZlcmVuY2VzIHRha2VuICovCisJcHV0X3VzZXJfcGFnZXMobWVtLT5ocGFnZXMsIHBpbm5l
ZCk7CiAKIAl2ZnJlZShtZW0tPmhwYXMpOwogCWtmcmVlKG1lbSk7CkBAIC0yMTIsMTAgKzIxMSw5
IEBAIHN0YXRpYyB2b2lkIG1tX2lvbW11X3VucGluKHN0cnVjdCBtbV9pb21tdV90YWJsZV9ncm91
cF9tZW1fdCAqbWVtKQogCQlpZiAoIXBhZ2UpCiAJCQljb250aW51ZTsKIAotCQlpZiAobWVtLT5o
cGFzW2ldICYgTU1fSU9NTVVfVEFCTEVfR1JPVVBfUEFHRV9ESVJUWSkKLQkJCVNldFBhZ2VEaXJ0
eShwYWdlKTsKKwkJcHV0X3VzZXJfcGFnZXNfZGlydHlfbG9jaygmcGFnZSwgMSwKKwkJCQltZW0t
PmhwYXNbaV0gJiBNTV9JT01NVV9UQUJMRV9HUk9VUF9QQUdFX0RJUlRZKTsKIAotCQlwdXRfcGFn
ZShwYWdlKTsKIAkJbWVtLT5ocGFzW2ldID0gMDsKIAl9CiB9Ci0tIAoyLjI0LjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
