Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1678CC97C
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 01:15:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B484710E0A0;
	Wed, 22 May 2024 23:15:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="J6rn49bX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78BF410E0A0;
 Wed, 22 May 2024 23:15:21 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 46e09a7af769-6f0e2544f6bso213906a34.3; 
 Wed, 22 May 2024 16:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716419720; x=1717024520; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to:from
 :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
 :reply-to; bh=Ir2XqinlUrPpaQlopq6pGICD8nECQfQb9VlUJ47Cml4=;
 b=J6rn49bX7cEOXk0OgPJEPa3XA3nt+xZA5OSiyirMdDnwkQNvMuUDT/QgT9FBb0Gd/A
 Ee9nkW3QzvpOZhxys3uUcghzJDqO7dbIk0syvJWlKylk6Qdm7krsa4xGnYWi7oTWeIse
 xVOqdknF0KFTslfc6wlo3I9oPBHLTXc+gUVUkc37W5Z9Kk7WKmwFw7KNdWNHbndVkt6H
 mTevg22FEMBbGMId0NmUZh1cqzo3zyxcz3Bc/8Y76Zr/16hmxTN8UbTedRWpARZZ55IU
 gjildVMv8v7ebt1aFNTDKBAAMSm3mlkZ0w2XgvNKM+Chzx6wKdzuLUPiWaIftEGS2O+t
 2O4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716419720; x=1717024520;
 h=content-transfer-encoding:mime-version:references:in-reply-to:from
 :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Ir2XqinlUrPpaQlopq6pGICD8nECQfQb9VlUJ47Cml4=;
 b=fuCA+RLgn0nTP45xPKcO7yhec48JtSjrTmzT2qnIqFkcQXD+5q13egUfPKyNiFzLq4
 pVh9uF51p8IUJEdbgZ+DrfGJ+roc6CYWFyvEno+1xEhQdfRA5J8+amXCAtxQB/0GnS2Q
 oARwX5hm7+JgK7Ty+GiMoO/yUozQNENXuf7BsIpl9G5OKMwhksu/daKwFsmDgEw2LEqt
 ngTSNGm90DP73PYdGzs4fgfmwsR5OEptD9IbwMLJOqFL6UDGcieA8zT6nBfjIIfWd4HA
 y5X9xyl/M9JYabXl0K4IlaSSwj3h+AASPo6di08+uem7vwoLQ2/i6ewHhS6SBJGKYK6M
 Z9wQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8TeE434TTm3e+3Zar7LUMPYEDrbETCFr27iQAv0sQyZTUL9IR9k3kpKyNX7sbGoXc4iv4lq9STf+m5t92vk1JgP7pcwrBuqp3y5O5eUET8Qj3m7dlrPPpaYW1lKvqG4XHOm+0soygePiivFOt1A==
X-Gm-Message-State: AOJu0YyB9/XgENz9+pYwfIKxmuZXjojfXZObf7WEd56u+Fdc6C32mipX
 +X+hHJGxib5tAgn0iayiqCq9F2eSiTlTM3V55UUEY/oip76FyNqh
X-Google-Smtp-Source: AGHT+IEg0tD1wihn+c8EcE3GfwFZJ9P0oCxBgIaw/cJq+yGvGb5ZmoLis9eA4mwP5hlUp53Vcp3WSg==
X-Received: by 2002:a05:6358:2921:b0:192:82da:43df with SMTP id
 e5c5f4694b2df-19791b7d6d6mr377565255d.1.1716419720266; 
 Wed, 22 May 2024 16:15:20 -0700 (PDT)
Received: from localhost (p5261226-ipxg23801hodogaya.kanagawa.ocn.ne.jp.
 [180.15.241.226]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f4d2a66557sm22855335b3a.44.2024.05.22.16.15.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 16:15:19 -0700 (PDT)
Date: Thu, 23 May 2024 08:15:13 +0900 (JST)
Message-Id: <20240523.081513.81513679981916366.fujita.tomonori@gmail.com>
To: pstanner@redhat.com
Cc: fujita.tomonori@gmail.com, dakr@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, ojeda@kernel.org,
 alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@samsung.com, aliceryhl@google.com, lina@asahilina.net,
 ajanulgu@redhat.com, lyude@redhat.com, gregkh@linuxfoundation.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <35fef820ed6e67f2203e78735fc9e15248436221.camel@redhat.com>
References: <20240520172422.181763-4-dakr@redhat.com>
 <20240522.085334.1009573112046880609.fujita.tomonori@gmail.com>
 <35fef820ed6e67f2203e78735fc9e15248436221.camel@redhat.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
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

SGksDQoNCk9uIFdlZCwgMjIgTWF5IDIwMjQgMDk6Mzc6MzAgKzAyMDANClBoaWxpcHAgU3Rhbm5l
ciA8cHN0YW5uZXJAcmVkaGF0LmNvbT4gd3JvdGU6DQoNCj4+ID4gKy8vLyBBYnN0cmFjdGlvbiBh
cm91bmQgYSBDIGZpcm13YXJlIHN0cnVjdC4NCj4+ID4gKy8vLw0KPj4gPiArLy8vIFRoaXMgaXMg
YSBzaW1wbGUgYWJzdHJhY3Rpb24gYXJvdW5kIHRoZSBDIGZpcm13YXJlIEFQSS4gSnVzdA0KPj4g
PiBsaWtlIHdpdGggdGhlIEMgQVBJLCBmaXJtd2FyZSBjYW4NCj4+ID4gKy8vLyBiZSByZXF1ZXN0
ZWQuIE9uY2UgcmVxdWVzdGVkIHRoZSBhYnN0cmFjdGlvbiBwcm92aWRlcyBkaXJlY3QNCj4+ID4g
YWNjZXNzIHRvIHRoZSBmaXJtd2FyZSBidWZmZXIgYXMNCj4+ID4gKy8vLyBgJlt1OF1gLiBBbHRl
cm5hdGl2ZWx5LCB0aGUgZmlybXdhcmUgY2FuIGJlIGNvcGllZCB0byBhIG5ldw0KPj4gPiBidWZm
ZXIgdXNpbmcgYEZpcm13YXJlOjpjb3B5YC4gVGhlDQo+PiA+ICsvLy8gZmlybXdhcmUgaXMgcmVs
ZWFzZWQgb25jZSBbYEZpcm13YXJlYF0gaXMgZHJvcHBlZC4NCj4+ID4gKy8vLw0KPj4gPiArLy8v
ICMgRXhhbXBsZXMNCj4+ID4gKy8vLw0KPj4gPiArLy8vIGBgYA0KPj4gPiArLy8vIGxldCBmdyA9
IEZpcm13YXJlOjpyZXF1ZXN0KCJwYXRoL3RvL2Zpcm13YXJlLmJpbiIsDQo+PiA+IGRldi5hc19y
ZWYoKSk/Ow0KPj4gPiArLy8vIGRyaXZlcl9sb2FkX2Zpcm13YXJlKGZ3LmRhdGEoKSk7DQo+PiA+
ICsvLy8gYGBgDQo+PiA+ICtwdWIgc3RydWN0IEZpcm13YXJlKE9wYXF1ZTwqY29uc3QgYmluZGlu
Z3M6OmZpcm13YXJlPik7DQo+PiANCj4+IFdyYXBwaW5nIGEgcmF3IHBvaW50ZXIgaXMgbm90IHRo
ZSBpbnRlbmRlZCB1c2Ugb2YgUXBhcXVlIHR5cGU/DQo+PiANCj4gDQo+IFdoYXQgaXMgdGhlIGlu
dGVuZGVkIHVzZT8NCj4gQXMgSSBzZWUgaXQsIGFsbCB1c2VzIHdyYXBwIHNvbWUgYmluZGluZzo6
KiDigJMgYnV0IGEgcmF3cG9pbnRlciB0byBhDQo+IGJpbmRpbmcgc2hvdWxkbid0IGJlIHdyYXBw
ZWQgYnkgaXQ/DQoNCklmIEkgdW5kZXJzdGFuZCBjb3JyZWN0bHksIGl0J3MgZm9yIGVtYmVkZGlu
ZyBDJ3Mgc3RydWN0IGluIFJ1c3Qncw0Kc3RydWN0IChhcyBhbGwgdGhlIHVzYWdlIGluIHRoZSB0
cmVlIGRvKS4gSXQgZ2l2ZXMgdGhlIHRyaWNrcyBmb3INCmluaXRpYWxpemF0aW9uIGFuZCBhIHBv
aW50ZXIgdG8gdGhlIGVtYmVkZGVkIG9iamVjdC4NCg0KVGhlIEMncyBmaXJtd2FyZSBBUEkgZ2l2
ZXMgYSBwb2ludGVyIHRvIGFuIGluaXRpYWxpemVkIG9iamVjdCBzbyBubw0KcmVhc29uIHRvIHVz
ZSBPcGFxdWUuDQoNCldpdGggc3VjaCBDIEFQSSwgUnVzdCdzIHN0cnVjdCBzaW1wbHkgdXNlcyBy
YXcgcG9pbnRlcnMgaW4gb2xkIHJ1c3QNCmJyYW5jaC4gRm9yIGV4YW1wbGUsDQoNCmh0dHBzOi8v
Z2l0aHViLmNvbS9SdXN0LWZvci1MaW51eC9saW51eC9ibG9iL3J1c3QvcnVzdC9rZXJuZWwvY2hy
ZGV2LnJzI0wyOA0KDQpzdHJ1Y3QgQ2RldigqbXV0IGJpbmRpbmdzOjpjZGV2KTsNCg0KDQpBbm90
aGVyIGNob2ljZSB0aGF0IEkga25vdyBpcyBOb25OdWxsOg0KDQpodHRwczovL2xvcmUua2VybmVs
Lm9yZy9sa21sLzIwMjQwNDE1LWFsaWNlLW1tLXY1LTQtNmY1NWU0ZDhlZjUxQGdvb2dsZS5jb20v
DQoNCnB1YiBzdHJ1Y3QgUGFnZSB7DQogICAgcGFnZTogTm9uTnVsbDxiaW5kaW5nczo6cGFnZT4s
DQp9DQo=
