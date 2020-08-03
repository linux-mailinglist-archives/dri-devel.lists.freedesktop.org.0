Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3597823A0AC
	for <lists+dri-devel@lfdr.de>; Mon,  3 Aug 2020 10:08:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 944A96E213;
	Mon,  3 Aug 2020 08:08:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36EA26E213
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Aug 2020 08:08:47 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id c16so17279363ejx.12
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Aug 2020 01:08:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=a0yu7M1tVw0zmP1gDFbyNUMxQCWzxTIkdFlcO1sI50Q=;
 b=NufZD/8h2bckVI4O0MUiyK2Zt840Q6UeNjlG4CPG1mdVAoexMl9lFA4EhDQyECb0wo
 38DOzA2SmYTJIaoA33ug3mjBii4EGnJoMhE9sJ/sWdjKVieD2hccik3Pz8eGWP21bj5j
 V3N+pRJdWsClar0VLIlnnybQhfnbtaM4GXwACeXKD+HwSkKN9W8uyKvYoQYbAPSbWb3v
 9r/yjPdHtNp3ZIYzGNS+2rRKrv3j0R0XjCjNQ8Y6kgw+e+JUCuwnPUk3cqyEIcKKB8ZM
 kz8nemi91IQrRfJN5gvpIC6KmX/hfjhPttHhKKdisqE8n3Ap0DvgyM7HP30U60wFp8a+
 bFxA==
X-Gm-Message-State: AOAM533A+5W4OZv6GStkmqF3S4Sf3NsP00ma9fZ69nXnEAaeiXknwE6O
 1l0gSwE9jPYrj7nD6CWDM0B5q1Nd
X-Google-Smtp-Source: ABdhPJwHcrqjaA28yGyrQjj55BAldR5dFDJiHH5/aOZ4EtnAnmSi9OPoDdHmcKT4tHNj8sn++fO6hg==
X-Received: by 2002:a17:907:20db:: with SMTP id
 qq27mr16105471ejb.550.1596442125868; 
 Mon, 03 Aug 2020 01:08:45 -0700 (PDT)
Received: from ?IPv6:2a0b:e7c0:0:107::49? ([2a0b:e7c0:0:107::49])
 by smtp.gmail.com with ESMTPSA id dm5sm6828068edb.32.2020.08.03.01.08.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Aug 2020 01:08:45 -0700 (PDT)
Subject: Re: [PATCH] vgacon: fix out of bounds write to the scrollback buffer
To: =?UTF-8?B?5byg5LqR5rW3?= <zhangyunhai@nsfocus.com>,
 Solar Designer <solar@openwall.com>
References: <659f8dcf-7802-1ca1-1372-eb7fefd4d8f4@kernel.org>
 <dbcf2841-7718-2ba7-11e0-efa4b9de8de1@nsfocus.com>
 <9fb43895-ca91-9b07-ebfd-808cf854ca95@nsfocus.com>
From: Jiri Slaby <jirislaby@kernel.org>
Message-ID: <9386c640-34dd-0a50-5694-4f87cc600e0f@kernel.org>
Date: Mon, 3 Aug 2020 10:08:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9fb43895-ca91-9b07-ebfd-808cf854ca95@nsfocus.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Kyungtae Kim <kt0755@gmail.com>, b.zolnierkie@samsung.com,
 Greg KH <greg@kroah.com>,
 Linux kernel mailing list <linux-kernel@vger.kernel.org>,
 DRI devel <dri-devel@lists.freedesktop.org>,
 Anthony Liguori <aliguori@amazon.com>,
 Yang Yingliang <yangyingliang@huawei.com>, xiao.zhang@windriver.com,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAzMS4gMDcuIDIwLCA3OjIyLCDVxdTGuqMgd3JvdGU6Cj4gUmVtb3ZlIHdoaXRlc3Bh
Y2UgYXQgRU9MCgpJIGFtIGZpbmUgd2l0aCB0aGUgcGF0Y2guIEhvd2V2ZXIgaXQgc2hvdWxkIGJl
IHNlbnQgcHJvcGVybHkgKGlubGluZQptYWlsLCBoYXZpbmcgYSBQQVRDSCBzdWJqZWN0IGV0Yy4g
LS0gc2VlCkRvY3VtZW50YXRpb24vcHJvY2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMucnN0KS4gZ2l0
IHNlbmQtZW1haWwgYWZ0ZXIgZ2l0CmZvcm1hdC1wYXRjaCBoYW5kbGVzIG1vc3Qgb2YgaXQuCgpU
aGVyZSBpcyBhbHNvIHF1ZXN0aW9uIHdobyBpcyB3aWxsaW5nIHRvIHRha2UgaXQ/CgpCYXJ0PyBH
cmVnPyBTaG91bGQgd2Ugcm91dGUgaXQgdmlhIGFrcG0sIG9yIHdpbGwgeW91IExpbnVzIGRpcmVj
dGx5PyAoSQpjYW4gc2lnbiBvZmYgYW5kIHJlc2VuZCB0aGUgcGF0Y2ggd2hpY2ggd2FzIGF0dGFj
aGVkIHRvIHRoZSBtYWlsIEkgYW0KcmVwbHlpbmcgdG8gdG9vLCBpZiBuZWVkIGJlLikKCnRoYW5r
cywKLS0gCmpzCnN1c2UgbGFicwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
