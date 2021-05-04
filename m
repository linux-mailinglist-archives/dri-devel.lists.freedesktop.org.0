Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A35F372AF5
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 15:27:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF4BB6EAD7;
	Tue,  4 May 2021 13:27:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F2876E44E
 for <dri-devel@lists.freedesktop.org>; Tue,  4 May 2021 13:27:34 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id i24so10402318edy.8
 for <dri-devel@lists.freedesktop.org>; Tue, 04 May 2021 06:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w0SfxpLVoZkDuGCj5kO5zcIgQo0zhFBQoJU3caiep94=;
 b=fYKuDrcLfB6Yvz7QuTCGGc0SvLfgB+ZzW1SH1NePHABZ0CzP7YLW2p/IOxGi1yUeTg
 SN5X2PbOWWbuFdGAVv1Ztj7go5zy5+UCHDZPBoojZJiylx+OTkPRcx/A53u3Kt8etaE7
 7lZjv2P006RcgIYFR19dDWRon8pL/HFLjyVHbRj4VxVevsK9om6mYXOA4JGK5tk9n8Ms
 irXLxCGkl0ThN+SHU9KzpLxj/BRtksD1nI8xswp449Na098rbi73SfwBGu+w0ah/J6/f
 QAq08E8gfWTuPC/1yn7m/73qZrDSwFODuygigsqWnwXLutIZ0LdbxRj9KrfXQ5PQPqCr
 vNWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w0SfxpLVoZkDuGCj5kO5zcIgQo0zhFBQoJU3caiep94=;
 b=UNCM6d7MTKjmpOGy67vfvjoXMv9zC5QozTir+UaXmcgFzBj+vmI6LfAhRueFB9+68/
 rQFc9jtKSIT8jLoyLIk3iLaZ4f90K7s3FpHogz3Dzd5dY6wKPfAK3wDYdROR30NSfu5g
 yQvjcbCUNCbYkAblh6n1U1yZ+IsJ0hxS81MvqP9KxDPiayK4WVySzk0MooSqI1XbZvQC
 nih/0mgq7X0d1tyR+N8Omlg467j/T+qAZWSHnL8Ak0m/H9IuqanLPkAq/SruzHcIhura
 kg/f1nhYLsRDOXqja5ZSxb0vrN061iyOaSv32jJD4GIYybKvESZgAMRCpKuY9JjEppNv
 eNRg==
X-Gm-Message-State: AOAM533ZHnhV+tyghJEUpSwCWuqpY4Bxg/2OsKlO0Mks1rPkSKmJMafy
 qtIMaENIAXiAHE3rYh9fmr9DcC9iIEc=
X-Google-Smtp-Source: ABdhPJwOaPoFou75OJ4jCBTdKxOBvQr94cqUWnRDe1D6DlPzjzN5ISggi23GMpnhC6nQb9qEBFjJ3A==
X-Received: by 2002:a05:6402:2d6:: with SMTP id
 b22mr26224767edx.274.1620134853319; 
 Tue, 04 May 2021 06:27:33 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:4a5c:1943:c73d:c4c9])
 by smtp.gmail.com with ESMTPSA id q18sm3114036edd.3.2021.05.04.06.27.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 06:27:33 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 02/12] RDMA/mlx5: add DMA-buf user fence support
Date: Tue,  4 May 2021 15:27:19 +0200
Message-Id: <20210504132729.2046-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210504132729.2046-1-christian.koenig@amd.com>
References: <20210504132729.2046-1-christian.koenig@amd.com>
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

SnVzdCBhZGQgdGhlIGNhbGwgYmVmb3JlIHRha2luZyBsb2Nrcy4KClNpZ25lZC1vZmYtYnk6IENo
cmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2lu
ZmluaWJhbmQvaHcvbWx4NS9vZHAuYyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW5maW5pYmFuZC9ody9tbHg1L29kcC5jIGIv
ZHJpdmVycy9pbmZpbmliYW5kL2h3L21seDUvb2RwLmMKaW5kZXggYjEwMzU1NWIxZjVkLi42YjRk
OTgwYzAyZTggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaW5maW5pYmFuZC9ody9tbHg1L29kcC5jCisr
KyBiL2RyaXZlcnMvaW5maW5pYmFuZC9ody9tbHg1L29kcC5jCkBAIC04MDQsNiArODA0LDEwIEBA
IHN0YXRpYyBpbnQgcGFnZWZhdWx0X2RtYWJ1Zl9tcihzdHJ1Y3QgbWx4NV9pYl9tciAqbXIsIHNp
emVfdCBiY250LAogCWlmIChmbGFncyAmIE1MWDVfUEZfRkxBR1NfRU5BQkxFKQogCQl4bHRfZmxh
Z3MgfD0gTUxYNV9JQl9VUERfWExUX0VOQUJMRTsKIAorCWVyciA9IGRtYV9yZXN2X3N5bmNfdXNl
cl9mZW5jZSh1bWVtX2RtYWJ1Zi0+YXR0YWNoLT5kbWFidWYtPnJlc3YpOworCWlmIChlcnIpCisJ
CXJldHVybiBlcnI7CisKIAlkbWFfcmVzdl9sb2NrKHVtZW1fZG1hYnVmLT5hdHRhY2gtPmRtYWJ1
Zi0+cmVzdiwgTlVMTCk7CiAJZXJyID0gaWJfdW1lbV9kbWFidWZfbWFwX3BhZ2VzKHVtZW1fZG1h
YnVmKTsKIAlpZiAoZXJyKSB7Ci0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
