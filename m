Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60416311BA8
	for <lists+dri-devel@lfdr.de>; Sat,  6 Feb 2021 06:48:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ACE36E3F9;
	Sat,  6 Feb 2021 05:47:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14C376E3F9
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Feb 2021 05:47:55 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id 8so4633747plc.10
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Feb 2021 21:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ysXoxmHGWekWNyITP0f9QwT2Iyo77pJXB4WoqmtP4Co=;
 b=MLL+lNMZWZo9tRRfPkaLmM7dZ/6WNlE+hPWt8/xKtrnExLFYxkcpBZnolJqOVe3y2r
 RoCyhZ01Av+Cj2obyhiM3Aq29N4MBK5Q9cXxb9QZt6FCd8QUu2wfgzR4U/A1x6CxPHvs
 enRyhpFs8icHd/u53gN54C31eGfENGEDLoSz6X6BcJFl39I9Hs7ODAewm8PFf66AotKD
 51L2HrkgbHGQjJG09XzKFPq58sEPDQd98Rn7kcGJpTmTYTkzWOFB/N5S0YZ1sK7KOBRK
 TbHzs2ONwl6u+jm3zgWj6ylyiBm4oHVJa0z6iKOyg7KuSQ89+15gS84yDDM7ohuJ0B8n
 pLmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ysXoxmHGWekWNyITP0f9QwT2Iyo77pJXB4WoqmtP4Co=;
 b=lQBvtHQ7mv6DY48xN21aZXd82+zkk2rXMZRzM3clW3rhxheNd/pMlKPtPqtpS0Ctjl
 yWYmOjp/EVG4/b615trfUamgQ3tkwkE80G5MpF7O4qv44c9W7+3Fv/97meiKofoqVfwv
 piZT95WTc2mttqluJrqhceTrbcHzu0NGQ618Swb+HPWdh0ElXlVlmMi5+Mjk+kmtGWky
 8Vp5NY8GCBR0dF741u5/yJiJx08uaGvlqfwrQv9S2OntXjT9SI84MPyEiD0TCtyCF3lv
 8nO2jNoR0LtXFF+1efPAGJ0asdRN/FJOmwNfzA0HCy8fjBDVf4I3NtTDQ1tSbgj+o865
 YTWQ==
X-Gm-Message-State: AOAM530IM08mitDhpPJhro78TncYC2AUY+Ciy/KRxwqBjehGuLFcGGCL
 lb5CHPZKPElEkW1I5D6D5/0gfw==
X-Google-Smtp-Source: ABdhPJzmd8A00mIxv5h6tiX3iJxykxthFlYvrr/Jc67oyFQ7FQBCfqGGUdNmJMiuKKMKjea51Dr8ww==
X-Received: by 2002:a17:90b:4c10:: with SMTP id
 na16mr7320475pjb.49.1612590474659; 
 Fri, 05 Feb 2021 21:47:54 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 ob6sm9200211pjb.30.2021.02.05.21.47.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 21:47:53 -0800 (PST)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [RFC][PATCH 2/2] dma-buf: heaps: Fix the name used when exporting
 dmabufs to be the actual heap name
Date: Sat,  6 Feb 2021 05:47:48 +0000
Message-Id: <20210206054748.378300-2-john.stultz@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210206054748.378300-1-john.stultz@linaro.org>
References: <20210206054748.378300-1-john.stultz@linaro.org>
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
MzY0ZmMyZjNlNDk5Li42MjQ2NWQ2MWNjYzcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9o
ZWFwcy9jbWFfaGVhcC5jCisrKyBiL2RyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9jbWFfaGVhcC5jCkBA
IC0zMzksNiArMzM5LDcgQEAgc3RhdGljIGludCBjbWFfaGVhcF9hbGxvY2F0ZShzdHJ1Y3QgZG1h
X2hlYXAgKmhlYXAsCiAJYnVmZmVyLT5wYWdlY291bnQgPSBwYWdlY291bnQ7CiAKIAkvKiBjcmVh
dGUgdGhlIGRtYWJ1ZiAqLworCWV4cF9pbmZvLmV4cF9uYW1lID0gZG1hX2hlYXBfZ2V0X25hbWUo
aGVhcCk7CiAJZXhwX2luZm8ub3BzID0gJmNtYV9oZWFwX2J1Zl9vcHM7CiAJZXhwX2luZm8uc2l6
ZSA9IGJ1ZmZlci0+bGVuOwogCWV4cF9pbmZvLmZsYWdzID0gZmRfZmxhZ3M7CmRpZmYgLS1naXQg
YS9kcml2ZXJzL2RtYS1idWYvaGVhcHMvc3lzdGVtX2hlYXAuYyBiL2RyaXZlcnMvZG1hLWJ1Zi9o
ZWFwcy9zeXN0ZW1faGVhcC5jCmluZGV4IDE3ZTBlOWE2OGJhZi4uMmQ0YWZjNzljNzAwIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2RtYS1idWYvaGVhcHMvc3lzdGVtX2hlYXAuYworKysgYi9kcml2ZXJz
L2RtYS1idWYvaGVhcHMvc3lzdGVtX2hlYXAuYwpAQCAtMzg4LDYgKzM4OCw3IEBAIHN0YXRpYyBp
bnQgc3lzdGVtX2hlYXBfYWxsb2NhdGUoc3RydWN0IGRtYV9oZWFwICpoZWFwLAogCX0KIAogCS8q
IGNyZWF0ZSB0aGUgZG1hYnVmICovCisJZXhwX2luZm8uZXhwX25hbWUgPSBkbWFfaGVhcF9nZXRf
bmFtZShoZWFwKTsKIAlleHBfaW5mby5vcHMgPSAmc3lzdGVtX2hlYXBfYnVmX29wczsKIAlleHBf
aW5mby5zaXplID0gYnVmZmVyLT5sZW47CiAJZXhwX2luZm8uZmxhZ3MgPSBmZF9mbGFnczsKLS0g
CjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
