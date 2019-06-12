Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B1541D02
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 08:56:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C98489364;
	Wed, 12 Jun 2019 06:55:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC2DB892ED;
 Wed, 12 Jun 2019 06:55:43 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id p11so15577238wre.7;
 Tue, 11 Jun 2019 23:55:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zQt3dTdSIWWsICsAYI/0AdJq0BXECo0U6dzPvCi9/fc=;
 b=b64mTD/ctcVEFlOkwMwdUieHzSmuDh/w5EmFyDWTURkaPSs6RbpWXXHQi/sICuBfhl
 kx7d8VMdsRIMfD/zqbyMxV9IUCphSlCbETAnqsirE9GrBqCvMhs/v6/BK7yHSHl4hG7K
 73+7MY4TjD6wat7RiJ6LrsAjujxyy8GIDKPh9lcMXa4uVSCJhWH9wKP4FyU3AFI/4FDU
 e7XiX2dF+r9Ucr0RON/yHj5Z0OwA+3y4yLz0+C2t2wyrZHP6AY5JYRr966jV5jypmIgN
 2KtNPItIJN1mW8XwQf8TZZW1yWAac6SdAMTw1WdkcobS+b/JkkH8Zkcm0M4DNTqoxN0N
 cKPg==
X-Gm-Message-State: APjAAAWtyoryavBb3QR6vFHX7PMJyepCgnKWtjhXPCIy6WTBs3mVOm/z
 wKboYn2YDWOi2urbcgV53dW8m/jKcwI=
X-Google-Smtp-Source: APXvYqyHqDMPZYr/NW4jLdO9agHqSfno94vT10KoRoB7iqt1kOqXGFrMAxvUnBgYS1Z/a0+UE6vXeQ==
X-Received: by 2002:a5d:5186:: with SMTP id k6mr38801827wrv.30.1560322540601; 
 Tue, 11 Jun 2019 23:55:40 -0700 (PDT)
Received: from cizrna.lan ([109.72.12.69])
 by smtp.gmail.com with ESMTPSA id u23sm4337132wmj.33.2019.06.11.23.55.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 23:55:39 -0700 (PDT)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Subject: [PATCH i-g-t 2/2] tests/panfrost: Fix couple of things so submit
 tests work on T720
Date: Wed, 12 Jun 2019 08:55:30 +0200
Message-Id: <20190612065530.64238-2-tomeu.vizoso@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190612065530.64238-1-tomeu.vizoso@collabora.com>
References: <20190612065530.64238-1-tomeu.vizoso@collabora.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zQt3dTdSIWWsICsAYI/0AdJq0BXECo0U6dzPvCi9/fc=;
 b=U2BQCYmluJ/9tCe7ZD4VNqI9NKB+kkcN+jIz0gzvLDdsErWPFkWZ0eUcPVzjWOR95K
 SXYAQI9QPdEWLRpWJuwjEAHTT7FIQFNv3Wx65F4S9aoYbblxqKf+C8LubrThv91rFzJQ
 7eniF1pHY7qsgIwuVY8FiH56ln/tJSUwEzPszVnvXSiTU9iLbYgxSWaR1RgarRaOrdmS
 6bX4JhwcCCCOl7zXT/f09hCPm9f6SHUKQ4BIXO0puM5U8nGhjQIAVevo9Y7pUGvE6cZy
 2Y34egpS5LHj6rLYgSp8o2KPRqS+w9wxFfp1nr7dktYgcnx0PdXro3bZfovrORGF5qkc
 V0ZA==
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogVG9tZXUgVml6b3NvIDx0b21ldS52aXpvc29AY29sbGFib3JhLmNvbT4K
LS0tCiB0ZXN0cy9wYW5mcm9zdF9zdWJtaXQuYyB8IDI2ICsrKysrKysrKysrKysrKysrKysrKyst
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS90ZXN0cy9wYW5mcm9zdF9zdWJtaXQuYyBiL3Rlc3RzL3BhbmZyb3N0X3N1Ym1p
dC5jCmluZGV4IDU3NzBkYzI0YTQyYi4uMTNjZTg1YjczZDllIDEwMDY0NAotLS0gYS90ZXN0cy9w
YW5mcm9zdF9zdWJtaXQuYworKysgYi90ZXN0cy9wYW5mcm9zdF9zdWJtaXQuYwpAQCAtMzQsMTAg
KzM0LDExIEBACiAjaW5jbHVkZSA8ZXJybm8uaD4KICNpbmNsdWRlIDxzeXMvc3RhdC5oPgogI2lu
Y2x1ZGUgPHN5cy9pb2N0bC5oPgorI2luY2x1ZGUgInBhbmZyb3N0LWpvYi5oIgogI2luY2x1ZGUg
InBhbmZyb3N0X2RybS5oIgogCi0jZGVmaW5lIFdJRFRIICAgICAgICAgIDEzNjYKLSNkZWZpbmUg
SEVJR0hUICAgICAgICAgNzY4CisjZGVmaW5lIFdJRFRIICAgICAgICAgIDE5MjAKKyNkZWZpbmUg
SEVJR0hUICAgICAgICAgMTA4MAogI2RlZmluZSBDTEVBUl9DT0xPUiAgICAweGZmN2Y3ZjdmCiAK
IC8qIE9uZSB0ZW50aCBvZiBhIHNlY29uZCAqLwpAQCAtNTYsMTQgKzU3LDMwIEBAIGFic190aW1l
b3V0KHVpbnQ2NF90IGR1cmF0aW9uKQogICAgICAgICByZXR1cm4gKHVpbnQ2NF90KWN1cnJlbnQu
dHZfc2VjICogTlNFQ1NfUEVSX1NFQyArIGN1cnJlbnQudHZfbnNlYyArIGR1cmF0aW9uOwogfQog
CitzdGF0aWMgdm9pZCBjaGVja19lcnJvcihpbnQgZmQsIHN0cnVjdCBwYW5mcm9zdF9zdWJtaXQg
KnN1Ym1pdCkKK3sKKwlzdHJ1Y3QgbWFsaV9qb2JfZGVzY3JpcHRvcl9oZWFkZXIgKmhlYWRlcjsK
KworICAgICAgICBoZWFkZXIgPSBzdWJtaXQtPnN1Ym1pdF9iby0+bWFwOworICAgICAgICBpZ3Rf
YXNzZXJ0X2VxX3U2NChoZWFkZXItPmZhdWx0X3BvaW50ZXIsIDApOworfQorCiBzdGF0aWMgdm9p
ZCBjaGVja19mYihpbnQgZmQsIHN0cnVjdCBwYW5mcm9zdF9ibyAqYm8pCiB7CisgICAgICAgIGlu
dCBncHVfcHJvZF9pZCA9IGlndF9wYW5mcm9zdF9nZXRfcGFyYW0oZmQsIERSTV9QQU5GUk9TVF9Q
QVJBTV9HUFVfUFJPRF9JRCk7CiAgICAgICAgIF9fdWludDMyX3QgKmZibzsKICAgICAgICAgaW50
IGk7CiAKICAgICAgICAgZmJvID0gYm8tPm1hcDsKLSAgICAgICAgZm9yIChpID0gMDsgaSA8IEFM
SUdOKFdJRFRILCAxNikgKiBIRUlHSFQ7IGkrKykKLSAgICAgICAgICAgICAgICBpZ3RfYXNzZXJ0
X2VxX3UzMihmYm9baV0sIENMRUFSX0NPTE9SKTsKKworICAgICAgICBpZiAoZ3B1X3Byb2RfaWQg
Pj0gMHgwNzUwKSB7CisgICAgICAgICAgICAgICAgZm9yIChpID0gMDsgaSA8IEFMSUdOKFdJRFRI
LCAxNikgKiBIRUlHSFQ7IGkrKykKKyAgICAgICAgICAgICAgICAgICAgICAgIGlndF9hc3NlcnRf
ZXFfdTMyKGZib1tpXSwgQ0xFQVJfQ09MT1IpOworICAgICAgICB9IGVsc2UgeworICAgICAgICAg
ICAgICAgIC8vIE1hc2sgdGhlIGFscGhhIGF3YXkgYmVjYXVzZSBvbiA8PVQ3MjAgd2UgZG9uJ3Qg
a25vdyBob3cgdG8gaGF2ZSBpdAorICAgICAgICAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBBTElH
TihXSURUSCwgMTYpICogSEVJR0hUOyBpKyspCisgICAgICAgICAgICAgICAgICAgICAgICBpZ3Rf
YXNzZXJ0X2VxX3UzMihmYm9baV0sIENMRUFSX0NPTE9SICYgMHgwMGZmZmZmZik7CisgICAgICAg
IH0KIH0KIAogaWd0X21haW4KQEAgLTg0LDYgKzEwMSw3IEBAIGlndF9tYWluCiAgICAgICAgICAg
ICAgICAgZG9faW9jdGwoZmQsIERSTV9JT0NUTF9QQU5GUk9TVF9TVUJNSVQsIHN1Ym1pdC0+YXJn
cyk7CiAgICAgICAgICAgICAgICAgaWd0X2Fzc2VydChzeW5jb2JqX3dhaXQoZmQsICZzdWJtaXQt
PmFyZ3MtPm91dF9zeW5jLCAxLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGFic190aW1lb3V0KFNIT1JUX1RJTUVfTlNFQyksIDAsIE5VTEwpKTsKKyAgICAgICAgICAg
ICAgICBjaGVja19lcnJvcihmZCwgc3VibWl0KTsKICAgICAgICAgICAgICAgICBjaGVja19mYihm
ZCwgc3VibWl0LT5mYm8pOwogICAgICAgICAgICAgICAgIGlndF9wYW5mcm9zdF9mcmVlX2pvYihm
ZCwgc3VibWl0KTsKICAgICAgICAgfQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
