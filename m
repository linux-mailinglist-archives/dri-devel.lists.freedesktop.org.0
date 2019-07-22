Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AE66F9F2
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 09:08:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E05BD89ACD;
	Mon, 22 Jul 2019 07:08:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33C0C89A76
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 04:30:16 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id r7so16742563pfl.3
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jul 2019 21:30:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JVt6ZsruZdEjCeuPEiZoevmx4LJB3+Wj53DW9JaZ1Yk=;
 b=S/rxLmBy7c/atq8k28zzvRHrORCFG88HCNUpFcqglYNIeB/zmDCcdSHF01TqPuGCuH
 EL98ZWPWKuaR3ULQwZT7ygQ6kUdE1PsXET4lFCEMZi29WRVXNINChe7iUL99eelJgMrj
 C4WthJi0mbzhuPfK62JzfG6sqFWPzhpMUnuJy+WoPsTsDKmwoITQYPq7srxI9sAM6KAt
 95KjA2MRQQWiDKSYahnBCDkK93KLJ6gGUDArxdO1etzAQZ63XhX9cYiOrtfar/Tcr2R/
 SpCOp2piMrFYAiBPFqUp+ewxv0UJc3GkFQJl++YY3YnTtxzcXvbxJWQ9xfVa+5pLAb6k
 jYTQ==
X-Gm-Message-State: APjAAAWReDQRtNDSlX8vmQ9ZuEMuR2cmcovcC1eu/JfmfwSpYhQPrK6H
 Ntc+GDeYXWx7C2Q5Ytoxh2E=
X-Google-Smtp-Source: APXvYqztu+uwlucjHIzVmQ0L57MjZIIjZ2e8k8CcXoJiraVsvVA60l6ON4zhkWJGUUfJVOo89G9VTA==
X-Received: by 2002:a17:90a:e397:: with SMTP id
 b23mr74049775pjz.140.1563769815699; 
 Sun, 21 Jul 2019 21:30:15 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 t96sm34285690pjb.1.2019.07.21.21.30.14
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 21 Jul 2019 21:30:15 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 0/4] put_user_page: new put_user_page_dirty*() helpers
Date: Sun, 21 Jul 2019 21:30:09 -0700
Message-Id: <20190722043012.22945-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Mon, 22 Jul 2019 07:08:15 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JVt6ZsruZdEjCeuPEiZoevmx4LJB3+Wj53DW9JaZ1Yk=;
 b=VOdsVprSu9cGW1iqrmfPQX3xmYU5Z1o9cHF6pOzbJltiYhuYCge33pdD6CwMEXjvNM
 sFi5J1se+WaXJ91/TKlPNrLGUHwxnpIw4qn7UAwShRFJ/W8Nr1RUSKFA7n+45aPr6x5C
 WXA+RxInAR0EH7vDnRS0n0aIDe479ShZenlcHSFgtmJCj4AKpuj0qM5VYVp+YAGkHdwE
 O4cIZ7alr6idAM7ATqKQj8tHNYN+A4KH9dTbPVf+Boq9vCTQQ+AaVmGwBppTWRbLCXxn
 GvquR0RX9Yva+IepmKTElD2ekCLJhgD/84GbCKePJ9GNR9JpwzZV3DJPl7z/yc4lJjwJ
 ABng==
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

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKSGksCgpIZXJlIGlzIHRo
ZSBmaXJzdCBzbWFsbCBiYXRjaCBvZiBjYWxsIHNpdGUgY29udmVyc2lvbnMgZm9yIHB1dF9wYWdl
KCkKdG8gcHV0X3VzZXJfcGFnZSgpLgoKVGhpcyBiYXRjaCBpbmNsdWRlcyBzb21lLCBidXQgbm90
IGFsbCBvZiB0aGUgcGxhY2VzIHRoYXQgYmVuZWZpdCBmcm9tIHRoZQp0d28gbmV3IHB1dF91c2Vy
X3BhZ2VfZGlydHkqKCkgaGVscGVyIGZ1bmN0aW9ucy4gKFRoZSBvcmRlcmluZyBvZiBjYWxsIHNp
dGUKY29udmVyc2lvbiBwYXRjaCBzdWJtaXNzaW9uIG1ha2VzIGl0IGJldHRlciB0byB3YWl0IHVu
dGlsIGxhdGVyLCB0byBjb252ZXJ0CnRoZSByZXN0LikKClRoZXJlIGFyZSBhYm91dCA1MCsgcGF0
Y2hlcyBpbiBteSB0cmVlIFsxXSwgYW5kIEknbGwgYmUgc2VuZGluZyBvdXQgdGhlCnJlbWFpbmlu
ZyBvbmVzIGluIGEgZmV3IG1vcmUgZ3JvdXBzOgoKICAgICogVGhlIGJsb2NrL2JpbyByZWxhdGVk
IGNoYW5nZXMgKEplcm9tZSBtb3N0bHkgd3JvdGUgdGhvc2UsIGJ1dCBJJ3ZlCiAgICAgIGhhZCB0
byBtb3ZlIHN0dWZmIGFyb3VuZCBleHRlbnNpdmVseSwgYW5kIGFkZCBhIGxpdHRsZSBjb2RlKQoK
ICAgICogbW0vIGNoYW5nZXMKCiAgICAqIG90aGVyIHN1YnN5c3RlbSBwYXRjaGVzCgogICAgKiBh
biBSRkMgdGhhdCBzaG93cyB0aGUgY3VycmVudCBzdGF0ZSBvZiB0aGUgdHJhY2tpbmcgcGF0Y2gg
c2V0LiBUaGF0CiAgICAgIGNhbiBvbmx5IGJlIGFwcGxpZWQgYWZ0ZXIgYWxsIGNhbGwgc2l0ZXMg
YXJlIGNvbnZlcnRlZCwgYnV0IGl0J3MKICAgICAgZ29vZCB0byBnZXQgYW4gZWFybHkgbG9vayBh
dCBpdC4KClRoaXMgaXMgcGFydCBhIHRyZWUtd2lkZSBjb252ZXJzaW9uLCBhcyBkZXNjcmliZWQg
aW4gY29tbWl0IGZjMWQ4ZTdjY2EyZAooIm1tOiBpbnRyb2R1Y2UgcHV0X3VzZXJfcGFnZSooKSwg
cGxhY2Vob2xkZXIgdmVyc2lvbnMiKS4KClsxXSBodHRwczovL2dpdGh1Yi5jb20vam9obmh1YmJh
cmQvbGludXgvdHJlZS9ndXBfZG1hX2NvcmUKCkpvaG4gSHViYmFyZCAoNCk6CiAgZHJpdmVycy9n
cHUvZHJtL3ZpYTogY29udmVydCBwdXRfcGFnZSgpIHRvIHB1dF91c2VyX3BhZ2UqKCkKICBuZXQv
eGRwOiBjb252ZXJ0IHB1dF9wYWdlKCkgdG8gcHV0X3VzZXJfcGFnZSooKQogIG5ldC9yZHM6IGNv
bnZlcnQgcHV0X3BhZ2UoKSB0byBwdXRfdXNlcl9wYWdlKigpCiAgZ3VwOiBuZXcgcHV0X3VzZXJf
cGFnZV9kaXJ0eSooKSBoZWxwZXJzCgogZHJpdmVycy9ncHUvZHJtL3ZpYS92aWFfZG1hYmxpdC5j
ICAgICAgICB8ICA1ICsrKy0tCiBkcml2ZXJzL2luZmluaWJhbmQvY29yZS91bWVtLmMgICAgICAg
ICAgIHwgIDIgKy0KIGRyaXZlcnMvaW5maW5pYmFuZC9ody91c25pYy91c25pY191aW9tLmMgfCAg
MiArLQogaW5jbHVkZS9saW51eC9tbS5oICAgICAgICAgICAgICAgICAgICAgICB8IDEwICsrKysr
KysrKysKIG5ldC9yZHMvaW5mby5jICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNSArKy0t
LQogbmV0L3Jkcy9tZXNzYWdlLmMgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCiBuZXQv
cmRzL3JkbWEuYyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMTUgKysrKysrKy0tLS0tLS0t
CiBuZXQveGRwL3hkcF91bWVtLmMgICAgICAgICAgICAgICAgICAgICAgIHwgIDMgKy0tCiA4IGZp
bGVzIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQoKLS0gCjIuMjIu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
