Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE771889B56
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 11:50:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26D6710E733;
	Mon, 25 Mar 2024 10:50:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fsAWeP5k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA55510E74D
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 10:50:18 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-33ed7ef0ae8so2964998f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 03:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711363817; x=1711968617; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XpSiYldKH5rIkhRiCFgClqdFkLlO1k1YxneIR82EqBg=;
 b=fsAWeP5ka2s/0J9jl2AtY3YXFuUP9gD7GKWg/glD8dN+wiIsoYi+rElUFrcBOqfZ11
 atnEMVIVNgmnkoZfO6aU6scuBMyUWInzRLR2U4nrWfl8i7Gctu+MQBnRoMbt+uEykU+1
 DOhSuySk22V6Y3tS+yi80f87jV8UPkmjpPWWENRi3v7R52OlnjZh6oQxeMxET1kgcdzK
 8p/jiHhEGY5uvHXHNY92ruN4sbUlUfrnpjAZ2/gLGU7e9uOzlw/2g56PT5AK6Q+16YtH
 V9jZCUsQEaw0Q+JdOD58XVcqrPIBGOEK7Xd4/DLLMhGhu4MWjMPz6/pRveyCdUsj2krA
 njxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711363817; x=1711968617;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XpSiYldKH5rIkhRiCFgClqdFkLlO1k1YxneIR82EqBg=;
 b=ZYlS6WSEcU1TLUIx4+F6uEvcP2NAW9I9Xgfrj4LXx3jVN1TH9uzAoZKxGP2xhF4l8k
 I9hkOkQoDlOLlgx8URa8/dPUARZiHRZGOrFCSMDyIyv942XmZylHRoEnL2X2BK8pK5bw
 9+5qOFC0XqZNcBd6LwCrKCVqVIBHXtobBO+BB7ldKp8/bcIzs30r9frUlK1mnVi3fOIC
 RH6Qq8v1RgLtGOYeRhVpQUiB64hmh18ec1tGzjjxJVwLvKDctorudnVRxalyomDYVH6n
 gG/SjExuCb83pFL6pntF+owyJ2RjsK8OV+LX8wTDuEiDb3btmESP7egcXCQMCn5F4c0M
 sdHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9bJcuCXfN3aPnUQxFmz+kJ3QjFOhdd58JQqeG18v79MVLdDCvViEaOrVlQSPEHVRxWRorXnKTry6TkF9wS5hDOQBKlRDwt4Hd+tMMl9DG
X-Gm-Message-State: AOJu0YxtR4xvS272iPUmHj/5MPJp1RM9G+Z7+OUrtF11m405ANYs5zY9
 e17XHrzuEHh8ijyAMVPy6PkC8UtuLrx+qSKFnAUOpUK/E6GM4GZehValJCf1bY0=
X-Google-Smtp-Source: AGHT+IFuSkdlp7LEl6nvNwBzRtkkJeI8XfwfHdqVCFMNn64T6V7hkopceJ42fI6HjzHaQgPcNU0RLA==
X-Received: by 2002:a05:6000:1b92:b0:33d:2d07:b567 with SMTP id
 r18-20020a0560001b9200b0033d2d07b567mr4711630wru.24.1711363816892; 
 Mon, 25 Mar 2024 03:50:16 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 ay9-20020a5d6f09000000b0033b87c2725csm9338898wrb.104.2024.03.25.03.50.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 03:50:15 -0700 (PDT)
Date: Mon, 25 Mar 2024 10:50:13 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/2] video: backlight: make backlight_class constant
Message-ID: <20240325105013.GA182091@aspen.lan>
References: <20240305-class_cleanup-backlight-v1-0-c0e15cc25be1@marliere.net>
 <20240305-class_cleanup-backlight-v1-1-c0e15cc25be1@marliere.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240305-class_cleanup-backlight-v1-1-c0e15cc25be1@marliere.net>
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

On Tue, Mar 05, 2024 at 09:21:17AM -0300, Ricardo B. Marliere wrote:
> Since commit 43a7206b0963 ("driver core: class: make class_register() take
> a const *"), the driver core allows for struct class to be in read-only
> memory, so move the backlight_class structure to be declared at build time
> placing it into read-only memory, instead of having to be dynamically
> allocated at boot time.
>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
