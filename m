Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE58323A2
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jun 2019 17:00:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 502D489211;
	Sun,  2 Jun 2019 15:00:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99E3F89970;
 Sun,  2 Jun 2019 14:13:36 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id s11so9023359pfm.12;
 Sun, 02 Jun 2019 07:13:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g8nhw207JO81aJGXpFM+zIRwmOM/AtNu4yX4je0sw18=;
 b=BFSxq8CPOaiauD3qrqlsFXX7u4tWY49AqF641RE5I5uWywR2TDRuB5kEnStdZaBJqi
 LXNa5eeoqRoCVMpA/4zvOp2PTgV4olqyA1KCEhz+kGVcxuWtnev0wFtCxLYUte5rRlzd
 nSJj5qWDDKnaY2N5jgMM/SW0ngTYhJcE/wRte9gbiPOp+9BbZuwisqQBUBQPDn7NaxfP
 RSFe/QIb2pYlB7Wg79BNn9jXJEUNpAIe6NrPocwZ6sCsP+738xjda029C9f02Bu2aGW5
 fgIIzh6Vqqc67WfAQgfPISvWqaZfjMk14AWorZy90Zz8ZtTw7Z+PAChfUfnzGeeboSeV
 hpTA==
X-Gm-Message-State: APjAAAU0NWoPkPFPTlwb4krB4jBervFkqSX9Ew9wGJQAUmWPqThRFk6i
 SGNpQjUr9lY1ppwEOpG4HP+zDrtXGgs=
X-Google-Smtp-Source: APXvYqzEo+/2XW6GYocCFk4l/IkSto/Y+dKiPwCtbIjs84SIUImKPoLTDmVMAoTIiAmAGjmzqvS4GQ==
X-Received: by 2002:a63:788a:: with SMTP id t132mr22575882pgc.52.1559484816231; 
 Sun, 02 Jun 2019 07:13:36 -0700 (PDT)
Received: from localhost.localdomain
 (119-18-21-111.771215.syd.nbn.aussiebb.net. [119.18.21.111])
 by smtp.gmail.com with ESMTPSA id x66sm12533278pfx.139.2019.06.02.07.13.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 02 Jun 2019 07:13:35 -0700 (PDT)
From: Rhys Kidd <rhyskidd@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH 1/2] drm/nouveau/bios/init: handle INIT_RESET_BEGUN devinit
 opcode
Date: Mon,  3 Jun 2019 00:13:14 +1000
Message-Id: <20190602141315.6197-2-rhyskidd@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190602141315.6197-1-rhyskidd@gmail.com>
References: <20190602141315.6197-1-rhyskidd@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 02 Jun 2019 15:00:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g8nhw207JO81aJGXpFM+zIRwmOM/AtNu4yX4je0sw18=;
 b=mK08QkHS2dCObF9/dRfSwzI9Ll32nymYjdUCb8rbTWsioyWBtdIv/IUAPmCa3M2CqV
 G9M8NsIa/WNcXMjO2nXbgNFVQeo2wZx/dofGNKqWkx+jZrrATV4MM9w2/s5f0jtblbs0
 q1rldY15ERkqEIsePvMnyWdjQZ0sYZASvIay+tRVqO4cfBUxn1hwMxc1syBcaTCIB3pY
 hQqwUhh9T/CdsdoyomOr9QFbb28VzsLgb6kSf1LgqRiIrwD/nixxXTDtep0ljbdsmc3L
 9nmVfsmHgHY3gUrHClDI91nnNKKDoWYKfqDA+evTqs/wRR72Fo5XbvRpGdFgN14wh+YJ
 7URA==
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
Cc: Rhys Kidd <rhyskidd@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2lnbmFsIHRoYXQgdGhlIHJlc2V0IHNlcXVlbmNlIGhhcyBiZWd1bi4KClRoaXMgb3Bjb2RlIHNp
Z25hbHMgdGhhdCB0aGUgc29mdHdhcmUgcmVzZXQgc2VxdWVuY2UgaGFzIGJlZ3VuLgpPcmRpbmFy
aWx5LCBubyBhY3R1YWwgb3BlcmF0aW9ucyBhcmUgcGVyZm9ybWVkIGJ5IHRoZSBvcGNvZGUuCkhv
d2V2ZXIgaXQgYWxsb3dzIGZvciBwb3NzaWJsZSBzb2Z0d2FyZSB3b3JrIGFyb3VuZHMgYnkgZGV2
aW5pdAplbmdpbmVzIGluIHNvZnR3YXJlIGFnZW50cyBvdGhlciB0aGFuIHRoZSBWQklPUywgc3Vj
aCBhcyB0aGUgcmVzbWFuLApGQ09ERSwgYW5kIEVGSSBkcml2ZXIuCgpTaWduZWQtb2ZmLWJ5OiBS
aHlzIEtpZGQgPHJoeXNraWRkQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9udmttL3N1YmRldi9iaW9zL2luaXQuYyB8IDEzICsrKysrKysrKysrKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvYmlvcy9pbml0LmMgYi9kcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9udmttL3N1YmRldi9iaW9zL2luaXQuYwppbmRleCBlYzBlOWY3MjI0YjUuLmE1
NGI1ZTQxMGRjZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJk
ZXYvYmlvcy9pbml0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYv
Ymlvcy9pbml0LmMKQEAgLTE5MzQsNiArMTkzNCwxNyBAQCBpbml0X3JhbV9yZXN0cmljdF9wbGwo
c3RydWN0IG52Ymlvc19pbml0ICppbml0KQogCX0KIH0KIAorLyoqCisgKiBJTklUX1JFU0VUX0JF
R1VOIC0gb3Bjb2RlIDB4OGMKKyAqCisgKi8KK3N0YXRpYyB2b2lkCitpbml0X3Jlc2V0X2JlZ3Vu
KHN0cnVjdCBudmJpb3NfaW5pdCAqaW5pdCkKK3sKKwl0cmFjZSgiUkVTRVRfQkVHVU5cbiIpOwor
CWluaXQtPm9mZnNldCArPSAxOworfQorCiAvKioKICAqIElOSVRfR1BJTyAtIG9wY29kZSAweDhl
CiAgKgpAQCAtMjI2MCw3ICsyMjcxLDcgQEAgc3RhdGljIHN0cnVjdCBudmJpb3NfaW5pdF9vcGNv
ZGUgewogCVsweDc5XSA9IHsgaW5pdF9wbGwgfSwKIAlbMHg3YV0gPSB7IGluaXRfem1fcmVnIH0s
CiAJWzB4ODddID0geyBpbml0X3JhbV9yZXN0cmljdF9wbGwgfSwKLQlbMHg4Y10gPSB7IGluaXRf
cmVzZXJ2ZWQgfSwKKwlbMHg4Y10gPSB7IGluaXRfcmVzZXRfYmVndW4gfSwKIAlbMHg4ZF0gPSB7
IGluaXRfcmVzZXJ2ZWQgfSwKIAlbMHg4ZV0gPSB7IGluaXRfZ3BpbyB9LAogCVsweDhmXSA9IHsg
aW5pdF9yYW1fcmVzdHJpY3Rfem1fcmVnX2dyb3VwIH0sCi0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
