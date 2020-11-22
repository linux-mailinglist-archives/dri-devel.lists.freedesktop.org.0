Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC342BC579
	for <lists+dri-devel@lfdr.de>; Sun, 22 Nov 2020 12:56:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F0FB897F0;
	Sun, 22 Nov 2020 11:56:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FBF3897F0;
 Sun, 22 Nov 2020 11:56:11 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a65so14646830wme.1;
 Sun, 22 Nov 2020 03:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=blUtF4vDth6u7QfMkiSVFnkhECX06NxT8pH/v9y9onE=;
 b=lO2dgZMzM7KJGpKMLEc2epNJTzZAR58GYAiquMTFVoSgnhfsex0DIwYgYxt1dn/2Q5
 lvh8SOFGCR3/2k21KPRHPQUazBHnlYGQuOAJk7/vtkStT3VSsXfskwhXzb3sHGpr8M0E
 HI+jdF1ffV6P8kw3sSuBcT/h04PjEZqv/N8nnbl//1YU/t52Eh6gMIoFLCl72OxPs8Sr
 K9UHukLRFuu/uZDQHG9PsK00vE2ekkB2P0dO+j93JCtzWdVcdLalzASPQRU9xAtydnv8
 jk0rwIxN4iptk/mFq2r9Ko7/MfLRWTemrg0OIGO+KxLUl24v4nfas+UYfk2vq8mTd201
 5Muw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=blUtF4vDth6u7QfMkiSVFnkhECX06NxT8pH/v9y9onE=;
 b=QUA/l2dtq5DL6cmcqxTm7Fc+iM2OANzED3MYUhwe9ftAdOpBpBLAts9T0PBlaIjplo
 F7qlCgoDadW8lefNXKYJfhlk7oE3rxE++9Q4nJgbgsBtslADcxmyGZFVMCQ0Y0cnoerE
 hHJS0baL68NhMX3CV/8IlW9EEeNZLsVaPSu0ZZXNOvtjclkzHrWvc6tLQETVCr9YRt+h
 /z0/2QSS0ikTP5UABXOOxnSxX5niqLhOYtan8Roky9WoIwl48NlG/0zCBj7IPX41vW7+
 SNIwufn1lVaTHtTmkjqWbUfU0p+qan4XZofCdYycpcqfvwTprJBBN/H9qkeNAlHjrF+m
 z9rA==
X-Gm-Message-State: AOAM5336MvVC0aIdnnf/JUR2CJ3qIxPibyRd73mrZx6NT/81sEqnNj3D
 oofOX+BFxvtzLcAR+mhYH1c=
X-Google-Smtp-Source: ABdhPJwrThCSfHdiWMGIhL5DsrscyUt5+q7u3Ehge8DBJZdaaL8Tv/NGyeUAaLVIWc0HBy9at23HFQ==
X-Received: by 2002:a05:600c:2601:: with SMTP id
 h1mr14875242wma.35.1606046169831; 
 Sun, 22 Nov 2020 03:56:09 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id h2sm11121781wme.45.2020.11.22.03.56.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Nov 2020 03:56:09 -0800 (PST)
Subject: Re: [PATCH v3 06/12] drm/sched: Cancel and flush all oustatdning jobs
 before finish.
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, robh@kernel.org, l.stach@pengutronix.de,
 yuq825@gmail.com, eric@anholt.net
References: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
 <1605936082-3099-7-git-send-email-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <e870fca3-3fc6-463c-07cc-9c8509ea064c@gmail.com>
Date: Sun, 22 Nov 2020 12:56:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1605936082-3099-7-git-send-email-andrey.grodzovsky@amd.com>
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

QW0gMjEuMTEuMjAgdW0gMDY6MjEgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPiBUbyBhdm9p
ZCBhbnkgcG9zc2libGUgdXNlIGFmdGVyIGZyZWUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkg
R3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4KClJldmlld2VkLWJ5OiBDaHJp
c3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cgo+IC0tLQo+ICAgZHJpdmVy
cy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMgfCAzICsrKwo+ICAgMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zY2hl
ZHVsZXIvc2NoZWRfbWFpbi5jIGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWlu
LmMKPiBpbmRleCBkYTI0YzRlLi5jM2YwYmQwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxl
ci9zY2hlZF9tYWluLmMKPiBAQCAtODkxLDYgKzg5MSw5IEBAIHZvaWQgZHJtX3NjaGVkX2Zpbmko
c3RydWN0IGRybV9ncHVfc2NoZWR1bGVyICpzY2hlZCkKPiAgIAlpZiAoc2NoZWQtPnRocmVhZCkK
PiAgIAkJa3RocmVhZF9zdG9wKHNjaGVkLT50aHJlYWQpOwo+ICAgCj4gKwkvKiBDb25maXJtIG5v
IHdvcmsgbGVmdCBiZWhpbmQgYWNjZXNzaW5nIGRldmljZSBzdHJ1Y3R1cmVzICovCj4gKwljYW5j
ZWxfZGVsYXllZF93b3JrX3N5bmMoJnNjaGVkLT53b3JrX3Rkcik7Cj4gKwo+ICAgCXNjaGVkLT5y
ZWFkeSA9IGZhbHNlOwo+ICAgfQo+ICAgRVhQT1JUX1NZTUJPTChkcm1fc2NoZWRfZmluaSk7Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
