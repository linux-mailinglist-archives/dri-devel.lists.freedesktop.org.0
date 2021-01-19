Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E422FC21E
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 22:22:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BB506E037;
	Tue, 19 Jan 2021 21:22:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2078.outbound.protection.outlook.com [40.107.244.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B31876E030;
 Tue, 19 Jan 2021 21:22:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ts1Fo4v33+eUGJnwbasQyi/yDiYFEwn9lJ7d7olL4SpbQPIxOijyYxaQMOVNC2HSFvrti6lOXPnM0Bfyp43A5LJnRjHL0IKcE26DxpVvE/uVeVjIpr/5fIh+TVSNhN4ffzKyZ84GM5Hkv1pBUZ9wjmENluDDbhGFZzIUijOFUt/iG3zTUAk2QNYhmO0P/12vnRsgr85Yd/ZMdmuHUFmxhdA2WnvAfKiFUWo0X6QvYbfvJA/3ISYhTtj+XCTTjlh6K5lswWAWUFor8ehptf2KKRSpsVpWlxueabPIeZpjeDHmVLMrRTw0es3HLvbLaUiDhaIJkFtj7TXnEMmPD95v6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9DoxF7gtNK0jGHlSSn8TUAasB4IXuBmTLjb9qKoMT0=;
 b=jynaNpc/C4WVGi3zeVDCvls/YmYY+kuoV0QcQZyVNZvpBJ0DcKpwvAWTugy0FKx1hmWEKSTahmBTtz+KaDw5nKxtHwT3oeNX5u6FQJUlvwsGG+cFAqBch8u+aG1G46qMFqY2qS4m/dtbJfvXXZxVvogsZhsvBlqiLUd2nRMT27el8ANhQUQ1AufCaWxuII2CVeFsBuiK89iM5MNwgoWv4uLJFztJh4h20CoRp34GIIBzulx0wwJYnEs0sL2QSPOqtwbjo89ukI2bCKNsA+V5LyJ/Kh9GX1Q4rKypWhXiip3PLNzpe/cp9pNmgZr1SiYV/ZFWAML5VIGInLJNf3GmCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9DoxF7gtNK0jGHlSSn8TUAasB4IXuBmTLjb9qKoMT0=;
 b=m0QAwsXhBudx3oicSvAXxu0O3lT/Pfcmmo5adr83C3M2o8ZbdhANiCqCPZEJrsTaDhsxwUwqnNF8jG/gmxtHls69Z3WECQSZ3uyJ0ZkIfLWGoO2zGLBDL73/DCmXxZs0Zj50b1ykV4p1spGP9Lj2DRFnRKy/dzY4NlhD3fBeigQ=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN1PR12MB2352.namprd12.prod.outlook.com (2603:10b6:802:25::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Tue, 19 Jan
 2021 21:21:55 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::5d30:b29d:5f5b:6921]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::5d30:b29d:5f5b:6921%5]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 21:21:55 +0000
Subject: Re: [PATCH v4 07/14] drm/amdgpu: Register IOMMU topology notifier per
 device.
To: Daniel Vetter <daniel@ffwll.ch>, christian.koenig@amd.com
References: <1611003683-3534-1-git-send-email-andrey.grodzovsky@amd.com>
 <1611003683-3534-8-git-send-email-andrey.grodzovsky@amd.com>
 <2978ebf8-858d-6e8e-5657-1d0d615d56e0@gmail.com>
 <YAbilAl8g0d9s7vz@phenom.ffwll.local>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <7425c541-d3fa-f684-3e71-eb93376f4fd1@amd.com>
Date: Tue, 19 Jan 2021 16:21:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <YAbilAl8g0d9s7vz@phenom.ffwll.local>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:c1b5:6dec:d289:5430]
X-ClientProxiedBy: BN6PR20CA0056.namprd20.prod.outlook.com
 (2603:10b6:404:151::18) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:c1b5:6dec:d289:5430]
 (2607:fea8:3edf:49b0:c1b5:6dec:d289:5430) by
 BN6PR20CA0056.namprd20.prod.outlook.com (2603:10b6:404:151::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend
 Transport; Tue, 19 Jan 2021 21:21:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f1d22e5b-c0f6-46d8-4cda-08d8bcc03f2c
X-MS-TrafficTypeDiagnostic: SN1PR12MB2352:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB23523044143F05066C04D2D1EAA39@SN1PR12MB2352.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JVxJ8Hc/52Gd1UTDmMUgqqzpqhiCfhNRe0xKOkWvI4YCrD+3xLayDi09RlioMABK7fh75BNCC5JswxkAd4dgIzxEICtiFcbWfj3/qUVGTe+w+pHXXvnx/xVq+un37BbriL1Buk1sUTu2YW+hK1kV28DwsBSvvYr3NaRa0Dc5nrQ/BsgEOXgxHxjXSR09sQ85BkT7kasQSeUSNvbxeZQOJzD2YH6Rg6UtCigp9S5CdQOMwgtDptAdNW9PF6UYUVgtiCPREAo4jMdoBdPcLm7yyep5kNa/DnrHEaPbcJPQIRHYtGyM3Jxj6aPQQIRkMLaRBCIdcJFh4xlssPRcYUrkPSvzjwsD/qvKdpgIxZoNOOP65lJcXL6FHEKffHSGBxKqZNSRPci4z9z7wrO57koWzUnikD7/IlMiEGTteecFcUL+zXzwbbN7iZ6OS958SSOlENiogx+QnZHeFH+MOD2SiqyFh4kdMNkKD6GN+Mz6QWA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(346002)(376002)(136003)(39850400004)(478600001)(316002)(33964004)(4326008)(66556008)(66476007)(31686004)(66574015)(52116002)(8936002)(31696002)(53546011)(83380400001)(36756003)(66946007)(30864003)(186003)(5660300002)(2616005)(7416002)(8676002)(2906002)(6636002)(6486002)(16526019)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MVo4VmtOV1pYU29IY2tWY1M4d0MxWi9RdHVIbHcvWlpHNlZzTFNDdVF1UWl6?=
 =?utf-8?B?SEdQWmVoSWNOc2RnbXVDUzhOWkpZdkVEM1hSMEhNZC80RzFSb29kOEpheG4w?=
 =?utf-8?B?M2E1em9qcWdqaGdRZlJjRmtjWTQwTEZoMWNhSWNQak81ZUthdHZaa1RRQ1Fi?=
 =?utf-8?B?eThWTTVIRHNKQzlEZzFYQmJhbHA2a2VndnFVRjJCVTRaTlpFM29NKy9QSm1q?=
 =?utf-8?B?eitpSWhPejVIcHpPYkQ1anNyMzM1MTZRbTdUTmppczdtYVVBQ3VUZVZWdFlC?=
 =?utf-8?B?Z2M3RlNadmhVb014dGFETjMvaHB1RlQ1aUU0MXlIUXZDYVgzTjZyY1RudGRp?=
 =?utf-8?B?ZzQ0TVdlYVp3RjZSV2d6NTRzTHBrU3p2NUl3b0lMZGN0bDJwRXpJaVVmV2pk?=
 =?utf-8?B?NHhEOEF4MGpMVUtaZlk2ZmlyTmliQlFjOVd0ejQvZjdLVlZzbGg0aklpMWtB?=
 =?utf-8?B?VzVQNGl0REJvaU5vNGFTZFJ3VHQ3Y0hTWUpPc0VBMUVaUjEwU2YzcHBFdmhl?=
 =?utf-8?B?RjRYOFRQd0Rtc3JCUDViQlpCQ20vaDdERW9GY2RLc1BCTFVNUWM5ckNrek1s?=
 =?utf-8?B?eTIrcmtmWnRCUEFqTEE3MTZNd0pRdXNLU0JFbjgzNFhvVzBQY1VlSUFnR0Nz?=
 =?utf-8?B?NGdlcHc1RHhndEZqdWdSYTJuZC9YMkpacU5ITEhDdUVPdEoranI0NVUvT3hH?=
 =?utf-8?B?ZHAxeFpDS25mV3NiZnhteFZYWUZpNTdRbzVORmxZMlBFTk41c1BZdlIyQUJH?=
 =?utf-8?B?cVBpdXJNc0IrbnVSSHlTSmx5UHBnN2k0cDNpQWlCak5QTGk2eHBxK3B6cVBZ?=
 =?utf-8?B?UkFPcTFzbUExOWhVUEwxQW5MbjVWall0UWNxNDBwN0l6ZWxSSVBlandROG03?=
 =?utf-8?B?TmxSU0k4cGtQRSs5UUtUWURkK1oyY3B1TjBlMUJaMUpLaVNIU0dONUJtbEJP?=
 =?utf-8?B?ZXhDQmJ3YjRVMzF1OHpiMkh5bzdzT0FrUkltSWE1TUZnckNzL1BOclRnTnFP?=
 =?utf-8?B?WVVITjZBNWtESDNUMTVBUm9DMCtKb1pBL2RxaXI0aGRkcmg4YmRpck51b2F4?=
 =?utf-8?B?R3NOYWxacEhIcDQzWUQ1RUpxbHZLRWdVWTJ0TWFjSmVUZFhuVGllZGJOZGR1?=
 =?utf-8?B?Zk5SM2F0L281NlcvanpXbXY4eGk0RGRJWjZVTUpYcVp1TjUxMGJCMWtHUElC?=
 =?utf-8?B?dUpHTG12dUdVQUczaXluSkhzOVhQZHhQMlRFZGhFbVo2aFlnM1pYNGdOamlM?=
 =?utf-8?B?K2d6eEs3SDV6ZlV1Q3doa29LbEExbkFUN1hDL1d5KzdyTjY1cW1mQVE5djkz?=
 =?utf-8?B?VFd2cEcrK0Eyclk1MlEzUkZzV2psbUo0amJLcXJ4cDlXa0pYYng1eitrWkdm?=
 =?utf-8?B?eXJLbTZzWXJ1QnZpVjNLNGM0TkxlQ1ZRQzBNQWZyV2d2WUhTTTBrdjFwWHJQ?=
 =?utf-8?B?QnNXVjdWODY5d2J6NWhNZlFZTDBJbUJEMWhScXB0aUR5dFpjVS92bzA4WkdN?=
 =?utf-8?B?L014L2YzZ3BiSUFoRXhpcUdxQVE2T2pYQVNGdDJlM3lsWlRFa0lXNnRjUFo0?=
 =?utf-8?B?eUIvZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1d22e5b-c0f6-46d8-4cda-08d8bcc03f2c
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 21:21:55.8332 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QojLXNjsWCCMFz/awOH6+vPxhnsXJw/OVffV2ru/uQTz81nSMlxbm5Jv1iMkpsvWINLlGOx6gNbbAiQGHgnpVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2352
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
Cc: amd-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, yuq825@gmail.com, gregkh@linuxfoundation.org,
 Alexander.Deucher@amd.com
Content-Type: multipart/mixed; boundary="===============1541716949=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1541716949==
Content-Type: multipart/alternative;
 boundary="------------ADFBD3FCDA684F114197BA75"
Content-Language: en-US

--------------ADFBD3FCDA684F114197BA75
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/19/21 8:45 AM, Daniel Vetter wrote:
> On Tue, Jan 19, 2021 at 09:48:03AM +0100, Christian König wrote:
>> Am 18.01.21 um 22:01 schrieb Andrey Grodzovsky:
>>> Handle all DMA IOMMU gropup related dependencies before the
>>> group is removed.
>>>
>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>> ---
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  5 ++++
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 46 ++++++++++++++++++++++++++++++
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c   |  2 +-
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h   |  1 +
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 10 +++++++
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  2 ++
>>>    6 files changed, 65 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>> index 478a7d8..2953420 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>> @@ -51,6 +51,7 @@
>>>    #include <linux/dma-fence.h>
>>>    #include <linux/pci.h>
>>>    #include <linux/aer.h>
>>> +#include <linux/notifier.h>
>>>    #include <drm/ttm/ttm_bo_api.h>
>>>    #include <drm/ttm/ttm_bo_driver.h>
>>> @@ -1041,6 +1042,10 @@ struct amdgpu_device {
>>>    	bool                            in_pci_err_recovery;
>>>    	struct pci_saved_state          *pci_state;
>>> +
>>> +	struct notifier_block		nb;
>>> +	struct blocking_notifier_head	notifier;
>>> +	struct list_head		device_bo_list;
>>>    };
>>>    static inline struct amdgpu_device *drm_to_adev(struct drm_device *ddev)
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> index 45e23e3..e99f4f1 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> @@ -70,6 +70,8 @@
>>>    #include <drm/task_barrier.h>
>>>    #include <linux/pm_runtime.h>
>>> +#include <linux/iommu.h>
>>> +
>>>    MODULE_FIRMWARE("amdgpu/vega10_gpu_info.bin");
>>>    MODULE_FIRMWARE("amdgpu/vega12_gpu_info.bin");
>>>    MODULE_FIRMWARE("amdgpu/raven_gpu_info.bin");
>>> @@ -3200,6 +3202,39 @@ static const struct attribute *amdgpu_dev_attributes[] = {
>>>    };
>>> +static int amdgpu_iommu_group_notifier(struct notifier_block *nb,
>>> +				     unsigned long action, void *data)
>>> +{
>>> +	struct amdgpu_device *adev = container_of(nb, struct amdgpu_device, nb);
>>> +	struct amdgpu_bo *bo = NULL;
>>> +
>>> +	/*
>>> +	 * Following is a set of IOMMU group dependencies taken care of before
>>> +	 * device's IOMMU group is removed
>>> +	 */
>>> +	if (action == IOMMU_GROUP_NOTIFY_DEL_DEVICE) {
>>> +
>>> +		spin_lock(&ttm_bo_glob.lru_lock);
>>> +		list_for_each_entry(bo, &adev->device_bo_list, bo) {
>>> +			if (bo->tbo.ttm)
>>> +				ttm_tt_unpopulate(bo->tbo.bdev, bo->tbo.ttm);
>>> +		}
>>> +		spin_unlock(&ttm_bo_glob.lru_lock);
>> That approach won't work. ttm_tt_unpopulate() might sleep on an IOMMU lock.
>>
>> You need to use a mutex here or even better make sure you can access the
>> device_bo_list without a lock in this moment.
> I'd also be worried about the notifier mutex getting really badly in the
> way.
>
> Plus I'm worried why we even need this, it sounds a bit like papering over
> the iommu subsystem. Assuming we clean up all our iommu mappings in our
> device hotunplug/unload code, why do we still need to have an additional
> iommu notifier on top, with all kinds of additional headaches? The iommu
> shouldn't clean up before the devices in its group have cleaned up.
>
> I think we need more info here on what the exact problem is first.
> -Daniel


Originally I experienced the  crash bellow on IOMMU enabled device, it happens 
post device removal from PCI topology -
during shutting down of user client holding last reference to drm device file (X 
in my case).
The crash is because by the time I get to this point struct device->iommu_group 
pointer is NULL
already since the IOMMU group for the device is unset during PCI removal. So 
this contradicts what you said above
that the iommu shouldn't clean up before the devices in its group have cleaned up.
So instead of guessing when is the right place to place all IOMMU related 
cleanups it makes sense
to get notification from IOMMU subsystem in the form of event 
IOMMU_GROUP_NOTIFY_DEL_DEVICE
and use that place to do all the relevant cleanups.

Andrey


[  123.810074 <   28.126960>] BUG: kernel NULL pointer dereference, address: 
00000000000000c8
[  123.810080 <    0.000006>] #PF: supervisor read access in kernel mode
[  123.810082 <    0.000002>] #PF: error_code(0x0000) - not-present page
[  123.810085 <    0.000003>] PGD 0 P4D 0
[  123.810089 <    0.000004>] Oops: 0000 [#1] SMP NOPTI
[  123.810094 <    0.000005>] CPU: 5 PID: 1418 Comm: Xorg:shlo4 Tainted: 
G           O      5.9.0-rc2-dev+ #59
[  123.810096 <    0.000002>] Hardware name: System manufacturer System Product 
Name/PRIME X470-PRO, BIOS 4406 02/28/2019
[  123.810105 <    0.000009>] *RIP: 0010:iommu_get_dma_domain*+0x10/0x20
[  123.810108 <    0.000003>] Code: b0 48 c7 87 98 00 00 00 00 00 00 00 31 c0 c3 
b8 f4 ff ff ff eb a6 0f 1f 40 00 0f 1f 44 00 00 48 8b 87 d0 02 00 00 55 48 89 e5 
<48> 8b 80 c8 00 00 00 5d c3 0f 1f 80 00 00 00 00 0f 1f 44 00 00 48
[  123.810111 <    0.000003>] RSP: 0018:ffffa2e201f7f980 EFLAGS: 00010246
[  123.810114 <    0.000003>] RAX: 0000000000000000 RBX: 0000000000001000 RCX: 
0000000000000000
[  123.810116 <    0.000002>] RDX: 0000000000001000 RSI: 00000000bf5cb000 RDI: 
ffff93c259dc60b0
[  123.810117 <    0.000001>] RBP: ffffa2e201f7f980 R08: 0000000000000000 R09: 
0000000000000000
[  123.810119 <    0.000002>] R10: ffffa2e201f7faf0 R11: 0000000000000001 R12: 
00000000bf5cb000
[  123.810121 <    0.000002>] R13: 0000000000001000 R14: ffff93c24cef9c50 R15: 
ffff93c256c05688
[  123.810124 <    0.000003>] FS:  00007f5e5e8d3700(0000) 
GS:ffff93c25e940000(0000) knlGS:0000000000000000
[  123.810126 <    0.000002>] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  123.810128 <    0.000002>] CR2: 00000000000000c8 CR3: 000000027fe0a000 CR4: 
00000000003506e0
[  123.810130 <    0.000002>] Call Trace:
[  123.810136 <    0.000006>]  __iommu_dma_unmap+0x2e/0x100
[  123.810141 <    0.000005>]  ? kfree+0x389/0x3a0
[  123.810144 <    0.000003>]  iommu_dma_unmap_page+0xe/0x10
[  123.810149 <    0.000005>] dma_unmap_page_attrs+0x4d/0xf0
[  123.810159 <    0.000010>]  ? ttm_bo_del_from_lru+0x8e/0xb0 [ttm]
[  123.810165 <    0.000006>] ttm_unmap_and_unpopulate_pages+0x8e/0xc0 [ttm]
[  123.810252 <    0.000087>] amdgpu_ttm_tt_unpopulate+0xaa/0xd0 [amdgpu]
[  123.810258 <    0.000006>]  ttm_tt_unpopulate+0x59/0x70 [ttm]
[  123.810264 <    0.000006>]  ttm_tt_destroy+0x6a/0x70 [ttm]
[  123.810270 <    0.000006>] ttm_bo_cleanup_memtype_use+0x36/0xa0 [ttm]
[  123.810276 <    0.000006>]  ttm_bo_put+0x1e7/0x400 [ttm]
[  123.810358 <    0.000082>]  amdgpu_bo_unref+0x1e/0x30 [amdgpu]
[  123.810440 <    0.000082>] amdgpu_gem_object_free+0x37/0x50 [amdgpu]
[  123.810459 <    0.000019>]  drm_gem_object_free+0x35/0x40 [drm]
[  123.810476 <    0.000017>] drm_gem_object_handle_put_unlocked+0x9d/0xd0 [drm]
[  123.810494 <    0.000018>] drm_gem_object_release_handle+0x74/0x90 [drm]
[  123.810511 <    0.000017>]  ? drm_gem_object_handle_put_unlocked+0xd0/0xd0 [drm]
[  123.810516 <    0.000005>]  idr_for_each+0x4d/0xd0
[  123.810534 <    0.000018>]  drm_gem_release+0x20/0x30 [drm]
[  123.810550 <    0.000016>]  drm_file_free+0x251/0x2a0 [drm]
[  123.810567 <    0.000017>] drm_close_helper.isra.14+0x61/0x70 [drm]
[  123.810583 <    0.000016>]  drm_release+0x6a/0xe0 [drm]
[  123.810588 <    0.000005>]  __fput+0xa2/0x250
[  123.810592 <    0.000004>]  ____fput+0xe/0x10
[  123.810595 <    0.000003>]  task_work_run+0x6c/0xa0
[  123.810600 <    0.000005>]  do_exit+0x376/0xb60
[  123.810604 <    0.000004>]  do_group_exit+0x43/0xa0
[  123.810608 <    0.000004>]  get_signal+0x18b/0x8e0
[  123.810612 <    0.000004>]  ? do_futex+0x595/0xc20
[  123.810617 <    0.000005>]  arch_do_signal+0x34/0x880
[  123.810620 <    0.000003>]  ? check_preempt_curr+0x50/0x60
[  123.810623 <    0.000003>]  ? ttwu_do_wakeup+0x1e/0x160
[  123.810626 <    0.000003>]  ? ttwu_do_activate+0x61/0x70
[  123.810630 <    0.000004>] exit_to_user_mode_prepare+0x124/0x1b0
[  123.810635 <    0.000005>] syscall_exit_to_user_mode+0x31/0x170
[  123.810639 <    0.000004>]  do_syscall_64+0x43/0x80


Andrey


>
>> Christian.
>>
>>> +
>>> +		if (adev->irq.ih.use_bus_addr)
>>> +			amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>>> +		if (adev->irq.ih1.use_bus_addr)
>>> +			amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
>>> +		if (adev->irq.ih2.use_bus_addr)
>>> +			amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
>>> +
>>> +		amdgpu_gart_dummy_page_fini(adev);
>>> +	}
>>> +
>>> +	return NOTIFY_OK;
>>> +}
>>> +
>>> +
>>>    /**
>>>     * amdgpu_device_init - initialize the driver
>>>     *
>>> @@ -3304,6 +3339,8 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>>>    	INIT_WORK(&adev->xgmi_reset_work, amdgpu_device_xgmi_reset_func);
>>> +	INIT_LIST_HEAD(&adev->device_bo_list);
>>> +
>>>    	adev->gfx.gfx_off_req_count = 1;
>>>    	adev->pm.ac_power = power_supply_is_system_supplied() > 0;
>>> @@ -3575,6 +3612,15 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>>>    	if (amdgpu_device_cache_pci_state(adev->pdev))
>>>    		pci_restore_state(pdev);
>>> +	BLOCKING_INIT_NOTIFIER_HEAD(&adev->notifier);
>>> +	adev->nb.notifier_call = amdgpu_iommu_group_notifier;
>>> +
>>> +	if (adev->dev->iommu_group) {
>>> +		r = iommu_group_register_notifier(adev->dev->iommu_group, &adev->nb);
>>> +		if (r)
>>> +			goto failed;
>>> +	}
>>> +
>>>    	return 0;
>>>    failed:
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
>>> index 0db9330..486ad6d 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
>>> @@ -92,7 +92,7 @@ static int amdgpu_gart_dummy_page_init(struct amdgpu_device *adev)
>>>     *
>>>     * Frees the dummy page used by the driver (all asics).
>>>     */
>>> -static void amdgpu_gart_dummy_page_fini(struct amdgpu_device *adev)
>>> +void amdgpu_gart_dummy_page_fini(struct amdgpu_device *adev)
>>>    {
>>>    	if (!adev->dummy_page_addr)
>>>    		return;
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h
>>> index afa2e28..5678d9c 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h
>>> @@ -61,6 +61,7 @@ int amdgpu_gart_table_vram_pin(struct amdgpu_device *adev);
>>>    void amdgpu_gart_table_vram_unpin(struct amdgpu_device *adev);
>>>    int amdgpu_gart_init(struct amdgpu_device *adev);
>>>    void amdgpu_gart_fini(struct amdgpu_device *adev);
>>> +void amdgpu_gart_dummy_page_fini(struct amdgpu_device *adev);
>>>    int amdgpu_gart_unbind(struct amdgpu_device *adev, uint64_t offset,
>>>    		       int pages);
>>>    int amdgpu_gart_map(struct amdgpu_device *adev, uint64_t offset,
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>> index 6cc9919..4a1de69 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>> @@ -94,6 +94,10 @@ static void amdgpu_bo_destroy(struct ttm_buffer_object *tbo)
>>>    	}
>>>    	amdgpu_bo_unref(&bo->parent);
>>> +	spin_lock(&ttm_bo_glob.lru_lock);
>>> +	list_del(&bo->bo);
>>> +	spin_unlock(&ttm_bo_glob.lru_lock);
>>> +
>>>    	kfree(bo->metadata);
>>>    	kfree(bo);
>>>    }
>>> @@ -613,6 +617,12 @@ static int amdgpu_bo_do_create(struct amdgpu_device *adev,
>>>    	if (bp->type == ttm_bo_type_device)
>>>    		bo->flags &= ~AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;
>>> +	INIT_LIST_HEAD(&bo->bo);
>>> +
>>> +	spin_lock(&ttm_bo_glob.lru_lock);
>>> +	list_add_tail(&bo->bo, &adev->device_bo_list);
>>> +	spin_unlock(&ttm_bo_glob.lru_lock);
>>> +
>>>    	return 0;
>>>    fail_unreserve:
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
>>> index 9ac3756..5ae8555 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
>>> @@ -110,6 +110,8 @@ struct amdgpu_bo {
>>>    	struct list_head		shadow_list;
>>>    	struct kgd_mem                  *kfd_bo;
>>> +
>>> +	struct list_head		bo;
>>>    };
>>>    static inline struct amdgpu_bo *ttm_to_amdgpu_bo(struct ttm_buffer_object *tbo)

--------------ADFBD3FCDA684F114197BA75
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/19/21 8:45 AM, Daniel Vetter
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:YAbilAl8g0d9s7vz@phenom.ffwll.local">
      <pre class="moz-quote-pre" wrap="">On Tue, Jan 19, 2021 at 09:48:03AM +0100, Christian König wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Am 18.01.21 um 22:01 schrieb Andrey Grodzovsky:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Handle all DMA IOMMU gropup related dependencies before the
group is removed.

Signed-off-by: Andrey Grodzovsky <a class="moz-txt-link-rfc2396E" href="mailto:andrey.grodzovsky@amd.com">&lt;andrey.grodzovsky@amd.com&gt;</a>
---
  drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  5 ++++
  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 46 ++++++++++++++++++++++++++++++
  drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c   |  2 +-
  drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h   |  1 +
  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 10 +++++++
  drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  2 ++
  6 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 478a7d8..2953420 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -51,6 +51,7 @@
  #include &lt;linux/dma-fence.h&gt;
  #include &lt;linux/pci.h&gt;
  #include &lt;linux/aer.h&gt;
+#include &lt;linux/notifier.h&gt;
  #include &lt;drm/ttm/ttm_bo_api.h&gt;
  #include &lt;drm/ttm/ttm_bo_driver.h&gt;
@@ -1041,6 +1042,10 @@ struct amdgpu_device {
  	bool                            in_pci_err_recovery;
  	struct pci_saved_state          *pci_state;
+
+	struct notifier_block		nb;
+	struct blocking_notifier_head	notifier;
+	struct list_head		device_bo_list;
  };
  static inline struct amdgpu_device *drm_to_adev(struct drm_device *ddev)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 45e23e3..e99f4f1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -70,6 +70,8 @@
  #include &lt;drm/task_barrier.h&gt;
  #include &lt;linux/pm_runtime.h&gt;
+#include &lt;linux/iommu.h&gt;
+
  MODULE_FIRMWARE(&quot;amdgpu/vega10_gpu_info.bin&quot;);
  MODULE_FIRMWARE(&quot;amdgpu/vega12_gpu_info.bin&quot;);
  MODULE_FIRMWARE(&quot;amdgpu/raven_gpu_info.bin&quot;);
@@ -3200,6 +3202,39 @@ static const struct attribute *amdgpu_dev_attributes[] = {
  };
+static int amdgpu_iommu_group_notifier(struct notifier_block *nb,
+				     unsigned long action, void *data)
+{
+	struct amdgpu_device *adev = container_of(nb, struct amdgpu_device, nb);
+	struct amdgpu_bo *bo = NULL;
+
+	/*
+	 * Following is a set of IOMMU group dependencies taken care of before
+	 * device's IOMMU group is removed
+	 */
+	if (action == IOMMU_GROUP_NOTIFY_DEL_DEVICE) {
+
+		spin_lock(&amp;ttm_bo_glob.lru_lock);
+		list_for_each_entry(bo, &amp;adev-&gt;device_bo_list, bo) {
+			if (bo-&gt;tbo.ttm)
+				ttm_tt_unpopulate(bo-&gt;tbo.bdev, bo-&gt;tbo.ttm);
+		}
+		spin_unlock(&amp;ttm_bo_glob.lru_lock);
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
That approach won't work. ttm_tt_unpopulate() might sleep on an IOMMU lock.

You need to use a mutex here or even better make sure you can access the
device_bo_list without a lock in this moment.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I'd also be worried about the notifier mutex getting really badly in the
way.

Plus I'm worried why we even need this, it sounds a bit like papering over
the iommu subsystem. Assuming we clean up all our iommu mappings in our
device hotunplug/unload code, why do we still need to have an additional
iommu notifier on top, with all kinds of additional headaches? The iommu
shouldn't clean up before the devices in its group have cleaned up.

I think we need more info here on what the exact problem is first.
-Daniel</pre>
    </blockquote>
    <p><br>
      Originally I experienced the&nbsp; crash bellow on IOMMU enabled
      device, it happens post device removal from PCI topology - <br>
      during shutting down of user client holding last reference to drm
      device file (X in my case). <br>
      The crash is because by the time I get to this point struct
      device-&gt;iommu_group pointer is NULL <br>
      already since the IOMMU group for the device is unset during PCI
      removal. So this contradicts what you said above<br>
      that the iommu shouldn't clean up before the devices in its group
      have cleaned up.<br>
      So instead of guessing when is the right place to place all IOMMU
      related cleanups it makes sense<br>
      to get notification from IOMMU subsystem in the form of event
      IOMMU_GROUP_NOTIFY_DEL_DEVICE<br>
      and use that place to do all the relevant cleanups.</p>
    <p>Andrey<br>
    </p>
    <p>
      <br>
      [&nbsp; 123.810074 &lt;&nbsp;&nbsp; 28.126960&gt;] BUG: kernel NULL pointer
      dereference, address: 00000000000000c8
      <br>
      [&nbsp; 123.810080 &lt;&nbsp;&nbsp;&nbsp; 0.000006&gt;] #PF: supervisor read access in
      kernel mode
      <br>
      [&nbsp; 123.810082 &lt;&nbsp;&nbsp;&nbsp; 0.000002&gt;] #PF: error_code(0x0000) -
      not-present page
      <br>
      [&nbsp; 123.810085 &lt;&nbsp;&nbsp;&nbsp; 0.000003&gt;] PGD 0 P4D 0
      <br>
      [&nbsp; 123.810089 &lt;&nbsp;&nbsp;&nbsp; 0.000004&gt;] Oops: 0000 [#1] SMP NOPTI
      <br>
      [&nbsp; 123.810094 &lt;&nbsp;&nbsp;&nbsp; 0.000005&gt;] CPU: 5 PID: 1418 Comm:
      Xorg:shlo4 Tainted: G&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; O&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5.9.0-rc2-dev+ #59
      <br>
      [&nbsp; 123.810096 &lt;&nbsp;&nbsp;&nbsp; 0.000002&gt;] Hardware name: System
      manufacturer System Product Name/PRIME X470-PRO, BIOS 4406
      02/28/2019
      <br>
      [&nbsp; 123.810105 &lt;&nbsp;&nbsp;&nbsp; 0.000009&gt;] <b>RIP:
        0010:iommu_get_dma_domain</b>+0x10/0x20
      <br>
      [&nbsp; 123.810108 &lt;&nbsp;&nbsp;&nbsp; 0.000003&gt;] Code: b0 48 c7 87 98 00 00 00
      00 00 00 00 31 c0 c3 b8 f4 ff ff ff eb a6 0f 1f 40 00 0f 1f 44 00
      00 48 8b 87 d0 02 00 00 55 48 89 e5 &lt;48&gt; 8b 80 c8 00 00 00
      5d c3 0f 1f 80 00 00 00 00 0f 1f 44 00 00 48
      <br>
      [&nbsp; 123.810111 &lt;&nbsp;&nbsp;&nbsp; 0.000003&gt;] RSP: 0018:ffffa2e201f7f980
      EFLAGS: 00010246
      <br>
      [&nbsp; 123.810114 &lt;&nbsp;&nbsp;&nbsp; 0.000003&gt;] RAX: 0000000000000000 RBX:
      0000000000001000 RCX: 0000000000000000
      <br>
      [&nbsp; 123.810116 &lt;&nbsp;&nbsp;&nbsp; 0.000002&gt;] RDX: 0000000000001000 RSI:
      00000000bf5cb000 RDI: ffff93c259dc60b0
      <br>
      [&nbsp; 123.810117 &lt;&nbsp;&nbsp;&nbsp; 0.000001&gt;] RBP: ffffa2e201f7f980 R08:
      0000000000000000 R09: 0000000000000000
      <br>
      [&nbsp; 123.810119 &lt;&nbsp;&nbsp;&nbsp; 0.000002&gt;] R10: ffffa2e201f7faf0 R11:
      0000000000000001 R12: 00000000bf5cb000
      <br>
      [&nbsp; 123.810121 &lt;&nbsp;&nbsp;&nbsp; 0.000002&gt;] R13: 0000000000001000 R14:
      ffff93c24cef9c50 R15: ffff93c256c05688
      <br>
      [&nbsp; 123.810124 &lt;&nbsp;&nbsp;&nbsp; 0.000003&gt;] FS:&nbsp; 00007f5e5e8d3700(0000)
      GS:ffff93c25e940000(0000) knlGS:0000000000000000
      <br>
      [&nbsp; 123.810126 &lt;&nbsp;&nbsp;&nbsp; 0.000002&gt;] CS:&nbsp; 0010 DS: 0000 ES: 0000
      CR0: 0000000080050033
      <br>
      [&nbsp; 123.810128 &lt;&nbsp;&nbsp;&nbsp; 0.000002&gt;] CR2: 00000000000000c8 CR3:
      000000027fe0a000 CR4: 00000000003506e0
      <br>
      [&nbsp; 123.810130 &lt;&nbsp;&nbsp;&nbsp; 0.000002&gt;] Call Trace:
      <br>
      [&nbsp; 123.810136 &lt;&nbsp;&nbsp;&nbsp; 0.000006&gt;]&nbsp; __iommu_dma_unmap+0x2e/0x100
      <br>
      [&nbsp; 123.810141 &lt;&nbsp;&nbsp;&nbsp; 0.000005&gt;]&nbsp; ? kfree+0x389/0x3a0
      <br>
      [&nbsp; 123.810144 &lt;&nbsp;&nbsp;&nbsp; 0.000003&gt;]&nbsp; iommu_dma_unmap_page+0xe/0x10
      <br>
      [&nbsp; 123.810149 &lt;&nbsp;&nbsp;&nbsp; 0.000005&gt;] dma_unmap_page_attrs+0x4d/0xf0
      <br>
      [&nbsp; 123.810159 &lt;&nbsp;&nbsp;&nbsp; 0.000010&gt;]&nbsp; ?
      ttm_bo_del_from_lru+0x8e/0xb0 [ttm]
      <br>
      [&nbsp; 123.810165 &lt;&nbsp;&nbsp;&nbsp; 0.000006&gt;]
      ttm_unmap_and_unpopulate_pages+0x8e/0xc0 [ttm]
      <br>
      [&nbsp; 123.810252 &lt;&nbsp;&nbsp;&nbsp; 0.000087&gt;]
      amdgpu_ttm_tt_unpopulate+0xaa/0xd0 [amdgpu]
      <br>
      [&nbsp; 123.810258 &lt;&nbsp;&nbsp;&nbsp; 0.000006&gt;]&nbsp; ttm_tt_unpopulate+0x59/0x70
      [ttm]
      <br>
      [&nbsp; 123.810264 &lt;&nbsp;&nbsp;&nbsp; 0.000006&gt;]&nbsp; ttm_tt_destroy+0x6a/0x70
      [ttm]
      <br>
      [&nbsp; 123.810270 &lt;&nbsp;&nbsp;&nbsp; 0.000006&gt;]
      ttm_bo_cleanup_memtype_use+0x36/0xa0 [ttm]
      <br>
      [&nbsp; 123.810276 &lt;&nbsp;&nbsp;&nbsp; 0.000006&gt;]&nbsp; ttm_bo_put+0x1e7/0x400 [ttm]
      <br>
      [&nbsp; 123.810358 &lt;&nbsp;&nbsp;&nbsp; 0.000082&gt;]&nbsp; amdgpu_bo_unref+0x1e/0x30
      [amdgpu]
      <br>
      [&nbsp; 123.810440 &lt;&nbsp;&nbsp;&nbsp; 0.000082&gt;]
      amdgpu_gem_object_free+0x37/0x50 [amdgpu]
      <br>
      [&nbsp; 123.810459 &lt;&nbsp;&nbsp;&nbsp; 0.000019&gt;]&nbsp; drm_gem_object_free+0x35/0x40
      [drm]
      <br>
      [&nbsp; 123.810476 &lt;&nbsp;&nbsp;&nbsp; 0.000017&gt;]
      drm_gem_object_handle_put_unlocked+0x9d/0xd0 [drm]
      <br>
      [&nbsp; 123.810494 &lt;&nbsp;&nbsp;&nbsp; 0.000018&gt;]
      drm_gem_object_release_handle+0x74/0x90 [drm]
      <br>
      [&nbsp; 123.810511 &lt;&nbsp;&nbsp;&nbsp; 0.000017&gt;]&nbsp; ?
      drm_gem_object_handle_put_unlocked+0xd0/0xd0 [drm]
      <br>
      [&nbsp; 123.810516 &lt;&nbsp;&nbsp;&nbsp; 0.000005&gt;]&nbsp; idr_for_each+0x4d/0xd0
      <br>
      [&nbsp; 123.810534 &lt;&nbsp;&nbsp;&nbsp; 0.000018&gt;]&nbsp; drm_gem_release+0x20/0x30
      [drm]
      <br>
      [&nbsp; 123.810550 &lt;&nbsp;&nbsp;&nbsp; 0.000016&gt;]&nbsp; drm_file_free+0x251/0x2a0
      [drm]
      <br>
      [&nbsp; 123.810567 &lt;&nbsp;&nbsp;&nbsp; 0.000017&gt;]
      drm_close_helper.isra.14+0x61/0x70 [drm]
      <br>
      [&nbsp; 123.810583 &lt;&nbsp;&nbsp;&nbsp; 0.000016&gt;]&nbsp; drm_release+0x6a/0xe0 [drm]
      <br>
      [&nbsp; 123.810588 &lt;&nbsp;&nbsp;&nbsp; 0.000005&gt;]&nbsp; __fput+0xa2/0x250
      <br>
      [&nbsp; 123.810592 &lt;&nbsp;&nbsp;&nbsp; 0.000004&gt;]&nbsp; ____fput+0xe/0x10
      <br>
      [&nbsp; 123.810595 &lt;&nbsp;&nbsp;&nbsp; 0.000003&gt;]&nbsp; task_work_run+0x6c/0xa0
      <br>
      [&nbsp; 123.810600 &lt;&nbsp;&nbsp;&nbsp; 0.000005&gt;]&nbsp; do_exit+0x376/0xb60
      <br>
      [&nbsp; 123.810604 &lt;&nbsp;&nbsp;&nbsp; 0.000004&gt;]&nbsp; do_group_exit+0x43/0xa0
      <br>
      [&nbsp; 123.810608 &lt;&nbsp;&nbsp;&nbsp; 0.000004&gt;]&nbsp; get_signal+0x18b/0x8e0
      <br>
      [&nbsp; 123.810612 &lt;&nbsp;&nbsp;&nbsp; 0.000004&gt;]&nbsp; ? do_futex+0x595/0xc20
      <br>
      [&nbsp; 123.810617 &lt;&nbsp;&nbsp;&nbsp; 0.000005&gt;]&nbsp; arch_do_signal+0x34/0x880
      <br>
      [&nbsp; 123.810620 &lt;&nbsp;&nbsp;&nbsp; 0.000003&gt;]&nbsp; ?
      check_preempt_curr+0x50/0x60
      <br>
      [&nbsp; 123.810623 &lt;&nbsp;&nbsp;&nbsp; 0.000003&gt;]&nbsp; ? ttwu_do_wakeup+0x1e/0x160
      <br>
      [&nbsp; 123.810626 &lt;&nbsp;&nbsp;&nbsp; 0.000003&gt;]&nbsp; ? ttwu_do_activate+0x61/0x70
      <br>
      [&nbsp; 123.810630 &lt;&nbsp;&nbsp;&nbsp; 0.000004&gt;]
      exit_to_user_mode_prepare+0x124/0x1b0
      <br>
      [&nbsp; 123.810635 &lt;&nbsp;&nbsp;&nbsp; 0.000005&gt;]
      syscall_exit_to_user_mode+0x31/0x170
      <br>
      [&nbsp; 123.810639 &lt;&nbsp;&nbsp;&nbsp; 0.000004&gt;]&nbsp; do_syscall_64+0x43/0x80 <br>
    </p>
    <p><br>
    </p>
    <p>Andrey</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:YAbilAl8g0d9s7vz@phenom.ffwll.local">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Christian.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+
+		if (adev-&gt;irq.ih.use_bus_addr)
+			amdgpu_ih_ring_fini(adev, &amp;adev-&gt;irq.ih);
+		if (adev-&gt;irq.ih1.use_bus_addr)
+			amdgpu_ih_ring_fini(adev, &amp;adev-&gt;irq.ih1);
+		if (adev-&gt;irq.ih2.use_bus_addr)
+			amdgpu_ih_ring_fini(adev, &amp;adev-&gt;irq.ih2);
+
+		amdgpu_gart_dummy_page_fini(adev);
+	}
+
+	return NOTIFY_OK;
+}
+
+
  /**
   * amdgpu_device_init - initialize the driver
   *
@@ -3304,6 +3339,8 @@ int amdgpu_device_init(struct amdgpu_device *adev,
  	INIT_WORK(&amp;adev-&gt;xgmi_reset_work, amdgpu_device_xgmi_reset_func);
+	INIT_LIST_HEAD(&amp;adev-&gt;device_bo_list);
+
  	adev-&gt;gfx.gfx_off_req_count = 1;
  	adev-&gt;pm.ac_power = power_supply_is_system_supplied() &gt; 0;
@@ -3575,6 +3612,15 @@ int amdgpu_device_init(struct amdgpu_device *adev,
  	if (amdgpu_device_cache_pci_state(adev-&gt;pdev))
  		pci_restore_state(pdev);
+	BLOCKING_INIT_NOTIFIER_HEAD(&amp;adev-&gt;notifier);
+	adev-&gt;nb.notifier_call = amdgpu_iommu_group_notifier;
+
+	if (adev-&gt;dev-&gt;iommu_group) {
+		r = iommu_group_register_notifier(adev-&gt;dev-&gt;iommu_group, &amp;adev-&gt;nb);
+		if (r)
+			goto failed;
+	}
+
  	return 0;
  failed:
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
index 0db9330..486ad6d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
@@ -92,7 +92,7 @@ static int amdgpu_gart_dummy_page_init(struct amdgpu_device *adev)
   *
   * Frees the dummy page used by the driver (all asics).
   */
-static void amdgpu_gart_dummy_page_fini(struct amdgpu_device *adev)
+void amdgpu_gart_dummy_page_fini(struct amdgpu_device *adev)
  {
  	if (!adev-&gt;dummy_page_addr)
  		return;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h
index afa2e28..5678d9c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h
@@ -61,6 +61,7 @@ int amdgpu_gart_table_vram_pin(struct amdgpu_device *adev);
  void amdgpu_gart_table_vram_unpin(struct amdgpu_device *adev);
  int amdgpu_gart_init(struct amdgpu_device *adev);
  void amdgpu_gart_fini(struct amdgpu_device *adev);
+void amdgpu_gart_dummy_page_fini(struct amdgpu_device *adev);
  int amdgpu_gart_unbind(struct amdgpu_device *adev, uint64_t offset,
  		       int pages);
  int amdgpu_gart_map(struct amdgpu_device *adev, uint64_t offset,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 6cc9919..4a1de69 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -94,6 +94,10 @@ static void amdgpu_bo_destroy(struct ttm_buffer_object *tbo)
  	}
  	amdgpu_bo_unref(&amp;bo-&gt;parent);
+	spin_lock(&amp;ttm_bo_glob.lru_lock);
+	list_del(&amp;bo-&gt;bo);
+	spin_unlock(&amp;ttm_bo_glob.lru_lock);
+
  	kfree(bo-&gt;metadata);
  	kfree(bo);
  }
@@ -613,6 +617,12 @@ static int amdgpu_bo_do_create(struct amdgpu_device *adev,
  	if (bp-&gt;type == ttm_bo_type_device)
  		bo-&gt;flags &amp;= ~AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;
+	INIT_LIST_HEAD(&amp;bo-&gt;bo);
+
+	spin_lock(&amp;ttm_bo_glob.lru_lock);
+	list_add_tail(&amp;bo-&gt;bo, &amp;adev-&gt;device_bo_list);
+	spin_unlock(&amp;ttm_bo_glob.lru_lock);
+
  	return 0;
  fail_unreserve:
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
index 9ac3756..5ae8555 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
@@ -110,6 +110,8 @@ struct amdgpu_bo {
  	struct list_head		shadow_list;
  	struct kgd_mem                  *kfd_bo;
+
+	struct list_head		bo;
  };
  static inline struct amdgpu_bo *ttm_to_amdgpu_bo(struct ttm_buffer_object *tbo)
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------ADFBD3FCDA684F114197BA75--

--===============1541716949==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1541716949==--
