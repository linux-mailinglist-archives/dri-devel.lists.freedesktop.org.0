Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB88103AD6
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 14:18:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A0426E59D;
	Wed, 20 Nov 2019 13:18:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCF226E59D;
 Wed, 20 Nov 2019 13:18:03 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id b11so6917512wmb.5;
 Wed, 20 Nov 2019 05:18:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TwMieNyDW+zOMrfW8Xr6dXNpfOZM0dbY7ZXbmG3QwHQ=;
 b=mmbcnDe82eZUv9fsIbo6TMobc9KPU3+ReQ9AD5+1o1sgWKXyFjRPolHW8cDWfyzZOQ
 /pGyVqTg1NbK5TOKp/VDp+bQu4AdHd7hclUIED9ORjcOwtZGuYYZDjn249Qz6S8ZzSSe
 sYUW9uhTeJCX2ig/NnVzYv/OSLLz2OLKaVek5Nb8Ru17jBNMLgIDwrPZOqSpA7xrTlnU
 gObrliTqJ+V1bexTkPJwA9NPEplAoPHOSH52aTa/qcTYYWaMPtD/J3fzeptDPcLq1bo6
 TIZWZwCvdPyhCiHTO7ZLYMtV4XzCj95Au2qqeSeq/zBsBQq5aWy7M8nffVbQyxAmNOC4
 OkTA==
X-Gm-Message-State: APjAAAWtT3QG51zd0RgCyQxiXYp4qcVB+mcueUkturg2wFVqfuJtRQTZ
 wfl7fE59OgGOZcmTK9aaKGk=
X-Google-Smtp-Source: APXvYqyOu9kp2ZQ4EvKUKdBOaV8SFLI0f1ydnQ7KDlOMv0j+R3p7E5koj2DXi24N43h43L0hwRyJTw==
X-Received: by 2002:a1c:b1c3:: with SMTP id a186mr3249385wmf.10.1574255882437; 
 Wed, 20 Nov 2019 05:18:02 -0800 (PST)
Received: from laptop.fritz.box ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id 4sm6726498wmd.33.2019.11.20.05.18.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2019 05:18:01 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: imirkin@alum.mit.edu, skeggsb@gmail.com, airlied@linux.ie,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Move io_reserve_lru handling into the driver
Date: Wed, 20 Nov 2019 14:17:49 +0100
Message-Id: <20191120131751.15904-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TwMieNyDW+zOMrfW8Xr6dXNpfOZM0dbY7ZXbmG3QwHQ=;
 b=BsuezM48H2tRwi3DGA+8PXCHp38Rfefz9SUoEhGN4ZvgmPqR1VtMuFtZWIxNlF2oJE
 K4K3L2foABgVpvYq/07dm6Pf7jjkck44wVFZ4Q1wbmnKXqiJWeit/HpFJTm8d3raullU
 Jw66it3olZiKSCwRpFPQpHLlGH8DAx4Lg/LMxNhZSNalF7Oc+fdMWU/CZK+vgDaNX2Oo
 T/+dEHxAUDYl+eDrEuCPyv0lWggWsiL63uT+YyVBEJBTz5+suGt3VU2H/YvBLzDSXxSc
 2NJnOcsdIEkJqQUc3VoZpwlghXyDAhWjMWRg+QrBAW035wJveK7mzJN729d5GbYgqTIk
 ZGgQ==
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

SnVzdCBhIGdlbnRsZSBwaW5nIG9uIHRoaXMuCgpBbHJlYWR5IGdvdCB0aGUgQWNrZWQtYnkgZnJv
bSBEYW5pZWwsIGJ1dCBJIG5lZWQgc29tZSBvZiB0aGUKbm91dmVhdSBndXlzIHRvIHRlc3QgdGhp
cyBzaW5jZSBJIGNhbiBvbmx5IGNvbXBpbGUgdGVzdCBpdC4KClJlZ2FyZHMsCkNocmlzdGlhbi4K
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
