Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 972F62FB508
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 10:47:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8E726E07D;
	Tue, 19 Jan 2021 09:46:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 627366E07D
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 09:46:58 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id b21so11895224edy.6
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 01:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=knYHysr88c4/TWe82gygyIRvNinfSQv9W9jGZvmbheg=;
 b=F0aVGzGUQigXZWR5zVdpACnob/1MitNbwwVbuM/5Zvg6oHnmx7FLWtSqEB0eyRWBbc
 WsiWp5FYsHfA8HS3I6GcpkpLsPEBjGlnPLEDOPi95TAJduWZbcoAbUDPNHWmVwmgkx5S
 1LGw3Pabt6Z1Vg+K3q7X4hvVoqTazaWezyL9Hrrub/SVnsZXeB6iAPI8v9Q9MOVNaPiN
 HMA5AzSYMXnI9RqvEFMqn1TQWlN0r8wMhDbuxWRjkrbpWX+BJqIEYmH8DdT9LDHcqyhA
 eSYkPFWvnx70WK20WKixyCK3BpXa0TIPXT/YWBMEkudIbAlE6w3uae4dQbwXDQ5UBxud
 s3Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=knYHysr88c4/TWe82gygyIRvNinfSQv9W9jGZvmbheg=;
 b=b1yTD5SRYxqbVRSp3OJozEWO8zuy14NO+0EVZyL0bVsLtnNEV3HC3yk9tXj9V7vizG
 AUHBdLEasAdTfAsvE4jIWFKOgoEmdgsTBLIuYoBHfk+C5KsNAYHqx2ewY6IuaOlfjruD
 cpMyuHjzDWCHQQa1Ri8Cg1odCXxyxSS7MZESpHMDI3lOswL4E8mdouWbhYISPKzP5z73
 pOVCjbnfE89LANl1w1D37nJN88hSL/liG/ziqYcZb1we1XpjiiT10etyjGVRRj8CtuvM
 4zgCzzHYNc/UlFsX1d7snW9Co8xFvdAo2Dn+4qPYi3N0AWq0g1mPBp+VyiYLo2tNah+k
 2yvA==
X-Gm-Message-State: AOAM5302GQxz02uCXrwhzuXB2ls6CoUmPcItvHfZM5eA+ZRNnpxty4xt
 /BJbqZFONthBqTN1nlEv7xs=
X-Google-Smtp-Source: ABdhPJysagZzJn3NDuTWpGm9ePU1dBi+ffgcRmCMaz7tEzNScBUc49fSIrYI/svjRZncmLv+Jd78pw==
X-Received: by 2002:a05:6402:30a7:: with SMTP id
 df7mr2590354edb.108.1611049616996; 
 Tue, 19 Jan 2021 01:46:56 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id m26sm5472279ejr.54.2021.01.19.01.46.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 01:46:56 -0800 (PST)
Subject: Re: [PATCH] drm/syncobj: make lockdep complain on WAIT_FOR_SUBMIT v2
To: Peter Zijlstra <peterz@infradead.org>
References: <20210118180334.43714-1-christian.koenig@amd.com>
 <20210118180334.43714-2-christian.koenig@amd.com>
 <YAan6haGjnIlNIoJ@hirez.programming.kicks-ass.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <019f2342-9d64-f6c6-d03d-0ab8ddce101d@gmail.com>
Date: Tue, 19 Jan 2021 10:46:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YAan6haGjnIlNIoJ@hirez.programming.kicks-ass.net>
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
Cc: mingo@redhat.com, will@kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTkuMDEuMjEgdW0gMTA6MzUgc2NocmllYiBQZXRlciBaaWpsc3RyYToKPiBPbiBNb24sIEph
biAxOCwgMjAyMSBhdCAwNzowMzozNFBNICswMTAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+
Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYyBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fc3luY29iai5jCj4+IGluZGV4IDZlNzRlNjc0NWVjYS4uZjUxNDU4NjE1MTU4
IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYwo+PiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYwo+PiBAQCAtMzg3LDYgKzM4NywxMyBAQCBpbnQg
ZHJtX3N5bmNvYmpfZmluZF9mZW5jZShzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGVfcHJpdmF0ZSwKPj4g
ICAJaWYgKCFzeW5jb2JqKQo+PiAgIAkJcmV0dXJuIC1FTk9FTlQ7Cj4+ICAgCj4+ICsJLyogV2Fp
dGluZyBmb3IgdXNlcnNwYWNlIHdpdGggbG9ja3MgaGVscCBpcyBpbGxlZ2FsIGNhdXNlIHRoYXQg
Y2FuCj4+ICsJICogdHJpdmlhbCBkZWFkbG9jayB3aXRoIHBhZ2UgZmF1bHRzIGZvciBleGFtcGxl
LiBNYWtlIGxvY2tkZXAgY29tcGxhaW4KPj4gKwkgKiBhYm91dCBpdCBlYXJseSBvbi4KPj4gKwkg
Ki8KPiBFZ2FkcywgdGhlIGN1cnNlZCBjb21tZW50IHN0eWxlIGlzIHNwcmVhZGluZyA6Lwo+Cj4+
ICsJaWYgKGZsYWdzICYgRFJNX1NZTkNPQkpfV0FJVF9GTEFHU19XQUlUX0ZPUl9TVUJNSVQpCj4+
ICsJCWxvY2tkZXBfYXNzZXJ0X25vbmVfaGVsZF9vbmNlKCk7Cj4+ICsKPiBTaG91bGQgdGhpcyBu
b3QgYmUgcGFydCBvZiBkcm1fc3luY29ial9mZW5jZV9hZGRfd2FpdCgpIGluc3RlYWQ/Cgpkcm1f
c3luY29ial9mZW5jZV9hZGRfd2FpdCgpIGlzIG9ubHkgY2FsbGVkIHdoZW4gdGhlIHByZXZpb3Vz
IHRyeSBvZiAKZmluZGluZyB0aGUgZmVuY2Ugd2Fzbid0IHN1Y2Nlc3NmdWxseS4KCklmIHdlIHdh
bnQgdG8gY2hlY2sgZHJpdmVycyBmb3Igc3R1cGlkIGJlaGF2aW9yIGZvciB0aGUgdW5jb21tb24g
d2FpdCAKYmVmb3JlIHNpZ25hbCBjYXNlIHdlIG5lZWQgdGhpcyBtdWNoIGVhcmxpZXIuCgpCdXQg
SSdtIGdvaW5nIHRvIGRvdWJsZSBjaGVjayBpZiBkcm1fc3luY29ial9mZW5jZV9hZGRfd2FpdCgp
IGlzbid0IHVzZWQgCmVsc2V3aGVyZSBhcyB3ZWxsLgoKPiBBbHNvLCBkbyB5b3Ugd2FudCB0byBz
cHJpbmtsZSBtaWdodF9zbGVlcCgpIGFyb3VuZCA/CgpHb29kIHBvaW50LiBHb2luZyB0byBhZGQg
dGhhdCBhcyB3ZWxsLgoKVGhhbmtzLApDaHJpc3RpYW4uCgo+Cj4+ICAgCSpmZW5jZSA9IGRybV9z
eW5jb2JqX2ZlbmNlX2dldChzeW5jb2JqKTsKPj4gICAJZHJtX3N5bmNvYmpfcHV0KHN5bmNvYmop
Owo+PiAgIAo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9sb2NrZGVwLmggYi9pbmNsdWRl
L2xpbnV4L2xvY2tkZXAuaAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
