Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A0CA557B0
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 21:45:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3794910EA58;
	Thu,  6 Mar 2025 20:45:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LLWp3Bs7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 437D510EA58
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 20:45:48 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-391342fc1f6so54634f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 12:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741293947; x=1741898747; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U/2AW/XQ+C1Dkr/bifBKVXkd3UKdww00iQvvrQ69JSo=;
 b=LLWp3Bs74LWk/C0PHhZ/7K8Ucm++eeg1/S/DPJFb0qonM8XJx9eZhhDgnzlIugVbDL
 M7G8LF56dTgu1rtlhwy0rUuIzSKpyFKcV6Glq/9SMq/JbkFXW2u7295VBPDrYMnZJpin
 C61eUlCkHhTFsY4OUkisFEERIMrdn2UKCpWKm4jV2KtPhG8ldN9W9IINf13eyIzipSLW
 iJ024Wtr6rux5f/K+t94dtBxYZBfuJhVsVA9SgLDCIYTNg7EYqSkxLLzDY/nnvAOe9uM
 n4lDy/PkBbljCefuv/8GmdgXKgsFCFb4RXtyWjlLLx7sPjwbzu1gGTkRuHv950eQIACo
 Wf5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741293947; x=1741898747;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U/2AW/XQ+C1Dkr/bifBKVXkd3UKdww00iQvvrQ69JSo=;
 b=U9zT87VmiY0JkBKtRhPHxjuD+rsOQXzUvayvzPeMylxDnjjCkQAhV/odczF5gUnRuE
 kEm6Vsr8PrUAyGXnpa5iqi2LcAKRCuXlhfAp/hXQ+xbVW+xw83KGUtDwZmCrQcU/clXT
 S8UlxQaVITKBfA1GP//C9wcJynCjqot2le0qSokEQ89jPMNSErGf7CRHXOw0xiK9CFW2
 tJ36YLuF8scIIZw8/Wd2BFozO19TFABkgZD21bcb75/gT4SNKsu5CKqnQO7wL0v9ERfY
 VSktrYw641gKL8Yd16joiiJBfVTUV8z3i/YsTwj4QZs6FgdmrlLLkiD7Gak2633UwhUO
 9Gww==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHkSMhxBrvrulngnYllXtYq+HZBf3HASm3pgVq10Bjkzrb3l+1/yx2AfzaYd0VNgooQ1Irmz59dsA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyN0e62tzbkFMxjzgGlvpXYuvg9jMoPcE4JAb8fvH/SJkSAXGyx
 m7r5t+V95AzZukm3QToBfkWhYp0+zOYtQ2LHxOexa54pf3VnzT1c
X-Gm-Gg: ASbGncubx7nNuW4o79Ezfh+v+E8rwjO6i5MWz0D3RcZutA+b3nWwyXeSMcfxLIMKYSv
 Qsr57FP0idcrSCY9KhgBO9+Kr19INEj2NOK6aIEVAaXV8BH0a6Fu11oru3zuY6dJYTJmNLkoSKm
 nF9ER16GqGEVDfncq12/c/8U2bFB9HFcQVWULE12MhpSrYXjhTbXUqwp0vDhNFrdzpmmkDMzvD8
 vmwrPGlk68jFId4ilheEK6G5DNV4yeeVEP2YrL5CSQbnQ9Bvb3ge47waMIc1XpvU4RKsidpsKsL
 mCFaHFlwTmxpr60CW0dTCeJ7uHez6ao4ASd3uhqHdXTIXuL+2zPPpMbzp93wsFAepmxPacODO3l
 gTBQrIdY=
X-Google-Smtp-Source: AGHT+IGypB/6b6ARKmDBu94pyV9a8VQg2efcRX5KU7nOp2iuQaxkdpIq9rBXtaXWDKzDk6KRW6vJqA==
X-Received: by 2002:a05:6000:4112:b0:391:b87:37ad with SMTP id
 ffacd0b85a97d-39132dad239mr349795f8f.42.1741293946634; 
 Thu, 06 Mar 2025 12:45:46 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c01de21sm3140996f8f.59.2025.03.06.12.45.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 12:45:46 -0800 (PST)
Date: Thu, 6 Mar 2025 20:45:44 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org, joel@jms.id.au,
 eajames@linux.ibm.com, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.torokhov@gmail.com, mchehab@kernel.org, awalls@md.metrocast.net,
 hverkuil@xs4all.nl, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, louis.peens@corigine.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
 johannes@sipsolutions.net, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, yury.norov@gmail.com, akpm@linux-foundation.org,
 hpa@zytor.com, alistair@popple.id.au, linux@rasmusvillemoes.dk,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kuba@kernel.org, linux-kernel@vger.kernel.org,
 linux-fsi@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mtd@lists.infradead.org, oss-drivers@corigine.com,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-serial@vger.kernel.org, bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v3 01/16] bitops: Change parity8() return type to bool
Message-ID: <20250306204544.35086b52@pumpkin>
In-Reply-To: <20250306162541.2633025-2-visitorckw@gmail.com>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
 <20250306162541.2633025-2-visitorckw@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Fri,  7 Mar 2025 00:25:26 +0800
Kuan-Wei Chiu <visitorckw@gmail.com> wrote:

> Change return type to bool for better clarity. Update the kernel doc
> comment accordingly, including fixing "@value" to "@val" and adjusting
> examples. Also mark the function with __attribute_const__ to allow
> potential compiler optimizations.

If the result type is 'bool' you should just check it.
Not compare against true/false.

	David

> 
> Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
>  include/linux/bitops.h | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/include/linux/bitops.h b/include/linux/bitops.h
> index c1cb53cf2f0f..44e5765b8bec 100644
> --- a/include/linux/bitops.h
> +++ b/include/linux/bitops.h
> @@ -231,26 +231,26 @@ static inline int get_count_order_long(unsigned long l)
>  
>  /**
>   * parity8 - get the parity of an u8 value
> - * @value: the value to be examined
> + * @val: the value to be examined
>   *
>   * Determine the parity of the u8 argument.
>   *
>   * Returns:
> - * 0 for even parity, 1 for odd parity
> + * false for even parity, true for odd parity
>   *
>   * Note: This function informs you about the current parity. Example to bail
>   * out when parity is odd:
>   *
> - *	if (parity8(val) == 1)
> + *	if (parity8(val) == true)
>   *		return -EBADMSG;
>   *
>   * If you need to calculate a parity bit, you need to draw the conclusion from
>   * this result yourself. Example to enforce odd parity, parity bit is bit 7:
>   *
> - *	if (parity8(val) == 0)
> + *	if (parity8(val) == false)
>   *		val ^= BIT(7);
>   */
> -static inline int parity8(u8 val)
> +static inline __attribute_const__ bool parity8(u8 val)
>  {
>  	/*
>  	 * One explanation of this algorithm:

