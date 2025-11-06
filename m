Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE441C3D7E0
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 22:25:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0817910E9DA;
	Thu,  6 Nov 2025 21:25:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CnQrDaOy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3A1010E9DD
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 21:25:02 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-47112edf9f7so425775e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Nov 2025 13:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762464301; x=1763069101; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YKes0XVjNGJ2FggkAmqRR788Mxk3TjUGRm3n1mueSWg=;
 b=CnQrDaOyC3tkAso3tecfhttGehls4MispX2XH6/Q+VLIeE1XTZP0NzKMxUbBFClU7v
 pNaQDAevtX75LXlC7KL/AmUjX43V8CPfxMfvnRPFm5yaWkGOfBdjEsHdWDkjgPW9iW76
 kz9SBcV047cW5fz87jd9MRWtYBLu8N82DA32uJ3m/HbL7s5U3sd4oEn6WL6278fj67Zf
 nB3HLvixc7XEn7YOTfMRn6VU7jXlplkRHqxYA7PqcfoMhM53nn8GlaZKRY/tHw3KTOfl
 Rrkkm9DW0TkMvG0th5Nzzqnh89RpR710e9hANgfyyaOUR0Y3L9RbbjKbsxpe44kAynUn
 RvJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762464301; x=1763069101;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YKes0XVjNGJ2FggkAmqRR788Mxk3TjUGRm3n1mueSWg=;
 b=oxDeLLofQ3d2VLKf2H+KrxoxXjQxcVfCfavEXxRHqFloTCFhZ2Sv8RYtgUwKak+S6l
 omm9xvATnnYckncV62Lwtzpx59eACqTeuMgXNOYHRXE+aXQKum7L1b/rXhhxkyMM//E6
 oGw/yYPh8MrnfmtcbjaD7M1wqQLPbEUHDedjVNNbVokuiTNkL+4I8zEqiCOAT0dSpDU1
 6ajWD3wxUR8B4ua8IVTo5MP2wE2k40yoHK3C6I0strXLiO7mwW70mnxtL4Aw444Ork6R
 7+KSeaF6Dyf0oau7zIBFeGZtCgRl3kdJquQFtszLadnWVxozB3D5Hiz65EXRIRIgUHPM
 4Smg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeH4Po+wzbn1MpTfCNR8eQS8UdGNtvuJACBKVJBsVyfmrqzunwD820FtpR8cGs4FqNAtjCkQcTYQk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxG21I1oKSTEgSa1uXU7pPHgRqeIsxGjwqL6QtATMAVrJGqu8GQ
 iclvlHHAaOvWNikPLxmakRxAASRmxfLO83zQ8DGrZ5/AaagbGaGH6cgj
X-Gm-Gg: ASbGnctNGXXYf/H4gxdPSAjmLUFwE4tGp8I/gfgdZYLAFFjZiQwxoJapZQE+1MmhQXo
 c/4WFwM/NwxEslQex6KYNKqZCuai8ly5g5DeyhRUdm4jO30NtMcJ7m+r+WTKOp1M2JXak6frY12
 i3ya5/zonbjlsrXLruyHG5tLL+ybfHDmb7xYrzslkIzpsYg/v0tErlOLtXiNU+DTJCXkQXL0+JI
 QC2XNUJxgxkj7VmAnQeNNSoiPk4Pww7hHFvagH3gO+/QFr7N5uxbxqgUTV3OCaOnGMOFz0ahv0p
 FU0pNBMCv/Ffj03BpWaUExRim1IKjITlZ/GpXV4Cxn8o4Cic9Se9sRvvZqe+a3B64GGpHXpZUIf
 VB9NEHc1/k7QliJ19oLhyOeD9WM8Y2xCPd+oaZiZVoPzyVKgx4tTOWhU/pLSyTfwsyaF1EdeN/n
 OcX4eJVQ1zaYlB6PjsT/GjLiwYy104jXgNYWinSJ8bkLNXCFaf6xb/Y45cKv3x6zv/HQo=
X-Google-Smtp-Source: AGHT+IFRtleD8p3GDaRn7y4cLlgvtrJ8k9u0N/dFUXsYAq553rRak+Diry9dTEA+SBjhoD9RJ2Xd8A==
X-Received: by 2002:a05:600c:1384:b0:46f:aac5:daf with SMTP id
 5b1f17b1804b1-4776bcfd091mr7371805e9.35.1762464301183; 
 Thu, 06 Nov 2025 13:25:01 -0800 (PST)
Received: from ?IPV6:2a01:e0a:acc:bb60:756b:64e3:20ef:1d08?
 ([2a01:e0a:acc:bb60:756b:64e3:20ef:1d08])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42ac67920fcsm1257502f8f.39.2025.11.06.13.24.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Nov 2025 13:25:00 -0800 (PST)
Message-ID: <ff95096e-83de-433c-9048-55a35dab3dde@gmail.com>
Date: Thu, 6 Nov 2025 22:24:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] nova-core: Simplify `transmute` and
 `transmute_mut` in fwsec.rs
To: Alexandre Courbot <acourbot@nvidia.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 dri-devel <dri-devel-bounces@lists.freedesktop.org>
References: <20251104193756.57726-1-delcastillodelarosadaniel@gmail.com>
 <DE1H0USFAGNU.FFRA802H95RG@nvidia.com>
Content-Language: en-US
From: Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
In-Reply-To: <DE1H0USFAGNU.FFRA802H95RG@nvidia.com>
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

Hi Alexandre,

On 11/6/25 09:32, Alexandre Courbot wrote:
> On Wed Nov 5, 2025 at 4:37 AM JST, Daniel del Castillo wrote:
>> This patch solves one of the existing mentions of COHA, a task
>> in the Nova task list about improving the `CoherentAllocation` API.
>> It uses the new `from_bytes` method from the `FromBytes` trait as
>> well as the `as_slice` and `as_slice_mut` methods from
>> `CoherentAllocation`.
>>
>> Signed-off-by: Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
> 
> Thanks, this looks great so I am staging this series for pushing after a
> short grace period (probably tomorrow if nobody screams).

Perfect. Thanks for all the help!

> One nit, the prefix for Nova patches is typically "gpu: nova-core:", but
> I will fix it when pushing.

I'll keep it in mind for the next time ;)
