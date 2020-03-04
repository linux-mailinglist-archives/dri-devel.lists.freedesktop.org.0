Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C73178E9B
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 11:41:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72CBB6E25C;
	Wed,  4 Mar 2020 10:41:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0D9D6E25C
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2020 10:41:08 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id n7so1728984wrt.11
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2020 02:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2ZYaVAxRnaObr28BZLmmHgNx+5g0OhRS2ehQYDVzjXU=;
 b=QstsY6ncnufuZrETjDUNyPb+E0wCE7nPglDBEz1h4hDqKKBYSN0Omz187XucsKMQbL
 01m4i6n+B0zVhRg1d37E89qC92HcBhsaTLziRCSe7L2gQb1we30DBKZ9+cHKN3iM7dxp
 kIgDy/FF4fM5cUfwfmkY94oFmnXIKaSH05RZqXeDutS5aFdqasW7OxamJe3Drnuuwe4f
 /enVSrulADQSWwGzJwkZdkxx7/B8GdPAZhIccEbKlxjTPd3EPrhan1WZmg06ZZ3RImXj
 IEIU6twNIO48k2iKCVUt+4J61AbHYJmlaEqeBcmb4jnr9yzYZInJ5uLzOgPyIHGw3haG
 M9lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2ZYaVAxRnaObr28BZLmmHgNx+5g0OhRS2ehQYDVzjXU=;
 b=uYxG6zDR7d5Bc9fkcZ7562IEr4dWfJQ9tWz4OIP/lX0vxmRe/6Telyn5o0fITPqFBU
 1ZVTUhzX8RVIhuf3ygYfLQ+BE++t6IklAT1W9nBUycLT+d6lYLbKAN6ju3/qTqjVzCfs
 GvWtIXPz0uj42NLFzNurFDBR09vF3UbOIYNpe7SYxCdkgqT0ihgXQnpWrO+8Mm2YrY6F
 yv7dhiH17rJlTFp8U8mSefCxIvSkpR6uVPaEe8KhheW27Hz5h4dQiBNYwMeGAiBWCisa
 Qyh3fZMqJenRzYuFTkRr52q98FkxWj4MsSW5vziOS3eH383C0Rl93ifd0wZhabF0jiUg
 RMNg==
X-Gm-Message-State: ANhLgQ0+O1n4oppYF3jZmjI5FFueL3AVgEcSMo8VMAN+47MCsTJjHFf4
 a5C4+f2FPnIZczhEf8Sha5fRog==
X-Google-Smtp-Source: ADFU+vtUN4p11cLYhabM5zjrKYxA3Sbq1hcwONdJ7Xn7ZgQfAJmrBHXJV1buXqvWexI/+vikKZuKOw==
X-Received: by 2002:a05:6000:12cc:: with SMTP id
 l12mr3490390wrx.304.1583318467351; 
 Wed, 04 Mar 2020 02:41:07 -0800 (PST)
Received: from bender.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id c14sm24006398wro.36.2020.03.04.02.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2020 02:41:06 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [PATCH v5 08/11] drm/meson: dw-hdmi: stop enforcing input_bus_format
Date: Wed,  4 Mar 2020 11:40:49 +0100
Message-Id: <20200304104052.17196-9-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200304104052.17196-1-narmstrong@baylibre.com>
References: <20200304104052.17196-1-narmstrong@baylibre.com>
MIME-Version: 1.0
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VG8gYWxsb3cgdXNpbmcgZm9ybWF0cyBmcm9tIG5lZ290aWF0aW9uLCBzdG9wIGVuZm9yY2luZyBp
bnB1dF9idXNfZm9ybWF0CmluIHRoZSBwcml2YXRlIGR3LXBsYXQtZGF0YSBzdHJ1Y3QuCgpTaWdu
ZWQtb2ZmLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+ClJldmll
d2VkLWJ5OiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgpS
ZXZpZXdlZC1ieTogSmVybmVqIMWga3JhYmVjIDxqZXJuZWouc2tyYWJlY0BzaW9sLm5ldD4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHdfaGRtaS5jIHwgMSAtCiAxIGZpbGUgY2hh
bmdlZCwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9t
ZXNvbl9kd19oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHdfaGRtaS5jCmlu
ZGV4IDhmNTFkMDMyMjYyYy4uNzJjMTE4MTQyZWFmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vbWVzb24vbWVzb25fZHdfaGRtaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNv
bl9kd19oZG1pLmMKQEAgLTEwMTQsNyArMTAxNCw2IEBAIHN0YXRpYyBpbnQgbWVzb25fZHdfaGRt
aV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLAogCWR3X3Bs
YXRfZGF0YS0+cGh5X29wcyA9ICZtZXNvbl9kd19oZG1pX3BoeV9vcHM7CiAJZHdfcGxhdF9kYXRh
LT5waHlfbmFtZSA9ICJtZXNvbl9kd19oZG1pX3BoeSI7CiAJZHdfcGxhdF9kYXRhLT5waHlfZGF0
YSA9IG1lc29uX2R3X2hkbWk7Ci0JZHdfcGxhdF9kYXRhLT5pbnB1dF9idXNfZm9ybWF0ID0gTUVE
SUFfQlVTX0ZNVF9ZVVY4XzFYMjQ7CiAJZHdfcGxhdF9kYXRhLT5pbnB1dF9idXNfZW5jb2Rpbmcg
PSBWNEwyX1lDQkNSX0VOQ183MDk7CiAKIAlpZiAoZHdfaGRtaV9pc19jb21wYXRpYmxlKG1lc29u
X2R3X2hkbWksICJhbWxvZ2ljLG1lc29uLWd4bC1kdy1oZG1pIikgfHwKLS0gCjIuMjIuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
