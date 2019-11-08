Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD838F6CA8
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 03:29:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 628A26E135;
	Mon, 11 Nov 2019 02:29:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B47016F8E5
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2019 09:24:55 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id i6so4510614ilr.11
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Nov 2019 01:24:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TIs1b1rF99sJDfx3z4532mKtmm9qYYLIgv84nPYnnHs=;
 b=igdiSDjhgEkGFnhnL7wCsYPLd+HLbKEfn0dQvZbinMv0h0K8RtIG/L4/Zqy3W+WxyM
 1cEqfMwMuX2LLVtTs7kMPEnVlKmEqktECuHvO/nygs1Qa/5Sc61kjBXo22qZ8K6hKQnD
 eiRNaxBxNKGq2PNz1JJ4pl9hv0HYkDjeuIM5wBcnt21Vnx3eEm/FY4v+MJ3FZ7GCUEd9
 FF8ycnuPhG0Y7ltUmHry6gH9jM1PvQUswEcBKmkl8F0j75M6rUPHr3gfbalQfrqXhalL
 uFAx/768qLg8VoAqASbyX7yRa35YLDsgcHLzert3LXbVLuQgzcxCK3yXFfx7yG5NffUb
 Wlrw==
X-Gm-Message-State: APjAAAU/Zpl9vPVGU37YXiMfB/Sp4KWo4G8AUwijU3SuHXkPgSPHYViQ
 R6YDy/wjEhEwFKoDHleaaARrY2PzeI9jLer/F0a0Kw==
X-Google-Smtp-Source: APXvYqwtRtGOseUaKsfPdpbp1n2b413liDUFukBRms5HVfi6ZxDltAL8Iq7DZYBftqtmTEzjDq6ltn2a9JRv8Fjc/UQ=
X-Received: by 2002:a92:104a:: with SMTP id y71mr10820859ill.220.1573205094697; 
 Fri, 08 Nov 2019 01:24:54 -0800 (PST)
MIME-Version: 1.0
References: <20191022083630.28175-1-brgl@bgdev.pl>
 <CAMRc=MeyrDZgmHJ+2SMipP7y9NggxiVfkAh4kCLePFWvUku9aQ@mail.gmail.com>
 <20191023155941.q563d3cfizre4zvt@holly.lan> <20191024064726.GB15843@dell>
 <20191024071703.6keoebzlfnn2qmyd@uno.localdomain> <20191101085803.GD5700@dell>
 <20191101154133.qqjj3uriwrl2j5r5@uno.localdomain>
 <CAMRc=MejNQAPUXQkJsVFBxcQUJ83xRF0ntKM2ssnAxc1C+7Jjg@mail.gmail.com>
In-Reply-To: <CAMRc=MejNQAPUXQkJsVFBxcQUJ83xRF0ntKM2ssnAxc1C+7Jjg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 8 Nov 2019 10:24:43 +0100
Message-ID: <CAMRc=Meh1jdc562bTHEfodyud7B0dBM+Lti3ZaCBUaqOjDhaCQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/9] backlight: gpio: simplify the driver
To: Lee Jones <lee.jones@linaro.org>
X-Mailman-Approved-At: Mon, 11 Nov 2019 02:29:25 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TIs1b1rF99sJDfx3z4532mKtmm9qYYLIgv84nPYnnHs=;
 b=gxCm/qOYL1x3dCef+3XYnB+136x455HWgfi7Qj90a6dbEpD7yZVGwabzGT+m3zVTeT
 xKLqQZnb6f4/364HgKR3h6iycCUM32NmFhTumpu7wzJ06bEb/Xja1/T7Z5YlkGLz35Ey
 MhWWmeBKp+7r2NZ2+3t2WxrDyefwkN4lYVL8k4pVi1DjNlUUCLwxWz+xJZJEB4Qo9i0a
 M54W0iLOpNNyBKFQJ99llVhbFmej2JakEAM/Fi6L/acyhlF+qLRQCpkd3ZssmyvurFCu
 Q+hTAR/0QZfEyCX/u3NrZ0Rcy2H2bZTuIO2iPbFE1K6cPSESvnjC3XnyAIg0mho1kDjw
 ljuA==
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Rich Felker <dalias@libc.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Linux-sh list <linux-sh@vger.kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jacopo Mondi <jacopo@jmondi.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

cG9uLiwgNCBsaXMgMjAxOSBvIDEwOjIyIEJhcnRvc3ogR29sYXN6ZXdza2kgPGJyZ2xAYmdkZXYu
cGw+IG5hcGlzYcWCKGEpOgo+Cj4gcHQuLCAxIGxpcyAyMDE5IG8gMTY6MzkgSmFjb3BvIE1vbmRp
IDxqYWNvcG9Aam1vbmRpLm9yZz4gbmFwaXNhxYIoYSk6Cj4gPgo+ID4gSGVsbG8sCj4gPiAgIGFz
IHByb21pc2VkLi4uCj4gPgo+ID4gT24gRnJpLCBOb3YgMDEsIDIwMTkgYXQgMDg6NTg6MDNBTSAr
MDAwMCwgTGVlIEpvbmVzIHdyb3RlOgo+ID4gPiBPbiBUaHUsIDI0IE9jdCAyMDE5LCBKYWNvcG8g
TW9uZGkgd3JvdGU6Cj4gPiA+Cj4gPiA+ID4gSGVsbG8sCj4gPiA+ID4KPiA+ID4gPiBPbiBUaHUs
IE9jdCAyNCwgMjAxOSBhdCAwNzo0NzoyNkFNICswMTAwLCBMZWUgSm9uZXMgd3JvdGU6Cj4gPiA+
ID4gPiBPbiBXZWQsIDIzIE9jdCAyMDE5LCBEYW5pZWwgVGhvbXBzb24gd3JvdGU6Cj4gPiA+ID4g
Pgo+ID4gPiA+ID4gPiBPbiBUdWUsIE9jdCAyMiwgMjAxOSBhdCAxMToyOTo1NEFNICswMjAwLCBC
YXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+ID4gPiA+ID4gPiA+IHd0LiwgMjIgcGHFuiAyMDE5
IG8gMTA6MzYgQmFydG9zeiBHb2xhc3pld3NraSA8YnJnbEBiZ2Rldi5wbD4gbmFwaXNhxYIoYSk6
Cj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gRnJvbTogQmFydG9zeiBHb2xhc3pld3Nr
aSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+
ID4gPiBXaGlsZSB3b3JraW5nIG9uIG15IG90aGVyIHNlcmllcyByZWxhdGVkIHRvIGdwaW8tYmFj
a2xpZ2h0WzFdIEkgbm90aWNlZAo+ID4gPiA+ID4gPiA+ID4gdGhhdCB3ZSBjb3VsZCBzaW1wbGlm
eSB0aGUgZHJpdmVyIGlmIHdlIG1hZGUgdGhlIG9ubHkgdXNlciBvZiBwbGF0Zm9ybQo+ID4gPiA+
ID4gPiA+ID4gZGF0YSB1c2UgR1BJTyBsb29rdXBzIGFuZCBkZXZpY2UgcHJvcGVydGllcy4gVGhp
cyBzZXJpZXMgdHJpZXMgdG8gZG8KPiA+ID4gPiA+ID4gPiA+IHRoYXQuCj4gPiA+ID4gPiA+ID4g
Pgo+ID4gPiA+ID4gPiA+ID4gRmlyc3QgdHdvIHBhdGNoZXMgY29udGFpbiBtaW5vciBmaXhlcy4g
VGhpcmQgcGF0Y2ggbWFrZXMgdGhlIGRyaXZlcgo+ID4gPiA+ID4gPiA+ID4gZXhwbGljaXRseSBk
cml2ZSB0aGUgR1BJTyBsaW5lLiBGb3VydGggcGF0Y2ggYWRkcyBhbGwgbmVjZXNzYXJ5IGRhdGEK
PiA+ID4gPiA+ID4gPiA+IHN0cnVjdHVyZXMgdG8gZWNvdmVjMjQuIFBhdGNoIDUvOSB1bmlmaWVz
IG11Y2ggb2YgdGhlIGNvZGUgZm9yIGJvdGgKPiA+ID4gPiA+ID4gPiA+IHBkYXRhIGFuZCBub24t
cGRhdGEgY2FzZXMuIFBhdGNoZXMgNi03LzkgcmVtb3ZlIHVudXNlZCBwbGF0Zm9ybSBkYXRhCj4g
PiA+ID4gPiA+ID4gPiBmaWVsZHMuIExhc3QgdHdvIHBhdGNoZXMgY29udGFpbiBhZGRpdGlvbmFs
IGltcHJvdmVtZW50cyBmb3IgdGhlIEdQSU8KPiA+ID4gPiA+ID4gPiA+IGJhY2tsaWdodCBkcml2
ZXIgd2hpbGUgd2UncmUgYWxyZWFkeSBtb2RpZnlpbmcgaXQuCj4gPiA+ID4gPiA+ID4gPgo+ID4g
PiA+ID4gPiA+ID4gSSBkb24ndCBoYXZlIGFjY2VzcyB0byB0aGlzIEhXIGJ1dCBob3BlZnVsbHkg
dGhpcyB3b3Jrcy4gT25seSBjb21waWxlCj4gPiA+ID4gPiA+ID4gPiB0ZXN0ZWQuCj4gPiA+ID4g
PiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gWzFdIGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE5LzYv
MjUvOTAwCj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gdjEgLT4gdjI6Cj4gPiA+ID4g
PiA+ID4gPiAtIHJlYmFzZWQgb24gdG9wIG9mIHY1LjMtcmMxIGFuZCBhZGp1c3RlZCB0byB0aGUg
cmVjZW50IGNoYW5nZXMgZnJvbSBBbmR5Cj4gPiA+ID4gPiA+ID4gPiAtIGFkZGVkIGFkZGl0aW9u
YWwgdHdvIHBhdGNoZXMgd2l0aCBtaW5vciBpbXByb3ZlbWVudHMKPiA+ID4gPiA+ID4gPiA+Cj4g
PiA+ID4gPiA+ID4gPiB2MiAtPiB2MzoKPiA+ID4gPiA+ID4gPiA+IC0gaW4gcGF0Y2ggNy83OiB1
c2VkIGluaXRpYWxpemVycyB0byBzZXQgdmFsdWVzIGZvciBwZGF0YSBhbmQgZGV2IGxvY2FsIHZh
cnMKPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiB2MyAtPiB2NDoKPiA+ID4gPiA+ID4g
PiA+IC0gcmViYXNlZCBvbiB0b3Agb2YgdjUuNC1yYzEKPiA+ID4gPiA+ID4gPiA+IC0gcmVtb3Zl
ZCBjaGFuZ2VzIHRoYXQgYXJlIG5vIGxvbmdlciByZWxldmFudCBhZnRlciBjb21taXQgZWM2NjVi
NzU2ZTZmCj4gPiA+ID4gPiA+ID4gPiAgICgiYmFja2xpZ2h0OiBncGlvLWJhY2tsaWdodDogQ29y
cmVjdCBpbml0aWFsIHBvd2VyIHN0YXRlIGhhbmRsaW5nIikKPiA+ID4gPiA+ID4gPiA+IC0gYWRk
ZWQgcGF0Y2ggNy83Cj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gdjQgLT4gdjU6Cj4g
PiA+ID4gPiA+ID4gPiAtIGluIHBhdGNoIDcvNzogYWRkZWQgYSBjb21tZW50IHJlcGxhY2luZyB0
aGUgbmFtZSBvZiB0aGUgZnVuY3Rpb24gYmVpbmcKPiA+ID4gPiA+ID4gPiA+ICAgcHVsbGVkIGlu
dG8gcHJvYmUoKQo+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+IHY1IC0+IHY2Ogo+ID4g
PiA+ID4gPiA+ID4gLSBhZGRlZCBhIHBhdGNoIG1ha2luZyB0aGUgZHJpdmVyIGV4cGxpY2l0bHkg
c2V0IHRoZSBkaXJlY3Rpb24gb2YgdGhlIEdQSU8KPiA+ID4gPiA+ID4gPiA+ICAgdG8gb3V0cHV0
Cj4gPiA+ID4gPiA+ID4gPiAtIGFkZGVkIGEgcGF0Y2ggcmVtb3ZpbmcgYSByZWR1bmRhbnQgbmV3
bGluZQo+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+IHY2IC0+IHY3Ogo+ID4gPiA+ID4g
PiA+ID4gLSByZW5hbWVkIHRoZSBmdW5jdGlvbiBjYWxjdWxhdGluZyB0aGUgbmV3IEdQSU8gdmFs
dWUgZm9yIHN0YXR1cyB1cGRhdGUKPiA+ID4gPiA+ID4gPiA+IC0gY29sbGVjdGVkIG1vcmUgdGFn
cwo+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+IEJhcnRvc3ogR29sYXN6ZXdza2kgKDkp
Ogo+ID4gPiA+ID4gPiA+ID4gICBiYWNrbGlnaHQ6IGdwaW86IHJlbW92ZSB1bm5lZWRlZCBpbmNs
dWRlCj4gPiA+ID4gPiA+ID4gPiAgIGJhY2tsaWdodDogZ3BpbzogcmVtb3ZlIHN0cmF5IG5ld2xp
bmUKPiA+ID4gPiA+ID4gPiA+ICAgYmFja2xpZ2h0OiBncGlvOiBleHBsaWNpdGx5IHNldCB0aGUg
ZGlyZWN0aW9uIG9mIHRoZSBHUElPCj4gPiA+ID4gPiA+ID4gPiAgIHNoOiBlY292ZWMyNDogYWRk
IGFkZGl0aW9uYWwgcHJvcGVydGllcyB0byB0aGUgYmFja2xpZ2h0IGRldmljZQo+ID4gPiA+ID4g
PiA+ID4gICBiYWNrbGlnaHQ6IGdwaW86IHNpbXBsaWZ5IHRoZSBwbGF0Zm9ybSBkYXRhIGhhbmRs
aW5nCj4gPiA+ID4gPiA+ID4gPiAgIHNoOiBlY292ZWMyNDogZG9uJ3Qgc2V0IHVudXNlZCBmaWVs
ZHMgaW4gcGxhdGZvcm0gZGF0YQo+ID4gPiA+ID4gPiA+ID4gICBiYWNrbGlnaHQ6IGdwaW86IHJl
bW92ZSB1bnVzZWQgZmllbGRzIGZyb20gcGxhdGZvcm0gZGF0YQo+ID4gPiA+ID4gPiA+ID4gICBi
YWNrbGlnaHQ6IGdwaW86IHVzZSBhIGhlbHBlciB2YXJpYWJsZSBmb3IgJnBkZXYtPmRldgo+ID4g
PiA+ID4gPiA+ID4gICBiYWNrbGlnaHQ6IGdwaW86IHB1bGwgZ3Bpb19iYWNrbGlnaHRfaW5pdGlh
bF9wb3dlcl9zdGF0ZSgpIGludG8gcHJvYmUKPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4g
PiAgYXJjaC9zaC9ib2FyZHMvbWFjaC1lY292ZWMyNC9zZXR1cC5jICAgICAgICAgfCAgMzMgKysr
LS0KPiA+ID4gPiA+ID4gPiA+ICBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdo
dC5jICAgICB8IDEyOCArKysrKysrLS0tLS0tLS0tLS0tCj4gPiA+ID4gPiA+ID4gPiAgaW5jbHVk
ZS9saW51eC9wbGF0Zm9ybV9kYXRhL2dwaW9fYmFja2xpZ2h0LmggfCAgIDMgLQo+ID4gPiA+ID4g
PiA+ID4gIDMgZmlsZXMgY2hhbmdlZCwgNjkgaW5zZXJ0aW9ucygrKSwgOTUgZGVsZXRpb25zKC0p
Cj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4g
PiA+IExlZSwgRGFuaWVsLCBKaW5nb28sCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBKYWNv
cG8gaXMgdHJhdmVsbGluZyB1bnRpbCBOb3ZlbWJlciAxc3QgYW5kIHdvbid0IGJlIGFibGUgdG8g
dGVzdCB0aGlzCj4gPiA+ID4gPiA+ID4gYWdhaW4gYmVmb3JlIHRoaXMgZGF0ZS4gRG8geW91IHRo
aW5rIHlvdSBjYW4gcGljayBpdCB1cCBhbmQgaW4gY2FzZQo+ID4gPiA+ID4gPiA+IGFueXRoaW5n
J3MgYnJva2VuIG9uIFNILCB3ZSBjYW4gZml4IGl0IGFmdGVyIHY1LjUtcmMxLCBzbyB0aGF0IGl0
Cj4gPiA+ID4gPiA+ID4gZG9lc24ndCBtaXNzIGFub3RoZXIgbWVyZ2Ugd2luZG93Pwo+ID4gPiA+
ID4KPiA+ID4gPiA+IE5vdmVtYmVyIDFzdCAoLXJjNikgd2lsbCBiZSBmaW5lLgo+ID4gPiA+ID4K
PiA+ID4gPiA+IEknZCByYXRoZXIgYXBwbHkgaXQgbGF0ZS10ZXN0ZWQgdGhhbiBlYXJseS1ub24t
dGVzdGVkLgo+ID4gPiA+ID4KPiA+ID4gPiA+IEhvcGVmdWxseSBKYWNvcG8gY2FuIHByaW9yaXRp
c2UgdGVzdGluZyB0aGlzIG9uIFRodXJzZGF5IG9yIEZyaWRheSwKPiA+ID4gPiA+IHNpbmNlIE1v
bmRheSB3aWxsIGJlIC1yYzcgd2hpY2ggaXMgcmVhbGx5IGN1dHRpbmcgaXQgZmluZS4KPiA+ID4g
Pgo+ID4gPiA+IEknbGwgZG8gbXkgYmVzdCwgSSdsbCBnZXQgaG9tZSBGcmlkYXkgbGF0ZSBhZnRl
cm5vb24gOikKPiA+ID4KPiA+ID4gV2VsY29tZSBob21lIQo+ID4gPgo+ID4gPiBKdXN0IGEgbGl0
dGxlIHJlbWluZGVyIGluIHlvdXIgaW5ib3guIFRJQS4gOikKPiA+Cj4gPiBGb3IgdGhlIGVjb3Zl
YyBwYXJ0Ogo+ID4gVGVzdGVkLWJ5OiBKYWNvcG8gTW9uZGkgPGphY29wbytyZW5lc2FzQGptb25k
aS5vcmc+Cj4gPgo+Cj4gVGhhbmtzIEphY29wbyEKPgo+IExlZTogSSBob3BlIGl0J3Mgbm90IHRv
byBsYXRlIHRvIGdldCBpdCBwaWNrZWQgdXAgZm9yIHY1LjU/Cj4KCkhpLCBqdXN0IGEgZ2VudGxl
IHBpbmcgZm9yIHRoaXMgc2VyaWVzLCBiZWNhdXNlIEknbSBhZnJhaWQgaXQgd2lsbAptaXNzIHll
dCBhbm90aGVyIG1lcmdlIHdpbmRvdy4KClRoYW5rcyBpbiBhZHZhbmNlIQpCYXJ0b3N6IEdvbGFz
emV3c2tpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
