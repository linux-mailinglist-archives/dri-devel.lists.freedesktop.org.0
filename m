Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6139F9816
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 18:33:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E6B310E3AF;
	Fri, 20 Dec 2024 17:33:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cP9eOqcP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2042.outbound.protection.outlook.com [40.107.220.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A25010E3AF
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 17:33:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FdcoOv+YDIArRcTXpxsAOp9o7LFs2FyNQR2XRT00Qps8vq3Ll4i7b/pc5h8GWzitEPwvHlv2OwK7Wv+4Ey77gDY+fCIiYdylW9thbSzkCCK4h3jEqljsHG1UBJtN1RNrizUb9Yt0fGT15+HS7rZqjF4d4rxTLFp8lrfkQVtJJqCtgDLcOT6QM6HrExls4RnEHakQC1rf0CxDgoqIH72W8m6oeDAH3kw58/ZVPxWdwUPKvhb9DApTBg1+WOuhlRD205qIWkIdQTA9kjMzBfiNuuCAX+8hwTfsppjBKVWCpaJZnSuqK7dJQbaAAghJ+FPvltZ7+a1iSgmtJzY0hjZ6oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lGjXMCduo7a/7cqRwSTQxjIMLL4AVOf8e7f2WCWUxi0=;
 b=qK1nW46Zn+SyR+mJ4Jlrjyhk1hv/e6HMJPDM7U8FoLzynyVEqtpZl1brKWu7S7GiB15vvKLS5lngwgooxmZvNDVcyruQendSI9WYITeSkYc0VCifyPpTCZ3EQBU26i0tikOk9ndf4v8zA5U4rfQmmm7rRjaD5YVfb0Xup/wkI1Sd52PqoSMOXne+Wek57gR/p7VkU5qh+7gbSAEGMPJou+CiBz6EtKcGMbR+F0haXsXtmKM50JAyfaxLraZQhQNtfwY9Q2gchlqYGPK5+luKeHSfK+npQ4vQK/BEL+wKXdnodqbar0LRAMFESFIkJaHY/xjN5JIeXYwEx9AEoJXBjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=quicinc.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lGjXMCduo7a/7cqRwSTQxjIMLL4AVOf8e7f2WCWUxi0=;
 b=cP9eOqcPu7sQdrrDs4vHZO4gvWjO7A9cK2/FwUZmGCbPMDBmDTBeFTzjnp46sUD9IJFfq2PEnaNN71PB8LrvkJmy9HtOYW5GhqBJlrDfTZIecGkzUuWEGH6ifjOqPBFiVogOFnmnVgUNzL2x0NETdsmOfioVrym5KdUqMlKtwxI=
Received: from BN9PR03CA0750.namprd03.prod.outlook.com (2603:10b6:408:110::35)
 by PH7PR12MB9104.namprd12.prod.outlook.com (2603:10b6:510:2f3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Fri, 20 Dec
 2024 17:33:18 +0000
Received: from MN1PEPF0000F0E3.namprd04.prod.outlook.com
 (2603:10b6:408:110:cafe::7a) by BN9PR03CA0750.outlook.office365.com
 (2603:10b6:408:110::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8272.16 via Frontend Transport; Fri,
 20 Dec 2024 17:33:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000F0E3.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 17:33:16 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Dec
 2024 11:33:16 -0600
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 20 Dec 2024 11:33:15 -0600
Message-ID: <ce41ab48-a923-7a29-1c50-3338fed39ea6@amd.com>
Date: Fri, 20 Dec 2024 09:33:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 7/7] accel/qaic: Add AIC200 support
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, <quic_carlv@quicinc.com>,
 <manivannan.sadhasivam@linaro.org>, <quic_yabdulra@quicinc.com>,
 <quic_mattleun@quicinc.com>, <quic_thanson@quicinc.com>
CC: <ogabbay@kernel.org>, <jacek.lawrynowicz@linux.intel.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <mhi@lists.linux.dev>
References: <20241213213340.2551697-1-quic_jhugo@quicinc.com>
 <20241213213340.2551697-8-quic_jhugo@quicinc.com>
 <65a59247-f028-28f9-1a65-5e4dd62dadec@amd.com>
 <dd83ba8c-0b37-7d1e-39a7-4b25ef7e5faf@quicinc.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <dd83ba8c-0b37-7d1e-39a7-4b25ef7e5faf@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E3:EE_|PH7PR12MB9104:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f96a757-fab0-40ba-5250-08dd211c6388
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RmdEZU9aME0vMm4rWVdpRWg5T2dKU0p1NzAwTVJ2VGtYakRGNy9icDByNUp5?=
 =?utf-8?B?dlFDMlQyNFNyUHpNZmFZZEhxVmdWbDZEVzdPZ0RYOGd2WUUxeEVwMkdEeXJE?=
 =?utf-8?B?MGJGandTelBXcXJrbm5xbS9LL0MrN1hRYmdwMW1rUDVSZmV0SGEzK0gzR0Fv?=
 =?utf-8?B?RUwzSlV3OGw1eTl1a01UK1E3TXF4OUtoMXFtc2JGVlJFKzFMY0FiOGt6Q0Jp?=
 =?utf-8?B?K2QyK2pTWkFMUGp3RGxJcjRiWTJ3RG9maXRGZ1pJYXJxUTNpZmRQYXA0ejdk?=
 =?utf-8?B?SXBBT1UvdDl4NzRwYjZjRXRGN2FibkVnMGpQUlpFZ211RGUzM0FkSEJHTldD?=
 =?utf-8?B?UjhYZ0lUdmZXbnBWcGVYTlNXT3pPUDkrSnB4dTUwckdkbTJROUxoOUZDQjF6?=
 =?utf-8?B?R0pxMTFFSEtTeDFKVnlyVUpCRHNYaGtxci9QNm0zT2RodkVpRkhNOEE4bHcz?=
 =?utf-8?B?SzlnVHROczVsbGNRM1dndDNxRElBT280bnVEUk5GOXhIMEozbmJLQTF6QXND?=
 =?utf-8?B?c2Z5MkdSOFhWK0lUTmhmc2JIL0ZJdW5tWTBGRWNGbC9RUkx4MXlwaEZXUHU1?=
 =?utf-8?B?Qi9FYnB3bVZlL2pDbDEwajlYMnlXMGdDUm41Y1BxZXNrWjJNUU96cFdOb0J0?=
 =?utf-8?B?dlBNU0ZuWHJIMGVSMDVFbVRBdVpheDFvMmhINFZWZ0wvRU9HUitibDRRbUNP?=
 =?utf-8?B?KzBwWXR0TU5OcE5jVkZpZ1l2R21nQTNaSnczakViL0RTR0NDM2dtOVFRMjNi?=
 =?utf-8?B?VE45dTNYSzdrc1hEa2tBelJyTjFaRzJzZXpWRHhnVVREM0NzQk01RVNUdkpl?=
 =?utf-8?B?YTJ1TXp3VjlleFp6YTMxTTNacGFPc1ZJN2U2ZGtldjdqWFA0RWtxNGJXRFBu?=
 =?utf-8?B?L2ozL3E1NEdCWEMyTzRkL3NXb3RZTEV5MHhtUnp1cmxYY2hLNmozeC9vbi9h?=
 =?utf-8?B?UTVqYzU0UmRCLzVEaDc4d0VvUXpkRHpJLzRnZ1crZDhtbzQ4aGlmcmMrSTR6?=
 =?utf-8?B?U3B3U0M0bjIrckxROFk4YXBicDk5UHJhZ2N2TG9LZkdoUXVhVGJHeUhUNjR0?=
 =?utf-8?B?KzJoNVdnMFY4ZS9sNXcvaFNUSElZWnVPSFBrWE8zOVc3ZVVhS1Q1WFZvMWJG?=
 =?utf-8?B?ZHEzbTh3U3JiRmYxb1lpbkNBSU1hLzRzUDY5clF0Q0t1MXMxWFZBWUJadjFC?=
 =?utf-8?B?SHYxU3haRkdaVmU3djB1eTRqazUvVDl2TURkMzdmZjJoakhrTHRWZnRkOXBI?=
 =?utf-8?B?dGZXQXY3L2xCaGlKZkxsOEhXMlBFUGRMVk1uUnBQZnpJdktGKzFxd1hKelRy?=
 =?utf-8?B?TDBjd0p4Vi9pSytwVkdvQWpZeEhya2g0NDZidnJEWFlRODFVaUNlWkpkeGpw?=
 =?utf-8?B?WUtSUlRoemZxRThkYzZualhXSG1iZnVXQmFySHJmTy8zSXFVdi9hdXNRTUYw?=
 =?utf-8?B?UzFFV25yNDhneGM0dXZaRTRQdWNLTzZ6Z01IclVweVBvVEx4d0FNUFdwUTNV?=
 =?utf-8?B?eTM1OUN3T0JXUitBandWdmh2MHlaZWFTa3hPMmNTaVg0WkRrc2xPZGFIZldF?=
 =?utf-8?B?UTduSHNXdUtZK1lmaFZWbHZwZ1czVTFHN3BxM003UFFxNmZxNm4wOWFwZkYz?=
 =?utf-8?B?bzhJbVh5enQzN2l3NmpDOHMvT2xZSnN4VkhCemNNTmlRb0JFbWdzd3RBNEZv?=
 =?utf-8?B?L0kxTWczS3FFR25XelV4Skcra25YcmxLM0d2eFVBenFTTkNzUDJXYUNPVnFp?=
 =?utf-8?B?eHcrOXBoSXpwZy85bUs5MlFUUjczdjZrOGVzY2hFV1E4aXBFeXo1NWd4YnFV?=
 =?utf-8?B?TGRVcTZSdzU3ZkNSenVYS2oxV2xEZFJJWWpQL0IxdWljR2pyQTNDaFVmb2VN?=
 =?utf-8?B?Q3RKVzZrRU5lZDhjTnhXellPUUFNRlU2M0pjTEpxaDZXenlnN3hYY09KR04r?=
 =?utf-8?B?UEFRTzd4MXNWMml6WDNHV3lWK2dMMlpDaDhZMjJZeUZsdzhDdEVUcXVCVFZs?=
 =?utf-8?Q?niHi7nQB+SbZNIgNPG0ZYel1f/gJfw=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 17:33:16.8376 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f96a757-fab0-40ba-5250-08dd211c6388
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9104
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


On 12/20/24 09:26, Jeffrey Hugo wrote:
> On 12/13/2024 5:49 PM, Lizhi Hou wrote:
>>
>> On 12/13/24 13:33, Jeffrey Hugo wrote:
>>> @@ -573,6 +898,13 @@ struct mhi_controller 
>>> *qaic_mhi_register_controller(struct pci_dev *pci_dev, voi
>>>       mhi_cntrl->nr_irqs = 1;
>>>       mhi_cntrl->irq = devm_kmalloc(&pci_dev->dev, 
>>> sizeof(*mhi_cntrl->irq), GFP_KERNEL);
>>> +    if (family == FAMILY_AIC200) {
>>> +        mhi_cntrl->name = "AIC200";
>>> +        mhi_cntrl->seg_len = SZ_512K;
>>> +    } else {
>>> +        mhi_cntrl->name = "AIC100";
>>> +    }
>>> +
>>
>> Only AIC200 needs to set 'seg_len'? Maybe these hard coded settings 
>> can also be in qaic_device_config?
>
> Yes, seg_len is related to the BHIe loading, which is new from AIC100 
> to AIC200.
>
> For the moment, I think I'd like to keep the MHI details 
> "encapsulated" within this portion of the driver.  With the continuing 
> development of AIC200, I'm expecting a bit of volitility here which I 
> hope doesn't leak into the rest of the driver.
>
>> It might be better to move after the following check at least.
>
> I agree.
>
>>
>>>       if (!mhi_cntrl->irq)
>>>           return ERR_PTR(-ENOMEM);
>>> @@ -581,11 +913,11 @@ struct mhi_controller 
>>> *qaic_mhi_register_controller(struct pci_dev *pci_dev, voi
>>>       if (shared_msi) /* MSI shared with data path, no 
>>> IRQF_NO_SUSPEND */
>>>           mhi_cntrl->irq_flags = IRQF_SHARED;
>>> -    mhi_cntrl->fw_image = "qcom/aic100/sbl.bin";
>>> +    mhi_cntrl->fw_image = fw_image_paths[family];
>> Maybe fw_image path in qaic_device_config?
>>>       /* use latest configured timeout */
>>> -    aic100_config.timeout_ms = mhi_timeout_ms;
>>> -    ret = mhi_register_controller(mhi_cntrl, &aic100_config);
>>> +    mhi_config.timeout_ms = mhi_timeout_ms;
>>> +    ret = mhi_register_controller(mhi_cntrl, &mhi_config);
>>>       if (ret) {
>>>           pci_err(pci_dev, "mhi_register_controller failed %d\n", ret);
>>>           return ERR_PTR(ret);
>>> diff --git a/drivers/accel/qaic/mhi_controller.h 
>>> b/drivers/accel/qaic/mhi_controller.h
>>> index 500e7f4af2af..8939f6ae185e 100644
>>> --- a/drivers/accel/qaic/mhi_controller.h
>>> +++ b/drivers/accel/qaic/mhi_controller.h
>>> @@ -8,7 +8,7 @@
>>>   #define MHICONTROLLERQAIC_H_
>>>   struct mhi_controller *qaic_mhi_register_controller(struct pci_dev 
>>> *pci_dev, void __iomem *mhi_bar,
>>> -                            int mhi_irq, bool shared_msi);
>>> +                            int mhi_irq, bool shared_msi, int family);
>>>   void qaic_mhi_free_controller(struct mhi_controller *mhi_cntrl, 
>>> bool link_up);
>>>   void qaic_mhi_start_reset(struct mhi_controller *mhi_cntrl);
>>>   void qaic_mhi_reset_done(struct mhi_controller *mhi_cntrl);
>>> diff --git a/drivers/accel/qaic/qaic.h b/drivers/accel/qaic/qaic.h
>>> index cf97fd9a7e70..0dbb8e32e4b9 100644
>>> --- a/drivers/accel/qaic/qaic.h
>>> +++ b/drivers/accel/qaic/qaic.h
>>> @@ -34,6 +34,7 @@
>>>   enum aic_families {
>>>       FAMILY_AIC100,
>>> +    FAMILY_AIC200,
>>>       FAMILY_MAX,
>>>   };
>>> diff --git a/drivers/accel/qaic/qaic_drv.c 
>>> b/drivers/accel/qaic/qaic_drv.c
>>> index 4e63e475b389..3b415e2c9431 100644
>>> --- a/drivers/accel/qaic/qaic_drv.c
>>> +++ b/drivers/accel/qaic/qaic_drv.c
>>> @@ -36,6 +36,7 @@ MODULE_IMPORT_NS("DMA_BUF");
>>>   #define PCI_DEVICE_ID_QCOM_AIC080    0xa080
>>>   #define PCI_DEVICE_ID_QCOM_AIC100    0xa100
>>> +#define PCI_DEVICE_ID_QCOM_AIC200    0xa110
>>>   #define QAIC_NAME            "qaic"
>>>   #define QAIC_DESC            "Qualcomm Cloud AI Accelerators"
>>>   #define CNTL_MAJOR            5
>>> @@ -66,6 +67,13 @@ static const struct qaic_device_config 
>>> aic100_config = {
>>>       .dbc_bar_idx = 2,
>>>   };
>>> +static const struct qaic_device_config aic200_config = {
>>> +    .family = FAMILY_AIC200,
>>> +    .bar_mask = BIT(0) | BIT(1) | BIT(2) | BIT(4),
>>
>> Will this pass the BAR mask check in init_pci()?
>
> Yes, BITs 0, 1, 2, 4 would be 0x17 and that value is & with 0x3f 
> (masking off upper bits).  The result would be 0x17.

It seems BIT(1) is not expected in init_pci?

     if (bars != (BIT(0) | BIT(2) | BIT(4))) {


Lizhi

>
>>
>> Thanks,
>>
>> Lizhi
>>
