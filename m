Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DBC568B2
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 14:23:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07ED36E3D2;
	Wed, 26 Jun 2019 12:23:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 700D46E3B2;
 Wed, 26 Jun 2019 12:23:16 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id f15so2527228wrp.2;
 Wed, 26 Jun 2019 05:23:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X/Ddz4BsAQiAV9qvChmuYB8diI88JLFrEunb+dejOTU=;
 b=AcNmGWFrWySLVNvOk6xayj8KQKDquc4m3HYq3jS9Viz5QF6H9awMgbFtR3btpiHN9f
 8+Br/kKUWVy+rfD0wRyAxJ98NzNwDtBoWGPUSkemJuGfzfZw562RyYVrxvP4iB6PxwMl
 J4sUDN5qQrDVKmlQEUFxu5dGhXj/eEOJXCltQxMxryrtOrtT3w3pS9x3vtKbjg1vHc5h
 J/H9AQIJaScUZnl6IcI5I1KVI+N7fjGrgFr1NGghjkZ+d+tG4EpujI+t2A+xQlnvC0lF
 1mHxwZ7/xC1n4AaCfSGpRZHsQQR9veXBIQ4yyaNykfWgXjzHNX/8fsh+ebzDeFoHUsYF
 fF+w==
X-Gm-Message-State: APjAAAXkDShYYdWBWb1ZG70WumM0AF3X+qLJnllrLzOkv08vefxej87C
 b1u6bwqDeRv9A0Q8xjWhKrvRr3z/
X-Google-Smtp-Source: APXvYqwMjN6/qMv/Nudu/dDR5p/6jXxF1ZkELee6ONqoog8b/t6xs2983OFe6sNeSKIOQJ5b6ACRdQ==
X-Received: by 2002:a5d:4cc3:: with SMTP id c3mr3607290wrt.259.1561551794783; 
 Wed, 26 Jun 2019 05:23:14 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:902c:2dc9:c30e:db03])
 by smtp.gmail.com with ESMTPSA id k125sm2262018wmf.41.2019.06.26.05.23.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Jun 2019 05:23:14 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH 4/6] drm/amdgpu: use allowed_domains for exported DMA-bufs
Date: Wed, 26 Jun 2019 14:23:08 +0200
Message-Id: <20190626122310.1498-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190626122310.1498-1-christian.koenig@amd.com>
References: <20190626122310.1498-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=X/Ddz4BsAQiAV9qvChmuYB8diI88JLFrEunb+dejOTU=;
 b=lyyhB1KR54ZAVvk49u5H1fXQ/BEPW0DB079m8Eyl1kl5kS5hLsqxhuj8hkgYeIRDY0
 nHSIavL3tC4OsvkI5G+PUEKTTfjnvC3rxSvhg97FWqLXzWMdw6zXaL2QyP42qPu5tS4d
 521x1q33oWFMQeeSeUZqU7ETPEiWn9cU/nrAyhV3richYe+WyqiDS00TttZXKyhzulex
 66+By/8jo9wdYmLza3D3jbeIskxd7CMJgxR6Kds2QeFfTdtmyGZLkY5uqe/A5caRFaob
 vnEDOdt4yj+xnfEbvq659cCjCr6ylrKpd4qORZjYrCLZbmhESwc6Ohl2mPuizbERdWa0
 1Flw==
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
