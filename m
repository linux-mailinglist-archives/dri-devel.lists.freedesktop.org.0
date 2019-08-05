Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C99D820A3
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 17:46:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C70326E4B3;
	Mon,  5 Aug 2019 15:46:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 883946E4A5;
 Mon,  5 Aug 2019 15:46:00 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id f9so5985566wre.12;
 Mon, 05 Aug 2019 08:46:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a4ZZo1KUS4v5eA927ZZztm7GQeLvgm0C/yGY+IBScNk=;
 b=HgHKz0ky44AVh2fiF8KDNj4qxdbRxE6lK55M9xRUtlm/jAT8JjJdYxeFXB2G/7+v4Q
 ph9lqFD2uwdG65UhNjOFRsX96TQCbBC886ks9nRJxmeZwoYZW1v5dbkgfg3BYpTazj4R
 gwPwcS/FPgo5KkAgIqA63G9ClD5eFIvGi2XRzo1BlJN4izSBl30DtekpLpvE+LhCwIAG
 ng4syeAGlSR03Lt/fVx6Kg4Lwrrb6UJv4UrXgmDdFX1vTl2mcwJnWcp3FyQwdLKNrjkz
 HeDXMA2NM1HHOBDU1KEUISxxPhQa19IAziJ53cm9RLYQ8t+qDmJdkND7draGItHfZ/te
 UuTw==
X-Gm-Message-State: APjAAAXxU0KsNHbV+/SM5Mn5sOw4l9/gAvzLtUkpHkb6KN8xpJaEfAHC
 6+SBATfCY+m1D3JrGq1fhgq7PxV5
X-Google-Smtp-Source: APXvYqyKtWz2oAW1/rv7hSkrkd2h3z7inIhLfCt8NJpgwvZgCZQvI+8ki0rdQlhG46LV+7qztvPF4w==
X-Received: by 2002:a5d:6389:: with SMTP id p9mr1126311wru.297.1565019958875; 
 Mon, 05 Aug 2019 08:45:58 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:fdbd:6233:4990:5a8d])
 by smtp.gmail.com with ESMTPSA id 91sm171836865wrp.3.2019.08.05.08.45.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Aug 2019 08:45:58 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 chris@chris-wilson.co.uk
Subject: [PATCH 4/5] dma-buf: simplify reservation_object_get_fences_rcu a bit
Date: Mon,  5 Aug 2019 17:45:53 +0200
Message-Id: <20190805154554.3476-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190805154554.3476-1-christian.koenig@amd.com>
References: <20190805154554.3476-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=a4ZZo1KUS4v5eA927ZZztm7GQeLvgm0C/yGY+IBScNk=;
 b=c8lKjumQ802qAfCvsp5WXfL6BHjFMbZ03rSET63kgSVQxwL/Si4kP11+H9pHt9SeC8
 NBKpD0r8ULstE6FSP+fQdLCvtGGyH/qMhQUScICPY7e3ZLr8bDXUj4R1Scn6dYI4pOyn
 eL+OWq0smywS6iFlWZQnphIY48FUqJ1Iv4D+S0hk/xSnywiDLWApC4PmPVswHUxzp2Dt
 AdA6MQwxUQquKYm66Vcv4+HKNz6Bcw1v1VndIYGPs7OEDiryqfcp8AaS+qzZQQWKhyD4
 SI4xZu/j0j7DktO6fvtfDA9+/bdcwg5kx5ZXqeP2JEQpJHyjvFJGoA1i9OUPXvDWBwmr
 UhNw==
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

V2UgY2FuIGFkZCB0aGUgZXhjbHVzaXZlIGZlbmNlIHRvIHRoZSBsaXN0IGFmdGVyIG1ha2luZyBz
dXJlIHdlIGdvdAphIGNvbnNpc3RlbnQgc3RhdGUuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4g
S8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9kbWEtYnVmL3Jl
c2VydmF0aW9uLmMgfCAxNSArKysrKy0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9y
ZXNlcnZhdGlvbi5jIGIvZHJpdmVycy9kbWEtYnVmL3Jlc2VydmF0aW9uLmMKaW5kZXggNmVhY2E0
NjkwMDVmLi42OWM4MjY1NTNjNzIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9yZXNlcnZh
dGlvbi5jCisrKyBiL2RyaXZlcnMvZG1hLWJ1Zi9yZXNlcnZhdGlvbi5jCkBAIC00MjYsMTMgKzQy
Niw2IEBAIGludCByZXNlcnZhdGlvbl9vYmplY3RfZ2V0X2ZlbmNlc19yY3Uoc3RydWN0IHJlc2Vy
dmF0aW9uX29iamVjdCAqb2JqLAogCQkJCWlmICghZG1hX2ZlbmNlX2dldF9yY3Uoc2hhcmVkW2ld
KSkKIAkJCQkJYnJlYWs7CiAJCQl9Ci0KLQkJCWlmICghcGZlbmNlX2V4Y2wgJiYgZmVuY2VfZXhj
bCkgewotCQkJCXNoYXJlZFtpXSA9IGZlbmNlX2V4Y2w7Ci0JCQkJZmVuY2VfZXhjbCA9IE5VTEw7
Ci0JCQkJKytpOwotCQkJCSsrc2hhcmVkX2NvdW50OwotCQkJfQogCQl9CiAKIAkJaWYgKGkgIT0g
c2hhcmVkX2NvdW50IHx8IHJlYWRfc2VxY291bnRfcmV0cnkoJm9iai0+c2VxLCBzZXEpKSB7CkBA
IC00NDcsNiArNDQwLDExIEBAIGludCByZXNlcnZhdGlvbl9vYmplY3RfZ2V0X2ZlbmNlc19yY3Uo
c3RydWN0IHJlc2VydmF0aW9uX29iamVjdCAqb2JqLAogCQlyY3VfcmVhZF91bmxvY2soKTsKIAl9
IHdoaWxlIChyZXQpOwogCisJaWYgKHBmZW5jZV9leGNsKQorCQkqcGZlbmNlX2V4Y2wgPSBmZW5j
ZV9leGNsOworCWVsc2UgaWYgKGZlbmNlX2V4Y2wpCisJCXNoYXJlZFsrK3NoYXJlZF9jb3VudF0g
PSBmZW5jZV9leGNsOworCiAJaWYgKCFzaGFyZWRfY291bnQpIHsKIAkJa2ZyZWUoc2hhcmVkKTsK
IAkJc2hhcmVkID0gTlVMTDsKQEAgLTQ1NCw5ICs0NTIsNiBAQCBpbnQgcmVzZXJ2YXRpb25fb2Jq
ZWN0X2dldF9mZW5jZXNfcmN1KHN0cnVjdCByZXNlcnZhdGlvbl9vYmplY3QgKm9iaiwKIAogCSpw
c2hhcmVkX2NvdW50ID0gc2hhcmVkX2NvdW50OwogCSpwc2hhcmVkID0gc2hhcmVkOwotCWlmIChw
ZmVuY2VfZXhjbCkKLQkJKnBmZW5jZV9leGNsID0gZmVuY2VfZXhjbDsKLQogCXJldHVybiByZXQ7
CiB9CiBFWFBPUlRfU1lNQk9MX0dQTChyZXNlcnZhdGlvbl9vYmplY3RfZ2V0X2ZlbmNlc19yY3Up
OwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
