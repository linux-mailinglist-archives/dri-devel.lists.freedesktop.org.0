Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7158A4FCA
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 14:54:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 646C8112541;
	Mon, 15 Apr 2024 12:54:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fVIZt/qp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6BF0112541
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 12:54:37 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-347e635b1fcso505906f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 05:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713185676; x=1713790476; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=QuhwG+KvJtimhWZKcxuFPkQLiPrb/07vzj/We9k9VWQ=;
 b=fVIZt/qpM0ICA3//Xak1VmgojS+TYqgAFzeGlC9b3W+IaUytGQmeaVt3q7SD3H2058
 kNC9O0CRFUafZV1CzfmMfg9Lp9i1C0xblJMwe903rvExZciLQZffThg88YiIJz26iZAF
 UwPc/Cn7K+KboFLZaHUTZcuDTztAfoLzrWwfDo8VCaJz7Lgw3ndz4hno3cWavvTKyUtY
 O2J6CQZIAe/aCQ88XWwR29aYmvyjx/7jZKJV08xZikzYcadCfaIIyc36ha/wkBKzbA96
 g8h0uz0Pm2P+RVRUlxmZVg9sEMAfKc1AoJoPiqQU3HDUUSAslQm4InDoQ3hEHaNg51Iv
 X0sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713185676; x=1713790476;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QuhwG+KvJtimhWZKcxuFPkQLiPrb/07vzj/We9k9VWQ=;
 b=c4oWmk7ToxgP9uWvFeuSBXq6gGzclkOPQ+TcWWOA69gqluPOkkuJ+8H0cWGajFlkpU
 4VwMzwQvb0mhjwCp0x6GxU8ML7enU1Q2MmxovnsjnXCIoHp2OG6xAKl0Eh89ni2sJTPJ
 aKVdKTqy2a7cnTzhzIzcCE3RQccEGf25uxqOUbHATN2nG94jiprnCYhdVXPMdGlNlCX4
 DEL6QQz1gtozb7521An1QOznbspLKlkBNz3d+KA+AfBVTpZa30+FzA0KFxALuWdyLIJ9
 cqhzYn2oPq74D4wurN8sb3gsDqiOKkZ70qGajJGMOFtV1eWhKgmgFr1CSmBNQwRwNQeP
 GYpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9KwuyK/Ebur8AG9tfdyqib6FL/UmfakOSzVpQzM8unFyZNoIIaEp0TNoLf6ToFAAcf173TOACnM/Mj3rC66HHOfODptbMJ2iSr0gHgCMM
X-Gm-Message-State: AOJu0YwCqm4P3jGfMYoxdv6+Q+CWAOCigwCiVnxWqdWTEqBKMZX/BkaX
 acxhdb5lFWxm0vweF4Xv/3YLvRb80Gh3rr3io0sQ4DAdiSYtlzmZER77K+ajx9M=
X-Google-Smtp-Source: AGHT+IEPwOHcdqSsBfyETbLBvAQKa/2hIYBPy4DXezVg6jyWxDrnmy5YGJEuZgB1Fbd9ZZPXlD2MlA==
X-Received: by 2002:adf:e545:0:b0:33e:7fbc:caea with SMTP id
 z5-20020adfe545000000b0033e7fbccaeamr7391360wrm.34.1713185676156; 
 Mon, 15 Apr 2024 05:54:36 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 w6-20020a5d4b46000000b00341c7129e28sm12009728wrs.91.2024.04.15.05.54.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 05:54:35 -0700 (PDT)
Date: Mon, 15 Apr 2024 13:54:33 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>,
 Bruno =?iso-8859-1?Q?Pr=E9mont?= <bonbons@linux-vserver.org>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Alexander Shiyan <shc_work@mail.ru>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-omap@vger.kernel.org
Subject: Re: [PATCH 11/18] backlight: ltv350qv: Constify lcd_ops
Message-ID: <20240415125433.GK222427@aspen.lan>
References: <20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org>
 <20240414-video-backlight-lcd-ops-v1-11-9b37fcbf546a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240414-video-backlight-lcd-ops-v1-11-9b37fcbf546a@kernel.org>
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

On Sun, Apr 14, 2024 at 06:36:09PM +0200, Krzysztof Kozlowski wrote:
> 'struct lcd_ops' is not modified by core backlight code, so it can be
> made const for increased code safety.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
