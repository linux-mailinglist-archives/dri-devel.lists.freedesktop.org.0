Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1E696A38E
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 18:03:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCD8C10E5E2;
	Tue,  3 Sep 2024 16:03:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="p8oSW0Bi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7024410E5E2
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 16:03:21 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-5becc379f3fso4823807a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 09:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725379400; x=1725984200; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TRpYNXWzJe9pe0LP0QmTo6lFgdRXfbDvjnKxBzy8RYs=;
 b=p8oSW0BiKbSlmA6ZcsX+8kiloifl6zwDTrm2BJ3+1pdE43LjJe3qsqTxsnc6wPVk9d
 59YTwOaaLTqJ5j7OWAhOvr0fOl+GoJc8Tx5zgGWI2wq6L52R2a8hpmcRJG82MkJc+DwG
 D/VjP/OhALINVN/cuVkQ8V1PhUK6vZvLYd6aMK1F8i8DqPNjeJHEB3zOD93yZA51HjLM
 OycwFM29s+d0hsY9iUNdTzQD3flAJM6TR91s16h6W3bA9wDjrHhqvZ3zeU+5I4298osb
 YS16M4JIazIvP6K4yiQSDgbmYaNAuXuX39cbwerkMsxFhrq9K9wluqJT+k+GAI26/TxA
 f/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725379400; x=1725984200;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TRpYNXWzJe9pe0LP0QmTo6lFgdRXfbDvjnKxBzy8RYs=;
 b=M33kLXTOEmTl3KfrK3pzOPCm0KekAxP4TJ0wLDlbTd9l0LVqlaoYuPwHXYyA+c/vvL
 EeMq5yDhelkZxZWFytz1ne32YOYgedkPyK25NGG7CYjmXFuCYqN5Gw/2xhmvu0P2Ac37
 +Nq8aGsqx7ah/Rj9cWtu0I6ZnO4OW1gYYFbptmzVV/InFYc8lM3zcCdUehJ9N0ZBRXK7
 IPEYSAeI8kJAzDE6+k7KWPHM2LpgnIOb0rKrpE9CFDGWtZ42XWXd/084bLVURK2M4iwX
 IHsJbHtcHCCadqPyCB5ztVaaqV6w9TbPOD/lNEZZmmJ3WTub24U96bQNnqXEtHM46ol1
 iNPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbyJn9ydZ2Od+zGu031AeXWs2MyiTbXXne22c7ncmyDgPX+4Gc9TFptO4WrpMwyic3NyWS11Yfn/4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyf8mhmgDUiDdhMI07iPGzFUmkoAfrOURVB4h60DDgxsrwpPda7
 UaGYVJcQE5gCUaW6NWAKX07efURouwC3pVqe3UT1YCHZKF6IhBjgA7UqFeBdpzk=
X-Google-Smtp-Source: AGHT+IHS1Rvzb8UqeT7n0pUD9/wp8DOfOLzfqdZFhgAaqZruEi5DiDVN2tFicLvnOryGuMKxr9gfgQ==
X-Received: by 2002:a05:6402:35ce:b0:5c2:7570:3a2a with SMTP id
 4fb4d7f45d1cf-5c2757dc9a0mr1279823a12.17.1725379396617; 
 Tue, 03 Sep 2024 09:03:16 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c24733a74bsm4490101a12.86.2024.09.03.09.03.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 09:03:16 -0700 (PDT)
Date: Tue, 3 Sep 2024 17:03:14 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Liao Chen <liaochen4@huawei.com>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lujianhua000@gmail.com,
 lee@kernel.org, jingoohan1@gmail.com, deller@gmx.de
Subject: Re: [PATCH -next] backlight: ktz8866: fix module autoloading
Message-ID: <20240903160314.GH12939@aspen.lan>
References: <20240820121628.42321-1-liaochen4@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240820121628.42321-1-liaochen4@huawei.com>
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

On Tue, Aug 20, 2024 at 12:16:28PM +0000, Liao Chen wrote:
> Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
> based on the alias from of_device_id table.
>
> Signed-off-by: Liao Chen <liaochen4@huawei.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
