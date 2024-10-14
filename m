Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E8C99C4B3
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 11:06:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F07B10E3B7;
	Mon, 14 Oct 2024 09:06:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LbjqDoJK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F7B10E3B7
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 09:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1728896776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F17udMnek9Ri4VpOz181mg426zHfJskr96SKZNMjm5U=;
 b=LbjqDoJK6EOLozfx404bm2o+yvuBy///RiUQjuRzjHTogGacBJbNNtnMXj74K6vAmPcSJ7
 z8gF+2s47v71AWdnreOHsTtkpCJCT6/LLX0GdT/SdtTg2svraNgtGVUaG2hVCMWla/0OTP
 7Or2sL7AV77OmslPDxfZfuevE2kmXJ0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-3P5U_fa4NyGueyRhHpuTfg-1; Mon, 14 Oct 2024 05:06:13 -0400
X-MC-Unique: 3P5U_fa4NyGueyRhHpuTfg-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-37d47fdbbd6so1875573f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 02:06:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728896772; x=1729501572;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F17udMnek9Ri4VpOz181mg426zHfJskr96SKZNMjm5U=;
 b=FA1WR+kuME8ZsTKWmPz5KKe/MiCnKPdTxpNmVIkGTnlAwv0VQ23MAsmQG2QS3PpoFy
 9nNSLzJjmNQajmfSt6k3OnR9I5uDzDpofFhkDlsBtw2zmG4yXDBGDrcCASWuwsmP2byz
 fQ9Ty9/zEBr18mZNUuuBhjOmELsMvJFgEBYSTDB3wMoSJ2K6mCrJ0MN0AY5UGXiQSzgl
 Q2L71ztLQUisL55ZULDMWQPzmCDOAb8D5rxv2nLu2oLiXB0pQHLu42P0YEMkqwguUYNB
 vYtp984fL/0cNQ+Lpo26ubhilfIhePlNkcJMaBxtG9pNCVs/6uHh0cG2KBijk9GLBYuR
 wE2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdq1Kr0o2Cs45wQ18CZLeWCWz1j8afq0fmNG6BtTotVE4DkTYRDCMAfSAsnjr9x3QHgLu+IHGnhes=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBwkepQGZRPtNIVuuW9CQ51rxf98tGAUAwXbUhM3s/OHNle/SJ
 6n7VFWx19KHANvTjIf9qPJKrSiitEC00M5lRBXozOAXjf+goPO4/XNJcP6H0vaeM/pQvhWd9aH+
 OxzfPzbX6JKAZ/0jc749neV7xiCN/o8jORLpsFfusHBQTEjTYe2AXvf9wisnRlaAkQQ==
X-Received: by 2002:a5d:424c:0:b0:37d:47f9:be8a with SMTP id
 ffacd0b85a97d-37d54e0b808mr8221817f8f.0.1728896772251; 
 Mon, 14 Oct 2024 02:06:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmaiFzGAr2+K2rmr2gQwMt3POCAx28GuVYLjzk3R6/H+xl7EfaOtsr7q3eGv0V1GoD7XacMw==
X-Received: by 2002:a5d:424c:0:b0:37d:47f9:be8a with SMTP id
 ffacd0b85a97d-37d54e0b808mr8221783f8f.0.1728896771824; 
 Mon, 14 Oct 2024 02:06:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d4b6bd057sm10790092f8f.35.2024.10.14.02.06.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Oct 2024 02:06:11 -0700 (PDT)
Message-ID: <cfde8e06-0931-4a53-bae5-469219e77b49@redhat.com>
Date: Mon, 14 Oct 2024 11:06:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] drm/panic: avoid reimplementing Iterator::find
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 =?UTF-8?Q?Thomas_B=C3=B6hler?= <witcher@wiredspace.de>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241012075312.16342-1-witcher@wiredspace.de>
 <CANiq72kG0Ai2DHfERD0aPDVuEpLYrZ_2uYdw17=eeHRp+2Q1Rg@mail.gmail.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <CANiq72kG0Ai2DHfERD0aPDVuEpLYrZ_2uYdw17=eeHRp+2Q1Rg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 12/10/2024 13:04, Miguel Ojeda wrote:
> Hi Thomas,
> 
> These commit logs are nicely explained -- thanks a lot for taking the
> time to write each!
> 
> A couple nits below.
> 
> On Sat, Oct 12, 2024 at 9:53 AM Thomas Böhler <witcher@wiredspace.de> wrote:
>>
>> implementing the same logic itself.
>> Clippy complains about this in the `manual_find` lint:
> 
> Typically commit messages use newlines between paragraphs.
> 
>> Reported-by: Miguel Ojeda <ojeda@kernel.org>
>> Closes: https://github.com/Rust-for-Linux/linux/issues/1123
> 
> Since each of these commits fixes part of the issue, I think these are
> meant to be `Link:`s instead of `Closes:`s according to the docs:
> 
>      https://docs.kernel.org/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes
> 
> In addition, these should probably have a `Fixes:` tag too -- I should
> have mentioned that in the issue, sorry.
> 
> Finally, as a suggestion for the future: for a series like this, it
> may make sense to have a small/quick cover letter saying something as
> simple as: "Clippy reports some issues in ... -- this series cleans
> them up.". Having a cover letter also allows you to give a title to
> the series.
> 

Hi Thomas,

If you want to send a v2, the easiest way is to download the mbox series 
from https://patchwork.freedesktop.org/series/139924/
and apply it with git am.

That way you will have my reviewed-by automatically added.

I can push this series through drm-misc-next if needed.

Best regards,

--

Jocelyn

> Thanks again!
> 
> Cheers,
> Miguel
> 

