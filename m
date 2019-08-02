Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 685537EF05
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:21:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B28CD6ED44;
	Fri,  2 Aug 2019 08:19:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD28B6E862;
 Fri,  2 Aug 2019 02:20:16 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id i18so35236660pgl.11;
 Thu, 01 Aug 2019 19:20:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=weSPcOAlMB+nks0BWLOsxsBmAu907UZGrfndvq6oQnc=;
 b=tzvAeg/xkXVBjjRGpW/G4FSCYXtfwabZlCtz9bIYIEPuwcwoXGpTD/n8JDe6B8cEU9
 ZQyhIA9ax8+tSQVj1qfKXcaxhdj1k9+E3hfyb7QBH7MMfCmOughDzRc8D/6nuKP9YKNl
 ngSn1GzSzjeYqGbG2GNl5zQ5jjHyq1CEKlOv6dLTXJlOzKn1Tt5E7hAQoD6kQBcJeycX
 Q3G68wNYWr0Pmn93VylSsnYquGd0wS1+ICl28NeWniWsh05fdEkungE8rsbPx6v+4M8q
 wJxiCdmJX6oPlN1eOWuFMu00O8a5WvRVnltvTNjwVBLKr2aCzG6BIYU6aEMwq3bkhCG4
 BrRQ==
X-Gm-Message-State: APjAAAU9R/9kadU79+4fbE68usYZimY1awK6nswYCjWaj1vbdAzqGdTN
 lijrRR5szJlHzfnPobkCx+g=
X-Google-Smtp-Source: APXvYqxciGgcMDXcQ3A2dbcQcp1f7eltXWtJvGVKyn0lRu+bq9UEFtA9QCl9A6sNDZqj7/W8XpREEA==
X-Received: by 2002:a17:90a:2385:: with SMTP id
 g5mr1977411pje.12.1564712416439; 
 Thu, 01 Aug 2019 19:20:16 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u9sm38179744pgc.5.2019.08.01.19.20.14
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 19:20:16 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 03/34] net/ceph: convert put_page() to put_user_page*()
Date: Thu,  1 Aug 2019 19:19:34 -0700
Message-Id: <20190802022005.5117-4-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802022005.5117-1-jhubbard@nvidia.com>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Fri, 02 Aug 2019 08:19:03 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=weSPcOAlMB+nks0BWLOsxsBmAu907UZGrfndvq6oQnc=;
 b=g/PNAVO1jcA7rjmvur5Gi5SyBm+cHCwd0FZu0S4Yd4WKYY8nqKUy+Kjq5L8LbAIDam
 oq+DMw/apiFaV6V9t2AYTvJ0UtZRGdqpPgiFYeIHq5U9A659jHv3iijVBsi80zStn1WW
 yA7d3ZYX2ikKALXpz54vXEPMXgXSlYxT87JksMZBQueD34Vn0QLhvvHOTCuzyirgAxhY
 PS1hXIRKbtV044f7MD5ThhAFxJavcS5DN9nP30sURDOyWv4TACAbp0MhELnCZVrxEr+Y
 L5R1pu68TEBkTXOjXzFMyL79KTHMlgJNcYv+KmIulF31bskwh/7J7wKRv6nstiIy1Eix
 KMbg==
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
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpDYzogSWx5YSBE
cnlvbW92IDxpZHJ5b21vdkBnbWFpbC5jb20+CkNjOiBTYWdlIFdlaWwgPHNhZ2VAcmVkaGF0LmNv
bT4KQ2M6IERhdmlkIFMuIE1pbGxlciA8ZGF2ZW1AZGF2ZW1sb2Z0Lm5ldD4KQ2M6IGNlcGgtZGV2
ZWxAdmdlci5rZXJuZWwub3JnCkNjOiBuZXRkZXZAdmdlci5rZXJuZWwub3JnClNpZ25lZC1vZmYt
Ynk6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KLS0tCiBuZXQvY2VwaC9wYWdl
dmVjLmMgfCA4ICstLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDcgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbmV0L2NlcGgvcGFnZXZlYy5jIGIvbmV0L2NlcGgvcGFn
ZXZlYy5jCmluZGV4IDY0MzA1ZTcwNTZhMS4uYzg4ZmZmMmFiOWJkIDEwMDY0NAotLS0gYS9uZXQv
Y2VwaC9wYWdldmVjLmMKKysrIGIvbmV0L2NlcGgvcGFnZXZlYy5jCkBAIC0xMiwxMyArMTIsNyBA
QAogCiB2b2lkIGNlcGhfcHV0X3BhZ2VfdmVjdG9yKHN0cnVjdCBwYWdlICoqcGFnZXMsIGludCBu
dW1fcGFnZXMsIGJvb2wgZGlydHkpCiB7Ci0JaW50IGk7Ci0KLQlmb3IgKGkgPSAwOyBpIDwgbnVt
X3BhZ2VzOyBpKyspIHsKLQkJaWYgKGRpcnR5KQotCQkJc2V0X3BhZ2VfZGlydHlfbG9jayhwYWdl
c1tpXSk7Ci0JCXB1dF9wYWdlKHBhZ2VzW2ldKTsKLQl9CisJcHV0X3VzZXJfcGFnZXNfZGlydHlf
bG9jayhwYWdlcywgbnVtX3BhZ2VzLCBkaXJ0eSk7CiAJa3ZmcmVlKHBhZ2VzKTsKIH0KIEVYUE9S
VF9TWU1CT0woY2VwaF9wdXRfcGFnZV92ZWN0b3IpOwotLSAKMi4yMi4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
