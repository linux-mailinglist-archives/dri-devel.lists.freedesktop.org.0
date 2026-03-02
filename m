Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ID3tFDv3pWmkIQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 21:46:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A79661E0998
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 21:46:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C530210E36C;
	Mon,  2 Mar 2026 20:46:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="k3XrRTec";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012069.outbound.protection.outlook.com
 [40.93.195.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 443AE10E36C
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 20:46:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xzWBnodlO7Fx9IfV1fx+spXfnkCDMnStyuYXsgUEyLKL4HPgJqw0M+rQhNUg9LLJ/WCsRxl+PpioHSJlYST6G4FOZkjFaxxaZQ2FtHP4aTLZbJyZxHriy8RFeL7Wrdf/eAiUUYEjxxybuYBIVAQH/CddF59RD5y+ul9WGG5FSu6IbZJfrG2GQmzSTkKx12hZ/KxN42bAsM9JBMNaakMM8mz/UHhZ3Q7E+VyoY4md1Y5Rigif4lW1UuyWzGdXvDs9tjrjzICEa4pEvzUD7ukW+muyUv87VS4r8WXziMswEYe5I6GyKEuSlF5WkfCCvO/anmIiaVbr5Wp166IOJrRSAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2E6wcNigTtzEPU63dJBunEv9G27ChHHGHCjPLSrPCsA=;
 b=paLNKUjETF3j5w4HTIT9DIFJjEMj/tW6bJSKTtoCNgIN6rYYHiRC2j3y3Ib3Wh2qmx4BcrZx/J4fHDlII6ahWcj0OZT9l9QjBii3gLv+UOQvTmcECKCcX50XZw/JPKJvlelfnFdCr6q0bkiYYqit1bVXh7BOf1dk9ciIG22s1KcF5EK00Kdg8lK+u6xmks9Q9j1ga9wQgod5T6xDYdEcxn2GOTExkfDJXMSzAU9xpql1h3IgSbZxgfhsGBmrA5wGF/DFlBuS4zIZ/mIDc/dUnOSB9vu90InAOm6dzrweo5iHN8TYaatgMmKWcepWZBaMaxMDPyXV/vksYbrF7WnE2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2E6wcNigTtzEPU63dJBunEv9G27ChHHGHCjPLSrPCsA=;
 b=k3XrRTecQ1D1n6FL0um+Yen4SZ2K1bcvr8izQhfA0gn4hyrUTX7nViuUTCHxl8yOw1WXsDaSscOKYYu4gMXvYp/NcQsYxh175fnUE61/wxPtZboP3IVG8OtRwTRY6ZdZ05CFL/8VfMnmq0q/Q7WpgQSNQqxY36Q5+nTWoblGDrs=
Received: from SJ0PR13CA0028.namprd13.prod.outlook.com (2603:10b6:a03:2c0::33)
 by SA1PR12MB9470.namprd12.prod.outlook.com (2603:10b6:806:459::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Mon, 2 Mar
 2026 20:46:41 +0000
Received: from CO1PEPF000066EB.namprd05.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::38) by SJ0PR13CA0028.outlook.office365.com
 (2603:10b6:a03:2c0::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.20 via Frontend Transport; Mon,
 2 Mar 2026 20:46:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000066EB.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 20:46:39 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 2 Mar
 2026 14:46:39 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 2 Mar
 2026 14:46:38 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 2 Mar 2026 14:46:38 -0600
Message-ID: <9e00cfdd-23ce-51b9-1ad1-bf41188e7fdf@amd.com>
Date: Mon, 2 Mar 2026 12:46:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] accel/ivpu: Limit number of maximum contexts and
 doorbells per user
Content-Language: en-US
To: "Falkowski, Maciej" <maciej.falkowski@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <oded.gabbay@gmail.com>, <jeff.hugo@oss.qualcomm.com>,
 <karol.wachowski@linux.intel.com>
References: <20260225180638.316126-1-maciej.falkowski@linux.intel.com>
 <88c1af96-5593-2554-2e17-269bed38d000@amd.com>
 <68617c15-c13a-488b-8c2b-54a342fcdfae@linux.intel.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <68617c15-c13a-488b-8c2b-54a342fcdfae@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EB:EE_|SA1PR12MB9470:EE_
X-MS-Office365-Filtering-Correlation-Id: c80cd933-5161-4217-4c6e-08de789cce11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026|7053199007; 
X-Microsoft-Antispam-Message-Info: 2NoqHWtar5pqZOOp6pBL9rRWWn+zUH321FdHycFlxodHm1dVseIur3u3ES48Bp2dWQeZCIv+yw02UEmak8TwM4ZehZavGrBj0esSDQ114ILm5WpU1MjhIFTw9/OcaqQyIk1xQpkRqdctVCaN3z6dXQj9g/8NLzwpMcbhaUfp2rGSvIKtq/ZtiGACPtN7yWNwteppqJcUM7yZ9gxRg1wFpqW57mArFhE6IJ0lBgM7lwaNjoenyGOiy0SjN53SfupwHVZvLqPyjytlvi9O4nZNrFwN7grqAXFlj+1j2W312KcSlyAIW8OZr8NH608nndCuI7GYjXcFN6D8J9p0RS9bxnjJF0qe8ThrKpSqT6tE9E9Rm3aGiyeF6ZGOFfFHY3GqRFl9ojfLzdJ5NzpDrfnBx+aNg/tF9dUZrSxgorQ5F/k6h0nB2zONNuPPZiC5y7GMnweaOKhYwlHhH3A4MlRHzyOrq0WOilLHFYO5giowgcQnMVWy7L5AhdbdIO/UHWaumS/LChjK0w+jW7pqo6X950+OZqPf5cpZTSQGOxxWmvWfIPjq+ky3vXtbglQG6tP652LRRoCXxbhkDd2ELc4naEWrXjNAwMGlYRf9fSEDlkU5up+W/CIgEoKvH/RfaOhFeH6CxMLblqZauvrfv9sZfzSghkW5TobO8JLCW6IajDzGoORoDJIwcFUcYlwMq7BbJr+MOlmPc12A8VEFWwWMkBOsBzC23ji2HQpFe/lXj11k8uphfa3Y7uj7KPQD3MriqKfQfkE/NU40oDEr/rBerMpARWLXnQclsFsqDf5La6fxDCI9o9amQA6VXDQh/+6rToxB+lpFJacVxupRVG+Ebw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Be4ldiNCxwV0wQ2TemdWG0ctxGJLIroP8h68wB4V9SEXNig2Jjm36cIBzaFAmH6GLzwjDO0y68Fhn112qjqKxXYxjbYhJWbBezLR7wtOKnliFnf+1bsAiaMRZf0O+qMZz637PhAHMyM/7RFqi8kY1WU94BVBVwHX/yPM7pSbNmfG+EJZ43vp/+5eEDMzuPKegMs14UhOFErFgbwdslKvzYpnDkcqNlSJkNC+QRICUSdofJuIKKd+rIaVXRWm4TTGJSVLHV2dlHXgMJBPa+nvgDzfxjnY2w5Fb87mU9zCfExNZkLlcritlrwn1vqmzMMOoz+iTViGHwNHeb36619nNgapB50kZ0kxdBLEkfijj6aLZRdYfKqQx2G4CaXGyu8CH7ImNJq75mYCQG2CSVIvMwDgrmrlf0y6FPlzQ6O2QUesWDRkTboJCedD2VHxnRry
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 20:46:39.9322 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c80cd933-5161-4217-4c6e-08de789cce11
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9470
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
X-Rspamd-Queue-Id: A79661E0998
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:maciej.falkowski@linux.intel.com,m:oded.gabbay@gmail.com,m:jeff.hugo@oss.qualcomm.com,m:karol.wachowski@linux.intel.com,m:odedgabbay@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,oss.qualcomm.com,linux.intel.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action


On 3/2/26 12:30, Falkowski, Maciej wrote:
> On 2/25/2026 9:50 PM, Lizhi Hou wrote:
>
>> Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
> I sent v3 with a rebase & refactor to use kzalloc_obj* functions after 
> treewide change.
> Would you mind to see it and Rev-by again?

Sure. Done with my review.

Lizhi

>
> Best regards,
> Maciej
>>
>> On 2/25/26 10:06, Maciej Falkowski wrote:
>>> From: Karol Wachowski <karol.wachowski@linux.intel.com>
>>>
>>> Implement per-user resource limits to prevent resource exhaustion.
>>>
>>> Root users can allocate all available contexts (128) and doorbells
>>> (255), while non-root users are limited to half of the available
>>> resources (64 contexts and 127 doorbells respectively).
>>>
>>> This prevents scenarios where a single user could monopolize NPU
>>> resources and starve other users on multi-user systems.
>>>
>>> Change doorbell ID and command queue ID allocation errors to debug
>>> messages as those are user triggered.
>>>
>>> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
>>> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
>>> ---
>>> v1 -> v2:
>>>    - Fixed off-by-one error (Lizhi)
>>> ---
>>>   drivers/accel/ivpu/ivpu_drv.c | 94 
>>> ++++++++++++++++++++++++++++++++---
>>>   drivers/accel/ivpu/ivpu_drv.h | 26 ++++++++--
>>>   drivers/accel/ivpu/ivpu_job.c | 36 ++++++++++----
>>>   3 files changed, 136 insertions(+), 20 deletions(-)
>>>
>>> diff --git a/drivers/accel/ivpu/ivpu_drv.c 
>>> b/drivers/accel/ivpu/ivpu_drv.c
>>> index 3b6ec8eecf2f..1d9f7d2f71a2 100644
>>> --- a/drivers/accel/ivpu/ivpu_drv.c
>>> +++ b/drivers/accel/ivpu/ivpu_drv.c
>>> @@ -68,6 +68,73 @@ bool ivpu_force_snoop;
>>>   module_param_named(force_snoop, ivpu_force_snoop, bool, 0444);
>>>   MODULE_PARM_DESC(force_snoop, "Force snooping for NPU host memory 
>>> access");
>>>   +static struct ivpu_user_limits *ivpu_user_limits_alloc(struct 
>>> ivpu_device *vdev, uid_t uid)
>>> +{
>>> +    struct ivpu_user_limits *limits;
>>> +
>>> +    limits = kzalloc(sizeof(*limits), GFP_KERNEL);
>>> +    if (!limits)
>>> +        return ERR_PTR(-ENOMEM);
>>> +
>>> +    kref_init(&limits->ref);
>>> +    atomic_set(&limits->db_count, 0);
>>> +    limits->vdev = vdev;
>>> +    limits->uid = uid;
>>> +
>>> +    /* Allow root user to allocate all contexts */
>>> +    if (uid == 0) {
>>> +        limits->max_ctx_count = ivpu_get_context_count(vdev);
>>> +        limits->max_db_count = ivpu_get_doorbell_count(vdev);
>>> +    } else {
>>> +        limits->max_ctx_count = ivpu_get_context_count(vdev) / 2;
>>> +        limits->max_db_count = ivpu_get_doorbell_count(vdev) / 2;
>>> +    }
>>> +
>>> +    hash_add(vdev->user_limits, &limits->hash_node, uid);
>>> +
>>> +    return limits;
>>> +}
>>> +
>>> +static struct ivpu_user_limits *ivpu_user_limits_get(struct 
>>> ivpu_device *vdev)
>>> +{
>>> +    struct ivpu_user_limits *limits;
>>> +    uid_t uid = current_uid().val;
>>> +
>>> +    guard(mutex)(&vdev->user_limits_lock);
>>> +
>>> +    hash_for_each_possible(vdev->user_limits, limits, hash_node, 
>>> uid) {
>>> +        if (limits->uid == uid) {
>>> +            if (kref_read(&limits->ref) >= limits->max_ctx_count) {
>>> +                ivpu_dbg(vdev, IOCTL, "User %u exceeded max ctx 
>>> count %u\n", uid,
>>> +                     limits->max_ctx_count);
>>> +                return ERR_PTR(-EMFILE);
>>> +            }
>>> +
>>> +            kref_get(&limits->ref);
>>> +            return limits;
>>> +        }
>>> +    }
>>> +
>>> +    return ivpu_user_limits_alloc(vdev, uid);
>>> +}
>>> +
>>> +static void ivpu_user_limits_release(struct kref *ref)
>>> +{
>>> +    struct ivpu_user_limits *limits = container_of(ref, struct 
>>> ivpu_user_limits, ref);
>>> +    struct ivpu_device *vdev = limits->vdev;
>>> +
>>> +    lockdep_assert_held(&vdev->user_limits_lock);
>>> +    drm_WARN_ON(&vdev->drm, atomic_read(&limits->db_count));
>>> +    hash_del(&limits->hash_node);
>>> +    kfree(limits);
>>> +}
>>> +
>>> +static void ivpu_user_limits_put(struct ivpu_device *vdev, struct 
>>> ivpu_user_limits *limits)
>>> +{
>>> +    guard(mutex)(&vdev->user_limits_lock);
>>> +    kref_put(&limits->ref, ivpu_user_limits_release);
>>> +}
>>> +
>>>   struct ivpu_file_priv *ivpu_file_priv_get(struct ivpu_file_priv 
>>> *file_priv)
>>>   {
>>>       struct ivpu_device *vdev = file_priv->vdev;
>>> @@ -111,6 +178,7 @@ static void file_priv_release(struct kref *ref)
>>>       mutex_unlock(&vdev->context_list_lock);
>>>       pm_runtime_put_autosuspend(vdev->drm.dev);
>>>   +    ivpu_user_limits_put(vdev, file_priv->user_limits);
>>>       mutex_destroy(&file_priv->ms_lock);
>>>       mutex_destroy(&file_priv->lock);
>>>       kfree(file_priv);
>>> @@ -170,7 +238,7 @@ static int ivpu_get_param_ioctl(struct 
>>> drm_device *dev, void *data, struct drm_f
>>>           args->value = ivpu_hw_dpu_max_freq_get(vdev);
>>>           break;
>>>       case DRM_IVPU_PARAM_NUM_CONTEXTS:
>>> -        args->value = ivpu_get_context_count(vdev);
>>> +        args->value = file_priv->user_limits->max_ctx_count;
>>>           break;
>>>       case DRM_IVPU_PARAM_CONTEXT_BASE_ADDRESS:
>>>           args->value = vdev->hw->ranges.user.start;
>>> @@ -232,22 +300,30 @@ static int ivpu_open(struct drm_device *dev, 
>>> struct drm_file *file)
>>>   {
>>>       struct ivpu_device *vdev = to_ivpu_device(dev);
>>>       struct ivpu_file_priv *file_priv;
>>> +    struct ivpu_user_limits *limits;
>>>       u32 ctx_id;
>>>       int idx, ret;
>>>         if (!drm_dev_enter(dev, &idx))
>>>           return -ENODEV;
>>>   +    limits = ivpu_user_limits_get(vdev);
>>> +    if (IS_ERR(limits)) {
>>> +        ret = PTR_ERR(limits);
>>> +        goto err_dev_exit;
>>> +    }
>>> +
>>>       file_priv = kzalloc(sizeof(*file_priv), GFP_KERNEL);
>>>       if (!file_priv) {
>>>           ret = -ENOMEM;
>>> -        goto err_dev_exit;
>>> +        goto err_user_limits_put;
>>>       }
>>>         INIT_LIST_HEAD(&file_priv->ms_instance_list);
>>>         file_priv->vdev = vdev;
>>>       file_priv->bound = true;
>>> +    file_priv->user_limits = limits;
>>>       kref_init(&file_priv->ref);
>>>       mutex_init(&file_priv->lock);
>>>       mutex_init(&file_priv->ms_lock);
>>> @@ -285,6 +361,8 @@ static int ivpu_open(struct drm_device *dev, 
>>> struct drm_file *file)
>>>       mutex_destroy(&file_priv->ms_lock);
>>>       mutex_destroy(&file_priv->lock);
>>>       kfree(file_priv);
>>> +err_user_limits_put:
>>> +    ivpu_user_limits_put(vdev, limits);
>>>   err_dev_exit:
>>>       drm_dev_exit(idx);
>>>       return ret;
>>> @@ -344,8 +422,7 @@ static int ivpu_wait_for_ready(struct 
>>> ivpu_device *vdev)
>>>       ivpu_ipc_consumer_del(vdev, &cons);
>>>         if (!ret && ipc_hdr.data_addr != IVPU_IPC_BOOT_MSG_DATA_ADDR) {
>>> -        ivpu_err(vdev, "Invalid NPU ready message: 0x%x\n",
>>> -             ipc_hdr.data_addr);
>>> +        ivpu_err(vdev, "Invalid NPU ready message: 0x%x\n", 
>>> ipc_hdr.data_addr);
>>>           return -EIO;
>>>       }
>>>   @@ -454,7 +531,7 @@ int ivpu_shutdown(struct ivpu_device *vdev)
>>>   }
>>>     static const struct file_operations ivpu_fops = {
>>> -    .owner        = THIS_MODULE,
>>> +    .owner = THIS_MODULE,
>>>       DRM_ACCEL_FOPS,
>>>   #ifdef CONFIG_PROC_FS
>>>       .show_fdinfo = drm_show_fdinfo,
>>> @@ -593,6 +670,7 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
>>>       xa_init_flags(&vdev->submitted_jobs_xa, XA_FLAGS_ALLOC1);
>>>       xa_init_flags(&vdev->db_xa, XA_FLAGS_ALLOC1);
>>>       INIT_LIST_HEAD(&vdev->bo_list);
>>> +    hash_init(vdev->user_limits);
>>>         vdev->db_limit.min = IVPU_MIN_DB;
>>>       vdev->db_limit.max = IVPU_MAX_DB;
>>> @@ -601,6 +679,10 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
>>>       if (ret)
>>>           goto err_xa_destroy;
>>>   +    ret = drmm_mutex_init(&vdev->drm, &vdev->user_limits_lock);
>>> +    if (ret)
>>> +        goto err_xa_destroy;
>>> +
>>>       ret = drmm_mutex_init(&vdev->drm, &vdev->submitted_jobs_lock);
>>>       if (ret)
>>>           goto err_xa_destroy;
>>> @@ -718,7 +800,7 @@ static struct pci_device_id ivpu_pci_ids[] = {
>>>       { PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_PTL_P) },
>>>       { PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_WCL) },
>>>       { PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_NVL) },
>>> -    { }
>>> +    {}
>>>   };
>>>   MODULE_DEVICE_TABLE(pci, ivpu_pci_ids);
>>>   diff --git a/drivers/accel/ivpu/ivpu_drv.h 
>>> b/drivers/accel/ivpu/ivpu_drv.h
>>> index 78ecddf2831d..0b5aa41151c6 100644
>>> --- a/drivers/accel/ivpu/ivpu_drv.h
>>> +++ b/drivers/accel/ivpu/ivpu_drv.h
>>> @@ -12,6 +12,7 @@
>>>   #include <drm/drm_mm.h>
>>>   #include <drm/drm_print.h>
>>>   +#include <linux/hashtable.h>
>>>   #include <linux/pci.h>
>>>   #include <linux/xarray.h>
>>>   #include <uapi/drm/ivpu_accel.h>
>>> @@ -43,7 +44,7 @@
>>>   /* SSID 1 is used by the VPU to represent reserved context */
>>>   #define IVPU_RESERVED_CONTEXT_MMU_SSID 1
>>>   #define IVPU_USER_CONTEXT_MIN_SSID     2
>>> -#define IVPU_USER_CONTEXT_MAX_SSID (IVPU_USER_CONTEXT_MIN_SSID + 63)
>>> +#define IVPU_USER_CONTEXT_MAX_SSID (IVPU_USER_CONTEXT_MIN_SSID + 128)
>>>     #define IVPU_MIN_DB 1
>>>   #define IVPU_MAX_DB 255
>>> @@ -51,9 +52,6 @@
>>>   #define IVPU_JOB_ID_JOB_MASK        GENMASK(7, 0)
>>>   #define IVPU_JOB_ID_CONTEXT_MASK    GENMASK(31, 8)
>>>   -#define IVPU_NUM_PRIORITIES    4
>>> -#define IVPU_NUM_CMDQS_PER_CTX (IVPU_NUM_PRIORITIES)
>>> -
>>>   #define IVPU_CMDQ_MIN_ID 1
>>>   #define IVPU_CMDQ_MAX_ID 255
>>>   @@ -124,6 +122,16 @@ struct ivpu_fw_info;
>>>   struct ivpu_ipc_info;
>>>   struct ivpu_pm_info;
>>>   +struct ivpu_user_limits {
>>> +    struct hlist_node hash_node;
>>> +    struct ivpu_device *vdev;
>>> +    struct kref ref;
>>> +    u32 max_ctx_count;
>>> +    u32 max_db_count;
>>> +    u32 uid;
>>> +    atomic_t db_count;
>>> +};
>>> +
>>>   struct ivpu_device {
>>>       struct drm_device drm;
>>>       void __iomem *regb;
>>> @@ -143,6 +151,8 @@ struct ivpu_device {
>>>       struct mutex context_list_lock; /* Protects user context 
>>> addition/removal */
>>>       struct xarray context_xa;
>>>       struct xa_limit context_xa_limit;
>>> +    DECLARE_HASHTABLE(user_limits, 8);
>>> +    struct mutex user_limits_lock; /* Protects user_limits */
>>>         struct xarray db_xa;
>>>       struct xa_limit db_limit;
>>> @@ -190,6 +200,7 @@ struct ivpu_file_priv {
>>>       struct list_head ms_instance_list;
>>>       struct ivpu_bo *ms_info_bo;
>>>       struct xa_limit job_limit;
>>> +    struct ivpu_user_limits *user_limits;
>>>       u32 job_id_next;
>>>       struct xa_limit cmdq_limit;
>>>       u32 cmdq_id_next;
>>> @@ -287,6 +298,13 @@ static inline u32 ivpu_get_context_count(struct 
>>> ivpu_device *vdev)
>>>       return (ctx_limit.max - ctx_limit.min + 1);
>>>   }
>>>   +static inline u32 ivpu_get_doorbell_count(struct ivpu_device *vdev)
>>> +{
>>> +    struct xa_limit db_limit = vdev->db_limit;
>>> +
>>> +    return (db_limit.max - db_limit.min + 1);
>>> +}
>>> +
>>>   static inline u32 ivpu_get_platform(struct ivpu_device *vdev)
>>>   {
>>>       WARN_ON_ONCE(vdev->platform == IVPU_PLATFORM_INVALID);
>>> diff --git a/drivers/accel/ivpu/ivpu_job.c 
>>> b/drivers/accel/ivpu/ivpu_job.c
>>> index 4f8564e2878a..337ed269fd3e 100644
>>> --- a/drivers/accel/ivpu/ivpu_job.c
>>> +++ b/drivers/accel/ivpu/ivpu_job.c
>>> @@ -173,7 +173,7 @@ static struct ivpu_cmdq *ivpu_cmdq_create(struct 
>>> ivpu_file_priv *file_priv, u8 p
>>>       ret = xa_alloc_cyclic(&file_priv->cmdq_xa, &cmdq->id, cmdq, 
>>> file_priv->cmdq_limit,
>>>                     &file_priv->cmdq_id_next, GFP_KERNEL);
>>>       if (ret < 0) {
>>> -        ivpu_err(vdev, "Failed to allocate command queue ID: %d\n", 
>>> ret);
>>> +        ivpu_dbg(vdev, IOCTL, "Failed to allocate command queue ID: 
>>> %d\n", ret);
>>>           goto err_free_cmdq;
>>>       }
>>>   @@ -215,14 +215,22 @@ static int ivpu_hws_cmdq_init(struct 
>>> ivpu_file_priv *file_priv, struct ivpu_cmdq
>>>     static int ivpu_register_db(struct ivpu_file_priv *file_priv, 
>>> struct ivpu_cmdq *cmdq)
>>>   {
>>> +    struct ivpu_user_limits *limits = file_priv->user_limits;
>>>       struct ivpu_device *vdev = file_priv->vdev;
>>>       int ret;
>>>   +    if (atomic_inc_return(&limits->db_count) > 
>>> limits->max_db_count) {
>>> +        ivpu_dbg(vdev, IOCTL, "Maximum number of %u doorbells for 
>>> uid %u reached\n",
>>> +             limits->max_db_count, limits->uid);
>>> +        ret = -EBUSY;
>>> +        goto err_dec_db_count;
>>> +    }
>>> +
>>>       ret = xa_alloc_cyclic(&vdev->db_xa, &cmdq->db_id, NULL, 
>>> vdev->db_limit, &vdev->db_next,
>>>                     GFP_KERNEL);
>>>       if (ret < 0) {
>>> -        ivpu_err(vdev, "Failed to allocate doorbell ID: %d\n", ret);
>>> -        return ret;
>>> +        ivpu_dbg(vdev, IOCTL, "Failed to allocate doorbell ID: 
>>> %d\n", ret);
>>> +        goto err_dec_db_count;
>>>       }
>>>         if (vdev->fw->sched_mode == VPU_SCHEDULING_MODE_HW)
>>> @@ -231,15 +239,18 @@ static int ivpu_register_db(struct 
>>> ivpu_file_priv *file_priv, struct ivpu_cmdq *
>>>       else
>>>           ret = ivpu_jsm_register_db(vdev, file_priv->ctx.id, 
>>> cmdq->db_id,
>>>                          cmdq->mem->vpu_addr, ivpu_bo_size(cmdq->mem));
>>> -
>>> -    if (!ret) {
>>> -        ivpu_dbg(vdev, JOB, "DB %d registered to cmdq %d ctx %d 
>>> priority %d\n",
>>> -             cmdq->db_id, cmdq->id, file_priv->ctx.id, 
>>> cmdq->priority);
>>> -    } else {
>>> +    if (ret) {
>>>           xa_erase(&vdev->db_xa, cmdq->db_id);
>>>           cmdq->db_id = 0;
>>> +        goto err_dec_db_count;
>>>       }
>>>   +    ivpu_dbg(vdev, JOB, "DB %d registered to cmdq %d ctx %d 
>>> priority %d\n",
>>> +         cmdq->db_id, cmdq->id, file_priv->ctx.id, cmdq->priority);
>>> +    return 0;
>>> +
>>> +err_dec_db_count:
>>> +    atomic_dec(&limits->db_count);
>>>       return ret;
>>>   }
>>>   @@ -298,6 +309,7 @@ static int ivpu_cmdq_unregister(struct 
>>> ivpu_file_priv *file_priv, struct ivpu_cm
>>>       }
>>>         xa_erase(&file_priv->vdev->db_xa, cmdq->db_id);
>>> +    atomic_dec(&file_priv->user_limits->db_count);
>>>       cmdq->db_id = 0;
>>>         return 0;
>>> @@ -313,6 +325,7 @@ static inline u8 ivpu_job_to_jsm_priority(u8 
>>> priority)
>>>     static void ivpu_cmdq_destroy(struct ivpu_file_priv *file_priv, 
>>> struct ivpu_cmdq *cmdq)
>>>   {
>>> +    lockdep_assert_held(&file_priv->lock);
>>>       ivpu_cmdq_unregister(file_priv, cmdq);
>>>       xa_erase(&file_priv->cmdq_xa, cmdq->id);
>>>       ivpu_cmdq_free(file_priv, cmdq);
>>> @@ -380,8 +393,11 @@ static void ivpu_cmdq_reset(struct 
>>> ivpu_file_priv *file_priv)
>>>       mutex_lock(&file_priv->lock);
>>>         xa_for_each(&file_priv->cmdq_xa, cmdq_id, cmdq) {
>>> -        xa_erase(&file_priv->vdev->db_xa, cmdq->db_id);
>>> -        cmdq->db_id = 0;
>>> +        if (cmdq->db_id) {
>>> +            xa_erase(&file_priv->vdev->db_xa, cmdq->db_id);
>>> + atomic_dec(&file_priv->user_limits->db_count);
>>> +            cmdq->db_id = 0;
>>> +        }
>>>       }
>>>         mutex_unlock(&file_priv->lock);
