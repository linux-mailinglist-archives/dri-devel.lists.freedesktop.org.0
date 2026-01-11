Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60799D0FB1E
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jan 2026 20:51:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 106C810E03A;
	Sun, 11 Jan 2026 19:51:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gdUmvDRj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC87310E03A
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jan 2026 19:51:07 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-2a0d52768ccso39005265ad.1
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jan 2026 11:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768161067; x=1768765867; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MRLXkFTiZd9a9Tg70dQ7iXKOuDpg8c1t7/NoM418xOw=;
 b=gdUmvDRjYFyEH0EEyO5Q2CyoL7andIMl1aXdrCIO717gleAqtk8MJUzdgaDC75dc82
 oSOE5uiSohl2MezLcxWLDfr0uuM5v1rKWA3phKWiw3pJDAo32Hf5hmLlwpll7jKDtbLz
 x3lLpw9UXwNRWbN6odeGjdo+v+Lq2QSYSDD9PL+eYYBNHhkkMNX0Cjbc3qRk0Xv7O84Z
 I0yuJ9yuOJBfDK2cZ9HNsRbKojjz2Oli3nokHysP41zYKT7JrJzyQFyYtcP+W5Oyn3kA
 +XXxq2719hkQDuBwNZzTHvAKE2Dm5xZetKRA9qbV8/qF06viRHDfuzERVrizGu14ZuZR
 qt7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768161067; x=1768765867;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MRLXkFTiZd9a9Tg70dQ7iXKOuDpg8c1t7/NoM418xOw=;
 b=oikNSpCGvgQ6htoMfgHeAu71pesBw6XIIyOhRE3bpJCYMtldGD9xMeqfrWTVYnMFNs
 mahGuicJmw6RbaGklls/zWDAbuP1N8ZhmnMzDKUrvp6eH+ehxzyiD80/fb96akyPd0qQ
 RMvQK13KOTA+KaikKnpM58zbWsK0S0xaEbGI39mSrEXk6UUFXUb+O6Mb/7eC/bkt4csv
 wrqHh7aRLRbagWbou+q8m6d7X6EIZINQ2g8BR7hOfT611EDorN1nJL7Zh7ZXtE6BsDuU
 CVF+TzsVJseBkLK+0h9dXgYKjvnv/9vLdftlJ/iBeDC8AMKcv/d+SaIQW6xlJUUQ9a11
 E/PA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHmfu7s6mmuK3VgCYXEsLZ3bRHY+wzGTs1geotz0Q1gnIb7uHXLlxiWGaS8zR7xm9PYsmWrbIYJzM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyuh50oTNe2+d2IRrnlXlfcNch9SWeorFa0JXqDfsG2kWBcMZ6A
 0E8085ieSMDLAqCwe6QVqfXMVm6tFMFhpYXUBKVavqzZrATDsT97kVQ/5tYpLg==
X-Gm-Gg: AY/fxX6dl0ohh2fYr7irvMl0SsA7Hqf/2aU9+iWP41mojbGWfDVpZfd6g97eRc01u1+
 LLT68b0p8pxkp+Q+OoFu2LjZCslaV+wKchN/xJBFdqcVZWHgmEAqR9Q9vub8po4lnynNadnwp/P
 8I++1reQ3i6ZLtE0CWNpcKgwydSt4Wawct06k2ks6hLI8/m/yTt2OTeSBNU0Rh/hrAJ5QPBJl6W
 UjZ0bB9P8CQza3cZ3bElA8c2whfzHcMe5v360AH8UBljrwCj40hUDoxejlwqTIw4e6fSqCh4yhc
 ASPRlypWsAYGyINo6U6q1bDij58XwntT3+w30X4jqMLhiAVCQOLVvJZP16sGa67R8sMZ95OCg6P
 tdLG7hsiAWDItus65aUwN5oPrFQqgy8hrCJvH5g7ZikajWyCs/eGl6/V22Umo1CQMwa8gKUHm+Z
 c/tCV5BgT69Fd/pdeVf0yOYYhBEeoJDbDqKtiH7dS+aYHjOCNMlnOevdrCyaMt
X-Google-Smtp-Source: AGHT+IE6MC5cdfKFrapIzQPAQHoSLTs/H9+tHC4hZDCvPVWe/VgmNXYnGJFwo73wIBWsCgtbF09Mjw==
X-Received: by 2002:a17:902:e88f:b0:2a0:a793:3357 with SMTP id
 d9443c01a7336-2a3ee4fecdcmr148105215ad.43.1768161066959; 
 Sun, 11 Jan 2026 11:51:06 -0800 (PST)
Received: from ?IPV6:2601:1c0:5780:9200:a2d6:d17d:ed6b:f017?
 ([2601:1c0:5780:9200:a2d6:d17d:ed6b:f017])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a3e3cd2953sm152979465ad.86.2026.01.11.11.51.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Jan 2026 11:51:06 -0800 (PST)
Message-ID: <75cb40e4-bf33-46eb-875f-f6100f657801@gmail.com>
Date: Sun, 11 Jan 2026 11:51:05 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] fb: Add dev_of_fbinfo() helper for optional sysfs
 support
To: Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, andy@kernel.org, gregkh@linuxfoundation.org
References: <20260107044258.528624-1-chintanlike@gmail.com>
 <20260107044258.528624-2-chintanlike@gmail.com>
 <40911dd0-52e1-46de-b060-0372988291ca@gmx.de>
Content-Language: en-US
From: Chintan Patel <chintanlike@gmail.com>
In-Reply-To: <40911dd0-52e1-46de-b060-0372988291ca@gmx.de>
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



On 1/11/26 10:50, Helge Deller wrote:
> On 1/7/26 05:42, Chintan Patel wrote:
>> Add dev_of_fbinfo() to return the framebuffer struct device when
>> CONFIG_FB_DEVICE is enabled, or NULL otherwise.
>>
>> This allows fbdev drivers to use sysfs interfaces via runtime checks
>> instead of CONFIG_FB_DEVICE ifdefs, keeping the code clean while
>> remaining fully buildable.
>>
>> Suggested-by: Helge Deller <deller@gmx.de>
>> Reviewed-by: Helge Deller <deller@gmx.de>
>> Reviewed-by: Andy Shevchenko <andy@kernel.org>
>> Signed-off-by: Chintan Patel <chintanlike@gmail.com>
>> ---
>>   include/linux/fb.h | 9 +++++++++
>>   1 file changed, 9 insertions(+)
> 
> Whole v4 series applied to fbdev git tree.
> 
Appreciate Helge and everyone who reviewed it! This was my first kernel 
series and it was good learning experience for me.
