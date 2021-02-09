Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8E93153BA
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 17:24:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4B866EB6D;
	Tue,  9 Feb 2021 16:24:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85B5F6EB6D;
 Tue,  9 Feb 2021 16:24:49 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id z32so13314994qtd.8;
 Tue, 09 Feb 2021 08:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=WAvcbe90u/Sk2hKwNc4NT+yMPbtvqWizeUPK15paqhE=;
 b=o3su8ZUKZnc93qTfjkoIhgkFZB6+E/ONif1lXzM7/H5up7fG74+TRVf9LbJ5FdWoUV
 UCDlzgwJ7/nPBqfHoK5S5zZX1LufjBmC7NaVt6hcJ1Om0wHa8qedk5bVU2CEo7CWZPTG
 +UPJQEiDLN1pA6Eodk8s8AU7Bzt/5iy0fAYH9zZb/dOcwwCSE8UE8dIn8WT8b4ajSD8e
 99STx9n8SABe411AWSarJioVXmERaupHCGyuXHCi6lRzuFt1lHBIDvQMPwOt6CmJo122
 7x1bW8iVmFiCZ0Ps2WHn8dQLjiG+WOIdvuWVnHFEf5C2LY8FLUFQaVqmDCMGIUD4GvsT
 fuLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=WAvcbe90u/Sk2hKwNc4NT+yMPbtvqWizeUPK15paqhE=;
 b=PzxXFSpHuOLz5IOu0e5EPcDRrIr0BRjkn+0+2e49sUcEfHFBK9UE+Y0Q3/3PjsqK5S
 6UUo7uXJfO7F0XYpwEfw2OzMdMcsBXfwJASls4nYT6stTxzZifKjNIE5VLLB8ZqRnoTT
 0bxwVLo0FoQWkjsMFPclKE4xabIPXRGvsxsfTiUhS1ZKzq+Ij5Zym4O+TNeOiZy+QwcJ
 GFk4An2HQ6g2MszDiethWvVHK/S5iFUt6xPjjnbO4NtVBYtkNyUuEgKoS1xxLQvSsiD3
 Bw+qX53EU6p+6kgzk6qVrpWCqrviuxzIuF207TVCcIc8S6VhUQY59jS1qK/qtudCe4no
 rBXw==
X-Gm-Message-State: AOAM532G6Iv3ccs4DModVT+p4Yypf20y6fHlNNNMwY5gyCd6hio62C5G
 UwnAmt+5K5eUryRYtu2MyAWXITx5jUnJmQ==
X-Google-Smtp-Source: ABdhPJy157lVLQqlscIEGVM7nSm1diSussGJ8QKoOqtK8ib/sPtGN86HtLgQnt7VgOEOw7L6vqPE3g==
X-Received: by 2002:ac8:4e14:: with SMTP id c20mr10841148qtw.206.1612887888676; 
 Tue, 09 Feb 2021 08:24:48 -0800 (PST)
Received: from ?IPv6:2601:5c0:c200:27c6:a82e:f46a:9884:895d?
 ([2601:5c0:c200:27c6:a82e:f46a:9884:895d])
 by smtp.gmail.com with ESMTPSA id j5sm16641832qth.80.2021.02.09.08.24.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Feb 2021 08:24:48 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH] drm/qxl: properly handle device init failures
From: Tong Zhang <ztong0001@gmail.com>
In-Reply-To: <20210209121629.vb3yu6zkr4npnskz@sirius.home.kraxel.org>
Date: Tue, 9 Feb 2021 11:24:47 -0500
Message-Id: <6FB53E26-5686-410F-B92F-5658BAF411C1@gmail.com>
References: <20210208104149.423758-1-kraxel@redhat.com>
 <E07153A4-9B42-4050-903E-8BBB99D8ED8E@gmail.com>
 <20210209121629.vb3yu6zkr4npnskz@sirius.home.kraxel.org>
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR2VyZCwKSSB0ZXN0ZWQgdGhlIHBhdGNoIG9uIGRybS1taXNjLW5leHQgYW5kIGl0IGZpeGVk
IHRoZSBpc3N1ZS4KVGhhbmtzLAotIFRvbmcKCj4gT24gRmViIDksIDIwMjEsIGF0IDc6MTYgQU0s
IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPiB3cm90ZToKPiAKPiBPbiBNb24sIEZl
YiAwOCwgMjAyMSBhdCAxMjowNzowMVBNIC0wNTAwLCBUb25nIFpoYW5nIHdyb3RlOgo+PiBEb2Vz
IHRoaXMgcGF0Y2ggZml4IGFuIGlzc3VlIHJhaXNlZCBwcmV2aW91c2x5PyBPciBzaG91bGQgdGhl
eSBiZSB1c2VkIHRvZ2V0aGVyPwo+PiBodHRwczovL3d3dy5tYWlsLWFyY2hpdmUuY29tL2xpbnV4
LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcvbXNnMjQ2NjU0MS5odG1sIAo+PiAKPj4gSU1ITyB1c2lu
ZyB0aGlzIHBhdGNoIGFsb25lIHdvbuKAmXQgZml4IHRoZSBpc3N1ZQo+IAo+IFRoaXMgcGF0Y2gg
b24gdG9wIG9mIGRybS1taXNjLW5leHQgZml4ZXMgdGhlIGluaXRpYWxpemF0aW9uIGVycm9yIGlz
c3VlCj4gcmVwb3J0ZWQgYnkgeW91IGluIG15IHRlc3RpbmcuCj4gCj4gdGFrZSBjYXJlLAo+ICBH
ZXJkCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
