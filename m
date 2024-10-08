Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A18B994133
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 10:23:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBCB410E492;
	Tue,  8 Oct 2024 08:23:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rCsIdL9O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2088.outbound.protection.outlook.com [40.107.94.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3948510E492
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 08:23:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZUsHVa51hHbLLXtrObwyUfIhbJ0tPS+0X5KJlynM9rWC9N1rlgq6Jd+hoN4/BOkkPI19UiMCBaLSGhr7VgNCvIAtAqudJWKiyMfMu9mgUCTA0ip32UAI/+qBViIZ/6Fcyun8xKiL8U1PC7Yzp8nw+zX0s3WQd7WCvF5ijUsDyhNVNsSwhI52Aqlz+c7GwptwLjqluOfZxJKpFEBQtFIY9bSyS2UZyyaPeQ3DEpQxsBdEZVXkypF0WaQCXwB92USIMjUei1AWi/I19aUmKd5PscJ5Z6/lMqBPLCfivAyiRCYZGIX0MX2zqb884GSa6Ck55v2scw6diklX5fwP37vs5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8MsRsnTpznfv5fdb3sqgaEkjdDcNzhVN8hLW6TWHdYY=;
 b=YuM+/3EBuIlbjfI1IBnuFbQxq5fc7Wh2lU1PJ2u62m/FDi0BAGBnHHDQsXp+RlHt7SlKUN4FRdFiqTA8R4sF/au30OzTrW8jqygjX6pEVPrKLkp0IhCjxIZxrMKDahqx1u4uWkgllB7ms4qHdIBBOISjk55wYaMtM0+5gS2idWUOCR1REh7dtGXOK0Ex9p8DgFCe8+PAj6oXNS7iF1Yy/pcx7lAj0BwwaaQmS8fv2MjQVqNZEPe0lKggGTxK8hEhtOfZEIHD984L8wBIZ2PqkOy1lSvUz1xGGKwuytUkZgrw5edHkG4hdTEQXRhZ/2NvphtcU74uAGdEKpjH0gLorw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8MsRsnTpznfv5fdb3sqgaEkjdDcNzhVN8hLW6TWHdYY=;
 b=rCsIdL9ONnGRCPOlIGejHdmdEp0kqtoYBO9QW7IA8HYlpZqiURRianJ9OR4WoA7tXjLI4IoP2fT52OLoImWCztEjXQ3aSOI3K8tk62IWry+89hMfWTA3qw56vlzhg4Gn+No2IP2Se+MnKSdIRoFhfQjFNN3JNqjaUnSoIQUs9dI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by SJ2PR12MB7846.namprd12.prod.outlook.com (2603:10b6:a03:4c9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Tue, 8 Oct
 2024 08:23:19 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%6]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 08:23:19 +0000
Message-ID: <123f770f-ceb6-4c8c-a065-ace2e02dc65f@amd.com>
Date: Tue, 8 Oct 2024 10:22:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] arm64: dts: zynqmp: Add DMA for DP audio
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Vishal Sagar <vishal.sagar@amd.com>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
 =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
References: <20240910-xilinx-dp-audio-v3-0-75560793f4d0@ideasonboard.com>
 <20240910-xilinx-dp-audio-v3-2-75560793f4d0@ideasonboard.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 3i3l5DA=
In-Reply-To: <20240910-xilinx-dp-audio-v3-2-75560793f4d0@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0187.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::44) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|SJ2PR12MB7846:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a44b2c4-e996-4f49-aefe-08dce77276f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VUIySEpxc0VPemtkSDVUV3BZaDg2UnZNalRHL1poQ014N1lRY1ExSFVaTFRq?=
 =?utf-8?B?QUkzMG9hUWMzaDk5UHN5RUd6RzQ3NGd5R2NLVTYzMnd3Q05PZDNaRW1mM3FN?=
 =?utf-8?B?V1UyVzZKamN2amRhclEwU3ZmbU9xUlNtdXZWaXlRd0lzNTFwaURCcGxZT28r?=
 =?utf-8?B?QnVtaTN3MUhjdTNacFlwZThtakUxZ2Q2bndzcitGaEVpQnB4Tmh1M01yUnBJ?=
 =?utf-8?B?SlR6S09raU94QUhONTB4MWtENisvc1lodkxRRE0vQjVZVSs0SWUxN2loeXNR?=
 =?utf-8?B?cmM1UmFMUmlJcVZZbEFDRm5pRHdIWmhZdGdUcGMzVW9OL1hETVJ1UmUzSTZL?=
 =?utf-8?B?UkdaMXR4MitOZ3YxWkF4bzVmWEhPQWdNMXRBemZHbmpDem12QTNMVTNNeGpr?=
 =?utf-8?B?aFUvbHVHRGR1SXNLRnROMTNCeWplbUJuN3FpQ29YcGZZeUFUQTVTV21BMm8z?=
 =?utf-8?B?Q09RZGRva1dXNFVxVVRxY1VRM1pZcTJicGxaRkt6UzRMS1JEaFZqTmlqU0o5?=
 =?utf-8?B?WjcrN09EUTROZFhWWEREbVV5enFpQWZwVkF6bTNnVzNGejdtU2ZNRnRTK2JV?=
 =?utf-8?B?bXdxZWdKUmVlVzdwRUh2bXcwYVg1aEdXRURIdlk5dmFsQ0trL3lmcGdBd1N1?=
 =?utf-8?B?cmNsUHFUOC9CbDVwUjJMZVpzYVoxRUkxcGt4YkR1emI3MzJmU0phekYyeWls?=
 =?utf-8?B?bGtIb3NCV1RxUUUyZWpGU0xrcHVNQW1vbng1TWhSaUswRE84QlYyTjQ5MGJu?=
 =?utf-8?B?SkFYdUlFb2psNFNiZzl0aXd3VGQ3WjB4Uk5yWWtVQXRsTWc0OG5aWERhWUta?=
 =?utf-8?B?VU84MERqd1hNbjlpbmhYdjhuOEtKcTV3S0t0ZkJ5c1RqM0w3NDhTa2p2WE84?=
 =?utf-8?B?L1hQY2tmcEFaSXZUUjcwWkhocm5XOWtNRmhSQ0FTdzJGbmw0ODF5K1FTeThX?=
 =?utf-8?B?V0xpcmpFU3ZDTStwak90TG9QYnYzVVYyUE05ckhBS2RuTzN6dUpzWHNjb0p4?=
 =?utf-8?B?Zis4aWlKaFJwRVF6Z1FoZ0ErWld6VmxaeW05VW8xalczbno2WDZycU54dkxz?=
 =?utf-8?B?c1g2bzFxU1JNOC9GbHVJQU9FYWNGbDVoaTMzZ3dVRHh6RnBPbjRGemdlRC9z?=
 =?utf-8?B?QVEyeHduc1l0M0d5cHkwL05CUWlHVWk1czZoOGhiVzlTbTZnNGxydmtZUkNU?=
 =?utf-8?B?QXh1TzAzNVl4TnhxTjZVNWZVU0NaVFVUZnVvazArazRYZndxMEhtdFNHWk0r?=
 =?utf-8?B?WTBBM2FCNzF5aE1wUHZTN3h1bDNscXErd2d0ZWNpOWpYS3M0WFVlcHZTaFBU?=
 =?utf-8?B?SFNQU0JtcVZKVEs5cDY5aExRanRCa2h6azZNd0RJWGdEQWxhMUV6a0wrK0Iw?=
 =?utf-8?B?a0pGeWdTcjlEc2lqcldubFpreEFZUHl2QkxQM3FaVW82SU1VSFlmMk1iRGpH?=
 =?utf-8?B?aUFKekM2VkUzZ20wcXZ5Qyt1Y1JOTmpSYnZ2a3U1djd2RzhKblVoVEhqeDhp?=
 =?utf-8?B?Mm9HZis4N3NHTjduQk9FV3orVlZBYUhnRGVnZUdqVkROajd0LzNNaURCWldK?=
 =?utf-8?B?bGRRdWhySW9ZQ3Z2SUR6cWtBM2JtMWZFTFk2VnlWNDh2aWVuR1Bqcit5a2Ur?=
 =?utf-8?B?QWhXU0lBaUthMDRrOHQ0VFhWT1FqTG1OTE9Lc091eFRWNmQ1YktFdExFTWVV?=
 =?utf-8?B?OXBSeHpSeUwxUWFuak5pdlVEMzRwUTdUSmJRQmdjaXllbXhxNTB5cGhUY1NI?=
 =?utf-8?Q?tt9hTEvE+2TtEb1FyHjhqtLndWNdODP6si9871X?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB8109.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjhWQUpoUm1qVEpNWHV0b2E4Z0xRRExVcUhQZ0VDZzZuM0RIMDJhRTRtMzA1?=
 =?utf-8?B?Q3NQaEk0eWdBaURPdmhIR3R4Z0dQN25sTVZGSENNNXRadXc5amd3OWhTR0sv?=
 =?utf-8?B?Yi9HcWdZbWw3bXgxTFYyYVVHVTY2S2hyZDVYZUVoNUJYdnV5WW5pT0szNzZV?=
 =?utf-8?B?MkNFOGJha0VaUmNoV3loN041YnRkKy9rYkYzNEFzb1k3VG43cTBib2tPOGxX?=
 =?utf-8?B?NnBPT1NhTHZRSWUwbzMwcjdGN3BlcVhrOTIyM0M3aHVUNkJ6S2MwVk9NR041?=
 =?utf-8?B?c2J3SnAreHUzYXJXcnBPWEY5eGhFOStyRWw5L2tJeWNNdEhGWTFoSUdob3hX?=
 =?utf-8?B?ZHZlcTBxY241U3NreEttemhLQjdDNDFzb0IrUlRBZitzb0tMVjRXYmQ4VUhl?=
 =?utf-8?B?b3Q1TTVabm5EZWhSUTJORGswa1V6L0hST3YyaUtXTVpkblNCVHZYSlB2NUt2?=
 =?utf-8?B?SzY4MGJRRGVJbW9mbjd5YmE3WWFac3E3ZnpSV0RVeEpiUVJmU2xWWmE3VDhI?=
 =?utf-8?B?SHY0NURHN2VBcnJGQjA0cDVSMElFblJGenllWTdTMjgwenVuRE1GOWRaYi9x?=
 =?utf-8?B?M21GaGRYK0E5TlQwK0hDcmQwbk5kdUFHdkJxOXY3ditjSmdBZXF6Z1E0Y0xN?=
 =?utf-8?B?NEYyNHRCUGIrdDdYVmZKcEVHL3JFajNWN2k5Um53a0JQVndTTXBMYWdBSU0y?=
 =?utf-8?B?QkJIalF0RVZLR3J1QVVoUzcxTStzT2hVeWszTzdFWVpuT0pLeWJmamllOGd2?=
 =?utf-8?B?cWJNK3I3RkU4TkZ4b3hCeVV1b1orUFNCd3lOdVY3Q1Y2azNNcENJdHYxdEk1?=
 =?utf-8?B?WFdLWlVlVFlMby9udmJJT3l4bThqakgwTkN2WVpFSjZBYVNKZHFGV1ZlQWx1?=
 =?utf-8?B?Y2l0bXNLWDAvNSt0TTIyTVdLSWZsZklXc2F4MWlzZ0xOdnBlT1lLYzA2Vzhr?=
 =?utf-8?B?TXFrQjBQTWkzQ2g4Tm9Ua3NKamwzSk9jWU44VnFRS0diNmtGZVFvaWNpU3U5?=
 =?utf-8?B?bFYrdHJCQ0RXYjlheU9DQmNVUDAzVGNkcUtjMk9DREdrWW40TElnb25jcXdv?=
 =?utf-8?B?MjZCZmpubXo5RmNZRVJCZ2JOWHZpR2tmdHNGQnkwNm1tS3NISlRkUzJDUlgr?=
 =?utf-8?B?MTJ3UUlYUWh1TXA2T0NUaGlJbUtkWkN1Q3FJUVA5ZzFFd1UyVHpYNDJoQkRt?=
 =?utf-8?B?Q1RIaU5saklaTFZVQ1QxcE8zMG1xVG9ubFVXL0lJSWFWOUtOUkxSdmFlOWo2?=
 =?utf-8?B?VVpvQnZQZHdyRkg5ZERMV08rMkpraHlGYW5FenNQYlcrZVd6dnhMc0paUDRn?=
 =?utf-8?B?VHB2YkFKbjJTT2Zva25KNTc3RndFNGVkbkpocW94YWZnWCtGWHg4Zm5ZNDRi?=
 =?utf-8?B?aU56ZDdTenZ0WS9VN1JLRHYxdjR1a25lL0REME0zSW4yQ1RrVFprWWNWRFFP?=
 =?utf-8?B?WE95aVQyOFJWQjRYSWZZQUFqY01nVkhkWDVpODU5UjhuSnBCNDVQcVRMNk9r?=
 =?utf-8?B?T3ZsNGlCVThKa2ZPTkRMNXpLOUw2bzZGRDNxbzl0U2lWRWRtYUdhOFF0Ynor?=
 =?utf-8?B?bGs4SXpDZ3Q2RDA2NEFSVENlQm01WjF0c20wL0dXSWJ4TkJuT2N0QlRlZm5M?=
 =?utf-8?B?Q252TTBuYWIxa0tkdi9aUFhabWdDcmVHRlUxVHczSjh4SDdmZzBOOHQ2TUQ4?=
 =?utf-8?B?VWlrL1BZMzY0MUt3UVk4WVhaM25SMFdLa1dKVXJPdWlidDJsN0REZkwxZ2VM?=
 =?utf-8?B?Wk54VHBDa214UnpmTFBCOUk1bzNpMEV1UWQwZ09TZlUyY0RiVlMrdHRiR2hS?=
 =?utf-8?B?MEsrVU95dXB2d3B6djBtZGl0bmxEVklxczFFb2laOUpFQ1ZmdnFMdG41d0JJ?=
 =?utf-8?B?WlZoYTMwWDZ2NEFXSkFqUFovOEsyTGR5ck1IeXljUy8yalBkSzRVb1YyUlRS?=
 =?utf-8?B?MklrZnA1TWxXRTh0aVluR0pKeFh3bEo4RHpzVXNaYnVFaWJ5MnhwOWJkSFov?=
 =?utf-8?B?UEJ3cTRmNjBVeGI3WVczcGE2TEZKR1lWVHF0Y1ovSDBrSUN2c05PL1RSNnhI?=
 =?utf-8?B?S21uL0RQa2N5NzlSMUxUb25KNE9obTYwYmN4aHpZSlZqNWE3NGlHVlIwRU0w?=
 =?utf-8?Q?pNYR81fjppY/arhxoR1Z59C8c?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a44b2c4-e996-4f49-aefe-08dce77276f9
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 08:23:19.0551 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WUuDJOCPkV+Y9mVWTZbfMPXG25YCclOWLhYP3QyZ5NA9hT+utqNP2fREtr/LdTXY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7846
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



On 9/10/24 13:19, Tomi Valkeinen wrote:
> Add the two DMA channels used for the DisplayPort audio to the
> zynqmp_dpsub node.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>   arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> index b1b31dcf6291..673ca8422e6b 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> @@ -1207,11 +1207,14 @@ zynqmp_dpsub: display@fd4a0000 {
>   				      "dp_vtc_pixel_clk_in";
>   			power-domains = <&zynqmp_firmware PD_DP>;
>   			resets = <&zynqmp_reset ZYNQMP_RESET_DP>;
> -			dma-names = "vid0", "vid1", "vid2", "gfx0";
> +			dma-names = "vid0", "vid1", "vid2", "gfx0",
> +				    "aud0", "aud1";
>   			dmas = <&zynqmp_dpdma ZYNQMP_DPDMA_VIDEO0>,
>   			       <&zynqmp_dpdma ZYNQMP_DPDMA_VIDEO1>,
>   			       <&zynqmp_dpdma ZYNQMP_DPDMA_VIDEO2>,
> -			       <&zynqmp_dpdma ZYNQMP_DPDMA_GRAPHICS>;
> +			       <&zynqmp_dpdma ZYNQMP_DPDMA_GRAPHICS>,
> +			       <&zynqmp_dpdma ZYNQMP_DPDMA_AUDIO0>,
> +			       <&zynqmp_dpdma ZYNQMP_DPDMA_AUDIO1>;
>   
>   			ports {
>   				#address-cells = <1>;
> 

Acked-by: Michal Simek <michal.simek@amd.com>

If you want me to take this patch via my tree please let me know.

Thanks,
Michal
