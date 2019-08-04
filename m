Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C6C81354
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 09:35:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5290A89BB0;
	Mon,  5 Aug 2019 07:34:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD3E289CDE;
 Sun,  4 Aug 2019 22:49:49 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id g2so38603428pfq.0;
 Sun, 04 Aug 2019 15:49:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=py067aGaFWqYQnWW3CrL2Yk9VWIyNl4WEpwUsrZ7LgI=;
 b=BtvppNWDUyu73hnyJEKZlWd3lMSTFdpfIW4Bt3mpoLbAd84dkZ+i4rhLZH86hSPTnm
 f8F8d6TgjuZYU9GOAvQSHaXod61V8ZW2F+KaZE4zse7evX6EE0uwsmXqhsGnCvCzZL6c
 MjJWiJn7iHwBF3Hm+A6lPOauS2OVRbv9XpLtsDojC8yeb0/n0cZuGucj8pkCVNApRage
 QdvjhcNEG45SqghbFHm3D0fBw8Opv0eo/SXTiYoXXN7UGxUF3j9SY2raPF017iYJP/EE
 2MksMret5BSP5V4ab325EI1VHqXQ2NqpLpCRwg2MV8CfRyOR4SdtonmIrie+GzPJ1k6V
 vV9A==
X-Gm-Message-State: APjAAAUMLQyxnOvf2TzFAK8XIBgPqsBywd1Czah75oLKsPuiEhcxoudM
 DoqMSf1+0JLjnLNs2zW7QsU=
X-Google-Smtp-Source: APXvYqyegNlmLCsE27HWcwEQVob39MHAl+cimFnsXUYquTno1Yk7+aU+Agg2DBt67SqnkuavcPllBQ==
X-Received: by 2002:a63:29c4:: with SMTP id
 p187mr82820390pgp.330.1564958989494; 
 Sun, 04 Aug 2019 15:49:49 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 r6sm35946836pjb.22.2019.08.04.15.49.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 15:49:49 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 19/34] fsl_hypervisor: convert put_page() to
 put_user_page*()
Date: Sun,  4 Aug 2019 15:49:00 -0700
Message-Id: <20190804224915.28669-20-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190804224915.28669-1-jhubbard@nvidia.com>
References: <20190804224915.28669-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Mon, 05 Aug 2019 07:34:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=py067aGaFWqYQnWW3CrL2Yk9VWIyNl4WEpwUsrZ7LgI=;
 b=P8+hbDz6iDdAtFosRygKfZrawOprY/RqOz+jkdBR9/iAK9lQTDaHpPD0YVzeAsadTA
 6buCCtQt6FcRN+b9XggnJ5bqnrb15u93xXHo/kWkRIj/AEZJAg96rbyj3hSasGDU5QMN
 kLomBnFCn//tdm3UAsqLPAHdx4izNhPtZ1DR2n/EeVgTygzhGs4N/AXfq0vWNV5wg6OG
 nDjWxo9WfIwu4zNuVNFOgCWRwLE7DfTE0h0+OhqrWzWxBngYRK81NL6ifxTbjwc0Tsbz
 dA0CzQ264QnjubFwn/fuuREzrVo+nBB4mnVLQqsZ8A+pWd/WcxXuqwIjuSU30F6iEjCB
 X4GA==
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
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, John Hubbard <jhubbard@nvidia.com>,
 intel-gfx@lists.freedesktop.org, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpUaGlzIGNoYW5n
ZXMgdGhlIHJlbGVhc2UgY29kZSBzbGlnaHRseSwgYmVjYXVzZSBlYWNoIHBhZ2Ugc2xvdCBpbiB0
aGUKcGFnZV9saXN0W10gYXJyYXkgaXMgbm8gbG9uZ2VyIGNoZWNrZWQgZm9yIE5VTEwuIEhvd2V2
ZXIsIHRoYXQgY2hlY2sKd2FzIHdyb25nIGFueXdheSwgYmVjYXVzZSB0aGUgZ2V0X3VzZXJfcGFn
ZXMoKSBwYXR0ZXJuIG9mIHVzYWdlIGhlcmUKbmV2ZXIgYWxsb3dlZCBmb3IgTlVMTCBlbnRyaWVz
IHdpdGhpbiBhIHJhbmdlIG9mIHBpbm5lZCBwYWdlcy4KCkNjOiBBbCBWaXJvIDx2aXJvQHplbml2
LmxpbnV4Lm9yZy51az4KQ2M6IEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPgpDYzog
Um9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KU2lnbmVkLW9mZi1ieTogSm9obiBIdWJiYXJk
IDxqaHViYmFyZEBudmlkaWEuY29tPgotLS0KIGRyaXZlcnMvdmlydC9mc2xfaHlwZXJ2aXNvci5j
IHwgNyArKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlydC9mc2xfaHlwZXJ2aXNvci5jIGIvZHJpdmVy
cy92aXJ0L2ZzbF9oeXBlcnZpc29yLmMKaW5kZXggOTNkNWJlYmY5NTcyLi5hOGY3OGQ1NzJjNDUg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlydC9mc2xfaHlwZXJ2aXNvci5jCisrKyBiL2RyaXZlcnMv
dmlydC9mc2xfaHlwZXJ2aXNvci5jCkBAIC0yOTIsMTEgKzI5Miw4IEBAIHN0YXRpYyBsb25nIGlv
Y3RsX21lbWNweShzdHJ1Y3QgZnNsX2h2X2lvY3RsX21lbWNweSBfX3VzZXIgKnApCiAJCXZpcnRf
dG9fcGh5cyhzZ19saXN0KSwgbnVtX3BhZ2VzKTsKIAogZXhpdDoKLQlpZiAocGFnZXMpIHsKLQkJ
Zm9yIChpID0gMDsgaSA8IG51bV9wYWdlczsgaSsrKQotCQkJaWYgKHBhZ2VzW2ldKQotCQkJCXB1
dF9wYWdlKHBhZ2VzW2ldKTsKLQl9CisJaWYgKHBhZ2VzKQorCQlwdXRfdXNlcl9wYWdlcyhwYWdl
cywgbnVtX3BhZ2VzKTsKIAogCWtmcmVlKHNnX2xpc3RfdW5hbGlnbmVkKTsKIAlrZnJlZShwYWdl
cyk7Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
