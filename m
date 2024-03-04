Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC4B87006C
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 12:30:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD0210FFE0;
	Mon,  4 Mar 2024 11:30:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eXb1qc1U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D38C10FFE0
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 11:30:00 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2d2305589a2so64303471fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 03:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709551798; x=1710156598; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4vL0LqK5KGeMh29yJkxMT78RWM5joaKt0C5y/rSqDNA=;
 b=eXb1qc1UJy5CU8aUy/27D6kavEeFWQSJABacFKj+4Xkahi/HKmbsgKqDo1lfsEA3rl
 DXJui5E9RkyXbAijoglfrlvl1XQi+G0EYI6xG6o6hCl2oR9r5DdHcSXNkMeNK7pMB6Ae
 XGtVoPmUDJfcXkamIUADXsWjZNprvqlUJldmW6Lb+dsmvrMzs9PtilVsMFOpwdF2vdIC
 58Ze6BeAQcOspZgSDhx2uOck1fQAEnOKNL/vr1tD8bvzHwPIfmuNFwPSTnGzKTEOBWTo
 W7mMfI3XHwFy8e1++cBmeV4GJTIVRValgOrlSGMe4Gkn2QouNpy+iyflbGk4fX+rB6ci
 u93A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709551798; x=1710156598;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4vL0LqK5KGeMh29yJkxMT78RWM5joaKt0C5y/rSqDNA=;
 b=p8bexqEUG/KYobgAyPzijT354wnmVI1vaCzPc+lp0isTmiFbKtU7yP6rU7w0vJ3dhB
 PK/aYUNrUNwjHOMNl//CMM5w1t1SZKjBuBKgLkNCK8mIR/1WFeTj2iH9XJFMtsN4Ip79
 c90BPoUGEtPjHK3gMJnS1D3p93CWmoGad4bk1uKLvgbB18UxlfLzZR6vZZMmLUL+In6r
 le9O+kT/cqckK9P4SMSkaM+qzfyw9QZNSUhX/xX7Ap7mOcg+fGF6LMhw34grLMz2FENv
 gdJH2UlDL/FayQoNoCmwWAkOqyuBtzWNlgGkFguRVm6v9gdczRIVSvc21UhE6Dg6EDop
 BHqQ==
X-Gm-Message-State: AOJu0YwfzNDiJwCpSOeyrZ5pfbKCcYo2UUHgR/k0uHRlvCQBs2q2USO1
 pAUFgI88b5ubgVtqYcST7zSy1mj4oc7NPUt9Ay2DQ3X06kEj9jJP/HzpSHJU98w=
X-Google-Smtp-Source: AGHT+IFCZr5TnZzbIjgFDs70xFEbSdnDduXpFSo0k5iseIZ42JOLm6EDtlRW4UYmc7bEsd4Ex6jYzA==
X-Received: by 2002:a2e:9914:0:b0:2d2:b929:9389 with SMTP id
 v20-20020a2e9914000000b002d2b9299389mr5842283lji.40.1709551798212; 
 Mon, 04 Mar 2024 03:29:58 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 r9-20020a05600c458900b00412b3bf811bsm14264443wmo.8.2024.03.04.03.29.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 03:29:57 -0800 (PST)
Date: Mon, 4 Mar 2024 11:29:56 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Patrick Gansterer <paroga@paroga.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: backlight: Add Texas Instruments LM3509
 bindings
Message-ID: <20240304112956.GH102563@aspen.lan>
References: <20240302212757.1871164-1-paroga@paroga.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240302212757.1871164-1-paroga@paroga.com>
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

On Sat, Mar 02, 2024 at 10:27:56PM +0100, Patrick Gansterer wrote:
> Add Device Tree bindings for Texas Instruments LM3509 - a
> High Efficiency Boost for White LED's and/or OLED Displays
>
> Signed-off-by: Patrick Gansterer <paroga@paroga.com>
> ---
> <snip>
> +  ti,unison-mode:
> +    description: |
> +      Enable unison mode. If disabled, then it will provide two
> +      independent controllable LED currents for BMAIN and BSUB.
> +    type: boolean

How does not-unison mode interact with the backlight property in
panel-common.yaml ?

If this mode intended to provide two strings that can be controlled by
different panels then a phandle link will no longer be sufficient to
describe the connectivity.


Daniel.
