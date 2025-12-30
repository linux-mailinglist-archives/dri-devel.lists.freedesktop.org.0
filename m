Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B60FCE9EC9
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 15:23:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C6D310E906;
	Tue, 30 Dec 2025 14:23:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="eVa8PVce";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013016.outbound.protection.outlook.com
 [40.93.196.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E07D10E903
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 14:23:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UztlOLjDIspvLGP1/yc68E0IVA55vylIZ14cHv+nf5y9nlGK1auHMrtF/9O5/aUreM8EeRQgjt4GBMi+OiMuDms7HvxtdH9fG49Lsh5YQ+v+F248nt2wYHrMgLSlyxOWFAHzZqXVDWTtc8qZOQM1nD1neR4YbUw2nQrvrEfJGLQ4Di9QizR5NtdeHDcO93U6grV8twpTSZJoGiMF02jr7eBSBpj34d1+jr/PcciMDZ5msLVwkyk4vWgXi7itLbbOZ6xIUjuXgTelAOxZVoQ9iOOu9VMZYvAXEBLNGP9znecs+cWOIGrtw7yu097FYgNkDASG5IYxHybWWf8puZINng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k2oHgywOqaa5C/6OVV1dlT4QoKjU+u2vFqc3XKY2drA=;
 b=Zi/R8+pLG2rQ6KV01cwyS7+KO8N0/Kf7VcYzoZjY4qrwgg9aKcK79Pydz2MOmyJ2X3lQQxwpLnF2aoPVewM7auUc3iwri2qB6pMS3zpcPXdFqik2aDnwzCgaNAaYk85JDxIIzVnY6nylCMcNxhFWI40MNSWTAr7CgxtbWgseIWBICNJ77yEu2dxjUe3iRLshPHQxYNOm8184wiZODHAY4cZcV2poCtpz1YcP+Bc7YOzVRO//QsF0bGrh/8zJrD7EHV8GUeiZS9Q3Wp2VKPIQQd/GQa2sYWKvduj3jSwcDPWyi7k+0CLC6Ol/WSWzfdalOdlvyRwdtCjiIJkA0MQvGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k2oHgywOqaa5C/6OVV1dlT4QoKjU+u2vFqc3XKY2drA=;
 b=eVa8PVceqFmT9fiQ8+nLvtEkB6MhKE4mb7P7l0Gn44eFk6JjmoEhfxXN+lOdpqBjnuID7XRNYrnbW8VMQDNIZ6ix0zMPmHPdLoBAiLZhDEL0etCS8L4q1YM4lUkipjr8UTxGWjgpV0xlRlRhChXSn2L75p1cJKWtUJdkCR4NcP8=
Received: from PH7PR13CA0009.namprd13.prod.outlook.com (2603:10b6:510:174::12)
 by SJ5PPF77807A52D.namprd10.prod.outlook.com
 (2603:10b6:a0f:fc02::7a9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 30 Dec
 2025 14:23:01 +0000
Received: from CY4PEPF0000E9DC.namprd05.prod.outlook.com
 (2603:10b6:510:174:cafe::83) by PH7PR13CA0009.outlook.office365.com
 (2603:10b6:510:174::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Tue,
 30 Dec 2025 14:23:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000E9DC.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Tue, 30 Dec 2025 14:22:59 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 08:22:57 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 08:22:56 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 30 Dec 2025 08:22:56 -0600
Received: from [172.24.233.20] (a0512632.dhcp.ti.com [172.24.233.20])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BUEMqJV836517;
 Tue, 30 Dec 2025 08:22:52 -0600
Message-ID: <fd9f0b37-001e-4721-82b7-ee29379eb9a9@ti.com>
Date: Tue, 30 Dec 2025 19:52:51 +0530
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
Content-Language: en-US
From: Swamil Jain <s-jain1@ti.com>
In-Reply-To: <20251230022741.GA3217586-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DC:EE_|SJ5PPF77807A52D:EE_
X-MS-Office365-Filtering-Correlation-Id: e8f72106-cbae-4480-0457-08de47aeeef1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|7416014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ejRGeDNXbVR3cUN0SVh3WVU4ajQxV2UwbTNFbjlRUGpRMjRoRTBQQTEwSkhq?=
 =?utf-8?B?V0JQbXpjQlVyTjR1bkluQ3hvNHdKd2lEWFNtbnp5VzA4ZVBVN01IQ2ZwVjcy?=
 =?utf-8?B?L0E4ZjZ4RlNrUzRoOExwdk9QSW82anpYTEpYRTJXbWR1UVovME9EeGY1L2gz?=
 =?utf-8?B?NGFEdXJFNCtiQ0paTVZ5bUluWUUzVnRSTkZtYVp5VDgwUjJQSlA3Sm9ZN3hF?=
 =?utf-8?B?MEsydlNiQXBqNjNaZ21Zc1dNaHdKOVRGM0tDNUpITmVsNHkvTGxqVnhPR0d1?=
 =?utf-8?B?ZlJyZVFwNjl6SHRZTXZCc0R0QllneUkxRjZXYTdZRGFWMUg0L3pZTmMzNWZK?=
 =?utf-8?B?MVUyc01kWVpXYVljOFgvbFN6MFhwYVJpUjY1TTBVc0pjK1JiV0xtcUF0RmJ6?=
 =?utf-8?B?eVZLT3RsSzFWeDFTN0kxZ1F2TWNSSnpqaWtvU0dzVHVsT3g2SXowM2NXSERX?=
 =?utf-8?B?S1Zud1dmR25DRUdzYm9pbUl0b0JWU0JXTkQvWnNPejRablpFei9jZTNMY25a?=
 =?utf-8?B?TGFDc1YrVU1PZEFzRDltMlZwc0lQZW1iNHZkb2gvWUxVQzRtamJyQlVYV3dE?=
 =?utf-8?B?VklFRUFLb09DWVBuVWlLQWFNRUt3Mm5SMUE0RjgzNGY0ZnRGNGEwNUZGbzAv?=
 =?utf-8?B?ajR6M1dqRUd6U09yMTJ5NFlUZHcvY0FqRDBLWlh5di9pSFJ1WjFDTkpwQi9Q?=
 =?utf-8?B?RzlHbWxYNEFWYU5YRnhVa0djMlljbXQ2T0w5MFgwTzl6K2dRdXhWUEZRSFJw?=
 =?utf-8?B?bjZBWEQ0Rld5T0wwM2poTnJKYVI3ZmhKNTZPUnpTNUNGSkRNbkczZElFbVhq?=
 =?utf-8?B?cExzQnliaHRhWHZKK29sS1JHRjdHNnRDckc0dytuK2FXRWhhckJscGN0NWJL?=
 =?utf-8?B?cVRBUWF2UlJNeGdmNXNvelFZRFh4YXhzVEFYK3lvL2NjS3M2VXVoVHRJaCtr?=
 =?utf-8?B?WEJiUlRLZHVHcyt1cWttZnpmd1hIdWUxVEFKSytXMW1RR2FsV0lBWFdxWGdj?=
 =?utf-8?B?NzcwNFlFa1ZiczdFV1pqK09yaEU5cmNEOERFR2tOVWZQUmtkb1VjT016NVM1?=
 =?utf-8?B?ZVJNYmo4SjhieEpkZkhTSlRMMFRlZ1ZZa2xpRnZ0UFlCRmpqQ3Z2aHBxb2dU?=
 =?utf-8?B?N3JSVmdiVzQyRHZvbjYvODlWSFIvQWovZHArNFBMUUJOQllSZ0I3aVp3WHky?=
 =?utf-8?B?ejQrKzIrdGtQRDlXZ2Z3Q2p1cG8rTDd0enJtZXo1WmJ2ZEYrbExzTVNJTVFE?=
 =?utf-8?B?Q2w0VGxqZnBLSElHMGxTSW42eENQU2Evck9HK2xnNTdCSXRheFZaV3RCTDhs?=
 =?utf-8?B?VGk5N3QrSG1BOXdTcWYwSnFldHdPOE52bTNvbDI0Vk9rblptZzY2T01TeDkr?=
 =?utf-8?B?WHphZXlIWkV2VjJnUElaU2ZFbktXNHEzRmozRUpVUi9PTUpyUzZuUlVZTFR0?=
 =?utf-8?B?MEpucGxwQlFDK2ZnK2VheWRDY3Y3RmF1VkRKOWJyZ3NuOWM5dkdjNTU1OWdq?=
 =?utf-8?B?SHhKMWlBTTE2WVM0YTJoQTBjMkJzeEg4UXUzYUdiK1dHK1hCbkdmcXI1bkJL?=
 =?utf-8?B?QUY2UGkwcllVNy9OU3UrVlVhZkloY3VEU0Q5MzE1UXpLb1dYaDZqNFBJNytH?=
 =?utf-8?B?ZGlSVFQzWHo5TStWUWtVVHdBNXBKZWc1SnMycmx0Ukw2OVR0VXMxaGZsRFRz?=
 =?utf-8?B?K2lDRlhSUm53YkZKSTdCSVp3R08raHp3VEJmT0Q5MXlSa2xhZjBSUVo3R01n?=
 =?utf-8?B?bmJYNEkrYm9aUW5KaXJ4M2k3aG5hTzN1bGJiVXJuakMzSGNxN3VpL2pJdEdM?=
 =?utf-8?B?bkFHWURyNzk1RGIwclVuUUNFQlp0ZXZPUUZiQWJaY3BZOVN4b2JkOEh1WjJ4?=
 =?utf-8?B?aTRhVnBzdENSSTI0VUdPUmdLS2VISldMVDJJVkk1VXYwcnhZWkFlQVFkdWYz?=
 =?utf-8?B?WjVXMkYyZWFJNjRUQW1vVmhXQk9pUndFOEZVWW9ObUtQdWF0SEphOTJqc1FJ?=
 =?utf-8?B?eUkzVk03U2xLNXVNalEyc2RkN0kvakhRVjY2NzF3N01UMGlqNzFYZWpnelZZ?=
 =?utf-8?B?NXc3ZGthR3lDMVg3WExaWllWcWNYcXFXRDQwL1FKaHhseTdvaWRuNFJKY2s4?=
 =?utf-8?Q?5zqA=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet201.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 14:22:59.1534 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8f72106-cbae-4480-0457-08de47aeeef1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.195];
 Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9DC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF77807A52D
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

On 12/30/25 07:57, Rob Herring wrote:
> On Wed, Dec 24, 2025 at 07:01:50PM +0530, Swamil Jain wrote:
>> Update the AM65x DSS bindings to support AM62L which has a single video
>> port. Add conditional constraints for AM62L.
>>
>> Signed-off-by: Swamil Jain <s-jain1@ti.com>
>> ---
>>   .../bindings/display/ti/ti,am65x-dss.yaml     | 95 +++++++++++++++----
>>   1 file changed, 76 insertions(+), 19 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
>> index 38fcee91211e..ce39690df4e5 100644
>> --- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
>> +++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
>> @@ -36,34 +36,50 @@ properties:
>>     reg:
>>       description:
>>         Addresses to each DSS memory region described in the SoC's TRM.
>> -    items:
>> -      - description: common DSS register area
>> -      - description: VIDL1 light video plane
>> -      - description: VID video plane
>> -      - description: OVR1 overlay manager for vp1
>> -      - description: OVR2 overlay manager for vp2
>> -      - description: VP1 video port 1
>> -      - description: VP2 video port 2
>> -      - description: common1 DSS register area
>> +    oneOf:
>> +      - items:
>> +          - description: common DSS register area
>> +          - description: VIDL1 light video plane
>> +          - description: VID video plane
>> +          - description: OVR1 overlay manager for vp1
>> +          - description: OVR2 overlay manager for vp2
>> +          - description: VP1 video port 1
>> +          - description: VP2 video port 2
>> +          - description: common1 DSS register area
>> +      - items:
>> +          - description: common DSS register area
>> +          - description: VIDL1 light video plane
>> +          - description: OVR1 overlay manager for vp1
>> +          - description: VP1 video port 1
>> +          - description: common1 DSS register area
>>   
>>     reg-names:
>> -    items:
>> -      - const: common
>> -      - const: vidl1
>> -      - const: vid
>> -      - const: ovr1
>> -      - const: ovr2
>> -      - const: vp1
>> -      - const: vp2
>> -      - const: common1
>> +    oneOf:
>> +      - items:
>> +          - const: common
>> +          - const: vidl1
>> +          - const: vid
>> +          - const: ovr1
>> +          - const: ovr2
>> +          - const: vp1
>> +          - const: vp2
>> +          - const: common1
>> +      - items:
>> +          - const: common
>> +          - const: vidl1
>> +          - const: ovr1
>> +          - const: vp1
>> +          - const: common1
>>   
>>     clocks:
>> +    minItems: 2
>>       items:
>>         - description: fck DSS functional clock
>>         - description: vp1 Video Port 1 pixel clock
>>         - description: vp2 Video Port 2 pixel clock
>>   
>>     clock-names:
>> +    minItems: 2
>>       items:
>>         - const: fck
>>         - const: vp1
>> @@ -84,7 +100,8 @@ properties:
>>       maxItems: 1
>>       description: phandle to the associated power domain
>>   
>> -  dma-coherent: true
>> +  dma-coherent:
>> +    type: boolean
>>   
>>     ports:
>>       $ref: /schemas/graph.yaml#/properties/ports
>> @@ -195,6 +212,46 @@ allOf:
>>               port@0:
>>                 properties:
>>                   endpoint@1: false
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: ti,am62l-dss
>> +    then:
>> +      properties:
>> +        clock-names:
>> +          maxItems: 2
>> +        clocks:
>> +          maxItems: 2
>> +        reg:
>> +          maxItems: 5
> 
>             reg-names:
>               minItems: 8
>         else:
>           properties:
>             reg:
>               minItems: 8
>             reg-names:
>               minItems: 8
> 
> clocks needs similar constraints...

Sure, will add in v2.

> 
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: ti,am62l-dss
>> +    then:
>> +      properties:
>> +        reg-names:
>> +          items:
>> +            - const: common
>> +            - const: vidl1
>> +            - const: ovr1
>> +            - const: vp1
>> +            - const: common1
>> +    else:
>> +      properties:
>> +        reg-names:
>> +          items:
>> +            - const: common
>> +            - const: vidl1
>> +            - const: vid
>> +            - const: ovr1
>> +            - const: ovr2
>> +            - const: vp1
>> +            - const: vp2
>> +            - const: common1
> 
> Why are you defining the names twice?
>

For AM62L we don't have "vid", "ovr2" and "vp2", the dtbs_check will fail.
Could you please suggest a better way?

Regards,
Swamil.

> Rob
> 

