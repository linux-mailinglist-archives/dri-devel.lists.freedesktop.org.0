Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D1D8133D
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 09:35:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9856389C97;
	Mon,  5 Aug 2019 07:34:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 156D68946E;
 Sun,  4 Aug 2019 22:49:37 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id l21so38658155pgm.3;
 Sun, 04 Aug 2019 15:49:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=34zW6BJN89MycamN6XZc+aPi3iIpUXsyW4mngm2d11Q=;
 b=tF8mLNunwOLtOJr/OwQXvG25w24grsHK3bzmK5E+2xNf7XWh/xmcPmew8mYEKm+DnM
 dwrRrw38nKIkwyinZHzFgzrOj+v0Afx4Ty//V5fS/Gw7OQzenDPwgyJR2RmJdtnWbsNg
 L7owjcy8g+OwzNvCx8s1Q5w5uFy8zzoq7LboFkHMASHmtxZUNebf3Eu2H9yHR9g2ZddR
 8vw0GJ51iaVsWEyHtQRAAw/gO3YKL3v3DF13TKm/+4M0eBA9td3iAHZAwe+Uix4yk73Y
 H7f9Ojj/cu6/vrdqD8tGvuqGQmT+Xkr9tBsoGIOTZ3vjNVSNaFDCdCBjQ0zz9vrTo/f5
 A7zQ==
X-Gm-Message-State: APjAAAWCg5FbHe+/I4hDm9VRAhwoNGRxK0FgVcF7Qho1J90RqQ9OMm5G
 j8uL7OW001WrF04qFCEhWtc=
X-Google-Smtp-Source: APXvYqzZzuc1CJxZdFJgWU/FwmUoZ/p878RlqbCeEzJ5+atuTCZn+89D3JrxmbErf1XY9IXgA3NZ2A==
X-Received: by 2002:a17:90a:f498:: with SMTP id
 bx24mr15350312pjb.91.1564958976783; 
 Sun, 04 Aug 2019 15:49:36 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 r6sm35946836pjb.22.2019.08.04.15.49.35
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 15:49:36 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 11/34] scif: convert put_page() to put_user_page*()
Date: Sun,  4 Aug 2019 15:48:52 -0700
Message-Id: <20190804224915.28669-12-jhubbard@nvidia.com>
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
 bh=34zW6BJN89MycamN6XZc+aPi3iIpUXsyW4mngm2d11Q=;
 b=Vl3ziFlsVP8d5c8y0YmW6fDZsGTWTBWfBuMUsCvUNMfO41hPRu5nz6knOx+9Exr4dm
 faLIZ6PGv5svewcMn6NrpUtC2sVsC+7jyMTiSPQOkMWSlMNBGkEc5Hzdhl1GLUQ+lU00
 s8/u7LPhlwjUp5vP9Cq58ZxyRYaJggFlYisUFFtIS444ycMw8U/APZaIEYWga3Yussps
 tKIhHu6BLxxDR9A3QUeopRp/JQJFEZSB+ASswX2FluN7nR+bVi9w3B9Wm/JRet3KnCM9
 BzOgVm6BdbLPf53jqaXQstPr6PLJxFbgM+ClIPWs4p2Wp5bWVtpTaVjy3ylfOWo6XjbI
 VLCQ==
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
 Sudeep Dutt <sudeep.dutt@intel.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, sparclinux@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, ceph-devel@vger.kernel.org,
 devel@driverdev.osuosl.org, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 Joerg Roedel <jroedel@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Zhen Lei <thunder.leizhen@huawei.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-xfs@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpDYzogU3VkZWVw
IER1dHQgPHN1ZGVlcC5kdXR0QGludGVsLmNvbT4KQ2M6IEFzaHV0b3NoIERpeGl0IDxhc2h1dG9z
aC5kaXhpdEBpbnRlbC5jb20+CkNjOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgpDYzog
Sm9lcmcgUm9lZGVsIDxqcm9lZGVsQHN1c2UuZGU+CkNjOiBSb2JpbiBNdXJwaHkgPHJvYmluLm11
cnBoeUBhcm0uY29tPgpDYzogWmhlbiBMZWkgPHRodW5kZXIubGVpemhlbkBodWF3ZWkuY29tPgpT
aWduZWQtb2ZmLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Ci0tLQogZHJp
dmVycy9taXNjL21pYy9zY2lmL3NjaWZfcm1hLmMgfCAxNyArKysrKysrKy0tLS0tLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL21pc2MvbWljL3NjaWYvc2NpZl9ybWEuYyBiL2RyaXZlcnMvbWlzYy9taWMvc2Np
Zi9zY2lmX3JtYS5jCmluZGV4IDAxZTI3NjgyZWEzMC4uZDg0ZWQ5NDY2OTIwIDEwMDY0NAotLS0g
YS9kcml2ZXJzL21pc2MvbWljL3NjaWYvc2NpZl9ybWEuYworKysgYi9kcml2ZXJzL21pc2MvbWlj
L3NjaWYvc2NpZl9ybWEuYwpAQCAtMTEzLDEzICsxMTMsMTQgQEAgc3RhdGljIGludCBzY2lmX2Rl
c3Ryb3lfcGlubmVkX3BhZ2VzKHN0cnVjdCBzY2lmX3Bpbm5lZF9wYWdlcyAqcGluKQogCWludCB3
cml0ZWFibGUgPSBwaW4tPnByb3QgJiBTQ0lGX1BST1RfV1JJVEU7CiAJaW50IGtlcm5lbCA9IFND
SUZfTUFQX0tFUk5FTCAmIHBpbi0+bWFwX2ZsYWdzOwogCi0JZm9yIChqID0gMDsgaiA8IHBpbi0+
bnJfcGFnZXM7IGorKykgewotCQlpZiAocGluLT5wYWdlc1tqXSAmJiAha2VybmVsKSB7CisJaWYg
KGtlcm5lbCkgeworCQlmb3IgKGogPSAwOyBqIDwgcGluLT5ucl9wYWdlczsgaisrKSB7CiAJCQlp
ZiAod3JpdGVhYmxlKQotCQkJCVNldFBhZ2VEaXJ0eShwaW4tPnBhZ2VzW2pdKTsKKwkJCQlzZXRf
cGFnZV9kaXJ0eV9sb2NrKHBpbi0+cGFnZXNbal0pOwogCQkJcHV0X3BhZ2UocGluLT5wYWdlc1tq
XSk7CiAJCX0KLQl9CisJfSBlbHNlCisJCXB1dF91c2VyX3BhZ2VzX2RpcnR5X2xvY2socGluLT5w
YWdlcywgcGluLT5ucl9wYWdlcywgd3JpdGVhYmxlKTsKIAogCXNjaWZfZnJlZShwaW4tPnBhZ2Vz
LAogCQkgIHBpbi0+bnJfcGFnZXMgKiBzaXplb2YoKnBpbi0+cGFnZXMpKTsKQEAgLTEzODUsMTEg
KzEzODYsOSBAQCBpbnQgX19zY2lmX3Bpbl9wYWdlcyh2b2lkICphZGRyLCBzaXplX3QgbGVuLCBp
bnQgKm91dF9wcm90LAogCQkJCWlmICh1bGltaXQpCiAJCQkJCV9fc2NpZl9kZWNfcGlubmVkX3Zt
X2xvY2sobW0sIG5yX3BhZ2VzKTsKIAkJCQkvKiBSb2xsIGJhY2sgYW55IHBpbm5lZCBwYWdlcyAq
LwotCQkJCWZvciAoaSA9IDA7IGkgPCBwaW5uZWRfcGFnZXMtPm5yX3BhZ2VzOyBpKyspIHsKLQkJ
CQkJaWYgKHBpbm5lZF9wYWdlcy0+cGFnZXNbaV0pCi0JCQkJCQlwdXRfcGFnZSgKLQkJCQkJCXBp
bm5lZF9wYWdlcy0+cGFnZXNbaV0pOwotCQkJCX0KKwkJCQlwdXRfdXNlcl9wYWdlcyhwaW5uZWRf
cGFnZXMtPnBhZ2VzLAorCQkJCQkgICAgICAgcGlubmVkX3BhZ2VzLT5ucl9wYWdlcyk7CisKIAkJ
CQlwcm90ICY9IH5TQ0lGX1BST1RfV1JJVEU7CiAJCQkJdHJ5X3VwZ3JhZGUgPSBmYWxzZTsKIAkJ
CQlnb3RvIHJldHJ5OwotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
