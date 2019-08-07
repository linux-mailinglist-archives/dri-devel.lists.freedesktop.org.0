Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A7C845E8
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 09:28:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 165336E681;
	Wed,  7 Aug 2019 07:26:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 228336E584;
 Wed,  7 Aug 2019 01:34:44 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id w24so38589328plp.2;
 Tue, 06 Aug 2019 18:34:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S+0IdzDd5LiY8AHwrYdqvSEMzcb9gWZ2lznukLTa4fI=;
 b=I/q+trhlmfYuJ+5B3KRfv70UmXhLBWu9m1RWzTF6mumckQDnbNqqD8AvSyuJ9XfPqK
 HeQPnl758nNQullN8kKjwAYUmKYXZjSfXlKYmR34Vkp1xwqfwUYh66durF6ppb0Ko/yJ
 jLD6CNOmuU4bg+iW+mT7tJMCXgiHtw6SDN8hDj09lQIzK8ULdR7fF1mhSqngWohWxPCN
 JiJSs9DnF3K22B9KGx9ogMRc+VD4+DKNyc2OrgX7Rz3DCN1UuGMkNYOvUebhzuiRST/4
 o7A0XH2JGi4Px9735XWbKzvn2KdjekBWYBNNVyyMzqLXFjnhGftJYwljinRQo+1o4ey4
 Bqdg==
X-Gm-Message-State: APjAAAWkcTCyF2D92Moqw2R8oeNnJaiJhfGVor1BMciExTQtoZx19ogV
 SdiMSzP0IvzwNBwwqPmKr9s=
X-Google-Smtp-Source: APXvYqwBIISXTWf4C+eZPMoIO/o34tgUz/S5eMQixOLDQAsdZlLcpYV/uzVG2wEPWDAc94LDsKhJ9w==
X-Received: by 2002:a17:902:9a49:: with SMTP id
 x9mr5953327plv.282.1565141683818; 
 Tue, 06 Aug 2019 18:34:43 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.34.42
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:34:43 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 37/41] security/tomoyo: convert put_page() to
 put_user_page*()
Date: Tue,  6 Aug 2019 18:33:36 -0700
Message-Id: <20190807013340.9706-38-jhubbard@nvidia.com>
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
 bh=S+0IdzDd5LiY8AHwrYdqvSEMzcb9gWZ2lznukLTa4fI=;
 b=TH7xsIR8mdN6BLY7JG8/eF6RsdDCkk2cRD3dBopErpIToembDlJ6DvjPGThWxgNDHN
 izZnY8v+rrCTqbMQXBbwMmFJJ4/nvmF6zRWW4Xs6qUrfZ8o0czAW/fGIDrwD7Q1ygI7M
 9Zf8Re7QredxsFLkJT7ZLJf014g9dC9bvOiPKF2NgNaHSnsjvFjfZ4bBzwffrRrGp9/v
 vlT+JVAmAuL0sqc4zONRKIioMJS5mLcrWMkUTsb2T5dvyeXECRBNXvR++1qedsjna65N
 Bpeio/uU7dJ/a25yv6b3onr0A5BIr5z5tUmsUB0sHub+eppjPv5sJ1ZexYmVLUXkgvRa
 bJaw==
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
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, Kentaro Takeda <takedakn@nttdata.co.jp>,
 devel@driverdev.osuosl.org, rds-devel@oss.oracle.com,
 linux-rdma@vger.kernel.org, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 intel-gfx@lists.freedesktop.org, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org
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
VGV0c3VvIEhhbmRhIDxwZW5ndWluLWtlcm5lbEBJLWxvdmUuU0FLVVJBLm5lLmpwPgoKQ2M6IEtl
bnRhcm8gVGFrZWRhIDx0YWtlZGFrbkBudHRkYXRhLmNvLmpwPgpDYzogbGludXgtc2VjdXJpdHkt
bW9kdWxlQHZnZXIua2VybmVsLm9yZwpTaWduZWQtb2ZmLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJi
YXJkQG52aWRpYS5jb20+Ci0tLQogc2VjdXJpdHkvdG9tb3lvL2RvbWFpbi5jIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
c2VjdXJpdHkvdG9tb3lvL2RvbWFpbi5jIGIvc2VjdXJpdHkvdG9tb3lvL2RvbWFpbi5jCmluZGV4
IDg1MjZhMGE3NDAyMy4uNjg4N2JlZWNmYjZlIDEwMDY0NAotLS0gYS9zZWN1cml0eS90b21veW8v
ZG9tYWluLmMKKysrIGIvc2VjdXJpdHkvdG9tb3lvL2RvbWFpbi5jCkBAIC05MzEsNyArOTMxLDcg
QEAgYm9vbCB0b21veW9fZHVtcF9wYWdlKHN0cnVjdCBsaW51eF9iaW5wcm0gKmJwcm0sIHVuc2ln
bmVkIGxvbmcgcG9zLAogCX0KIAkvKiBTYW1lIHdpdGggcHV0X2FyZ19wYWdlKHBhZ2UpIGluIGZz
L2V4ZWMuYyAqLwogI2lmZGVmIENPTkZJR19NTVUKLQlwdXRfcGFnZShwYWdlKTsKKwlwdXRfdXNl
cl9wYWdlKHBhZ2UpOwogI2VuZGlmCiAJcmV0dXJuIHRydWU7CiB9Ci0tIAoyLjIyLjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
