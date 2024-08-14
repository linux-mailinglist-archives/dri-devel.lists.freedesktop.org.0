Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42878952472
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 23:06:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7687610E056;
	Wed, 14 Aug 2024 21:06:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vWIWy5za";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2053.outbound.protection.outlook.com [40.107.93.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27EA710E056
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 21:06:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KuC+1dLnylGZUCYPsPT1azMnkLN4YR25j4JVFHOxBcWLq2QSpGDVjXgLbojngR2wegdpwfxLbRSkY6YgW/2MuaqwJ3P8WlvcMt3+DaMTKcp2vBd72W4TwXXo+zvU1fp7KMV+ZzSHwN1SLijoewNodVlb2WzCBBrxtaJm6G05tbU638G7VAzHj+k1XeDPu3g5+iVpelo8QfJV3ouroy57hP25zKRr2NJ02bF1P3p/Ze0Y7JNM8IIEcHuXtjsUjBdE/9HXXVWYIFr9SwiA0WHlDVZwpYvjqCcWBSGC8RDcD8QmLcSX6s4x8w1SWnFNEdNdZcrfQ8F7pST30Od7eFcqng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QcHF4Ic4AdHZlOVTCYnhHhwSUD7nVn/18qIryq1qAks=;
 b=hFtQaupptNOkBlEsCSQ2QzUNHkAdxT192rnRz6kZs7GGoC/ThC3TYQlrFcPMTOSnKLzG6Rrik1Z8fCq7vdCsJ8tXYAT5pst6R2eSghRKFHO7Tu+VksKBqMACVEhJVN0FuZzgG3mNeBQ/zcv6OzTelEHDsceXJrKdmD+BwQdrZs1rtAkBmxfCBOTfApc9jZwi0kTB9B3dFR9mIzjaEJiQct+N5rsySzGYduS7EAEKtXnY22u/HXP7/+mDK/2QONvpVkvxaW4BYmSIEkOA6ABySp05YgngScEmC/zCHzLAk7n5FHDzkDGNywQJcoWmoldIxv7GTptkdDRYbg7NnwkK2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=quicinc.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QcHF4Ic4AdHZlOVTCYnhHhwSUD7nVn/18qIryq1qAks=;
 b=vWIWy5zaA4e0uyf9wqgxOI0N/v7AS8fFG1MY8ElHvGV2LG5HZXHkoufrVEtFMgJK0ht8KD9yLw97G9rUegzRpnDZblwxzuKw4oX2FTPBE95nvyLZmESsdAoW6JZpe9J3MaNbm3leJt5aorCxKsETHf1TkC4TvC7PebxqOsNoQfU=
Received: from BN9PR03CA0706.namprd03.prod.outlook.com (2603:10b6:408:ef::21)
 by SJ0PR12MB6992.namprd12.prod.outlook.com (2603:10b6:a03:483::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Wed, 14 Aug
 2024 21:06:00 +0000
Received: from BN3PEPF0000B071.namprd04.prod.outlook.com
 (2603:10b6:408:ef:cafe::11) by BN9PR03CA0706.outlook.office365.com
 (2603:10b6:408:ef::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33 via Frontend
 Transport; Wed, 14 Aug 2024 21:05:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B071.mail.protection.outlook.com (10.167.243.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Wed, 14 Aug 2024 21:05:59 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 14 Aug
 2024 16:05:59 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 14 Aug 2024 16:05:58 -0500
Message-ID: <3cf235f9-3fda-5fba-ba2e-6ce4185ddf56@amd.com>
Date: Wed, 14 Aug 2024 14:05:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V2 02/10] accel/amdxdna: Support hardware mailbox
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, <ogabbay@kernel.org>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>, George Yang <George.Yang@amd.com>
References: <20240805173959.3181199-1-lizhi.hou@amd.com>
 <20240805173959.3181199-3-lizhi.hou@amd.com>
 <f7575353-760c-0f6d-5569-cd7f691f6af9@quicinc.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <f7575353-760c-0f6d-5569-cd7f691f6af9@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B071:EE_|SJ0PR12MB6992:EE_
X-MS-Office365-Filtering-Correlation-Id: 970e4219-c27a-41b5-7ea6-08dcbca4e5de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UitnT2ZaempmamVSTmJQMzZqOStOSGZ5cmlzUVhkbnBoV2h0TklsUUZuVno1?=
 =?utf-8?B?R05QSU1Lb2p0VTVMTW9zc1NUcGM5aGRVNm9sZ3V0M2grMjNDTDIwOEZzL0JC?=
 =?utf-8?B?dVJpdnowd0h2ZFhaYkd5NFRWWVl4WDhWZmpkWng4bzVsN3Nkd3B2OUZJWUVE?=
 =?utf-8?B?WktBa3dJM0c5QXhxVGNURkJ1blRlWkJmV2xUMUZHVnQ5UzlFYzk3YnJGeDht?=
 =?utf-8?B?S3ZUVGoxNXF0RUJVUWxEM255bFVyU0NxVGlHRjBJdStuOHY4T0g1d2VIZDVT?=
 =?utf-8?B?U3MyVG92bFc3dE10Q1VqSUs5a0NabjZYNzJ2bDBPOWpzQytXSnZPWXZYTWUr?=
 =?utf-8?B?Sm5ocDRpVEsvV3M0YWpQVkx4MWxsTWszeDY4aHgxNXN1NU9rZERvYnNIQ2h4?=
 =?utf-8?B?bnRYNUZTZlFuSllwYURjRWhHZVVqM2dmVVZTa1VJbzdzS3ZNcDBtTERwR2lD?=
 =?utf-8?B?UGRoMkRHejdTZTJpYjVTN1J4U3d2dGl0bEduY0VXdGFGaDZ1b2xQVnIrQzdX?=
 =?utf-8?B?VHdMeS9JREpmQmtiWDU1UFZQaFNOdkM0S00wYTY3dmxZUy9uQ2NkR3dNY1FU?=
 =?utf-8?B?cmlIMWhwSVV6clpWZGkyS0YzdVYwSFAzenJsekkrNk5pd29ENmwyQ0RBVU11?=
 =?utf-8?B?VUsrY0FBS2ZqZmlhbks2bWp3Rm9GemJuVU1seHVHVk14eHdwWitya2tkOWY4?=
 =?utf-8?B?ODVHUHJ5aFhXcGt6YkZRZG92Z0l2MGVPaGFwcmpXbDZaSTdzL3RiRG5MNUlI?=
 =?utf-8?B?dUN3WmZVdFVpVUNBM2poVVF5TWVCZjNiUHRIaUFUWmlYSE9Ba09BaGpmcXh3?=
 =?utf-8?B?eTRRUjd4V3BmWk9KVFR3bGhUdlJxNW9tNWdpOE04YmpHdjd1WitCY1RvTTFq?=
 =?utf-8?B?eHoreklIZS83MnpKUUcyNHZaREl5cEkrTVRGWjc1TWJHbUtLenNkY0dER2Ix?=
 =?utf-8?B?YkdIOVAyZ3dwNkFRQ082a3F4U3B4OVp5YVFFcFRhUHlqRFIzWE5KRk5wSGhu?=
 =?utf-8?B?TjNYdUViZzNXbklCdFBoZ0tqNnV2bE5SKzI5NVcxejVNMUNCUXlZVmREdWJv?=
 =?utf-8?B?R2xVV2c2eEd1VFAwRERwWnU5aXJOM1A3UDJRNU5qTTlCVkZVUUl0MTRFTGF6?=
 =?utf-8?B?TGdiU0RsbzhlWkRjbUxuaGJCdE9pUGRCL0plM3kyS1UzNUdRTEova3lPZURQ?=
 =?utf-8?B?dnRKMkl5bUI0emEwekFlbzRTbnlDRll2MTRBcTB2VGYvMXc1V016YmN6TjE0?=
 =?utf-8?B?RU1YUHhuZlRZM0dwMm9KSVNNMGMzWVEyWFJFTjdhUXhGcjdSRlhVQTVmN2k1?=
 =?utf-8?B?U0lta05pS1UraE1jNG84dEdVWGZDS3RCNDZrVC9uVkdiSGpZR3hlTnV0Nlla?=
 =?utf-8?B?dDRKb0M0MTZ5aldJTkx6bTNidlYydEoxUDFKUWhCYjdRZ2dubjlBRGd2cEda?=
 =?utf-8?B?U3dzOFJ0bk1QSXZhWE5uTWJKM0h5K053TGc2eVRITVVaUTVNSVBwaU41d1pD?=
 =?utf-8?B?U01sNDg3RC9oQlhrQ0JhU2tLZE1vNzdmTnNSM1BwZFFlNzZIV09iRWtOUDNN?=
 =?utf-8?B?L0E3YUplMmNsK2I0bm9rYzdjb1VmS2lISldaSUFhcVRpVkhaRldrTkxuekpq?=
 =?utf-8?B?RngzQ3kwMFBtczJETlk1NGo1TS9QR3dEV0NKWkJycG5MV1NKV1VvY3gvYVp4?=
 =?utf-8?B?TXFkbGpxeWd0RFU4TE9JZW1nWUZESDcvL2htdWJiRlRwM1czV2ZCR3NnNjBU?=
 =?utf-8?B?S0wwQWtVZUNYa3p2YXJTOHk2NXh1TWNmdko3Y01Gb3Q3RXRlV3VpVWV5cnQv?=
 =?utf-8?B?cjVaTitFbGdpT09RNktpTVNrOGthVWlBR2V3blZlWUdWSk1FMlhiay82MlhP?=
 =?utf-8?B?WWZaV0t1U3Z5Zk9HbWRKUitpVThZbFFDTDlrY0dLYWVUd2tmcnFCY0FTQTYv?=
 =?utf-8?Q?4p6oKLikKc/iMFvtkP7/qoUjyCSM2ZM5?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 21:05:59.6208 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 970e4219-c27a-41b5-7ea6-08dcbca4e5de
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B071.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6992
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


On 8/9/24 09:32, Jeffrey Hugo wrote:
> On 8/5/2024 11:39 AM, Lizhi Hou wrote:
>> +enum aie2_msg_status {
>> +    AIE2_STATUS_SUCCESS                = 0x0,
>> +    /* AIE Error codes */
>> +    AIE2_STATUS_AIE_SATURATION_ERROR        = 0x1000001,
>> +    AIE2_STATUS_AIE_FP_ERROR            = 0x1000002,
>> +    AIE2_STATUS_AIE_STREAM_ERROR            = 0x1000003,
>> +    AIE2_STATUS_AIE_ACCESS_ERROR            = 0x1000004,
>> +    AIE2_STATUS_AIE_BUS_ERROR            = 0x1000005,
>> +    AIE2_STATUS_AIE_INSTRUCTION_ERROR        = 0x1000006,
>> +    AIE2_STATUS_AIE_ECC_ERROR            = 0x1000007,
>> +    AIE2_STATUS_AIE_LOCK_ERROR            = 0x1000008,
>> +    AIE2_STATUS_AIE_DMA_ERROR            = 0x1000009,
>> +    AIE2_STATUS_AIE_MEM_PARITY_ERROR        = 0x100000a,
>> +    AIE2_STATUS_AIE_PWR_CFG_ERROR            = 0x100000b,
>> +    AIE2_STATUS_AIE_BACKTRACK_ERROR            = 0x100000c,
>> +    AIE2_STATUS_MAX_AIE_STATUS_CODE,
>> +    /* MGMT ERT Error codes */
>> +    AIE2_STATUS_MGMT_ERT_SELF_TEST_FAILURE        = 0x2000001,
>> +    AIE2_STATUS_MGMT_ERT_HASH_MISMATCH,
>> +    AIE2_STATUS_MGMT_ERT_NOAVAIL,
>> +    AIE2_STATUS_MGMT_ERT_INVALID_PARAM,
>> +    AIE2_STATUS_MGMT_ERT_ENTER_SUSPEND_FAILURE,
>> +    AIE2_STATUS_MGMT_ERT_BUSY,
>> +    AIE2_STATUS_MGMT_ERT_APPLICATION_ACTIVE,
>> +    MAX_MGMT_ERT_STATUS_CODE,
>> +    /* APP ERT Error codes */
>> +    AIE2_STATUS_APP_ERT_FIRST_ERROR            = 0x3000001,
>> +    AIE2_STATUS_APP_INVALID_INSTR,
>> +    AIE2_STATUS_APP_LOAD_PDI_FAIL,
>> +    MAX_APP_ERT_STATUS_CODE,
>> +    /* NPU RTOS Error Codes */
>> +    AIE2_STATUS_INVALID_INPUT_BUFFER        = 0x4000001,
>> +    AIE2_STATUS_INVALID_COMMAND,
>> +    AIE2_STATUS_INVALID_PARAM,
>> +    AIE2_STATUS_INVALID_OPERATION                    = 0x4000006,
>
> Looks like your alignment is off here
Thanks. I will fix it.
>
>> +    AIE2_STATUS_ASYNC_EVENT_MSGS_FULL,
>> +    AIE2_STATUS_MAX_RTOS_STATUS_CODE,
>> +    MAX_AIE2_STATUS_CODE
>> +};
>> +
>> +struct assign_mgmt_pasid_req {
>> +    u16    pasid;
>> +    u16    reserved;
>> +} __packed;
>> +
>> +struct assign_mgmt_pasid_resp {
>> +    enum aie2_msg_status    status;
>> +} __packed;
>> +
>> +struct map_host_buffer_req {
>> +    u32        context_id;
>> +    u64        buf_addr;
>> +    u64        buf_size;
>> +} __packed;
>
> You define a bunch of structures, but don't use them.  Seems like a 
> lot of dead code to me.
>
> Hard to say since you are not using these, but I'm guessing these are 
> all the message structs to the device (fw).  They should be using __ 
> types, like __u64, since the messages are crossing boundaries.
Yes. These structs are defined by device. I will switch to use __types
>
>
>> +#define MAX_CHAIN_CMDBUF_SIZE 0x1000
>
> SZ_ macro please (here and a few other places)
Sure.
>
>
>> +
>> +struct xdna_msg_header {
>> +    u32 total_size;
>> +    u32 size        : 11;
>> +    u32 rsvd0        : 5;
>> +    u32 protocol_version    : 8;
>> +    u32 rsvd1        : 8;
>
> This bitwise syntax is a really bad idea because it depends on 
> compiler behavior. You should use FIELD_PREP
Oops. I fixed some of them during internal review. I missed this one. I 
will fix it.
>
>> +    u32 id;
>> +    u32 opcode;
>> +} __packed;
>> +
>> +static_assert(sizeof(struct xdna_msg_header) == 16);
>> +
>> +struct mailbox_pkg {
>> +    struct xdna_msg_header    header;
>> +    u32            payload[];
>> +};
>> +
>> +/* The protocol version. */
>> +#define MSG_PROTOCOL_VERSION    0x1
>> +/* The tombstone value. */
>> +#define TOMBSTONE        0xDEADFACE
>> +
>> +struct mailbox_msg {
>> +    void            *handle;
>> +    int            (*notify_cb)(void *handle, const u32 *data, 
>> size_t size);
>> +    size_t            pkg_size; /* package size in bytes */
>> +    struct mailbox_pkg    pkg;
>> +};
>> +
>> +static void mailbox_reg_write(struct mailbox_channel *mb_chann, u32 
>> mbox_reg, u32 data)
>> +{
>> +    struct xdna_mailbox_res *mb_res = &mb_chann->mb->res;
>> +    u64 ringbuf_addr = mb_res->mbox_base + mbox_reg;
>> +
>> +    iowrite32(data, (void *)ringbuf_addr);
>
> Why iowrite32() over writel()?
Will change it to writel
>
>> +static int mailbox_acquire_msgid(struct mailbox_channel *mb_chann, 
>> struct mailbox_msg *mb_msg)
>> +{
>> +    unsigned long flags;
>> +    int msg_id;
>> +
>> +    spin_lock_irqsave(&mb_chann->chan_idr_lock, flags);
>> +    msg_id = idr_alloc_cyclic(&mb_chann->chan_idr, mb_msg, 0,
>> +                  MAX_MSG_ID_ENTRIES, GFP_NOWAIT);
>> +    spin_unlock_irqrestore(&mb_chann->chan_idr_lock, flags);
>
> I think an xa struct would be preferred.

Can we defer this? This is in critical path.


Thanks,

Lizhi

>
>> +    if (msg_id < 0)
>> +        return msg_id;
>> +
>> +    /*
>> +     * The IDR becomes less efficient when dealing with larger IDs.
>> +     * Thus, add MAGIC_VAL to the higher bits.
>> +     */
>> +    msg_id |= MAGIC_VAL;
>> +    return msg_id;
>> +}
>> +
