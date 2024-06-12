Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F06C5905268
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 14:29:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6658A10E846;
	Wed, 12 Jun 2024 12:29:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="vnN08X8c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E041589ABE
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 12:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1718195331; x=1718800131; i=markus.elfring@web.de;
 bh=xa3TDRwgZuX8yrQhYuKQcppS5saA02uNPUv7uS2FNlw=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=vnN08X8c9dQil+FPsUvfogxmWJ4G3S2/XuGyM6/hEthZyVGU8cx7iXfZI8CYQu52
 tWjqZ08zhRMBhUhD89KDzmYTfWT0m3aYW2dm+iHwVkd7d+isO5bt+LpomHQ2rk1Aj
 g6lCS3uM88rApXtMDvkGDwo3Vt8s8z9XNUXOBH9/nzBbHMCot/K5yVKTHK1gOJE9a
 96CFXAgyZCtb1BDwYoaXXWXf2bDm261yJzBrZ/PQzZtRpVUqw80IgBeXIbLsZbagz
 Pefp4Jiw46fZSbTElpaq3aWLmsY54sy65RL/VUqrMULfuSX9H+P2v86kGGqZbVA1T
 29cQwcmGqjkREINl1w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mrfp8-1sn91S3dPY-00cXtP; Wed, 12
 Jun 2024 14:28:50 +0200
Message-ID: <47685d2a-da23-4558-8577-98f4ddfff386@web.de>
Date: Wed, 12 Jun 2024 14:28:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org>
Subject: Re: [v2 00/14] drm/msm/hdmi: rework and fix the HPD even generation
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Ja2i8ZUUvIyK5q6YmCwdL9rk9uZKTbD7PKkt7563jmEhmvE1n4c
 ZzUvQSj4iXfm5RqU3YVXn2bO8RGzprL9jpkdN6Wkyc5bi1udDg6/jMke6Qq2DPUgdk/qPDS
 rx/UmNp34WoVZtCQ+Hm61N2h978worirp0LojuomUXpXRLzwhxvIvn04DPLkfb3EcHLR1LW
 CkPD1llIIPwaJ3/+h9TfA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:yYaB5Ri7W4o=;VeXpXqKLcMhulJxSFoDGSSyHCDU
 1qiyxgM707FIzTmPeutdJTN5Z17s79WLkQGxx5T5Ev/oR/SQMAXyzDiveZyG+pj8UoS5LMJqO
 d6vpnd7OBMweb9Jo7kPWnDDztF5e9B2wQi2XO3uWcMUTJWiHaXG7AVoLAosaHK0L2DxcUc9I0
 NLzd06Ls5sXgkYesdr/NS++eWV+gto7Jm3CQ0h5AJR5parbruvLI8RjB0n/cIiY3nGtYVQ6t1
 5W64isUzcseQ780s3janMrjpRlLANa8cojD55YJu3G0AypYh0eFEKKBmkMAwf3XJ0hEGe/gpW
 f7P5rPFmslf7STucUBuuxem33Rr0xzIAQUaaVWoc0S62z2BywINXnbIlIs1ekeMRxHeXfeDb8
 98N4IgBEijbe93h+kX0qUrIqhTDeBJYeG+UGqDMKrCL6hP1jaKjrUMgUm0y2L1pgJwcLta20f
 zs71UcnG41xTdDus060Qmhgfmp8L7KkTMUokwgDqklp6CRpQUeMoyC7008lUs8xrpM63h9uuV
 itOkG9n/KeONrcxZ9WwLW6IZ4iWAwDGWqGI1/vxLk34OaqQQ7yceltRI51lTMSbKGU5aILVqq
 KGmguOz31zO7mh8x+yjLdyyhHM5/Yk25SxsnuF7DJqEv3OXTVrKi6kcxkrDIzt4XQH0Nebg8p
 XOx8PYhVqK6MNf0KRKu0U8myq5TlI/RsTyO2Ks6wT6feFxiUqA/ta6mFKPzFeMpr0IJDBVy40
 Tu7+hQ01bR+Ndii39ADVjIwGhElg0IQT53xwFbbn4pFjNa21+0Dk6sxi2xK7+OiW7sUebrJgE
 JcQDccGzTtj9OyZn8803lhasUDYIkIoYl4OmHPFDAbLUY=
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

=E2=80=A6
> This series was tested on msm8996 and apq8064 boards. Previously HPD
> handling sometimes could trigger in the CRTC event handling, =E2=80=A6

Would you like to refer to the word =E2=80=9Cevent=E2=80=9D also in the me=
ssage subject?

Regards,
Markus
