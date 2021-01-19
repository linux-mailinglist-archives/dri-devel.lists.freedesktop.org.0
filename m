Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F30C2FB50C
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 10:51:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56A3C6E07D;
	Tue, 19 Jan 2021 09:50:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 904056E071;
 Tue, 19 Jan 2021 09:50:55 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id 6so27606917ejz.5;
 Tue, 19 Jan 2021 01:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=gLALa7FHrTT7IKlQ89bUqbeuGcG7FbKju853I0Jh4S0=;
 b=OMIRC3vG8aOR8RhvWbk13fwMM/tA/RUGIDWwMC+d6Lu3MfrJGnKc1MIf9L1NwQNL10
 0J4W2i1ZzvS2Frfqw0Rzbz4QmfypwzofRRTHCv//NQ56SvE3c/DHgMnKS/8tR6oSQ6Wi
 jMqQHhwPt7NWl7gZrWoUrcK0GheXypYoIJs47Gb9v6UkZTPy/voVCtxo32PhLy9JGXL0
 PF1y0bf53wtV8KFspnErhKZBbRB2nUaQeGqVaPRNX5SNugluxY1fIeIDae85Y21itu69
 a1zHqIQuMOGnYoYxFlSMKN27M4E7S6C92YIb3OWWNDpowKMMxLF0L/YQuG9NtBytHsBT
 BG6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:from:to:cc:references
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=gLALa7FHrTT7IKlQ89bUqbeuGcG7FbKju853I0Jh4S0=;
 b=g7pTJZ5gPt8s+RmOjTUG5QwxSh/pH/Ozwp5pA1epnQSgUFIDcr8DgBznsHE9jltqls
 T0O7W/qwMKv7WVI/WZzK3dzaPUq98tnIcP9stBro/8JLmMrUfLlBgLQafw0CWyV+jSRr
 I7VCsk+d0Ecgts1nqGMpfp/50SBimHXGR+osUTzVkjZHL/iDhm9OQi+LadaRuEEf0pTj
 ziHO45eXfcAxex4lHPTYlYWmVBE3M2D8zJMOEgKyIZmYPTU46DKHUztuPlSfZtKeZhlZ
 9/52UmOsRF8Pu2gBRpfsRGOtZGN2RWf9rJJYoUQYj+w6vSCNqbVY1GRGidVmZRY5jfDv
 aj2g==
X-Gm-Message-State: AOAM5314in+Q47LgKtyf/pe3Q0fL57gL7Yem2xf9Y8d/p7rfi8XZH2MX
 0+AI913KFLorWo/yo4B15y0=
X-Google-Smtp-Source: ABdhPJz/MsX3CNiEUS0AyZv6CU0WlK/toHxNCoxh8LKmVBez1svdODXmSFvSLs1osw124LoWonqZrg==
X-Received: by 2002:a17:906:8611:: with SMTP id
 o17mr2427794ejx.145.1611049854299; 
 Tue, 19 Jan 2021 01:50:54 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id f13sm10467613ejf.42.2021.01.19.01.50.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 01:50:53 -0800 (PST)
Subject: Re: [PATCH v4 04/14] drm/sched: Cancel and flush all oustatdning jobs
 before finish.
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, robh@kernel.org, l.stach@pengutronix.de,
 yuq825@gmail.com, eric@anholt.net
References: <1611003683-3534-1-git-send-email-andrey.grodzovsky@amd.com>
 <1611003683-3534-5-git-send-email-andrey.grodzovsky@amd.com>
 <667cef85-a7e9-fba5-132a-5fb57d7e8b62@gmail.com>
Message-ID: <98192b24-47fe-3b02-97e2-5f33495814fb@gmail.com>
Date: Tue, 19 Jan 2021 10:50:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <667cef85-a7e9-fba5-132a-5fb57d7e8b62@gmail.com>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkZWQgYSBDQzogc3RhYmxlIHRhZyBhbmQgcHVzaGVkIGl0LgoKVGhhbmtzLApDaHJpc3RpYW4u
CgpBbSAxOS4wMS4yMSB1bSAwOTo0MiBzY2hyaWViIENocmlzdGlhbiBLw7ZuaWc6Cj4gVGhpcyBp
cyBhIGJ1ZyBmaXggYW5kIHNob3VsZCBwcm9iYWJseSBiZSBwdXNoZWQgc2VwYXJhdGVseSB0byAK
PiBkcm0tbWlzYy1uZXh0Lgo+Cj4gQ2hyaXN0aWFuLgo+Cj4gQW0gMTguMDEuMjEgdW0gMjI6MDEg
c2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPj4gVG8gYXZvaWQgYW55IHBvc3NpYmxlIHVzZSBh
ZnRlciBmcmVlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5
Lmdyb2R6b3Zza3lAYW1kLmNvbT4KPj4gUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNo
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPj4gLS0tCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9zY2hl
ZHVsZXIvc2NoZWRfbWFpbi5jIHwgMyArKysKPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hl
ZF9tYWluLmMgCj4+IGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMKPj4g
aW5kZXggOTk3YWExNS4uOTI2MzdiNyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Nj
aGVkdWxlci9zY2hlZF9tYWluLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9z
Y2hlZF9tYWluLmMKPj4gQEAgLTg5OSw2ICs4OTksOSBAQCB2b2lkIGRybV9zY2hlZF9maW5pKHN0
cnVjdCBkcm1fZ3B1X3NjaGVkdWxlciAqc2NoZWQpCj4+IMKgwqDCoMKgwqAgaWYgKHNjaGVkLT50
aHJlYWQpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBrdGhyZWFkX3N0b3Aoc2NoZWQtPnRocmVhZCk7
Cj4+IMKgICvCoMKgwqAgLyogQ29uZmlybSBubyB3b3JrIGxlZnQgYmVoaW5kIGFjY2Vzc2luZyBk
ZXZpY2Ugc3RydWN0dXJlcyAqLwo+PiArwqDCoMKgIGNhbmNlbF9kZWxheWVkX3dvcmtfc3luYygm
c2NoZWQtPndvcmtfdGRyKTsKPj4gKwo+PiDCoMKgwqDCoMKgIHNjaGVkLT5yZWFkeSA9IGZhbHNl
Owo+PiDCoCB9Cj4+IMKgIEVYUE9SVF9TWU1CT0woZHJtX3NjaGVkX2ZpbmkpOwo+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
