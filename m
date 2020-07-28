Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B152304CD
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 09:58:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C4B688F5A;
	Tue, 28 Jul 2020 07:58:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE10688F5A
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 07:58:22 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id dk23so7820134ejb.11
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 00:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ka9R4h6aadumcdtKa+flDubX4eR+JO+uyciH/N6C2Z0=;
 b=W9Cmc68auB3m4bu64QPlhvhaOzFnnerkQ8IINwegzLYD0PqotWhJFNR6uTZVHJWBfC
 DR4oFhvmMZNstA7d78JWv77z8ekL0ouBUAb2PIVzTbnbq7hC3QoWHsmPAiXMtGk7hRUN
 Ru1HGrbwf+1HJBQziYC/1r1gVYCqhfVqPun2CeuPjtxKNMqsXMjlbaanAzUro2lVr3Z0
 HJiA7Pj7p/C3HgDU0dPoN+3W85Bmp8AZfOOmcCLTzg1ZG2n1bbI9Hcll5vlLqjRlnc4M
 kMTATJMm4Vwd/07yxKDJyoUp4FhlhrqIT6/qU218egaTZQAxboeV9QLLKuC7zD2pyr6U
 POQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ka9R4h6aadumcdtKa+flDubX4eR+JO+uyciH/N6C2Z0=;
 b=hU5tGYtolQjASyn8GDsfHm2wgUJ8n+IqrKMgSC12xlnIiwRI3vxF6gvUCOT0mtciI0
 oXwP09teDsSnze7VmGLEkqWixqmdOVMPJFwOM6ShjtVMbJY5o7KkW4ncFp304fTuTP/Y
 Oh1bw/qRbQHWsaIJKS+gX+GwlEGVRXLQ+6HdKpZ/46bhRHswcAxmtgp6P3nRfNvYDNQT
 G/9Qp8l5oIG1FFakU2rOXm7HvweGyMsFn0CwfKQbGgfbHq9Su6NTG9opwvnAR1uroJvI
 UWXtF19fp5WIR+oMclzzOc1HqkXx0d18Hv6fmLqRafFzz5Vdg2/+bcNgJNBDnlNLH0Je
 OJWg==
X-Gm-Message-State: AOAM530N85kWeUtZZkq3X2XqfzaJAyuwBxl3P1foCkMhjve1CVblhnEq
 5M3HLD0KeYrqIT9JVOydhmykHlHAIl9NbpVBtIU=
X-Google-Smtp-Source: ABdhPJwHCRzMByKCYVRZh//jMm15F1yQhoQNUYobHOwAD8qDD84ow/uw5+UhoK+0G8cmgq/QQpNFdtr97m3eYgaI5JA=
X-Received: by 2002:a17:906:4158:: with SMTP id
 l24mr23897696ejk.101.1595923101437; 
 Tue, 28 Jul 2020 00:58:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200728062402.21942-1-airlied@gmail.com>
 <90a2894b-7a9b-cc3e-d385-a6349e96d9e9@amd.com>
In-Reply-To: <90a2894b-7a9b-cc3e-d385-a6349e96d9e9@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 28 Jul 2020 17:58:10 +1000
Message-ID: <CAPM=9tw9kh0EzrKqNhnRwzwsHF50sQud335kOBUfYQX+pajxGA@mail.gmail.com>
Subject: Re: [PATCH] drm/ttm/nouveau: consolidate slowpath reserve
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Ben Skeggs <bskeggs@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyOCBKdWwgMjAyMCBhdCAxNzozMCwgQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFu
LmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPgo+IEFtIDI4LjA3LjIwIHVtIDA4OjI0IHNjaHJpZWIg
RGF2ZSBBaXJsaWU6Cj4gPiBGcm9tOiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+
ID4KPiA+IFRoZSBXQVJOX09OIGluIHRoZSBub24tdW5kZXJzY29yZSBwYXRoIGlzIG9mZiBxdWVz
dGlvbmFibGUgdmFsdWUKPiA+IChjYW4gd2UgZHJvcCBpdCBmcm9tIHRoZSBub24tc2xvd3BhdGg/
KS4gQXQgbGVhc3QgZm9yIG5vdXZlYXUKPiA+IHdoZXJlIGl0J3MganVzdCBsb29rZWQgdXAgdGhl
IGdlbSBvYmplY3Qgd2Uga25vdyB0aGUgdHRtIG9iamVjdAo+ID4gaGFzIGEgcmVmZXJlbmNlIGFs
d2F5cyBzbyB3ZSBjYW4gc2tpcCB0aGUgY2hlY2suCj4KPiBZZWFoLCBhZ3JlZWQuIFdhbnRlZCB0
byBsb29rIGludG8gcmVtb3ZpbmcgdGhhdCBmb3IgcXVpdGUgc29tZSB0aW1lIGFzIHdlbGwuCj4K
PiA+IEl0J3MgcHJvYmFibHkgbm91dmVhdSBjb3VsZCB1c2UgZXhlY2J1dCB1dGlscyBoZXJlIGF0
IHNvbWUgcG9pbnQKPiA+IGJ1dCBmb3Igbm93IGFsaWduIHRoZSBjb2RlIGJldHdlZW4gdGhlbSB0
byBhbHdheXMgY2FsbCB0aGUgX18KPiA+IHZlcnNpb25zLCBhbmQgcmVtb3ZlIHRoZSBub24gdW5k
ZXJzY29yZWQgdmVyc2lvbi4KPgo+IENhbiB3ZSBkbyBpdCB0aGUgb3RoZXIgd2F5IGFyb3VuZCBh
bmQgcmVtb3ZlIGFsbCB1c2VzIG9mIHRoZSBfXyB2ZXJzaW9ucwo+IG9mIHRoZSBmdW5jdGlvbnMg
aW5zdGVhZCBhbmQgdGhlbiBtZXJnZSB0aGUgX18gdmVyc2lvbiBpbnRvIHRoZSBub3JtYWwKPiBv
bmUgd2l0aG91dCB0aGUgV0FSTl9PTigpPwoKWWVzIHNvdW5kcyBsaWtlIGEgcGxhbiwgSSBqdXN0
IHdhc24ndCBzdXJlIHRoZSBXQVJOX09OIGhhZCB2YWx1ZSwgYml0CnNpbmNlIHlvdSBhZ3JlZSBp
cyBkdWJpb3VzIGF0IGJlc3QsIEknbSBoYXBweSB0byByaXAgaXQgb3V0LgoKV2lsbCBzZW5kIGEg
djIgdG9tb3Jyb3cuCgpEYXZlLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
