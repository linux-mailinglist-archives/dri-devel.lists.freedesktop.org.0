Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D55A497E265
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2024 18:12:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB39310E227;
	Sun, 22 Sep 2024 16:12:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Nj9Rm8zk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BB0010E058
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 16:12:46 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-53653ff0251so3961937e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 09:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727021565; x=1727626365; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QNw0/2euWwO8oJrG8EqU+t5rpgVcNTbYcUPfD5tgmnk=;
 b=Nj9Rm8zkGAUAUj9oQ7sJDaUQrrWUDOHBQqziH9IrUG3RNYUtAsWZG9+aSK9DzsA71h
 RrDsbC72k/10+WFEOUZFC/ITqguLwNJmYM2yWdd9iI8MYVKabqI0aHQmdwqtxbgjIRts
 ZWhUgeB63IWzbBEpUr739Dh0DQ4ZdYVCYYeOZYv8NpUWZSxjpXV6Tu4e6mTPSsK1JgN3
 hUVuHA0IESxRR9vZk4mdRVNzXgwhXwHuRAFg2ycUnZFb7KWP4ImYCKrXcyFP98mV4TLl
 9PxEJ4eU4HtO49bifyiodBz3iJ2te04E4OcSaJEsmHLyTuk9sKe/XKyWFgKSSfvqRGeh
 uz4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727021565; x=1727626365;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QNw0/2euWwO8oJrG8EqU+t5rpgVcNTbYcUPfD5tgmnk=;
 b=cI/WUJnCVL/7Fq3yICYXyq/8pQBUFu5pqMKR2uNi4nvlKcVLmY5vZjVTb4pT1Swpwr
 S11MFhh+RqqRtVaR1SVVBvimOr2NqV87SZsU0sw5JviWP0Gg3ONA88OJLKq7oYRi1GkW
 dAJ0Ck8GkkGFw+zY/SP5qP+/5NabOlwiGhQ2mjHZmvJor7yUc6s48JT8iwuufxhClcmd
 qrbHm/AK8jk8Q/GRLO+6f/61NQ1DvBltxpzR8gGzOre+kHTmv639gyTQCIzCXDUpOCCl
 A+ODMaN2HoYYFTtUFHWXVkPSsF0LbIWVM58Fadkg/zoZQIwh3DLrlC3DeVPIuRrpiCPP
 QI/A==
X-Gm-Message-State: AOJu0YwsXWmH0MLevPz0CmEEY+eyRhGUb64mZOfxsTj4tPg1A/N5lFrj
 9TJebkLsmC9LYaxq7ItcrDiKPqGhcZmFv+8vXlO6u1x3Lo+revi2mhwQ9b24p8oQFrgwgmn3z71
 UUeY=
X-Google-Smtp-Source: AGHT+IHrHkrXionuyJuSlC4/JFdsVtuuk2CJnoDi1RT/0/wLn7DmA/8XyDMWQDAf7QEs6P814vwmVQ==
X-Received: by 2002:a05:6512:3d1d:b0:52c:daa4:2f5c with SMTP id
 2adb3069b0e04-536ac33452emr4622850e87.42.1727021564722; 
 Sun, 22 Sep 2024 09:12:44 -0700 (PDT)
Received: from eriador.lan (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00::7a1]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5369d5632absm1938905e87.247.2024.09.22.09.12.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 09:12:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 tjakobi@math.uni-bielefeld.de
Subject: Re: [PATCH 0/3] Panel orientation quirks for AYA NEO handhelds
Date: Sun, 22 Sep 2024 19:12:40 +0300
Message-ID: <172702155424.1364397.1004758299220219518.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1726492131.git.tjakobi@math.uni-bielefeld.de>
References: <cover.1726492131.git.tjakobi@math.uni-bielefeld.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Mon, 16 Sep 2024 15:18:49 +0200, tjakobi@math.uni-bielefeld.de wrote:
> From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> 
> Hello,
> 
> this is a re-submit of panel orientation quirks for some of the handheld
> devices by vendor AYA NEO.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/3] drm: panel-orientation-quirks: Add quirk for AYA NEO 2 model
      commit: 361ebf5ef843b0aa1704c72eb26b91cf76c3c5b7
[2/3] drm: panel-orientation-quirks: Add quirk for AYA NEO Founder edition
      commit: d7972d735ca80a40a571bf753c138263981a5698
[3/3] drm: panel-orientation-quirks: Add quirk for AYA NEO GEEK
      commit: 428656feb972ca99200fc127b5aecb574efd9d3d

Best regards,
-- 
With best wishes
Dmitry

