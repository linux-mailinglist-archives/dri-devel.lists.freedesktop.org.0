Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E74FC4ECF7
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 16:38:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB05410E5C5;
	Tue, 11 Nov 2025 15:38:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="ZfCFbSJA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 092FE10E5C5
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 15:38:43 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-429c8632fcbso2744976f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 07:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1762875521; x=1763480321;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3Z3KNi/DxIS9jxGYKRVmgnqOuehq+jpu6RacnYqWJr0=;
 b=ZfCFbSJAj7GldtEHaHKEoVDiR27XDO5xReVB4Iky0NgKbf55nVNE4EObcZD2C7B4WF
 G/kGQnMPPA2E7s5brhyFuIq/87IwnfmGCd0uxf5BYtFUPIxWbiGjSQdg1YhO+csI+KaZ
 LquLvSD9GQyaFLV6GwJnWeouP3Iye5QJwKO+ePaKcvztfFrMoJVZciSkJ2NXwAuzk/kS
 lmdYfKeS19nzmW3xaU3624bEWyEpPtF8W1zGcUdrs8sBfrH2rL1igUMGXeFHfY4V2oG/
 15A3ayWiWtlgFzdD/UKtNQHwm3tfzqxl6Iy91HVuOtwOJMjLigv4W7Nsv3EBvIhrYWwj
 IcHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762875521; x=1763480321;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3Z3KNi/DxIS9jxGYKRVmgnqOuehq+jpu6RacnYqWJr0=;
 b=k1af46e3CZtif1VjQ7o4zv+n8sDxvjbWmnhiGj8aQ7XtGb1czT7EuHrI0dZwclE2VS
 UMn9M0uOq0wJtr2nAOcgzcjxtjtLWODR7cSHC8HY5DQp2VICGb0RO9OZWNJ4FigojrCP
 KF9T4Dn4TyaumzuwiZb0rurM3XB6za/OWL3SnqfIcDOzlUgwTH5wctf1rTZL3sfHqFYX
 DB7pf14CdUC1bp45XkXYOJASzoJBW3w/Om1Yq+SKx0kQGPRWjVsfqzDQeHmrLNpuPY6F
 Ikg62llDDETgDL/QXsQk6VKRRrIALYdWi37zcAZYJaZQw2U++f1Ugzd8x2pLAEgk4vu1
 rtMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU49z6AKn/BqDY+h1dbj3Ck3SjDcOfxFY+GSqhBIYlSzNPXUOKb981296hvke5/jiQ9JBd2I/qQOMk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxOUpUUAMocf6Jtlfjd/yp08bzNng3bx0TerE2tQfilClmJCoby
 C+NhOpf8xWudXvAkOYkRU88xUoG5UMPCpUrdpGw6avPVlflpKGZ1CHE=
X-Gm-Gg: ASbGnctWaGq8hk5VTrFkiLKww4N+lSh8qOvBaxRJjSa4ayQ9wMlADaiHOfvENDaDeAD
 uSlelTSdv6BTIl4rYFXXNWp8jd6ipnc40tVTW/VrQK1GFJco2Sq0VopQVkEMoNqWRAHn9Gy79rn
 8chdNeBvAJbxDuwAbCmnxD3i8A54B/YDwOcewlyS3cVOY+/CmhbCsdfeeAJKZ27SN0V7GAdVKpC
 sTYPYLY8gviflD9uQiaJFMrPO72dGGYXXbvn1yqDF1Tj2+oKE4f4hULiu0pUgrOgvBQC4yl4HA3
 J0/G4Ebe7BGxoh0p//Um/XSrB6Bb79fba4H2Mu3FVZ9fBb5Xrc3UktjszfZvp5k3PmYOiv+WHHt
 ex2S9zlnPRGUmxggWsYiOzLjQVe6t8ioonYyCkfw62tMi/M4JE12QZBJGGRzJW1UlNFqFHxwSLs
 J4RNPYgO1QL+LqbptixOoVVgdF1XPHp1g6uprBp/nLrz4FND4F5JHel2GvGu8tKrU=
X-Google-Smtp-Source: AGHT+IGr5k1MYZxi19RfrXM6/pRT8tlYiYJwqAkLdMBMajzstQMx8i0KeC8engDNBWF73zohYoxtxw==
X-Received: by 2002:a05:6000:310d:b0:42b:41dc:1b5e with SMTP id
 ffacd0b85a97d-42b41dc1d9amr3742697f8f.30.1762875521287; 
 Tue, 11 Nov 2025 07:38:41 -0800 (PST)
Received: from [192.168.1.3] (p5b2b46e7.dip0.t-ipconnect.de. [91.43.70.231])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42ac679607esm28297235f8f.43.2025.11.11.07.38.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Nov 2025 07:38:41 -0800 (PST)
Message-ID: <32141af0-a792-4c2f-a7cf-cc1cf59d6a55@googlemail.com>
Date: Tue, 11 Nov 2025 16:38:40 +0100
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 6.17 105/849] drm/ast: Clear preserved bits from register
 output value
Content-Language: de-DE
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 Jocelyn Falempe <jfalempe@redhat.com>, Nick Bowler <nbowler@draconx.ca>,
 Douglas Anderson <dianders@chromium.org>, Dave Airlie <airlied@redhat.com>,
 dri-devel@lists.freedesktop.org
References: <20251111004536.460310036@linuxfoundation.org>
 <20251111004538.940185021@linuxfoundation.org>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20251111004538.940185021@linuxfoundation.org>
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


Am 11.11.2025 um 01:34 schrieb Greg Kroah-Hartman:
> 6.17-stable review patch.  If anyone has any objections, please let me know.
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
> @@ -284,13 +284,13 @@ static inline void __ast_write8_i(void _
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
