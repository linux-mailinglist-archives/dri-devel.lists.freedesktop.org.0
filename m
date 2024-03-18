Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FA787E8DA
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 12:45:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA3E10F2E4;
	Mon, 18 Mar 2024 11:45:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TG/cBT6X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63DDB10F2E4
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 11:45:26 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-513dd2d2415so2665097e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 04:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710762324; x=1711367124; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=DAioQ/fXGesI6b7MLNItTlGNHaD8NUjTvUnQ6rS0NfQ=;
 b=TG/cBT6Xmdf6vnhsjoCsZsDIAX4JS7mputkZs4BB2irymXYy0DfhPdb2eQzRL/E53m
 QlVxs7Nm7qB+WaHe8b3jXmdOvwLqOE2JqZ0K/7iSnR+a68bcT+iALRTImCvU9DtT4sBw
 5YerG6Zyo1oBQQSuNZNHwVlb23yoeoDDya70D2+5GMHloZK1ph/3jSQbbnp2r+h/Xk04
 vnQMUPYbxQ0jeYGDLAFVfzVbG9k1UBAu8FRh+frOmJdcEPSzG8H9/PODdN9wTvwcGfL2
 vY7XWC8mzkhb3rIFKPuB96KvL1kD02ShL64LbAsY56Z7hQ0jyMfdEpNmgCYEBClQl1/m
 y4uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710762324; x=1711367124;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DAioQ/fXGesI6b7MLNItTlGNHaD8NUjTvUnQ6rS0NfQ=;
 b=dxO9qeFwLThLfgNwjahBXK4fqVDauKIjOeMj4kJpYt5Rxm4jz8xd7nao/bkxK5TDQg
 taGT8Osr3tvwNGHWX5x1aBXpd/5/99OFz9mgySmMN92WzcvpunOw11M9nWSqTkQrcr4A
 diSWQdGS5VJeY8ibjtvySBPCdbZnfFHIj8LhfLkhF5ADiXjBecI0UI60qPSdiXZumGCo
 cdmn7addkTeKccy8JgPPIULaXUxq+qlWcpmQIzA9QkuAtdF45JkZpueljzCnV5eTKDZQ
 yuFGhJmanN0JRGaoASb4pgFYu/GPEwDby9AnwgGM//811/4MC44Pq9gxsU0342muOtoj
 Y4Ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6ZoGE2s/v+fltYquFeXZng46AJ1+GwdlmP4TLORBmd9HSC2xE4PmYejMXK9iucIbF3rjwKt7LBA5Zuiw2mF/CP5cXk4EioPxmxJYpUnZR
X-Gm-Message-State: AOJu0YwxGoz01sZWQxhcbF0GFnsHw81sHM44HP7Y+yIs+spDwoT7jlzZ
 aIsenC4siHQegxpplb5Owxxo1Bdz65vykzqotOqEEJAgWPKGHZgY2iSLpmiBYX0=
X-Google-Smtp-Source: AGHT+IG8MlqV0IFElrl61OyL7fOfY/41Sw8w0N8TxSEMfr6QmXvjIx0dLThL/ol2w3e+kJgFYFOgnA==
X-Received: by 2002:a05:6512:348a:b0:513:ca72:7229 with SMTP id
 v10-20020a056512348a00b00513ca727229mr6293669lfr.69.1710762324024; 
 Mon, 18 Mar 2024 04:45:24 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a05600c3b0200b004142894df64sm976341wms.5.2024.03.18.04.45.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 04:45:23 -0700 (PDT)
Date: Mon, 18 Mar 2024 11:45:21 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH 2/6] backlight/omap1-bl: Remove unused struct
 omap_backlight_config.set_power
Message-ID: <20240318114521.GC16260@aspen.lan>
References: <20240313154857.12949-1-tzimmermann@suse.de>
 <20240313154857.12949-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240313154857.12949-3-tzimmermann@suse.de>
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

On Wed, Mar 13, 2024 at 04:45:01PM +0100, Thomas Zimmermann wrote:
> The callback set_power in struct omap_backlight_config is not
> implemented anywhere. Remove it from the structure and driver.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
