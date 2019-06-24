Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1ED524B7
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 09:30:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD0B96E059;
	Tue, 25 Jun 2019 07:28:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C92F1899D6
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 12:55:07 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id q26so9972011lfc.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 05:55:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WNEPAJU0PKDjx+XnMY/T0wpxzKSr9Cr3EplpOoCn4Mg=;
 b=XSi24v2SPgYunA5VpVzeKp3TG/7AWrWqXTP7FBCQCPtjwHmCflOTgbWb2YWSzwomqx
 gDdyn6yPkoLDnATKPIH1cuqqRYnhxzpb4hkb2C+fvRbUigyh83u+a1TNiFqz7B+a+VbI
 m6/VmLhXTqEIGvGsHliLo5dcdkFMophfCNZ/DZbtMmwidEoH1J5JdD59zVd1o697zs9x
 O7TuWB42utdtTGzEvwsjPPpRC7fiTX1ECkrGBkM3j3SBB8F/3Z2zRn2VywMc3GwRiVg9
 JKW7EkM71R2VnpREpEKZM0emrjye/uiBPrzuP1PqRL4Od+EG8GH6nYkJ3nFaV/BFKHma
 RDbQ==
X-Gm-Message-State: APjAAAXtz/FLSXFkSTOt8TiocESQHaFvpaUEMoOkuQvaB7bnfDYBAj53
 x9ZfpqTlNspp+wrYx+GqVaM=
X-Google-Smtp-Source: APXvYqzSDGrndyCxLDg8GGelDuwS8V7x7tQBjK5jsA9NOeIRgsbr70QnRs0ab8nFHEci1xRTIgnoYA==
X-Received: by 2002:a19:ca0e:: with SMTP id a14mr20824806lfg.19.1561380906306; 
 Mon, 24 Jun 2019 05:55:06 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-197.pppoe.mtu-net.ru.
 [91.79.162.197])
 by smtp.googlemail.com with ESMTPSA id u13sm1568415lfl.61.2019.06.24.05.55.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Jun 2019 05:55:05 -0700 (PDT)
Subject: Re: [PATCH v1 1/3] gpu: host1x: Remove implicit IOMMU backing on
 client's registration
To: Christoph Hellwig <hch@infradead.org>
References: <20190623173743.24088-1-digetx@gmail.com>
 <20190624070413.GA23846@infradead.org>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e7ecff74-ef8e-fd7e-1be2-0f3c60abc6f8@gmail.com>
Date: Mon, 24 Jun 2019 15:55:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190624070413.GA23846@infradead.org>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 25 Jun 2019 07:27:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WNEPAJU0PKDjx+XnMY/T0wpxzKSr9Cr3EplpOoCn4Mg=;
 b=RO8plrW1jTvcIU9jaiUr7gbc5+mACH0QXHLY3czL8SgaIhkmOlLNLRThMiAUSqB5Ly
 8Z0H2FubYRIdzrxk5ZZKDi0MOMaGgn1Cy6DM5Tz5+bBIcstMxY7a0zn93hYlohOi0cx+
 dRaClftcITthbkuf+GMufHq115LKWsPXfIEUGwLbRij2EgfffrDvbyyJjL0tVAxcFR8E
 ABEkxVK/PMW83c2/h7KNA7UkXGfLNPIwfswHio2wX8A0cwQhFG882iRx/C0v6KbAzR8U
 +MFGbBVbfaGX2wbnqHofSk2s1nDCMO6eNmZ/C42BFo9Ak8BkTwY5yq9hUB6/b/pEabsk
 Tj3w==
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
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjQuMDYuMjAxOSAxMDowNCwgQ2hyaXN0b3BoIEhlbGx3aWcg0L/QuNGI0LXRgjoKPiBEb24ndCB3
ZSBoYXZlIGEgZGV2aWNlIHRyZWUgcHJvYmxlbSBoZXJlIGlmIHRoZXJlIGlzIGEgZG9tYWluIGNv
dmVyaW5nCj4gdGhlbT8gIEkgdGhvdWdoIHdlIHNob3VsZCBvbmx5IHBpY2sgdXAgYW4gSU9NTVUg
Zm9yIGEgZ2l2ZW4gZGV2aWNlCj4gaWYgRFQgZXhwbGljaXRseSBhc2tlZCBmb3IgdGhhdD8KPiAK
ClRoZXJlIGlzIG5vIHNwZWNpZmljIGRvbWFpbiB0aGF0ICJjb3ZlcmluZyB0aGVtIi4gVGhlIElP
TU1VIGRvbWFpbiBpcyBhbGxvY2F0ZWQKZHluYW1pY2FsbHkgZHVyaW5nIG9mIHRoZSBUZWdyYSBE
Uk0ncyBkcml2ZXIgaW5pdGlhbGl6YXRpb24gKHNlZSB0ZWdyYV9kcm1fbG9hZCkgYW5kCnRoZW4g
YWxsIG9mIERSTSBkZXZpY2VzIGFyZSBhdHRhY2hlZCB0byB0aGF0IGRvbWFpbiBvbmNlIGFsbCBv
ZiB0aGUgRFJNIHN1Yi1kcml2ZXJzCmFyZSBwcm9iZWQgc3VjY2Vzc2Z1bGx5LiBPbiBUZWdyYSBT
b0NzIGl0J3MgdXAgdG8gc29mdHdhcmUgKGRyaXZlcikgdG8gZGVjaWRlIGhvdyB0bwpzZXBhcmF0
ZSBoYXJkd2FyZSBkZXZpY2VzIGZyb20gZWFjaCBvdGhlciwgaW4gYSBjYXNlIG9mIERSTSB3ZSdy
ZSBwdXR0aW5nIGFsbCB0aGUKcmVsZXZhbnQgZ3JhcGhpY3MgZGV2aWNlcyBpbnRvIGEgc2luZ2xl
IGRvbWFpbi4gSXMgaXQgZXZlbiBwb3NzaWJsZSB0byBleHByZXNzIElPTU1VCmRvbWFpbiAobm90
IGdyb3VwISkgYXNzaWdubWVudHMgaW4gYSBkZXZpY2UtdHJlZT8KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
