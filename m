Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FA1846DDC
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 11:28:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82FE210E179;
	Fri,  2 Feb 2024 10:28:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bx1Rkln3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4167410E162
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 10:28:08 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-33ae4205ad8so1228108f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Feb 2024 02:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706869686; x=1707474486; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2/Da7iSAM+hSEJQc2pdJinoCauC0NHyaf2M4fIa9JHg=;
 b=bx1Rkln3jBKYJwPADTv95KUOf0EEDlqycwHVF0bcqOeA96TpCd8xFJi6o8erx5LEtb
 0a3Bxo82HUZ8sTVNpuiUfE1t81rRpAYwuE1x35nIHWr/J6iVH980n8ZkTAv6ruoVRB5I
 hmZLSS+yr4BAvrLNwkEAh1lGJg2xcV3Yk75gskXoYKXbTgt7ecxYIE+gPbHOAPEkElRp
 tA4qHfhZ9OB4A7PtFdQsPiiqFcb06BqyYSYgjkgjKkjimW0yRiZVwvkbxHqKU0Iw0wjT
 AU3pcZiKSnTpxKvY//j0Gad4zF69EoVFeAuH0z0NO8s1b5CieR6uJMIpSFUDtNC1EFHU
 fd5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706869686; x=1707474486;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2/Da7iSAM+hSEJQc2pdJinoCauC0NHyaf2M4fIa9JHg=;
 b=oLmSSaS4vf03A76dMrUIMV12+zyu4MmwnUjU3OOm/M90suX04ul1uE3vi+dVJEi6ng
 V8wrO9y3tYlM1IwZtNrelIe8gcx84x4PF/ABPTj6xUYGcVzdMJc+zMPSyXiUASXLF3Lq
 7EzkB2jHVaPC3lJJbthnXhXtkiI3KPsU6E/CgQHoLdhEZ3ovrE5ciMBSqGIc2g7BLY1a
 2TJOEPDNLv/X9fm2iNfZ4Yqsd1o+3tGtbVjYDfeO8LafqPwhhyXvcqz3z2O4B8dO2DOb
 V6lTyM2vETvkLLgRrU2xAEkHmbFlfe0tSZWVKnzyYGuPjith+Q+O3gDZoJZoCrMSOLls
 xNyQ==
X-Gm-Message-State: AOJu0YyO+MD6WqGeWGXlz2gS3xWjL32cz3NRksFyqZKWaTr3Tvye5Wph
 zrooqX225hezGmQHb3bbC0dDqwRiYGJikLDPvlouE4vxhVrDMSSeZapUUDWqK5o=
X-Google-Smtp-Source: AGHT+IGMXT3XWWEvbzuwMNynntW34ELZHTsj92DyKaerKBIwfmX+aA3iAPap8FTJGJYfV9xreKUstg==
X-Received: by 2002:a5d:6906:0:b0:33a:edf8:b8e6 with SMTP id
 t6-20020a5d6906000000b0033aedf8b8e6mr944364wru.58.1706869686647; 
 Fri, 02 Feb 2024 02:28:06 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVJu5T5IJIGw3K95vPY/OnQFF082/yxjTHdqHpiKr6aXt5Wqd7f0jz3eHk2ffINlj212dcbw3Ip2XBI4t96uchzHDi8w6ar+PYoGSp9EsKh8sKpBWKkrhvMyT58AqoEUM1Qdr/nkeXHcg9fW5bM2QgwXF+x3B4WAS33wCHMmd8KJnJ9kC/ag++Jrgq8K/gFt/7HEPY2VHx1lw39QfN+IRw+U5S/z/2TKmAkF8I9LARFZ9J2ZvCJ2WYi6vmrg4dIKg==
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a05600000d100b0033af350fb88sm1605304wrx.25.2024.02.02.02.28.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Feb 2024 02:28:06 -0800 (PST)
Date: Fri, 2 Feb 2024 10:28:04 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Flavio Suligoi <f.suligoi@asem.it>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v2 1/3] backlight: mp3309c: Make use of device properties
Message-ID: <20240202102804.GB373571@aspen.lan>
References: <20240201151537.367218-1-andriy.shevchenko@linux.intel.com>
 <20240201151537.367218-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240201151537.367218-2-andriy.shevchenko@linux.intel.com>
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

On Thu, Feb 01, 2024 at 05:14:13PM +0200, Andy Shevchenko wrote:
> Convert the module to be property provider agnostic and allow
> it to be used on non-OF platforms.
>
> Add mod_devicetable.h include.
>
> Tested-by: Flavio Suligoi <f.suligoi@asem.it>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
