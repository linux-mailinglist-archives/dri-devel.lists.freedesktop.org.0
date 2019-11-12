Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D6EF9AEC
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 21:42:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED5F889DB2;
	Tue, 12 Nov 2019 20:42:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36A2B89395
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 20:42:24 +0000 (UTC)
Received: by mail-yb1-xb43.google.com with SMTP id y18so21260ybs.7
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 12:42:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DjCiefqhC9NfqWC/1OWuy32sE5JWmV0rJU7JOPNgew0=;
 b=gjUW3G8263CqkIFlG/e5afnBwgxL1+7IfoVML95CZmAptXz2RanW2hVwSBNQHtYRj9
 jdSmQpwyKA7rqzyNuXFGSxecCO6Dy/eWV6PDXi7Pa5Hbx5xQqO2Bix51SBYk2B4HywpQ
 Z9JoOeYv9i35u1qokQK9nwLo00bqTO88NskkRHl88RdA6bc0JM0NkV67OVaLR/8AbdAt
 LRq4Vz3LFNiyMlhaqzSWUXGo2VdoOn4viWEz1wzPR9aaaZtjsbsG4ZjRez1GL7qNlKz9
 yhidzbZzw5CBB0QF4OyJPmMiqK5nN7UUtTtBaSQetE65a9HFeNJFVdTNQT6LzlsFezsf
 GwYA==
X-Gm-Message-State: APjAAAUXUkcA3cTaM1JNIVtwleFxd2D+l6q9JySmLyUGG8c0Bj33XDUU
 vFBRy5GIVcrRPQPTWpfE6HnCNQ==
X-Google-Smtp-Source: APXvYqyYtUgeVlNwdv9fMm8VoUMF8TaIvGt5yJhxR65GCBa+3/C4/0mBjyFFaaUNb80Ijg+1jMj5gA==
X-Received: by 2002:a25:7583:: with SMTP id q125mr2877735ybc.28.1573591343192; 
 Tue, 12 Nov 2019 12:42:23 -0800 (PST)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id 138sm9476213ywr.46.2019.11.12.12.42.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 12:42:22 -0800 (PST)
Date: Tue, 12 Nov 2019 15:42:22 -0500
From: Sean Paul <sean@poorly.run>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 1/4] drm/msm: fix memleak on release
Message-ID: <20191112204222.GB25787@art_vandelay>
References: <20191010131333.23635-1-johan@kernel.org>
 <20191010131333.23635-2-johan@kernel.org>
 <20191030100146.GC4691@localhost>
 <20191112104001.GP11035@localhost>
 <20191112140155.GJ23790@phenom.ffwll.local>
 <CAF6AEGvom2wZ89434VLhhgAHCk_MMCGRbxSO+DQsX=+LPOCy8A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGvom2wZ89434VLhhgAHCk_MMCGRbxSO+DQsX=+LPOCy8A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=DjCiefqhC9NfqWC/1OWuy32sE5JWmV0rJU7JOPNgew0=;
 b=W944HHeBKCxkA8DrDh1k5jwoR6EZOWptr72GU329mg37lMtwT4iUEUZ8MibJm1WXxY
 mp7Vd5ttNkK4CKdk10wHGc7YF9Rmc7Qp+ybpA4tYo7/O523giEtR7c+XhEyDLATnYhVb
 IHC5y7twtbRJyIHHZRzoKP5vi4ejGXVr27T0mo7g73zutfQIeyf6oGcvFewyLk2NPWyf
 q8dSyuNzqh3edUolXoBkZG1uAJt7F9zXjjeQZ8cmV2aXlwTzMa1bBwazwh9AoGVjpztq
 ROJ96zgqiMdd32cZMSWhMI6OeGD1IF1ynEhs9KMTYO6cZ/2BMyturVgRm8wJtwJzGjPa
 d2sA==
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Johan Hovold <johan@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Fabien Dessenne <fabien.dessenne@st.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>, stable <stable@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Paul <sean@poorly.run>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTIsIDIwMTkgYXQgMDg6MzI6MDdBTSAtMDgwMCwgUm9iIENsYXJrIHdyb3Rl
Ogo+IE9uIFR1ZSwgTm92IDEyLCAyMDE5IGF0IDY6MDEgQU0gRGFuaWVsIFZldHRlciA8ZGFuaWVs
QGZmd2xsLmNoPiB3cm90ZToKPiA+Cj4gPiBPbiBUdWUsIE5vdiAxMiwgMjAxOSBhdCAxMTo0MDow
MUFNICswMTAwLCBKb2hhbiBIb3ZvbGQgd3JvdGU6Cj4gPiA+IE9uIFdlZCwgT2N0IDMwLCAyMDE5
IGF0IDExOjAxOjQ2QU0gKzAxMDAsIEpvaGFuIEhvdm9sZCB3cm90ZToKPiA+ID4gPiBPbiBUaHUs
IE9jdCAxMCwgMjAxOSBhdCAwMzoxMzozMFBNICswMjAwLCBKb2hhbiBIb3ZvbGQgd3JvdGU6Cj4g
PiA+ID4gPiBJZiBhIHByb2Nlc3MgaXMgaW50ZXJydXB0ZWQgd2hpbGUgYWNjZXNzaW5nIHRoZSAi
Z3B1IiBkZWJ1Z2ZzIGZpbGUgYW5kCj4gPiA+ID4gPiB0aGUgZHJtIGRldmljZSBzdHJ1Y3RfbXV0
ZXggaXMgY29udGVuZGVkLCByZWxlYXNlKCkgY291bGQgcmV0dXJuIGVhcmx5Cj4gPiA+ID4gPiBh
bmQgZmFpbCB0byBmcmVlIHJlbGF0ZWQgcmVzb3VyY2VzLgo+ID4gPiA+ID4KPiA+ID4gPiA+IE5v
dGUgdGhhdCB0aGUgcmV0dXJuIHZhbHVlIGZyb20gcmVsZWFzZSgpIGlzIGlnbm9yZWQuCj4gPiA+
ID4gPgo+ID4gPiA+ID4gRml4ZXM6IDRmNzc2ZjQ1MTFjNyAoImRybS9tc20vZ3B1OiBDb252ZXJ0
IHRoZSBHUFUgc2hvdyBmdW5jdGlvbiB0byB1c2UgdGhlIEdQVSBzdGF0ZSIpCj4gPiA+ID4gPiBD
Yzogc3RhYmxlIDxzdGFibGVAdmdlci5rZXJuZWwub3JnPiAgICAgIyA0LjE4Cj4gPiA+ID4gPiBD
YzogSm9yZGFuIENyb3VzZSA8amNyb3VzZUBjb2RlYXVyb3JhLm9yZz4KPiA+ID4gPiA+IENjOiBS
b2IgQ2xhcmsgPHJvYmRjbGFya0BnbWFpbC5jb20+Cj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBK
b2hhbiBIb3ZvbGQgPGpvaGFuQGtlcm5lbC5vcmc+Cj4gPiA+ID4gPiAtLS0KPiA+ID4gPgo+ID4g
PiA+IFJvYiwgU2VhbiwKPiA+ID4gPgo+ID4gPiA+IFNlbmRpbmcgYSByZW1pbmRlciBhYm91dCB0
aGlzIG9uZSwgd2hpY2ggaXMgbm90IHlldCBpbiBsaW51eC1uZXh0Lgo+ID4gPiA+Cj4gPiA+ID4g
UGVyaGFwcyBEYW5pZWwgY2FuIHBpY2sgaXQgdXAgb3RoZXJ3aXNlPwo+ID4gPgo+ID4gPiBBbm90
aGVyIHR3byB3ZWVrcywgYW5vdGhlciByZW1pbmRlci4gVGhpcyBvbmUgaXMgc3RpbGwgbm90IGlu
IC1uZXh0Lgo+ID4KPiA+IFdlbGwgbXNtIGlzIG1haW50YWluZWQgaW4gYSBzZXBhcmF0ZSB0cmVl
LCBzbyB0aGUgdXN1YWwgZ3JvdXAgbWFpbnRhaW5lcgo+ID4gZmFsbGJhY2sgZm9yIHdoZW4gcGF0
Y2hlcyBhcmUgc3R1Y2sgZG9lc24ndCBhcHBseS4KPiAKPiBvaCwgc29ycnksIHRoaXMgd2Fzbid0
IHNob3dpbmcgdXAgaW4gcGF0Y2h3b3JrLi4gb3IgcmF0aGVyIGl0IGRpZCBidXQKPiB0aGUgbm9u
LW1zbSByZWxhdGVkIHNlcmllcyBzdWJqZWN0IG1hZGUgbWUgb3Zlcmxvb2sgaXQuCj4gCj4gSSd2
ZSBhbHJlYWR5IHNlbnQgYSBQUiwgYnV0IHRoaXMgc2hvdWxkbid0IGNvbmZsaWN0IHdpdGggYW55
dGhpbmcgYW5kCj4gSSB0aGluayBpdCBjYW4gZ28gaW4gdmlhIGRybS1taXNjL2ZpeGVzCj4gCj4g
UmV2aWV3ZWQtYnk6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGdtYWlsLmNvbT4KClRoYW5rcyBmb3Ig
dGhlIHBhdGNoLCBwdXNoZWQgdG8gZHJtLW1pc2MtbmV4dC1maXhlcwoKU2VhbgoKPiAKPiA+IFJv
YiwgU2VhbiwgdGltZSB0byByZWNvbnNpZGVyIGRybS1taXNjIGZvciBtc20/IEkgdGhpbmsgdGhl
cmUncyBzb21lIG1vcmUKPiA+IG9kZGJhbGwgcGF0Y2hlcyB0aGF0IG9jY2FzaW9uYWxseSBnZXQg
c3R1Y2sgZm9yIG1zbSAuLi4KPiA+Cj4gPiBBbHNvICtEYXZlLgo+ID4gLURhbmllbAo+ID4KPiA+
ID4KPiA+ID4gSm9oYW4KPiA+ID4KPiA+ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9k
ZWJ1Z2ZzLmMgfCA2ICstLS0tLQo+ID4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgNSBkZWxldGlvbnMoLSkKPiA+ID4gPiA+Cj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL21zbS9tc21fZGVidWdmcy5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21f
ZGVidWdmcy5jCj4gPiA+ID4gPiBpbmRleCA2YmU4Nzk1NzgxNDAuLjFjNzQzODFhNGZjOSAxMDA2
NDQKPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2RlYnVnZnMuYwo+ID4g
PiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZGVidWdmcy5jCj4gPiA+ID4gPiBA
QCAtNDcsMTIgKzQ3LDggQEAgc3RhdGljIGludCBtc21fZ3B1X3JlbGVhc2Uoc3RydWN0IGlub2Rl
ICppbm9kZSwgc3RydWN0IGZpbGUgKmZpbGUpCj4gPiA+ID4gPiAgIHN0cnVjdCBtc21fZ3B1X3No
b3dfcHJpdiAqc2hvd19wcml2ID0gbS0+cHJpdmF0ZTsKPiA+ID4gPiA+ICAgc3RydWN0IG1zbV9k
cm1fcHJpdmF0ZSAqcHJpdiA9IHNob3dfcHJpdi0+ZGV2LT5kZXZfcHJpdmF0ZTsKPiA+ID4gPiA+
ICAgc3RydWN0IG1zbV9ncHUgKmdwdSA9IHByaXYtPmdwdTsKPiA+ID4gPiA+IC0gaW50IHJldDsK
PiA+ID4gPiA+IC0KPiA+ID4gPiA+IC0gcmV0ID0gbXV0ZXhfbG9ja19pbnRlcnJ1cHRpYmxlKCZz
aG93X3ByaXYtPmRldi0+c3RydWN0X211dGV4KTsKPiA+ID4gPiA+IC0gaWYgKHJldCkKPiA+ID4g
PiA+IC0gICAgICAgICByZXR1cm4gcmV0Owo+ID4gPiA+ID4KPiA+ID4gPiA+ICsgbXV0ZXhfbG9j
aygmc2hvd19wcml2LT5kZXYtPnN0cnVjdF9tdXRleCk7Cj4gPiA+ID4gPiAgIGdwdS0+ZnVuY3Mt
PmdwdV9zdGF0ZV9wdXQoc2hvd19wcml2LT5zdGF0ZSk7Cj4gPiA+ID4gPiAgIG11dGV4X3VubG9j
aygmc2hvd19wcml2LT5kZXYtPnN0cnVjdF9tdXRleCk7Cj4gPgo+ID4gLS0KPiA+IERhbmllbCBW
ZXR0ZXIKPiA+IFNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgo+ID4gaHR0cDov
L2Jsb2cuZmZ3bGwuY2gKCi0tIApTZWFuIFBhdWwsIFNvZnR3YXJlIEVuZ2luZWVyLCBHb29nbGUg
LyBDaHJvbWl1bSBPUwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
