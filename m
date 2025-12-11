Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C33CB73D8
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 23:00:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2586F10E306;
	Thu, 11 Dec 2025 22:00:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dgbk7UJk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E56610E305
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 22:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765490403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Njpx3Qs/b8QhZqkiJZ4Nes8q7O8NERYYeiceOSzlB/g=;
 b=dgbk7UJkU8a4W3YVKCC4lO7PZXDjslg3mWQQCarjyFD1sENx8zO7c7YP8ug3jL2rPUQ1Hu
 Js7bY9JVD4iXVpYr2GmARl/Yrw/gGDGAIexpQE1G9TkNaaOsKuqMaqkA6iIlp1tjyss/op
 Py1ei8lntHiCF30J5cnGjd//ZpxKQek=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-408-Y6pK3sF4Ma6UUP2-z2Q9aw-1; Thu, 11 Dec 2025 17:00:01 -0500
X-MC-Unique: Y6pK3sF4Ma6UUP2-z2Q9aw-1
X-Mimecast-MFC-AGG-ID: Y6pK3sF4Ma6UUP2-z2Q9aw_1765490401
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8b2dbd36752so145656585a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 14:00:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765490401; x=1766095201;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Njpx3Qs/b8QhZqkiJZ4Nes8q7O8NERYYeiceOSzlB/g=;
 b=ixhjBX2f5dZ/e6hqu+7Tzk6IW77k0xIpozBdTBXFeM0wUdqdbbFsV7X14i3jKdRdda
 e7hDYa1kZBWsTB0RZyv2JPcE3UpHld3tW7XAiER7WzVKABEv5DrFheeccLQqohsaQgfO
 ftyNfrs4ncjxNrjtUSn+KGs4frmwp8POcm5dNw2RV2BDjkBSJ8ZsPmOqnDxkbMmALlKd
 /wRueSgqO/qrt+X7QtMkXT3PuSE0CxtAF0ah/rlnpU0eMPcujpIsrRYGLgTGB/6wVJHw
 Pvtzhunzm/b8fqC+ZtZ/y0qfhNgSzJJmIkqOiuUELoY3iDg5nAaTU9DqoKrow5YJTxxy
 kjnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvfofdtSc7/KnX5QUtAQiL4YzzCxyDv2rdZj3HdH9m7MS2Yl1UXqXLwMtU2rPpRhFiXFGx9bYCkwY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZ7fHbaV6geakZ+m3imSDk1DBGVmZZlmBcpMPYyw0XCS/k1IKF
 ze7dDjHV6vJt0l4ILyjvM1OC3ZEY1oBHObF+mwPS9hGS1mIDijJNOUsA/Z2mt7QPWpFIy5AToHG
 M23MvHlzjDw2Yq2MiTFeqtjDCvRcSJZH6zOYHnPpL4Y8JKpyETpP9eOh7DK69SiJf0KPQKQ==
X-Gm-Gg: AY/fxX56+szmD4uY9CUzjN+J7WbMQVa0ls+AEtD0A2GvJPetsQYau/wvwyiE4AMesgm
 CxJ4ZNXqCK1pZztN/iBKB2lhxqUf55i6Nj5VCXOWaPG8fhLC8b3ZjMJR14rDK05qWh0MXTjBIZ9
 OOWQn2PU9aQ5qi6k4lTNYJHrtg2BERO9eGua6hunolnmhYl+I2u+PJO6TvMf0dmu6BcAM5NsvNJ
 PnjcoTJuC9Xhcxd6h8h8YYlndxSCBXG3Czpl+UtltTeoX9ClniWyk3eUjABuWXKzTjNfuusM9eo
 cWC/gRIAErBi8fADzrSwVTXOTiNi+NQaIftw+m4C6VoQV0c0GwUn9oQvmTaQE4TT01M6BVBoie/
 CUs2QqUByCGKvZMAUeGvavQynxyqEZOSDEtU+oyA82WOTiPqGGjM6ZVQ=
X-Received: by 2002:a05:620a:1a86:b0:8b2:f82f:c630 with SMTP id
 af79cd13be357-8bb39eb98b0mr5407485a.31.1765490401357; 
 Thu, 11 Dec 2025 14:00:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFcD/u3yfUht3fNeXEQhIUzrD0ydpAz9Hqu2OLR8JqXNXRjerBGXVTk8n11MJKpUQer50n6Fw==
X-Received: by 2002:a05:620a:1a86:b0:8b2:f82f:c630 with SMTP id
 af79cd13be357-8bb39eb98b0mr5403685a.31.1765490400979; 
 Thu, 11 Dec 2025 14:00:00 -0800 (PST)
Received: from [192.168.8.198] (pool-100-0-77-142.bstnma.fios.verizon.net.
 [100.0.77.142]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8bab544b657sm312470285a.10.2025.12.11.13.59.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 14:00:00 -0800 (PST)
Message-ID: <d47f7ca5afe8b53f63d91743323d152fe063ba86.camel@redhat.com>
Subject: Re: [PATCH 1/9] gpu: nova-core: gsp: warn if data remains after
 processing a message
From: lyude@redhat.com
To: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich
 <dakr@kernel.org>,  Alice Ryhl <aliceryhl@google.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>,  Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi
 <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Date: Thu, 11 Dec 2025 16:59:59 -0500
In-Reply-To: <20251208-nova-misc-v1-1-a3ce01376169@nvidia.com>
References: <20251208-nova-misc-v1-0-a3ce01376169@nvidia.com>
 <20251208-nova-misc-v1-1-a3ce01376169@nvidia.com>
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: L2QoeZd2vku5RuhQtBt3WHQx4_gn_MQbWeMmeG8KMJY_1765490401
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CgpPbiBNb24sIDIwMjUt
MTItMDggYXQgMTg6MjYgKzA5MDAsIEFsZXhhbmRyZSBDb3VyYm90IHdyb3RlOgo+IE5vdCBwcm9j
ZXNzaW5nIHRoZSB3aG9sZSBkYXRhIGZyb20gYSByZWNlaXZlZCBtZXNzYWdlIGlzIGEgc3Ryb25n
Cj4gaW5kaWNhdG9yIG9mIGEgYnVnIC0gZW1pdCBhIHdhcm5pbmcgd2hlbiBzdWNoIGNhc2VzIGFy
ZSBkZXRlY3RlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgQ291cmJvdCA8YWNvdXJi
b3RAbnZpZGlhLmNvbT4KPiAtLS0KPiDCoGRyaXZlcnMvZ3B1L25vdmEtY29yZS9nc3AvY21kcS5y
cyB8IDEyICsrKysrKysrKysrLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvbm92YS1jb3JlL2dz
cC9jbWRxLnJzIGIvZHJpdmVycy9ncHUvbm92YS0KPiBjb3JlL2dzcC9jbWRxLnJzCj4gaW5kZXgg
ZGFiNzMzNzdjNTI2Li41Y2U4NWVlMWZmY2UgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvbm92
YS1jb3JlL2dzcC9jbWRxLnJzCj4gKysrIGIvZHJpdmVycy9ncHUvbm92YS1jb3JlL2dzcC9jbWRx
LnJzCj4gQEAgLTY2Miw3ICs2NjIsMTcgQEAgcHViKGNyYXRlKSBmbiByZWNlaXZlX21zZzxNOgo+
IE1lc3NhZ2VGcm9tR3NwPigmbXV0IHNlbGYsIHRpbWVvdXQ6IERlbHRhKSAtPiBSZXN1bAo+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsZXQgKGNtZCwgY29udGVudHNfMSkgPQo+IE06Ok1lc3Nh
Z2U6OmZyb21fYnl0ZXNfcHJlZml4KG1lc3NhZ2UuY29udGVudHMuMCkub2tfb3IoRUlPKT87Cj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxldCBtdXQgc2J1ZmZlciA9IFNCdWZmZXJJdGVyOjpu
ZXdfcmVhZGVyKFtjb250ZW50c18xLAo+IG1lc3NhZ2UuY29udGVudHMuMV0pOwo+IMKgCj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgTTo6cmVhZChjbWQsICZtdXQgc2J1ZmZlcikubWFwX2Vycih8
ZXwgZS5pbnRvKCkpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbGV0IHJlcyA9IE06OnJlYWQo
Y21kLCAmbXV0IHNidWZmZXIpLm1hcF9lcnIofGV8Cj4gZS5pbnRvKCkpOwo+ICsKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBpZiByZXMuaXNfb2soKSAmJiAhc2J1ZmZlci5pc19lbXB0eSgpIHsK
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldl93YXJuISgKPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJnNlbGYuZGV2LAo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiR1NQIG1lc3NhZ2Ugezo/fSBoYXMgdW5wcm9jZXNz
ZWQgZGF0YVxuIiwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZnVu
Y3Rpb24KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICk7Cj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfQo+ICsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXMKPiDCoMKgwqDC
oMKgwqDCoMKgIH0gZWxzZSB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEVycihFUkFOR0Up
Cj4gwqDCoMKgwqDCoMKgwqDCoCB9Owo=

