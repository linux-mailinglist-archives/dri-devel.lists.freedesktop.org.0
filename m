Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 163082F7CC4
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 14:35:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53F106E408;
	Fri, 15 Jan 2021 13:35:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 729106E408
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 13:35:53 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id ke15so5647157ejc.12
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 05:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Uvcb64drMU6yDCe2EG8sS6ve8Wttr0FavNQ8UUxVSsc=;
 b=iwYgmojuuivmtkgQcFqiNjsi4Y3WOy4W0NKCaozKS6Y67+zcbwSmZqTQGGN/rjTN+C
 JZRgWFRB9S25U1yK79c2+5z9XYjYmcaGcL98WllSbP49oFKOE1e6lZvAMr+LjaRTrYe+
 cx4XhFIHTgcimcV1rKianxsYTRnddiI4OflBHgvwSuArcvSTr36bL0vKYPhAUGhMLs09
 1qRFaRzmxznSBlDGJUbPtMCm0hi0Pg1azxmcFKhxLdoPv2TL+RAIVz94nT9YNaUSCtMv
 K17sM60OWPg+PealoqZctpDA0veVoP5bdOhsvWjmJM09SBM/CKHFtFbhD43vq/ht3Urr
 1wOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Uvcb64drMU6yDCe2EG8sS6ve8Wttr0FavNQ8UUxVSsc=;
 b=ZI3UhFUGQB3pQ4vdnqU7KrvSvXeabuQg0E95d6PimLiEo9gsy1teH4om4/5CVSBuF1
 Qd1if1+4Wpq71hy2Mq6Po4Kjp6FKaoCdMiFmbsuSrSTmEF58Q7cgdbcpFXKAIcI+z6B4
 tab0kXcx9omf8C3ObkOZhI/mgEhSpLmY+DOGGaL1hvYBRqUef6d88iE2kh4evgESrr0s
 5d6bQSSUbUkTMdg7GVIwSIvYqU6aRDWnT0InrJil0plxwcUbJ2v7p+vbwdz44LNavCJy
 /wdpzydkMOfAI0maqc4dMppnjeeqiIl7fkao/hrJZMnYBWUfUw+PSajJncs45FOCEA4i
 kYxg==
X-Gm-Message-State: AOAM531WSTV8F3/deZn+B2UadMCnNk8RPeA7ayWlPDFSvSeBX6gnDDk2
 lXWR6AaSFmdZgywLDpuLdQs=
X-Google-Smtp-Source: ABdhPJwU5suoB7yrl1BWq4P7qwpeF382GKbx18rmBYKb4QzUAVZzH25dN5xKVmu5U3ZDplslSI//yQ==
X-Received: by 2002:a17:906:fb9b:: with SMTP id
 lr27mr9144671ejb.175.1610717752140; 
 Fri, 15 Jan 2021 05:35:52 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:bd89:42cd:a9f2:11cb])
 by smtp.gmail.com with ESMTPSA id z24sm3727291edr.9.2021.01.15.05.35.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 05:35:51 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel.vetter@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/syncobj: make lockdep complain on WAIT_FOR_SUBMIT
Date: Fri, 15 Jan 2021 14:35:50 +0100
Message-Id: <20210115133550.1678-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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

RFJNX1NZTkNPQkpfV0FJVF9GTEFHU19XQUlUX0ZPUl9TVUJNSVQgY2FuJ3QgYmUgdXNlZCB3aGVu
IGEgcmVzZXJ2YXRpb24Kb2JqZWN0IGxvY2sgaXMgaGVscCBvciBvdGhlcndpc2Ugd2UgY2FuIGRl
YWRsb2NrIHdpdGggcGFnZSBmYXVsdHMuCgpNYWtlIGxvY2tkZXAgY29tcGxhaW4gYmFkbHkgYWJv
dXQgdGhhdC4KClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYyB8IDE0ICsrKysr
KysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9zeW5j
b2JqLmMKaW5kZXggNmU3NGU2NzQ1ZWNhLi42MjI4ZTljZDA4OWEgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fc3luY29iai5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29i
ai5jCkBAIC0zODcsNiArMzg3LDIwIEBAIGludCBkcm1fc3luY29ial9maW5kX2ZlbmNlKHN0cnVj
dCBkcm1fZmlsZSAqZmlsZV9wcml2YXRlLAogCWlmICghc3luY29iaikKIAkJcmV0dXJuIC1FTk9F
TlQ7CiAKKwlpZiAoZmxhZ3MgJiBEUk1fU1lOQ09CSl9XQUlUX0ZMQUdTX1dBSVRfRk9SX1NVQk1J
VCAmJgorCSAgICBJU19FTkFCTEVEKENPTkZJR19MT0NLREVQKSkgeworCQlzdHJ1Y3QgZG1hX3Jl
c3Ygcm9iajsKKworCQkvKiBXYWl0aW5nIGZvciB1c2Vyc3BhY2Ugd2l0aCBhIHJlc2VydmF0aW9u
IGxvY2sgaGVscCBpcyBpbGxlZ2FsCisJCSAqIGNhdXNlIHRoYXQgY2FuIGRlYWRsb2NrIHdpdGgg
cGFnZSBmYXVsdHMuIE1ha2UgbG9ja2RlcAorCQkgKiBjb21wbGFpbiBhYm91dCBpdCBlYXJseSBv
bi4KKwkJICovCisJCWRtYV9yZXN2X2luaXQoJnJvYmopOworCQlkbWFfcmVzdl9sb2NrKCZyb2Jq
LCBOVUxMKTsKKwkJZG1hX3Jlc3ZfdW5sb2NrKCZyb2JqKTsKKwkJZG1hX3Jlc3ZfZmluaSgmcm9i
aik7CisJfQorCiAJKmZlbmNlID0gZHJtX3N5bmNvYmpfZmVuY2VfZ2V0KHN5bmNvYmopOwogCWRy
bV9zeW5jb2JqX3B1dChzeW5jb2JqKTsKIAotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
