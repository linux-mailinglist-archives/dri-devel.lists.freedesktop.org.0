Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EC7C892E8
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 11:07:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B34210E599;
	Wed, 26 Nov 2025 10:07:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ox4nF6vF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 997A710E59E
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 10:07:02 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-b8b33cdf470so188178a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 02:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764151622; x=1764756422; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e2P97JqJJgrSTofOE6L0Vqzh5vWI3dfXbDRlEdNGUic=;
 b=Ox4nF6vFIU1SFiA+ulQbztcjUdRgx6ug80zflZQ7zXolKc/UvudWlp2TKkva14enYK
 cAH18rKKK6a7h2RWr0jw45uZHpPs2/RGRpJGiS9wjC5l5awiE8xadJsNReINvw9DDS07
 nRsM7ilyTwg+UQZVopmoV0kJVU4ujKhUW6MRKot7uRrtyMGhmDSf78jqKXtXXCQio5It
 aueLzGTKy+i4jKf5ZHbp80ZvzuMnNIPeARb8LII1oi+J/H9HExTI6lxgk0RTiCn0zKwJ
 CR6vdFZriDFbKojUggbbPzVUNa6En2xyZeJKf3BmQqs31XJhYLFQRPlsEochLszwJKJ2
 OXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764151622; x=1764756422;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=e2P97JqJJgrSTofOE6L0Vqzh5vWI3dfXbDRlEdNGUic=;
 b=MptaHpPCDBeHUXreWSCAkPnOEdgKeMY8J/YoddB9KqDxusfpkpOhg5zZ9t0lyuYYju
 +Z7n0v8FZM7Jb11rbKBMuN9TaxYsVGQl50x8yivXu2AiwUoNBT1Axg/tQc4SfrdqQViF
 f+joJ8ej2HAc8lzwD6qKYuKFgbZGfTR/cilruaDQngsBIwks4tXseBVnK2/5oA9YYtz7
 3ORnIQiyKJbWsGKTR8Ce7EEF5bReSL3YZE4FYIIzAMcAb+KT7ZYy4/sJztamzYq7BDGW
 bMhQIyxfJdgQefEgXwnirBj1KhjE57cRIsSgNGiCJk4/jJGgWMKv+8QswQqENr1XKd95
 WFqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/QyGiuCwjbmKH1VuTgb4K2pBYj0n1+xXaByGq0Jza6yr+aZOHYKoP5xMV/+/j2pDGnBERhoe5x/o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5IG4WWWxe/4sktB7LixvVN3v9GX7AV0+QdG5G/j7jIwAyl4G/
 otqfdcCqAUe0fRls5fzy8dGkfR5MqJ3nF9DTeTGDKgJsBv1eM5QNDk1fbouLTLF/wzlzA8fn7/M
 5ZoR3nJCgjuHB2WaGkjtCvf8a1ONL+OU=
X-Gm-Gg: ASbGnct5L+9Glxj0NDLmtdTYot3KpUmwXWHOdGN2+cEKBLNWQfacgbbQRNDnFion/3W
 EK31BBJ2WA8/6uNimLGvpdxKTGhVMxEHADM1TRZvpECCaAVpXUAfqzfq0gBJzvAwJgS7P6/pN27
 J0zknJnryvyZ1mw7QJOEgNUmaMpzwtBR/+Wflc//xQ8wy/Tx/Iv61p32BMJvk39Raz062hVBzwb
 UfJPC4SSJc4zuV8pWx9Ya5vaGzpqXm0K9z+jGFZgBhfh/fdZjmB0iz+9qT1GfGJ/WvN+rFr9Px2
 nCV9usxE5KVL52+1TrHTlBxqGVftxldvJ9H8Sq5Br5LCJ5RXGSiwvJ63Pv1BnhrcX0rQRzQxmTm
 WWs1wPTB4I27+7g==
X-Google-Smtp-Source: AGHT+IH2u/p6uuejiQdBn2FdTVRunkAVdZufiIm+sEmpf2szKbImscQ5SyGn12xniGpqStrNxFPmWHVbL4VJexNgqJw=
X-Received: by 2002:a05:7300:ec16:b0:2a4:5129:fe99 with SMTP id
 5a478bee46e88-2a724bc5450mr11325693eec.2.1764151622004; Wed, 26 Nov 2025
 02:07:02 -0800 (PST)
MIME-Version: 1.0
References: <20251111171315.2196103-1-joelagnelf@nvidia.com>
 <DEHV08MPF9CH.1GZAWEGC4AVF3@nvidia.com>
 <095D38BD-A8AA-4BC3-8C24-9454964EB8F8@nvidia.com>
 <DEI89VUEYXAJ.1IQQPC3QRLITP@nvidia.com>
 <540391dc-caaf-4ca9-9729-e3147bed3100@nvidia.com>
In-Reply-To: <540391dc-caaf-4ca9-9729-e3147bed3100@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 26 Nov 2025 11:06:49 +0100
X-Gm-Features: AWmQ_bkhJWTAVJBxKsZu1t81P67sTZ90hu6KhDzqOUDEKCI0FkxUuBERQ_mEKds
Message-ID: <CANiq72n0mW6wSWvk4=R41BK=RWbpeXXjea-c1FZMs8y3sE6bug@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] rust: helpers: Add list helpers for C linked list
 operations
To: John Hubbard <jhubbard@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, 
 "airlied@gmail.com" <airlied@gmail.com>, Alistair Popple <apopple@nvidia.com>, 
 "ojeda@kernel.org" <ojeda@kernel.org>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, 
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "gary@garyguo.net" <gary@garyguo.net>, 
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 "lossin@kernel.org" <lossin@kernel.org>, 
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "aliceryhl@google.com" <aliceryhl@google.com>, 
 "tmgross@umich.edu" <tmgross@umich.edu>, "simona@ffwll.ch" <simona@ffwll.ch>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, 
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, Timur Tabi <ttabi@nvidia.com>, 
 "joel@joelfernandes.org" <joel@joelfernandes.org>, 
 "elle@weathered-steel.dev" <elle@weathered-steel.dev>, 
 "daniel.almeida@collabora.com" <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>, 
 "phasta@kernel.org" <phasta@kernel.org>, 
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, 
 Nouveau <nouveau-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Nov 26, 2025 at 2:39=E2=80=AFAM John Hubbard <jhubbard@nvidia.com> =
wrote:
>
> Yes. I am increasingly uneasy with the Rust for Linux approach, and
> now the Nova approach, of adding in "things we might need".

Excuse me, what "Rust for Linux approach"?

No, we do not add dead code unless justified, just like everywhere
else in the Linux kernel.

Yes, there are a few exceptional cases, but it is just that, exceptional.

Cheers,
Miguel
