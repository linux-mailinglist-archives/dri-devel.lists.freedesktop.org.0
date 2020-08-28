Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 389162557A3
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 11:29:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1CA96E32F;
	Fri, 28 Aug 2020 09:29:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 407396E32F
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 09:29:08 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id b18so638935wrs.7
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 02:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=4xTbc6V9CmKW0Xfag25GTFqmyB1j/7yz22pA4imxIiw=;
 b=EhIxwGsEYrapIc1v+zaLKLGIYcC14GvP6v+Z6CbxQZEMa/D/jJzWG5jBVvI11WHLPo
 3nbqhUnLrekuaF+/5TmAc6ZtRnfsKh4Jr+fvwq/Jp+FH0oZBjMmsrJd4w2nE63zwXClW
 hMjUznVbCdsTmian9+uE5iwihyJv1HGcojCE+qijrQsxB+r7l5/2PPW1B6r4CpwiDoEN
 YUZcSvX7jukQFfuZtUH+Q+6u2Mk+KqxuSYWB6+x1KtjzB6Uz8ueSeTYY5MfPlQlxvzUR
 IDghGWFM91DUAtGWnxd+zn0anWrhpiwEDPlMD9q1z6XTm41DemxHQGzQiO3Ls2fj+TeU
 MT3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=4xTbc6V9CmKW0Xfag25GTFqmyB1j/7yz22pA4imxIiw=;
 b=jgPTe+1H8tJKUFBIcxZnAHMPqHeZO6SCFh2Czq2FWaUPoACl2/im4AZMGaxVBoQ+li
 1BEmLIo7yMR2Ut64fD4DN/OP37tNFbINw/zWZ02g8tPx/HA/Ng72YIQnuT5dW+IFYsIp
 80tgyXv4QuYdxHnhyKiiHyohqtdLUayLS7fkveyYZjOEFhRarCPwQhGrK9Sol5cH9hH4
 enmExenEBdHDi4YV2+SicZs34Ha1THa8W1DDXQ4V/KkMx2U3H5fUh0wLBuyMyZHg5ldd
 mQNiuk7PxovO2aj22aTDOr28Hy7myjLkAoj0/Iatt98vyY40cGOKelKqVnWTeNLbMdhs
 VtHA==
X-Gm-Message-State: AOAM533lRfuLA8764PxlMCSTAv9mH5/ZesFFzR7zvl9vCqpBfzUjYoet
 GgGAjgtIDtjHl1eFZueSoZfaoA==
X-Google-Smtp-Source: ABdhPJwKFt/IiE8F76uSnjKmApF3H699HkDMx4kQ2ZsuOSzw96rNCHbjHHh1HSyEmO6pjlBVe4DCjg==
X-Received: by 2002:a05:6000:4f:: with SMTP id
 k15mr642732wrx.316.1598606946784; 
 Fri, 28 Aug 2020 02:29:06 -0700 (PDT)
Received: from dell ([91.110.221.141])
 by smtp.gmail.com with ESMTPSA id j7sm1254885wmj.38.2020.08.28.02.29.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 02:29:06 -0700 (PDT)
Date: Fri, 28 Aug 2020 10:29:04 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH] video: backlight: sky81452-backlight: Fix reference
 count imbalance on error
Message-ID: <20200828092904.GD1826686@dell>
References: <321fb03d-2307-7f60-f437-cfb99184dfd6@web.de>
 <20200819165702.GC3248864@dell>
 <217e3c0c.b58c.17409fd7496.Coremail.dinghao.liu@zju.edu.cn>
 <20200820062301.GD3248864@dell>
 <3f9fbdb1.bc96.1740a9560d5.Coremail.dinghao.liu@zju.edu.cn>
 <20200820074916.GE3248864@dell>
 <20200820113817.742yvjvdy7a642ew@holly.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200820113817.742yvjvdy7a642ew@holly.lan>
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

T24gVGh1LCAyMCBBdWcgMjAyMCwgRGFuaWVsIFRob21wc29uIHdyb3RlOgoKPiBPbiBUaHUsIEF1
ZyAyMCwgMjAyMCBhdCAwODo0OToxNkFNICswMTAwLCBMZWUgSm9uZXMgd3JvdGU6Cj4gPiBPbiBU
aHUsIDIwIEF1ZyAyMDIwLCBkaW5naGFvLmxpdUB6anUuZWR1LmNuIHdyb3RlOgo+ID4gCj4gPiA+
ID4gT24gVGh1LCAyMCBBdWcgMjAyMCwgZGluZ2hhby5saXVAemp1LmVkdS5jbiB3cm90ZToKPiA+
ID4gPiAKPiA+ID4gPiA+ID4gT24gV2VkLCAxOSBBdWcgMjAyMCwgTWFya3VzIEVsZnJpbmcgd3Jv
dGU6Cj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4gV2hlbiBvZl9wcm9wZXJ0eV9yZWFkX3Uz
Ml9hcnJheSgpIHJldHVybnMgYW4gZXJyb3IgY29kZSwKPiA+ID4gPiA+ID4gPiA+IGEgcGFpcmlu
ZyByZWZjb3VudCBkZWNyZW1lbnQgaXMgbmVlZGVkIHRvIGtlZXAgbnAncyByZWZjb3VudCBiYWxh
bmNlZC4KPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiBDYW4gYW5vdGhlciBpbXBlcmF0aXZl
IHdvcmRpbmcgYmUgaGVscGZ1bCBmb3IgdGhlIGNoYW5nZSBkZXNjcmlwdGlvbj8KPiA+ID4gPiA+
ID4gPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2
YWxkcy9saW51eC5naXQvdHJlZS9Eb2N1bWVudGF0aW9uL3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRj
aGVzLnJzdD9pZD0xODQ0NWJmNDA1Y2IzMzExMTdiYzk4NDI3YjFiYTZmMTI0MThhZDE3I24xNTEK
PiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiBXb3VsZCBhbiBvdGhlciBjb21taXQgbWVzc2Fn
ZSBiZSBhIGJpdCBuaWNlcj8KPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+
ID4gPiDigKYKPiA+ID4gPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3Nr
eTgxNDUyLWJhY2tsaWdodC5jCj4gPiA+ID4gPiA+ID4gPiBAQCAtMjE3LDYgKzIxNyw3IEBAIHN0
YXRpYyBzdHJ1Y3Qgc2t5ODE0NTJfYmxfcGxhdGZvcm1fZGF0YSAqc2t5ODE0NTJfYmxfcGFyc2Vf
ZHQoCj4gPiA+ID4gPiA+ID4gPiAgCQkJCQludW1fZW50cnkpOwo+ID4gPiA+ID4gPiA+ID4gIAkJ
aWYgKHJldCA8IDApIHsKPiA+ID4gPiA+ID4gPiA+ICAJCQlkZXZfZXJyKGRldiwgImxlZC1zb3Vy
Y2VzIG5vZGUgaXMgaW52YWxpZC5cbiIpOwo+ID4gPiA+ID4gPiA+ID4gKwkJCW9mX25vZGVfcHV0
KG5wKTsKPiA+ID4gPiA+ID4gPiA+ICAJCQlyZXR1cm4gRVJSX1BUUigtRUlOVkFMKTsKPiA+ID4g
PiA+ID4gPiA+ICAJCX0KPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiBJIHByb3Bvc2UgdG8g
YWRkIHRoZSBqdW1wIHRhcmdldCDigJxwdXRfbm9kZeKAnSBzbyB0aGF0IGEgYml0IG9mIGNvbW1v
biBleGNlcHRpb24KPiA+ID4gPiA+ID4gPiBoYW5kbGluZyBjb2RlIGNhbiBiZSBiZXR0ZXIgcmV1
c2VkIGF0IHRoZSBlbmQgb2YgdGhpcyBmdW5jdGlvbiBpbXBsZW1lbnRhdGlvbi4KPiA+ID4gPiA+
ID4gPiAKPiA+ID4gPiA+ID4gPiBSZWdhcmRzLAo+ID4gPiA+ID4gPiA+IE1hcmt1cwo+ID4gPiA+
ID4gPiAKPiA+ID4gPiA+ID4gWW91IGNhbiBzYWZlbHkgaWdub3JlIGFueSByZXZpZXcgY29tbWVu
dHMgZnJvbSBNYXJrdXMhCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBIb3dldmVyLCB0aGlzIHBh
dGNoIGRvZXNuJ3QgYXBwZWFyIHRvIGJlIGluIG15IGluYm94Lgo+ID4gPiA+ID4gPiAKPiA+ID4g
PiA+ID4gQW55IGlkZWFzIGFzIHRvIHdoeT8KPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiAKPiA+ID4g
PiA+IFRoYW5rIHlvdSBmb3IgeW91ciBhZHZpY2UuIE15IG91dGJveCBzaG93cyB0aGF0IHRoaXMg
cGF0Y2gKPiA+ID4gPiA+IGhhcyByZWFjaGVkIHlvdXIgZW1haWwgc2VydmVyIHN1Y2Nlc3NmdWxs
eS4gTWF5YmUgdGhpcwo+ID4gPiA+ID4gZW5kZWQgdXAgaW4geW91ciBqdW5rIG1haWwgZmlsZT8K
PiA+ID4gPiAKPiA+ID4gPiBUaGlzIGhhcyBoYXBwZW5lZCByZWNlbnRseSwgc28gSSB3YXMgc3Vy
ZSB0byBjaGVjay4KPiA+ID4gPiAKPiA+ID4gPiBOb3QgdGhlcmUgZWl0aGVyIHVuZm9ydHVuYXRl
bHkuCj4gPiA+ID4gCj4gPiA+ID4gV291bGQgeW91IGJlIGtpbmQgZW5vdWdoIHRvIGJvdW5jZS9y
ZXNlbmQgcGxlYXNlPwo+ID4gPiAKPiA+ID4gU3VyZS4KPiA+IAo+ID4gTG9va3MgbGlrZSB5b3Ug
c2VudCBpdCAqb25seSogdG8gbWUuICBQbGVhc2Uga2VlcCBldmVyeW9uZSBlbHNlIGluIENjCj4g
PiB3aGVuIGRvaW5nIHRoYXQsIG9yIEkgY2FuJ3QgcmVzcG9uZCB0byBldmVyeW9uZS4KPiA+IAo+
ID4gQW55d2F5LCBiZXNpZGVzIHRoZSBzdWJqZWN0IGxpbmUgKHdoaWNoIEkgY2FuIGZpeCBlYXNp
bHkpLCB0aGUgcGF0Y2gKPiA+IGxvb2tzIGdvb2QgdG8gbWUsIGJ1dCBEYW5pZWwgVCBtdXN0IHJl
dmlldy4KPiAKPiBJJ3ZlIGFscmVhZHkgb2ZmZXJlZCBhIFJldmlld2VkLWJ5IGZvciB0aGlzIHBh
dGNoLiBQZXJoYXBzIGl0IGxhbmRlZCBpbgo+IHRoZSBzYW1lIHBsYWNlIGFzIHRoZSBvcmlnaW5h
bCBwYXRjaC4uLgoKUGF0Y2ggYXBwbGllZCwgdGhhbmtzLgoKLS0gCkxlZSBKb25lcyBb5p2O55C8
5pavXQpTZW5pb3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMKTGluYXJvLm9y
ZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzCkZvbGxvdyBMaW5hcm86IEZh
Y2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
