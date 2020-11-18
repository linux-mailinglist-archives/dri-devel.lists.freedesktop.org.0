Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C49C92B78F7
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 09:43:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCC6B6E082;
	Wed, 18 Nov 2020 08:43:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27C346E082
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 08:43:06 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 1so1896427wme.3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 00:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=fnDyKeim6MLktf6goxDG8bETMIT1x5B36xRg+H6Tp/M=;
 b=PNvc5vIyrM8C6v8Z5V12ssPdpy36I2f7x9AozlD63o4mrUjyxSHNOAWNPdKG7szVFK
 aV3pcXO/4aHBMgR626nYQY0gAHd7ShMdqGKJooslFMOoueqx8cLs6V3YRVR8MWaXGcgC
 vtJMh4SY4YQNpGLF+SUfVbBpnPRL0EzKM9BxYxNjA73hUroITzc/5RJda6Kc13T5oC09
 shbKgF8A2HqrTC9Eytrz00gvcOtuqZeZ7USciOJIT0Rm9Wiz1EiXwRHrmb2ihwI7Uh5p
 Hoi/L6kQeF1dI34rorxfs5IkXdmHz+TSkkp8R97KD8IbEC8UoDc+0SpGzjZkxz7lm1Wg
 8MFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=fnDyKeim6MLktf6goxDG8bETMIT1x5B36xRg+H6Tp/M=;
 b=IBUcZNfvuz1nr7ZoxFDhU++x8bDwcxw1xw9ycG7wUAdVidj3NgyNrPjS/6RBGmOoxG
 aM4DkIXnxvEGJCy6pwhR0sP3MllcuTPIWS0KeS3Bcv7kt/CCkLYuw+IQKi3pvZ4BvVKv
 Y/BqD+G5iuISDiUOpUBI3l5U+8reZrYHQ6sxp1DLawGN7Ioh26lZpuDq0/XUxlB5MCud
 wEyYvWM3J9NemHB1AV1tnkZOqFa4BgyGn+FVO5Ggbj+cWU0Iv7DqyqoGmKrW6aaORRSa
 WXJxnVjrNL65sktCcRuIy6ZYEHkqqzARgIZpWFPE1i3DxOlT28Kfey4/ihCG2XzQqg1w
 Fb7w==
X-Gm-Message-State: AOAM530hJvP0w5nnip/Y6rCQDIpLIo8cxOyj5DN0R8DUoOF9RR4j8q6W
 RUmyJ476QEVsaTkvMHrwKlRYbA==
X-Google-Smtp-Source: ABdhPJyIWUVccZyAXEsObevGW/HAb1nxmtfyuHFvXXaetFjntxj3sQMrjXfKIJTB0JRP1IXOQra5yw==
X-Received: by 2002:a7b:c92a:: with SMTP id h10mr1473209wml.138.1605688984839; 
 Wed, 18 Nov 2020 00:43:04 -0800 (PST)
Received: from dell ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id e1sm1894406wmd.16.2020.11.18.00.43.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 00:43:03 -0800 (PST)
Date: Wed, 18 Nov 2020 08:43:02 +0000
From: Lee Jones <lee.jones@linaro.org>
To: linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 42/42] include/drm/drm_atomic: Make use of 'new_crtc_state'
Message-ID: <20201118084302.GN1869941@dell>
References: <20201116174112.1833368-1-lee.jones@linaro.org>
 <20201116174112.1833368-43-lee.jones@linaro.org>
 <20201117194241.GV401619@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201117194241.GV401619@phenom.ffwll.local>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxNyBOb3YgMjAyMCwgRGFuaWVsIFZldHRlciB3cm90ZToKCj4gT24gTW9uLCBOb3Yg
MTYsIDIwMjAgYXQgMDU6NDE6MTJQTSArMDAwMCwgTGVlIEpvbmVzIHdyb3RlOgo+ID4gSW4gdGhl
IG1hY3JvIGZvcl9lYWNoX29sZG5ld19jcnRjX2luX3N0YXRlKCkgJ2NydGNfc3RhdGUnIGlzIHBy
b3ZpZGVkCj4gPiBhcyBhIGNvbnRhaW5lciBmb3Igc3RhdGUtPmNydGNzW2ldLm5ld19zdGF0ZSwg
YnV0IGlzIG5vdCB1dGlsaXNlZCBpbgo+ID4gc29tZSB1c2UtY2FzZXMsIHNvIHdlIGZha2UtdXNl
IGl0IGluc3RlYWQuCj4gPiAKPiA+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWls
ZCB3YXJuaW5nKHMpOgo+ID4gCj4gPiAgZHJpdmVycy9ncHUvZHJtL2lteC9pcHV2My1wbGFuZS5j
OiBJbiBmdW5jdGlvbiDigJhpcHVfcGxhbmVzX2Fzc2lnbl9wcmXigJk6Cj4gPiAgZHJpdmVycy9n
cHUvZHJtL2lteC9pcHV2My1wbGFuZS5jOjc0Njo0Mjogd2FybmluZzogdmFyaWFibGUg4oCYY3J0
Y19zdGF0ZeKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQo+
ID4gCj4gPiBDYzogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4KPiA+IENj
OiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gPiBDYzogRGFuaWVsIFZldHRlciA8
ZGFuaWVsQGZmd2xsLmNoPgo+ID4gQ2M6IFNoYXduIEd1byA8c2hhd25ndW9Aa2VybmVsLm9yZz4K
PiA+IENjOiBTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+Cj4gPiBDYzogUGVu
Z3V0cm9uaXggS2VybmVsIFRlYW0gPGtlcm5lbEBwZW5ndXRyb25peC5kZT4KPiA+IENjOiBGYWJp
byBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+Cj4gPiBDYzogTlhQIExpbnV4IFRlYW0gPGxp
bnV4LWlteEBueHAuY29tPgo+ID4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
PiA+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Cj4gCj4g
T2sgSSBtZXJnZWQgdGhlbSBhbGwgZXhjZXB0Ogo+IC0gZHJtL2FtZCBhbmQgZHJtL2lteCwgc2hv
dWxkIGJlIHBpY2tlZCB1cCBhbHJlYWR5IGJ5IHJlc3BlY3RpdmUKPiAgIG1haW50YWluZXJzCj4g
LSBkcm0vbXNtLCBSb2IgcHJvbWlzZWQgdG8gdGFrZSBjYXJlCj4gCj4gVGhhbmtzIGEgbG90IGZv
ciB5b3VyIHBhdGNoZXMuCgpQZXJmZWN0LiAgVGhhbmsgeW91IGZvciByZXZpZXdpbmcvbWVyZ2lu
ZyB0aGVtLgoKPiA+IC0tLQo+ID4gIGluY2x1ZGUvZHJtL2RybV9hdG9taWMuaCB8IDMgKystCj4g
PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4gCj4g
PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2F0b21pYy5oIGIvaW5jbHVkZS9kcm0vZHJt
X2F0b21pYy5oCj4gPiBpbmRleCBkYzVlMGZiZWNjMDRlLi41NGUwNTFhOTU3ZGZjIDEwMDY0NAo+
ID4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2F0b21pYy5oCj4gPiArKysgYi9pbmNsdWRlL2RybS9k
cm1fYXRvbWljLmgKPiA+IEBAIC03ODMsNyArNzgzLDggQEAgdm9pZCBkcm1fc3RhdGVfZHVtcChz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBzdHJ1Y3QgZHJtX3ByaW50ZXIgKnApOwo+ID4gIAkJCSAg
ICAgICh2b2lkKShjcnRjKSAvKiBPbmx5IHRvIGF2b2lkIHVudXNlZC1idXQtc2V0LXZhcmlhYmxl
IHdhcm5pbmcgKi8sIFwKPiA+ICAJCQkgICAgIChvbGRfY3J0Y19zdGF0ZSkgPSAoX19zdGF0ZSkt
PmNydGNzW19faV0ub2xkX3N0YXRlLCBcCj4gPiAgCQkJICAgICAodm9pZCkob2xkX2NydGNfc3Rh
dGUpIC8qIE9ubHkgdG8gYXZvaWQgdW51c2VkLWJ1dC1zZXQtdmFyaWFibGUgd2FybmluZyAqLywg
XAo+ID4gLQkJCSAgICAgKG5ld19jcnRjX3N0YXRlKSA9IChfX3N0YXRlKS0+Y3J0Y3NbX19pXS5u
ZXdfc3RhdGUsIDEpKQo+ID4gKwkJCSAgICAgKG5ld19jcnRjX3N0YXRlKSA9IChfX3N0YXRlKS0+
Y3J0Y3NbX19pXS5uZXdfc3RhdGUsIFwKPiA+ICsJCQkgICAgICh2b2lkKShuZXdfY3J0Y19zdGF0
ZSkgLyogT25seSB0byBhdm9pZCB1bnVzZWQtYnV0LXNldC12YXJpYWJsZSB3YXJuaW5nICovLCAx
KSkKPiA+ICAKPiA+ICAvKioKPiA+ICAgKiBmb3JfZWFjaF9vbGRfY3J0Y19pbl9zdGF0ZSAtIGl0
ZXJhdGUgb3ZlciBhbGwgQ1JUQ3MgaW4gYW4gYXRvbWljIHVwZGF0ZQo+IAoKLS0gCkxlZSBKb25l
cyBb5p2O55C85pavXQpTZW5pb3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMK
TGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzCkZvbGxvdyBM
aW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
