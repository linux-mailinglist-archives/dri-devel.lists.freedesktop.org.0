Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0B17128D
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 09:16:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 710306E079;
	Tue, 23 Jul 2019 07:15:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C7BF89A72
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 22:34:23 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id f25so18326649pgv.10
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 15:34:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/ofa5EhPy5N+KM7nweAsOE7rWC5Duznu1d2IMlN4I/Y=;
 b=LdxOoBxfWGvV/0QstLIaNV434g7a9u5LFesi+J5+2PMDwoBiZ+uWh10Y08jFye444Y
 JiC6WOlxrwF0RMOAsQKFrj/1JnbM2uvJMX/sEjFuoSTLlJ5gr7UcNYfud6Mm5OtNTChl
 wabJY62N18FwLZj+HzAfA+imrK8D/cFTppG2KrpAMtRXQrq4K2E1fuNjceAci7Uorn0X
 W6VlkFLl4StP1Dy+juUfCxcZPB+eVJwrebj04l/zUKXAqjpiWQ1rBgg0o1XMBWXeHeIT
 wXNRZgVzrIg30FnwxJYbRVgDn/NiPX0xoGc8keyLinIWu3a8yzf53ssdWyv3SnhVLJsM
 WsYw==
X-Gm-Message-State: APjAAAVfdZOoP9r2c595Q9NtNu/X+0yAmjYhDA8AJa0iHwD2c3WZRkRr
 KPJnEB7s98qHzVB3BICj44Y=
X-Google-Smtp-Source: APXvYqwVaJn+EzirdPn13F0RFZ1U5rQgVF9dbTt0Dcd+iQUjCIySQADzRQKVKnRyYTBRNLHQ9Mrw9A==
X-Received: by 2002:a62:7990:: with SMTP id u138mr2390135pfc.191.1563834863230; 
 Mon, 22 Jul 2019 15:34:23 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 r18sm30597570pfg.77.2019.07.22.15.34.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 15:34:22 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 3/3] net/xdp: convert put_page() to put_user_page*()
Date: Mon, 22 Jul 2019 15:34:15 -0700
Message-Id: <20190722223415.13269-4-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190722223415.13269-1-jhubbard@nvidia.com>
References: <20190722223415.13269-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Tue, 23 Jul 2019 07:14:10 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/ofa5EhPy5N+KM7nweAsOE7rWC5Duznu1d2IMlN4I/Y=;
 b=Sw0HvJJTDmzbJlbRnGPA0tEKa9wBsoXOpSBSyyCpXXoTDy/oLlPojLp975N/iZT3Rt
 8jfBQuYyMJoyHlJ2fyV7WUkxYIldTegTihpxRiAvNY8zRba3PO9qS3NZSvTUxei06Rk0
 uOGdeG1FwadWsIBYlsr2yV0g+UwUeH2FEFiAyASHNNXam+5nvwUOaLXqS8GitFl6ninp
 eVYAIz6e9bu5JJNLX4jLtYsSme3OBg4qojzmnb1QA+ka0SBTx6a2p/N+h2SdySOnbmnd
 qH6vvH98sRnmJjM2M9uSzbppXdvFGZyQFLd9B0l+ZOt4ywhtBFZH/zZ3Y6U5IOl5jKuB
 XGJA==
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
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpDYzogQmrDtnJu
IFTDtnBlbCA8Ympvcm4udG9wZWxAaW50ZWwuY29tPgpDYzogTWFnbnVzIEthcmxzc29uIDxtYWdu
dXMua2FybHNzb25AaW50ZWwuY29tPgpDYzogRGF2aWQgUy4gTWlsbGVyIDxkYXZlbUBkYXZlbWxv
ZnQubmV0PgpDYzogbmV0ZGV2QHZnZXIua2VybmVsLm9yZwpTaWduZWQtb2ZmLWJ5OiBKb2huIEh1
YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Ci0tLQogbmV0L3hkcC94ZHBfdW1lbS5jIHwgOSAr
LS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgOCBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9uZXQveGRwL3hkcF91bWVtLmMgYi9uZXQveGRwL3hkcF91bWVtLmMKaW5k
ZXggODNkZTc0Y2E3MjlhLi4wMzI1YTE3OTE1ZGUgMTAwNjQ0Ci0tLSBhL25ldC94ZHAveGRwX3Vt
ZW0uYworKysgYi9uZXQveGRwL3hkcF91bWVtLmMKQEAgLTE2NiwxNCArMTY2LDcgQEAgdm9pZCB4
ZHBfdW1lbV9jbGVhcl9kZXYoc3RydWN0IHhkcF91bWVtICp1bWVtKQogCiBzdGF0aWMgdm9pZCB4
ZHBfdW1lbV91bnBpbl9wYWdlcyhzdHJ1Y3QgeGRwX3VtZW0gKnVtZW0pCiB7Ci0JdW5zaWduZWQg
aW50IGk7Ci0KLQlmb3IgKGkgPSAwOyBpIDwgdW1lbS0+bnBnczsgaSsrKSB7Ci0JCXN0cnVjdCBw
YWdlICpwYWdlID0gdW1lbS0+cGdzW2ldOwotCi0JCXNldF9wYWdlX2RpcnR5X2xvY2socGFnZSk7
Ci0JCXB1dF9wYWdlKHBhZ2UpOwotCX0KKwlwdXRfdXNlcl9wYWdlc19kaXJ0eV9sb2NrKHVtZW0t
PnBncywgdW1lbS0+bnBncyk7CiAKIAlrZnJlZSh1bWVtLT5wZ3MpOwogCXVtZW0tPnBncyA9IE5V
TEw7Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
