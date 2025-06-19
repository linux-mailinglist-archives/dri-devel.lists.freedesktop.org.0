Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24755ADFCCE
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 07:18:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A59E110E992;
	Thu, 19 Jun 2025 05:18:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="B7lGJ7Fr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65A3D10E992;
 Thu, 19 Jun 2025 05:18:40 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-23694cec0feso3945235ad.2; 
 Wed, 18 Jun 2025 22:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750310320; x=1750915120; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to:from
 :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
 :reply-to; bh=/ASTVkIJ/zIGMOA+ht2vHucxDWTZ9iKbrXVkoSRNYqU=;
 b=B7lGJ7FrksgcNWbZNsurMqLJ0ztIpiiSpIookcK11hXD47sAnZpzBViZ1Dvl/6De88
 Z1gycjSg7Z8vh3dibzMxTislo019nTUkLborYB6gkF1htDlXS5i4FFo4n2fZL6KaWaTS
 seNQiYrr2WCvbyBhs3n4ge/tXJFph2SomDZU1s9tkSEc/CxI7cwY4SIugOwBacjNDd/Z
 NRt4iu1jnDfBF51RpQBhk6QWlGX8RAfS+ArN2/9ECyG6AZfpWsYMftyPe5JtraBDOs8P
 FF0nTDxBjMD00dyPo6QcW8wov5vtVMYxl+2yQyB7TPrXEy0LSXYy0DVvZZKvrltFMDC/
 NNdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750310320; x=1750915120;
 h=content-transfer-encoding:mime-version:references:in-reply-to:from
 :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=/ASTVkIJ/zIGMOA+ht2vHucxDWTZ9iKbrXVkoSRNYqU=;
 b=GLC418c5n5HqduRTXao7f6x9/5CuVL2ThUibOYb+NyRyRgCEautzMC9fbq/3LmewI4
 qOXxLHz28+mlgX/Sz5FcQBVJqP+zbkUAVabXgtQGUEScGICT9ZzUp2sWQQHRbWiQpO2V
 JKOMhoHjFpSbNnENWR30rcW6FbBkxgR3q5P5f6AYf+VQQQX5yJtiz/Tp3ZPDuh7uYND7
 ADTpUwEu4+a46/pgkVzVnM344b1Nb/Sw950LPIeq5RDgXzjE0jSUX8wkceMciwOoYzbk
 OZqEP7hZ4Yo7v1Lu6vvrPfs6haeS7LIlbuQiCV9bGUxXFc6ekhlSjslJtLqCwI/69lR4
 i4TQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0B1q2AO3DPfUHXS0X8v01bLad6o/U6f85yxO+5cIJa2+nq69DFztBXhdGgP0ZEzHB0L6iXuKXM/U=@lists.freedesktop.org,
 AJvYcCVnvuQDPN6iejIXQ0DtTNph62sAcL3MYKFANHCcsia4ZIXzwARs7uRKiWc1vhTXY60ZlcigLcU0Kg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YygvFKrB2YyOnjyxqZlQBJPdnbwaY4JUsUczgh6EYtVmMPJhpVt
 2TuxMRevNk/7qMaz86ZabMKnpHYF/yBb2Xjc17ROswQoHqF0i3vTRGl/
X-Gm-Gg: ASbGnctkXOsufh5RKBPfA9Burvg2jkxrJ4rvcleC8vUV/WS4+DtEETXtyo+FOfSqJwt
 7xACFF952xDMSihIYuMsekzqrU4BHg/wpawQ8KPek/QJ6vRH9kEyt/nfyGhrrY6o6uag/4l3u3u
 EfMO/dRfKY/bDRlu05yP9f7FxJAmo3p+gUNGk9/sUNTtNnd0ca7p9PdwjDgm7ji/MZMhKua8DMG
 69m26c5IsITfqMKeOTGdLm1V9nXVcMsPZ+3ixCjeP8nGoWTyebBxI8qWgssVx4kdmjyGiW0Hgxx
 3/6IkF/OB6wqjNAkVH8NigDj8pk01jrA1JnHbRtPmUvYh6Ccz9NMZz8CvTVH71piEAmC3KTSazc
 SkHEKjGVk/Sd58d0R4ON89ApmO/RrYVJkCS2EaaeG
X-Google-Smtp-Source: AGHT+IEvcoWS+/mpCBS9HRGMoVVCn5GZ2BtlFZ10WJnLh4P0CWaOXTjNBc1tb/94RF8WfyU78YJazg==
X-Received: by 2002:a17:903:4b4c:b0:235:6e1:3edf with SMTP id
 d9443c01a7336-2366b122194mr301022585ad.34.1750310319710; 
 Wed, 18 Jun 2025 22:18:39 -0700 (PDT)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp.
 [180.34.120.7]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2365deca344sm110992075ad.203.2025.06.18.22.18.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jun 2025 22:18:39 -0700 (PDT)
Date: Thu, 19 Jun 2025 14:18:17 +0900 (JST)
Message-Id: <20250619.141817.2042938522863410452.fujita.tomonori@gmail.com>
To: tamird@gmail.com
Cc: masahiroy@kernel.org, nathan@kernel.org, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, dakr@kernel.org, gregkh@linuxfoundation.org,
 rafael@kernel.org, brendan.higgins@linux.dev, davidgow@google.com,
 rmoar@google.com, bhelgaas@google.com, mcgrof@kernel.org,
 russ.weight@linux.dev, robh@kernel.org, saravanak@google.com,
 abdiel.janulgue@gmail.com, daniel.almeida@collabora.com,
 robin.murphy@arm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, fujita.tomonori@gmail.com, nicolas.schier@linux.dev,
 frederic@kernel.org, lyude@redhat.com, tglx@linutronix.de,
 anna-maria@linutronix.de, lossin@kernel.org, kwilczynski@kernel.org,
 jstultz@google.com, sboyd@kernel.org, lorenzo.stoakes@oracle.com,
 Liam.Howlett@oracle.com, leitao@debian.org, viresh.kumar@linaro.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-pci@vger.kernel.org,
 linux-block@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org,
 linux-mm@kvack.org, linux-pm@vger.kernel.org, nouveau@lists.freedesktop.org
Subject: Re: [PATCH v12 5/6] rust: enable `clippy::cast_lossless` lint
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <20250615-ptr-as-ptr-v12-5-f43b024581e8@gmail.com>
References: <20250615-ptr-as-ptr-v12-0-f43b024581e8@gmail.com>
 <20250615-ptr-as-ptr-v12-5-f43b024581e8@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-7
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

T24gU3VuLCAxNSBKdW4gMjAyNSAxNjo1NTowOSAtMDQwMA0KVGFtaXIgRHViZXJzdGVpbiA8dGFt
aXJkQGdtYWlsLmNvbT4gd3JvdGU6DQoNCj4gQmVmb3JlIFJ1c3QgMS4yOS4wLCBDbGlwcHkgaW50
cm9kdWNlZCB0aGUgYGNhc3RfbG9zc2xlc3NgIGxpbnQgWzFdOg0KPiANCj4+IFJ1c3SicyBgYXNg
IGtleXdvcmQgd2lsbCBwZXJmb3JtIG1hbnkga2luZHMgb2YgY29udmVyc2lvbnMsIGluY2x1ZGlu
Zw0KPj4gc2lsZW50bHkgbG9zc3kgY29udmVyc2lvbnMuIENvbnZlcnNpb24gZnVuY3Rpb25zIHN1
Y2ggYXMgYGkzMjo6ZnJvbWANCj4+IHdpbGwgb25seSBwZXJmb3JtIGxvc3NsZXNzIGNvbnZlcnNp
b25zLiBVc2luZyB0aGUgY29udmVyc2lvbiBmdW5jdGlvbnMNCj4+IHByZXZlbnRzIGNvbnZlcnNp
b25zIGZyb20gYmVjb21pbmcgc2lsZW50bHkgbG9zc3kgaWYgdGhlIGlucHV0IHR5cGVzDQo+PiBl
dmVyIGNoYW5nZSwgYW5kIG1ha2VzIGl0IGNsZWFyIGZvciBwZW9wbGUgcmVhZGluZyB0aGUgY29k
ZSB0aGF0IHRoZQ0KPj4gY29udmVyc2lvbiBpcyBsb3NzbGVzcy4NCj4gDQo+IFdoaWxlIHRoaXMg
ZG9lc24ndCBlbGltaW5hdGUgdW5jaGVja2VkIGBhc2AgY29udmVyc2lvbnMsIGl0IG1ha2VzIHN1
Y2gNCj4gY29udmVyc2lvbnMgZWFzaWVyIHRvIHNjcnV0aW5pemUuICBJdCBhbHNvIGhhcyB0aGUg
c2xpZ2h0IGJlbmVmaXQgb2YNCj4gcmVtb3ZpbmcgYSBkZWdyZWUgb2YgZnJlZWRvbSBvbiB3aGlj
aCB0byBiaWtlc2hlZC4gVGh1cyBhcHBseSB0aGUNCj4gY2hhbmdlcyBhbmQgZW5hYmxlIHRoZSBs
aW50IC0tIG5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkLg0KPiANCj4gTGluazogaHR0cHM6
Ly9ydXN0LWxhbmcuZ2l0aHViLmlvL3J1c3QtY2xpcHB5L21hc3Rlci9pbmRleC5odG1sI2Nhc3Rf
bG9zc2xlc3MgWzFdDQo+IFN1Z2dlc3RlZC1ieTogQmVubm8gTG9zc2luIDxiZW5uby5sb3NzaW5A
cHJvdG9uLm1lPg0KPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvRDhPUlRYU1VU
S0dMLjFLT0pBR0JNOEY4VE5AcHJvdG9uLm1lLw0KPiBSZXZpZXdlZC1ieTogQmVubm8gTG9zc2lu
IDxiZW5uby5sb3NzaW5AcHJvdG9uLm1lPg0KPiBSZXZpZXdlZC1ieTogQm9xdW4gRmVuZyA8Ym9x
dW4uZmVuZ0BnbWFpbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFRhbWlyIER1YmVyc3RlaW4gPHRh
bWlyZEBnbWFpbC5jb20+DQo+IC0tLQ0KPiAgTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgMSArDQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX3BhbmljX3FyLnJzICAgICAgfCA0
ICsrLS0NCj4gIGRyaXZlcnMvZ3B1L25vdmEtY29yZS9yZWdzLnJzICAgICAgICB8IDIgKy0NCj4g
IGRyaXZlcnMvZ3B1L25vdmEtY29yZS9yZWdzL21hY3Jvcy5ycyB8IDIgKy0NCj4gIHJ1c3QvYmlu
ZGluZ3MvbGliLnJzICAgICAgICAgICAgICAgICB8IDEgKw0KPiAgcnVzdC9rZXJuZWwvbmV0L3Bo
eS5ycyAgICAgICAgICAgICAgIHwgNCArKy0tDQo+ICBydXN0L3VhcGkvbGliLnJzICAgICAgICAg
ICAgICAgICAgICAgfCAxICsNCj4gIDcgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA2
IGRlbGV0aW9ucygtKQ0KDQpGb3IgUEhZIHBhcnQ6DQoNCkFja2VkLWJ5OiBGVUpJVEEgVG9tb25v
cmkgPGZ1aml0YS50b21vbm9yaUBnbWFpbC5jb20+DQo=
