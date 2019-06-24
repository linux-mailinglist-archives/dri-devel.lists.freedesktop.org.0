Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B64B050D0A
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 15:59:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 012DB89BAF;
	Mon, 24 Jun 2019 13:58:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3F9089B65;
 Mon, 24 Jun 2019 13:58:44 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id d18so14051336wrs.5;
 Mon, 24 Jun 2019 06:58:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X/Ddz4BsAQiAV9qvChmuYB8diI88JLFrEunb+dejOTU=;
 b=Y9m5JZX9Yw2f/omnRIKFk+Yh/sO+lSRSRCZ6TfnW2Rt7sS5pexMX11rPnlaqhCg7l4
 1mkw/cW/yf3IiLtbynwUglWxFRuWOxxVDmxg8ng9lOaRNa49I9IK+bbPes33EORVmjax
 KOFQlexKlWph7j/DNDmoX/4xc+HT49sxdBk7zro1DB3IJr8jKbwGiLDXy8GnYcujnsJ9
 QiIOQ8WF/H2mYL9J3U5H64tJGbFygJwE2MXv3Lt48HH3vuci/Om8UddloQd1M0TWOhET
 8QC6ZCsRtmXo/hC4esquzZu1euYoawxawQPBb5RY+TsX2w9tvhXBELE2xACTKTWBwPmU
 gqCA==
X-Gm-Message-State: APjAAAWUFxxH4lSGEvknKtW2znVLSoBvOufQjrJJNzh9M/LzfmF/Plh1
 R7F0hFEGj0HSZErc2XIqUaOK8Czh
X-Google-Smtp-Source: APXvYqyJi9tfvosMzdBDUogvcocFeD5pXvHPe+o5pkdG2MI5egKjL15nolaJilpWJm8a46IbJr57RQ==
X-Received: by 2002:adf:f1d1:: with SMTP id z17mr2701067wro.190.1561384723196; 
 Mon, 24 Jun 2019 06:58:43 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:c026:1db1:e413:81a2])
 by smtp.gmail.com with ESMTPSA id y19sm14848623wmc.21.2019.06.24.06.58.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Jun 2019 06:58:42 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH 4/6] drm/amdgpu: use allowed_domains for exported DMA-bufs
Date: Mon, 24 Jun 2019 15:58:37 +0200
Message-Id: <20190624135839.1661-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190624135839.1661-1-christian.koenig@amd.com>
References: <20190624135839.1661-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=X/Ddz4BsAQiAV9qvChmuYB8diI88JLFrEunb+dejOTU=;
 b=gpocmnG3kKF1dAJbZ64EhgNbLaXeIggJc/rAmG1mM2ONkEj6rHgL7jPZefqV7jYCoG
 ELPYGk0/aW4oUEqFvl28ARPg/nqsEX001vAi/pjsoPsO+mcLGHpn/0XQZZ5TEkAzNmOT
 NfngVdJd52sD7PdDftckxM1WU8RetXe9IPeBSZm8MsgkXV818zAOtApipDVHiK6STZlk
 cB1/fuD/trtWzlwCbcX5AejLww1p9/sf80ExPt94re5YJVLyXPMw7gp6d5rVSDW3sgyL
 +UJeeoWiQJ5U3gpAyxsCOb09HNoIKA+P+uHwgBfZEYvyF7sY86DTcSNN9z2dbe0rsJcZ
 FBcA==
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
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jCmluZGV4IGRjNjM3MDdlNDI2Zi4u
MGRhNTEyMzQxMTk0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfY3MuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYwpAQCAt
MjgsNiArMjgsNyBAQAogI2luY2x1ZGUgPGxpbnV4L2ZpbGUuaD4KICNpbmNsdWRlIDxsaW51eC9w
YWdlbWFwLmg+CiAjaW5jbHVkZSA8bGludXgvc3luY19maWxlLmg+CisjaW5jbHVkZSA8bGludXgv
ZG1hLWJ1Zi5oPgogCiAjaW5jbHVkZSA8ZHJtL2FtZGdwdV9kcm0uaD4KICNpbmNsdWRlIDxkcm0v
ZHJtX3N5bmNvYmouaD4KQEAgLTQxNCw3ICs0MTUsOSBAQCBzdGF0aWMgaW50IGFtZGdwdV9jc19i
b192YWxpZGF0ZShzdHJ1Y3QgYW1kZ3B1X2NzX3BhcnNlciAqcCwKIAkvKiBEb24ndCBtb3ZlIHRo
aXMgYnVmZmVyIGlmIHdlIGhhdmUgZGVwbGV0ZWQgb3VyIGFsbG93YW5jZQogCSAqIHRvIG1vdmUg
aXQuIERvbid0IG1vdmUgYW55dGhpbmcgaWYgdGhlIHRocmVzaG9sZCBpcyB6ZXJvLgogCSAqLwot
CWlmIChwLT5ieXRlc19tb3ZlZCA8IHAtPmJ5dGVzX21vdmVkX3RocmVzaG9sZCkgeworCWlmIChw
LT5ieXRlc19tb3ZlZCA8IHAtPmJ5dGVzX21vdmVkX3RocmVzaG9sZCAmJgorCSAgICAoIWJvLT5n
ZW1fYmFzZS5kbWFfYnVmIHx8CisJICAgIGxpc3RfZW1wdHkoJmJvLT5nZW1fYmFzZS5kbWFfYnVm
LT5hdHRhY2htZW50cykpKSB7CiAJCWlmICghYW1kZ3B1X2dtY192cmFtX2Z1bGxfdmlzaWJsZSgm
YWRldi0+Z21jKSAmJgogCQkgICAgKGJvLT5mbGFncyAmIEFNREdQVV9HRU1fQ1JFQVRFX0NQVV9B
Q0NFU1NfUkVRVUlSRUQpKSB7CiAJCQkvKiBBbmQgZG9uJ3QgbW92ZSBhIENQVV9BQ0NFU1NfUkVR
VUlSRUQgQk8gdG8gbGltaXRlZAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
