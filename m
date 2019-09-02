Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C17DA5292
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 11:11:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 959AB89C14;
	Mon,  2 Sep 2019 09:11:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08C9789C14
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 09:11:34 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id k2so12237855wmj.4
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 02:11:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=8oqJdBiHyKqAlISuPnLa2MGGfZJDAaKp4XjFcqqHTI8=;
 b=pNGCBmya2KGGXfcjNmHTfI67f0Kj28lmok++n84EVfJl7YxvvIeilRpIkExKidvuBl
 vvbSfN+M9OIemnsekP0NCB+BMeUd1RDt5q9DCZlrNdhSUZqrgQfE4U9Q6mO8PsS2+Uif
 YBnA+2U3RBZG9U9cpKdKgN+wUMYsOeMTw13v3sEsIPHTPx8VAowaGB/HemzoivtsesKk
 WZ/L01qtAdY3FT1Q6ql8Q8HRI4w+bxgSm9mnZQtT7KCQrpoMirDBO6RRd71iiiCoU7Fj
 2q2JRIsehZmSP7TGjc2r4HM7B7DrAAzufwmLrTNj6fOdENvvD34G2jaLkyh4m9IRFIVs
 lIoA==
X-Gm-Message-State: APjAAAXawb84rx0pfsPYbkuylU0NdtdmIBb3bonWfT79gtMmNZaHgNYR
 sMh35DIhoXtP/0K6nU52Lw9CKA==
X-Google-Smtp-Source: APXvYqz6zTE3+7Cab43jkjP1vZUcgAoMSLfW1kYAvqHXdmLYBFVgNKWMXsb5YhZZGLOZta3H6WSVOg==
X-Received: by 2002:a1c:7619:: with SMTP id r25mr299001wmc.153.1567415492632; 
 Mon, 02 Sep 2019 02:11:32 -0700 (PDT)
Received: from dell ([95.147.198.93])
 by smtp.gmail.com with ESMTPSA id s15sm6398842wmh.12.2019.09.02.02.11.31
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 02 Sep 2019 02:11:32 -0700 (PDT)
Date: Mon, 2 Sep 2019 10:11:30 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH v3] backlight: gpio-backlight: Correct initial power
 state handling
Message-ID: <20190902091130.GG32232@dell>
References: <20190731084018.5318-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190731084018.5318-1-peter.ujfalusi@ti.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=8oqJdBiHyKqAlISuPnLa2MGGfZJDAaKp4XjFcqqHTI8=;
 b=DIHmB+MhpRayg6spOmLydYJ01PHT4VKTWXLlYhvJPb+LIBpWOOgWnzwVP9Emq17Spb
 8lPzi2/StfEbpYNaD3ubpzc+CkNRKgTx0mPxR56ZaqRQ2hZqkPMbtu790XYGirmaYKIB
 ShOSAq5oxixfW/1idndxBdzTSy0fCMrA1dsEEHQauEwpO+USJiaw0r4acOgDtxUpovnk
 sCRsT5siGKSqyshqIeIE/0CFUbmTbr2iaDvAGstjGPD1k9vkNiX5GM/QwUsdIOJeQw3y
 y4hoirYqZgpW/jo3rscQSbPHqKBMeO4KAorS2upSf46AV+2Ta85G4U69DxF7exqggh8f
 kOOQ==
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
Cc: daniel.thompson@linaro.org, jingoohan1@gmail.com,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, paul.kocialkowski@bootlin.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAzMSBKdWwgMjAxOSwgUGV0ZXIgVWpmYWx1c2kgd3JvdGU6Cgo+IFRoZSBkZWZhdWx0
LW9uIHByb3BlcnR5IC0gb3IgdGhlIGRlZl92YWx1ZSB2aWEgbGVnYWN5IHBkYXRhKSBzaG91bGQg
YmUKPiBoYW5kbGVkIGFzOgo+IGlmIGl0IGlzIDEsIHRoZSBiYWNrbGlnaHQgbXVzdCBiZSBlbmFi
bGVkIChrZXB0IGVuYWJsZWQpCj4gaWYgaXQgaXMgMCwgdGhlIGJhY2tsaWdodCBtdXN0IGJlIGRp
c2FibGVkIChrZXB0IGRpc2FibGVkKQo+IAo+IFRoaXMgb25seSB3b3JrcyBmb3IgdGhlIGNhc2Ug
d2hlbiBkZWZhdWx0LW9uIGlzIHNldC4gSWYgaXQgaXMgbm90IHNldCB0aGVuCj4gdGhlIGJyaWdo
dG5lc3Mgb2YgdGhlIGJhY2tsaWdodCBpcyBzZXQgdG8gMC4gTm93IGlmIHRoZSBiYWNrbGlnaHQg
aXMKPiBlbmFibGVkIGJ5IGV4dGVybmFsIGRyaXZlciAoZ3JhcGhpY3MpIHRoZSBiYWNrbGlnaHQg
d2lsbCBzdGF5IGRpc2FibGVkIHNpbmNlCj4gdGhlIGJyaWdodG5lc3MgaXMgY29uZmlndXJlZCBh
cyAwLiBUaGUgYmFja2xpZ2h0IHdpbGwgbm90IHR1cm4gb24uCj4gCj4gSW4gb3JkZXIgdG8gbWlu
aW1pemUgc2NyZWVuIGZsaWNrZXJpbmcgZHVyaW5nIGRldmljZSBib290Ogo+IAo+IFRoZSBpbml0
aWFsIGJyaWdodG5lc3Mgc2hvdWxkIGJlIHNldCB0byAxLgo+IAo+IElmIGJvb3RlZCBpbiBub24g
RFQgbW9kZSBvciBubyBwaGFuZGxlIGxpbmsgdG8gdGhlIGJhY2tsaWdodCBub2RlOgo+IGZvbGxv
dyB0aGUgZGVmX3ZhbHVlL2RlZmF1bHQtb24gdG8gc2VsZWN0IFVOQkxBTksgb3IgUE9XRVJET1dO
Cj4gCj4gSWYgaW4gRFQgYm9vdCB3ZSBoYXZlIHBoYW5kbGUgbGluayB0aGVuIGxlYXZlIHRoZSBH
UElPIGluIGEgc3RhdGUgd2hpY2ggdGhlCj4gYm9vdGxvYWRlciBsZWZ0IGl0IGFuZCBsZXQgdGhl
IHVzZXIgb2YgdGhlIGJhY2tsaWdodCB0byBjb25maWd1cmUgaXQKPiBmdXJ0aGVyLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IFBldGVyIFVqZmFsdXNpIDxwZXRlci51amZhbHVzaUB0aS5jb20+Cj4gLS0t
Cj4gSGksCj4gCj4gc29ycnkgZm9yIHRoZSBkZWxheSwgYnV0IGdvdCBkaXN0cmFjdGVkIGEgYml0
IHdpdGggdGhlIHJlc2VuZCBvZiB0aGlzLi4uCj4gTGV0J3MgdHJ5IGFnYWluIDspCj4gCj4gQ2hh
bmdlcyBzaW5jZSB2MiAoaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcGF0Y2h3b3JrL3BhdGNoLzEw
MDIzNTkvKToKPiAtIFJlYmFzZWQgb24gZHJtLW5leHQKPiAKPiBDaGFuZ2VzIHNpbmNlIHYxOgo+
IC0gSW1wbGVtZW50IHNpbWlsaWFyIGluaXRpYWwgcG93ZXIgc3RhdGUgaGFuZGxpbmcgYXMgcHdt
IGJhY2tsaWdodCBoYXZlCj4gCj4gUmVnYXJkcywKPiBQZXRlcgo+IAo+ICBkcml2ZXJzL3ZpZGVv
L2JhY2tsaWdodC9ncGlvX2JhY2tsaWdodC5jIHwgMjQgKysrKysrKysrKysrKysrKysrKystLS0t
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKQXBw
bGllZCwgdGhhbmtzLgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpMaW5hcm8gU2VydmljZXMg
VGVjaG5pY2FsIExlYWQKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFS
TSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
