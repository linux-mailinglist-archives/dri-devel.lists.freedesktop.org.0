Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF7CAE716
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 11:36:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFC0F6E82C;
	Tue, 10 Sep 2019 09:36:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 586D66E82C
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2019 09:36:14 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BF577C065121
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2019 09:36:13 +0000 (UTC)
Received: by mail-wr1-f71.google.com with SMTP id h6so6258206wrh.6
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2019 02:36:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n8YH5XkWfkWGWuHfyUDOYVmK/+fDxvvoaV0+60in29s=;
 b=cXDX8mQ9XAL5hpYg1W+TWNzOw2UxF0CfU1yGLw2VqgO6GiBicYaiakzWPEVqIJAcbn
 7+0GoOMBUPFdfvr994949j6DKwTizi4M2fGMwoC4o4me11T509IjsNIhPRGUpEP+wc/O
 UbbJ/4AZEoOI/b49KH3k5sCmrGkpPegG2N6toUccidi0Cuake19MwGaQ0J5s9hJH0Vud
 fzDztIyt9Z6Nd7+l8xqBVXxHlCTip0BP1S9iIOMc77fzhOt5Nj+jGrhRzpQa0XfDROk1
 jPm9v+IPDNydu1eFBbYMYJNl7C0Vsvwg56Z7Krkt8WDaKHptuE96kYLD6wE/32d/uOz/
 NXBQ==
X-Gm-Message-State: APjAAAV1AIoOo2zXACikxf3oZqyOwvyNjjUAbrObuKBLuxHoB4nakgr9
 Qy69FyVgDt4lxD/XOCM/dBqEn4p5Zes48Bnc9k03vTPdp8YDMUIgNwtxuORZzufsz4cJUbAdmyU
 svKSQn1PG+Pq3MFpnk6FKWkb4Sn4r
X-Received: by 2002:adf:d4c5:: with SMTP id w5mr24608336wrk.280.1568108172587; 
 Tue, 10 Sep 2019 02:36:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqypxdPkfsyaOk23EjSKN6j0B/UYFSShdWr24f+bWIas3139XwYA6Bswy33vXcHyy18ZcjrGbw==
X-Received: by 2002:adf:d4c5:: with SMTP id w5mr24608318wrk.280.1568108172447; 
 Tue, 10 Sep 2019 02:36:12 -0700 (PDT)
Received: from localhost.localdomain ([148.69.85.38])
 by smtp.gmail.com with ESMTPSA id w19sm1997200wmi.12.2019.09.10.02.36.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2019 02:36:11 -0700 (PDT)
Subject: Re: [PATCH] drm/radeon: Bail earlier when radeon.cik_/si_support=0 is
 passed
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>
References: <20190907203238.232005-1-hdegoede@redhat.com>
 <22da19aa-0ab4-ab48-ab70-037ec41c2f87@daenzer.net>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <3c0eb318-6c30-fc98-4005-80b5c00b8f5e@redhat.com>
Date: Tue, 10 Sep 2019 10:36:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <22da19aa-0ab4-ab48-ab70-037ec41c2f87@daenzer.net>
Content-Language: en-US
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
Cc: David Airlie <airlied@linux.ie>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiA5LzEwLzE5IDk6NTAgQU0sIE1pY2hlbCBEw6RuemVyIHdyb3RlOgo+IE9uIDIwMTkt
MDktMDcgMTA6MzIgcC5tLiwgSGFucyBkZSBHb2VkZSB3cm90ZToKPj4gQmFpbCBmcm9tIHRoZSBw
Y2lfZHJpdmVyIHByb2JlIGZ1bmN0aW9uIGluc3RlYWQgb2YgZnJvbSB0aGUgZHJtX2RyaXZlcgo+
PiBsb2FkIGZ1bmN0aW9uLgo+Pgo+PiBUaGlzIGF2b2lkIC9kZXYvZHJpL2NhcmQwIHRlbXBvcmFy
aWx5IGdldHRpbmcgcmVnaXN0ZXJlZCBhbmQgdGhlbgo+PiB1bnJlZ2lzdGVyZWQgYWdhaW4sIHNl
bmRpbmcgdW53YW50ZWQgYWRkIC8gcmVtb3ZlIHVkZXYgZXZlbnRzIHRvCj4+IHVzZXJzcGFjZS4K
Pj4KPj4gU3BlY2lmaWNhbGx5IHRoaXMgYXZvaWRzIHRyaWdnZXJpbmcgdGhlICh1c2Vyc3BhY2Up
IGJ1ZyBmaXhlZCBieSB0aGlzCj4+IHBseW1vdXRoIG1lcmdlLXJlcXVlc3Q6Cj4+IGh0dHBzOi8v
Z2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9wbHltb3V0aC9wbHltb3V0aC9tZXJnZV9yZXF1ZXN0cy81
OQo+Pgo+PiBOb3RlIHRoYXQgZGVzcGl0ZSB0aGF0IGJlaW5nIGFuIHVzZXJzcGFjZSBidWcsIG5v
dCBzZW5kaW5nIHVubmVjZXNzYXJ5Cj4+IHVkZXYgZXZlbnRzIGlzIGEgZ29vZCBpZGVhIGluIGdl
bmVyYWwuCj4+Cj4+IEJ1Z0xpbms6IGh0dHBzOi8vYnVnemlsbGEucmVkaGF0LmNvbS9zaG93X2J1
Zy5jZ2k/aWQ9MTQ5MDQ5MAo+PiBTaWduZWQtb2ZmLWJ5OiBIYW5zIGRlIEdvZWRlIDxoZGVnb2Vk
ZUByZWRoYXQuY29tPgo+IAo+IFJldmlld2VkLWJ5OiBNaWNoZWwgRMOkbnplciA8bWRhZW56ZXJA
cmVkaGF0LmNvbT4KClRoYW5rIHlvdSBmb3IgdGhlIHJldmlldy4gSSd2ZSBkcm0gcHVzaCByaWdo
dHMsIGJ1dCBJIGd1ZXNzIHRoYXQgcmFkZW9uL2FtZApHUFUgcGF0Y2hlcyBhcmUgY29sbGVjdGVk
IGJ5IHNvbWVvbmUgQEFNRCwgc28gSSBkbyBub3QgbmVlZCB0byAvIHNob3VsZCBub3QKcHVzaCB0
aGlzIG15c2VsZiwgcmlnaHQ/Cgo+IGFtZGdwdSBzaG91bGQgYmUgY2hhbmdlZCBjb3JyZXNwb25k
aW5nbHkgYXMgd2VsbC4KCkdvb2QgcG9pbnQuIEknbSBjdXJyZW50bHkgdHJhdmVsbGluZyAoQHBs
dW1iZXJzKSBJIGNhbiBkbyB0aGlzIHdoZW4gSSdtIGJhY2sgaG9tZSwKYnV0IGZlZWwgZnJlZSB0
byBiZWF0IG1lIHRvIGl0IChpZiB5b3UgZG8gcGxlYXNlIENjIG1lIHRvIGF2b2lkIGRvdWJsZSB3
b3JrKS4KClJlZ2FyZHMsCgpIYW5zCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
