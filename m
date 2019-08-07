Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7DF845FB
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 09:29:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51F506E686;
	Wed,  7 Aug 2019 07:27:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 968636E58B;
 Wed,  7 Aug 2019 01:34:15 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id r7so42500524pfl.3;
 Tue, 06 Aug 2019 18:34:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1X33MY8P1PVcaLkCZcp6PkXiHV9wvPThIXgNE9TFbj4=;
 b=AAWj36tpg7kqGaXUvvPaU6dySOEuegWYIyB76EiFsIklWAVoWnGY6wZT2ERl/ZWcqM
 twhZ8GatLfqFpKYDQbBBoIKvDQ4AK6Jq7iHo8Xtl+x5ZCQGu3hC7Zd5XGrBtlnYvcYrM
 pAkM2xVu2U4ewEBqoPCrAC3EBQOD9wWf8pq4kUfXlqHukZc68+vieoAZTSBdAv76YGRQ
 l9WmPwG7Et+nGifYNsEgZNv8CHfc46XkYxdAF0DvuBi5iPB8OEyFfp/EHzVZ/bBYJsAj
 hrDa8fLOrY+Ef5ArhxHQaDXjFnG01JE+8fzOQJyqIaAFRwrPaEzHtqQh7I++pMezxSyY
 BZEA==
X-Gm-Message-State: APjAAAUP8tReKmu6kklNxF/TOakTLx5XP85Gcj4u3bideGuyHvSVVilX
 Ll2ftw8/f12oHecFHYK/zhU=
X-Google-Smtp-Source: APXvYqzI59Ma7HfX7JZrmVs+MBRFW3wzbxtnFzHUxVGy1m1ZSRzZ7m9Bk2Hb9Owa8Q1RMoC2THAX6w==
X-Received: by 2002:a63:c008:: with SMTP id h8mr5698079pgg.427.1565141655205; 
 Tue, 06 Aug 2019 18:34:15 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.34.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:34:14 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 19/41] vfio: convert put_page() to put_user_page*()
Date: Tue,  6 Aug 2019 18:33:18 -0700
Message-Id: <20190807013340.9706-20-jhubbard@nvidia.com>
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
 bh=1X33MY8P1PVcaLkCZcp6PkXiHV9wvPThIXgNE9TFbj4=;
 b=eL3MErGFo1XqhdMwEg2Kjw8ppwk7Vahm6mgoNNA3cii/CVgkEKjt7vsL/U/CmyPRH+
 vBu50G7ybGgkp7Hokph0DkgDWhI/CbhoDAa+AbddMqWT6ISLL60rYA89HWspc4xyz4Vp
 5XWKqpmskK/zJd8DBYamJF8+Y0ROhmLz8Fdh4cz2AghIDfFUZCj9rMXq3aFWqKMWQAG2
 HgrGAFAgdTFgMvzU7LHu/FiPYMdm8mLe8AL0h5BcC9G6165T14l59ud/pmRsQYRQ9HTJ
 QDGVt3CGvwstyiOJQq9AlYZoAOTVBthJyf2RDDu2y6x+HTZ/VWBzsErS5Ba5fNi4EntP
 9Gew==
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
 rds-devel@oss.oracle.com, Alex Williamson <alex.williamson@redhat.com>,
 linux-rdma@vger.kernel.org, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 intel-gfx@lists.freedesktop.org, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
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
QWxleCBXaWxsaWFtc29uIDxhbGV4LndpbGxpYW1zb25AcmVkaGF0LmNvbT4KQ2M6IGt2bUB2Z2Vy
Lmtlcm5lbC5vcmcKU2lnbmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEu
Y29tPgotLS0KIGRyaXZlcnMvdmZpby92ZmlvX2lvbW11X3R5cGUxLmMgfCA4ICsrKystLS0tCiAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvdmZpby92ZmlvX2lvbW11X3R5cGUxLmMgYi9kcml2ZXJzL3ZmaW8vdmZpb19p
b21tdV90eXBlMS5jCmluZGV4IDA1NDM5MWYzMGZhOC4uNWE1NDYxYTE0Mjk5IDEwMDY0NAotLS0g
YS9kcml2ZXJzL3ZmaW8vdmZpb19pb21tdV90eXBlMS5jCisrKyBiL2RyaXZlcnMvdmZpby92Zmlv
X2lvbW11X3R5cGUxLmMKQEAgLTMyMCw5ICszMjAsOSBAQCBzdGF0aWMgaW50IHB1dF9wZm4odW5z
aWduZWQgbG9uZyBwZm4sIGludCBwcm90KQogewogCWlmICghaXNfaW52YWxpZF9yZXNlcnZlZF9w
Zm4ocGZuKSkgewogCQlzdHJ1Y3QgcGFnZSAqcGFnZSA9IHBmbl90b19wYWdlKHBmbik7Ci0JCWlm
IChwcm90ICYgSU9NTVVfV1JJVEUpCi0JCQlTZXRQYWdlRGlydHkocGFnZSk7Ci0JCXB1dF9wYWdl
KHBhZ2UpOworCQlib29sIGRpcnR5ID0gcHJvdCAmIElPTU1VX1dSSVRFOworCisJCXB1dF91c2Vy
X3BhZ2VzX2RpcnR5X2xvY2soJnBhZ2UsIDEsIGRpcnR5KTsKIAkJcmV0dXJuIDE7CiAJfQogCXJl
dHVybiAwOwpAQCAtMzU2LDcgKzM1Niw3IEBAIHN0YXRpYyBpbnQgdmFkZHJfZ2V0X3BmbihzdHJ1
Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyB2YWRkciwKIAkJICovCiAJCWlmIChyZXQg
PiAwICYmIHZtYV9pc19mc2RheCh2bWFzWzBdKSkgewogCQkJcmV0ID0gLUVPUE5PVFNVUFA7Ci0J
CQlwdXRfcGFnZShwYWdlWzBdKTsKKwkJCXB1dF91c2VyX3BhZ2UocGFnZVswXSk7CiAJCX0KIAl9
CiAJdXBfcmVhZCgmbW0tPm1tYXBfc2VtKTsKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
