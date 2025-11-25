Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AC7C84F17
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 13:20:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F3FA10E1DB;
	Tue, 25 Nov 2025 12:20:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="hlxiaTCq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011039.outbound.protection.outlook.com [40.107.208.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5466410E1DB
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 12:20:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ejhViaj0uwhdqspmeuDmA3FF+PjKasxKhfIQZGqPaaRN+5pAKakWm3I6ugBL4WnrxXH9CVd309w0olaTVT4gITsR/+xHrVXMRG8CW+HOWLDzUeYjM3bzcWsPD+GpTfMYhZ3WHLWhGmh+CqKLlTbQFX4y3xJL1NzWH0Ant/OU8Qo1e/8juka8Nb92KbdoWL5lRiTQIhT6JEsDpRV3WZzq3/23AR2DzBa1ZI386XBbqFnShq08qyu3+wWn1sq+oT2F9sdzRYzanLj/n4rwHnya5zN0I2iaV+WxEuOEDVmD6osR9l5ELutjWNYrLzy1pDDNTPD4bIQUpKDY+yGW7Mxc1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aMR3WLKCR+f8vHGUd+qdwJ4I/l/w8mO/i/9awQF918A=;
 b=YZAdaJ/CO47ACR00NnDUSxRq0+isNGZRhpIvxlwoLgDSIXLiKNyyBGEbyb1auNSIg++DN1FtP5meHj+ZsW45qdesP3GPUArnN3STZh7Gi4FINE9wnNy8fX0rzDoNPEcKGAuuddh3I+MjzIdVqS7rM8MeV4JBi+bRjqVd8Nyn+GqFTXjjIfo8nCD+0Uen8eB4Yl5kL9Nm8UkPBSI3BVpIybZ2CShpIzKXOC3GoZezeuSpwiHY83IZoxsEBteUywqmaxYjwDv4pN5NYyZK1c+1OynYdCLovOfaP2gjnF+Wp0IpIbP6PxrJv9eTQlP+AqdMz3Mbq3pKk7Dt8LNalheXwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=cadence.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aMR3WLKCR+f8vHGUd+qdwJ4I/l/w8mO/i/9awQF918A=;
 b=hlxiaTCqsXEOjfWqzWnu32DO3waUtSb8NDdOitPMXOE6Q6+jQplg1N38BiQ9pJMK9WiDlHHi9iJdvEK69es0U+bHplJxe90DJbXPkK66sX7ye8cXGlDED1r6t8x/XpZWBjeb+F7j3D4vrabmajm+/hN2H0oBxZRoyK6GN7sPTXk=
Received: from BLAPR03CA0135.namprd03.prod.outlook.com (2603:10b6:208:32e::20)
 by MW6PR10MB7591.namprd10.prod.outlook.com (2603:10b6:303:249::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 12:20:10 +0000
Received: from BL6PEPF0001AB53.namprd02.prod.outlook.com
 (2603:10b6:208:32e:cafe::8d) by BLAPR03CA0135.outlook.office365.com
 (2603:10b6:208:32e::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.14 via Frontend Transport; Tue,
 25 Nov 2025 12:20:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF0001AB53.mail.protection.outlook.com (10.167.241.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Tue, 25 Nov 2025 12:20:08 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 25 Nov
 2025 06:20:02 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 25 Nov
 2025 06:20:02 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 25 Nov 2025 06:20:02 -0600
Received: from [172.24.235.208] (hkshenoy.dhcp.ti.com [172.24.235.208])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5APCJt0P3649594;
 Tue, 25 Nov 2025 06:19:56 -0600
Message-ID: <a93a7c0a-82f2-4dd9-bf70-40266d7f9b41@ti.com>
Date: Tue, 25 Nov 2025 17:49:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: drm/bridge: Update reg-name and reg
 description list for cdns,mhdp8546 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <robh@kernel.org>, <Laurent.pinchart@ideasonboard.com>,
 <airlied@gmail.com>, <andrzej.hajda@intel.com>, <conor+dt@kernel.org>,
 <devarsht@ti.com>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <jernej.skrabec@gmail.com>,
 <jonas@kwiboo.se>, <krzk+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>, <s-jain1@ti.com>,
 <simona@ffwll.ch>, <sjakhade@cadence.com>, <tzimmermann@suse.de>,
 <u-kumar1@ti.com>, <yamonkar@cadence.com>, <pthombar@cadence.com>,
 <nm@ti.com>
References: <20251121123437.860390-1-h-shenoy@ti.com>
 <20251123-flying-sweet-raven-bf3571@kuoka>
 <7161aa97-7ee3-4468-a53e-8158075aa0a9@ti.com>
 <a9c78805-9b70-4e20-a3f5-36e5973fc272@kernel.org>
Content-Language: en-US
From: Harikrishna shenoy <h-shenoy@ti.com>
In-Reply-To: <a9c78805-9b70-4e20-a3f5-36e5973fc272@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB53:EE_|MW6PR10MB7591:EE_
X-MS-Office365-Filtering-Correlation-Id: 27a0be99-62a1-40bd-7420-08de2c1cf8f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|7416014|376014|1800799024|36860700013|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R2hpeHZCVFpzOVpXMU5SNzRqdjNMaVUvY0NyWVBITVZzVGV1aUowOU1wUGtB?=
 =?utf-8?B?TTAvVGJONUZxdE4wR285a2o1Y1drZlB3ZGJ2aFZLRzRiVGN5eklxSVRuZVYr?=
 =?utf-8?B?SjdzUnJMQ2czZDdRaVAxenVqRS83MURWQ2puZFlSVnpvVmVHZkFiaXRkbVBu?=
 =?utf-8?B?MmJEUi9DZjYvaVB3cU4ycEZYOGhHbmQ1TzlKTFdwdG1hNWFUd1FJK1V2VTR0?=
 =?utf-8?B?QTFCTVhLMnRJMjByS3ZhT0N4RU91MGFvcE9VaXRIN3diRjhiZjhod0RqOHlV?=
 =?utf-8?B?TWRmMTRwWktDd2l3N2wxalhZUW1COHlYYXZtWVVqam1YQmlSMWlKRHE0a2Fa?=
 =?utf-8?B?QTlPRWRDUEp0MFlzZ2RUTUMvSnpNOFVwWHRJbEhZRUd2UlZzbjFCZFFPVUtP?=
 =?utf-8?B?ZkFyNXRudy9KLzZVOVBoVHM4ZWpZLzJVeUp3SVBqL2xjbW15WDBkZ2lTUFAw?=
 =?utf-8?B?VEhvWnBKY3RaYnpsSDl2OTlZK1hsRjVsdnUzd1g5bnRhcGFhakQvUVp6UXBX?=
 =?utf-8?B?RVVuNXNuL29FZ2psVVBLNUxrdEVISzBWZDJyd2MzLytnY2pSbDFjcS9OVDFI?=
 =?utf-8?B?dmdyai82YTArM2ZNeGxkT3JSRERWbzc2NTNuTE1yWUtsL3V5cDVGTXg2Zy9v?=
 =?utf-8?B?cG5ONlR0MmxkWjV3ODlaTUYwdTRyMS9qQWMzcmdNa0tPaVlXbzBzOVNHSDJo?=
 =?utf-8?B?SnpraUhsME0zRkVTYjR6enlMbDJWTUpsNTRTcVY5MVBuMHErK2hEUEZESDZ1?=
 =?utf-8?B?ZXpnVHExUHE1SGZaRndGQ3BycGRzeTIyS0xaYVVxTXptcnVwMkNCUFV6UzVl?=
 =?utf-8?B?VXpFZzA1dncybWZpMjNOVGVGOXpScDR1SG1sNExzQTdsWnZUcHUxdnZ5RDU3?=
 =?utf-8?B?TFU5WlB6Vlk1OEZzRmU3T2xHYStlOTRyQ3o4TDhZd0Z1RXlHNmJZbjFrSG9Z?=
 =?utf-8?B?cVJoK3ZtRi9ZUDZRRk1NUjQwWXU2NXpma21IYy9vV2UrTmpzTFVLNVVDb1Vq?=
 =?utf-8?B?MWcwcXVHVEJlWHV5aXZoSDZQRHhISmJTT2djSVFOMk9Ka3Q5S2J2czkrUVhM?=
 =?utf-8?B?SXR4RVpYOVZYdUhwLzdkcWtWTTFMV3REeVozenU1QXovUmF6T0p5Y01hazlT?=
 =?utf-8?B?cmNtbmhsU2p0U0lEbHFZVkxZWi9MSTBZN24xRHBGK3ROaGZwUmJXT2lPc1FK?=
 =?utf-8?B?VDVVQ0loUTRWZ21QQ1VZWWk1bHZXejVRL2tTTzVRT05VSUJmWENwbk5xTUU1?=
 =?utf-8?B?ekRoL1h3ZFM0SVVyNFVFcytGM00xY05tWU5KOWt2azRYTEZoUnpkSHFwUE9E?=
 =?utf-8?B?T05YQTR0cHhvOWNOVDZYL1QxVUx1WFVMU3I1MUs2U3gvRzRMVDRwa2lyKzhV?=
 =?utf-8?B?RG5TeGs5RXdIUERVaTVtTEw1R2o5d0Rzakt3bGhMdzFEYnFWbHZwOS9SRkM3?=
 =?utf-8?B?YkF6RlVvSkZWUHFSZVp6eGZnSloyRTJ6ZWFhMEIwaUN0TzMyVXVMOEV4MEU0?=
 =?utf-8?B?NFc3ZjdRYTBVZFpoQ2NhQkhuQ3BDeFhHOXoyaTlrdTJ6MlhrREI0ZWt3L2ZC?=
 =?utf-8?B?MWE5MDZtckkrM1p4SzJPaDJWeWEvUXd0aEExT0w1aWZ1b2YzMXA3d1lZaUpn?=
 =?utf-8?B?YnkwbnZhSmN3Qi9mMjFORkpoVkhvOEpBUHROZXZwT2JIWllqTTJYMURNWEZM?=
 =?utf-8?B?b1E5NW5FYTRtR3J0RWN0bERMbWRUOUNzditnWnZLeFRJZGZwamtLOWorVmQ3?=
 =?utf-8?B?SThTMlRqaWJZTFFlU2M1OVcyVmtHVmxCaHFSS0Q4WC9ER1c2c0dyY210ZkNI?=
 =?utf-8?B?SzRFL0JQdWxOU2xRdlRKWTMyOEFLbTA0V1dwVmNsd3dWZld1SStWb3dJbjBl?=
 =?utf-8?B?THBjVmlCVzQ0Qm41S3pYaGVMMWVrNzAwWisvbmk1aG42akdDaGdXdVhWUERR?=
 =?utf-8?B?blI2NWZQcC9RV1NFcm43TTJaSnNFOEdPUk1ubmRrL0crV1Y2cVVISnFhZHVS?=
 =?utf-8?B?bXdPZE5RUVZnRjhjVmpOTG43ZmRpdGM3YzBiNFQ4OWc4ZWlBSks2bFoxWElr?=
 =?utf-8?B?RkIxYWZNTUtacExOZjZ5U0Q2cHRrSFRlRmdrOTZrV09iR05McjJxZGFBUjUv?=
 =?utf-8?Q?71ys=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet201.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 12:20:08.0237 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27a0be99-62a1-40bd-7420-08de2c1cf8f9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.195];
 Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB53.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR10MB7591
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



On 25/11/25 14:51, Krzysztof Kozlowski wrote:
> On 25/11/2025 06:26, Harikrishna shenoy wrote:
>>
>>
>> On 23/11/25 15:30, Krzysztof Kozlowski wrote:
>>> On Fri, Nov 21, 2025 at 06:04:37PM +0530, Harikrishna Shenoy wrote:
>>>> Remove j721e-intg register name from reg-name list for cdns,mhdp8546
>>>> compatible. The j721e-integ registers are specific to TI SoCs, so they
>>>> are not required for compatibles other than ti,j721e-mhdp8546.
>>>>
>>>> Update reg and reg-names top level constraints with lists according
>>>> to compatibles.
>>>>
>>>> Move the register name constraints and reg description list to the
>>>> appropriate compatibility sections to ensure the correct register
>>>> names are used with each compatible value also adding the DSC register
>>>> to make bindings align with what the hardware supports.
>>>>
>>>> Fixes: 7169d082e7e6 ("dt-bindings: drm/bridge: MHDP8546 bridge binding changes for HDCP")
>>>> Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
>>>> ---
>>>>
>>>> Links to some discussions pointing to need for a fixes patch:
>>>> https://lore.kernel.org/all/20250903220312.GA2903503-robh@kernel.org/
>>>> https://lore.kernel.org/all/d2367789-6b54-4fc2-bb7c-609c0fe084d3@ti.com/
>>>>
>>>> Link to v2:
>>>> <https://lore.kernel.org/all/20251119122447.514729-1-h-shenoy@ti.com/>
>>>>
>>>> Changelog v2 --> v3:
>>>> -Add the reg description list and reg-name list in top level constraints
>>>> using oneOf for either of compatible.
>>>> Logs after testing some cases: https://gist.github.com/h-shenoy/a422f7278859cd95447e674963caabd9
>>>>
>>>> Link to v1:
>>>> <https://lore.kernel.org/all/20251107131535.1841393-1-h-shenoy@ti.com/>
>>>>
>>>> Changelog v1 --> v2:
>>>> -Update the reg description list for each compatible and add register space
>>>> for dsc to make the bindings reflect what hardware supports although
>>>> the driver doesn't support dsc yet.
>>>>
>>>> Note: j721e-integ are not optional registers for ti-compatible.
>>>>
>>>>    .../display/bridge/cdns,mhdp8546.yaml         | 85 ++++++++++++++-----
>>>>    1 file changed, 66 insertions(+), 19 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
>>>> index c2b369456e4e2..632595ef32f63 100644
>>>> --- a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
>>>> +++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
>>>> @@ -17,23 +17,45 @@ properties:
>>>>          - ti,j721e-mhdp8546
>>>>    
>>>>      reg:
>>>> -    minItems: 1
>>>> -    items:
>>>> -      - description:
>>>> -          Register block of mhdptx apb registers up to PHY mapped area (AUX_CONFIG_P).
>>>> -          The AUX and PMA registers are not part of this range, they are instead
>>>> -          included in the associated PHY.
>>>> -      - description:
>>>> -          Register block for DSS_EDP0_INTG_CFG_VP registers in case of TI J7 SoCs.
>>>> -      - description:
>>>> -          Register block of mhdptx sapb registers.
>>>> +    oneOf:
>>>> +      - minItems: 2
>>>> +      - items:
>>>
>>> This is wrong syntax. You created here a list, so you now allow
>>> anything with minItems 2.
>> Hi Krzysztof,
>>
>> The list defined here restricts what lists are accepted, so for
> 
> No. It does not.
> 
> Look - you defined list of ONLY minItems:2, without anything else. The
> problem is that your oneOf consist of four separate cases and you wanted
> two cases, so only:
> oneOf:
>   - foo
>     whatever goes here
> 
>   - bar
>     further schema
> 
> Not four.

Got it, the minItems should be bound to the oneOF the 2 lists, will 
update that.
Thanks.
> 
>> cdns,mhdp8546 compatible anything more than 3 items is rejected
>> (example:
>> https://gist.github.com/h-shenoy/a422f7278859cd95447e674963caabd9).
>> Could you please help me with an
>> example where you think the bindings are incorrect?
>>
>>>
>>>> +          - description:
>>>> +              Register block of mhdptx apb registers up to PHY mapped area (AUX_CONFIG_P).
>>>> +              The AUX and PMA registers are not part of this range, they are instead
>>>> +              included in the associated PHY.
>>>> +          - description:
>>>> +              Register block for DSS_EDP0_INTG_CFG_VP registers in case of TI J7 SoCs.
>>>> +          - description:
>>>> +              Register block of mhdptx sapb registers.
>>>> +          - description:
>>>> +              Register block for mhdptx DSC encoder registers.
>>>> +
>>>> +      - minItems: 1
>>>
>>> Actually anything with minItems 1... I asked for list of TWO, not FOUR,
>>> items. Or if syntax is getting to complicated, just min and maxItems.
>>>
>>>
>>>> +      - items:
>>>> +          - description:
>>>> +              Register block of mhdptx apb registers up to PHY mapped area (AUX_CONFIG_P).
>>>> +              The AUX and PMA registers are not part of this range, they are instead
>>>> +              included in the associated PHY.
>>>> +          - description:
>>>> +              Register block of mhdptx sapb registers.
>>>> +          - description:
>>>> +              Register block for mhdptx DSC encoder registers.
>>>>    
>>>>      reg-names:
>>>> -    minItems: 1
>>>> -    items:
>>>> -      - const: mhdptx
>>>> -      - const: j721e-intg
>>>> -      - const: mhdptx-sapb
>>>> +    oneOf:
>>>> +      - minItems: 2
>>>> +      - items:
>>>
>>> Also wrong.
>>>
>>>> +          - const: mhdptx
>>>> +          - const: j721e-intg
>>>> +          - const: mhdptx-sapb
>>>> +          - const: dsc
>>>> +
>>>> +      - minItems: 1
>>>> +      - items:
>>>> +          - const: mhdptx
>>>> +          - const: mhdptx-sapb
>>>> +          - const: dsc
>>>>    
>>>>      clocks:
>>>>        maxItems: 1
>>>> @@ -100,18 +122,43 @@ allOf:
>>>>          properties:
>>>>            reg:
>>>>              minItems: 2
>>>> -          maxItems: 3
>>>
>>> Your commit msg says you "remove" but here you ADD one more item, thus
>>> growing this 3->4.
>>>
>>> How remove can result in 3 becoming 4?
>>>
>> Yes, remove is for j721e-intg for cdns,mhdp8546 compatible, and to make
>> bindings complete have added dsc reg-blocks, these changes reflects
>> correct capabilities of hardware, have mentioned these in commit message
>> as well.
> 
> 
> Again, how a "remove" can result in growing?
> 
I am removing the j721e-intg register from non ti compatible that is 
being done via the oneOf and conditionals, the adding part here comes 
from adding the DSC registers space which the hardware supports but 
bindings don't show yet.

Thanks
> 
> Best regards,
> Krzysztof

