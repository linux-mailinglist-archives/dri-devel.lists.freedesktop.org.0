Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E33E717B
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 13:37:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D42176E82B;
	Mon, 28 Oct 2019 12:37:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 788D86E82B
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 12:37:35 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id w18so9726010wrt.3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 05:37:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YGu5TjyuaHf7D/YFViamxWFcAcwWPrmI9iCh49BU0qM=;
 b=j+9SZD0lkH7hLDngjY2qxyUlkGdyc6cyqhxicwPRYEbafEewcys7PBBp6xyspPpA/Y
 mdN2ShqOUPb7CwGajKTgFeS+peUP/wjQsgRZJ+XbzlodSj1lFwjlF3QKcRLkHRiUVmz5
 SqKCoUkK/kyddhvkHX1S4mgTcFZ/xd4zl3nFRdvQy7iMS41sEdql0VfbJpV05Nf12gVC
 0aoczeatlkGY4Z+DrQg7a25tBgy8YkwjO07SIEnLmBpUOE8krOpT7NCyMnckgvPtypmQ
 HR4G36qW5fPLS3mXHiFVaZfKM+0jNLgVrRaM9OB4plQNXEly1Hm+Sv5LMv5A8czvJCZP
 kwTA==
X-Gm-Message-State: APjAAAX11oCpcgrleZ55SYyJsLD7aP8Klde279bFzAPZqk3JpLP2//jJ
 c5az9RWYsWwwNLQ1SCZNHmk=
X-Google-Smtp-Source: APXvYqz7QNZG6RSaXHUuYYcJVyTDml0KvIAScsBZprWSCdNBiGZVAoDWl7Flo6yTPY3bLHEYb3ebhw==
X-Received: by 2002:a5d:4283:: with SMTP id k3mr14839241wrq.236.1572266253975; 
 Mon, 28 Oct 2019 05:37:33 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id d16sm1542915wmb.27.2019.10.28.05.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 05:37:32 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 06/12] gpu: host1x: Allocate gather copy for host1x
Date: Mon, 28 Oct 2019 13:37:12 +0100
Message-Id: <20191028123718.3890217-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191028123718.3890217-1-thierry.reding@gmail.com>
References: <20191028123718.3890217-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YGu5TjyuaHf7D/YFViamxWFcAcwWPrmI9iCh49BU0qM=;
 b=J6T8Et3Q9OPbN2qUhiKDlDj4XkuDt/ejRzmA4Y+vOMYWTSHcAmlFNIDC9V9jAW4w+p
 48GR6SvU7LTdX9aAiXbed/AX8rODJnC6qHCRM9qwMuVKohbGVxqnbmoCdKbSBjrbJhAj
 6RqYc7u4Q4YrZGyrNliJFpbCmlI0Gm+W+126GLBIqEkC4yoTQir++QrqrSzgONFmd+cY
 TA7yFW0twfdoblb5IrT4oQO/jrCTT/Ds+fwh3Tp4Cx7CWl2bOWsurn2p/uaox4dNVBCY
 Er3trvhH2kF0ENxCN9pN7J1Ts/AFK4smzAbkpnZR0ptF+Ujj0sC66JBQgmvUNBL3xRb6
 LSBg==
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
Cc: linux-tegra@vger.kernel.org, Sachin Nikam <snikam@nvidia.com>,
 dri-devel@lists.freedesktop.org, Puneet Saxena <puneets@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCkN1cnJlbnRseSB3aGVu
IHRoZSBnYXRoZXIgYnVmZmVycyBhcmUgY29waWVkLCB0aGV5IGFyZSBjb3BpZWQgdG8gYQpidWZm
ZXIgdGhhdCBpcyBhbGxvY2F0ZWQgZm9yIHRoZSBob3N0MXggY2xpZW50IHRoYXQgd2FudHMgdG8g
ZXhlY3V0ZSB0aGUKY29tbWFuZCBzdHJlYW1zIGluIHRoZSBidWZmZXJzLiBIb3dldmVyLCB0aGUg
Z2F0aGVyIGJ1ZmZlcnMgd2lsbCBiZSByZWFkCmJ5IHRoZSBob3N0MXggZGV2aWNlLCB3aGljaCBj
YXVzZXMgU01NVSBmYXVsdHMgaWYgdGhlIERNQSBBUEkgaXMgYmFja2VkCmJ5IGFuIElPTU1VLgoK
Rml4IHRoaXMgYnkgYWxsb2NhdGluZyB0aGUgZ2F0aGVyIGJ1ZmZlciBjb3B5IGZvciB0aGUgaG9z
dDF4IGRldmljZSwKd2hpY2ggbWFrZXMgc3VyZSB0aGF0IGl0IHdpbGwgYmUgbWFwcGVkIGludG8g
dGhlIGhvc3QxeCdzIElPVkEgc3BhY2UgaWYKdGhlIERNQSBBUEkgaXMgYmFja2VkIGJ5IGFuIElP
TU1VLgoKU2lnbmVkLW9mZi1ieTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9ob3N0MXgvam9iLmMgfCAxMSArKysrKystLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9ob3N0MXgvam9iLmMgYi9kcml2ZXJzL2dwdS9ob3N0MXgvam9iLmMKaW5kZXggOTBk
ZDU5MmZkZmNhLi4yZTBjM2UwY2ExZmEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2hvc3QxeC9q
b2IuYworKysgYi9kcml2ZXJzL2dwdS9ob3N0MXgvam9iLmMKQEAgLTQ0NSw3ICs0NDUsOCBAQCBz
dGF0aWMgaW50IHZhbGlkYXRlKHN0cnVjdCBob3N0MXhfZmlyZXdhbGwgKmZ3LCBzdHJ1Y3QgaG9z
dDF4X2pvYl9nYXRoZXIgKmcpCiAJcmV0dXJuIGVycjsKIH0KIAotc3RhdGljIGlubGluZSBpbnQg
Y29weV9nYXRoZXJzKHN0cnVjdCBob3N0MXhfam9iICpqb2IsIHN0cnVjdCBkZXZpY2UgKmRldikK
K3N0YXRpYyBpbmxpbmUgaW50IGNvcHlfZ2F0aGVycyhzdHJ1Y3QgZGV2aWNlICpob3N0LCBzdHJ1
Y3QgaG9zdDF4X2pvYiAqam9iLAorCQkJICAgICAgIHN0cnVjdCBkZXZpY2UgKmRldikKIHsKIAlz
dHJ1Y3QgaG9zdDF4X2ZpcmV3YWxsIGZ3OwogCXNpemVfdCBzaXplID0gMDsKQEAgLTQ2OCwxMiAr
NDY5LDEyIEBAIHN0YXRpYyBpbmxpbmUgaW50IGNvcHlfZ2F0aGVycyhzdHJ1Y3QgaG9zdDF4X2pv
YiAqam9iLCBzdHJ1Y3QgZGV2aWNlICpkZXYpCiAJICogVHJ5IGEgbm9uLWJsb2NraW5nIGFsbG9j
YXRpb24gZnJvbSBhIGhpZ2hlciBwcmlvcml0eSBwb29scyBmaXJzdCwKIAkgKiBhcyBhd2FpdGlu
ZyBmb3IgdGhlIGFsbG9jYXRpb24gaGVyZSBpcyBhIG1ham9yIHBlcmZvcm1hbmNlIGhpdC4KIAkg
Ki8KLQlqb2ItPmdhdGhlcl9jb3B5X21hcHBlZCA9IGRtYV9hbGxvY193YyhkZXYsIHNpemUsICZq
b2ItPmdhdGhlcl9jb3B5LAorCWpvYi0+Z2F0aGVyX2NvcHlfbWFwcGVkID0gZG1hX2FsbG9jX3dj
KGhvc3QsIHNpemUsICZqb2ItPmdhdGhlcl9jb3B5LAogCQkJCQkgICAgICAgR0ZQX05PV0FJVCk7
CiAKIAkvKiB0aGUgaGlnaGVyIHByaW9yaXR5IGFsbG9jYXRpb24gZmFpbGVkLCB0cnkgdGhlIGdl
bmVyaWMtYmxvY2tpbmcgKi8KIAlpZiAoIWpvYi0+Z2F0aGVyX2NvcHlfbWFwcGVkKQotCQlqb2It
PmdhdGhlcl9jb3B5X21hcHBlZCA9IGRtYV9hbGxvY193YyhkZXYsIHNpemUsCisJCWpvYi0+Z2F0
aGVyX2NvcHlfbWFwcGVkID0gZG1hX2FsbG9jX3djKGhvc3QsIHNpemUsCiAJCQkJCQkgICAgICAg
JmpvYi0+Z2F0aGVyX2NvcHksCiAJCQkJCQkgICAgICAgR0ZQX0tFUk5FTCk7CiAJaWYgKCFqb2It
PmdhdGhlcl9jb3B5X21hcHBlZCkKQEAgLTUyMSw3ICs1MjIsNyBAQCBpbnQgaG9zdDF4X2pvYl9w
aW4oc3RydWN0IGhvc3QxeF9qb2IgKmpvYiwgc3RydWN0IGRldmljZSAqZGV2KQogCQlnb3RvIG91
dDsKIAogCWlmIChJU19FTkFCTEVEKENPTkZJR19URUdSQV9IT1NUMVhfRklSRVdBTEwpKSB7Ci0J
CWVyciA9IGNvcHlfZ2F0aGVycyhqb2IsIGRldik7CisJCWVyciA9IGNvcHlfZ2F0aGVycyhob3N0
LT5kZXYsIGpvYiwgZGV2KTsKIAkJaWYgKGVycikKIAkJCWdvdG8gb3V0OwogCX0KQEAgLTU4Miw3
ICs1ODMsNyBAQCB2b2lkIGhvc3QxeF9qb2JfdW5waW4oc3RydWN0IGhvc3QxeF9qb2IgKmpvYikK
IAlqb2ItPm51bV91bnBpbnMgPSAwOwogCiAJaWYgKGpvYi0+Z2F0aGVyX2NvcHlfc2l6ZSkKLQkJ
ZG1hX2ZyZWVfd2Moam9iLT5jaGFubmVsLT5kZXYsIGpvYi0+Z2F0aGVyX2NvcHlfc2l6ZSwKKwkJ
ZG1hX2ZyZWVfd2MoaG9zdC0+ZGV2LCBqb2ItPmdhdGhlcl9jb3B5X3NpemUsCiAJCQkgICAgam9i
LT5nYXRoZXJfY29weV9tYXBwZWQsIGpvYi0+Z2F0aGVyX2NvcHkpOwogfQogRVhQT1JUX1NZTUJP
TChob3N0MXhfam9iX3VucGluKTsKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
