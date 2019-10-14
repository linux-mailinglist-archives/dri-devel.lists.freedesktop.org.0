Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A24BD6FF6
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 09:13:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 822846E60C;
	Tue, 15 Oct 2019 07:12:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FE016E526
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 18:43:24 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id 23so10595810pgk.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 11:43:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=amREymzw1c6IsU6bF35CaFvFb2Rgm1/hiMFDrclp26M=;
 b=Ix6j36wW1+o2swB0ZP52Dgo6L6fYWmW/cbS/RLLSTPOVPKw+d6zPVQOkKo3giEhTBJ
 iY573R/3Emp3mR8D9w8nxZ5dxxd9T/Njy9RduT3KwJyXUbg1y98/MZhuPq+CCkdWNyRU
 /dHpeWcMI/IIWuSSl1go5uVNOULi6g9Eum3Pb5ppukWSJkR+gISa+jDOsrKk5xIKbCwc
 DeyPTE5o1VuITLJI2D6J0XGpflv+FDtDsEBRYCHcDO1Xqi6U2JshbVNphSlUlaiQtQBV
 w/oBPMROeTQTMjwwVJP6x/SHW9zjXyJvzrXyVZZlB3JOvrbkcXD5whtggw6Hc7CMucXo
 4eiQ==
X-Gm-Message-State: APjAAAVbpbOaJX+SPqg/ydEY8IiuHQSOdxJN8CidEyY6FmUTPRd7Za4v
 Q8LRg1NnQ/T3wAkl/paes7c=
X-Google-Smtp-Source: APXvYqycaefK5rF/bgwFS26ZwLJNFQ3sCrNf1OMFZGNcsDq/+L0n63OCH9D2loyEuczmKh42TzZDXA==
X-Received: by 2002:a63:e802:: with SMTP id s2mr34339525pgh.188.1571078603482; 
 Mon, 14 Oct 2019 11:43:23 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
 by smtp.gmail.com with ESMTPSA id c26sm16932953pfo.173.2019.10.14.11.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 11:43:22 -0700 (PDT)
Date: Mon, 14 Oct 2019 11:43:20 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH] drm/bridge: ti-tfp410: switch to using
 fwnode_gpiod_get_index()
Message-ID: <20191014184320.GA161094@dtor-ws>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 15 Oct 2019 07:12:31 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=amREymzw1c6IsU6bF35CaFvFb2Rgm1/hiMFDrclp26M=;
 b=XK+t4wD79Ig4XGQ4KNdIg9ZVoBmi2QaekTMsU8vIwP32GqyVTKnznyb7UAYapnT37+
 IGoq46ttsalEit36po3g3a5Lq8LjvNj6jGaacY3w0J3KRdhr9ugyweQAt8WB0PcozswI
 qiKwxFZ+EH4NgXEd5a1jurV2477AM8DxKkkWk6bvRE8IzqVLhgLBjSr61VOhV9BGzRBM
 qSURxpI4BjxrK/ralolypJPuECgp98diaQrXcAgVydZ6lu+wmEwsI3cnyczcZGd7y2ME
 Vq3M/J40MNlo209NJQfcVrYX8aclXLFe5QjZb8HgV0+99B8NiRSfiiTVtRHcC1OYafps
 8/OQ==
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW5zdGVhZCBvZiBmd25vZGVfZ2V0X25hbWVkX2dwaW9kKCkgdGhhdCBJIHBsYW4gdG8gaGlkZSBh
d2F5LCBsZXQncyB1c2UKdGhlIG5ldyBmd25vZGVfZ3Bpb2RfZ2V0X2luZGV4KCkgdGhhdCBtaW1p
Y3MgZ3Bpb2RfZ2V0X2luZGV4KCksIGJ1dAp3b3JrcyB3aXRoIGFyYml0cmFyeSBmaXJtd2FyZSBu
b2RlLgoKUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRl
YXNvbmJvYXJkLmNvbT4KU2lnbmVkLW9mZi1ieTogRG1pdHJ5IFRvcm9raG92IDxkbWl0cnkudG9y
b2tob3ZAZ21haWwuY29tPgotLS0KCkFuZHJ6ZWosIE5laWwsCgpUaGlzIGRlcGVuZHMgb24gdGhl
IG5ldyBjb2RlIHRoYXQgY2FuIGJlIGJvdW5kIGluCmliLWZ3bm9kZS1ncGlvZC1nZXQtaW5kZXgg
aW1tdXRhYmxlIGJyYW5jaCBvZiBMaW51cycgV2FsbGVpaiB0cmVlOgoKICAgICAgICBnaXQgcHVs
bCBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbGludXN3L2xp
bnV4LWdwaW8uZ2l0IGliLWZ3bm9kZS1ncGlvZC1nZXQtaW5kZXgKCkkgaG9wZSB0aGF0IGl0IHdv
dWxkIGJlIHBvc3NpYmxlIHRvIHB1bGwgaW4gdGhpcyBpbW11dGFibGUgYnJhbmNoIGFuZApub3Qg
d2FpdCB1bnRpbCBhZnRlciA1LjUgbWVyZ2Ugd2luZG93LCBvciwgYWx0ZXJuYXRpdmVseSwgbWVy
Z2UgdGhyb3VnaApMaW51cyBXYWxsZWlqJ3MgdHJlZS4KClRoYW5rcyEKCiBkcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3RpLXRmcDQxMC5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvdGktdGZwNDEwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXRmcDQxMC5jCmluZGV4
IGFhMzE5OGRjOTkwMy4uNmY2ZDZkMWU2MGFlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL3RpLXRmcDQxMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktdGZwNDEw
LmMKQEAgLTI4NSw4ICsyODUsOCBAQCBzdGF0aWMgaW50IHRmcDQxMF9nZXRfY29ubmVjdG9yX3By
b3BlcnRpZXMoc3RydWN0IHRmcDQxMCAqZHZpKQogCWVsc2UKIAkJZHZpLT5jb25uZWN0b3JfdHlw
ZSA9IERSTV9NT0RFX0NPTk5FQ1RPUl9EVklEOwogCi0JZHZpLT5ocGQgPSBmd25vZGVfZ2V0X25h
bWVkX2dwaW9kKCZjb25uZWN0b3Jfbm9kZS0+Zndub2RlLAotCQkJCQkiaHBkLWdwaW9zIiwgMCwg
R1BJT0RfSU4sICJocGQiKTsKKwlkdmktPmhwZCA9IGZ3bm9kZV9ncGlvZF9nZXRfaW5kZXgoJmNv
bm5lY3Rvcl9ub2RlLT5md25vZGUsCisJCQkJCSAgImhwZCIsIDAsIEdQSU9EX0lOLCAiaHBkIik7
CiAJaWYgKElTX0VSUihkdmktPmhwZCkpIHsKIAkJcmV0ID0gUFRSX0VSUihkdmktPmhwZCk7CiAJ
CWR2aS0+aHBkID0gTlVMTDsKLS0gCjIuMjMuMC43MDAuZzU2Y2Y3NjdiZGItZ29vZwoKCi0tIApE
bWl0cnkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
