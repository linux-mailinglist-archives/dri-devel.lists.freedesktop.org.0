Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE971B672E
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 00:52:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B84CA6EA5D;
	Thu, 23 Apr 2020 22:52:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FB64894C0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 14:26:34 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id y25so3023067pfn.5
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 07:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aneiRCA50vAzubtGKmjmJT4bwgD2W0Rx0hNrzKdvMIM=;
 b=EE8ROhQrsKp+SKKeVgB/oHc2SdkZpZcZfqh9PqeRwgXpzp4CEgiXyQWVYLo1Hany6G
 zhLRXT2RT3nDcfC+Q7xFV5TaEAhThEOILMB+GC7NoOpOd16X1J9vkMtHJdyJjNJCbegA
 XjfCllKqA1U0XCdDPvSXrKpZPE5RDXkz3wSk2uuhOk2iX7V/DF/f6qY8EB1OJwAsPtfQ
 VYrCc7D3ZiyUSXPf15Ed6TtttZkeh5fKR99xvHDGd5Ii9WUYk/S1gRPH8LhlA3IrJ006
 VJXSnUFUj+I4EHCwXWGbDsxmR7qtBIUJnLyx4uOyJTDocmmeCkOnkqgzQH5HahsEeJb5
 e+Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aneiRCA50vAzubtGKmjmJT4bwgD2W0Rx0hNrzKdvMIM=;
 b=p8NtnMnMD6N9wNMClwToamz1a44O6LIC20fk6nOaEtXHoZ7dp0JMrJpB0S75D85K3q
 IBXOqi5MmtsRU1308GQWltK+pPVHdhyIz7Hi7kacD2Adf7YhMdF2TQfwfZdzauobRokV
 pABD9DpIERt5fsCn00ynZSdAV65Cl0rwCJ/hFY2ELRcSgjrvmdm9/E0nKLQqO0erKb+g
 Tc0n+5psl98PD+tt6/0djXDEKANwKF93AaRuFsh/wHfY3jv4FiOUmTU9zQvur92NC4lm
 oMcq4QByhdmJZkjPtGZy+CV2ypG0e5LoicueD5xyEQPPsi3YDld0c28olS/N4Q5r713+
 D+tQ==
X-Gm-Message-State: AGi0PuaMEsmkz6TnYLi0gIKsgEYmSIzLHx2glOBFatHHVknXyM8WFzzv
 GB27VrW9+UAGpqKCvAyKJI4KggE1NLk=
X-Google-Smtp-Source: APiQypK/lVoX0fg8UENl82mCz0W+dZgsUBwikvkecQKoTS04dwfuTust7mIKAAoyNfsXzkBnUI9Rsw==
X-Received: by 2002:a63:48a:: with SMTP id 132mr4255931pge.380.1587651993798; 
 Thu, 23 Apr 2020 07:26:33 -0700 (PDT)
Received: from localhost (176.122.158.71.16clouds.com. [176.122.158.71])
 by smtp.gmail.com with ESMTPSA id a19sm2846848pfd.91.2020.04.23.07.26.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 23 Apr 2020 07:26:33 -0700 (PDT)
From: Dejin Zheng <zhengdejin5@gmail.com>
To: gregkh@linuxfoundation.org, tglx@linutronix.de, FlorianSchandinat@gmx.de,
 b.zolnierkie@samsung.com, ralf@linux-mips.org, tsbogend@alpha.franken.de,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH v2] console: console: Complete exception handling in
 newport_probe()
Date: Thu, 23 Apr 2020 22:26:27 +0800
Message-Id: <20200423142627.1820-1-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 23 Apr 2020 22:50:35 +0000
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
Cc: Dejin Zheng <zhengdejin5@gmail.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QSBjYWxsIG9mIHRoZSBmdW5jdGlvbiDCocKwZG9fdGFrZV9vdmVyX2NvbnNvbGXCocKxIGNhbiBm
YWlsIGhlcmUuClRoZSBjb3JyZXNwb25kaW5nIHN5c3RlbSByZXNvdXJjZXMgd2VyZSBub3QgcmVs
ZWFzZWQgdGhlbi4KVGh1cyBhZGQgYSBjYWxsIG9mIHRoZSBmdW5jdGlvbiDCocKwaW91bm1hcMKh
wrEgdG9nZXRoZXIgd2l0aCB0aGUgY2hlY2sKb2YgYSBmYWlsdXJlIHByZWRpY2F0ZS4KCkZpeGVz
OiBlODRkZTBjNjE5MDUwMyAoIk1JUFM6IEdJTyBidXMgc3VwcG9ydCBmb3IgU0dJIElQMjIvMjgi
KQpDQzogQW5keSBTaGV2Y2hlbmtvIDxhbmR5LnNoZXZjaGVua29AZ21haWwuY29tPgpTaWduZWQt
b2ZmLWJ5OiBEZWppbiBaaGVuZyA8emhlbmdkZWppbjVAZ21haWwuY29tPgotLS0KdjEgLT4gdjI6
CgktIG1vZGlmeSB0aGUgY29tbWl0IGNvbW1lbnRzIGJ5IE1hcmt1cydzdWdnZXN0aW9uLgoKIGRy
aXZlcnMvdmlkZW8vY29uc29sZS9uZXdwb3J0X2Nvbi5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2NvbnNvbGUvbmV3
cG9ydF9jb24uYyBiL2RyaXZlcnMvdmlkZW8vY29uc29sZS9uZXdwb3J0X2Nvbi5jCmluZGV4IDAw
ZGRkZjZlMDhiMC4uNmJmYzhlM2ZmZDRhIDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2NvbnNv
bGUvbmV3cG9ydF9jb24uYworKysgYi9kcml2ZXJzL3ZpZGVvL2NvbnNvbGUvbmV3cG9ydF9jb24u
YwpAQCAtNzIwLDYgKzcyMCw5IEBAIHN0YXRpYyBpbnQgbmV3cG9ydF9wcm9iZShzdHJ1Y3QgZ2lv
X2RldmljZSAqZGV2LAogCWNvbnNvbGVfbG9jaygpOwogCWVyciA9IGRvX3Rha2Vfb3Zlcl9jb25z
b2xlKCZuZXdwb3J0X2NvbiwgMCwgTUFYX05SX0NPTlNPTEVTIC0gMSwgMSk7CiAJY29uc29sZV91
bmxvY2soKTsKKworCWlmIChlcnIpCisJCWlvdW5tYXAoKHZvaWQgKilucHJlZ3MpOwogCXJldHVy
biBlcnI7CiB9CiAKLS0gCjIuMjUuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
