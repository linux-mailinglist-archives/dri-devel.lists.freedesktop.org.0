Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E44BC72A5E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 08:49:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 254D710E6FE;
	Thu, 20 Nov 2025 07:49:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="ABZen0qN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011071.outbound.protection.outlook.com [52.101.52.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CD7F10E059
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 07:48:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J91YqbKFmRFf+7WfernJXuhvkzajgjCyIU3YB0n6uPCfmaxOePjSopLaan9659foi4ma20giz8M6YhAVOIxxzopI0rV3k094Ag+Q8JxAoIrtgF7ssgMdn5Stnbc8IgOEJB4zT4qhXBp1WQ69yR/j5lGvvlGpAXcUGR3y4FfaSnqU+7LN1tjg5Tv/R9v+D9GcTFJDOG0Snhb7SERsb4FlLm6ft/YdOqvfxVPxrNRJhrN/cXESS4HHMx6OZ7Zc7YSJEWpQeBGN6nd8n3bGn94cDtYuI+SBBL1oSKJjTYWCFg7NIkNgTa9yVZiWcD7Fsi69ZhVZk5UMZTv/7PSgyGLzZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vz3h0W96EArUb05eclY0jtJH4O1C7FzpFlDD8clPRPo=;
 b=R5FK+34cexSvKPxAgoErkUzttSSmUjFonfpHo0pkF455a4FUiPhYK51MeqKEpa0h1ebo5hjVeOmC+c7w2b6ni4ljuFZ3IfQ5oJWiFPW/YJdn8kWFPC4HP/PBK+bjGTN8S9aUyBdtcuGgp/6R4sBzKDmJbXxO7uxgzVq3L04QtjcKUKuL3R8rYvPcJGt5Df3aFHV/i4WVQdDzeQTdk22GgMvPsubn3LD34xM0TsbJeqreRAxMUmv5ZzTUyqjyzyS2fVK9lSysf5TgX1vXGO59CtM5Lte9lBJsmDXjNTdW3FK33+UNgM9CY9rV9mRfw/B7ADJOun6XO0Ctjo6fqj+PAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=suse.de smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vz3h0W96EArUb05eclY0jtJH4O1C7FzpFlDD8clPRPo=;
 b=ABZen0qNL9ZoasL32MKVkuFkqNWe19U7onMrV8bIkteO0Q5Hasm+vYAfauzECE61eYWt+BXTXKtWCQ1oIcoWa+VNDngPex1fRej1gXmyMXNq3C0pWEef6YyVcRYF3xh+GfwhJvVP4+Q5YmDySw11vk2BeY8QFdtOSEtphcaofnE=
Received: from SJ0PR13CA0238.namprd13.prod.outlook.com (2603:10b6:a03:2c1::33)
 by PH7PR10MB7766.namprd10.prod.outlook.com (2603:10b6:510:30c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 07:48:55 +0000
Received: from MWH0EPF000971E9.namprd02.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::d2) by SJ0PR13CA0238.outlook.office365.com
 (2603:10b6:a03:2c1::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Thu,
 20 Nov 2025 07:48:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MWH0EPF000971E9.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Thu, 20 Nov 2025 07:48:54 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 01:48:50 -0600
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 01:48:50 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 20 Nov 2025 01:48:50 -0600
Received: from [172.24.235.208] (hkshenoy.dhcp.ti.com [172.24.235.208])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AK7mhI93297558;
 Thu, 20 Nov 2025 01:48:44 -0600
Message-ID: <85b86f9f-2ab9-4bfd-b06b-9543244507a7@ti.com>
Date: Thu, 20 Nov 2025 13:18:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/6] MHDP8546 fixes related to DBANC usecase
To: Maxime Ripard <mripard@kernel.org>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>
CC: <Laurent.pinchart@ideasonboard.com>, <airlied@gmail.com>,
 <andrzej.hajda@intel.com>, <andy.yan@rock-chips.com>,
 <aradhya.bhatia@linux.dev>, <devarsht@ti.com>, <dianders@chromium.org>,
 <dri-devel@lists.freedesktop.org>, <javierm@redhat.com>,
 <jernej.skrabec@gmail.com>, <jonas@kwiboo.se>,
 <linux-kernel@vger.kernel.org>, <linux@treblig.org>,
 <luca.ceresoli@bootlin.com>, <lumag@kernel.org>, <lyude@redhat.com>,
 <maarten.lankhorst@linux.intel.com>, <mordan@ispras.ru>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>, <s-jain1@ti.com>,
 <simona@ffwll.ch>, <tzimmermann@suse.de>, <u-kumar1@ti.com>
References: <20251118115255.108225-1-h-shenoy@ti.com>
 <i7byagpaadjjhc6rbqvejsxezn2eeomtw2ddpxirwjuezfdf3x@tez2ooxn76dv>
 <821dff40-28f2-48e1-8821-795527d396c0@ideasonboard.com>
 <ujpesz2g2emhukb75yrxdlxzd2cfwbfoejlngtyxurjt45w45p@qjtcvk7in7mz>
Content-Language: en-US
From: Harikrishna shenoy <h-shenoy@ti.com>
In-Reply-To: <ujpesz2g2emhukb75yrxdlxzd2cfwbfoejlngtyxurjt45w45p@qjtcvk7in7mz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E9:EE_|PH7PR10MB7766:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d86a6ed-2b79-4cd7-9b86-08de280940ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YzJMK2NFSzFNSEVXUUNRZ1pYUGxGTWRXTG9qbDY3eUhZdkpJWDNPZm5odHYw?=
 =?utf-8?B?S2JrTW5peTFzbnZFSlVYQ05tenNyUG9ieVJXbHkrRnpkL2tPckN2Z2RhMGsy?=
 =?utf-8?B?OVpqMXFkRUlTK1BsYmtFdEZKTE5CWDBQZExtK3BmbW53M0thR1dqeVRkQzFi?=
 =?utf-8?B?VCt4RmNIL2JJRHE4eXc1V1MzNU1RZjE0TmJXNVBKM1V5M2tyM3lJNkN1T1Vz?=
 =?utf-8?B?dWM4NHRYaWVza2J3SCt6Lyt1cEg5TVpwN2crOUhQSUZ3VEFuNDM2SlptT2RO?=
 =?utf-8?B?VmwvdVpxSVE2aVJXTXhoQ2xncElFeFZLcGtuSWxSK1JJWXV4aXdKMnBWeWIy?=
 =?utf-8?B?OEhESVl3TDZFWnZkT1JCVVpCVFk2cVF1c3gvWGhGbXNTRVN5OUdnUEFOQjEx?=
 =?utf-8?B?SU5ZZW5ad05KbklQdnRUa0RwR1RQeW5rTE9SSndPa1hqdTRCdStJV2tvZW9o?=
 =?utf-8?B?cHZkb21STEZGZEhlZEY3T3VpWFZHNFNmb0lPaEZoclI1b1RqUEZOZWo0L0k1?=
 =?utf-8?B?RHFnaUIrM1FtRS9QYUhGODhBSUxRd3RocEtwaFY0N1J4RG03ZHdrR2JyQkNK?=
 =?utf-8?B?SG1jcWlqMjgwUzMvYTBFVlYxMTc3N25sczZnWUlNdjM2NXhERjIvQ0FGeFpK?=
 =?utf-8?B?WUcxenNtanBIOWFKeVBTWWJ5VDQwRkRqSjcvdWFQQnFlaGp6MEc3OWpxbUZk?=
 =?utf-8?B?SC9CNVE0eitjeHAvN3VMMXdzQ29ZT08yMWFJTXZNVFJEMG9sRUwzbzV0QVRS?=
 =?utf-8?B?TXZ6QVVCSDRZbE5IMDRiNyswT2h6akRDS0tUQWs2UjNUWE5uWmpCQ01hTDhk?=
 =?utf-8?B?VzAra3hMZURJZHIzQ1JlSFdVZDBTc1FaN090VjN2L3JIUlowOFVOT3JMdGJG?=
 =?utf-8?B?UmFnc255WnBpbWNOQm1LZnFiRTdlZFhnYVZaQ09TTG9tcXR0RFhoai8xcWUr?=
 =?utf-8?B?YzdFckwrOG0rS3ZsZ0t1RUR6dFFNYWtxVkhpdnlrY2I3ZUpVYjM1OWxTcWNC?=
 =?utf-8?B?cVhaeVhTZHN5Y2d6bU1hUHYxK1MwdzA1NHBkYXh3dDFVdkZhcndRQjc1SVhQ?=
 =?utf-8?B?eUZHeVlqcE14M1F6N0F1cERrb3dhekd0bVNCZnl3djlvSndITnl3SXV6aWxG?=
 =?utf-8?B?TjQwQS9XTXlRUHFmRE1mRk5aa3kySzNkclczUnBLYVd4WVRQSW1haTlvdVFS?=
 =?utf-8?B?cloyK1F3VERrMDNZN0Q0dldsNWJoL2N4ZUtIVHBLK1IveTNNMnNuTXFOQjhk?=
 =?utf-8?B?ZW1DV3ZxN3YwT1hMRndpV1BCY1hJWTJyUjJIek11QkNrZFl2SUpCazR1aHRn?=
 =?utf-8?B?ZmRSaUwzN3VGOEZOMHh6anVYVlVtcE9RTGhQekpyZXRKQm53TnowWThrK0RW?=
 =?utf-8?B?SXVHT2hTanN6Y2ZRTE9uczlSL1BtQ2pFZWRJTkNxYWlnQVFiUGdkZ05QTHJt?=
 =?utf-8?B?YXNnSkpETWExNUdTUUhTRHVjMXM5aTRFY0kwMW1CejVMVnZkMTF6QVdSdTY1?=
 =?utf-8?B?c01KZXhBOGxBVVdOYllZWmJCNE9UZ3F3bXlIZEYwbTdvREFjWTZWV1I0NXNh?=
 =?utf-8?B?cHptdUJSK3RDSFppbDNUVjAzQS9NZEZTeXEzNGRPR3pjbWw4Y2I1b29KNmIy?=
 =?utf-8?B?TkFxT2lDWlhaTnJ5MGZuNWFhd0ZXeTlXQkRIU2ZlVkpFUW9oWEpYZXlJODIx?=
 =?utf-8?B?akZ5YVQ1OEl6ajE5dlpVdUZ4NzdGN1NJOFk4N05jUndsd0I0ekJINVhFNzg0?=
 =?utf-8?B?azNCSXpIVnNicHJLVEZoVnNiKy9COW1YS00wNHJoM1p1akF0bEVwdld6NXAv?=
 =?utf-8?B?bTdBODNVbU9JTjFzM0FZT0tLRVUwU2VwWGQvSHMzL3NvRVVjRHlBVWJ3eFRF?=
 =?utf-8?B?eXJsOUFmV2FFd0RhYnpEbVgySTd6Wkl3WE44K3ZvM09PNEdXMjdmNjVlTzF6?=
 =?utf-8?B?eDVkVzhaeFFDamhsd2E0SHRmdVV2NWoxVnZjbFByL1Rob1JnOTJ6VWJSYkJj?=
 =?utf-8?B?aWhUdExnWTdLWjdBZjB3dEFYMGY5dUNFaWRVc09aeDBOamJrK2hLUHdwUzdF?=
 =?utf-8?B?amN1eHZHNjZUTk1YZ0k1WDd4VUJtNlhqZDlOMTEwRUZORVREeGRpQ21xeE85?=
 =?utf-8?Q?VHkI=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet200.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 07:48:54.1656 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d86a6ed-2b79-4cd7-9b86-08de280940ef
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.194];
 Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000971E9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7766
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



On 18/11/25 21:50, Maxime Ripard wrote:
> On Tue, Nov 18, 2025 at 04:52:49PM +0200, Tomi Valkeinen wrote:
>> Hi,
>>
>> On 18/11/2025 14:40, Maxime Ripard wrote:
>>> Hi,
>>>
>>> On Tue, Nov 18, 2025 at 05:22:49PM +0530, Harikrishna Shenoy wrote:
>>>> With the DBANC framework, the connector is no longer initialized in
>>>> bridge_attach() when the display controller sets the
>>>> DRM_BRIDGE_ATTACH_NO_CONNECTOR flag.
>>>> This causes a null pointer dereference in cdns_mhdp_modeset_retry_fn()
>>>> when trying to access &conn->dev->mode_config.mutex.
>>>> Observed on a board where EDID read failed.
>>>> (log: https://gist.github.com/Jayesh2000/233f87f9becdf1e66f1da6fd53f77429)
>>>>
>>>> Patch 1 adds a connector_ptr which takes care of both
>>>> DBANC and !DBANC case by setting the pointer in appropriate hooks
>>>> and checking for pointer validity before accessing the connector.
>>>> Patch 2 adds mode validation hook to bridge fucntions.
>>>> Patch 3 fixes HDCP to work with both DBANC and !DBANC case by
>>>> moving HDCP state handling into the bridge atomic check in line with
>>>> the DBANC model.
>>>> Patches 4,5 do necessary cleanup and alignment for using
>>>> connector pointer.
>>>
>>> It's mentioned several times in your series, and it might be obvious to
>>> you, but documenting what is the "DBANC framework" is would be helpful.
>>> I have no idea what it's about, and it appears that Google doesn't know
>>> either.
>> Yes, I was a bit baffled initially. DRM_BRIDGE_ATTACH_NO_CONNECTOR.
> 
> Oooooh, thanks
> 
>> I think it makes sense to only use "DBANC" if it's first introduced in
>> that patch. So don't have a patch that just uses "DBANC", even if the
>> previous patch did explain what it means. And if there's just one or two
>> "DBANC"s, just spell it out "DRM_BRIDGE_ATTACH_NO_CONNECTOR".
> 
> Yeah, I'd go even further. Acronyms are fun but something being obvious
> is better still. Use the proper flag name every time.
> 
> Maxime

Hi Maxime,

Thanks for pointing this out, will resend the series replacing the 
acronym with proper flag name.

Regards.
