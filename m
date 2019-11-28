Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9114310CBDE
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 16:37:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0844389C05;
	Thu, 28 Nov 2019 15:37:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECB3C89A32
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 15:37:46 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id b11so11353995wmj.4
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 07:37:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FuaMjHIYXz5VbkPp7vbASLG/rrUrkAh/Y4RiebzPwjs=;
 b=AWM7g0K2cD31vMxCZHvzXMn8671mah5v8O5Gz1oeOgcqglAdtrCWJ0FFgpwtEC51wA
 e0maYxgbWkeRnBw5X1QiiYBFQpu8m3b363n0MblAIEWfCiJICaWUsF2DBSh1QFvQaUdO
 s6ZIiOUVHXhUjv52PdDicu+8Zil1sjDC5sTNZoon7drY0E5Cb1BcLCDOZ24MBfQ33Aq/
 0OV+uXvzH9V89drxEK6vzseWIHYv2pwMEPLTnfNXs0ZT2mx/3XZ2ydz++BdZ4tp9EJCn
 eG1CVefucrXY7rRgu9QjYulKBuF+DYvF+gdhIxqmPBac2cYFXcyqqz9fpPBZfHq5lS7f
 OI7A==
X-Gm-Message-State: APjAAAWRtzQ1NhdRLS3P32R/UFLfAa1Jw4sP44UNSd/kQ9Y0A1bSs8ud
 nYSLqLcKRiX3ijchTGRIQDE=
X-Google-Smtp-Source: APXvYqz3xn9e/51N3n2xNkmI65xr2AXQvgtC2eYygg+gDmItvMgd2G741V/Gq9zZHrNaDz+YYsbjIQ==
X-Received: by 2002:a1c:2b82:: with SMTP id
 r124mr10347797wmr.112.1574955465466; 
 Thu, 28 Nov 2019 07:37:45 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
 by smtp.gmail.com with ESMTPSA id c1sm23139312wrs.24.2019.11.28.07.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2019 07:37:44 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 1/9] drm/tegra: hub: Remove bogus connection mutex check
Date: Thu, 28 Nov 2019 16:37:33 +0100
Message-Id: <20191128153741.2380419-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191128153741.2380419-1-thierry.reding@gmail.com>
References: <20191128153741.2380419-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FuaMjHIYXz5VbkPp7vbASLG/rrUrkAh/Y4RiebzPwjs=;
 b=arJ/EiNSglJZooI0IbSwGn/phEGeIcEiQBRbY5c79Z0DlyHqdtluiaLR8Umjwj+K/+
 1V2gaVPdNHfbO1Oa0zuObZ20yVDuGnjpXTByLmvFY/zbZnFRMhBSnDrMbM9nPByW0xAO
 oSoqpOBVKIH269zBTr7Wjv1c0Qlfq1ijiLjD7Xin5qStp+tKNaAGTmBkdHhT+Zq55z/S
 1PjTtUTJvXCBbKODwbRivMN7UA5CoQJNWDih6P9uADojnFjgSa2nXpfMRGawWneF+leT
 vSvXQDF4m71q+JqhUarq963w0+jl22pGjJdF9Age5CIRDEozWdOZGrPG11SwN3CIvSDx
 9ARg==
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCkkgaGF2ZSBubyByZWNv
bGxlY3Rpb24gd2h5IHRoYXQgY2hlY2sgaXMgdGhlcmUsIGJ1dCBpdCBzZWVtcyB0byB0cmlnZ2Vy
CmFsbCB0aGUgdGltZSwgc28gcmVtb3ZlIGl0LiBFdmVyeXRoaW5nIHdvcmtzIGZpbmUgd2l0aG91
dC4KClNpZ25lZC1vZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2h1Yi5jIHwgMyAtLS0KIDEgZmlsZSBjaGFuZ2VkLCAz
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9odWIuYyBi
L2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9odWIuYwppbmRleCA2YWNhMGZkNWE4ZTUuLmU1NmMwZjdk
M2ExMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2h1Yi5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS90ZWdyYS9odWIuYwpAQCAtNjE1LDExICs2MTUsOCBAQCBzdGF0aWMgc3RydWN0
IHRlZ3JhX2Rpc3BsYXlfaHViX3N0YXRlICoKIHRlZ3JhX2Rpc3BsYXlfaHViX2dldF9zdGF0ZShz
dHJ1Y3QgdGVncmFfZGlzcGxheV9odWIgKmh1YiwKIAkJCSAgICBzdHJ1Y3QgZHJtX2F0b21pY19z
dGF0ZSAqc3RhdGUpCiB7Ci0Jc3RydWN0IGRybV9kZXZpY2UgKmRybSA9IGRldl9nZXRfZHJ2ZGF0
YShodWItPmNsaWVudC5wYXJlbnQpOwogCXN0cnVjdCBkcm1fcHJpdmF0ZV9zdGF0ZSAqcHJpdjsK
IAotCVdBUk5fT04oIWRybV9tb2Rlc2V0X2lzX2xvY2tlZCgmZHJtLT5tb2RlX2NvbmZpZy5jb25u
ZWN0aW9uX211dGV4KSk7Ci0KIAlwcml2ID0gZHJtX2F0b21pY19nZXRfcHJpdmF0ZV9vYmpfc3Rh
dGUoc3RhdGUsICZodWItPmJhc2UpOwogCWlmIChJU19FUlIocHJpdikpCiAJCXJldHVybiBFUlJf
Q0FTVChwcml2KTsKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
