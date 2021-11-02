Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55901442DC8
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 13:24:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F7E6E829;
	Tue,  2 Nov 2021 12:24:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E8186E0A0
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 12:24:25 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id r8so20177314wra.7
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Nov 2021 05:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=VMos205SOp2HQ94smQ+sF54W0/I8oBZxdhBF5kpjNPY=;
 b=d41n3ZgBBbe/wsv5BMyqnK5GyThrUxixLTmnx/SsWsa9G2Xm+euwqxG3a8llFuNbzB
 Tb3bgAOTWyMKQN8RbaDeXBaSsm5XqUrannJMnBNkwh5SJF8e9Li0135GqD6LziAXzPWg
 W0Wp2+qJb0vJ9ouxErlFR5NLuDfB81giKHlAzpW0mjTZr7Effblj01GwYUppzI5jWCJh
 SoudyMh4kO6Db+CfkBDXu/lNRLFVbl/45iN7vLGFh41rwwylc1auUmKxNWBkgyzKvR4Z
 j52VwNgjnUdR4cn/Ceip2jv/55KcBEZv63LzuceudPD8Q4yyLEZRv4TxxG7HEZDNM/TL
 UY2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VMos205SOp2HQ94smQ+sF54W0/I8oBZxdhBF5kpjNPY=;
 b=Hg+Gi3cRFivsN4IjBZX7AOEeTuknRkBJKOnvwPOgdEabTgPnjZf5rYTj8104+qYQ1H
 Il6d0nCnOvOY+DwfjLm+X3lByHPKkcGBLqsXzW60+v+lrGCECkrmFDBdkYC/hCc1e6OV
 KLcxktfGvDTjJJO73qinHdu0OH1nZbPb4tU++TGjdB8YuMj06BwS3lB1l7abS2eqBwyJ
 dRz5Hdoqq3QrUI2+64yQfhVYP/n/UFDuACGZRb5391u9G05HjHtHE7rdaRb0nq5tjDiL
 bWd+CC3JZ7Sjmxhte521QPZQiRsN5ZldR0suiq2qeVhnitmscpgyeoVgtaidNrlwcb/5
 kYmg==
X-Gm-Message-State: AOAM531Ophe99TZU+/I99Pj9h2m2gBOYJBCUz4aKm6yjUOyBHGCv1b/A
 qzgTnPOYHR//Ut9H42nhhYRJNhoWEC6Pa0y1
X-Google-Smtp-Source: ABdhPJx7JovvNqqEnEL3rG3Z4vrBFF0QUSDM0yb2GrZv+Cb1FGIi7QFLbvEGK9B9xsKYKW9gm/nTPg==
X-Received: by 2002:adf:e310:: with SMTP id b16mr47340847wrj.309.1635855864079; 
 Tue, 02 Nov 2021 05:24:24 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id l7sm11613856wrf.31.2021.11.02.05.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 05:24:23 -0700 (PDT)
Date: Tue, 2 Nov 2021 12:24:22 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 1/3] backlight: lp855x: Move device_config setting out of
 lp855x_configure()
Message-ID: <20211102122422.k3wzvvcng5ynwcce@maple.lan>
References: <20211101185518.306728-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211101185518.306728-1-hdegoede@redhat.com>
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
Cc: Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 01, 2021 at 07:55:15PM +0100, Hans de Goede wrote:
> Move the setting of the lp->cfg pointer to the chip specific
> lp855x_device_config struct from lp855x_configure() to
> lp855x_probe(), before calling lp855x_parse_dt().
> 
> This is a preperation patch for adding ACPI enumeration support.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
