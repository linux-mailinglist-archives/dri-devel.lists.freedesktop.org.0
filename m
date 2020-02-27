Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0D21711E5
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 09:04:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCEE86E4EA;
	Thu, 27 Feb 2020 08:04:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D05676E4EA
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 08:04:27 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id n18so1874206edw.9
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 00:04:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vnXqlO5qYygnxVPzTu5HIo1r14nORQF46kzveUPjQ8w=;
 b=IQoqOmV7eu7+QTGNIvB3/D1K+lp5CRab9AMVUEJx7m4capvA/ML3TlnU1kP33Prl+l
 VoUrVlmJO36os9N76aC2cGmkyj7b2EJZmFk/KRwUSBRIPDVqHLHifyP10Rel+UdnPa2H
 o1LIn+F4EkXBLTFugEgg9b5GxC4b8eax25kDg5fn2uKqhywJUyo+CdmhQbyhD5LoYKDQ
 FbClY0zqM1ybiQKHBV34VvBd9ruOtaxIgsQh3spDWv5DLeup+k1L4QlNcCsyJuxFzaGV
 mQVcllNZzryUFq7Zw7WCkYN9qxVriwgIKEaJ3FeK8AgXRYXG+KDA9zyW22q1uwrTF4eQ
 ozuw==
X-Gm-Message-State: APjAAAWkGpJAoWcT/btXDWzmfLOoog+92Ii+RjLa4H7aI6/mdYP0vtHM
 loCt3gDQjxLYE05XRWGbpvd9yNxhG+4=
X-Google-Smtp-Source: APXvYqzlarsX1ty4kym88bwhoDlOh9LwG5i9aGRqpmdhVDmhhTW+frMYte2HrFnOV/lW+TS4Xs2f1Q==
X-Received: by 2002:a05:6402:16dc:: with SMTP id
 r28mr2020730edx.268.1582790666414; 
 Thu, 27 Feb 2020 00:04:26 -0800 (PST)
Received: from pi3 ([194.230.155.125])
 by smtp.googlemail.com with ESMTPSA id q5sm283970edb.70.2020.02.27.00.04.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 00:04:25 -0800 (PST)
Date: Thu, 27 Feb 2020 09:04:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v2] drm/exynos: dsi: propagate error value and silence
 meaningless warning
Message-ID: <20200227080423.GA7853@pi3>
References: <CGME20200227070649eucas1p15dcf4847b369fc20bd2a96f697b1173b@eucas1p1.samsung.com>
 <20200227070637.4115-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200227070637.4115-1-m.szyprowski@samsung.com>
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
Cc: linux-samsung-soc@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 27, 2020 at 08:06:37AM +0100, Marek Szyprowski wrote:
> Properly propagate error value from devm_regulator_bulk_get() and don't
> confuse user with meaningless warning about failure in getting regulators
> in case of deferred probe.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> v2: rephrased commit message
> ---
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
