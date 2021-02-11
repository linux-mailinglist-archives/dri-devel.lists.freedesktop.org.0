Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5559A318EE4
	for <lists+dri-devel@lfdr.de>; Thu, 11 Feb 2021 16:40:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B71406EE4F;
	Thu, 11 Feb 2021 15:40:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BC3C6EE4F
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Feb 2021 15:40:17 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id u16so2312587wmq.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Feb 2021 07:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=BQASuo84wfslsSEivWFaPBGKyJ+9IhWQICA1bAqw9pc=;
 b=G/UnfUhjvghbtT5LL/ccChqvxR3VGoeJDY0GnhgqREnzARjQQ+nIuF6vtPkRJ67lFU
 IOrCaSzzOWXuAcKHDhheox4KAPQXkPZ0VlDd70F+0DJpVVTh0rBkQDVTuSHeQ06xKPSb
 c1cmmAz6bP+t0knwzzSCM+lT37KdOsOWUDOEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=BQASuo84wfslsSEivWFaPBGKyJ+9IhWQICA1bAqw9pc=;
 b=GTStj3U+1X/YrgFyqB4tgiuu8gYsjHKMZN0bpUFG5Zvd7wLf5hLOWyTt2U+iIzYC7H
 705LJBFO5FgK013FHnJdtxnmeaPaXtum/hSlayIWFrNYRk0EM/K17DQnnv+Tk2kwGk6U
 HRlZuAX8G0XNu34qxni8VQI645I9aTPMcMXmd8j46mCUksPW+Rj53ZqFQurufIDWYhUd
 5T3kQXl5LjTrJ5raj3NBiBqlagsyPnBlqJR+WV+a8eBx9RMwqfklfZrALIA20TLrUXga
 DJ9qtJkGNAmu1CM8bbHtzlQvOcnBcwBzIM50c3Az3SfbKSH6mdc4j4qEpvwooG8J2NhX
 7njg==
X-Gm-Message-State: AOAM530aiyKTjsjY2Ppu7UEweXjWjW4q/CBksjGgW3dJL29OR/lhjNsE
 gDv4gH+1mGeJBdRengvbWhp1Uw==
X-Google-Smtp-Source: ABdhPJyEz8KdbutPUEkFdfjjXqFBnVRyCrjCSeZ53ICqWwBwbN6UTPF9mpSKyi9zn1yrCN7w9m+Wqg==
X-Received: by 2002:a1c:113:: with SMTP id 19mr5676819wmb.7.1613058015846;
 Thu, 11 Feb 2021 07:40:15 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t2sm5773738wru.53.2021.02.11.07.40.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 07:40:15 -0800 (PST)
Date: Thu, 11 Feb 2021 16:40:13 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] video: use getter/setter functions
Message-ID: <YCVP3ZKBsJUV0m8G@phenom.ffwll.local>
Mail-Followup-To: Lee Jones <lee.jones@linaro.org>,
 Julia Lawall <Julia.Lawall@inria.fr>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jingoo Han <jingoohan1@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 kernel-janitors@vger.kernel.org,
 Michal Simek <michal.simek@xilinx.com>,
 dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andy Gross <agross@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 linux-fbdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20210209211325.1261842-1-Julia.Lawall@inria.fr>
 <20210210082341.GH220368@dell>
 <YCPbxSHWMipTz+mB@phenom.ffwll.local> <20210210161258.GA124276@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210210161258.GA124276@x1>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, linux-omap@vger.kernel.org,
 Jingoo Han <jingoohan1@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Michal Simek <michal.simek@xilinx.com>,
 Julia Lawall <Julia.Lawall@inria.fr>, linux-fbdev@vger.kernel.org,
 Andy Gross <agross@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBGZWIgMTAsIDIwMjEgYXQgMDQ6MTI6NThQTSArMDAwMCwgTGVlIEpvbmVzIHdyb3Rl
Ogo+IE9uIFdlZCwgMTAgRmViIDIwMjEsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gCj4gPiBPbiBX
ZWQsIEZlYiAxMCwgMjAyMSBhdCAwODoyMzo0MUFNICswMDAwLCBMZWUgSm9uZXMgd3JvdGU6Cj4g
PiA+IE9uIFR1ZSwgMDkgRmViIDIwMjEsIEp1bGlhIExhd2FsbCB3cm90ZToKPiA+ID4gCj4gPiA+
ID4gVXNlIGdldHRlciBhbmQgc2V0dGVyIGZ1bmN0aW9ucywgZm9yIHBsYXRmb3JtX2RldmljZSBz
dHJ1Y3R1cmVzIGFuZCBhCj4gPiA+ID4gc3BpX2RldmljZSBzdHJ1Y3R1cmUuCj4gPiA+ID4gCj4g
PiA+ID4gU2lnbmVkLW9mZi1ieTogSnVsaWEgTGF3YWxsIDxKdWxpYS5MYXdhbGxAaW5yaWEuZnI+
Cj4gPiA+ID4gCj4gPiA+ID4gLS0tCj4gPiA+ID4gIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3Fj
b20td2xlZC5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgMiArLQo+ID4g
PiAKPiA+ID4gVGhpcyBwYXRjaCBpcyBmaW5lLgo+ID4gPiAKPiA+ID4gQ291bGQgeW91IHBsZWFz
ZSBzcGxpdCBpdCBvdXQgYW5kIHN1Ym1pdCBpdCBzZXBhcmF0ZWx5IHRob3VnaCBwbGVhc2UuCj4g
PiAKPiA+IE9yIGp1c3QgYXBwbHkgdGhlIGVudGlyZSBwYXRjaCB0aHJvdWdoIGJhY2tsaWdodCB0
cmVlLCB0aGVyZSdzIG5vdGhpbmcKPiA+IGdvaW5nIG9uIGluIGZiZGV2IGFueXdheSBJIHRoaW5r
Lgo+ID4gCj4gPiBBY2tlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5j
aD4KPiAKPiBJIGNhbiBkbyB0aGF0LiAgSXMgdGhhdCBhbiBmYmRldiBBY2s/CgpZZWFoIGRlZmFj
dG8gSSdtIHNvbWVob3cgc3R1Y2sgd2l0aCB0aGF0IGFzIG1haW50YWluZXIgb2YgbGFzdCByZXNv
cnQgOi0pCklpcmMgd2UndmUgZ290IGFuIFM6IG9ycGhhbmVkIGVudHJ5IHBvaW50aW5nIGF0IGRy
bS5naXQgdHJlZXMuCi1EYW5pZWwKCgo+IAo+ID4gPiA+ICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2Ft
aWZiLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDQgKyst
LQo+ID4gPiA+ICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2RhOHh4LWZiLmMgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDQgKystLQo+ID4gPiA+ICBkcml2ZXJzL3ZpZGVv
L2ZiZGV2L2lteGZiLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
ICAgIDIgKy0KPiA+ID4gPiAgZHJpdmVycy92aWRlby9mYmRldi9vbWFwMi9vbWFwZmIvZGlzcGxh
eXMvcGFuZWwtbGdwaGlsaXBzLWxiMDM1cTAyLmMgfCAgICA2ICsrKy0tLQo+ID4gPiA+ICBkcml2
ZXJzL3ZpZGVvL2ZiZGV2L29tYXAyL29tYXBmYi9kc3MvZHBpLmMgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAgIDQgKystLQo+ID4gPiA+ICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAyL29t
YXBmYi9kc3MvZHNpLmMgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDQgKystLQo+ID4g
PiA+ICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAyL29tYXBmYi9kc3MvaGRtaTQuYyAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAgIDIgKy0KPiA+ID4gPiAgZHJpdmVycy92aWRlby9mYmRldi9v
bWFwMi9vbWFwZmIvZHNzL2hkbWk1LmMgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAyICst
Cj4gPiA+ID4gIGRyaXZlcnMvdmlkZW8vZmJkZXYveGlsaW54ZmIuYyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgICAgMiArLQo+ID4gPiA+ICAxMCBmaWxlcyBjaGFuZ2Vk
LCAxNiBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKPiA+ID4gCj4gPiA+IC4uLl0KPiA+
ID4gCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3Fjb20td2xl
ZC5jIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcWNvbS13bGVkLmMKPiA+ID4gPiBpbmRleCAz
YmM3ODAwZWIwYTkuLjA5MWYwN2U3YzE0NSAxMDA2NDQKPiA+ID4gPiAtLS0gYS9kcml2ZXJzL3Zp
ZGVvL2JhY2tsaWdodC9xY29tLXdsZWQuYwo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvdmlkZW8vYmFj
a2xpZ2h0L3Fjb20td2xlZC5jCj4gPiA+ID4gQEAgLTE2OTIsNyArMTY5Miw3IEBAIHN0YXRpYyBp
bnQgd2xlZF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ID4gPiA+ICAKPiA+
ID4gPiAgc3RhdGljIGludCB3bGVkX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQo+ID4gPiA+ICB7Cj4gPiA+ID4gLQlzdHJ1Y3Qgd2xlZCAqd2xlZCA9IGRldl9nZXRfZHJ2ZGF0
YSgmcGRldi0+ZGV2KTsKPiA+ID4gPiArCXN0cnVjdCB3bGVkICp3bGVkID0gcGxhdGZvcm1fZ2V0
X2RydmRhdGEocGRldik7Cj4gPiA+ID4gIAo+ID4gPiA+ICAJbXV0ZXhfZGVzdHJveSgmd2xlZC0+
bG9jayk7Cj4gPiA+ID4gIAljYW5jZWxfZGVsYXllZF93b3JrX3N5bmMoJndsZWQtPm92cF93b3Jr
KTsKPiA+ID4gCj4gPiA+IEZvciBteSBvd24gcmVmZXJlbmNlIChhcHBseSB0aGlzIGFzLWlzIHRv
IHlvdXIgc2lnbi1vZmYgYmxvY2spOgo+ID4gPiAKPiA+ID4gICBBY2tlZC1mb3ItQmFja2xpZ2h0
LWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgo+ID4gPiAKPiA+IAo+IAo+IC0t
IAo+IExlZSBKb25lcyBb5p2O55C85pavXQo+IFNlbmlvciBUZWNobmljYWwgTGVhZCAtIERldmVs
b3BlciBTZXJ2aWNlcwo+IExpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBB
cm0gU29Dcwo+IEZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKCi0tIApEYW5p
ZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxv
Zy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
