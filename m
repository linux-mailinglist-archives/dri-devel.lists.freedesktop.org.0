Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BF3337A66
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 18:06:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49DB76EA8A;
	Thu, 11 Mar 2021 17:06:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7622B6EA96
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 17:06:16 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id k9so40933428lfo.12
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 09:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PrdT1wQhy9IxbC6XumdouIDu0exhn3fHS2Os4khyfHU=;
 b=GMmSyrJfRU2L+dVXxXLx/8DqgviBZWz3HocHK7mj8r0efL5mxrYP0ppCFBnHBbxBGW
 U5o4ywGa8IIOH0Nz8MMgkoToZdddhZzlHLxxtQfnE29QrbN+OQKozJsL8xemqDgrrSCt
 BmC2kkjgTNn6jm7DqIUnMd0cl9OK0QFNTnY8EjAAmT43cIFRTts/SbLcWkBr//0YnciY
 kzBlmt89Y5M1gpGHpZk1ugljriB5kQWwZGUPj4k/iKWenQSOQw4D3HdjUf0MoEHwO2sq
 Lpuu74Hp3cQmRUPkl0LzDbswMDfJdRQK74ls9YHOyT2gKsDwNsW8kHB6efsFXdSSWmyB
 JkVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PrdT1wQhy9IxbC6XumdouIDu0exhn3fHS2Os4khyfHU=;
 b=ZJuKno3srj8wofL9fWuuaP3Po6KtBoyQ8GlyIjN6hUXkzqroXp6B8FRhc/Mpt11Tfo
 C27tWRuDesHFC4JvQMN7WAh+88DEeWDqBvLQ9GyutqVWc48rl2D0I/eqMiAfBwzSSvCZ
 oCYEAHboM/wcTlPmQRF7QJULZTLcybj/HPdxSpdy+DC/zVjqQ+LxLp6evE3xzmmdFICk
 lAf8q6fVHT6DHbbMukTUdMqdtLGSWDRgyfnCw/6sssyn9KAuejXwSOMq2MHaTctqoxcd
 t4KrKVCg8vKkuMmMXd+iIEpCdhMV4xXPHOmN9wpTZ9UhUzHVY2JJkyXsQ1FsOIeYDf7K
 YIyw==
X-Gm-Message-State: AOAM533Ny19YkB5+0xTe7jcz5iII5CKDQNaX9otozt096vowt0HCDOOe
 nnXx4CD2k9TsOCqX3WpUxa4=
X-Google-Smtp-Source: ABdhPJwrJiFcYr+8LThGxa9P1GY6Znhfa3CkzooW8UnHgQLBu8SQXV3ps13DVvhLzlk92OR4brVbJA==
X-Received: by 2002:ac2:46d6:: with SMTP id p22mr2744651lfo.625.1615482374798; 
 Thu, 11 Mar 2021 09:06:14 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.gmail.com with ESMTPSA id p5sm1166009ljj.26.2021.03.11.09.06.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 09:06:14 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Matt Merhar <mattmerhar@protonmail.com>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>
Subject: [PATCH v14 0/2] Add memory bandwidth management to NVIDIA Tegra DRM
 driver
Date: Thu, 11 Mar 2021 20:06:04 +0300
Message-Id: <20210311170606.7543-1-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBzZXJpZXMgYWRkcyBtZW1vcnkgYmFuZHdpZHRoIG1hbmFnZW1lbnQgdG8gdGhlIE5WSURJ
QSBUZWdyYSBEUk0gZHJpdmVyLAp3aGljaCBpcyBkb25lIHVzaW5nIGludGVyY29ubmVjdCBmcmFt
ZXdvcmsuIEl0IGZpeGVzIGRpc3BsYXkgY29ycnVwdGlvbiB0aGF0CmhhcHBlbnMgZHVlIHRvIGlu
c3VmZmljaWVudCBtZW1vcnkgYmFuZHdpZHRoLgoKQ2hhbmdlbG9nOgoKdjE0OiAtIE1hZGUgaW1w
cm92ZW1lbnRzIHRoYXQgd2VyZSBzdWdnZXN0ZWQgYnkgTWljaGHFgiBNaXJvc8WCYXcgdG8gdjEz
OgoKICAgICAgIC0gQ2hhbmdlZCAndW5zaWduZWQgaW50JyB0byAnYm9vbCcuCiAgICAgICAtIFJl
bmFtZWQgZnVuY3Rpb25zIHdoaWNoIGNhbGN1bGF0ZSBiYW5kd2lkdGggc3RhdGUuCiAgICAgICAt
IFJld29ya2VkIGNvbW1lbnQgaW4gdGhlIGNvZGUgdGhhdCBleHBsYWlucyB3aHkgZG93bnNjYWxl
ZCBwbGFuZQogICAgICAgICByZXF1aXJlIGhpZ2hlciBiYW5kd2lkdGguCiAgICAgICAtIEFkZGVk
IHJvdW5kLXVwIHRvIGJhbmR3aWR0aCBjYWxjdWxhdGlvbi4KICAgICAgIC0gQWRkZWQgc2FuaXR5
IGNoZWNrcyBvZiB0aGUgcGxhbmUgaW5kZXggYW5kIGZpeGVkIG91dC1vZi1ib3VuZHMKICAgICAg
ICAgYWNjZXNzIHdoaWNoIGhhcHBlbmVkIG9uIFQxMjQgZHVlIHRvIHRoZSBjdXJzb3IgcGxhbmUg
aW5kZXguCgp2MTM6IC0gTm8gY29kZSBjaGFuZ2VzLiBQYXRjaGVzIG1pc3NlZCB2NS4xMiwgcmUt
c2VuZGluZyB0aGVtIGZvciB2NS4xMy4KCkRtaXRyeSBPc2lwZW5rbyAoMik6CiAgZHJtL3RlZ3Jh
OiBkYzogU3VwcG9ydCBtZW1vcnkgYmFuZHdpZHRoIG1hbmFnZW1lbnQKICBkcm0vdGVncmE6IGRj
OiBFeHRlbmQgZGVidWcgc3RhdHMgd2l0aCB0b3RhbCBudW1iZXIgb2YgZXZlbnRzCgogZHJpdmVy
cy9ncHUvZHJtL3RlZ3JhL0tjb25maWcgfCAgIDEgKwogZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2Rj
LmMgICAgfCAzNjIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogZHJpdmVycy9n
cHUvZHJtL3RlZ3JhL2RjLmggICAgfCAgMTkgKysKIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcm0u
YyAgIHwgIDE0ICsrCiBkcml2ZXJzL2dwdS9kcm0vdGVncmEvaHViLmMgICB8ICAgMyArCiBkcml2
ZXJzL2dwdS9kcm0vdGVncmEvcGxhbmUuYyB8IDEyNyArKysrKysrKysrKysKIGRyaXZlcnMvZ3B1
L2RybS90ZWdyYS9wbGFuZS5oIHwgIDE1ICsrCiA3IGZpbGVzIGNoYW5nZWQsIDU0MSBpbnNlcnRp
b25zKCspCgotLSAKMi4yOS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
