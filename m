Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3577DAB53D
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 12:02:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF5756E21F;
	Fri,  6 Sep 2019 10:02:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0FC96E223;
 Fri,  6 Sep 2019 10:02:28 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id r195so6392684wme.2;
 Fri, 06 Sep 2019 03:02:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1dqr3cK8F4J1I6MOyJFK5LEW5iGsZW66Gwk9sPUDpsw=;
 b=EvcbZDsP/NpJSF62GK5fR81lH1hG1JuBkuK9a1QMCtR7p+G78RqWZn7QbSyAJ9ohEH
 UyDp8LjZ56I6/3f1oMIF3GiEPX5wnvuqaDdNLnioB80p1clCX2Sv7WpN+2crO8nb9ihw
 BoewmQemu0ALWrTyKhOqYI1TTHhRZvH02JyFERsEw8XL+JqxnQ6M5LvdDV7/pngYNhkV
 3s0nTnhVeMYkG43QrOfsdLseidY69prxisRocSbv5vV53cKl9kE51Z2ZlzAWuHzbnS8m
 RA2W4GUmiYUIRzBEaEbbm5gtorIUe9sPb72xCa2J/0g9RoyH97Ai1VC7e6pSqU7k9Wof
 g5hw==
X-Gm-Message-State: APjAAAWefE4mdD+sndIwP8Dw8+cbB2zSGf+XbAV/kFIX8mP8pSpnelQQ
 kAoMgpZgO6cED9Jnb5zpUaXddur6+N0=
X-Google-Smtp-Source: APXvYqzxEVkiLXNsljlZ6RrzfRqmXfC8u4X8/TPezF1hI4rIcnMTEzNVdU7+jyyBTLHIjNF/GzZ9Vg==
X-Received: by 2002:a05:600c:307:: with SMTP id q7mr343070wmd.6.1567764147186; 
 Fri, 06 Sep 2019 03:02:27 -0700 (PDT)
Received: from localhost.localdomain (62-178-82-229.cable.dynamic.surfer.at.
 [62.178.82.229])
 by smtp.gmail.com with ESMTPSA id i9sm7278868wrb.18.2019.09.06.03.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2019 03:02:26 -0700 (PDT)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/etnaviv: print MMU exception cause
Date: Fri,  6 Sep 2019 12:03:08 +0200
Message-Id: <20190906100308.15341-2-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190906100308.15341-1-christian.gmeiner@gmail.com>
References: <20190906100308.15341-1-christian.gmeiner@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1dqr3cK8F4J1I6MOyJFK5LEW5iGsZW66Gwk9sPUDpsw=;
 b=DI0MbopGbzLUAuXgNmTGyMAmEJiNzZ3DPvitO5y7OMkYti565OgD7JXEcd1k8AXTYS
 E9VY5PBFM1jvC5ZRW4PB8zMuLm8nhnqHO6zPGr8vV3XsBn2a/MJ8RB8XywSaHbBUUeua
 qG1tYQ95bpBI47QxT/J1asi+gPDuQ4Hiv4JnFEtvBqzgk8Q/uCdLSehzP9MpdscgVixF
 1bICttrlzV13MsME2MJhhykfCf+/9abhjvYlQM1lv8p8tWj4IFU1CC6N7IEkIDxjAxHZ
 hNTfdNgwwdTlAJKFWBhEMqKk05bBwswwVs1xT8gfBfdzazdMm0HbdYRiUzEgf8sHrHk6
 x6vg==
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
Cc: etnaviv@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TWlnaHQgYmUgdXNlZnVsIHdoZW4gZGVidWdnaW5nIE1NVSBleGNlcHRpb25zLgoKU2lnbmVkLW9m
Zi1ieTogQ2hyaXN0aWFuIEdtZWluZXIgPGNocmlzdGlhbi5nbWVpbmVyQGdtYWlsLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dwdS5jIHwgMjYgKysrKysrKysrKysr
KysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9ncHUuYyBiL2RyaXZlcnMvZ3B1
L2RybS9ldG5hdml2L2V0bmF2aXZfZ3B1LmMKaW5kZXggZDQ3ZDFhOGUwMjE5Li5hYTg3OGRkMDU4
NjAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ3B1LmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9ncHUuYwpAQCAtMTM2NCwxMCArMTM2
NCwzNiBAQCBzdGF0aWMgdm9pZCBkdW1wX21tdV9mYXVsdChzdHJ1Y3QgZXRuYXZpdl9ncHUgKmdw
dSkKIAogCWZvciAoaSA9IDA7IGkgPCA0OyBpKyspIHsKIAkJdTMyIGFkZHJlc3NfcmVnOworCQlj
b25zdCBjaGFyICplcnJvcjsKIAogCQlpZiAoIShzdGF0dXMgJiAoVklWU19NTVV2Ml9TVEFUVVNf
RVhDRVBUSU9OMF9fTUFTSyA8PCAoaSAqIDQpKSkpCiAJCQljb250aW51ZTsKIAorCQlzd2l0Y2gg
KHN0YXR1cykgeworCQljYXNlIE1NVV9FWENFUFRJT05fU0xBVkVfTk9UX1BSRVNFTlQ6CisJCQll
cnJvciA9ICJzbGF2ZSBub3QgcHJlc2VudCI7CisJCQlicmVhazsKKwkJY2FzZSBNTVVfRVhDRVBU
SU9OX1BBR0VfTk9UX1BSRVNFTlQ6CisJCQllcnJvciA9ICJwYWdlIG5vdCBwcmVzZW50IjsKKwkJ
CWJyZWFrOworCQljYXNlIE1NVV9FWENFUFRJT05fV1JJVEVfVklPTEFUSU9OOgorCQkJZXJyb3Ig
PSAid3JpdGUgdmlvbGF0aW9uIjsKKwkJCWJyZWFrOworCQljYXNlIE1NVV9FWENFUFRJT05fT1VU
X09GX0JPVU5EOgorCQkJZXJyb3IgPSAib3V0IG9mIGJvdW5kIjsKKwkJCWJyZWFrOworCQljYXNl
IE1NVV9FWENFUFRJT05fUkVBRF9TRUNVUklUWV9WSU9MQVRJT046CisJCQllcnJvciA9ICJyZWFk
IHNlY3VyaXR5IHZpb2xhdGlvbiI7CisJCQlicmVhazsKKwkJY2FzZSBNTVVfRVhDRVBUSU9OX1dS
SVRFX1NFQ1VSSVRZX1ZJT0xBVElPTjoKKwkJCWVycm9yID0gIndyaXRlIHNlY3VyaXR5IHZpb2xh
dGlvbiI7CisJCQlicmVhazsKKwkJZGVmYXVsdDoKKwkJCWVycm9yID0gInVua25vd24gc3RhdGUi
OworCQkJYnJlYWs7CisJCX0KKwkJZGV2X2Vycl9yYXRlbGltaXRlZChncHUtPmRldiwgIk1NVSAl
ZCAlc1xuIiwgaSwgZXJyb3IpOworCiAJCWlmIChncHUtPnNlY19tb2RlID09IEVUTkFfU0VDX05P
TkUpCiAJCQlhZGRyZXNzX3JlZyA9IFZJVlNfTU1VdjJfRVhDRVBUSU9OX0FERFIoaSk7CiAJCWVs
c2UKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
