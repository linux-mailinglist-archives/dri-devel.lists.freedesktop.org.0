Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA147EEBF
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:19:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C7476ECFD;
	Fri,  2 Aug 2019 08:19:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E2656E842
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 23:47:40 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id f17so30968213pfn.6
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Aug 2019 16:47:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Vg4QzQ/7F17W/rUghukJhcqs5s9RAye4AZfxR//QV0o=;
 b=K/BdaaBrcWSImanrVKLH1DWoky/z7Rb8DaK1q/3rLEJ7jg6wPfhElsxf9hNrXnMX/5
 KOT/vdjBZ1MbmqT3LjI5Nr3p5y0x0t9+++k1SPQx/P4m226JgeeDrsAejUamepM/I3CS
 +rXw0qaAmfQsBz/M2/zlacGSng3srRDgDNkQd5MLGlcb7Nzj1jHu9grHcH0rswycTlfJ
 c1Qg7PZfhx/qtUlOCpigmN+1IccXHqMfco2PfzoFH/SCX8WxlIl8M5iDuhjY/q2cVOjt
 7bIkU5XmmA0py16YBFLNz7YgwUUUmSbCzfguTsUmkNTu0Qet+HtgdhEhJFYCpZmZ+N/e
 A17A==
X-Gm-Message-State: APjAAAUdy9mGf4Yp/BSffGwZXty+uu5iH/yzzyiQFINFlwWFKLNP/8Tk
 N43nQyoAWvHtFD5XSbyEauE=
X-Google-Smtp-Source: APXvYqwHoHG6JQ3jRjRVySMONqToxLBPphS71bd0Tygq+HVgAHEylGaHC3u+H2i9mxt915ePZzuW3w==
X-Received: by 2002:a63:e5a:: with SMTP id 26mr117179570pgo.3.1564703259868;
 Thu, 01 Aug 2019 16:47:39 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 q7sm79090792pff.2.2019.08.01.16.47.37
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 16:47:38 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v5 0/3] mm/gup: add make_dirty arg to
 put_user_pages_dirty_lock()
Date: Thu,  1 Aug 2019 16:47:32 -0700
Message-Id: <20190801234735.2149-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Fri, 02 Aug 2019 08:19:03 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Vg4QzQ/7F17W/rUghukJhcqs5s9RAye4AZfxR//QV0o=;
 b=VXApa2bKtU/+qjnj54No4w9jeBNCs/2ouRrzJwhVcI9bqY8FfV+lWiNYwbsicvbOdl
 gMkx/W/bNkCq+wNmaOVEypvcnQYCBpMtS63geb51KtbNv6tA5o8AavZ/OkslLikGEpN7
 TZ6jcPk7YupGsAob95DLycEHEidCNCO3vJMcSsJfyWJdg5s82DlsF0VMt6NkiZ36SD/y
 ewsev+xHhO4YL7/M/T3jKGSqWEQRwKTVpHkem9aFrBpI2POpX89SLC42HKEqRQxV6KlB
 XyXV7Rr5gxVbGs2rlTCzOJkRGFi8/OkuUi2i3rMP7bEQkC5KSNXB3wChRcRIy1jl586G
 iecw==
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
NDoKCiogQ2hyaXN0b3BoZSBIZWxsd2lnJ3MgcmV2aWV3IGFwcGxpZWQ6IGRlbGV0ZWQgc2l3X2Zy
ZWVfcGxpc3QoKSBhbmQKICBfX3FpYl9yZWxlYXNlX3VzZXJfcGFnZXMoKSwgbm93IHRoYXQgcHV0
X3VzZXJfcGFnZXNfZGlydHlfbG9jaygpIGRvZXMKICB3aGF0IHRob3NlIHJvdXRpbmVzIHdlcmUg
ZG9pbmcuCgoqIEFwcGxpZWQgQmpvcm4ncyBBQ0sgZm9yIG5ldC94ZHAsIGFuZCBDaHJpc3RvcGhl
J3MgUmV2aWV3ZWQtYnkgZm9yIHBhdGNoCiAgIzEuCgpDaGFuZ2VzIHNpbmNlIHYzOgoKKiBGaXhl
ZCBhbiB1bnVzZWQgdmFyaWFibGUgd2FybmluZyBpbiBzaXdfbWVtLmMKCkNoYW5nZXMgc2luY2Ug
djI6CgoqIENyaXRpY2FsIGJ1ZyBmaXg6IHJlbW92ZSBhIHN0cmF5ICJicmVhazsiIGZyb20gdGhl
IG5ldyByb3V0aW5lLgoKQ2hhbmdlcyBzaW5jZSB2MToKCiogSW5zdGVhZCBvZiBwcm92aWRpbmcg
X19wdXRfdXNlcl9wYWdlcygpLCBhZGQgYW4gYXJndW1lbnQgdG8KICBwdXRfdXNlcl9wYWdlc19k
aXJ0eV9sb2NrKCksIGFuZCBkZWxldGUgcHV0X3VzZXJfcGFnZXNfZGlydHkoKS4KICBUaGlzIGlz
IGJhc2VkIG9uIHRoZSBmb2xsb3dpbmcgcG9pbnRzOgoKICAgIDEuIExvdHMgb2YgY2FsbCBzaXRl
cyBiZWNvbWUgc2ltcGxlciBpZiBhIGJvb2wgaXMgcGFzc2VkCiAgICBpbnRvIHB1dF91c2VyX3Bh
Z2UqKCksIGluc3RlYWQgb2YgbWFraW5nIHRoZSBjYWxsIHNpdGUKICAgIGNob29zZSB3aGljaCBw
dXRfdXNlcl9wYWdlKigpIHZhcmlhbnQgdG8gY2FsbC4KCiAgICAyLiBDaHJpc3RvcGggSGVsbHdp
ZydzIG9ic2VydmF0aW9uIHRoYXQgc2V0X3BhZ2VfZGlydHlfbG9jaygpCiAgICBpcyB1c3VhbGx5
IGNvcnJlY3QsIGFuZCBzZXRfcGFnZV9kaXJ0eSgpIGlzIHVzdWFsbHkgYQogICAgYnVnLCBvciBh
dCBsZWFzdCBxdWVzdGlvbmFibGUsIHdpdGhpbiBhIHB1dF91c2VyX3BhZ2UqKCkKICAgIGNhbGxp
bmcgY2hhaW4uCgoqIEFkZGVkIHRoZSBJbmZpbmliYW5kIGRyaXZlciBiYWNrIHRvIHRoZSBwYXRj
aCBzZXJpZXMsIGJlY2F1c2UgaXQgaXMKICBhIGNhbGxlciBvZiBwdXRfdXNlcl9wYWdlc19kaXJ0
eV9sb2NrKCkuCgpVbmNoYW5nZWQgcGFydHMgZnJvbSB0aGUgdjEgY292ZXIgbGV0dGVyIChleGNl
cHQgZm9yIHRoZSBkaWZmc3RhdCk6CgpOb3RlcyBhYm91dCB0aGUgcmVtYWluaW5nIHBhdGNoZXMg
dG8gY29tZToKClRoZXJlIGFyZSBhYm91dCA1MCsgcGF0Y2hlcyBpbiBteSB0cmVlIFsyXSwgYW5k
IEknbGwgYmUgc2VuZGluZyBvdXQgdGhlCnJlbWFpbmluZyBvbmVzIGluIGEgZmV3IG1vcmUgZ3Jv
dXBzOgoKICAgICogVGhlIGJsb2NrL2JpbyByZWxhdGVkIGNoYW5nZXMgKEplcm9tZSBtb3N0bHkg
d3JvdGUgdGhvc2UsIGJ1dCBJJ3ZlCiAgICAgIGhhZCB0byBtb3ZlIHN0dWZmIGFyb3VuZCBleHRl
bnNpdmVseSwgYW5kIGFkZCBhIGxpdHRsZSBjb2RlKQoKICAgICogbW0vIGNoYW5nZXMKCiAgICAq
IG90aGVyIHN1YnN5c3RlbSBwYXRjaGVzCgogICAgKiBhbiBSRkMgdGhhdCBzaG93cyB0aGUgY3Vy
cmVudCBzdGF0ZSBvZiB0aGUgdHJhY2tpbmcgcGF0Y2ggc2V0LiBUaGF0CiAgICAgIGNhbiBvbmx5
IGJlIGFwcGxpZWQgYWZ0ZXIgYWxsIGNhbGwgc2l0ZXMgYXJlIGNvbnZlcnRlZCwgYnV0IGl0J3MK
ICAgICAgZ29vZCB0byBnZXQgYW4gZWFybHkgbG9vayBhdCBpdC4KClRoaXMgaXMgcGFydCBhIHRy
ZWUtd2lkZSBjb252ZXJzaW9uLCBhcyBkZXNjcmliZWQgaW4gY29tbWl0IGZjMWQ4ZTdjY2EyZAoo
Im1tOiBpbnRyb2R1Y2UgcHV0X3VzZXJfcGFnZSooKSwgcGxhY2Vob2xkZXIgdmVyc2lvbnMiKS4K
CgoKSm9obiBIdWJiYXJkICgzKToKICBtbS9ndXA6IGFkZCBtYWtlX2RpcnR5IGFyZyB0byBwdXRf
dXNlcl9wYWdlc19kaXJ0eV9sb2NrKCkKICBkcml2ZXJzL2dwdS9kcm0vdmlhOiBjb252ZXJ0IHB1
dF9wYWdlKCkgdG8gcHV0X3VzZXJfcGFnZSooKQogIG5ldC94ZHA6IGNvbnZlcnQgcHV0X3BhZ2Uo
KSB0byBwdXRfdXNlcl9wYWdlKigpCgogZHJpdmVycy9ncHUvZHJtL3ZpYS92aWFfZG1hYmxpdC5j
ICAgICAgICAgIHwgIDEwICstCiBkcml2ZXJzL2luZmluaWJhbmQvY29yZS91bWVtLmMgICAgICAg
ICAgICAgfCAgIDUgKy0KIGRyaXZlcnMvaW5maW5pYmFuZC9ody9oZmkxL3VzZXJfcGFnZXMuYyAg
ICB8ICAgNSArLQogZHJpdmVycy9pbmZpbmliYW5kL2h3L3FpYi9xaWJfdXNlcl9wYWdlcy5jIHwg
IDEzICstLQogZHJpdmVycy9pbmZpbmliYW5kL2h3L3VzbmljL3VzbmljX3Vpb20uYyAgIHwgICA1
ICstCiBkcml2ZXJzL2luZmluaWJhbmQvc3cvc2l3L3Npd19tZW0uYyAgICAgICAgfCAgMTggKy0t
LQogaW5jbHVkZS9saW51eC9tbS5oICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA1ICstCiBt
bS9ndXAuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxMTUgKysrKysrKysr
LS0tLS0tLS0tLS0tCiBuZXQveGRwL3hkcF91bWVtLmMgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgIDkgKy0KIDkgZmlsZXMgY2hhbmdlZCwgNjMgaW5zZXJ0aW9ucygrKSwgMTIyIGRlbGV0aW9u
cygtKQoKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
