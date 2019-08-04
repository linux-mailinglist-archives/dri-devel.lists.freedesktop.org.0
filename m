Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8518A81378
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 09:36:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB3046E2C4;
	Mon,  5 Aug 2019 07:35:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1139D89DC9
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Aug 2019 21:40:46 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id y15so38560048pfn.5
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Aug 2019 14:40:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u7QfHgAZJphiJkiML+n7+9xiXsnu4L5blHeWg2XiOgc=;
 b=o0b/VWTlQ5AmomG1gCDjxNw79OLUIzUs4jyAhUkhGbK7Syw7RyJpKG/JzwDhAK+yez
 tb9HpmD5RG2+5JNqyV6lwDfXNejUIPLsWj2bsex2LADEsMvm2xke8pvlbnYJZESNOiuH
 Efylu8DAXa7kJ92YjsgIkkrAdpZHf22hzpgkl34qrvrydJH0vmWzNa8kxwXXivqcMVe7
 ccYjTSKiklvnqYL/d0Zvo1FLr7z/Sf92wog/Zh5mUTkhlJviAU4FtH+tEa5xAeealzml
 CbOf/Tm+en9WxrOJ9fi82dhBRb8YXcKVlBnZBVHwEYXRqyzpHNW63tCO+TSqg2yBIJqA
 1CJw==
X-Gm-Message-State: APjAAAVtG3kk6F78ZqQ4P6lgjX2c4MemIH349D8sKd44eD8DYYvAkeuX
 57b69luJWXeeGorfVuvOLyM=
X-Google-Smtp-Source: APXvYqzFCjqlZU+HDCyGiBEvpK2/pADBDo3dD7v/H/FvucfCIeD6scQK7TlMDTLTVLBWsfhNeMf1fA==
X-Received: by 2002:a17:90a:bc0c:: with SMTP id
 w12mr14275839pjr.111.1564954845639; 
 Sun, 04 Aug 2019 14:40:45 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 143sm123751024pgc.6.2019.08.04.14.40.43
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 14:40:44 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v6 0/3] mm/gup: add make_dirty arg to
 put_user_pages_dirty_lock()
Date: Sun,  4 Aug 2019 14:40:39 -0700
Message-Id: <20190804214042.4564-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Mon, 05 Aug 2019 07:34:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u7QfHgAZJphiJkiML+n7+9xiXsnu4L5blHeWg2XiOgc=;
 b=u39I0RWzXaT9LZiMOuWXB1YMfdm9l0k5XildL+8oy8WG+Xp+HlNRUNYjNYcsIgMMTB
 ZpD/HwYg5a0o6ahOx9ZYRbmJlZZ3NLwUfe/ls4mO6JoAFJIx/C4wKRP28ihiEUB5VjhT
 D58n4BNw9c55IlGQPpiJrVPRnoEMM0g6/Xf+ahwHFl/B88xU2qGxK/pemUTTRjimFwRi
 t/D8fcfMolCCDTGQO+urRxWr1DbAd4j3hCpOP6OcV/VT/muTPpaFTvV1+DiX2EdeA9OL
 XsnejpGlwKFc3nz+z9brQ1fZaYH/JKmBK+jueenTXLYIBOez7qe7f8v+Db7b0LHhvgd6
 B7fA==
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
NToKCiogUGF0Y2ggIzE6IEZpeGVkIGEgYnVnIHRoYXQgSSBpbnRyb2R1Y2VkIGluIHY0OgogIGRy
aXZlcnMvaW5maW5pYmFuZC9zdy9zaXcvc2l3X21lbS5jIG5lZWRzIHRvIHJlZmVyIHRvCiAgdW1l
bS0+cGFnZV9jaHVua1tpXS5wbGlzdCwgcmF0aGVyIHRoYW4gdW1lbS0+cGFnZV9jaHVua1tpXS4K
CkNoYW5nZXMgc2luY2UgdjQ6CgoqIENocmlzdG9waGUgSGVsbHdpZydzIHJldmlldyBhcHBsaWVk
OiBkZWxldGVkIHNpd19mcmVlX3BsaXN0KCkgYW5kCiAgX19xaWJfcmVsZWFzZV91c2VyX3BhZ2Vz
KCksIG5vdyB0aGF0IHB1dF91c2VyX3BhZ2VzX2RpcnR5X2xvY2soKSBkb2VzCiAgd2hhdCB0aG9z
ZSByb3V0aW5lcyB3ZXJlIGRvaW5nLgoKKiBBcHBsaWVkIEJqb3JuJ3MgQUNLIGZvciBuZXQveGRw
LCBhbmQgQ2hyaXN0b3BoZSdzIFJldmlld2VkLWJ5IGZvciBwYXRjaAogICMxLgoKQ2hhbmdlcyBz
aW5jZSB2MzoKCiogRml4ZWQgYW4gdW51c2VkIHZhcmlhYmxlIHdhcm5pbmcgaW4gc2l3X21lbS5j
CgpDaGFuZ2VzIHNpbmNlIHYyOgoKKiBDcml0aWNhbCBidWcgZml4OiByZW1vdmUgYSBzdHJheSAi
YnJlYWs7IiBmcm9tIHRoZSBuZXcgcm91dGluZS4KCkNoYW5nZXMgc2luY2UgdjE6CgoqIEluc3Rl
YWQgb2YgcHJvdmlkaW5nIF9fcHV0X3VzZXJfcGFnZXMoKSwgYWRkIGFuIGFyZ3VtZW50IHRvCiAg
cHV0X3VzZXJfcGFnZXNfZGlydHlfbG9jaygpLCBhbmQgZGVsZXRlIHB1dF91c2VyX3BhZ2VzX2Rp
cnR5KCkuCiAgVGhpcyBpcyBiYXNlZCBvbiB0aGUgZm9sbG93aW5nIHBvaW50czoKCiAgICAxLiBM
b3RzIG9mIGNhbGwgc2l0ZXMgYmVjb21lIHNpbXBsZXIgaWYgYSBib29sIGlzIHBhc3NlZAogICAg
aW50byBwdXRfdXNlcl9wYWdlKigpLCBpbnN0ZWFkIG9mIG1ha2luZyB0aGUgY2FsbCBzaXRlCiAg
ICBjaG9vc2Ugd2hpY2ggcHV0X3VzZXJfcGFnZSooKSB2YXJpYW50IHRvIGNhbGwuCgogICAgMi4g
Q2hyaXN0b3BoIEhlbGx3aWcncyBvYnNlcnZhdGlvbiB0aGF0IHNldF9wYWdlX2RpcnR5X2xvY2so
KQogICAgaXMgdXN1YWxseSBjb3JyZWN0LCBhbmQgc2V0X3BhZ2VfZGlydHkoKSBpcyB1c3VhbGx5
IGEKICAgIGJ1Zywgb3IgYXQgbGVhc3QgcXVlc3Rpb25hYmxlLCB3aXRoaW4gYSBwdXRfdXNlcl9w
YWdlKigpCiAgICBjYWxsaW5nIGNoYWluLgoKKiBBZGRlZCB0aGUgSW5maW5pYmFuZCBkcml2ZXIg
YmFjayB0byB0aGUgcGF0Y2ggc2VyaWVzLCBiZWNhdXNlIGl0IGlzCiAgYSBjYWxsZXIgb2YgcHV0
X3VzZXJfcGFnZXNfZGlydHlfbG9jaygpLgoKVW5jaGFuZ2VkIHBhcnRzIGZyb20gdGhlIHYxIGNv
dmVyIGxldHRlciAoZXhjZXB0IGZvciB0aGUgZGlmZnN0YXQpOgoKTm90ZXMgYWJvdXQgdGhlIHJl
bWFpbmluZyBwYXRjaGVzIHRvIGNvbWU6CgpUaGVyZSBhcmUgYWJvdXQgNTArIHBhdGNoZXMgaW4g
bXkgdHJlZSBbMl0sIGFuZCBJJ2xsIGJlIHNlbmRpbmcgb3V0IHRoZQpyZW1haW5pbmcgb25lcyBp
biBhIGZldyBtb3JlIGdyb3VwczoKCiAgICAqIFRoZSBibG9jay9iaW8gcmVsYXRlZCBjaGFuZ2Vz
IChKZXJvbWUgbW9zdGx5IHdyb3RlIHRob3NlLCBidXQgSSd2ZQogICAgICBoYWQgdG8gbW92ZSBz
dHVmZiBhcm91bmQgZXh0ZW5zaXZlbHksIGFuZCBhZGQgYSBsaXR0bGUgY29kZSkKCiAgICAqIG1t
LyBjaGFuZ2VzCgogICAgKiBvdGhlciBzdWJzeXN0ZW0gcGF0Y2hlcwoKICAgICogYW4gUkZDIHRo
YXQgc2hvd3MgdGhlIGN1cnJlbnQgc3RhdGUgb2YgdGhlIHRyYWNraW5nIHBhdGNoIHNldC4gVGhh
dAogICAgICBjYW4gb25seSBiZSBhcHBsaWVkIGFmdGVyIGFsbCBjYWxsIHNpdGVzIGFyZSBjb252
ZXJ0ZWQsIGJ1dCBpdCdzCiAgICAgIGdvb2QgdG8gZ2V0IGFuIGVhcmx5IGxvb2sgYXQgaXQuCgpU
aGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29udmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1p
dCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9kdWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9s
ZGVyIHZlcnNpb25zIikuCgpKb2huIEh1YmJhcmQgKDMpOgogIG1tL2d1cDogYWRkIG1ha2VfZGly
dHkgYXJnIHRvIHB1dF91c2VyX3BhZ2VzX2RpcnR5X2xvY2soKQogIGRyaXZlcnMvZ3B1L2RybS92
aWE6IGNvbnZlcnQgcHV0X3BhZ2UoKSB0byBwdXRfdXNlcl9wYWdlKigpCiAgbmV0L3hkcDogY29u
dmVydCBwdXRfcGFnZSgpIHRvIHB1dF91c2VyX3BhZ2UqKCkKCiBkcml2ZXJzL2dwdS9kcm0vdmlh
L3ZpYV9kbWFibGl0LmMgICAgICAgICAgfCAgMTAgKy0KIGRyaXZlcnMvaW5maW5pYmFuZC9jb3Jl
L3VtZW0uYyAgICAgICAgICAgICB8ICAgNSArLQogZHJpdmVycy9pbmZpbmliYW5kL2h3L2hmaTEv
dXNlcl9wYWdlcy5jICAgIHwgICA1ICstCiBkcml2ZXJzL2luZmluaWJhbmQvaHcvcWliL3FpYl91
c2VyX3BhZ2VzLmMgfCAgMTMgKy0tCiBkcml2ZXJzL2luZmluaWJhbmQvaHcvdXNuaWMvdXNuaWNf
dWlvbS5jICAgfCAgIDUgKy0KIGRyaXZlcnMvaW5maW5pYmFuZC9zdy9zaXcvc2l3X21lbS5jICAg
ICAgICB8ICAxOSArLS0tCiBpbmNsdWRlL2xpbnV4L21tLmggICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgIDUgKy0KIG1tL2d1cC5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
IDExNSArKysrKysrKystLS0tLS0tLS0tLS0KIG5ldC94ZHAveGRwX3VtZW0uYyAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAgOSArLQogOSBmaWxlcyBjaGFuZ2VkLCA2NCBpbnNlcnRpb25zKCsp
LCAxMjIgZGVsZXRpb25zKC0pCgotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
