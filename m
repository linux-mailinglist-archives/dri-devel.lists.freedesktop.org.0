Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4FE82111
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 18:03:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 350F76E4BA;
	Mon,  5 Aug 2019 16:03:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 988056E4BA;
 Mon,  5 Aug 2019 16:03:16 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id c3so16739371pfa.13;
 Mon, 05 Aug 2019 09:03:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7x08fTlAtcnJHaKw1+e2ULk6svbbNjTrbJD6jGnKHoU=;
 b=LJd2Cou+AmCS9IGGEn9HFqc5ZUuYs0I2gPlJ5ebO0484DYlGnjCzhhLuJgOlb2L3xR
 vSlGtF2Qe0ZgJCboi1893QemPG348jna7MzsoXqpoCXKXw/cXJBiNINeT/740loMY0fo
 XIBrepSKchAtIyEGvL/YlQV+MGp/PvX/RWiLpPEq1meYI5jT4ooHz/4bWVZoV95s01N/
 Cy+dSmL5h5F+ePD0p9M7yLHlKB4pQH4hNqX6pYl0KCpkTjI/399ars7LARfWghrZVMnC
 HFQG+1NRJnFgQ2uNYFh6iP3w+Nx/1i4mTEGHq9spzQ6JfHpglg4WndvsfOpzyW/yVheF
 yDDQ==
X-Gm-Message-State: APjAAAXJD7fJUq/PUvPWkSSpTlkgf+o5PKVtB5y91Cs/hUhkuU6a7068
 CVGwR+EQ+Gixts/4ysgw9aI=
X-Google-Smtp-Source: APXvYqwlHzkEPNzjitM9BToseCozyRr+rvToOJ8jvZ3PWs8FMHpCuKXerfW7x1RWyGNI8w806urviA==
X-Received: by 2002:a17:90b:d8f:: with SMTP id
 bg15mr18692229pjb.65.1565020996027; 
 Mon, 05 Aug 2019 09:03:16 -0700 (PDT)
Received: from localhost.localdomain ([121.137.63.184])
 by smtp.gmail.com with ESMTPSA id n98sm17061262pjc.26.2019.08.05.09.03.11
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 09:03:15 -0700 (PDT)
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 David Howells <dhowells@redhat.com>, Christoph Hellwig <hch@lst.de>
Subject: [PATCHv2 0/3] convert i915 to new mount API
Date: Tue,  6 Aug 2019 01:03:04 +0900
Message-Id: <20190805160307.5418-1-sergey.senozhatsky@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7x08fTlAtcnJHaKw1+e2ULk6svbbNjTrbJD6jGnKHoU=;
 b=LXIe/by2g8kAwhGpudayPYt5k4zTt+DTH7eiJZJUVf2itRT6HQq4sn4Ws3xaPHxVRD
 xv7xHYX47Okgaw/wFYmtEptJBEoLWieQBcyqgIIJaa1D2ZDdLPXJcYaM4jLrJb/ZV+RH
 L7rARzY6mu2H7isDPRKcCQdsj6qwz3EQS9zkFNx9jzV4DlNETmF5nYwv2ex4Rd+tybu9
 d5n7+iZJhlfDD3c9IN8ovsJgXXBzRqYCgszYSKQHqy2lUEiWy0WNOTQBsBtXA7igWoeG
 kYhvQcOQlOdvTtmJV5l2qLr8ZyP/ioVuDaWoCK7X3o/PvNE//bSDgGgZa92yiUi4OUko
 sqNw==
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CUhlbGxvLAoKQ29udmVydCBpOTE1IHRvIGEgbmV3IG1vdW50IEFQSSBhbmQgZml4IGk5MTVfZ2Vt
ZnNfaW5pdCgpIGtlcm5lbCBPb3BzLgoKSXQgYWxzbyBhcHBlYXJzIHRoYXQgd2UgbmVlZCB0byBF
WFBPUlRzIHB1dF9maWxlc3lzdGVtKCksIHNvIGk5MTUKY2FuIHByb3Blcmx5IHB1dCBmaWxlc3lz
dGVtIGFmdGVyIGl0IGlzIGRvbmUgd2l0aCBrZXJuX21vdW50KCkuCgp2MjoKLSBleHBvcnQgcHV0
X2ZpbGVzeXN0ZW0oKSBbQ2hyaXNdCi0gYWx3YXlzIHB1dF9maWxlc3lzdGVtKCkgaW4gaTkxNV9n
ZW1mc19pbml0KCkgW0NocmlzXQotIGltcHJvdmUgaTkxNV9nZW1mc19pbml0KCkgZXJyb3IgbWVz
c2FnZSBbQ2hyaXNdCgpTZXJnZXkgU2Vub3poYXRza3kgKDMpOgogIGZzOiBleHBvcnQgcHV0X2Zp
bGVzeXN0ZW0oKQogIGk5MTU6IGNvbnZlcnQgdG8gbmV3IG1vdW50IEFQSQogIGk5MTU6IGRvIG5v
dCBsZWFrIG1vZHVsZSByZWYgY291bnRlcgoKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1
X2dlbWZzLmMgfCAzMyArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0KIGZzL2ZpbGVzeXN0ZW1z
LmMgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDI1IGluc2Vy
dGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
