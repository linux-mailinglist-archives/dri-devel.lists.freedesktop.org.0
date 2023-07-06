Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0780F749B7F
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 14:13:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 535BC10E4FF;
	Thu,  6 Jul 2023 12:13:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2458410E4FF
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 12:13:35 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3fbd33a57b6so7786945e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jul 2023 05:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1688645613; x=1691237613; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0/5wxHDy6mL4FcPapG0NJLXj6++vEZT2MS33NrQ/lTQ=;
 b=IbzlafQusCaKto71OXk4bPoXEo7+FCrn+i1Hk7cATXwj6jD0FU8RZdq5IA1kP7kLfv
 3wa2qn53DE926m9gNw+SaXT8iilPDkuOnkdWh3rudUNg4TkmKbsep4bvf6f4ina/mf0n
 DRzQ5WErugGScBJuVhHq5WnqfJ+sbM8TC8wciV21yFhQIkvdpuXBfsE0yBYDKWNEyEzu
 lpnbDPWvcKk1agZbeYhhPixhkIwdNkyTBaE4WrvBvWEH7byJOAeR7mDKtmdQTgGRv1FI
 o1xazO6BOLl8JRFEvxnms30i4deFFBhipFbK+xh41OKOpj6wb+fGF1re4lHoK4boQTQD
 xVYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688645613; x=1691237613;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0/5wxHDy6mL4FcPapG0NJLXj6++vEZT2MS33NrQ/lTQ=;
 b=PexDxsy1OJC21dx19z4UR6jTC0Eq7HNcAlHRcrlywRZ9Su4+tBlSARhYNbsFun+ZFn
 T920jbPCSa199SdQYpbeQnpnXQw8P+jyAehDBwnxQBNmRN4jGLEs/BrnY5Ux9p47pPKz
 SHdq9SdixN29fFNs+urkBLVWU0EY+BUyXV+P6gicJSygD4PDhd3Jt6e+L0ccvu/r46j8
 69P7T7Tt9QA2bJyFjvW+wJ9ZcgBWjCJcT2nyPi94NTicXkVdBFoABK32jb4qc39Sd5Kv
 TaS+E0NXGXrPEDTA1OSGk0i+tONstK5ngRLQMyB5a4HKhsqxBKA3l0RNqelW+Yj+DaKm
 jFAQ==
X-Gm-Message-State: ABy/qLYu3eQ0ukWDH49PZVhbCroa++eN0NFDp8k+rBs4GAR+dsbA/dtw
 VrU39aGQblBaoJ2On3jOarBCkQ==
X-Google-Smtp-Source: APBJJlHrBYvDJNnzrZAW/qWNal0XP+4b2h86axDo0FU4omajc4qpoygiGFAh45R45C+UW4rrqkg3cQ==
X-Received: by 2002:a1c:f709:0:b0:3f5:fff8:d4f3 with SMTP id
 v9-20020a1cf709000000b003f5fff8d4f3mr1994310wmh.7.1688645613660; 
 Thu, 06 Jul 2023 05:13:33 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 z10-20020a05600c220a00b003fbb2c0fce5sm4911847wml.25.2023.07.06.05.13.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jul 2023 05:13:33 -0700 (PDT)
Message-ID: <4f493bc2-45b3-13b8-f1b1-1729a803c74c@baylibre.com>
Date: Thu, 6 Jul 2023 14:13:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/mediatek: Fix potential memory leak if vmap() fail
To: Sui Jingfeng <suijingfeng@loongson.cn>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230626185801.684451-1-suijingfeng@loongson.cn>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230626185801.684451-1-suijingfeng@loongson.cn>
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
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 26/06/2023 20:58, Sui Jingfeng wrote:
> Also return -ENOMEM if such a failure happens, the implement should take
> responsibility for the error handling.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre
