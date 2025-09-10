Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E04F9B51444
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 12:46:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E88310E089;
	Wed, 10 Sep 2025 10:46:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Xr012LlV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2028B10E281
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 10:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757501170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ish3TOdF5itkEce/x1a+uOeE11uGbtv2vXkIso/jAMo=;
 b=Xr012LlVME+G5KE53VkVKcXsTgQr7rHHsplHBscAVTHICNCy0lKfEu0DfpSAbIHhkRFyPd
 TC2RW59ixnnXpAahfQOPEFfEyUFq792/LkiOY6hD14X5ovve2ons0pgQDqTz8pV3YBjI6e
 VwH0UgRG9v/g2qWFeFDhWAgnynxC7/M=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-137-e6_0C7ufNK-gXG1CuQmtrA-1; Wed, 10 Sep 2025 06:46:09 -0400
X-MC-Unique: e6_0C7ufNK-gXG1CuQmtrA-1
X-Mimecast-MFC-AGG-ID: e6_0C7ufNK-gXG1CuQmtrA_1757501168
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-45df7ca220eso1467215e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 03:46:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757501168; x=1758105968;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ish3TOdF5itkEce/x1a+uOeE11uGbtv2vXkIso/jAMo=;
 b=h7gM/mgB+nS4b5Lkec8WUl73GOdf6iRkbAaA57H2C7tfK9eAUO7Ck2ppJEiuHAKBH1
 tkvOi21T7L7dUPz+PRCKOWVCyLwdCtm8LLT3saX1ocx+UgcH2/TX025MycIEKMN2j8e4
 8C/sYzo2LMByeWiUI+UDDBr6BT8UPrhLhDD+CIRiR+Do2GrumJkCPuMMU6xv1sSqB3ph
 SbI46jazoU6aisLUhs29bUjZ1aPoiiZyLar0NXHbY98hmhu4zP0DbUiN0PK1sp16F1Db
 W3zFJxpKj9m0RkdskaGfa02K686c3De0W8ymc9Dnqv+skaa30CShaRXGBbLEDRYpJciQ
 SSnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6iiET5CnV+5+Q/1oOq2jySIMWzc6NCVGcG8vfmtZonlxWW7Sp6ycHnt+J4KKf+sfhzn3xpAHdNWU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNyqUFz+5VO+6ajfhO+OZHoJxASyyjdbX/0WhlwiVITYx+R5u5
 0csvK6bjjoF9X5sNC/Gix5VRSjrvFpQLBdOQ/PZdRsq2cStkeZKSFrrU9UCm+DymCM9xlim7UXO
 TeAKJuMqlNxzA8qhrPYu5LP5sTx4pf3EYniZIKBUvzQoXc4JvSUlKn64dZOYv7FbBnwho9Q==
X-Gm-Gg: ASbGncsZ6nNHV/a3ilO+hA5mwD4IlVRixXtrj9jYqElQU10srK1mpUgJkeRuEaYUaUo
 aL4L2dQZSgo4eoxKya1CtmRsF5t4ouUGv1M2+2FMnLSZzajb00TIuk9RNBetBePS5PL3Salhspv
 Pv0fD0OLSo9u+T1DzQDv7nyfTZPztA3prx2BHZhj589llucxixFnFnMWSKk9Sig0Q6hvR/Fgt/m
 Ku1jD/cQyRoGc7b5jR9dou+aP7OGhK1Di3mYS04fytnNeepwCJ19SgOnUwz+fBTok8bAs/AeWP8
 aT9CgQ4h6aXUkWAzn8zV/b/j1NN/09PHc6xer11uirzNuEb6/xz9/1Si7ICW35PWmc8W2cxBFWp
 y372w9Qa6xDgTMg8gpmjyzQ==
X-Received: by 2002:a05:600c:45cc:b0:459:dde3:1a55 with SMTP id
 5b1f17b1804b1-45dddec78d3mr134563125e9.24.1757501168141; 
 Wed, 10 Sep 2025 03:46:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE41It7Gch3Cc7HmzlNTf33KcOKcEcqR+1x/JRLAyd/4r51Mnyjg/51A7Gwi/T9TvTKWE/bSA==
X-Received: by 2002:a05:600c:45cc:b0:459:dde3:1a55 with SMTP id
 5b1f17b1804b1-45dddec78d3mr134562745e9.24.1757501167668; 
 Wed, 10 Sep 2025 03:46:07 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45df81d193esm23564835e9.6.2025.09.10.03.46.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 03:46:05 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Brett A C Sheffield <bacs@librecast.net>, stable@vger.kernel.org
Cc: regressions@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, Simona
 Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Thomas Zimmermann
 <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>, Murad Masimov
 <m.masimov@mt-integration.ru>, Yongzhen Zhang <zhangyongzhen@kylinos.cn>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin
 <sashal@kernel.org>, Brett A C Sheffield <bacs@librecast.net>
Subject: Re: [PATCH 1/1] Revert "fbdev: Disable sysfb device registration
 when removing conflicting FBs"
In-Reply-To: <20250910095124.6213-5-bacs@librecast.net>
References: <20250910095124.6213-3-bacs@librecast.net>
 <20250910095124.6213-5-bacs@librecast.net>
Date: Wed, 10 Sep 2025 12:46:04 +0200
Message-ID: <87frcuegb7.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ROTQ_Hz9cvHmW5Lmz1Pv-CtPqoSGweHPv8VT7oMxLVQ_1757501168
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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

Brett A C Sheffield <bacs@librecast.net> writes:

Hello Brett,

> This reverts commit 13d28e0c79cbf69fc6f145767af66905586c1249.
>
> Commit ee7a69aa38d8 ("fbdev: Disable sysfb device registration when
> removing conflicting FBs") was backported to 5.15.y LTS. This causes a
> regression where all virtual consoles stop responding during boot at:
>
> "Populating /dev with existing devices through uevents ..."
>
> Reverting the commit fixes the regression.
>
> Signed-off-by: Brett A C Sheffield <bacs@librecast.net>
> ---

In the other email you said:

> Newer stable kernels with this
> patch (6.1.y, 6.6.y, 6.12,y, 6.15.y, 6.16.y) and mainline are unaffected.

But are you proposing to revert the mentioned commit in mainline too
or just in the 5.15.y LTS tree ?

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

