Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3FE1C93F0
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 17:11:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8432D6E9FA;
	Thu,  7 May 2020 15:11:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 388FE6E9FA;
 Thu,  7 May 2020 15:11:01 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id s8so6841608wrt.9;
 Thu, 07 May 2020 08:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rLELSkIkXqc4MjKeYvGm92qJZ3Zy9onyXpkjbBhy6wg=;
 b=Yr+Vmi6QKlnofxOYiNtwd3eAoXde2UhusYr5PcDyQb5Z0Q9cLezYKD/VJtzOzfR5xu
 fd19PV2zRLEhANF8hyKJJvBU/zWK/xen+TJ8UZbAdaFqN20+qNCke0BmfE042HaBY/p3
 EOWFnlGN9cSqctiNA8dM3UnFj2LjE8W8K91UFnP56MkgmmwkmT4L2n8aos6fSsfPWM/T
 yDzb1ZUpi/+1byj1vqHXbCaN/Cq1l0+3Gi8+CCGbZbII8WNsFvimC7QW3bskOuvA4xAn
 7F2L0UvG2ZRdp6SNhnTL8AJHzvPFH8kzdoIgoXV/QLK21JGlkG22hwcby4W58H0ngVKe
 DhfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rLELSkIkXqc4MjKeYvGm92qJZ3Zy9onyXpkjbBhy6wg=;
 b=QOpy9+8n0/TXtAvfceDacO6XlJTODGtNvEzdKB/Il1GJvT0BcGpzxMyK0ibTxk+KTs
 COs3J52VwdZ9WaImV+dQZUwgHK5Ckip//mwqGR9No5GHEvJMqMYGqnTjspF2Url4A+C8
 oDslHKGI15vg2CFOk5+CwE0PNwTUnA8h0AbbPnHok+zKe+efjaDzPXH1ILafijmRHQGt
 Ydb9VFe7yxZpB1XdMATtjx52WekQoLbIpsDwLFVyE6DVIdf7H3Ga04XE2eLqDXYAfU6C
 /ykpiZChUcJEKRF5Sq0W41xkerQaQjMZKsacfjrOOeY4W3XsPSBquXCp2/8P5QQ/L0zl
 dWjw==
X-Gm-Message-State: AGi0Pubqgv5TnWMAf+rkO4D4vMPlyt4iuOCGclHAcBuKdFLc2T3AOyZ6
 rCHe+FmtZ+JVC8ETZcbiQN+EYQj/
X-Google-Smtp-Source: APiQypKaNSaGj3/LMepeWJU0dApnhwNxtE8TWXTJaCbSNqB3o/LoIfwsHTqlbZro+OBCI6xtsDPPag==
X-Received: by 2002:a5d:49c3:: with SMTP id t3mr14981243wrs.94.1588864259352; 
 Thu, 07 May 2020 08:10:59 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id b66sm8704247wmh.12.2020.05.07.08.10.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 08:10:58 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 06/36] drm/amdgpu: use the unlocked drm_gem_object_put
Date: Thu,  7 May 2020 16:07:52 +0100
Message-Id: <20200507150822.114464-7-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200507150822.114464-1-emil.l.velikov@gmail.com>
References: <20200507150822.114464-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Alex Deucher <alexander.deucher@amd.com>, emil.l.velikov@gmail.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KClRoZSBkcml2
ZXIgZG9lcyBub3QgaG9sZCBzdHJ1Y3RfbXV0ZXgsIHRodXMgdXNpbmcgdGhlIGxvY2tlZCB2ZXJz
aW9uIG9mCnRoZSBoZWxwZXIgaXMgaW5jb3JyZWN0LgoKQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFu
ZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkZpeGVzOiBhMzk0
MTQ3MTZjYTAgKCJkcm0vYW1kZ3B1OiBhZGQgaW5kZXBlbmRlbnQgRE1BLWJ1ZiBpbXBvcnQgdjki
KToKU2lnbmVkLW9mZi1ieTogRW1pbCBWZWxpa292IDxlbWlsLmwudmVsaWtvdkBnbWFpbC5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RtYV9idWYuYyB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kbWFfYnVmLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZG1hX2J1Zi5jCmluZGV4IDQzZDhlZDdkYmQwMC4u
NjUyYzU3YTNiODQ3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZG1hX2J1Zi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kbWFf
YnVmLmMKQEAgLTU4Nyw3ICs1ODcsNyBAQCBzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKmFtZGdwdV9n
ZW1fcHJpbWVfaW1wb3J0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCiAJYXR0YWNoID0gZG1hX2J1
Zl9keW5hbWljX2F0dGFjaChkbWFfYnVmLCBkZXYtPmRldiwKIAkJCQkJJmFtZGdwdV9kbWFfYnVm
X2F0dGFjaF9vcHMsIG9iaik7CiAJaWYgKElTX0VSUihhdHRhY2gpKSB7Ci0JCWRybV9nZW1fb2Jq
ZWN0X3B1dChvYmopOworCQlkcm1fZ2VtX29iamVjdF9wdXRfdW5sb2NrZWQob2JqKTsKIAkJcmV0
dXJuIEVSUl9DQVNUKGF0dGFjaCk7CiAJfQogCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
