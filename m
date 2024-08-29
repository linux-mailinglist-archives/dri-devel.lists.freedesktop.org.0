Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8454B964AA3
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 17:52:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E70A510E710;
	Thu, 29 Aug 2024 15:52:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Tnm4evl4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6842810E710
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 15:52:02 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-5c0a9f2b967so961368a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 08:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724946721; x=1725551521; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LkzGyg+YpeAYRQA8bRsHPMUzJcZCB8L3Y8kiytwETbg=;
 b=Tnm4evl47jtjNyLHubCcKJAhUHaseHGo20s7s+QN4POjLCYPCMcBOpy+Xut+AZEDFo
 RrukfFz5uPNlXoz/VR2txGrkIOVRZyzmiblXeND18HvXYw3Bvb3nATauvyP+GUlhUEnT
 Ge+R/TrFdkwhEjmmspkbEHl/xmzi0E+T3PPWWJMJM4A5evQktI65/bjF1PZPDC1sOtaE
 Om6VRrJIWVbaaMhndFEtmyPHm5GWgKqMvFZIQB+xDip3Bu7P7A/wMlgTz0gjvUNi3VUm
 XnKHhGYu3U+IY89Y6vI8J1K6PJJ9QlI70m7UikgAA+/xpC88czz/moXAX7n7iMPAkSDw
 Q7WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724946721; x=1725551521;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LkzGyg+YpeAYRQA8bRsHPMUzJcZCB8L3Y8kiytwETbg=;
 b=SrJjFuQ8KsjRYVu9nbC/sZYkXRgTDhJc4hr/h315gFhyP0IZHJEuIpNd9oQW7UDeYS
 H8I6h2y/8Y9w+o+njZMoCELS3HOsYpWzTYZxAG8aiiuISCxOtfPinq59BitmQhERmdGF
 Y8R79QZ8RaxvqNP2+W5LPz8BPm7wMY9Hf0kxHWViQm/NvA85OABStUpcP0daf73UF/bq
 rAroEMBB4M/DcrH8sQaTstvKtLKTO/oqWK+iXX2tnBIIQMraVuYOg6amjS4a/OG0PUia
 4prKVE83hE4ZeAVvj3vg02ReaezHG1n96z8JokB+vKcpAz2Yp3CavCv9CLDFwf0MYG75
 nm1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmlp0zGikYIVh9GxiHuWpA6HFZm4X9e+LzvEqStuyp7yZv5iX3+mwaOmLpxGqZ3mJ1HFx81iVMa+I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbpEqI0Rhktb51vWkr8miVwYHO5FPalDQ9b6IVAKzR0CcN6pZG
 qk4/aeTrMKzeIDp4BBnzgo2r/J0hhl+MKtBv4Mo3uRWavhU5x58M
X-Google-Smtp-Source: AGHT+IEHax0znxV7voU1XWsSmK6e3PzUEkJanhV5ouCAG7d9c0TJRpfmciNspiwHOZgvpH4UKWgPnA==
X-Received: by 2002:a05:6402:26c1:b0:5be:dc90:d14d with SMTP id
 4fb4d7f45d1cf-5c21ed34a93mr2893643a12.1.1724946720388; 
 Thu, 29 Aug 2024 08:52:00 -0700 (PDT)
Received: from [192.168.0.101]
 (craw-09-b2-v4wan-169726-cust2117.vm24.cable.virginm.net. [92.238.24.70])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-a8989222588sm92753766b.200.2024.08.29.08.51.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Aug 2024 08:51:59 -0700 (PDT)
Message-ID: <794ca7cc-f27f-410c-8b95-d5403f4ad638@gmail.com>
Date: Thu, 29 Aug 2024 16:51:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] drm/tegra: hdmi: make read-only const array
 possible_nvram_sizes static
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240822205047.642845-1-colin.i.king@gmail.com>
 <a3itbzv4hhkbpa3lhe7w42qtyxwiuwdsdntemtzn25uj27skci@trg63xzeh3dp>
Content-Language: en-US
From: "Colin King (gmail)" <colin.i.king@gmail.com>
In-Reply-To: <a3itbzv4hhkbpa3lhe7w42qtyxwiuwdsdntemtzn25uj27skci@trg63xzeh3dp>
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

On 29/08/2024 16:50, Thierry Reding wrote:
> On Thu, Aug 22, 2024 at 09:50:47PM GMT, Colin Ian King wrote:
>> Don't populate the const read-only array possible_nvram_sizes on the
> 
> I've changed this (and the occurrence in the subject) to reflect the
> actual array name ("freqs") that's being changed here.

Thanks, my bad.

Colin

> 
> Applied, thanks.
> 
> Thierry


