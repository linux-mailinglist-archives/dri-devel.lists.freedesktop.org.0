Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCE5728A6
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 08:55:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7E296E468;
	Wed, 24 Jul 2019 06:55:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A0C06E436
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 04:45:43 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id g2so20261909pfq.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 21:45:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a82RGTEXPGUxT9wrhIl0SGm+IUg23fG0znFClaoZF2M=;
 b=nbqzxVXwmsZ22RxwsDGIDxkMOmk1PjfCOf7BVXotnI+nscZs4G7nzPE5QKNg+WPMBs
 YO2G5Soyz/EJCURMSbdhtAtvggB1PgQ4X9L91qs1Mdb5FpGCrQu75xdp0jlCw6e6se8Z
 q6YZWCGV4d+rgaqT2yluL/YBKWcyPVou9jIeKQWB210HEwO3qUSxQoJO8mZrDuysW/nG
 A+e2E8DOHL2TLZ6srHibyiuzkgKvDuX300DeC8OaO+citjHLICC+Ln/QsmEU1Lscxit2
 YHhaXWq18wlPrMnXT+5KRSsec2ndz4L6wjA9/a3KEoFG3d9rUinHOVfoXjGml2wq2aFH
 PtIQ==
X-Gm-Message-State: APjAAAWRljSRuQyVWu7wHoaNH7GV9MAq195hC0SU9RcUbpJ9oh1qsR7z
 Es3XWuwEVmuwcUeUOWh/zRY=
X-Google-Smtp-Source: APXvYqxX+DOW07WMhb+fJsFbx0LQzjFWgiNXaRMsjDo7bpqayKueY9DMdaxKoauo3MlhyMuoWNYR+w==
X-Received: by 2002:a63:1749:: with SMTP id 9mr27042805pgx.0.1563943543120;
 Tue, 23 Jul 2019 21:45:43 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 b30sm65685861pfr.117.2019.07.23.21.45.41
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 23 Jul 2019 21:45:42 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 0/3] mm/gup: add make_dirty arg to
 put_user_pages_dirty_lock()
Date: Tue, 23 Jul 2019 21:45:34 -0700
Message-Id: <20190724044537.10458-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Wed, 24 Jul 2019 06:54:25 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a82RGTEXPGUxT9wrhIl0SGm+IUg23fG0znFClaoZF2M=;
 b=Kd6PSC/URd7UIKcw58+fxXgQ892se8NpHm4OEg6NafKMnFMjvCAiIWdHCoPlLPqc8L
 aJ2qPkFGF7rV4DRVYtDw+kzTyKz++lpvKqFQcAl7iCYllE6k6lUQW6B8w5u+byvfT5Fa
 Q+WPYT0yXJJOYRou8VbShLD+Gu3cc60uHbegYi/Y7R4SDcQBKGF+uJ9+OtewKzKdHYa4
 mDkxAnsVFsH5foR59Pl19TCg37A2eC/JUZHs5kG/6JwxZW5fVI4ecC6e+3X2Ighkd2ts
 XemnURq3vKLirIn4/+d6ODT0qlTyYo8BgEmwVl9sISBYhC7Lqlq4LZICijaj0IvIIAaT
 a7IQ==
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

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKSGksCgpJIGFwb2xvZ2l6
ZSBmb3IgdGhlIGV4dHJhIGVtYWlscyAodjIgd2FzIHNlbnQgcHJldHR5IHJlY2VudGx5KSwgYnV0
IEkKZGlkbid0IHdhbnQgdG8gbGVhdmUgYSBrbm93bi1icm9rZW4gdmVyc2lvbiBzaXR0aW5nIG91
dCB0aGVyZSwgY3JlYXRpbmcKcHJvYmxlbXMuCgpDaGFuZ2VzIHNpbmNlIHYyOgoKKiBDcml0aWNh
bCBidWcgZml4OiByZW1vdmUgYSBzdHJheSAiYnJlYWs7IiBmcm9tIHRoZSBuZXcgcm91dGluZS4K
CkNoYW5nZXMgc2luY2UgdjE6CgoqIEluc3RlYWQgb2YgcHJvdmlkaW5nIF9fcHV0X3VzZXJfcGFn
ZXMoKSwgYWRkIGFuIGFyZ3VtZW50IHRvCiAgcHV0X3VzZXJfcGFnZXNfZGlydHlfbG9jaygpLCBh
bmQgZGVsZXRlIHB1dF91c2VyX3BhZ2VzX2RpcnR5KCkuCiAgVGhpcyBpcyBiYXNlZCBvbiB0aGUg
Zm9sbG93aW5nIHBvaW50czoKCiAgICAxLiBMb3RzIG9mIGNhbGwgc2l0ZXMgYmVjb21lIHNpbXBs
ZXIgaWYgYSBib29sIGlzIHBhc3NlZAogICAgaW50byBwdXRfdXNlcl9wYWdlKigpLCBpbnN0ZWFk
IG9mIG1ha2luZyB0aGUgY2FsbCBzaXRlCiAgICBjaG9vc2Ugd2hpY2ggcHV0X3VzZXJfcGFnZSoo
KSB2YXJpYW50IHRvIGNhbGwuCgogICAgMi4gQ2hyaXN0b3BoIEhlbGx3aWcncyBvYnNlcnZhdGlv
biB0aGF0IHNldF9wYWdlX2RpcnR5X2xvY2soKQogICAgaXMgdXN1YWxseSBjb3JyZWN0LCBhbmQg
c2V0X3BhZ2VfZGlydHkoKSBpcyB1c3VhbGx5IGEKICAgIGJ1Zywgb3IgYXQgbGVhc3QgcXVlc3Rp
b25hYmxlLCB3aXRoaW4gYSBwdXRfdXNlcl9wYWdlKigpCiAgICBjYWxsaW5nIGNoYWluLgoKKiBB
ZGRlZCB0aGUgSW5maW5pYmFuZCBkcml2ZXIgYmFjayB0byB0aGUgcGF0Y2ggc2VyaWVzLCBiZWNh
dXNlIGl0IGlzCiAgYSBjYWxsZXIgb2YgcHV0X3VzZXJfcGFnZXNfZGlydHlfbG9jaygpLgoKVW5j
aGFuZ2VkIHBhcnRzIGZyb20gdGhlIHYxIGNvdmVyIGxldHRlciAoZXhjZXB0IGZvciB0aGUgZGlm
ZnN0YXQpOgoKTm90ZXMgYWJvdXQgdGhlIHJlbWFpbmluZyBwYXRjaGVzIHRvIGNvbWU6CgpUaGVy
ZSBhcmUgYWJvdXQgNTArIHBhdGNoZXMgaW4gbXkgdHJlZSBbMl0sIGFuZCBJJ2xsIGJlIHNlbmRp
bmcgb3V0IHRoZQpyZW1haW5pbmcgb25lcyBpbiBhIGZldyBtb3JlIGdyb3VwczoKCiAgICAqIFRo
ZSBibG9jay9iaW8gcmVsYXRlZCBjaGFuZ2VzIChKZXJvbWUgbW9zdGx5IHdyb3RlIHRob3NlLCBi
dXQgSSd2ZQogICAgICBoYWQgdG8gbW92ZSBzdHVmZiBhcm91bmQgZXh0ZW5zaXZlbHksIGFuZCBh
ZGQgYSBsaXR0bGUgY29kZSkKCiAgICAqIG1tLyBjaGFuZ2VzCgogICAgKiBvdGhlciBzdWJzeXN0
ZW0gcGF0Y2hlcwoKICAgICogYW4gUkZDIHRoYXQgc2hvd3MgdGhlIGN1cnJlbnQgc3RhdGUgb2Yg
dGhlIHRyYWNraW5nIHBhdGNoIHNldC4gVGhhdAogICAgICBjYW4gb25seSBiZSBhcHBsaWVkIGFm
dGVyIGFsbCBjYWxsIHNpdGVzIGFyZSBjb252ZXJ0ZWQsIGJ1dCBpdCdzCiAgICAgIGdvb2QgdG8g
Z2V0IGFuIGVhcmx5IGxvb2sgYXQgaXQuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29udmVy
c2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9kdWNl
IHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpKb2huIEh1YmJhcmQg
KDMpOgogIG1tL2d1cDogYWRkIG1ha2VfZGlydHkgYXJnIHRvIHB1dF91c2VyX3BhZ2VzX2RpcnR5
X2xvY2soKQogIGRyaXZlcnMvZ3B1L2RybS92aWE6IGNvbnZlcnQgcHV0X3BhZ2UoKSB0byBwdXRf
dXNlcl9wYWdlKigpCiAgbmV0L3hkcDogY29udmVydCBwdXRfcGFnZSgpIHRvIHB1dF91c2VyX3Bh
Z2UqKCkKCiBkcml2ZXJzL2dwdS9kcm0vdmlhL3ZpYV9kbWFibGl0LmMgICAgICAgICAgfCAgMTAg
Ky0KIGRyaXZlcnMvaW5maW5pYmFuZC9jb3JlL3VtZW0uYyAgICAgICAgICAgICB8ICAgNSArLQog
ZHJpdmVycy9pbmZpbmliYW5kL2h3L2hmaTEvdXNlcl9wYWdlcy5jICAgIHwgICA1ICstCiBkcml2
ZXJzL2luZmluaWJhbmQvaHcvcWliL3FpYl91c2VyX3BhZ2VzLmMgfCAgIDUgKy0KIGRyaXZlcnMv
aW5maW5pYmFuZC9ody91c25pYy91c25pY191aW9tLmMgICB8ICAgNSArLQogZHJpdmVycy9pbmZp
bmliYW5kL3N3L3Npdy9zaXdfbWVtLmMgICAgICAgIHwgICA4ICstCiBpbmNsdWRlL2xpbnV4L21t
LmggICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDUgKy0KIG1tL2d1cC5jICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8IDExNSArKysrKysrKystLS0tLS0tLS0tLS0KIG5ldC94
ZHAveGRwX3VtZW0uYyAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgOSArLQogOSBmaWxlcyBj
aGFuZ2VkLCA2MSBpbnNlcnRpb25zKCspLCAxMDYgZGVsZXRpb25zKC0pCgotLSAKMi4yMi4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
