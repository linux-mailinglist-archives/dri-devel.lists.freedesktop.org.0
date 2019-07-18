Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9385B6D13B
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 17:37:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9C696E409;
	Thu, 18 Jul 2019 15:37:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA2A56E409;
 Thu, 18 Jul 2019 15:37:52 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id 62so14654970lfa.8;
 Thu, 18 Jul 2019 08:37:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=CkYH+Syi4O/yhDhEc/xDog537x8dbMQ1g6nGXmqq72Q=;
 b=PH7VdpCYcZjdUw6KslEeLSSM07A+YAArBUcby7QTpVtMf54w4hjsRAlhbdCvkDYX6A
 fQSdnBj1HylY37ZHY9lWchXYSA5FWXawidGygfqi/Yc1azFslxffxvmkLMS35zYOyWiy
 tkn/mwGV51zWqi+epmEuLgzXN+LK5bApbDBDZDK3LyFmK3KnapaNiU2rcImFVAnizNds
 SYiiPcHapyYAX8ObvMZ2ViI05y3VbSbmw4F9zYEAWJjTpygKndaWhHXowpKzeznFPtxZ
 JMQSn8fanYEFPCrLlMRyVDQ3eWFkuqpgYjgYc2rgcjUE5EGYJvmYC+EZjbZDhBSM7GFJ
 lFfg==
X-Gm-Message-State: APjAAAX+lR07G5R9gGJzniLXBJOnT6eOmacBcmf7RD7r9Dy9GLe3HvBF
 HLkg0aJ4tnNvjautu58/qAF44Wdccrg=
X-Google-Smtp-Source: APXvYqxSlSluV91UM2MLhgAoZdC51nh8gVhNKIETIyBmBCB5Dhl2uNW9VeU67oPjGbpaKXqQi1v7DQ==
X-Received: by 2002:a19:ca0d:: with SMTP id a13mr20721673lfg.110.1563464271038; 
 Thu, 18 Jul 2019 08:37:51 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 c30sm4062388lfp.70.2019.07.18.08.37.49
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 18 Jul 2019 08:37:50 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
	openchrome-devel@lists.freedesktop.org
Subject: [PATCH v1 1/6] drm/via: drop use of DRM(READ|WRITE) macros
Date: Thu, 18 Jul 2019 17:37:32 +0200
Message-Id: <20190718153737.28657-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190718153737.28657-1-sam@ravnborg.org>
References: <20190718153737.28657-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CkYH+Syi4O/yhDhEc/xDog537x8dbMQ1g6nGXmqq72Q=;
 b=piCo1azNyKTRasmRFMNy+vhgzG7AikQxt4DvXgMc7DNXpTtDHdzwockXLgm85AKs59
 Ji7Tt6sqzKU/ElIKmIj0wFvR2s5HD1rS+6wB+2oCqDQl3yTCeV0cH8+P4NSLOaefs8cq
 naJw58RoxWq3Zf4+AHIRygw53zw91DwcR6IUFR7iSSjInaegR1RS0wvrUOOHrJCLf6cK
 ddHaB5CjEj5WzPJ/j8OJbLI1QGwupvTiSjH10dimcEDmX/gdY+oH5HkybrKjQABlXCT+
 HfhXDwxr4wdV9fTKOBu7BBo8JflYjg/NHEupsnLb7HtzwLCeGL/Pwyb3rJMd1HzRi5dx
 X20g==
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, Sam Ravnborg <sam@ravnborg.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Kevin Brace <kevinbrace@gmx.com>, Mike Marshall <hubcap@omnibond.com>,
 Ira Weiny <ira.weiny@intel.com>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIERSTV9SRUFELCBEUk1fV1JJVEUgbWFjcm9zIGNvbWVzIGZyb20gdGhlIGRlcHJlY2F0ZWQg
ZHJtX29zX2xpbnV4LmgKaGVhZGVyIGZpbGUuIFJlbW92ZSB0aGVpciB1c2UgdG8gcmVtb3ZlIHRo
aXMgZGVwZW5kZW5jeS4KClJlcGxhY2UgdGhlIHVzZSBvZiB0aGUgbWFjcm9zIHdpdGggb3BlbiBj
b2RlZCB2YXJpYW50cy4KClNpZ25lZC1vZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3Jn
Lm9yZz4KQ2M6IEtldmluIEJyYWNlIDxrZXZpbmJyYWNlQGdteC5jb20+CkNjOiBUaG9tYXMgSGVs
bHN0cm9tIDx0aGVsbHN0cm9tQHZtd2FyZS5jb20+CkNjOiAiR3VzdGF2byBBLiBSLiBTaWx2YSIg
PGd1c3Rhdm9AZW1iZWRkZWRvci5jb20+CkNjOiBNaWtlIE1hcnNoYWxsIDxodWJjYXBAb21uaWJv
bmQuY29tPgpDYzogSXJhIFdlaW55IDxpcmEud2VpbnlAaW50ZWwuY29tPgpDYzogRGFuaWVsIFZl
dHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KQ2M6IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxp
a292QGNvbGxhYm9yYS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3ZpYS92aWFfZHJ2LmggfCAx
NSArKysrKysrKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92aWEvdmlhX2Rydi5oIGIv
ZHJpdmVycy9ncHUvZHJtL3ZpYS92aWFfZHJ2LmgKaW5kZXggNmQxYWU4MzQ0ODRjLi5kNWEyYjFm
ZmQ4YzEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92aWEvdmlhX2Rydi5oCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS92aWEvdmlhX2Rydi5oCkBAIC0xMTUsMTAgKzExNSwxNyBAQCBlbnVtIHZp
YV9mYW1pbHkgewogLyogVklBIE1NSU8gcmVnaXN0ZXIgYWNjZXNzICovCiAjZGVmaW5lIFZJQV9C
QVNFICgoZGV2X3ByaXYtPm1taW8pKQogCi0jZGVmaW5lIFZJQV9SRUFEKHJlZykJCURSTV9SRUFE
MzIoVklBX0JBU0UsIHJlZykKLSNkZWZpbmUgVklBX1dSSVRFKHJlZywgdmFsKQlEUk1fV1JJVEUz
MihWSUFfQkFTRSwgcmVnLCB2YWwpCi0jZGVmaW5lIFZJQV9SRUFEOChyZWcpCQlEUk1fUkVBRDgo
VklBX0JBU0UsIHJlZykKLSNkZWZpbmUgVklBX1dSSVRFOChyZWcsIHZhbCkJRFJNX1dSSVRFOChW
SUFfQkFTRSwgcmVnLCB2YWwpCisjZGVmaW5lIFZJQV9SRUFEKHJlZykgXAorCXJlYWRsKCgodm9p
ZCBfX2lvbWVtICopVklBX0JBU0UtPmhhbmRsZSkgKyAocmVnKSkKKworI2RlZmluZSBWSUFfV1JJ
VEUocmVnLCB2YWwpIFwKKwl3cml0ZWwodmFsLCAoKHZvaWQgX19pb21lbSAqKVZJQV9CQVNFLT5o
YW5kbGUpICsgKHJlZykpCisKKyNkZWZpbmUgVklBX1JFQUQ4KHJlZykgXAorCXJlYWRiKCgodm9p
ZCBfX2lvbWVtICopVklBX0JBU0UtPmhhbmRsZSkgKyAocmVnKSkKKworI2RlZmluZSBWSUFfV1JJ
VEU4KHJlZywgdmFsKSBcCisJd3JpdGViKHZhbCwgKCh2b2lkIF9faW9tZW0gKilWSUFfQkFTRS0+
aGFuZGxlKSArIChyZWcpKQogCiBleHRlcm4gY29uc3Qgc3RydWN0IGRybV9pb2N0bF9kZXNjIHZp
YV9pb2N0bHNbXTsKIGV4dGVybiBpbnQgdmlhX21heF9pb2N0bDsKLS0gCjIuMjAuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
