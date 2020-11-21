Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D76002BBD04
	for <lists+dri-devel@lfdr.de>; Sat, 21 Nov 2020 05:50:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D1C86E964;
	Sat, 21 Nov 2020 04:50:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C43B6E964
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Nov 2020 04:50:00 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id q34so9120256pgb.11
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 20:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1dCpwtABCBAjt0w8Zd+Ad9bD2W4r2bOOZVX2c+Uu5fs=;
 b=dWZndGYY+uUFnjhTHmwgKC5kbCrdYmubSee+8hTXlbn/lIbOxvZ5Ttleyy46be1rVp
 qkjr2mvMwk7LjJWmsfxi3Q4PR6eFA0UA3aAUKtM4P2ZPe+0LcvmlhQcOgYPLkEdCIIzz
 wNJSVJ0EXPQ/HxHgOwIoeCjJqHxvAtGHQ7F4d2xt/aZfo3mkP4hHGzWSvOr7iTEJHtAj
 z93hcZeMjn9tZGTzsGiq6KvXp61nQQynOsvheETm4xBNBIa2RT0/JqqAsRTb3j63Rqx/
 EMV0tlo39IeO6+VXs+9xIUNUCyxfoLQCYVohHcREV5xp0jF1u+vbO4uW4WRMeIFG5ZTl
 vHhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1dCpwtABCBAjt0w8Zd+Ad9bD2W4r2bOOZVX2c+Uu5fs=;
 b=EmekYBfw8jN6ouLD/VDwB+cYmX6tNyFwafyFfYdbugLLLL6IN3hoH2BUvgUi1ROpQB
 Tg7zhi+/oFkkolD6DyRwAqFc4jHWiehF1zcxW+Fh635n2kCd7oLK1/xjr9HevbCg9tKd
 fhnAV94VcLN8Okg99fkXvbWk1tkNnH7BYLH9aCdu1waBD6MUqL5y1h8h0K01qvyeWOEZ
 5BC6k9DQFmKnzVXviSfMZeZvHy8NVXaJBlIls7NuIcX26uxHX9TaEQYl44rO10akQOTh
 vQ8YLpfd4+bbTgazKJX/IVJCSL4ZWq2FSIQBSUYyv5LV1hlJC1YXy3WWNbN6Ro34Ga31
 qOwA==
X-Gm-Message-State: AOAM530GDz2yvJQcwqul3E/CpP2ROXuJUVmimRYZyyCi8UIbe0TBGnkC
 yVh7reCTAQYNcqg0rMFhrJiE2Q==
X-Google-Smtp-Source: ABdhPJyRE/0jIW/09/jq9G1nAs4OeW/5voPWRhKLPi853CLU1nhono7tAJRPn8bBZ4NkUjbxQj1OVQ==
X-Received: by 2002:a17:90a:c003:: with SMTP id
 p3mr13414860pjt.221.1605934200086; 
 Fri, 20 Nov 2020 20:50:00 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 w196sm5407692pfd.177.2020.11.20.20.49.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 20:49:59 -0800 (PST)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 0/5] dma-buf: Code rework and performance improvements for
 system heap
Date: Sat, 21 Nov 2020 04:49:50 +0000
Message-Id: <20201121044955.58215-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
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

SGV5IEFsbCwKICBTbyBqdXN0IHdhbnRlZCB0byBzZW5kIGFub3RoZXIgcmV2aXNpb24gb2YgbXkg
cGF0Y2ggc2VyaWVzCm9mIHBlcmZvcm1hbmNlIG9wdGltaXphdGlvbnMgdG8gdGhlIGRtYS1idWYg
c3lzdGVtIGhlYXAsIHRoaXMKdGltZSBhZ2FpbnN0IGRybS1taXNjLW5leHQuCgpUaGlzIHNlcmll
cyByZXdvcmtzIHRoZSBzeXN0ZW0gaGVhcCB0byB1c2Ugc2d0YWJsZXMsIGFuZCB0aGVuCmNvbnNv
bGlkYXRlcyB0aGUgcGFnZWxpc3QgbWV0aG9kIGZyb20gdGhlIGhlYXAtaGVscGVycyBpbnRvIHRo
ZQpDTUEgaGVhcC4gQWZ0ZXIgd2hpY2ggdGhlIGhlYXAtaGVscGVycyBsb2dpYyBpcyByZW1vdmVk
IChhcyBpdAppcyB1bnVzZWQpLiBJJ2Qgc3RpbGwgbGlrZSB0byBmaW5kIGEgYmV0dGVyIHdheSB0
byBhdm9pZCBzb21lIG9mCnRoZSBsb2dpYyBkdXBsaWNhdGlvbiBpbiBpbXBsZW1lbnRpbmcgdGhl
IGVudGlyZSBkbWFfYnVmX29wcwpoYW5kbGVycyBwZXIgaGVhcC4gQnV0IHVuZm9ydHVuYXRlbHkg
dGhhdCBjb2RlIGlzIHRpZWQgc29tZXdoYXQKdG8gaG93IHRoZSBidWZmZXIncyBtZW1vcnkgaXMg
dHJhY2tlZC4gQXMgbW9yZSBoZWFwcyBzaG93IHVwIEkKdGhpbmsgd2UnbGwgaGF2ZSBhIGJldHRl
ciBpZGVhIGhvdyB0byBiZXN0IHNoYXJlIGNvZGUsIHNvIGZvcgpub3cgSSB0aGluayB0aGlzIGlz
IG9rLgoKQWZ0ZXIgdGhpcywgdGhlIHNlcmllcyBpbnRyb2R1Y2VzIGFuIG9wdGltaXphdGlvbiB0
aGF0CsOYcmphbiBFaWRlIGltcGxlbWVudGVkIGZvciBJT04gdGhhdCBhdm9pZHMgY2FsbGluZyBz
eW5jIG9uCmF0dGFjaG1lbnRzIHRoYXQgZG9uJ3QgaGF2ZSBhIG1hcHBpbmcuCgpGaW5hbGx5LCBh
biBvcHRpbWl6YXRpb24gdG8gdXNlIGxhcmdlciBvcmRlciBwYWdlcyBmb3IgdGhlIHN5c3RlbQpo
ZWFwLiBUaGlzIGNoYW5nZSBicmluZ3MgdXMgY2xvc2VyIHRvIHRoZSBjdXJyZW50IHBlcmZvcm1h
bmNlCm9mIHRoZSBJT04gYWxsb2NhdGlvbiBjb2RlICh0aG91Z2ggdGhlcmUgc3RpbGwgaXMgYSBn
YXAgZHVlCnRvIElPTiB1c2luZyBhIG1peCBvZiBkZWZlcnJlZC1mcmVlaW5nIGFuZCBwYWdlIHBv
b2xzLCBJJ2xsIGJlCmxvb2tpbmcgYXQgaW50ZWdyYXRpbmcgdGhvc2UgZXZlbnR1YWxseSkuCgpU
aGlzIHZlcnNpb24gb2YgdGhlIHNlcmllcyBkb2VzIG5vdCBpbmNsdWRlIHRoZSBzeXN0ZW0tdW5j
YWNoZWQKaGVhcCBhcyBEYW5pZWwgd2FudGVkIGZ1cnRoZXIgZGVtb25zdHJhdGlvbiB0aGF0IGl0
IGlzIHVzZWZ1bAp3aXRoIGRldmljZXMgdGhhdCB1c2UgdGhlIG1lc2Egc3RhY2suIEknbSB3b3Jr
aW5nIG9uIHN1Y2ggYQpqdXN0aWZpY2F0aW9uIGJ1dCBJIGRvbid0IHdhbnQgdG8gaG9sZCB1cCB0
aGVzZSByZXdvcmsgcGF0Y2hlcwppbiB0aGUgbWVhbnRpbWUuCgp0aGFua3MKLWpvaG4KCk5ldyBp
biB2NjoKKiBEcm9wcGVkIHRoZSBzeXN0ZW0tdW5jYWNoZWQgaGVhcCBzdWJtaXNzaW9uIGZvciBu
b3cKKiBSZWJhc2VkIG9udG8gZHJtLW1pc2MtbmV4dAoKQ2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQu
c2Vtd2FsQGxpbmFyby5vcmc+CkNjOiBMaWFtIE1hcmsgPGxtYXJrQGNvZGVhdXJvcmEub3JnPgpD
YzogTGF1cmEgQWJib3R0IDxsYWJib3R0QGtlcm5lbC5vcmc+CkNjOiBCcmlhbiBTdGFya2V5IDxC
cmlhbi5TdGFya2V5QGFybS5jb20+CkNjOiBIcmlkeWEgVmFsc2FyYWp1IDxocmlkeWFAZ29vZ2xl
LmNvbT4KQ2M6IFN1cmVuIEJhZ2hkYXNhcnlhbiA8c3VyZW5iQGdvb2dsZS5jb20+CkNjOiBTYW5k
ZWVwIFBhdGlsIDxzc3BhdGlsQGdvb2dsZS5jb20+CkNjOiBEYW5pZWwgTWVudHogPGRhbmllbG1l
bnR6QGdvb2dsZS5jb20+CkNjOiBDaHJpcyBHb2xkc3dvcnRoeSA8Y2dvbGRzd29AY29kZWF1cm9y
YS5vcmc+CkNjOiDDmHJqYW4gRWlkZSA8b3JqYW4uZWlkZUBhcm0uY29tPgpDYzogUm9iaW4gTXVy
cGh5IDxyb2Jpbi5tdXJwaHlAYXJtLmNvbT4KQ2M6IEV6ZXF1aWVsIEdhcmNpYSA8ZXplcXVpZWxA
Y29sbGFib3JhLmNvbT4KQ2M6IFNpbW9uIFNlciA8Y29udGFjdEBlbWVyc2lvbi5mcj4KQ2M6IEph
bWVzIEpvbmVzIDxqYWpvbmVzQG52aWRpYS5jb20+CkNjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5l
bC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKCkpvaG4gU3R1bHR6ICg1
KToKICBkbWEtYnVmOiBzeXN0ZW1faGVhcDogUmV3b3JrIHN5c3RlbSBoZWFwIHRvIHVzZSBzZ3Rh
YmxlcyBpbnN0ZWFkIG9mCiAgICBwYWdlbGlzdHMKICBkbWEtYnVmOiBoZWFwczogTW92ZSBoZWFw
LWhlbHBlciBsb2dpYyBpbnRvIHRoZSBjbWFfaGVhcAogICAgaW1wbGVtZW50YXRpb24KICBkbWEt
YnVmOiBoZWFwczogUmVtb3ZlIGhlYXAtaGVscGVycyBjb2RlCiAgZG1hLWJ1ZjogaGVhcHM6IFNr
aXAgc3luYyBpZiBub3QgbWFwcGVkCiAgZG1hLWJ1Zjogc3lzdGVtX2hlYXA6IEFsbG9jYXRlIGhp
Z2hlciBvcmRlciBwYWdlcyBpZiBhdmFpbGFibGUKCiBkcml2ZXJzL2RtYS1idWYvaGVhcHMvTWFr
ZWZpbGUgICAgICAgfCAgIDEgLQogZHJpdmVycy9kbWEtYnVmL2hlYXBzL2NtYV9oZWFwLmMgICAg
IHwgMzI1ICsrKysrKysrKysrKysrKysrLS0tLQogZHJpdmVycy9kbWEtYnVmL2hlYXBzL2hlYXAt
aGVscGVycy5jIHwgMjc0IC0tLS0tLS0tLS0tLS0tLS0tLQogZHJpdmVycy9kbWEtYnVmL2hlYXBz
L2hlYXAtaGVscGVycy5oIHwgIDUzIC0tLS0KIGRyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9zeXN0ZW1f
aGVhcC5jICB8IDQxMSArKysrKysrKysrKysrKysrKysrKysrKystLS0KIDUgZmlsZXMgY2hhbmdl
ZCwgNjQwIGluc2VydGlvbnMoKyksIDQyNCBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0
NCBkcml2ZXJzL2RtYS1idWYvaGVhcHMvaGVhcC1oZWxwZXJzLmMKIGRlbGV0ZSBtb2RlIDEwMDY0
NCBkcml2ZXJzL2RtYS1idWYvaGVhcHMvaGVhcC1oZWxwZXJzLmgKCi0tIAoyLjE3LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
