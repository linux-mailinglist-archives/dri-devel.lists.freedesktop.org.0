Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2D111C894
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 09:55:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98D676ECBF;
	Thu, 12 Dec 2019 08:55:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D11E6EB95;
 Wed, 11 Dec 2019 15:43:00 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id w15so24628690wru.4;
 Wed, 11 Dec 2019 07:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uMd/Uy3uDPmMWE8oYLf+NvUl5yrN72ZYYafnnOZx+OI=;
 b=S2ZvBhlCeHPssB/4QOlpegJMpVJdcVv2tSVAYiWd8mKVFZuPrKXiXlxH189FtJCZK9
 GG7Fxl+k9Wk9qR8NsuOrP5Mj+VhbMt+Oa0fIFQkfcByNqXGkNlUmlfQv1WFuUI23J49T
 1sgKfJK20/Z6UfrWOFeuD0qKrn49WovqVa1aeCWxDxqtwiOuEyyrIqhSrCEjfie0cYXb
 VmvDSfx6fCyLIUBDKg0MfBrm06XqvfgNo2bSz/dPDVuVhRSmxF6lG2ZNnruvzYs4Rw0U
 xdLDzpPB5Ha3MN/mQ1DQLWsERZ2LXEvv28ssq2oY56837v4mSF4d4kEJse42hNlCFKjm
 gXbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uMd/Uy3uDPmMWE8oYLf+NvUl5yrN72ZYYafnnOZx+OI=;
 b=T076ckD7QzQibIxXAS4tZFJTSoCaHqO0gwlO+n8aBr7fN3I41kSRpgdFB3MiB0HZXJ
 yJbS2GTfBe0x46SfX5goDv9i6QUbpvI8BdiLl+OQwSIXLx823P8fh+ywmE+MCiRTV6r7
 v1ssN1p4+GRIpoIC9zd6hMSGn264w0kUKA4KrkcBl97dBvkGou8olFRvXeblUR6y5zH2
 mI3SxXJsTetb7ZiRS6NnXGIyKaS7D/np5oNATyGKP+F74Ehe2TaZbUXNoTZGWYz9Prsu
 SQ8Akjf/TlkpB4rYv8nfSS7Y37rb5VN3muHNYLejhs+ofdvH5puZ2ud0yYPrTauNfuYw
 Tv0w==
X-Gm-Message-State: APjAAAUC9bEqhYB/yBUBDLaeyb6g0HmOhpgf6UxGKW8ZIjbZF8JCzEgh
 +0cnNkxwDGC4pln4hiBqYguZ3uPkU2oixQ==
X-Google-Smtp-Source: APXvYqyHGOY8sI8toRiXQ4cLCGUHLBVM8eTdIX76OiEdTkDYxQoONla2VM4mXSyLl4CsNttDaneRsw==
X-Received: by 2002:a5d:4b8f:: with SMTP id b15mr514150wrt.100.1576078978618; 
 Wed, 11 Dec 2019 07:42:58 -0800 (PST)
Received: from brihaspati.fritz.box
 (p200300C58F28C000ABD17033B4D14136.dip0.t-ipconnect.de.
 [2003:c5:8f28:c000:abd1:7033:b4d1:4136])
 by smtp.gmail.com with ESMTPSA id o7sm2621380wmc.41.2019.12.11.07.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2019 07:42:57 -0800 (PST)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] drm/scheduler: do not keep a copy of sched list
Date: Wed, 11 Dec 2019 16:42:58 +0100
Message-Id: <20191211154258.18289-4-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191211154258.18289-1-nirmoy.das@amd.com>
References: <20191211154258.18289-1-nirmoy.das@amd.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 12 Dec 2019 08:55:06 +0000
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
Cc: alexander.deucher@amd.com, kenny.ho@amd.com, nirmoy.das@amd.com,
 christian.koenig@amd.com, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZW50aXR5IHNob3VsZCBub3Qga2VlcCBjb3B5IGFuZCBtYWludGFpbiBzY2hlZCBsaXN0IGZvcgpp
dHNlbGYuCgpTaWduZWQtb2ZmLWJ5OiBOaXJtb3kgRGFzIDxuaXJtb3kuZGFzQGFtZC5jb20+ClJl
dmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9lbnRpdHkuYyB8IDE5ICsrKystLS0t
LS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfZW50aXR5
LmMgYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX2VudGl0eS5jCmluZGV4IGY5YjZj
ZTI5YzU4Zi4uMmUzYTA1OGZjMjM5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1
bGVyL3NjaGVkX2VudGl0eS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRf
ZW50aXR5LmMKQEAgLTU2LDggKzU2LDYgQEAgaW50IGRybV9zY2hlZF9lbnRpdHlfaW5pdChzdHJ1
Y3QgZHJtX3NjaGVkX2VudGl0eSAqZW50aXR5LAogCQkJICB1bnNpZ25lZCBpbnQgbnVtX3NjaGVk
X2xpc3QsCiAJCQkgIGF0b21pY190ICpndWlsdHkpCiB7Ci0JaW50IGk7Ci0KIAlpZiAoIShlbnRp
dHkgJiYgc2NoZWRfbGlzdCAmJiAobnVtX3NjaGVkX2xpc3QgPT0gMCB8fCBzY2hlZF9saXN0WzBd
KSkpCiAJCXJldHVybiAtRUlOVkFMOwogCkBAIC02NywyMiArNjUsMTQgQEAgaW50IGRybV9zY2hl
ZF9lbnRpdHlfaW5pdChzdHJ1Y3QgZHJtX3NjaGVkX2VudGl0eSAqZW50aXR5LAogCWVudGl0eS0+
Z3VpbHR5ID0gZ3VpbHR5OwogCWVudGl0eS0+bnVtX3NjaGVkX2xpc3QgPSBudW1fc2NoZWRfbGlz
dDsKIAllbnRpdHktPnByaW9yaXR5ID0gcHJpb3JpdHk7Ci0JZW50aXR5LT5zY2hlZF9saXN0ID0g
IGtjYWxsb2MobnVtX3NjaGVkX2xpc3QsCi0JCQkJICAgICAgc2l6ZW9mKHN0cnVjdCBkcm1fZ3B1
X3NjaGVkdWxlciAqKSwgR0ZQX0tFUk5FTCk7CisJZW50aXR5LT5zY2hlZF9saXN0ID0gbnVtX3Nj
aGVkX2xpc3QgPiAxID8gc2NoZWRfbGlzdCA6IE5VTEw7CisJZW50aXR5LT5sYXN0X3NjaGVkdWxl
ZCA9IE5VTEw7CiAKLQlpZighZW50aXR5LT5zY2hlZF9saXN0KQotCQlyZXR1cm4gLUVOT01FTTsK
KwlpZihudW1fc2NoZWRfbGlzdCkKKwkJZW50aXR5LT5ycSA9ICZzY2hlZF9saXN0WzBdLT5zY2hl
ZF9ycVtlbnRpdHktPnByaW9yaXR5XTsKIAogCWluaXRfY29tcGxldGlvbigmZW50aXR5LT5lbnRp
dHlfaWRsZSk7CiAKLQlmb3IgKGkgPSAwOyBpIDwgbnVtX3NjaGVkX2xpc3Q7IGkrKykKLQkJZW50
aXR5LT5zY2hlZF9saXN0W2ldID0gc2NoZWRfbGlzdFtpXTsKLQotCWlmIChudW1fc2NoZWRfbGlz
dCkKLQkJZW50aXR5LT5ycSA9ICZlbnRpdHktPnNjaGVkX2xpc3RbMF0tPnNjaGVkX3JxW2VudGl0
eS0+cHJpb3JpdHldOwotCi0JZW50aXR5LT5sYXN0X3NjaGVkdWxlZCA9IE5VTEw7Ci0KIAlzcGlu
X2xvY2tfaW5pdCgmZW50aXR5LT5ycV9sb2NrKTsKIAlzcHNjX3F1ZXVlX2luaXQoJmVudGl0eS0+
am9iX3F1ZXVlKTsKIApAQCAtMzEyLDcgKzMwMiw2IEBAIHZvaWQgZHJtX3NjaGVkX2VudGl0eV9m
aW5pKHN0cnVjdCBkcm1fc2NoZWRfZW50aXR5ICplbnRpdHkpCiAKIAlkbWFfZmVuY2VfcHV0KGVu
dGl0eS0+bGFzdF9zY2hlZHVsZWQpOwogCWVudGl0eS0+bGFzdF9zY2hlZHVsZWQgPSBOVUxMOwot
CWtmcmVlKGVudGl0eS0+c2NoZWRfbGlzdCk7CiB9CiBFWFBPUlRfU1lNQk9MKGRybV9zY2hlZF9l
bnRpdHlfZmluaSk7CiAKLS0gCjIuMjQuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
