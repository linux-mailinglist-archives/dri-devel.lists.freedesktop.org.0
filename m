Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7292BC2B2
	for <lists+dri-devel@lfdr.de>; Sun, 22 Nov 2020 00:50:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63BC189954;
	Sat, 21 Nov 2020 23:50:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A65EC89954
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Nov 2020 23:50:05 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id 10so11446611pfp.5
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Nov 2020 15:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZdyhTvyVNa2fhAy8X/NHf9i/vBLLU68LSfcoVNt03w8=;
 b=hPqnU3xOMWcdHJxE2WBRuowx+pM6mR9po/NLZ2+HG9as2e0p2M4myMeqQ/bGXW7Mbf
 UAWBA5y72Sp07u1lRw3WoZlKIL9cb+4evqy3TEfUDr+clyQZCY7zsQbuRU6b0ZPQQQvA
 IkkCVaWOdcm2RvBBlh4m/JbjuoP/iltPQqln9mW4DeT6sIfVW08ry4X6SFhunJGoIO9t
 oK5HD1kteNpl83ql4n46c9fETkwM61Yq2I0ezzIHwzUvVDHR+AOmki884xaCWssQzM0M
 rtWP6LIGU/d8apzl2D0Ah64PN4+rZ4kV5GBpA4JUlGTfYIPpcFCYhBUP1fYJetSy9l/w
 jOEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZdyhTvyVNa2fhAy8X/NHf9i/vBLLU68LSfcoVNt03w8=;
 b=jdj2DBLmVbYVCIP9TyWXoAJKP/kri+zJTjuDkhdsbgARyQIf1eshLcUxH71JBXNnTA
 5uyWnegfOi67H4rRReEr/1Zm5gICAJkhV+sV1g6EfY9uP3o5r8ZViHdqscDRco7KUVDE
 eVN2suPBSyutSfCvpOky52rByuoI4RS4WmnA4arjZ4uODAa/DnF/CsZytQcjirknNFTh
 04G6FUtaqzSRJk+Yc6yYBL5GcqiwL3kYOavap38k0A7oEwqRkPcYLvE/3MaTLMZ+AquN
 XAsOccrV9bZGhM5SRh1wovh79qbNLb55etB5A95nB4t+qTXcVLKaA7T0rqJ3ZH6U+uZ8
 bGXg==
X-Gm-Message-State: AOAM531Wt/jlIFSSEneN5biHnhA0+UuaZ8qHreZZOiP6LWA4RY0mu0OC
 2LcFqmADB0giTzL9K4+Z8FzKyA==
X-Google-Smtp-Source: ABdhPJzR7eE8aKla6W64xhedCSmbj1FTLdSO3fp593xPplEFC+UFeaGglpeDqZNua7/tdBZdBDBHuw==
X-Received: by 2002:a17:90a:1d47:: with SMTP id
 u7mr17839921pju.49.1606002605188; 
 Sat, 21 Nov 2020 15:50:05 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 v126sm7882525pfb.137.2020.11.21.15.50.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2020 15:50:04 -0800 (PST)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 0/5] dma-buf: Code rework and performance improvements for
 system heap
Date: Sat, 21 Nov 2020 23:49:57 +0000
Message-Id: <20201121235002.69945-1-john.stultz@linaro.org>
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

SGV5IEFsbCwKICBTbyBTdW1pdCBub3RlZCBhIGZsdWIgSSBtYWRlIGluIGFkYXB0aW5nIHRoZSBs
YXN0IHNlcmllcyB0bwp0aGUgbmV3IGRtYS1idWYtbWFwIGNvZGUgdGhhdCBpcyBpbiBkcm0tbWlz
Yy1uZXh0LiBUaHVzIEkgd2FudGVkCnRvIHNlbmQgdGhpcyAoaG9wZWZ1bGx5KSBsYXN0IHJldmlz
aW9uIG9mIG15IHBhdGNoIHNlcmllcyBvZgpwZXJmb3JtYW5jZSBvcHRpbWl6YXRpb25zIHRvIHRo
ZSBkbWEtYnVmIHN5c3RlbSBoZWFwLCBvbmNlIGFnYWluCmFnYWluc3QgZHJtLW1pc2MtbmV4dC4K
ClRoaXMgc2VyaWVzIHJld29ya3MgdGhlIHN5c3RlbSBoZWFwIHRvIHVzZSBzZ3RhYmxlcywgYW5k
IHRoZW4KY29uc29saWRhdGVzIHRoZSBwYWdlbGlzdCBtZXRob2QgZnJvbSB0aGUgaGVhcC1oZWxw
ZXJzIGludG8gdGhlCkNNQSBoZWFwLiBBZnRlciB3aGljaCB0aGUgaGVhcC1oZWxwZXJzIGxvZ2lj
IGlzIHJlbW92ZWQgKGFzIGl0CmlzIHVudXNlZCkuIEknZCBzdGlsbCBsaWtlIHRvIGZpbmQgYSBi
ZXR0ZXIgd2F5IHRvIGF2b2lkIHNvbWUgb2YKdGhlIGxvZ2ljIGR1cGxpY2F0aW9uIGluIGltcGxl
bWVudGluZyB0aGUgZW50aXJlIGRtYV9idWZfb3BzCmhhbmRsZXJzIHBlciBoZWFwLiBCdXQgdW5m
b3J0dW5hdGVseSB0aGF0IGNvZGUgaXMgdGllZCBzb21ld2hhdAp0byBob3cgdGhlIGJ1ZmZlcidz
IG1lbW9yeSBpcyB0cmFja2VkLiBBcyBtb3JlIGhlYXBzIHNob3cgdXAgSQp0aGluayB3ZSdsbCBo
YXZlIGEgYmV0dGVyIGlkZWEgaG93IHRvIGJlc3Qgc2hhcmUgY29kZSwgc28gZm9yCm5vdyBJIHRo
aW5rIHRoaXMgaXMgb2suCgpBZnRlciB0aGlzLCB0aGUgc2VyaWVzIGludHJvZHVjZXMgYW4gb3B0
aW1pemF0aW9uIHRoYXQKw5hyamFuIEVpZGUgaW1wbGVtZW50ZWQgZm9yIElPTiB0aGF0IGF2b2lk
cyBjYWxsaW5nIHN5bmMgb24KYXR0YWNobWVudHMgdGhhdCBkb24ndCBoYXZlIGEgbWFwcGluZy4K
CkZpbmFsbHksIGFuIG9wdGltaXphdGlvbiB0byB1c2UgbGFyZ2VyIG9yZGVyIHBhZ2VzIGZvciB0
aGUgc3lzdGVtCmhlYXAuIFRoaXMgY2hhbmdlIGJyaW5ncyB1cyBjbG9zZXIgdG8gdGhlIGN1cnJl
bnQgcGVyZm9ybWFuY2UKb2YgdGhlIElPTiBhbGxvY2F0aW9uIGNvZGUgKHRob3VnaCB0aGVyZSBz
dGlsbCBpcyBhIGdhcCBkdWUKdG8gSU9OIHVzaW5nIGEgbWl4IG9mIGRlZmVycmVkLWZyZWVpbmcg
YW5kIHBhZ2UgcG9vbHMsIEknbGwgYmUKbG9va2luZyBhdCBpbnRlZ3JhdGluZyB0aG9zZSBldmVu
dHVhbGx5KS4KClRoaXMgdmVyc2lvbiBvZiB0aGUgc2VyaWVzIGRvZXMgbm90IGluY2x1ZGUgdGhl
IHN5c3RlbS11bmNhY2hlZApoZWFwIGFzIERhbmllbCB3YW50ZWQgZnVydGhlciBkZW1vbnN0cmF0
aW9uIHRoYXQgaXQgaXMgdXNlZnVsCndpdGggZGV2aWNlcyB0aGF0IHVzZSB0aGUgbWVzYSBzdGFj
ay4gSSdtIHdvcmtpbmcgb24gc3VjaCBhCmp1c3RpZmljYXRpb24gYnV0IEkgZG9uJ3Qgd2FudCB0
byBob2xkIHVwIHRoZXNlIHJld29yayBwYXRjaGVzCmluIHRoZSBtZWFudGltZS4KCnRoYW5rcwot
am9obgoKTmV3IGluIHY3OgoqIEZpeGVkIHRoZSBpbmNvcnJlY3QgYWRhcHRhdGlvbiB0byB0aGUg
ZG1hLWJ1Zi1tYXAgdXNhZ2UKCkNjOiBTdW1pdCBTZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5hcm8u
b3JnPgpDYzogTGlhbSBNYXJrIDxsbWFya0Bjb2RlYXVyb3JhLm9yZz4KQ2M6IExhdXJhIEFiYm90
dCA8bGFiYm90dEBrZXJuZWwub3JnPgpDYzogQnJpYW4gU3RhcmtleSA8QnJpYW4uU3RhcmtleUBh
cm0uY29tPgpDYzogSHJpZHlhIFZhbHNhcmFqdSA8aHJpZHlhQGdvb2dsZS5jb20+CkNjOiBTdXJl
biBCYWdoZGFzYXJ5YW4gPHN1cmVuYkBnb29nbGUuY29tPgpDYzogU2FuZGVlcCBQYXRpbCA8c3Nw
YXRpbEBnb29nbGUuY29tPgpDYzogRGFuaWVsIE1lbnR6IDxkYW5pZWxtZW50ekBnb29nbGUuY29t
PgpDYzogQ2hyaXMgR29sZHN3b3J0aHkgPGNnb2xkc3dvQGNvZGVhdXJvcmEub3JnPgpDYzogw5hy
amFuIEVpZGUgPG9yamFuLmVpZGVAYXJtLmNvbT4KQ2M6IFJvYmluIE11cnBoeSA8cm9iaW4ubXVy
cGh5QGFybS5jb20+CkNjOiBFemVxdWllbCBHYXJjaWEgPGV6ZXF1aWVsQGNvbGxhYm9yYS5jb20+
CkNjOiBTaW1vbiBTZXIgPGNvbnRhY3RAZW1lcnNpb24uZnI+CkNjOiBKYW1lcyBKb25lcyA8amFq
b25lc0BudmlkaWEuY29tPgpDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCkNjOiBkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCgoKSm9obiBTdHVsdHogKDUpOgogIGRtYS1idWY6
IHN5c3RlbV9oZWFwOiBSZXdvcmsgc3lzdGVtIGhlYXAgdG8gdXNlIHNndGFibGVzIGluc3RlYWQg
b2YKICAgIHBhZ2VsaXN0cwogIGRtYS1idWY6IGhlYXBzOiBNb3ZlIGhlYXAtaGVscGVyIGxvZ2lj
IGludG8gdGhlIGNtYV9oZWFwCiAgICBpbXBsZW1lbnRhdGlvbgogIGRtYS1idWY6IGhlYXBzOiBS
ZW1vdmUgaGVhcC1oZWxwZXJzIGNvZGUKICBkbWEtYnVmOiBoZWFwczogU2tpcCBzeW5jIGlmIG5v
dCBtYXBwZWQKICBkbWEtYnVmOiBzeXN0ZW1faGVhcDogQWxsb2NhdGUgaGlnaGVyIG9yZGVyIHBh
Z2VzIGlmIGF2YWlsYWJsZQoKIGRyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9NYWtlZmlsZSAgICAgICB8
ICAgMSAtCiBkcml2ZXJzL2RtYS1idWYvaGVhcHMvY21hX2hlYXAuYyAgICAgfCAzMjkgKysrKysr
KysrKysrKysrKystLS0tCiBkcml2ZXJzL2RtYS1idWYvaGVhcHMvaGVhcC1oZWxwZXJzLmMgfCAy
NzQgLS0tLS0tLS0tLS0tLS0tLS0tCiBkcml2ZXJzL2RtYS1idWYvaGVhcHMvaGVhcC1oZWxwZXJz
LmggfCAgNTMgLS0tLQogZHJpdmVycy9kbWEtYnVmL2hlYXBzL3N5c3RlbV9oZWFwLmMgIHwgNDE0
ICsrKysrKysrKysrKysrKysrKysrKysrKy0tLQogNSBmaWxlcyBjaGFuZ2VkLCA2NDcgaW5zZXJ0
aW9ucygrKSwgNDI0IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZG1h
LWJ1Zi9oZWFwcy9oZWFwLWhlbHBlcnMuYwogZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZG1h
LWJ1Zi9oZWFwcy9oZWFwLWhlbHBlcnMuaAoKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
