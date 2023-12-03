Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4064D8022D3
	for <lists+dri-devel@lfdr.de>; Sun,  3 Dec 2023 12:26:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F52D10E279;
	Sun,  3 Dec 2023 11:26:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6494E10E272
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Dec 2023 11:26:38 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-50bf32c0140so251636e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Dec 2023 03:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701602796; x=1702207596; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8DMMWg+w+KEomm3KE0TeojNDTcW3lAFkE8ZnpXQwhC4=;
 b=FWFCipBdangEXHRrHIJc1r0JvVNlacgJVd9x3mFQyGiroc/KGD4M0L1pWXB/Zsui9a
 YqAjKdTtvavVHtlWXqdeQoLorSwePzUzQN87UBMAv3j5OnJpDPhOr8ZHQzhrCz2r1T04
 q7pCWTfAH9mJQYVN1oIVAcSdTvdjMl+Yia6ICbEHxAFSoWN2igJfwQLIVW1vkxPj9eF5
 tnDqbnEmm/eQ9GT+r8LoB/feTuJKvrp6gaG6JtjhNXYBbRVqLhuiZnt7NYv9Oz/v8YtZ
 QixTYmP+6EMpLCl9KaNtLaovZAot7DmlkAzHjoAt+E+dg8icUzIDsCc7xF/Q5fCIm+3D
 OmjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701602796; x=1702207596;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8DMMWg+w+KEomm3KE0TeojNDTcW3lAFkE8ZnpXQwhC4=;
 b=O7rUsiyWLbamvhNIwps5VkovqMG1toDyzjgB4L2ubzN2mLxCQ5+q6It4UbxejWtdhx
 Lo4pjukEpyXDHdK0t3gAY9x4RWlteD+I/oS0NYBQMxExdfeLiLTF6RnNlxA/xc6wSClE
 apGIDcqoKs4fXQG6uGxhA/dzfkynzyNKcS0iZ7rqCKZfA5rLH8LlvhhO4LyglgFOESa1
 XCy7FCWcNa9Zo3k7onIn8gFNlML0kswhBKXL/enx1peMj9A+B2mytVcKk5uUEL5VLg81
 jKu1hsamXUf/qsEyCq0MBxS6kFKYuHojMgc/BUTke9R1OFwLQLvcQ1gWfhzTrG9HpRmN
 r2ng==
X-Gm-Message-State: AOJu0YwiDLNsV0ppshsSoFvR3cDNK3FN57EPpfUCdNigSMCkc5+nihv7
 KgYiyBO4k/0ZlDcbko87NwefRA==
X-Google-Smtp-Source: AGHT+IF9BgD9XAhn6Sf/Bs3wVNK+EAUvhkniSPZagdodJi3HF44YJ5v9sT3g28Y7D+kVvux+urdbGg==
X-Received: by 2002:a05:6512:1095:b0:50b:d764:64a3 with SMTP id
 j21-20020a056512109500b0050bd76464a3mr2893065lfg.88.1701602796774; 
 Sun, 03 Dec 2023 03:26:36 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 b9-20020ac25629000000b0050bf01760a1sm241224lff.295.2023.12.03.03.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 03:26:36 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] drm/msm/mdp4: flush vblank event on disable
Date: Sun,  3 Dec 2023 14:26:21 +0300
Message-Id: <170160265544.1305159.14337780550682006214.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231127215401.4064128-1-dmitry.baryshkov@linaro.org>
References: <20231127215401.4064128-1-dmitry.baryshkov@linaro.org>
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


On Tue, 28 Nov 2023 00:54:01 +0300, Dmitry Baryshkov wrote:
> Flush queued events when disabling the crtc. This avoids timeouts when
> we come back and wait for dependencies (like the previous frame's
> flip_done).
> 
> 

Applied, thanks!

[1/1] drm/msm/mdp4: flush vblank event on disable
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c6721b3c6423

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
