Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AB66F9F6
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 09:08:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF2089B46;
	Mon, 22 Jul 2019 07:08:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 880CE89A76
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 04:30:18 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id a93so18529413pla.7
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jul 2019 21:30:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D+V1JOqHKw89xuQJyKyrQPxBPg1TKqg5mmM4KBGZiv0=;
 b=t4Jhq/hkEPZBr27S8t0P3pTo5oqKIqUjYL7aFw/XR/NMA/U+q4B9r9tNwj6wkydvMs
 /gg5F+EJVRf2BM3bGp/3cxDSi4oSb8LG9H0zxuI14J67quoNnPqvG39uGZ3OnfT76rbX
 xMDuWW1EpCmkdZ9hv0CwBekN2NFnF1aSX69rAsv/ShOhbFlZCCLxRQrHH3NoAPV3gLly
 JwqfPHOXh3/Sbj4FtwC0sHVWv+qvi8ZzkTcADhSVZ9RrxJfg9Eu0+JhV9LP9mIWVqLhK
 o2liP/eNSz0xdI+ZTiUDbDYmAPscy37SkEjARwxEcjgXBHx0SesIp2EFZF72TwF8J0f/
 sNew==
X-Gm-Message-State: APjAAAUnNyW+hY80qtXtMuMQBxblAqWRJkCNGpX+bQ6CrsiabloeXFCe
 e50Wv4F55/LXjk2OC3v0Bj4=
X-Google-Smtp-Source: APXvYqxl80v/klDkLGiV/45cokVowIxuUImE7kMceTFkzRgYtQ9KqbkKZkwGuHiecTAs8feNRgDMBA==
X-Received: by 2002:a17:902:6b86:: with SMTP id
 p6mr74936264plk.14.1563769818237; 
 Sun, 21 Jul 2019 21:30:18 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 t96sm34285690pjb.1.2019.07.21.21.30.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 21 Jul 2019 21:30:17 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 2/3] net/xdp: convert put_page() to put_user_page*()
Date: Sun, 21 Jul 2019 21:30:11 -0700
Message-Id: <20190722043012.22945-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190722043012.22945-1-jhubbard@nvidia.com>
References: <20190722043012.22945-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Mon, 22 Jul 2019 07:08:15 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D+V1JOqHKw89xuQJyKyrQPxBPg1TKqg5mmM4KBGZiv0=;
 b=ZjncIryvRUENukVshJFmndluvLLU2arKIPK+YYicUChsIoVAk47zJe62/xRGnaP5sO
 2dIVuxokgzVnbQHvCzkTXpkUYAmteOI1byf9i0Eh4Nry32SQ9hACfIfRqzVmd9cJiRLV
 K9HwOtYgSWbkF9G0wSK5xDI2GGAAixptvpE4fTe363E9YhkxmADQ/Mu9XRx8bTc2aorh
 N1o7z9m3WHPe2EsrnhH9xUt6CS36Mz9r/OpIcDwkj8s1H6FUiNK+g6MeR3C2qRQdfIdw
 al2E1lXQJ0Y1vWlKKViZ99Kmj6ELgJUAJ+cq1tdYD2dh7ezt2sYlt89O5gvFrEpEQJG1
 ZAOA==
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
YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Ci0tLQogbmV0L3hkcC94ZHBfdW1lbS5jIHwgMyAr
LS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9uZXQveGRwL3hkcF91bWVtLmMgYi9uZXQveGRwL3hkcF91bWVtLmMKaW5kZXggODNk
ZTc0Y2E3MjlhLi45Y2JiYjk2YzJhMzIgMTAwNjQ0Ci0tLSBhL25ldC94ZHAveGRwX3VtZW0uYwor
KysgYi9uZXQveGRwL3hkcF91bWVtLmMKQEAgLTE3MSw4ICsxNzEsNyBAQCBzdGF0aWMgdm9pZCB4
ZHBfdW1lbV91bnBpbl9wYWdlcyhzdHJ1Y3QgeGRwX3VtZW0gKnVtZW0pCiAJZm9yIChpID0gMDsg
aSA8IHVtZW0tPm5wZ3M7IGkrKykgewogCQlzdHJ1Y3QgcGFnZSAqcGFnZSA9IHVtZW0tPnBnc1tp
XTsKIAotCQlzZXRfcGFnZV9kaXJ0eV9sb2NrKHBhZ2UpOwotCQlwdXRfcGFnZShwYWdlKTsKKwkJ
cHV0X3VzZXJfcGFnZXNfZGlydHlfbG9jaygmcGFnZSwgMSk7CiAJfQogCiAJa2ZyZWUodW1lbS0+
cGdzKTsKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
