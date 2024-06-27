Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B7791B18F
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 23:28:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5D4210EB74;
	Thu, 27 Jun 2024 21:28:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="D9hYoBej";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2065.outbound.protection.outlook.com [40.107.223.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF69010EB7A
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 21:28:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X5/kD5q9JTitrd5sIrCPKfOLu1HkoJoR2qNitzrxt03j97N7RnTwqe49ki+MGTEycGVMeUfZNFvulyucZuaeIETk22WUM6EVQ1sLRwplcpin4xrLQhttuRt1TiNooCwtrU1k4BUgMWtP009mukeP7JMMUK4uXUn3FGjYWqZ79LZPjXqoFUVaU+Z/ztLnB3eEFYUJxy0VLe0Dp64AD50JEWzOFUBFEfaCS1OzEa7r/gBiVIYXy/AWkw4FD9m8+z6tlgFP+hpg2gP7PylypDuHC0WqlOEFzv8DzDunAg0TfFEvMhsKP3XhAOeUPBG0684yyzCP3Ac5u4xyHVek5Rv1+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D2+21H1UqhXxeRJT8Yq1RlDyUUB1PsRpyNHZi3I/yc0=;
 b=aJWjMNLJr5H5E4FPl9ecMWYf4gkK3lLZu3xpP+zpgb8rx065ccLYqP8+HkCsagA45h5LmNn6i+a6T4SDD/M7S1wdjagOGKlc5qXQO0L9a+lTqkvQ5w3jlXpoqZg9NR/txUn80pF2/NqcyvLsbz37hyjOSezLpidkJi1Qc8YfxXV0msBmmz6pI2Z1N3gs6ZXcGi3dTyNnbwcOZ5OkigCvBg/S/bqxfplsUskjHBUHt+YNo5tgcEyjnF3+BpBmxMvMvGdbi8I1zhowdK/18xskB3wQJHc+EXWW0M6cxYP+dSST0ccEVmrBzdSNesNg40AqDtWwQoqafyI2LJA5BBoHEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D2+21H1UqhXxeRJT8Yq1RlDyUUB1PsRpyNHZi3I/yc0=;
 b=D9hYoBejJxajzlypX5h0xqS7o1FhB2EjLQ1WIDt1MgszR80LxWh01KEkYVm4pf2/JKf34gVEd83CddMBU+4VOxH80AFnz8jIT9aY8mEd0znqgFQjn8v+aZtrD/MDQjbhFiJ9g6xC7jXPAkbm+xB3rtrDDwpm20/2IWVVLcNESIU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB6839.namprd12.prod.outlook.com (2603:10b6:806:265::21)
 by DM4PR12MB7575.namprd12.prod.outlook.com (2603:10b6:8:10d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Thu, 27 Jun
 2024 21:28:33 +0000
Received: from SN7PR12MB6839.namprd12.prod.outlook.com
 ([fe80::eaf3:6d41:3ac0:b5f4]) by SN7PR12MB6839.namprd12.prod.outlook.com
 ([fe80::eaf3:6d41:3ac0:b5f4%6]) with mapi id 15.20.7698.033; Thu, 27 Jun 2024
 21:28:27 +0000
Message-ID: <19ca1a46-6a74-4eec-9e84-0092faaee7a1@amd.com>
Date: Thu, 27 Jun 2024 17:28:24 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm: panel-orientation-quirks: Add quirk for Valve
 Galileo
To: Matthew Schwartz <mattschwartz@gwmail.gwu.edu>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Schoenick <johns@valvesoftware.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Kyle Gospodnetich <me@kylegospodneti.ch>, Hans de Goede
 <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Matthew Schwartz <mattschwartz@gwu.edu>
References: <20240627203057.127034-1-mattschwartz@gwu.edu>
 <20240627203057.127034-2-mattschwartz@gwu.edu>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20240627203057.127034-2-mattschwartz@gwu.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0080.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ff::12) To SN7PR12MB6839.namprd12.prod.outlook.com
 (2603:10b6:806:265::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB6839:EE_|DM4PR12MB7575:EE_
X-MS-Office365-Filtering-Correlation-Id: ae30e845-3d6e-4cbe-1590-08dc96f014fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MlJBaDhQTVp1bDJBWFF0N1R6YjQxOFI3cjg1TWVSK3A5K3g4c2dQOFVqU3dr?=
 =?utf-8?B?QWkwbTArYnlINHZ4OXY1MkJlbitETk1LTUxmQmNYSzFocEp0Nmt4QjFqTWd5?=
 =?utf-8?B?eE0wbEdDUzl6WEU1V0U1Wi9KV3dtbDFKSml4dVhrbkxKa0tHVTUzL2ovMUsz?=
 =?utf-8?B?alEyY3l5Nmk4UElidnNDdXV3N3hMZFVCR3hFd3hTNWdxVnkvc3lNUk9JUDlx?=
 =?utf-8?B?V2tWWWtUeFVKWUZFTTlUYm1Oc1F0aVBqOU94aHp3aklza1VpV25rUUFMekRG?=
 =?utf-8?B?VDdGTEVpOEhhQjk3MUZsczJyWHFYYnBJQXJ1REFpblc4R1d4ZmQ2N3lDU3dk?=
 =?utf-8?B?VkpINEhacGRXMDdpeThLVGU2Y1BWUjNZVmlqZC9TaVlRSmpLU01GV05mdFUw?=
 =?utf-8?B?dHpGMEMzdzNpRC80ZXl5aG12eU02NTZrRUpXVkI5YkZjWVFWQ0xGQ25LL1lo?=
 =?utf-8?B?a09nUU1CK05oRXNKNmFuZEZnZDZPTkM4UjFKT3c1cXNLT1Y5cy9JSCtoZlM2?=
 =?utf-8?B?eEpINXpBS3RzME0vQUhNVDZnbk9rSllFS2IyaXBiZll6TE1iZDNmdUFrdURi?=
 =?utf-8?B?RkRtaEhSMjJTV0M4R3pORVFCQlNWUlp3RGkwWUtQSnc2dWlqSjV1eXlEWmQ0?=
 =?utf-8?B?SEkwRVJIUllBaDBYL0FYcGdTSnRZQitGNUtBT1dsaG0zMWtzRmZoNkpqY1FS?=
 =?utf-8?B?ODFyYXgvZ2dmdFoyOS95czJpR2xscmJTY21Xcy9VN0JkSm5Sc0RsL3JGSHhl?=
 =?utf-8?B?dTB3ZFBTWkw3SFBFSE15eWtkSG9SRUt4cmhLbVlwZUhWYXZXQnJRUDM0MVdW?=
 =?utf-8?B?dkJGV3NGb1NkOGpsT0xOc01YZjNKcmgrVXRCL29Ib1U3T0NRalNXaWVwYUNB?=
 =?utf-8?B?V1BJNWRsQ0gyMmZpaFhmdm5ISG4yVkF5d0hYY3dJT1hSSUsvMXJVUzlTU0hl?=
 =?utf-8?B?ZHNpbUxLVDFnUEp5UjQyQ241VHhzT1YwNUlaeFh2NjFvRnZRa2lQUFc2Wmgy?=
 =?utf-8?B?dUxGTXduR2xmMHEzcmJWd25TRGx4c2FyZ0NYU2lHL1BYcE9neWdHMkkwNjk3?=
 =?utf-8?B?OFhQcUVMcUhCc3U4Yk42VkZmVzNsVlVXZlZwRk5neVRlTUxTZGxOK0cycHFP?=
 =?utf-8?B?NE9ac2hIYzlIME0zdG90SGRBaXRhYzE1VElsZ0pqVURPaitQbmxaZW9IcTV2?=
 =?utf-8?B?MFp4ckordFY0dEpNVzZsb1JrVFlDSzlQS2lXRzBMazV1UzQ0TTkxeXVkYWtF?=
 =?utf-8?B?cytOTlBsODN1cDhwbTB0QlpqRXE3OUd5dXVKajk0Sk41MXRRMGFZR0dDYlVC?=
 =?utf-8?B?dk5lWXF0N0xHWkdoMkxuVVRHODRWckpnNCtZK3I4TnRXTk1OblVzV0h5eDJI?=
 =?utf-8?B?MXRaS3graHV2d1pvODVpWjIyMWV4YTlXdHhMVVk2QVhibnVKblpUallRZmVX?=
 =?utf-8?B?eWVYQlYydlR3MUJVR2cwcDhEWXVUNlBURnM0RHNibnpaNis4RXJYb0pWa1lZ?=
 =?utf-8?B?TnlIZElXQ0xyd05NMWJFb0QwaCtBRWpXdkkyTFBhOUFNVkY4YzJEcGJTajNH?=
 =?utf-8?B?T3dyZnBoKzhYWGFLaS9SVjRjZm5qbTBvNkI3NEVPOThvOUtkS1hmS3lleWE5?=
 =?utf-8?B?My9wNDc5Zjc2eXkxYnUrdEVxK09tZWtUMHowSlVIU0tpN3hDK2RBTWVtRVEx?=
 =?utf-8?B?bDZISlZWMGZFNzMzL2ZVRlZlck1KUkJkMEZneWlJRlI4VG0wR010K2dXMjFo?=
 =?utf-8?B?dlBzMWpvU3VDZkJ3dHphZkdaNnZBcUNWaGpiZ2JJemlWUXoyVVZhLytISlBK?=
 =?utf-8?Q?BmO2Abl5xlbTv1vkZ7PhyVfBckCWXliceD5HA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB6839.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWdTYjVZQWcwcEo5UktwazJXYzRxVlhPYVhHR3hqRmpUN1hpTzRnN0VNTXN5?=
 =?utf-8?B?cWorQmIvTThSbGZXbGMrcDJWNDAvSklZcWRtVXp5b01rTWU0Q3k0Um5EbWtu?=
 =?utf-8?B?U0lxU3h4MVZjYXdXb3JHZG1hdkU4cjdNSG0xY09PVXdUNVBjSVplT2gxNFhU?=
 =?utf-8?B?U3NFM3A2SEJONEhnMGxUWGc5NGZ6QitYeWRUWjVOK09WbHN3ODlSWS9PdGV6?=
 =?utf-8?B?bE80OW1nRENHbyt4WDFMek44M1JXbUxEWU9FUG1vRFgyck1nY2EzNENyaVZ2?=
 =?utf-8?B?Yjd6M1BOaXk4cWRXWEdpWHRUZ2krTU5nb0pIVExHNzU0ZXgvaXRuVDNUT2lS?=
 =?utf-8?B?MjEyWUtQRlBSQmgzTFdFaitFRGpDRkUyWHNOSThIN0xZT0JwMStYQTV5UXUv?=
 =?utf-8?B?L0FxZ0xLU3BscTRFUHU2aDlONzBrQW5aUys5Z2hGeDZnM0UvcjlMb1lYVURv?=
 =?utf-8?B?OCs2S1pVN3pEWW1QZnc1RVFleURsK0cwU21XM0JqUTROVXp1ams1UW5uNFBP?=
 =?utf-8?B?WmRyLzR4WVVqbWFJTDQ1cWZJMEVHRFJrWmgwTGhOL1RIeFNvOFA1dmJpSSt3?=
 =?utf-8?B?bnd6WlhPMmhicTQ1VVo1c1hjRW51ZUVjQTlhdUwyT0dxN3JIbjF0eFZVWmYx?=
 =?utf-8?B?WjRQOExnV0FPWHV5ay93d1BsQlVMMHhhTmFhSFVUcVdUUWtUS095bTlLS3dH?=
 =?utf-8?B?Y3ZYL2QvZ0NBV2ZCR0k2SldxS0k1Q2lUYk9xMlJvT1htUW4rNDdLczVRVFhr?=
 =?utf-8?B?d0FBdWNIYjQ4WU4rNmdVQmhHN1IzRVk2b1RlV0xKYWkzT0lhelluZjYxZ1Zx?=
 =?utf-8?B?enZKa1FHdWZHeDlseFBwaTUyYjgrQW5HN2xYT2Zhck5ZSzBpejVGWUYzbEdo?=
 =?utf-8?B?V1dwQ1RRa0UyQlowL2M4dXJ1TEx3QWtQN1ZpVTJ0V1lVR1ZsU2VhaG94b3Uv?=
 =?utf-8?B?bElSNCtxQ1hZeC9zZURIcGxXTkxaeTdISnlaeW1rbzBtRFJyVXpGZ1RyanVF?=
 =?utf-8?B?elBHelBzaDZMTmI3N3BldjRtMTQ0bXZEVjh1c2JJZldiaFpBRXFGTnNBQ3Ir?=
 =?utf-8?B?eWhHUkRaVUxRYVNpMWsyVGpTbnJuWnJiUDRQdzNDdU1aaFgwSENiT0NLaXFF?=
 =?utf-8?B?K2JEWDF0RFZBbE1FZCtpbFZ5c2p1bTVIZVZ0REFVVGJPM3hSYm5aNUg1VWcv?=
 =?utf-8?B?NTVlZkhXcXVaYTJaWW9kcEQyazRualhUWk9yZ1pXTHNhMGJsZFdVeFJjemQz?=
 =?utf-8?B?YlFEMWtsZkYwTUtLS2VtOGYzMDFabkdmeGIvWmRDVUZpbUUxY2thVkdhRlgz?=
 =?utf-8?B?N216NXRyQWJNVzNmdTNGYWlPSDFkWE5DeTNkMEh3MmJQYWdiUUwxaFBjcHc2?=
 =?utf-8?B?OFV4blZjckdxcDJXQTZvNVRCb295ZGVaWFJybmUrdGRNdVpIU21FUi93R3A4?=
 =?utf-8?B?SEpreWw0SWw5L0JWbmZmM0d0N3lIc2t6a2ZtY016R0VHd2U1U0FJM21NNXFl?=
 =?utf-8?B?a2lRQXR2cFRTZWJIYVJGSjBFOVBSVFFISGFZYnlteitiYkxrSEE1cUVaaFF3?=
 =?utf-8?B?QW12ODloRjJKeVNEMlZGUFE5eVNSUDVvcHVNRDhOWGdkdktPME5MT05vNE1Z?=
 =?utf-8?B?ZDhzV3ZUaVNuMkp2M2FCem1GTWFYanJFQitRbUN6U2FNVUh4cEliMGlqYmVj?=
 =?utf-8?B?L1dzc2lzcUZjcDdOaVVrdHVaUHR2eXowcUhzNW1xUGVrNFRnTTh2UjRvNVVm?=
 =?utf-8?B?VmdSSWhUQmhXS0t2OTFiUVFVVE53Q1NRM0ZiWlg0Ri8relJtblZTNzIrVUxK?=
 =?utf-8?B?TDNxYUhRREZsL3ZQMDFQWVVIQXVDSkZ3MFhiVkdhTlhMLzRseWtIUU1PMGFp?=
 =?utf-8?B?am9weVFxVmJhcnByZ2N5cTdPTjRtbFBzK3FNeDAxUzBlQ2xRRmk3aXdRR1Bn?=
 =?utf-8?B?OEhQcWx3MmVNTWhPNDdTVm9YV0NRc0VNMmxCb0NIV0FHMGJXM2w1YU4zaEFo?=
 =?utf-8?B?c3A3Q3p4aTBVdkRMWkZSUWZRZ3NZTkFFeklMZWxORkc2M254WnlTb3BLSGNT?=
 =?utf-8?B?TXhYck1SVit6WDBwQWdZZHNpRmVKUjdUZkJqMlRMcXBRK1ZyUFJseWcrNnBG?=
 =?utf-8?Q?qMszzwXRkYCqUR+xi/AkqosL+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae30e845-3d6e-4cbe-1590-08dc96f014fb
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB6839.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 21:28:26.9752 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6VT8I7q8WvjJ+QkRHH3gNvACp3krOKVGsFNLbxZ2KY0sXT0bpAnD7jtmQMuRviboutyWVvMbSg9kZbSz0/zuPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7575
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

On 6/27/24 16:30, Matthew Schwartz wrote:
> From: John Schoenick <johns@valvesoftware.com>

Since this patch is from John, you would need his S-o-b in here as well
(assuming you have his permission to add it).

> 
> Valve's Steam Deck Galileo revision has a 800x1280 OLED panel
> 
> Suggested-by: John Schoenick <johns@valvesoftware.com>
> Link: https://gitlab.com/evlaV/linux-integration/-/commit/d2522d8bf88b35a8cf6978afbbd55c80d2d53f4f
> Signed-off-by: Matthew Schwartz <mattschwartz@gwu.edu>
> ---
>   drivers/gpu/drm/drm_panel_orientation_quirks.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> index 3d127127e7cb..ac8319d38e37 100644
> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> @@ -427,6 +427,13 @@ static const struct dmi_system_id orientation_data[] = {
>   		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "1"),
>   		},
>   		.driver_data = (void *)&lcd800x1280_rightside_up,
> +	}, {	/* Valve Steam Deck */
> +		.matches = {
> +		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Valve"),
> +		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Galileo"),
> +		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "1"),
> +		},
> +		.driver_data = (void *)&lcd800x1280_rightside_up,
>   	}, {	/* VIOS LTH17 */
>   		.matches = {
>   		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "VIOS"),
-- 
Hamza

