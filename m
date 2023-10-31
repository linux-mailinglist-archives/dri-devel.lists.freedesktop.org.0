Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6689D7DD5B3
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 18:59:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44D3810E5A5;
	Tue, 31 Oct 2023 17:59:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20614.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1a::614])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D71B910E5A5
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 17:59:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UzSk9vgOXU37eGZRyxfh+FZdmItAjJpnBvmk1TVn24PnA4lKDmc95ATqI4uupwcGHeT8r9NaBMJlQo0PABgO2PurkxKU7LMG28mgkqKMOG72ynnCGKFY2LXHTf+oCw1FkJyeX5CbxhC/kQ91y64njk2dcgDXfn8OzUA/kAEfhUVTwRUI3/ScWdxgO7nxKr3XmnqNkRAwZwZlQyL/ho8FrA9kZy9owlS5Ye9ABQri8enj5cAQu5EBpOACL7mjWGB/7GAwbQEbcg0TSPOQjM9iVFJDt3eJ38eDNCXDQf9l+xKw+qTWh+7ZTY+AObbMLoojq//u3kwSj0VVRRyYhQHM7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lATO51Faog+wNyK2qxBvBxD4Fl3DBXI82ezhM+EL3hQ=;
 b=V9dKOMHV8bVQOZ/r+gDE64Z0JzieOamPdciBjcBe8q82qRyylMfazYiX9qKKa6cEroOjOcemFDs3aR+mDSlMxsjLy8av1pyLTgklM5Bs3+caaff1ZK8CJkCLeXz7qszcLKJ3kXMfJmyykLz28BKSPWJt/kAF8CTb+2nnhhZOttt8QhveRf+7Y8FFsBMQ7E+LhewcLdQIwbn0mSW6bRDdfwDLobUAqgHbZrdJQWnPIQXUa2lmilmBiZVp7G4bvl2/PLavrTfZPBhohgHM2p96jHTj7e4kH78J5qiPzJ/wHB+kyXcJVKll+isug9T+pHjo0nSWJ/QgaPBa8SDZHK5rMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lATO51Faog+wNyK2qxBvBxD4Fl3DBXI82ezhM+EL3hQ=;
 b=ar7wfq0jD6Bj9p/UpmkKci0Fy9Vg7noEsvC5h+gfvy07wErTuEhbWaOz79vbONBrqVa+CEapv98qtYvetcn/SgEeGk1tdkKajstkzYWQj3o71tItphWxhPUCHqiUgqHzaamIzfgpV8l0SF82X0gvcIy3/lv+AhEi+dHgMnLjBXT0zoZbquBKz4CGF5d6YMEn/1eVQiUfg0lndC5ptECYxzqJcIx2t2rxALh4/nYEyiPQxOEXglAJqplNpNW3d6xRht2PJjYrL1bGLhM4EEmjflt4VhUeJYdge0ah8RgpVIw4d77L4k4BkQJxE+qDoNoIqu3MXgDU1aZjzZ0IAOOXLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:588::19)
 by GV1PR10MB6659.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:85::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.28; Tue, 31 Oct
 2023 17:59:46 +0000
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8496:a3a3:d7a8:b24d]) by AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8496:a3a3:d7a8:b24d%4]) with mapi id 15.20.6933.029; Tue, 31 Oct 2023
 17:59:46 +0000
Message-ID: <a38fecab-70c6-41e6-9054-a6dc8e082c9f@siemens.com>
Date: Tue, 31 Oct 2023 18:59:44 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm/bridge: tc358767: Fix
 DRM_BRIDGE_ATTACH_NO_CONNECTOR case
Content-Language: en-US
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Aradhya Bhatia <a-bhatia1@ti.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20231031-tc358767-v1-0-392081ad9f4b@ideasonboard.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <20231031-tc358767-v1-0-392081ad9f4b@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0019.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::16) To AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:588::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB6181:EE_|GV1PR10MB6659:EE_
X-MS-Office365-Filtering-Correlation-Id: fd1a5ac7-8ff6-4589-ce80-08dbda3b2b0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UwnutMblPLy15id01lzK+wsRDnOjodhcvKITl0cmKa+Wc+DsuHsyPizUH6B/Vu8jwfbHNJOpUhVEf10h+mMUxPPaVn6w6DJfwANHb/WWeHvxbX9u+e24Cl84gSUEjD9XadCLSz6tZD3RGZsuxZ7vSsHEiHhBIX1lgPmYkRsUBROwF8Q4BKoswtNGS+4HB7X1+qTjTSrPEArQu0zsWL0pn/1CVe1Lj9tLV3Pra58XaO2F10KVJ/x2oodvWZoKP9eUQxN6/H41huEPE0OP1jP7c1X6C8aG673Lcty5JTRwTzecEBZfT1FlGrNzP8aAiQjrVFDle2dsS7+fkpy9DBcHJ7JHg/38bpBF+qPk7b4nC4U8Sl3WLXs7x0Ghiz5PHPUk4kEpJuBBV7qDBu3S+dJfq8clHbcpmJupGmwLcHaItr+VeotLVJS4MfuY8tLxOTDJKrELX/QWiNmMvKf/QmQ2Ly21XYLbbT9REIxbWbMlII6d7vkioHI2zy8WZhC0m6Iu+hxYdYTliycCFUN3IRTG8UYCk6Rds2vhZqJ2/ZibmZk8MN3lSDP4G5+zF3EA2nAjHL5fcDocVlggJ8XSamkhANDRPlUtQ4t1+38r1hF/9bKxXa1SaP2x4VVkiwrtFRVQvp1xTvlBYZnKZVTnuaTscf//gz7C9evLRnAXFey0loQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(136003)(396003)(39860400002)(346002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(2616005)(6512007)(26005)(53546011)(44832011)(478600001)(6506007)(7416002)(6486002)(41300700001)(66476007)(66946007)(110136005)(66556008)(5660300002)(316002)(8676002)(8936002)(4326008)(31696002)(38100700002)(82960400001)(921008)(86362001)(36756003)(2906002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmZzK3VkYkp3L0RtV3dvMlh3N05BdUVPdUx4SDdPaEppTG1rWjJDNHNvaEtQ?=
 =?utf-8?B?NUtSc204NG9aSFJ5OUpyM1c3aDM3b1hNZCsrc3Z1VXNTSWZXZEZCOEk5VUY4?=
 =?utf-8?B?WVFQS0w0RjJXc21RNVRta09jRVZCQVN6V3VPR3hrUUZwMkV4d1RMTjJCUkRl?=
 =?utf-8?B?SzVHS20vcjZjZWRENFRGeVpVd2JFWVF6azZaMFN4ampmL1VSRGc3K2toeDJ4?=
 =?utf-8?B?aUdheDhhN0JvQUxPNVF3YmU4ckNTNzdlWWIxZjZkSmdjVW85UzFSWXQ2TWRX?=
 =?utf-8?B?T04vRHJZbnp3c1JYZldoZG4rUE1XM0lGa1JnTEpsVEYwbEt0bjZrekdNZFY5?=
 =?utf-8?B?OUdON2pqK3FqbVVoV1h3OFFGVCsxZFRRN2o4TytoTUJVZHNsL3lQVHlWOTJE?=
 =?utf-8?B?aGpRcUxSRjZ2NzdiSi8rRHdjeFpleWRkMVJQQmo3UUtBak9sWDVqOWppMlA3?=
 =?utf-8?B?T0liR1RCRWVBaFpIcFY1Q1B6eVJwcVNzR0FkT29mMEs2QUxUdFozNjlrRUZO?=
 =?utf-8?B?U3A0MnIyVUFiRW43aUNuSWdad3h1TGRwNVpMbk9BaTgvWFAyYkpBVFpZMFc0?=
 =?utf-8?B?cStEZDAybHdGQVYrUTAyd2FZQ0hIcithTDdJSWtvYi8wSXhZM2w2M3Z2ZHlV?=
 =?utf-8?B?NWVYYjV3Q21KVTZjSkJPbjJpemp0UWdobnllcmYvdmJIVzZXQ091b1gzVXB4?=
 =?utf-8?B?Z1U4WUo5R2xqOHRSaFdlcU94WUExZ2hhcWJRYjVwRmlFelI3aS9rWWJCVEZZ?=
 =?utf-8?B?ZTVCa3U3eC9NMzJwRFB5SU9wNTR3ZWlQcjZhdlRpL0lRdUJ4aDRMVjlrSGNh?=
 =?utf-8?B?MDljYjJxTWVRS3ZyUDMxZW5xUlIxOFBkZ05KMFV5UEc3QW1lWWdsTHhrWGll?=
 =?utf-8?B?d1ZWemo5YzVVUzBTYjNjQjRGMERmbkRFV0NBTDFXMXR3OWVqQTQ0bE50SklM?=
 =?utf-8?B?a2dGWG5ZclBVengydnpSTjkvQlRNck9PWllnRElEejF5SkRkaCtIOC8wSUNz?=
 =?utf-8?B?by9DZy9BeTlzRDhxQXlCbng2eENlUko0MW91MTdXcEowR1B4ZnplTnFSck5h?=
 =?utf-8?B?MVlHeHFsRDVoSHBDcCt4c3FDcEtoYk1yaDUxWW9wd0lodGpUeXVkc0FjWVVp?=
 =?utf-8?B?dDA5MmR6Q1RVdURlbWRZUk5QVlNxNzUzbk9iY2IwSmNOVnF4RnErNnNsUXh0?=
 =?utf-8?B?cXFwQ2lVMDdLMzJCd1dweXpNZUEzS0VMZndOTUpLRGpJTHBlUm9UdlFvUmJN?=
 =?utf-8?B?aENPbE5XY3ZRQVdpS3hiT1ZuM2ZCdlkwcDJaNG9rWnR3RS9wT2ZyRHM1Qk5o?=
 =?utf-8?B?SnkzdWJ5Y0NhSHBEeWVvOWpQR0xGUjhFUVBZNi80bmt4c2ludnNnZTlTeE1h?=
 =?utf-8?B?OXFqWDU3cGx1MFlRc3liQ2pPc3dVWnBXNDZ1d0dvL3NvcFNiaG9kNTFDbzc1?=
 =?utf-8?B?U3NnKzAvUytLUHkxdzYwREVDUkNUNDBrR29TaWtCT2h6UlBxUTgzN09QbmFW?=
 =?utf-8?B?ekF3a0xYQnBjcGNuTGlaUFpVYXJRQithSzlDQ3BxKzdPVytnTFRXU2pIT09v?=
 =?utf-8?B?VTJrVDMzcnBCeHJhaHl0SjFOMDdZQkRhdTB5N1k2ZmJ3YndqaHAvWFJZUHF2?=
 =?utf-8?B?V25lZFJabENkdzlnckJBY0JhbW93MGF3NklmOUUveklCeVk5dlA2ME1WVlJM?=
 =?utf-8?B?V3dua1ZmZ1N6T2NOY2ZqbytDWi9tNmxNOW9iSGVERWNBdHpUOGJUam95SGEx?=
 =?utf-8?B?VU9QVjdoTFg4clVBeXpaNjB6SG80U2FtRkt6TENReVBKMFUwaU1qYmVVcVB3?=
 =?utf-8?B?T3d0QzRZRmNXSHYxTE5MaklwMTgyUTlFOW9qK29kR1NlTk5sMENPWWt5bG9T?=
 =?utf-8?B?VjRpcFMvMFNtZ0EzdjFzNGVuOGttakdGMEEweVM3V240RGY2VjdGTkVrMXB6?=
 =?utf-8?B?bm9KTEEwWEtWeEZNUTQ1d1BMOVhpR2N1SjdySTJQWVk2RVBUaE54NHdVcTJN?=
 =?utf-8?B?V3JOaEpOODdVd21pRnJwdGFBK25BODNwWHdWNWFWdFN6NUp3UVlRN0IwYjVS?=
 =?utf-8?B?SWdVRzM4RFRjdHN0OG85aXFYM0FaUmFKS3VENTQyVDQzeUV6ZTNoNmpPOXI4?=
 =?utf-8?Q?Ev+G3ENR/RnbEYoq/pEZ6u1Hk?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd1a5ac7-8ff6-4589-ce80-08dbda3b2b0f
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 17:59:46.6641 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wL4nxQ2YXs1CTSS4yS0EL5v5C7EYx/Gutb6Jrdulv1C5jYmw6Slo403NaOGWB+rIF5TY2aj5WdT7BlcktCx2CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB6659
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31.10.23 14:26, Tomi Valkeinen wrote:
> These two patches are needed to make tc358767 work in the
> DRM_BRIDGE_ATTACH_NO_CONNECTOR case, at least when using a DP connector.
> The first patch, "drm/bridge: tc358767: Support input format negotiation
> hook" was already sent separately, but I included it here for
> completeness, as both are needed to get a working display.
> 
> I have tested this with TI AM654 EVM with a tc358767 add-on card.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
> Aradhya Bhatia (1):
>       drm/bridge: tc358767: Support input format negotiation hook
> 
> Tomi Valkeinen (1):
>       drm/bridge: tc358767: Fix link properties discovery
> 
>  drivers/gpu/drm/bridge/tc358767.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> ---
> base-commit: 79d94360d50fcd487edcfe118a47a2881534923f
> change-id: 20231031-tc358767-58e3ebdf95f0
> 
> Best regards,

Tested-by: Jan Kiszka <jan.kiszka@siemens.com>

Would be good to have that in stable for 6.6 as well then.

Thanks,
Jan

-- 
Siemens AG, Technology
Linux Expert Center

