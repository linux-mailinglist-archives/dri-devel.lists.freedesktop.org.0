Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5DE87D03F
	for <lists+dri-devel@lfdr.de>; Fri, 15 Mar 2024 16:28:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3A1E1122BD;
	Fri, 15 Mar 2024 15:28:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="BllimOu5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DCF111222B
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 15:28:23 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2d24a727f78so26573711fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 08:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710516501; x=1711121301;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Vy8mkoyNdDIbEjZYoeFWO0a66QImPA2CQk2NlxXrdT8=;
 b=BllimOu5kiz/6BSCxo3lSWA6sMvNhe2AFWLaRVQVa5twpahjWsOsRSM/lcRMYsWhdL
 Vg5tGZfubHFNwG13rcNMfIKfyR2f0QBhN7Nrcfee2htXj0+X/NlBMq48KdRiQ75JxSyg
 u4pA5NN1+5FbVVriyi/hjEAi/sGXy9h53rqKLopI5kC3e4RClFcOmRyQ1fcAm7zNY7sv
 SSs4Sq057U5X2VdtmvHo+VI/KawbSdamZmPVJjqDkixDgUwMnn4XdQeVHUA0/0t89TBI
 Ad2UlBbOGo1bs6gnDXbvxCA208YFSwIK6Usftgj+tXvC95YHkc2QqGTki81nBvoXvD9S
 gygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710516501; x=1711121301;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vy8mkoyNdDIbEjZYoeFWO0a66QImPA2CQk2NlxXrdT8=;
 b=AyVSzbMoitqKrTDBXU/WyuyYEFiyaRhqw2wST1gPqrOCCSVPX2j9lF9cxeEn4vvwr4
 7q89Dh33uW4cvJnSEEsg7g2xq+K2x+t3WpbjRwyNUKlaLTQt97MCWE4eyFl6sQIR97/5
 YBDwoSnNQ9jRqXkHsrHTE8O4NHctgQwtqUhm5ffQXRA3kEXKazUxKB9qiknXuWbr1Rac
 z0om5oVJd36PZwWI2vO28qG2Hig5Vc2hAmYnYqT15pVdHOP4IaNquoYOYhBK9H6CVkCa
 sQcOEz8tcuFGBuSdFDJzxymLYD83/pRp7MOOZmnp10YjGchViyG6xgOIvd2bCQJ5PPuU
 p84A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeVbl7r+50mRTRNqYo55mR6PDQr/u2ZmsguQoPUyVoibQ3ZoF9jTmIgDft5qmj4Y9vsV1qbhUa0HZ+ZwvjjI/Ibzw6NMbgW3CTfP85ufh+
X-Gm-Message-State: AOJu0YzBa53JVx2phRHv+l9PWJa2+6HYM728kDGOKgokbIBVIvDZ82xj
 AI/E8+pZHOjM0hXcPsMucsI5J7kH3gwxucZ77exnuYR7ZvNUqE80ODpXoeDtc1I=
X-Google-Smtp-Source: AGHT+IEv4KiX0VUKEaEam0pND8+D1J+qGZNRSiefb3SsE1hMQAKXvSamp9kPr2MXTXqoHfBaWZW3RA==
X-Received: by 2002:a2e:a68d:0:b0:2d4:57c5:886c with SMTP id
 q13-20020a2ea68d000000b002d457c5886cmr2953623lje.13.1710516501469; 
 Fri, 15 Mar 2024 08:28:21 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 c17-20020aa7c751000000b00568b43fffb0sm527149eds.96.2024.03.15.08.28.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Mar 2024 08:28:20 -0700 (PDT)
Message-ID: <65cf39ab-6813-4412-9e45-30c26ab27cd6@baylibre.com>
Date: Fri, 15 Mar 2024 16:28:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/18] Add audio support for the MediaTek Genio 350-evk
 board
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Nicolas Belin <nbelin@baylibre.com>, Fabien Parent <fparent@baylibre.com>
References: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
 <4ffde184-cf68-4b71-b81d-9b5894529926@sirena.org.uk>
 <7ddad394-e880-4ef8-8591-cb803a2086ae@baylibre.com>
 <bf418207-7f13-4ced-8c21-2824dd07fab5@sirena.org.uk>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <bf418207-7f13-4ced-8c21-2824dd07fab5@sirena.org.uk>
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



On 15/03/2024 15:38, Mark Brown wrote:
> On Tue, Mar 12, 2024 at 09:58:05AM +0100, Alexandre Mergnat wrote:
> 
>> I'm a bit lost for mixer-test and pcm-test.
>> Currently, I cross-compile the alsa lib project to be able to build the
>> tests and put it on my board.
> 
>> I can execute it, but I still have 2 issues:
> 
>> 1) I've a lot of missing module in my environment (Encode.so, Encode.pm,
>> Symbol.pm, IO/Handle.pm, ...). AFAII, I've to cross compile the missing perl
>> modules and install them in the rootfs
> 
> These tests are both simple C programs...
> 
>> 2) I don't know how to configure pcm-test.conf &
>> Lenovo_ThinkPad_P1_Gen2.conf (or new file to match with my board).
> 
> The configuration is optional.
> 
>> My test cmd:
>> ./run_kselftest.sh -c alsa
> 
> Just run the programs directly.  I'm only asking for the output from two
> of them anyway.

ok

-- 
Regards,
Alexandre
