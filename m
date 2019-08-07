Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76941845D5
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 09:27:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77DCE6E657;
	Wed,  7 Aug 2019 07:26:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C79B76E588;
 Wed,  7 Aug 2019 01:33:52 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id b3so38622496plr.4;
 Tue, 06 Aug 2019 18:33:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WGaquJbd5n3vWHVjzVcVo6+uSZsjc3dg9cLGAnxVc2E=;
 b=ZRNeSjIGSUvgjG7TBMbukKhX8ELhJTj15FWsHIM9NhKaIQd/iBo3vhM0ZlL9Re6faG
 mgACmL408P9he7XEs6JhEBgmes9gicELiA/LsWDoZPMHpBeNnhfYsj1S38u2CZjmZm5F
 2X4OBHJ9JFTfl2SuPJZp3A5KyPIa/AgarqQ2PQ5whiN8OAhnWBr+/MqFQsfUaq6IPV1Q
 sAsVy5cuo/U7cLSEVH4JlD44GkbCbmRQvWUgydhKysWnCS3y3tCe/2UC534ILzKVZLTY
 D8OiW7uSCLAyWkW7PACiS4kQeET4+rKf6Nm/NZCAZ7fU1xPKYlgDFqWI8XOvSEGasUtM
 W1IA==
X-Gm-Message-State: APjAAAVxvOQ2alh34Iqx6jTTxtwdQHMXRPiyk5pI3s9HSJstMpVQPMBo
 WBD7sup+KODlcJG6A3Dpf20=
X-Google-Smtp-Source: APXvYqyUH791dwLub9+aSF5x8hGs1SuLVkdyMKqfaB808Vqluqgizufg0qdY3/pJKJrf/LUH7OWf8Q==
X-Received: by 2002:a17:902:29e6:: with SMTP id
 h93mr5591074plb.297.1565141632504; 
 Tue, 06 Aug 2019 18:33:52 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.33.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:33:52 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 05/41] net/ceph: convert put_page() to put_user_page*()
Date: Tue,  6 Aug 2019 18:33:04 -0700
Message-Id: <20190807013340.9706-6-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190807013340.9706-1-jhubbard@nvidia.com>
References: <20190807013340.9706-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Wed, 07 Aug 2019 07:26:18 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WGaquJbd5n3vWHVjzVcVo6+uSZsjc3dg9cLGAnxVc2E=;
 b=D48he9iwy4Ni5qMxjRsQe5pMA51Ifn5pyuXezWFqJsv4KqB2UjEmI492A+H3zjBozl
 z4vxBXelaWALb4vc9TiVQD3xffg2JpycIgMryRj7DdNlQnLoLTJRT2Pr6AqdUldNm96s
 mYxTY6jOTBKy5nq3H5sJhLnHjju1CLRU8H+bKZdHFr7DowwoqkFP2M9FXdH0qDJ2nJJ/
 ss8voK0KQx4e801oBm16bmWlzeZbPR02TnPcDNJm+WHvvx9pL8SRfhdK+3B1hDFHty8B
 eCloTAbKTVyukUiotzfMnjDTWGmB31ermFBDzmeDTGPpsb9KGnZpeSIajIf3hrjzGw2F
 MknQ==
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
Cc: linux-fbdev@vger.kernel.org, Jan Kara <jack@suse.cz>, kvm@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, Sage Weil <sage@redhat.com>,
 linux-rdma@vger.kernel.org, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 xen-devel@lists.xenproject.org, Ilya Dryomov <idryomov@gmail.com>,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, Jeff Layton <jlayton@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-xfs@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpBY2tlZC1ieTog
SmVmZiBMYXl0b24gPGpsYXl0b25Aa2VybmVsLm9yZz4KCkNjOiBJbHlhIERyeW9tb3YgPGlkcnlv
bW92QGdtYWlsLmNvbT4KQ2M6IFNhZ2UgV2VpbCA8c2FnZUByZWRoYXQuY29tPgpDYzogRGF2aWQg
Uy4gTWlsbGVyIDxkYXZlbUBkYXZlbWxvZnQubmV0PgpDYzogY2VwaC1kZXZlbEB2Z2VyLmtlcm5l
bC5vcmcKQ2M6IG5ldGRldkB2Z2VyLmtlcm5lbC5vcmcKU2lnbmVkLW9mZi1ieTogSm9obiBIdWJi
YXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgotLS0KIG5ldC9jZXBoL3BhZ2V2ZWMuYyB8IDggKy0t
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNyBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9uZXQvY2VwaC9wYWdldmVjLmMgYi9uZXQvY2VwaC9wYWdldmVjLmMKaW5kZXgg
NjQzMDVlNzA1NmExLi5jODhmZmYyYWI5YmQgMTAwNjQ0Ci0tLSBhL25ldC9jZXBoL3BhZ2V2ZWMu
YworKysgYi9uZXQvY2VwaC9wYWdldmVjLmMKQEAgLTEyLDEzICsxMiw3IEBACiAKIHZvaWQgY2Vw
aF9wdXRfcGFnZV92ZWN0b3Ioc3RydWN0IHBhZ2UgKipwYWdlcywgaW50IG51bV9wYWdlcywgYm9v
bCBkaXJ0eSkKIHsKLQlpbnQgaTsKLQotCWZvciAoaSA9IDA7IGkgPCBudW1fcGFnZXM7IGkrKykg
ewotCQlpZiAoZGlydHkpCi0JCQlzZXRfcGFnZV9kaXJ0eV9sb2NrKHBhZ2VzW2ldKTsKLQkJcHV0
X3BhZ2UocGFnZXNbaV0pOwotCX0KKwlwdXRfdXNlcl9wYWdlc19kaXJ0eV9sb2NrKHBhZ2VzLCBu
dW1fcGFnZXMsIGRpcnR5KTsKIAlrdmZyZWUocGFnZXMpOwogfQogRVhQT1JUX1NZTUJPTChjZXBo
X3B1dF9wYWdlX3ZlY3Rvcik7Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
