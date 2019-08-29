Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFAAA325C
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 10:29:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA1C36E291;
	Fri, 30 Aug 2019 08:29:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 034D66E130
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 16:50:52 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id o184so4553692wme.3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 09:50:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EAPNXwtNcvomkAv43HK7BcSQSi3ID9bH+hr63tWVdSI=;
 b=XD9a1+/yxY2ndpx0dRRHLlYpoVvCYGM1mF4eliV4aeXSXu/z8htGWPmnc4t7N+uXBY
 U8sWlBmrxXaatSzFulAx5CcAhnjhZLHvujagb6E4c8Y5hVZX28D2mTnZamgcz+xh2y5j
 IDtNRTCcMTvPFYq9G/9Q+udpkha9+cCzTpzYJqNtslmAwt+APqBHcdipGyimwtX7krDv
 6jZjJ86iXM0uZWNcwFbQaDPmECKGRBXti781IP++BgPHQmPW09oc6OL1CaUUcWO5ukLW
 Q+p4Y2y24tEhjwSZF7//6JVO1C6qB3gQ+KiOfZp5ulZE3q0UyF5X2EnBxIEdVUVP4SPY
 aI1w==
X-Gm-Message-State: APjAAAWpaIc5DXWKAc3rysoCBhB2ZzY8oBgsxibeW3Z2QHSdJnn5xH8h
 hfAkyYyvyX2ZMOjM7ih0lvI=
X-Google-Smtp-Source: APXvYqyG8Uv9qqAEzfuwRYVShx38vJV1pUSPq3W7ZBAlPx5+N1oEiU4zijmswr1WDwZJj2S7mhEW8w==
X-Received: by 2002:a1c:f704:: with SMTP id v4mr361727wmh.90.1567097450438;
 Thu, 29 Aug 2019 09:50:50 -0700 (PDT)
Received: from green.intra.ispras.ru (bran.ispras.ru. [83.149.199.196])
 by smtp.googlemail.com with ESMTPSA id o14sm8340770wrg.64.2019.08.29.09.50.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 09:50:49 -0700 (PDT)
From: Denis Efremov <efremov@linux.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 01/11] checkpatch: check for nested (un)?likely() calls
Date: Thu, 29 Aug 2019 19:50:15 +0300
Message-Id: <20190829165025.15750-1-efremov@linux.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 30 Aug 2019 08:29:17 +0000
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
Cc: dri-devel@lists.freedesktop.org, Leon Romanovsky <leon@kernel.org>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, linux-rdma@vger.kernel.org,
 Inaky Perez-Gonzalez <inaky.perez-gonzalez@intel.com>,
 Saeed Mahameed <saeedm@mellanox.com>, linux-input@vger.kernel.org,
 xen-devel@lists.xenproject.org, Boris Pismenny <borisp@mellanox.com>,
 linux-arm-msm@vger.kernel.org, Denis Efremov <efremov@linux.com>,
 linux-wimax@intel.com, Joe Perches <joe@perches.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Andy Whitcroft <apw@canonical.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Sean Paul <sean@poorly.run>,
 Anton Altaparmakov <anton@tuxera.com>, Juergen Gross <jgross@suse.com>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 linux-ntfs-dev@lists.sourceforge.net, netdev@vger.kernel.org,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-xfs@vger.kernel.org,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SVNfRVJSKCksIElTX0VSUl9PUl9OVUxMKCksIElTX0VSUl9WQUxVRSgpIGFuZCBXQVJOKigpIGFs
cmVhZHkgY29udGFpbgp1bmxpa2VseSgpIG9wdGltaXphdGlvbiBpbnRlcm5hbGx5LiBUaHVzLCB0
aGVyZSBpcyBubyBwb2ludCBpbiBjYWxsaW5nCnRoZXNlIGZ1bmN0aW9ucyBhbmQgZGVmaW5lcyB1
bmRlciBsaWtlbHkoKS91bmxpa2VseSgpLgoKVGhpcyBjaGVjayBpcyBiYXNlZCBvbiB0aGUgY29j
Y2luZWxsZSBydWxlIGRldmVsb3BlZCBieSBFbnJpY28gV2VpZ2VsdApodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9sa21sLzE1NTk3Njc1ODItMTEwODEtMS1naXQtc2VuZC1lbWFpbC1pbmZvQG1ldHV4
Lm5ldC8KClNpZ25lZC1vZmYtYnk6IERlbmlzIEVmcmVtb3YgPGVmcmVtb3ZAbGludXguY29tPgpD
YzogSm9lIFBlcmNoZXMgPGpvZUBwZXJjaGVzLmNvbT4KQ2M6IEFuZHJldyBNb3J0b24gPGFrcG1A
bGludXgtZm91bmRhdGlvbi5vcmc+CkNjOiBBbmR5IFdoaXRjcm9mdCA8YXB3QGNhbm9uaWNhbC5j
b20+Ci0tLQogc2NyaXB0cy9jaGVja3BhdGNoLnBsIHwgNiArKysrKysKIDEgZmlsZSBjaGFuZ2Vk
LCA2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgYi9z
Y3JpcHRzL2NoZWNrcGF0Y2gucGwKaW5kZXggOTNhN2VkZmUwZjA1Li41Njk2OWNlMDZkZjQgMTAw
NzU1Ci0tLSBhL3NjcmlwdHMvY2hlY2twYXRjaC5wbAorKysgYi9zY3JpcHRzL2NoZWNrcGF0Y2gu
cGwKQEAgLTY0ODAsNiArNjQ4MCwxMiBAQCBzdWIgcHJvY2VzcyB7CiAJCQkgICAgICJVc2luZyAk
MSBzaG91bGQgZ2VuZXJhbGx5IGhhdmUgcGFyZW50aGVzZXMgYXJvdW5kIHRoZSBjb21wYXJpc29u
XG4iIC4gJGhlcmVjdXJyKTsKIAkJfQogCisjIG5lc3RlZCBsaWtlbHkvdW5saWtlbHkgY2FsbHMK
KwkJaWYgKCRsaW5lID1+IC9cYig/Oig/OnVuKT9saWtlbHkpXHMqXChccyohP1xzKihJU19FUlIo
PzpfT1JfTlVMTHxfVkFMVUUpP3xXQVJOKS8pIHsKKwkJCVdBUk4oIkxJS0VMWV9NSVNVU0UiLAor
CQkJICAgICAibmVzdGVkICh1bik/bGlrZWx5KCkgY2FsbHMsICQxIGFscmVhZHkgdXNlcyB1bmxp
a2VseSgpIGludGVybmFsbHlcbiIgLiAkaGVyZWN1cnIpOworCQl9CisKICMgd2hpbmUgbWlnaHRs
eSBhYm91dCBpbl9hdG9taWMKIAkJaWYgKCRsaW5lID1+IC9cYmluX2F0b21pY1xzKlwoLykgewog
CQkJaWYgKCRyZWFsZmlsZSA9fiBtQF5kcml2ZXJzL0ApIHsKLS0gCjIuMjEuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
