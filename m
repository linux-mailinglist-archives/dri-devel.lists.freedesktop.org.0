Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE086D2C2C7
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 06:51:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A658C10E073;
	Fri, 16 Jan 2026 05:51:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="hgyHZsGv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazhn15013037.outbound.protection.outlook.com
 [52.102.140.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 913C310E073
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 05:51:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v3DmTv4RsYtAdFA3Eq/qt3F9pGAaqLV3GWIUvixl5Li8OGXFrZRYZ948Nal33qqDl6o4iRfOY7PMxGIN8/X1ogCJbtRWAYMjqHvUECcL/ek3ap2qJ2xWL0nL/xSzFba9PkXj44g4lPGuV30QcsFXsRUJzv1cEPlnlOJFXaEtRiOoZZsrgPVUtGDEvGxor7hFhFawXTvNoK3JYykTn2MnQOwSjZRnZ9x6AjE+c+l2E5e9QKf39+VKKzOsWtYBI3y7poaQ6mZD2qn3YSqYK0HtL5SYoDA6CP+Q82WqHgakeWcRfjKDsQmdY4FSad2lF4HURErt/GOrAJIfu8iPu2ZNqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1E3xIWZlyWL+pSKZPVJ9ojwZi+qJ466KRev6F0BQFbQ=;
 b=ihlYa/5qCgzxXJx7br4gEdUb+j9wu9jpsohKAcadZr5EDbe0vqL83FEmn3phsX2JsAdaG8t4RSZ5z52Jdz1Noal8UvQCofMhfJyKfRMhwLHOpwaseZ3Sah3nDw4+7LJAyyJiEFTDjZmq0ML0lqaECrztNRQ8AsFmRYs/EH0dG/UnRyMdPp1MZBdKFa9RdGcnod3uyI4oXOaBQsU5Gq6MGSazNqXCFtcanGKQ9Wy0y2E0ilKIyYCz8u1H0FawpspOIE7ndB+MYhdZHYFFY7BAdmI7369zmndpj5NehzMca92rytVZNkuTRtVXENakIiSKedQvQ6echxZ1hVz39/6EGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1E3xIWZlyWL+pSKZPVJ9ojwZi+qJ466KRev6F0BQFbQ=;
 b=hgyHZsGv14qPwnptrNZhrca8MJTG8wvxjsIdF5rxkBaRvRkZeqXgdQrfaAaqu1Q+tUrqJ69QSCUSc6KE5leNzh+bXXShUypyM2Ye4XHkxSJ8Qm9N3wIxxyic8suRwvAGzLb1Sd/7tHEUvuKIJvc5kZ3NHe5JWBYv10KaDa0Jht8=
Received: from BY5PR13CA0004.namprd13.prod.outlook.com (2603:10b6:a03:180::17)
 by SJ2PR10MB7705.namprd10.prod.outlook.com (2603:10b6:a03:57b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 05:51:44 +0000
Received: from SJ5PEPF00000203.namprd05.prod.outlook.com
 (2603:10b6:a03:180:cafe::75) by BY5PR13CA0004.outlook.office365.com
 (2603:10b6:a03:180::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.4 via Frontend Transport; Fri,
 16 Jan 2026 05:51:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ5PEPF00000203.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 05:51:43 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 15 Jan
 2026 23:51:29 -0600
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 15 Jan
 2026 23:51:29 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 15 Jan 2026 23:51:29 -0600
Received: from [172.24.233.20] (a0512632.dhcp.ti.com [172.24.233.20])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60G5pNT02775153;
 Thu, 15 Jan 2026 23:51:24 -0600
Message-ID: <6a9dd391-7f0b-4702-96bf-b8e852ccce39@ti.com>
Date: Fri, 16 Jan 2026 11:21:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: display: ti, am65x-dss: Add AM62L DSS support
To: Rob Herring <robh@kernel.org>
CC: <jyri.sarha@iki.fi>, <tomi.valkeinen@ideasonboard.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <devarsht@ti.com>, <praneeth@ti.com>, <bb@ti.com>,
 <vigneshr@ti.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20251224133150.2266524-1-s-jain1@ti.com>
 <20251230022741.GA3217586-robh@kernel.org>
 <fd9f0b37-001e-4721-82b7-ee29379eb9a9@ti.com>
 <CAL_JsqKYsf9dmY3qKx6MVT0-0emTzO=0z32rOzt3070LykhrPA@mail.gmail.com>
Content-Language: en-US
From: Swamil Jain <s-jain1@ti.com>
In-Reply-To: <CAL_JsqKYsf9dmY3qKx6MVT0-0emTzO=0z32rOzt3070LykhrPA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000203:EE_|SJ2PR10MB7705:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f16bd34-ea7f-4eda-5c12-08de54c353aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|7416014|376014|34020700016|36860700013|12100799066;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q1h4aVhoMmdhaWtmMGRvWHhWMkszSUx1bE9HYlZzRFBUK1dMenJvWkljbEJp?=
 =?utf-8?B?ZmhkWVBqckFWK2x0N0ZaTmR0T3hMZVM1dytyV1B3MTVOWkVacVVNNXRIWVYw?=
 =?utf-8?B?UElWaXEweVd1ZVhMaHhMV09OamJmSDI1VlNWSVluR1BDRUd4dWg4SHdlK2Zp?=
 =?utf-8?B?L0JsdkhhTzVBUTJoT1ZCeDl6RWNpSWw1cWxtMXd0TmRPUFRXZHZSVnN2ZVVn?=
 =?utf-8?B?Yy9Wb0JBakZJWUYrRzVzU3M3aWdDRm13T09kbzR5Z0ViemJoSVZITWNRLzZM?=
 =?utf-8?B?QUlsanBDZmhvdmxZaVVhdzRIdS9zSlhqYytKUU5xT2RkeE5rS3Jrd1lraVJ3?=
 =?utf-8?B?WnU4YkJ2VUozOWs5NVdjQ0F5cHROWnVScThBNzdoOUx4bFlEZUxYKzgxNk1L?=
 =?utf-8?B?Vi9tNzY0bHB2WS9WeUYzalIvYXBDZ1A3YkNYUmplMEUreGtBNVpwaEJjd25u?=
 =?utf-8?B?Qm5VRlpmc0pKUFR1OHVHVXVOTlVJRnhDQjZxMC9NKzQ2ZlFZUUNHZUJZMzNs?=
 =?utf-8?B?d01UYmNKc0ZQL1VheHI1TUVEdE5VSUkyaVdMd1B4cTlpelJvanhuTnJkY0RM?=
 =?utf-8?B?MHhMTVZqOS9mM1hUODV3Wkp3WS9nUG9OOGhiUU1ya2MzNUdLOEVaSTVvRk9h?=
 =?utf-8?B?YmJYUXZabG44blJDY2hVak9nVldmK1N5YzB0bjg1eHFoeDF5UHJnS2NPbkp4?=
 =?utf-8?B?b3ZaOVRrdXM4a25lOGVJRDVxN1lZY2tCaTVGSzhiV3FlOFVnbjZ3ZHBaMzVU?=
 =?utf-8?B?dHlpT0tUZHdOaEVtNUl3MjBSSFY1cFBoSFFQaGZ3MXhwcDl4VS8ySmFKMk9Z?=
 =?utf-8?B?ZXloNCs5TytMZVR5dGwrYTJTZVVxWmlvbjBvdlZKRDNSNVdEYTM4c2pJS3Jt?=
 =?utf-8?B?ck5rMFkwV1prQnRuSWdCTzg5SDU0blJsQkZnNFJvRWtBUlVQN2Z2Z2Y1UnBU?=
 =?utf-8?B?TnRVZ1l4bWtvNWtmN3k1TDNIUnBnT0R3bUdCNkhUZ2FRY2xOL2xiSGdoVDlr?=
 =?utf-8?B?L0FFaTM5ejRMTWlWUUVGeDNuVkRnZ0NaZGZrMTZNRzloMG9jT2IvNzRRMUpI?=
 =?utf-8?B?UHEremVsek9vRUxjSzJDcnhWZmZ2Y3NGblJ5Z014VEVLb0k5WTdaR0hiNmxC?=
 =?utf-8?B?aURROEdkekFvZ2xsNkR6bTdldDByamprQ1E0S0VSM0VKQ05oNEluTkhKbll1?=
 =?utf-8?B?U0lXWitWODFWdmVrS2lEYlBpd0V6S0x1TzdOa1V2UEVhMjNKREJ4RTlRRk91?=
 =?utf-8?B?dXRYMjZoRk0wSEYvcGd5dkVqcC9GK2JtcmFXajcyVzFtSGVCdmsvKzk1Ylp2?=
 =?utf-8?B?L01XZE5zRzgvSzRnbDVUeU1pNnNDcnNmME9BQitRVmEyWmJ2VFhQK1UyTkl2?=
 =?utf-8?B?Z2pzYXRwdzVUQU84R1NCVDJVaTdwOUFTQ0hjdkFSazdiUzdSOGxPYk5jMW8v?=
 =?utf-8?B?VUdLSlg3N21ud2c0RStVeEhIYXpnUWZDM0RFRDA1TERueGhZQVRGc1pJNHdy?=
 =?utf-8?B?b3djYUNJN2hQUXY4azlpL3VhYitxNkZuT2pLdk1Tc3R5UU5sNUVlQUwvZFFR?=
 =?utf-8?B?ZDVmMHNBOE51a1MyRFhhQnVEVlVxMFg2Sk9pZHdaUEJkVTRTZjdGS1dKYXhK?=
 =?utf-8?B?azdjb3Y3Q1I2NWw1V3F5SExGL1BTeHdpeU5WeGs4Q0xzNklVblBsOGpYSjhk?=
 =?utf-8?B?YXd2UkVrTUZZQm9WcGJaR0s1NUJpVXMrdFltOVRqaEJRWU52RU9ocWdBQ2dR?=
 =?utf-8?B?dmpWL2h1a0JlQTlvcTNQWUlQVnhOczAveC9rMmV3bmdJRlVheFpyMktIQ3Aw?=
 =?utf-8?B?SXZEOXFHcnRKT0VEV3VJNEtpRWhvbE5EZjBrcHB0K0VKNy91Ri9EVE5WQTlk?=
 =?utf-8?B?dTQyOTJZK3F5MEtTSkxWcGVvZHZDU0ErVk5kbVdlOTd6b09OeWhDa3JycVd1?=
 =?utf-8?B?eHlacDJLVlpya3EvSWV6RTlvMTdISmVDZkQ1RXZYMWptVUpEdStjdXdkbWx3?=
 =?utf-8?B?c1JCZ3VzNEJsV3IxR2pjNzNYdlRkNkZkMmpPYTc3bjZVZFF5SEYyTkJUSDZO?=
 =?utf-8?B?dlZQcW5Ta3B2Yzl5WW9Zd1hxWGpnYlFldVpqb2tMWGlkNDRmR2QxZVk1d3Qz?=
 =?utf-8?B?Y1haZE53cWw4MWZJRUFuN2tVT3EwekVVKzFaOE96STNDMUtxQm1wczlyMHFY?=
 =?utf-8?B?RVpnbUR2RU55TWRZNGE5YktlRmNmMng3ZG9lNkFyZCtZbWx4TkhTRnNlWlE1?=
 =?utf-8?B?dVlKdVJtekpJUkg5RTliSndscC9BPT0=?=
X-Forefront-Antispam-Report: CIP:198.47.21.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet201.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(34020700016)(36860700013)(12100799066);
 DIR:OUT; SFP:1501; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 05:51:43.0934 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f16bd34-ea7f-4eda-5c12-08de54c353aa
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.195];
 Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF00000203.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7705
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

Hi Rob,

On 1/3/26 04:04, Rob Herring wrote:
> On Tue, Dec 30, 2025 at 8:23 AM Swamil Jain <s-jain1@ti.com> wrote:
>>
>> Hi Rob,
>>
>> On 12/30/25 07:57, Rob Herring wrote:
>>> On Wed, Dec 24, 2025 at 07:01:50PM +0530, Swamil Jain wrote:
>>>> Update the AM65x DSS bindings to support AM62L which has a single video
>>>> port. Add conditional constraints for AM62L.
>>>>
>>>> Signed-off-by: Swamil Jain <s-jain1@ti.com>
>>>> ---
>>>>    .../bindings/display/ti/ti,am65x-dss.yaml     | 95 +++++++++++++++----
>>>>    1 file changed, 76 insertions(+), 19 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
>>>> index 38fcee91211e..ce39690df4e5 100644
>>>> --- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
>>>> +++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
>>>> @@ -36,34 +36,50 @@ properties:
>>>>      reg:
>>>>        description:
>>>>          Addresses to each DSS memory region described in the SoC's TRM.
>>>> -    items:
>>>> -      - description: common DSS register area
>>>> -      - description: VIDL1 light video plane
>>>> -      - description: VID video plane
>>>> -      - description: OVR1 overlay manager for vp1
>>>> -      - description: OVR2 overlay manager for vp2
>>>> -      - description: VP1 video port 1
>>>> -      - description: VP2 video port 2
>>>> -      - description: common1 DSS register area
>>>> +    oneOf:
>>>> +      - items:
>>>> +          - description: common DSS register area
>>>> +          - description: VIDL1 light video plane
>>>> +          - description: VID video plane
>>>> +          - description: OVR1 overlay manager for vp1
>>>> +          - description: OVR2 overlay manager for vp2
>>>> +          - description: VP1 video port 1
>>>> +          - description: VP2 video port 2
>>>> +          - description: common1 DSS register area
>>>> +      - items:
>>>> +          - description: common DSS register area
>>>> +          - description: VIDL1 light video plane
>>>> +          - description: OVR1 overlay manager for vp1
>>>> +          - description: VP1 video port 1
>>>> +          - description: common1 DSS register area
>>>>
>>>>      reg-names:
>>>> -    items:
>>>> -      - const: common
>>>> -      - const: vidl1
>>>> -      - const: vid
>>>> -      - const: ovr1
>>>> -      - const: ovr2
>>>> -      - const: vp1
>>>> -      - const: vp2
>>>> -      - const: common1
>>>> +    oneOf:
>>>> +      - items:
>>>> +          - const: common
>>>> +          - const: vidl1
>>>> +          - const: vid
>>>> +          - const: ovr1
>>>> +          - const: ovr2
>>>> +          - const: vp1
>>>> +          - const: vp2
>>>> +          - const: common1
>>>> +      - items:
>>>> +          - const: common
>>>> +          - const: vidl1
>>>> +          - const: ovr1
>>>> +          - const: vp1
>>>> +          - const: common1
>>>>
>>>>      clocks:
>>>> +    minItems: 2
>>>>        items:
>>>>          - description: fck DSS functional clock
>>>>          - description: vp1 Video Port 1 pixel clock
>>>>          - description: vp2 Video Port 2 pixel clock
>>>>
>>>>      clock-names:
>>>> +    minItems: 2
>>>>        items:
>>>>          - const: fck
>>>>          - const: vp1
>>>> @@ -84,7 +100,8 @@ properties:
>>>>        maxItems: 1
>>>>        description: phandle to the associated power domain
>>>>
>>>> -  dma-coherent: true
>>>> +  dma-coherent:
>>>> +    type: boolean
>>>>
>>>>      ports:
>>>>        $ref: /schemas/graph.yaml#/properties/ports
>>>> @@ -195,6 +212,46 @@ allOf:
>>>>                port@0:
>>>>                  properties:
>>>>                    endpoint@1: false
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            const: ti,am62l-dss
>>>> +    then:
>>>> +      properties:
>>>> +        clock-names:
>>>> +          maxItems: 2
>>>> +        clocks:
>>>> +          maxItems: 2
>>>> +        reg:
>>>> +          maxItems: 5
>>>
>>>              reg-names:
>>>                minItems: 8
>>>          else:
>>>            properties:
>>>              reg:
>>>                minItems: 8
>>>              reg-names:
>>>                minItems: 8
>>>
>>> clocks needs similar constraints...
>>
>> Sure, will add in v2.
>>
>>>
>>>> +
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            const: ti,am62l-dss
>>>> +    then:
>>>> +      properties:
>>>> +        reg-names:
>>>> +          items:
>>>> +            - const: common
>>>> +            - const: vidl1
>>>> +            - const: ovr1
>>>> +            - const: vp1
>>>> +            - const: common1
>>>> +    else:
>>>> +      properties:
>>>> +        reg-names:
>>>> +          items:
>>>> +            - const: common
>>>> +            - const: vidl1
>>>> +            - const: vid
>>>> +            - const: ovr1
>>>> +            - const: ovr2
>>>> +            - const: vp1
>>>> +            - const: vp2
>>>> +            - const: common1
>>>
>>> Why are you defining the names twice?
>>>
>>
>> For AM62L we don't have "vid", "ovr2" and "vp2", the dtbs_check will fail.
>> Could you please suggest a better way?
> 
> You already defined them at the top level. Here in the if/then schema,
> all you need is 'maxItems: 5' and 'minItems: 8'. But then you already
> have that as well.

Is this fine or needs some changes?

Regards,
Swamil.

> 
> Rob

