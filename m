Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9137F49FD4
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 13:55:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FF9C6E156;
	Tue, 18 Jun 2019 11:55:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CA926E151;
 Tue, 18 Jun 2019 11:55:01 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id k11so13662998wrl.1;
 Tue, 18 Jun 2019 04:55:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X/Ddz4BsAQiAV9qvChmuYB8diI88JLFrEunb+dejOTU=;
 b=NE3hfYG/T3rCWfqhG4/+dxzY7lcK7lm1RJTpIxXzxpBc7RFK/FZsKf5nKzRn4F+MFq
 Bb8tdl19LaILkGdBd9Ms4rK9Pjs71ucNQ3YIBfYIgSMCGXCD19wK4natBH6ux0N8iyFL
 FHoX+Otl3ZrO3CCVPM2zzH7KfDPKglQp60n4hVvmZwKDwyzBluUUgKIqoAuWcyzWN9du
 Ug4dDL20LFGmkyHeWcsYBMXaC+cJMDhRHtlbwGjWlC8okRQ31tKuHebdT9v4IcDkPzMW
 wrj1E37tk2Dh3/hhYAuB8YFPCWbSQ5ft/CNDw0Af6M7Pm7xR/r4NG1WiSf8aPFiySNs8
 IGzg==
X-Gm-Message-State: APjAAAVlDXn0sAfIXs1P20BKcOMkFP747npIZUb9ZCKhR2Hk3Ramun3x
 mqbGvgVwxb343d80BzEsXn3nUkih
X-Google-Smtp-Source: APXvYqzVPZs0gtS1klFlUx1lO9fmsPXYGPYKeVAArQh3140lcV/t9+TNFldIDSwSJDDnWKegKhK4Mw==
X-Received: by 2002:a5d:5302:: with SMTP id e2mr66313115wrv.347.1560858899141; 
 Tue, 18 Jun 2019 04:54:59 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:88da:f390:6b90:ca6c])
 by smtp.gmail.com with ESMTPSA id l19sm1441963wmj.33.2019.06.18.04.54.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 18 Jun 2019 04:54:58 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH 4/6] drm/amdgpu: use allowed_domains for exported DMA-bufs
Date: Tue, 18 Jun 2019 13:54:53 +0200
Message-Id: <20190618115455.1253-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190618115455.1253-1-christian.koenig@amd.com>
References: <20190618115455.1253-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=X/Ddz4BsAQiAV9qvChmuYB8diI88JLFrEunb+dejOTU=;
 b=mKYkx+hr3qaD8QOs3J7HC1CaAyqX7BOFFg/B+7PzsURbjVagQLZZKb3Ddu1Z6/v9lN
 Gk1ItdF7rEWBzAire8DG0qsUl+SuW4weRfQ3z38pmtDK95GctD/9s/Ok1rGancQjVlZ1
 KNxAmgmVukdRq3bRe0rknGmnY0b9bVNtL7BWvCrq5tNjWHYQL5z2JZU7Jq+CLUxKVdTp
 rlAZoKL8Gs/y1OpQlSvV0SPdsJtvHRfoEnOasceji6ITxyLmTuIC08b4m7wpzeR+5Q4i
 7IbCTDlT4gihkig2Cf2IR73a9gZqCU/8llvXtml8Igel2jP0fvPts9uqIrwFmIG1qqnA
 BW4g==
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
