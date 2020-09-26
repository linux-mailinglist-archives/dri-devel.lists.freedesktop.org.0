Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 695E72796A6
	for <lists+dri-devel@lfdr.de>; Sat, 26 Sep 2020 06:25:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8157D6E122;
	Sat, 26 Sep 2020 04:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B4976E122
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Sep 2020 04:24:57 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id x5so185037plo.6
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 21:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u7Z9AmMaAX9Vb4Ld53icr/xLpCufMXVRoWb2ypLsc80=;
 b=mVKL30wyp8QWxrO/AXPzbqcUkAgUwQ5PQLPtaTkJUo85MCgp0lLqI759YCjmqYCkfo
 0vofLOZ+oqHZEyalKS9grgA6QsTsHTLZUVGmcmn4NXUp+sOGw9tqWOL6ubqGxS3Nrc00
 q7tnYBkMjfrG4/lWYFeHodZ7QGCewEqSZ6IsvQh/3ZR0RsD03VrR8qY1GpHDuym1lq5x
 vmaDqZ8UEYL5EXf8Wktjix4s29ercJuTkpkr1blwjS1MwNlPlh5wQKPWzsMsYaIxYeKr
 psDWBvDxbJDar9sPHmE6joj+ftiS9KY4vzTpm7AdJVQcwhLAOkWQl4oK2hkRKUtga3cW
 uDPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u7Z9AmMaAX9Vb4Ld53icr/xLpCufMXVRoWb2ypLsc80=;
 b=Wf58Hv6UUA8CHr/OI/ktdkALvxyUHuse1RNgDIOoTMO6plUVr8L9IPSTqDl0gMv/ut
 DJ+cgxzZYJ9bzWjan4ZrZ43epLps3cyIDW2JkXS6ZuiS/vaUmfonKoFWhOIOHUQ0V5w2
 IreDFfeMGpUwLsAbM3CD+4S9s7AbsYRuC/BqhLXJ6VBF6ggUVViYhVmDG6CcltjxnTb8
 LX1/uI/mehy3pcU3hx0xEMFxZF8nbmHbbakTozPqd/YUSzLWlCwKip04ay30DI2I7s9A
 DYxSc/++HYexIpgSPSAeqzsOf85WtrJXbNaqKr79nOWpkXoW7iFm9+w1qrVXppBlYvc4
 at/Q==
X-Gm-Message-State: AOAM533npBjsOXdulst+NusGuRSM9iW7sdwYCusY75G/G1xcDQHz6Ab2
 GHtdTNxH4C53KtieNbe1WoVJOw==
X-Google-Smtp-Source: ABdhPJzK4xRnW4GQ7wUmaWVVtyqAzUaT2hQgL6Vkyx4xR/37YLk5BaJvFuZ7unQ2rLB0zWZJPt03KQ==
X-Received: by 2002:a17:902:8347:b029:d1:f365:6fb5 with SMTP id
 z7-20020a1709028347b02900d1f3656fb5mr2420471pln.61.1601094296568; 
 Fri, 25 Sep 2020 21:24:56 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 a5sm3585886pgk.13.2020.09.25.21.24.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 21:24:55 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [RFC][PATCH 0/6] dma-buf: Performance improvements for system heap
Date: Sat, 26 Sep 2020 04:24:47 +0000
Message-Id: <20200926042453.67517-1-john.stultz@linaro.org>
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
 Laura Abbott <labbott@kernel.org>, Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?q?=C3=98rjan=20Eide?= <orjan.eide@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGV5IEFsbCwKICBTbyB0aGlzIHBhdGNoIHNlcmllcyBjb250YWlucyBhIHNlcmllcyBvZiBwZXJm
b3JtYW5jZQpvcHRpbWl6YXRpb25zIHRvIHRoZSBkbWEtYnVmIHN5c3RlbSBoZWFwLgoKVW5mb3J0
dW5hdGVseSwgaW4gd29ya2luZyB0aGVzZSB1cCwgSSByZWFsaXplZCB0aGUgaGVhcC1oZWxwZXJz
CmluZnJhc3RydWN0dXJlIHdlIHRyaWVkIHRvIGFkZCB0byBtaW5paW1pemUgY29kZSBkdXBsaWNh
dGlvbiBpcwpub3QgYXMgZ2VuZXJpYyBhcyB3ZSBpbnRlbmRlZC4gRm9yIHNvbWUgaGVhcHMgaXQg
bWFrZXMgc2Vuc2UgdG8KZGVhbCB3aXRoIHBhZ2UgbGlzdHMsIGZvciBvdGhlciBoZWFwcyBpdCBt
YWtlcyBtb3JlIHNlbnNlIHRvCnRyYWNrIHRoaW5ncyB3aXRoIHNndGFibGVzLgoKU28gdGhpcyBz
ZXJpZXMgcmV3b3JrcyB0aGUgc3lzdGVtIGhlYXAgdG8gdXNlIHNndGFibGVzLCBhbmQgdGhlbgpj
b25zb2xpZGF0ZXMgdGhlIHBhZ2VsaXN0IG1ldGhvZCBmcm9tIHRoZSBoZWFwLWhlbHBlcnMgaW50
byB0aGUKQ01BIGhlYXAuIEFmdGVyIHdoaWNoIHRoZSBoZWFwLWhlbHBlcnMgbG9naWMgaXMgcmVt
b3ZlZCAoYXMgaXQKaXMgdW51c2VkKS4gSSdkIHN0aWxsIGxpa2UgdG8gZmluZCBhIGJldHRlciB3
YXkgdG8gYXZvaWQgc29tZSBvZgp0aGUgbG9naWMgZHVwbGljYXRpb24gaW4gaW1wbGVtZW50aW5n
IHRoZSBlbnRpcmUgZG1hX2J1Zl9vcHMKaGFuZGxlcnMgcGVyIGhlYXAuIEJ1dCB1bmZvcnR1bmF0
ZWx5IHRoYXQgY29kZSBpcyB0aWVkIHNvbWV3aGF0CnRvIGhvdyB0aGUgYnVmZmVyJ3MgbWVtb3J5
IGlzIHRyYWNrZWQuCgpBZnRlciB0aGlzLCB0aGUgc2VyaWVzIGludHJvZHVjZXMgdHdvIG9wdGlt
aXphdGlvbnMgdG8gdGhlIHRoZQpzeXN0ZW0gaGVhcCwgdXRpbGl6aW5nIGxhcmdlIG9yZGVyIHBh
Z2VzLCBhbmQgYWRkaW5nIGEgcGFnZS1wb29sCihtYXliZSBhYnVzaW5nIHRoZSBwYWdlcG9vbCBs
b2dpYyBmcm9tIHRoZSBuZXR3b3JrIGNvZGUsIGJ1dCBpdApzZWVtcyBzaWxseSB0byByZWltcGxl
bWVudCBpdCkuCgoKSSBpbXBsZW1lbnRlZCBhIHNpbXBsZSBhbGxvY2F0aW9uIG1pY3JvYmVuY2ht
YXJrIHRvIGNvbXBhcmUKZG1hYnVmIGhlYXBzIHZzIGlvbjoKICBodHRwczovL2dpdC5saW5hcm8u
b3JnL3Blb3BsZS9qb2huLnN0dWx0ei9hbmRyb2lkLWRldi5naXQvY29tbWl0Lz9oPWRldi9kbWEt
YnVmLWhlYXAtcGVyZiZpZD1lMzNhYWJkMzRiMzAwZjhmOGJlOGQ3MWVjNzI1M2RkMGFiZTcwMmYy
CgpXaXRoIHRoZXNlIGNoYW5nZXMsIHRoZSBhbGxvY2F0aW9uIHBhdGggaXMgKm11Y2gqIGltcHJv
dmVkLApwZXJmb3JtaW5nIGJldHRlciB0aGVuIElPTiAodGhvdWdoIHRvIGJlIGZhaXIsIHRoZSBy
ZXBlYXRlZCAKYWxsb2NhdGluZyBhbmQgZnJlZWluZyBvZiB0aGUgc2FtZSBzaXplIGJ1ZmZlciBp
cyB0aGUgaWRlYWwKY2FzZSBmb3IgdGhlIHBhZ2Vwb29sIGxvZ2ljLCBzbyBkb24ndCByZWFkIHRv
byBtdWNoIGludG8gaXQpLgoKSSBjaGFydGVkIHNvbWUgZGF0YXBvaW50cyBmcm9tIHRoZSBtaWNy
b2JlbmNobWFyayB3aXRoIGVhY2gKb2YgdGhlIHBhdGNoZXMgc2hvdWxkIGZvbGtzIGJlIGludGVy
ZXN0ZWQuCmh0dHBzOi8vZG9jcy5nb29nbGUuY29tL3NwcmVhZHNoZWV0cy9kLzEtMUM4WlFwbWts
XzBESVNrSTZ6NHhlbEUwOE1sTkFON29FdTM0QW5PNEFvL2VkaXQjZ2lkPTAKCkZpbmFsbHksIGEg
cG9ydCBvZiBhIHBhdGNoIHRoYXQgw5hyamFuIEVpZGUgaW1wbGVtZW50ZWQgZm9yIElPTgp0aGF0
IGF2b2lkcyBjYWxsaW5nIHN5bmMgb24gYXR0YWNobWVudHMgdGhhdCBkb24ndCBoYXZlIGEKbWFw
cGluZy4KCkZlZWRiYWNrIG9uIHRoZXNlIHdvdWxkIGJlIGdyZWF0IQoKCkNjOiBTdW1pdCBTZW13
YWwgPHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnPgpDYzogTGlhbSBNYXJrIDxsbWFya0Bjb2RlYXVy
b3JhLm9yZz4KQ2M6IExhdXJhIEFiYm90dCA8bGFiYm90dEBrZXJuZWwub3JnPgpDYzogQnJpYW4g
U3RhcmtleSA8QnJpYW4uU3RhcmtleUBhcm0uY29tPgpDYzogSHJpZHlhIFZhbHNhcmFqdSA8aHJp
ZHlhQGdvb2dsZS5jb20+CkNjOiBTdXJlbiBCYWdoZGFzYXJ5YW4gPHN1cmVuYkBnb29nbGUuY29t
PgpDYzogU2FuZGVlcCBQYXRpbCA8c3NwYXRpbEBnb29nbGUuY29tPgpDYzogw5hyamFuIEVpZGUg
PG9yamFuLmVpZGVAYXJtLmNvbT4KQ2M6IFJvYmluIE11cnBoeSA8cm9iaW4ubXVycGh5QGFybS5j
b20+CkNjOiBFemVxdWllbCBHYXJjaWEgPGV6ZXF1aWVsQGNvbGxhYm9yYS5jb20+CkNjOiBTaW1v
biBTZXIgPGNvbnRhY3RAZW1lcnNpb24uZnI+CkNjOiBKYW1lcyBKb25lcyA8amFqb25lc0Budmlk
aWEuY29tPgpDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCkNjOiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCgpKb2huIFN0dWx0eiAoNik6CiAgZG1hLWJ1Zjogc3lzdGVtX2hl
YXA6IFJld29yayBzeXN0ZW0gaGVhcCB0byB1c2Ugc2d0YWJsZXMgaW5zdGVhZCBvZgogICAgcGFn
ZWxpc3RzCiAgZG1hLWJ1ZjogaGVhcHM6IE1vdmUgaGVhcC1oZWxwZXIgbG9naWMgaW50byB0aGUg
Y21hX2hlYXAKICAgIGltcGxlbWVudGF0aW9uCiAgZG1hLWJ1ZjogaGVhcHM6IFJlbW92ZSBoZWFw
LWhlbHBlcnMgY29kZQogIGRtYS1idWY6IHN5c3RlbV9oZWFwOiBBbGxvY2F0ZSBoaWdoZXIgb3Jk
ZXIgcGFnZXMgaWYgYXZhaWxhYmxlCiAgZG1hLWJ1Zjogc3lzdGVtX2hlYXA6IEFkZCBwYWdlcG9v
bCBzdXBwb3J0IHRvIHN5c3RlbSBoZWFwCiAgZG1hLWJ1ZjogaGVhcHM6IFNraXAgc3luYyBpZiBu
b3QgbWFwcGVkCgogZHJpdmVycy9kbWEtYnVmL2hlYXBzL0tjb25maWcgICAgICAgIHwgICAxICsK
IGRyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9NYWtlZmlsZSAgICAgICB8ICAgMSAtCiBkcml2ZXJzL2Rt
YS1idWYvaGVhcHMvY21hX2hlYXAuYyAgICAgfCAzMzIgKysrKysrKysrKysrKysrKystLS0tCiBk
cml2ZXJzL2RtYS1idWYvaGVhcHMvaGVhcC1oZWxwZXJzLmMgfCAyNzEgLS0tLS0tLS0tLS0tLS0t
LS0KIGRyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9oZWFwLWhlbHBlcnMuaCB8ICA1MyAtLS0tCiBkcml2
ZXJzL2RtYS1idWYvaGVhcHMvc3lzdGVtX2hlYXAuYyAgfCA0MjYgKysrKysrKysrKysrKysrKysr
KysrKysrLS0tCiA2IGZpbGVzIGNoYW5nZWQsIDY2MCBpbnNlcnRpb25zKCspLCA0MjQgZGVsZXRp
b25zKC0pCiBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9kbWEtYnVmL2hlYXBzL2hlYXAtaGVs
cGVycy5jCiBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9kbWEtYnVmL2hlYXBzL2hlYXAtaGVs
cGVycy5oCgotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
