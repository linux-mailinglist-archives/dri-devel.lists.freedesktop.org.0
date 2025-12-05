Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF137CA8D3C
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 19:40:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BA2610E275;
	Fri,  5 Dec 2025 18:40:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZoAv9VYH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5203D10EB8E
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 18:40:40 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-7aab7623f42so2910007b3a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Dec 2025 10:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764960040; x=1765564840; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gx4zuHCdfmsBvfViSx4dewQ3NC0pwlIv6go7qc93ekw=;
 b=ZoAv9VYHKI8hLJair3HlUvq7jlKNa/fwQoEupn3AkOExTpNU/eWAzGBmBSycHhICJY
 zi6wOT+66L7u/znzSaB1/sXxnSSM4b8LIsWXmCM6s3WtxcQiOzfHDkQHh7HiOszYq4mz
 vxXAOYTr5Y6Vc2KMcinGNXDIf9jXI5Yb9rqm4grqkHI2sdyuS4nR0Dsa52zI9WXsRKKT
 Ay0I5ZpmZp2EoGZtFoDGu8kf2cxtJZr6rUFTFy7d8ol0BdwmAgzNpQ3W9Ko6vaIKeJYT
 WPk4G0HEHUuQuW2srJiyhhN9O81AlRUuAVwZCAs/pNwCivbjuZp+RNA7+WJWBI48UW0l
 1jZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764960040; x=1765564840;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Gx4zuHCdfmsBvfViSx4dewQ3NC0pwlIv6go7qc93ekw=;
 b=E8Kav2ls40h4I9B7veKb5GZ+J8YKMixN8HtoKT4ykik8bTnFTmUZidfMMZpApA2ltj
 GHMD0DcvMrg8YA52jrX7PYJAVdvANb6Wia6J9/hCN2F6WWKZmR+xlb01qrWbfFaRimiw
 /enbOKpznDZHvhm//w7A6YWAuPoJOrQlTSWBmAF1Kb15FJdaBKJ0L/KQOvAxvJKGYnFa
 fE+LXxn6x3npfAGqlXA16jlIx44h8e+S1VPZGBAxr8Z3fmtu7JqWiGX3D4Y9ZXRLx1WD
 O7leL+6vzQ5c0CvkJ3179b/up6IgWJJnzoX5Qij3JYGc/B8yBzrliSjjcndxYnyUY//v
 lW7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+aq9j30k0xlos25cyDomIT0ywFGnFH3SSUhy4Klpibenh9wjP0fi+rLzLO5R0ZNy8i6+3zcxtD70=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4gOSsnz7u8UP1bi71cddEWACf7iULu8pz1+9LEHCGBGpgmemP
 uicOp9qzNwvErWAJqyIYyCD434nLh8kRvD+IjXPijaxEOVdD3/B+JplZ
X-Gm-Gg: ASbGncvr3RkHYKFy1UbY3lamDP8vzWolNoRvnVvSkmZdxM8JD3rPP99BKsUkaxRWq4+
 IUNx/rH8xPvdepN0qNCW6PtyUBNIL4TJMfdIyMYet+H36c3mI04vanBJqPx784GayBaSmkVvVQu
 2gmLgDP8iYvMXFZKhV+T7T5rxzOgWqLtwp1VdvkzDHxOzxL97hotdHG6k1Y4a39pQuV1Q+2k9wp
 P442Vij17pOCS4HayzctJT4DXdO6sbT+OxqLjHUN2jhIGMjonSOIFD7ql6pM4vJxSwlANW8Lt2i
 Rvg9KbK6mDtWHlDxjYyUJtkDi8YIijdh1PCLJpn4s7xbnJEK80/TJA+gVcmgtcAeIwqNVSyGPcM
 iQ0qxBtNLpPGE/aURxGvmaRGiOJdg04FeJ3IfYVjoWnSYDTxfw1NSVsh7qBngRCwPxicSAIUrog
 KSFdl0SEObLirPhXUDAG3h6Zu0HQ==
X-Google-Smtp-Source: AGHT+IFdaIOl2EVfDf53MnHxu6h2Csp/9+fkL7qdsbkngVF7MJLua/LR1xBA2DmFila+UaeQfEKpNw==
X-Received: by 2002:a05:6a00:ac3:b0:7e8:4433:8fb5 with SMTP id
 d2e1a72fcca58-7e8c6cab76fmr135748b3a.61.1764960039751; 
 Fri, 05 Dec 2025 10:40:39 -0800 (PST)
Received: from shankari-IdeaPad.. ([103.24.60.188])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7e2a0533f08sm5952079b3a.23.2025.12.05.10.40.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Dec 2025 10:40:39 -0800 (PST)
From: Shankari Anand <shankari.ak0208@gmail.com>
To: Igor Korotin <igor.korotin.linux@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Christian Brauner <brauner@kernel.org>,
 Carlos Llamas <cmllamas@google.com>,
 Suren Baghdasaryan <surenb@google.com>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Alexandre Courbot <acourbot@nvidia.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Shankari Anand <shankari.ak0208@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH 05/10] rust: kernel: Update ARef and AlwaysRefCounted
 imports to use sync::aref
Date: Sat,  6 Dec 2025 00:10:23 +0530
Message-Id: <20251205184023.7230-1-shankari.ak0208@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <1b7408c5-64a8-42f1-92ab-dd90a883c1a4@gmail.com>
References: <1b7408c5-64a8-42f1-92ab-dd90a883c1a4@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hello Igor,

> 
> NIT: This module already imports `AlwaysRefCounted`, so please use the
> imported name instead of the full path for consistency.
> 
> >       fn inc_ref(&self) {
> >           // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
> >           unsafe { bindings::i2c_get_adapter(self.index()) };
> 
> Thanks
> Igor

I apologize for the overlook. I was just focussing on changing the path. 
I'll make the required changes and send a v2.

As this patch is part of a series, am I supposed to send all the patches with a v2, 
some have been acked by already, hence I had the question?

Thanks and regards,
Shankari
