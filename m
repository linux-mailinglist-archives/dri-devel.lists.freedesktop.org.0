Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC8F27969
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2019 11:39:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6DA989D63;
	Thu, 23 May 2019 09:39:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C341189D5B;
 Thu, 23 May 2019 09:39:15 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id t7so5173084wrr.10;
 Thu, 23 May 2019 02:39:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=DoOr2nma1Cu5of5cf4LqOlDL0kI3MdQwjk6E58aq3Bg=;
 b=CHZGUSHYvCS14Sdd/uenfM+QcJJ6tsMtvcJAPEU6TqqtBRSndE6ILf6nMWwmkIwYc3
 Dp8IDrhMEaC1bHECk/rSU1hLqJ4w+uKevQjq3scoWfwuzs4uE5t1RXpJNNm/2LIxr0sZ
 SphpfuJJa/q7FcjD56LEuyRmrxFMQvyI5GsCmqcGK8/Fk+1s//ONYZgea5wjG07UrGLI
 4S86sBrjZnlW/zxxOswvQotNxaLSZmVa4uqcCoaykl8wWB98UBZurm38SfljHPKwBIzO
 UOXVFxxCq0TNfCic7HNVwerGVRnR0U8iTlRnzMdIuXlQvp2ZXevxkc/knvP+Y9toS9vO
 vmzQ==
X-Gm-Message-State: APjAAAVrU1ioKK8FYARJSn0JZwWt3BLnfh2L+VgheZMbpc5d69I9AHsK
 HqFIUSoqh9RnH35Y0DyBpdFyjG/4
X-Google-Smtp-Source: APXvYqwwszOd4puuLG6jPTdBfm7ewUjZAnOU43yj5+L/hL+N9sIo4FgdFYWIiozQGCR4T9Ib5CRbvg==
X-Received: by 2002:adf:db8e:: with SMTP id u14mr19187341wri.190.1558604354405; 
 Thu, 23 May 2019 02:39:14 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id n3sm149173wrt.44.2019.05.23.02.39.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 23 May 2019 02:39:13 -0700 (PDT)
Subject: Re: [PATCH 01/10] drm/ttm: Make LRU removal optional.
To: zhoucm1 <zhoucm1@amd.com>, Marek.Olsak@amd.com, David1.Zhou@amd.com,
 Prike.Liang@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20190522125947.4592-1-christian.koenig@amd.com>
 <fbb023f9-28e7-2ac8-994f-e262da597098@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <7ab46454-17c1-c293-6215-e865798ffaa0@gmail.com>
Date: Thu, 23 May 2019 11:39:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <fbb023f9-28e7-2ac8-994f-e262da597098@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=DoOr2nma1Cu5of5cf4LqOlDL0kI3MdQwjk6E58aq3Bg=;
 b=loUg5zyXY6XvuBCgYbQ1mY9olv7CBeIuo29lGIpi6N/8hSiQP0xZ66/Iis5tXkSC54
 o0mkpQ221Fh1maKd/UQsWY30iIEJWwSva1V9dfeTgwwYASdsYS3ND5Uu7ALoK0Wtp7Vy
 cVdGwFbcBc3fWVMqf0U4Sejm4evJgAVJQfDFgpO0YFHyRPl43IRbIqRjlZz3CZKyNdAA
 CnO3pV+bYzkMEmN1ooK1R1yi54EPuBYVbOR054uPK4c+DM1JDEprfNxx7j64N/hOvS/D
 sGwaQSUfU8DS4m4tiuV9GQa0pM8r9g7lbjHLiftpRDSTTLn1U2SzDJYPz1esAUDWq+By
 71ig==
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
Reply-To: christian.koenig@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjMuMDUuMTkgdW0gMTE6MTUgc2NocmllYiB6aG91Y20xOgo+IE9uIDIwMTnlubQwNeaciDIy
5pelIDIwOjU5LCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+PiBbU05JUF0KPj4gQEAgLTIwMyw3
ICsyMDQsMTAgQEAgdm9pZCB0dG1fZXVfZmVuY2VfYnVmZmVyX29iamVjdHMoc3RydWN0IAo+PiB3
d19hY3F1aXJlX2N0eCAqdGlja2V0LAo+PiByZXNlcnZhdGlvbl9vYmplY3RfYWRkX3NoYXJlZF9m
ZW5jZShiby0+cmVzdiwgZmVuY2UpOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBlbHNlCj4+IHJlc2VydmF0aW9uX29iamVjdF9hZGRfZXhjbF9mZW5jZShiby0+cmVzdiwgZmVu
Y2UpOwo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0dG1fYm9fYWRkX3RvX2xydShi
byk7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChsaXN0X2VtcHR5KCZiby0+
bHJ1KSkKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHR0
bV9ib19hZGRfdG9fbHJ1KGJvKTsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZWxz
ZQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdHRtX2Jv
X21vdmVfdG9fbHJ1X3RhaWwoYm8sIE5VTEwpOwo+IGNhbiB0dG1fYm9fbW92ZV90b19scnVfdGFp
bCBiZSBtb3ZlZCB0byB0dG1fZXVfcmVzZXJ2ZV9idWZmZXJzIHdoZW4gCj4gZGVsX2xydSBpcyBm
YWxzZT8KCk5vLCB0aGF0IHdvbid0IHdvcmsuCgpUaGUgQk8gbWlnaHQgaGF2ZSBtb3ZlZCB0byBh
bm90aGVyIGRvbWFpbiBhbmQgd2hlbiB3ZSBoYXZlIHRoZSAKdHRtX2JvX21vdmVfdG9fbHJ1X3Rh
aWwoKSBpbiB0aGUgcmVzZXJ2YXRpb24gd2Ugd29uJ3QgYmUgaGFuZGxpbmcgdGhpcyAKY29ycmVj
dGx5LgoKQ2hyaXN0aWFuLgoKPgo+IC1EYXZpZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
