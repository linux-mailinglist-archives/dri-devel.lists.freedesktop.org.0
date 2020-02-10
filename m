Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBCD157E6B
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2020 16:09:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 654EE6EC7E;
	Mon, 10 Feb 2020 15:09:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70EA76EC79;
 Mon, 10 Feb 2020 15:09:15 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id t23so715007wmi.1;
 Mon, 10 Feb 2020 07:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=zjyOrGYUj9i57jpKCj5rhWx6c0tUOFnm0t6zm6OvZdw=;
 b=cQNhgF6S4OiaD6AMlzvMJBMVMfI200m7v2pluST/tpBd9xArydz3pWfl5aWLh7UqSW
 ZfGCeL1ruQpxnLZn4bz+CnloCvrnDNMDI3AkoZFuidMEl/gnaGg7KGjXdv30MFRD3WOW
 erJh5wY3Ha4KL5c0zNzPTxtp3y4AtvHcS1ZgMFedIXukZU8/i1dVai4IUca1RZKHqklO
 f9btGIF0qjyxsyft2ZMDks+/jB31QZ/HrTnwjzuba1snbU7XfVS9Mz4y6PeYNOd/Gd/q
 g9ugUFvH49RUcApDCGSsUZPtkhSvOQ6EG6KaiCvhkEzwlTecq0Uri6NvugV3uohi1QEu
 hoAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zjyOrGYUj9i57jpKCj5rhWx6c0tUOFnm0t6zm6OvZdw=;
 b=t+fRovhYDijAOHy3UOkSn2RqKpnQC7+ILEJyl9yOweX54RRf5QkToZyBJzzUgfLt8Q
 k+1KNbhB7Dmvq7wfHl6UpLCUQ7OIh5PSeWLgpcOHbvFy+Fm1213KpbRWjwFwO6XE6dap
 UsFY9XBu3wgTl9utpJ7TM1hTQk/f5ONfLaJQBa/O8kppGqNXvTYCSR0a+T+UnL2Q+Xvi
 qOAKJUFjqsPjTLNevE9Y6xyUvQ1sw55QPDKJUjjpkF4WvbIDIeBP1HSuThIh4A1Ol2v3
 DWVxf5KFrOH+UP8MCoiqNkhKY1POT8xFbTjW5jjSQ5XlCuSR754VpzdR6J/jKf2ZIVgj
 tgHg==
X-Gm-Message-State: APjAAAWJOzNQ+ySN4wDIjsMnYSPEkncAhC56WCrJ4+bnj/JpYRa41PE+
 S8ASq19MygvWD/i7MqnARTSU80NY
X-Google-Smtp-Source: APXvYqxuCSQz/w30RbQh1Q0bv73h/0xxoYBz5DYv/Ht+LaDg3QQ8SGqNKAAeX+vEg20nG6AlnZSQuA==
X-Received: by 2002:a1c:a515:: with SMTP id o21mr16106376wme.85.1581347354168; 
 Mon, 10 Feb 2020 07:09:14 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:7d3b:a71c:475c:1e99])
 by smtp.gmail.com with ESMTPSA id q10sm1021996wme.16.2020.02.10.07.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2020 07:09:13 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 2/6] drm/ttm: cleanup ttm_buffer_object_transfer
Date: Mon, 10 Feb 2020 16:09:03 +0100
Message-Id: <20200210150907.20616-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200210150907.20616-1-christian.koenig@amd.com>
References: <20200210150907.20616-1-christian.koenig@amd.com>
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

VGhlIGZ1bmN0aW9uIGlzIGFsd2F5cyBjYWxsZWQgd2l0aCBkZWxldGVkIEJPcy4KCldoaWxlIGF0
IGl0IGNsZWFudXAgdGhlIGluZGVudGF0aW9uIGFzIHdlbGwuCgpTaWduZWQtb2ZmLWJ5OiBDaHJp
c3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL3R0bS90dG1fYm8uYyB8IDEyICsrKy0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
dHRtL3R0bV9iby5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwppbmRleCAxZmJjMzZm
MDVkODkuLmMxMTA0Yzg4NTdiNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1f
Ym8uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCkBAIC01MjIsMTQgKzUyMiw5
IEBAIHN0YXRpYyBpbnQgdHRtX2JvX2NsZWFudXBfcmVmcyhzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmpl
Y3QgKmJvLAogCQkJICAgICAgIGJvb2wgaW50ZXJydXB0aWJsZSwgYm9vbCBub193YWl0X2dwdSwK
IAkJCSAgICAgICBib29sIHVubG9ja19yZXN2KQogewotCXN0cnVjdCBkbWFfcmVzdiAqcmVzdjsK
KwlzdHJ1Y3QgZG1hX3Jlc3YgKnJlc3YgPSAmYm8tPmJhc2UuX3Jlc3Y7CiAJaW50IHJldDsKIAot
CWlmICh1bmxpa2VseShsaXN0X2VtcHR5KCZiby0+ZGRlc3Ryb3kpKSkKLQkJcmVzdiA9IGJvLT5i
YXNlLnJlc3Y7Ci0JZWxzZQotCQlyZXN2ID0gJmJvLT5iYXNlLl9yZXN2OwotCiAJaWYgKGRtYV9y
ZXN2X3Rlc3Rfc2lnbmFsZWRfcmN1KHJlc3YsIHRydWUpKQogCQlyZXQgPSAwOwogCWVsc2UKQEAg
LTU0Miw5ICs1MzcsOCBAQCBzdGF0aWMgaW50IHR0bV9ib19jbGVhbnVwX3JlZnMoc3RydWN0IHR0
bV9idWZmZXJfb2JqZWN0ICpibywKIAkJCWRtYV9yZXN2X3VubG9jayhiby0+YmFzZS5yZXN2KTsK
IAkJc3Bpbl91bmxvY2soJnR0bV9ib19nbG9iLmxydV9sb2NrKTsKIAotCQlscmV0ID0gZG1hX3Jl
c3Zfd2FpdF90aW1lb3V0X3JjdShyZXN2LCB0cnVlLAotCQkJCQkJCSAgIGludGVycnVwdGlibGUs
Ci0JCQkJCQkJICAgMzAgKiBIWik7CisJCWxyZXQgPSBkbWFfcmVzdl93YWl0X3RpbWVvdXRfcmN1
KHJlc3YsIHRydWUsIGludGVycnVwdGlibGUsCisJCQkJCQkgMzAgKiBIWik7CiAKIAkJaWYgKGxy
ZXQgPCAwKQogCQkJcmV0dXJuIGxyZXQ7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
