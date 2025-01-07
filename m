Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C78CA045DB
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 17:19:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66D7810E72E;
	Tue,  7 Jan 2025 16:19:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="gYv5QAGs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1862A10E72E
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 16:19:07 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2ffa49f623cso202269651fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2025 08:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1736266685; x=1736871485;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kvzjPiPIuFK/oaJYElHayv3UTewTRAMoEzwrccqgGlg=;
 b=gYv5QAGs6hKrSwlTbJ9hww6/L0MGXiXtJqnaT7K+Jtr01F8u3MAVjFslrfCGHEIB/Y
 KDJnujfXCxinJNxHIyAhMv3p3W/kU24TuoLQw8NxYpkfRT+xkLuNFGKcEpuzgHPy7fg4
 ea829wG16C6Lvk95ilXFE7ZAnVfLLUCkflG+i+y8R0v0gZS0mYuZS8ijfFxyGJ06g1A3
 8b+tMYVRdAaV+xN0tj0qaNt9Fk1tGMiTLzQt962IIpOrTvK4vAA2zaBdV7QvwBS+kTfB
 RUOIpZNeSMmwEvVjgckLzKFFdPXt3V/5Q9ebYEHlq9ify7ebywGl3V2v+haWxnzh1XYl
 MfUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736266685; x=1736871485;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kvzjPiPIuFK/oaJYElHayv3UTewTRAMoEzwrccqgGlg=;
 b=uQuUnLm2CKb6iqqjUN1mUSTBknI5CQ5i/9v5g0vsPGMfEDs1HNewRISYK8s0EDKZXQ
 8bvLZLJkDWBFcIAdABNCoIUZMRaw778PuLJVbEZNTcgQxYgSSLufLjG6QV4kpn1gJBle
 m9cvcb04CpqsIk0w8Jjgf0+1HiTRKt2R5xFXJCKlTNacag3soLiqW5cuXLAdntLVe196
 5c9ilb9tsAg/5WCesUrOW/yrkv2Bwy5G6GesypdHD8sBD7CKtq4koPJy27feRK5ph2y9
 oTHUneEJXjpOltpqJxYk5O5nDyhCFE5Nu0wI2/kqdSvl9HkBJ7lm4NXlDK2D8M2mDwBS
 /oZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxBvkYP6qXAO5juLdJXpL4/VbpcEqEkLFuBxobcTJSh2ZhmYoMIazKvRozBXh1HxhdpieTKrJwAlk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYQm2e2bS4dOFmq9HzfxiTIf9IiJcqOCxR3o4p43gCf6IItmIw
 lwJ8JNmghZ4griG61QaCyUjSlHnQTEDIY9VpSP5AtPTHL+gNGFmw3OubNY1c5fe/ak+QdZh/Hhv
 NKJA=
X-Gm-Gg: ASbGncsJbOJ270KNhQquL6y7JdFFfRdILSuFZQZ8h6eFxV+wxgzrOQarDW2HUoNZt/E
 qvPPuc4f3V+XptHSMewXQFb03ZLI2u+r/3H76hrjjsYngR1/4mmnUud57Cq1ddxhUqjxyAdJMzs
 j5AZH56xLFErIiD1Izrrty91tNO8atVS2yG4ylD8DSkYHz2n77ITC0Non2TYLJHCqNhBJQlahfa
 hhDILaKkJ4kejBPjYvb7o2uy6xsaOHJCcBNTSUnGRHHH5a8K/mjMaFhpuhK/gegyeGx65A9
X-Google-Smtp-Source: AGHT+IEXux3QR9Zi2r7B7lYR2i1C6RPK5i4h2jlVlvQHxZZfVs3zWeF6nUfGyQdl3zgFwMD05EJefg==
X-Received: by 2002:a05:600c:4748:b0:434:a7e7:a1ca with SMTP id
 5b1f17b1804b1-43668b5f5b7mr459388205e9.20.1736251962442; 
 Tue, 07 Jan 2025 04:12:42 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43665cd9c29sm578227735e9.14.2025.01.07.04.12.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 04:12:42 -0800 (PST)
Message-ID: <228218bc-71ba-4231-9cfc-97f6d7aeeb35@ursulin.net>
Date: Tue, 7 Jan 2025 12:12:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] A few drm_syncobj optimisations
To: Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
References: <20250106105521.53149-1-tursulin@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250106105521.53149-1-tursulin@igalia.com>
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


On 06/01/2025 10:55, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> 
> A small set of drm_syncobj optimisations which should make things a tiny bit
> more efficient on the CPU side of things.
> 
> Improvement seems to be around 1.5%* more FPS if observed with "vkgears
> -present-mailbox" on a Steam Deck Plasma desktop, but I am reluctant to make a
> definitive claim on the numbers since there is some run to run variance. It
> would be best if someone could verify or suggest a more heavy workload for
> syncobjs.
> 
> *)
> Before average fps after 200s: 22102
> After: 22426

Copying over from the discussion on v1 of the series:

Five ~100 second runs each kernel. Absolute numbers are a bit different 
before I turned *off* some kernel hardening options since.

x before
+ after
+------------------------------------------------------------+
|                          x         +                       |
|                   x      x         +                       |
|                   x      xx      ++++                      |
|                 x x      xx x    ++++                      |
|                 x xx   x xx x+   ++++                      |
|                xxxxx   xxxxxx+   ++++ + +                  |
|                xxxxxxx xxxxxx+x  ++++ +++                  |
|              x xxxxxxxxxxx*xx+* x++++++++   ++             |
|        x x   xxxxxxxxxxxx**x*+*+*++++++++ ++++ +           |
|       xx x   xxxxxxxxxx*x****+***+**+++++ ++++++           |
|x     xxx x   xxxxx*x****x***********+*++**+++++++   +  +  +|
|               |_______A______|                             |
|                             |______A_______|               |
+------------------------------------------------------------+
     N           Min           Max        Median           Avg        Stddev
x 135      21697.58     22809.467     22321.396     22307.707     198.75011
+ 118     22200.746      23277.09       22661.4     22671.442     192.10609
Difference at 95.0% confidence
     363.735 +/- 48.3345
     1.63054% +/- 0.216672%
     (Student's t, pooled s = 195.681)


> Tvrtko Ursulin (7):
>    drm/syncobj: Remove unhelpful helper
>    drm/syncobj: Do not allocate an array to store zeros when waiting
>    drm/syncobj: Avoid one temporary allocation in drm_syncobj_array_find
>    drm/syncobj: Use put_user in drm_syncobj_query_ioctl
>    drm/syncobj: Avoid temporary allocation in
>      drm_syncobj_timeline_signal_ioctl
>    drm/syncobj: Add a fast path to drm_syncobj_array_wait_timeout
>    drm/syncobj: Add a fast path to drm_syncobj_array_find
> 
>   drivers/gpu/drm/drm_syncobj.c | 281 ++++++++++++++++++----------------
>   1 file changed, 147 insertions(+), 134 deletions(-)
> 
