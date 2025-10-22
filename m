Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EA5BFA2A8
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 08:08:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8239510E2C3;
	Wed, 22 Oct 2025 06:07:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="TGaUi+GO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3859910E0B0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 05:52:56 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-3ecde0be34eso324383f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 22:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1761112375; x=1761717175;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1qTaxXHc0odr/JWFQILy/0jeEMddwplEQInrG8Kvvg8=;
 b=TGaUi+GO2t1NWC9eOkQLxeaRdcPWzpxS/5B/Zj21xPsqzKnoLujQ21+kD5HPN+6s+K
 3jiVZon7S0xbGTHuIIMnlnt1d0kRcFbb6tqJhFPULgAR8+YFcjFeDOwT3qEAujr4sEUr
 hbijqrqNGuhlclfwOiI+jSNaaXfKGBrLqN6zh4KLHAp1E7EzfhNl6WzPKRqZvQWOFmcn
 sLcGW+nmVOoYS2KnmYZreB083ekKwLFfsgYNpdhrlHzwZphbbyitWPJdsd1FsmURfp2c
 Fy4mAbI5tjuVGH2NkOCvkgHxYfyvojSFLJNkpJIwFqty8XbykFU2EujRSt10NzzftsZj
 ATWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761112375; x=1761717175;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1qTaxXHc0odr/JWFQILy/0jeEMddwplEQInrG8Kvvg8=;
 b=b8p8L6vsYN8Sxup5UoZ3wli88Sey+yPRaQ0qoqKB7lGH5H9wHzKQalTWQ2DMinH3PT
 ZjPFJ00h2UKxZeY6kujr6W8QVeuyu1Dk8QsqfxxZnvF6kYp091U7qj93T7SdAQXoVoih
 YKUEA8nxtuWAvUoF/Jet3jb2KE1iW4D4on1Z4QdrWMeBrZIsZDweDiWlj+alWjbCZRM2
 cgXqUqaUBlurX4D4dNcfXTufWgxMfvItktjDPCeIWSop+DBYwGO1U9/X91zIA230/Feu
 3eK+OtRPbFKd22N3y3dJAjB0ptF8n39acuU6/0ds0vhir/cISp1nOfzBXjNpaH4/I8MD
 jwxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+L0DTub4JJ0UudBkYZe94n93N868wDX5SLgjoSHYPKGoG6yLpw4zj9MAdyZaZ9z9hPO10aS+Pzeo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGkXHeau09O3BA4H5MIGndBXy/L3y4fS0Sca5eIZdlZnf28z4K
 uE9FEc/yJyLZUmnb7RhAvI1V4W6oRJL/Ci8FLsKLv5l9A9Gt1ws3Y54=
X-Gm-Gg: ASbGncvIiUtLXZ16K10tTW+pGrYW5W+sUPwyaBgq2VqoQ+1wlSOZLv7cgIk8NNHos61
 paxKYaE43hV5wCW3TG6qzA8r/iKrRGKdQKs8WZfo8aLprRDquyDsFZ10gfVyjZBP7XLB9w8W2Ny
 ouqlNEqr11+Y54v+izuscSPYuIu+pQx6p1pZE8gXngy8ZTCk4rnOYrl/x0WolsbfLNOGcyQYXgP
 mK7ZVqn25rgbwLRYaZIMWNJQcodrIcNfP87kZZTvCifqNX0JKQOcv1o6suazcNU5K1N/dNLkFXn
 LhCRoCDBrbNLAuTfcvxq0/NZ7dMcCfVKFggv3ON4LmKwF0+RFjfEmzI8fP87xU8PGcRRISdKJgJ
 Tj5oF0pa4bvyx/MWSVr59Plp8/YDdwU9Dq/LPTDgPEM/lbPixSmcwUj/fZR3DsbWo2Xw1oIgxGq
 Deg6nMuKn9SDWov7iKgmD2yHZ0LV7voBYhj6fHi6B5ZNpIdE2w1PKCkTOgxk9OsA==
X-Google-Smtp-Source: AGHT+IGaXuonT12yrC1omcvmYN8cKYZBhHbfpNOj1J7o5Hhyd3k15v1KQ0NH5QOy4oOd+nt52eeBHg==
X-Received: by 2002:a5d:5847:0:b0:3e7:428f:d33 with SMTP id
 ffacd0b85a97d-42853264c37mr1533870f8f.16.1761112374479; 
 Tue, 21 Oct 2025 22:52:54 -0700 (PDT)
Received: from [192.168.1.3] (p5b057850.dip0.t-ipconnect.de. [91.5.120.80])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427ea5b3f5esm23079194f8f.20.2025.10.21.22.52.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Oct 2025 22:52:54 -0700 (PDT)
Message-ID: <af5633f4-f339-49a5-9047-2b0682e50584@googlemail.com>
Date: Wed, 22 Oct 2025 07:52:53 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 6.17 040/159] drm/ast: Blank with VGACR17 sync enable,
 always clear VGACRB6 sync off
Content-Language: de-DE
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>
Cc: stable@vger.kernel.org, patches@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>, Nick Bowler <nbowler@draconx.ca>,
 Douglas Anderson <dianders@chromium.org>, Dave Airlie <airlied@redhat.com>,
 Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org
References: <20251021195043.182511864@linuxfoundation.org>
 <20251021195044.163217433@linuxfoundation.org>
 <499eb508-5f24-4ef4-a2a3-f3d76d89db66@leemhuis.info>
 <2025102235-pediatric-sandlot-f2de@gregkh>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <2025102235-pediatric-sandlot-f2de@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 22 Oct 2025 06:07:43 +0000
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

Hi Greg,


Am 22.10.2025 um 07:28 schrieb Greg Kroah-Hartman:
> On Wed, Oct 22, 2025 at 06:49:21AM +0200, Thorsten Leemhuis wrote:
>> On 10/21/25 21:50, Greg Kroah-Hartman wrote:
>>> 6.17-stable review patch.  If anyone has any objections, please let me know.
>>>
>>> ------------------
>>>
>>> From: Thomas Zimmermann <tzimmermann@suse.de>
>>>
>>> commit 6f719373b943a955fee6fc2012aed207b65e2854 upstream.
>>>
>>> Blank the display by disabling sync pulses with VGACR17<7>. Unblank
>>> by reenabling them. This VGA setting should be supported by all Aspeed
>>> hardware.
>>
>> TWIMC, a regression report about 6.18-rc2 that was bisected to this
>> commit just came in:
>>
>> https://lore.kernel.org/all/a40caf8e-58ad-4f9c-af7f-54f6f69c29bb@googlemail.com/
>>
>> To quote:
>>
>> """
>> I have encountered a serious (for me) regression with 6.18-rc2 on my
>> 2-socket Ivy Bridge Xeon E5-2697 v2 server. After
>> booting, my console screen goes blank and stays blank. 6.18-rc1 was
>> still fine.
>>
>> [...]
>>
>> When I revert this from 6.18-rc2, the issue goes away and my console
>> screen works again.
>> """
> 
> Thanks, I'll go drop this patch from the stable queues for now.
> 
> greg k-h


So Thorsten (thanks!) was 20 minutes quicker ;-) But I just tested this with 6.12.55-rc1 and 6.17.5-rc1, too, and can 
confirm that this offending patch breaks VGA on my machine, and that reverting just this patch against either RC makes 
the issue go away.

I'll retest -rc2 too when it's out.

Beste Grüße,
Peter Schneider

-- 
Climb the mountain not to plant your flag, but to embrace the challenge,
enjoy the air and behold the view. Climb it so you can see the world,
not so the world can see you.                    -- David McCullough Jr.

OpenPGP:  0xA3828BD796CCE11A8CADE8866E3A92C92C3FF244
Download: https://www.peters-netzplatz.de/download/pschneider1968_pub.asc
https://keys.mailvelope.com/pks/lookup?op=get&search=pschneider1968@googlemail.com
https://keys.mailvelope.com/pks/lookup?op=get&search=pschneider1968@gmail.com
