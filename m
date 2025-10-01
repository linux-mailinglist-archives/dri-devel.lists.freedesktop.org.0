Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C66BB28C8
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 07:43:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A44A510E775;
	Thu,  2 Oct 2025 05:43:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BKpBE63+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAFBD10E0FB
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 17:19:05 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id
 6a1803df08f44-78defc1a2afso2055536d6.2
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Oct 2025 10:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759339144; x=1759943944; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=zopXUsDspNb1mWWJAWkCzCfsfjyf3UGPV6M0TUuo+6k=;
 b=BKpBE63+yNSqhBrpVI6JVevTGOzx+9THB+TLuxi2T70FctfJZ48JNC8+ixM0Ahid4g
 G+3QWy+o86R1raGAU6NXrAahWRQVl8J2BBz3kCcB3aCkpGXyu/HXIGi/Ki2p/WOY6WJG
 TNT0qO6BrqgbrHeeV+f7rIGmGGCSw0STJbY15yEr8SnmSXEYonI31vj9xdndlyCFA3tV
 Oqj+Ccc1TpMlewRHecHvard16PML+f/k8kATWLHE1985o0Dd2Ose6GVRveJ3phnZRCeO
 A9ntkUs6lh7KDyvgptiWZzgjP/ZSWb/gf2hbDkmuerpfrdlhEAcmDgO1t1OPMKL41W2p
 WI7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759339144; x=1759943944;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zopXUsDspNb1mWWJAWkCzCfsfjyf3UGPV6M0TUuo+6k=;
 b=lUFHK8c3gHgYuhDAtQYeTNxLfF1yiTKR2gtFTvPEfsWubNTVzOaXuHBO2Q76TmOj95
 TDKT7eKtgHQv8RzdBKQ3Vmz0WhI77YIx5W6ILK+GuNSj4J7WrGbU9IUlyYO0QnvBO3gY
 lO2jGHHx/LVufXJMbDJ0FWwfjm5wOESOcrT25wzyOQq9YCjObjKGTuuGSla2oO67rP7X
 29QRjqLKmGZ6H0Cml5yyfvqzKjhSDHOWNY6gdF5nPKfesDp/l9btDtKBTd1pixXJEfHN
 l0NWGY3j8uDTvGZZQD3NIqS+o1Y7b65IjNy/V89Vn+SqZHzs+7fRq3Nvqe7mpnbHdoBR
 W93Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4S6pCqskH+Kv7xtOJmA79DjekPDaApFGKxh/97cNs9P9gywMUK3ORsBpvqiK9kzYrxFdRU8Jqk0c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkE0OGFu0SjjOex1rK3rlVlbdm4xNKHpnDFVCuHeSsdJaFTWBF
 Y8NHZLQ6PBgT6M0+W7dyfjpQESwqKaGL8cw6KyLKjqqxM8+61NdRF9OFnvTpgnlZ
X-Gm-Gg: ASbGncsYjyuFy5uGpq42uEz+LZKRaGg890lIjC3n27IYWxSHN+ZLNOmd+W5J3M27/li
 R3g9ecI5Bvltud4TyMla8V2B1RG8+qylCWkCQBMMT572XO4dum3JG8ZAyoPn1qpKQz402R0ECmc
 /UNpVZCkUPAo61WshwtEoaNInU6qMPORiCMhfPpPIPuGHW0yObzwu+r2M1WBkn7TEtT5Th0eyw2
 yTgIYp6mNxm5eLyvf49ZfUNJmDta9AQJ/JAvQvuNVRPY9IczuPMJfJ9xboQkxNv3gEYUdoUgv8U
 eNbjIj6OAMl5xMFwRh7Gb4cZ1PhhA9c8acnQJjmgHMSsJoVH8YnUZxd7nDQfux9AdcIk/qLwiZC
 au5Kfxha8lh/vAY0GJwBvCf+K1mrNnK6eKCjmw23jhA==
X-Google-Smtp-Source: AGHT+IHQhkaGCWCGXg39uCPJptTD10njVMqUQyeE04a/E92c7P5/6wo4qNH+/bkTJGYyPUCAdw9t3w==
X-Received: by 2002:a05:6214:f01:b0:78f:2eca:2000 with SMTP id
 6a1803df08f44-8739be1b61fmr54866566d6.13.1759339144483; 
 Wed, 01 Oct 2025 10:19:04 -0700 (PDT)
Received: from arch-box ([2607:fea8:54de:2200::9c5c])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-878bb53e2c5sm1905136d6.25.2025.10.01.10.19.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 10:19:03 -0700 (PDT)
Date: Wed, 1 Oct 2025 13:19:01 -0400
From: Albin Babu Varghese <albinbabuvarghese20@gmail.com>
To: Helge Deller <deller@gmx.de>
Cc: Simona Vetter <simona@ffwll.ch>,
 syzbot+48b0652a95834717f190@syzkaller.appspotmail.com,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fbdev: Add bounds checking in bit_putcs to fix
 vmalloc-out-of-bounds
Message-ID: <aN1ihRfB-GHTEt_4@arch-box>
References: <20250927075010.119671-1-albinbabuvarghese20@gmail.com>
 <cb00a5e2-6e50-4b01-bcd7-33eeae57ed63@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cb00a5e2-6e50-4b01-bcd7-33eeae57ed63@gmx.de>
X-Mailman-Approved-At: Thu, 02 Oct 2025 05:43:07 +0000
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

Hi Helge, Thanks for the review.

> I wonder if the image.height value should be capped in this case,
> instead of not rendering any chars at all?
> Something like (untested!):
> 
> +	if (image.dy >= info->var.yres)
> +		return;
> +       image.height = min(image.height, info->var.yres - image.dy);
 
This looks like a better implementation than what I had. I thought it might be
better to skip the entire row instead of rendering partially. I’m still new to
this subsystem, so thanks for pointing this out. I’ll test the suggested
changes and send a v2.
