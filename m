Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF436153136
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 13:54:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C79DF6F588;
	Wed,  5 Feb 2020 12:54:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F94C6F589
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2020 12:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 6FEC33F6A4;
 Wed,  5 Feb 2020 13:54:25 +0100 (CET)
Authentication-Results: ste-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=ebwpteKv; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NKLEAHXxzpqc; Wed,  5 Feb 2020 13:54:23 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 8BE143F662;
 Wed,  5 Feb 2020 13:54:18 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id DEFD9360371;
 Wed,  5 Feb 2020 13:54:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1580907258; bh=l+fyuCKI56bloWDZAYRY+8V+4BZdB07uD3FZrPanDog=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ebwpteKvbkvvhPB1J1y2XPOXMX4MbDKK0lENQMhlBjRfbaEDt6zRafaSjLLpKbtgs
 JGMfRc0MUUpmAw4iEuCoNojIyEHxN5ecEsJMQGOrsmrtaE5THN3ZsqMSpacKDN/56i
 YZ8uuNXIIYE3P7m0a6aIQRz7fHvMw5IhYiZ1Cf0s=
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/9] fs: Constify vma argument to vma_is_dax
Date: Wed,  5 Feb 2020 13:53:45 +0100
Message-Id: <20200205125353.2760-2-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200205125353.2760-1-thomas_os@shipmail.org>
References: <20200205125353.2760-1-thomas_os@shipmail.org>
MIME-Version: 1.0
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, Michal Hocko <mhocko@suse.com>,
 pv-drivers@vmware.com, Roland Scheidegger <sroland@vmware.com>,
 Dan Williams <dan.j.williams@intel.com>, Ralph Campbell <rcampbell@nvidia.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-graphics-maintainer@vmware.com,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgoKVGhlIHZtYSBh
cmd1bWVudCBpcyBvbmx5IGRlcmVmZXJlbmNlZCBmb3IgcmVhZGluZy4KCkNjOiBBbmRyZXcgTW9y
dG9uIDxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPgpDYzogTWljaGFsIEhvY2tvIDxtaG9ja29A
c3VzZS5jb20+CkNjOiAiTWF0dGhldyBXaWxjb3ggKE9yYWNsZSkiIDx3aWxseUBpbmZyYWRlYWQu
b3JnPgpDYzogIktpcmlsbCBBLiBTaHV0ZW1vdiIgPGtpcmlsbC5zaHV0ZW1vdkBsaW51eC5pbnRl
bC5jb20+CkNjOiBSYWxwaCBDYW1wYmVsbCA8cmNhbXBiZWxsQG52aWRpYS5jb20+CkNjOiAiSsOp
csO0bWUgR2xpc3NlIiA8amdsaXNzZUByZWRoYXQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWci
IDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBEYW4gV2lsbGlhbXMgPGRhbi5qLndpbGxp
YW1zQGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJv
bUB2bXdhcmUuY29tPgpSZXZpZXdlZC1ieTogUm9sYW5kIFNjaGVpZGVnZ2VyIDxzcm9sYW5kQHZt
d2FyZS5jb20+Ci0tLQogaW5jbHVkZS9saW51eC9mcy5oIHwgMiArLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51
eC9mcy5oIGIvaW5jbHVkZS9saW51eC9mcy5oCmluZGV4IDk4ZTAzNDlhZGI1Mi4uNGY0MWZkYmY0
MDJmIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2ZzLmgKKysrIGIvaW5jbHVkZS9saW51eC9m
cy5oCkBAIC0zMzY3LDcgKzMzNjcsNyBAQCBzdGF0aWMgaW5saW5lIGJvb2wgaW9faXNfZGlyZWN0
KHN0cnVjdCBmaWxlICpmaWxwKQogCXJldHVybiAoZmlscC0+Zl9mbGFncyAmIE9fRElSRUNUKSB8
fCBJU19EQVgoZmlscC0+Zl9tYXBwaW5nLT5ob3N0KTsKIH0KIAotc3RhdGljIGlubGluZSBib29s
IHZtYV9pc19kYXgoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCitzdGF0aWMgaW5saW5lIGJv
b2wgdm1hX2lzX2RheChjb25zdCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKIHsKIAlyZXR1
cm4gdm1hLT52bV9maWxlICYmIElTX0RBWCh2bWEtPnZtX2ZpbGUtPmZfbWFwcGluZy0+aG9zdCk7
CiB9Ci0tIAoyLjIxLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
