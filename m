Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6BF94D4BA
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 18:32:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D807110E056;
	Fri,  9 Aug 2024 16:32:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="A+BmmLBU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E09C10E056
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 16:32:45 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4799wEvq022480;
 Fri, 9 Aug 2024 16:32:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4+37uDiqfDPWeVjq4hR3f0OPi7sxqYbISDfYpeyzZDo=; b=A+BmmLBUkk4kNc/M
 JigrdXo8CRpHoHXrhts6w7HhRlE/OF1Job3Mq+OVm6G3/Etk+5sOiX2cmJu4XnNv
 vEwRzgoWo9XmNjPKJ9FYECfJV8eUPEmwQOj8t8FKeEwaD2cN3WfNuvxkWUupuhVE
 ezeOMROV6rum7DaoU0CsxdCnttYdBBQdDaoFmObsQtC+pPA3t0IEhdoMmW6kgHuh
 sFVVsEEJ4bVxMVcGT73dAE7EM5K7W6X2NHlb8RHaDCA9IdWjbJ0+zeat2OXZV7gU
 QS4RPA+AU/Xbo3Hdq14G0ODL3i2aJpd6n2azF1uw8CuBzr+AIsyf9CTXPhtlKX2f
 hgRJBw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40vtbcvgsp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Aug 2024 16:32:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 479GWcZi018498
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 9 Aug 2024 16:32:38 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 9 Aug 2024
 09:32:37 -0700
Message-ID: <f7575353-760c-0f6d-5569-cd7f691f6af9@quicinc.com>
Date: Fri, 9 Aug 2024 10:32:36 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH V2 02/10] accel/amdxdna: Support hardware mailbox
Content-Language: en-US
To: Lizhi Hou <lizhi.hou@amd.com>, <ogabbay@kernel.org>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>,
 George Yang <George.Yang@amd.com>
References: <20240805173959.3181199-1-lizhi.hou@amd.com>
 <20240805173959.3181199-3-lizhi.hou@amd.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240805173959.3181199-3-lizhi.hou@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: vkFh1KDOhjP5NqD-pbzut2tv67H1DKpG
X-Proofpoint-ORIG-GUID: vkFh1KDOhjP5NqD-pbzut2tv67H1DKpG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-09_13,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 mlxscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408090118
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

On 8/5/2024 11:39 AM, Lizhi Hou wrote:
> +enum aie2_msg_status {
> +	AIE2_STATUS_SUCCESS				= 0x0,
> +	/* AIE Error codes */
> +	AIE2_STATUS_AIE_SATURATION_ERROR		= 0x1000001,
> +	AIE2_STATUS_AIE_FP_ERROR			= 0x1000002,
> +	AIE2_STATUS_AIE_STREAM_ERROR			= 0x1000003,
> +	AIE2_STATUS_AIE_ACCESS_ERROR			= 0x1000004,
> +	AIE2_STATUS_AIE_BUS_ERROR			= 0x1000005,
> +	AIE2_STATUS_AIE_INSTRUCTION_ERROR		= 0x1000006,
> +	AIE2_STATUS_AIE_ECC_ERROR			= 0x1000007,
> +	AIE2_STATUS_AIE_LOCK_ERROR			= 0x1000008,
> +	AIE2_STATUS_AIE_DMA_ERROR			= 0x1000009,
> +	AIE2_STATUS_AIE_MEM_PARITY_ERROR		= 0x100000a,
> +	AIE2_STATUS_AIE_PWR_CFG_ERROR			= 0x100000b,
> +	AIE2_STATUS_AIE_BACKTRACK_ERROR			= 0x100000c,
> +	AIE2_STATUS_MAX_AIE_STATUS_CODE,
> +	/* MGMT ERT Error codes */
> +	AIE2_STATUS_MGMT_ERT_SELF_TEST_FAILURE		= 0x2000001,
> +	AIE2_STATUS_MGMT_ERT_HASH_MISMATCH,
> +	AIE2_STATUS_MGMT_ERT_NOAVAIL,
> +	AIE2_STATUS_MGMT_ERT_INVALID_PARAM,
> +	AIE2_STATUS_MGMT_ERT_ENTER_SUSPEND_FAILURE,
> +	AIE2_STATUS_MGMT_ERT_BUSY,
> +	AIE2_STATUS_MGMT_ERT_APPLICATION_ACTIVE,
> +	MAX_MGMT_ERT_STATUS_CODE,
> +	/* APP ERT Error codes */
> +	AIE2_STATUS_APP_ERT_FIRST_ERROR			= 0x3000001,
> +	AIE2_STATUS_APP_INVALID_INSTR,
> +	AIE2_STATUS_APP_LOAD_PDI_FAIL,
> +	MAX_APP_ERT_STATUS_CODE,
> +	/* NPU RTOS Error Codes */
> +	AIE2_STATUS_INVALID_INPUT_BUFFER		= 0x4000001,
> +	AIE2_STATUS_INVALID_COMMAND,
> +	AIE2_STATUS_INVALID_PARAM,
> +	AIE2_STATUS_INVALID_OPERATION                    = 0x4000006,

Looks like your alignment is off here

> +	AIE2_STATUS_ASYNC_EVENT_MSGS_FULL,
> +	AIE2_STATUS_MAX_RTOS_STATUS_CODE,
> +	MAX_AIE2_STATUS_CODE
> +};
> +
> +struct assign_mgmt_pasid_req {
> +	u16	pasid;
> +	u16	reserved;
> +} __packed;
> +
> +struct assign_mgmt_pasid_resp {
> +	enum aie2_msg_status	status;
> +} __packed;
> +
> +struct map_host_buffer_req {
> +	u32		context_id;
> +	u64		buf_addr;
> +	u64		buf_size;
> +} __packed;

You define a bunch of structures, but don't use them.  Seems like a lot 
of dead code to me.

Hard to say since you are not using these, but I'm guessing these are 
all the message structs to the device (fw).  They should be using __ 
types, like __u64, since the messages are crossing boundaries.


> +#define MAX_CHAIN_CMDBUF_SIZE 0x1000

SZ_ macro please (here and a few other places)


> +
> +struct xdna_msg_header {
> +	u32 total_size;
> +	u32 size		: 11;
> +	u32 rsvd0		: 5;
> +	u32 protocol_version	: 8;
> +	u32 rsvd1		: 8;

This bitwise syntax is a really bad idea because it depends on compiler 
behavior. You should use FIELD_PREP

> +	u32 id;
> +	u32 opcode;
> +} __packed;
> +
> +static_assert(sizeof(struct xdna_msg_header) == 16);
> +
> +struct mailbox_pkg {
> +	struct xdna_msg_header	header;
> +	u32			payload[];
> +};
> +
> +/* The protocol version. */
> +#define MSG_PROTOCOL_VERSION	0x1
> +/* The tombstone value. */
> +#define TOMBSTONE		0xDEADFACE
> +
> +struct mailbox_msg {
> +	void			*handle;
> +	int			(*notify_cb)(void *handle, const u32 *data, size_t size);
> +	size_t			pkg_size; /* package size in bytes */
> +	struct mailbox_pkg	pkg;
> +};
> +
> +static void mailbox_reg_write(struct mailbox_channel *mb_chann, u32 mbox_reg, u32 data)
> +{
> +	struct xdna_mailbox_res *mb_res = &mb_chann->mb->res;
> +	u64 ringbuf_addr = mb_res->mbox_base + mbox_reg;
> +
> +	iowrite32(data, (void *)ringbuf_addr);

Why iowrite32() over writel()?

> +static int mailbox_acquire_msgid(struct mailbox_channel *mb_chann, struct mailbox_msg *mb_msg)
> +{
> +	unsigned long flags;
> +	int msg_id;
> +
> +	spin_lock_irqsave(&mb_chann->chan_idr_lock, flags);
> +	msg_id = idr_alloc_cyclic(&mb_chann->chan_idr, mb_msg, 0,
> +				  MAX_MSG_ID_ENTRIES, GFP_NOWAIT);
> +	spin_unlock_irqrestore(&mb_chann->chan_idr_lock, flags);

I think an xa struct would be preferred.

> +	if (msg_id < 0)
> +		return msg_id;
> +
> +	/*
> +	 * The IDR becomes less efficient when dealing with larger IDs.
> +	 * Thus, add MAGIC_VAL to the higher bits.
> +	 */
> +	msg_id |= MAGIC_VAL;
> +	return msg_id;
> +}
> +
