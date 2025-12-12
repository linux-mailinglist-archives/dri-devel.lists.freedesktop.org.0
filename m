Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3B4CB8365
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 09:10:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 554CB10E09B;
	Fri, 12 Dec 2025 08:10:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JqCkd3jM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 916FE10E57F
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 08:10:05 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-42e2d52c24dso510022f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 00:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765527004; x=1766131804; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fJ/CIq+S550sT8g8cfuPfmVxbEDEzZdlgJAf7FID7wY=;
 b=JqCkd3jMku6gzepKd9mUEek3y/sYrJLQMpg8Y6JsRUVPXmdAlUD2hMMaZ9K3013S4S
 YQrT4XmFZO7iftlxGD6jWd8ytaEm8uVbajnQnIQGtFGoyzRUNObOIaxuMkPqOrPn4W5W
 4K2zlG51vt9or2wp2//vpqhs8TPsHe0eAdymwTjoEG5+HzPfxZEjQDg4fBqHzqojU/sH
 5duPd1630CGTm0osl7cQPlMXjxDKbX7zcECA3Trd8nnJ3UlHjeqBjVFVJspHQjjZKGw5
 da7CnXYxcx3ShvKL+gRF+ReRUDjjalSkYuOyCIQENa1YavYHA4zQsRa7DMQhexKaiAdn
 aVlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765527004; x=1766131804;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fJ/CIq+S550sT8g8cfuPfmVxbEDEzZdlgJAf7FID7wY=;
 b=pfBIpTv2k4aW0FqXhmbHUl03cpfn4RjbAOW83lZo2P7okariQrS8bbk0JeTOTAne91
 UM4jTKpgUTZF3pT7mWsuyy8QmfAGyabi0FKuAdQ6LBt9A5ojjCoT3En+SmPGUNIzsPoE
 6AYLOV9PUBGWxqbWM9CiBElLfpJjiGwxzbBJVVfAhqJrI/pCYYuY+wOSY7vC22Tpj/Ja
 eI5Fl5LvQibciJYpyCEJ8mIphhQLvvW7+ooGu53wcb81ulqBNQeoAdqOyw2077eYMq/g
 GhnjqEfymlOQBeZ0fxPtYINf8SzjZRT94Fk8uammmIijGWvXkBK6FHIYxo6htuf0AOKM
 YOOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyujYMdGgWdtGUV17ldnbCdDXNLlApQ21QccTX4u8nVjBEnYGYgOWY+TKbaR1TGZjyQRESv+/Ufmo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwHRtK+NSHqj3d4laliPeauXINspvRMTv3JmayfTJQo5z+NM6su
 PZfRcd7C+9+NtmtLhAb0sG0g9rFVZFA94CO7PZb6yRCTfsnkb1zykQcQ
X-Gm-Gg: AY/fxX7FzE3f8HaJYNuVFM96KRl4wPftg2Jtr2dI1JkdmyeVm3bPQQ7Ch5VcdWzPP4P
 2AKbN++jKBp6excFVOKnerRIsWE7sfc0faOKIrtL2hIECMHB1djSk2YqQsSR/xCDFVMcMVlEUzI
 BK5C6XiwS9nLDg6UE1PJBtkLcBUCUghBKGWu2DftnvR4m6P9SKP0Sim8ztr2IX9Ar+HJNhsN31w
 QjQlW17O4cjFcyRpXm271ulpCeFdz5fP045Dul97yI+xqUG4rj6LpmP3jfb9cKnvqdwrGJ8tEVu
 8vDjpZHVxhjdElzZiCreFrp1M39PcRC6nNzcXLQ/B03w4mcAnh6L6tzqPS0/Hw9fOCug8ul6fEW
 CX6S0pARKLAkvCUDPwhAJqiO5PlIaLWcl6t6tdU/rFuj+DTbQtSFtdiu9mIxAXNpIC9Bt4ZAsz+
 XtvfDtlPDx3hu0jUkOQrl/IfzjjzpWnl3R98wSg3qX9b70ZWe4fMSqCa48bYL7fusrCu1fWDZVP
 hDuLr4C+xTfox1wVb+m4I9oqD5Idwz3qDX6ijLEEAocZQ==
X-Google-Smtp-Source: AGHT+IGTJIGEa6611HGPyO7WCyo7XVD/0HX+3HAeJdXdjKMR+z9KB5y2eg2ivEwm/6LLYaeomx6J1Q==
X-Received: by 2002:a05:6000:4012:b0:42b:2f79:755e with SMTP id
 ffacd0b85a97d-42fb44d46b4mr1032448f8f.3.1765527003664; 
 Fri, 12 Dec 2025 00:10:03 -0800 (PST)
Received: from ?IPV6:2003:df:bf2d:e300:84fc:a859:31e5:6980?
 (p200300dfbf2de30084fca85931e56980.dip0.t-ipconnect.de.
 [2003:df:bf2d:e300:84fc:a859:31e5:6980])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fa8b9b1f1sm10460373f8f.39.2025.12.12.00.10.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Dec 2025 00:10:03 -0800 (PST)
Message-ID: <25aa90a7-e9f4-471e-9d93-c61b9a7a429c@gmail.com>
Date: Fri, 12 Dec 2025 09:10:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] gpu: nova-core: gsp: Fix length of received messages
To: Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
References: <20251122-nova-fixes-v1-0-a91eafeed7b5@nvidia.com>
 <20251122-nova-fixes-v1-2-a91eafeed7b5@nvidia.com>
 <504C636B-FB96-4B54-B9CD-C506026CCDB1@nvidia.com>
Content-Language: de-AT-frami, en-US
From: Dirk Behme <dirk.behme@gmail.com>
In-Reply-To: <504C636B-FB96-4B54-B9CD-C506026CCDB1@nvidia.com>
Content-Type: text/plain; charset=UTF-8
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

On 12.12.25 08:59, Joel Fernandes wrote:
> Hi Alex,
> 
>> On Nov 22, 2025, at 12:00 AM, Alexandre Courbot <acourbot@nvidia.com> wrote:
>>
>> ﻿The size of messages' payload is miscalculated, leading to extra data
>> passed to the message handler. While this is not a problem with our
>> current set of commands, others with a variable-length payload may
>> misbehave. Fix this.
>>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>> drivers/gpu/nova-core/gsp/cmdq.rs | 11 +++++++----
>> drivers/gpu/nova-core/gsp/fw.rs   |  2 +-
>> 2 files changed, 8 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
>> index 6f946d14868a..dab73377c526 100644
>> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
>> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
>> @@ -588,21 +588,24 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
>>             header.length(),
>>         );
>>
>> +        // The length of the message that follows the header.
>> +        let msg_length = header.length() - size_of::<GspMsgElement>();
> 
> Is this immune to under flow without one of the checked subtraction wrappers? Either way, we should not tolerate the underflow I think. Which means it can panic when the rust overflow checks are enabled. Since the header length comes from firmware, this cannot be guaranteed to not underflow in the event of a malformed message.

Would this be a possible use case for the untrusted data proposal

https://lwn.net/Articles/1034603/

?

Cheers

Dirk
