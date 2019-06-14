Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD3A467DD
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 20:51:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B02DD89B11;
	Fri, 14 Jun 2019 18:51:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56FA589B11;
 Fri, 14 Jun 2019 18:51:15 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id n4so3598183wrs.3;
 Fri, 14 Jun 2019 11:51:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=TwsuP/5QpBpyw+894FkICl68mr19hbmwJDtOpUhHp38=;
 b=lkHJSWNZGpaqihzpcziHwjixVMUvRJ0A52yFaLVQIaf2HlNjT++QDUR397MQZbfvlT
 68S4+PA7qAW7jdzupHt78eRODCxOuW32OH8q9w5t3g2HHHbCHOpYwftfhOiscOzkMKNj
 gUbGgsE225NQ4uCwHSrjQUaEspYlg6wFt1+FDEkPIjTauuR8T+H4UgPGUSr+aK2PwL0N
 MBNsKNIYuDsSu0yhRxXHsJI3szHcGXiDxTu360EYLIQ9z7ezK61hg/Cbca0Ejp9WSi0E
 ebw7209Zma+BK8eR9Lq/ZwAJWWHg00tBk3R4Pj2f+pxjL2P4j+WnvGRuYnbOlayivxWM
 IsWA==
X-Gm-Message-State: APjAAAXS8yffXqHGW0PvkZSnS0myHafZq/7PyztM8n694wfjhqXnxEvQ
 kSF9DCo/FXxmO2mDjWBCL8ONrgbR
X-Google-Smtp-Source: APXvYqz28bIDeaYBfPgupDqxKtdLyXRvsj0tCGO/2NqJFDkP1DqXrqASNNCznmEFJdwF1A4VtB2Aqg==
X-Received: by 2002:adf:e2c7:: with SMTP id d7mr10305574wrj.272.1560538273929; 
 Fri, 14 Jun 2019 11:51:13 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id r4sm584930wra.96.2019.06.14.11.51.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Jun 2019 11:51:13 -0700 (PDT)
Subject: Re: [PATCH 3/6] drm/gem: use new ww_mutex_(un)lock_for_each macros
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Peter Zijlstra <peterz@infradead.org>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>, Qiang Yu
 <yuq825@gmail.com>, "Anholt, Eric" <eric@anholt.net>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 lima@lists.freedesktop.org
References: <20190614124125.124181-1-christian.koenig@amd.com>
 <20190614124125.124181-4-christian.koenig@amd.com>
 <20190614131916.GQ3436@hirez.programming.kicks-ass.net>
 <20190614152242.GC23020@phenom.ffwll.local>
 <094da0f7-a0f0-9ed4-d2da-8c6e6d165380@gmail.com>
 <CAKMK7uFcDCJ9sozny1RqqRATwcK39doZNq+NZekvrzuO63ap-Q@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <d97212dc-367c-28e9-6961-9b99110a4d2e@gmail.com>
Date: Fri, 14 Jun 2019 20:51:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uFcDCJ9sozny1RqqRATwcK39doZNq+NZekvrzuO63ap-Q@mail.gmail.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=TwsuP/5QpBpyw+894FkICl68mr19hbmwJDtOpUhHp38=;
 b=eHN1sCz3W2HTRU7bY4U0Qo31XyxAGdDIGeVU0H3BQa3VmHEmxCdG5Sfx+qwxSwdk6o
 kDaqfroDELkJHWYJMYMCqJTVNHXUNYpWwzBVQmbQjAZeGN9MGFYSdcy6TGbmvL885SIm
 mpwm93e4a4mutIMsuS7/vbvrRZFR6dhZCy0yZ/v8Rnct7mIrb3mhtXVYHs4YJ3OL75OS
 6dxYdzLxvja+X44d8HGx6bj/vqUT/vmAjoLUE2Cd2jFufxhXQwXYJqNvFaq+do9ekxal
 uGK6BnU8q5zlVin8s9e0gspC7CgrdU85QCMNInHjsla8YPLlhRLcDpRBrIBVz4PEC296
 2Vfw==
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

QW0gMTQuMDYuMTkgdW0gMjA6MjQgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+Cj4gT24gRnJpLCBK
dW4gMTQsIDIwMTkgYXQgODoxMCBQTSBDaHJpc3RpYW4gS8O2bmlnIDxja29lbmlnLmxlaWNodHp1
bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4+IFtTTklQXQo+PiBXV19NVVRFWF9MT0NLX0JFR0lO
KCkKPj4KPj4gbG9jayhscnVfbG9jayk7Cj4+Cj4+IHdoaWxlIChibyA9IGxpc3RfZmlyc3QobHJ1
KSkgewo+PiAJaWYgKGtyZWZfZ2V0X3VubGVzc196ZXJvKGJvKSkgewo+PiAJCXVubG9jayhscnVf
bG9jayk7Cj4+IAkJV1dfTVVURVhfTE9DSyhiby0+d3dfbXV0ZXgpOwo+PiAJCWxvY2sobHJ1X2xv
Y2spOwo+PiAJfSBlbHNlIHsKPj4gCQkvKiBibyBpcyBnZXR0aW5nIGZyZWVkLCBzdGVhbCBpdCBm
cm9tIHRoZSBmcmVlaW5nIHByb2Nlc3MKPj4gCQkgKiBvciBqdXN0IGlnbm9yZSAqLwo+PiAJfQo+
PiB9Cj4+IHVubG9jayhscnVfbG9jaykKPj4KPj4gV1dfTVVURVhfTE9DS19FTkQ7CgpBaCwgbm93
IEkga25vdyB3aGF0IHlvdSBtZWFuLiBBbmQgTk8sIHRoYXQgYXBwcm9hY2ggZG9lc24ndCB3b3Jr
LgoKU2VlIGZvciB0aGUgY29ycmVjdCB3d19tdXRleCBkYW5jZSB3ZSBuZWVkIHRvIHVzZSB0aGUg
aXRlcmF0b3IgbXVsdGlwbGUgCnRpbWVzLgoKT25jZSB0byBnaXZlIHVzIHRoZSBCT3Mgd2hpY2gg
bmVlZHMgdG8gYmUgbG9ja2VkIGFuZCBhbm90aGVyIHRpbWUgdG8gCmdpdmUgdXMgdGhlIEJPcyB3
aGljaCBuZWVkcyB0byBiZSB1bmxvY2tlZCBpbiBjYXNlIG9mIGEgY29udGVudGlvbi4KClRoYXQg
d29uJ3Qgd29yayB3aXRoIHRoZSBhcHByb2FjaCB5b3Ugc3VnZ2VzdCBoZXJlLgoKUmVnYXJkcywK
Q2hyaXN0aWFuLgoKPgo+Cj4gQWxzbyBJIHRoaW5rIGlmIHdlIGFsbG93IHRoaXMgd2UgY291bGQg
cGVyaGFwcyB1c2UgdGhpcyB0byBpbXBsZW1lbnQgdGhlCj4gbW9kZXNldCBtYWNyb3MgdG9vLgo+
IC1EYW5pZWwKPgo+Cj4KPgo+Pj4gVGhpcyBpcyBraW5kYSB3aGF0IHdlIHdlbnQgd2l0aCBmb3Ig
bW9kZXNldCBsb2NrcyB3aXRoCj4+PiBEUk1fTU9ERVNFVF9MT0NLX0FMTF9CRUdJTi9FTkQsIHlv
dSBjYW4gZ3JhYiBtb3JlIGxvY2tzIGluIGJldHdlZW4gdGhlCj4+PiBwYWlyIGF0IGxlYXN0LiBC
dXQgaXQncyBhIGxvdCBtb3JlIGxpbWl0ZWQgdXNlLWNhc2VzLCBtYXliZSB0b28gZnJhZ2lsZSBh
bgo+Pj4gaWRlYSBmb3Igd3dfbXV0ZXggaW4gZnVsbCBnZW5lcmFsaXR5Lgo+Pj4KPj4+IE5vdCBn
b2luZyB0byB0eXBlIHRoaXMgb3V0IGJlY2F1c2UgdG9vIG11Y2ggdy9lIG1vZGUgaGVyZSBhbHJl
YWR5LCBidXQgSQo+Pj4gY2FuIGdpdmUgaXQgYSBzdGFiIG5leHQgd2Vlay4KPj4+IC1EYW5pZWwK
Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gZHJp
LWRldmVsIG1haWxpbmcgbGlzdAo+PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+
IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
