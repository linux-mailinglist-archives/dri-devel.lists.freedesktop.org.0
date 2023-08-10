Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EDB777A1C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 16:06:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D6D710E195;
	Thu, 10 Aug 2023 14:06:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA6910E194;
 Thu, 10 Aug 2023 14:06:37 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37ABvDJL028605; Thu, 10 Aug 2023 14:05:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=FGgT2AN6JO5dh8TcsmYsl/Z1ovgEquJBrJ3QcMh1zdY=;
 b=T+5oviV/QoGRHiwCt9rXgi7wPs5smvNnOIrmnF6ZgIDYpgcO7xT3fB9K+o01Iyp5vCp5
 MdZUR8bipmxaFF2GlZcVH45ty2KbrXqHtAV5KGUyHAtMQM1XPbVUjlNXuRtDrWyQMiDB
 b1h76NZf2WHzk9sUj8V63mij2SLRABBM+LbF6YTBr948zL/QF0fF0497/fzz9/hNjUaD
 jhZ5a1gGJ3Ivhqae72YgrQSJjB0f5tBSYYr2zc+Nu598v5Ysl3nAwcZ4fb+6a8pUzcqG
 J9XeTorsXXH4Zw6rNe+y7zvdfYk+qRPsBIn8FB8HpgushR6aXbDYdeW2ebgeM5G+o3Xn vA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3scbcgjnyn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Aug 2023 14:05:58 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37AE5ucc014615
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Aug 2023 14:05:56 GMT
Received: from [10.111.183.64] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Thu, 10 Aug
 2023 07:05:55 -0700
Message-ID: <ec8d88db-4af7-3567-ac6a-92f50f0da8bb@quicinc.com>
Date: Thu, 10 Aug 2023 07:05:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V8 3/9] cfg80211: expose nl80211_chan_width_to_mhz for
 wide sharing
Content-Language: en-US
To: Evan Quan <evan.quan@amd.com>, <rafael@kernel.org>, <lenb@kernel.org>,
 <Alexander.Deucher@amd.com>, <Christian.Koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <johannes@sipsolutions.net>, <davem@davemloft.net>,
 <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
 <Mario.Limonciello@amd.com>, <mdaenzer@redhat.com>,
 <maarten.lankhorst@linux.intel.com>, <tzimmermann@suse.de>,
 <hdegoede@redhat.com>, <jingyuwang_vip@163.com>, <Lijo.Lazar@amd.com>,
 <jim.cromie@gmail.com>, <bellosilicio@gmail.com>,
 <andrealmeid@igalia.com>, <trix@redhat.com>, <jsg@jsg.id.au>,
 <arnd@arndb.de>, <andrew@lunn.ch>
References: <20230810073803.1643451-1-evan.quan@amd.com>
 <20230810073803.1643451-4-evan.quan@amd.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230810073803.1643451-4-evan.quan@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: QEmG93UZJ8DRDDG4MdFLuG057js1UGpo
X-Proofpoint-ORIG-GUID: QEmG93UZJ8DRDDG4MdFLuG057js1UGpo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-10_10,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 adultscore=0 phishscore=0 mlxlogscore=964 mlxscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 clxscore=1011
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308100119
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
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-acpi@vger.kernel.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/10/2023 12:37 AM, Evan Quan wrote:
> The newly added WBRF feature needs this interface for channel
> width calculation.
> 
> Signed-off-by: Evan Quan <evan.quan@amd.com>
> ---
>   include/net/cfg80211.h | 8 ++++++++
>   net/wireless/chan.c    | 3 ++-
>   2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
> index 7c7d03aa9d06..f50508e295db 100644
> --- a/include/net/cfg80211.h
> +++ b/include/net/cfg80211.h
> @@ -920,6 +920,14 @@ const struct cfg80211_chan_def *
>   cfg80211_chandef_compatible(const struct cfg80211_chan_def *chandef1,
>   			    const struct cfg80211_chan_def *chandef2);
>   
> +/**
> + * nl80211_chan_width_to_mhz - get the channel width in Mhz
> + * @chan_width: the channel width from &enum nl80211_chan_width
> + * Return: channel width in Mhz if the chan_width from &enum nl80211_chan_width
> + * is valid. -1 otherwise.

SI nit: s/Mhz/MHz/ in both places

> + */
> +int nl80211_chan_width_to_mhz(enum nl80211_chan_width chan_width);
> +
>   /**
>    * cfg80211_chandef_valid - check if a channel definition is valid
>    * @chandef: the channel definition to check
> diff --git a/net/wireless/chan.c b/net/wireless/chan.c
> index 0b7e81db383d..227db04eac42 100644
> --- a/net/wireless/chan.c
> +++ b/net/wireless/chan.c
> @@ -141,7 +141,7 @@ static bool cfg80211_edmg_chandef_valid(const struct cfg80211_chan_def *chandef)
>   	return true;
>   }
>   
> -static int nl80211_chan_width_to_mhz(enum nl80211_chan_width chan_width)
> +int nl80211_chan_width_to_mhz(enum nl80211_chan_width chan_width)
>   {
>   	int mhz;
>   
> @@ -190,6 +190,7 @@ static int nl80211_chan_width_to_mhz(enum nl80211_chan_width chan_width)
>   	}
>   	return mhz;
>   }
> +EXPORT_SYMBOL(nl80211_chan_width_to_mhz);
>   
>   static int cfg80211_chandef_get_width(const struct cfg80211_chan_def *c)
>   {

