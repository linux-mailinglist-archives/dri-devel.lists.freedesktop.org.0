Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A935EAC43
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 10:05:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36A666EDED;
	Thu, 31 Oct 2019 09:04:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 027076EBB5
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 22:49:52 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dba13960000>; Wed, 30 Oct 2019 15:49:58 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Wed, 30 Oct 2019 15:49:52 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Wed, 30 Oct 2019 15:49:52 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 30 Oct
 2019 22:49:52 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Wed, 30 Oct 2019 22:49:50 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dba138d0002>; Wed, 30 Oct 2019 15:49:50 -0700
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 14/19] vfio,
 mm: pin_longterm_pages (FOLL_PIN) and put_user_page() conversion
Date: Wed, 30 Oct 2019 15:49:25 -0700
Message-ID: <20191030224930.3990755-15-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191030224930.3990755-1-jhubbard@nvidia.com>
References: <20191030224930.3990755-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Thu, 31 Oct 2019 09:04:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1572475798; bh=XFjm8RPGYOGaZ8I6ZtqUF2w9I0TfFUQHc/AIPIbYpP8=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=NIyNWer02EnMgKZ9CI4sXwt3Ux9yX4ajp4i5vLHbPveoh8o54s25FzHdtrjaaC5Lf
 VfosVhiF7ivR2LFLOPHJF45E2C9griCDCZRjJzvkuAwvzJz5oQxrjk1W2FBNv/t05y
 K9WA8xzVRUfeJTJJYCffPgb4TWKk5kKxW/6FDvZb5VL2fGYJ2P5PWJ7kjzOaJFhGUd
 XF31UGOtBYD4QLg72qOOtNhZF+bY9kaO0SKRfg3xZP8fvWiZGFBKcdkpbddjVG5j4t
 0VemY1URa0sH/nhlOs0AYfqaIAHz3lVPWpgsYIljNs0B6piBSdJ57j0yNKS3kIokdn
 dWyNgFVoj/U2Q==
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

VGhpcyBhbHNvIGZpeGVzIG9uZSBvciB0d28gbGlrZWx5IGJ1Z3MuCgoxLiBDaGFuZ2UgdmZpbyBm
cm9tIGdldF91c2VyX3BhZ2VzKEZPTExfTE9OR1RFUk0pLCB0bwpwaW5fbG9uZ3Rlcm1fcGFnZXMo
KSwgd2hpY2ggc2V0cyBib3RoIEZPTExfTE9OR1RFUk0gYW5kIEZPTExfUElOLgoKTm90ZSB0aGF0
IHRoaXMgaXMgYSBjaGFuZ2UgaW4gYmVoYXZpb3IsIGJlY2F1c2UgdGhlCmdldF91c2VyX3BhZ2Vz
X3JlbW90ZSgpIGNhbGwgd2FzIG5vdCBzZXR0aW5nIEZPTExfTE9OR1RFUk0sIGJ1dCB0aGUKbmV3
IHBpbl91c2VyX3BhZ2VzX3JlbW90ZSgpIGNhbGwgdGhhdCByZXBsYWNlcyBpdCwgKmlzKiBzZXR0
aW5nCkZPTExfTE9OR1RFUk0uIEl0IGlzIGltcG9ydGFudCB0byBzZXQgRk9MTF9MT05HVEVSTSwg
YmVjYXVzZSB0aGUKRE1BIGNhc2UgcmVxdWlyZXMgaXQuIFBsZWFzZSBzZWUgdGhlIEZPTExfUElO
IGRvY3VtZW50YXRpb24gaW4KaW5jbHVkZS9saW51eC9tbS5oLCBhbmQgRG9jdW1lbnRhdGlvbi9w
aW5fdXNlcl9wYWdlcy5yc3QgZm9yIGRldGFpbHMuCgoyLiBCZWNhdXNlIGFsbCBGT0xMX1BJTi1h
Y3F1aXJlZCBwYWdlcyBtdXN0IGJlIHJlbGVhc2VkIHZpYQpwdXRfdXNlcl9wYWdlKCksIGFsc28g
Y29udmVydCB0aGUgcHV0X3BhZ2UoKSBjYWxsIG92ZXIgdG8KcHV0X3VzZXJfcGFnZXMoKS4KCk5v
dGUgdGhhdCB0aGlzIGVmZmVjdGl2ZWx5IGNoYW5nZXMgdGhlIGNvZGUncyBiZWhhdmlvciBpbgp2
ZmlvX2lvbW11X3R5cGUxLmM6IHB1dF9wZm4oKTogaXQgbm93IHVsdGltYXRlbHkgY2FsbHMKc2V0
X3BhZ2VfZGlydHlfbG9jaygpLCBpbnN0ZWFkIG9mIHNldF9wYWdlX2RpcnR5KCkuIFRoaXMgaXMK
cHJvYmFibHkgbW9yZSBhY2N1cmF0ZS4KCkFzIENocmlzdG9waCBIZWxsd2lnIHB1dCBpdCwgInNl
dF9wYWdlX2RpcnR5KCkgaXMgb25seSBzYWZlIGlmIHdlIGFyZQpkZWFsaW5nIHdpdGggYSBmaWxl
IGJhY2tlZCBwYWdlIHdoZXJlIHdlIGhhdmUgcmVmZXJlbmNlIG9uIHRoZSBpbm9kZSBpdApoYW5n
cyBvZmYuIiBbMV0KClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMTkwNzIzMTUzNjQw
LkdCNzIwQGxzdC5kZQoKQ2M6IEFsZXggV2lsbGlhbXNvbiA8YWxleC53aWxsaWFtc29uQHJlZGhh
dC5jb20+ClNpZ25lZC1vZmYtYnk6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4K
LS0tCiBkcml2ZXJzL3ZmaW8vdmZpb19pb21tdV90eXBlMS5jIHwgMTUgKysrKysrKy0tLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvdmZpby92ZmlvX2lvbW11X3R5cGUxLmMgYi9kcml2ZXJzL3ZmaW8vdmZp
b19pb21tdV90eXBlMS5jCmluZGV4IGQ4NjQyNzdlYTE2Zi4uNzk1ZTEzZjNlZjA4IDEwMDY0NAot
LS0gYS9kcml2ZXJzL3ZmaW8vdmZpb19pb21tdV90eXBlMS5jCisrKyBiL2RyaXZlcnMvdmZpby92
ZmlvX2lvbW11X3R5cGUxLmMKQEAgLTMyNyw5ICszMjcsOCBAQCBzdGF0aWMgaW50IHB1dF9wZm4o
dW5zaWduZWQgbG9uZyBwZm4sIGludCBwcm90KQogewogCWlmICghaXNfaW52YWxpZF9yZXNlcnZl
ZF9wZm4ocGZuKSkgewogCQlzdHJ1Y3QgcGFnZSAqcGFnZSA9IHBmbl90b19wYWdlKHBmbik7Ci0J
CWlmIChwcm90ICYgSU9NTVVfV1JJVEUpCi0JCQlTZXRQYWdlRGlydHkocGFnZSk7Ci0JCXB1dF9w
YWdlKHBhZ2UpOworCisJCXB1dF91c2VyX3BhZ2VzX2RpcnR5X2xvY2soJnBhZ2UsIDEsIHByb3Qg
JiBJT01NVV9XUklURSk7CiAJCXJldHVybiAxOwogCX0KIAlyZXR1cm4gMDsKQEAgLTM0OSwxMSAr
MzQ4LDExIEBAIHN0YXRpYyBpbnQgdmFkZHJfZ2V0X3BmbihzdHJ1Y3QgbW1fc3RydWN0ICptbSwg
dW5zaWduZWQgbG9uZyB2YWRkciwKIAogCWRvd25fcmVhZCgmbW0tPm1tYXBfc2VtKTsKIAlpZiAo
bW0gPT0gY3VycmVudC0+bW0pIHsKLQkJcmV0ID0gZ2V0X3VzZXJfcGFnZXModmFkZHIsIDEsIGZs
YWdzIHwgRk9MTF9MT05HVEVSTSwgcGFnZSwKLQkJCQkgICAgIHZtYXMpOworCQlyZXQgPSBwaW5f
bG9uZ3Rlcm1fcGFnZXModmFkZHIsIDEsIGZsYWdzLCBwYWdlLCB2bWFzKTsKIAl9IGVsc2Ugewot
CQlyZXQgPSBnZXRfdXNlcl9wYWdlc19yZW1vdGUoTlVMTCwgbW0sIHZhZGRyLCAxLCBmbGFncywg
cGFnZSwKLQkJCQkJICAgIHZtYXMsIE5VTEwpOworCQlyZXQgPSBwaW5fbG9uZ3Rlcm1fcGFnZXNf
cmVtb3RlKE5VTEwsIG1tLCB2YWRkciwgMSwKKwkJCQkJCWZsYWdzLCBwYWdlLCB2bWFzLAorCQkJ
CQkJTlVMTCk7CiAJCS8qCiAJCSAqIFRoZSBsaWZldGltZSBvZiBhIHZhZGRyX2dldF9wZm4oKSBw
YWdlIHBpbiBpcwogCQkgKiB1c2Vyc3BhY2UtY29udHJvbGxlZC4gSW4gdGhlIGZzLWRheCBjYXNl
IHRoaXMgY291bGQKQEAgLTM2Myw3ICszNjIsNyBAQCBzdGF0aWMgaW50IHZhZGRyX2dldF9wZm4o
c3RydWN0IG1tX3N0cnVjdCAqbW0sIHVuc2lnbmVkIGxvbmcgdmFkZHIsCiAJCSAqLwogCQlpZiAo
cmV0ID4gMCAmJiB2bWFfaXNfZnNkYXgodm1hc1swXSkpIHsKIAkJCXJldCA9IC1FT1BOT1RTVVBQ
OwotCQkJcHV0X3BhZ2UocGFnZVswXSk7CisJCQlwdXRfdXNlcl9wYWdlKHBhZ2VbMF0pOwogCQl9
CiAJfQogCXVwX3JlYWQoJm1tLT5tbWFwX3NlbSk7Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
