Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DED8EE999D
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2019 11:03:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12BCC6E914;
	Wed, 30 Oct 2019 10:03:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22B1D6E910;
 Wed, 30 Oct 2019 10:03:07 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id t16so1581437wrr.1;
 Wed, 30 Oct 2019 03:03:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=FMrNiLDlAG4LHDqZ/Yl8QilQGiUU1TiZ+I44MHl2pe8=;
 b=Sk0XGKi43g06kXveL86jhbOQ2x22pwEdbwK/7QE0+5fI7LAzk4vj/fpR16Vl/rnFtW
 DYrYIMXSebBBdhihJuR6ALBbwM/vUClrWrMBuz7qVa1YyY0dV52jpV8K46yACc+Ax7rH
 LT8M+hokcATTmJM8FGD9L2j0v+oFaKvs705urHLuaVDq0WI0tpiJiEClnm7WC7TSwJIU
 pAlDO18QqTQksWdK2SI7lroW4gRK2ROFbCOQTvq5sgLXOsQoCHFCmWvCs57Bj3dSEHeo
 1vSA9d6NZrVrKuvPazfiOGpKr/gN7EGETLI+WtxWylJCkFi0RcDXFXkfXTEDsR1AqDEn
 dFHQ==
X-Gm-Message-State: APjAAAUwS5lNN6uqOabaEw7RgAPE7oI4OKhEdGnSvobnt1flEG5UjFz4
 PKKNOZPJzZKNVqRJAjp4qTc=
X-Google-Smtp-Source: APXvYqx9yWpySXQAETRsK0lzvhrydwfQ9Qwl8MxBphTqjmTCxz57hjMnqNjhMrjsPw6+qJUa5JnAIA==
X-Received: by 2002:adf:ec4b:: with SMTP id w11mr1963541wrn.243.1572429785547; 
 Wed, 30 Oct 2019 03:03:05 -0700 (PDT)
Received: from pi (100.50.158.77.rev.sfr.net. [77.158.50.100])
 by smtp.gmail.com with ESMTPSA id a11sm1768504wmh.40.2019.10.30.03.03.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2019 03:03:04 -0700 (PDT)
Received: from johan by pi with local (Exim 4.92.2) (envelope-from <johan@pi>)
 id 1iPknS-0002ZQ-F2; Wed, 30 Oct 2019 11:01:46 +0100
Date: Wed, 30 Oct 2019 11:01:46 +0100
From: Johan Hovold <johan@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/4] drm/msm: fix memleak on release
Message-ID: <20191030100146.GC4691@localhost>
References: <20191010131333.23635-1-johan@kernel.org>
 <20191010131333.23635-2-johan@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191010131333.23635-2-johan@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Johan Hovold <johan@kernel.org>,
 Fabien Dessenne <fabien.dessenne@st.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>, stable <stable@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTAsIDIwMTkgYXQgMDM6MTM6MzBQTSArMDIwMCwgSm9oYW4gSG92b2xkIHdy
b3RlOgo+IElmIGEgcHJvY2VzcyBpcyBpbnRlcnJ1cHRlZCB3aGlsZSBhY2Nlc3NpbmcgdGhlICJn
cHUiIGRlYnVnZnMgZmlsZSBhbmQKPiB0aGUgZHJtIGRldmljZSBzdHJ1Y3RfbXV0ZXggaXMgY29u
dGVuZGVkLCByZWxlYXNlKCkgY291bGQgcmV0dXJuIGVhcmx5Cj4gYW5kIGZhaWwgdG8gZnJlZSBy
ZWxhdGVkIHJlc291cmNlcy4KPiAKPiBOb3RlIHRoYXQgdGhlIHJldHVybiB2YWx1ZSBmcm9tIHJl
bGVhc2UoKSBpcyBpZ25vcmVkLgo+IAo+IEZpeGVzOiA0Zjc3NmY0NTExYzcgKCJkcm0vbXNtL2dw
dTogQ29udmVydCB0aGUgR1BVIHNob3cgZnVuY3Rpb24gdG8gdXNlIHRoZSBHUFUgc3RhdGUiKQo+
IENjOiBzdGFibGUgPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+ICAgICAjIDQuMTgKPiBDYzogSm9y
ZGFuIENyb3VzZSA8amNyb3VzZUBjb2RlYXVyb3JhLm9yZz4KPiBDYzogUm9iIENsYXJrIDxyb2Jk
Y2xhcmtAZ21haWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEpvaGFuIEhvdm9sZCA8am9oYW5Aa2Vy
bmVsLm9yZz4KPiAtLS0KClJvYiwgU2VhbiwKClNlbmRpbmcgYSByZW1pbmRlciBhYm91dCB0aGlz
IG9uZSwgd2hpY2ggaXMgbm90IHlldCBpbiBsaW51eC1uZXh0LgoKUGVyaGFwcyBEYW5pZWwgY2Fu
IHBpY2sgaXQgdXAgb3RoZXJ3aXNlPwoKVGhhbmtzLApKb2hhbgoKPiAgZHJpdmVycy9ncHUvZHJt
L21zbS9tc21fZGVidWdmcy5jIHwgNiArLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCA1IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
bXNtL21zbV9kZWJ1Z2ZzLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9kZWJ1Z2ZzLmMKPiBp
bmRleCA2YmU4Nzk1NzgxNDAuLjFjNzQzODFhNGZjOSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbXNtL21zbV9kZWJ1Z2ZzLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9k
ZWJ1Z2ZzLmMKPiBAQCAtNDcsMTIgKzQ3LDggQEAgc3RhdGljIGludCBtc21fZ3B1X3JlbGVhc2Uo
c3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IGZpbGUgKmZpbGUpCj4gIAlzdHJ1Y3QgbXNtX2dw
dV9zaG93X3ByaXYgKnNob3dfcHJpdiA9IG0tPnByaXZhdGU7Cj4gIAlzdHJ1Y3QgbXNtX2RybV9w
cml2YXRlICpwcml2ID0gc2hvd19wcml2LT5kZXYtPmRldl9wcml2YXRlOwo+ICAJc3RydWN0IG1z
bV9ncHUgKmdwdSA9IHByaXYtPmdwdTsKPiAtCWludCByZXQ7Cj4gLQo+IC0JcmV0ID0gbXV0ZXhf
bG9ja19pbnRlcnJ1cHRpYmxlKCZzaG93X3ByaXYtPmRldi0+c3RydWN0X211dGV4KTsKPiAtCWlm
IChyZXQpCj4gLQkJcmV0dXJuIHJldDsKPiAgCj4gKwltdXRleF9sb2NrKCZzaG93X3ByaXYtPmRl
di0+c3RydWN0X211dGV4KTsKPiAgCWdwdS0+ZnVuY3MtPmdwdV9zdGF0ZV9wdXQoc2hvd19wcml2
LT5zdGF0ZSk7Cj4gIAltdXRleF91bmxvY2soJnNob3dfcHJpdi0+ZGV2LT5zdHJ1Y3RfbXV0ZXgp
OwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
