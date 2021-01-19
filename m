Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE062FC172
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 21:45:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7120689C54;
	Tue, 19 Jan 2021 20:45:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B29C89B20
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 20:45:14 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id z21so13721995pgj.4
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 12:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+HPHLTIbnqvyYqZakEN0yW6023R2vX5SvJvHEGRsu88=;
 b=rVY83dpi8ReoTmjM5P+oExiEZYsinMGkbYee1lkK/ULznES2ZNsQayfBScXWTZxwHT
 xzR9TWfOeB0CMtADGKZkF8TcwHODZPc1u4AMryo79Zq9NNv2fP2u7rpmstz007F5Nwzb
 fYc/mdbBQq3n41ctal8AiQZluORE84aHZh48bd34Zb95cR6VzRRKiIQtqtWHSWK5Ql/Z
 37MtMXfQhlWisjAseq7aB5u02jTDZwCwRQhmEw5cye33lLvuVq6TSjWkKCFJCnRio0sf
 Jg4mseBZ0ILUNtu46AlrTKRbSYK79YX03tEGKvAoDHj4I2D3x6wz8PcifiCFUrwR00mS
 hKXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+HPHLTIbnqvyYqZakEN0yW6023R2vX5SvJvHEGRsu88=;
 b=tK7hFkt0i2wFbBiYkY8YRJNXaMZTw7e5ltRtCCbQbyWGo7VcTsFYFFXb6TiqqhW8Ho
 m1/eE79xkSY4lNwwNjxnJ1HY3WuOUyf0ULc4Wjv5y6QNL5r2Dr+Sxb6cC1CfJnlCAZq9
 ibrmAPESY3LF7Wpsj7Jn4e+/0fXj2uhJ4fg9f0wDNmLR24KS6Xk9czu3gAebPiAhctD5
 HKC8uu73mrABMY8oekjpyAiLLQeE3sIXsNlysY1YQh04dxD2qfjvYiWJOg9VCxrjZt/W
 ruU4uhNT9BaIvv+TNrnzSmCwiQonAVtaIUIYUrmZUxk/AAfgP5eXKxkmgZN3I1EZSkjC
 PxPQ==
X-Gm-Message-State: AOAM532lKucPTilfE5ZqwKofysWqBKqBchN6R7Q3pW55mg1P1Xc8uZhK
 Ie2zSNpRvhIRcYsYAQvM0XwNww==
X-Google-Smtp-Source: ABdhPJx7XqKFUvEfxsZUM/yPecJslI2EJghoNxHC6weKaxS/Wdl7E5UFXQpws/ka9g4TjNc2jaAWIA==
X-Received: by 2002:a62:5b07:0:b029:1ae:177d:69e1 with SMTP id
 p7-20020a625b070000b02901ae177d69e1mr5644437pfb.25.1611089113811; 
 Tue, 19 Jan 2021 12:45:13 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 md7sm4129838pjb.52.2021.01.19.12.45.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 12:45:12 -0800 (PST)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [RESEND][PATCH 2/3] dma-buf: heaps: Add a WARN_ON should the vmap_cnt
 go negative
Date: Tue, 19 Jan 2021 20:45:07 +0000
Message-Id: <20210119204508.9256-2-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210119204508.9256-1-john.stultz@linaro.org>
References: <20210119204508.9256-1-john.stultz@linaro.org>
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
Cc: Sandeep Patil <sspatil@google.com>, dri-devel@lists.freedesktop.org,
 Ezequiel Garcia <ezequiel@collabora.com>, Robin Murphy <robin.murphy@arm.com>,
 James Jones <jajones@nvidia.com>, Liam Mark <lmark@codeaurora.org>,
 Laura Abbott <labbott@kernel.org>, Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?q?=C3=98rjan=20Eide?= <orjan.eide@arm.com>,
 linux-media@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 Daniel Mentz <danielmentz@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2Ugc2hvdWxkbid0IHZ1bm1hcCBtb3JlIHRoZW4gd2Ugdm1hcCwgYnV0IGlmIHdlIGRvLCBtYWtl
CnN1cmUgd2UgY29tcGxhaW4gbG91ZGx5LgoKQ2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2Fs
QGxpbmFyby5vcmc+CkNjOiBMaWFtIE1hcmsgPGxtYXJrQGNvZGVhdXJvcmEub3JnPgpDYzogTGF1
cmEgQWJib3R0IDxsYWJib3R0QGtlcm5lbC5vcmc+CkNjOiBCcmlhbiBTdGFya2V5IDxCcmlhbi5T
dGFya2V5QGFybS5jb20+CkNjOiBIcmlkeWEgVmFsc2FyYWp1IDxocmlkeWFAZ29vZ2xlLmNvbT4K
Q2M6IFN1cmVuIEJhZ2hkYXNhcnlhbiA8c3VyZW5iQGdvb2dsZS5jb20+CkNjOiBTYW5kZWVwIFBh
dGlsIDxzc3BhdGlsQGdvb2dsZS5jb20+CkNjOiBEYW5pZWwgTWVudHogPGRhbmllbG1lbnR6QGdv
b2dsZS5jb20+CkNjOiBDaHJpcyBHb2xkc3dvcnRoeSA8Y2dvbGRzd29AY29kZWF1cm9yYS5vcmc+
CkNjOiDDmHJqYW4gRWlkZSA8b3JqYW4uZWlkZUBhcm0uY29tPgpDYzogUm9iaW4gTXVycGh5IDxy
b2Jpbi5tdXJwaHlAYXJtLmNvbT4KQ2M6IEV6ZXF1aWVsIEdhcmNpYSA8ZXplcXVpZWxAY29sbGFi
b3JhLmNvbT4KQ2M6IFNpbW9uIFNlciA8Y29udGFjdEBlbWVyc2lvbi5mcj4KQ2M6IEphbWVzIEpv
bmVzIDxqYWpvbmVzQG52aWRpYS5jb20+CkNjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcK
Q2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU3VnZ2VzdGVkLWJ5OiBTdXJlbiBC
YWdoZGFzYXJ5YW4gPHN1cmVuYkBnb29nbGUuY29tPgpTaWduZWQtb2ZmLWJ5OiBKb2huIFN0dWx0
eiA8am9obi5zdHVsdHpAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2RtYS1idWYvaGVhcHMvY21h
X2hlYXAuYyAgICB8IDEgKwogZHJpdmVycy9kbWEtYnVmL2hlYXBzL3N5c3RlbV9oZWFwLmMgfCAx
ICsKIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9kbWEtYnVmL2hlYXBzL2NtYV9oZWFwLmMgYi9kcml2ZXJzL2RtYS1idWYvaGVhcHMvY21hX2hl
YXAuYwppbmRleCAzNjRmYzJmM2U0OTkuLjBjNzZjYmMzZmIxMSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9kbWEtYnVmL2hlYXBzL2NtYV9oZWFwLmMKKysrIGIvZHJpdmVycy9kbWEtYnVmL2hlYXBzL2Nt
YV9oZWFwLmMKQEAgLTIzMiw2ICsyMzIsNyBAQCBzdGF0aWMgdm9pZCBjbWFfaGVhcF92dW5tYXAo
c3RydWN0IGRtYV9idWYgKmRtYWJ1Ziwgc3RydWN0IGRtYV9idWZfbWFwICptYXApCiAJc3RydWN0
IGNtYV9oZWFwX2J1ZmZlciAqYnVmZmVyID0gZG1hYnVmLT5wcml2OwogCiAJbXV0ZXhfbG9jaygm
YnVmZmVyLT5sb2NrKTsKKwlXQVJOX09OKGJ1ZmZlci0+dm1hcF9jbnQgPT0gMCk7CiAJaWYgKCEt
LWJ1ZmZlci0+dm1hcF9jbnQpIHsKIAkJdnVubWFwKGJ1ZmZlci0+dmFkZHIpOwogCQlidWZmZXIt
PnZhZGRyID0gTlVMTDsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9zeXN0ZW1f
aGVhcC5jIGIvZHJpdmVycy9kbWEtYnVmL2hlYXBzL3N5c3RlbV9oZWFwLmMKaW5kZXggNDA1MzUx
YWFkMmE4Li4yMzIxYzkxODkxZjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9z
eXN0ZW1faGVhcC5jCisrKyBiL2RyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9zeXN0ZW1faGVhcC5jCkBA
IC0yNzMsNiArMjczLDcgQEAgc3RhdGljIHZvaWQgc3lzdGVtX2hlYXBfdnVubWFwKHN0cnVjdCBk
bWFfYnVmICpkbWFidWYsIHN0cnVjdCBkbWFfYnVmX21hcCAqbWFwKQogCXN0cnVjdCBzeXN0ZW1f
aGVhcF9idWZmZXIgKmJ1ZmZlciA9IGRtYWJ1Zi0+cHJpdjsKIAogCW11dGV4X2xvY2soJmJ1ZmZl
ci0+bG9jayk7CisJV0FSTl9PTihidWZmZXItPnZtYXBfY250ID09IDApOwogCWlmICghLS1idWZm
ZXItPnZtYXBfY250KSB7CiAJCXZ1bm1hcChidWZmZXItPnZhZGRyKTsKIAkJYnVmZmVyLT52YWRk
ciA9IE5VTEw7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
