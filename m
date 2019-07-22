Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 583B16F9F7
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 09:08:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E506D89B62;
	Mon, 22 Jul 2019 07:08:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4222089A76
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 04:30:17 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id k8so18584220plt.3
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jul 2019 21:30:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WbaMzabtgu3hCeOMPX09tru106PZHAIJnqruZQI71c8=;
 b=sw3kolf+epe+hkbfpsy4+0o7b3EQLFoU3ZrDBSL6mo14SHrtLfbiWiNlRQ1Sv1R6SA
 g4Oh/BeTrvir5fGO/DM9hyfkCYjCsHMQBxACRNx9QOdU60ZLDlzhC2VX093n7a0qGLTq
 EcRtcWyDXxQLbi928BRadQc2+zAGgQaPueyUWnVZsh8enYgI6DgLmcFH0GJYf9aCdbW6
 EPEIQDmqzNQsmjPQ1cGvYyT08QifJaSZiZRIJ0WSCKdpzYAPSP3yPALOFJTVUBYN0JL2
 2BQovfvM/WnTr14gy/3IxdTEA9DQ7rv/MdrAml18R1bETAiywKSXmox/majVFP5AlzIR
 P6sw==
X-Gm-Message-State: APjAAAXVqynDyFi76grt/XwfsltKYAuEXlIzAqiE+sLCnhZ/l6kvrGYs
 YUift/nnZdxtpwHdNpNfwZw=
X-Google-Smtp-Source: APXvYqyKR4WrwxhhqPsiCdGlG1x0qIsswj14hIfFs7IMQOgAz1KccUwekZlyy0ZSOgH/yneXklBTJA==
X-Received: by 2002:a17:902:ac87:: with SMTP id
 h7mr75701953plr.36.1563769816971; 
 Sun, 21 Jul 2019 21:30:16 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 t96sm34285690pjb.1.2019.07.21.21.30.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 21 Jul 2019 21:30:16 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 1/3] drivers/gpu/drm/via: convert put_page() to
 put_user_page*()
Date: Sun, 21 Jul 2019 21:30:10 -0700
Message-Id: <20190722043012.22945-2-jhubbard@nvidia.com>
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
 bh=WbaMzabtgu3hCeOMPX09tru106PZHAIJnqruZQI71c8=;
 b=p3HGgaINx4UXmNtxMRxq9ZG6NzncIA85CDVJwUAyirDvW3yCo2di+TLZl5eFlPnNmI
 tKBmRpm/+GE33EtGsFzwMuLEx975vOoVhficjaLeRIsopct9Hcl7v/XU1KBwOEf2xMZN
 BHRmQquzbiIcI70dnx/HawsVNNS5fDl4FFWtUv/EmNTaCRi74oUprzweRieVqW1lCakX
 xGU3Yfp0T2yQHASWYcYkRONsVHYAjwfmIRSdrvV1yxpWlXG/IgI4pD2tDC41W7YDhh8Y
 2xv+vtpzYgX36LzrXQsbqLPBzjZi80AqFoHhWGNEYVEtoMdLjAhgYaYrgI/kXAfMuWv+
 Cbsw==
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
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpDYzogRGF2aWQg
QWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xs
LmNoPgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBK
b2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3Zp
YS92aWFfZG1hYmxpdC5jIHwgNSArKystLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmlhL3ZpYV9k
bWFibGl0LmMgYi9kcml2ZXJzL2dwdS9kcm0vdmlhL3ZpYV9kbWFibGl0LmMKaW5kZXggMDYyMDY3
NDM4ZjFkLi4yMTk4MjdhZTExNGYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92aWEvdmlh
X2RtYWJsaXQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdmlhL3ZpYV9kbWFibGl0LmMKQEAgLTE4
OSw4ICsxODksOSBAQCB2aWFfZnJlZV9zZ19pbmZvKHN0cnVjdCBwY2lfZGV2ICpwZGV2LCBkcm1f
dmlhX3NnX2luZm9fdCAqdnNnKQogCQlmb3IgKGkgPSAwOyBpIDwgdnNnLT5udW1fcGFnZXM7ICsr
aSkgewogCQkJaWYgKE5VTEwgIT0gKHBhZ2UgPSB2c2ctPnBhZ2VzW2ldKSkgewogCQkJCWlmICgh
UGFnZVJlc2VydmVkKHBhZ2UpICYmIChETUFfRlJPTV9ERVZJQ0UgPT0gdnNnLT5kaXJlY3Rpb24p
KQotCQkJCQlTZXRQYWdlRGlydHkocGFnZSk7Ci0JCQkJcHV0X3BhZ2UocGFnZSk7CisJCQkJCXB1
dF91c2VyX3BhZ2VzX2RpcnR5KCZwYWdlLCAxKTsKKwkJCQllbHNlCisJCQkJCXB1dF91c2VyX3Bh
Z2UocGFnZSk7CiAJCQl9CiAJCX0KIAkJLyogZmFsbCB0aHJvdWdoICovCi0tIAoyLjIyLjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
