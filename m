Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB12680FA
	for <lists+dri-devel@lfdr.de>; Sun, 14 Jul 2019 21:16:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 479CA89875;
	Sun, 14 Jul 2019 19:16:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3FEC89AC9
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jul 2019 18:57:35 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id h10so12395378ljg.0
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jul 2019 11:57:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1DMwibKvZCBQwsKwsGLbs45A3tB2NhY6KAKu789sECM=;
 b=YaWr6OmyG1RvdnRvxdlL03cGIdInjlamZjsxPcH7jE7T91fSJL8SVs+p0GWyARHPLn
 MqBmd2aU9/lMlUeW9TC23m7G0hyNOS0+8RZiJqQjtXTreLmOxI5rOlB3OxxlllnKBbFL
 F2o3qrjUs1jX0rSQihoGr7qvD1rh/h4R5DjtJmA3LdVvvwrAy2rqG7m3XRp5M9rF58xl
 PRP6/rLgbQ6a62F/CMaM4RpZuR6Ev3UbxYOsPd40/thobV85kejUsJ+38w5EaFeXF4xb
 ofih3iHyX3a5igZ1wk2tAEL4QOu+ixh1rZ3onDxGbGZp5zc5Di5axQxcIeTnXiPf+Mtc
 20aA==
X-Gm-Message-State: APjAAAXAnl1JQPROYv0bNlqim7eCUhsVOQXOxlOFJ1dlZVTTu+L7MOSo
 RxuVAbihSnqdPS0w6Q+LhLA=
X-Google-Smtp-Source: APXvYqxNyzCSv/eKGElqM9iJwmHCu1kHSKZrRaq3BPn3cU5K7rbOFEc1UQgFYqjoELx45FF79WpqhA==
X-Received: by 2002:a2e:25a:: with SMTP id 87mr9505577ljc.183.1563044254326;
 Sat, 13 Jul 2019 11:57:34 -0700 (PDT)
Received: from [192.168.2.145] (ppp79-139-233-208.pppoe.spdop.ru.
 [79.139.233.208])
 by smtp.googlemail.com with ESMTPSA id u13sm1584252lfi.4.2019.07.13.11.57.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 13 Jul 2019 11:57:33 -0700 (PDT)
Subject: Re: [PATCH v1] drm/modes: Don't apply cmdline's rotation if it wasn't
 specified
To: Maxime Ripard <maxime.ripard@bootlin.com>
References: <20190711021313.29445-1-digetx@gmail.com>
 <20190712195429.dlz5ofwoafciedcq@flea>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <11723cfd-12d2-5810-70df-0e053352d648@gmail.com>
Date: Sat, 13 Jul 2019 21:57:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190712195429.dlz5ofwoafciedcq@flea>
Content-Language: en-US
X-Mailman-Approved-At: Sun, 14 Jul 2019 19:16:04 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1DMwibKvZCBQwsKwsGLbs45A3tB2NhY6KAKu789sECM=;
 b=Z7ZiMI/B+AwP5+Nu0a832zRw3pILi8bsCjFiZhmXOQARtYiTVtULJtVw6q7ipCIMq6
 XtxCiPVtXBIs8T+FJCxJTCSdA6V/SfcDCeNOYS0ykYfMvxDFjOI8l47xMeEmrvdPcSIg
 rGfMQ6488rOfJlGGM4a3qXGg/PVQjyLjsYg9m2G9Cwf12Ja1KoZmZEYDG9cqqjTfwOh0
 HD6dptz1al1/mm3MpL8ftA/zDzCw5OMxCr8SqNi8yNHpUqnemwx6ZxsFeeWpdnA1w+8Q
 xhJgFGHhaZ5fMF9szwe/sPYi55lOMi+t3pJ/yAIIuiRAH2wFkLRxBKHNq9XuFqv4q4ZK
 4j2w==
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTIuMDcuMjAxOSAyMjo1NCwgTWF4aW1lIFJpcGFyZCDQv9C40YjQtdGCOgo+IE9uIFRodSwgSnVs
IDExLCAyMDE5IGF0IDA1OjEzOjEzQU0gKzAzMDAsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4g
VGhlIHJvdGF0aW9uIG1vZGUgZnJvbSBjbWRsaW5lIHNob3VsZG4ndCBiZSB0YWtlbiBpbnRvIGFj
Y291bnQgaWYgaXQKPj4gd2Fzbid0IHNwZWNpZmllZCBpbiB0aGUgY21kbGluZS4gVGhpcyBmaXhl
cyBpZ25vcmVkIGRlZmF1bHQgZGlzcGxheQo+PiBvcmllbnRhdGlvbiB3aGVuIGRpc3BsYXkgbW9k
ZSBpcyBnaXZlbiB1c2luZyBjbWRsaW5lIHdpdGhvdXQgdGhlCj4+IHJvdGF0aW9uIGJlaW5nIHNw
ZWNpZmllZC4KPj4KPj4gRml4ZXM6IDFiZjRlMDkyMjdjMyAoImRybS9tb2RlczogQWxsb3cgdG8g
c3BlY2lmeSByb3RhdGlvbiBhbmQgcmVmbGVjdGlvbiBvbiB0aGUgY29tbWFuZGxpbmUiKQo+PiBT
aWduZWQtb2ZmLWJ5OiBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5jb20+Cj4gCj4gQWNr
ZWQtYnk6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+Cj4gCj4gVGhh
bmtzIQo+IE1heGltZQoKVGhhbmsgeW91LiBQbGVhc2Ugbm90ZSB0aGF0IEknbSBub3QgYSBEUk0g
bWFpbnRhaW5lciwgaGVuY2UgZWl0aGVyIHlvdQpzaG91bGQgcGljayB1cCBhbmQgYXBwbHkgdGhl
IHBhdGNoIGJ5IHlvdXJzZWxmIG9yIHNvbWVib2R5IGVsc2Ugd2hvIGhhcwp0aGUgY29tbWl0IHJp
Z2h0cyB3aWxsIGhhdmUgZG8gdGhhdC4gSSBndWVzcyBUaGllcnJ5IGNvdWxkIGFsc28gcGljayB1
cAp0aGUgcGF0Y2ggaW50byB0aGUgVGVncmEncyB0cmVlLCBidXQgdGhpcyBwYXRjaCBpcyBtb3Jl
IERSTS1nZW5lcmljLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
