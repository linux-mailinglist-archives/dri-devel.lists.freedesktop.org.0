Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D62F9F9915
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 19:08:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93EC789561;
	Fri, 20 Dec 2024 18:08:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wvSZ/8gw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2087.outbound.protection.outlook.com [40.107.223.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 342A889561
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 18:08:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u8doWQP+MzAdTpp70DczvT2Qfg0EitT6aMcZnYsgmS8Zer8StpxZ27TTKNvObgUwt+pN9KEOEKMfzMoNZUHNrbSElto6D11P0eb+c12PxzxAEXvEn7B5YNwE97dPnhs5aM1uJnnZgzemgeUlQ12WuQogqKE+lffpKoJtRSiYpyuS83nj7hDtWhMac/I3nkP+QZQsrCtnbnqr4/V5Wybk2dpj/jCa+zOiUbWpo7+Tb3rkz7I9cR1r951a4Diocn8oT7aHz0DG1WFwe29ITgsjnSXJvn0ffcKGcFMdpGmSpZqLyRPUGpqkZqINIjZ+l50/VLAwYBD92Qd5MePU2fVDHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1fbxS/JUp8RexRkw5nr5R5y9lTopazc/X+vgmXs2bd4=;
 b=Cc20I2Syj1aDJbnBPohdxLADRd8fMvFfV7scR+ejZwg0fMbyPmXXwkfaTtQpYhxz8xkL8GNYMNbWK6AGG7Lv1XjvNY3WXWdtat41efKbmNMtYVw9lZoN/M/o7AL6lFAhezdT8noV+LTa2YhAs0oTDeqZKMuH21iD9/NI3N50ynFs+XPz/0C4meBpJNcG2KOHfNfNAQPGPXgtTCPBGioByCZH5tOV1m+073WUnSOjR5jh3RXnR2bYW+/PGCfaUgjNL0Kbv9dm3F7VRLH+m0tkhrCXj/xINF5yHRFZgI2Vq9uUZmLGmaoz4dScy5lWWZw7CZXMzfcewqDK8vF8bibDww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=quicinc.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1fbxS/JUp8RexRkw5nr5R5y9lTopazc/X+vgmXs2bd4=;
 b=wvSZ/8gwMkN6qLHrbvyGTCnGfafvC+Doy5tzA6IaY/MgDVSIcJ6nOzfgPC6Md9zlT5bBdvsb6KYchyLWyxskE196yCjNxFJRjw1lQK9vslBvQsIoveFJWEw6Zf01qVpILoF/n+7/0hAuREMp5zPN4LdNlIycnFW8Eg+z0eeFTc4=
Received: from BYAPR02CA0061.namprd02.prod.outlook.com (2603:10b6:a03:54::38)
 by PH8PR12MB6769.namprd12.prod.outlook.com (2603:10b6:510:1c4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Fri, 20 Dec
 2024 18:08:44 +0000
Received: from MWH0EPF000971E8.namprd02.prod.outlook.com
 (2603:10b6:a03:54:cafe::5f) by BYAPR02CA0061.outlook.office365.com
 (2603:10b6:a03:54::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.23 via Frontend Transport; Fri,
 20 Dec 2024 18:08:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000971E8.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 18:08:43 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Dec
 2024 12:08:42 -0600
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 20 Dec 2024 12:08:41 -0600
Message-ID: <d0a2059e-7c81-1eb8-6c59-0f72c0688ef5@amd.com>
Date: Fri, 20 Dec 2024 10:08:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 6/7] accel/qaic: Add config structs for supported cards
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, <quic_carlv@quicinc.com>,
 <manivannan.sadhasivam@linaro.org>, <quic_yabdulra@quicinc.com>,
 <quic_mattleun@quicinc.com>, <quic_thanson@quicinc.com>
CC: <ogabbay@kernel.org>, <jacek.lawrynowicz@linux.intel.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <mhi@lists.linux.dev>
References: <20241213213340.2551697-1-quic_jhugo@quicinc.com>
 <20241213213340.2551697-7-quic_jhugo@quicinc.com>
 <cd442cee-a37d-7d3b-8acf-59a3b5138bf4@amd.com>
 <c24e081b-7e2a-4bb0-9445-458e21e964f3@quicinc.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <c24e081b-7e2a-4bb0-9445-458e21e964f3@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E8:EE_|PH8PR12MB6769:EE_
X-MS-Office365-Filtering-Correlation-Id: 67545e91-df36-41fc-0230-08dd21215737
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QWp4OW5GNEJ6RWlJeCtpczhuNVNDQTV6VzZ1QVRFYUxaRVlOYUVnaVg1a2Jx?=
 =?utf-8?B?OXZVQ0JYVVRBM1VIM2Jsbm5hMVZ5TmZTeWxpM0dlUll6NTArcWZ5RWEyclhS?=
 =?utf-8?B?K0x3TEFTbEdKRWprUVhVRTdpaDBhK3ZRaXZpREg3VTVBeE5PYU1hK3NXYmlI?=
 =?utf-8?B?NktjazYwVlhWOVNqSXdTcVB1TGF1Zm9iaU9wWXg0Q2VqQVRtNzFRWTQvR1pO?=
 =?utf-8?B?dmtBaXN3SXFQVmdSZHhWbllpZEhJZGs1RVhveTB6ZVFmZmZLQmNmRnJyL3lB?=
 =?utf-8?B?ejJIZVlNZHVuMU1sZjR1Y3doZXNXNE1ZZEVmL2F6TjFGSnhLMnplS0ZmWnNx?=
 =?utf-8?B?WU1FalpLZTIvdk14eEM2QTdoSFBtZW9wYlQramZVK3dlR2pvaVdsS0k2dlhP?=
 =?utf-8?B?SUlYOG5KWDB3WlU1QkQ4K0xuYThvRlM5MjM5UXo3OVFlaTI1ZDBMSG90dHBP?=
 =?utf-8?B?TTR4S1B2TGZnUk1UNGVoRG5nVkMyT0NvMW84WXFKZ0xVNk96YU40bzVFWE5u?=
 =?utf-8?B?aGlPS3RxVE1PQlM1V2JWSEd5VmFreXdqVHhZR2p4dk13MEZsSEdQbnBrSFUv?=
 =?utf-8?B?U1hUYVdFc1dRZjFjK0d5bnNka010YllGUDhBL1ZHTnRHc3MyaGlhOU5PUGVr?=
 =?utf-8?B?VldDKzBHV1IwMEJFclVpVHVlSWdkRllaaVE1WFl5TmlhQ1IwTWtMc0c5aXJU?=
 =?utf-8?B?NUhZY25vV0FFTGFqTnlOQnZGT1JYeThsS1ZQeFpGbks3ajlYckFVK0xWSkFu?=
 =?utf-8?B?K1dwZ0FBZXduc2dmeUdZK3ZObkx6dzBGNllwdVZKRG5PZFhZOUVrRFRhNjFv?=
 =?utf-8?B?QjFXek4wNlJvVkQ4Yndza3hYWWtaUWgwMy9xYWE0NU5ITE90ZGxOUjJnK0g4?=
 =?utf-8?B?K2VRYktqYys4cnFhMXZnVEd4WXVOOEEzQnVwcmo1M0VsL2p6WUxLdlJpeVZu?=
 =?utf-8?B?YTEreDZ4RFhpVG9NTk9pVnVHb1l6SndVbnhGR0RXbGE3R29XSFFCN2RoS0Rh?=
 =?utf-8?B?c2J6bmdiN2ErY3RvNktZOHd4Ry9LWTdhRUtKLytFd1BVRGFwYnVISy96alBs?=
 =?utf-8?B?S0dIaGhoTVp6cFhJano3Q2VKMUViSlRDdTIzSnBFUmVhWXlxY09HZ2wyK0F0?=
 =?utf-8?B?YVIybGxKUEpRWnhZQzMxUVVHeVVRK3UzM3FIb0cvWS9hN0ZHUXU1b0NPWW5G?=
 =?utf-8?B?UTM5YTRITDhyVGxXNFdDbzBrNlE0dVp3UmhoWWE0b2FXdk9uR0laVmNSWSs5?=
 =?utf-8?B?dm1iYmtOd1R2enJPU3FWaER5SHFIM1o1Yk1hMERrQy9RQUErQzJUcE1hWGRX?=
 =?utf-8?B?UjdoQ3ZISU5Lb3RjN0RNWWMxNXY5RTIzYXdqTkFPM2xvRDRBa1hDYU5LZVJU?=
 =?utf-8?B?L0Y3UnlHQXFkZE1QbVBITkN5VjliN3M0ZGJVMkpGK0lDZUd5VEZtaVNrWUFP?=
 =?utf-8?B?Zkx0L21pSmUzTENibExiMDdyOEpiaWVnVHRMOUUvSExkOE1TM1FqMjYrVm9u?=
 =?utf-8?B?M3phNkdWbm1kWjZ3dzVwbmdlU2pwT3ZFSWJQK2JPK25nNENtMHZHS3lhMXFP?=
 =?utf-8?B?T1RZemZ5TzRxWWdFRDJVNUUwWGtyQ01qcW1FWTdLdHF6a3lnSC9UeFAreUp6?=
 =?utf-8?B?RGZyMFdPYWdhWCtjUUVsUUYrVDhtZVdLeG8rSjRZNUpHTnA1QkVQayt6aXVl?=
 =?utf-8?B?L1hoYU5DNWVQblFucTFhTS9tN2NrSk12WSs1MVI4TndLS1JnSmFWa1hUbVIv?=
 =?utf-8?B?c0VLbURNbHgyS1puTEU1RG4zTHJxeVBnVTE5M21meDZ0NTcyYVk0U3BkV29u?=
 =?utf-8?B?ZGNHOUVXSjI0N2VWR2M2NEExYmV6a2tMa1pqZUxORUtRNDFHT013OFR3ZEhv?=
 =?utf-8?B?SzhlU2ltbFRpYWxxVVoraVBhUTIzTDgwbUJPb3RHUXBQQk1DdEZYbDFhcFdi?=
 =?utf-8?B?cTk3Q3ViTFRLbnhkdWQ4a21lK3JuN2ZXdlM2UkRUY0NhcVFmNFVvVUxJbENq?=
 =?utf-8?Q?oSQLFEcCc3Cw2SFsrH6FN1vABC5Q0s=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 18:08:43.5463 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67545e91-df36-41fc-0230-08dd21215737
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000971E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6769
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


On 12/20/24 09:15, Jeffrey Hugo wrote:
> On 12/13/2024 5:35 PM, Lizhi Hou wrote:
>>
>> On 12/13/24 13:33, Jeffrey Hugo wrote:
>>> -static struct qaic_device *create_qdev(struct pci_dev *pdev, const 
>>> struct pci_device_id *id)
>>> +static struct qaic_device *create_qdev(struct pci_dev *pdev,
>>> +                       const struct qaic_device_config *config)
>>>   {
>>>       struct device *dev = &pdev->dev;
>>>       struct qaic_drm_device *qddev;
>>> @@ -365,12 +391,10 @@ static struct qaic_device *create_qdev(struct 
>>> pci_dev *pdev, const struct pci_de
>>>           return NULL;
>>>       qdev->dev_state = QAIC_OFFLINE;
>>> -    if (id->device == PCI_DEV_AIC080 || id->device == 
>>> PCI_DEV_AIC100) {
>>> -        qdev->num_dbc = 16;
>>> -        qdev->dbc = devm_kcalloc(dev, qdev->num_dbc, 
>>> sizeof(*qdev->dbc), GFP_KERNEL);
>>> -        if (!qdev->dbc)
>>> -            return NULL;
>>> -    }
>>> +    qdev->num_dbc = 16;
>>
>> Is it better to put num_dbc in qaic_device_config?
>
> I think there is no clear "right answer".  All known devices use 16. 
> There may be a future device which has a different value, at which 
> point I think this needs to be in qaic_device_config.  For this patch, 
> I was conservative and only included items in qaic_device_config which 
> do vary between the known devices.
>
> I'll think in this a bit more.
Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
>
>>
>> Thanks,
>>
>> Lizhi
>>
