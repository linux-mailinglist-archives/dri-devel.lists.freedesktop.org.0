Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 950B12B6EE3
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 20:42:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64B8689CAA;
	Tue, 17 Nov 2020 19:42:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5B3F89CAA
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 19:42:45 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id p19so2708371wmg.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 11:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=XGs5p15J8bd5oqq6/dG9hT/mjPxqhlpssSOVNxzVtFM=;
 b=NpcCAgOs/piKyNmzQiACjZTYxvL2yjyugx8dHk4QCDhX4CIz1pTMkikkPzjuR2mgZ2
 pl0p2L8ktXBfDFPTAoQ4vbEcunA+disS9eRbz1Z4bq8LP/MMa3T0jlBQjGVW30hHCW5D
 5Cl66XhYnCjpD0StUM7x581A6dlpy+EJwridI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=XGs5p15J8bd5oqq6/dG9hT/mjPxqhlpssSOVNxzVtFM=;
 b=VRCq7X3g9tVnTbmqvLhc3oi0AyJLakA1/DfZUvkGctvb472KVmAuZeF8mQ2XSHbsJX
 Z6Mkhaqsh3qKIVJ2JuV7Ac480gT4ZLQ4cMVSC350QACZeCUHAnElTQ8OBcg9Y4OEfgXF
 t0iHkq+jTGbtF0SZ9gTxHExm5Adm1FIvltIAvDsJcE6+RyLXPaRQNtw+lfxyt/wPb1eG
 00fUeO0KKTKH0vySaW1vIqhdPpzjXXnMjmw5pIezK5D0tPUZ3ub+NiDZ94wPMN04u4mT
 vNcSoRh4I7wn2vqpUFRzY+boiy+GKUkjP+NJRgc4lMtFVVXmplSzGRZmOSj8VnHvXZVT
 ScPg==
X-Gm-Message-State: AOAM533JL+zHKCaJHqPmnmWK+agdynWj//bJhp5PRcjAGZDNuPsOYGt9
 QK2lt+/QsBkoMWlJ9hwvzm9p6g==
X-Google-Smtp-Source: ABdhPJwVbcfxoBso9bSJ7ajbgO2usBTSTH0E5tmNwKeJ8uY174HnqMGXWvFrSeBq6NuuMMTCtciAjw==
X-Received: by 2002:a7b:c055:: with SMTP id u21mr703539wmc.130.1605642164543; 
 Tue, 17 Nov 2020 11:42:44 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 90sm8872735wrl.60.2020.11.17.11.42.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 11:42:43 -0800 (PST)
Date: Tue, 17 Nov 2020 20:42:41 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 42/42] include/drm/drm_atomic: Make use of 'new_crtc_state'
Message-ID: <20201117194241.GV401619@phenom.ffwll.local>
Mail-Followup-To: Lee Jones <lee.jones@linaro.org>,
 linux-kernel@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, dri-devel@lists.freedesktop.org
References: <20201116174112.1833368-1-lee.jones@linaro.org>
 <20201116174112.1833368-43-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201116174112.1833368-43-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMTYsIDIwMjAgYXQgMDU6NDE6MTJQTSArMDAwMCwgTGVlIEpvbmVzIHdyb3Rl
Ogo+IEluIHRoZSBtYWNybyBmb3JfZWFjaF9vbGRuZXdfY3J0Y19pbl9zdGF0ZSgpICdjcnRjX3N0
YXRlJyBpcyBwcm92aWRlZAo+IGFzIGEgY29udGFpbmVyIGZvciBzdGF0ZS0+Y3J0Y3NbaV0ubmV3
X3N0YXRlLCBidXQgaXMgbm90IHV0aWxpc2VkIGluCj4gc29tZSB1c2UtY2FzZXMsIHNvIHdlIGZh
a2UtdXNlIGl0IGluc3RlYWQuCj4gCj4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1
aWxkIHdhcm5pbmcocyk6Cj4gCj4gIGRyaXZlcnMvZ3B1L2RybS9pbXgvaXB1djMtcGxhbmUuYzog
SW4gZnVuY3Rpb24g4oCYaXB1X3BsYW5lc19hc3NpZ25fcHJl4oCZOgo+ICBkcml2ZXJzL2dwdS9k
cm0vaW14L2lwdXYzLXBsYW5lLmM6NzQ2OjQyOiB3YXJuaW5nOiB2YXJpYWJsZSDigJhjcnRjX3N0
YXRl4oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCj4gCj4g
Q2M6IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+Cj4gQ2M6IERhdmlkIEFp
cmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xs
LmNoPgo+IENjOiBTaGF3biBHdW8gPHNoYXduZ3VvQGtlcm5lbC5vcmc+Cj4gQ2M6IFNhc2NoYSBI
YXVlciA8cy5oYXVlckBwZW5ndXRyb25peC5kZT4KPiBDYzogUGVuZ3V0cm9uaXggS2VybmVsIFRl
YW0gPGtlcm5lbEBwZW5ndXRyb25peC5kZT4KPiBDYzogRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1A
Z21haWwuY29tPgo+IENjOiBOWFAgTGludXggVGVhbSA8bGludXgtaW14QG54cC5jb20+Cj4gQ2M6
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9u
ZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKT2sgSSBtZXJnZWQgdGhlbSBhbGwgZXhjZXB0Ogot
IGRybS9hbWQgYW5kIGRybS9pbXgsIHNob3VsZCBiZSBwaWNrZWQgdXAgYWxyZWFkeSBieSByZXNw
ZWN0aXZlCiAgbWFpbnRhaW5lcnMKLSBkcm0vbXNtLCBSb2IgcHJvbWlzZWQgdG8gdGFrZSBjYXJl
CgpUaGFua3MgYSBsb3QgZm9yIHlvdXIgcGF0Y2hlcy4KLURhbmllbAoKPiAtLS0KPiAgaW5jbHVk
ZS9kcm0vZHJtX2F0b21pYy5oIHwgMyArKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fYXRv
bWljLmggYi9pbmNsdWRlL2RybS9kcm1fYXRvbWljLmgKPiBpbmRleCBkYzVlMGZiZWNjMDRlLi41
NGUwNTFhOTU3ZGZjIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9hdG9taWMuaAo+ICsr
KyBiL2luY2x1ZGUvZHJtL2RybV9hdG9taWMuaAo+IEBAIC03ODMsNyArNzgzLDggQEAgdm9pZCBk
cm1fc3RhdGVfZHVtcChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBzdHJ1Y3QgZHJtX3ByaW50ZXIg
KnApOwo+ICAJCQkgICAgICAodm9pZCkoY3J0YykgLyogT25seSB0byBhdm9pZCB1bnVzZWQtYnV0
LXNldC12YXJpYWJsZSB3YXJuaW5nICovLCBcCj4gIAkJCSAgICAgKG9sZF9jcnRjX3N0YXRlKSA9
IChfX3N0YXRlKS0+Y3J0Y3NbX19pXS5vbGRfc3RhdGUsIFwKPiAgCQkJICAgICAodm9pZCkob2xk
X2NydGNfc3RhdGUpIC8qIE9ubHkgdG8gYXZvaWQgdW51c2VkLWJ1dC1zZXQtdmFyaWFibGUgd2Fy
bmluZyAqLywgXAo+IC0JCQkgICAgIChuZXdfY3J0Y19zdGF0ZSkgPSAoX19zdGF0ZSktPmNydGNz
W19faV0ubmV3X3N0YXRlLCAxKSkKPiArCQkJICAgICAobmV3X2NydGNfc3RhdGUpID0gKF9fc3Rh
dGUpLT5jcnRjc1tfX2ldLm5ld19zdGF0ZSwgXAo+ICsJCQkgICAgICh2b2lkKShuZXdfY3J0Y19z
dGF0ZSkgLyogT25seSB0byBhdm9pZCB1bnVzZWQtYnV0LXNldC12YXJpYWJsZSB3YXJuaW5nICov
LCAxKSkKPiAgCj4gIC8qKgo+ICAgKiBmb3JfZWFjaF9vbGRfY3J0Y19pbl9zdGF0ZSAtIGl0ZXJh
dGUgb3ZlciBhbGwgQ1JUQ3MgaW4gYW4gYXRvbWljIHVwZGF0ZQo+IC0tIAo+IDIuMjUuMQo+IAoK
LS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0
dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
