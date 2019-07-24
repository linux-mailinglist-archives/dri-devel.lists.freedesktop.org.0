Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D4A728A0
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 08:54:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E64576E46B;
	Wed, 24 Jul 2019 06:54:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EBE26E41A
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 01:26:14 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id r7so20027092pfl.3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 18:26:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zIg1AeRgD/CqkmVywbx+SzJM6fRrXplz7aYhAvptzng=;
 b=jwVP7lEr1ecNq5IXwfV1UrbeXGJUy1FOJImD+5uQ1sYBpHhPewibcl0RI3p8Uo36Vd
 f0I3CYKTAo4d61rBjS8/hQ9Tp4bOWPECxEewTMbBTPcToZ4VtzoKGDPxNXw/qZdhYqrc
 Ndm79W9ekdkXqQhPAWPwitStErYQB0K7JSk0XzKyBohaYmuKOepmMOMz/3aT5d/+MIN0
 oXars02VvjEMnQ8jClNOGoplZc28HzdBxiFCYOFliX3E1EAd+HP26FwAODNiQNTVYA8p
 zCeWeX3agoqBkB3W3SdRbzvSvbULaGS1HjXFfzyFKemR54Fj5rKdqMztimhQdSHi8bv+
 8wRg==
X-Gm-Message-State: APjAAAUNRc/GLRsSOUFef+MSh/ELcMuHShWA0jLubpDAZwcmfLMeRm0e
 kTMQfaMiEugkQz4Ur9Sf2YI=
X-Google-Smtp-Source: APXvYqyCk61wnabNIK4Jxvfw+l2b6WmoUqrtPcNhmtW2WxlaOXFDgcDVuADNCkU4wpAGaRv/63OqTA==
X-Received: by 2002:a17:90a:db08:: with SMTP id
 g8mr82170764pjv.39.1563931574192; 
 Tue, 23 Jul 2019 18:26:14 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 k36sm45950119pgl.42.2019.07.23.18.26.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 23 Jul 2019 18:26:13 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 3/3] net/xdp: convert put_page() to put_user_page*()
Date: Tue, 23 Jul 2019 18:26:06 -0700
Message-Id: <20190724012606.25844-4-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190724012606.25844-1-jhubbard@nvidia.com>
References: <20190724012606.25844-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Wed, 24 Jul 2019 06:54:25 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zIg1AeRgD/CqkmVywbx+SzJM6fRrXplz7aYhAvptzng=;
 b=BXqsh80Nl4cDZcRUa+Nux4yM46naJJQtkxKxn8QzLhVcqDBWMLcxIvpEfojCwCxmNb
 KDP337fhhZiSsUY+ie+iYwy+2LsmwUDrAbCBafzWMLvZeUwJrYtszfn5BpBMhwbZRXEE
 ls7+Qu+a79sZuQw2/Y85G/uzux5nCGoCZnl7NXJeaNUrSOxj+wZ3LMZFEs4kUib49d55
 f/aP9kCOfXD7XfWhkmk5SMVUXE+iny9dOyzsBMo4r1sLMn0DtURnoVBQNLDjNrhOdtJB
 ZaPsyiQ+nd6BdhyOicPLzNhKQsZJ8Wv5E16OYyRJt7ANMgAFPyceIosc6BbyNvMrTUAr
 XRYw==
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
ZXggODNkZTc0Y2E3MjlhLi4xN2M0YjNkM2RjMzQgMTAwNjQ0Ci0tLSBhL25ldC94ZHAveGRwX3Vt
ZW0uYworKysgYi9uZXQveGRwL3hkcF91bWVtLmMKQEAgLTE2NiwxNCArMTY2LDcgQEAgdm9pZCB4
ZHBfdW1lbV9jbGVhcl9kZXYoc3RydWN0IHhkcF91bWVtICp1bWVtKQogCiBzdGF0aWMgdm9pZCB4
ZHBfdW1lbV91bnBpbl9wYWdlcyhzdHJ1Y3QgeGRwX3VtZW0gKnVtZW0pCiB7Ci0JdW5zaWduZWQg
aW50IGk7Ci0KLQlmb3IgKGkgPSAwOyBpIDwgdW1lbS0+bnBnczsgaSsrKSB7Ci0JCXN0cnVjdCBw
YWdlICpwYWdlID0gdW1lbS0+cGdzW2ldOwotCi0JCXNldF9wYWdlX2RpcnR5X2xvY2socGFnZSk7
Ci0JCXB1dF9wYWdlKHBhZ2UpOwotCX0KKwlwdXRfdXNlcl9wYWdlc19kaXJ0eV9sb2NrKHVtZW0t
PnBncywgdW1lbS0+bnBncywgdHJ1ZSk7CiAKIAlrZnJlZSh1bWVtLT5wZ3MpOwogCXVtZW0tPnBn
cyA9IE5VTEw7Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
