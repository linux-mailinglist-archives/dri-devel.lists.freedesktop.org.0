Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 181627EEFE
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:21:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4F8E6ED45;
	Fri,  2 Aug 2019 08:19:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C05EB6E862;
 Fri,  2 Aug 2019 02:20:52 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id i2so33033288plt.1;
 Thu, 01 Aug 2019 19:20:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o8Q8kE8hzW/DwKrVVZh1taN77rkNxpuim/5zYvIGd0I=;
 b=BF1+8TrV1R+g0Vm/bInbj6Z+RUzLofiUVPLVjcCAyAJxDvCt5wS+WEb31zkw8F0A3Z
 xOxSL4+Cyx6y3iGs5TaYkxGtBWRSWn0k0nCcfuDE3GkxrvWoriqfAng3kTKfuSnY06TY
 sH3ScO0BbEUbJg3+gCVL+Ac7xtrY/72wSQWTLmCuTp/EEzcQvdSRlCPUaiXYmvR1754p
 yYv7TAF48Rh9WaYkzDcq6UVh9PKk0xh1yDI1NFtaYOW5STNBNaM/J92IQW1w2I/CRvOY
 d+1vGUxPck+cjUQcGahTYCiFS80XFYa/1y4oKLXRhwGyeE6iIGIJbp3gVPT0gKB/ngwk
 PWdQ==
X-Gm-Message-State: APjAAAU5Bxdmn6b62451ReYVsEc1llUScdit3i7GdDYWcNTe6m45WSE7
 5e6tikLZPNzIVwqgT8eMBZI=
X-Google-Smtp-Source: APXvYqz1YTjVZYS+LesWuf1AG7NOEG7XNcFlAKVjP+75gMoI5m//7o/WseaBl+rAw+Wa9I/u7wQNfg==
X-Received: by 2002:a17:902:740a:: with SMTP id
 g10mr129917590pll.82.1564712452476; 
 Thu, 01 Aug 2019 19:20:52 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u9sm38179744pgc.5.2019.08.01.19.20.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 19:20:51 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 26/34] mm/gup_benchmark.c: convert put_page() to
 put_user_page*()
Date: Thu,  1 Aug 2019 19:19:57 -0700
Message-Id: <20190802022005.5117-27-jhubbard@nvidia.com>
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
 bh=o8Q8kE8hzW/DwKrVVZh1taN77rkNxpuim/5zYvIGd0I=;
 b=SN9JCWjRa62SDUJKkHaVdcwHX85kw/BYyJx1Oz6MKq1tPWuA+R+kvOX6gTDvC/TGzM
 WuYG+JBQhglp5JUL5bE3kcONL91y/gVNfG1/TEEmXEUkwsc3IV9ZwlZo4fZZ39RQbUrI
 einldN97i3VjPzZmNrk7Gi70UVvHdYeVSXiOY7z0rmJg1OD2RJX0hB2kTyBbOVlbD4F/
 wFv0bPm5s1TrbkD6/tFvn6bnIJfGHM4gcvzjJiA5o2aPM4xOIDqOY4iccbO2F7+VYayI
 O0zTQo6na3+rAYAFM80xDRcL3DANvgDbjQbLbpyWsZCgQEzyIKagAyXZm1uNkiwXdu5u
 s1Rw==
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
 "Michael S . Tsirkin" <mst@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, Keith Busch <keith.busch@intel.com>,
 linux-mm@kvack.org, sparclinux@vger.kernel.org,
 Dan Carpenter <dan.carpenter@oracle.com>, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 YueHaibing <yuehaibing@huawei.com>, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 intel-gfx@lists.freedesktop.org, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-fsdevel@vger.kernel.org,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpDYzogRGFuIENh
cnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPgpDYzogR3JlZyBLcm9haC1IYXJ0bWFu
IDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KQ2M6IEtlaXRoIEJ1c2NoIDxrZWl0aC5idXNj
aEBpbnRlbC5jb20+CkNjOiBLaXJpbGwgQS4gU2h1dGVtb3YgPGtpcmlsbC5zaHV0ZW1vdkBsaW51
eC5pbnRlbC5jb20+CkNjOiBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQuY29tPgpDYzog
WXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPgpTaWduZWQtb2ZmLWJ5OiBKb2huIEh1
YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Ci0tLQogbW0vZ3VwX2JlbmNobWFyay5jIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvbW0vZ3VwX2JlbmNobWFyay5jIGIvbW0vZ3VwX2JlbmNobWFyay5jCmluZGV4IDdkZDYw
MmQ3ZjhkYi4uNTE1YWM4ZWViNmVlIDEwMDY0NAotLS0gYS9tbS9ndXBfYmVuY2htYXJrLmMKKysr
IGIvbW0vZ3VwX2JlbmNobWFyay5jCkBAIC03OSw3ICs3OSw3IEBAIHN0YXRpYyBpbnQgX19ndXBf
YmVuY2htYXJrX2lvY3RsKHVuc2lnbmVkIGludCBjbWQsCiAJZm9yIChpID0gMDsgaSA8IG5yX3Bh
Z2VzOyBpKyspIHsKIAkJaWYgKCFwYWdlc1tpXSkKIAkJCWJyZWFrOwotCQlwdXRfcGFnZShwYWdl
c1tpXSk7CisJCXB1dF91c2VyX3BhZ2UocGFnZXNbaV0pOwogCX0KIAllbmRfdGltZSA9IGt0aW1l
X2dldCgpOwogCWd1cC0+cHV0X2RlbHRhX3VzZWMgPSBrdGltZV91c19kZWx0YShlbmRfdGltZSwg
c3RhcnRfdGltZSk7Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
