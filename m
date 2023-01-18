Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 996AF6710CC
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 03:07:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60E0710E632;
	Wed, 18 Jan 2023 02:07:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2238710E637
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 02:06:33 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id 18so47694794edw.7
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 18:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hPh85HDV7Jw4nWVOxnyUOQB6ME/srGkxE0cyhhHU/Yk=;
 b=QVIZgJlLk1umjAWsyCPwP7XPYhLhTT9losqSf5WkDA1WJ/TBaeqSo0vYTrysPHJnb8
 7pyZN8RlI8lYKRpA/1yX/+Ei5U5wxeM/LU1S26Sk/Uj5peY++NLxBsJPWcw63oUfvi2z
 8HyQvVXIy+CCd0JHJ3eGEdxrlhXOl4+m6pW9goseei2GipCXfvL2LX+2E4pidNj826yM
 j97TB9XMMs7qLQcdM9oMiayj6m97CCinuCcByh4SZ6OmwdMhXa5LXbaDNZhBpPxr/6Ie
 RxN/bWm2C4DthmWxU6ifh/wgVGtMjKXkbr43NBruyh8jisWbezeSvtjBu+jDni/fDXYC
 SxQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hPh85HDV7Jw4nWVOxnyUOQB6ME/srGkxE0cyhhHU/Yk=;
 b=AvNdoeRN/MXc008G1v6QjDzEUAVyv7j8yNzHa32Ov+vXowzNXhAkUvcRkAel717vCg
 3UDEF5yr3n7S7o71Dej2kXQDsCBNlxfmtmm+AeYjDhGHhbVxSFmklARWR1mD2fbpobO7
 BGDY/c6prWnI2Ys8B7u4Q3ZY8WZV4Ggt6qnjWoHAVfssgTzHqJLf6luex13T+L8KbuXD
 dHk/B7Zz/7oLMaE5xa4GqlNd/seZAi9diBa9spFOILR0dLSUI9V+yXMzOf5TQ3KDgrO8
 WMBOaFAK28fXabIvPbc+xryFsmjmq9atZkWfTACV4jL+hH6h5cDl4p1tPWrM2G4irXgZ
 V4lA==
X-Gm-Message-State: AFqh2krg+H0+QvBPf0/x/eCXjKa35lYeZovJy0prphszD08tfkjzPOWA
 quTwnCHrQyNCbtZEahrlBwhuvA==
X-Google-Smtp-Source: AMrXdXtMG/C8Z6HucSOog75whRYOxAnKIALrlKkOKMedyIiyZJTMJBZKlKtfCmnPPSpnF4D8Wc/TOg==
X-Received: by 2002:a05:6402:298e:b0:496:6a20:6b61 with SMTP id
 eq14-20020a056402298e00b004966a206b61mr5469620edb.22.1674007591554; 
 Tue, 17 Jan 2023 18:06:31 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 kx1-20020a170907774100b0084d368b1628sm12702694ejc.40.2023.01.17.18.06.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 18:06:31 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
 airlied@gmail.com, sumit.semwal@linaro.org, christian.koenig@amd.com,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: Re: [PATCH v2] drm/msm: Add missing check and destroy for
 alloc_ordered_workqueue
Date: Wed, 18 Jan 2023 04:06:13 +0200
Message-Id: <167400670545.1683873.7363279471120139264.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109022038.2163-1-jiasheng@iscas.ac.cn>
References: <20230109022038.2163-1-jiasheng@iscas.ac.cn>
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 freedreno@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 09 Jan 2023 10:20:38 +0800, Jiasheng Jiang wrote:
> Add check for the return value of alloc_ordered_workqueue as it may return
> NULL pointer.
> Moreover, use the destroy_workqueue in the later fails in order to avoid
> memory leak.
> 
> 

Applied, thanks!

[1/1] drm/msm: Add missing check and destroy for alloc_ordered_workqueue
      https://gitlab.freedesktop.org/lumag/msm/-/commit/643b7d0869cc

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
