Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F9363185
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 09:03:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F119289B65;
	Tue,  9 Jul 2019 07:02:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 787FF89E06;
 Mon,  8 Jul 2019 15:02:59 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id m10so14862409edv.6;
 Mon, 08 Jul 2019 08:02:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ReYLa8THvYygLIMuMww1npiIyJn+z8O5eLERg05TxLo=;
 b=pAq65G3EfoT9oQfhXoBo1/wm809KLoSdfpB+ch9dLgLOKnAmUKI/37jbLzQAxIkG5a
 BLqwzExXxavEfTVbLXfRcIbQ4jYZtc5v6v3eidoZVRQRXEjk17+26FVvQx42gzLvio4O
 l57kRL3SaRMpSWrPKx2xO1IzQ39uZJN39wfc2Ru1I0d84cunitVC6PLfW5syZQCz3hq/
 IzXsc/MTjxw/BeB9iWgVaTQlmcX+1rN9o8kssj06CTAtyWvLOOYE2uKP+4y67fp2Mh34
 gN6sg2ZY94nf/cMv3eE9qHUrvgLvc8dRpkanRvZMpyP7ynvTlsSf32CW5pyKgETn2ODA
 fylQ==
X-Gm-Message-State: APjAAAUzcWVRKeFrlzw7jIenRXLDcUJV2X4JtGO7HRezXj+Lxvs6Bcpz
 lsQFxAQeBbcYGd5XHLSnTnI=
X-Google-Smtp-Source: APXvYqz5PyyErTzOCG114M0gE89vrP4oMgOAjm1oJ9lZL8Sh1Wv96cphR6rttUBJkwL11m1mMwIDCw==
X-Received: by 2002:a50:aa7c:: with SMTP id p57mr20601951edc.179.1562598177936; 
 Mon, 08 Jul 2019 08:02:57 -0700 (PDT)
Received: from archlinux-epyc ([2a01:4f9:2b:2b15::2])
 by smtp.gmail.com with ESMTPSA id a6sm5425241eds.19.2019.07.08.08.02.56
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 08 Jul 2019 08:02:57 -0700 (PDT)
Date: Mon, 8 Jul 2019 08:02:55 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [1/2] drm/amd/powerplay: smu_v11_0: fix uninitialized variable use
Message-ID: <20190708150255.GA32266@archlinux-epyc>
References: <20190708140816.1334640-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190708140816.1334640-1-arnd@arndb.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Tue, 09 Jul 2019 07:01:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ReYLa8THvYygLIMuMww1npiIyJn+z8O5eLERg05TxLo=;
 b=A9aA4vJcOv8CTIvKmXM6kq35C/loFJT19B7b2TukXUKPT6njRUK1RmmhZTEqsdS3qj
 B/aeEn9/YcXxeIJj1htl+z5PO/UQiWeLNwxBtYB8t5EW3A60vRrhG8ZU2cHIs256H2hu
 nE+QmPOhOh4rGjUOqtPM1iGrK6XbqsUvSn+DEYqY664YddVYLLg/Xb2WRlojeTg3w1UF
 6xe370Hd4Bqnhom1jefZdABzOE8G5EtDcQNhXhGwEw1tuMyLHy3oHacGt0mlEkODy1Yi
 4gnYr4mkNmvaT5+I/YF3IwvhgCvXT4ZnfERrQYPAViMcuGfT7sIloPJB9HElHTMx3KBh
 iz/w==
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
Cc: Chengming Gui <Jack.Gui@amd.com>, David Airlie <airlied@linux.ie>,
 Kevin Wang <kevin1.wang@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Huang Rui <ray.huang@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Likun Gao <Likun.Gao@amd.com>, Evan Quan <evan.quan@amd.com>,
 Rex Zhu <rex.zhu@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMDgsIDIwMTkgYXQgMDQ6MDc6NThQTSArMDIwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBBIG1pc3Rha2UgaW4gdGhlIGVycm9yIGhhbmRsaW5nIGNhdXNlZCBhbiB1bmluaXRp
YWxpemVkCj4gdmFyaWFibGUgdG8gYmUgdXNlZDoKPiAKPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS8uLi9wb3dlcnBsYXkvc211X3YxMV8wLmM6MTEwMjoxMDogZXJyb3I6IHZhcmlhYmxlICdm
cmVxJyBpcyB1c2VkIHVuaW5pdGlhbGl6ZWQgd2hlbmV2ZXIgJz86JyBjb25kaXRpb24gaXMgZmFs
c2UgWy1XZXJyb3IsLVdzb21ldGltZXMtdW5pbml0aWFsaXplZF0KPiAgICAgICAgICAgICAgICAg
cmV0ID0gIHNtdV9nZXRfY3VycmVudF9jbGtfZnJlcV9ieV90YWJsZShzbXUsIGNsa19pZCwgJmZy
ZXEpOwo+ICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8u
Li9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaDo4ODA6Mzogbm90ZTogZXhwYW5kZWQgZnJvbSBt
YWNybyAnc211X2dldF9jdXJyZW50X2Nsa19mcmVxX2J5X3RhYmxlJwo+ICAgICAgICAgKChzbXUp
LT5wcHRfZnVuY3MtPmdldF9jdXJyZW50X2Nsa19mcmVxX2J5X3RhYmxlID8gKHNtdSktPnBwdF9m
dW5jcy0+Z2V0X2N1cnJlbnRfY2xrX2ZyZXFfYnlfdGFibGUoKHNtdSksIChjbGtfdHlwZSksICh2
YWx1ZSkpIDogMCkKPiAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fgo+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL3Bvd2VycGxheS9z
bXVfdjExXzAuYzoxMTE0OjI6IG5vdGU6IHVuaW5pdGlhbGl6ZWQgdXNlIG9jY3VycyBoZXJlCj4g
ICAgICAgICBmcmVxICo9IDEwMDsKPiAgICAgICAgIF5+fn4KPiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS8uLi9wb3dlcnBsYXkvc211X3YxMV8wLmM6MTEwMjoxMDogbm90ZTogcmVtb3ZlIHRo
ZSAnPzonIGlmIGl0cyBjb25kaXRpb24gaXMgYWx3YXlzIHRydWUKPiAgICAgICAgICAgICAgICAg
cmV0ID0gIHNtdV9nZXRfY3VycmVudF9jbGtfZnJlcV9ieV90YWJsZShzbXUsIGNsa19pZCwgJmZy
ZXEpOwo+ICAgICAgICAgICAgICAgICAgICAgICAgXgo+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1Ly4uL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oOjg4MDozOiBub3RlOiBleHBhbmRlZCBm
cm9tIG1hY3JvICdzbXVfZ2V0X2N1cnJlbnRfY2xrX2ZyZXFfYnlfdGFibGUnCj4gICAgICAgICAo
KHNtdSktPnBwdF9mdW5jcy0+Z2V0X2N1cnJlbnRfY2xrX2ZyZXFfYnlfdGFibGUgPyAoc211KS0+
cHB0X2Z1bmNzLT5nZXRfY3VycmVudF9jbGtfZnJlcV9ieV90YWJsZSgoc211KSwgKGNsa190eXBl
KSwgKHZhbHVlKSkgOiAwKQo+ICAgICAgICAgIF4KPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS8uLi9wb3dlcnBsYXkvc211X3YxMV8wLmM6MTA5NToxNTogbm90ZTogaW5pdGlhbGl6ZSB0aGUg
dmFyaWFibGUgJ2ZyZXEnIHRvIHNpbGVuY2UgdGhpcyB3YXJuaW5nCj4gICAgICAgICB1aW50MzJf
dCBmcmVxOwo+ICAgICAgICAgICAgICAgICAgICAgIF4KPiAgICAgICAgICAgICAgICAgICAgICAg
PSAwCj4gCj4gQmFpbCBvdXQgb2Ygc211X3YxMV8wX2dldF9jdXJyZW50X2Nsa19mcmVxKCkgYmVm
b3JlIHdlIGdldCB0aGVyZS4KPiAKPiBGaXhlczogZTM2MTgyNDkwZGVjICgiZHJtL2FtZC9wb3dl
cnBsYXk6IGZpeCBkcG0gZnJlcSB1bml0IGVycm9yICgxMEtIeiAtPiBNaHopIikKPiBTaWduZWQt
b2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+IC0tLQo+ICBkcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYyB8IDYgKysrKy0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMKPiBpbmRleCBjM2Y5NzE0ZTkwNDcuLmJkODlhMTNi
NjY3OSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjEx
XzAuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jCj4g
QEAgLTEwOTksOSArMTA5OSwxMSBAQCBzdGF0aWMgaW50IHNtdV92MTFfMF9nZXRfY3VycmVudF9j
bGtfZnJlcShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKPiAgCQlyZXR1cm4gLUVJTlZBTDsKPiAg
Cj4gIAkvKiBpZiBkb24ndCBoYXMgR2V0RHBtQ2xvY2tGcmVxIE1lc3NhZ2UsIHRyeSBnZXQgY3Vy
cmVudCBjbG9jayBieSBTbXVNZXRyaWNzX3QgKi8KPiAtCWlmIChzbXVfbXNnX2dldF9pbmRleChz
bXUsIFNNVV9NU0dfR2V0RHBtQ2xvY2tGcmVxKSA9PSAwKQo+ICsJaWYgKHNtdV9tc2dfZ2V0X2lu
ZGV4KHNtdSwgU01VX01TR19HZXREcG1DbG9ja0ZyZXEpID09IDApIHsKPiAgCQlyZXQgPSAgc211
X2dldF9jdXJyZW50X2Nsa19mcmVxX2J5X3RhYmxlKHNtdSwgY2xrX2lkLCAmZnJlcSk7Cj4gLQll
bHNlIHsKPiArCQlpZiAocmV0KQo+ICsJCQlyZXR1cm4gcmV0OwoKSSBhbSBraW5kIG9mIHN1cnBy
aXNlZCB0aGF0IHRoaXMgZml4ZXMgdGhlIHdhcm5pbmcuIElmIEkgYW0gaW50ZXJwcmV0aW5nCnRo
ZSB3YXJuaW5nIGNvcnJlY3RseSwgaXQgaXMgY29tcGxhaW5pbmcgdGhhdCB0aGUgbWVtYmVyCmdl
dF9jdXJyZW50X2Nsa19mcmVxX2J5X3RhYmxlIGNvdWxkIGJlIE5VTEwgYW5kIG5vdCBiZSBjYWxs
ZWQgdG8KaW5pdGlhbGl6ZSBmcmVxIGFuZCB0aGF0IGVudGlyZSBzdGF0ZW1lbnQgd2lsbCBiZWNv
bWUgMC4gSWYgdGhhdCBpcyB0aGUKY2FzZSwgaXQgc2VlbXMgbGlrZSB0aGlzIGFkZGVkIGVycm9y
IGhhbmRsaW5nIHdvbid0IGZpeCB0aGF0IHByb2JsZW0sCnJpZ2h0PwoKQ2hlZXJzLApOYXRoYW4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
