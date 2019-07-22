Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB167126D
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 09:14:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5192A89291;
	Tue, 23 Jul 2019 07:14:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11A3788F0D
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 22:34:19 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id y8so19764178plr.12
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 15:34:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QIVVOI9gQsNqxVjPu4etuG1LAE6h//kEaksqjz3X+CU=;
 b=Krvb20CKjStncvhZQsrsu19xfQUmRzJAQxAuqrKBYGPZz/i+DF2h3WL4E+ZCgcfijx
 W0wyvcsAsyZzAth02AiYcTj1jwOBhAVjTsg3mAkQRaw9v+3RgkyxLnHgXHnpG8zk/83X
 fhzDSh8AIQAdD90KLQiG6YVI1ebD8VvPy+gSpqaAsMtaBwLOfKZlocfIGrwI3QWPUlCf
 b2XugTqyN1HfpyGwqoXAxTCKr3LYlPIR2gKxdVj3nG7XiDEZge2IDIxrCWHl1JciPRyS
 1w16xy4OIRtxA7PrxVjYVaLqu4BVhwlOqATdpuGSYmpzEhnUvmGGOBwFos8z9z7Fwqbt
 qesw==
X-Gm-Message-State: APjAAAXOYMOYVn1SBuREF6VLWh04pTZFWCo4dp1erBh1/gWnqxbT7XmH
 uP2RZ744R5U6eGXc3KUbUCs=
X-Google-Smtp-Source: APXvYqxp+r9/TLSrU0csTSoFktj9yzfPPZmms2rTPYm/o4pShtHwmlaILQQ11XVVhMCGVRsd5PF4qg==
X-Received: by 2002:a17:902:820c:: with SMTP id
 x12mr78020390pln.216.1563834859258; 
 Mon, 22 Jul 2019 15:34:19 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 r18sm30597570pfg.77.2019.07.22.15.34.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 15:34:18 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 0/3] introduce __put_user_pages(), convert a few call sites
Date: Mon, 22 Jul 2019 15:34:12 -0700
Message-Id: <20190722223415.13269-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Tue, 23 Jul 2019 07:14:10 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QIVVOI9gQsNqxVjPu4etuG1LAE6h//kEaksqjz3X+CU=;
 b=BMDsv5gG591HtpdOHiM5RyNT1mlqGKuDllYZiTvtfU6CS37Na6fH30nZ9rafb98EIN
 Wlx6iYo9w1xSehuO8cIJ4H5bGxghqyq/GdTmn8CtSOjBrKbVjiTCAavuri+1MJ+5Lp9e
 ObaapI4WPRlWLRFRAe0E0R3/VMrPOqGwFLm0iaeIqT1zZr/EjHzUVR61q43igVVjThf5
 hfxKwYURdgHOehai2YXnoTuh01yL6YImTUqYbD+uXPyZT1gjMy3KpQ/FF0BCGEDZoSoL
 09JhKrG9WJuSpUXM5gobrsghXz+1i6xd9uKLZ5Miti6aS5v9RD3RibWcoah6SPr4u6OX
 ZMcw==
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

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKQXMgZGlzY3Vzc2VkIGlu
IFsxXSBqdXN0IG5vdywgdGhpcyBhZGRzIGEgbW9yZSBjYXBhYmxlIHZhcmlhdGlvbiBvZgpwdXRf
dXNlcl9wYWdlcygpIHRvIHRoZSBBUEkgc2V0LCBhbmQgdXNlcyBpdCB0byBzaW1wbGlmeSBib3Ro
IHRoZQptYWluIGltcGxlbWVudGF0aW9uLCBhbmQgKGVzcGVjaWFsbHkpIHRoZSBjYWxsIHNpdGVz
LgoKVGhhbmtzIHRvIENocmlzdG9waCBmb3IgdGhlIHNpbXBsaWZ5aW5nIGlkZWFzLCBhbmQgTWF0
dGhldyBmb3IgKGFnYWluKQpyZWNvbW1lbmRpbmcgYW4gZW51bSBpbiB0aGUgQVBJLiBNYXR0aGV3
LCBJIHNlZW0gdG8gcmVjYWxsIHlvdSBhc2tlZApmb3IgZW51bXMgYmVmb3JlIHRoaXMsIHNvIEkn
bSBzb3JyeSBpdCB0b29rIHVudGlsIG5vdyBmb3IgbWUgdG8gYWRkCnRoZW0uIDopCgpUaGUgbmV3
IF9fcHV0X3VzZXJfcGFnZXMoKSB0YWtlcyBhbiBlbnVtIHRoYXQgaGFuZGxlcyB0aGUgdmFyaW91
cwpjb21iaW5hdGlvbnMgb2YgbmVlZGluZyB0byBjYWxsIHNldF9wYWdlX2RpcnR5KCkgb3IKc2V0
X3BhZ2VfZGlydHlfbG9jaygpLCBiZWZvcmUgY2FsbGluZyBwdXRfdXNlcl9wYWdlKCkuCgpJJ20g
dXNpbmcgdGhlIHNhbWUgQ0MgbGlzdCBhcyBpbiBbMV0sIGV2ZW4gdGhvdWdoIElCIGlzIG5vIGxv
bmdlcgppbmNsdWRlZCBpbiB0aGUgc2VyaWVzLiBUaGF0J3MgZXZlcnlvbmUgY2FuIHNlZSB3aGF0
IHRoZSBlbmQgcmVzdWx0CnR1cm5zIG91dCB0byBiZS4KCk5vdGVzIGFib3V0IHRoZSByZW1haW5p
bmcgcGF0Y2hlcyB0byBjb21lOgoKVGhlcmUgYXJlIGFib3V0IDUwKyBwYXRjaGVzIGluIG15IHRy
ZWUgWzJdLCBhbmQgSSdsbCBiZSBzZW5kaW5nIG91dCB0aGUKcmVtYWluaW5nIG9uZXMgaW4gYSBm
ZXcgbW9yZSBncm91cHM6CgogICAgKiBUaGUgYmxvY2svYmlvIHJlbGF0ZWQgY2hhbmdlcyAoSmVy
b21lIG1vc3RseSB3cm90ZSB0aG9zZSwgYnV0IEkndmUKICAgICAgaGFkIHRvIG1vdmUgc3R1ZmYg
YXJvdW5kIGV4dGVuc2l2ZWx5LCBhbmQgYWRkIGEgbGl0dGxlIGNvZGUpCgogICAgKiBtbS8gY2hh
bmdlcwoKICAgICogb3RoZXIgc3Vic3lzdGVtIHBhdGNoZXMKCiAgICAqIGFuIFJGQyB0aGF0IHNo
b3dzIHRoZSBjdXJyZW50IHN0YXRlIG9mIHRoZSB0cmFja2luZyBwYXRjaCBzZXQuIFRoYXQKICAg
ICAgY2FuIG9ubHkgYmUgYXBwbGllZCBhZnRlciBhbGwgY2FsbCBzaXRlcyBhcmUgY29udmVydGVk
LCBidXQgaXQncwogICAgICBnb29kIHRvIGdldCBhbiBlYXJseSBsb29rIGF0IGl0LgoKVGhpcyBp
cyBwYXJ0IGEgdHJlZS13aWRlIGNvbnZlcnNpb24sIGFzIGRlc2NyaWJlZCBpbiBjb21taXQgZmMx
ZDhlN2NjYTJkCigibW06IGludHJvZHVjZSBwdXRfdXNlcl9wYWdlKigpLCBwbGFjZWhvbGRlciB2
ZXJzaW9ucyIpLgoKWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAxOTA3MjIwOTMzNTUu
R0IyOTUzOEBsc3QuZGUKWzJdIGh0dHBzOi8vZ2l0aHViLmNvbS9qb2huaHViYmFyZC9saW51eC90
cmVlL2d1cF9kbWFfY29yZQoKSm9obiBIdWJiYXJkICgzKToKICBtbS9ndXA6IGludHJvZHVjZSBf
X3B1dF91c2VyX3BhZ2VzKCkKICBkcml2ZXJzL2dwdS9kcm0vdmlhOiBjb252ZXJ0IHB1dF9wYWdl
KCkgdG8gcHV0X3VzZXJfcGFnZSooKQogIG5ldC94ZHA6IGNvbnZlcnQgcHV0X3BhZ2UoKSB0byBw
dXRfdXNlcl9wYWdlKigpCgogZHJpdmVycy9ncHUvZHJtL3ZpYS92aWFfZG1hYmxpdC5jIHwgIDEx
ICstLQogaW5jbHVkZS9saW51eC9tbS5oICAgICAgICAgICAgICAgIHwgIDU4ICsrKysrKysrKysr
LQogbW0vZ3VwLmMgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMTQ5ICsrKysrKysrKysrKysr
Ky0tLS0tLS0tLS0tLS0tLQogbmV0L3hkcC94ZHBfdW1lbS5jICAgICAgICAgICAgICAgIHwgICA5
ICstCiA0IGZpbGVzIGNoYW5nZWQsIDEzNSBpbnNlcnRpb25zKCspLCA5MiBkZWxldGlvbnMoLSkK
Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
