Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C868099CD64
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 16:32:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EF3410E2A4;
	Mon, 14 Oct 2024 14:32:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IED8fyob";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3136C10E2A4
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 14:32:17 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-37d533b5412so2001689f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 07:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728916335; x=1729521135; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zl8UFLW7Tkwq4TL+cGeNvFCZJyv3PKwLsnDSoE2Q6So=;
 b=IED8fyobmNRQ0lFndVnt1zUwCnLRUmdsloA1DkX+Uw4uUy37ivGEI5+4NOT9hA8NX7
 C3Pj7VHdvCa57ouFmPSUDI5gelxSFPEPZeAfgi9py7jsEBQdW4/bvExJYz48w4EscBt2
 rIExDzxiSGnOAJvEKznHMPxH2dolFgfRnT//PKsCWl8pcIkLVB9HOiz3DN53ge9DrCKq
 KBNP2VwFI07XkvtBeetW3UTRWLdrvfiAgockU0WY0WTp79yr4eqQ64+yksymZA6RJBDy
 g59uzWmY1R/A7MI8bKJ/8bqu5soqulofgkO90zbKc8SOqgWl55IxLvukKvjMK0ycUNe2
 Z7HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728916335; x=1729521135;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zl8UFLW7Tkwq4TL+cGeNvFCZJyv3PKwLsnDSoE2Q6So=;
 b=dn94x6CAhHXYW1z+angFh0fOOD10td6XZPqx8HvMk0tHb2b6Pn412qqaJhkKGYQV87
 DJGj98TB4XfYyihrkywJyGxuUZ4FspO9AzcEwxjvxnXx10pNlie/ANiYFZjpvyjmeCTB
 5dTUeV1BO8xg31ppOBY1bBwGdVXj5br9i9TxWYg+rIWM+7rrScR+ZYyvy1V4iC30L5k5
 to1C2WRSs3v9z4DnRiDOIkzNAYKYttv2nCQwB9rpW5s4lqVwt4xp+qDR2yJWU87TcewU
 f/6GCnDQB0E1aZsdsFvrU83pZqt0yvMoot7mpe0tfiLzodTxVgxmea1ZaWkmDtg+yCDu
 utFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWotrmaHTkU8neGZycBv0ihTlodPzGPGmpz1RI8Fov7S9tl70J1rXdPlxHVxNdpcgKenO6WCFD+S4k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCMfFxgCbthf3/sBLPjdSPvh3Y2tTATRXMxmIG5kTP0U1KEasx
 NVbF4lyYrYWv3dfc2i0cNlldT9R3L5GyO2C/Mx2IXpCRRAIzPEy6P3DYqReHDpI=
X-Google-Smtp-Source: AGHT+IE3w9OgnIs5ktJA45Iy0OYC2gnGhc4/sWHDLgg9MLsz7ESBtRvhqpqzssEm3UrgKqkaey1GKA==
X-Received: by 2002:a05:6000:110e:b0:367:9881:7d66 with SMTP id
 ffacd0b85a97d-37d552fe2famr7213141f8f.41.1728916335269; 
 Mon, 14 Oct 2024 07:32:15 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d4b6a8ac3sm11464781f8f.3.2024.10.14.07.32.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2024 07:32:14 -0700 (PDT)
Date: Mon, 14 Oct 2024 15:32:12 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2 2/5] dt-bindings: backlight: convert
 zii,rave-sp-backlight.txt to yaml
Message-ID: <20241014143212.GA97798@aspen.lan>
References: <20241010-zii_yaml-v2-0-0ab730607422@nxp.com>
 <20241010-zii_yaml-v2-2-0ab730607422@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010-zii_yaml-v2-2-0ab730607422@nxp.com>
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

On Thu, Oct 10, 2024 at 11:42:39AM -0400, Frank Li wrote:
> Convert device tree binding doc zii,rave-sp-backlight.txt to yaml format.
> Additional Changes:
> - Remove mfd parent node at example.
> - Ref to backlight's common.yaml
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
