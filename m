Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E7F204099
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 21:39:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 494926E056;
	Mon, 22 Jun 2020 19:38:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAFBF6E056;
 Mon, 22 Jun 2020 19:38:58 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 17so753029wmo.1;
 Mon, 22 Jun 2020 12:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=B0J3Y1KfngHlRGhNaKohiEuVABGkpS2QatWF48jID1Y=;
 b=T/IQCP3N7lax0ljStlTkM2Upg2aF8qk2MwLZGSRq8uH0TaRPrEKvrlanyET/4PXBJo
 WFfgREcmEJ/ZJpWnP0gVMSdbiik0x4Z6LUTSuB5bXKMUt5CtcEoDeTYqeOlCizO3llz3
 UUT5G/wnOjTQ9tKC6VG8KkwPVJ9SLqH9zHu9HatKRAOGMchYWsiMEjw0enEye2yJs7tM
 awvLLBunAIRt/+fJFhDCJyAcoOZcS88gA3p7GlEVQsfVPgSEQXId29pRhJWlxfrQEWQW
 +cWJX4i1UOVKb73Fz35mgfXZSJfukRz4JTkwjXrU7BecJ/jnA0jpX0ft4KReMzTUHkse
 Itxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=B0J3Y1KfngHlRGhNaKohiEuVABGkpS2QatWF48jID1Y=;
 b=lVJ6B1JruzgsGIRZa5MpWELqA4ZvChRUFDJ/4Z9iZ1nrNenWJK3dW7vXulRoEIzOwO
 qYFwmZ8h3rmM0/pVr06EVy4zr5FuXfgOptQc9pU7UOGj7q5ZRo1dMRbhTLjXKKKB9NM5
 e7DUJ95lS7Q4FUegcHSGwRZT0ZBzpN9Wb0P4TRXqFC0lmgPgiGL24CNdxNzP8BlXPwS3
 pYBqU+oV1SQmVnixOvmVTaypTCKL1QF/xDF+JjkmF295qeHBQ8fUQSoLR/6Q/FbfMdxu
 Qdmyd5RCQiGOv07aGxYN4WvhMpPSRb7tcGsNl67VKl2/gwBZ6y0u2poKN9JgwNS/Bhll
 3yMw==
X-Gm-Message-State: AOAM532Vmu5DNDn+UifQn8HeW2eBjoD3mMyGOCXXsgTZnE510oF44sx0
 +2vJBQribC2zAIQP1VmSoqQ=
X-Google-Smtp-Source: ABdhPJyHtkFdOxpabnAlEoL8/oblY4fQjDDaW4aKQb4M5yOJSbAHwJN0B7Bzky60PKYjiMcC0XTAew==
X-Received: by 2002:a7b:c5c4:: with SMTP id n4mr14995151wmk.67.1592854737367; 
 Mon, 22 Jun 2020 12:38:57 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id b17sm10444130wrp.32.2020.06.22.12.38.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Jun 2020 12:38:56 -0700 (PDT)
Subject: Re: [PATCH v2 6/8] drm/amdgpu: Unmap entire device address space on
 device remove.
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
 <1592719388-13819-7-git-send-email-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <ec7dc51a-231f-f9e7-6082-5aad02965c67@gmail.com>
Date: Mon, 22 Jun 2020 21:38:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1592719388-13819-7-git-send-email-andrey.grodzovsky@amd.com>
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
Cc: daniel.vetter@ffwll.ch, michel@daenzer.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjEuMDYuMjAgdW0gMDg6MDMgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPiBVc2UgdGhl
IG5ldyBUVE0gaW50ZXJmYWNlIHRvIGludmFsaWRhdGUgYWxsIGV4c2lzdGluZyBCTyBDUFUgbWFw
cGluZ3MKPiBmb3JtIGFsbCB1c2VyIHByb2NjZXNzZXMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbmRy
ZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4KClJldmlld2VkLWJ5OiBD
aHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CgpJIHRoaW5rIHRob3Nl
IHR3byBwYXRjaGVzIGNvdWxkIGFscmVhZHkgbGFuZCBpbiBhbWQtc3RhZ2luZy1kcm0tbmV4dCAK
c2luY2UgdGhleSBhcmUgYSBnb29kIGlkZWEgaW5kZXBlbmRlbnQgb2YgaG93IGVsc2Ugd2UgZml4
IHRoZSBvdGhlciBpc3N1ZXMuCgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2Rydi5jIHwgMSArCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKPiBpbmRleCA0MzU5MmRjLi42
OTMyZDc1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9k
cnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwo+IEBA
IC0xMTM1LDYgKzExMzUsNyBAQCBhbWRncHVfcGNpX3JlbW92ZShzdHJ1Y3QgcGNpX2RldiAqcGRl
dikKPiAgIAlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gcGNpX2dldF9kcnZkYXRhKHBkZXYpOwo+
ICAgCj4gICAJZHJtX2Rldl91bnBsdWcoZGV2KTsKPiArCXR0bV9ib191bm1hcF92aXJ0dWFsX2Fk
ZHJlc3Nfc3BhY2UoJmFkZXYtPm1tYW4uYmRldik7Cj4gICAJYW1kZ3B1X2RyaXZlcl91bmxvYWRf
a21zKGRldik7Cj4gICAKPiAgIAlwY2lfZGlzYWJsZV9kZXZpY2UocGRldik7CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
