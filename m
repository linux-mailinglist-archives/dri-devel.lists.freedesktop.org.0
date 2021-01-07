Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C22522EE77C
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 22:15:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1BC16E422;
	Thu,  7 Jan 2021 21:15:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 759116E422
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 21:15:31 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id 15so5995018pgx.7
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jan 2021 13:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+HPHLTIbnqvyYqZakEN0yW6023R2vX5SvJvHEGRsu88=;
 b=cHSZgqczj464Vf520gWeFxP2skBA26Gc4qDuq1k8SZeOGcfiiKTsmZsKBzVJdyquDP
 AwP7iEXEk3FUyf7L5lc4NpelRvFLZEqi6kU8c4hrfifAl04y8vtm7TNoDnKC63HO5SWh
 lvZZyVDoTP+zd7oHSx0sgJu/5FP0Do/q4vTVgiaLwFYflQVgzzvQt/kR9/i31MISy4tq
 LbZLvEw+G5rucP4QbGOC20BkR+d3pP9e1EqPfafczaD7SUTW8Q7US+QdpxgtZQPx7nXU
 sKm0TId7I+tNjCMRk2+nJ9OV9f/iHF9+aoyoW0ijSIp6Kfox+9TUooajqLsw5KAD6xDw
 p5Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+HPHLTIbnqvyYqZakEN0yW6023R2vX5SvJvHEGRsu88=;
 b=bS3sB6X1/yreX2Lzlnx6qXbm2WgH0A/4iYYwzgODNaBBeD703fbEpb/yoOk0C8rUY6
 xIktMo7IiumqWVHd2J0RNbaKqjp1jbVxEXNc8lM7yya4uN1d87dek1d5DsUUlE4pYNCp
 Eo7PyXBOd3P++W5JLTWDFBIeCC4MVukWW82/mkcMoFq2upe3jAJZYxLenssAtXFUPBmk
 fO+Up8LNQgheAR4MNeRcg9lQPhaSZnPwJr8aQsVOj/p1StBSZGr5x0jpgjgolpL3Iuoc
 v0dSxUAYKe3yCUnj4ndRNlXCfqng9ygxetxDlIIjmcMB5Jvu4m6mb/0lq3Yr0VDmg3Nb
 3bHA==
X-Gm-Message-State: AOAM530DKK2ZqtRUQcY5rAkoN6RaTfJyw5phezYOb3g2INThCzR6x8p0
 la9eIDig7BwZlm/bedZIJ/2MEQ==
X-Google-Smtp-Source: ABdhPJy9pko8exsJmRsYgHZWzS6HB4ShY5PboCyRW7n6CbWSr9ryNiq7i9X3M83nJXNVn5LYJ0D45Q==
X-Received: by 2002:aa7:97bc:0:b029:19e:18c7:76b with SMTP id
 d28-20020aa797bc0000b029019e18c7076bmr501704pfq.23.1610054131037; 
 Thu, 07 Jan 2021 13:15:31 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 b6sm6574055pfd.43.2021.01.07.13.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 13:15:30 -0800 (PST)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/3] dma-buf: heaps: Add a WARN_ON should the vmap_cnt go
 negative
Date: Thu,  7 Jan 2021 21:15:24 +0000
Message-Id: <20210107211525.75951-2-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210107211525.75951-1-john.stultz@linaro.org>
References: <20210107211525.75951-1-john.stultz@linaro.org>
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
