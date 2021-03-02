Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B66013295B2
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 03:56:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41C5889D4D;
	Tue,  2 Mar 2021 02:56:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ED0C89D4D
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Mar 2021 02:56:37 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id e9so11164047plh.3
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Mar 2021 18:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qLXJJyTj2yGmwufJrM80dinHQtmlczvZXDaE20Ufino=;
 b=htFcUre7nmJ937TM3BXjnoM2/k9jS0HNIBATgAqlEiVfL9DmC9GCGhliVgBKQ0mW0q
 KSNhTijHLDFsuBUkzog/Ge0LuUq49qwdfqMo7d6xKfuFj15nX0fCIv033jIIOPT22C8c
 Adks/asM17AtDNgEx+9zIgi4GvJ2ZG0J7QmxiR5LxhzKJOhYh67DgOd6lgYFE93Rej0q
 MOGxYRsCUSV2r69BKt4OInL1gGNV5935enQ85wzw/1gYbK1Kb7synjizSroNH31eHCMb
 ceowi6mkHPHx6dZwMJmEddKkmEMCv1Q57MPtKJxWjxpx7OwiHqVcr3ogjnkm7gHAOM68
 TM4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qLXJJyTj2yGmwufJrM80dinHQtmlczvZXDaE20Ufino=;
 b=uhBs7ZyX8QHNdXKYv7j5TM9JTii1l+Of5IG0oaAGgVChSEMW7We0XQiKW75+Afy83S
 rimLWkzrUTonZ3GFG63dQHFXYCh1bZ2c7shU2s9aITF5oY6QjlrIFfvMmBrhaU7GQ2ia
 ZAPhkxZUHgYwuaHLTgOjTGU8KjGKJ9JP7/Bh9EJ2V+3vaHkbGhQ8YMbmDLc3cHUGZAsJ
 MjxsPiILLqp2ddv9ei7I9KViLxkmUFtjuNexu2QiXs/ylcPVaHkd3XElGghcOsDdzvMH
 t9qlkhTIhrA3XHNBLriWkwDdzgBs3YrZWlKEUHic8Hxs1eS9Vj0AsBDVg7uOd6T2uEP7
 6xmw==
X-Gm-Message-State: AOAM533VITz6rYh60Dw+WlaOI0OcPg6pR3JlDqcRPIXhRmVpFiGu2Quq
 A8UkMys7JXtpeG9W+2AageNo/g==
X-Google-Smtp-Source: ABdhPJxBHNAF2OwS2gBChuYXTnwdjSw4f0lQ7k1NHAI6CiKbCqzF3nuyVHTR6ygWHmzZuPm/qFfgtQ==
X-Received: by 2002:a17:902:e20c:b029:e4:7a08:8452 with SMTP id
 u12-20020a170902e20cb02900e47a088452mr1563793plb.74.1614653796901; 
 Mon, 01 Mar 2021 18:56:36 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 r16sm18928400pfh.168.2021.03.01.18.56.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 18:56:36 -0800 (PST)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [RESEND][PATCH v2 2/2] dma-buf: heaps: Fix the name used when
 exporting dmabufs to be the actual heap name
Date: Tue,  2 Mar 2021 02:56:29 +0000
Message-Id: <20210302025629.2558215-2-john.stultz@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302025629.2558215-1-john.stultz@linaro.org>
References: <20210302025629.2558215-1-john.stultz@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, Sandeep Patil <sspatil@google.com>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Ezequiel Garcia <ezequiel@collabora.com>, Robin Murphy <robin.murphy@arm.com>,
 James Jones <jajones@nvidia.com>, Liam Mark <lmark@codeaurora.org>,
 Laura Abbott <labbott@kernel.org>, Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?q?=C3=98rjan=20Eide?= <orjan.eide@arm.com>,
 linux-media@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 Daniel Mentz <danielmentz@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QnkgZGVmYXVsdCBkbWFfYnVmX2V4cG9ydCgpIHNldHMgdGhlIGV4cG9ydGVyIG5hbWUgdG8gYmUK
S0JVSUxEX01PRE5BTUUuIFVuZm9ydHVuYXRlbHkgdGhpcyBtYXkgbm90IGJlIGlkZW50aWNhbCB0
byB0aGUKc3RyaW5nIHVzZWQgYXMgdGhlIGhlYXAgbmFtZSAoaWU6ICJzeXN0ZW0iIHZzICJzeXN0
ZW1faGVhcCIpLgoKVGhpcyBjYW4gY2F1c2Ugc29tZSBtaW5vciBjb25mdXNpb24gd2l0aCB0b29s
aW5nLCBhbmQgdGhlcmUgaXMKdGhlIGZ1dHVyZSBwb3RlbnRpYWwgd2hlcmUgbXVsdGlwbGUgaGVh
cCB0eXBlcyBtYXkgYmUgZXhwb3J0ZWQKYnkgdGhlIHNhbWUgbW9kdWxlIChidXQgd291bGQgYWxs
IGhhdmUgdGhlIHNhbWUgbmFtZSkuCgpTbyB0byBhdm9pZCBhbGwgdGhpcywgc2V0IHRoZSBleHBv
cnRlciBleHBfbmFtZSB0byB0aGUgaGVhcCBuYW1lLgoKQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmll
bEBmZndsbC5jaD4KQ2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+CkNj
OiBMaWFtIE1hcmsgPGxtYXJrQGNvZGVhdXJvcmEub3JnPgpDYzogQ2hyaXMgR29sZHN3b3J0aHkg
PGNnb2xkc3dvQGNvZGVhdXJvcmEub3JnPgpDYzogTGF1cmEgQWJib3R0IDxsYWJib3R0QGtlcm5l
bC5vcmc+CkNjOiBCcmlhbiBTdGFya2V5IDxCcmlhbi5TdGFya2V5QGFybS5jb20+CkNjOiBIcmlk
eWEgVmFsc2FyYWp1IDxocmlkeWFAZ29vZ2xlLmNvbT4KQ2M6IFN1cmVuIEJhZ2hkYXNhcnlhbiA8
c3VyZW5iQGdvb2dsZS5jb20+CkNjOiBTYW5kZWVwIFBhdGlsIDxzc3BhdGlsQGdvb2dsZS5jb20+
CkNjOiBEYW5pZWwgTWVudHogPGRhbmllbG1lbnR6QGdvb2dsZS5jb20+CkNjOiDDmHJqYW4gRWlk
ZSA8b3JqYW4uZWlkZUBhcm0uY29tPgpDYzogUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJt
LmNvbT4KQ2M6IEV6ZXF1aWVsIEdhcmNpYSA8ZXplcXVpZWxAY29sbGFib3JhLmNvbT4KQ2M6IFNp
bW9uIFNlciA8Y29udGFjdEBlbWVyc2lvbi5mcj4KQ2M6IEphbWVzIEpvbmVzIDxqYWpvbmVzQG52
aWRpYS5jb20+CkNjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogSm9obiBTdHVsdHogPGpvaG4uc3R1
bHR6QGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9kbWEtYnVmL2hlYXBzL2NtYV9oZWFwLmMgICAg
fCAxICsKIGRyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9zeXN0ZW1faGVhcC5jIHwgMSArCiAyIGZpbGVz
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9o
ZWFwcy9jbWFfaGVhcC5jIGIvZHJpdmVycy9kbWEtYnVmL2hlYXBzL2NtYV9oZWFwLmMKaW5kZXgg
NWQ2NGVjY2QyMWQ2Li4wYzA1Yjc5ODcwZjkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9o
ZWFwcy9jbWFfaGVhcC5jCisrKyBiL2RyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9jbWFfaGVhcC5jCkBA
IC0zMzksNiArMzM5LDcgQEAgc3RhdGljIHN0cnVjdCBkbWFfYnVmICpjbWFfaGVhcF9hbGxvY2F0
ZShzdHJ1Y3QgZG1hX2hlYXAgKmhlYXAsCiAJYnVmZmVyLT5wYWdlY291bnQgPSBwYWdlY291bnQ7
CiAKIAkvKiBjcmVhdGUgdGhlIGRtYWJ1ZiAqLworCWV4cF9pbmZvLmV4cF9uYW1lID0gZG1hX2hl
YXBfZ2V0X25hbWUoaGVhcCk7CiAJZXhwX2luZm8ub3BzID0gJmNtYV9oZWFwX2J1Zl9vcHM7CiAJ
ZXhwX2luZm8uc2l6ZSA9IGJ1ZmZlci0+bGVuOwogCWV4cF9pbmZvLmZsYWdzID0gZmRfZmxhZ3M7
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvaGVhcHMvc3lzdGVtX2hlYXAuYyBiL2RyaXZl
cnMvZG1hLWJ1Zi9oZWFwcy9zeXN0ZW1faGVhcC5jCmluZGV4IDI5ZTQ5YWMxNzI1MS4uMjNhN2U3
NGVmOTY2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2RtYS1idWYvaGVhcHMvc3lzdGVtX2hlYXAuYwor
KysgYi9kcml2ZXJzL2RtYS1idWYvaGVhcHMvc3lzdGVtX2hlYXAuYwpAQCAtMzkwLDYgKzM5MCw3
IEBAIHN0YXRpYyBzdHJ1Y3QgZG1hX2J1ZiAqc3lzdGVtX2hlYXBfYWxsb2NhdGUoc3RydWN0IGRt
YV9oZWFwICpoZWFwLAogCX0KIAogCS8qIGNyZWF0ZSB0aGUgZG1hYnVmICovCisJZXhwX2luZm8u
ZXhwX25hbWUgPSBkbWFfaGVhcF9nZXRfbmFtZShoZWFwKTsKIAlleHBfaW5mby5vcHMgPSAmc3lz
dGVtX2hlYXBfYnVmX29wczsKIAlleHBfaW5mby5zaXplID0gYnVmZmVyLT5sZW47CiAJZXhwX2lu
Zm8uZmxhZ3MgPSBmZF9mbGFnczsKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
