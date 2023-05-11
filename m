Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E99C6FE88D
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 02:24:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7B8010E57F;
	Thu, 11 May 2023 00:24:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E128710E57F
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 00:24:28 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34B0ONDo008568; Thu, 11 May 2023 00:24:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=GC8SlKvaP2Qc9GLcRMAnwzTnKh3R4A1048XA+HJvYz4=;
 b=hfsz+Yry/BU0aSHPnK9+4nsVaQhOL9OwxMaeHw2NMaRD0xYKkP+ffSnulXWz537+ap9q
 UpdV58NScpAaMr30ld+B5Datpxq1l+U/bTSCH+VWM3TrSPAyjOMiqIslKztyaD6g0kn0
 Bb3jNBqouMoL7Ib+RAQTlo/02iN3IradEeTfmtK5SQO8ymEAJeUyILlVdG0PC+pyDBd1
 XR5CiF24XeKsnks4/roLedhh1KEBsu/FCauimA9X0VpJxpLrkaMAlzCJ+YelIwQECO/X
 9P3rA87OB434dPk6oo1LkO914oDnGPDnFA40sS4n3WUDY3wgq1znQ3/qY6Lr2Gsbh96r Mg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qg5mpt0hv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 May 2023 00:24:23 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34B0NsZh026840
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 May 2023 00:23:54 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 10 May
 2023 17:23:53 -0700
Message-ID: <32fe6cee-c98c-77a5-2e3e-1f93249e5994@quicinc.com>
Date: Wed, 10 May 2023 18:23:52 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] accel/ivpu: Reserve all non-command bo's using
 DMA_RESV_USAGE_BOOKKEEP
Content-Language: en-US
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20230413063810.3167511-1-stanislaw.gruszka@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230413063810.3167511-1-stanislaw.gruszka@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: pOgswDBNme-3b2B6izlWC8V8oeIILqML
X-Proofpoint-GUID: pOgswDBNme-3b2B6izlWC8V8oeIILqML
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-10_04,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=922 clxscore=1011
 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305110002
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
Cc: Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/13/2023 12:38 AM, Stanislaw Gruszka wrote:
> Use DMA_RESV_USAGE_BOOKKEEP reservation for buffer objects, except for
> command buffers for which we use DMA_RESV_USAGE_WRITE (since VPU can
> write to command buffer context save area).
> 
> Fixes: 0ec8671837a6 ("accel/ivpu: Fix S3 system suspend when not idle")
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

I'm pretty new to fences, but this seems sane based on what Daniel 
suggested and what I'm seeing in code.

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
