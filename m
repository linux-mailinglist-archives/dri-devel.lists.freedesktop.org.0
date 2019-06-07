Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D224E38DE0
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 16:49:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D6689CE3;
	Fri,  7 Jun 2019 14:49:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A3BF89CDB
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 14:49:09 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id k8so3378392edr.11
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2019 07:49:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=dyGN2fG99XjQtTR2E38+EOr7B8xkQxAj0cGvTHmsIj0=;
 b=pkvWRWg2w0MO2wWsSvEXiuR54/GYFK97XNcKrnud3bKELrD5txX7eClcl6XvYN4QVF
 VoK4bzzkYAeCzpFacdRXO6x/Z5NN/iSZ7soWwR+zn8LjQRj+oc9klwb7EoN1d/RpBws/
 yow2zDATVwlgpv5K9Q4Jv2eNUzOsXg8M8WJ9dJr6t71Tjz8ZPebJ4BAafhkJo/7PTDPT
 ucnR77o/vXAvtKUCB5jTcufXbvaKjJT81kuZ45GDhtQIsrYn8zB6+L3WXCAkCsl6H97v
 oEsG67li4k9uNeJXd23PKjwFb3vER2B8ZZpm0Ws4VXsYTrwxpzC5Sy22nTc2eyDVBvDd
 jIQw==
X-Gm-Message-State: APjAAAU09/OiZ5tfdiDIOrUqAIZq9kD4ovkg6Ga3BeHhXXBqxeLLDTZf
 LxZJx6gvA09WAGVW1kVNRA4uYRkxbM8=
X-Google-Smtp-Source: APXvYqykd5DW4msW8WLvz9iUEblvZonjLKQjp3JIuIOyte7pVlEcCnkxYAAQBxYKS/H8OVLab8c9KQ==
X-Received: by 2002:a17:906:5855:: with SMTP id
 h21mr14529129ejs.15.1559918947781; 
 Fri, 07 Jun 2019 07:49:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id f24sm567501edf.30.2019.06.07.07.49.05
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 07 Jun 2019 07:49:06 -0700 (PDT)
Date: Fri, 7 Jun 2019 16:49:04 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: Re: [Intel-gfx] [PATCH] drm/crc-debugfs: Also sprinkle irqrestore
 over early exits
Message-ID: <20190607144903.GG21222@phenom.ffwll.local>
References: <20190606211544.5389-1-daniel.vetter@ffwll.ch>
 <CACvgo50ACVW1haAnXBhdvOJZ_6vNDinMHq9QpBc2yydrpeFSRA@mail.gmail.com>
 <CA+M3ks6ypjy=M2zqmJ_RxUpoTi+czD5pMP+p2LMDiGSWk24wUg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+M3ks6ypjy=M2zqmJ_RxUpoTi+czD5pMP+p2LMDiGSWk24wUg@mail.gmail.com>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=dyGN2fG99XjQtTR2E38+EOr7B8xkQxAj0cGvTHmsIj0=;
 b=iL1YNdL9jPR9WchFhpQpwmWi+YSilY2/yqDvTpxNxXhb2XBMA4uzjVkemYDsLAdfl2
 odRxfhGK77SC7F9eevxhb3XhcqP3dSyHsBiFtS4SoWixnvbjrH46Pvy0qBURGEIB6Jue
 qkWhdci8+0lZ7S8crfMKMP3BZUMy+xaomGCnQ=
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMDcsIDIwMTkgYXQgMDE6MTQ6NTdQTSArMDIwMCwgQmVuamFtaW4gR2FpZ25h
cmQgd3JvdGU6Cj4gTGUgdmVuLiA3IGp1aW4gMjAxOSDDoCAxMjowNywgRW1pbCBWZWxpa292IDxl
bWlsLmwudmVsaWtvdkBnbWFpbC5jb20+IGEgw6ljcml0IDoKPiA+Cj4gPiBPbiBUaHUsIDYgSnVu
IDIwMTkgYXQgMjI6MTUsIERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+IHdy
b3RlOgo+ID4gPgo+ID4gPiBJLiB3YXMuIGJsaW5kLgo+ID4gPgo+ID4gPiBDYXVnaHQgd2l0aCB2
a21zLCB3aGljaCBoYXMgc29tZSByZWFsbHkgc2xvdyBjcmMgY29tcHV0YXRpb24gZnVuY3Rpb24u
Cj4gPiA+Cj4gPiA+IEZpeGVzOiAxODgyMDE4YTcwZTAgKCJkcm0vY3JjLWRlYnVnZnM6IFVzZXIg
aXJxc2FmZSBzcGlubG9jayBpbiBkcm1fY3J0Y19hZGRfY3JjX2VudHJ5IikKPiA+ID4gQ2M6IFJv
ZHJpZ28gU2lxdWVpcmEgPHJvZHJpZ29zaXF1ZWlyYW1lbG9AZ21haWwuY29tPgo+ID4gPiBDYzog
VG9tZXUgVml6b3NvIDx0b21ldS52aXpvc29AY29sbGFib3JhLmNvbT4KPiA+ID4gQ2M6IEVtaWwg
VmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+Cj4gPiA+IENjOiBCZW5qYW1pbiBH
YWlnbmFyZCA8YmVuamFtaW4uZ2FpZ25hcmRAbGluYXJvLm9yZz4KPiA+ID4gQ2M6IFZpbGxlIFN5
cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gPiA+IFNpZ25lZC1vZmYt
Ynk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+ID4KPiA+IFJldmll
d2VkLWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgo+IAo+IFJl
dmlld2VkLWJ5OiBCZW5qYW1pbiBHYWlnbmFyZCA8YmVuamFtaW4uZ2FpZ25hcmRAbGluYXJvLm9y
Zz4KClRoYW5rcyBmb3IgdGhlIHJldmlld3MsIGFwcGxpZWQgdG8gLW1pc2MtbmV4dC4KLURhbmll
bAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24K
aHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
