Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB677272D6
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 01:20:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5EEC10E56D;
	Wed,  7 Jun 2023 23:20:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AB0C10E567
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 23:20:07 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4f6283d0d84so52608e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 16:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686180004; x=1688772004;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r7qK40ksF26jrV7Z6e+XMOd35fU16ptWb+JBbcbyUhM=;
 b=YdSoiItRF0GCtEBmKf02tJrUf9D48fvrZ6hP9JLHExNBmIoNSdfasALc08vC9DV6Mo
 mvN04oYx4WyLFLm9muKpNRh6FwuGs9rjlU+I2buxhJW9NJrDOm2rxehYdwAAAABjk5Od
 WUGZstNZbn9JMRc9ybD+mOrh0lukshUj45G1ASgitQwSXNjPBKyZgxgB3/j3/V+94Qm6
 LIG68p9ZJPCpU2hKlU5XnLTk3KZWr5XP4PQXwnUHTbUt8Fs2iK7dvnfPCaQM5Qh+xsHL
 eCC43DX5v6ioko89FJW/zmyFJpDrrhCmnh6qGBA7U2bAaqpButAlSwlHyY1bV9ThEsgZ
 XNxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686180004; x=1688772004;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r7qK40ksF26jrV7Z6e+XMOd35fU16ptWb+JBbcbyUhM=;
 b=Uyik/BE9oJoKZ1amg6roso1MLcarqaKgn/Zg95sih9VoHRQjhwEz8xBoCDPdoc5QGU
 jyGtMh84JBLZ2iDhKhL+W3rMGrL+cyu6Sf/IxvX7GLzuJQUJc7Nu8y8lIxfusOx+ZMde
 LPBB9PTkuzHbv2ygqeCxg1l7MYfpIK9KfjTebmhUPbXwwaZmIEdAAcQYO8ay4/Kl7kgF
 10gX6HlBRqzEfX3MFt/EGWyXoM5LTu+56SSSGOgodWEGiVmklKYyYPp5FhQ04w6koPKH
 uABgsoGrrH1IS013pTuKCfrQqQhYNKBrctUcstnNxR5uNkx8uqCXObNYsgNbYtv3X7Cv
 Hokw==
X-Gm-Message-State: AC+VfDxunXOgf0Xk018KIXxi0XSG255g4yl0x60/B8oDRD2wIK0RNEBc
 vhTGv1P00IxInYa098ObfjwKvg==
X-Google-Smtp-Source: ACHHUZ6AI3p9yIPWZtohBoquJGhKoRP9m/ln2nsOUaVQVX7zSB478XuCMQ0ma5PxjKFK7vohgYxTwg==
X-Received: by 2002:ac2:5b46:0:b0:4f6:4996:727f with SMTP id
 i6-20020ac25b46000000b004f64996727fmr580499lfp.35.1686180003925; 
 Wed, 07 Jun 2023 16:20:03 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 h18-20020a197012000000b004f00189e1dcsm1908952lfc.117.2023.06.07.16.20.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jun 2023 16:20:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 1/2] drm/msm/dpu: use PINGPONG_NONE to unbind INTF from
 PP
Date: Thu,  8 Jun 2023 02:20:01 +0300
Message-Id: <168617996602.1879421.14988330967519965516.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230604031308.894274-1-dmitry.baryshkov@linaro.org>
References: <20230604031308.894274-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Sun, 04 Jun 2023 06:13:07 +0300, Dmitry Baryshkov wrote:
> Currently the driver passes the PINGPONG index to
> dpu_hw_intf_ops::bind_pingpong_blk() callback and uses separate boolean
> flag to tell whether INTF should be bound or unbound. Simplify this by
> passing PINGPONG_NONE in case of unbinding and drop the flag completely.
> 
> 

Applied, thanks!

[1/2] drm/msm/dpu: use PINGPONG_NONE to unbind INTF from PP
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a03b7c4698d7
[2/2] drm/msm/dpu: use PINGPONG_NONE to unbind WB from PP
      https://gitlab.freedesktop.org/lumag/msm/-/commit/0f86d9c980a3

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
