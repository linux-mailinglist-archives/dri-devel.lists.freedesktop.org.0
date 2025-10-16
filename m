Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF132BE6EE6
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 09:28:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E22810E046;
	Fri, 17 Oct 2025 07:28:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hHSSKlEt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62F9710EA8F
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 21:13:14 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-3ecde0be34eso1431009f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 14:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760649193; x=1761253993; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=t7dC9s7DUHDfq+JM4myzAQqHd029NncsnmY1lMtLvU4=;
 b=hHSSKlEtmc076z7La1l/33xNDf2kudF25pLeF/HU9zOkc8QTaOduA8munFr8L/679I
 UZMsZJmA3kTrGnbOF6gqsB13JXSYUvCV3lqjrwM3A7G61nMdW4h32iIvaYaQg+2iDprk
 6Fxdhy7mONIU/MB451iVmkxMDWkYxRUZeu0yASA+m0pzOLr+NMMtx4vEFnZS1pCyYSz8
 cjKjykFB0ByX3upIMMSHa4GzvqS72aBku/hOYWMTraeNw0oZS2JAlXwKbglXnoc7Wuoi
 EfoxkoWQbypOVMY8Ii64JzQZN1xb/gbqhVBcsVTPwrongUMcGWWz4jdmX52zlLm/N6xe
 pFzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760649193; x=1761253993;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t7dC9s7DUHDfq+JM4myzAQqHd029NncsnmY1lMtLvU4=;
 b=T3d+ktrRa7nT3bL1YRLNIyN88tacwrsEQzD1plN0GVQU4bsg2lxB/x+TiAAK6dV2TA
 C5huLyqH9IuWXf7hTg0rqa6vUJopahW+FPfX+6OrgwZ2HeOpkOBtvtO62P3irVC4732Y
 jn+PxqTzNmWdnJ1ob1NVPPdF32qkrN/gveszsFilL58IJJbHdjbjrPbinteZcukMH+Z/
 cykkhcea3n9gVlCQ8Cn6jwjKfhvdxuWyw8hQxS0cHmNeG0kyIohLUj4P7aYgStDBUFLR
 cfw7qLoHBmfwQ+pwi4Bc7P6i/v2SobJg3DnOZXIr6cZbFB10x6cGiWGmnqhfm+BmDCqs
 +IzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3Ye0GxV19ihGaT63mfpunfF9d5qKReImIqcq5USV6qI9r+WEKGjcPVNvN906pDi+MjFbTq9rk9gw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXmolUd9ImuMBSBI+wvuwOnoqu3kAZrrCztr3YMhUc7NpycRHK
 A+ZJKbdkkhQw3PYowXx+imY4lJP/Q6a+xXvuI5l8AL7QA6LLrMVLEYh4
X-Gm-Gg: ASbGncuItdKTHEFWYwyhBpyz1w4nV8Vgm7YDbc81nifhkyFYKgdcp3qAJHS8g00mCuv
 TbU7P2cBIyjNH8kkgLx0venYOTm1c+7ZGqQ11O5lxGqwwTuPK7yHfswRmc1hA8lRqC+uabJnJPz
 0Nij8oxmRNUjZFCmh73Y/dXyPf+CcMm7L6X4cq7u/kWxJ2fzTX656Zub4EGFUrZtp6Vh9aqtmYd
 /7gnOxaJZBcIl64uzOUyKJRtAdWVUlG0tbsDe/3fPQw3BoXVcLdclUYvnFx1w79l5wuy5RfQkjK
 soa3TmB2RxKChp6nr5WgQJQGNV4Axm9fGhEHDJBBpoLTxOLUjP7Y8x49LsOBr+uTVLIiu6nFOPA
 7MI+VVMUXAe5Qq1g110IC9BIFqZLhw0iPpDBmtUUI/E5gnVZJBGaD4VnD5Re/QPciJkgeMq3Nbp
 V+vLLWAAfA/L9lUOPBcxzPRdC4695tlitO6g+iXlIHzuStlHNFN/vs8Bm/1XbLn0V8P/8Moihf+
 hgJbw==
X-Google-Smtp-Source: AGHT+IHKPJSTI0DmvT06VL4xwoZPAZid6jDY8psvVG06n9vCvu/0Q/oxZW5QmJcTU6PqNg2HD3zBYg==
X-Received: by 2002:a05:6000:41f7:b0:427:548:6e3b with SMTP id
 ffacd0b85a97d-42705486e44mr815017f8f.13.1760649192715; 
 Thu, 16 Oct 2025 14:13:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:acc:bb60:756b:64e3:20ef:1d08?
 ([2a01:e0a:acc:bb60:756b:64e3:20ef:1d08])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5cf6b4sm37077374f8f.25.2025.10.16.14.13.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Oct 2025 14:13:12 -0700 (PDT)
Message-ID: <21944b18-ac36-4acd-9d36-cc05579acc0d@gmail.com>
Date: Thu, 16 Oct 2025 23:13:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] nova-core: Solve mentions of `CoherentAllocation`
 improvements [COHA]
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org
References: <20251015194936.121586-1-delcastillodelarosadaniel@gmail.com>
 <409f2f03-2bc2-4cb8-9ca7-4e30f82077ff@kernel.org>
Content-Language: en-US
From: Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
In-Reply-To: <409f2f03-2bc2-4cb8-9ca7-4e30f82077ff@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 17 Oct 2025 07:28:31 +0000
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

Hi Danilo,

On 10/15/25 22:04, Danilo Krummrich wrote:
> Hi Daniel,
> 
> On 10/15/25 9:49 PM, Daniel del Castillo wrote:
>> This patch solves the existing mentions of COHA, a task
>> in the Nova task list about improving the `CoherentAllocation` API.
>> I confirmed by talking to Alexandre Courbot, that the reading/writing
>> methods in `CoherentAllocation` can never be safe, so
>> this patch doesn't actually change `CoherentAllocation`, but rather
>> tries to solve the existing references to [COHA].
> 
> This patch seems to address two different TODOs. Please split up the patch
> accordingly.

Sorry, I thought it was okay as they were part of the same task. Will do.

Thanks for the other comments as well, I'll apply them and send a new
version soon.

Cheers,
Daniel

