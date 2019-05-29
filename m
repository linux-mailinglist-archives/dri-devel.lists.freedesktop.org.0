Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C28F82DBAD
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 13:21:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D18D6E2D6;
	Wed, 29 May 2019 11:21:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61E996E07B;
 Wed, 29 May 2019 04:33:00 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id v9so537980pgr.13;
 Tue, 28 May 2019 21:33:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ft5rXWQC7qZY1CC5FQHfzy5+fXUuRaC5FnUn1SYIJ4g=;
 b=nDHtXBb2/xIue0KdkzM9/lkgGoGV2uRFC3gDTOepjYoBGUAFchEr1/4njB/TzktvFN
 8yWce4t7zjryNHzD8mvPZ6JX7Zf4SdnzXzpetd1PL63oNOxFEsY8WmTlyOBKFkgmNK2V
 GXtYr5WI0pyqH+Jx63VPqdUK3jaXQsRstXycdaFpQ9we3qrWPXw1YMuTf8cIDGYrUr8T
 XOh9hd1KeIXbRnhYgEYwoNVwoYfDaSEjFV5JO8RKp1RyfIZdW+KDJkKUf9+zDNueloxw
 BBGnHAKfu2bSJr8vjdTCAMQ8pm3stHkEVNiw40uitfcs3SKID3PsIHGFxd/tQ1+n0I7p
 gyfQ==
X-Gm-Message-State: APjAAAU/1TJ/DccFk40xd09LtmxHIqw0aBD8u1zDThP4ZGiPFJj3hZP/
 J10qkNsbtpG8RG12hbDNTIs=
X-Google-Smtp-Source: APXvYqzmyT7S78n/4DsveAwjgO/UKzog2hne8xPNPJxEP9EbTQGVRIVLElZgyGiLsZfQo/nbHZ3mHw==
X-Received: by 2002:a62:d205:: with SMTP id c5mr144778666pfg.219.1559104379972; 
 Tue, 28 May 2019 21:32:59 -0700 (PDT)
Received: from xy-data.openstacklocal
 (ecs-159-138-22-150.compute.hwclouds-dns.com. [159.138.22.150])
 by smtp.gmail.com with ESMTPSA id p16sm27777757pfq.153.2019.05.28.21.32.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 28 May 2019 21:32:59 -0700 (PDT)
From: Young Xiao <92siuyang@gmail.com>
To: rex.zhu@amd.com, evan.quan@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, David1.Zhou@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, kenneth.feng@amd.com, Hawking.Zhang@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd/powerplay: avoid possible buffer overflow
Date: Wed, 29 May 2019 12:34:07 +0800
Message-Id: <1559104447-26810-1-git-send-email-92siuyang@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Wed, 29 May 2019 11:20:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=ft5rXWQC7qZY1CC5FQHfzy5+fXUuRaC5FnUn1SYIJ4g=;
 b=O1dTBsRrFCdqAtUCxdSSwWT4O4+8pA5iN/NI4QP1btNMkoWtTdJA8hUZEzvzDDLm/j
 Hcwwe0s4uucPXyAQewv5YvmkPEyxUtT5rE7NPwgAZ6vIkeB0Iq5D2if/NkZz+3upZTCN
 FcZrAaNp1aGxH8Qbufp8pQXEEGwe2dpGlpqrEEKE1ySPkBcYGsp7C1Q9J6lIcO2tNAX+
 h9svGXXBHaKPQrvApeVRUndqgwv5j61p+gaIGSfhFnKnRDuD1mCT5cxs9Ezb+JUSw4va
 dU6E1dAXQZzdQma8+KD+Rv58qLRNYLv04HeHvjdLzvyu1hGW7NyNFpYBpHIHSq5F8GHH
 1Rbw==
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
Cc: Young Xiao <92siuyang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TWFrZSBzdXJlIHRoZSBjbG9jayBsZXZlbCBlbmZvcmNlZCBpcyB3aXRoaW4gdGhlIGFsbG93ZWQK
cmFuZ2VzIGluIGNhc2UgUFBfU0NMSyBhbmQgUFBfTUNMSy4KClNpZ25lZC1vZmYtYnk6IFlvdW5n
IFhpYW8gPDkyc2l1eWFuZ0BnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvaHdtZ3IvdmVnYTEyX2h3bWdyLmMgfCAxMiArKysrKysrKysrKysKIDEgZmlsZSBjaGFu
Z2VkLCAxMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvaHdtZ3IvdmVnYTEyX2h3bWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9od21nci92ZWdhMTJfaHdtZ3IuYwppbmRleCA3MDdjZDRiLi5hZTZjYmU4IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMTJfaHdtZ3IuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMTJfaHdtZ3IuYwpA
QCAtMTgzNiw2ICsxODM2LDEyIEBAIHN0YXRpYyBpbnQgdmVnYTEyX2ZvcmNlX2Nsb2NrX2xldmVs
KHN0cnVjdCBwcF9od21nciAqaHdtZ3IsCiAJY2FzZSBQUF9TQ0xLOgogCQlzb2Z0X21pbl9sZXZl
bCA9IG1hc2sgPyAoZmZzKG1hc2spIC0gMSkgOiAwOwogCQlzb2Z0X21heF9sZXZlbCA9IG1hc2sg
PyAoZmxzKG1hc2spIC0gMSkgOiAwOworCQlpZiAoc29mdF9tYXhfbGV2ZWwgPj0gZGF0YS0+ZHBt
X3RhYmxlLmdmeF90YWJsZS5jb3VudCkgeworCQkJcHJfZXJyKCJDbG9jayBsZXZlbCBzcGVjaWZp
ZWQgJWQgaXMgb3ZlciBtYXggYWxsb3dlZCAlZFxuIiwKKwkJCQkJc29mdF9tYXhfbGV2ZWwsCisJ
CQkJCWRhdGEtPmRwbV90YWJsZS5nZnhfdGFibGUuY291bnQgLSAxKTsKKwkJCXJldHVybiAtRUlO
VkFMOworCQl9CiAKIAkJZGF0YS0+ZHBtX3RhYmxlLmdmeF90YWJsZS5kcG1fc3RhdGUuc29mdF9t
aW5fbGV2ZWwgPQogCQkJZGF0YS0+ZHBtX3RhYmxlLmdmeF90YWJsZS5kcG1fbGV2ZWxzW3NvZnRf
bWluX2xldmVsXS52YWx1ZTsKQEAgLTE4NTYsNiArMTg2MiwxMiBAQCBzdGF0aWMgaW50IHZlZ2Ex
Ml9mb3JjZV9jbG9ja19sZXZlbChzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyLAogCWNhc2UgUFBfTUNM
SzoKIAkJc29mdF9taW5fbGV2ZWwgPSBtYXNrID8gKGZmcyhtYXNrKSAtIDEpIDogMDsKIAkJc29m
dF9tYXhfbGV2ZWwgPSBtYXNrID8gKGZscyhtYXNrKSAtIDEpIDogMDsKKwkJaWYgKHNvZnRfbWF4
X2xldmVsID49IGRhdGEtPmRwbV90YWJsZS5nZnhfdGFibGUuY291bnQpIHsKKwkJCXByX2Vycigi
Q2xvY2sgbGV2ZWwgc3BlY2lmaWVkICVkIGlzIG92ZXIgbWF4IGFsbG93ZWQgJWRcbiIsCisJCQkJ
CXNvZnRfbWF4X2xldmVsLAorCQkJCQlkYXRhLT5kcG1fdGFibGUuZ2Z4X3RhYmxlLmNvdW50IC0g
MSk7CisJCQlyZXR1cm4gLUVJTlZBTDsKKwkJfQogCiAJCWRhdGEtPmRwbV90YWJsZS5tZW1fdGFi
bGUuZHBtX3N0YXRlLnNvZnRfbWluX2xldmVsID0KIAkJCWRhdGEtPmRwbV90YWJsZS5tZW1fdGFi
bGUuZHBtX2xldmVsc1tzb2Z0X21pbl9sZXZlbF0udmFsdWU7Ci0tIAoyLjcuNAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
