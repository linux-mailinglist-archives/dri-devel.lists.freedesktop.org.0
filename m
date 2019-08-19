Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 890D394988
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 18:12:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0C1E6E1F8;
	Mon, 19 Aug 2019 16:12:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 861FE6E1F4
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 16:12:07 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id o9so5495764iom.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 09:12:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1AaiMrzn6Kck5w+7zpGIz8iRnQ0/4BQJVkrkea/mymE=;
 b=cM/JE4XK4Uw4h3cI2KAAtgEt/vAVwEEpl0FW3C85gz7AEg8mCdr9uI7LEDWZ+a8Yvi
 GW++q9BPjC9CzjNodFEjD1feZaQwTUjaXAkLmABTI3nrK77Na2VWI/tebulIqU1gCe+y
 sd27/GvnwvkDuUGMReExILaun8gda4nXFjj+zjZDJtKSxHDA/wlC6wXeeDTtyzPbQcgq
 46VvT/nUJYf+G8DfIY9arJmMoZIpMNAHH9pbMyFDo3GvoLIO10/DCL/z//K55apyVkgP
 8ma3hnnDc4rWfcKZL5rw6Si7owyQO8C2tIG+OCVwMRR6SmDQ0zoeNdjAt3c84Er1AKpj
 mGAA==
X-Gm-Message-State: APjAAAWwiX3yJHeLyhkDjjYBGynjcM/Vb42euDc+8YcTKf9V2iSOPEEc
 ZSOYevU9kbjbkFhUKPnz25uf3NM=
X-Google-Smtp-Source: APXvYqx5qDYcmxw17avctt5sj0B2cGouDlcwasyfEwZ9Q2qAhPDBqZz93uP8Jl8fFWcuK7mGkiImmA==
X-Received: by 2002:a02:a809:: with SMTP id f9mr21665284jaj.111.1566231126305; 
 Mon, 19 Aug 2019 09:12:06 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id c19sm4770584ioi.22.2019.08.19.09.12.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 09:12:05 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/4] panfrost: Locking fixes
Date: Mon, 19 Aug 2019 11:12:00 -0500
Message-Id: <20190819161204.3106-1-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2l0aCBmdXJ0aGVyIHRlc3Rpbmcgb2YgcmVjZW50IGNoYW5nZXMgd2l0aCBsb2NrZGVwIGFuZCBv
dGhlciBsb2NraW5nCmNoZWNrcyBlbmFibGVkLCB3ZSd2ZSBmb3VuZCBzZXZlcmFsIGJ1Z3MgaW4g
dGhlIHNocmlua2VyIGNvZGUgYW5kIG9uZQpzbGVlcCB3aGlsZSBhdG9taWMgaW4gcGFuZnJvc3Rf
Z2VtX29wZW4oKS4gVGhpcyBzZXJpZXMgYWRkcmVzc2VzIHRob3NlIAppc3N1ZXMuCgpSb2IKClJv
YiBIZXJyaW5nICg0KToKICBkcm0vc2htZW06IERvIGRtYV91bm1hcF9zZyBiZWZvcmUgcHVyZ2lu
ZyBwYWdlcwogIGRybS9zaG1lbTogVXNlIG11dGV4X3RyeWxvY2sgaW4gZHJtX2dlbV9zaG1lbV9w
dXJnZQogIGRybS9wYW5mcm9zdDogRml4IHNocmlua2VyIGxvY2tkZXAgaXNzdWVzIHVzaW5nIGRy
bV9nZW1fc2htZW1fcHVyZ2UoKQogIGRybS9wYW5mcm9zdDogRml4IHNsZWVwaW5nIHdoaWxlIGF0
b21pYyBpbiBwYW5mcm9zdF9nZW1fb3BlbgoKIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3NobWVt
X2hlbHBlci5jICAgICAgICAgICB8IDEzICsrKysrKysrKysrLS0KIGRyaXZlcnMvZ3B1L2RybS9w
YW5mcm9zdC9wYW5mcm9zdF9nZW0uYyAgICAgICAgICB8IDEwICsrKysrKy0tLS0KIGRyaXZlcnMv
Z3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9nZW1fc2hyaW5rZXIuYyB8IDE1ICsrLS0tLS0tLS0t
LS0tLQogaW5jbHVkZS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuaCAgICAgICAgICAgICAgIHwg
IDIgKy0KIDQgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMjAgZGVsZXRpb25zKC0p
CgotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
