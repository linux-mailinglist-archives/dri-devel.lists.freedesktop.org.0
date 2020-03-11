Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C47CD182AA0
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 09:09:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 330D06EA6C;
	Thu, 12 Mar 2020 08:08:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A86C86E994
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 14:48:57 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id n5so1730756qtv.7
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 07:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=OeDgvgQiDB1GnxEeL/JTc+3NO9DTWC2sz0q3iRKbreY=;
 b=i2KhzPRPeR1otlrhMvHHrIZcJQps43kHk1oxKLWKdgxK+eytNvRuRzWEuFgFpBKtX2
 xupuyIw5OLfYjLZsRHwQLOMMT7q5HJng4TKsV6MtPsEdVl3RAG6reLaUM3Y22oyPteFm
 s7yeHZAmT8XFt4NgBOqc4fmtQAJOBt6JQcP/8wRe72YdUBSiRZB8PDLygH4dbhoxM9K4
 nI1qkk33E7LTqRW1HFs+62oEPuEDeHcYKE3OewtU6aIwiBNEgrJ8FBn1n1krAErVeHMd
 851B5DfVZmodckdXhR5RzIDvjtrQ6V8MHX1xrNw1IFmbw1MDz3Dk6V1iwVZI3sTWzvTK
 wkXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=OeDgvgQiDB1GnxEeL/JTc+3NO9DTWC2sz0q3iRKbreY=;
 b=CxqAAurn5u88TkLUVcx0s/OQS/GJ2IkA2+Vyg/qFhdoSCyeUWbztfjcd4zi9tCVN/6
 /Vz9MxSDWgfZRx2DaW1k9CJ7NLjLpPDbBn4U6xbk2v/NlWqKazQtzTgKbJEE7IbWTIJ+
 HOTpVa/tb0SG5WpBTUO8kL18vLVd/mv/UY50+CNBqGs/4RD/cUdM/aCTtfmC3Z4bqtBG
 X1eUC2fpou9v3eiPMQA+90dW1Cz8G/yJ+boMYiT87QruJ8XLw+VMPdmUigc9pb4FKDGU
 Kdb8eNyc8QvhvNO+TTVpBNVqoZBdzx+yv7l40XG5Ss9CgHtInZNyVAhd12fNTKdcvZvE
 hb9A==
X-Gm-Message-State: ANhLgQ3fZn6eEnqCDMxQcBOFDCkxgaOcvGeqWI8kXLyDMdBdGhfjtYS0
 moMC+rO+YGrx+gOesn8bK8+mtg==
X-Google-Smtp-Source: ADFU+vtDz3iLjwvD7XFuvmUQ9qKr0fxaZFV+bC/CrfkVrP2cganHSPmW/v177pahfAAzn29X68ur5w==
X-Received: by 2002:ac8:508:: with SMTP id u8mr2993785qtg.157.1583938136532;
 Wed, 11 Mar 2020 07:48:56 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id w2sm25704790qto.73.2020.03.11.07.48.55
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 11 Mar 2020 07:48:55 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jC2fH-00050i-FV; Wed, 11 Mar 2020 11:48:55 -0300
Date: Wed, 11 Mar 2020 11:48:55 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH 4/6] drm/amdgpu: add checks if DMA-buf P2P is supported
Message-ID: <20200311144855.GF31668@ziepe.ca>
References: <20200311135158.3310-1-christian.koenig@amd.com>
 <20200311135158.3310-5-christian.koenig@amd.com>
 <20200311140415.GB31668@ziepe.ca>
 <848c2f50-1529-f036-69cd-5104b7ebe27b@gmail.com>
 <20200311143835.GD31668@ziepe.ca>
 <58916fcc-6d5e-4f6a-3de3-7bc90a4a5145@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <58916fcc-6d5e-4f6a-3de3-7bc90a4a5145@amd.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 12 Mar 2020 08:08:13 +0000
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
Cc: Logan Gunthorpe <logang@deltatee.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, hch@infradead.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXIgMTEsIDIwMjAgYXQgMDM6NDM6MDNQTSArMDEwMCwgQ2hyaXN0aWFuIEvDtm5p
ZyB3cm90ZToKPiA+ID4gPiBpbnQgJ3AycGRtYSBtYXAgYmFyJygKPiA+ID4gPiAgICAgIHN0cnVj
dCBwY2lfZGV2aWNlICpzb3VyY2UsCj4gPiA+ID4gICAgICB1bnNpZ25lZCBpbnQgc291cmNlX2Jh
cl9udW1iZXIsCj4gPiA+ID4gICAgICBzdHJ1Y3QgcGNpX2RldmljZSAqZGVzdCwKPiA+ID4gPiAg
ICAgIHBoeXNhZGRyJmxlbiAqYXJyYXlfb2Zfb2Zmc2V0cyAmIGxlbmd0aCBwYWlycyBpbnRvIHNv
dXJjZSBiYXIsCj4gPiA+ID4gICAgICBzdHJ1Y3Qgc2NhdHRlcmxpc3QgKm91dHB1dF9zZ2wpCj4g
PiA+IFdlbGwgdGhhdCdzIGV4YWN0bHkgd2hhdCBJIGhhdmUgdG8gYXZvaWQgc2luY2UgSSBkb24n
dCBoYXZlIHRoZSBhcnJheSBvZgo+ID4gPiBvZmZzZXRzIGFyb3VuZCBhbmQgd2FudCB0byBhdm9p
ZCBjb25zdHJ1Y3RpbmcgaXQuCj4gPiBNYXliZSBpdCBkb2Vzbid0IG5lZWQgYW4gYXJyYXkgb2Yg
b2Zmc2V0cyAtIGp1c3QgYSBzaW5nbGUgb2Zmc2V0IGFuZAo+ID4gY2FsbGVycyBjYW4gaXRlcmF0
ZSB0aGUgQVBJPwo+IAo+IFllcywgdGhhdCB3b3VsZCBvZiBjb3Vyc2Ugd29yayBhcyB3ZWxsLgo+
IAo+IEJ1dCBJIHdhcyBhc3N1bWluZyB0aGF0IHAycGRtYV9tYXBfYmFyKCkgbmVlZHMgc29tZSBz
dGF0ZSBiZXR3ZWVuIHRob3NlCj4gY2FsbHMuCgpJdCBtaWdodCBiZSBhYmxlIHRvIHJ1biBmYXN0
ZXIgaWYgc29tZSBzdGF0ZSBpcyBoZWxkLiBXZSd2ZSBoYWQgQVBJcwpiZWZvcmUgd2hlcmUgdGhl
IGNhbGxlciBjYW4gcHJvdmlkZSBhIGNhY2hlIGZvciBleHBlbnNpdmUgc3RhdGUgZm9yCkFQSXMu
IE1heWJlIHRoYXQgd291bGQgYmUgYW4gYXBwcm9wcmlhdGUgcGF0dGVybiBoZXJlPwoKSUlSQyB0
aGUgZGlzdGFuY2UgY2FsY3VsYXRpb24gaXMgdGhlIGV4cGVuc2l2ZSBiaXQsIHRoYXQgd291bGQg
YmUgZWFzeQplbm91Z2ggdG8gY2FjaGUuCgpKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
