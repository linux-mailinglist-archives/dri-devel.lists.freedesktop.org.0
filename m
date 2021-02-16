Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 457C631CA9C
	for <lists+dri-devel@lfdr.de>; Tue, 16 Feb 2021 13:38:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDF0F89CF8;
	Tue, 16 Feb 2021 12:38:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ACCD89CF8
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Feb 2021 12:38:53 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id y10so7072921edt.12
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Feb 2021 04:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=rYWyFRrHFzIGgaDiLu+F+sbrD98rWH0OnsH9H9Q3MIc=;
 b=dr6Q2pOMBwUs3H3o/MaUvSXFms7CCjDCs+XTJNrWlYUIeVBvmDqKBGQukIjK/lpxxN
 7BwrmduOI3BW5xh3te0tgcXEEb50P3Fq4qql3XZokIErsf9RhIJDQIyUdf2cIrDAvIw7
 uHxvrkwKnKmpReV8XzaWWxszWSaNoQZZwv8Jj/MUTCrUjNPN2fY4gdzB0O29dOjBhNwO
 gAoKmkvCKMlZN98CknKrvj71fAIrBJk8EEPxWIi8BrkLbt+mAEJ7Uzcniv9ga5YHVia+
 8ytfpv6ll5ki/DxVQRFZp/B9olni93F5pweMveomNZOeChYj3votAzZvecKSVvPLbFYS
 Qspw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=rYWyFRrHFzIGgaDiLu+F+sbrD98rWH0OnsH9H9Q3MIc=;
 b=jdi1LTgW0jHYsryEtwSdB/kAMjn/mP1F/8sBi1pNXqPmrKGtyrC4BnaP1zzCxFHSWl
 i0d8kH0if3e0bFtdOWCQJ9nQcEmRSARPd37eZ+6IePXUqzu9MvitVMinMqz9PzZ8tANd
 KYobajc0EY/ovtwzAXOej7nDHqfMffKWLhSpRLwGW7VX60Yw6leXZSYznwGRUg3ZK7LU
 1fASE+BH984Bu6pD2f/sOCkYsrKQX2c88MfsMOTjGx9eA9y+r3NT0+ophEypwP4rBMaq
 kpWrWk4g3S8T2GxJpMamVSUTITIOLOYfKU+lo3yTFZnq/ginWQhSc9QlbMU90ID0B4A3
 3mxw==
X-Gm-Message-State: AOAM532Rm6tuUDYlgTG+tMoYU1fWZQDf7cbQXWy2632z6fi72K+W0jb6
 cinQyMW53Swkf38HhhV4E02ghW92jqLaCg==
X-Google-Smtp-Source: ABdhPJwSzVo9ApDpijh+Fal1wzJ3FaDQYCrP6d9W9hk9AyK3wyjmpbSm5MxU5BgyY4Jip3UVE/o0mw==
X-Received: by 2002:a50:ef0f:: with SMTP id m15mr21420162eds.175.1613479131778; 
 Tue, 16 Feb 2021 04:38:51 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:37ef:8eac:aaaa:2ece?
 ([2a02:908:1252:fb60:37ef:8eac:aaaa:2ece])
 by smtp.gmail.com with ESMTPSA id bo12sm13393547ejb.93.2021.02.16.04.38.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Feb 2021 04:38:51 -0800 (PST)
Subject: Re: [PATCH] mutex: nuke mutex_trylock_recursive
To: Peter Zijlstra <peterz@infradead.org>, mingo@redhat.com, will@kernel.org, 
 apw@canonical.com, joe@perches.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20210216082146.69286-1-christian.koenig@amd.com>
 <YCuQXAllh91JEZ+Y@phenom.ffwll.local>
 <YCuaup4u1ZE6crE0@hirez.programming.kicks-ass.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <e8374454-4c2b-b718-a0fc-0e25662c3f44@gmail.com>
Date: Tue, 16 Feb 2021 13:38:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YCuaup4u1ZE6crE0@hirez.programming.kicks-ass.net>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpBbSAxNi4wMi4yMSB1bSAxMToxMyBzY2hyaWViIFBldGVyIFppamxzdHJhOgo+IE9uIFR1ZSwg
RmViIDE2LCAyMDIxIGF0IDEwOjI5OjAwQU0gKzAxMDAsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4+
IE9uIFR1ZSwgRmViIDE2LCAyMDIxIGF0IDA5OjIxOjQ2QU0gKzAxMDAsIENocmlzdGlhbiBLw7Zu
aWcgd3JvdGU6Cj4+PiBUaGUgbGFzdCB1c2VyIHdlbnQgYXdheSBpbiB0aGUgNS4xMSBjeWNsZS4K
Pj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+Cj4+IE5pY2UuCj4+Cj4+IFJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWwudmV0dGVyQGZmd2xsLmNoPgo+Pgo+PiBJIHRoaW5rIHdvdWxkIGJlIGdvb2QgdG8gc3RpbGwg
c3R1ZmYgdGhpcyBpbnRvIDUuMTIgYmVmb3JlIHNvbWVvbmUKPj4gcmVzdXJyZWN0cyB0aGlzIHpv
bWJpZS4KPiBBbHJlYWR5IGRvbmU6Cj4KPiAgICBodHRwczovL2xrbWwua2VybmVsLm9yZy9yLzE2
MTI5NjU1NjUzMS4yMzMyNS4xMDQ3MzM1NTI1OTg0MTkwNjg3Ni50aXAtYm90MkB0aXAtYm90MgoK
T25lIGxlc3MgYmFkIGNvbmNlcHQgdG8gd29ycnkgYWJvdXQuCgpCdXQgeW91ciBwYXRjaCBpcyBt
aXNzaW5nIHRvIHJlbW92ZSB0aGUgY2hlY2twYXRjaC5wbCBjaGVjayBmb3IgdGhpcyA6KQoKQ2hl
ZXJzLApDaHJpc3RpYW4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
