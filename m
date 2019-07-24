Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD2472899
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 08:54:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B2D289FC0;
	Wed, 24 Jul 2019 06:54:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96EFA6E419
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 01:26:10 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id p184so20014513pfp.7
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 18:26:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZQ3b3+gTPmIEd6M8rc0OL/oIvyoPA2pZ++cTTSt4GKc=;
 b=BATy0lkjU8snvzwUGmYkF+gMxzzc+2z6oId8mPtARfEGD1CiWSRaZ6hAPbdtcLSau1
 nwjNJQMXbJ6DEBb8b825mTYM75Id45TM1uX57xqKG0bVI02M4O9l9ilOz2eQh/8f091D
 ebJxxFkHk6MEj21ePeI7Lff+D1TEAPz6HcDkH0Nj5OhToubC+gfGwkuaVVoJf/wvn2o+
 +oKJlZ4oubPtsHvZmHJjjUg/VakcR1++WSrdKFy9s5GnY5V2EXcEpsMCgS57hXe4AkVg
 vDLeZENo7HTdbiLaeLhS5MamoyCIFlQ0Pwj4E6FQJh8NbLpn50zUIDlFaD/Je1z+gTu5
 z3Yg==
X-Gm-Message-State: APjAAAVWpQS8bnSetiA0pCRlucmHK0gs8GR7MD2FpPRq6v5PHe+GKsEf
 kDGvbWzMeRYxG6Jmv7+0Km4=
X-Google-Smtp-Source: APXvYqzuP5FE7dHH/rrJY8+GDem6uPH4CkCkgfNEStXt8Z11+GRlVjtJCHbhttMVX4qqkHRdu6Qg0Q==
X-Received: by 2002:a17:90a:bc42:: with SMTP id
 t2mr84709587pjv.121.1563931570150; 
 Tue, 23 Jul 2019 18:26:10 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 k36sm45950119pgl.42.2019.07.23.18.26.08
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 23 Jul 2019 18:26:09 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 0/3] mm/gup: add make_dirty arg to
 put_user_pages_dirty_lock()
Date: Tue, 23 Jul 2019 18:26:03 -0700
Message-Id: <20190724012606.25844-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Wed, 24 Jul 2019 06:54:25 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZQ3b3+gTPmIEd6M8rc0OL/oIvyoPA2pZ++cTTSt4GKc=;
 b=VecBxXs5rJxIUXj5tAX6w+Hu36MM21fpWyIYdvzDbaV5EtbHPF+1+bu2YHIo2FoU+h
 qgdi6MriW4QsnS2XTxhZ3CT9hHBmc1EVrlmoNyXHkWprvBI+Yn65R2PNVIuyQj7C+uon
 nfiSugQzYYHYckLsUa6rRl7irNjE5w2jdXZw55VW7ABnrd4ZUv6TxGXUQO6u5cvjdexn
 tPG75hjNwSOtjk7bSxDRlH3uvppfjJjUfzoCSGVP1Fe1uh8JE829or5noA5IrKenAWjY
 MKbFlG+EhvoMwVq1OJV+07GqhN9qs3wTDTL/YhnOg1Or6Ml8smZa2ujck3hWINs1JfYu
 58Lw==
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

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKQ2hhbmdlcyBzaW5jZSB2
MToKCiogSW5zdGVhZCBvZiBwcm92aWRpbmcgX19wdXRfdXNlcl9wYWdlcygpLCBhZGQgYW4gYXJn
dW1lbnQgdG8KICBwdXRfdXNlcl9wYWdlc19kaXJ0eV9sb2NrKCksIGFuZCBkZWxldGUgcHV0X3Vz
ZXJfcGFnZXNfZGlydHkoKS4KICBUaGlzIGlzIGJhc2VkIG9uIHRoZSBmb2xsb3dpbmcgcG9pbnRz
OgoKICAgIDEuIExvdHMgb2YgY2FsbCBzaXRlcyBiZWNvbWUgc2ltcGxlciBpZiBhIGJvb2wgaXMg
cGFzc2VkCiAgICBpbnRvIHB1dF91c2VyX3BhZ2UqKCksIGluc3RlYWQgb2YgbWFraW5nIHRoZSBj
YWxsIHNpdGUKICAgIGNob29zZSB3aGljaCBwdXRfdXNlcl9wYWdlKigpIHZhcmlhbnQgdG8gY2Fs
bC4KCiAgICAyLiBDaHJpc3RvcGggSGVsbHdpZydzIG9ic2VydmF0aW9uIHRoYXQgc2V0X3BhZ2Vf
ZGlydHlfbG9jaygpCiAgICBpcyB1c3VhbGx5IGNvcnJlY3QsIGFuZCBzZXRfcGFnZV9kaXJ0eSgp
IGlzIHVzdWFsbHkgYQogICAgYnVnLCBvciBhdCBsZWFzdCBxdWVzdGlvbmFibGUsIHdpdGhpbiBh
IHB1dF91c2VyX3BhZ2UqKCkKICAgIGNhbGxpbmcgY2hhaW4uCgoqIEFkZGVkIHRoZSBJbmZpbmli
YW5kIGRyaXZlciBiYWNrIHRvIHRoZSBwYXRjaCBzZXJpZXMsIGJlY2F1c2UgaXQgaXMKICBhIGNh
bGxlciBvZiBwdXRfdXNlcl9wYWdlc19kaXJ0eV9sb2NrKCkuCgpVbmNoYW5nZWQgcGFydHMgZnJv
bSB0aGUgdjEgY292ZXIgbGV0dGVyIChleGNlcHQgZm9yIHRoZSBkaWZmc3RhdCk6CgpOb3RlcyBh
Ym91dCB0aGUgcmVtYWluaW5nIHBhdGNoZXMgdG8gY29tZToKClRoZXJlIGFyZSBhYm91dCA1MCsg
cGF0Y2hlcyBpbiBteSB0cmVlIFsyXSwgYW5kIEknbGwgYmUgc2VuZGluZyBvdXQgdGhlCnJlbWFp
bmluZyBvbmVzIGluIGEgZmV3IG1vcmUgZ3JvdXBzOgoKICAgICogVGhlIGJsb2NrL2JpbyByZWxh
dGVkIGNoYW5nZXMgKEplcm9tZSBtb3N0bHkgd3JvdGUgdGhvc2UsIGJ1dCBJJ3ZlCiAgICAgIGhh
ZCB0byBtb3ZlIHN0dWZmIGFyb3VuZCBleHRlbnNpdmVseSwgYW5kIGFkZCBhIGxpdHRsZSBjb2Rl
KQoKICAgICogbW0vIGNoYW5nZXMKCiAgICAqIG90aGVyIHN1YnN5c3RlbSBwYXRjaGVzCgogICAg
KiBhbiBSRkMgdGhhdCBzaG93cyB0aGUgY3VycmVudCBzdGF0ZSBvZiB0aGUgdHJhY2tpbmcgcGF0
Y2ggc2V0LiBUaGF0CiAgICAgIGNhbiBvbmx5IGJlIGFwcGxpZWQgYWZ0ZXIgYWxsIGNhbGwgc2l0
ZXMgYXJlIGNvbnZlcnRlZCwgYnV0IGl0J3MKICAgICAgZ29vZCB0byBnZXQgYW4gZWFybHkgbG9v
ayBhdCBpdC4KClRoaXMgaXMgcGFydCBhIHRyZWUtd2lkZSBjb252ZXJzaW9uLCBhcyBkZXNjcmli
ZWQgaW4gY29tbWl0IGZjMWQ4ZTdjY2EyZAooIm1tOiBpbnRyb2R1Y2UgcHV0X3VzZXJfcGFnZSoo
KSwgcGxhY2Vob2xkZXIgdmVyc2lvbnMiKS4KCkpvaG4gSHViYmFyZCAoMyk6CiAgbW0vZ3VwOiBh
ZGQgbWFrZV9kaXJ0eSBhcmcgdG8gcHV0X3VzZXJfcGFnZXNfZGlydHlfbG9jaygpCiAgZHJpdmVy
cy9ncHUvZHJtL3ZpYTogY29udmVydCBwdXRfcGFnZSgpIHRvIHB1dF91c2VyX3BhZ2UqKCkKICBu
ZXQveGRwOiBjb252ZXJ0IHB1dF9wYWdlKCkgdG8gcHV0X3VzZXJfcGFnZSooKQoKIGRyaXZlcnMv
Z3B1L2RybS92aWEvdmlhX2RtYWJsaXQuYyAgICAgICAgICB8ICAxMCArLQogZHJpdmVycy9pbmZp
bmliYW5kL2NvcmUvdW1lbS5jICAgICAgICAgICAgIHwgICA1ICstCiBkcml2ZXJzL2luZmluaWJh
bmQvaHcvaGZpMS91c2VyX3BhZ2VzLmMgICAgfCAgIDUgKy0KIGRyaXZlcnMvaW5maW5pYmFuZC9o
dy9xaWIvcWliX3VzZXJfcGFnZXMuYyB8ICAgNSArLQogZHJpdmVycy9pbmZpbmliYW5kL2h3L3Vz
bmljL3VzbmljX3Vpb20uYyAgIHwgICA1ICstCiBkcml2ZXJzL2luZmluaWJhbmQvc3cvc2l3L3Np
d19tZW0uYyAgICAgICAgfCAgIDggKy0KIGluY2x1ZGUvbGludXgvbW0uaCAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAgNSArLQogbW0vZ3VwLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgMTE2ICsrKysrKysrKy0tLS0tLS0tLS0tLQogbmV0L3hkcC94ZHBfdW1lbS5jICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgICA5ICstCiA5IGZpbGVzIGNoYW5nZWQsIDYyIGluc2Vy
dGlvbnMoKyksIDEwNiBkZWxldGlvbnMoLSkKCi0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
