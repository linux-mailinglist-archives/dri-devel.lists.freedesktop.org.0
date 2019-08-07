Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23ADE845DD
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 09:28:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 465856E668;
	Wed,  7 Aug 2019 07:26:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 166936E58E;
 Wed,  7 Aug 2019 01:33:56 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id f17so38504411pfn.6;
 Tue, 06 Aug 2019 18:33:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VkIZ9MNYeaRKdR8dFo+dHbwqWBHsgbjux0NTtbbQ8Os=;
 b=tXTkHcrmwbcbxvZX51ZiIbhA+7B7TYSHAPfjPm7fvMKMULz0DNvOj7espcPK7JThkk
 mllRDNk+1wA5LPXTipVS6gKnc7psCTbhYmHsTPHrx57MnN35vXeiv7kkapjGZM7n2fMV
 aAzu3zwVd1R0mnCRQ3R5SqbskYF5v+GWRAFD6JEQBe1jL9SMrSQyZIvPSmyBoS6iF9G6
 hHncJpuR/WudIxLN5V0S+skbQi+sfEmmtxqHpkQ8kxRrDKNqZOPplRlw8XsFKTCdjxec
 Qz48F2YK1ALwFqZ4FNIAsoz5hCJupUeeZAH8pJ97T9gc01AA3hM2N+T+2tUFxs3fqaOi
 ilkA==
X-Gm-Message-State: APjAAAUQ9qOA87NkVIPivttggQ4W16287c659Qn13pkkQjaPpcNKYzLi
 FbZBie2WNwJ0rFPYQdgQnt4=
X-Google-Smtp-Source: APXvYqzbAGNeyGcbWdWkzYvFP0KeX9sV24V25gxtoPIbubmiIgKmQ4weQ/h5itUQb1wb0VhoIYmEzw==
X-Received: by 2002:a17:90a:5884:: with SMTP id
 j4mr6207412pji.142.1565141635740; 
 Tue, 06 Aug 2019 18:33:55 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.33.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:33:55 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 07/41] drm/etnaviv: convert release_pages() to
 put_user_pages()
Date: Tue,  6 Aug 2019 18:33:06 -0700
Message-Id: <20190807013340.9706-8-jhubbard@nvidia.com>
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
 bh=VkIZ9MNYeaRKdR8dFo+dHbwqWBHsgbjux0NTtbbQ8Os=;
 b=WodjfRMNXRpfn8eDFiq237p2GDsP83iVPB5OCq8NqovKXXtmSfGMO2YcZK3qaRiOMq
 V+1Wp3U4Ouo1tRWYwqfWu9duqPs4fCXrKz87Da9i0IezRC3CosqffIajL738UQ/eBy1Q
 8bGkemq1iEa5/xtBXuYNtAC1RV+0n9U9hgutinWmqUfG/v6xBvqP7GCtby2XRnRchtz/
 0cYIJLRbrEXn7xRE/60/clx008LELTPxuZr9t/SYNy+7x5xLG72AD6O6vZ88uF2XgMPR
 ACpc5Lz6LUvFr+xpSFpVcKN4ZMG15RxRazNc9G/jbrPxZR9s341vQyb0SHXjN70nitnK
 1NJw==
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
 =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 "H . Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, ceph-devel@vger.kernel.org,
 devel@driverdev.osuosl.org, rds-devel@oss.oracle.com,
 linux-rdma@vger.kernel.org, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Ingo Molnar <mingo@redhat.com>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Borislav Petkov <bp@alien8.de>, linux-rpi-kernel@lists.infradead.org,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-xfs@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpDYzogSm9lcmcg
Um9lZGVsIDxqb3JvQDhieXRlcy5vcmc+CkNjOiBQYW9sbyBCb256aW5pIDxwYm9uemluaUByZWRo
YXQuY29tPgpDYzogUmFkaW0gS3LEjW3DocWZIDxya3JjbWFyQHJlZGhhdC5jb20+CkNjOiBUaG9t
YXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4KQ2M6IEluZ28gTW9sbmFyIDxtaW5nb0By
ZWRoYXQuY29tPgpDYzogQm9yaXNsYXYgUGV0a292IDxicEBhbGllbjguZGU+CkNjOiBILiBQZXRl
ciBBbnZpbiA8aHBhQHp5dG9yLmNvbT4KQ2M6IHg4NkBrZXJuZWwub3JnCkNjOiBrdm1Admdlci5r
ZXJuZWwub3JnClNpZ25lZC1vZmYtYnk6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dlbS5jIHwgNCArKy0tCiAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ2VtLmMgYi9kcml2ZXJzL2dwdS9k
cm0vZXRuYXZpdi9ldG5hdml2X2dlbS5jCmluZGV4IGU4Nzc4ZWJiNzJlNi4uYTAxNDRhNWVlMzI1
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dlbS5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ2VtLmMKQEAgLTY4Niw3ICs2ODYsNyBA
QCBzdGF0aWMgaW50IGV0bmF2aXZfZ2VtX3VzZXJwdHJfZ2V0X3BhZ2VzKHN0cnVjdCBldG5hdml2
X2dlbV9vYmplY3QgKmV0bmF2aXZfb2JqKQogCQlyZXQgPSBnZXRfdXNlcl9wYWdlc19mYXN0KHB0
ciwgbnVtX3BhZ2VzLAogCQkJCQkgICF1c2VycHRyLT5ybyA/IEZPTExfV1JJVEUgOiAwLCBwYWdl
cyk7CiAJCWlmIChyZXQgPCAwKSB7Ci0JCQlyZWxlYXNlX3BhZ2VzKHB2ZWMsIHBpbm5lZCk7CisJ
CQlwdXRfdXNlcl9wYWdlcyhwdmVjLCBwaW5uZWQpOwogCQkJa3ZmcmVlKHB2ZWMpOwogCQkJcmV0
dXJuIHJldDsKIAkJfQpAQCAtNzEwLDcgKzcxMCw3IEBAIHN0YXRpYyB2b2lkIGV0bmF2aXZfZ2Vt
X3VzZXJwdHJfcmVsZWFzZShzdHJ1Y3QgZXRuYXZpdl9nZW1fb2JqZWN0ICpldG5hdml2X29iaikK
IAlpZiAoZXRuYXZpdl9vYmotPnBhZ2VzKSB7CiAJCWludCBucGFnZXMgPSBldG5hdml2X29iai0+
YmFzZS5zaXplID4+IFBBR0VfU0hJRlQ7CiAKLQkJcmVsZWFzZV9wYWdlcyhldG5hdml2X29iai0+
cGFnZXMsIG5wYWdlcyk7CisJCXB1dF91c2VyX3BhZ2VzKGV0bmF2aXZfb2JqLT5wYWdlcywgbnBh
Z2VzKTsKIAkJa3ZmcmVlKGV0bmF2aXZfb2JqLT5wYWdlcyk7CiAJfQogfQotLSAKMi4yMi4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
