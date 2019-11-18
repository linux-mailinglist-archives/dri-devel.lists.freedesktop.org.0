Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA1C100A1E
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 18:21:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 379FA6E043;
	Mon, 18 Nov 2019 17:21:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4B966E632
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 17:21:11 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id u18so101047wmc.3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 09:21:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OilugexaU+S1KHBbk48kOtwyoAC35P1ttTUzGN7iIcc=;
 b=ai0ENr0G5CF1lPirqlZem4otbOQTUGeeGomQF6VtSaN4KPBlaWnd24xpB26hJzJ4U5
 RpIJsf7u8Z+Tw547w1mNn58wN7ZNDSc3ITh/pvrCMC8dFVe/YhLr+kKZH54gfk2HGlES
 xfs0KSQmmF+6OtaVD7PmoQn+Ht3wtLBnuw7uKg73l6x1RrOahYm8aluI3KMMBF4Z/KMl
 sBxhxyUYU+JJWdiqxyRzEFdN+xBFTKgSzrwot4cT5THUpCHFxEMJ7+pyVn4qdPdXAnvR
 dODTT9Pg11AxyFntKKZB+GSynPPuXN91TmF2qof+DtE8ABRm2RVFKgjSmsNsEyzSmjbK
 0omw==
X-Gm-Message-State: APjAAAUlK4BnkWtZowhOMvzImgMuZ1xEc0t/L9TKE7M2Qp/Jk+M8e2VG
 Qk05p2OZexYZNnIxP+VN9HtDBYibnZkoiwMtnTQc4g==
X-Google-Smtp-Source: APXvYqznA/9xU2/s8IKIiIE3OmB+W18+uFAhlPZanfXjpai0kpFkg3qUzHveiu2hFs8pIHW8GyzDKuWILyfczaArDWE=
X-Received: by 2002:a05:600c:214a:: with SMTP id
 v10mr130887wml.102.1574097670226; 
 Mon, 18 Nov 2019 09:21:10 -0800 (PST)
MIME-Version: 1.0
References: <cover.1574034832.git.sbobroff@linux.ibm.com>
In-Reply-To: <cover.1574034832.git.sbobroff@linux.ibm.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 18 Nov 2019 12:20:58 -0500
Message-ID: <CADnq5_MKQ0OGWuqJ2PesP7DojVztPDpU6uE3amM7skWYGDXL8A@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] fix bad DMA from INTERRUPT_CNTL2
To: Sam Bobroff <sbobroff@linux.ibm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=OilugexaU+S1KHBbk48kOtwyoAC35P1ttTUzGN7iIcc=;
 b=sp31CyXFNqCmsZqgkApkkIY+P1OHiJTAGmbNgvqD5gbB1JUe3qhUD4QWIap3vCRY1w
 ykeBAacocPCe9fUoDlo52/i+32PQLiSn4SWy/DDHkQ3wJYizJkSEAXJxWGEpEO3AmAwJ
 IKsCYXhJJtHUq9L/eGyO5PmaqisSlUWVtIUIAR9p/i1pwehdhpCDmOx+XIP1sdtmTMCE
 tzSO/5zDqQ6JHep0EpHGrWlnCsAm43ycIa9eggINarnghhgo5JCHf1qF1xgy9EWX6lih
 mulFMXuXKh1xBI0rkp1gDZLb1AN7kJwBoEreHakc6QwrnItTETdhH/3LYQHKO0gT5Ddj
 U7oQ==
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
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBOb3YgMTcsIDIwMTkgYXQgNjo1NCBQTSBTYW0gQm9icm9mZiA8c2JvYnJvZmZAbGlu
dXguaWJtLmNvbT4gd3JvdGU6Cj4KPiBBIGNvdXBsZSBvZiBub3RlczoKPiAtIEluaXRpYWwgZGlz
Y3Vzc2lvbjoKPiAgIGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2RyaS1k
ZXZlbC8yMDE5LU5vdmVtYmVyLzI0NDA5MC5odG1sCj4gLSBJIGhhdmUgb25seSB0ZXN0ZWQgdGhl
IGNhc2UgdGhhdCB1c2VzIHI2MDBfaXJxX2luaXQoKSwgYnV0IHRoZXkgYXJlIGFsbCB2ZXJ5Cj4g
ICBzaW1pbGFyLgo+Cj4gQ2hlZXJzLAo+IFNhbS4KPgo+IFBhdGNoIHNldCBjaGFuZ2Vsb2cgZm9s
bG93czoKCkFwcGxpZWQgdGhlIHNlcmllcy4gIFRoYW5rcyEKCkFsZXgKCj4KPiBQYXRjaCBzZXQg
djI6Cj4gUGF0Y2ggMS8yOiBkcm0vcmFkZW9uOiBmaXggYmFkIERNQSBmcm9tIElOVEVSUlVQVF9D
TlRMMgo+IC0gU3BsaXQgYW1kZ3B1IGNoYW5nZXMgaW50byBzZXBhcmF0ZSBwYXRjaC4KPiBQYXRj
aCAyLzIgKG5ldyBpbiB0aGlzIHZlcnNpb24pOiBkcm0vYW1kZ3B1OiBmaXggYmFkIERNQSBmcm9t
IElOVEVSUlVQVF9DTlRMMgo+Cj4gUGF0Y2ggc2V0IHYxOgo+IFBhdGNoIDEvMTogZHJtL3JhZGVv
biBkcm0vYW1kZ3B1OiBmaXggYmFkIERNQSBmcm9tIElOVEVSUlVQVF9DTlRMMgo+Cj4gU2FtIEJv
YnJvZmYgKDIpOgo+ICAgZHJtL3JhZGVvbjogZml4IGJhZCBETUEgZnJvbSBJTlRFUlJVUFRfQ05U
TDIKPiAgIGRybS9hbWRncHU6IGZpeCBiYWQgRE1BIGZyb20gSU5URVJSVVBUX0NOVEwyCj4KPiAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2lfaWguYyB8IDMgKystCj4gIGRyaXZlcnMvZ3B1
L2RybS9yYWRlb24vY2lrLmMgICAgICAgfCA0ICsrLS0KPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVv
bi9yNjAwLmMgICAgICB8IDQgKystLQo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3NpLmMgICAg
ICAgIHwgNCArKy0tCj4gIDQgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA3IGRlbGV0
aW9ucygtKQo+Cj4gLS0KPiAyLjIyLjAuMjE2LmcwMGEyYTk2ZmM5Cj4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
