Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9D6F8CFE
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 11:40:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80F186EB00;
	Tue, 12 Nov 2019 10:39:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 966A66E3EC;
 Tue, 12 Nov 2019 10:39:56 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id j26so5328207lfh.7;
 Tue, 12 Nov 2019 02:39:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XWXqgjsblbcyWM0h2meBDVZ+XPFRuLEW2MPm0S54S/s=;
 b=L2JboYZ3gg+oFl8izuBGzPzVM3y2adU/wawLStkCRpKtDyzNs/eaHKSZ2npBnjJ8c+
 tZoSOn4vsAQiGtmH2xKFHUK3mBKWn+MczP6dkICB9Cx3Mj5R/WDLbVREa7U7DrD4X4dz
 DhBrVG8Vmh6misW02lFRIM1d4S3DTr1Ao/VtY0/DQtQ0JVbRPBdjsQ2Nk4Gf43n4FxZj
 PlXIVHV4gVzudD/o2WGTmssX/fi22GHBW2Fb7QdqXk5wE0MAZbU4l6mNFQovd66ZmY4H
 isQPw/wInZ8CT/txplUVJrysuUFIw3VloEr9Ph2/++kU/JGJnOR1kpCb5n3BhdmGqcWh
 L1jw==
X-Gm-Message-State: APjAAAXkJY6Ka1TtlJZ/YtNM3c8xvYA4Uo+RqGQFLB+qgKxqpcW3Jd2v
 DiWVjECg2bsGm5ELn1k45nw=
X-Google-Smtp-Source: APXvYqxbw5J+tzBKcx+QigjOviaP1PWngnIR6FhtuOsFfYfySEHZWhgInymsNuVEPwxpwVY/mq8xpg==
X-Received: by 2002:a05:6512:21e:: with SMTP id
 a30mr8849014lfo.76.1573555194825; 
 Tue, 12 Nov 2019 02:39:54 -0800 (PST)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se.
 [85.224.241.81])
 by smtp.gmail.com with ESMTPSA id d24sm3344144ljg.73.2019.11.12.02.39.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 02:39:54 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
 (envelope-from <johan@kernel.org>)
 id 1iUTab-0000IZ-1b; Tue, 12 Nov 2019 11:40:01 +0100
Date: Tue, 12 Nov 2019 11:40:01 +0100
From: Johan Hovold <johan@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/4] drm/msm: fix memleak on release
Message-ID: <20191112104001.GP11035@localhost>
References: <20191010131333.23635-1-johan@kernel.org>
 <20191010131333.23635-2-johan@kernel.org>
 <20191030100146.GC4691@localhost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191030100146.GC4691@localhost>
User-Agent: Mutt/1.12.2 (2019-09-21)
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

T24gV2VkLCBPY3QgMzAsIDIwMTkgYXQgMTE6MDE6NDZBTSArMDEwMCwgSm9oYW4gSG92b2xkIHdy
b3RlOgo+IE9uIFRodSwgT2N0IDEwLCAyMDE5IGF0IDAzOjEzOjMwUE0gKzAyMDAsIEpvaGFuIEhv
dm9sZCB3cm90ZToKPiA+IElmIGEgcHJvY2VzcyBpcyBpbnRlcnJ1cHRlZCB3aGlsZSBhY2Nlc3Np
bmcgdGhlICJncHUiIGRlYnVnZnMgZmlsZSBhbmQKPiA+IHRoZSBkcm0gZGV2aWNlIHN0cnVjdF9t
dXRleCBpcyBjb250ZW5kZWQsIHJlbGVhc2UoKSBjb3VsZCByZXR1cm4gZWFybHkKPiA+IGFuZCBm
YWlsIHRvIGZyZWUgcmVsYXRlZCByZXNvdXJjZXMuCj4gPiAKPiA+IE5vdGUgdGhhdCB0aGUgcmV0
dXJuIHZhbHVlIGZyb20gcmVsZWFzZSgpIGlzIGlnbm9yZWQuCj4gPiAKPiA+IEZpeGVzOiA0Zjc3
NmY0NTExYzcgKCJkcm0vbXNtL2dwdTogQ29udmVydCB0aGUgR1BVIHNob3cgZnVuY3Rpb24gdG8g
dXNlIHRoZSBHUFUgc3RhdGUiKQo+ID4gQ2M6IHN0YWJsZSA8c3RhYmxlQHZnZXIua2VybmVsLm9y
Zz4gICAgICMgNC4xOAo+ID4gQ2M6IEpvcmRhbiBDcm91c2UgPGpjcm91c2VAY29kZWF1cm9yYS5v
cmc+Cj4gPiBDYzogUm9iIENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPgo+ID4gU2lnbmVkLW9m
Zi1ieTogSm9oYW4gSG92b2xkIDxqb2hhbkBrZXJuZWwub3JnPgo+ID4gLS0tCj4gCj4gUm9iLCBT
ZWFuLAo+IAo+IFNlbmRpbmcgYSByZW1pbmRlciBhYm91dCB0aGlzIG9uZSwgd2hpY2ggaXMgbm90
IHlldCBpbiBsaW51eC1uZXh0Lgo+IAo+IFBlcmhhcHMgRGFuaWVsIGNhbiBwaWNrIGl0IHVwIG90
aGVyd2lzZT8KCkFub3RoZXIgdHdvIHdlZWtzLCBhbm90aGVyIHJlbWluZGVyLiBUaGlzIG9uZSBp
cyBzdGlsbCBub3QgaW4gLW5leHQuCgpKb2hhbgoKPiA+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL21z
bV9kZWJ1Z2ZzLmMgfCA2ICstLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgNSBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9t
c20vbXNtX2RlYnVnZnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2RlYnVnZnMuYwo+ID4g
aW5kZXggNmJlODc5NTc4MTQwLi4xYzc0MzgxYTRmYzkgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vbXNtL21zbV9kZWJ1Z2ZzLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20v
bXNtX2RlYnVnZnMuYwo+ID4gQEAgLTQ3LDEyICs0Nyw4IEBAIHN0YXRpYyBpbnQgbXNtX2dwdV9y
ZWxlYXNlKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBmaWxlICpmaWxlKQo+ID4gIAlzdHJ1
Y3QgbXNtX2dwdV9zaG93X3ByaXYgKnNob3dfcHJpdiA9IG0tPnByaXZhdGU7Cj4gPiAgCXN0cnVj
dCBtc21fZHJtX3ByaXZhdGUgKnByaXYgPSBzaG93X3ByaXYtPmRldi0+ZGV2X3ByaXZhdGU7Cj4g
PiAgCXN0cnVjdCBtc21fZ3B1ICpncHUgPSBwcml2LT5ncHU7Cj4gPiAtCWludCByZXQ7Cj4gPiAt
Cj4gPiAtCXJldCA9IG11dGV4X2xvY2tfaW50ZXJydXB0aWJsZSgmc2hvd19wcml2LT5kZXYtPnN0
cnVjdF9tdXRleCk7Cj4gPiAtCWlmIChyZXQpCj4gPiAtCQlyZXR1cm4gcmV0Owo+ID4gIAo+ID4g
KwltdXRleF9sb2NrKCZzaG93X3ByaXYtPmRldi0+c3RydWN0X211dGV4KTsKPiA+ICAJZ3B1LT5m
dW5jcy0+Z3B1X3N0YXRlX3B1dChzaG93X3ByaXYtPnN0YXRlKTsKPiA+ICAJbXV0ZXhfdW5sb2Nr
KCZzaG93X3ByaXYtPmRldi0+c3RydWN0X211dGV4KTsKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
