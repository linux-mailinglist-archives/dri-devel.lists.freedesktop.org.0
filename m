Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9196E7EE
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 17:23:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E7896E84C;
	Fri, 19 Jul 2019 15:23:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED1866E84B
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 15:23:22 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id r12so32991edo.5
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 08:23:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WWlIQkZTe6LQuA5KTQkgPsDt9/EldhERVA4pYeIqcAw=;
 b=LrTaxz1LGEOIuhgigvQ2YzGTuDluqzwP//bdbeXa46WzBWOUo7qU3WjktMQFIFfjzA
 Ata5t4dREHfPECAEuUw4kXxhlNAKjN//hJhnDQmZQoGtLGmO3kf91+PRGBpmx0NUuK2w
 wKRym17mdMVAJaQlI4YbfxKV4LuS7qFeRDoOUfaHkPeBz5O/TNmowuz5WLOtxi7A1rlv
 cpBXnkgYRFyM59ZMqAau+7iZ3m80p2klKHslSbP5rnNaFFaTCyGIJeGs+edmvANNJjh6
 V4STYrFlCzjm9BWVW1kEqtQ2SiYdfrI4VdwM4nE2R3FiL1B1eL8rOnpRpgOI4zB8wd/C
 LO7Q==
X-Gm-Message-State: APjAAAVLePjxh7bSWAcPJoLHGgxjCgTsELnPWBNeInlJVmDi+xGVF+Jx
 wmUtkk2Zy1lDGSG2bowKc6rayZe6
X-Google-Smtp-Source: APXvYqyfkLGT2aKqtamMXOfmfLZSnwPQA+lhK7SiBEsVLHZ2b9Hu39LHr80BckD6LJF3aHXjESgtYg==
X-Received: by 2002:aa7:ce91:: with SMTP id y17mr47601734edv.56.1563549801310; 
 Fri, 19 Jul 2019 08:23:21 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id t2sm8882538eda.95.2019.07.19.08.23.20
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 19 Jul 2019 08:23:20 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/3] drm/vkms: Use wait_for_flip_done
Date: Fri, 19 Jul 2019 17:23:13 +0200
Message-Id: <20190719152314.7706-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190719152314.7706-1-daniel.vetter@ffwll.ch>
References: <20190719152314.7706-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WWlIQkZTe6LQuA5KTQkgPsDt9/EldhERVA4pYeIqcAw=;
 b=dKlfpJXOJzQ+8LO2HOq7bLbf+GQ7TsiAa0dtPDBwc1+xymllHNcjE7cY4xouIVgJid
 ubTPLiy1vgoShvbGw7Te+yAMderkGmbbxlQ0M3rb6tRXu7C6BHmpzz10O6SuEqFxoX7/
 AZ6//+C+k6i5DCzQrJ4f5RF6ogV9v54yv4LDo=
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SXQncyB0aGUgcmVjb21tZW5kZWQgdmVyc2lvbiwgd2FpdF9mb3JfdmJsYW5rcyBpcyBhIGJpdCBh
IGhhY2t5CmludGVyaW0gdGhpbmcgdGhhdCBwcmVkYXRlcyBhbGwgdGhlIGZsaXBfZG9uZSB0cmFj
a2luZy4gSXQncwp1bmZvcnR1bmF0ZWx5IHN0aWxsIHRoZSBkZWZhdWx0IC4uLgoKU2lnbmVkLW9m
Zi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiBSb2RyaWdv
IFNpcXVlaXJhIDxyb2RyaWdvc2lxdWVpcmFtZWxvQGdtYWlsLmNvbT4KQ2M6IEhhbmVlbiBNb2hh
bW1lZCA8aGFtb2hhbW1lZC5zYUBnbWFpbC5jb20+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxA
ZmZ3bGwuY2g+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19kcnYuYyB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vdmttcy92
a21zX2Rydi5jCmluZGV4IDQ0YWI5ZjhlZjhiZS4uODA1MjRhMjI0MTJhIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92a21z
L3ZrbXNfZHJ2LmMKQEAgLTgzLDcgKzgzLDcgQEAgc3RhdGljIHZvaWQgdmttc19hdG9taWNfY29t
bWl0X3RhaWwoc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKm9sZF9zdGF0ZSkKIAogCWRybV9hdG9t
aWNfaGVscGVyX2NvbW1pdF9od19kb25lKG9sZF9zdGF0ZSk7CiAKLQlkcm1fYXRvbWljX2hlbHBl
cl93YWl0X2Zvcl92YmxhbmtzKGRldiwgb2xkX3N0YXRlKTsKKwlkcm1fYXRvbWljX2hlbHBlcl93
YWl0X2Zvcl9mbGlwX2RvbmUoZGV2LCBvbGRfc3RhdGUpOwogCiAJZm9yX2VhY2hfb2xkX2NydGNf
aW5fc3RhdGUob2xkX3N0YXRlLCBjcnRjLCBvbGRfY3J0Y19zdGF0ZSwgaSkgewogCQlzdHJ1Y3Qg
dmttc19jcnRjX3N0YXRlICp2a21zX3N0YXRlID0KLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
