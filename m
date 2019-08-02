Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A64A07EEDC
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:20:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E21C6ED1E;
	Fri,  2 Aug 2019 08:19:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C63F6E862;
 Fri,  2 Aug 2019 02:20:36 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id i18so35237035pgl.11;
 Thu, 01 Aug 2019 19:20:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UPRfD7vyasD2XVfdl0NeBW26eHm6l3ABDQSSTKq1HX4=;
 b=NvfJR+ahkDOs5v4JnmZYbRqP7ocWXuYZ0L1fzltZnJuwWzhzHsakcKEauREDRE7jBv
 8BUaJk20ymqmkdppA3XlZyxwwEEP9XswKPo67tsXflOqjbOgT7wAPFxPnvZ2tYDUrci1
 MfwRXWTr/mu8wm9gkZqMgJMgfRVQ9ehGfgiY77UmOOoiWD1bOB2XAwtSD1NbMidGp9KP
 4rew0bUv6mwxlJt80JOrcdppwhtK3jDgBsx4Y8/EYLQzsV24WkV38w13oRsi/NaXoewI
 2eaQ/cLkuwmcF7LsePOzftYavyHpVee9dcGtJJ1u1CVBoEcAa1Vu4VvYQUXO3VO1dfob
 O78Q==
X-Gm-Message-State: APjAAAXQKTONbbhn7TWCZhHpEy7/KhXN+iQXo/S9keGYXP63CQhute+R
 4uuBLt0IL6jiYo8Y7sxmCKk=
X-Google-Smtp-Source: APXvYqzQQn/4+/qhyIZ5gzUBopHqYfn0J/db4aXm+9arPe8eAWsGtJFKretZ1QBLJdXBLY5X+jbCWQ==
X-Received: by 2002:a17:90a:7f85:: with SMTP id
 m5mr1901500pjl.78.1564712435904; 
 Thu, 01 Aug 2019 19:20:35 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u9sm38179744pgc.5.2019.08.01.19.20.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 19:20:35 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 15/34] staging/vc04_services: convert put_page() to
 put_user_page*()
Date: Thu,  1 Aug 2019 19:19:46 -0700
Message-Id: <20190802022005.5117-16-jhubbard@nvidia.com>
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
 bh=UPRfD7vyasD2XVfdl0NeBW26eHm6l3ABDQSSTKq1HX4=;
 b=TDJzpDwE2oXFjm8cRNjQ8xrt4Ta2d3wf2Cpo0GoFM9thJ0XtvCvH4mP4rm1obsYrxe
 XfcKcMWeGW7+jGqqsIeZqIQivf0rjt9KMIQPJwYrX9aXaeynZfYblNMyZkWwFJwZth79
 e4fMCJd20kqdE18/wOh4Jbz0PSr2Nv8bt8KSNv7hBSUy22vg0EGXVDctxg6pWi24C6E/
 aytHIR9O0Oe5Nfk4mH6Tawu8cduDw0xsgEveOl493+9jCWiudUUBNmztlAbrHUK6dK5c
 cZre9/z25iL+oH1skqqYaquBXUxt6bEZ/OhP0nmn5k+Ox8GOIXBHEB9I8h3iWNYPWkz5
 1iug==
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
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org,
 Suniel Mahesh <sunil.m@techveda.org>, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Mihaela Muraru <mihaela.muraru21@gmail.com>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 Kishore KP <kishore.p@techveda.org>, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 Sidong Yang <realwakka@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-xfs@vger.kernel.org,
 linux-crypto@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpDYzogRXJpYyBB
bmhvbHQgPGVyaWNAYW5ob2x0Lm5ldD4KQ2M6IFN0ZWZhbiBXYWhyZW4gPHN0ZWZhbi53YWhyZW5A
aTJzZS5jb20+CkNjOiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24u
b3JnPgpDYzogTWloYWVsYSBNdXJhcnUgPG1paGFlbGEubXVyYXJ1MjFAZ21haWwuY29tPgpDYzog
U3VuaWVsIE1haGVzaCA8c3VuaWwubUB0ZWNodmVkYS5vcmc+CkNjOiBBbCBWaXJvIDx2aXJvQHpl
bml2LmxpbnV4Lm9yZy51az4KQ2M6IFNpZG9uZyBZYW5nIDxyZWFsd2Fra2FAZ21haWwuY29tPgpD
YzogS2lzaG9yZSBLUCA8a2lzaG9yZS5wQHRlY2h2ZWRhLm9yZz4KQ2M6IGxpbnV4LXJwaS1rZXJu
ZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRl
YWQub3JnCkNjOiBkZXZlbEBkcml2ZXJkZXYub3N1b3NsLm9yZwpTaWduZWQtb2ZmLWJ5OiBKb2hu
IEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Ci0tLQogLi4uL3ZjMDRfc2VydmljZXMvaW50
ZXJmYWNlL3ZjaGlxX2FybS92Y2hpcV8yODM1X2FybS5jIHwgMTAgKystLS0tLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL3N0YWdpbmcvdmMwNF9zZXJ2aWNlcy9pbnRlcmZhY2UvdmNoaXFfYXJtL3ZjaGlxXzI4
MzVfYXJtLmMgYi9kcml2ZXJzL3N0YWdpbmcvdmMwNF9zZXJ2aWNlcy9pbnRlcmZhY2UvdmNoaXFf
YXJtL3ZjaGlxXzI4MzVfYXJtLmMKaW5kZXggNjFjNjlmMzUzY2RiLi5lYzkyYjRjNTBlOTUgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvc3RhZ2luZy92YzA0X3NlcnZpY2VzL2ludGVyZmFjZS92Y2hpcV9h
cm0vdmNoaXFfMjgzNV9hcm0uYworKysgYi9kcml2ZXJzL3N0YWdpbmcvdmMwNF9zZXJ2aWNlcy9p
bnRlcmZhY2UvdmNoaXFfYXJtL3ZjaGlxXzI4MzVfYXJtLmMKQEAgLTMzNiwxMCArMzM2LDcgQEAg
Y2xlYW51cF9wYWdlbGlzdGluZm8oc3RydWN0IHZjaGlxX3BhZ2VsaXN0X2luZm8gKnBhZ2VsaXN0
aW5mbykKIAl9CiAKIAlpZiAocGFnZWxpc3RpbmZvLT5wYWdlc19uZWVkX3JlbGVhc2UpIHsKLQkJ
dW5zaWduZWQgaW50IGk7Ci0KLQkJZm9yIChpID0gMDsgaSA8IHBhZ2VsaXN0aW5mby0+bnVtX3Bh
Z2VzOyBpKyspCi0JCQlwdXRfcGFnZShwYWdlbGlzdGluZm8tPnBhZ2VzW2ldKTsKKwkJcHV0X3Vz
ZXJfcGFnZXMocGFnZWxpc3RpbmZvLT5wYWdlcywgcGFnZWxpc3RpbmZvLT5udW1fcGFnZXMpOwog
CX0KIAogCWRtYV9mcmVlX2NvaGVyZW50KGdfZGV2LCBwYWdlbGlzdGluZm8tPnBhZ2VsaXN0X2J1
ZmZlcl9zaXplLApAQCAtNDU0LDEwICs0NTEsNyBAQCBjcmVhdGVfcGFnZWxpc3QoY2hhciBfX3Vz
ZXIgKmJ1Ziwgc2l6ZV90IGNvdW50LCB1bnNpZ25lZCBzaG9ydCB0eXBlKQogCQkJCSAgICAgICBf
X2Z1bmNfXywgYWN0dWFsX3BhZ2VzLCBudW1fcGFnZXMpOwogCiAJCQkvKiBUaGlzIGlzIHByb2Jh
Ymx5IGR1ZSB0byB0aGUgcHJvY2VzcyBiZWluZyBraWxsZWQgKi8KLQkJCXdoaWxlIChhY3R1YWxf
cGFnZXMgPiAwKSB7Ci0JCQkJYWN0dWFsX3BhZ2VzLS07Ci0JCQkJcHV0X3BhZ2UocGFnZXNbYWN0
dWFsX3BhZ2VzXSk7Ci0JCQl9CisJCQlwdXRfdXNlcl9wYWdlcyhwYWdlcywgYWN0dWFsX3BhZ2Vz
KTsKIAkJCWNsZWFudXBfcGFnZWxpc3RpbmZvKHBhZ2VsaXN0aW5mbyk7CiAJCQlyZXR1cm4gTlVM
TDsKIAkJfQotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
