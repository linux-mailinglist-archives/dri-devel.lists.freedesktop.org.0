Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A60A22C49B
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jul 2020 13:57:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AC4B6E964;
	Fri, 24 Jul 2020 11:56:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3844E6E957
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jul 2020 11:56:14 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id d18so6828354edv.6
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jul 2020 04:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ps9+xQPfhPrna3QhEcqhAU0UoKfo559zZYMd9ZBOWWw=;
 b=qFgiaU0ZOtqVH4uo70kLhBqlkprZ3wodYBfTvTwu7kY7wlcT3q/qV85lo5cw0pb6Nh
 SKZLiOJcAnpUH83l5/guO5lpS6SycItr28G5AUvD+v0bwBJUV/5pFHem2NwdJhXTQ+Jj
 1xUfOkhpmo6UBi+liz/C0Gig8CM5hFld7xl7dbdUTG7REgN5cNGrHRZoi1MqnJpKK8B1
 xMskU8/+nUQHnTxQzfqkzh0W1fGW3Quooowen/16Ho2u/UiKfOv9lAL+n7Vn96BmGSql
 6Rb+YYwkNuSAymlVSLV4ilQBRH0EIHKbXSrE8yyb0Db0ezbKR2cUOPDe7rx2TeLBfDpx
 aMfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ps9+xQPfhPrna3QhEcqhAU0UoKfo559zZYMd9ZBOWWw=;
 b=klgFmefiKrskle0Tfna1WcYamT5F/vAuES0FB1EfLfYIEdGdpXwV3gK9yOltkQJg+P
 E+uLH8dFgb1Of5HsuWPVsqVRgZm+3fJAtQx2w7ge4eJuZJStnqOFSwKp7ooicS7nkZCw
 oLYp68JZh8QTDONFxJpY4pn9cjP8Y3NYaXN7BHL33INq8GDTeT2n2lLocyNtfYCWyGhT
 xXEH3kNRmGpnZnLThcAVqBPnNOxmSH8hNn8kgqiRSu7Utl21xb1lXB2tPjQuyv1wGAcd
 ODKM5zThs1oBRrIGrfz3yk3Gv7Tl3p4YRp/Oh0Z/3XM43X0bT0r7ph6CA2N5Y/vgx+Ku
 qR+A==
X-Gm-Message-State: AOAM532P2EiU5h57alxDBQFyBl5QiYKHLxMTaYrL5Adl8ROZ9yKK0Z05
 JLo8Qx+r2/XbdhnDo0tlFk+91BkO
X-Google-Smtp-Source: ABdhPJz0jEuVeuclJOzg0rusJwk5TJ05nnl13iBgKJ2yLRIuNcWJHVbQplnR7kXy6xpQPsfM4A7CJA==
X-Received: by 2002:a05:6402:319b:: with SMTP id
 di27mr8692795edb.133.1595591772547; 
 Fri, 24 Jul 2020 04:56:12 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:1969:d8fc:c333:bd5a])
 by smtp.gmail.com with ESMTPSA id dj22sm560020edb.54.2020.07.24.04.56.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2020 04:56:12 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: fix pipelined gutting for evictions v2
Date: Fri, 24 Jul 2020 13:56:11 +0200
Message-Id: <20200724115611.15375-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Alex.Sierra@amd.com, Philip.Yang@amd.com, Felix.Kuehling@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgY2FuJ3QgcGlwZWxpbmUgdGhhdCBkdXJpbmcgZXZpY3Rpb24gYmVjYXVzZSB0aGUgbWVtb3J5
IG5lZWRzCnRvIGJlIGF2YWlsYWJsZSBpbW1lZGlhdGVseS4KCnYyOiBmaXggaG93IHdlIGNsZWFu
dXAgdGhlIEJPcyByZXNvdXJjZXMKClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNo
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5j
IHwgOCArKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIGIvZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fYm8uYwppbmRleCAwNzY4YTA1NGE5MTYuLjQ2OWFhOTNlYTMxNyAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9iby5jCkBAIC02NTIsOCArNjUyLDEyIEBAIHN0YXRpYyBpbnQgdHRtX2Jv
X2V2aWN0KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCiAJcGxhY2VtZW50Lm51bV9idXN5
X3BsYWNlbWVudCA9IDA7CiAJYmRldi0+ZHJpdmVyLT5ldmljdF9mbGFncyhibywgJnBsYWNlbWVu
dCk7CiAKLQlpZiAoIXBsYWNlbWVudC5udW1fcGxhY2VtZW50ICYmICFwbGFjZW1lbnQubnVtX2J1
c3lfcGxhY2VtZW50KQotCQlyZXR1cm4gdHRtX2JvX3BpcGVsaW5lX2d1dHRpbmcoYm8pOworCWlm
ICghcGxhY2VtZW50Lm51bV9wbGFjZW1lbnQgJiYgIXBsYWNlbWVudC5udW1fYnVzeV9wbGFjZW1l
bnQpIHsKKwkJdHRtX2JvX3dhaXQoYm8sIGZhbHNlLCBmYWxzZSk7CisKKwkJdHRtX2JvX2NsZWFu
dXBfbWVtdHlwZV91c2UoYm8pOworCQlyZXR1cm4gMDsKKwl9CiAKIAlldmljdF9tZW0gPSBiby0+
bWVtOwogCWV2aWN0X21lbS5tbV9ub2RlID0gTlVMTDsKLS0gCjIuMTcuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
