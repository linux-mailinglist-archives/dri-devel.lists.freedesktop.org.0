Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA85906A3B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 12:42:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BCF310EA1C;
	Thu, 13 Jun 2024 10:42:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bkp3uAYj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1050210E021
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 10:42:34 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-52bc335e49aso1085724e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 03:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718275353; x=1718880153; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=PF3NyOpnlOW2rshocUIQBURkaLEe4WA0cmtD1teWgII=;
 b=bkp3uAYjaf6zLZYC3/8XBq+xpLzZes/eTF/9JAmeALyJt8SNOKR+yj2W9OWjw0LLU7
 pLMsFtPTQZCVtLk3G69qwLtnzbCCxQmNGauLE8WYV0LtoWCRLcqAf76mxtZlMw9kFL4U
 ZP+aLZXaTfsHxZel9asZisCezQs+YBZF8axxshlHl9H1whtINlN0umxmhXZXarVmaHR4
 WexLXB9LsG6nwFNVuomVkyNS0qeOiGA3NHGZXkbmTMck3/HW1Vg5eW+rBMIESNDIR3Op
 nMu1zsE/aKAiB0tJmSlqs0llgO2tvxJPCAMnBWY2MvzY3hyk5q/1NrvV949/DivqrPv2
 n03w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718275353; x=1718880153;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PF3NyOpnlOW2rshocUIQBURkaLEe4WA0cmtD1teWgII=;
 b=qGGCZSDHJZf9hSzVk+UVOunx20akHBhq8a8Z5NU2wPmFNTcpv+nqCXzMjQELqYYRzY
 HKZJwEWlTyUZt6iV1tYg8XzCl1ORYHgZN/+iPDrHWnVkO/6N0JCkGBOF178FLh5Q8ZiJ
 ZMe0O/MCHNScz8daYkrDrUBeEswKNKfOi8mOb77w7rEy3ZN1VwtLa07z4/pGgoSEduyY
 rdIpIODRW+fZJFJhrxdJoBIEW6rEvKmGer/wbYuh5Vyh5HY2jG9XdfrbeO9EKdPjSlDm
 F72EMjUgmcKDaG7lvlEkennU6Q43De7yNfanoIs97yUd28V2c7apwfDPolWo9dPMQhl0
 vDaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlsmWYxR49wRdoDLSXMKB9NPVyM44r1e3anBphFe3B0h3nFF2kIZYHYMwF/kWlb1HLb1q0xfSZJKxpyYaUKYlZxctr2gjjQfP8Drx58JIi
X-Gm-Message-State: AOJu0Yzjs7thMiAW3MrLbFFyVXLvnqw8mhbJZX6dfUIN135hUcbSw3EA
 oV7qdFYdYSRc/bBitRVulAt2k0PsUNUIaGAXH8+VlsnYlUWzCB22ZZRIH3EO2xo=
X-Google-Smtp-Source: AGHT+IEv2lj7+kQqzbSuf/t/o/PixULLMReSLMuWfs+AvyIbe7S58yyPAAOAXLoL5kl0AJEYpC+T2w==
X-Received: by 2002:a05:6512:1245:b0:52c:95d1:87ae with SMTP id
 2adb3069b0e04-52c9a3b7bffmr4087081e87.12.1718275353006; 
 Thu, 13 Jun 2024 03:42:33 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca2872388sm156786e87.174.2024.06.13.03.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 03:42:32 -0700 (PDT)
Date: Thu, 13 Jun 2024 13:42:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: linux-kernel@vger.kernel.org, sui.jingfeng@linux.dev, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, mripard@kernel.org, sam@ravnborg.org,
 jonas@kwiboo.se, 
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, 
 airlied@gmail.com, daniel@ffwll.ch, a-bhatia1@ti.com, 
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 2/3] drm/bridge: sii902x: Support atomic bridge APIs
Message-ID: <klupakbb6zgyctjtrxqbubc7qvj2c4vp4q3o7hqpfzic6dapjt@7kkl3g3sjrsi>
References: <20240613083805.439337-1-j-choudhary@ti.com>
 <20240613083805.439337-3-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240613083805.439337-3-j-choudhary@ti.com>
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

On Thu, Jun 13, 2024 at 02:08:04PM +0530, Jayesh Choudhary wrote:
> Change exisitig enable() and disable() bridge hooks to their atomic
> counterparts as the former hooks are deprecated.
> 
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
>  drivers/gpu/drm/bridge/sii902x.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 

Suggested-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
