Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A98F5BA279
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2019 14:08:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2493F6E14A;
	Sun, 22 Sep 2019 12:05:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EF666E02C;
 Sun, 22 Sep 2019 07:49:49 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id q12so7110017pff.9;
 Sun, 22 Sep 2019 00:49:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/P04TVQeG2TqtKqnh5NeUjgcAZkp2eeIEEO+pcLFimI=;
 b=ndvxLr48xg265n+JOmKnlMgWTT6TA47NOuWaSBOnJz5a/X5oF18fwjWwtG5Vp+XJG3
 O/pkFZw0jyxu1eQ6MUXQDL5UN07Ke3QfhbS+TNSulpNO0Y/tQCKz6SEHzjOaYo6RK5LD
 XxvpW+s5MrdbRmN/SpiMvhn/axyRzGNkN1kvfihBrHZCMM+duCrT993UwcMXaa/Rly6d
 8NHNb2BS41VP2jv3yzfVWFwQDwY4bi8itFJ9OUR3cCswb4iadlC6/MCk/voFbg+vMAJw
 MHGFcPieLdHlICoumfEwTAzXYiHhOHzb2Ysm1mH6Yc7KDO5BxapgbJqciuH/GqZqaflu
 BLlQ==
X-Gm-Message-State: APjAAAWBK4RkQMLzbuKCrIO4N+/5zAvZlU2Kd8nb7Av60CUpNOY9cftY
 vYcJC8wns3mczN5f2kvRVVNAhDfB
X-Google-Smtp-Source: APXvYqx9WFfqi0tOd1jiZXhwnRWHa9sevld2/rp0T8BsVLUgUcSnQPf8YghWXMs7gYxMmchxrZtI6w==
X-Received: by 2002:a63:790b:: with SMTP id u11mr7725989pgc.273.1569138588365; 
 Sun, 22 Sep 2019 00:49:48 -0700 (PDT)
Received: from yuq-Aspire-4738G.lan (ah.ptr230.ptrcloud.net. [153.122.161.8])
 by smtp.gmail.com with ESMTPSA id
 f188sm6194234pfa.170.2019.09.22.00.49.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2019 00:49:47 -0700 (PDT)
From: Qiang Yu <yuq825@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] dma-buf/resv: fix exclusive fence get
Date: Sun, 22 Sep 2019 15:49:00 +0800
Message-Id: <20190922074900.853-1-yuq825@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/P04TVQeG2TqtKqnh5NeUjgcAZkp2eeIEEO+pcLFimI=;
 b=M/xx3S0fObzJAC7Q0yLbKqcZqa5MoT9YYx9XUcR4V8ItKFBQYE/QwdqzrWkmKANvGN
 MYuC9n+WDjYmQIm1JImn4++yj8Nv/FD2I2Atm4bEw2L//p4BP0BpQ3Z4PEnPc8wdWjCi
 SR8sH/6I6+5o+r/u6MOnsKtg1ZDUEUBX8HyJpspkTtzOgGSXFCqPgWU60BrMRpv5185L
 wKDtpTgqYgr3MJU3/3M2EIDNSvivtVl7CJOxESGXrBB2xDua2+wbM2fFC8YLYVflWWbV
 SqsQwDPN1muzH+wMK7WSP0UiVhamJaM6a82sSoFobxf9cjeuaZtsT7HdkC2gA3JtVsqp
 1J3g==
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
Cc: lima@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Qiang Yu <yuq825@gmail.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBjYXVzZXMga2VybmVsIGNyYXNoIHdoZW4gdGVzdGluZyBsaW1hIGRyaXZlci4KCkNjOiBD
aHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkZpeGVzOiBiOGMwMzZk
ZmM2NmYgKCJkbWEtYnVmOiBzaW1wbGlmeSByZXNlcnZhdGlvbl9vYmplY3RfZ2V0X2ZlbmNlc19y
Y3UgYSBiaXQiKQpTaWduZWQtb2ZmLWJ5OiBRaWFuZyBZdSA8eXVxODI1QGdtYWlsLmNvbT4KLS0t
CiBkcml2ZXJzL2RtYS1idWYvZG1hLXJlc3YuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9k
bWEtcmVzdi5jIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1yZXN2LmMKaW5kZXggNDJhOGYzZjExNjgx
Li43MDkwMDI1MTU1NTAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtcmVzdi5jCisr
KyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtcmVzdi5jCkBAIC00NzEsNyArNDcxLDcgQEAgaW50IGRt
YV9yZXN2X2dldF9mZW5jZXNfcmN1KHN0cnVjdCBkbWFfcmVzdiAqb2JqLAogCWlmIChwZmVuY2Vf
ZXhjbCkKIAkJKnBmZW5jZV9leGNsID0gZmVuY2VfZXhjbDsKIAllbHNlIGlmIChmZW5jZV9leGNs
KQotCQlzaGFyZWRbKytzaGFyZWRfY291bnRdID0gZmVuY2VfZXhjbDsKKwkJc2hhcmVkW3NoYXJl
ZF9jb3VudCsrXSA9IGZlbmNlX2V4Y2w7CiAKIAlpZiAoIXNoYXJlZF9jb3VudCkgewogCQlrZnJl
ZShzaGFyZWQpOwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
