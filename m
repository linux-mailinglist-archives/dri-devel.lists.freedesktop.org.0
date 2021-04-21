Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9531366C8C
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 15:20:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A9466E1EC;
	Wed, 21 Apr 2021 13:20:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 836B46E15F
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 13:20:16 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id y3so13050677eds.5
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 06:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=faZYInbrQK+G7seCVHG5EQ1soOt1bdb90AsMmAV+dQE=;
 b=Oqou1T0NmzWIMot5uNvTxKIG7JhKBeWnk0JY7KVfyghGc5bMmcAaHJL9XQEhVikcyI
 jj3pI4o65Uh61m8Dr6ydXg/cHVlLyhXxmsVE4Hkatj7gzR3X7ITlgwHpiNJqcJ9d7NlC
 KO3M+avsW0Qgk0R0yRpb9ds11xyhmY4YEZVP89IOP3zdScB/rk/KJKPtvUGNeCYm9uDz
 mqEDT2duMDrjrdf1JNPFXWW/j3X+XRORbrqlhUhfEJev4zzRCZ645t6P1S0hkzSyaJht
 9Ja4gBjcjqyhsKbST/NeJ9Ghk+pYlsxir7hGzYbcPNEXdKXnuO1Mw6CzVmrTYEP6DJAX
 roIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=faZYInbrQK+G7seCVHG5EQ1soOt1bdb90AsMmAV+dQE=;
 b=agrxEg0KRD8Gnjd/iLEQlGo0xtJa4PPwaTCde93TUBWwgUHqesbJuniY/sjPZFDcvi
 8ERT5YbILmr4WnE1WzNcNdM/0svqtIn7oScxfoN76WWnzH86WDHWlhG0bKjdwwDATgCO
 vlcK8T8YHNFqfgy7DU5EtT0yXXthmk2oYizXOnqb8uP8HELND6qKopYQfPJPXKRN98ae
 WJ5XLlqu9EfS1Sgo61elKtGrqKQg1uE24BlsdUdzca2MdngVwHOpyQHN0oSAycXV3KYW
 nNfjPk09mQObn328aQVn/CGX+HtW2nx+s3D9meDkWkw1GsiaxMSrQOXd/tO47HM1z6lN
 G2YQ==
X-Gm-Message-State: AOAM533V+UfzTdl3S1/PESku5Juo1FitGROwQFD6XtfMWjh0hgDenBmG
 MHyc9vRI6rLV+zY5weSOr3Q=
X-Google-Smtp-Source: ABdhPJz25uFtQbL3jhFmowozzQJTQyxPG+iQFXF8uaBj7TKoSMn48bUFYeSLubR/DLHiTxIY0ppWvA==
X-Received: by 2002:a05:6402:27ce:: with SMTP id
 c14mr38205979ede.263.1619011215240; 
 Wed, 21 Apr 2021 06:20:15 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:6d51:959c:b29c:d1fe])
 by smtp.gmail.com with ESMTPSA id k9sm3504463edv.69.2021.04.21.06.20.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 06:20:14 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linux-kernel@vger.kernel.org, linux-unionfs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] ovl: fix reference counting in ovl_mmap error path
Date: Wed, 21 Apr 2021 15:20:12 +0200
Message-Id: <20210421132012.82354-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210421132012.82354-1-christian.koenig@amd.com>
References: <20210421132012.82354-1-christian.koenig@amd.com>
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
Cc: jgg@ziepe.ca, jaharkes@cs.cmu.edu, akpm@linux-foundation.org,
 miklos@szeredi.hu, coda@cs.cmu.edu
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

bW1hcF9yZWdpb24oKSBub3cgY2FsbHMgZnB1dCgpIG9uIHRoZSB2bWEtPnZtX2ZpbGUuCgpGaXgg
dGhpcyBieSB1c2luZyB2bWFfc2V0X2ZpbGUoKSBzbyBpdCBkb2Vzbid0IG5lZWQgdG8gYmUKaGFu
ZGxlZCBtYW51YWxseSBoZXJlIGFueSBtb3JlLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvD
tm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpGaXhlczogMTUyN2Y5MjZmZDA0ICgibW06
IG1tYXA6IGZpeCBmcHV0IGluIGVycm9yIHBhdGggdjIiKQpDQzogc3RhYmxlQHZnZXIua2VybmVs
Lm9yZyAjIDUuMTErCi0tLQogZnMvb3ZlcmxheWZzL2ZpbGUuYyB8IDExICstLS0tLS0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2ZzL292ZXJsYXlmcy9maWxlLmMgYi9mcy9vdmVybGF5ZnMvZmlsZS5jCmluZGV4IGRiZmIz
NWZiMGZmNy4uMzg0N2NkYzA2OWI1IDEwMDY0NAotLS0gYS9mcy9vdmVybGF5ZnMvZmlsZS5jCisr
KyBiL2ZzL292ZXJsYXlmcy9maWxlLmMKQEAgLTQzMCwyMCArNDMwLDExIEBAIHN0YXRpYyBpbnQg
b3ZsX21tYXAoc3RydWN0IGZpbGUgKmZpbGUsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQog
CWlmIChXQVJOX09OKGZpbGUgIT0gdm1hLT52bV9maWxlKSkKIAkJcmV0dXJuIC1FSU87CiAKLQl2
bWEtPnZtX2ZpbGUgPSBnZXRfZmlsZShyZWFsZmlsZSk7CisJdm1hX3NldF9maWxlKHZtYSwgcmVh
bGZpbGUpOwogCiAJb2xkX2NyZWQgPSBvdmxfb3ZlcnJpZGVfY3JlZHMoZmlsZV9pbm9kZShmaWxl
KS0+aV9zYik7CiAJcmV0ID0gY2FsbF9tbWFwKHZtYS0+dm1fZmlsZSwgdm1hKTsKIAlyZXZlcnRf
Y3JlZHMob2xkX2NyZWQpOwotCi0JaWYgKHJldCkgewotCQkvKiBEcm9wIHJlZmVyZW5jZSBjb3Vu
dCBmcm9tIG5ldyB2bV9maWxlIHZhbHVlICovCi0JCWZwdXQocmVhbGZpbGUpOwotCX0gZWxzZSB7
Ci0JCS8qIERyb3AgcmVmZXJlbmNlIGNvdW50IGZyb20gcHJldmlvdXMgdm1fZmlsZSB2YWx1ZSAq
LwotCQlmcHV0KGZpbGUpOwotCX0KLQogCW92bF9maWxlX2FjY2Vzc2VkKGZpbGUpOwogCiAJcmV0
dXJuIHJldDsKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
