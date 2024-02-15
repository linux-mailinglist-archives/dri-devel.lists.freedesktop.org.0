Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD55D855CF1
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 09:54:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BCCE10E3CA;
	Thu, 15 Feb 2024 08:54:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=siemens.com header.i=@siemens.com header.b="zziVGXiQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2050.outbound.protection.outlook.com [40.107.6.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59B4E10E3B9
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 08:54:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GqOmcr+Yxs5GiATJKmdfwSyzlsldzIf7nDNBkpKlgSjZCeX/d7OfEDEFcZctskc/UbZp4z52sRROz4S2QChxr2uGZK+vh00f3Zd95TC9jQFM1NmHDnAFU/rYY241FDI90fef1BIg5OukSuRu9auc2HXftTYx7SGE6K2oD8oSMHzK4wGYnyizu2HB/lpCxYp2cSFGd9v0tcLJxnyxDzt2I3M5EVetUuhHd18hwPseBpS39fy8C1bwQBn3jgQP0SKBzB1Zppg3ejSKdRClXsGjjdsZ842kvLtn55wa4Wk1ZOsTwSRozFY1tFgjZY68+xgSyRf0RAYLdrvpSiz2AlemAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KdIBbEwPO5VrXY+MxE5NFn2fSnrT2yR7rWgSKzKU+Gw=;
 b=SaFMOyyoGEyIf3pkLQVkQ+u2ArYW7Ki4V2TK2EMvuMCUSYApIGq8F5hNcxe3xgttbp5e9WPJx5Xbk8DDh7RwCZ0IGEEir6DR/ThKknOeciJNe3DpXab3oATqvLcx9hEeBNJ1NI9SysoKwjA0Rwqk8Gur3zCJxbGaxImiXAvAwhesWvTjW91C3A/dq4p/vfo4Z5xENOtULyQrsld+thB5F15CNSj0H216oRe/R8mDLMzhE44aUGlNBfF68ymHQkWCVZ+RnFSQ9hXUQU7bJ7/hT5v+mV4qOwfTLlJecTtik0jJv7CvKtUM1/dj8C/Unnz1jTbnSTwcSoULtO1dTC/MXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KdIBbEwPO5VrXY+MxE5NFn2fSnrT2yR7rWgSKzKU+Gw=;
 b=zziVGXiQ4UlarjBiiPSwQ1NrntUoYQ2hY+tYTPJnLU/0poqhDzuOUWJGvps3omK41LNN2DlxsvhCk0bpqBl+0tDPRTh7usNwaXU9pr5rmH68U9OcDEFr54WcYctP8O40QK06m79NlaRVwvexvsYayOcwRith4XriVDdRuMotoYxOBIJtXcR7bUqcMt2kNdaNsUOI7VHY5qDwzAXVsiGQafxs4eDxqnU7FFIWDQqxto7tXaEGavd+q1UOCJKf6pN9fGbmTrMNWmpq90LDCsUa7y/2BxSc6MiRoklJqeJ2vJC1WaU6J68DuU4Ofj5IcOjVVH+F6pDabMS5PaTiVeYRsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:588::19)
 by AS4PR10MB5371.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4bb::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.29; Thu, 15 Feb
 2024 08:53:55 +0000
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8d16:7fbb:4964:94fe]) by AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8d16:7fbb:4964:94fe%3]) with mapi id 15.20.7270.036; Thu, 15 Feb 2024
 08:53:55 +0000
Message-ID: <2f3bb86b-6f8c-4807-985e-344a0c47864c@siemens.com>
Date: Thu, 15 Feb 2024 09:53:54 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] drm/bridge: tc358767: Fix
 DRM_BRIDGE_ATTACH_NO_CONNECTOR case
Content-Language: en-US
To: Aradhya Bhatia <a-bhatia1@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 marex@denx.de
Cc: linux-kernel@vger.kernel.org
References: <20231108-tc358767-v2-0-25c5f70a2159@ideasonboard.com>
 <3537389.iIbC2pHGDl@steina-w>
 <511f437b-89b5-4963-ae7d-dd66ab6db4fc@ideasonboard.com>
 <f6af46e0-aadb-450a-9349-eec1337ea870@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <f6af46e0-aadb-450a-9349-eec1337ea870@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0097.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::10) To AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:588::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB6181:EE_|AS4PR10MB5371:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a0ef959-c805-4baf-b682-08dc2e03a460
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J/uFVNnc3J4/SZHp6fohDviiY874D5IugDYBvANzrVPDP/xYAnj1Q1Gd9PYCLvQG8O9jwjicLkX0dEZ0rVkQ8IGFXow8ZyrJpcXgDt/E3JhLuYM78OGCf1GLk/kwaiqnnf9sHPvcC15Tfsvjnc6Hzm2MLH7YNP2oz19YEj54RyWWt/oJh8ybbpKH8bQhziglMk92ithQlHsYssUvkJUgi4X1s5VUIqGKwf3KHsex7TLxjJ0ASU10MuQS2twOifFLgUxcGSEM7qabKcG3/XywlbRxIpF4Mjn9XO8blICF81HEuNKm+Ti+z6qLXG3k0iwNE1M+R++mueq3HE38aKF/kqFj1KWJnCp+sd+8z3h5xKDt1r5wrQCAn3ca34RFYNpKig33++6WjnEUcjBjSrG4ZWJ4NoQTkc9U2uQEfZzcwqhTARtXAh/C6MWYxW5hU96le1p5c53QkYqsFvTLNeXUXNVDSZuCNrEwApsclhxplHfz1E3CK/IGb98j1/yoZZBoCvh6wHHyO5x5R3HLksKz9GqOyOZKCkFjC1ueKer/OU2IDRH+DyoW4jStk15MGh1pi1Eq5PpTtPNXdw6LzZBJc53mipdkZi5aeInIjPZfNtU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(136003)(396003)(376002)(366004)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(921011)(66476007)(83380400001)(26005)(2616005)(41300700001)(316002)(4326008)(8676002)(8936002)(66556008)(66946007)(478600001)(110136005)(53546011)(6486002)(6506007)(6512007)(36756003)(38100700002)(82960400001)(31696002)(86362001)(5660300002)(31686004)(7416002)(44832011)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUpYK0pLS0FOQmVUSi8rY1hXcVlSYjZsdFVFRGhFWExxbFBwanRkWWtGS3dB?=
 =?utf-8?B?bnRPMDYvUmNER1pOakNuVUlZd3dMRFhkcTVrWVdTdlQrdy9VeUNVN1JHSVZR?=
 =?utf-8?B?MmZ1cHhyQTdRT1BLdzc4Wm5UbExMcHpKQjdXSWlCNVQxcU1zdmpYVm9zOUtZ?=
 =?utf-8?B?ZiswRHczTmFyK0NQeld6TFdmbVdoRzZ1MTJBVS9neENmRHpNUmxqbXpmeWhJ?=
 =?utf-8?B?Y1lVR0NUZ0ZUVFE3RVNJUFB1M0dJMnlURXZIZGJpdnp1cUlHREZoOE00ZzlB?=
 =?utf-8?B?alVMU1J0RTR3ZVQ0dnBNMlpsSk5LWlJLeE4rWEdBVEswb1VveUNPWXVQK3dm?=
 =?utf-8?B?dlJ4TFkranliQm9rTUFTQzI5Wm1HZGNaVE9iQVpWVjdsUzJsRHZRL0JNUWs3?=
 =?utf-8?B?dUczRmh6MG1FV3lxN2pQV1IxWGJYaG1SbkIvckpYaG9lMUZPUVBWNjVqSXBL?=
 =?utf-8?B?UG5TMnJ5RUZIL2ZsUk02VmJFbk5uVE5HcGRzM2I5ZDA0WFk1MlVzZmdhV0xr?=
 =?utf-8?B?TDN4Y3Rybzk3M3lpRVlWL3RuL2ZsN2I5MWFFRXhBdW45T1NyYVZCaW9rSC9s?=
 =?utf-8?B?a3podE9pOGdJV1RHYWJWSVhjRHJPVzgzZ25uNzQxLzhjMTlVSGRLMTFqSW5O?=
 =?utf-8?B?MGRIK0xETHN1a0k3UjQxQkR0S2lQRjZOK2VZVnFLZkJzNlU4U05wZ3VsVWo5?=
 =?utf-8?B?VnJ6UlRwa0cxdXdoTndMV0RiOStaazNaSUxHY1RJNEg0dXJNUFNRcjhqbHU5?=
 =?utf-8?B?K1BuMmpCVm9ac0VPZzhteHkwZmFhRmVVRHl2WCsvWWtyN3ROZ3dmejFkVnFV?=
 =?utf-8?B?ektDdFZBaHFBS0VXcGN0VVBUbVM5UVk2cmcrWEV6TTVhTk1haVZDbjVwMnJF?=
 =?utf-8?B?bWd1RkdHdENEQzVHaEFkR3ByU2ZsRFg3Ris5N1pCMnV0dGlwdzc3M0MwZmND?=
 =?utf-8?B?TjlUREpCd1VGL29LQkxSdUtxbFA1UTNUQllzb2RWY0ZRdkNWUWJuQXR3cE5I?=
 =?utf-8?B?czhNblNoQWxMVVJRZWNyN0w3ckRuL1BLK1FEYlFRd1h2eDkzTzZLazZ2QjFY?=
 =?utf-8?B?eTVISHBSck5kT094aHpmMGV2WGF3aUZiTVhXQXpHbDFuenhDNUdUcVVXUERK?=
 =?utf-8?B?NmVYSGEya0lNeTVEcUxNUXlWTDRlV0FZYUg0WEltR0ZlT2p4T0d2VVM1WW1y?=
 =?utf-8?B?cmpsTE9ZRXJHVmRMenZEbm5sOFRZeXh6U05oVXJJcnd1UUZkRGc4VVdRazdD?=
 =?utf-8?B?cE1tQjRWMGthT1d1cU90ZlRkdzhPc3VjZlMzbkpRMktvRHZpaVVJRS9jWXh0?=
 =?utf-8?B?UUxpb2tmQ2lpbHVEb1djM3dFMUJvN0RNcXFSczc3bzk1aDJPNCtEWTUzQkFy?=
 =?utf-8?B?Q0Vwd2djT0VIYm9Pc0o5aXVQNnNBSGZXQmlaVUxOV3ZzZ2hOS21VaTA0ZUN0?=
 =?utf-8?B?akxhMUQ2ODdJcVdoNzdqelhVRDFUUzkzV3B5M055dEtnVFZxTHZjWWFUWXNU?=
 =?utf-8?B?c1FaS2Y5THNWK2dPc095VkQ4UHFjZnJDY1B5YXZVWDhGTEJSOUc3UmhJYWt6?=
 =?utf-8?B?NzQwWmtPWnBWMnVSa1FWdnZ2SVEvR0pXV2lEOWprbXMyYTQyUE9SS0pmYmZE?=
 =?utf-8?B?NmVYaVBXNjdzYTZrWlZLWkRHVHdnU1N2MkgyMzBDd2FtRnltM1RIVUxzb2sx?=
 =?utf-8?B?TjZBSEpGQU1rZjJobXdpaVhMQlB5Ulh5RFByOTd3YlNpWVVsWFNad3Q0cWF2?=
 =?utf-8?B?NGZRZjZjdzYwc0JwWkdRNGZldyt1WHptTjZYc2h4eUZ0T2ZMRzRRc3lqeFd1?=
 =?utf-8?B?NWg4OFptYlRXRGNzbHJlU1JMYkNHYXVsQkxoTU0rVDdKeFliNFJpS2JmOEJt?=
 =?utf-8?B?bWE5U3RHU1dudVF1WWFKZk1IWjl2eW8yQm5BcnkrZGZtOEduZlNTZU5acW5S?=
 =?utf-8?B?TDB0WUlLR3dQMjViSTRKbUVWL0x3Y1IwMUZJaTZncE9zS3FkV0tHOHZ6R3dG?=
 =?utf-8?B?ejR5eW81UjJyMUlKeUdaTlFNUlRtQTE3NXZQQlpMSFk3TklqWUdmWHNGYWlu?=
 =?utf-8?B?OEVrTWVoaHBBbkU0cXRkNWRPQmkzYWlBbEtxbUlBNmJpd3p5c3RyeFRjTVB2?=
 =?utf-8?B?ZjR5Z3dNZ0Y3ODZpbmpXaEZ6RXNIdnZ2ei9BNUZ6QnErT0F5OE1ETUZFK2l2?=
 =?utf-8?B?Y3c9PQ==?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a0ef959-c805-4baf-b682-08dc2e03a460
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2024 08:53:55.8426 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DpwYB3OTd3LhbSK/iTfNQwr1N7FwOZ0nKT/yZjZ0BYt53ML7ISFdqVwSlNg0Qmo+oSBYAN1483n9iLujb9D0Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5371
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

On 11.12.23 09:07, Aradhya Bhatia wrote:
> 
> 
> On 06/12/23 17:41, Tomi Valkeinen wrote:
>> Hi,
>>
>> On 08/11/2023 14:45, Alexander Stein wrote:
>>> Hi Tomi,
>>>
>>> Am Mittwoch, 8. November 2023, 12:27:21 CET schrieb Tomi Valkeinen:
>>>> These two patches are needed to make tc358767 work in the
>>>> DRM_BRIDGE_ATTACH_NO_CONNECTOR case, at least when using a DP connector.
>>>>
>>>> I have tested this with TI AM654 EVM with a tc358767 add-on card
>>>> connected to a DP monitor.
>>>
>>> Just a question regarding the usage of this DSI-DP bridge.
>>> What is the state of the DSI lanes after the DSI host has been
>>> initialized,
>>> but before calling atomic_pre_enable? AFAIK this bridge requires LP-11
>>> on DSI
>>> at any time for accessing the AUX channel.
> 
> + Marek
> 
> Marek, Alexander,
> 
> A quick grep tells me that you have added devicetree for tc358767 in DSI
> to (e)DP mode on other platforms. Could you please test these patches
> and report if you find any issue?

Is this the last blocker to move forward with these fixes? I'd really
like to see them finally merged.

Thanks,
Jan

-- 
Siemens AG, Technology
Linux Expert Center

