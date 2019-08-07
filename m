Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8774C845AE
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 09:26:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 773226E623;
	Wed,  7 Aug 2019 07:26:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D01089A9A;
 Wed,  7 Aug 2019 01:34:39 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id 4so31589170pld.10;
 Tue, 06 Aug 2019 18:34:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=46lxAY1z81U+mrrESVpVIrQ+fWJc6iHl4OExj8KwBEA=;
 b=HGC7xdBf41Mz7ZlpBfPX4KWhKtNnUX3AVq9N0P/B58hvjQKmFgPWOFHuet10ZzQka+
 Vd4HO3i99E6Myo9+SnYP/yal3LlV/Xibh1EVUiDtRVXuwLxBAoG9zpnoRdnFIOGzGbOO
 pkipVb0AMlb9SA9aY2P2LcN69HaGm+Ro3u6mkHxI9iGkvKq2lWkNcTmUeDugcDZWY+Vk
 n7ycfrYO/3EI04pZqfRxvk2HxX6GBc0jP53BHkEAmBJ7w5Let1B3rZGkV6lyT6dwvVf9
 jMV8QpBG4xz+AEcEjHmyvdpfWEgJlKpqCpEZ5n6YTENTXpv7mCvB1NppgB05fFF/MFtY
 yidA==
X-Gm-Message-State: APjAAAVVteaiK8OhsM5PWTjbAPoW/zbRz1sQAKHWdhshhKjcPFTQ48YY
 pGZtQ0vr+seYp2xgVYGOD3U=
X-Google-Smtp-Source: APXvYqxeu3U+gXlTZOXb8hdX/T/5F9QSVWlhZwpRfNn+ISG+GmBUrBJWAvgFajanndvmV9JUd/JHZg==
X-Received: by 2002:a17:902:a606:: with SMTP id
 u6mr5434497plq.275.1565141679262; 
 Tue, 06 Aug 2019 18:34:39 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.34.37
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:34:38 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 34/41] goldfish_pipe: convert put_page() to put_user_page*()
Date: Tue,  6 Aug 2019 18:33:33 -0700
Message-Id: <20190807013340.9706-35-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190807013340.9706-1-jhubbard@nvidia.com>
References: <20190807013340.9706-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Wed, 07 Aug 2019 07:26:18 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=46lxAY1z81U+mrrESVpVIrQ+fWJc6iHl4OExj8KwBEA=;
 b=WuyyNqtpvvlvZwulsOSyl6jjDfFZFL7/Zx5rMnqGOdxDRsEuGcdgN1IewvAvlX+Ui3
 X7btLnm2F40F8RrpBhgVrMU3HOKje9DtE5nK+fpNzyjny+e0S7JZDS2kjkLoxOZDXhQl
 8/grXg9y3uP/GW5F5PAwd4bWzrVFH3BCp78Eig9BKFd6aIXye5gDuBBhD5viuX1OApXQ
 9VIP+L4AUKM2VFr2nldHjLjmSVNA49QX09uR5xAkxNN9xQUujG5Q/Q0AKTjDZbsxdlOq
 g4tQx0EnIYd52Zy5p9V4faNYnaj9xyaWhFJDGaxmSVhObIkgzad4uex02Ars3KOUlzef
 YWIw==
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
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Roman Kiryanov <rkir@google.com>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 intel-gfx@lists.freedesktop.org, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-fsdevel@vger.kernel.org
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
YXRlLgoKQXMgQ2hyaXN0b3BoIEhlbGx3aWcgcHV0IGl0LCAic2V0X3BhZ2VfZGlydHkoKSBpcyBv
bmx5IHNhZmUgaWYgd2UgYXJlCmRlYWxpbmcgd2l0aCBhIGZpbGUgYmFja2VkIHBhZ2Ugd2hlcmUg
d2UgaGF2ZSByZWZlcmVuY2Ugb24gdGhlIGlub2RlIGl0CmhhbmdzIG9mZi4iIFsxXQoKWzFdIGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAxOTA3MjMxNTM2NDAuR0I3MjBAbHN0LmRlCgpDYzog
R3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KQ2M6IFJvbWFu
IEtpcnlhbm92IDxya2lyQGdvb2dsZS5jb20+ClNpZ25lZC1vZmYtYnk6IEpvaG4gSHViYmFyZCA8
amh1YmJhcmRAbnZpZGlhLmNvbT4KLS0tCiBkcml2ZXJzL3BsYXRmb3JtL2dvbGRmaXNoL2dvbGRm
aXNoX3BpcGUuYyB8IDkgKysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
LCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGxhdGZvcm0vZ29sZGZpc2gv
Z29sZGZpc2hfcGlwZS5jIGIvZHJpdmVycy9wbGF0Zm9ybS9nb2xkZmlzaC9nb2xkZmlzaF9waXBl
LmMKaW5kZXggY2VmMDEzM2FhNDdhLi4yYmQyMTAyMGUyODggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
cGxhdGZvcm0vZ29sZGZpc2gvZ29sZGZpc2hfcGlwZS5jCisrKyBiL2RyaXZlcnMvcGxhdGZvcm0v
Z29sZGZpc2gvZ29sZGZpc2hfcGlwZS5jCkBAIC0yODgsMTUgKzI4OCwxMiBAQCBzdGF0aWMgaW50
IHBpbl91c2VyX3BhZ2VzKHVuc2lnbmVkIGxvbmcgZmlyc3RfcGFnZSwKIHN0YXRpYyB2b2lkIHJl
bGVhc2VfdXNlcl9wYWdlcyhzdHJ1Y3QgcGFnZSAqKnBhZ2VzLCBpbnQgcGFnZXNfY291bnQsCiAJ
CQkgICAgICAgaW50IGlzX3dyaXRlLCBzMzIgY29uc3VtZWRfc2l6ZSkKIHsKLQlpbnQgaTsKKwli
b29sIGRpcnR5ID0gIWlzX3dyaXRlICYmIGNvbnN1bWVkX3NpemUgPiAwOwogCi0JZm9yIChpID0g
MDsgaSA8IHBhZ2VzX2NvdW50OyBpKyspIHsKLQkJaWYgKCFpc193cml0ZSAmJiBjb25zdW1lZF9z
aXplID4gMCkKLQkJCXNldF9wYWdlX2RpcnR5KHBhZ2VzW2ldKTsKLQkJcHV0X3BhZ2UocGFnZXNb
aV0pOwotCX0KKwlwdXRfdXNlcl9wYWdlc19kaXJ0eV9sb2NrKHBhZ2VzLCBwYWdlc19jb3VudCwg
ZGlydHkpOwogfQogCisKIC8qIFBvcHVsYXRlIHRoZSBjYWxsIHBhcmFtZXRlcnMsIG1lcmdpbmcg
YWRqYWNlbnQgcGFnZXMgdG9nZXRoZXIgKi8KIHN0YXRpYyB2b2lkIHBvcHVsYXRlX3J3X3BhcmFt
cyhzdHJ1Y3QgcGFnZSAqKnBhZ2VzLAogCQkJICAgICAgIGludCBwYWdlc19jb3VudCwKLS0gCjIu
MjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
