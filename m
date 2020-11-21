Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 999772BBFA6
	for <lists+dri-devel@lfdr.de>; Sat, 21 Nov 2020 15:16:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E916E9C2;
	Sat, 21 Nov 2020 14:16:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 570C96E9C2;
 Sat, 21 Nov 2020 14:16:18 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id a15so12471610edy.1;
 Sat, 21 Nov 2020 06:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=cWbe+faF7Z9jmuI34DwJhG4F0zapIRTPqrZ5fN3wlY8=;
 b=aJGwAChI2O84q7upTiJecj/pkcc6IYI7xouxebF6axYLOsZIV9Ahtr7oPIRMz9EAS+
 JtMpD6a5f/h+qrwjTzGz07Hm2Xl+2n+vw8kE16Hb3Y0AaUvXzDCqWEraUMBylOOitzsW
 w4yXui7m2yGxmmlxUV+t9Y8FHYJ1iOZ5CauGczlJv4XlddnUqV9eQgyQyiwNuP9/65o/
 BTH57BlyqrfaTfzQqh76FyWZrKvOirEtFGyYGUXq+DNs7aUPmnVHa8hOi2A63dn8HVA9
 cEefPhqgnno7rN4Rd7tQzkEZzR27peTWzO4s6WWpdV6gBYyaBmHWld9uvD1L3cIE3Xd3
 Lelw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=cWbe+faF7Z9jmuI34DwJhG4F0zapIRTPqrZ5fN3wlY8=;
 b=NbNdQ3tJIcBkDC6U0lV5DG+93IUxEQhZQROFA9oewE5Wi1wfBZ2XNGEZtsoGL6dWCW
 ofcqBa8tZRinNn5mzEbgY81LBmMzq6fkgwCdWv4fTf16iCWZobwxGnBzQR7IL+nbRYDf
 6jeXnTXUgsMq3viBHRiKtf8MHnhsbLPdH38d45vmFUz6G26psBL1mLMluDTsNh3N091p
 MDtlLwPo4VtaTz7z3jpdGBSH3bWph2/efSLEI/qIcFWrLzobeO/x8amuTCt+blWuR4EW
 I6YfwO16qELYXlNw7XoZZ9JI/jgWRTOpXiRexNtOJYtGhcNJlmt7I+76VFGWP0JghI5C
 b4/w==
X-Gm-Message-State: AOAM530rroLQK1Zlc4brU7OrWo206F00dXDaexZg+H9tAgSfGIBlkhUG
 /mkiJW98q4epzSOjAcc1SWCaAJCedyg=
X-Google-Smtp-Source: ABdhPJy+eb82/6Ya4UN+Ma+8Ux/B5sog/VHVbU3YzcV42dzpPbsEXAx7UqQ/XYQkFVawxP6mQu2USA==
X-Received: by 2002:aa7:d711:: with SMTP id t17mr40096679edq.83.1605968177066; 
 Sat, 21 Nov 2020 06:16:17 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id bt16sm2488397ejb.89.2020.11.21.06.16.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Nov 2020 06:16:16 -0800 (PST)
Subject: Re: [PATCH v3 02/12] drm: Unamp the entire device address space on
 device unplug
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, robh@kernel.org, l.stach@pengutronix.de,
 yuq825@gmail.com, eric@anholt.net
References: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
 <1605936082-3099-3-git-send-email-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <54329aa5-ef57-3209-13b7-abd02683f9fc@gmail.com>
Date: Sat, 21 Nov 2020 15:16:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1605936082-3099-3-git-send-email-andrey.grodzovsky@amd.com>
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjEuMTEuMjAgdW0gMDY6MjEgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPiBJbnZhbGlk
YXRlIGFsbCBCT3MgQ1BVIG1hcHBpbmdzIG9uY2UgZGV2aWNlIGlzIHJlbW92ZWQuCj4KPiB2Mzog
TW92ZSB0aGUgY29kZSBmcm9tIFRUTSBpbnRvIGRybV9kZXZfdW5wbHVnCj4KPiBTaWduZWQtb2Zm
LWJ5OiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4KClJldmll
d2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cgo+IC0t
LQo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9kcnYuYyB8IDMgKysrCj4gICAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9k
cnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHJ2LmMKPiBpbmRleCAxMzA2OGZkLi5kNTUwZmQ1
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHJ2LmMKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX2Rydi5jCj4gQEAgLTQ3OSw2ICs0NzksOSBAQCB2b2lkIGRybV9kZXZfdW5w
bHVnKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCj4gICAJc3luY2hyb25pemVfc3JjdSgmZHJtX3Vu
cGx1Z19zcmN1KTsKPiAgIAo+ICAgCWRybV9kZXZfdW5yZWdpc3RlcihkZXYpOwo+ICsKPiArCS8q
IENsZWFyIGFsbCBDUFUgbWFwcGluZ3MgcG9pbnRpbmcgdG8gdGhpcyBkZXZpY2UgKi8KPiArCXVu
bWFwX21hcHBpbmdfcmFuZ2UoZGV2LT5hbm9uX2lub2RlLT5pX21hcHBpbmcsIDAsIDAsIDEpOwo+
ICAgfQo+ICAgRVhQT1JUX1NZTUJPTChkcm1fZGV2X3VucGx1Zyk7Cj4gICAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
