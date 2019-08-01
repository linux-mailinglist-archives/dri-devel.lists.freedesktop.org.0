Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8F57EED4
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:20:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEFA06ED0F;
	Fri,  2 Aug 2019 08:19:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ED896E844
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 23:47:44 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id 19so34955587pfa.4
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Aug 2019 16:47:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GHzc1obwFKwJgG7nswfPGhmCYytguM8zaNUDmj5ciqU=;
 b=pSohfm3pG9Hc2Rj64YTELAGOUI/lyAkCf0JdLyetwH7mlDbLU2EMdHzvV2ESH7grIy
 D3hnbwy4Nk2eZi/d6sZ6kUetq93Xp2Eo55m7qfvMslVNYoUMAHSBkqs4XYHEFzr/N+hh
 wavcI6DH9XENa8L02CwJFBGmLhRUnteA7TJKqZVorb0HzeNNuJ+iZr3yf8LO2JJHG7PQ
 Cc/ijFBz40gHOnRVT95ImMoAp5MuQWTqej8qiiMuMBgqljuoWVfOtpLi8kG6m+SnW7XY
 UdaQVc8j1oVeyhjHBSmEHS6fn+nSIMDJNGAFVk9YOipWYhU5rabnCgj/2fg/EO3GrHX4
 lftA==
X-Gm-Message-State: APjAAAUdn1OOCQ4gX2SrLaYcWuyGlKNC1agHO9LPg8GnYN0ttbqFqpx3
 ciPBVGRgVYc02ES04Pu5/Tc=
X-Google-Smtp-Source: APXvYqwtPIy/q9DIVACpqZOM6oV+V9VPUP/5mN1kfjPMf5x4eodvXZuVHIq97aECtPB0t2lwdk42bg==
X-Received: by 2002:a62:ce8e:: with SMTP id y136mr57190606pfg.29.1564703264155; 
 Thu, 01 Aug 2019 16:47:44 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 q7sm79090792pff.2.2019.08.01.16.47.42
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 16:47:43 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v5 3/3] net/xdp: convert put_page() to put_user_page*()
Date: Thu,  1 Aug 2019 16:47:35 -0700
Message-Id: <20190801234735.2149-4-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190801234735.2149-1-jhubbard@nvidia.com>
References: <20190801234735.2149-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Fri, 02 Aug 2019 08:19:03 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GHzc1obwFKwJgG7nswfPGhmCYytguM8zaNUDmj5ciqU=;
 b=E+zHlnIpYzBr1HZfJIsD6iVbo/tVCWCbZWGouwMcKWXf5pRqLr+7fu6t6wyR76gxrS
 Pw0XWBh+4s5Kr4C0zZ1uLNkWtKi03BCdpa29tA51sk8I+Bq12u0svuAUfdj+sK8H6N5H
 /8lixInmiBO+tmKzSLyeiGhsebOFRuv5X1HYeJ9NG7mhRRnXPabVEo0th3yVnfWLj1Ya
 c7rmaefTzcGx11D0smecmd6tI08T3Ivoz0JbFA+LCWcAMomm5K9oYs5qsT1cHM0HE8Jc
 UMhXpM08RliBjrRUsniYuwevqpn1x1w55S5+T81xoskFTv+eqpjGrmLmlIP9IsRGKn2i
 cHVg==
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
Cc: Boaz Harrosh <boaz@plexistor.com>, Jan Kara <jack@suse.cz>,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Christoph Hellwig <hch@lst.de>, Sage Weil <sage@redhat.com>,
 Miklos Szeredi <miklos@szeredi.hu>, linux-rdma@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Johannes Thumshirn <jthumshirn@suse.de>, Ilya Dryomov <idryomov@gmail.com>,
 =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@intel.com>,
 John Hubbard <jhubbard@nvidia.com>,
 Santosh Shilimkar <santosh.shilimkar@oracle.com>,
 Ming Lei <ming.lei@redhat.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Dan Williams <dan.j.williams@intel.com>,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Yan Zheng <zyan@redhat.com>, bpf@vger.kernel.org,
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
QmrDtnJuIFTDtnBlbCA8Ympvcm4udG9wZWxAaW50ZWwuY29tPgpDYzogTWFnbnVzIEthcmxzc29u
IDxtYWdudXMua2FybHNzb25AaW50ZWwuY29tPgpDYzogRGF2aWQgUy4gTWlsbGVyIDxkYXZlbUBk
YXZlbWxvZnQubmV0PgpDYzogbmV0ZGV2QHZnZXIua2VybmVsLm9yZwpTaWduZWQtb2ZmLWJ5OiBK
b2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Ci0tLQogbmV0L3hkcC94ZHBfdW1lbS5j
IHwgOSArLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgOCBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9uZXQveGRwL3hkcF91bWVtLmMgYi9uZXQveGRwL3hkcF91bWVt
LmMKaW5kZXggODNkZTc0Y2E3MjlhLi4xN2M0YjNkM2RjMzQgMTAwNjQ0Ci0tLSBhL25ldC94ZHAv
eGRwX3VtZW0uYworKysgYi9uZXQveGRwL3hkcF91bWVtLmMKQEAgLTE2NiwxNCArMTY2LDcgQEAg
dm9pZCB4ZHBfdW1lbV9jbGVhcl9kZXYoc3RydWN0IHhkcF91bWVtICp1bWVtKQogCiBzdGF0aWMg
dm9pZCB4ZHBfdW1lbV91bnBpbl9wYWdlcyhzdHJ1Y3QgeGRwX3VtZW0gKnVtZW0pCiB7Ci0JdW5z
aWduZWQgaW50IGk7Ci0KLQlmb3IgKGkgPSAwOyBpIDwgdW1lbS0+bnBnczsgaSsrKSB7Ci0JCXN0
cnVjdCBwYWdlICpwYWdlID0gdW1lbS0+cGdzW2ldOwotCi0JCXNldF9wYWdlX2RpcnR5X2xvY2so
cGFnZSk7Ci0JCXB1dF9wYWdlKHBhZ2UpOwotCX0KKwlwdXRfdXNlcl9wYWdlc19kaXJ0eV9sb2Nr
KHVtZW0tPnBncywgdW1lbS0+bnBncywgdHJ1ZSk7CiAKIAlrZnJlZSh1bWVtLT5wZ3MpOwogCXVt
ZW0tPnBncyA9IE5VTEw7Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
