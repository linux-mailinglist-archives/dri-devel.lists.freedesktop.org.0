Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE6ECADC3A
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 17:34:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5DF410E057;
	Mon,  8 Dec 2025 16:34:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yb3B9MBZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010062.outbound.protection.outlook.com
 [52.101.193.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEE3A10E057
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 16:34:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AU7NE5B8tkPbrchruCNy06f9KzZJKOh5Oe+HevXPv/Dxsiu0CveTojKwrpb6aOLOOScQUOUQaEZtuJl9d4LcaydMxs6oI3wcsuLWitPh7+EOGQDpH2U2TvYOIpEXuNXefOEGhj33T4cFctymnvZl5+UE6scwsEg1zr1GpBCRpNlD8HnFgcnUJKEJ9wsl2ViyF6phQ2WhzHUbdZ20t23rp6aojSSqIVOfWW7AtG/GgAlAD7BkZdbuBiS0Wza25UL5AlaJ14jmX7x6AU3tlvLnCrEKgJSZM6OAB9lICrRnnoVltpr/58y8VU4b9covioB/FJqnNAiKZGudL+GyAz7INA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HZx59ppkmJm8j1vYtVtKpevVMnaA7hEIaVY0gcGeIKw=;
 b=dkPXm40pNDAL5Zhlvq+XKkBkI5xNJocARLzK/MWq9BRstMYmYwAT+z4+LSUdZTHls2DFzSDl045YGk1s7Ks00sPCdmW+h49rUGprgdhED1djD7uvakaVtKICZfToqPt1IZxK9Icya/WsWn3OvcogUgq3RmSx/2+9WaR9AjRPVPUza3hv+Uk+UwVhZvkq6taFye67oiAdXNB7o/ewHv57xTmsSXo9qF9sl1cmbrSlh1TZ610KB3UfHoEfqNyT9WfvnMqenfeG3xorRBo0K9WxeUVCIA6S/XbhStZ4TKViWd/UQDIngALBnKOHFfV49flgxC59vBR8kk+rcYGDmNIZXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HZx59ppkmJm8j1vYtVtKpevVMnaA7hEIaVY0gcGeIKw=;
 b=yb3B9MBZ2hc0j2B3K9X/lO4xeBkke6WLT/PxLABNGHWi+Jug2xwFZBKccRa5oX9EoVQWU+UK74+LvBEkgBhiYkhgPPqSupzxMXAP3OKQmALmUi/zsoKJ+cFgHwmknNqPmzcQnxIc1NiZz1Zd/JO8/KwMrkYMiHGclhzivI/Xb3A=
Received: from SJ0PR03CA0271.namprd03.prod.outlook.com (2603:10b6:a03:39e::6)
 by SJ2PR12MB8111.namprd12.prod.outlook.com (2603:10b6:a03:4fe::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Mon, 8 Dec
 2025 16:34:27 +0000
Received: from SJ1PEPF000023D9.namprd21.prod.outlook.com
 (2603:10b6:a03:39e:cafe::a7) by SJ0PR03CA0271.outlook.office365.com
 (2603:10b6:a03:39e::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Mon,
 8 Dec 2025 16:34:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023D9.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.0 via Frontend Transport; Mon, 8 Dec 2025 16:34:27 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 8 Dec
 2025 10:34:26 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 8 Dec
 2025 10:34:26 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 8 Dec 2025 08:34:25 -0800
Message-ID: <bc2f1460-24db-67bd-af93-078bbf0b393d@amd.com>
Date: Mon, 8 Dec 2025 08:34:20 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V1] accel/amdxdna: Fix tail-pointer polling in
 mailbox_get_msg()
Content-Language: en-US
To: "Falkowski, Maciej" <maciej.falkowski@linux.intel.com>,
 <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <mario.limonciello@amd.com>
References: <20251204181603.793824-1-lizhi.hou@amd.com>
 <c16fb0e0-1f30-422e-9785-78ac0b8c4783@linux.intel.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <c16fb0e0-1f30-422e-9785-78ac0b8c4783@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D9:EE_|SJ2PR12MB8111:EE_
X-MS-Office365-Filtering-Correlation-Id: aaa558f6-bc4b-4ddf-3b33-08de3677a7a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b3VxZjlWZGR5ZzNyN24vaEg1TXZMQysrL2VhdlBlQ1lQVXBkVFNJUHYwS3g4?=
 =?utf-8?B?S0hxaGpqdjdsNjJwZEJidzZlRGxSdDk2Y3hXdlVCSndDVVVTQ1dndkpEeVJO?=
 =?utf-8?B?WHRCZ2Y1UWxXM0twTEhidGVKRWtXcEhHQ1M4NW9YUUc4Y3BVR1pFeEIvRHlv?=
 =?utf-8?B?aFRWWmxnb245a1B1N1BpN2hieU5PTEl0TmJoZkxzdVh3SFFPY1J5RUVDOEJs?=
 =?utf-8?B?THRXcHhoM01hc21SY2NKZ3ptelVVam01Tkpyclg5cVN6eVpUS0RtT3lOTytB?=
 =?utf-8?B?MncyY3ZzNytLZHBSWDdtNko1VnhhRjZsNlpVa3g5eisxbzEyd3IxS1Y3aUZx?=
 =?utf-8?B?RFQxMXEyc0NCYU8vdmtaVVdZZE9VKzBiQWFKblYzMlBwT0VuNFQvOVR5by8z?=
 =?utf-8?B?QUVnRFRjd2wrUXdKRzF0b05KR0pKekd0RTI3Y1Y2THlKeVFkNGY1aXR6NEc3?=
 =?utf-8?B?aFRHaWpBVzNMb0tER3lGb2lqVCtCR2JpeGwyOHY2QXNaYzgwcnU2eWtWTWlE?=
 =?utf-8?B?YTVnamlLWEhDWHloVVQ3WnRHWHhWVXczZUtwN2xndC9ON1cvVGtNQm9QMEp4?=
 =?utf-8?B?VEpBZnB3bnZGeU82VWg0ZWZzV3h4RU1oeGR1dzZtVTBqZXFkQjNFK080UlRk?=
 =?utf-8?B?ZXdyU1cyT3M4WGlIeG9GM09SN0NTZmpNeC9uQlFKRU1sdlBONXVkN0w3bVJR?=
 =?utf-8?B?RUdyaGFWbGdDTGlleFpiVU9vbTVtaG8vblZyazlVTk5RZHJ2QVo2Rkg2b2ZY?=
 =?utf-8?B?Szk5OVo3OUJRYW5ldy9wb3ByZElCTnZLZjIwKzQ1WVlOaVQ1SGRuSjUzdy9U?=
 =?utf-8?B?ekt3WkNMTFpHSXgwMDJhUTNCcnQ5K3l3QnhmazNqZE9iL1ZwTjlUK3ViTHZS?=
 =?utf-8?B?M25EbUIwWmN6ajQ1NXc5c2tNMVBnY2ZyQkhYbzJyNmZRSjkwbzRZY1Yza0Jz?=
 =?utf-8?B?MGRKYyszbXBrbmp6Y2tIMUI1UDFOa2ZWcWdaTWlKcVU1NFpZZG1JeFlhWmp6?=
 =?utf-8?B?Q045UjM4WDdpTEVNNUJKUFg0cnBXcHQzZm0yT3dmYjBTcjZFQk1ORzcxVVVP?=
 =?utf-8?B?QmdTbHVMaEN3ZCsyQ2NpQ2VFVjlpQldVWmdkN2YzQTRQTHlLTlFESzVGbHUy?=
 =?utf-8?B?RUREaWh2UmFUOWg2enljdElZVzQ1VzVocStxamNib0hDNzV3UWpoWUJSRmRR?=
 =?utf-8?B?cTg4SjFDNlFSa2RsSWJ6bUlxejZWOEtLMElwQThSQ1BiRk9kNFZWYldPaDlN?=
 =?utf-8?B?Qyt1bFVyUDlmQ0d3am9odmNjdWc4MGE4b2sxRFM1SUNjV2pFekdoTkt4aTAy?=
 =?utf-8?B?Q2syR0RtUmVPOXVLK3BBdEZCSVg0eHhTY2xqeUFwc0xGd1RKZGZGbFpXeVlC?=
 =?utf-8?B?YXdqb1FBRHlCdm5zM0ZBNnRLWEtOZkhqaXhOaWtJN1FIclg3dkYrdHNVR3Y5?=
 =?utf-8?B?TGxlZHlPUUVCcTIvWDdHalJtNnNhMXFWNFNqSm5abE5YZm9MeG1DcWdMalFN?=
 =?utf-8?B?c1BPK3Y0cTNpcjBlaUtjYUQySmpvYlkxL2ZYQzEwc1FqNkRKSFNwLzN2Yi9F?=
 =?utf-8?B?U1hyV0RaR0JoaVdoWmlkRTZ6dlFXem9pL0tycFE2TW1rSUFMTnh3UkpNY0tm?=
 =?utf-8?B?aFpvUXFjQk03Z3pzSzIrQWdITDFyRWxkS3BScVRIdWJ6NnlzQm1pWFJCSUZv?=
 =?utf-8?B?N3M1d0xGaHVwVGpxZGgybXFRUlhsU2t5RE9USGk3dnAyZlgvYTF5cWhzRE1W?=
 =?utf-8?B?K0xYNkdmbHk0RExyKzNEQ1ZvMy9wK1pxTzJHMEsvSnBLdFowWGVKL25TZHRz?=
 =?utf-8?B?U1RxWjRRaWJ1MTFVYjJIcngzN1hTOFJEUXNPeGlTZ25rc0wwS2ZBTXRCL3Bt?=
 =?utf-8?B?QWxkU05sbjRkTTE5NXhTZ1FXKy9XWnZUZ25RazZnVlVMTk5VWUFxRXVJQ09t?=
 =?utf-8?B?UHpqb3YxQmdKNWJHOWRYcnRvVDg2Z3RONFF2Y2taTitTZmVwWWMzQzVlLy84?=
 =?utf-8?B?RUU2MEpqSTNvdVM5MlR1NlhiSWdnVzc2VU1tL0V6RnNybDJTeXNsajBBM3Yx?=
 =?utf-8?B?OHdFWEtMd2txZDR0cEh5bUtEWitidzR6SFFyZyt2STRtVjhta3FkSmVJMlAr?=
 =?utf-8?Q?VSFA=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 16:34:27.3620 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aaa558f6-bc4b-4ddf-3b33-08de3677a7a7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8111
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

Applied to drm-misc-next

On 12/5/25 08:41, Falkowski, Maciej wrote:
> Reviewed-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
>
> On 12/4/2025 7:16 PM, Lizhi Hou wrote:
>> In mailbox_get_msg(), mailbox_reg_read_non_zero() is called to poll 
>> for a
>> non-zero tail pointer. This assumed that a zero value indicates an 
>> error.
>> However, certain corner cases legitimately produce a zero tail pointer.
>> To handle these cases, remove mailbox_reg_read_non_zero(). The zero tail
>> pointer will be treated as a valid rewind event.
>>
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>> ---
>>   drivers/accel/amdxdna/amdxdna_mailbox.c | 19 +------------------
>>   1 file changed, 1 insertion(+), 18 deletions(-)
>>
>> diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c 
>> b/drivers/accel/amdxdna/amdxdna_mailbox.c
>> index 858df97cd3fb..a60a85ce564c 100644
>> --- a/drivers/accel/amdxdna/amdxdna_mailbox.c
>> +++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
>> @@ -112,22 +112,6 @@ static u32 mailbox_reg_read(struct 
>> mailbox_channel *mb_chann, u32 mbox_reg)
>>       return readl(ringbuf_addr);
>>   }
>>   -static int mailbox_reg_read_non_zero(struct mailbox_channel 
>> *mb_chann, u32 mbox_reg, u32 *val)
>> -{
>> -    struct xdna_mailbox_res *mb_res = &mb_chann->mb->res;
>> -    void __iomem *ringbuf_addr = mb_res->mbox_base + mbox_reg;
>> -    int ret, value;
>> -
>> -    /* Poll till value is not zero */
>> -    ret = readx_poll_timeout(readl, ringbuf_addr, value,
>> -                 value, 1 /* us */, 100);
>> -    if (ret < 0)
>> -        return ret;
>> -
>> -    *val = value;
>> -    return 0;
>> -}
>> -
>>   static inline void
>>   mailbox_set_headptr(struct mailbox_channel *mb_chann, u32 headptr_val)
>>   {
>> @@ -286,8 +270,7 @@ static int mailbox_get_msg(struct mailbox_channel 
>> *mb_chann)
>>       u32 start_addr;
>>       int ret;
>>   -    if (mailbox_reg_read_non_zero(mb_chann, 
>> mb_chann->res[CHAN_RES_I2X].mb_tail_ptr_reg, &tail))
>> -        return -EINVAL;
>> +    tail = mailbox_get_tailptr(mb_chann, CHAN_RES_I2X);
>>       head = mb_chann->i2x_head;
>>       ringbuf_size = mailbox_get_ringbuf_size(mb_chann, CHAN_RES_I2X);
>>       start_addr = mb_chann->res[CHAN_RES_I2X].rb_start_addr;
