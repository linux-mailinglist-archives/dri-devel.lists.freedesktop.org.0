Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E3F2FACF6
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 22:49:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DAE26E593;
	Mon, 18 Jan 2021 21:49:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B14726E593;
 Mon, 18 Jan 2021 21:49:49 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id 34so6956604otd.5;
 Mon, 18 Jan 2021 13:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=p9nGZMUHspJ8Gr+jRu3UsEJFq2sKV5whavJ8rCsMvxk=;
 b=GS+vtKCUne+eK/vtHUsXHBRNYFbLk3dtkHTlnaF9QOB/NxAmQ0xQSCMn3Lu2jG3hNM
 q9KboH4AUZk3CQy4BqPQwu5ThIj6yLOrpRm5PaqZyhhs7wSu9S0uTSPHdf5rCmC8A3An
 CEv3ISIO+7ZOf0LGbtU6LUOkBBA1V7P6Nqv77TWhdiBvgE+zMdOHVyPNFTk9F+zPjCQi
 hlxx8g6wh02UdsvmaMhuIZayJixdjH7/zWR9fzPi7JCUHUMBhQMbZRAjV+WlEICYKji0
 h8o035cDYesWDzcYuJRRqwnqvi34WHzNnMkOfx5Fd0NWn30lOYhOe2UywZIieEBF1TW8
 ZmVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=p9nGZMUHspJ8Gr+jRu3UsEJFq2sKV5whavJ8rCsMvxk=;
 b=GdT0YaCVi5trVtCErzpRaXZ2KmpvCKl9BFucoj1+/Z0kbn/MzNJwiBeeQD0qSJQwN+
 WaTIF6REUPnSBtwOpSgGjUEd2VrDqMrTWAnVptok8VVzNKkoBKVWTDAve+4YV9qn4TqY
 nlYldmqwmDDpy1XZi+w4twgE3i4ZT/+uS+DEvtwb4kb4JV+xKYA+g0jVgfZp5l6Z8KmJ
 WQxRC8p6ucGfabAjbfegeuiYRHgQYHIQlpRx7f807jWih4fh7gJHxrBpZr1Woo9cONwQ
 P/9wGqv71N5XT8yoYtgsC2QPZ0UL85faM5tNwYRdhnE7a6TzX0O3KlvTXdJ91d3eZqja
 WomA==
X-Gm-Message-State: AOAM531ejGBKCH5WD9a6iAtoE/AM9YMN5b6KYhO3iRMpBTpMEcQTDty6
 BE86EgZ1Yu5MNDM2O/0PC+oAcvaDyXqVkm2acrI=
X-Google-Smtp-Source: ABdhPJwhiwM8Chn49kJ1X7/M1GzIGqvCr9vjm2PyVKMo+aNIJbugA+mYaLYB2bDGSWicBdWb9eaJcz/oSLc6oUtq1ak=
X-Received: by 2002:a9d:75d4:: with SMTP id c20mr1147835otl.311.1611006589088; 
 Mon, 18 Jan 2021 13:49:49 -0800 (PST)
MIME-Version: 1.0
References: <1611003683-3534-1-git-send-email-andrey.grodzovsky@amd.com>
 <1611003683-3534-5-git-send-email-andrey.grodzovsky@amd.com>
In-Reply-To: <1611003683-3534-5-git-send-email-andrey.grodzovsky@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 18 Jan 2021 16:49:38 -0500
Message-ID: <CADnq5_M6X5zN2TN=K0ao9aXkgy5HF=v9v7WFr7M0vV_mih1EzA@mail.gmail.com>
Subject: Re: [PATCH v4 04/14] drm/sched: Cancel and flush all oustatdning jobs
 before finish.
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
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
Cc: Greg KH <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Qiang Yu <yuq825@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKYW4gMTgsIDIwMjEgYXQgNDowMiBQTSBBbmRyZXkgR3JvZHpvdnNreQo8YW5kcmV5
Lmdyb2R6b3Zza3lAYW1kLmNvbT4gd3JvdGU6Cj4KPiBUbyBhdm9pZCBhbnkgcG9zc2libGUgdXNl
IGFmdGVyIGZyZWUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5
Lmdyb2R6b3Zza3lAYW1kLmNvbT4KPiBSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKSW4gdGhlIHN1YmplY3Q6Cm91c3RhdGRuaW5nIC0+IG91
dHN0YW5kaW5nCgpBbGV4CgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hl
ZF9tYWluLmMgfCAzICsrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMgYi9kcml2
ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYwo+IGluZGV4IDk5N2FhMTUuLjkyNjM3
YjcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYwo+IEBAIC04OTks
NiArODk5LDkgQEAgdm9pZCBkcm1fc2NoZWRfZmluaShzdHJ1Y3QgZHJtX2dwdV9zY2hlZHVsZXIg
KnNjaGVkKQo+ICAgICAgICAgaWYgKHNjaGVkLT50aHJlYWQpCj4gICAgICAgICAgICAgICAgIGt0
aHJlYWRfc3RvcChzY2hlZC0+dGhyZWFkKTsKPgo+ICsgICAgICAgLyogQ29uZmlybSBubyB3b3Jr
IGxlZnQgYmVoaW5kIGFjY2Vzc2luZyBkZXZpY2Ugc3RydWN0dXJlcyAqLwo+ICsgICAgICAgY2Fu
Y2VsX2RlbGF5ZWRfd29ya19zeW5jKCZzY2hlZC0+d29ya190ZHIpOwo+ICsKPiAgICAgICAgIHNj
aGVkLT5yZWFkeSA9IGZhbHNlOwo+ICB9Cj4gIEVYUE9SVF9TWU1CT0woZHJtX3NjaGVkX2Zpbmkp
Owo+IC0tCj4gMi43LjQKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
