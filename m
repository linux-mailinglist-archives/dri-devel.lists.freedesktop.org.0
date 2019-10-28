Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50145E6E0F
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 09:24:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3D9B6E478;
	Mon, 28 Oct 2019 08:23:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C0996E0FB
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 07:20:59 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id w3so6294394pgt.5
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 00:20:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2B2ccVWNv2j7+/d4B7YKqZ8gCfpCMSxayY7L9g0kOPM=;
 b=pZJWxoi7G/1NAJ0Iq2iD6iyEREJ8Mp30860eevGOcpS8QM+gk4bICHEGGKrU0nYldu
 B4LJR0z6q5HOMMa9PC14X8cGi3Nu7BM16gB6zcot8fTtz8pWVMDjMRmrLzb+UAmqKLUs
 FxPrxRd0prMlnSpEhl3YoPEoDwe1RXEL2GwacUMp3Ok0Can2KNz+bM+APBwKq4N+BOsJ
 RQVrI+MlMNZ0athChoM+OS+kRdXP/QjdQb/8/eeBYHHu5iCSU4GOL8ipR5Fp09IIye2A
 c27t5EZgKdP5FhoWgL1ptgiQqMnUIfdiwRdKHJ38EWyXDCYjUMv+d6J0fRpV5SoKJ9Eh
 Uzvg==
X-Gm-Message-State: APjAAAUhWRexS67wfLtGVHQn91opVeyugkW5//Z/w5mZ7eWGufprBEev
 5ZVgsgz4f4Ku7w8aqIMkt6lcEw==
X-Google-Smtp-Source: APXvYqxOOfKgzUuiw+4gq3DdkbHGmJjTwiVoT2so9rPzmlcr7wli/aEgCmP0/huEUSTQC3mCW+zoZA==
X-Received: by 2002:a62:30c5:: with SMTP id
 w188mr19170809pfw.105.1572247259280; 
 Mon, 28 Oct 2019 00:20:59 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:79b4:bd83:e4a5:a720])
 by smtp.gmail.com with ESMTPSA id l11sm11260152pgf.73.2019.10.28.00.20.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2019 00:20:58 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v9 2/6] ASoC: rockchip-max98090: Support usage with and
 without HDMI
Date: Mon, 28 Oct 2019 15:19:26 +0800
Message-Id: <20191028071930.145899-3-cychiang@chromium.org>
X-Mailer: git-send-email 2.24.0.rc0.303.g954a862665-goog
In-Reply-To: <20191028071930.145899-1-cychiang@chromium.org>
References: <20191028071930.145899-1-cychiang@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 28 Oct 2019 08:23:53 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2B2ccVWNv2j7+/d4B7YKqZ8gCfpCMSxayY7L9g0kOPM=;
 b=HfeGmQVGeCotDSEIC2+EPqxjUZiFb6AMi1k5sTZJi/m46coFpAY9tdk6wLR6YsijdN
 bAHb+Lmgn+Np7i5yEzDTx8O5UYxOREy51lzOXKcD2pq7DwjUM+wo0GVeTj+bGIJC8v4n
 3WJi68+vvMUxY7dKw539iuLRzhUbJBLmZPIAU=
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
Cc: Mark Rutland <mark.rutland@arm.com>, alsa-devel@alsa-project.org,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Takashi Iwai <tiwai@suse.com>,
 linux-rockchip@lists.infradead.org, dgreid@chromium.org,
 Cheng-Yi Chiang <cychiang@chromium.org>, devicetree@vger.kernel.org,
 tzungbi@chromium.org, Jonas Karlman <jonas@kwiboo.se>,
 Russell King <rmk+kernel@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, dianders@chromium.org,
 Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIG9uZSBvcHRpb25hbCBwcm9wZXJ0eSAicm9ja2NoaXAsaGRtaS1jb2RlYyIgdG8gbGV0IHVz
ZXIgc3BlY2lmeSBIRE1JCmRldmljZSBub2RlIGluIERUUyBzbyBtYWNoaW5lIGRyaXZlciBjYW4g
ZmluZCBoZG1pLWNvZGVjIGRldmljZSBub2RlIGZvcgpIRE1JIGNvZGVjIERBSS4KClVzZSB0aGUg
cHJlc2VuY2Ugb2Ygcm9ja2NoaXAsYXVkaW8tY29kZWMgYW5kIHJvY2tjaGlwLGhkbWktY29kZWMg
dG8Kc3BlY2lmeSB0aGUgdXNlIGNhc2UuCgpVc2UgbWF4OTgwOTAgb25seSA6IHNwZWNpZnkgcm9j
a2NoaXAsYXVkaW8tY29kZWMuClVzZSBIRE1JIG9ubHk6IHNwZWNpZnkgcm9ja2NoaXAsaGRtaS1j
b2RlYy4KVXNlIGJvdGggbWF4OTgwOTAgYW5kIEhETUk6IHNwZWNpZnkgcm9ja2NoaXAsYXVkaW8t
Y29kZWMgYW5kCnJvY2tjaGlwLGhkbWktY29kZWMuCgpNb3ZlIHRoZXNlIHByb3BlcnRpZXMgdG8g
b3B0aW9uYWwgYmVjYXVzZSB0aGV5IGFyZSBub3QgbmVlZGVkIGZvcgpIRE1JLW9ubHkgdXNlIGNh
c2UuCiJyb2NrY2hpcCxhdWRpby1jb2RlYyI6IFRoZSBwaGFuZGxlIG9mIHRoZSBNQVg5ODA5MCBh
dWRpbyBjb2RlYwoicm9ja2NoaXAsaGVhZHNldC1jb2RlYyI6IFRoZSBwaGFuZGxlIG9mIEV4dCBj
aGlwIGZvciBqYWNrIGRldGVjdGlvbgoKU2lnbmVkLW9mZi1ieTogQ2hlbmctWWkgQ2hpYW5nIDxj
eWNoaWFuZ0BjaHJvbWl1bS5vcmc+Ci0tLQogLi4uL2JpbmRpbmdzL3NvdW5kL3JvY2tjaGlwLW1h
eDk4MDkwLnR4dCAgICAgIHwgMjcgKysrKysrKysrKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQs
IDI1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL3JvY2tjaGlwLW1heDk4MDkwLnR4dCBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9yb2NrY2hpcC1tYXg5ODA5MC50
eHQKaW5kZXggYTgwNWFhOTlhZDc1Li5lOWM1OGIyMDQzOTkgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9yb2NrY2hpcC1tYXg5ODA5MC50eHQKKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL3JvY2tjaGlwLW1heDk4
MDkwLnR4dApAQCAtNSwxNSArNSwzOCBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzOgogLSByb2NrY2hp
cCxtb2RlbDogVGhlIHVzZXItdmlzaWJsZSBuYW1lIG9mIHRoaXMgc291bmQgY29tcGxleAogLSBy
b2NrY2hpcCxpMnMtY29udHJvbGxlcjogVGhlIHBoYW5kbGUgb2YgdGhlIFJvY2tjaGlwIEkyUyBj
b250cm9sbGVyIHRoYXQncwogICBjb25uZWN0ZWQgdG8gdGhlIENPREVDCi0tIHJvY2tjaGlwLGF1
ZGlvLWNvZGVjOiBUaGUgcGhhbmRsZSBvZiB0aGUgTUFYOTgwOTAgYXVkaW8gY29kZWMKLS0gcm9j
a2NoaXAsaGVhZHNldC1jb2RlYzogVGhlIHBoYW5kbGUgb2YgRXh0IGNoaXAgZm9yIGphY2sgZGV0
ZWN0aW9uCisKK09wdGlvbmFsIHByb3BlcnRpZXM6CistIHJvY2tjaGlwLGF1ZGlvLWNvZGVjOiBU
aGUgcGhhbmRsZSBvZiB0aGUgTUFYOTgwOTAgYXVkaW8gY29kZWMuCistIHJvY2tjaGlwLGhlYWRz
ZXQtY29kZWM6IFRoZSBwaGFuZGxlIG9mIEV4dCBjaGlwIGZvciBqYWNrIGRldGVjdGlvbi4gVGhp
cyBpcworICAgICAgICAgICAgICAgICAgICAgICAgICByZXF1aXJlZCBpZiB0aGVyZSBpcyByb2Nr
Y2hpcCxhdWRpby1jb2RlYy4KKy0gcm9ja2NoaXAsaGRtaS1jb2RlYzogVGhlIHBoYW5kbGUgb2Yg
SERNSSBkZXZpY2UgZm9yIEhETUkgY29kZWMuCiAKIEV4YW1wbGU6CiAKKy8qIEZvciBtYXg5ODA5
MC1vbmx5IGJvYXJkLiAqLworc291bmQgeworCWNvbXBhdGlibGUgPSAicm9ja2NoaXAscm9ja2No
aXAtYXVkaW8tbWF4OTgwOTAiOworCXJvY2tjaGlwLG1vZGVsID0gIlJPQ0tDSElQLUkyUyI7CisJ
cm9ja2NoaXAsaTJzLWNvbnRyb2xsZXIgPSA8Jmkycz47CisJcm9ja2NoaXAsYXVkaW8tY29kZWMg
PSA8Jm1heDk4MDkwPjsKKwlyb2NrY2hpcCxoZWFkc2V0LWNvZGVjID0gPCZoZWFkc2V0Y29kZWM+
OworfTsKKworLyogRm9yIEhETUktb25seSBib2FyZC4gKi8KK3NvdW5kIHsKKwljb21wYXRpYmxl
ID0gInJvY2tjaGlwLHJvY2tjaGlwLWF1ZGlvLW1heDk4MDkwIjsKKwlyb2NrY2hpcCxtb2RlbCA9
ICJST0NLQ0hJUC1JMlMiOworCXJvY2tjaGlwLGkycy1jb250cm9sbGVyID0gPCZpMnM+OworCXJv
Y2tjaGlwLGhkbWktY29kZWMgPSA8JmhkbWk+OworfTsKKworLyogRm9yIG1heDk4MDkwIHBsdXMg
SERNSSBib2FyZC4gKi8KIHNvdW5kIHsKIAljb21wYXRpYmxlID0gInJvY2tjaGlwLHJvY2tjaGlw
LWF1ZGlvLW1heDk4MDkwIjsKIAlyb2NrY2hpcCxtb2RlbCA9ICJST0NLQ0hJUC1JMlMiOwogCXJv
Y2tjaGlwLGkycy1jb250cm9sbGVyID0gPCZpMnM+OwogCXJvY2tjaGlwLGF1ZGlvLWNvZGVjID0g
PCZtYXg5ODA5MD47CiAJcm9ja2NoaXAsaGVhZHNldC1jb2RlYyA9IDwmaGVhZHNldGNvZGVjPjsK
Kwlyb2NrY2hpcCxoZG1pLWNvZGVjID0gPCZoZG1pPjsKIH07Ci0tIAoyLjI0LjAucmMwLjMwMy5n
OTU0YTg2MjY2NS1nb29nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
