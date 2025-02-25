Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D38A44898
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 18:42:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E368810E747;
	Tue, 25 Feb 2025 17:42:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jA8zV8g6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E91DF10E6A0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 17:41:58 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-307325f2436so58145631fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 09:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740505317; x=1741110117; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hGyWaQIzn0tRIGg7LsrZt14gQY4q2FyEI8TrfL/lzng=;
 b=jA8zV8g6RkiOhdT0b7Dcrj/KuW9NT+V+yPOI0xX1J2cHYNMEVRBNhn5hAMAKgHgfUG
 CztSy0js9Qfyk2O4WX7HPivI5AGF8vzNUg2wnYAXMUYLNDM+t8dICBqKP/E90QdjbI2/
 6tugNwOfmfB2ncreQQ8EuJhdces8dvBi9WiJoYaBGeKe5XAd8B1uZ9loTI2nuY7FR7Rm
 0nuIPpSMlvnRSEgDGhytXduwSyekA6I3Y55Qa7SV+KrdwLieYxobPf/S9ymUlaCzwfox
 O+MmQURADOOp1szB13PfDjLEL4Ksdc2J6ylzkAhJMYBupTJKrlelPSZwCMSK5qBc4aM+
 A8cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740505317; x=1741110117;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hGyWaQIzn0tRIGg7LsrZt14gQY4q2FyEI8TrfL/lzng=;
 b=I881NzG20AS+RRcthRZUNnw3Q1c4+MK/8HUe5gsDPZmsv1Qc0lh6xdSGlHTWn34JZ5
 2gFQDpQOnziOcu0bYw6W+tk768VL/TqXKUH/pbpW0E2F4lR5MZ9dNzccncJZnbLF9Hl+
 6WnpnYVuqiXbeNjNzJXWyPEOeiwNsbnyizf/vXyzvE5KHDN+6lQNKShuUpeZ2A9s05V/
 ZoURWJVqjVBJQa/Srw8k/WBx/BuisWXaaYsdXbXjdzfwlXfeAM7F+DrSaksbO0BTGn0U
 KN1SwOSnOMDySGH19NzGGVNRb3sGXhDNfRVPU8H8UkFhCoruXk5Jg+7NdJcmV6nEfDHM
 Oj2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWre6A4IjaX/m9g3B3HTbBVpH4T6QNh67DuMW4IycPoKzRiLcTOMQjBjjW5LGTcXw+gdUiQL777plw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2o5nzD1XpWK1vQhZOnxMD5M83sPOvr71XKbbnvka6WoRL7CIo
 pDOZZ9jQuXmAbirFd/l3vmFBfiQuRIakn9wnGHrsFaa9YkeP6APBrFla4PfnrpI=
X-Gm-Gg: ASbGnculMbzM4mC6zXIlwabnUrVSwEbRMdUDb1Js56FIwwbe2B4hQq74kux1PRy7BSu
 P7jM4K/eHFp7+2wElOUAVpbLKDhnZ//xoi1mPotVhGPPKqAPXe2XvOl+yQw+JUAce28wRCWKPxq
 psA6iMX7lv+MIt/mp6u4R7XnXh1EG4FVsqyGefApcjmkRMJstCKhQIWjjRS2WAkZtqSjdCTSFcW
 rLexSKKuHtVxO4IjeRXj4LfzQTDHHJEIIvVFTugGbUadNLLZxUNLWZOTBa4Mbq4EgmLKxdSrH6H
 +HnKl7iO3hl4HR74NdYxpTLenLjT3cRDpRIxiReYDXmeVbQKRc2G9GmSBObanTUc7EkX85VnFJn
 2nKKNQA==
X-Google-Smtp-Source: AGHT+IHEne9NXWRmeaKHFaxNKBm56TZDZJt9JjVGVe+iGN7IpuMXMithW5dQI52NU795ttOePGE2zg==
X-Received: by 2002:a2e:9f47:0:b0:30a:45af:c18d with SMTP id
 38308e7fff4ca-30b792d7e3cmr4328091fa.25.1740505317050; 
 Tue, 25 Feb 2025 09:41:57 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30a81ac3151sm2797611fa.68.2025.02.25.09.41.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 09:41:55 -0800 (PST)
Date: Tue, 25 Feb 2025 19:41:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 robdclark@gmail.com, sean@poorly.run, marijn.suijten@somainline.org, 
 andersson@kernel.org, robh@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org, 
 konradybcio@kernel.org, conor+dt@kernel.org, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com, 
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com, quic_jesszhan@quicinc.com
Subject: Re: [PATCH 07/11] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI to
 DP bridge nodes
Message-ID: <2jsornaajavpg6srqzjuwvzt4usvmzmwqdbzw2bydgxisfsrdy@csujibqx2zi3>
References: <20250225121824.3869719-1-quic_amakhija@quicinc.com>
 <20250225121824.3869719-8-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225121824.3869719-8-quic_amakhija@quicinc.com>
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

On Tue, Feb 25, 2025 at 05:48:20PM +0530, Ayushi Makhija wrote:
> Add anx7625 DSI to DP bridge device nodes.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 136 ++++++++++++++++++++-
>  1 file changed, 135 insertions(+), 1 deletion(-)
> 

Missing dp-connector devices. Please add them together with the bridges.

-- 
With best wishes
Dmitry
