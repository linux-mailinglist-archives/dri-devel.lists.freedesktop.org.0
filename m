Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 850CCC5D91F
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 15:26:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF6CF10E248;
	Fri, 14 Nov 2025 14:26:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fCxaXnq5";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TTUwpdcI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEE4110EA93
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 14:26:45 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AE8avAM1592303
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 14:26:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Wm08Oj7Apo5HgrQPJ3V0ulymMOQiyCRSYJ12wElgY/A=; b=fCxaXnq54yS74FBw
 6RHBjpeXn5Qr39HTyXLbNeEq2ik9hoBiVW0ugwCFG3qM0vQ2RGwte7C50kqnKTpN
 IlNsalNlglxG4beIZDzeOzNwRi3SFLklmbqW9ueuwu58sEqGZIBpMeetfCDS097u
 yqoSmWjSFr7ilqZ/DpUO+SPzFt6b/p1tN79tLg5vujL3UQeK9CJ4khRDPUIu0mlN
 s8Prgdq3a3rsHtesDHTZQHzQe61/tiqJD1COuxhI2tSxiVND3Rx49rSm7XXhYaaU
 aufzXSRS/6Hw4FHdVNwzwRWwqqgw9dPqeVQzRG7Af63l1DG3wzOC48TM72RfPmNe
 2I0nEw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9ftexs-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 14:26:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4edd678b2a3so32771931cf.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 06:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763130404; x=1763735204;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wm08Oj7Apo5HgrQPJ3V0ulymMOQiyCRSYJ12wElgY/A=;
 b=TTUwpdcI9U8xJIez6ds+/VFWL3PIpnKMhyiN5UFtO+7NTZdxuGK7Sqh5qEPB0rpr+J
 n6wbeHSrqDwWhXie72oSrOzW4T+5mkBh3Fop6VRB2NPbgFtuveVACiInaDOy48jDZlfO
 IS+5M/rI0cW+eGBC0W267NEoJWMQ7zysSJU4DdS1SBCx+5tHcqn0qcr5EFhjPH5c3hH7
 jyaNMK+DkgE8zDg0JvxppjFa/jCSj0GqYFdelUqN8tzx4yH5ZzOBOJuXp0hbfWp8xstj
 fL9V6b6Z4r0dS00lYcm0tt2bLr/XL9+h0Jbf0ITqI06FfLns81cCvdTM7ai3dQ/gvBX8
 /F5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763130404; x=1763735204;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Wm08Oj7Apo5HgrQPJ3V0ulymMOQiyCRSYJ12wElgY/A=;
 b=hwGwgEY4NonTMY2gDWKwezD+9Dtf/93SSejkh9EhfCONVKQUnoL0flItaCqhGAxr9I
 ZqFLPkNKkoWfUyskRCz1sBoONb/BMjlEv0yunF3oHqCDz6rjuMxoFmSahKye4GT7Hx8x
 TfA2wlPTXtbuzIVFtj8jFwKgiSsbII6ER0um+kdfoe1G5IegZhnlfJObvWSDC64lNr69
 zGPVyvOJGzFInhTyO2Dax2YmRnIq8iNvnr4lpJlsv6iEwCct96hKN/qTAGleZq10z24G
 BnwiL22M4HImVkdp9+HNFutNHq6EHTOz+iW4Db9PLmAiGI6iSD+pwhU0Y/fhmDqYNGt3
 lYMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUk5Yx6miRwJbu4+ksXnSOjezOJpMC2Ia1t3QpunpGu8EBbYzz2+5zNcfVwsBUYu5rwmAr+6wQF8eE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQtc/D2JDlMzqNZBOpQxQVkcVXpz54oOBDg132+SyQZFxPS/yA
 YS0BhreM43K6nr5iIhg1a3bbyyNEbqT3Fwqai11/hP0inFkkcM6m6JuiZeM1fRNsf8Shlaj78hm
 DAoZBNVQBiv90Zqr+CjYUMjmaf+181DVcQzDNS3ilHU51GL6kZMf3eVdIn49viwwm4D8tYS0=
X-Gm-Gg: ASbGncuDC5U2dWdmjRQH34a+bvXrpzGe+zvEA06EYK/evOwHSW3rjpCJNo3Ye/I5OIb
 IMQ8kz5NdUQBsF0+wH624YxhcsTqMuuFakBwcH51OpR428uPxQJFuxibzx0pmT3R3VDQv+3vVh7
 S3h9LBHZJADrYQXJH0gS88o2iWPo2caqabqmXB9YSxhJbdbI/Kee1rYF8wlr10+iDtzhoL8978o
 f09IoVuBE4tb4f2kfKWzUMoWJKpl19BNp5zfHMjIDjOg5k08t1auUc8/sRHdUU47l4HuErgCQ+r
 biqxklrSetipqdT4YTsV1dfhvqBHXna23tAwwQ6O41oPRqAIk0o6vcBNjmZljw0HVzXLd1O0j30
 gasH4yWrC9U/Ugyr5TGc2CKZ8fMSFVxgMBsSU3XGqP5CCIH03f/TXozteGswtnIjXmS+G/HBkYE
 dNrpHkl7TnrQjE
X-Received: by 2002:a05:622a:19a5:b0:4e8:bbd4:99d8 with SMTP id
 d75a77b69052e-4edf208a86dmr48911831cf.37.1763130404174; 
 Fri, 14 Nov 2025 06:26:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFm90pluc4Y4JC2rHHO8mSgQitbLfLgaksRl5AUlSTdas0MjBH91PxBwSUSfWQtEunJDliLzg==
X-Received: by 2002:a05:622a:19a5:b0:4e8:bbd4:99d8 with SMTP id
 d75a77b69052e-4edf208a86dmr48911371cf.37.1763130403646; 
 Fri, 14 Nov 2025 06:26:43 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37b9cee0cabsm10318821fa.40.2025.11.14.06.26.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Nov 2025 06:26:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, fange.zhang@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, li.liu@oss.qualcomm.com
Subject: Re: [PATCH v3] dt-bindings: display/msm: dp-controller: Add SM6150
Date: Fri, 14 Nov 2025 16:26:34 +0200
Message-ID: <176312947282.1737000.2726577602093999056.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250916-add-dp-controller-support-for-sm6150-v3-1-dd60ebbd101e@oss.qualcomm.com>
References: <20250916-add-dp-controller-support-for-sm6150-v3-1-dd60ebbd101e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SdD6t/Ru c=1 sm=1 tr=0 ts=69173c24 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=-ywfm2TNeMNqkeX1OTcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: UxD65WV37MIxSPonJz7GLzolgTTkE9Xa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDExNiBTYWx0ZWRfXxF+YuLW5vbq0
 q+Xxb9nnmFQFvY8jrffbU8Sr2QtLEBy6xEqsswaf+9C/+mwE1RoWynwjwmJPwngTe4vjHyYpbnZ
 wsNPNDwtx9R1739IWnV+58E51ofiCvHBfkBsHqcFMJZ0CK7MqLou2NfGmUdZd8PL/eJOp0MZkmE
 d0xrEYoerBVedF5uhLdbJW4/THzO03lcA5DHsXvnnrBySkawSLK0SZMPqTqloTYdnOns78F/1uL
 b5YPl5iePUopfJtThSiCQPz/kDxesy8DJ/YUUoPiuZmDtpzPyA/Pp0wYYzsPFG3NiMRMppcDB/c
 X5bbPlVxbhRhrW9JW9ysSwkAd4mov8LlOwFsTJAg88CSTVdk1bC6NP1TcHFeGlJQWF45yLWFHcK
 YPQPHuXNqB5ueogcUKVqreXujv8R8g==
X-Proofpoint-ORIG-GUID: UxD65WV37MIxSPonJz7GLzolgTTkE9Xa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140116
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

On Tue, 16 Sep 2025 20:11:03 +0800, Xiangxu Yin wrote:
> Add DisplayPort controller binding for Qualcomm SM6150 SoC.
> SM6150 uses the same controller IP as SM8150.
> Declare 'qcom,sm6150-dp' as a fallback compatible to
> 'qcom,sm8150-dp' and 'qcom,sm8350-dp' for consistency with existing
> bindings and to ensure correct matching and future clarity.
> 
> 
> [...]

Applied to msm-next, thanks!

[1/1] dt-bindings: display/msm: dp-controller: Add SM6150
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e56ff0888b2f

Best regards,
-- 
With best wishes
Dmitry


