Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D037CCA5B00
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 00:23:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B083D10E9E4;
	Thu,  4 Dec 2025 23:23:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Way2xJ3i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71A5410E9E4
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 23:23:38 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-b73161849e1so297030066b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 15:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1764890616; x=1765495416;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GAMF2P1zYp58T4w3wjWAVp8ef3GzCCouN500xAHns+k=;
 b=Way2xJ3iShsSoRiw7kSEvMRsFAds1y1YDd4h5f06Uu5B/P/gGHz41Gf0iI0J+wL/5s
 jg6D2T+dbZwp0pzRc/q6UHPdm3FFjajl3ZPLyZSwrwEi8RJLEPgv8Q8jdk/d0WOlzbbw
 g212MyQF3fKacD1IJueFB9DnXr+FE83Yv0dG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764890616; x=1765495416;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GAMF2P1zYp58T4w3wjWAVp8ef3GzCCouN500xAHns+k=;
 b=bmyFVTGygFR/RR2jLNjPa9l/eeN5DZjUIo4VU30JI3Pe6M3ehgarPj3j4+qUTFcqw7
 vuIvFEl4VXj2Zj2xAQH+1OW1uDPeLSMGvN/NOX2Q809nzN02jnfFwEojwvCa1Z0rfF1h
 6ELg2H0yCUeSOEBGR0JZ2MmRBBJQWkmftp6FKja17gu7Mk2lMg0mkrmadG3HuSAx1i3U
 ftQ4uL25CEJd21v4s9+GXIXGWKAsYGHnPsOBpI5oVBml/sTYLyuDl1Ps9IzBHLStjbXQ
 A1+Um/9KOUyOKfIRlnetMgx5gTI7AAHoMLqQn1OF7XCxp3GtLsQnA+bwYckeJHZwuTCz
 wfaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJv3c7lHPyaHvgwUlZDtjcJs4qRsJJFJXAjTqCHYmQK67TACnO8bRPqpbP3Nx5AuPe2ewdklAOe4I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/8jGRW1pIULlZr9C07mqHTGEbhJX0hVmzzqvHaxR6yWTpBU53
 i4Wo6WvjuSOACw+NQ4pb10aVmZiMLGYjFAZaPN26CtrBMI4DJBCZ6dRGgIvDqbrAC6kXfxLyfez
 aI/Cp3yw=
X-Gm-Gg: ASbGncu1mNhg8QuVtzfUpAiF1ufERV95zLA6GtHTlPO0mJfXRhzmOkmJbBWkRZCeqfu
 YT1d9I8JLbcX2yTBQcdDVNI0Qx9vfqrhwWVLrztCZUvFIzSvwZOZZM/XkjZQTlvlm6hhxuttuNl
 qF+w9MQm0DRWTYiaYtumhD7kJ30KvaoQv80p4a9YFG7ppwoW9T3F4AdzxUIIeGQfRPu9tTeO1sY
 I3IkCBVLGno3NihuzoeNBTOwvwAMhcU2VST5xZxjiMb4KuF2kLisz0dDFPqjUmdIt3lwzfqAi2F
 OxS1lt1PFqx6iZ7FeyBNkrFodxxbG+iDwW1+1uHxCkAQ6igvrRbKnnli8GdO2Ck1uNxS8xsiFoM
 ZlSLDt7w08SLowKoj6C5s2B5QB4lg1Ow+uu6c7VSmVSlIHvaiwub8LWnLvwoXP3yBhxyRNxE0nk
 n2O8XhIh9rTM1ngEQ5euOBAw5TxXBi97PEKBVXuLUeuCYzU+hBYvHHdP/NxR7t
X-Google-Smtp-Source: AGHT+IEHuh//NVJetzLmESOMadDjDQHoDfF3dE6WzteZZmhJDuHOMfZUnsuYQK4vOc2xFmPYOQFgvw==
X-Received: by 2002:a17:907:1c19:b0:b74:983b:4056 with SMTP id
 a640c23a62f3a-b79dbe4912cmr751319566b.8.1764890616423; 
 Thu, 04 Dec 2025 15:23:36 -0800 (PST)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com.
 [209.85.208.48]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b79f4975babsm229348466b.45.2025.12.04.15.23.35
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Dec 2025 15:23:35 -0800 (PST)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-641677916b5so2424431a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 15:23:35 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXI+8NU/mILl04yuTNf+Yhj9TC56/7Z4VonPTdzySyhJP+PvZkvIH+vs1CjwZz17FMI3kIjj8cCVbo=@lists.freedesktop.org
X-Received: by 2002:a05:6402:278d:b0:645:c665:56bf with SMTP id
 4fb4d7f45d1cf-6479c484fcamr6984906a12.24.1764890614735; Thu, 04 Dec 2025
 15:23:34 -0800 (PST)
MIME-Version: 1.0
References: <74032153-813a-4a40-8363-cce264f4d5ea@linuxfoundation.org>
 <1eb24816-530b-4470-8e58-ce7d8297996c@roeck-us.net>
 <0425d7b4-76e4-4057-83a5-a7b17a051c54@linuxfoundation.org>
 <ec77d11a-7613-4b75-8c9e-f2bba1595f0f@roeck-us.net>
 <9d520a1d-0b8d-4d30-b29f-230fc0f92b8a@linuxfoundation.org>
 <1f31b86d-283c-4878-92d0-ab90aed0c58d@roeck-us.net>
 <5af4522e-30ab-4eec-a861-c2760cdabd4f@linuxfoundation.org>
 <2bc690ca-fa57-46fa-949b-28b5441cd364@kernel.org>
 <b24fc85c-0e6d-42f9-a6b9-05136409098f@linuxfoundation.org>
 <CAHk-=whd-k3GhNGvVmP7W2p1d0d4ctqJ8iCuG8DbyKzgNqCL+g@mail.gmail.com>
 <3b6d6e50-91ac-435e-adad-a67d4198a5b5@kernel.org>
 <3cd2240b-ec2c-45d0-b73b-b66c83e75b9f@linuxfoundation.org>
In-Reply-To: <3cd2240b-ec2c-45d0-b73b-b66c83e75b9f@linuxfoundation.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 4 Dec 2025 15:23:18 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiEXy+7Gd3ONQ-v0e61e6qAmrtk+WE2dpW_61p83nMgXw@mail.gmail.com>
X-Gm-Features: AQt7F2q75KScWbWqgcI8F4O4T3lWb1voNa-u0o71vR1GfvutFdi37cFnKktDY94
Message-ID: <CAHk-=wiEXy+7Gd3ONQ-v0e61e6qAmrtk+WE2dpW_61p83nMgXw@mail.gmail.com>
Subject: Re: Linux 6.18 amdgpu build error
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: "David Hildenbrand (Red Hat)" <david@kernel.org>, akpm@linux-foundation.org,
 Alexander Deucher <Alexander.Deucher@amd.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx@lists.freedesktop.org, 
 dri-devel <dri-devel@lists.freedesktop.org>, Guenter Roeck <linux@roeck-us.net>,
 Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 4 Dec 2025 at 15:20, Shuah Khan <skhan@linuxfoundation.org> wrote:
>
> I didn't see any problems on 6.18.

Ahh. So it might be just that buggy commit adfb6609c680 then, and the
fix already being in rc7 (and final).

              Linus
