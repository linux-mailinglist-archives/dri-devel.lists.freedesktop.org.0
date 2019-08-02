Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0B77EEB7
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:19:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3812F6ECF7;
	Fri,  2 Aug 2019 08:19:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 875CB6E865;
 Fri,  2 Aug 2019 02:20:21 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id t14so32989926plr.11;
 Thu, 01 Aug 2019 19:20:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fEUR/G5OnJcefSlX4AYJWWcgqHhC+JXxEofDOG22P/4=;
 b=umcgNJ9FTXrfmDpD4FsjBHdk3pTWE9riRKoI3sRZb/mw4BJfKYQVkghCzubMsSFRK7
 NDIcMKRc4BKO/JAobl1XEUe3gqFj7Kv2bGbrS6NRav4s4KNBhLX038AR8m8k1nkSZQ/q
 fr8a5dYVo3lfvGbA1jtLfq2aydBAOqGkTEqA3oJuiO8nfMCdAa1RarwwiypnmMZS5OTo
 JjbJu4jdKjCYaUgluozEgycuczz0Aei+Qovr1m2FcvlsXOwN4tjvnpv26grXRcJjGIvJ
 5NlJ274cWd+0aqfuZaDSfGZRI7n9v33+SjhU5yHjN0kHFlFRDYikehVF3/UwUa1jXt6O
 lvHQ==
X-Gm-Message-State: APjAAAWg3Q5WvBCxlUpPzwSOHO2tlSwZVps+hFh4bcvRU25c12v6oMkc
 hEHZ+ps+YzV4E7DFB8aMuQw=
X-Google-Smtp-Source: APXvYqx7CDlh0PC+iGQbvpFabXIK4hA95kcB6ECyCRgjU7tdLEhAXCZnA9jGvinS59yHHVq1pirulQ==
X-Received: by 2002:a17:902:a409:: with SMTP id
 p9mr130268364plq.218.1564712421229; 
 Thu, 01 Aug 2019 19:20:21 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u9sm38179744pgc.5.2019.08.01.19.20.19
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 19:20:20 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 06/34] drm/i915: convert put_page() to put_user_page*()
Date: Thu,  1 Aug 2019 19:19:37 -0700
Message-Id: <20190802022005.5117-7-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802022005.5117-1-jhubbard@nvidia.com>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Fri, 02 Aug 2019 08:19:03 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fEUR/G5OnJcefSlX4AYJWWcgqHhC+JXxEofDOG22P/4=;
 b=ZjBIvPI6FGYYuQaoM3wYb6xPjNep6A1qdBgLoxOD+angQDRZC9mN7qZBiGsA4x1Mmk
 DVp0b1Fq3km/l8LFUFJZZReS797zF2kYF9KrMWUllVa8HFfcUrM1hAE1P/qQjXzrMnOX
 JxD/xFl+WZHXSEuAGF9iElPEIqC+TRo873joNlnRMAHY9AMqSmLW3nsU27bTpXhcFKV6
 4LeM2yIf45e6IoMit2yX6aFzmLhkspb/EkG8Tlqf3bZNN4WeHI7tMYFctQdF6liMtwoJ
 IvfT9HS49sxx2bYOPNOBswTMjccuTwXWnzyhwEMT1ktty7/Al6mbgY/88Wt++RCGQUor
 cVVw==
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
Cc: linux-fbdev@vger.kernel.org, Jan Kara <jack@suse.cz>, kvm@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Hansen <dave.hansen@linux.intel.com>,
 Dave Chinner <david@fromorbit.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, sparclinux@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, ceph-devel@vger.kernel.org,
 devel@driverdev.osuosl.org, rds-devel@oss.oracle.com,
 linux-rdma@vger.kernel.org, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 intel-gfx@lists.freedesktop.org, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-xfs@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpOb3RlIHRoYXQg
dGhpcyBlZmZlY3RpdmVseSBjaGFuZ2VzIHRoZSBjb2RlJ3MgYmVoYXZpb3IgaW4KaTkxNV9nZW1f
dXNlcnB0cl9wdXRfcGFnZXMoKTogaXQgbm93IGNhbGxzIHNldF9wYWdlX2RpcnR5X2xvY2soKSwK
aW5zdGVhZCBvZiBzZXRfcGFnZV9kaXJ0eSgpLiBUaGlzIGlzIHByb2JhYmx5IG1vcmUgYWNjdXJh
dGUuCgpBcyBDaHJpc3RvcGhlIEhlbGx3aWcgcHV0IGl0LCAic2V0X3BhZ2VfZGlydHkoKSBpcyBv
bmx5IHNhZmUgaWYgd2UgYXJlCmRlYWxpbmcgd2l0aCBhIGZpbGUgYmFja2VkIHBhZ2Ugd2hlcmUg
d2UgaGF2ZSByZWZlcmVuY2Ugb24gdGhlIGlub2RlIGl0CmhhbmdzIG9mZi4iIFsxXQoKWzFdIGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAxOTA3MjMxNTM2NDAuR0I3MjBAbHN0LmRlCgpDYzog
SmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGxpbnV4LmludGVsLmNvbT4KQ2M6IEpvb25hcyBMYWh0
aW5lbiA8am9vbmFzLmxhaHRpbmVuQGxpbnV4LmludGVsLmNvbT4KQ2M6IFJvZHJpZ28gVml2aSA8
cm9kcmlnby52aXZpQGludGVsLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5p
ZT4KQ2M6IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBu
dmlkaWEuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV91c2VycHRy
LmMgfCA5ICsrKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1f
dXNlcnB0ci5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX3VzZXJwdHIuYwpp
bmRleCA1MjhiNjE2NzgzMzQuLmMxODAwOGQzY2MyYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX3VzZXJwdHIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9nZW0vaTkxNV9nZW1fdXNlcnB0ci5jCkBAIC01MjcsNyArNTI3LDcgQEAgX19pOTE1X2dlbV91
c2VycHRyX2dldF9wYWdlc193b3JrZXIoc3RydWN0IHdvcmtfc3RydWN0ICpfd29yaykKIAl9CiAJ
bXV0ZXhfdW5sb2NrKCZvYmotPm1tLmxvY2spOwogCi0JcmVsZWFzZV9wYWdlcyhwdmVjLCBwaW5u
ZWQpOworCXB1dF91c2VyX3BhZ2VzKHB2ZWMsIHBpbm5lZCk7CiAJa3ZmcmVlKHB2ZWMpOwogCiAJ
aTkxNV9nZW1fb2JqZWN0X3B1dChvYmopOwpAQCAtNjQwLDcgKzY0MCw3IEBAIHN0YXRpYyBpbnQg
aTkxNV9nZW1fdXNlcnB0cl9nZXRfcGFnZXMoc3RydWN0IGRybV9pOTE1X2dlbV9vYmplY3QgKm9i
aikKIAkJX19pOTE1X2dlbV91c2VycHRyX3NldF9hY3RpdmUob2JqLCB0cnVlKTsKIAogCWlmIChJ
U19FUlIocGFnZXMpKQotCQlyZWxlYXNlX3BhZ2VzKHB2ZWMsIHBpbm5lZCk7CisJCXB1dF91c2Vy
X3BhZ2VzKHB2ZWMsIHBpbm5lZCk7CiAJa3ZmcmVlKHB2ZWMpOwogCiAJcmV0dXJuIFBUUl9FUlJf
T1JfWkVSTyhwYWdlcyk7CkBAIC02NjMsMTEgKzY2Myw4IEBAIGk5MTVfZ2VtX3VzZXJwdHJfcHV0
X3BhZ2VzKHN0cnVjdCBkcm1faTkxNV9nZW1fb2JqZWN0ICpvYmosCiAJaTkxNV9nZW1fZ3R0X2Zp
bmlzaF9wYWdlcyhvYmosIHBhZ2VzKTsKIAogCWZvcl9lYWNoX3NndF9wYWdlKHBhZ2UsIHNndF9p
dGVyLCBwYWdlcykgewotCQlpZiAob2JqLT5tbS5kaXJ0eSkKLQkJCXNldF9wYWdlX2RpcnR5KHBh
Z2UpOwotCiAJCW1hcmtfcGFnZV9hY2Nlc3NlZChwYWdlKTsKLQkJcHV0X3BhZ2UocGFnZSk7CisJ
CXB1dF91c2VyX3BhZ2VzX2RpcnR5X2xvY2soJnBhZ2UsIDEsIG9iai0+bW0uZGlydHkpOwogCX0K
IAlvYmotPm1tLmRpcnR5ID0gZmFsc2U7CiAKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
