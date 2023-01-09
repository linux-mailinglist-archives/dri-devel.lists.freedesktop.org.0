Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C9B663AFF
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 09:29:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF31C10E556;
	Tue, 10 Jan 2023 08:28:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 458D510E0CF;
 Mon,  9 Jan 2023 23:16:33 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id v25so15492497lfe.12;
 Mon, 09 Jan 2023 15:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XHjEtNVaTqOtCpnB9ZP021rbETT/k+vzPdGSi2OKKbk=;
 b=Dd9JqNQM4cUJM4TBXa5f4xvEAS9VPArJhWLDzOlCPE7UEAKXRhtW7VQ2cmdUTVVk0G
 VYT6hox6yoL2bEvWBJuLKd86+3whBQaa1drVc97qUHLKzbzstPXGjAuZc4d/yr8bot84
 8AUV1Y1SyZQUIbNPmu4uphSh85FxvRSVCB4n9nMbn+kPl2tQRlcVJYezP6JnIzfj59WG
 8+j5WaBqQNdd4LQaJHBA8IYwnngzv4oqLlgOU7s8lB447GnMZEyskOkjNmT64wcSy8WH
 4dHz1sURUjoigqOMejLb7fCuxJLGfbHoeB5SPaB+P+3FljuafV20y+8FvPWBE2bPGwfo
 HKZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XHjEtNVaTqOtCpnB9ZP021rbETT/k+vzPdGSi2OKKbk=;
 b=RDB0x5w9BM3SEzJ2WWhVkcziguXz+WJmOZ/a7R59Ph/jpZjKtjCDKtWw9uNm/o92N2
 QNWe2dgTRALHRSRktLeG7xUvM3K5odfcx7rsAZUzHPXCpyLDRUH7NBCGQOmZaekorSDG
 FHQokS/NX+hyo/YdlNAMMzg22JV69xdJRCTyEX3ehrxwV4/iBOG83f4gp+vyi+jPQXNx
 tkKCAYsbawbK6OO4323k09ooWQvjyAicRmF62otSAKfd9YhHUVV2Sov7Ianefl4V81DW
 rXD7sX3obMHi+EUWq7LsAQUzsu6Kl1Ay/xYNrZ3meqDlkWnvENQvIYFHwSQsQMYsgjmh
 9qvQ==
X-Gm-Message-State: AFqh2kpgFgq0Q6xSnuRWNxETNQSSlt7XeqcBTwudD5Y17kOsUGunWqKa
 KYNn4JGYQjkk0E+XnGJB3hI=
X-Google-Smtp-Source: AMrXdXuq/b00HS8PUFGm6yKSVMLWmldR90yzJzqsS17SBf9hSgAklRD7ER40uVXxqYUX1Tv4Bcj7/A==
X-Received: by 2002:a05:6512:25a0:b0:4b5:5dea:85ad with SMTP id
 bf32-20020a05651225a000b004b55dea85admr18729585lfb.12.1673306192837; 
 Mon, 09 Jan 2023 15:16:32 -0800 (PST)
Received: from localhost (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 n2-20020a05651203e200b004bb8a796a6bsm1852983lfq.66.2023.01.09.15.16.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 15:16:32 -0800 (PST)
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
X-Google-Original-From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com, airlied@gmail.com,
 daniel@ffwll.ch, Hui Tang <tanghui20@huawei.com>
In-Reply-To: <20221119055518.179937-1-tanghui20@huawei.com>
References: <20221119055518.179937-1-tanghui20@huawei.com>
Subject: Re: [PATCH] drm/msm/dpu: check for null return of devm_kzalloc() in
 dpu_writeback_init()
Message-Id: <167330408783.609993.13860899129914018447.b4-ty@linaro.org>
Date: Tue, 10 Jan 2023 00:41:27 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 10 Jan 2023 08:28:50 +0000
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 yusongping@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Sat, 19 Nov 2022 13:55:18 +0800, Hui Tang wrote:
> Because of the possilble failure of devm_kzalloc(), dpu_wb_conn might
> be NULL and will cause null pointer derefrence later.
> 
> Therefore, it might be better to check it and directly return -ENOMEM.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: check for null return of devm_kzalloc() in dpu_writeback_init()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/21e9a838f505

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
