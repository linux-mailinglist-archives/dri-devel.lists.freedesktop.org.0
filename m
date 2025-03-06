Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF62A54B47
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 13:56:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF5210E00D;
	Thu,  6 Mar 2025 12:56:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IN0FRkeD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B93110E00D;
 Thu,  6 Mar 2025 12:56:46 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-2240b4de12bso13277105ad.2; 
 Thu, 06 Mar 2025 04:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741265806; x=1741870606; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to:from
 :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
 :reply-to; bh=04e5QVlW7LFU5EHlao9T7yWPAHQynGYSDz8qPerZSOo=;
 b=IN0FRkeDZThZ9amPWEWNEBa9yNOrDVVWEA33jpRxzuvRDEnJnNeYeqY8DeiIbS8OGm
 Vu/uF4PhZxzSt/3qTMBnlmwlu5Is+26unj62O2n+f8wcTMLQfx1HmpSdpBL25DWvpLPk
 qM0jWxBsKM0wPMIKEd9cFwhOGQiTR/8lO+BXsjmItGp5lvDNKVHLkksoI1wAoqtjL2aR
 tB4ouY/rFVFKPv5fWEylA8wm3Ulu64v3PsaNTCrqusa9iHHWt/fxUJDy9qgj5zwrg9Fu
 OfRW5vFGKgHK4qxi72e/rfwVw00MnpCjL6g0xAcEJ3JeSgJhVFSti0+QaNtPmzTQ90SS
 CyuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741265806; x=1741870606;
 h=content-transfer-encoding:mime-version:references:in-reply-to:from
 :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=04e5QVlW7LFU5EHlao9T7yWPAHQynGYSDz8qPerZSOo=;
 b=JmOx5ks/ONZyuRTGmu9dEszWzVw8HJIGCVG1vFCcMosSzW8rFpV5PjEiMK1ToZN2Oq
 S1VDI/WRICPYwqE4cN9ycTlX2V9XbTb6Weur4Q5spCTyCId2izA7dGkuidb4ljjttr5H
 3RDBuXFZSXUJUP83/MXtv5kJhf7rcsNbiYar1xpwViI8dqXT9D5LILA0IcjX79HiRodO
 lmLN/LHoR7UMsDzau89uYyioroi4BRr0cdGi+Yc9vzLdr9NaRR/E3SkvvmshtJf2S9JF
 l9iXj5L5eKlUo3jh1ZGCtoa08GPYsrVKKqvYIMNu2zf7V++vsCP6kxvbvHnFgmEoAYGT
 l3Sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPxU3K53dHXtERxYhePNasNX184EV8XvCbKeauOF8z8ST86gMdD1H+6Kc+T/JlGS//GAJgLz6RlQ==@lists.freedesktop.org,
 AJvYcCXnHVsXNoyRx9mIUnxypcyGYbOyb5dVCPfs0t+tX9LrIc8CrIaVmW+f9YUlG+yZiJ0UvM32Y+rRHK8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJLbpS9ZFeahNDrR1R9HHaY/Sjm8z8xCDKj1wZSLVM2guvCOgZ
 j6yRYmHUOAkKIezzynTXvL/6AXCVHGR0yLhb6L9lEdR85CWG+02o
X-Gm-Gg: ASbGncuenIbV4dKZhMkjv4WG2VNX07i0XYu8+CVz67YtpYZodVFB05awu00zkrpu04O
 BxeuS9qpvvtnt7Bs7nBCb+s+da0NLiJe3dq8VTt7AUyGxZTsf++1NWRT7+jFsGW3dmLZ7Y8RBob
 p836hLwpipugURtLWnYxMeHWeye+jJwy7DDEmaltDPrkPAR09D7Qek7GD/cryCWbXxJVmUpL+YX
 /FEpzmuGCDZ5rYlMxy/K0IDoJWoEV6pWh5g7dkWiynmgdLLs13BmYLI32+QCQYs3xRDZA+5+qEy
 CwA0r5z3QwRR9wNalGiRI47NX6ImTw5goGAH3i1jVv76YLvhgNUqznfZIPP2rTNP1qXcUDDb94g
 lzeTNkMDQmGbQq/0f+eeCPWfvFLo=
X-Google-Smtp-Source: AGHT+IE9D2V0PlMV5ZABesh7TdWr7X7Bayt5c+xg1q0luPahNx96F8HAIiwpPIbDk09xv10uSnCpqQ==
X-Received: by 2002:a17:902:ec8f:b0:224:1dd5:4878 with SMTP id
 d9443c01a7336-2241dd54accmr6811955ad.7.1741265805743; 
 Thu, 06 Mar 2025 04:56:45 -0800 (PST)
Received: from localhost (p4204131-ipxg22701hodogaya.kanagawa.ocn.ne.jp.
 [153.160.176.131]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22410a91985sm11384815ad.194.2025.03.06.04.56.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 04:56:45 -0800 (PST)
Date: Thu, 06 Mar 2025 21:56:38 +0900 (JST)
Message-Id: <20250306.215638.838863448505767234.fujita.tomonori@gmail.com>
To: dakr@kernel.org
Cc: airlied@gmail.com, simona@ffwll.ch, corbet@lwn.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, ajanulgu@redhat.com, lyude@redhat.com,
 pstanner@redhat.com, zhiw@nvidia.com, cjia@nvidia.com,
 jhubbard@nvidia.com, bskeggs@nvidia.com, acurrid@nvidia.com,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 gregkh@linuxfoundation.org, mcgrof@kernel.org, russ.weight@linux.dev,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v5 5/5] gpu: nova-core: add initial documentation
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <20250304173555.2496-6-dakr@kernel.org>
References: <20250304173555.2496-1-dakr@kernel.org>
 <20250304173555.2496-6-dakr@kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
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

On Tue,  4 Mar 2025 18:34:52 +0100
Danilo Krummrich <dakr@kernel.org> wrote:

> +Delay / Sleep abstractions
> +--------------------------
> +
> +Rust abstractions for the kernel's delay() and sleep() functions.
> +
> +There is some ongoing work from FUJITA Tomonori [1], which has not seen any updates
> +since Oct. 24.
> +
> +| Complexity: Beginner
> +| Link: https://lore.kernel.org/netdev/20241001112512.4861-2-fujita.tomonori@gmail.com/ [1]

I posted v11 last month.

https://lore.kernel.org/netdev/20250220070611.214262-1-fujita.tomonori@gmail.com/

