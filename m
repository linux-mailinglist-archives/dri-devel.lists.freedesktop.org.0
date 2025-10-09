Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2017EBC9221
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 14:54:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87C1610EA2F;
	Thu,  9 Oct 2025 12:54:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZHOtDTn5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F97D10EA2F;
 Thu,  9 Oct 2025 12:54:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7A3ED622D7;
 Thu,  9 Oct 2025 12:54:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4AF2C4CEE7;
 Thu,  9 Oct 2025 12:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760014456;
 bh=R1TORzTxYknOCobqa5N2Ym/eV3oIkS/TL69ydYBPELo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ZHOtDTn5E5ki97MoLFbg/hqT6PHek9RAtK++CrFn/XyiyBMbFi4k1QwsKrqf6cJKG
 4NQyQB7rM4j5LUn3I7Ys3/kuTjEPoWBu9aTR/zvv9riMPS3x2YvltdyvnRqojfieOK
 w6Kd53MaLy02LrSMe/3oprCkG0+IX+Q6aGG8DWk+loOmJOi8ohYdfRorqkbx0BRAlc
 NxskVlGcPMtrsq1gKH6OV7Nu4UCO2YYDRSG/SPJ2VZJvOr3qSttg6EqXMSJ0OLAXCa
 V7Kw4G3OmpyPjie7YjAsSnCTxT9lQ7jK8k4ro7YPK2UIU4IuSQ3I1CTkdWLzScVUNX
 hKULQMpCJMzGA==
Message-ID: <807fe91b-acc6-4faf-834c-ced0dead2605@kernel.org>
Date: Thu, 9 Oct 2025 14:54:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] rust: Move register and bitfield macros out of Nova
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Dirk Behme <dirk.behme@de.bosch.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
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
 Andrea Righi <arighi@nvidia.com>, nouveau@lists.freedesktop.org
References: <20251003154748.1687160-1-joelagnelf@nvidia.com>
 <20251003154748.1687160-5-joelagnelf@nvidia.com>
 <5a5bd549-f5b7-41ec-b493-bda427d1218f@de.bosch.com>
 <DDDQZ8LM2OGP.VSEG03ZE0K04@kernel.org>
 <DDDR8DIW6K4L.21F81P26KM64W@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <DDDR8DIW6K4L.21F81P26KM64W@nvidia.com>
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

On 10/9/25 1:28 PM, Alexandre Courbot wrote:
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

Heh! I knew I saw a patch for this already somewhere, seems like I missed the
forest for the trees. :)
