Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0B922EDB1
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 15:41:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06E1B89C9D;
	Mon, 27 Jul 2020 13:41:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2263789BFE;
 Mon, 27 Jul 2020 13:41:23 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id g11so5342813ejr.0;
 Mon, 27 Jul 2020 06:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=WRU4i5nuotlpyXHsJ/GhJzUxBSJEh2EwvWzY/0mhtJs=;
 b=mFD/ySOZnh4it4pc167jVC6Z34oW7cMd8EdI/V69L+eE5UfUVpA0w/wnxhr4dXFW9z
 LFiExckvP8rfz/TYYUgH+E1vDKzNZsx3rCTKEWxBtycZ6+gMWOCgcjSmg7mom3w2/kwf
 iQF1Tsv489AjXrDW9JlBgaIs/w1rLl9JtXftS5lwWS1LvgdlXY5xQxDijG5tNDY7jakQ
 oPJLsDI5NnIb7jqcoZF4iEFQYrfZvu3usWajfcMIEtPYAzF74ds8cFcDFDl/tzCKAllP
 zDXlxyeVU/+9v45b/WDh8wjgQvKDVX2HfOGwY+4Gx6NeA389zat2buQigFyMFaW0ZVT/
 65QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=WRU4i5nuotlpyXHsJ/GhJzUxBSJEh2EwvWzY/0mhtJs=;
 b=nW/tTk+6uV3F/fQOW82Rp1VDDEo0lGZfylEDYIDhS3/DwVdmjwlP2SYKq5R7gnnI7a
 NwrhYyhDgKJVGVMUtDdYDlHYDLeDQI9C2k2vdOWLqagmGnw05mzh4ACcoc4RnMz5K1vH
 FFnyYbcz3S3wA6yWa3wtcGfjcBN/NEkp6hOsUSVRHKWozXoTWpCbWmGaWhi/FLlDhmhv
 DetYH8szKhwuH4Nnsu1h4yj49nvfxurXH5TmHV498BBTpO9C+mjDZmR+/hBMhBEJt3ZL
 28yg618oWm7asdSWoIeQQTwCFyoVfjwZgz/7OI/TE7dUklpkjfXBq44AgOS/onavZuKc
 8v2A==
X-Gm-Message-State: AOAM530jW4OzEw5doPOoR5b7K3FXao5H91QnahrMBofVe5NcDf6gFYOp
 T7R9G0zP8yMBRa3XmwGAjVihWpnB
X-Google-Smtp-Source: ABdhPJyBJhGj0hE+6xxGNbOwiNpVx+ZqZqnr6spvxdyioOzNcY9AaM+Mx08+jlrNxnYSY44/BNGa0A==
X-Received: by 2002:a17:906:a88b:: with SMTP id
 ha11mr5428219ejb.545.1595857281845; 
 Mon, 27 Jul 2020 06:41:21 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id s2sm754721ejh.95.2020.07.27.06.41.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jul 2020 06:41:21 -0700 (PDT)
Subject: Re: [PATCH 2/2] drm/radeon: avoid a useless memset
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch
References: <20200727103436.50793-1-christophe.jaillet@wanadoo.fr>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <898acaf6-9975-40b1-1104-586b64689ccd@gmail.com>
Date: Mon, 27 Jul 2020 15:41:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200727103436.50793-1-christophe.jaillet@wanadoo.fr>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Cc: kernel-janitors@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjcuMDcuMjAgdW0gMTI6MzQgc2NocmllYiBDaHJpc3RvcGhlIEpBSUxMRVQ6Cj4gQXZvaWQg
YSBtZW1zZXQgYWZ0ZXIgYSBjYWxsIHRvICdkbWFfYWxsb2NfY29oZXJlbnQoKScuCj4gVGhpcyBp
cyB1c2VsZXNzIHNpbmNlCj4gY29tbWl0IDUxOGEyZjE5MjVjMyAoImRtYS1tYXBwaW5nOiB6ZXJv
IG1lbW9yeSByZXR1cm5lZCBmcm9tIGRtYV9hbGxvY18qIikKPgo+IFNpZ25lZC1vZmYtYnk6IENo
cmlzdG9waGUgSkFJTExFVCA8Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI+CgpSZXZpZXdl
ZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKPiAtLS0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2dhcnQuYyB8IDEgLQo+ICAgMSBmaWxl
IGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL3JhZGVvbl9nYXJ0LmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9nYXJ0
LmMKPiBpbmRleCBiN2NlMjU0ZTU2NjMuLjM4MDhhNzUzMTI3YiAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9nYXJ0LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL3JhZGVvbl9nYXJ0LmMKPiBAQCAtODUsNyArODUsNiBAQCBpbnQgcmFkZW9uX2dhcnRf
dGFibGVfcmFtX2FsbG9jKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KQo+ICAgCX0KPiAgICNl
bmRpZgo+ICAgCXJkZXYtPmdhcnQucHRyID0gcHRyOwo+IC0JbWVtc2V0KCh2b2lkICopcmRldi0+
Z2FydC5wdHIsIDAsIHJkZXYtPmdhcnQudGFibGVfc2l6ZSk7Cj4gICAJcmV0dXJuIDA7Cj4gICB9
Cj4gICAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
