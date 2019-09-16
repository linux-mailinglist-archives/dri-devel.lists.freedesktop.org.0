Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07370B353C
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 09:11:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E9136E114;
	Mon, 16 Sep 2019 07:11:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5D736E114
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 07:11:31 +0000 (UTC)
Received: from [192.168.12.205] (helo=localhost.localdomain)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1i9lAX-00040d-AX; Mon, 16 Sep 2019 09:11:29 +0200
From: Iago Toral Quiroga <itoral@igalia.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/v3d: don't leak bin job if v3d_job_init fails.
Date: Mon, 16 Sep 2019 09:11:25 +0200
Message-Id: <20190916071125.5255-1-itoral@igalia.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; s=20170329; 
 h=Message-Id:Date:Subject:Cc:To:From;
 bh=+o3diaoC5+PdB44OtueaL8mTMKoNOeI3B686MinHTqA=; 
 b=Qx0nLMxKwAq/GRFOi/uPCDbvilO7vGQn+ma3c+6HjeRrP+5MOsDvzBuI4RmI6K4YAxM1CqUdSJQDPlGzgZHgwrCJVepegOE+DzzctMkReHx+Zwb60nsfY2o1nmqIhiF97X1s5wA4UZpP+Eq242SnYEJ0KkmsaHaGLU8YJ7t4rZWgI0O5Wv0KGxEnChC5jipD71WTFsSBgUy7YR+7rmqqULkTAIvmo38aG1/udFvCW9qh2vFLDAXpw8vRuUZzBagxPML9NYSdlrmjIYuWZhaUH+DvQcS2i5SdKDhCa6/Dkx1tbdRgriqtG92QolYPTkYCwkldQVd+S1Vy6tzVIhj9Ag==;
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
Cc: Iago Toral Quiroga <itoral@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgdGhlIGluaXRpYWxpemF0aW9uIG9mIHRoZSBqb2IgZmFpbHMgd2UgbmVlZCB0byBrZnJlZSgp
IGl0CmJlZm9yZSByZXR1cm5pbmcuCgpTaWduZWQtb2ZmLWJ5OiBJYWdvIFRvcmFsIFF1aXJvZ2Eg
PGl0b3JhbEBpZ2FsaWEuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS92M2QvdjNkX2dlbS5jIHwg
MSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vdjNkL3YzZF9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS92M2QvdjNkX2dlbS5jCmlu
ZGV4IGQ0NmQ5MTM0NmQwOS4uZWQ2ODczMTQwNGE3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vdjNkL3YzZF9nZW0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdjNkL3YzZF9nZW0uYwpAQCAt
NTY2LDYgKzU2Niw3IEBAIHYzZF9zdWJtaXRfY2xfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRl
diwgdm9pZCAqZGF0YSwKIAkJcmV0ID0gdjNkX2pvYl9pbml0KHYzZCwgZmlsZV9wcml2LCAmYmlu
LT5iYXNlLAogCQkJCSAgIHYzZF9qb2JfZnJlZSwgYXJncy0+aW5fc3luY19iY2wpOwogCQlpZiAo
cmV0KSB7CisJCQlrZnJlZShiaW4pOwogCQkJdjNkX2pvYl9wdXQoJnJlbmRlci0+YmFzZSk7CiAJ
CQlyZXR1cm4gcmV0OwogCQl9Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
