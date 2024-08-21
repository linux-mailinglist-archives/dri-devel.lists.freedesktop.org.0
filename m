Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 198D5959350
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 05:24:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE33810E87E;
	Wed, 21 Aug 2024 03:24:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="YHha1+8E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2041.outbound.protection.outlook.com [40.107.215.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8077210E87E
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 03:23:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B5lfPr5xlZ49R6USZI0Fou7bR+a5EGq12n/HKPDbVgmraFtFvtsRmcRcZzPNxaNIKsupXJezNgT6oZC96ZYl+RIx3PIHWbCOZbErLOiPXrQU7SDkHVMfcfCriurZPcr2NT0i3KJyRzSWLPADdp+UB6WrjsePpapNH0ntOl0DTzdE6HFA5a25dlF0J3h5DZrWMsyoBX7Tgzewd+OPUf2NiVcH+iITL9HlBkW5eVR/5N+Tdz9RZgiZDw+Pqc3WSAVpyRSu7rVK4OabJFeR7OmYgd53GUJge4eo7Rail3bzR+vQAwMwj5ccpttybPiO4LigXs1v7tO8YxZYkB36orbrhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Skh4L0bqlxFf9LCK55AnGwCSNrV+zUduoKa/BkS7xcE=;
 b=uBRHVdG/569e3lAHvj1RmYMNWpA0v4D9585OwXCbMPPKYXkHAEasEHR51P1hsDsw6Lk2rg4zeXeDHKHnw8BY0/V9kx/sGjg85gXFplkBjon5SWafbaSSTeTZiygE1On4rzCdhtrBPUhaTm1o3ETfUlTbfSiYBrDqqfgUwtLaYTFvJIz87HcnZ7B9Mewagl7nuX30kFG1zM7sKzoSXa9/nQjQBv6skTZx9Dpai/Jw1ubtWrk88HoSDIEmiQSzP3JdFwMD9YgtJB5FYWDbAcYE7XF5khyITStLdH+Sqv/cyp4i/gs5HVWfeAtWq/BLT5gUb8dvLrCdhZBm50KkL4we/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Skh4L0bqlxFf9LCK55AnGwCSNrV+zUduoKa/BkS7xcE=;
 b=YHha1+8E7tCzokYt5h9KGVo2UZw54TagdYr6Ag24q3XIrOBY8eZnuvAGxjGwqAGq+35/MkrkO96+k6QqWEXyt6PUfbWrUn2OFApgm1Ti/8HcQs1JAzlW1pLphfbKgUyOjvp2lXcmnsNO9t2b6CzggiRCt2QXggpfxx2NfLAO4I4exxTwtPfsNsHUKPs8HIMIqxSzHDv2a/M4XCW00dJgMLl2omnkxwHuf3CWLxmejQCvs+EZXESAdIKbEj77ZqQWCW9BdgVLBpVYh+Xh456fR50rCzSSbupb1WVlipixGpvBbx/BjTVjZnpjxZ2a3ffZFCguYJ/SSt+h3nJ8oDsUww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 TYZPR06MB6618.apcprd06.prod.outlook.com (2603:1096:400:462::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 21 Aug
 2024 03:23:52 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%6]) with mapi id 15.20.7875.019; Wed, 21 Aug 2024
 03:23:51 +0000
Message-ID: <b28836cc-d9cb-48c1-b4ee-402a4c752a28@vivo.com>
Date: Wed, 21 Aug 2024 11:23:45 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: drm: Use devm_clk_get_enabled() helpers
Content-Language: en-US
To: wens@csie.org, Rong Qianfeng <rongqianfeng@vivo.com>
Cc: Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, opensource.kernel@vivo.com
References: <20240820125840.9032-1-rongqianfeng@vivo.com>
 <CAGb2v67-qfTb3ZaUZh2mF-utTgDhiPzCaERc9b8x6nxaHp8-cg@mail.gmail.com>
From: Rong Qianfeng <11065417@vivo.com>
In-Reply-To: <CAGb2v67-qfTb3ZaUZh2mF-utTgDhiPzCaERc9b8x6nxaHp8-cg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCPR01CA0154.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::14) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|TYZPR06MB6618:EE_
X-MS-Office365-Filtering-Correlation-Id: dcf03580-35eb-47ef-b914-08dcc190adb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|366016|7416014|1800799024|38350700014|81742002; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R0tBWmlhUC83MzYvZFZWRDRTazczVTVyN2NlelZyQ3R6WFBadDl5NExYUG96?=
 =?utf-8?B?UFl2NGZlT1BmVHdTRmwybmY0NktXLy9oQk1oQ2VsV2Q1cTlmNWhQbkl0eWtB?=
 =?utf-8?B?L1V4c28zdkIwTEdWZ1pNYSt4VG5XaC92VkJBa3o1bmpzcGVkWjA1Y3NBZk0x?=
 =?utf-8?B?ZjVtZnBPdGZKNU56VWF0OXh6WE0xeUVEOXU4L1diZCtrWnh0VVNNUk9PMFJD?=
 =?utf-8?B?MEJTWjYvY25RWEFMR25BY243bk1YbUFReTZYamhqcWNpdjd2VUFKUld2TVh5?=
 =?utf-8?B?aE1kMUphelVENkZXR21iL2p1Sk5lMkdVWE93WDYwL1lQd3FGb3FPTnRROVZt?=
 =?utf-8?B?eGJhK0gxU25kQmYrMldwQ2ovTW1DUGd3N2s0Ni9YK3AwMy9OUkVmYkJTTVJs?=
 =?utf-8?B?dGNnSDFTMEJFOTBYLzhZVVNXaHdpWnFub1gxRStUYVZhQ001cW1KYThRUUkw?=
 =?utf-8?B?VWh2UHh4WWdWOVZTWmVKWGZYL0VtTE9FR2xDb2RJU3hwMTdSK2hGSTdiQytR?=
 =?utf-8?B?WWRQbjJpcUNDenl0RVUwdk5BbDlIOE5EOVVBL3lod0xJNHhRN0U2VStOZmV1?=
 =?utf-8?B?NHA5MUd4SnkzMWpPdHVrbUxUZGViNDJHU2NtaUphWVJFaW1Hd3dQbFZEcUsx?=
 =?utf-8?B?ZXZoSk0ySnM0Q3plRlNWSS9WejdUMUNScUFrWmNMUXU2VFRPWjdRL01CSDVM?=
 =?utf-8?B?eENOcy9JZ0dueFBDU1VobWNjVFI4SW5Ca1I3UUFIUlQzRkdVQjcxVkNGMEov?=
 =?utf-8?B?L285Y2ZvNjNDL3hIdVVPZUtjSXpld3hacSs3eThrZmxyanljTEx1aTBKQkNP?=
 =?utf-8?B?eThRYXdtdUt1L1R1Y0VBU0drb1V0ZWZnZHhGZy8xM2FMczFZYUxNNzU0VUdJ?=
 =?utf-8?B?ZTVDdm5ua1dEQmo2NlFBWkFJQ3Byd2FnWkhUcHNGaUcrN3FRS3lHZlFtNFRr?=
 =?utf-8?B?eWlPT3N4b2xUa05Fenp4ZEJteDRHRHBoVEVCNm0wbktZNUg4TDQ3ZTJoSVNn?=
 =?utf-8?B?YUlpNTJhRHNxTHp4NkpaK1Z5Q05qU3lvVHZSYnR2LzFKKzRzYWw1cTVSTGV3?=
 =?utf-8?B?OFg5U1cxMmNjTlJySkxUSVFRRlpycW85dEFSNFVNRVBKSzNJeXNaN1VqVWlz?=
 =?utf-8?B?L2NiUFRzYWpnWm5sc1dGaWVYOEZxWFk4ZzZKT09tNm8wZkNoY2NEZUZtWU9K?=
 =?utf-8?B?VHVMQWYrMVh4R0RlS2k0S21WUTEvb0NqUUVPOTVKUGNOWXVMZkxnd2hVcWhq?=
 =?utf-8?B?Z3ZFU2tRalljUzFYa3l6SnA3WFNWRi9TL1pKTnVuNG13b29FNVM0TnpucWw1?=
 =?utf-8?B?NlVqdjhrdTRRdHVxR0thT0IrNHJIMjRmRHp1eUF2Q1NWazI5cjZFK2gxL1lj?=
 =?utf-8?B?TkFjTitIaDJPb1lIVmVKUmYwNW92VHhkMVZoRzlDVlhUa1oxQm1USkdvTzNL?=
 =?utf-8?B?azdCQndyRWdRT3h0dDRMZ0tlZ1hiVEZrNkNkb1dEZ0ZzOTB2SXZINWZuQlhI?=
 =?utf-8?B?M3BjaXZLRXJXOS9BN0Q3aUh3ektLM25NQXdSOG9wRUdwL1AzdjNtV2dVRjIx?=
 =?utf-8?B?ZWlpcGV5cE9qeHlhTzh4OGFrNVBpY2NpaVhzZENCaE00SUVTMjBzM2xybG9D?=
 =?utf-8?B?VU1JTUtHZVlkT2w5bHF3Wk8rVElVZCtwMVFmT2E1VjExR1pka3lTQ1BIcHB3?=
 =?utf-8?B?MDdnbXBhSWE1NW9oVjNvWW1yL2NUTHpGdDdTVThidnFwZHlCb2RRVFZLZU02?=
 =?utf-8?B?enBmQy84N09sdEdYMnhldGc1UkdBN21LRUlrL29NZEtxNUxwcHBCYXlLeW9h?=
 =?utf-8?B?dGFzVlVXYWhXazZQeFdrenQ5aEx5cXgvNGxETWtqcWs0WUNVT3VvQjBhdERD?=
 =?utf-8?B?WEphdlFDdVdPUUFZMzFTa3g3Y2JiYXFKU2E5MnI3WE1TRnpkU1RYYzNtT1g0?=
 =?utf-8?Q?tvVrPJtNrR0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR06MB5140.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(366016)(7416014)(1800799024)(38350700014)(81742002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVlPRW45Yk93WXBxNUlzSU5sK0kwS0UxckJ1YVpPRlpxc2EwV1dQc09Lc1Fy?=
 =?utf-8?B?OUhHTnhtZXFmRXc0SGwraGZKbTdmQ082ZVJBN3U3SzY5TlVha3B0a29RK3ho?=
 =?utf-8?B?eURIU1ljZzg0MFFnTmdGczBUMUtlT3B1M0JubGcwSXZKUU0xSCtwUXNQTFNo?=
 =?utf-8?B?bHZaWnc2c04xYmVUamRHNzFDUmxGNXBEV0duWnZUV3lXWnduT2FnbmJvcHhn?=
 =?utf-8?B?S3pBaXJBY0ZFYW9sMDAwN2dpY09HQUdTT1E1REhGWnI1djBXOG9nNFN1UDIx?=
 =?utf-8?B?WWsySGFxdy9MN1htNTY0aDVvd0w0ZEg1YUh2em5WZHVRMkhMcjBGZm1hK0xk?=
 =?utf-8?B?RlJWcE5KL2wwclBTK2NDZkRxUzErTnU4Q1FhYThxbEJqV3IreTRvS0V1bHl0?=
 =?utf-8?B?TGpNSkoxa0c2OE1kc0xRZ2kxV0FhejhYdVFzWWZ5RWpsRmpOeDRxNzR6WmpK?=
 =?utf-8?B?blF6aVpBOGMvdExpc0NoRVN6UDhpSzllVmkxOVZ1VWhuU3dPa1UyTjhNYm1z?=
 =?utf-8?B?TExYbnBWNHlPWDlFU1ptMTF2MGw1L2ZPTWhEaXdqc3NINC9oaDlrNDNjTG9G?=
 =?utf-8?B?dGtDYkl4KzhnU21OKzlSQzRzdDgxV3JvQVpvTFBTNzJrZnh6WmVuZUQ0Qzhu?=
 =?utf-8?B?R1RSTklPdXQ5aDg0RTVvNkFaS1NBajVTSVVMQTlDMjVSMUZpZXJPNU85R3Bu?=
 =?utf-8?B?NEk5N21jbHBPUElQblpJZHlVQy91REV5Zm9BaFREQUswMjdOeHQ5WEh4dUJN?=
 =?utf-8?B?U2lSMUxvZ0gwTW00dlVqODQ1Wk1LaXB2U1VsN0ZZSFVQZytwSnJSU1BRVmNH?=
 =?utf-8?B?djJCM0w0d3BWTkU0eFVSanFEK2tkRFZENnJRMHJmOWQzb2dodjVHTEo0Y2pX?=
 =?utf-8?B?RTFRUitFTHY0TWVKT251ZXdUNlJERFQzL0FXN2NIN010RXN4YnJ0TFV5NFRV?=
 =?utf-8?B?UlJncDIwUDBYR3dTUGZnTEF0SHc1VFlORm96YVAvUnZPaEhmWnhuaVU0UEpD?=
 =?utf-8?B?b3JKQTkrYjhDK3VqckhOeXhTR0tpTjNuNlltNDZEWDdYUXM1ZzNYNnNzRGx4?=
 =?utf-8?B?VUZHWU9oS051d09zV1N6aE4yMXJEZWY4N0FCaGZ1b2FnbGlaS2ROWXIwTzlU?=
 =?utf-8?B?VGlibFh6VFJyOVZQdXQ5QlZSeVRiQ2NLb0Fhb3NyOTAraDUxbjNoYmdYaUJs?=
 =?utf-8?B?NWNpZk56aENUOWc2QTlkOUtFZGlmOWxHeCtYMktheXVPRDdGZjJPdkJzYlh5?=
 =?utf-8?B?aDJSUXNsNmVGZDkyWWZWL2hOaTRuUGl4ejJWMGZQR0RRckw5VmZyb3ZnMy90?=
 =?utf-8?B?QS9nUGI0UlRYZmo5L3lpc0t1bXNqVE5YcXJhNkRwbkhRWFFJallMV1N6b1Y5?=
 =?utf-8?B?SUJwTDdCQ0E0dUYzVENqV2RZbVd5N09tYnd1YTZCNUV6TEI3NE1nVkl0dkhm?=
 =?utf-8?B?QnEzdW5aRENBdXJEZnhJcUdIdjBFbnVvZzRPR1g5eHprcSsrb1hFQWxLSG9z?=
 =?utf-8?B?Qi9OWkpFK0h0UlBuWWtWVHU2VFpMUXJFeWxsR25WSVZHU21ZQTNEZ3BxMGR6?=
 =?utf-8?B?a25kWmRyQ0M5dUZ0QWhLVDlOdzB1WlJibUxZd1M4MTk2VFpEV3BmaUJIMFgx?=
 =?utf-8?B?VlVGZm50Y21VWEtNaUJ3VHJMOW5aN0Q1NHNXRjNMZ2MxcW5MZ1NSaEw0VS9Y?=
 =?utf-8?B?Rldjb1kra3p5NnNaZ1Z2VUJMYys5dDg3c0tDM0ZRcHA1TXBRd2krRGRyaWkz?=
 =?utf-8?B?c1JmQVl5dXlXVllVMmcwaXJCMDVTT3A3dnd5cVFYYmljMjlYSzZLQXdXV1BO?=
 =?utf-8?B?UGlRcW9Na3BXKzZhRmVmaXNFMm5hUWRhbHJBV3NWVzdxQ0NILytmenNvWnR0?=
 =?utf-8?B?TzNoU0N3UTZZV1UwTG4zRy9pbmJ1N1NNYlFGOThiMmkza0tLc0JaOENUSlA3?=
 =?utf-8?B?T3JuOGp5R0U1NnAydmZicTdTY01zdzVJRURpTVpvUUdwWU8wNFRFZ1J0bEtk?=
 =?utf-8?B?dnl1YzZNNjhBOGNaODl6dXVPa2srUHQ1Z2owR3BYSGlPcGFmYXREbmR6RGpR?=
 =?utf-8?B?dlJOYWJkakQ0OVF1ZWVuYm1tSG5IYkZEOUNoWldLNGhyVHNQQ29vQ3ptN21Y?=
 =?utf-8?Q?0NV314lXt+age8m/75+OjdC6X?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcf03580-35eb-47ef-b914-08dcc190adb6
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 03:23:51.5851 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rtpeFMrMTMO1OfCWBc6uv7jRnkI7lVZ6UGRUQclTIWFaC2mdbXEsFaSgXQqrtOSQ8Ewo1T5nVjygftT4oeEczQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6618
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


在 2024/8/20 21:51, Chen-Yu Tsai 写道:
> On Tue, Aug 20, 2024 at 8:59 PM Rong Qianfeng <rongqianfeng@vivo.com> wrote:
>> Replace devm_clk_get() and clk_prepare_enable() with
>> devm_clk_get_enabled() that also disables and unprepares it on
>> driver detach.
>>
>> Signed-off-by: Rong Qianfeng <rongqianfeng@vivo.com>
>> ---
>>   drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c | 13 +++----------
>>   drivers/gpu/drm/sun4i/sun6i_drc.c         | 15 ++++-----------
>>   drivers/gpu/drm/sun4i/sun8i_mixer.c       | 13 +++----------
>>   3 files changed, 10 insertions(+), 31 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
>> index ab6c0c6cd0e2..057dceaf079e 100644
>> --- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
>> +++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
>> @@ -284,16 +284,11 @@ static int fsl_dcu_drm_probe(struct platform_device *pdev)
>>                  return PTR_ERR(fsl_dev->regmap);
>>          }
>>
>> -       fsl_dev->clk = devm_clk_get(dev, "dcu");
>> +       fsl_dev->clk = devm_clk_get_enabled(dev, "dcu");
>>          if (IS_ERR(fsl_dev->clk)) {
>>                  dev_err(dev, "failed to get dcu clock\n");
>>                  return PTR_ERR(fsl_dev->clk);
>>          }
>> -       ret = clk_prepare_enable(fsl_dev->clk);
>> -       if (ret < 0) {
>> -               dev_err(dev, "failed to enable dcu clk\n");
>> -               return ret;
>> -       }
>>
>>          pix_clk_in = devm_clk_get(dev, "pix");
>>          if (IS_ERR(pix_clk_in)) {
>> @@ -311,8 +306,7 @@ static int fsl_dcu_drm_probe(struct platform_device *pdev)
>>                          div_ratio_shift, 8, CLK_DIVIDER_ROUND_CLOSEST, NULL);
>>          if (IS_ERR(fsl_dev->pix_clk)) {
>>                  dev_err(dev, "failed to register pix clk\n");
>> -               ret = PTR_ERR(fsl_dev->pix_clk);
>> -               goto disable_clk;
>> +               return PTR_ERR(fsl_dev->pix_clk);
>>          }
>>
>>          fsl_dev->tcon = fsl_tcon_init(dev);
>> @@ -341,8 +335,7 @@ static int fsl_dcu_drm_probe(struct platform_device *pdev)
>>          drm_dev_put(drm);
>>   unregister_pix_clk:
>>          clk_unregister(fsl_dev->pix_clk);
>> -disable_clk:
>> -       clk_disable_unprepare(fsl_dev->clk);
>> +
>>          return ret;
>>   }
>>
>> diff --git a/drivers/gpu/drm/sun4i/sun6i_drc.c b/drivers/gpu/drm/sun4i/sun6i_drc.c
>> index 0d342f43fa93..f263ad282828 100644
>> --- a/drivers/gpu/drm/sun4i/sun6i_drc.c
>> +++ b/drivers/gpu/drm/sun4i/sun6i_drc.c
>> @@ -42,33 +42,28 @@ static int sun6i_drc_bind(struct device *dev, struct device *master,
>>                  return ret;
>>          }
>>
>> -       drc->bus_clk = devm_clk_get(dev, "ahb");
>> +       drc->bus_clk = devm_clk_get_enabled(dev, "ahb");
> devm_* is actually not the correct thing to use in this case, as this
> is the component bind function, not the probe function. The lifetimes
> are not the same.
Thanks for your reminder, I didn't notice such a difference.
>
> We get away with devm_*_get because it's just a reference count,
> but devm_*_get_enabled is going to be worse, because the clock
> or whatever will not get disabled upon unbind. Same for sun8i_mixer.
>
> I just got bitten by this in an ASoC component driver, but the
> problem is similar.
Could you please post the log of the problem?
>
>
> ChenYu
>
>>          if (IS_ERR(drc->bus_clk)) {
>>                  dev_err(dev, "Couldn't get our bus clock\n");
>>                  ret = PTR_ERR(drc->bus_clk);
>>                  goto err_assert_reset;
>>          }
>> -       clk_prepare_enable(drc->bus_clk);
>>
>> -       drc->mod_clk = devm_clk_get(dev, "mod");
>> +       drc->mod_clk = devm_clk_get_enabled(dev, "mod");
>>          if (IS_ERR(drc->mod_clk)) {
>>                  dev_err(dev, "Couldn't get our mod clock\n");
>>                  ret = PTR_ERR(drc->mod_clk);
>> -               goto err_disable_bus_clk;
>> +               goto err_assert_reset;
>>          }
>>
>>          ret = clk_set_rate_exclusive(drc->mod_clk, 300000000);
>>          if (ret) {
>>                  dev_err(dev, "Couldn't set the module clock frequency\n");
>> -               goto err_disable_bus_clk;
>> +               goto err_assert_reset;
>>          }
>>
>> -       clk_prepare_enable(drc->mod_clk);
>> -
>>          return 0;
>>
>> -err_disable_bus_clk:
>> -       clk_disable_unprepare(drc->bus_clk);
>>   err_assert_reset:
>>          reset_control_assert(drc->reset);
>>          return ret;
>> @@ -80,8 +75,6 @@ static void sun6i_drc_unbind(struct device *dev, struct device *master,
>>          struct sun6i_drc *drc = dev_get_drvdata(dev);
>>
>>          clk_rate_exclusive_put(drc->mod_clk);
>> -       clk_disable_unprepare(drc->mod_clk);
>> -       clk_disable_unprepare(drc->bus_clk);
>>          reset_control_assert(drc->reset);
>>   }
>>
>> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
>> index bd0fe2c6624e..ebf00676a76d 100644
>> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
>> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
>> @@ -507,19 +507,18 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
>>                  return ret;
>>          }
>>
>> -       mixer->bus_clk = devm_clk_get(dev, "bus");
>> +       mixer->bus_clk = devm_clk_get_enabled(dev, "bus");
>>          if (IS_ERR(mixer->bus_clk)) {
>>                  dev_err(dev, "Couldn't get the mixer bus clock\n");
>>                  ret = PTR_ERR(mixer->bus_clk);
>>                  goto err_assert_reset;
>>          }
>> -       clk_prepare_enable(mixer->bus_clk);
>>
>> -       mixer->mod_clk = devm_clk_get(dev, "mod");
>> +       mixer->mod_clk = devm_clk_get_enabled(dev, "mod");
>>          if (IS_ERR(mixer->mod_clk)) {
>>                  dev_err(dev, "Couldn't get the mixer module clock\n");
>>                  ret = PTR_ERR(mixer->mod_clk);
>> -               goto err_disable_bus_clk;
>> +               goto err_assert_reset;
>>          }
>>
>>          /*
>> @@ -530,8 +529,6 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
>>          if (mixer->cfg->mod_rate)
>>                  clk_set_rate(mixer->mod_clk, mixer->cfg->mod_rate);
>>
>> -       clk_prepare_enable(mixer->mod_clk);
>> -
>>          list_add_tail(&mixer->engine.list, &drv->engine_list);
>>
>>          base = sun8i_blender_base(mixer);
>> @@ -592,8 +589,6 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
>>
>>          return 0;
>>
>> -err_disable_bus_clk:
>> -       clk_disable_unprepare(mixer->bus_clk);
>>   err_assert_reset:
>>          reset_control_assert(mixer->reset);
>>          return ret;
>> @@ -606,8 +601,6 @@ static void sun8i_mixer_unbind(struct device *dev, struct device *master,
>>
>>          list_del(&mixer->engine.list);
>>
>> -       clk_disable_unprepare(mixer->mod_clk);
>> -       clk_disable_unprepare(mixer->bus_clk);
>>          reset_control_assert(mixer->reset);
>>   }
>>
>> --
>> 2.39.0
>>
