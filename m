Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B777E97EAF1
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 13:45:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18B1110E242;
	Mon, 23 Sep 2024 11:45:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HZjxwUPz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BA3C10E3DF
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 11:45:29 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-53661ac5ba1so4378786e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 04:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727091928; x=1727696728; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=JMwbFcxKHdbftumcznblxJfBpPC8ptWVXFa2dH4Buk8=;
 b=HZjxwUPzzRmyn599O8Xs0sXzR9cVPZe8PCQjsnTNFsTh3u0GYdZKzMG05Vi8jApjDl
 PKOXEIKt6frkbUS3xxh0pG1v52/u+9d6osv+ng65/FIODHEfgWhdZ6mw1i5JMAoHI92Q
 qB4xrVHWlXNRjhlU5u8JxanbyoObhv0nKG9fa0BoAL3aOsB2TcErPtkogaBuR2E8iyYK
 1FVCdJ1u0VDKg92zAkIcL1K6L+ZH9i5BWEpP+NMsrNFXVYtsEfwHLnQ+1I1pH7kaYpXo
 e0xNRFLCW9Eh/EGjt6a6cVtrG4CviaYajDaKsul0wzz7Ed7XDWACiB8R39DQh8Q9Fb++
 zRjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727091928; x=1727696728;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JMwbFcxKHdbftumcznblxJfBpPC8ptWVXFa2dH4Buk8=;
 b=nvqLA0ygtf2dCNmOwRTUjDpAkIffsKPF2nVh1Ai7st7Um3KH9NiWQpWUA7YEf8GdRB
 RpjU1nAAbu6NBX/+H6izs6UvPvYxVweLtLpZI4w+9m8m2TBngq3vedhTPprnHXJxiEsb
 6K8smTorrcMNwMb40IV7ZmPGlQuvsiHcZXHfKqVrtonI/HL20V02bxj48diulB3OpRLt
 51b2brWmtrcarZFMqqj9OmnZckXEZ8Y/dzFHxC3EqAwH3FTh/RXSnSwdpfY/JxDezR7d
 p+Cio8SIhIqEGkoTNeGvxlrRj1L8E4iAB7/sx0XAbSnkdvbH0LQWwaSfAROWlCCHr3Fk
 xjuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXT7eeOTUmWXMBxMzhCWxwU3m8Mc4DNnT9fX/za7lkb1Y98kahpoETI5iwovPhXzO31xwkHevUxc2M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxrW2YRo7YGTVZyhs7/WKm6M0h9QdQ3Qn4q0bDjYeUFBiCkAlVh
 H3/o+Femf8ttgRICysKFJh9NBdcoPphhdSScPWcBOY1eN7u714YiWGdbgjYxu+8=
X-Google-Smtp-Source: AGHT+IFCh2GD/YYaddP7TMIDd36YLwXyayl1/jc49hpm9pk1zAYcHwo3MqpSbCp+ZxyRhnbKUPJIcw==
X-Received: by 2002:a05:6512:3b27:b0:52e:9b68:d2d4 with SMTP id
 2adb3069b0e04-536ac33b18emr4731956e87.56.1727091927618; 
 Mon, 23 Sep 2024 04:45:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-536a6959582sm1674291e87.22.2024.09.23.04.45.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2024 04:45:27 -0700 (PDT)
Date: Mon, 23 Sep 2024 14:45:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, konradybcio@kernel.org, 
 andersson@kernel.org, simona@ffwll.ch, abel.vesa@linaro.org,
 robdclark@gmail.com, 
 quic_abhinavk@quicinc.com, sean@poorly.run, marijn.suijten@somainline.org, 
 airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, quic_khsieh@quicinc.com, konrad.dybcio@linaro.org, 
 quic_parellan@quicinc.com, quic_bjorande@quicinc.com,
 linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 quic_riteshk@quicinc.com, quic_vproddut@quicinc.com
Subject: Re: [PATCH v3 3/5] phy: qcom: edp: Add support for eDP PHY on SA8775P
Message-ID: <mrx2flabzgzsfyenqowgslb5654wcai6q3oclkc2i3em3iqusr@ed3af2qdx7vb>
References: <20240923113150.24711-1-quic_mukhopad@quicinc.com>
 <20240923113150.24711-4-quic_mukhopad@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923113150.24711-4-quic_mukhopad@quicinc.com>
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

On Mon, Sep 23, 2024 at 05:01:48PM GMT, Soutrik Mukhopadhyay wrote:
> Add support for eDP PHY v5 found on the Qualcomm SA8775P platform.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
> ---
> v2: Fixed review comments from Dmitry
> 	- Reused edp_swing_hbr_rbr and edp_swing_hbr2_hbr3 for v5.
> 
> v3: No change
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
