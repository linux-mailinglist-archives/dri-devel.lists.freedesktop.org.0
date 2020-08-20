Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7BB24B903
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 13:38:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7F726E0BC;
	Thu, 20 Aug 2020 11:38:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D4336E0BC
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 11:38:21 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 9so1279629wmj.5
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 04:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=PCqH5LYqH1fQoc2ZlhhcJpxej9fx4SNk/neUhLB5CXQ=;
 b=kWqe/UA4IlH3O+11v3/2px5lEMFfQ31ZebCjBKikx+V66zCdAJ6QLVvHLBkY70i761
 wF8hZrIdwtgxAuHYBU2TDAMny5PvAVi5kMr3WCKAZ6FdMxZXpNosxy+pu+j16mG/P7uy
 aQQltE97czfbBK1YLITqKzGzI1/kf/GquhMGxLZo5txY/v3gbLAjlM895Af/QZV/VORd
 HjIcHMUVyEWjZ6vgziSlnrCppksKhT6SwjVD5f9CprcPFHSI87duwPVtC6dVG6dk7UNB
 b1haTbJ+tAx0cSoR/WeoIxmT2JA4DwlEF35dQe+BcS0Fq0zF/SId8/OOc6gz3Me5kSnU
 9zbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=PCqH5LYqH1fQoc2ZlhhcJpxej9fx4SNk/neUhLB5CXQ=;
 b=Ykt2r0/REE6TibXdJB+8cHEbJ6Sr855vlzUizxSw7+dm/1DyZqaCqrsUaQ15Eg/9bO
 R9SKP4K2berz6dP/KO3NAyC7Rrd/8O9w7RFT4nLd006+i0x+zkcQyhtZJQOZPRQIdMXH
 GB6o6ofoAgr1TS99o9E4DyhwjUBIX/xuRn4Q2WPnCrdtBiclw+JNvNrzGdWXzoLDSeWN
 Hn3OfBZcyVauLaLoEIlSKnSp+cU1nAxf4nNiC3E4dJJrwU19OftSfwtbRenJ9UrbHEmZ
 IAmzAtbV952A5lMPZJinDXRw/bKIixA6Gq5k0L+WqxDHGAA9SQUefDTjp5A6nwg1as18
 nhaA==
X-Gm-Message-State: AOAM530q1/G5hFj/QavSStuKxJN1L3kzdt+n9rxB6uDwoXpCAHgb5BzC
 j0Hxa1v7Hn3URmmvsgCEKTxwxg==
X-Google-Smtp-Source: ABdhPJz1Apj5RkSqr5Zdm+oy3sNRrie8RiOBYxfJ9CWqRIIWRLTwgUwaX0GjKX0vwV4cMAhQPZlwAQ==
X-Received: by 2002:a05:600c:2157:: with SMTP id
 v23mr3002981wml.38.1597923499804; 
 Thu, 20 Aug 2020 04:38:19 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id j11sm3792749wrw.79.2020.08.20.04.38.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 04:38:19 -0700 (PDT)
Date: Thu, 20 Aug 2020 12:38:17 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] video: backlight: sky81452-backlight: Fix reference
 count imbalance on error
Message-ID: <20200820113817.742yvjvdy7a642ew@holly.lan>
References: <321fb03d-2307-7f60-f437-cfb99184dfd6@web.de>
 <20200819165702.GC3248864@dell>
 <217e3c0c.b58c.17409fd7496.Coremail.dinghao.liu@zju.edu.cn>
 <20200820062301.GD3248864@dell>
 <3f9fbdb1.bc96.1740a9560d5.Coremail.dinghao.liu@zju.edu.cn>
 <20200820074916.GE3248864@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200820074916.GE3248864@dell>
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Gyungoh Yoo <jack.yoo@skyworksinc.com>, Bryan Wu <cooloney@gmail.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Markus Elfring <Markus.Elfring@web.de>,
 dinghao.liu@zju.edu.cn, Jingoo Han <jingoohan1@gmail.com>,
 Kangjie Lu <kjlu@umn.edu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMjAsIDIwMjAgYXQgMDg6NDk6MTZBTSArMDEwMCwgTGVlIEpvbmVzIHdyb3Rl
Ogo+IE9uIFRodSwgMjAgQXVnIDIwMjAsIGRpbmdoYW8ubGl1QHpqdS5lZHUuY24gd3JvdGU6Cj4g
Cj4gPiA+IE9uIFRodSwgMjAgQXVnIDIwMjAsIGRpbmdoYW8ubGl1QHpqdS5lZHUuY24gd3JvdGU6
Cj4gPiA+IAo+ID4gPiA+ID4gT24gV2VkLCAxOSBBdWcgMjAyMCwgTWFya3VzIEVsZnJpbmcgd3Jv
dGU6Cj4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiBXaGVuIG9mX3Byb3BlcnR5X3JlYWRfdTMyX2Fy
cmF5KCkgcmV0dXJucyBhbiBlcnJvciBjb2RlLAo+ID4gPiA+ID4gPiA+IGEgcGFpcmluZyByZWZj
b3VudCBkZWNyZW1lbnQgaXMgbmVlZGVkIHRvIGtlZXAgbnAncyByZWZjb3VudCBiYWxhbmNlZC4K
PiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IENhbiBhbm90aGVyIGltcGVyYXRpdmUgd29yZGluZyBi
ZSBoZWxwZnVsIGZvciB0aGUgY2hhbmdlIGRlc2NyaXB0aW9uPwo+ID4gPiA+ID4gPiBodHRwczov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5n
aXQvdHJlZS9Eb2N1bWVudGF0aW9uL3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVzLnJzdD9pZD0x
ODQ0NWJmNDA1Y2IzMzExMTdiYzk4NDI3YjFiYTZmMTI0MThhZDE3I24xNTEKPiA+ID4gPiA+ID4g
Cj4gPiA+ID4gPiA+IFdvdWxkIGFuIG90aGVyIGNvbW1pdCBtZXNzYWdlIGJlIGEgYml0IG5pY2Vy
Pwo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IOKApgo+ID4gPiA+ID4gPiA+
ICsrKyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3NreTgxNDUyLWJhY2tsaWdodC5jCj4gPiA+
ID4gPiA+ID4gQEAgLTIxNyw2ICsyMTcsNyBAQCBzdGF0aWMgc3RydWN0IHNreTgxNDUyX2JsX3Bs
YXRmb3JtX2RhdGEgKnNreTgxNDUyX2JsX3BhcnNlX2R0KAo+ID4gPiA+ID4gPiA+ICAJCQkJCW51
bV9lbnRyeSk7Cj4gPiA+ID4gPiA+ID4gIAkJaWYgKHJldCA8IDApIHsKPiA+ID4gPiA+ID4gPiAg
CQkJZGV2X2VycihkZXYsICJsZWQtc291cmNlcyBub2RlIGlzIGludmFsaWQuXG4iKTsKPiA+ID4g
PiA+ID4gPiArCQkJb2Zfbm9kZV9wdXQobnApOwo+ID4gPiA+ID4gPiA+ICAJCQlyZXR1cm4gRVJS
X1BUUigtRUlOVkFMKTsKPiA+ID4gPiA+ID4gPiAgCQl9Cj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4g
PiBJIHByb3Bvc2UgdG8gYWRkIHRoZSBqdW1wIHRhcmdldCDigJxwdXRfbm9kZeKAnSBzbyB0aGF0
IGEgYml0IG9mIGNvbW1vbiBleGNlcHRpb24KPiA+ID4gPiA+ID4gaGFuZGxpbmcgY29kZSBjYW4g
YmUgYmV0dGVyIHJldXNlZCBhdCB0aGUgZW5kIG9mIHRoaXMgZnVuY3Rpb24gaW1wbGVtZW50YXRp
b24uCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBSZWdhcmRzLAo+ID4gPiA+ID4gPiBNYXJrdXMK
PiA+ID4gPiA+IAo+ID4gPiA+ID4gWW91IGNhbiBzYWZlbHkgaWdub3JlIGFueSByZXZpZXcgY29t
bWVudHMgZnJvbSBNYXJrdXMhCj4gPiA+ID4gPiAKPiA+ID4gPiA+IEhvd2V2ZXIsIHRoaXMgcGF0
Y2ggZG9lc24ndCBhcHBlYXIgdG8gYmUgaW4gbXkgaW5ib3guCj4gPiA+ID4gPiAKPiA+ID4gPiA+
IEFueSBpZGVhcyBhcyB0byB3aHk/Cj4gPiA+ID4gPiAKPiA+ID4gPiAKPiA+ID4gPiBUaGFuayB5
b3UgZm9yIHlvdXIgYWR2aWNlLiBNeSBvdXRib3ggc2hvd3MgdGhhdCB0aGlzIHBhdGNoCj4gPiA+
ID4gaGFzIHJlYWNoZWQgeW91ciBlbWFpbCBzZXJ2ZXIgc3VjY2Vzc2Z1bGx5LiBNYXliZSB0aGlz
Cj4gPiA+ID4gZW5kZWQgdXAgaW4geW91ciBqdW5rIG1haWwgZmlsZT8KPiA+ID4gCj4gPiA+IFRo
aXMgaGFzIGhhcHBlbmVkIHJlY2VudGx5LCBzbyBJIHdhcyBzdXJlIHRvIGNoZWNrLgo+ID4gPiAK
PiA+ID4gTm90IHRoZXJlIGVpdGhlciB1bmZvcnR1bmF0ZWx5Lgo+ID4gPiAKPiA+ID4gV291bGQg
eW91IGJlIGtpbmQgZW5vdWdoIHRvIGJvdW5jZS9yZXNlbmQgcGxlYXNlPwo+ID4gCj4gPiBTdXJl
Lgo+IAo+IExvb2tzIGxpa2UgeW91IHNlbnQgaXQgKm9ubHkqIHRvIG1lLiAgUGxlYXNlIGtlZXAg
ZXZlcnlvbmUgZWxzZSBpbiBDYwo+IHdoZW4gZG9pbmcgdGhhdCwgb3IgSSBjYW4ndCByZXNwb25k
IHRvIGV2ZXJ5b25lLgo+IAo+IEFueXdheSwgYmVzaWRlcyB0aGUgc3ViamVjdCBsaW5lICh3aGlj
aCBJIGNhbiBmaXggZWFzaWx5KSwgdGhlIHBhdGNoCj4gbG9va3MgZ29vZCB0byBtZSwgYnV0IERh
bmllbCBUIG11c3QgcmV2aWV3LgoKSSd2ZSBhbHJlYWR5IG9mZmVyZWQgYSBSZXZpZXdlZC1ieSBm
b3IgdGhpcyBwYXRjaC4gUGVyaGFwcyBpdCBsYW5kZWQgaW4KdGhlIHNhbWUgcGxhY2UgYXMgdGhl
IG9yaWdpbmFsIHBhdGNoLi4uCgoKRGFuaWVsLgoKPiAKPiBSZXZpZXdlZC1ieTogTGVlIEpvbmVz
IDxsZWUuam9uZXNAbGluYXJvLm9yZz4KCj4gCj4gLS0KPiBMZWUgSm9uZXMgW+adjueQvOaWr10K
PiBTZW5pb3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMKPiBMaW5hcm8ub3Jn
IOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKPiBGb2xsb3cgTGluYXJvOiBG
YWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
