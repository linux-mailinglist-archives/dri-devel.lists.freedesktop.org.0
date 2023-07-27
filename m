Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE19A765732
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 17:18:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17AD010E5AF;
	Thu, 27 Jul 2023 15:18:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E15F10E5B4
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 15:18:07 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4fdd31bf179so1933454e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 08:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690471085; x=1691075885;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pds1Vy2+pwsRJRkXlFVbHEDst9llli3Uzlt9C1boHh0=;
 b=F38F4xUuHs3DLGHROrGvlfe0XfKSbVlc0PdeQYFgp5ibV8BKmmlVmdA2keBGfGkSEk
 8C3WuVqM+HyXQylRhA9Rpu/3uR1fMB9tGCAqn2cHNBC8Axt/chns6nW7QBKMm6xywSZi
 tlrVdeXLHZMogeT6IuUuhG2FSPkdIQqAw4pKbvkmk+PKLTkOU8DeGRBx8MJRgv6j8K3g
 RgAa2ewXbhMdr+SufVuYuAb08nj8KN6YxVvuTRvrk3uPNnLqNfUMMfM9gwVN7+inAYxB
 xfQOy+INH3HXpoVPjI16Si1tuZeFPDUh3OfY4figrR0z4r2REZT2Hj7SnNncXpEB8wC7
 Jqdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690471085; x=1691075885;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pds1Vy2+pwsRJRkXlFVbHEDst9llli3Uzlt9C1boHh0=;
 b=jCG75+XO+wopGQSAR30akRtef5iZuQtjW1FxYqMESKMm7okf4mRzRGsw5v7XexDqd/
 tPH9gimmkSJ1gACbgB/GFOUF6taKr1872SfAsEKgUnZWBqxkf5hEfD0oUfuXwp75VBnx
 RMhBR1pod8D+0raToA7jpHd3HdM3hujuk62JcRY93L4XAXZ6Ub68iMGaU+GHVrJkYPhG
 MOFeNtP9tuXydsHeQkQtKbdl4EbFSsn1Yvs/hMrcXcDDLJgJ5BU9f6FwuQPLEpI4fsXy
 VarVEIdYArtvZRmIRPFk+XjLUHSLQaD09958VjGWRfebNnlgx35fTRvO9r3fLplGR1kA
 gh1w==
X-Gm-Message-State: ABy/qLb0RK5UZCS5r1k67acRm2rCqofeJGOKD4syzxa1TvsOxWVV5imw
 rzm+rMqMwNPTlLElR5FM4M0=
X-Google-Smtp-Source: APBJJlF4UNubx9KCg9zR1Y9DiqzxUEKRVmaWwggVoyGb23W9jr0nMOIS+lLGfn2/dyx3DDtdKanrlg==
X-Received: by 2002:a05:6512:15a4:b0:4fb:be3c:d8b7 with SMTP id
 bp36-20020a05651215a400b004fbbe3cd8b7mr2361173lfb.51.1690471085058; 
 Thu, 27 Jul 2023 08:18:05 -0700 (PDT)
Received: from localhost
 (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 va16-20020a17090711d000b00992aea2c55dsm882182ejb.153.2023.07.27.08.18.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 08:18:04 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: Re: (subset) [PATCH 1/3] dt-bindings: display: panel: Move HannStar
 HSD101PWW2 to LVDS
Date: Thu, 27 Jul 2023 17:18:00 +0200
Message-ID: <169047096701.3031511.2458289034154287387.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726184857.2294570-1-thierry.reding@gmail.com>
References: <20230726184857.2294570-1-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 Svyatoslav Ryhel <clamor95@gmail.com>, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>


On Wed, 26 Jul 2023 20:48:55 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The HannStar HSD101PWW2 is an LVDS panel, so move it to the correct
> bindings file.
> 
> 

Applied, thanks!

[3/3] ARM: tegra: Use Hannstar HSD101PWW2 on Pegatron Chagall
      commit: b28d3af99ac4885f136f6330fec6499b15ad5b25

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
