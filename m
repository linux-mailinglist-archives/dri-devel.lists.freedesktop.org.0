Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A66D72EAE
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 14:21:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A66686E4FB;
	Wed, 24 Jul 2019 12:21:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3368289FA9
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 11:29:33 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id x25so44204914ljh.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 04:29:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=28ujsUDRYTGiHQoWOiE7oDtm2ZKyW6ds67/AR1tB5C0=;
 b=M5pIB2Q95YerRl8C+5TR+K5+fHjS+qZo2ZDOM3vRgAcUhE7m4S50eaDLbd1biKVi7N
 RMq/BsPqE2kBfk0BsSXo8kNQQ2inTJ04VJKUswIw6mOT8SEWhnXZqyClP76dBHuZ/7Du
 8M33HixRtTmWRF+yzV5um8zwFLOd2E6u6xsaTXgnEEKcNGjiteIE69WPAJiBqrf1RLrM
 LL9V4iMqP4d8N2Xpprav9GuD+UfYEjKu73nB3VjKsFHlzm96yUQlTv9Yd/JREP0F9YFS
 +tC9ry54duiHhvhFxU/mdtm4ErvD6Za8MsfykSZMpVEMPxINGsa1VYIFhGJKHmUJOsD/
 6tqA==
X-Gm-Message-State: APjAAAWG8+JwbE7r8E4uv6g1O4scbrQBEi1C+/Uu4VX/Q7j7W1insMbL
 ZbX0x4tXlPAkeEw5//iu95zkQVX5
X-Google-Smtp-Source: APXvYqyUmgToDevHLGoMl6YaetUuYHM/g8qZL5bpUTSXO6p9lG58UfclhclSAdZpdn8sd/q1R4siVg==
X-Received: by 2002:a2e:2b01:: with SMTP id q1mr41734898lje.27.1563967771562; 
 Wed, 24 Jul 2019 04:29:31 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-220-99.pppoe.mtu-net.ru.
 [91.78.220.99])
 by smtp.googlemail.com with ESMTPSA id h22sm8608824ljj.105.2019.07.24.04.29.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Jul 2019 04:29:30 -0700 (PDT)
Subject: Re: [PATCH v3] drm/tegra: sor: Enable HDA interrupts at plug-in
To: Jon Hunter <jonathanh@nvidia.com>, Viswanath L <viswanathl@nvidia.com>,
 thierry.reding@gmail.com
References: <1563885610-27198-1-git-send-email-viswanathl@nvidia.com>
 <0ba35efb-44ec-d56c-b559-59f1daa3e6e4@gmail.com>
 <8b113ad7-07b4-7dfb-e2e5-653514686085@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <341b9177-180c-8fc1-f9cc-27f3b48a8b9c@gmail.com>
Date: Wed, 24 Jul 2019 14:29:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <8b113ad7-07b4-7dfb-e2e5-653514686085@nvidia.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 24 Jul 2019 12:20:46 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=28ujsUDRYTGiHQoWOiE7oDtm2ZKyW6ds67/AR1tB5C0=;
 b=M5gMtoA0itRtKd2wtHXfYhVwV5ZvA6LEcHrhp5oda7Cyn1YOO78nDV+YLavLAKiEno
 a/DCzgysJx57P89LWLuPyZ4G4eRF5OTpVbSR06ccL4uJNHZAmvKpUaBcT3XfKMK0nAvX
 DqhQw5bsSYLnV+BJ0Zb91PxHJfV4TwXIa9lDiU8seil20xwBNQzwxHqzvmwdJZyWtqJK
 yJkyuPr4S4KG9b+WBsk888SlooS7q1wSE8DaTNQGuZcH9hVO41VzWH6yKwXHiVog9Djg
 djRX2LAX5mOxQ8rvd+sG1+hXkbg4hSdMBDl6TWTOL6i0JoCu+NVVnh4WbVz0vUcLMqvD
 JYTA==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjQuMDcuMjAxOSAxNDoxMSwgSm9uIEh1bnRlciDQv9C40YjQtdGCOgo+IAo+IE9uIDI0LzA3LzIw
MTkgMTA6MjcsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4gMjMuMDcuMjAxOSAxNTo0MCwgVmlz
d2FuYXRoIEwg0L/QuNGI0LXRgjoKPj4+IEhETUkgcGx1Z291dCBjYWxscyBydW50aW1lIHN1c3Bl
bmQsIHdoaWNoIGNsZWFycyBpbnRlcnJ1cHQgcmVnaXN0ZXJzCj4+PiBhbmQgY2F1c2VzIGF1ZGlv
IGZ1bmN0aW9uYWxpdHkgdG8gYnJlYWsgb24gc3Vic2VxdWVudCBwbHVnLWluOyBzZXR0aW5nCj4+
PiBpbnRlcnJ1cHQgcmVnaXN0ZXJzIGluIHNvcl9hdWRpb19wcmVwYXJlKCkgc29sdmVzIHRoZSBp
c3N1ZS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBWaXN3YW5hdGggTCA8dmlzd2FuYXRobEBudmlk
aWEuY29tPgo+Pgo+PiBZb3VycyBzaWduZWQtb2ZmLWJ5IGFsd2F5cyBzaG91bGQgYmUgdGhlIGxh
c3QgbGluZSBvZiB0aGUgY29tbWl0J3MKPj4gbWVzc2FnZSBiZWNhdXNlIHRoZSB0ZXh0IGJlbG93
IGl0IGJlbG9uZ3MgdG8gYSBwZXJzb24gd2hvIGFwcGxpZXMgdGhpcwo+PiBwYXRjaCwgVGhpZXJy
eSBpbiB0aGlzIGNhc2UuIFRoaXMgaXMgbm90IGEgYmlnIGRlYWwgYXQgYWxsIGFuZCBUaGllcnJ5
Cj4+IGNvdWxkIG1ha2UgYSBmaXh1cCB3aGlsZSBhcHBseWluZyB0aGUgcGF0Y2ggaWYgd2lsbCBk
ZWVtIHRoYXQgYXMgbmVjZXNzYXJ5Lgo+Pgo+PiBTZWNvbmRseSwgdGhlcmUgaXMgbm8gbmVlZCB0
byBhZGQgInN0YWJsZUB2Z2VyLmtlcm5lbC5vcmciIHRvIHRoZQo+PiBlbWFpbCdzIHJlY2lwaWVu
dHMgYmVjYXVzZSB0aGUgcGF0Y2ggd2lsbCBmbG93IGludG8gc3RhYmxlIGtlcm5lbAo+PiB2ZXJz
aW9ucyBmcm9tIHRoZSBtYWlubGluZSBvbmNlIGl0IHdpbGwgZ2V0IGFwcGxpZWQuIFRoYXQgaGFw
cGVucyBiYXNlZAo+PiBvbiB0aGUgc3RhYmxlIHRhZyBwcmVzZW5jZSwgaGVuY2UgaXQncyBlbm91
Z2ggdG8gYWRkIHRoZSAnQ2MnIHRhZyB0byB0aGUKPj4gY29tbWl0J3MgbWVzc2FnZSBpbiBvcmRl
ciB0byBnZXQgcGF0Y2ggYmFja3BvcnRlZC4KPiAKPiBJIGJlbGlldmUgJ2dpdCBzZW5kLWVtYWls
JyBhdXRvbWF0aWNhbGx5IGRvZXMgdGhpcy4KCkluZGVlZCwgY29tcGxldGVseSBmb3Jnb3QgdGhh
dCBJIGhhdmUgJy0tc3VwcHJlc3MtY2M9YWxsJyBpbiBteSBnaXQncyBzZXR1cC4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
