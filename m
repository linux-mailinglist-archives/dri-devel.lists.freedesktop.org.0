Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0108571984
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 15:40:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E27866E28E;
	Tue, 23 Jul 2019 13:40:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 006256E28E
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 13:40:25 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id r1so43223974wrl.7
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 06:40:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=Q1RW+7WTKu2ChwwqlFBnnA2Rj8nJVJpbRqrmrkf5EEQ=;
 b=IQmOUL5HWAZzvJB+LogoGrA+u2Rtu46PeO2wyEoF2lIT2AjCbUwmvKOhyME39iBZFq
 bG+JDc3HPOYrEuBw1oUZu2DHjEIU2T7zebZtFMUM9avjIqVyodXKIGEawjQpgiwqettR
 vJZccrSAjzQI730fTMPAaMuhmc7xMQXnAiPvN+aWXgwBK0z1ri4GevnZ5p+V8U9AFI3r
 guEZfyE0YilYLuJXB1zWCkbj1XNHyeQ85HU4Loszza/iyqnx5QuN4OA4RgvuCMQWhEfi
 QzOff2kVhPDXtx1daENDB/Ea6YOv56Lg6tXbcpfduQ+DWBcNISX9nmdsI30mXyN1C0Yj
 12MQ==
X-Gm-Message-State: APjAAAXr/CUVZs7pcK4phfcIPkGTH6MTqTg/eTJErKm2Sez7q1l2ImMh
 EltQJzR94iO4ZiWDlfZMld0xNQ==
X-Google-Smtp-Source: APXvYqzi2Mng9I27Xyg/Tj0RYk6yHHDedUhypLElGvurkGTGsxWuk3EVwBMNfBWenznT4gFozxyUJw==
X-Received: by 2002:adf:ed04:: with SMTP id a4mr75709129wro.86.1563889224613; 
 Tue, 23 Jul 2019 06:40:24 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id q10sm43171756wrf.32.2019.07.23.06.40.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 23 Jul 2019 06:40:24 -0700 (PDT)
Date: Tue, 23 Jul 2019 14:40:22 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 7/7] backlight: gpio: use a helper variable for
 &pdev->dev
Message-ID: <20190723134022.s74giqi3aq7v3djz@holly.lan>
References: <20190722150302.29526-1-brgl@bgdev.pl>
 <20190722150302.29526-8-brgl@bgdev.pl>
 <20190722160908.GZ9224@smile.fi.intel.com>
 <CAMRc=McGTk+i0SzWN7AvGu3deYbXX_rJX=7+dKRpKFPKM_qxDA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMRc=McGTk+i0SzWN7AvGu3deYbXX_rJX=7+dKRpKFPKM_qxDA@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=Q1RW+7WTKu2ChwwqlFBnnA2Rj8nJVJpbRqrmrkf5EEQ=;
 b=xSEXxIxOiTmnZaxDi2fXZ05ccWC0CcWv2io5iEuiF/kxgFafmrBskcJ0h5jC8TuAVF
 pODCm3Ynf3hm8QkPNsqA8fwzxfZMcVTUwD8RoGVe0v5DaZtH7eJkjddS0AKJqjFk+Zj1
 AkxlNEOLi/k9ofvfjsK+9fj9xHvr7n4zkrgRgv64P1yGjW95DtNGDjDiNd2JzM0XQTl9
 h7B9hueKxSZboqqPCJ4Ob7/7JYEzCwKeLC7sGB2BM5xX4rq6LEGkbihHBsdPZnzhD/8W
 LqMWpc8mjNbbY4R4SGpVezj56ly0mfqoMWD4zJc+XIfvsmzGqN3sB7vw/PDoUFnYg6rI
 x++g==
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
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-sh@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMDg6Mjk6NTJBTSArMDIwMCwgQmFydG9zeiBHb2xhc3pl
d3NraSB3cm90ZToKPiBwb24uLCAyMiBsaXAgMjAxOSBvIDE4OjA5IEFuZHkgU2hldmNoZW5rbwo+
IDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+IG5hcGlzYcWCKGEpOgo+ID4KPiA+
IE9uIE1vbiwgSnVsIDIyLCAyMDE5IGF0IDA1OjAzOjAyUE0gKzAyMDAsIEJhcnRvc3ogR29sYXN6
ZXdza2kgd3JvdGU6Cj4gPiA+IEZyb206IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJnb2xhc3pld3Nr
aUBiYXlsaWJyZS5jb20+Cj4gPiA+Cj4gPiA+IEluc3RlYWQgb2YgZGVyZWZlcmVuY2luZyBwZGV2
IGVhY2ggdGltZSwgdXNlIGEgaGVscGVyIHZhcmlhYmxlIGZvcgo+ID4gPiB0aGUgYXNzb2NpYXRl
ZCBkZXZpY2UgcG9pbnRlci4KPiA+Cj4gPiA+ICBzdGF0aWMgaW50IGdwaW9fYmFja2xpZ2h0X3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiA+ICB7Cj4gPiA+IC0gICAgIHN0
cnVjdCBncGlvX2JhY2tsaWdodF9wbGF0Zm9ybV9kYXRhICpwZGF0YSA9Cj4gPiA+IC0gICAgICAg
ICAgICAgZGV2X2dldF9wbGF0ZGF0YSgmcGRldi0+ZGV2KTsKPiA+ID4gKyAgICAgc3RydWN0IGdw
aW9fYmFja2xpZ2h0X3BsYXRmb3JtX2RhdGEgKnBkYXRhOwo+ID4gPiAgICAgICBzdHJ1Y3QgYmFj
a2xpZ2h0X3Byb3BlcnRpZXMgcHJvcHM7Cj4gPiA+ICAgICAgIHN0cnVjdCBiYWNrbGlnaHRfZGV2
aWNlICpibDsKPiA+ID4gICAgICAgc3RydWN0IGdwaW9fYmFja2xpZ2h0ICpnYmw7Cj4gPiA+ICAg
ICAgIGVudW0gZ3Bpb2RfZmxhZ3MgZmxhZ3M7Cj4gPiA+ICsgICAgIHN0cnVjdCBkZXZpY2UgKmRl
djsKPiA+Cj4gPiBDYW4ndCB3ZSBkbwo+ID4KPiA+ICAgICAgICAgc3RydWN0IGRldmljZSBkZXYg
PSAmcGRldi0+ZGV2Owo+ID4gICAgICAgICBzdHJ1Y3QgZ3Bpb19iYWNrbGlnaHRfcGxhdGZvcm1f
ZGF0YSAqcGRhdGEgPSBkZXZfZ2V0X3BsYXRkYXRhKGRldik7Cj4gPgo+ID4gPyBJdCBmaXRzIDgw
IG5pY2VseS4KPiA+Cj4gCj4gSU1PIGl0J3MgbW9yZSByZWFkYWJsZSBsaWtlIHRoYXQgd2l0aCB0
aGUgcmV2ZXJzZSBjaHJpc3RtYXMgdHJlZSBsYXlvdXQuCgpUaGVyZSBpcyBubyByZXF1aXJlbWVu
dCBmb3IgcmV2ZXJzZSBjaHJpc3RtYXMgdHJlZSBsYXlvdXQgZm9yIHRoaXMgYXJlYQpvZiB0aGUg
a2VybmVsIChhbmQgZXNwZWNpYWxseSBub3Qgd2hlcmUgUkNUTCBpcyB1c2VkIGFzIGEganVzdGlm
aWNhdGlvbgp0byBhdm9pZCBpbml0aWFsaXplcnMpLgoKSSBoYXZlIGEgd2VhayBwZXJzb25hbCBw
cmVmZXJlbmNlIGZvciBpbml0aWFsaXplcnMgYWx0aG91Z2ggaXQgaXMKc3VmZmljaWVudGx5IHdl
YWsgSSB3YXMgaGFwcHkgdG8gcHV0IGEgcmV2aWV3ZWQgYnkgb24gdGhlIG9yaWdpbmFsCnBhdGNo
IHdpdGhvdXQgY29tbWVudC4KCgpEYW5pZWwuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
