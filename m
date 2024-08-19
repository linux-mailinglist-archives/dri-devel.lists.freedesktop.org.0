Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D258D9564C6
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 09:37:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A41DD10E1D5;
	Mon, 19 Aug 2024 07:37:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="jSvGNyTm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11013060.outbound.protection.outlook.com [52.101.67.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 472C710E1D5
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 07:37:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vBEbbO1oHc0LtoSEPxif71cba7LEDTmnAfb3TEABnfLxHSFT1Ae8Vrk8sKidSx3ZNpzNS0pzCsrUhJBLdcW8wa9Dlix0ocqA64PJ3TfpmeRy33wDiCvZRoBUjux2oCa0zk/sGyhpDGFhZBzUXpkpx3Pl78gsXjrgTqtmOQQ4lyxbCaY5syDjszQHNRFA1SHyme3ldESETy3tD+EhO5qTCTA3mssR5tfxV5cMnytVCb1XqgS+nDmXPr4UC8GsTsX1rGrI1CpdFQruOf87aAacDIPik8RwOMs2Md2IEmWjx1bg9ssz180Yw7i7Cn+6bUCpbtd7wU7Cjcpt036hRwYAGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WuFy+PjDqnW2kaUVwYN0erRTCW3dLAw7u8hXUXpRkE4=;
 b=o3pX7qKYH7ocmQ+2Pyw8JGy5b+TQhYmGds+Jf0bMr5TiPfLO5vhxFuEar+8PxFrSknWs5Qyb21IG7+TJ85dohWzq++K5ZDvhwR2Ry0LDpJSLSQI8bHd26PEdY7YLKMtBK/F0pEnwMGowUth1hEReStk/E+mWUubzTyYmvN4oxfhy7A1lUuKmJ6dU9WeiEum/ZCGt3qlbw8EVKoLDdrQ0++SFXbxtP50EC3D+U7BQ+o4Vh1FTXIpgaa6DhvoI33W4CuJYWqWrKOZbLZrhFdXOErrypdNX4rac02ige/CJ1FP1SUrJ7cqK8YTgF5SGBKN9VufpuHqtxvoA7a2xXNPDmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WuFy+PjDqnW2kaUVwYN0erRTCW3dLAw7u8hXUXpRkE4=;
 b=jSvGNyTmx/9NNxi08PuZuXMTRutq43+0YBF4qvCwntGYHXvcfnKHzbBqEldk7lbwO1RBRWJR4F2txutLYL/6rSmw+Tt21nW6ZonSDlirenllhnpuLI0To9v5/YlipeMxb9mEFNjJWdAXRvw6Qy+nBVHnBoHFF3CAp3upI1hz1HtmbJ7BEaQs8lgeFkDETlDhmQu4ZHwoIA43QDfD6Dywpx0rfe+AHKuZt/lFvqST/Wm7cQtuh0XCFxsA9O8FjCFsNn4Sp1Yqynil4LWNAZTktejStR/BVK4xYGPY0Ldo/+ag5bciYNb1YKl56QDqEvCV3Epv+fz5c4Rh6acrVacucw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI1PR04MB9809.eurprd04.prod.outlook.com (2603:10a6:800:1dc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 07:36:51 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 07:36:51 +0000
Message-ID: <d5558c70-ca9a-4a68-9e88-9efd353d1250@nxp.com>
Date: Mon, 19 Aug 2024 15:37:14 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/19] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller command sequencer
To: Rob Herring <robh@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 tglx@linutronix.de, vkoul@kernel.org, kishon@kernel.org,
 aisheng.dong@nxp.com, agx@sigxcpu.org, francesco@dolcini.it, frank.li@nxp.com
References: <20240724092950.752536-1-victor.liu@nxp.com>
 <20240724092950.752536-7-victor.liu@nxp.com>
 <20240816223710.GA2394350-robh@kernel.org>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20240816223710.GA2394350-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SG2PR04CA0189.apcprd04.prod.outlook.com
 (2603:1096:4:14::27) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI1PR04MB9809:EE_
X-MS-Office365-Filtering-Correlation-Id: f0801cab-b395-49d8-49de-08dcc021b0a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MS9mR2JEVjNpTUtVeHZOV3lkZHRQNHZiTzJGYnVMT1lCUUtkSDFBRlNoR1Uy?=
 =?utf-8?B?MnRyNkJveDNxNHIzeHVUT1d6aVRUNWdraVo2NThMN0dndUxtUnNsRmFlTzhI?=
 =?utf-8?B?czhhamNOMkZ0bklXRUZIMjAxNnJoeHdPYWNaN2VDeFd1RFVVSFNZWlpuRllI?=
 =?utf-8?B?ci9qdTE2MmQxYXhnUktwTkNZTTZuY2pnc0ZLODdGS0FxQUNqa3lGbHNtYjVY?=
 =?utf-8?B?Rzh5MCtOVkdWL2xsVFVhYzdlazVrcndQQjVKRVV3NzBORWs1OVY4bnlPZzht?=
 =?utf-8?B?YTcwK0dtMXFMQk5JdFZoMEM4Zm9HN0VVUHBwSmxzQS9hTGdCMHFvMDUvYThk?=
 =?utf-8?B?b3FsclRpR0o4dkpDSXBJMkY3NGFBalYrcG5rM1lKNFpJK1RwTnIwKzcxVU9N?=
 =?utf-8?B?clM1blk4WXIwQWJwVW1YbThVU3hMaHhGSnBxWEJaSDh3Q2RqaXp3dDB4L2pI?=
 =?utf-8?B?WmNsRHcrbGU3SkNkZk9BSk5YOGFwdnFIR0VGRWRaZW5MYjYralhQdDE3STVw?=
 =?utf-8?B?S29KYm82MHp0ZnNHS1VKeUdyMXNjR2l6bUlLay9qbFpyUDMxYWpCbzZBSzEz?=
 =?utf-8?B?SVBwUHpNMmhxVkFLRERRUjBQMThWWHE5OUd0ZTY0ZjZWdndnbDltSzR6TG9j?=
 =?utf-8?B?R014dUF1TlQzd3QyVDRQcVgvUUFBQ3JodEt2R08rYnVleHBVVCsvVVM1V0k0?=
 =?utf-8?B?S1BYVHExZ1NPNWlUcTE3OWhyTjl5OHp1V3dKWk05aVlkZmgvRTUrVWJUVk5R?=
 =?utf-8?B?NzVCVE1zK3R4RXhhSUZ4YU01aitPMFNydjBZV0FKK2lhK0tCbjZNa1htOW5u?=
 =?utf-8?B?M3UwYU1NRm80SWpUb3ZUdWc4RDI2aTB2b1ZWQ0xKenlUS0czelpiZG9QOGNI?=
 =?utf-8?B?WmtONWpSZENiTXhNb1hKdjZpS2J5MkpYcmpycnp5b1hobERxMGE0emlwUkds?=
 =?utf-8?B?TkpPcXF1OU5LZTRWR2JESCsyZGsrUVFuTXpCK1daQ2ZZdVduaExtdXR1VGx4?=
 =?utf-8?B?Z3BNWnhKVmdwNTBBb3crMWJza0tNMk5sc1dRYkFLUTJTRGVHQy92dkxnSG5z?=
 =?utf-8?B?RmtMWklyV1AwNllVaUVPcGVlUmo4cUpVdWtmNTVYSHVYNTVXUzJkVENBMWMr?=
 =?utf-8?B?WlhuZ0o1SzlRY3JpSW9IRUFZSXlTWlpHS2kzM0VuUlNDY0kxUGkxTHh5YVFi?=
 =?utf-8?B?U0hSdUFnUWdxU01yL2ZVcXBpd2RHWTRHaXp1NStEcWlFZ09OdERRV2UzaUNv?=
 =?utf-8?B?L2J6SEl4SjRLUzloYU90dUZ0eHg3bEVJQ3NHTThkT0xJd2FBenhTNWsxMUE1?=
 =?utf-8?B?ZjVJMHF2aUJLM3hkenhDK1hBQ2NqcUhFRkxyQytNbkg3S3NXQjk5c3BkUmw5?=
 =?utf-8?B?YzduWmhQYXFSSnZ5SDc4NktZV1luSkpla00vNVV3WGxuQ2J4M1Q3dWtlQjY3?=
 =?utf-8?B?cys4ZjJqQUFmaWhaUFFsdW94VkpNMnViWlYzTGFtd01JQk9MbU15QVlEYTNj?=
 =?utf-8?B?ZmtCVlFqazk5Vk1PdDJneE9SeU5QSUxyZzNMVzBYR3JLUkVBNld4QkwrL21Z?=
 =?utf-8?B?Zi9vaEtFd1phYndBOVN4Q0xMN3U3RFlSSGdOUzhUSm1ISjgyblR2K0UvMzJk?=
 =?utf-8?B?ZDNGemVQb1RpLzhwaDdNK1BZY0F3MEp2SDkvRnhWSTlscUhnRnZVQndqbkxB?=
 =?utf-8?B?YWJYRHFTQ3JENWxYeE4xVlBJQldlU0R5dkQyWnhocXVYNlZwMU9VWkJJWVVG?=
 =?utf-8?Q?G1rfXk3WWqLozpMAfY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFYvR2dHaUYxZ1ZnSDZGcmNad3pWMEFJMFR1OWsvOXE5RWVRVno3ekYvaXpR?=
 =?utf-8?B?N29qcm5XL3lUenRtOHZienppYnV1V1ZlZ1dQWlJZcEtHTWphY1dPSGsxV0Zp?=
 =?utf-8?B?bXNBOEhWbDN2VGducmJZK2JsdlpmWTlGQmlnQzZycDlmZUo0VmxiMlhIRHNl?=
 =?utf-8?B?OGoyVnorOFlGSlFhdzRnUC9Ma0JVNmlhRDVxaWI2MHlRQnZTRXVWRndqUVFD?=
 =?utf-8?B?OXZVQVpHZVI5bGNIOUNSUCtzYXdjZEkwbGtZZEVxOHBJU0RmdG8wM0Jta2Ey?=
 =?utf-8?B?bGk1UzZFYjlVekFVeFVUbkgzK2pOd0pCWndTMzU1TFRBalRaUjVDeHdyRFRO?=
 =?utf-8?B?WWtrQmtsaVhyOGlFTFQ0M2d6Qks2MmFRaDFpZ0xXcjZsaXowbUhTOURzeUdG?=
 =?utf-8?B?Q2VVTFF5Tlk1S0tWMVRRZWVjczdZalJ0Slk3dGEzallKdTBreCtOMmxCTXlh?=
 =?utf-8?B?ZXR1czNCdTFsWXNLSUxkN0hxdzgrZlY0ZmNKbHBCdUxTK0Fzc2JHRmE3N1l1?=
 =?utf-8?B?S2ZIKzU1b0h5Z2FWSEJvZVZCMFlsNXpRK0Y1VC9Bd3BBZW5tKytWYTRBcUp1?=
 =?utf-8?B?ci8yWExSZVo4Z1RTRHFka29oZEFuKy9RZ2pIem53K2Iza3N2Z3FmbjBkd29O?=
 =?utf-8?B?QXpjNmZqempDSzRERytNSHlQMnRPOUU4WUY3bEpEaTF6MmI0b0tWVkZ1MU5W?=
 =?utf-8?B?QjBXamVmSHFDL0xSam1qSG5ZUktxa0ZVamR2RHRSdEw2L05BOXlqY2RlQ2Ir?=
 =?utf-8?B?bFVIeDg4VHFxVmZRTS9SdGxiNStsc3lrc29lNW54dnRRZHJrenpXS09xdkJy?=
 =?utf-8?B?dXRheHdHcFZnTFBOSUp1bU5ORnNIR0drZmx1Q2VFWFZxY2dsZnFWS0p1ZFdN?=
 =?utf-8?B?MGU4Qk92eVhXL0UzaG9wdDF3bGF2N1daTUdmREhyTHMzL3ZaVDNRK0YyT2JX?=
 =?utf-8?B?c1FsQ1N3Um5kdWo2UFUxdm9rR0NVS3QyU2FhZEtDdUYyaXIyLytGSE9KVE1T?=
 =?utf-8?B?MG90NTByNi8zUWZLNVhyTmJ6TXlmTVBIdktha00rWDU5ZW1BblpFNzlkc09I?=
 =?utf-8?B?TGV4cnJCUndIK3AzL2R2RTk0U3pidTd4TWE3Ym13RU9oQWl4dzVjdnV0bEJy?=
 =?utf-8?B?dUphR2thN1ZlUEdYdENKUk44NnE3Yk9hNTZhNWliVkxCUjBvdzZ4d2ZHNElN?=
 =?utf-8?B?S1ZFWGxNZnYzYVhsbW55RWp1QmxCU0RybWlTaVg2Ly8za0Q4NnIxbExkcmZr?=
 =?utf-8?B?T1hicTNoZXkwOEU4bkpwV2RRSGNCSzM2eWdLOUNVVG5RSkNMMlRYSXNDZ3R3?=
 =?utf-8?B?QlRsbnNlZjRidWlOQnZqTGQyTWZpN29uYUNwaEV4V3JLemwwdzREYkttVHVo?=
 =?utf-8?B?YU1oQTVVZWJxZDAvOEErenRUSUtmWjBHbnd4Y0VOSkJmWU1KcmwweVdEY25G?=
 =?utf-8?B?YysyL2Jpa09Wb2o3dFJxd2MyWVVNZCt1aWN4UFM4LzJrNSszOGNZcllSRFFJ?=
 =?utf-8?B?djB2c3ljU1FTTzcrZE1qc0M3UjE1RFlZa2gwb3hsZGxQLzJmN2JrYkVxNXBh?=
 =?utf-8?B?VmZNVm51ZXBVR2dadWtEa3pyTjd1YkoxR1lMdEJXRVlLYnEvdCtXYjUxQ1px?=
 =?utf-8?B?c0JtSjlRa3JQK1dNOWc4Z2dmZjlTS0xldm9zNmN3SHdNcW1MWUEzekJObnhX?=
 =?utf-8?B?bzVrMTVmRmNPZ21zRUJUaDc0SFM1QndJUVN4d3ppb3FKL3MrbEtXZE05WTY2?=
 =?utf-8?B?dlU2ekdIVGFPTmhqY05iOEJQdUFUQ1J4aVBpR3piZGx2MjhRb2NTSHdLSjly?=
 =?utf-8?B?SG1wQnhGMjFEWkpQTVYxbC9IbGMxWVRyeGRVRnFocHJKc1dLVUMybDVPTVZX?=
 =?utf-8?B?OTgwZE9zayt5OVFEamwzcGdTYjdHK3NFbGJYWnRGeVRVRzROSVdOaHFMMks1?=
 =?utf-8?B?eGgvbllab0hVMEt0SXBNMHpVOTViaEc1Nm4zZTU2RU9YK2JTWW1jaGRKWitG?=
 =?utf-8?B?UUtnME1LeDlnYk9sNlFJeGZ0UU5la09xMW5lR2NqRDhpN0lQQlE3bkMrc1lM?=
 =?utf-8?B?WnFCM2x1aUpZeDJ2VVBFeDZVV3h5NnM4VSt6UmQ4eElDeDlYNEhmaVlld1pT?=
 =?utf-8?Q?YzS+QbV9x/JrDh/8jHYXMSz52?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0801cab-b395-49d8-49de-08dcc021b0a4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 07:36:51.1488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R5JFPSFEL7pSuD7KPfY8Xq05Sg3DiGAEypHYAs1HGKxCq4miwMvTe5mOODCCCLDOhL5bftogWLsVUHcNfYNyuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9809
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

On 08/17/2024, Rob Herring wrote:
> On Wed, Jul 24, 2024 at 05:29:37PM +0800, Liu Ying wrote:
>> i.MX8qxp Display Controller contains a command sequencer is designed to
>> autonomously process command lists.
>>
>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>> ---
>> v3:
>> * New patch. (Rob)
>>
>>  .../imx/fsl,imx8qxp-dc-command-sequencer.yaml | 67 +++++++++++++++++++
>>  1 file changed, 67 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-command-sequencer.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-command-sequencer.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-command-sequencer.yaml
>> new file mode 100644
>> index 000000000000..2e0e8e40a185
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-command-sequencer.yaml
>> @@ -0,0 +1,67 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-command-sequencer.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Freescale i.MX8qxp Display Controller Command Sequencer
>> +
>> +description: |
>> +  The Command Sequencer is designed to autonomously process command lists.
>> +  By that it can load setups into the DC configuration and synchronize to
>> +  hardware events.  This releases a system's CPU from workload, because it
>> +  does not need to wait for certain events.  Also it simplifies SW architecture,
>> +  because no interrupt handlers are required.  Setups are read via AXI bus,
>> +  while write access to configuration registers occurs directly via an internal
>> +  bus.  This saves bandwidth for the AXI interconnect and improves the system
>> +  architecture in terms of safety aspects.
>> +
>> +maintainers:
>> +  - Liu Ying <victor.liu@nxp.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: fsl,imx8qxp-dc-command-sequencer
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 5
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: error
>> +      - const: sw0
>> +      - const: sw1
>> +      - const: sw2
>> +      - const: sw3
>> +
>> +  fsl,iram:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description: phandle pointing to the mmio-sram device node
> 
> 'sram' is the standard property for this.

Will use 'sram' in next version.  Thanks.

> 
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - interrupts
>> +  - interrupt-names
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/imx8-lpcg.h>
>> +
>> +    command-sequencer@56180400 {
>> +        compatible = "fsl,imx8qxp-dc-command-sequencer";
>> +        reg = <0x56180400 0x1a4>;
>> +        clocks = <&dc0_lpcg IMX_LPCG_CLK_5>;
>> +        interrupt-parent = <&dc0_intc>;
>> +        interrupts = <36>, <37>, <38>, <39>, <40>;
>> +        interrupt-names = "error", "sw0", "sw1", "sw2", "sw3";
>> +    };
>> -- 
>> 2.34.1
>>
> 

-- 
Regards,
Liu Ying

