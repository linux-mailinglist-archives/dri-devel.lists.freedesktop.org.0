Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A00AAA3380D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 07:42:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F9D310E9F5;
	Thu, 13 Feb 2025 06:42:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FJJZp47Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C222010E9F5
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 06:42:04 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5450408455dso517247e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 22:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739428923; x=1740033723; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=D4eySdz77/NciwV/XfatLFkuT5QLK3ZdBGLRjELf2wU=;
 b=FJJZp47ZzQdUNs2vBr9XXzr/U6AoeKSrML7JS05nbJUZNPXVd8JxhubCRov+UKrIzA
 ais5r76qXydOXxbQwwSh1pImvLa3UFP1t0rQtWzgACl6mfXoOoMVgFNiPp6INT0wr0+4
 XDQQ/Oh86fgUaGmEqgfvye3WDC/U2X8L90YNHH+Zepc5qEV4x7mBXIrpDwjHQDFBIR6m
 csHipQeybbMa2FK3pfBatZN2c7IeQyQZmA+M9bCN8Qf5MsKju3ePZ/1ju4fMg4LQopDv
 eacdJ5RzP/ivXL9dzolquQ9NkSzxUe43D66rvV1wXBYfA6d5xEh++r3k+afOpR0Mq8Ow
 jURA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739428923; x=1740033723;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D4eySdz77/NciwV/XfatLFkuT5QLK3ZdBGLRjELf2wU=;
 b=XeSJkGqABmK6D3x7uVIiYHIa+NNTKIwFwNUtrG7i5ukGt+OUpah2fpqHVH40z68UGH
 i1GZXkFFb1+jzy4thiPv8h9BfGv6E/Dz0buUwEq+1M30ZfnVRGXS2AfJxlFRuueSuZGJ
 XM3irhk2/M7bTzRUhqg4TUagE4WJURtx4y2ar6aRSBkpQEitqNwOmNQZ1d2nZn3So61w
 2TLoSUh1XvIpn+Rcwl8nuEiCUXTuWIbxzAYYQT+nyQuft6HZR+QM1P0g7ZFVpBzu9xai
 KAYlsSytIkokSjsJYKefa5rWoVxvz+NXhYpzyI/pe4h2R8mK113Jx+H2dUjQtMKasAFt
 0gog==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAgoLbfKfz4yA3qOArEWph8wFMo15+lZnaTSL0DT05TuFIKy9/cw7KlbrAEobDbEG1CufXvFQnAmk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzaxt4zTqG63idCTOGpBOWOwC7ViGpeu524n948pVZIoxtyY/Kq
 pEaJMtphG3ZrpUZ0LWA3CPWhjvSMhI47pGGPG1sGBS5C16YpS5Sg
X-Gm-Gg: ASbGncspwnJN9gk8VUXegs/qUdbjR9Mta4i6Z7FUVUXByjoI3RNECn5hoZkju+U02a2
 wGW9VCqA2/8a/fZLWJV7hRLfWfsgPE00NGRt6P99wWDDth6qKI3nSCcSkG5DD9HuPUzJc/DqClB
 PRDyBwocZH4CgBl/rebjBQcykV8HGspLyYf5DVlZnQkv4YHNGnk12UaNF8/RFIP5vUMfZjAAv4H
 TcR6IO/HUWsdQQW7nMPIPemOwiBbrrBeMJtFaVSQ/DkSSVbyXyVqYRDN4LNXRWMT5dh66a3CvA9
 269TzY0iVAUIv63XcLIDd6ef75GW69Gf9l2MczbDAAAn9DBeBMz9Ctlk6BukjA==
X-Google-Smtp-Source: AGHT+IHafetPTUW53JV2MbUCuHv7yV8njco3PYIZ4cqAW9TRqirM7GIDFI9zVzpiiAPjubhOhjUIBA==
X-Received: by 2002:ac2:5695:0:b0:544:ca1:da41 with SMTP id
 2adb3069b0e04-5451dde80b4mr620288e87.44.1739428922511; 
 Wed, 12 Feb 2025 22:42:02 -0800 (PST)
Received: from [192.168.1.146] (87-94-132-183.rev.dnainternet.fi.
 [87.94.132.183]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5451f10c73bsm81423e87.172.2025.02.12.22.41.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 22:42:01 -0800 (PST)
Message-ID: <b0efde29-248f-43f2-97bf-ab16b55af63a@gmail.com>
Date: Thu, 13 Feb 2025 08:41:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: On community influencing (was Re: [PATCH v8 2/2] rust: add dma
 coherent allocator abstraction.)
To: Icenowy Zheng <uwu@icenowy.me>, Danilo Krummrich <dakr@kernel.org>
Cc: Hector Martin <marcan@marcan.st>, Steven Rostedt <rostedt@goodmis.org>,
 "Dr. Greg" <greg@enjellic.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Dave Airlie <airlied@gmail.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Greg KH <gregkh@linuxfoundation.org>, phasta@kernel.org,
 Christoph Hellwig <hch@lst.de>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 daniel.almeida@collabora.com, aliceryhl@google.com, robin.murphy@arm.com,
 rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, Bj??rn Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Valentin Obst <kernel@valentinobst.de>,
 open list <linux-kernel@vger.kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, airlied@redhat.com,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20250131135421.GO5556@nvidia.com>
 <2b9b75d1-eb8e-494a-b05f-59f75c92e6ae@marcan.st>
 <Z6OzgBYZNJPr_ZD1@phenom.ffwll.local>
 <CAPM=9tzPR9wd=3Wbjnp-T0W8-dDfGah-H3Ny52G85B+2Ev9ksA@mail.gmail.com>
 <208e1fc3-cfc3-4a26-98c3-a48ab35bb9db@marcan.st>
 <CAHk-=wi=ZmP2=TmHsFSUGq8vUZAOWWSK1vrJarMaOhReDRQRYQ@mail.gmail.com>
 <20250207121638.GA7356@wind.enjellic.com> <Z6bdCrgGEq8Txd-s@home.goodmis.org>
 <1e8452ab-613a-4c85-adc0-0c4a293dbf50@marcan.st>
 <07c447b77bdac1f8ade1f93456f853f89d4842ee.camel@icenowy.me>
 <Z6nTxks3u-ErSalQ@cassiopeiae>
 <d7d1fb8af8857e7ebfdea48213849ea9ba446477.camel@icenowy.me>
Content-Language: en-US
From: Abdiel Janulgue <abdiel.janulgue@gmail.com>
In-Reply-To: <d7d1fb8af8857e7ebfdea48213849ea9ba446477.camel@icenowy.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi,

On 13/02/2025 05:49, Icenowy Zheng wrote:
> 
> Sorry, but I did a fact check on this, and I found that the only
> "reviewer" of DMA MAPPING HELPERS is Robin Murphy, he has only one
> reply in this thread, and the reply only says "Indeed, FWIW it seems
> like the appropriate level of abstraction to me,
> judging by the other wrappers living in rust/kernel/ already", he
> didn't offer to be a reviewer, 

Robin did offer:

https://lore.kernel.org/rust-for-linux/4956d01e-2d06-4edd-813b-9da94b482069@arm.com/
