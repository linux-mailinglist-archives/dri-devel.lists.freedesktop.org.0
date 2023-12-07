Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF8D808A8A
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 15:28:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9301D10E19A;
	Thu,  7 Dec 2023 14:28:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5B5210E19A
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 14:28:48 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40c0fc1cf3dso10606745e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 06:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701959327; x=1702564127; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=siQf2yGcuKbINax/017dn/aIzi9vyOaDmow1c81WvIo=;
 b=mGmxV53JHNK7u1u+1RVND5RLyS000aMOIH4K14ae8A3EAqkvc27L4DyvsOAF8dD6zy
 VZQ/960LXKjZhmNGxTKPYiJXg2L7SUVEAduWClB4U+rFXwnjkQrsVQcOPG/a97Pt4HDQ
 wtnI2PX/TzJa2sNSXryWesjEe/xl8069sUnRNxw4Ss6mzttEqNZyz18CDjZyQHKO0iSC
 fi3gv5cElyTdRG0UqFoBQbMzt2GiZxHRmU0hSRqDW/XpTGDuLPyCXDy/kECSbeQ71CSj
 mF83VleHXg8GNt4q5K2Zfh2dLLC8rhdbLCKYBW17xNNN5iu0VMrNfYTcDLXHyRkzlRYC
 52og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701959327; x=1702564127;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=siQf2yGcuKbINax/017dn/aIzi9vyOaDmow1c81WvIo=;
 b=G/8BhQOYlXqi/orBKzMNvRlQBSMkT64qkgbmKt/cww4FdN+xrJu8XdkQ2nllQCzDKV
 z4RWSwhyD3jDhvx59Td5YEVfybPmQKU9UeFu+qViLGq72iG6EvSe5tDYUPBr0gXeArMS
 tt8mTkkCqxqX5iMgljZ/+Bvrojm6vcSNUmwcz5tTGD6rLmSASEDdDo/UsHz4SIMVYJBA
 dOnmV7Au6zN1xBoD3/3lzQ/Zr9/HZRDcvnNHo12yZt6/ixCzLVTu6CFP5lvat8ZuIPU0
 wNR1H/ddqt1+rjMx239arhwBhP7FIVeTccheDg3PrzW28KtOK7dTGk9dGDRjGPCkzbcc
 sKrA==
X-Gm-Message-State: AOJu0YxIlHzRujW5r8bKoZZCoF0mJloN7avGbHmnwTBXb41gQV34jK3W
 EmpLrnWN/zOho1asMnKNT8HaRQ==
X-Google-Smtp-Source: AGHT+IG3fjLcVnbgN/JM62HKhQ/CpsfIghOkkqs4Bf6SrVZBPi1Z/DUH73yzVRZSk42YeYyrPH8xFg==
X-Received: by 2002:a05:600c:a43:b0:40b:5e59:c58c with SMTP id
 c3-20020a05600c0a4300b0040b5e59c58cmr1686676wmq.182.1701959327359; 
 Thu, 07 Dec 2023 06:28:47 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 b16-20020a05600c4e1000b0040c310abc4bsm216659wmq.43.2023.12.07.06.28.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 06:28:46 -0800 (PST)
Date: Thu, 7 Dec 2023 14:28:44 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Su Hui <suhui@nfschina.com>
Subject: Re: [PATCH] backlight: ili922x: add an error code check in
 ili922x_write
Message-ID: <20231207142844.GA151182@aspen.lan>
References: <20231130051155.1235972-1-suhui@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231130051155.1235972-1-suhui@nfschina.com>
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
Cc: linux-fbdev@vger.kernel.org, llvm@lists.linux.dev,
 kernel-janitors@vger.kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 lee@kernel.org, ndesaulniers@google.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nathan@kernel.org, trix@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 30, 2023 at 01:11:56PM +0800, Su Hui wrote:
> Clang static analyzer complains that value stored to 'ret' is never read.
> Return the error code when spi_sync() failed.
>
> Signed-off-by: Su Hui <suhui@nfschina.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
