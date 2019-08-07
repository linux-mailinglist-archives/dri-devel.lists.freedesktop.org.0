Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE17F845C9
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 09:27:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 730F96E651;
	Wed,  7 Aug 2019 07:26:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 397FE88F3A;
 Wed,  7 Aug 2019 01:34:33 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id i189so42499794pfg.10;
 Tue, 06 Aug 2019 18:34:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Puv5caB6Xd1AJbwd7nGzyFKNouoVWAfL+vJwz/b+4QQ=;
 b=N8TFKR7XqRHr5AZIV6JGDhl2JPdu1mZU53CrZDqqSrNWZUfymx6cLUn1PBwPJRsQLw
 WUKYkTCQuf7NG6FkGDgX0UcjHp0cIuedY/mMXB/Sg9ExRiETIzysrPyTy4aGAZz/1FxE
 setEn3yIti6h4dfPczYodMEU2uSxyDNpygPpJF+LFldap1BNlPD/for8XPrlT5Lc6QHM
 9mAt5KAecXbsNiyp3FbEHWfpEa1a6EtRl2abF8qzDpe/DzSS2+tSqnMJjfN4Ss44R0eR
 ohO4SRvBAmbuzNOX4U38zpSaCOvBNo68SGxWZje7+1ALTdHJdpiMYGuwdWH1hDCzYSOd
 Xd3A==
X-Gm-Message-State: APjAAAUON0i0Y/PX5x3HjzSdhFF89AFB0Poz7ehmGAQ4PxLaoZ9QFCjY
 RFWMG5rJXPgtacv/KR88q8k=
X-Google-Smtp-Source: APXvYqw2Uz+wsO3yNwpRHMDLbJirCIxZ4A4X8U6+Fg2LdiPaNY42ayE9pYwjEAVQClZpIkVOBc80qg==
X-Received: by 2002:a17:90a:e38f:: with SMTP id
 b15mr6129518pjz.85.1565141672902; 
 Tue, 06 Aug 2019 18:34:32 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.34.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:34:32 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 30/41] mm/madvise.c: convert put_page() to put_user_page*()
Date: Tue,  6 Aug 2019 18:33:29 -0700
Message-Id: <20190807013340.9706-31-jhubbard@nvidia.com>
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
 bh=Puv5caB6Xd1AJbwd7nGzyFKNouoVWAfL+vJwz/b+4QQ=;
 b=tmsRy1GqXUm98oxjqXOZPjsWspl9AXdfGLJi4f4YSRE4p2Xnzia+lP7gOvMdJeaaOV
 ZMTpzk7cqa5s9Whlhun0Z7Axe9U+exCqGVHdHS/nwzXnj2PJKIWBdXJBCa3H/2BHiz19
 BnEnordNgtmPL4Xz5g5gGRNQFD3awe5Sds/iOUIPfzMq0+Xzzslt2XeYTRCDaqUoB/tZ
 5WSuCY8UmuqBDYfQsynPZOWWiAW9iVZeFmsUs+zlPeiO0OHcuVwV2drvqj8qlA8ICP6u
 9yeV7By6zGvwf0U2BDyf/bSCue82V2u+FVMGjOFTaa85KNQg5C2wQoPnNjOXVsaihczq
 TD/Q==
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
 Matthew Wilcox <willy@infradead.org>, sparclinux@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, ceph-devel@vger.kernel.org,
 devel@driverdev.osuosl.org, rds-devel@oss.oracle.com,
 linux-rdma@vger.kernel.org, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, Daniel Black <daniel@linux.ibm.com>,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpDYzogRGFuIFdp
bGxpYW1zIDxkYW4uai53aWxsaWFtc0BpbnRlbC5jb20+CkNjOiBEYW5pZWwgQmxhY2sgPGRhbmll
bEBsaW51eC5pYm0uY29tPgpDYzogSmFuIEthcmEgPGphY2tAc3VzZS5jej4KQ2M6IErDqXLDtG1l
IEdsaXNzZSA8amdsaXNzZUByZWRoYXQuY29tPgpDYzogTWF0dGhldyBXaWxjb3ggPHdpbGx5QGlu
ZnJhZGVhZC5vcmc+CkNjOiBNaWtlIEtyYXZldHogPG1pa2Uua3JhdmV0ekBvcmFjbGUuY29tPgpT
aWduZWQtb2ZmLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Ci0tLQogbW0v
bWFkdmlzZS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbW0vbWFkdmlzZS5jIGIvbW0vbWFkdmlzZS5jCmluZGV4IDk2
OGRmM2FhMDY5Zi4uMWM2ODgxYTc2MWE1IDEwMDY0NAotLS0gYS9tbS9tYWR2aXNlLmMKKysrIGIv
bW0vbWFkdmlzZS5jCkBAIC02NzIsNyArNjcyLDcgQEAgc3RhdGljIGludCBtYWR2aXNlX2luamVj
dF9lcnJvcihpbnQgYmVoYXZpb3IsCiAJCSAqIHJvdXRpbmUgaXMgcmVzcG9uc2libGUgZm9yIHBp
bm5pbmcgdGhlIHBhZ2UgdG8gcHJldmVudCBpdAogCQkgKiBmcm9tIGJlaW5nIHJlbGVhc2VkIGJh
Y2sgdG8gdGhlIHBhZ2UgYWxsb2NhdG9yLgogCQkgKi8KLQkJcHV0X3BhZ2UocGFnZSk7CisJCXB1
dF91c2VyX3BhZ2UocGFnZSk7CiAJCXJldCA9IG1lbW9yeV9mYWlsdXJlKHBmbiwgMCk7CiAJCWlm
IChyZXQpCiAJCQlyZXR1cm4gcmV0OwotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
