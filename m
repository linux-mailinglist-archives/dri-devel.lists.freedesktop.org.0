Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB679C57D7
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 13:36:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A794A10E5D6;
	Tue, 12 Nov 2024 12:36:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="G0bnS0a3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0DC810E5D6
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 12:36:09 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-539e3f35268so6160114e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 04:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731414967; x=1732019767; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=55qJsu5h0INFLgnNmir6cQ7CmnEfVY2DVhKrkSG90s0=;
 b=G0bnS0a3bpon2PMC7kneK+JmlC0JygR6VQUBBv7Bsi7kvciGrTqZQaPQFl4jSqj8iI
 LasIieSFyO9R/GIhVmANlUAx3dwKk1ZAIB1+S9y5m4G/eLndg8MFfKtCCdeN/G7O/tVu
 II/Mgy3rba46G8aRi6VC4c1G8MkWVgblJ0LXPtixPrLaMPnoahsWFx0zQQ+tZ6h9lI3J
 QyiguwR6CP4CK/MSRu+LKbCJEOpaQkqL9CeuB13AL4ix8stUVpFUNDhmKr6KHc014iQ3
 k+927lwtZtToHAJA1omFm7uJi6ObUDyTmah2XXbTwOBfgLwMN3jkpytBYdt35bm2wO9q
 4bgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731414967; x=1732019767;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=55qJsu5h0INFLgnNmir6cQ7CmnEfVY2DVhKrkSG90s0=;
 b=Ytd2+isjunitf0obSZ3mGjmTDNz01rz2BWgBvROkwBMm7AD4RecBv1gHukv7CifJ6I
 FVz52ho+NNVEL+nAY79ZNl6w+MhXyMwwGjuCpZIjWfPbzG9aGMHkEOcLiP/YCb/9fxh2
 Y1NDPsqC4os3xpR9nhSoneiwD9I9+XKq+b7unO+OpSnCxC9hc8lO4Xk562sJ7OXqPzO5
 0isBHAlu8o+EX2f2lLDWCWvOvDF4Oer97B+XHaLhwnt2jbWrk8U5n41XIqUX3JKt5NNm
 bDM5ZX4asbJvkXGx+4YiOzQjxHAGGJrvA4Uw6a/IaiAKStd2kDfmrzWdBr++mU8HH/1l
 ZU0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8eNdB2L0StQakacAsQgoLdy/XdbUZOsfgIdlxIshoVWeRaz2V2x4QIHRw6RnJUSQrh4QNlaBxAks=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3WijI6gXKGDYhrGhdt4SjWYSpr663r8mfcPSpRnpAmYhvqyBu
 2zEkAjUKmNr8+1eW9eniWsFmLAbUCW4NrwocXxQ6gDESVXaFwb7g
X-Google-Smtp-Source: AGHT+IHsx/kWytBBYpAPDmuHhK+llPeTYF2ryp9YrQIRPUyU0CSPBldTT5ao8GlhQ7Zt4/6gTLKHIA==
X-Received: by 2002:a05:6512:2387:b0:539:9645:97ab with SMTP id
 2adb3069b0e04-53d862c591bmr7685225e87.33.1731414967102; 
 Tue, 12 Nov 2024 04:36:07 -0800 (PST)
Received: from [10.254.108.83] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed97db31sm15133733f8f.34.2024.11.12.04.36.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Nov 2024 04:36:06 -0800 (PST)
Message-ID: <ab0007a3-6298-49e4-92d5-0732cbbdbba5@gmail.com>
Date: Tue, 12 Nov 2024 13:36:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Document drm_sched_fini and add some warnings and a BUG_ON()
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
To: pstanner@redhat.com, dakr@kernel.org, ltuikov89@gmail.com,
 simona.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>
References: <20240927142755.103076-1-christian.koenig@amd.com>
Content-Language: en-US
In-Reply-To: <20240927142755.103076-1-christian.koenig@amd.com>
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

Gentle ping.

Dave Philip noted in private chat that you had some comments? I don't 
see anything in my inbox.

Thanks,
Christian.

Am 27.09.24 um 16:27 schrieb Christian König:
> Sorry for sending incomplete patches earlier today, I've messed up my
> branch and had to re-create it.
>
> Let's try this again,
> Christian.
>
>

