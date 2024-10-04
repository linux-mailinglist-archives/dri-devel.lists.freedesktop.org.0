Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 422CA990A8B
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 20:01:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF2CC10EA57;
	Fri,  4 Oct 2024 18:01:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="cEBnjt3C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3F0410EA57
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2024 18:01:22 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 494APai9029115;
 Fri, 4 Oct 2024 18:01:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qWeHTzzr5dKEVUmcLYSOmzmVGfE/02KwSjMavnSpS8w=; b=cEBnjt3CsOcpyUg6
 g4oW1gkoeaQwbijs3SxX7cHQK8NDnHVIbl/9egJKaARbde0m8Qr3vo84p75BuLKs
 7/jqPQrWsipJT7nl/rdChKz9VYtFZcVVM6t9KYiXgkesWS4knSmiaE2rtLJ8z2Mx
 kd2ZA9HDZMkNzVOzEtbcBiKNP5/GQtQHIC8so6dNAjj0d+rMciif8RRzo84xf+ER
 0ZqcYxwbLNwqiaXfn3a224zaC/C5tNLXxJf1QHQA+JbV0U2bKFMkKoO5mOSGrL9E
 46hMmRfh2fG6ycXHaXuZUwOn+XevTwEMSjk3L+61eiU30ZFbm9hHeHxmtq77afZ+
 QrpgIw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42205hawq4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Oct 2024 18:01:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 494I1H3f003827
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 4 Oct 2024 18:01:17 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 4 Oct 2024
 11:01:17 -0700
Message-ID: <8549424d-bd22-8308-c661-c2ef13cdc441@quicinc.com>
Date: Fri, 4 Oct 2024 12:01:16 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH V3 07/11] accel/amdxdna: Add command execution
Content-Language: en-US
To: Lizhi Hou <lizhi.hou@amd.com>, <ogabbay@kernel.org>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>
References: <20240911180604.1834434-1-lizhi.hou@amd.com>
 <20240911180604.1834434-8-lizhi.hou@amd.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240911180604.1834434-8-lizhi.hou@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 2cBXhKe3-JPb7Mob1bWJOBauxhG2eP64
X-Proofpoint-ORIG-GUID: 2cBXhKe3-JPb7Mob1bWJOBauxhG2eP64
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 malwarescore=0 clxscore=1015 mlxlogscore=723 phishscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410040124
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

On 9/11/2024 12:06 PM, Lizhi Hou wrote:
> +enum amdxdna_cmd_type {
> +	AMDXDNA_CMD_SUBMIT_EXEC_BUF = 0,
> +	AMDXDNA_CMD_SUBMIT_DEPENDENCY,
> +	AMDXDNA_CMD_SUBMIT_SIGNAL,
> +};
> +
> +/**
> + * struct amdxdna_drm_exec_cmd - Execute command.
> + * @ext: MBZ.
> + * @ext_flags: MBZ.

I see a check for ext_flags, but not ext

> + * @hwctx: Hardware context handle.
> + * @type: One of command type in enum amdxdna_cmd_type.
> + * @cmd_handles: Array of command handles or the command handle itself
> + *               in case of just one.
> + * @args: Array of arguments for all command handles.
> + * @cmd_count: Number of command handles in the cmd_handles array.
> + * @arg_count: Number of arguments in the args array.
> + * @seq: Returned sequence number for this command.
> + */
> +struct amdxdna_drm_exec_cmd {
> +	__u64 ext;
> +	__u64 ext_flags;
> +	__u32 hwctx;
> +	__u32 type;
> +	__u64 cmd_handles;
> +	__u64 args;
> +	__u32 cmd_count;
> +	__u32 arg_count;
> +	__u64 seq;
> +};
