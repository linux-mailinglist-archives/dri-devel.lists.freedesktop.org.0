Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B515BD5C1D
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 09:17:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F24FD89D5F;
	Mon, 14 Oct 2019 07:17:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B11086E090
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Oct 2019 19:17:10 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id u8so28497765iom.5
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Oct 2019 12:17:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nnXOz+PRi58QoHjbu8c9O+WK1XkBB4tTUc2/yDJUsyM=;
 b=q0pAMJb9tTBKuVCu24KVC1NDk54HA2XqCAEgb3kUHZ6n4xEthH0Gh1SlJAAFeEG+pQ
 OcxSUzAohWMLyoIuAFeYvB2mVOAONYEMd78ztHiVxa9Pow5XNbfYtoARE6DwOu1jUSG4
 5kX9kdYnCkIYJuRsUgAlDmS4X9evVJivjDWGgsn8H6XXQhN6i2I/L741LxqIUMCfyaIO
 RJCA7vFKQQy5l7APScMMN4tnyzuGZxyqmcYwq231HfqUX1fOvdp9ayFlpCAmn5eJXTr/
 /GuHnUgG0WF2Lpv0+HrxGn2YnMpxWS7K8+0kSg6ptmUr8aPisPmLdSEkiqrbFTXzZIRt
 A6yQ==
X-Gm-Message-State: APjAAAWQWm53JwrZ+ypFtqUhuw/S/WVvAYdo3PCrmuye5a+thBMHBTDe
 Pd24tD7cpcMFxKrRwPQc6mp+sqq/d2J3s7C/he8=
X-Google-Smtp-Source: APXvYqxrom5F5F07hOHPrw4GFvS2e6x6PfewZxqWfECjkUV75TnmcPI1mn3HAIFnkC8yXUkttiOV5Yh5LUUXo7eNKzc=
X-Received: by 2002:a02:a11e:: with SMTP id f30mr26789400jag.95.1570907829709; 
 Sat, 12 Oct 2019 12:17:09 -0700 (PDT)
MIME-Version: 1.0
References: <20191004190938.15353-1-navid.emamdoost@gmail.com>
 <540321eb-7699-1d51-59d5-dde5ffcb8fc4@web.de>
 <CAEkB2ETtVwtmkpup65D3wqyLn=84ZHt0QRo0dJK5GsV=-L=qVw@mail.gmail.com>
 <2abf545b-023b-853a-95ef-ce99e1896a5d@web.de>
 <3fd6aa8b-2529-7ff5-3e19-05267101b2a4@web.de>
In-Reply-To: <3fd6aa8b-2529-7ff5-3e19-05267101b2a4@web.de>
From: Navid Emamdoost <navid.emamdoost@gmail.com>
Date: Sat, 12 Oct 2019 14:16:58 -0500
Message-ID: <CAEkB2ERCGJ6abNXfPNX7nbwkwD7qYTPYjYsNGzZwynn5CbPCzg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/imx: Fix error handling for a kmemdup() call in
 imx_pd_bind()
To: Markus Elfring <Markus.Elfring@web.de>
X-Mailman-Approved-At: Mon, 14 Oct 2019 07:17:47 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nnXOz+PRi58QoHjbu8c9O+WK1XkBB4tTUc2/yDJUsyM=;
 b=nS7hNDn8VxzSjURlBE78kATwaL7qPglBjODaQGeiluWc7L3KMJe9YDZ1nbMjCPg2k1
 NmdpST3hzIfFgjjtm2k71t7RDTL5skpsie5QY7FAslM77IIOl0JgTi9qvN5Effnmvm4F
 QTb+x6j7CdtoOqx0Ko0vBaWDwGLJt3fUamR6zgAoIXZSs+BG6kUPAhNPbypt9dl0GbBi
 6avvmlrRrLi3bU+ixPrRNh7CE6AxmSB4ZJTTTGxLBW8ymbvXkKkbKXHdhMDf3sn6Saua
 tCmiBnq8pNsZV5EM1pikTlxsuxSKlPYCnEuij0vSYKUvTLc171zWgrvQIwYl/pejOLK2
 DmXw==
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
Cc: Thierry Reding <thierry.reding@gmail.com>, kernel-janitors@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Kangjie Lu <kjlu@umn.edu>,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Navid Emamdoost <emamd001@umn.edu>,
 Peter Senna Tschudin <peter.senna@collabora.com>,
 NXP Linux Team <linux-imx@nxp.com>, Stephen McCamant <smccaman@umn.edu>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBPY3QgMTIsIDIwMTkgYXQgNDowNyBBTSBNYXJrdXMgRWxmcmluZyA8TWFya3VzLkVs
ZnJpbmdAd2ViLmRlPiB3cm90ZToKPgo+IEZyb206IE1hcmt1cyBFbGZyaW5nIDxlbGZyaW5nQHVz
ZXJzLnNvdXJjZWZvcmdlLm5ldD4KPiBEYXRlOiBTYXQsIDEyIE9jdCAyMDE5IDEwOjMwOjIxICsw
MjAwCj4KPiBUaGUgcmV0dXJuIHZhbHVlIGZyb20gYSBjYWxsIG9mIHRoZSBmdW5jdGlvbiDigJxr
bWVtZHVw4oCdIHdhcyBub3QgY2hlY2tlZAo+IGluIHRoaXMgZnVuY3Rpb24gaW1wbGVtZW50YXRp
b24uIFRodXMgYWRkIHRoZSBjb3JyZXNwb25kaW5nIGVycm9yIGhhbmRsaW5nLgo+Cj4gRml4ZXM6
IDE5MDIyYWFhZTY3N2RmYTE3MWE3MTllOWQxZmYwNDgyM2NlNjVhNjUgKCJzdGFnaW5nOiBkcm0v
aW14OiBBZGQgcGFyYWxsZWwgZGlzcGxheSBzdXBwb3J0IikKPiBTaWduZWQtb2ZmLWJ5OiBNYXJr
dXMgRWxmcmluZyA8ZWxmcmluZ0B1c2Vycy5zb3VyY2Vmb3JnZS5uZXQ+Cj4gLS0tCj4gIGRyaXZl
cnMvZ3B1L2RybS9pbXgvcGFyYWxsZWwtZGlzcGxheS5jIHwgNyArKysrKystCj4gIDEgZmlsZSBj
aGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vaW14L3BhcmFsbGVsLWRpc3BsYXkuYyBiL2RyaXZlcnMvZ3B1L2RybS9p
bXgvcGFyYWxsZWwtZGlzcGxheS5jCj4gaW5kZXggMzU1MThlNWRlMzU2Li4zOWM0Nzk4ZjU2YjYg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2lteC9wYXJhbGxlbC1kaXNwbGF5LmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vaW14L3BhcmFsbGVsLWRpc3BsYXkuYwo+IEBAIC0yMTAsOCAr
MjEwLDEzIEBAIHN0YXRpYyBpbnQgaW14X3BkX2JpbmQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1
Y3QgZGV2aWNlICptYXN0ZXIsIHZvaWQgKmRhdGEpCj4gICAgICAgICAgICAgICAgIHJldHVybiAt
RU5PTUVNOwo+Cj4gICAgICAgICBlZGlkcCA9IG9mX2dldF9wcm9wZXJ0eShucCwgImVkaWQiLCAm
aW14cGQtPmVkaWRfbGVuKTsKPiAtICAgICAgIGlmIChlZGlkcCkKPiArICAgICAgIGlmIChlZGlk
cCkgewo+ICAgICAgICAgICAgICAgICBpbXhwZC0+ZWRpZCA9IGttZW1kdXAoZWRpZHAsIGlteHBk
LT5lZGlkX2xlbiwgR0ZQX0tFUk5FTCk7Cj4gKyAgICAgICAgICAgICAgIGlmICghaW14cGQtPmVk
aWQpIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBkZXZtX2tmcmVlKGRldiwgaW14cGQpOwoK
WW91IHNob3VsZCBub3QgdHJ5IHRvIGZyZWUgaW14cGQgaGVyZSBhcyBpdCBpcyBhIHJlc291cmNl
LW1hbmFnZWQKYWxsb2NhdGlvbiB2aWEgZGV2bV9remFsbG9jKCkuIEl0IG1lYW5zIG1lbW9yeSBh
bGxvY2F0ZWQgd2l0aCB0aGlzCmZ1bmN0aW9uIGlzCiBhdXRvbWF0aWNhbGx5IGZyZWVkIG9uIGRy
aXZlciBkZXRhY2guIFNvLCB0aGlzIHBhdGNoIGludHJvZHVjZXMgYSBkb3VibGUtZnJlZS4KCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4gKyAgICAgICAgICAgICAg
IH0KPiArICAgICAgIH0KPgo+ICAgICAgICAgcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF9zdHJpbmco
bnAsICJpbnRlcmZhY2UtcGl4LWZtdCIsICZmbXQpOwo+ICAgICAgICAgaWYgKCFyZXQpIHsKPiAt
LQo+IDIuMjMuMAo+CgoKLS0gCk5hdmlkLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
