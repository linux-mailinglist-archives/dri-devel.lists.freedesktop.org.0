Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 799FE7C8F7D
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 23:43:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC02510E640;
	Fri, 13 Oct 2023 21:43:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C461D10E640
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 21:43:34 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-405459d9a96so8365e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 14:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1697233413; x=1697838213;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t3zoiWUdkneBEaFk5I7hrAkCBa7NtffBoDcVnMT2q3A=;
 b=ko9/SiO7xyI+7UviAkDNERwoiRpcRRbgS0CB6JPxzOxbVYHUlwCMURFcZ/zwrebVW8
 TJfoeVFpHtZSUWrVg6t67mjXmNz5DaqDXBBq8g+dlzptSJLVVN/lRx3qr+R1N877Hcpu
 9Kih55GguW37Mn+p1Tirry4S9E9fF1yKB/wgH09jz0DL4pqDUJFa5U5ZzYF4y4SF1D8j
 V/+V6B185ZybMhs0S88EpCCpUAXjC6OkTc5XHBM7dcMjkh9b3UFwk0G6hQHYbqve9g6o
 YRyZNgmrqMG6FL48S/sl2eBfe4CjsYtsBMk1sQT8x9CwULH7IVmfPl10rJ4ruh9I7M9P
 GmIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697233413; x=1697838213;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t3zoiWUdkneBEaFk5I7hrAkCBa7NtffBoDcVnMT2q3A=;
 b=TzIwHWafGw+d8X6xZLPhreZg95G7T6NDHmjf9otV50jMk+ME3vI4pHCEEhMytqsdfC
 9x1eVooO4p740jTmqH9wVl/Zd5h46TTTWhVoF6/Bu9EgBgfEsevvrbArIxty+zazKikx
 4bbFBWvvVBV2i2ZVzzCLAfAwbgH/TBApEKQjoIzVcFyOHEsuzDYkZ+YpYvWPepl6qz8y
 r+KJF39/MoY1+/tEKwiDB6ZNNqFrzFYJYK97CMdKFKgvoyN7sEP+CI8ylj/nJvLtWBIS
 Poz19uXkTwP1g6c65r0bg4gkv0FVVpKbQWJpfFzlem4uap9X5R4SdqlTtcNGAiuIcPoE
 Pf6w==
X-Gm-Message-State: AOJu0YzDDMxPZCKkulE80CQG/kfCHyMDIrsZH5/5HlJ02Sfsmls3FcdV
 T3pp62sVpp3nMuDJ9LTxOy2ySMbw/ezVnJujuPcgqg==
X-Google-Smtp-Source: AGHT+IFimHHzZbvU27tVl2xC9YG2acwdrMwexMXiYTK79YTRh5LQhvVTDZSNNk1zlbKIPyNm0adqtMZ7FEM9z5lCQ6Y=
X-Received: by 2002:a05:600c:4e09:b0:3fe:eb42:7ec with SMTP id
 b9-20020a05600c4e0900b003feeb4207ecmr5476wmq.1.1697233412882; Fri, 13 Oct
 2023 14:43:32 -0700 (PDT)
MIME-Version: 1.0
References: <20231013091844.804310-1-yangcong5@huaqin.corp-partner.google.com>
 <20231013091844.804310-3-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20231013091844.804310-3-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Fri, 13 Oct 2023 14:43:12 -0700
Message-ID: <CAD=FV=UVP22ANJD5xEB6MRHCDjXN6SZhQWQshPxwhi51YRkEjQ@mail.gmail.com>
Subject: Re: [v4 2/3] drm/panel: ili9882t: Avoid blurred screen from fast sleep
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: neil.armstrong@linaro.org, will@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, catalin.marinas@arm.com, hsinyi@google.com,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Oct 13, 2023 at 2:19=E2=80=AFAM Cong Yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> At present, we have found that there may be a problem of blurred
> screen during fast sleep/resume. The direct cause of the blurred
> screen is that the IC does not receive 0x28/0x10. Because of the
> particularity of the IC, before the panel enters sleep hid must
> stop scanning, as i2c_hid_core_suspend before ili9882t_disable.
> If move the ili9882t_enter_sleep_mode function to ili9882t_unprepare,
> touch reset will pull low before panel entersleep, which does not meet
> the timing requirements.. So in order to solve this problem, the IC
> can handle it through the exception mechanism when it cannot receive
> 0x28/0x10 command. Handling exceptions requires a reset 50ms delay.
> Refer to vendor detailed analysis [1].
>
> Ilitek vendor also suggested switching the page before entering sleep to
> avoid panel IC not receiving 0x28/0x10 command.
>
> Note: 0x28 is display off, 0x10 is sleep in.
>
> [1]: https://github.com/ILITEK-LoganLin/Document/tree/main/ILITEK_Power_S=
equence
>
> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-ilitek-ili9882t.c | 22 ++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)

As talked about in response to the previous version [1], we can work
to see if we can improve the sequencing. However, for now this seems
fine.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

[1] https://lore.kernel.org/r/CAD=3DFV=3DW_LT9mPYKjaKP3OvUDeNpsZxkhVN9NP_hQ=
+Es6Fe3dVw@mail.gmail.com
