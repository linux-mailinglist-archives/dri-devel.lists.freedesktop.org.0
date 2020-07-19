Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D5222589B
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 09:31:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A83E6E25E;
	Mon, 20 Jul 2020 07:30:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C09F6E14F
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jul 2020 19:55:55 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id j11so12750999oiw.12
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jul 2020 12:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kali.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=mRtQwdBy4cMJ2VUTfd5VyA2rBeltOGvlkiQuwEZP/i0=;
 b=PhcDkenTejEXeGJcJ3EQZjX+eEwXRF9XstpBQVjzS7UUEYNKMmLlrNKaIspOlx7Zap
 Rz+/m+U/nF7UDTCOYhgyHx4VWF01jSPYYOSDOjWLwZZMCsIHRjNfLD6+9oSJ6l6PrVr9
 ZEKskoCZDSWAaJxXwdyDNG7V7TsiPdJA95T+3fKsSUHzkvSi/vfkhl9M5v8VmXMsmLRh
 XutfxqtwmBu1NRfPkBwHoTShtmY7kotXkg9ErOerm2o0HGP85uWR1SwDpB5V7C2Ikxqr
 SSapvobuuewi9v1BGd9oNqQOtZQrPrxU5xjs7im7rVpW5JFcDDw6JglzhMNhZCwKzSWf
 en+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=mRtQwdBy4cMJ2VUTfd5VyA2rBeltOGvlkiQuwEZP/i0=;
 b=Or5Xkno3d6Jhox6pPE3JWlzsMHbhG+OwXLBmE2UKpHY11huAqfWIK/+wlnDrH61atw
 KkPuPIEvIAtgjJceVBfAOrzDRg8AFons2CQo67c8z24ynP1dLZrqMsTiqAtpMCaJyLVD
 3jUQd00xqwiETO8AgoyxIOQM+GRaplPLnDIk5QdCaUkbcc116WhdfcfjLObPzke6Xhcp
 hap1c3NqWLMdrbBor004KGQGe2tusAMdzNAMVOD3DSCmesKEDuPKkNOiRlKTAhsv6wcI
 Ajkjm0yMcp8zUtx5uYP7izzbzL4ykOFuY6MMT5oXl8IL0SVycW9fIXQ39H45BQxANMXh
 uV3w==
X-Gm-Message-State: AOAM532hOBfM1MkTqR7yhJ/Qc9U/0JbTGZekqGsnNi+OlU8cq2306Gq6
 rphFaCR5JbX/Kegz7qh072tJ5w==
X-Google-Smtp-Source: ABdhPJw49cUNxgoWmff++mA23jaYik5OoL2M48trhIC+wILhz86X9K4y444350XVMjDkuuELIlfF6g==
X-Received: by 2002:aca:54d1:: with SMTP id i200mr15643632oib.11.1595188554414; 
 Sun, 19 Jul 2020 12:55:54 -0700 (PDT)
Received: from Steevs-MBP.hackershack.net (cpe-173-175-113-3.satx.res.rr.com.
 [173.175.113.3])
 by smtp.gmail.com with ESMTPSA id 97sm3091692oti.15.2020.07.19.12.55.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Jul 2020 12:55:53 -0700 (PDT)
Subject: Re: [PATCH] drm/msm/dpu: fix/enable 6bpc dither with split-lm
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200715221955.3209856-1-robdclark@gmail.com>
From: Steev Klimaszewski <steev@kali.org>
Message-ID: <997f19de-9ea0-969c-ba91-603a2b214299@kali.org>
Date: Sun, 19 Jul 2020 14:55:52 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200715221955.3209856-1-robdclark@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 20 Jul 2020 07:30:37 +0000
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Steev Klimaszewski <steev@gentoo.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Doug Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Zheng Bin <zhengbin13@huawei.com>, Kalyan Thota <kalyan_t@codeaurora.org>,
 Drew Davenport <ddavenport@chromium.org>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiA3LzE1LzIwIDU6MTkgUE0sIFJvYiBDbGFyayB3cm90ZToKPiBGcm9tOiBSb2IgQ2xh
cmsgPHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+Cj4KPiBJZiBzcGxpdC1sbSBpcyB1c2VkIChmb3Ig
ZXgsIG9uIHNkbTg0NSksIHdlIGNhbiBoYXZlIG11bHRpcGxlIHBpbmctCj4gcG9uZ3MsIGJ1dCBv
bmx5IGEgc2luZ2xlIHBoeXMgZW5jb2Rlci4gIFdlIG5lZWQgdG8gY29uZmlndXJlIGRpdGhlcmlu
Zwo+IG9uIGVhY2ggb2YgdGhlbS4KPgo+IFNpZ25lZC1vZmYtYnk6IFJvYiBDbGFyayA8cm9iZGNs
YXJrQGNocm9taXVtLm9yZz4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEv
ZHB1X2VuY29kZXIuYyAgIHwgMjIgKysrKysrKysrKy0tLS0tLS0tLQo+ICAuLi4vZ3B1L2RybS9t
c20vZGlzcC9kcHUxL2RwdV9od19waW5ncG9uZy5jICAgfCAgMyArLS0KPiAgMiBmaWxlcyBjaGFu
Z2VkLCAxMyBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5jb2Rlci5jIGIvZHJpdmVycy9ncHUv
ZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXIuYwo+IGluZGV4IDQ2ZGYwZmY3NWI4NS4uOWI5
OGI2M2M3N2ZiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2Rw
dV9lbmNvZGVyLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5j
b2Rlci5jCj4gQEAgLTIxMiwxNCArMjEyLDE0IEBAIHN0YXRpYyB1MzIgZGl0aGVyX21hdHJpeFtE
SVRIRVJfTUFUUklYX1NaXSA9IHsKPiAgCTE1LCA3LCAxMywgNSwgMywgMTEsIDEsIDksIDEyLCA0
LCAxNCwgNiwgMCwgOCwgMiwgMTAKPiAgfTsKPiAgCj4gLXN0YXRpYyB2b2lkIF9kcHVfZW5jb2Rl
cl9zZXR1cF9kaXRoZXIoc3RydWN0IGRwdV9lbmNvZGVyX3BoeXMgKnBoeXMpCj4gK3N0YXRpYyB2
b2lkIF9kcHVfZW5jb2Rlcl9zZXR1cF9kaXRoZXIoc3RydWN0IGRwdV9od19waW5ncG9uZyAqaHdf
cHAsIHVuc2lnbmVkIGJwYykKPiAgewo+ICAJc3RydWN0IGRwdV9od19kaXRoZXJfY2ZnIGRpdGhl
cl9jZmcgPSB7IDAgfTsKPiAgCj4gLQlpZiAoIXBoeXMtPmh3X3BwIHx8ICFwaHlzLT5od19wcC0+
b3BzLnNldHVwX2RpdGhlcikKPiArCWlmICghaHdfcHAtPm9wcy5zZXR1cF9kaXRoZXIpCj4gIAkJ
cmV0dXJuOwo+ICAKPiAtCXN3aXRjaCAocGh5cy0+Y29ubmVjdG9yLT5kaXNwbGF5X2luZm8uYnBj
KSB7Cj4gKwlzd2l0Y2ggKGJwYykgewo+ICAJY2FzZSA2Ogo+ICAJCWRpdGhlcl9jZmcuYzBfYml0
ZGVwdGggPSA2Owo+ICAJCWRpdGhlcl9jZmcuYzFfYml0ZGVwdGggPSA2Owo+IEBAIC0yMjgsMTQg
KzIyOCwxNCBAQCBzdGF0aWMgdm9pZCBfZHB1X2VuY29kZXJfc2V0dXBfZGl0aGVyKHN0cnVjdCBk
cHVfZW5jb2Rlcl9waHlzICpwaHlzKQo+ICAJCWRpdGhlcl9jZmcudGVtcG9yYWxfZW4gPSAwOwo+
ICAJCWJyZWFrOwo+ICAJZGVmYXVsdDoKPiAtCQlwaHlzLT5od19wcC0+b3BzLnNldHVwX2RpdGhl
cihwaHlzLT5od19wcCwgTlVMTCk7Cj4gKwkJaHdfcHAtPm9wcy5zZXR1cF9kaXRoZXIoaHdfcHAs
IE5VTEwpOwo+ICAJCXJldHVybjsKPiAgCX0KPiAgCj4gIAltZW1jcHkoJmRpdGhlcl9jZmcubWF0
cml4LCBkaXRoZXJfbWF0cml4LAo+ICAJCQlzaXplb2YodTMyKSAqIERJVEhFUl9NQVRSSVhfU1op
Owo+ICAKPiAtCXBoeXMtPmh3X3BwLT5vcHMuc2V0dXBfZGl0aGVyKHBoeXMtPmh3X3BwLCAmZGl0
aGVyX2NmZyk7Cj4gKwlod19wcC0+b3BzLnNldHVwX2RpdGhlcihod19wcCwgJmRpdGhlcl9jZmcp
Owo+ICB9Cj4gIAo+ICB2b2lkIGRwdV9lbmNvZGVyX2hlbHBlcl9yZXBvcnRfaXJxX3RpbWVvdXQo
c3RydWN0IGRwdV9lbmNvZGVyX3BoeXMgKnBoeXNfZW5jLAo+IEBAIC0xMTMyLDExICsxMTMyLDEz
IEBAIHN0YXRpYyB2b2lkIF9kcHVfZW5jb2Rlcl92aXJ0X2VuYWJsZV9oZWxwZXIoc3RydWN0IGRy
bV9lbmNvZGVyICpkcm1fZW5jKQo+ICAKPiAgCV9kcHVfZW5jb2Rlcl91cGRhdGVfdnN5bmNfc291
cmNlKGRwdV9lbmMsICZkcHVfZW5jLT5kaXNwX2luZm8pOwo+ICAKPiAtCWlmIChkcHVfZW5jLT5k
aXNwX2luZm8uaW50Zl90eXBlID09IERSTV9NT0RFX0VOQ09ERVJfRFNJKSB7Cj4gLQkJZm9yIChp
ID0gMDsgaSA8IGRwdV9lbmMtPm51bV9waHlzX2VuY3M7IGkrKykgewo+IC0JCQlzdHJ1Y3QgZHB1
X2VuY29kZXJfcGh5cyAqcGh5cyA9IGRwdV9lbmMtPnBoeXNfZW5jc1tpXTsKPiAtCj4gLQkJCV9k
cHVfZW5jb2Rlcl9zZXR1cF9kaXRoZXIocGh5cyk7Cj4gKwlpZiAoZHB1X2VuYy0+ZGlzcF9pbmZv
LmludGZfdHlwZSA9PSBEUk1fTU9ERV9FTkNPREVSX0RTSSAmJgo+ICsJCQkhV0FSTl9PTihkcHVf
ZW5jLT5udW1fcGh5c19lbmNzID09IDApKSB7Cj4gKwkJdW5zaWduZWQgYnBjID0gZHB1X2VuYy0+
cGh5c19lbmNzWzBdLT5jb25uZWN0b3ItPmRpc3BsYXlfaW5mby5icGM7Cj4gKwkJZm9yIChpID0g
MDsgaSA8IE1BWF9DSEFOTkVMU19QRVJfRU5DOyBpKyspIHsKPiArCQkJaWYgKCFkcHVfZW5jLT5o
d19wcFtpXSkKPiArCQkJCWNvbnRpbnVlOwo+ICsJCQlfZHB1X2VuY29kZXJfc2V0dXBfZGl0aGVy
KGRwdV9lbmMtPmh3X3BwW2ldLCBicGMpOwo+ICAJCX0KPiAgCX0KPiAgfQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfaHdfcGluZ3BvbmcuYyBiL2RyaXZl
cnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9od19waW5ncG9uZy5jCj4gaW5kZXggNzQxMWFi
NmJmNmFmLi5iZWE0YWI1YzU4YzUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9k
aXNwL2RwdTEvZHB1X2h3X3Bpbmdwb25nLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rp
c3AvZHB1MS9kcHVfaHdfcGluZ3BvbmcuYwo+IEBAIC0yMzEsOCArMjMxLDcgQEAgc3RhdGljIHZv
aWQgX3NldHVwX3Bpbmdwb25nX29wcyhzdHJ1Y3QgZHB1X2h3X3Bpbmdwb25nICpjLAo+ICAJYy0+
b3BzLnBvbGxfdGltZW91dF93cl9wdHIgPSBkcHVfaHdfcHBfcG9sbF90aW1lb3V0X3dyX3B0cjsK
PiAgCWMtPm9wcy5nZXRfbGluZV9jb3VudCA9IGRwdV9od19wcF9nZXRfbGluZV9jb3VudDsKPiAg
Cj4gLQlpZiAodGVzdF9iaXQoRFBVX1BJTkdQT05HX0RJVEhFUiwgJmZlYXR1cmVzKSAmJgo+IC0J
CUlTX1NDNzE4MF9UQVJHRVQoYy0+aHcuaHd2ZXJzaW9uKSkKPiArCWlmICh0ZXN0X2JpdChEUFVf
UElOR1BPTkdfRElUSEVSLCAmZmVhdHVyZXMpKQo+ICAJCWMtPm9wcy5zZXR1cF9kaXRoZXIgPSBk
cHVfaHdfcHBfc2V0dXBfZGl0aGVyOwo+ICB9OwoKU29ycnkgZm9yIHRha2luZyBzbyBsb25nIHRv
IGdldCBhcm91bmQgdG8gdGVzdGluZyB0aGlzLsKgIEkgd2FzIGFibGUgdG8KdG9kYXksIGFuZCBp
dCBkb2VzIHJlZHVjZSB0aGUgYmFuZGluZyB0byBiZSBsZXNzIG5vdGljZWFibGUuCgpUZXN0ZWQt
Ynk6IFN0ZWV2IEtsaW1hc3pld3NraSA8c3RlZXZAa2FsaS5vcmc+CgpUaGFua3MhCgotLSBzdGVl
dgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
