Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0581C69B8
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 09:03:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBD616E82F;
	Wed,  6 May 2020 07:02:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBC476E28A
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 15:40:13 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id y6so1319681pjc.4
 for <dri-devel@lists.freedesktop.org>; Tue, 05 May 2020 08:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bSFaPsY9Q06ol7z3I9i5NZy6Mx1BYRJOSiQQ/ADJ9Gg=;
 b=N+27bzh+IMZfcRnh55NZgeIVBEml3gus4hp7iFUF6zcjpxNRyptB9OdCDWaJewid8l
 zzggysGdilyS219iat2RsDVXdStYATE8skmp1BvkxX5T9jRUe2HsvL7E8uFvItikAObz
 b9gwPB/r+co6aVYZdf0ShOVytK37AWhko/qoZYFNboprhcDhWsLbd8cCM/IIjsTSpz0l
 f0N33fSctiP/mSHFqqUFrW/2BkUX+VQR/hx6ChD1Nv4YIqbI+uTvDE1JGGvhyFc4EI5/
 crIBcVXx9W3f0frtN+DBlHtDkiDZWz/viDcRZu+ychATsekTG9x5kHtynjiBy6DeCqjM
 owQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bSFaPsY9Q06ol7z3I9i5NZy6Mx1BYRJOSiQQ/ADJ9Gg=;
 b=WZN92LmmTZynlym2xcAtwAIkXZGW1dboDPfdt75g5CLJlWtSCLYNOSUgDZjG54SbZX
 CXlbPNpcytPs8u4Br7U6p8f21rN7TXZP8kruSA0Erl6k3v7s3pJe0hOgw/ure+gJVeKk
 DaYzGKxkZv9i4+qgsJV7mFFJXU1AN8Mi8/yok3lxD4cm3I/pqjx22aOoFGjHwy+5N0T8
 DwBPQ1u2nwyYbtxqe1J755tLHkfLSk/uPhbcuOp4v8hFXg90WxiGOUHwxTmK9xccsCf3
 qOQSmg3LFVCNPZdtfsNIQ+TwtVOM3bVPM7cDcitkepy4RgTALZC71yWx3bLeJTHHiUQ3
 G5QQ==
X-Gm-Message-State: AGi0PuaFrSEjYT8uSeVgqFGtg/klmtpn8RHdmQnK21ofT+SRjbv7FUKN
 IwVWg66/PI2gpVzHhsob4avC2DtxalPkuo0K2a51uw==
X-Google-Smtp-Source: APiQypJk7WFBLwQNHlWpEpX+GDFUCZgtHUU8RxuEIsH3h6aMqRYcSuecN1kdds/zND2KUHypdFOJyiF/OToVqwLaK+A=
X-Received: by 2002:a17:90a:8c85:: with SMTP id
 b5mr3737036pjo.187.1588693212806; 
 Tue, 05 May 2020 08:40:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200505141606.837164-1-arnd@arndb.de>
 <e4a852b2-807b-bc73-7328-bcc399341085@amd.com>
In-Reply-To: <e4a852b2-807b-bc73-7328-bcc399341085@amd.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 5 May 2020 08:39:59 -0700
Message-ID: <CAKwvOd=JLsksy5adE_rnRKetqAMcSFsJPHXVsidOP9RPo+YpCA@mail.gmail.com>
Subject: Re: [PATCH] amdgpu: fix integer overflow on 32-bit architectures
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Arnd Bergmann <arnd@arndb.de>
X-Mailman-Approved-At: Wed, 06 May 2020 07:02:40 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Kent Russell <kent.russell@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Nathan Chancellor <natechancellor@gmail.com>, Evan Quan <evan.quan@amd.com>,
 Monk Liu <Monk.Liu@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2VlIGFsc28gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC9DQURucTVfTmR0Wmg1X1JHRFdL
SjljXzQyWEx2cm5jQ3M1RERVMVlTcHRmWlA5NEtYa1FAbWFpbC5nbWFpbC5jb20vVC8jbWU3MDdl
MDllOTJjNmU0ODcyODVlOGJiMzgyYTYwN2U0ZTc4MmMyNDkKCk9uIFR1ZSwgTWF5IDUsIDIwMjAg
YXQgNzoxNyBBTSBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+IHdy
b3RlOgo+Cj4gQW0gMDUuMDUuMjAgdW0gMTY6MTUgc2NocmllYiBBcm5kIEJlcmdtYW5uOgo+ID4g
TXVsdGlwbHlpbmcgMTAwMDAwMDAwMCBieSBmb3VyIG92ZXJydW5zIGEgJ2xvbmcnIHZhcmlhYmxl
LCBhcyBjbGFuZwo+ID4gcG9pbnRzIG91dDoKPiA+Cj4gPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZGV2aWNlLmM6NDE2MDo1MzogZXJyb3I6IG92ZXJmbG93IGluIGV4cHJlc3Np
b247IHJlc3VsdCBpcyAtMjk0OTY3Mjk2IHdpdGggdHlwZSAnbG9uZycgWy1XZXJyb3IsLVdpbnRl
Z2VyLW92ZXJmbG93XQo+ID4gICAgICAgICAgICAgICAgICBleHBpcmVzID0ga3RpbWVfZ2V0X21v
bm9fZmFzdF9ucygpICsgTlNFQ19QRVJfU0VDICogNEw7Cj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgo+ID4gTWFr
ZSB0aGlzIGEgJ2xvbmcgbG9uZycgY29uc3RhbnQgaW5zdGVhZC4KPiA+Cj4gPiBGaXhlczogM2Yx
MmFjYzhkNmQ0ICgiZHJtL2FtZGdwdTogcHV0IHRoZSBhdWRpbyBjb2RlYyBpbnRvIHN1c3BlbmQg
c3RhdGUgYmVmb3JlIGdwdSByZXNldCBWMyIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdt
YW5uIDxhcm5kQGFybmRiLmRlPgo+Cj4gUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNo
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPgo+ID4gLS0tCj4gPiBJJ20gbm90IHN1cmUgdGhlIGt0
aW1lX2dldF9tb25vX2Zhc3RfbnMoKSBjYWxsIGlzIG5lY2Vzc2FyeSBoZXJlCj4gPiBlaXRoZXIu
IElzIGl0IGludGVudGlvbmFsIGJlY2F1c2Uga3RpbWVfZ2V0X25zKCkgZG9lc24ndCB3b3JrCj4g
PiBkdXJpbmcgYSBkcml2ZXIgc3VzcGVuZCwgb3IganVzdCBhIG1pc3Rha2U/Cj4gPiAtLS0KPiA+
ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIHwgMiArLQo+ID4g
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCj4gPiBpbmRleCA2Zjkz
YWY5NzJiMGEuLjJlMDdlM2U2YjAzNiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2RldmljZS5jCj4gPiBAQCAtNDE1Nyw3ICs0MTU3LDcgQEAgc3RhdGljIGlu
dCBhbWRncHVfZGV2aWNlX3N1c3BlbmRfZGlzcGxheV9hdWRpbyhzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldikKPiA+ICAgICAgICAgICAgICAgICogdGhlIGF1ZGlvIGNvbnRyb2xsZXIgZGVmYXVs
dCBhdXRvc3VzcGVuZCBkZWxheSBzZXR0aW5nLgo+ID4gICAgICAgICAgICAgICAgKiA0UyB1c2Vk
IGhlcmUgaXMgZ3VhcmFudGVlZCB0byBjb3ZlciB0aGF0Lgo+ID4gICAgICAgICAgICAgICAgKi8K
PiA+IC0gICAgICAgICAgICAgZXhwaXJlcyA9IGt0aW1lX2dldF9tb25vX2Zhc3RfbnMoKSArIE5T
RUNfUEVSX1NFQyAqIDRMOwo+ID4gKyAgICAgICAgICAgICBleHBpcmVzID0ga3RpbWVfZ2V0X21v
bm9fZmFzdF9ucygpICsgTlNFQ19QRVJfU0VDICogNExMOwo+ID4KPiA+ICAgICAgIHdoaWxlICgh
cG1fcnVudGltZV9zdGF0dXNfc3VzcGVuZGVkKCYocC0+ZGV2KSkpIHsKPiA+ICAgICAgICAgICAg
ICAgaWYgKCFwbV9ydW50aW1lX3N1c3BlbmQoJihwLT5kZXYpKSkKPgo+IC0tCj4gWW91IHJlY2Vp
dmVkIHRoaXMgbWVzc2FnZSBiZWNhdXNlIHlvdSBhcmUgc3Vic2NyaWJlZCB0byB0aGUgR29vZ2xl
IEdyb3VwcyAiQ2xhbmcgQnVpbHQgTGludXgiIGdyb3VwLgo+IFRvIHVuc3Vic2NyaWJlIGZyb20g
dGhpcyBncm91cCBhbmQgc3RvcCByZWNlaXZpbmcgZW1haWxzIGZyb20gaXQsIHNlbmQgYW4gZW1h
aWwgdG8gY2xhbmctYnVpbHQtbGludXgrdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbS4KPiBU
byB2aWV3IHRoaXMgZGlzY3Vzc2lvbiBvbiB0aGUgd2ViIHZpc2l0IGh0dHBzOi8vZ3JvdXBzLmdv
b2dsZS5jb20vZC9tc2dpZC9jbGFuZy1idWlsdC1saW51eC9lNGE4NTJiMi04MDdiLWJjNzMtNzMy
OC1iY2MzOTkzNDEwODUlNDBhbWQuY29tLgoKCgotLSAKVGhhbmtzLAp+TmljayBEZXNhdWxuaWVy
cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
