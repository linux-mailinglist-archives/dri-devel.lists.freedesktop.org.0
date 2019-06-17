Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A21480CD
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 13:34:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D881891C4;
	Mon, 17 Jun 2019 11:34:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3A9089187;
 Mon, 17 Jun 2019 11:34:18 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 207so8877710wma.1;
 Mon, 17 Jun 2019 04:34:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p9wRG1vgieI5Tw7lzVfOuELR6Jdrkf3meS0vFGCuHyY=;
 b=E/+wf6qkoP+KeDy2WcuhyJ4qKEyKBIAlGVcAlsnbJ/pM1CcVEx2y6B/2pG32k79oIG
 tsVjBlnSpxcFYad6N3EvvuCkJ3+Hi+X7FzTKvu5ceTS3QBmtS+8z9P+iPYmBz25UPKU+
 PnZJ6ThYYmFro3UQWj3AW46JwnUZJSEdULxVloKsXR7Xuqccah92Dr9ppJoOlobSZziN
 9s18wzo1MtCVBU5VhVMCQT2M5HvNBYfl+ri8grTCWjO4YYQM7sJGpj+MFLMWO3CTrkIx
 PIfUE1+7zqv9Tkatk8WOGSElqwT6csuwzQikHzJXtYhVqfcpe2BdYSJA/Nt0PhnD3271
 IQgA==
X-Gm-Message-State: APjAAAUkcL/lQUNqagiEpScJPT+Pcvmnm8mHWF4MFN70gpLNvmbNJK2w
 z6QFUHeGxgXAjqqGUzFhRbrfI08d
X-Google-Smtp-Source: APXvYqxsXhHMPgRwrs4rpRPK5XHcoymdZ1csfQY/RYz+83xNMIKi/A/UKF6TMCJYarPwODvtZNKeRQ==
X-Received: by 2002:a1c:f515:: with SMTP id t21mr19524409wmh.39.1560771257479; 
 Mon, 17 Jun 2019 04:34:17 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:ad86:6268:1a78:d4c])
 by smtp.gmail.com with ESMTPSA id s188sm12062110wmf.40.2019.06.17.04.34.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jun 2019 04:34:17 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH 4/6] drm/amdgpu: use allowed_domains for exported DMA-bufs
Date: Mon, 17 Jun 2019 13:34:11 +0200
Message-Id: <20190617113413.1869-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190617113413.1869-1-christian.koenig@amd.com>
References: <20190617113413.1869-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=p9wRG1vgieI5Tw7lzVfOuELR6Jdrkf3meS0vFGCuHyY=;
 b=oNiUEkrrV9YlMEhpbW5P79n6wtNM+jJlv9k/3TzAAX7UJ27q8K2D43pECXalzjWL7U
 lGgzYRdhyBa4+VjEr988meUJhqJTOQgac+fFv5m2xxEUQ4lnf4ohWYCPbvNVOYJz+eMn
 dbEX9gHrSTpVWgovEbjbI4VmtXZzb0mTvhBfix3XGh+hzYe5icQM76S5xUq/e7dCsHSj
 Jib7oocQLBqmQILbcwrgOYPbGWwIekWBvexSmWU63rjtikg26kz/yXZQwJbMcWQPKHNM
 hDVT1RSDIkJdoym+5qJrI63E7mRoUobbgnxG2Dx7kzH9ew48A5oNQp4zY4ZSExQVq1IG
 ftjg==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXZvaWQgdGhhdCB3ZSBwaW5nL3BvbmcgdGhlIGJ1ZmZlcnMgd2hlbiB3ZSBzdG9wIHRvIHBpbiBE
TUEtYnVmCmV4cG9ydHMgYnkgdXNpbmcgdGhlIGFsbG93ZWQgZG9tYWlucyBmb3IgZXhwb3J0ZWQg
YnVmZmVycy4KClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYyB8
IDUgKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jCmluZGV4IDNlMmRhMjRjZDE3YS4u
YTU5NzgwNjU0MzM1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfY3MuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYwpAQCAt
MjYsNiArMjYsNyBAQAogICovCiAjaW5jbHVkZSA8bGludXgvcGFnZW1hcC5oPgogI2luY2x1ZGUg
PGxpbnV4L3N5bmNfZmlsZS5oPgorI2luY2x1ZGUgPGxpbnV4L2RtYS1idWYuaD4KICNpbmNsdWRl
IDxkcm0vZHJtUC5oPgogI2luY2x1ZGUgPGRybS9hbWRncHVfZHJtLmg+CiAjaW5jbHVkZSA8ZHJt
L2RybV9zeW5jb2JqLmg+CkBAIC00MTIsNyArNDEzLDkgQEAgc3RhdGljIGludCBhbWRncHVfY3Nf
Ym9fdmFsaWRhdGUoc3RydWN0IGFtZGdwdV9jc19wYXJzZXIgKnAsCiAJLyogRG9uJ3QgbW92ZSB0
aGlzIGJ1ZmZlciBpZiB3ZSBoYXZlIGRlcGxldGVkIG91ciBhbGxvd2FuY2UKIAkgKiB0byBtb3Zl
IGl0LiBEb24ndCBtb3ZlIGFueXRoaW5nIGlmIHRoZSB0aHJlc2hvbGQgaXMgemVyby4KIAkgKi8K
LQlpZiAocC0+Ynl0ZXNfbW92ZWQgPCBwLT5ieXRlc19tb3ZlZF90aHJlc2hvbGQpIHsKKwlpZiAo
cC0+Ynl0ZXNfbW92ZWQgPCBwLT5ieXRlc19tb3ZlZF90aHJlc2hvbGQgJiYKKwkgICAgKCFiby0+
Z2VtX2Jhc2UuZG1hX2J1ZiB8fAorCSAgICBsaXN0X2VtcHR5KCZiby0+Z2VtX2Jhc2UuZG1hX2J1
Zi0+YXR0YWNobWVudHMpKSkgewogCQlpZiAoIWFtZGdwdV9nbWNfdnJhbV9mdWxsX3Zpc2libGUo
JmFkZXYtPmdtYykgJiYKIAkJICAgIChiby0+ZmxhZ3MgJiBBTURHUFVfR0VNX0NSRUFURV9DUFVf
QUNDRVNTX1JFUVVJUkVEKSkgewogCQkJLyogQW5kIGRvbid0IG1vdmUgYSBDUFVfQUNDRVNTX1JF
UVVJUkVEIEJPIHRvIGxpbWl0ZWQKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
