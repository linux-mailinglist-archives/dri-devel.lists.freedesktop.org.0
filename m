Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CE48A32D4
	for <lists+dri-devel@lfdr.de>; Fri, 12 Apr 2024 17:50:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD9FC10F712;
	Fri, 12 Apr 2024 15:50:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="GmoyfCnD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C392D10F716
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Apr 2024 15:50:32 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43C8lJIh002776; Fri, 12 Apr 2024 15:50:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=lMjskYvgPTovDqjTRq+3f6cIcGHQ/GhUZfP9BJAKXCA=; b=Gm
 oyfCnDSO0s+9PuDeH9cgXRAEG14csopMRvE2bxqXCyVyZkgkyTE4XeuSbVBaWxBD
 NWbJC23EMsyYYgNPbqJD0RURHWRL68MHtZNclFdzpl/9fSfZ3yIwMBulhG/DLwTG
 c1M8irTBnjlHG7B1pLiFgTFrc8BOtX6YYfr0FZ45wX8wUi+tYFGiQCKyCbmR4Vku
 7AYsE9UnfYP2rCJL1QsZ7LG2NC2OBaoQ+fZf4kboRa/K6W0ywSLelIQSBaOTDLvK
 SUULhkPyfn6Y+lNPol37/VM+31Qfkk5jom8z2NGOx3Vo6+AHwNR/iwI4i4pOMceK
 pdWBatdvMMoc0rRdzytg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xev74sgbh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Apr 2024 15:50:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43CFoOqx011361
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Apr 2024 15:50:24 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 12 Apr
 2024 08:50:24 -0700
Message-ID: <5f585e04-a4ad-e0d3-3bca-c73de5cc2147@quicinc.com>
Date: Fri, 12 Apr 2024 09:50:23 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] accel/qaic: Add Sahara implementation for firmware loading
Content-Language: en-US
To: <quic_bjorande@quicinc.com>, <quic_carlv@quicinc.com>,
 <quic_pkanojiy@quicinc.com>, <stanislaw.gruszka@linux.intel.com>,
 <jacek.lawrynowicz@linux.intel.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <ogabbay@kernel.org>
References: <20240322034917.3522388-1-quic_jhugo@quicinc.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240322034917.3522388-1-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: WwcSMLZ_Fj-lqmaUq3K5mZd7XDAebPEF
X-Proofpoint-ORIG-GUID: WwcSMLZ_Fj-lqmaUq3K5mZd7XDAebPEF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-12_12,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 phishscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404120115
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

On 3/21/2024 9:49 PM, Jeffrey Hugo wrote:
> The AIC100 secondary bootloader uses the Sahara protocol for two
> purposes - loading the runtime firmware images from the host, and
> offloading crashdumps to the host. The crashdump functionality is only
> invoked when the AIC100 device encounters a crash and dumps are enabled.
> Also the collection of the dump is optional - the host can reject
> collecting the dump.
> 
> The Sahara protocol contains many features and modes including firmware
> upload, crashdump download, and client commands. For simplicity,
> implement the parts of the protocol needed for loading firmware to the
> device.
> 
> Fundamentally, the Sahara protocol is an embedded file transfer
> protocol. Both sides negotiate a connection through a simple exchange of
> hello messages. After handshaking through a hello message, the device
> either sends a message requesting images, or a message advertising the
> memory dump available for the host. For image transfer, the remote device
> issues a read data request that provides an image (by ID), an offset, and
> a length. The host has an internal mapping of image IDs to filenames. The
> host is expected to access the image and transfer the requested chunk to
> the device. The device can issue additional read requests, or signal that
> it has consumed enough data from this image with an end of image message.
> The host confirms the end of image, and the device can proceed with
> another image by starting over with the hello exchange again.
> 
> Some images may be optional, and only provided as part of a provisioning
> flow. The host is not aware of this information, and thus should report
> an error to the device when an image is not available. The device will
> evaluate if the image is required or not, and take the appropriate
> action.
> 
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>

Pushed to drm-misc-next

-Jeff
