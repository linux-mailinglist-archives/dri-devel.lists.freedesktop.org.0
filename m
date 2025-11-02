Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 749ACC298A4
	for <lists+dri-devel@lfdr.de>; Sun, 02 Nov 2025 23:49:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BE8310E10C;
	Sun,  2 Nov 2025 22:49:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Qv9vY0fg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1C9C10E10C
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Nov 2025 22:49:52 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-475dbc3c9efso22317955e9.0
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Nov 2025 14:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762123791; x=1762728591; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yxZfP1EgwtZ2tiYeqX+Jv36xFp2c8XGw5hNT53dpp4c=;
 b=Qv9vY0fgnYn9P9BFHNQmSNDbmlsfixtSgblrMnT9GMnsWWmkYvV9fgiXHhIBhHOGaq
 7/CmNxnWg5bZml9GpVK01YuaPS8dsBf3dmhIsprpSTkBDrEub1+8BJ8lgCZPwqpAnd7Y
 F/74N8/7WYCesW9hBRdTYhWYaluqFsxnDM6ss5dIAq1CtAmtDRLBuRzk9pume06oUrSV
 /GAHOAt+5BVgezwtgfs+52K/uMAEGIH0ra+qD/C/5lHwGzch0KmBa0wHIUgcpxhG2i4S
 3Sb7uqKqTx/j15DUJ6wS2N9/NQNQEdTDIQlSOxw4pyObAJ1il9dxsbqVmettUZ0I4P16
 JoUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762123791; x=1762728591;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yxZfP1EgwtZ2tiYeqX+Jv36xFp2c8XGw5hNT53dpp4c=;
 b=N1bVTeHG+2Sg0EyzRIE10gu3F4pchCMAQJh7vP/5yVvNywSHP34/KXE19RKYBGV9cS
 F6+bH5zyH2VeNfvET7v/WgtxPoCFevRWN5du0egrK0WiSfBmRQh3JOsu//7jROexRqAY
 fdpcS7SoHxOZU0V9NfUP/OneaYG5fIfimyLmo/wndtKiE+ReOsVAt2LJIk7xL6MJkCnj
 e/+CNcgH0CRLMktgDKPjtl3+8A9VwMQ/r8uKxjqWtouuaQEFg9gzUpRkN8C2DsLmFnEi
 Y8/qYeD4ooWptwL+nwSXqEAMhKLp8JniLxZY7zDNWhVJAHm41sKBtr8DH5ysvdxRfVxk
 rWHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcnwDFVgtHcB5sGezAkhyO3xHU9nxYXrPwJo/jPkr10kvjMYDc69F4BxnABDvXB3o1Vxn1x/QjCAQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2URb1t+z/GmWuf+gKa0SQeYRuMvYeEHd1Ce4P0drXakVg1RMQ
 dWyrOOvlannbSAaq3WmPO2ZPniWJKhrUDxDSVJ7wbIkBUazax60CooOD
X-Gm-Gg: ASbGncvVH+y7tGuGmUBDBnHomKLNJKadE5i87HYQE8ZVlWkG+CGcakFy0N+uCyb2k++
 75BsrOhC8F6ub77Kte2JcutfzZ8FGVmMDfJHpqbcMZlV50MhOCxBVzYU4xKtem+8mDECCf4X0RD
 C6DL27DCk3Y6uK6qVzuEVpUxrWltuN30+2+bzWJrMs9Bug7vd0agAXIOA2FcIwV2V4zezLR/2hy
 t5uf7+M4/OagfeYXY4jSNEO8Q62hFqtS7lY9jb0P1Mm5r0UwGB9p0ofvtu72MWS8oL3bNZjbOxF
 PmPsK6J4Lybu57HVix76N3df3i9WJa7kU8Yr+0cYNjptfVAalU54ZYmBQlnrl2mxF0Eec6UlBPM
 XbDHpCSZ8mNZktQvGntQF1vDST+KIYSOndj22ahw3XYUvtmmLhXqzE3UvmLWrOhfIu2gUnVbxhU
 hJV8w/2RWYQLSvEcxRW4EGXEX9QI/AvtGTfeJk2LJOYEmD0CSxIKvIYKiWVHgI6NMzz5c=
X-Google-Smtp-Source: AGHT+IHLr7QHAYyCpR7esydH0iZxndus/Yszg7n3Mbh2EIBSjYHhxzLG4Xv/sUpvArKaCvluQvwAug==
X-Received: by 2002:a05:600c:848d:b0:471:12c2:201f with SMTP id
 5b1f17b1804b1-477308b5986mr103587185e9.32.1762123791099; 
 Sun, 02 Nov 2025 14:49:51 -0800 (PST)
Received: from ?IPV6:2a01:e0a:acc:bb60:756b:64e3:20ef:1d08?
 ([2a01:e0a:acc:bb60:756b:64e3:20ef:1d08])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4772ff83182sm72828245e9.4.2025.11.02.14.49.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Nov 2025 14:49:50 -0800 (PST)
Message-ID: <4b910f6f-9144-46a8-95c6-8e53bc83cd8c@gmail.com>
Date: Sun, 2 Nov 2025 23:49:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] nova-core: Simplify `transmute` and
 `transmute_mut` in fwsec.rs
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 dri-devel <dri-devel-bounces@lists.freedesktop.org>
References: <20251023205146.196042-1-delcastillodelarosadaniel@gmail.com>
 <DDXC17HXPXFZ.3TIX7FHUJHAI7@nvidia.com>
 <70210168-ee28-4996-89f0-83f8590cb716@gmail.com>
 <eb51b5d5-7f38-41f3-882c-eb87eb2b9f44@kernel.org>
Content-Language: en-US
From: Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
In-Reply-To: <eb51b5d5-7f38-41f3-882c-eb87eb2b9f44@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 11/2/25 17:08, Danilo Krummrich wrote:
> On 11/2/25 4:09 PM, Daniel del Castillo wrote:
>> About this, I was basing myself on nova-next [1]. I will rebase on top
>> of drm-rust-next for the next version.
>>
>>
>> Link: https://gitlab.freedesktop.org/drm/nova [1]
>> Link: https://gitlab.freedesktop.org/drm/rust/kernel/-/tree/drm-rust-next [2]
> 
> Yes, the nova tree is the one I started the project with. Meanwhile we have
> moved to use a common tree for DRM Rust infrastructure and drivers [3].
> 
> For the time being, the "original" nova tree is not in use anymore.
> 
> - Danilo
> 
> [3] https://lore.kernel.org/r/20250901202850.208116-1-dakr@kernel.org

I see, thanks for the explanation!
