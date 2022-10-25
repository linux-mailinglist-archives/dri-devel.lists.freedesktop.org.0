Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0FA60CE0D
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 15:57:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43AB310E1BD;
	Tue, 25 Oct 2022 13:57:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8522D10E1BD;
 Tue, 25 Oct 2022 13:57:12 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29PBG0nK012135;
 Tue, 25 Oct 2022 13:56:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=aHpzy4jYP4QgBrfnEo3hF1WixD4989yYm1SxoPiA0i8=;
 b=K9gBX2dA19Ru8Zl8oGw3bxGbvfcijuymZrL49+ryTdoxnAR/NFK7itRPmawaypAK50Rz
 9R5wOL/4Gi91LTpiCg8qnb1cbC4CKGbjyKcWhL36OdV/OjNFB20c8aCDC4ldSlrLYQyE
 vtzlReRZbBRI53tbbCiy4MqzBYLDhZNaFzunQFoKgL2tTgHYC231usHccFscMh4PMv8q
 ThXp/sbJQa73a+qIBF/d3MFQHt8nX4Sb40VsxzipINUWUAzX2+Fh2vZsITmOoexugpxv
 m8C1Lm5q3K+I117H9y7MbDyLMsA1fviubTSElhtbZtAHQaXDL5i/dNTFGBapGlPjQnwZ Ig== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ke6qs1rec-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Oct 2022 13:56:57 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29PDuucL014044
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Oct 2022 13:56:56 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Tue, 25 Oct
 2022 06:56:55 -0700
Message-ID: <ae0077cf-2fdc-fd0c-9b51-a8da5d677d52@quicinc.com>
Date: Tue, 25 Oct 2022 07:56:55 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v5 1/3] drm: Use XArray instead of IDR for minors
Content-Language: en-US
To: =?UTF-8?Q?Micha=c5=82_Winiarski?= <michal.winiarski@intel.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <intel-gfx@lists.freedesktop.org>
References: <20220911211443.581481-1-michal.winiarski@intel.com>
 <20220911211443.581481-2-michal.winiarski@intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20220911211443.581481-2-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: x1TWMRnQd4tBzOiPL8BaRpMObfsy8t0G
X-Proofpoint-GUID: x1TWMRnQd4tBzOiPL8BaRpMObfsy8t0G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-25_06,2022-10-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 adultscore=0 phishscore=0 clxscore=1011 mlxscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=796 priorityscore=1501
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210250080
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
Cc: David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 Matthew Wilcox <willy@infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/11/2022 3:14 PM, Michał Winiarski wrote:
> IDR is deprecated, and since XArray manages its own state with internal
> locking, it simplifies the locking on DRM side.
> Additionally, don't use the IRQ-safe variant, since operating on drm
> minor is not done in IRQ context.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> Suggested-by: Matthew Wilcox <willy@infradead.org>
> ---

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
