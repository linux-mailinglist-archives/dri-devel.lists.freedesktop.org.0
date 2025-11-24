Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 785BBC7FC69
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 10:58:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9390888735;
	Mon, 24 Nov 2025 09:57:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="xh4mqRbQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010007.outbound.protection.outlook.com [52.101.61.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7FDC88735
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 09:57:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aRsjNBbGoyw2W1/vQVyTqlvTxYeYLaTY+Q10IMtOe8Tu0c6vcjlGmmkx6HX0N66cAReAMFD2lrqDnuddyiJbzVdlZ2ZeZ4ViebDpf/oL0OXtWRLzcg4dYlcHbEdiUyGQTz1HChJCIhlkGEccs57afgWPxb/3awC2Q9CBY8G4ypmqHrGHoooo7L5+MMrlMaIMYht4PJz/Y4qtlttZKLZkag3m0+gJ6Ocet0pc6eX3lSs4E10Z0S/tyRrgQMAq6/VsFMUB/z0CUB4kNhxtLUcK19xH1HXXb/qRLq7PIqJ51DOIcE+z1wZIauO+JjLzkS5hKxXDD3P3c3nGmK88/pe6vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+hdNtiOG4NNMKeJcqBAhH1ZUfHuuaqbLTcQM5EMbYI=;
 b=BdKq957T5KG4uA9+ULnPMzVqH5dUAS7CepcCEto4Hz0qB1OyTeSF447dLFa+lkzcVl4wsNq5jn6tenvJ6jiBxFXlNyDO29AnLa7tH+ivBQNPMPdGRkNIMxO8O0vf1jeZwnuQhjevOYkV11EK5C6R+nOhGTY35326Bgyzw436uxi6nt0UEjWBRVYYeucC9VltmYbZkCgQw4j5ZiQ84uLb545c7jK/sKwIN0NepMj61ceqDf6KPnS0CSS/FtFHFDmPi6SkMNBwkvCYVwo60S4r1khVcgy9jlnOpcIemdtiWEMnPpqWNbUtVmWUYaKVUfTtxZ0+d4ESOfAdf8Z/GMtz8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=suse.de smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+hdNtiOG4NNMKeJcqBAhH1ZUfHuuaqbLTcQM5EMbYI=;
 b=xh4mqRbQcFXL4loR8BYxYpaaO/rBVijKiaWLToHumxtHTY+xYjfSVMbyidso2L3s6RZrbQherMaeSbaJpdcAhxwyoOR3gw+JqPhZKZtg9MCXS+VK93/HLqXIIFkPtol1XIPxEYeXmgc90p/S3uCTnA4eOvJa1eftb9vWbpcVXEQ=
Received: from BL0PR02CA0132.namprd02.prod.outlook.com (2603:10b6:208:35::37)
 by IA1PR10MB6831.namprd10.prod.outlook.com (2603:10b6:208:425::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 09:57:53 +0000
Received: from BL02EPF0001A104.namprd05.prod.outlook.com
 (2603:10b6:208:35:cafe::9c) by BL0PR02CA0132.outlook.office365.com
 (2603:10b6:208:35::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.17 via Frontend Transport; Mon,
 24 Nov 2025 09:57:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL02EPF0001A104.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Mon, 24 Nov 2025 09:57:52 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 24 Nov
 2025 03:57:45 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 24 Nov
 2025 03:57:45 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 24 Nov 2025 03:57:45 -0600
Received: from [172.24.235.208] (hkshenoy.dhcp.ti.com [172.24.235.208])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AO9vcUp1757116;
 Mon, 24 Nov 2025 03:57:39 -0600
Message-ID: <982fa530-35ec-44e8-b95a-fe040efc5db5@ti.com>
Date: Mon, 24 Nov 2025 15:27:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v9 0/6] MHDP8546 fixes related to
 DRM_BRIDGE_ATTACH_NO_CONNECTOR usecase
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
CC: <Laurent.pinchart@ideasonboard.com>, <airlied@gmail.com>,
 <andrzej.hajda@intel.com>, <andy.yan@rock-chips.com>,
 <aradhya.bhatia@linux.dev>, <devarsht@ti.com>, <dianders@chromium.org>,
 <dri-devel@lists.freedesktop.org>, <javierm@redhat.com>,
 <jernej.skrabec@gmail.com>, <jonas@kwiboo.se>,
 <linux-kernel@vger.kernel.org>, <linux@treblig.org>,
 <luca.ceresoli@bootlin.com>, <lumag@kernel.org>, <lyude@redhat.com>,
 <maarten.lankhorst@linux.intel.com>, <mordan@ispras.ru>,
 <mripard@kernel.org>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <s-jain1@ti.com>, <simona@ffwll.ch>, <tzimmermann@suse.de>, <u-kumar1@ti.com>
References: <20251120121416.660781-1-h-shenoy@ti.com>
 <22985633-f20c-4f36-96d1-ce01fe6cf6df@ideasonboard.com>
Content-Language: en-US
From: Harikrishna shenoy <h-shenoy@ti.com>
In-Reply-To: <22985633-f20c-4f36-96d1-ce01fe6cf6df@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A104:EE_|IA1PR10MB6831:EE_
X-MS-Office365-Filtering-Correlation-Id: 58aa8bc8-7f11-4965-37a1-08de2b3feec8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|7416014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cjd2WnNoUUpvdzh5TXJFOTFyeXg1cG9xQ2ZlSXM1VjNndHB6b2lzanlINmFl?=
 =?utf-8?B?NWVDcGtOWU9hMmRRNEU1OW9wOEUwdTVKL1k4QWhKWFUrL1doSXNWZGo2K2M0?=
 =?utf-8?B?WWxVcllTeHlMclh0b25mREV1bEkxbXRIcitLaXAyWXZFUjlqU2RjZUxEVXVE?=
 =?utf-8?B?c3J2dGNZWERyOTNaZkJ3Z2JnRTl4NGhBT0pyWnRxTFRtSkloZEJhVkRGWG1Y?=
 =?utf-8?B?NG9MbXAwUVM2M0pWNVE1dElLK1Q4RGxaRFhzVzBlR2NsY0EwSE1WbkJQQjlZ?=
 =?utf-8?B?Vk5WSEl2dThYSHJ0QWJCeDZnTGpKdkZEd2JTbmkyWWR6SEwzOG5IM3FOWXoz?=
 =?utf-8?B?Yk9mVkFCU0lwKy9UcGFYdi91Vi9ScHkxSllHWHJDUHByNnN5TzFzUmgzd0lS?=
 =?utf-8?B?SE5ZbkF6NnYxNFpiQ1M5K0kzTE9WcHF1NnlyTUFaWjNPSXNrSU41OHRUUVYw?=
 =?utf-8?B?TExycjVOcTNxRlVaUHpka2FacXFxbzFxQ2REeDEzNmxTUnNpcyt2WWFNanpY?=
 =?utf-8?B?cld2blk2TXVDQW9HVElNNjI4RytrRDhROTF2aWhOTDI2WUxjeldLbzFMOUYr?=
 =?utf-8?B?WnZ1K1ZJaTJHSGcvR1BRaHcrakhDV2NkN2E2TE92RlFXWU5JcEwvWEp3SDVY?=
 =?utf-8?B?WTVlTkI1MGpxSTUyVXRJZkMwUm5FeENWbTdSdmZOMWFzWnVlRVlYYzJNTUVi?=
 =?utf-8?B?VzJLOWFkeXk0Um9WVWZ5ZmRZMlo0MHpvTDJKZnZMZ0VDdGpYRmNtcG14eWhx?=
 =?utf-8?B?N1h2bWJadHFtRks5eTBaR2twRUdoNTA2ZzFMWnJYay9zWGNEMEpWbTNWT0dw?=
 =?utf-8?B?YlRYMHp6VEJGdnZxZ3J4NFRXK0xMQW1DUDl6WENLcGc5WDk5VTR0a0k1Mnhj?=
 =?utf-8?B?RWgvdjc1WHE0WUhTWnFidUc4RzFYaW8vdHpoZHpsL0ltZitOOVNEQW5iNXE3?=
 =?utf-8?B?bGIwVUk2OFQ5UnR1c0FIU0FISlJVZlJneGd6aFljS3ZyWnFjODRJU2tzUGlo?=
 =?utf-8?B?U3VTN1AveU5UTkpNaHJoQUV6Ump0VC9EZ0JWb21hZmVkUVptNVpZc3Zsckh3?=
 =?utf-8?B?WTlYaGZkOEI4YStEVmtvTGF5N29ZSUI1RXV4VjRSNkliRXk2aUFaOW9KQms0?=
 =?utf-8?B?c1FzUjQxWjl3QUhObEVZNjJ5WTZIYTVCeVdCby9US1NyK1B0dWw2T3VpMDB0?=
 =?utf-8?B?aHJmVzRDQ0pCbXIxYkNCbWtlaVZGMXNwUEJOcURrdmc0TTZXL1FUU09rUFFJ?=
 =?utf-8?B?Nnlha243L29vRmxYRXcrZmdUWm4vb2xxUE9OcjZxRVQ1a3BqL1hKZXNjUmVl?=
 =?utf-8?B?Wk1kdEJFdlNSVnAzNW9kMGdnTFRDNWREN2UvcnlHZ2J4MUNSajRTRVZiZ1Rt?=
 =?utf-8?B?cmRRVE82eXFCTGNaMndRbkJnSE1DWGpUTWZKdmEzN2RYRXNXb0ZSOTVtUTJz?=
 =?utf-8?B?MXQyWERkZXZMSTdkWHZ2eVRoM2lPMFZ2b2lCd0Z3Ny9TU01vMmJlMFZ5Nytk?=
 =?utf-8?B?NGZaWGg2SEdWNGpScXVmcWQ0c016VVI1SW9zb1EvUEdOUEZucTBoNjZqRmJ6?=
 =?utf-8?B?UjZublF2OUh5SW0rczN0ZHZYUGhsVHJzb29jR2ZSclNXaDVEZW5nZWhuL0hz?=
 =?utf-8?B?NlRuS2lERjNkaXFrYkVZNVp5d2ZyZWplZFVOQllTb2hMZS84aVhtbms0T1Np?=
 =?utf-8?B?dHM0dFZKKyszdjBSU0RaYkZidWlCUGZNaElNZFBRdjdFZisvSFBtS3dxRk5K?=
 =?utf-8?B?R0dJUE9KRGp5OVhoVm1GK0lwOHBhb2FqZVJVR285L2JNT3RMdDRDajBuK0dq?=
 =?utf-8?B?cThCdFpFaVBoUTBmaFZYODBmL0t6dVdESWhTWnZHQ25wazFHVkQ1YStPRFN0?=
 =?utf-8?B?aWQvRUFVVFNVNDhQaTlqa0R0SysvV0I1dmEva0Z5R3VyTzd5a3htTUdqYmxj?=
 =?utf-8?B?VHY2eFBzbmpDSXAwWGxVR3F4bFBNenY0WWxPTkIzR1RMY1BtRU9EUi9Gd09V?=
 =?utf-8?Q?tMr8Rz7F/9XY8dBzwgCOewuK9YK734=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet200.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 09:57:52.0980 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58aa8bc8-7f11-4965-37a1-08de2b3feec8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.194];
 Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A104.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6831
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



On 21/11/25 17:37, Tomi Valkeinen wrote:
> Hi,
> 
> On 20/11/2025 14:14, Harikrishna Shenoy wrote:
>> With the DRM_BRIDGE_ATTACH_NO_CONNECTOR framework, the connector is
>> no longer initialized in  bridge_attach() when the display controller
>> sets the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag.
>> This causes a null pointer dereference in cdns_mhdp_modeset_retry_fn()
>> when trying to access &conn->dev->mode_config.mutex.
>> Observed on a board where EDID read failed.
>> (log: https://gist.github.com/Jayesh2000/233f87f9becdf1e66f1da6fd53f77429)
>>
>> Patch 1 adds a connector_ptr which takes care of both
>> DRM_BRIDGE_ATTACH_NO_CONNECTOR and !DRM_BRIDGE_ATTACH_NO_CONNECTOR
>> case by setting the pointer in appropriate hooks and checking for pointer
>> validity before accessing the connector.
>> Patch 2 adds mode validation hook to bridge fucntions.
>> Patch 3 fixes HDCP to work with both DRM_BRIDGE_ATTACH_NO_CONNECTOR
>> and !DRM_BRIDGE_ATTACH_NO_CONNECTOR case by moving HDCP state handling
>> into the bridge atomic check inline with the
>> DRM_BRIDGE_ATTACH_NO_CONNECTOR model.
>> Patches 4,5 do necessary cleanup and alignment for using
>> connector pointer.
>>
>> The rationale behind the sequence of commits is we can cleanly
>> switch to drm_connector pointer after removal of connector helper
>> code blocks, which are anyways not touch after
>> DRM_BRIDGE_ATTACH_NO_CONNECTOR has been enabled in driver.
>>
>> The last patch make smaller adjustment: lowering the log level for
>> noisy DPCD transfer errors.
>>
>> v8 patch link:
>> <https://lore.kernel.org/all/20251014094527.3916421-1-h-shenoy@ti.com/>
>>
>> Changelog v8-v9:
>> -Move the patch 6 in v8 related to HDCP to patch 3 and add fixes tag.
>> -Update to connector_ptr in HDCP code in patch 1.
>> -Rebased on next-20251114.
> 
> Don't base on linux-next, except in some quite special circumstances.
> Base on latest major version from Linus, or -rc from Linus, or
> drm-misc-next. Usually drm-misc-next is a safe choice for DRM patches.
> 
> And if you make changes to a series, it's not a "resend" but a new version.
> 
>   Tomi
> 
Hi Tomi,

Thanks for pointing it out, will re-spin next version v10 and base it on 
drm-misc-next.

Regards.

>>
>> v7 patch link:
>> <https://lore.kernel.org/all/20250929083936.1575685-1-h-shenoy@ti.com/>
>>
>> Changelog v7-v8:
>> -Move patches with firxes tag to top of series with appropriate changes
>> to them.
>> -Add R/B tag to patch
>> https://lore.kernel.org/all/ae3snoap64r252sbqhsshsadxfmlqdfn6b4o5fgfcmxppglkqf@2lsstfsghzwb/
>>
>> v6 patch link:
>> <https://lore.kernel.org/all/20250909090824.1655537-1-h-shenoy@ti.com/>
>>
>> Changelog v6-v7:
>> -Update cover letter to explain the series.
>> -Add R/B tag in PATCH 1 and drop fixes tag as suggested.
>> -Drop fixes tag in PATCH 2.
>> -Update the commit messages for clear understanding of changes done in patches.
>>
>> v5 patch link:
>> <https://lore.kernel.org/all/20250811075904.1613519-1-h-shenoy@ti.com/>
>>
>> Changelog v5 -> v6:
>> -Update cover letter to clarify the series in better way.
>> -Add Reviewed-by tag to relevant patches.
>>   
>> v4 patch link:
>> <https://lore.kernel.org/all/20250624054448.192801-1-j-choudhary@ti.com>
>>
>> Changelog v4->v5:
>> - Handle HDCP state in bridge atomic check instead of connector
>> atomic check
>>   
>> v3 patch link:
>> <https://lore.kernel.org/all/20250529142517.188786-1-j-choudhary@ti.com/>
>>
>> Changelog v3->v4:
>> - Fix kernel test robot build warning:
>>    <https://lore.kernel.org/all/202505300201.2s6r12yc-lkp@intel.com/>
>>
>> v2 patch link:
>> <https://lore.kernel.org/all/20250521073237.366463-1-j-choudhary@ti.com/>
>>
>> Changelog v2->v3:
>> - Add mode_valid in drm_bridge_funcs to a separate patch
>> - Remove "if (mhdp->connector.dev)" conditions that were missed in v2
>> - Split out the move of drm_atomic_get_new_connector_for_encoder()
>>    to a separate patch
>> - Drop "R-by" considering the changes in v2[1/3]
>> - Add Fixes tag to first 4 patches:
>>    commit c932ced6b585 ("drm/tidss: Update encoder/bridge chain connect model")
>>    This added DBANC flag in tidss while attaching bridge to the encoder
>> - Drop RFC prefix
>>
>> v1 patch link:
>> <https://lore.kernel.org/all/20250116111636.157641-1-j-choudhary@ti.com/>
>>
>> Changelog v1->v2:
>> - Remove !DRM_BRIDGE_ATTACH_NO_CONNECTOR entirely
>> - Add mode_valid in drm_bridge_funcs[0]
>> - Fix NULL POINTER differently since we cannot access atomic_state
>> - Reduce log level in cdns_mhdp_transfer call
>>
>> [0]: https://lore.kernel.org/all/20240530091757.433106-1-j-choudhary@ti.com/
>>
>> Harikrishna Shenoy (1):
>>    drm/bridge: cadence: cdns-mhdp8546-core: Handle HDCP state in bridge
>>      atomic check
>>
>> Jayesh Choudhary (5):
>>    drm/bridge: cadence: cdns-mhdp8546-core: Set the mhdp connector
>>      earlier in atomic_enable()
>>    drm/bridge: cadence: cdns-mhdp8546-core: Add mode_valid hook to
>>      drm_bridge_funcs
>>    drm/bridge: cadence: cdns-mhdp8546-core: Remove legacy support for
>>      connector initialisation in bridge
>>    drm/bridge: cadence: cdns-mhdp8546*: Change drm_connector from
>>      structure to pointer
>>    drm/bridge: cadence: cdns-mhdp8546-core: Reduce log level for DPCD
>>      read/write
>>
>>   .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 258 +++++-------------
>>   .../drm/bridge/cadence/cdns-mhdp8546-core.h   |   2 +-
>>   .../drm/bridge/cadence/cdns-mhdp8546-hdcp.c   |   8 +-
>>   3 files changed, 72 insertions(+), 196 deletions(-)
>>
> 

