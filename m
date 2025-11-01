Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D09C2882E
	for <lists+dri-devel@lfdr.de>; Sat, 01 Nov 2025 23:13:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 128C610E03F;
	Sat,  1 Nov 2025 22:13:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JMtQk9up";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F18610E14F
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Nov 2025 18:51:21 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-3ece1102998so2149707f8f.2
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Nov 2025 11:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762023080; x=1762627880; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w0yBSAofgQOyjuw5PvpAMID/+vYPOzSWVbrrAKxMhQU=;
 b=JMtQk9upiDS96cpcwPwn2L3Xu+MRvmWeonRcGkQCtYZ5IpjqI6HR+x32tqYBEfjOR+
 7aO1KkI0Qj4MTlRgCAeB71VOToNAX9czDWp1qpnzcW4KZFc46yUIbaMBnB8Ccos8Qy8R
 zUprXh9EhZ8sjt42dHwfij2UvfXqXHjEmPQum3XFcSro+1UJ+9g0i96C8kDhsNtlGGDk
 +FX5XC3bCsALWZg4yU0XrGWfG0BE3vvLSURRFUciiN849fyEu67kWXRP0YmLsG3WD3Fc
 f6qIZPnhTcH3fOnGPBDH+vSQrrdhKj4AheJW0TlQO2/l40cek55A54OmmR+1DLNpsf2f
 wnQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762023080; x=1762627880;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w0yBSAofgQOyjuw5PvpAMID/+vYPOzSWVbrrAKxMhQU=;
 b=sSdy8cE+5ORctzI+srOskaqXUdFPznaxh8bPSV0IUmqNyO4FI19m4CBCYtB133qx+X
 KwEqwUXX3lZIqeKqOJ0Fb1P/RDCG/rayehpoEbiKcsCnyyj07GSzOCzHWldLCL1BEY7j
 N8+jjrsVbJWYXB2D2MA2oFA0nfuTVRLS9mo+L5xpcGY9pxvmMBnQQSyYdf7abmSU1/AT
 u0icE/ARadNNwB0fzaMy9qP2zGeDd98vNSqhJG5TDoGxOQmRgA4/fdI4MCcDr3aqrE5C
 qBmiLZOLwMM2lmeXmefN/XOtRP4hYfil/3Yl23V9XNCbCaxJImYJyKKgqvnrH2EEBuvW
 2OwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWW4DymkqbkewZXZ5n5wUNOWidtqWgmxRFP/+5D+IF18mZYtoMAegIk15387od/1MFfWSaTSca3LlQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKxhv2l51aw7rcyL3gU7lObCi995M7CJ/1Q5InKaPL9gwdJSPM
 E5S8GXdiVvkuprRTrnFM4k/Fpubq56iu2b24vUqwfu/Ykx3bPVdfcz8X
X-Gm-Gg: ASbGncthJzAm6v8JwUHH13qqbOMGkemToPH08lzOwKszC54OTXMQY2iBQSRFjHHSi1v
 q/HyKKpZFV3VgnQCTyv88xnBUeo8fL6PvkplczLY8o+L8vHYxSxP83uoOuivss6HKke6hbJl507
 mNUuiK1yxI5n6nddXAlTv1yX5MfLcDQCKSetUBGoEsXbhm3Vg3PmP1KuF/YmrpyKT5QDGeHP5nB
 NFqoOafiYnri2f7xtQE+mnciJAUqDhkk0d8ChmkLZa8bzwKJYzcgdUFG9Qe/ZO+1bV9YFIWC4jw
 cvO9EJ8lsLEtDFuayechF9mwHC106szpVvAOhnjBGRFp/jgaUOPgpcekTXOVd9V4Ti7312uDVqh
 DBjSZwzm601AbyCpk0UE6Uz7/H8QVg6DAtTr5SNLglZHc4D1zkiMwALcCs6hAj370GF+Q5GQrGc
 5AklGd9BrzgvfXEG/hzg2V8Q8U/R4yQKlAj8kzYbeupnX8u0tNd++JiRTWDHFxPTX6SJmupbwcj
 ZCLlgZFe0JgoCNDT0ulbp3LaAuU4eUEgKo1ceQiy4c37A==
X-Google-Smtp-Source: AGHT+IHZnuzUsk099QOW4MOvybDJX2Pw811XdLL6RZyljGX0/ACMY03TL3YhEgmFs5GYLczbAtd9SQ==
X-Received: by 2002:a5d:5d09:0:b0:429:ce02:c883 with SMTP id
 ffacd0b85a97d-429ce02ca54mr2659f8f.14.1762023079376; 
 Sat, 01 Nov 2025 11:51:19 -0700 (PDT)
Received: from ?IPV6:2003:df:bf22:3c00:b24b:879f:58a0:f24a?
 (p200300dfbf223c00b24b879f58a0f24a.dip0.t-ipconnect.de.
 [2003:df:bf22:3c00:b24b:879f:58a0:f24a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c13e1d8bsm10360744f8f.25.2025.11.01.11.51.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 Nov 2025 11:51:18 -0700 (PDT)
Message-ID: <7dd6c190-2598-4a68-8431-e03e41b276ea@gmail.com>
Date: Sat, 1 Nov 2025 19:51:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] rust: Move register and bitfield macros out of Nova
To: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Yury Norov <yury.norov@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>, nouveau@lists.freedesktop.org,
 Dirk Behme <dirk.behme@de.bosch.com>
References: <20251003154748.1687160-1-joelagnelf@nvidia.com>
 <20251003154748.1687160-5-joelagnelf@nvidia.com>
 <5a5bd549-f5b7-41ec-b493-bda427d1218f@de.bosch.com>
 <DDDQZ8LM2OGP.VSEG03ZE0K04@kernel.org>
 <DDDR8DIW6K4L.21F81P26KM64W@nvidia.com>
Content-Language: de-AT-frami, en-US
From: Dirk Behme <dirk.behme@gmail.com>
In-Reply-To: <DDDR8DIW6K4L.21F81P26KM64W@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sat, 01 Nov 2025 22:13:42 +0000
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

On 09.10.25 13:28, Alexandre Courbot wrote:
> On Thu Oct 9, 2025 at 8:16 PM JST, Danilo Krummrich wrote:
>> On Thu Oct 9, 2025 at 8:59 AM CEST, Dirk Behme wrote:
>>> Assuming that register.rs is supposed to become the "generic" way to 
>>> access hardware registers I started to have a look to it. Some weeks 
>>> back testing interrupts I used some quite simple timer with 4 registers 
>>> [1]. Now, thinking about converting it to register!() I have three 
>>> understanding / usage questions:
>>>
>>> * At the moment register!() is for 32-bit registers, only? So it can't 
>>> be used for my example having 8-bit and 16-bit registers as well?
>>
>> Yes, currently the register!() macro always generates a 32-bit register type
>> (mainly because nova-core did not need anything else). However, this will of
>> course be generalized (which should be pretty straight forward).
>>
>> Having a brief look at the TMU datasheet it looks like you should be able to
>> treat TSTR and TCR as 32-bit registers without any issues for testing the
>> register!() macro today. I.e. you can just define it as:
>>
>> 	register!(TSTR @ 0x04, "Timer Start Register" {
>> 	    2:2    str2 as bool, "Specifies whether TCNT2 is operated or stopped.";
>> 	    1:1    str1 as bool, "Specifies whether TCNT1 is operated or stopped.";
>> 	    0:0    str0 as bool, "Specifies whether TCNT0 is operated or stopped.";
>> 	});
>>
>> Same for TCR.
> 
> Patch 2 of this series actually adds support for 16 and 8 bit register
> storage.

Hmm, how to use that with the register!() macro? I mean patch 2 adds
support for different storage widths for *bitfields*. But looking at
patch 4 [2] it looks like *register!()* still uses $name(u32)? With
that it looks like that the register!() macro still just supports 32
bit registers? Or what have I missed?

What I'm looking for is a way to specify if a register is 8, 16 or 32
bit. Using the example from above something like

register!(TSTR<u8> @ ....

Thanks

Dirk

[2]

https://lore.kernel.org/rust-for-linux/20251003154748.1687160-5-joelagnelf@nvidia.com/

...
+#[macro_export]
 macro_rules! register {
     // Creates a register at a fixed offset of the MMIO space.
     ($name:ident @ $offset:literal $(, $comment:literal)? {
$($fields:tt)* } ) => {
-        bitfield!(pub(crate) struct $name(u32) $(, $comment)? {
$($fields)* } );
+        ::kernel::bitfield!(pub(crate) struct $name(u32) $(,
$comment)? { $($fields)* } );
         register!(@io_fixed $name @ $offset);
     };
...

