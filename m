Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCC99D395A
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 12:20:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 000EC10E718;
	Wed, 20 Nov 2024 11:20:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KEHOlGnk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64DC610E70F
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 11:20:54 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-43161c0068bso37614115e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 03:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732101653; x=1732706453; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=DH68XPkDBDr2SFdw3UbWf74PCLjCq+oTGZBI03sAE6E=;
 b=KEHOlGnk/ncXdFwjXaoAVDuketyXOrz0RvwiSDu8YrKtum3emHbLO8dvldfvGSV8jL
 7MVpSm4RKfTzPF4jwdDYeSWrlhEopJvoc/ASjH5nkrTAkeB/5dcDTzDexwoZQ4Nv/32W
 gABr18FT0SN3zRNRWPPssG1KsGXi/HFhdYmlJnusJIiqQvhwrs3hQF8ZDWaxo4NGZH+V
 uJinEPs0ThGVl8be97deEVoxPwL09CPoojmUS8g3pqXobk6Nd+QXD6CJSXRQvEkxJors
 Edfc379d4MJm5B53om9n9mNGbxSfAn/F75y+QU75CtHyU9ELkbj+eEn3uI8mSh6WYm2h
 hShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732101653; x=1732706453;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DH68XPkDBDr2SFdw3UbWf74PCLjCq+oTGZBI03sAE6E=;
 b=CRfXRdM3MTrz08syg+UNNFI7dY/FoWr2NJIAORgGZ+kF8M2ZnK3BgzN2rWONJ3ogqO
 6QF8yTRNeIFrqUWIakf+faL/U/i1rjB6yh97UUktx4ORN7W2b7PThVrsdlDVJ1+oSliO
 bBMuczRLucUt1HGEoUA4UZAZnRclm6ac/0+L7oDEI5w2j9jZKKB+Q1VM51fhdYPGN3bq
 z6ADBvezszZQYF0+311Esk09vo3MNonl1clM/ZzGQ3HhndJTYg3bnz6X1qsMpJHOHZ8L
 reuCTJXJIfMOOnpPj8/pIweTwCrpOCnNOwu5AzqYrQLpr0zpkWL+cAwQ9AL15ItOtHQB
 P5xQ==
X-Gm-Message-State: AOJu0Yy04jkPra8AQeBb6m5NBm094BPOthRSsT28R5u/HJ8F8sYojis6
 E50PyX5+UlsYsLBueYbYIZJW1i4pvAMuhWXm5ZQ3ZyuQoE5twEXhOFzwewpeGNs=
X-Google-Smtp-Source: AGHT+IFoW0aGrY44f798dMADxQS0s2HP8FnMFtMgd/GYwO11/AYw3oJvuDLaWXWp9ideXtqi2/lvsQ==
X-Received: by 2002:a05:600c:5250:b0:431:4f29:9542 with SMTP id
 5b1f17b1804b1-433489970efmr19437515e9.6.1732101652707; 
 Wed, 20 Nov 2024 03:20:52 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825493ea20sm1778948f8f.93.2024.11.20.03.20.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2024 03:20:52 -0800 (PST)
Date: Wed, 20 Nov 2024 14:20:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Paolo Perego <pperego@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>,
 Jani Nikula <jani.nikula@intel.com>, Riyan Dhiman <riyandhiman14@gmail.com>
Subject: Re: [PATCH 1/1] Remove hard-coded strings by using the helper
 functions str_true_false()
Message-ID: <4c8f5e95-6d33-49bc-8af3-e6dec2dc7c62@stanley.mountain>
References: <20241120093020.6409-1-pperego@suse.de>
 <20241120093020.6409-2-pperego@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241120093020.6409-2-pperego@suse.de>
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

On Wed, Nov 20, 2024 at 10:30:20AM +0100, Paolo Perego wrote:
> Signed-off-by: Paolo Perego <pperego@suse.de>

You need to have a subsystem prefix in the subject.  The subject is probably too
long as well.  You need to have a commit message.

Otherwise, fine.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

