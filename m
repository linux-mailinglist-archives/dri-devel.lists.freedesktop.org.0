Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7021B40F5C
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 23:27:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A967C10E0A6;
	Tue,  2 Sep 2025 21:27:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Z8CYi0Il";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2084.outbound.protection.outlook.com [40.107.237.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 542CF10E0A6
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 21:27:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OYbVzs2PQuZkwatjMUQtoNh4KyAlg1hrYr+jBH8dM6b5UlxkulWMinOnkXI0seFd3QhTuDfGditdjkAScY3zEiYTp+q1Ebca18Qs0BcMWnFnGJRsncwkv0O+Cp4M8FiU/oMRex5OvIoCgYHygRoyorg8WMHAWX4L9UxX1u4yxWK1YmA8plfphZUPPPZnQlV6TJaZssqVldTFj7qjxj3/gQpyfUGHmnRPm8blMfXveuGRgiqFiOHcXtbeyxc7c1Rbe6hhQi1NzXqHdH1KLA6R6Nrfud508PqAOYaA6qBv0nCkdKSOFd4Z62PtW1KeVERhx2ElXNsVs8rvdIiNMArAbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DUHKbDYQB3LIFFB3k68x8t3I/tre1SlC/Eyu2tOKAmo=;
 b=XinC4GCS7RCrnope/XfUx0I8Xnca3PFxVNGEvNHCAk4qOyitBxlpSebmG12rwITtEm6d1NAwmy42IDoxP1z4vri8+vv/ivwGKXwIQhjO5zeqaDA8OZWj3R1QSsXPXh2Z5bIPzCgVayIV4Fk0AYT4z+G/Ej04170e9tT+EfzSWJ3wanvVZx4CUXOW1D4j8myVVM5R81HYtUjw1jryUytgWt+JEOD2dfnL67RS4quXp1dFvdg67olqyUcjx3x/wzErDMpVKlFcTNWhQQQwuTNSDCXVeobuLXNrKuh7xYh7DOcBmTSpq27towx/EER9r5C+c+eWJzKUIBZcrWsXTTvN2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DUHKbDYQB3LIFFB3k68x8t3I/tre1SlC/Eyu2tOKAmo=;
 b=Z8CYi0IlaO80+nc7FoaVr7bYMv7fMtnvSvMwXM6hlO5o8g7QjfWTgfGTp31k9R9V/BGtVoK05O0FfRlSODonrSQ5yAPLtckanEaz5LO6XZdkBV4kLsEHQN1NPE4sc/b8YvCobsYeVdXi1IZ89cRIHn39w/S8FoiQmV5ebH9P13w=
Received: from SJ0PR13CA0103.namprd13.prod.outlook.com (2603:10b6:a03:2c5::18)
 by SJ5PPFCB5E1B8F5.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::9a1) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.29; Tue, 2 Sep
 2025 21:27:19 +0000
Received: from SA2PEPF000015CA.namprd03.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::28) by SJ0PR13CA0103.outlook.office365.com
 (2603:10b6:a03:2c5::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.16 via Frontend Transport; Tue,
 2 Sep 2025 21:27:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015CA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Tue, 2 Sep 2025 21:27:19 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 2 Sep
 2025 16:27:18 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Tue, 2 Sep
 2025 14:27:18 -0700
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 2 Sep 2025 16:27:17 -0500
Message-ID: <e39cd90c-90c8-4ec3-aa62-7621e1bcb1ee@amd.com>
Date: Tue, 2 Sep 2025 14:27:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V3] accel/amdxdna: Add ioctl DRM_IOCTL_AMDXDNA_GET_ARRAY
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>
CC: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <jacek.lawrynowicz@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <mario.limonciello@amd.com>, <maciej.falkowski@linux.intel.com>
References: <20250902175034.2056708-1-lizhi.hou@amd.com>
 <CADnq5_MvdU0v7uF8hvA=kkopGAEA=M4DDw8wAGSQMnihfSnKRw@mail.gmail.com>
 <1f4a1d11-e187-a73f-d876-f72a7f799eed@amd.com>
 <CADnq5_NH0yEBprBumF3rvdPJVtCXpR-XLgBkCVV7sOTqnu6GPw@mail.gmail.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <CADnq5_NH0yEBprBumF3rvdPJVtCXpR-XLgBkCVV7sOTqnu6GPw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CA:EE_|SJ5PPFCB5E1B8F5:EE_
X-MS-Office365-Filtering-Correlation-Id: 91f0865d-999a-404e-5df2-08ddea677f21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cXMzWjBkY2lyYWZBSFhzQmV4T1lPbXEwZzM1RERtcVoxYUhqSjF2RUs1QW9L?=
 =?utf-8?B?eGZDQVlveUJoTzdaMWdhaTEzRXhRbnQ4VUN5WnpHbUZMTzJlVDNPR0JENm5S?=
 =?utf-8?B?Z1FUMmhQMmgyUWIvalkzZFVUZWp4NFhkMjhjRDJXby8wM1ZxTWFrZWV1MWhO?=
 =?utf-8?B?WHo2d2xMSHNmNWdORit6RlVMZVlSbWNuSXlVOE9ERVdIbVhhTUpwcmxWZTRC?=
 =?utf-8?B?UlFiKzUrcnNMRERDQU41M1lCV3JJY3AwanArVlNOdXdIMDNVRDhlRWM3V3FV?=
 =?utf-8?B?eWFDR29jOVVOQkRHVDlRYVNNTE00YjVVWWFhMWR6bGdhc2hjQndmQmx0dko5?=
 =?utf-8?B?KzlrWVAvY3YzMlJFRjA4NlJLWENmV2RhQUFCK0laQ1U5TnFXQ3dPSFQ4RjhI?=
 =?utf-8?B?VGxFc0JnbXlQbXFCdjhNTXEydy9GUW54bDVSTzQwNFZpKzlOc0xQNVFuNnRZ?=
 =?utf-8?B?QktFWm5VR1ZVSkQ5T1hYbCtXT1JFWFQyZGhCY2xPaEZGSCtXM001WUVIeWRz?=
 =?utf-8?B?UFI2ZXlvNFptR1NHMzRJV25QR01xc2tEOUZ1a2RuYWFXU1BrZ3poWFJvRWhV?=
 =?utf-8?B?eEVhT2pwNVFOQ2dOZWRrb3Rlekxmc0lMQnhCbFJRb3JhbW9WVWIvRjZXMXVV?=
 =?utf-8?B?RGQvZTBLYXQzNGVySjNlN2R6b0NNa3FPMGU1d2kwWjNaa3dJL3lEcnhvcUtY?=
 =?utf-8?B?VUFLSDZWU1VvcjRNRzNXMHRhQ3lYRitKZllab0orby8xajVJM1dtelFHM1NQ?=
 =?utf-8?B?czN0WHZ1MjJ1SndMZHJBZUlJZHR4WFRKMENxczYydndPV1dvd08zN2U2KzdW?=
 =?utf-8?B?Q1NBZnRGOXl2TSt3ejRZRGR5Z2FmaW1NbDBHZ3o5SHI4WTlkRHEyY3ZOMHJZ?=
 =?utf-8?B?aFhhOFl3WDZTbHhXSThtbXpURWRoK29ydDRNbjJ5Y0tiREZJMG1ySmNMOHgy?=
 =?utf-8?B?ZzBDV0lhbHpnanRyU3ltcWpQbHRxT00vOU5mUnpVQ0lGOHhIZU9IUUFLSE1s?=
 =?utf-8?B?WXB4ak1XQ2ZBTVhycmFqZUp6Y2crVER1d3FVcnZrckxubGc5SFU1OVpibitJ?=
 =?utf-8?B?OXNidFlYT2Q5bkt5S1EyVHNTUGJxQ09JbUh5OFBYSm56Z2hQcFNqellCRlZY?=
 =?utf-8?B?UkxYQzR6OFJ2NW5ONU4xTWsxaFR0U1lJMWlKMzN1dFUzUlMweXhpYVlvR0Ja?=
 =?utf-8?B?WFkzMG9GT1FVOWd5YnFFcmZyOFhVN2tFaEV6c3RVeWpmeFptcFMyYUswUENm?=
 =?utf-8?B?cndmWW5TRXNIUHQ2RFZ6bHlSTEFFSU1GdmV5UVAwRW5iTWVyMXZpcVc1WU1r?=
 =?utf-8?B?M250V21WZ2ZVelZFME9ZUTBZMXpVdkZBZXE3V1VIUHZ6MVpTVkN2Yll0aXVu?=
 =?utf-8?B?T1pnL0JxaGRDU0UrMlFsTWJiSXh5T0JsbElPR2oxOHg0SmRjMVU3VUxQT2tk?=
 =?utf-8?B?ZWZ1ajdGblhhWDcycjFjMGZBdGJ6SXYwbDE3enlid2hURzQ1cUxHVnFGVTd2?=
 =?utf-8?B?VjAwT2JJZzNhRkxJdWZsUVVOTWExMzU0U3pueW03VGdkYXh4cEdKZHNYRjlQ?=
 =?utf-8?B?bCt1WFZlR3ZKYmRzOXU4UytTR1h2Rys3YW8vdXBYTVZhejhxZWUzRGsvK1Rp?=
 =?utf-8?B?ekpjSituL0d6TWl2aU5ZaFpEN2pWSzcyVHVxd0xEazduZEdsZWU2SmpsOXVh?=
 =?utf-8?B?MWVsTkZCZG5wRjF5dVFRWjQ4dW9FNnhiUTAxYVlVZnNzblk5NU8xMDU5NVN1?=
 =?utf-8?B?d1RKUW9BZm1ZTVdBcHdxa1Uyc3VmMGpRL0trS3p3RlI1MDY2Z3F6NzZtYUE4?=
 =?utf-8?B?aU1rQnRlYWtXSDFiYTA2eUo1cEk2VFJ2Z2RXdzJWTG5Kc2d6aWpTbVRjRE5o?=
 =?utf-8?B?c0RpakFKa2hhV2puNDZENGVZYyt2NEVSZkpsUytWeGxQVDVGRmY4cW1GM1Vh?=
 =?utf-8?B?SDJ0TUlWRklYUjRIZ1BhTzE5MEd0eFNuTGtJWjFzVFdTNDN5eVhjTFNmbzU5?=
 =?utf-8?Q?bDTyws6tL1+bo9dU0/qj4Qda7KSTzA=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 21:27:19.1278 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91f0865d-999a-404e-5df2-08ddea677f21
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFCB5E1B8F5
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


On 9/2/25 13:15, Alex Deucher wrote:
> On Tue, Sep 2, 2025 at 3:58 PM Lizhi Hou <lizhi.hou@amd.com> wrote:
>>
>> On 9/2/25 12:48, Alex Deucher wrote:
>>> On Tue, Sep 2, 2025 at 2:09 PM Lizhi Hou <lizhi.hou@amd.com> wrote:
>>>> Add interface for applications to get information array. The application
>>>> provides a buffer pointer along with information type, maximum number of
>>>> entries and maximum size of each entry. The buffer may also contain match
>>>> conditions based on the information type. After the ioctl completes, the
>>>> actual number of entries and entry size are returned.
>>>>
>>>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>>>> Link: https://lore.kernel.org/r/20250827203031.1512508-1-lizhi.hou@amd.com
>>> Do you have a link to the proposed userspace which uses this new IOCTL?
>> Yes. It is used by runtime library:
>>
>> https://github.com/amd/xdna-driver/blob/main/src/shim/host/platform_host.cpp#L337
> You may want to throw that link in your commit message.

Sure. I will create V4 patch and include this.

Thanks

Lizhi

>
> Alex
>
>>
>> Lizhi
>>
>>> Alex
>>>
>>>> ---
>>>>    drivers/accel/amdxdna/aie2_pci.c        | 116 ++++++++++++++++++------
>>>>    drivers/accel/amdxdna/amdxdna_pci_drv.c |  30 ++++++
>>>>    drivers/accel/amdxdna/amdxdna_pci_drv.h |   1 +
>>>>    include/uapi/drm/amdxdna_accel.h        | 111 +++++++++++++++++++++++
>>>>    4 files changed, 232 insertions(+), 26 deletions(-)
>>>>
>>>> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
>>>> index 7a3449541107..87c425e3d2b9 100644
>>>> --- a/drivers/accel/amdxdna/aie2_pci.c
>>>> +++ b/drivers/accel/amdxdna/aie2_pci.c
>>>> @@ -785,11 +785,12 @@ static int aie2_get_clock_metadata(struct amdxdna_client *client,
>>>>
>>>>    static int aie2_hwctx_status_cb(struct amdxdna_hwctx *hwctx, void *arg)
>>>>    {
>>>> -       struct amdxdna_drm_query_hwctx *tmp __free(kfree) = NULL;
>>>> -       struct amdxdna_drm_get_info *get_info_args = arg;
>>>> -       struct amdxdna_drm_query_hwctx __user *buf;
>>>> +       struct amdxdna_drm_hwctx_entry *tmp __free(kfree) = NULL;
>>>> +       struct amdxdna_drm_get_array *array_args = arg;
>>>> +       struct amdxdna_drm_hwctx_entry __user *buf;
>>>> +       u32 size;
>>>>
>>>> -       if (get_info_args->buffer_size < sizeof(*tmp))
>>>> +       if (!array_args->num_element)
>>>>                   return -EINVAL;
>>>>
>>>>           tmp = kzalloc(sizeof(*tmp), GFP_KERNEL);
>>>> @@ -802,14 +803,23 @@ static int aie2_hwctx_status_cb(struct amdxdna_hwctx *hwctx, void *arg)
>>>>           tmp->num_col = hwctx->num_col;
>>>>           tmp->command_submissions = hwctx->priv->seq;
>>>>           tmp->command_completions = hwctx->priv->completed;
>>>> -
>>>> -       buf = u64_to_user_ptr(get_info_args->buffer);
>>>> -
>>>> -       if (copy_to_user(buf, tmp, sizeof(*tmp)))
>>>> +       tmp->pasid = hwctx->client->pasid;
>>>> +       tmp->priority = hwctx->qos.priority;
>>>> +       tmp->gops = hwctx->qos.gops;
>>>> +       tmp->fps = hwctx->qos.fps;
>>>> +       tmp->dma_bandwidth = hwctx->qos.dma_bandwidth;
>>>> +       tmp->latency = hwctx->qos.latency;
>>>> +       tmp->frame_exec_time = hwctx->qos.frame_exec_time;
>>>> +       tmp->state = AMDXDNA_HWCTX_STATE_ACTIVE;
>>>> +
>>>> +       buf = u64_to_user_ptr(array_args->buffer);
>>>> +       size = min(sizeof(*tmp), array_args->element_size);
>>>> +
>>>> +       if (copy_to_user(buf, tmp, size))
>>>>                   return -EFAULT;
>>>>
>>>> -       get_info_args->buffer += sizeof(*tmp);
>>>> -       get_info_args->buffer_size -= sizeof(*tmp);
>>>> +       array_args->buffer += size;
>>>> +       array_args->num_element--;
>>>>
>>>>           return 0;
>>>>    }
>>>> @@ -817,23 +827,24 @@ static int aie2_hwctx_status_cb(struct amdxdna_hwctx *hwctx, void *arg)
>>>>    static int aie2_get_hwctx_status(struct amdxdna_client *client,
>>>>                                    struct amdxdna_drm_get_info *args)
>>>>    {
>>>> +       struct amdxdna_drm_get_array array_args;
>>>>           struct amdxdna_dev *xdna = client->xdna;
>>>> -       struct amdxdna_drm_get_info info_args;
>>>>           struct amdxdna_client *tmp_client;
>>>>           int ret;
>>>>
>>>>           drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
>>>>
>>>> -       info_args.buffer = args->buffer;
>>>> -       info_args.buffer_size = args->buffer_size;
>>>> -
>>>> +       array_args.element_size = sizeof(struct amdxdna_drm_query_hwctx);
>>>> +       array_args.buffer = args->buffer;
>>>> +       array_args.num_element = args->buffer_size / array_args.element_size;
>>>>           list_for_each_entry(tmp_client, &xdna->client_list, node) {
>>>> -               ret = amdxdna_hwctx_walk(tmp_client, &info_args, aie2_hwctx_status_cb);
>>>> +               ret = amdxdna_hwctx_walk(tmp_client, &array_args,
>>>> +                                        aie2_hwctx_status_cb);
>>>>                   if (ret)
>>>>                           break;
>>>>           }
>>>>
>>>> -       args->buffer_size = (u32)(info_args.buffer - args->buffer);
>>>> +       args->buffer_size -= (u32)(array_args.buffer - args->buffer);
>>>>           return ret;
>>>>    }
>>>>
>>>> @@ -877,6 +888,58 @@ static int aie2_get_info(struct amdxdna_client *client, struct amdxdna_drm_get_i
>>>>           return ret;
>>>>    }
>>>>
>>>> +static int aie2_query_ctx_status_array(struct amdxdna_client *client,
>>>> +                                      struct amdxdna_drm_get_array *args)
>>>> +{
>>>> +       struct amdxdna_drm_get_array array_args;
>>>> +       struct amdxdna_dev *xdna = client->xdna;
>>>> +       struct amdxdna_client *tmp_client;
>>>> +       int ret;
>>>> +
>>>> +       drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
>>>> +
>>>> +       array_args.element_size = min(args->element_size,
>>>> +                                     sizeof(struct amdxdna_drm_hwctx_entry));
>>>> +       array_args.buffer = args->buffer;
>>>> +       array_args.num_element = args->num_element * args->element_size /
>>>> +                               array_args.element_size;
>>>> +       list_for_each_entry(tmp_client, &xdna->client_list, node) {
>>>> +               ret = amdxdna_hwctx_walk(tmp_client, &array_args,
>>>> +                                        aie2_hwctx_status_cb);
>>>> +               if (ret)
>>>> +                       break;
>>>> +       }
>>>> +
>>>> +       args->element_size = array_args.element_size;
>>>> +       args->num_element = (u32)((array_args.buffer - args->buffer) /
>>>> +                                 args->element_size);
>>>> +
>>>> +       return ret;
>>>> +}
>>>> +
>>>> +static int aie2_get_array(struct amdxdna_client *client,
>>>> +                         struct amdxdna_drm_get_array *args)
>>>> +{
>>>> +       struct amdxdna_dev *xdna = client->xdna;
>>>> +       int ret, idx;
>>>> +
>>>> +       if (!drm_dev_enter(&xdna->ddev, &idx))
>>>> +               return -ENODEV;
>>>> +
>>>> +       switch (args->param) {
>>>> +       case DRM_AMDXDNA_HW_CONTEXT_ALL:
>>>> +               ret = aie2_query_ctx_status_array(client, args);
>>>> +               break;
>>>> +       default:
>>>> +               XDNA_ERR(xdna, "Not supported request parameter %u", args->param);
>>>> +               ret = -EOPNOTSUPP;
>>>> +       }
>>>> +       XDNA_DBG(xdna, "Got param %d", args->param);
>>>> +
>>>> +       drm_dev_exit(idx);
>>>> +       return ret;
>>>> +}
>>>> +
>>>>    static int aie2_set_power_mode(struct amdxdna_client *client,
>>>>                                  struct amdxdna_drm_set_state *args)
>>>>    {
>>>> @@ -926,15 +989,16 @@ static int aie2_set_state(struct amdxdna_client *client,
>>>>    }
>>>>
>>>>    const struct amdxdna_dev_ops aie2_ops = {
>>>> -       .init           = aie2_init,
>>>> -       .fini           = aie2_fini,
>>>> -       .resume         = aie2_hw_resume,
>>>> -       .suspend        = aie2_hw_suspend,
>>>> -       .get_aie_info   = aie2_get_info,
>>>> -       .set_aie_state  = aie2_set_state,
>>>> -       .hwctx_init     = aie2_hwctx_init,
>>>> -       .hwctx_fini     = aie2_hwctx_fini,
>>>> -       .hwctx_config   = aie2_hwctx_config,
>>>> -       .cmd_submit     = aie2_cmd_submit,
>>>> +       .init = aie2_init,
>>>> +       .fini = aie2_fini,
>>>> +       .resume = aie2_hw_resume,
>>>> +       .suspend = aie2_hw_suspend,
>>>> +       .get_aie_info = aie2_get_info,
>>>> +       .set_aie_state = aie2_set_state,
>>>> +       .hwctx_init = aie2_hwctx_init,
>>>> +       .hwctx_fini = aie2_hwctx_fini,
>>>> +       .hwctx_config = aie2_hwctx_config,
>>>> +       .cmd_submit = aie2_cmd_submit,
>>>>           .hmm_invalidate = aie2_hmm_invalidate,
>>>> +       .get_array = aie2_get_array,
>>>>    };
>>>> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
>>>> index 8ef5e4f27f5e..0a1fd55e745e 100644
>>>> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
>>>> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
>>>> @@ -26,6 +26,13 @@ MODULE_FIRMWARE("amdnpu/17f0_10/npu.sbin");
>>>>    MODULE_FIRMWARE("amdnpu/17f0_11/npu.sbin");
>>>>    MODULE_FIRMWARE("amdnpu/17f0_20/npu.sbin");
>>>>
>>>> +/*
>>>> + * 0.0: Initial version
>>>> + * 0.1: Support getting all hardware contexts by DRM_IOCTL_AMDXDNA_GET_ARRAY
>>>> + */
>>>> +#define AMDXDNA_DRIVER_MAJOR           0
>>>> +#define AMDXDNA_DRIVER_MINOR           1
>>>> +
>>>>    /*
>>>>     * Bind the driver base on (vendor_id, device_id) pair and later use the
>>>>     * (device_id, rev_id) pair as a key to select the devices. The devices with
>>>> @@ -164,6 +171,26 @@ static int amdxdna_drm_get_info_ioctl(struct drm_device *dev, void *data, struct
>>>>           return ret;
>>>>    }
>>>>
>>>> +static int amdxdna_drm_get_array_ioctl(struct drm_device *dev, void *data,
>>>> +                                      struct drm_file *filp)
>>>> +{
>>>> +       struct amdxdna_client *client = filp->driver_priv;
>>>> +       struct amdxdna_dev *xdna = to_xdna_dev(dev);
>>>> +       struct amdxdna_drm_get_array *args = data;
>>>> +       int ret;
>>>> +
>>>> +       if (!xdna->dev_info->ops->get_array)
>>>> +               return -EOPNOTSUPP;
>>>> +
>>>> +       if (args->pad || !args->num_element || !args->element_size)
>>>> +               return -EINVAL;
>>>> +
>>>> +       mutex_lock(&xdna->dev_lock);
>>>> +       ret = xdna->dev_info->ops->get_array(client, args);
>>>> +       mutex_unlock(&xdna->dev_lock);
>>>> +       return ret;
>>>> +}
>>>> +
>>>>    static int amdxdna_drm_set_state_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
>>>>    {
>>>>           struct amdxdna_client *client = filp->driver_priv;
>>>> @@ -195,6 +222,7 @@ static const struct drm_ioctl_desc amdxdna_drm_ioctls[] = {
>>>>           DRM_IOCTL_DEF_DRV(AMDXDNA_EXEC_CMD, amdxdna_drm_submit_cmd_ioctl, 0),
>>>>           /* AIE hardware */
>>>>           DRM_IOCTL_DEF_DRV(AMDXDNA_GET_INFO, amdxdna_drm_get_info_ioctl, 0),
>>>> +       DRM_IOCTL_DEF_DRV(AMDXDNA_GET_ARRAY, amdxdna_drm_get_array_ioctl, 0),
>>>>           DRM_IOCTL_DEF_DRV(AMDXDNA_SET_STATE, amdxdna_drm_set_state_ioctl, DRM_ROOT_ONLY),
>>>>    };
>>>>
>>>> @@ -218,6 +246,8 @@ const struct drm_driver amdxdna_drm_drv = {
>>>>           .fops = &amdxdna_fops,
>>>>           .name = "amdxdna_accel_driver",
>>>>           .desc = "AMD XDNA DRM implementation",
>>>> +       .major = AMDXDNA_DRIVER_MAJOR,
>>>> +       .minor = AMDXDNA_DRIVER_MINOR,
>>>>           .open = amdxdna_drm_open,
>>>>           .postclose = amdxdna_drm_close,
>>>>           .ioctls = amdxdna_drm_ioctls,
>>>> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.h b/drivers/accel/amdxdna/amdxdna_pci_drv.h
>>>> index b6b3b424d1d5..72d6696d49da 100644
>>>> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.h
>>>> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.h
>>>> @@ -58,6 +58,7 @@ struct amdxdna_dev_ops {
>>>>           int (*cmd_submit)(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job, u64 *seq);
>>>>           int (*get_aie_info)(struct amdxdna_client *client, struct amdxdna_drm_get_info *args);
>>>>           int (*set_aie_state)(struct amdxdna_client *client, struct amdxdna_drm_set_state *args);
>>>> +       int (*get_array)(struct amdxdna_client *client, struct amdxdna_drm_get_array *args);
>>>>    };
>>>>
>>>>    /*
>>>> diff --git a/include/uapi/drm/amdxdna_accel.h b/include/uapi/drm/amdxdna_accel.h
>>>> index ce523e9ccc52..a1fb9785db77 100644
>>>> --- a/include/uapi/drm/amdxdna_accel.h
>>>> +++ b/include/uapi/drm/amdxdna_accel.h
>>>> @@ -34,6 +34,7 @@ enum amdxdna_drm_ioctl_id {
>>>>           DRM_AMDXDNA_EXEC_CMD,
>>>>           DRM_AMDXDNA_GET_INFO,
>>>>           DRM_AMDXDNA_SET_STATE,
>>>> +       DRM_AMDXDNA_GET_ARRAY = 10,
>>>>    };
>>>>
>>>>    /**
>>>> @@ -455,6 +456,112 @@ struct amdxdna_drm_get_info {
>>>>           __u64 buffer; /* in/out */
>>>>    };
>>>>
>>>> +#define AMDXDNA_HWCTX_STATE_IDLE       0
>>>> +#define AMDXDNA_HWCTX_STATE_ACTIVE     1
>>>> +
>>>> +/**
>>>> + * struct amdxdna_drm_hwctx_entry - The hardware context array entry
>>>> + */
>>>> +struct amdxdna_drm_hwctx_entry {
>>>> +       /** @context_id: Context ID. */
>>>> +       __u32 context_id;
>>>> +       /** @start_col: Start AIE array column assigned to context. */
>>>> +       __u32 start_col;
>>>> +       /** @num_col: Number of AIE array columns assigned to context. */
>>>> +       __u32 num_col;
>>>> +       /** @hwctx_id: The real hardware context id. */
>>>> +       __u32 hwctx_id;
>>>> +       /** @pid: ID of process which created this context. */
>>>> +       __s64 pid;
>>>> +       /** @command_submissions: Number of commands submitted. */
>>>> +       __u64 command_submissions;
>>>> +       /** @command_completions: Number of commands completed. */
>>>> +       __u64 command_completions;
>>>> +       /** @migrations: Number of times been migrated. */
>>>> +       __u64 migrations;
>>>> +       /** @preemptions: Number of times been preempted. */
>>>> +       __u64 preemptions;
>>>> +       /** @errors: Number of errors happened. */
>>>> +       __u64 errors;
>>>> +       /** @priority: Context priority. */
>>>> +       __u64 priority;
>>>> +       /** @heap_usage: Usage of device heap buffer. */
>>>> +       __u64 heap_usage;
>>>> +       /** @suspensions: Number of times been suspended. */
>>>> +       __u64 suspensions;
>>>> +       /**
>>>> +        * @state: Context state.
>>>> +        * %AMDXDNA_HWCTX_STATE_IDLE
>>>> +        * %AMDXDNA_HWCTX_STATE_ACTIVE
>>>> +        */
>>>> +       __u32 state;
>>>> +       /** @pasid: PASID been bound. */
>>>> +       __u32 pasid;
>>>> +       /** @gops: Giga operations per second. */
>>>> +       __u32 gops;
>>>> +       /** @fps: Frames per second. */
>>>> +       __u32 fps;
>>>> +       /** @dma_bandwidth: DMA bandwidth. */
>>>> +       __u32 dma_bandwidth;
>>>> +       /** @latency: Frame response latency. */
>>>> +       __u32 latency;
>>>> +       /** @frame_exec_time: Frame execution time. */
>>>> +       __u32 frame_exec_time;
>>>> +       /** @txn_op_idx: Index of last control code executed. */
>>>> +       __u32 txn_op_idx;
>>>> +       /** @ctx_pc: Program counter. */
>>>> +       __u32 ctx_pc;
>>>> +       /** @fatal_error_type: Fatal error type if context crashes. */
>>>> +       __u32 fatal_error_type;
>>>> +       /** @fatal_error_exception_type: Firmware exception type. */
>>>> +       __u32 fatal_error_exception_type;
>>>> +       /** @fatal_error_exception_pc: Firmware exception program counter. */
>>>> +       __u32 fatal_error_exception_pc;
>>>> +       /** @fatal_error_app_module: Exception module name. */
>>>> +       __u32 fatal_error_app_module;
>>>> +       /** @pad: Structure pad. */
>>>> +       __u32 pad;
>>>> +};
>>>> +
>>>> +#define DRM_AMDXDNA_HW_CONTEXT_ALL     0
>>>> +
>>>> +/**
>>>> + * struct amdxdna_drm_get_array - Get information array.
>>>> + */
>>>> +struct amdxdna_drm_get_array {
>>>> +       /**
>>>> +        * @param:
>>>> +        *
>>>> +        * Supported params:
>>>> +        *
>>>> +        * %DRM_AMDXDNA_HW_CONTEXT_ALL:
>>>> +        * Returns all created hardware contexts.
>>>> +        */
>>>> +       __u32 param;
>>>> +       /**
>>>> +        * @element_size:
>>>> +        *
>>>> +        * Specifies maximum element size and returns the actual element size.
>>>> +        */
>>>> +       __u32 element_size;
>>>> +       /**
>>>> +        * @num_element:
>>>> +        *
>>>> +        * Specifies maximum number of elements and returns the actual number
>>>> +        * of elements.
>>>> +        */
>>>> +       __u32 num_element; /* in/out */
>>>> +       /** @pad: MBZ */
>>>> +       __u32 pad;
>>>> +       /**
>>>> +        * @buffer:
>>>> +        *
>>>> +        * Specifies the match conditions and returns the matched information
>>>> +        * array.
>>>> +        */
>>>> +       __u64 buffer;
>>>> +};
>>>> +
>>>>    enum amdxdna_drm_set_param {
>>>>           DRM_AMDXDNA_SET_POWER_MODE,
>>>>           DRM_AMDXDNA_WRITE_AIE_MEM,
>>>> @@ -519,6 +626,10 @@ struct amdxdna_drm_set_power_mode {
>>>>           DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDXDNA_SET_STATE, \
>>>>                    struct amdxdna_drm_set_state)
>>>>
>>>> +#define DRM_IOCTL_AMDXDNA_GET_ARRAY \
>>>> +       DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDXDNA_GET_ARRAY, \
>>>> +                struct amdxdna_drm_get_array)
>>>> +
>>>>    #if defined(__cplusplus)
>>>>    } /* extern c end */
>>>>    #endif
>>>> --
>>>> 2.34.1
>>>>
