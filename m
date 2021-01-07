Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 773DB2EE6CA
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 21:26:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7F696E513;
	Thu,  7 Jan 2021 20:26:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 733FF6E513
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 20:26:20 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id l23so4511020pjg.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jan 2021 12:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U9M2e+GyD9N3kdkTu1dWZpMp+TAsO6qz5jF42PL+fHo=;
 b=PdcvmPrsZTt84GZCS+kSt2fsYPUuWBnUZ6TgSGrzQm7LMI06dViN+9q1BlvX3wKwvy
 1wk7rj1JVz438UvHsZkQev7kMal1vDAykDsfxC7na5m4/YFebvq9SSUKtS9Y0YF4N/OF
 whDN3W5ZGFo6U3kffrK2ffFmsDsrro0IYJE2cc7EPQDaGOrY7OAee/+wtZPbpDlgGgAL
 r8gQLptYjvGMrb7QH8D/qwA29QjZF6SuWybgWBfUtX3P53vcbGm0db0nba5hWgQ888ZK
 n+32dBm5G6GBN1TV8lD0c2epBxo233wXHEb1OEUoqkyDzv+UgJ+vMhEXBEPVTXNetmQA
 x0SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U9M2e+GyD9N3kdkTu1dWZpMp+TAsO6qz5jF42PL+fHo=;
 b=XiyPS161io7VVz0bFXy7NX2PPc3DOLkzX++8sVBLPxaB0lBE8Rvh56UKgqrSbCmmfJ
 H2Pv36hjgbQZ4s/0VekYeBfSUL4FcOzzvdC1byAwC9kxiiuhCWQxBFAufqkcc1PVX3Iy
 aQfLxLM8c7B7R0U5jZwiHiC6PH4qzF/M2iwVWp9Agq8RIKReGjRWO9PLhCvic+VWZQq1
 rdNndNx7cYuFr1aWgRctvFvMKL5dUN9fS8tu9eVICkjO4o5dHd97nGiC/9gzz0hcTz46
 ISgbVjiB9xFnKLNzvOMvhSKv9fjPOKfTOWPw2mwPGdleiNm0nxCZuNX4+0LnVDDSmDqd
 3LBw==
X-Gm-Message-State: AOAM533geINXoBKOwTxvPDYe+pVs77WRvbpttzMett7grBeLKevzarvy
 0hQzxoYz1snWVfTRKx6aieTDpg==
X-Google-Smtp-Source: ABdhPJzFeKvAsLz8R7Rwlkdtsye3bkYdvaN9gR1Ris0ONyaGl04w2s13SWnH/vv8k+BsZYzGRRZY/w==
X-Received: by 2002:a17:90a:3948:: with SMTP id
 n8mr216103pjf.206.1610051180075; 
 Thu, 07 Jan 2021 12:26:20 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 q9sm7042112pgb.82.2021.01.07.12.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 12:26:19 -0800 (PST)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH] dma-buf: cma_heap: Fix memory leak in CMA heap
Date: Thu,  7 Jan 2021 20:26:16 +0000
Message-Id: <20210107202616.75170-1-john.stultz@linaro.org>
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
 Ezequiel Garcia <ezequiel@collabora.com>,
 Suren Baghdasaryan <surenb@google.com>, James Jones <jajones@nvidia.com>,
 Robin Murphy <robin.murphy@arm.com>, Liam Mark <lmark@codeaurora.org>,
 Bing Song <bing.song@nxp.com>, Laura Abbott <labbott@kernel.org>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?q?=C3=98rjan=20Eide?= <orjan.eide@arm.com>,
 linux-media@vger.kernel.org, Daniel Mentz <danielmentz@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QmluZyBTb25nIG5vdGljZWQgdGhlIENNQSBoZWFwIHdhcyBsZWFraW5nIG1lbW9yeSBkdWUgdG8g
YSBmbHViCkkgbWFkZSBpbiBjb21taXQgYTVkMmQyOWUyNGJlICgiZG1hLWJ1ZjogaGVhcHM6IE1v
dmUgaGVhcC1oZWxwZXIKbG9naWMgaW50byB0aGUgY21hX2hlYXAgaW1wbGVtZW50YXRpb24iKSwg
YW5kIHByb3ZpZGVkIHRoaXMgZml4CndoaWNoIGVuc3VyZXMgdGhlIHBhZ2VsaXN0IGlzIGFsc28g
ZnJlZWQgb24gcmVsZWFzZS4KCkNjOiBCaW5nIFNvbmcgPGJpbmcuc29uZ0BueHAuY29tPgpDYzog
U3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4KQ2M6IExpYW0gTWFyayA8bG1h
cmtAY29kZWF1cm9yYS5vcmc+CkNjOiBMYXVyYSBBYmJvdHQgPGxhYmJvdHRAa2VybmVsLm9yZz4K
Q2M6IEJyaWFuIFN0YXJrZXkgPEJyaWFuLlN0YXJrZXlAYXJtLmNvbT4KQ2M6IEhyaWR5YSBWYWxz
YXJhanUgPGhyaWR5YUBnb29nbGUuY29tPgpDYzogU3VyZW4gQmFnaGRhc2FyeWFuIDxzdXJlbmJA
Z29vZ2xlLmNvbT4KQ2M6IFNhbmRlZXAgUGF0aWwgPHNzcGF0aWxAZ29vZ2xlLmNvbT4KQ2M6IERh
bmllbCBNZW50eiA8ZGFuaWVsbWVudHpAZ29vZ2xlLmNvbT4KQ2M6IENocmlzIEdvbGRzd29ydGh5
IDxjZ29sZHN3b0Bjb2RlYXVyb3JhLm9yZz4KQ2M6IMOYcmphbiBFaWRlIDxvcmphbi5laWRlQGFy
bS5jb20+CkNjOiBSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBoeUBhcm0uY29tPgpDYzogRXplcXVp
ZWwgR2FyY2lhIDxlemVxdWllbEBjb2xsYWJvcmEuY29tPgpDYzogU2ltb24gU2VyIDxjb250YWN0
QGVtZXJzaW9uLmZyPgpDYzogSmFtZXMgSm9uZXMgPGpham9uZXNAbnZpZGlhLmNvbT4KQ2M6IGxp
bnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpSZXBvcnRlZC1ieTogQmluZyBTb25nIDxiaW5nLnNvbmdAbnhwLmNvbT4KRml4ZXM6IGE1
ZDJkMjllMjRiZSAoImRtYS1idWY6IGhlYXBzOiBNb3ZlIGhlYXAtaGVscGVyIGxvZ2ljIGludG8g
dGhlIGNtYV9oZWFwIGltcGxlbWVudGF0aW9uIikKU2lnbmVkLW9mZi1ieTogSm9obiBTdHVsdHog
PGpvaG4uc3R1bHR6QGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9kbWEtYnVmL2hlYXBzL2NtYV9o
ZWFwLmMgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9jbWFfaGVhcC5jIGIvZHJpdmVycy9kbWEtYnVmL2hl
YXBzL2NtYV9oZWFwLmMKaW5kZXggM2M0ZTM0MzAxMTcyLi4zNjRmYzJmM2U0OTkgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9jbWFfaGVhcC5jCisrKyBiL2RyaXZlcnMvZG1hLWJ1
Zi9oZWFwcy9jbWFfaGVhcC5jCkBAIC0yNTEsNiArMjUxLDkgQEAgc3RhdGljIHZvaWQgY21hX2hl
YXBfZG1hX2J1Zl9yZWxlYXNlKHN0cnVjdCBkbWFfYnVmICpkbWFidWYpCiAJCWJ1ZmZlci0+dmFk
ZHIgPSBOVUxMOwogCX0KIAorCS8qIGZyZWUgcGFnZSBsaXN0ICovCisJa2ZyZWUoYnVmZmVyLT5w
YWdlcyk7CisJLyogcmVsZWFzZSBtZW1vcnkgKi8KIAljbWFfcmVsZWFzZShjbWFfaGVhcC0+Y21h
LCBidWZmZXItPmNtYV9wYWdlcywgYnVmZmVyLT5wYWdlY291bnQpOwogCWtmcmVlKGJ1ZmZlcik7
CiB9Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
