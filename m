Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E05B98D195A
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 13:23:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBD7010E752;
	Tue, 28 May 2024 11:23:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mRW+QmsO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18E3710E752
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 11:23:54 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-df4dce67becso613791276.2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 04:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716895434; x=1717500234; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tkkk6bms4T2MwW4ForLDxoxSswp5URWOO7BFzeJQoaw=;
 b=mRW+QmsOrHeZYY8nLl+VQLI58964EvaWI/sSlaJtZ7iQw73nSRdOdLJRiyllMbZTxh
 y5Aox2wbX9Ky2GoUlYSyCg7dSgzJk3W0k5UtfEI7SDHQIXm64DO0BLrXYJlCq+S/Yj7m
 zwlt3aXsvtlXo1oudBOA8iZFCNuFTYgcOu2CDiCLVwtCfhewDPVlfaiclxzvF/bk1r0b
 GM2yuL+nPsmVHIdCCQQ/yg0bktKyZK66lcHzvTKjS+5BKwjIisPF3X0z1zJFH/8XTkJN
 BPjMm2uhR2ceClSo0Zc9osAHjYFmxlIMmxx8uHoF/kZ5WTTDzTXFRDAAARq83d9+kHX1
 ENvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716895434; x=1717500234;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tkkk6bms4T2MwW4ForLDxoxSswp5URWOO7BFzeJQoaw=;
 b=mL6wTIe6YRZy2xlYKoVrcCiEDJMNBc1VSrvLhgPMOb5or43YRk3vNfOHgIhboUbSnO
 EK6AuALXnJJVe/9up92xlvt1Fmz0BAbQZPNR1HIrAr/irNiQ2JuxkcApEYYFlMOwXLRb
 ZxgVY1xWecpoeLNDB/xCSJVQETMNbVvUlJYgIU5JQYE107HR/fHZwpodczNM8gRHYdyP
 pSvxqc3gtcTsq6FO4kHfgd4U+xcpBm83emQKsE/D/C6h/q4GU5Gj6TxywZLredCscyYd
 4ee3nbB7eYFVPsJBnzihY9I9a4SFlh/tzb9LSkBFKH0vV8kBTRotywsqRN9NsVfAB14d
 EnOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4Oy9CEVX1oW2BFQcuvc2/bqwbBreX2OUa4AP0Jf3y6d5/9KL22Le9e1MXRazF6JmF7BoagaKRt6wNiWGdyZspNx/cI1cCqykaDAPsQO03
X-Gm-Message-State: AOJu0YxV7OzfSil0VOuVkXPGbNhXbKSoVw7u5NiCBBUMra44yaiR80kH
 d4BMhd5azpVEhUiv+PmhlQ6V3FqagH3zy3RH5zKv4aMTPU9CFP8sgtMsAMN3hypDtLsrdOpOwlN
 CW2A//CJj68AGkcY/RjDi62b01x+eD50kvXyvMg==
X-Google-Smtp-Source: AGHT+IEQoF8wL8Xqvylpsi0+6rsl4Gki2TH+Hij9qPQIiP5sR3UjVGJmWc3MmbKhLdXvBfgAKWQPmLdqQrxpSxBuYNw=
X-Received: by 2002:a25:868a:0:b0:df7:6c37:5bb3 with SMTP id
 3f1490d57ef6-df7721a6eeemr11706166276.15.1716895433961; Tue, 28 May 2024
 04:23:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240515014643.2715010-1-yangcong5@huaqin.corp-partner.google.com>
 <20240515014643.2715010-7-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20240515014643.2715010-7-yangcong5@huaqin.corp-partner.google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 May 2024 13:23:42 +0200
Message-ID: <CACRpkdbeMXrjZutEH8keWeW-CfWH-J-O_rSpBwEOVxzWHuyg_g@mail.gmail.com>
Subject: Re: [v7 6/7] dt-bindings: display: panel: Add compatible for IVO
 t109nw41
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch, 
 dianders@chromium.org, krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, 
 conor+dt@kernel.org, airlied@gmail.com, dmitry.baryshkov@linaro.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, xuxinxiong@huaqin.corp-partner.google.com, 
 Conor Dooley <conor.dooley@microchip.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 15, 2024 at 3:47=E2=80=AFAM Cong Yang
<yangcong5@huaqin.corp-partner.google.com> wrote:

> The IVO t109nw41 is a 11.0" WUXGA TFT LCD panel with himax-hx83102
> controller. Hence, we add a new compatible with panel specific config.
>
> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
