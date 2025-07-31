Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB4AB176AA
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 21:30:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CF4B10E392;
	Thu, 31 Jul 2025 19:30:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="NNDlpqrs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E4B710E392
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 19:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1753990235; x=1754595035; i=markus.elfring@web.de;
 bh=nfroFgboZM/pcPXYf02CJ+mM4g8YsbdNYwnHb205h7o=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=NNDlpqrssO3SRxKCm4uaeo6MPWfrWmDTZ9VV/MYxVLJnn1llI/fLumX0VauWSUBG
 SrntvczCiIntHMUrIRA6i15vBu0heIWB3UGxwcC02orHoA6C6HokiRSBM6K00EyMz
 Zg6Tr4i3YElhFpEr+GBf+vdkEKH7f+kzOCqpBGzOgiU4Z6GCawHt3glXq1LCHNWA0
 p//NlajXTSd0OS/uP7NkfVF7Xa2saIVxziaAsmkP8LYR5MIyPmPPutAmJ/XMAmO1T
 Gs13wjKBejC++ac+q10zvPSkBcvYs8+cL+sNi4LORKgE7s/AeO8tm5uRqFxwUMN5e
 zj0G1L8y0NxUbUElUg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.235]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MKM5z-1uxAxQ0Pj5-00YAsB; Thu, 31
 Jul 2025 21:30:35 +0200
Message-ID: <216545a1-f893-4a12-a033-3bb6c86a9113@web.de>
Date: Thu, 31 Jul 2025 21:30:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Colin Ian King <colin.i.king@gmail.com>, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <abhinav.kumar@linux.dev>,
 David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Simona Vetter <simona@ffwll.ch>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250731081854.2120404-1-colin.i.king@gmail.com>
Subject: Re: [PATCH 0/2] drm/msm: Fix pointer dereference and use dev->dev
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250731081854.2120404-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:EvHsmdef5LYiCnGLCBVYMi7w/eUPpSumaK4Z6TEtHWdaaam6Wjs
 kjWlAgbOCeLJvpIB8yLPsk/i0ePlASAk+EHyXGmOECT1fcu15AK5OIM4r8xZUsZyj0Szm+H
 dupL5ElAE690pJC6NcEsfMbsp9BdEV7nLS/jGhIMxhjyozv1wdKyVoBpnKMXFi6KG3x6Mly
 dgSMBOU0G9Keynpdyzn/w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:JsambsqUMoU=;NN0sZrr95D1wTHr03kU3qwFyMbf
 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
 N7iz27rADcovl1O6/BQT1nE=
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

> Fix a potential null pointer dereference issue and replace
> minor->dev->dev with dev->dev in error messages.

Did you accidentally overlook to mark this patch series
as a subsequent version?
https://lore.kernel.org/lkml/20574d0a-0a8e-4b54-afe3-8a0744df9d09@web.de/

Regards,
Markus
