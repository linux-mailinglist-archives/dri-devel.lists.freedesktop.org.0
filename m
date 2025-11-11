Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F05C7C4ECD3
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 16:36:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E42210E5BB;
	Tue, 11 Nov 2025 15:36:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="LSpN1Nh3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B75D10E5BB
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 15:36:11 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-471191ac79dso44359485e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 07:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1762875369; x=1763480169;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ppR1x+hLMCIFniD0aWhZe//Po7//TeOQkjJokWKR8R8=;
 b=LSpN1Nh3nStjUfwSdXslDx2hcQsvc44nWrYkcaDf1H/QGvq+1VQolRnJ69B/9S53E7
 TKh2ChX+eBdlvKa7QVCxLuLwhgnIatkmwAisfIVLCeROFY6jsRBZrViJxmCrbWlFMVNP
 iKemEv8xfbYMk7yoD/Z+Lyqhqcxn/CAknL6x1/cpLWa03pMw0Yyluq0OisDQBtjC3xvo
 UUK1z7s9WkTk+JNGsNXr264Wj+vOasj3ftolAKzsuQkh8/a2yx0xWC1lnlWzrv0xtaMd
 PRlQjZ5wv2Gkg0MXMW5dlQtivrdRMTQaQKNdkCg3S+HdU7g+20Nw6aS7xxBgNzy7jZQM
 ZYZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762875369; x=1763480169;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ppR1x+hLMCIFniD0aWhZe//Po7//TeOQkjJokWKR8R8=;
 b=HaFveAPVD4MEDDxtVkqfG8QiavVpJpnzXlF1/Xd3Vb9Tg1PIHV1OKRyQivHKGepnrB
 /fpUORar7p8dC8YwLoY3U0UsnZ2GnnNNcqb16F/m6QNNkp1pFg41ptQddKd5XOrKFN4A
 FbaS56ydNFO0eUiJ/7y155fErL4PxT8EFS8p7Cj5vGUqjQiK0vgXxyybuXtxTrbAEF5c
 rhdclvrxBXE6n192o1nRiq5gx/dE3sPMF+ZvM+gmI7n+mwNBIbK5N5Gnxb5mBngl/+Pe
 JTtX0l1q9bYYr1dfbx1mNiyEL9Nvp9VOTdnjGSlbmsuFwTBWwdost4+x4SgUy3DWR4wx
 yqDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUohReOyCUU76T+u5/Wdqts7l3GFsPle+pc72qRXBLAxcChKzRDXZx0v2R/waIrunWs61CCCCAL+lM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2UaCJsYkqFNcbMuV4JpHa2N2bXVJZI9BEpSrx0fZS7psJAPfT
 Y67YEBvjtJMyIbJqF3kDtqFDmphHdc91y8vJYI5k1I2BluWgQUrRWAA=
X-Gm-Gg: ASbGncuxJ0aSg5wrL4zoVaiZIPfo2uTTV6o9FGxb+0OfZDEDCD39d40T8m48tRRBcoj
 saBVkKr9878kJd9yAi0izm+v+vcxjeUnXGKBOQMTYt6Wjxi6B2cAAfrQh6823sL82KzsSt6qTnl
 2hYK0Xv6zvHhMf4se+njzvh156nq4DAw3PVMjvAdyLENFxBMEP/Y4rERTkR5qzUAKsQHsfPAe5z
 YgcFwg/4HjLm7ppHtDD5kTRwPWCWa+dmvn/HoHaXj79p9h8sUafubtTVy+Q9NkxYHZ0r7HAyGJE
 /SkznBqiGvX0iPFXMCEcdX46qDhWLxtbAnwjyAgDO966LLWc4AHsf6yI5rnwXyw1fmSqg58o2tL
 jDeA4fktHoJCy4CDnbvKSE45QlQOktyE0DJxfITVf6ehCAi8DTkSfa/4wxmHCvFrzGkWUyJox4z
 eAQH4FtUHjeLSKc7rBXmncbI8rXCvh8nDYIm7efrOFnjTEn/ezXexV
X-Google-Smtp-Source: AGHT+IEojolfoccSO+8VSzilqIjHUxDcGXaj6DHabhOg/LEXqYLd3SjX02gv/CDQ8AJjB3/I7SQ/bA==
X-Received: by 2002:a05:600c:3b8d:b0:46f:b327:ecfb with SMTP id
 5b1f17b1804b1-47773230895mr107537725e9.9.1762875369310; 
 Tue, 11 Nov 2025 07:36:09 -0800 (PST)
Received: from [192.168.1.3] (p5b2b46e7.dip0.t-ipconnect.de. [91.43.70.231])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42ac675cd25sm29278958f8f.22.2025.11.11.07.36.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Nov 2025 07:36:08 -0800 (PST)
Message-ID: <657784d1-72df-43f1-91c4-2d19984dfb14@googlemail.com>
Date: Tue, 11 Nov 2025 16:36:08 +0100
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 6.12 070/565] drm/ast: Clear preserved bits from register
 output value
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 Jocelyn Falempe <jfalempe@redhat.com>, Nick Bowler <nbowler@draconx.ca>,
 Douglas Anderson <dianders@chromium.org>, Dave Airlie <airlied@redhat.com>,
 dri-devel@lists.freedesktop.org
References: <20251111004526.816196597@linuxfoundation.org>
 <20251111004528.526435608@linuxfoundation.org>
Content-Language: de-DE
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20251111004528.526435608@linuxfoundation.org>
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

Hi Greg,


Am 11.11.2025 um 01:38 schrieb Greg Kroah-Hartman:
> 6.12-stable review patch.  If anyone has any objections, please let me know.
> 
> ------------------
> 
> From: Thomas Zimmermann <tzimmermann@suse.de>
> 
> commit a9fb41b5def8e1e0103d5fd1453787993587281e upstream.
> 
> Preserve the I/O register bits in __ast_write8_i_masked() as specified
> by preserve_mask. Accidentally OR-ing the output value into these will
> overwrite the register's previous settings.
> 
> Fixes display output on the AST2300, where the screen can go blank at
> boot. The driver's original commit 312fec1405dd ("drm: Initial KMS
> driver for AST (ASpeed Technologies) 2000 series (v2)") already added
> the broken code. Commit 6f719373b943 ("drm/ast: Blank with VGACR17 sync
> enable, always clear VGACRB6 sync off") triggered the bug.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reported-by: Peter Schneider <pschneider1968@googlemail.com>
> Closes: https://lore.kernel.org/dri-devel/a40caf8e-58ad-4f9c-af7f-54f6f69c29bb@googlemail.com/
> Tested-by: Peter Schneider <pschneider1968@googlemail.com>
> Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> Fixes: 6f719373b943 ("drm/ast: Blank with VGACR17 sync enable, always clear VGACRB6 sync off")
> Fixes: 312fec1405dd ("drm: Initial KMS driver for AST (ASpeed Technologies) 2000 series (v2)")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Nick Bowler <nbowler@draconx.ca>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Jocelyn Falempe <jfalempe@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v3.5+
> Link: https://patch.msgid.link/20251024073626.129032-1-tzimmermann@suse.de
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>   drivers/gpu/drm/ast/ast_drv.h |    8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -286,13 +286,13 @@ static inline void __ast_write8_i(void _
>   	__ast_write8(addr, reg + 1, val);
>   }
>   
> -static inline void __ast_write8_i_masked(void __iomem *addr, u32 reg, u8 index, u8 read_mask,
> +static inline void __ast_write8_i_masked(void __iomem *addr, u32 reg, u8 index, u8 preserve_mask,
>   					 u8 val)
>   {
> -	u8 tmp = __ast_read8_i_masked(addr, reg, index, read_mask);
> +	u8 tmp = __ast_read8_i_masked(addr, reg, index, preserve_mask);
>   
> -	tmp |= val;
> -	__ast_write8_i(addr, reg, index, tmp);
> +	val &= ~preserve_mask;
> +	__ast_write8_i(addr, reg, index, tmp | val);
>   }
>   
>   static inline u32 ast_read32(struct ast_device *ast, u32 reg)
> 


I think that with this patch (which fixes a bug in the original ast driver affecting AST2300), it is now safe to also 
include (in both 6.12.58 AND 6.17.8)

6f719373b943 ("drm/ast: Blank with VGACR17 sync enable, always clear VGACRB6 sync off")


which triggered that bug, and which you dropped from 6.12.55 and 6.17.5, respectively, because of my report

https://lore.kernel.org/dri-devel/a40caf8e-58ad-4f9c-af7f-54f6f69c29bb@googlemail.com/


NB: 6f719373b943 fixed (IIRC) an important issue for AST2500 users. I have tested the combination of both patches in 
mainline 6.18-rc2, and they work fine together, and Linus has both of them in his tree since 6.18-rc4.

Also, I tested both of them already on top of 6.12.5 and 6.17.5, and they were fine, too. Please see:

https://lore.kernel.org/lkml/045e6362-01db-47f3-9a4f-8a86b2c15d00@googlemail.com/


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
