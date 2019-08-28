Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D90A9FCF8
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 10:28:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71289899DE;
	Wed, 28 Aug 2019 08:28:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E883D89C82
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 07:33:02 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id l7so3974093ioj.6
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 00:33:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NfLQvLEN/4SUIg24wd6k61cmwl9/5gsSQNSZs//BCak=;
 b=s3fQC/iJqhnKWrpDdeYvjjAIhE952a32paT2YxBBqE7p9sjwH9GngnPxoM9fcCQGNK
 NQSZePfkMle93kagP6ils88+dREtgR1BIA+gKpw6Iv0Q5cHBuwrlxhOaiOPAirgWorVE
 tcavrKLA8TPrtsB7kjPiye54r+mH9ZqA40cfx2o76clDAqo6l+NDMjgOXUJ7DP9Vtgtx
 Z3Uzc3N7d2J8d4saJMs54jC/I7JwRHCWj+C6zMqDs8xM7k/G1n1pKuuyeQIO1KIRezSj
 ru/zyiYtIgq6OS4cq6sxDcoC/faue1FgPRqTEUdCIqBJ7geOXimpPAN1lB/3bmzXq9UF
 xkQg==
X-Gm-Message-State: APjAAAVcbp+XbyrzgOKDgSl5FsXcpmE/RWxiPeNRu7G/f4wewx302Vps
 M5BdFawvGuRdJEybue2S6rbtiQsAEFtxxDwJlG5zVA==
X-Google-Smtp-Source: APXvYqxyUmBc7xgLnurv7r6uzQ6OCQX9cf5146mwYYO7o3wbWn1QAT5k46aSsfIFz7OOJ4gg7Gt4Y44wqYi3bGKmLGg=
X-Received: by 2002:a6b:901:: with SMTP id t1mr2978915ioi.6.1566977581776;
 Wed, 28 Aug 2019 00:33:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190724082508.27617-1-brgl@bgdev.pl>
 <CAMRc=Mex_Ricd+C4F7nGLmpBggO-hWwJDB6duX8kFpPEeaTDjQ@mail.gmail.com>
 <CAMRc=Mci4ncbDmns=0uL8hsAGz1Wvd5bgK4yxTF8QQQitXDv0g@mail.gmail.com>
In-Reply-To: <CAMRc=Mci4ncbDmns=0uL8hsAGz1Wvd5bgK4yxTF8QQQitXDv0g@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 28 Aug 2019 09:32:50 +0200
Message-ID: <CAMRc=McUEgm6yH7enwHuHxVTL41dmb5KAY_pxTmSr3vctCs2xg@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] backlight: gpio: simplify the driver
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>
X-Mailman-Approved-At: Wed, 28 Aug 2019 08:28:09 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NfLQvLEN/4SUIg24wd6k61cmwl9/5gsSQNSZs//BCak=;
 b=PB/byqaJIzgXNpaKr0qKZqv+zcI4c1KjyuogKO7hLrB97+Zr+EVPM5gHnEVACggvzH
 YqmL2PNOSF4YBF/nIFviD/kKRvFeu4KUO8GrSvfRxYt/lhWFiYTK0GVTchFl3N9Z6Sr2
 bVJKDeuQ23rxZaL/KVQETgb/we8cEClXdiIwBicotlyJ1nDmDCjIk3J9/ok7pFulyeWP
 oyPMRucL6LMGFiTymfnqEWhPnthDy/2LabhScB8aoBlvipVBPHFuOcnsLNJWumcbmj88
 yXZO+1D1ikWjRK5B420Pn+LS+uQ8WHMeFllsxQwq4J3a3lEIeiIdAxMrux2R/F2KTHhs
 7aew==
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
Cc: linux-fbdev@vger.kernel.org, linux-sh@vger.kernel.org,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

cHQuLCAxNiBzaWUgMjAxOSBvIDE3OjQ4IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJyZ2xAYmdkZXYu
cGw+IG5hcGlzYcWCKGEpOgo+Cj4gY3p3LiwgOCBzaWUgMjAxOSBvIDEwOjE3IEJhcnRvc3ogR29s
YXN6ZXdza2kgPGJyZ2xAYmdkZXYucGw+IG5hcGlzYcWCKGEpOgo+ID4KPiA+IMWbci4sIDI0IGxp
cCAyMDE5IG8gMTA6MjUgQmFydG9zeiBHb2xhc3pld3NraSA8YnJnbEBiZ2Rldi5wbD4gbmFwaXNh
xYIoYSk6Cj4gPiA+Cj4gPiA+IEZyb206IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJnb2xhc3pld3Nr
aUBiYXlsaWJyZS5jb20+Cj4gPiA+Cj4gPiA+IFdoaWxlIHdvcmtpbmcgb24gbXkgb3RoZXIgc2Vy
aWVzIHJlbGF0ZWQgdG8gZ3Bpby1iYWNrbGlnaHRbMV0gSSBub3RpY2VkCj4gPiA+IHRoYXQgd2Ug
Y291bGQgc2ltcGxpZnkgdGhlIGRyaXZlciBpZiB3ZSBtYWRlIHRoZSBvbmx5IHVzZXIgb2YgcGxh
dGZvcm0KPiA+ID4gZGF0YSB1c2UgR1BJTyBsb29rdXBzIGFuZCBkZXZpY2UgcHJvcGVydGllcy4g
VGhpcyBzZXJpZXMgdHJpZXMgdG8gZG8KPiA+ID4gdGhhdC4KPiA+ID4KPiA+ID4gVGhlIGZpcnN0
IHBhdGNoIGFkZHMgYWxsIG5lY2Vzc2FyeSBkYXRhIHN0cnVjdHVyZXMgdG8gZWNvdmVjMjQuIFBh
dGNoCj4gPiA+IDIvNyB1bmlmaWVzIG11Y2ggb2YgdGhlIGNvZGUgZm9yIGJvdGggcGRhdGEgYW5k
IG5vbi1wZGF0YSBjYXNlcy4gUGF0Y2hlcwo+ID4gPiAzLTQvNyByZW1vdmUgdW51c2VkIHBsYXRm
b3JtIGRhdGEgZmllbGRzLiBMYXN0IHRocmVlIHBhdGNoZXMgY29udGFpbgo+ID4gPiBhZGRpdGlv
bmFsIGltcHJvdmVtZW50cyBmb3IgdGhlIEdQSU8gYmFja2xpZ2h0IGRyaXZlciB3aGlsZSB3ZSdy
ZSBhbHJlYWR5Cj4gPiA+IG1vZGlmeWluZyBpdC4KPiA+ID4KPiA+ID4gSSBkb24ndCBoYXZlIGFj
Y2VzcyB0byB0aGlzIEhXIGJ1dCBob3BlZnVsbHkgdGhpcyB3b3Jrcy4gT25seSBjb21waWxlCj4g
PiA+IHRlc3RlZC4KPiA+ID4KPiA+ID4gWzFdIGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE5LzYv
MjUvOTAwCj4gPiA+Cj4gPiA+IHYxIC0+IHYyOgo+ID4gPiAtIHJlYmFzZWQgb24gdG9wIG9mIHY1
LjMtcmMxIGFuZCBhZGp1c3RlZCB0byB0aGUgcmVjZW50IGNoYW5nZXMgZnJvbSBBbmR5Cj4gPiA+
IC0gYWRkZWQgYWRkaXRpb25hbCB0d28gcGF0Y2hlcyB3aXRoIG1pbm9yIGltcHJvdmVtZW50cwo+
ID4gPgo+ID4gPiB2MiAtPiB2MzoKPiA+ID4gLSBpbiBwYXRjaCA3Lzc6IHVzZWQgaW5pdGlhbGl6
ZXJzIHRvIHNldCB2YWx1ZXMgZm9yIHBkYXRhIGFuZCBkZXYgbG9jYWwgdmFycwo+ID4gPgo+ID4g
PiBCYXJ0b3N6IEdvbGFzemV3c2tpICg3KToKPiA+ID4gICBzaDogZWNvdmVjMjQ6IGFkZCBhZGRp
dGlvbmFsIHByb3BlcnRpZXMgdG8gdGhlIGJhY2tsaWdodCBkZXZpY2UKPiA+ID4gICBiYWNrbGln
aHQ6IGdwaW86IHNpbXBsaWZ5IHRoZSBwbGF0Zm9ybSBkYXRhIGhhbmRsaW5nCj4gPiA+ICAgc2g6
IGVjb3ZlYzI0OiBkb24ndCBzZXQgdW51c2VkIGZpZWxkcyBpbiBwbGF0Zm9ybSBkYXRhCj4gPiA+
ICAgYmFja2xpZ2h0OiBncGlvOiByZW1vdmUgdW51c2VkIGZpZWxkcyBmcm9tIHBsYXRmb3JtIGRh
dGEKPiA+ID4gICBiYWNrbGlnaHQ6IGdwaW86IHJlbW92ZSBkZXYgZnJvbSBzdHJ1Y3QgZ3Bpb19i
YWNrbGlnaHQKPiA+ID4gICBiYWNrbGlnaHQ6IGdwaW86IHJlbW92ZSBkZWZfdmFsdWUgZnJvbSBz
dHJ1Y3QgZ3Bpb19iYWNrbGlnaHQKPiA+ID4gICBiYWNrbGlnaHQ6IGdwaW86IHVzZSBhIGhlbHBl
ciB2YXJpYWJsZSBmb3IgJnBkZXYtPmRldgo+ID4gPgo+ID4gPiAgYXJjaC9zaC9ib2FyZHMvbWFj
aC1lY292ZWMyNC9zZXR1cC5jICAgICAgICAgfCAzMyArKysrKystLQo+ID4gPiAgZHJpdmVycy92
aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYyAgICAgfCA4MiArKysrKy0tLS0tLS0tLS0t
LS0tLQo+ID4gPiAgaW5jbHVkZS9saW51eC9wbGF0Zm9ybV9kYXRhL2dwaW9fYmFja2xpZ2h0Lmgg
fCAgMyAtCj4gPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDQ0IGluc2VydGlvbnMoKyksIDc0IGRlbGV0
aW9ucygtKQo+ID4gPgo+ID4gPiAtLQo+ID4gPiAyLjIxLjAKPiA+ID4KPiA+Cj4gPiBIaSBSaWNo
LCBZb3NoaW5vcmksCj4gPgo+ID4gY2FuIHlvdSBhY2sgdGhlIHNoIHBhdGNoZXMgaW4gdGhpcyBz
ZXJpZXM/Cj4gPgo+ID4gQmFydAo+Cj4gUGluZy4KCkhpLAoKYW55IGNoYW5jZSBvZiBnZXR0aW5n
IHRoaXMgcmV2aWV3ZWQgZm9yIHNoPwoKQmFydApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
