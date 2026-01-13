Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C953CD1A631
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 17:48:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D12AD10E513;
	Tue, 13 Jan 2026 16:48:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="W5bbx3dG";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZAFOLISb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BF9710E513
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 16:48:29 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60DDsSH52071201
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 16:48:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=zm7s+brPb7rRGSHomukVRPI+
 rYMqYiyT8iaPOnZMWIQ=; b=W5bbx3dG2qXfoxB7cJxfSLufnzaPPNgVXFq+Pisp
 v4pndINFnaelkUcTYOVdts80yFSQn6g4PDQjlxYCIJAvoc79lTP6qaZsjDSDECrG
 AnWN72V8+fPS7Fj9DhTeu5ZHVmmZuvM0ucQccz+R3BRFj5lytJczohI36J6A2l5L
 j3GQ0+zsp2Y99eubmRmKjQ28QRtP8ZQ46hjLmqEAosIjDaM0ZERMQ8zjs+Z7Bu5H
 stKto/GQjnhtglQ38B+VmEjHGGqEc36vera5I2s1eVCO6vvvbshu3K5eEzyhlFtu
 MAD4zrPSxPFiKoQRhxt9qUUkKzLzSgOhY4youiwHtiXxdQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnqbm8mej-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 16:48:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c52f07fbd0so28717785a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 08:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768322908; x=1768927708;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zm7s+brPb7rRGSHomukVRPI+rYMqYiyT8iaPOnZMWIQ=;
 b=ZAFOLISbewKCva7SUIF/pepdp5XEHEMgiWkJclEkl3+cmwprmOzfFpEtnNegvb2fmF
 i6YqcrYIIV1spUrY3ldXcshB9o7oI6b428dqn/R52wMxeXZ9HF4k76zyp4KpwzN6YoFe
 dLD0M0IgkzjvdiAERq1SAzPHZIZf9FrDlWa8kJvJOZg+T4ODAA+UcyKdCkHbj9vVISKQ
 KIl8hbkAX43x5zORxr1uNPmTg84IWXEyRTdIgcvYQIuYQzco5xM+hPcwUpB24peEPPMI
 FL85nH0jC5azFB1meOCR/V4n1OEgYx2XYVWQU7//TDxYPhso64imVB+Qnp7vXQtrWrHN
 5dig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768322908; x=1768927708;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zm7s+brPb7rRGSHomukVRPI+rYMqYiyT8iaPOnZMWIQ=;
 b=EGTWAKYVokk9RCHQvBdL7syakZJozicveFAh8e0aCh8psiZQl6Ab4Y7k0n/0p7Md0X
 2Rb8oYDuDEGRKrA1uKiF22aG0jlHpub/s+scphTEpgqHZNel7WBZ5Hv/31bP5UShQb56
 dSV2Cz0Ss5K5Vtt29hK9GVztgY8gS+EV/Nn4p3Ep9XUsCTG/OQAbkzI2ZhVMnv/nxXKH
 4KWeXv0QUwhkEvYXqWNjFRRZEVaZURhAMYopKpPWdaz8u+dme7xJPrpVeSO826FpsE1c
 8jPc1z84GI/CxbTDqlUU0PADpIyRkqwjlPJhdqYZSUnIDz6iw80onmjbLqIfEorja4WN
 ajlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNHJZV9fVZ0KDRFn76n1ZEK0kmtWbhfgyDZ4J5rOCRysvCxLU28o8zA8kU/QcyQP5F1+Xjw7Y5ksw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxn72mkadWDmfFYpmeBEhmAxrgGkJshsmsk4aSDJdoO2dM9LrUV
 ZHFJaNCgLIb2nPokW7MrMOIXD31CvUGQxYkL9Yjsq/0nYgZr7DfqjfxiP0h72FeLeZixIkxQqiA
 Pto5r55eVn8i0T0HPVL5eT1mgCIPvbQS82T307XPA2hVku4x5hWyBwozIIMe0tG/DndAM5U4=
X-Gm-Gg: AY/fxX69eAi4O/S/CK+CvJ1GBiZKaq7PtqaAi2Arg5a0E/bLTsmhd8+PWTmqZthyh2C
 7KCY+MgSDh1hrQJQpdo8YWC60QBaCcmx9LVIJHaqJPmm0K/TpXnm6PXktK3jUfRp3zqB2B8U4AQ
 uihb0/FANkW4muLRUgRwXV6YZNA3Xrs+tORWEHKTHB1BoZYXHVB3S8Hm8MoTr3hknv//iBWx5z8
 aGvsvHx6+2GMZ6PnHRljgi3Bjaim3372yMRzxT2/pCKNoMjRVEMlpATOvHdsLTaGMhqqx/+Yh8l
 GEHwhC4kyeIIuDN+1bv6PKTPPE9W0/9AA2pDvzLnoegn8AtG3D3J8oSM6+G/YoZYRNK0QXH3mtY
 PeD6wIvoWk/dcfPoI31ROlp5PwMZm/91/qsimyHXWed6vg33cFcLyLMM1QFZxva85WwrOwOhbEE
 3CZYNKPk67CF/0pQc+JwoL3BQ=
X-Received: by 2002:a05:620a:4443:b0:8c0:ddb4:2141 with SMTP id
 af79cd13be357-8c389395469mr2988545685a.24.1768322907950; 
 Tue, 13 Jan 2026 08:48:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/ExUCSPgVzvvxOPEhYjHCLUFmb/vE/0vCZKgFAvf8K/jL9x4lsy+VV+V3Q1Gxgy8LEW6xYQ==
X-Received: by 2002:a05:620a:4443:b0:8c0:ddb4:2141 with SMTP id
 af79cd13be357-8c389395469mr2988542085a.24.1768322907555; 
 Tue, 13 Jan 2026 08:48:27 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b75ad8b46sm4370152e87.79.2026.01.13.08.48.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 08:48:26 -0800 (PST)
Date: Tue, 13 Jan 2026 18:48:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org
Subject: Re: [PATCH 02/11] soc: qcom: ubwc: add helper to get min_acc length
Message-ID: <jimbmen2n3vdlghrnnuyexeeqwirjxxxye5joh5vvjgggxwg25@yal5suwpkh64>
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
 <20260110-iris-ubwc-v1-2-dd70494dcd7b@oss.qualcomm.com>
 <5594210c-ce25-40ac-9b5c-69c97eb0bd72@oss.qualcomm.com>
 <spk2wlfjgrtvkbxk2rzklsdg7ojpcsehl6c5fzaergrq2chpcs@p6s7px3lrtt5>
 <e5472469-84be-4ae2-97d8-6756f2cb1a55@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5472469-84be-4ae2-97d8-6756f2cb1a55@oss.qualcomm.com>
X-Proofpoint-GUID: _i7_rFh55fbMeCcIaN8EyKKmQ4svr_sg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE0MCBTYWx0ZWRfX09Q+9Tcd5VhK
 cF5EEFxAsvts+yX2ALZp/svS3+7ps1+tJBRWtUlXPNusTMYn4oenmffp0v0NO8C6+IFCla1KUPL
 /1nikpC1TwGazYVGMWan6xgAGGVC+bhC2zuU+mJkbDGcHoefCLmmBZNqne1rNh90z0PhUimC+41
 L1mh9DKI6Pd6dcTinsXGVSl3ZRfcl/4fGRCb+vcEyaE4H35P4QUDX4VOL1mUX0XYVkMRcLSSSWD
 Z+4oJNoUvXAUO35Oq3vSQj+Hk/JM/Wj2kNr8xkwMHJ/m3N3o3zd5UfdDbUM/q1/OfgnyvXlHqGJ
 9Ze5wgPPZKlV8E1Nui6fDKeBza9pUZhlFUhP+XiCwbpKEBX8hEBiSGH7bv0LGzkxcgt1z23utpq
 3VaxtW5GEsO/zr36v/BkbgPVXiMyJKNszXf1/Wt4cXJ9RrhQ7jBgdu+OUxWj9qwz+FBOAFlv/dn
 9NI6FytGywI0CMeK6oA==
X-Proofpoint-ORIG-GUID: _i7_rFh55fbMeCcIaN8EyKKmQ4svr_sg
X-Authority-Analysis: v=2.4 cv=YdmwJgRf c=1 sm=1 tr=0 ts=6966775d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=gylY1NlVxpGO7Vunac0A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130140
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

On Tue, Jan 13, 2026 at 04:26:50PM +0100, Konrad Dybcio wrote:
> On 1/13/26 1:24 AM, Dmitry Baryshkov wrote:
> > On Mon, Jan 12, 2026 at 12:08:13PM +0100, Konrad Dybcio wrote:
> >> On 1/10/26 8:37 PM, Dmitry Baryshkov wrote:
> >>> MDSS and GPU drivers use different approaches to get min_acc length.
> >>> Add helper function that can be used by all the drivers.
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>> ---
> >>>  include/linux/soc/qcom/ubwc.h | 7 +++++++
> >>>  1 file changed, 7 insertions(+)
> >>>
> >>> diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
> >>> index f052e241736c..50d891493ac8 100644
> >>> --- a/include/linux/soc/qcom/ubwc.h
> >>> +++ b/include/linux/soc/qcom/ubwc.h
> >>> @@ -74,4 +74,11 @@ static inline bool qcom_ubwc_get_ubwc_mode(const struct qcom_ubwc_cfg_data *cfg)
> >>>  	return ret;
> >>>  }
> >>>  
> >>> +static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data *cfg)
> >>> +{
> >>> +	return cfg->ubwc_enc_version == UBWC_1_0 &&
> >>> +		(cfg->ubwc_dec_version == UBWC_2_0 ||
> >>> +		 cfg->ubwc_dec_version == UBWC_3_0);
> >>
> >> Are you sure this is a correct heuristic?
> > 
> > No, but it matches what we had in MDSS driver (and I think it matches
> > the chipsets that were selected by the GPU driver).
> 
> Should we keep a comment that this is a best guess that worked out so
> far?

Sure.

-- 
With best wishes
Dmitry
