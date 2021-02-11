Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2E9318BBC
	for <lists+dri-devel@lfdr.de>; Thu, 11 Feb 2021 14:17:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9DC46EE28;
	Thu, 11 Feb 2021 13:17:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 017556EE27
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Feb 2021 13:17:03 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id sa23so10044631ejb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Feb 2021 05:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=WMPOtCBxs2H9TjKbXHVExhNj7fMc+PCRUAafVs4cBgM=;
 b=pPaIgRGy71t6f4VObcK93VV62qexhAV4/U8KPjgUBzW5v9RvUt89yqsQCnsEJ8SJbj
 GCcaDUEI6z8PtPCDfzGWlZ64WDZ4iAu6/L9froTSZy33MVIlxLy0vXeW5BMQud7Kgtkg
 BpHtSpGgYc1H2FX0OhTdGfGCsMs0Bd5Zg+X27VhaENaDj7uS9frwHEoLzNp4zSicmZ96
 oF7DDXfOGc++bxZBG5E2wbuJfqNW2ekXFUNetD6WL5ghk8Xz4axXH8wRHb31oR5f2U3D
 TzOqFIqQ4ZIMi1JGWSYC8qHUiXVR4koKIUmsLDkyc2QQLuY1+KXdmxzdzgdkTNRy/OdR
 ZIzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WMPOtCBxs2H9TjKbXHVExhNj7fMc+PCRUAafVs4cBgM=;
 b=nQWzIxbmoE+NIGaLNbLL0NioLpFIHB0OA/oVYK3IE79xkVYLZGOG2u1BzBBr/Wc4r7
 XnAefVEfLNSRzqRnYEcOoMdR7iQ57rk26EoXNAyMJzHJ5UquUge3OQ7JFgAoI7EL+eas
 K1ZHGbwk+H3kOaEDNoP3G+30YKy4EWmEHHmkCNzsrIk+8JJmOc2y1rtSXZZleW6kx/XP
 /Srj9Gi7acNs+izmDo3YVr+0C08u1JCt0XjUSaq1xyrGLqKEsYkQfMO+Rss6gtMxk76I
 3iakiA0KzndrMs2EU6OMK93VF+1U7l7MZ3/kTF9jzlt/9NfDXk+Ie3pKiFKkYw5QQAoL
 xtUw==
X-Gm-Message-State: AOAM533ciVOi0/rm3kHnhrMjxhdAC5TaZlGcnM7wnCYw0tFVTHcmNARG
 NXIqiP+FOs/kQruIZA36Bxw=
X-Google-Smtp-Source: ABdhPJzv4brBX+YQBn3IyWR6tV1wQfHX6Q/cqHQaZF+x6wx3ohXlgWc5Hgih3cNU6bb4D0OwYekbRA==
X-Received: by 2002:a17:906:71d5:: with SMTP id
 i21mr8699781ejk.232.1613049422619; 
 Thu, 11 Feb 2021 05:17:02 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:820:5af6:9146:2c9f])
 by smtp.gmail.com with ESMTPSA id l1sm4168614eje.12.2021.02.11.05.17.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 05:17:02 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 zackr@vmware.com, dri-devel@lists.freedesktop.org
Subject: [PATCH 3/4] drm/nouveau: clean up nouveau_bo_move_ntfy
Date: Thu, 11 Feb 2021 14:16:58 +0100
Message-Id: <20210211131659.276275-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210211131659.276275-1-christian.koenig@amd.com>
References: <20210211131659.276275-1-christian.koenig@amd.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SnVzdCBhbm90aGVyIGxlZnRvdmVyIGZyb20gYSBUVE0gY2xlYW51cC4KClNpZ25lZC1vZmYtYnk6
IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMgfCAxMyArKysrKy0tLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2
ZWF1L25vdXZlYXVfYm8uYwppbmRleCBjYTJhOGFlMTkzOGUuLjliYjhjZWUzZGY0MCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYwpAQCAtODYxLDkgKzg2MSw4IEBAIG5vdXZlYXVf
Ym9fbW92ZV9pbml0KHN0cnVjdCBub3V2ZWF1X2RybSAqZHJtKQogCU5WX0lORk8oZHJtLCAiTU06
IHVzaW5nICVzIGZvciBidWZmZXIgY29waWVzXG4iLCBuYW1lKTsKIH0KIAotc3RhdGljIHZvaWQK
LW5vdXZlYXVfYm9fbW92ZV9udGZ5KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sIGJvb2wg
ZXZpY3QsCi0JCSAgICAgc3RydWN0IHR0bV9yZXNvdXJjZSAqbmV3X3JlZykKK3N0YXRpYyB2b2lk
IG5vdXZlYXVfYm9fbW92ZV9udGZ5KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCisJCQkJ
IHN0cnVjdCB0dG1fcmVzb3VyY2UgKm5ld19yZWcpCiB7CiAJc3RydWN0IG5vdXZlYXVfbWVtICpt
ZW0gPSBuZXdfcmVnID8gbm91dmVhdV9tZW0obmV3X3JlZykgOiBOVUxMOwogCXN0cnVjdCBub3V2
ZWF1X2JvICpudmJvID0gbm91dmVhdV9ibyhibyk7CkBAIC05NDksNyArOTQ4LDcgQEAgbm91dmVh
dV9ib19tb3ZlKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sIGJvb2wgZXZpY3QsCiAJCQly
ZXR1cm4gcmV0OwogCX0KIAotCW5vdXZlYXVfYm9fbW92ZV9udGZ5KGJvLCBldmljdCwgbmV3X3Jl
Zyk7CisJbm91dmVhdV9ib19tb3ZlX250ZnkoYm8sIG5ld19yZWcpOwogCXJldCA9IHR0bV9ib193
YWl0X2N0eChibywgY3R4KTsKIAlpZiAocmV0KQogCQlnb3RvIG91dF9udGZ5OwpAQCAtMTAxNCw5
ICsxMDEzLDcgQEAgbm91dmVhdV9ib19tb3ZlKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8s
IGJvb2wgZXZpY3QsCiAJfQogb3V0X250Znk6CiAJaWYgKHJldCkgewotCQlzd2FwKCpuZXdfcmVn
LCBiby0+bWVtKTsKLQkJbm91dmVhdV9ib19tb3ZlX250ZnkoYm8sIGZhbHNlLCBuZXdfcmVnKTsK
LQkJc3dhcCgqbmV3X3JlZywgYm8tPm1lbSk7CisJCW5vdXZlYXVfYm9fbW92ZV9udGZ5KGJvLCAm
Ym8tPm1lbSk7CiAJfQogCXJldHVybiByZXQ7CiB9CkBAIC0xMjkwLDcgKzEyODcsNyBAQCBub3V2
ZWF1X2JvX2ZlbmNlKHN0cnVjdCBub3V2ZWF1X2JvICpudmJvLCBzdHJ1Y3Qgbm91dmVhdV9mZW5j
ZSAqZmVuY2UsIGJvb2wgZXhjbAogc3RhdGljIHZvaWQKIG5vdXZlYXVfYm9fZGVsZXRlX21lbV9u
b3RpZnkoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibykKIHsKLQlub3V2ZWF1X2JvX21vdmVf
bnRmeShibywgZmFsc2UsIE5VTEwpOworCW5vdXZlYXVfYm9fbW92ZV9udGZ5KGJvLCBOVUxMKTsK
IH0KIAogc3RydWN0IHR0bV9kZXZpY2VfZnVuY3Mgbm91dmVhdV9ib19kcml2ZXIgPSB7Ci0tIAoy
LjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
