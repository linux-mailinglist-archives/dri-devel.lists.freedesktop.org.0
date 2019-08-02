Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B05D37EEE3
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:20:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C81B6ED1F;
	Fri,  2 Aug 2019 08:19:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ECEC6E866;
 Fri,  2 Aug 2019 02:20:31 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id c14so32935443plo.0;
 Thu, 01 Aug 2019 19:20:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qtbgyNHZ/W16Wsr49ObVlGXNsYs5Ix8cECAWpHw8QNg=;
 b=LractypOlbwXopufMsrkVPM5EMvWVDrNNc6Rw9WmuIMnTs6HQpDvNu8CZb+Lg2uzfk
 +sI37ewQuKRbntSvC6JT5fxh8SoytA+yUGnowjJjNivZHZgbOInzU4M8R6yJmU6+wgtq
 HrRMQzUpnq18yJSA09Jpm4KQn47CDt8ERVoKVfHz/SDY+QeIOy+Y3vfpqVMWYkqXaBhg
 GuKgY6T96QjUio5aljjAVxmdoR6bNejk338Z18ynXHtzG2Wyd0S6eS0gAZT2qi3ZHT5n
 11GS9pat7cLj9UwbttXy87xBKo3lXhmBzf3RYzfY7scat5hU96dP1QlA1X5/b7HqD1IT
 RhoQ==
X-Gm-Message-State: APjAAAVjY6+Ipnktcq/+9JXt9JAk3rUHVm808swLPJ3ZKYFqzdwoSMnV
 RHQT43y9uLiQ/jPsRIlS4/g=
X-Google-Smtp-Source: APXvYqwKrOY4Kztkj41s0a6oi7zayzaXd8LpjaiCIksbrU4wJsvnJgU6mF0Bb9Hw/Pj5xfTEZIafcQ==
X-Received: by 2002:a17:902:5ac4:: with SMTP id
 g4mr131986648plm.80.1564712430821; 
 Thu, 01 Aug 2019 19:20:30 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u9sm38179744pgc.5.2019.08.01.19.20.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 19:20:30 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 12/34] vmci: convert put_page() to put_user_page*()
Date: Thu,  1 Aug 2019 19:19:43 -0700
Message-Id: <20190802022005.5117-13-jhubbard@nvidia.com>
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
 bh=qtbgyNHZ/W16Wsr49ObVlGXNsYs5Ix8cECAWpHw8QNg=;
 b=RO5t4Ioq4WOEkql+z1BxTA9XpQ5l0uBsUNJdBVpEbEdDpylZNAFokBSBfkt63Vmsnw
 KKnFnDLW2SLxaXe4yEcd4Uwphs0F9rh9yrBF7wrtI6jX7Smsup4E8B+OCU5PAghiuPUe
 n/rru2nRkN4fBDLxv0E5LWIc3+ez3bVuBV4gRzIu0YbbR7/jG/nHlqRg4ui2ABpoKbbs
 zzA9SmSgidMvseL2Kb+bN8XRYc2qyorbmCL2eKn81WG2j5TabLu8TlIG3hp8Y7Gq/i02
 vYgsWfOu94xgHEddrADmlOmkGGALS2TQwhC3ZfS61Jjz+jw13+1q5hfNRcQVjxbv88fI
 6ULQ==
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
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>
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
dGhpcyBlZmZlY3RpdmVseSBjaGFuZ2VzIHRoZSBjb2RlJ3MgYmVoYXZpb3IgaW4KcXBfcmVsZWFz
ZV9wYWdlcygpOiBpdCBub3cgdWx0aW1hdGVseSBjYWxscyBzZXRfcGFnZV9kaXJ0eV9sb2NrKCks
Cmluc3RlYWQgb2Ygc2V0X3BhZ2VfZGlydHkoKS4gVGhpcyBpcyBwcm9iYWJseSBtb3JlIGFjY3Vy
YXRlLgoKQXMgQ2hyaXN0b3BoZSBIZWxsd2lnIHB1dCBpdCwgInNldF9wYWdlX2RpcnR5KCkgaXMg
b25seSBzYWZlIGlmIHdlIGFyZQpkZWFsaW5nIHdpdGggYSBmaWxlIGJhY2tlZCBwYWdlIHdoZXJl
IHdlIGhhdmUgcmVmZXJlbmNlIG9uIHRoZSBpbm9kZSBpdApoYW5ncyBvZmYuIiBbMV0KClsxXSBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMTkwNzIzMTUzNjQwLkdCNzIwQGxzdC5kZQoKQ2M6
IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+CkNjOiBBbCBWaXJvIDx2aXJvQHplbml2Lmxp
bnV4Lm9yZy51az4KQ2M6ICJHdXN0YXZvIEEuIFIuIFNpbHZhIiA8Z3VzdGF2b0BlbWJlZGRlZG9y
LmNvbT4KQ2M6IEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPgpTaWduZWQtb2ZmLWJ5
OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Ci0tLQogZHJpdmVycy9taXNjL3Zt
d192bWNpL3ZtY2lfY29udGV4dC5jICAgIHwgIDIgKy0KIGRyaXZlcnMvbWlzYy92bXdfdm1jaS92
bWNpX3F1ZXVlX3BhaXIuYyB8IDExICsrLS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9taXNjL3Zt
d192bWNpL3ZtY2lfY29udGV4dC5jIGIvZHJpdmVycy9taXNjL3Ztd192bWNpL3ZtY2lfY29udGV4
dC5jCmluZGV4IDE2Njk1MzY2ZWM5Mi4uOWRhYTUyZWU2M2I3IDEwMDY0NAotLS0gYS9kcml2ZXJz
L21pc2Mvdm13X3ZtY2kvdm1jaV9jb250ZXh0LmMKKysrIGIvZHJpdmVycy9taXNjL3Ztd192bWNp
L3ZtY2lfY29udGV4dC5jCkBAIC01ODcsNyArNTg3LDcgQEAgdm9pZCB2bWNpX2N0eF91bnNldF9u
b3RpZnkoc3RydWN0IHZtY2lfY3R4ICpjb250ZXh0KQogCiAJaWYgKG5vdGlmeV9wYWdlKSB7CiAJ
CWt1bm1hcChub3RpZnlfcGFnZSk7Ci0JCXB1dF9wYWdlKG5vdGlmeV9wYWdlKTsKKwkJcHV0X3Vz
ZXJfcGFnZShub3RpZnlfcGFnZSk7CiAJfQogfQogCmRpZmYgLS1naXQgYS9kcml2ZXJzL21pc2Mv
dm13X3ZtY2kvdm1jaV9xdWV1ZV9wYWlyLmMgYi9kcml2ZXJzL21pc2Mvdm13X3ZtY2kvdm1jaV9x
dWV1ZV9wYWlyLmMKaW5kZXggODUzMWFlNzgxMTk1Li5lNTQzNDU1MWQwZWYgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvbWlzYy92bXdfdm1jaS92bWNpX3F1ZXVlX3BhaXIuYworKysgYi9kcml2ZXJzL21p
c2Mvdm13X3ZtY2kvdm1jaV9xdWV1ZV9wYWlyLmMKQEAgLTYyNiwxNSArNjI2LDggQEAgc3RhdGlj
IHZvaWQgcXBfcmVsZWFzZV9xdWV1ZV9tdXRleChzdHJ1Y3Qgdm1jaV9xdWV1ZSAqcXVldWUpCiBz
dGF0aWMgdm9pZCBxcF9yZWxlYXNlX3BhZ2VzKHN0cnVjdCBwYWdlICoqcGFnZXMsCiAJCQkgICAg
IHU2NCBudW1fcGFnZXMsIGJvb2wgZGlydHkpCiB7Ci0JaW50IGk7Ci0KLQlmb3IgKGkgPSAwOyBp
IDwgbnVtX3BhZ2VzOyBpKyspIHsKLQkJaWYgKGRpcnR5KQotCQkJc2V0X3BhZ2VfZGlydHkocGFn
ZXNbaV0pOwotCi0JCXB1dF9wYWdlKHBhZ2VzW2ldKTsKLQkJcGFnZXNbaV0gPSBOVUxMOwotCX0K
KwlwdXRfdXNlcl9wYWdlc19kaXJ0eV9sb2NrKHBhZ2VzLCBudW1fcGFnZXMsIGRpcnR5KTsKKwlt
ZW1zZXQocGFnZXMsIDAsIG51bV9wYWdlcyAqIHNpemVvZihzdHJ1Y3QgcGFnZSAqKSk7CiB9CiAK
IC8qCi0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
