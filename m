Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C8D81347
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 09:35:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9B586E28B;
	Mon,  5 Aug 2019 07:34:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5696589CDE;
 Sun,  4 Aug 2019 22:50:10 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id t14so35655636plr.11;
 Sun, 04 Aug 2019 15:50:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=46lxAY1z81U+mrrESVpVIrQ+fWJc6iHl4OExj8KwBEA=;
 b=NJU7nYy+3qLJ0J/hAu7bs4iVCEXeRtqqKly4g0fh2RXV3rhyS6rxgnAuvIbDKQX8b4
 +gbozcnA3v76jnW/9dSs75tDkPaTQB606YJF1OfYhYtVfnYhKx5JjRlYSHC+7bSyJ+7x
 g/9eSpewCCqi8LJEA0l+bCMDEKSMs97GAT91lrRVFLDVo5lgHnp1+egY6QWuA8nUseGq
 50XANQ0pDmyS7EN8vBHe7UCw/ag+T9YzVobxiJsOVZdRfXv1CG0DAR/WABxi92fCj9ZU
 vceckOcTLPp84cUDwSJFha854bB9IPLF8BfOTg6s5i4UiqH3LDeyzULc1He8DXbifuGp
 Gj1Q==
X-Gm-Message-State: APjAAAXboDNvJgyo3BuaovJJ5pZXN5QY4NoFKbWYX5LG2sAC2g3Oy2dC
 X3hcb3fN91jLKjJPW4cqAx4=
X-Google-Smtp-Source: APXvYqzB7V+habp3I96Q8m7XMJqRYvky1QL0M1s1kWUjAVtyhhVWp0HvJtmcLDTq9kGGDNeFtLuO/Q==
X-Received: by 2002:a17:902:9a84:: with SMTP id
 w4mr21647219plp.160.1564959010056; 
 Sun, 04 Aug 2019 15:50:10 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 r6sm35946836pjb.22.2019.08.04.15.50.08
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 15:50:09 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 32/34] goldfish_pipe: convert put_page() to put_user_page*()
Date: Sun,  4 Aug 2019 15:49:13 -0700
Message-Id: <20190804224915.28669-33-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190804224915.28669-1-jhubbard@nvidia.com>
References: <20190804224915.28669-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Mon, 05 Aug 2019 07:34:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=46lxAY1z81U+mrrESVpVIrQ+fWJc6iHl4OExj8KwBEA=;
 b=TnoFvHk+U9GlniOKiXvWmHaHCeiVRyFhspf1Ucco3Opb6Zsra5EKt4aW1VdCEHOoOL
 B19ZrZSjdl4XOLjhMd/tz/suTkdRby0Q/hj5CJZSGF/pCKAPl5af/u3ds9o4NJugQJUH
 wah7eFEy+LBD8ieXrf5M4ghNwdqYF47d1zgnqfS2OWPzozoT/nJvTGXUM3ZYObcV1Nod
 /B+8RZc6MysuCMtgdDFKXIhBZ1vxh5KoYsW/S+ERZyza2fEF3JOhoez0XL3hqg3QsNHf
 A2vrE2EWhCkc/+2Bi4Qkus+K6o78OOjPZC/JIdc8d4G2oWHuj6EfQ91Jku0EJ0FsNSHa
 w9qg==
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
