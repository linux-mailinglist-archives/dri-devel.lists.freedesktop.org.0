Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 805A63DE44C
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 04:18:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BA5D89D4B;
	Tue,  3 Aug 2021 02:18:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E00A989D4B
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Aug 2021 02:18:22 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id t9so24197845lfc.6
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Aug 2021 19:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p0Rg8uoQAdCMqNvWG4KJ4Lml0OYquOl0PzeY+NghgIs=;
 b=rJeSRXesNgqD/ctsEcHci3GJIr+ZkXbWSPIKY0cGUASov47tyDQAO5lBimd0asmIsL
 +4rmPRHpsXvlmc0U/W2TuK9bg1MhTeOs7bo8xF8pbSMAURvWUezdYoi0kluk8bQwRucC
 sVI0o4Nkcozxs0qQcniS007Mw17HutvMJYPWo5XFmdPmurdTI4nsoUb6cEW5QHA4gsJ4
 MY2BCxRTcVYUddEibbqdE6MT3YsNNPvMNUJ4G0z+qJSPoRFIEO4PXKaGHgQ81CJhLojN
 HoAJQ0Sf6F0cfaImhnZg544kzLmUxPDV3XS8Ilm6pjvOYyzbU5onvpQy6uTTI+FiM5Jk
 1R8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p0Rg8uoQAdCMqNvWG4KJ4Lml0OYquOl0PzeY+NghgIs=;
 b=oTEm1QsJX16lGs4ogPBbiSajbRqGxKFnHN6q32cmitD4vdruoHLizYywGMehPZRZi9
 coAfJKL1tLflf8J+qyodeLg2cXOkkBkG+y38fNVQL99oAoX7sDCX1OmsrDh3auhMf9dO
 9s85hSSlOsU9dWfw8X/Ocrwjz95LpNUGcaJp6Qe1g8sIZ08h5Uv6f60aY4BJrGOGF3gU
 nxP0e9+ljZNxdw9gWnLvBCen2WNcbg13qaS8ViY2wJgZ98cVeW63NkjBRB9rkLGsJz7C
 HhWZiYhA1RZlnLHVXJg1Zua0fNvYyVoMLX0Z686ymFxX5zSK6kHZtpGZ6+CBu0lMSF2Y
 E6TQ==
X-Gm-Message-State: AOAM531aYKA4tBjRdtbBFvik/vqMgLVhbxrEKmbAAE4eX4B9vrXJ/vqV
 vpfNp3ismGygUs0WyEvv3qOYf0Vyzgrza6zRRiKUig==
X-Google-Smtp-Source: ABdhPJwB8Bh43O7mdPYun1vDdLefZZTbI63nsPtzVedjyUVpk4FUL0NZ+QI6+2qAksUHe2ZBeqUpGQ1yETx3aQ9XVsw=
X-Received: by 2002:a19:c10a:: with SMTP id r10mr14608548lff.508.1627957101180; 
 Mon, 02 Aug 2021 19:18:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210722190747.1986614-1-hridya@google.com>
In-Reply-To: <20210722190747.1986614-1-hridya@google.com>
From: John Stultz <john.stultz@linaro.org>
Date: Mon, 2 Aug 2021 19:18:09 -0700
Message-ID: <CALAqxLVLMt7rbJBQtFBw-ikBAjKrVgfS8=Nu6NFQbp_gq1m22Q@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: heaps: Set allocation limit for system heap
To: Hridya Valsaraju <hridya@google.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Liam Mark <lmark@codeaurora.org>, 
 Laura Abbott <labbott@redhat.com>, Brian Starkey <Brian.Starkey@arm.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-media <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 lkml <linux-kernel@vger.kernel.org>, 
 Android Kernel Team <kernel-team@android.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, Jul 22, 2021 at 12:07 PM Hridya Valsaraju <hridya@google.com> wrote:
> This patch limits the size of total memory that can be requested in a
> single allocation from the system heap. This would prevent a
> buggy/malicious client from depleting system memory by requesting for an
> extremely large allocation which might destabilize the system.
>
> The limit is set to half the size of the device's total RAM which is the
> same as what was set by the deprecated ION system heap.
>
> Signed-off-by: Hridya Valsaraju <hridya@google.com>

Seems sane to me, unless folks have better suggestions for allocation limits.

Reviewed-by: John Stultz <john.stultz@linaro.org>

thanks
-john
