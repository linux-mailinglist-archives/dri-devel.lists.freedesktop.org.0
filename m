Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 567669D93B3
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 09:59:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74A1F10E410;
	Tue, 26 Nov 2024 08:59:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="D7qQw8JX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11013013.outbound.protection.outlook.com [52.101.67.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 181AF10E410
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 08:59:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SdD0R0JjxbgPPtWDlucgL/I9zF9RWxPUJvHnuQ2WX3bMHJjhKXTmVD1Oite3TizuIcXRSxQk9P1qw0SUYQgMTYr8AWgdtIrix16XeyAGLEEb/tz50akbhxfR2LPMxPTTJlWRlFkMVaX/ixXoLKaIKfI1CxpM/qPzSC3Mob6Zb2xzdhs105EQAtU8mC79vIAXn5qQuD8ptD6o5lG4M0swzmgSQpNXKtBux8zSqPlGl2VYXrdkmmMlKskpy11hhl5pWQLvOUNzkXZXJskynlfvpxOqQhR9SMnj5HevXoMZhVS1UfS30enLdZfdT+WAblsYtHf08i11q9EvRYduWa6wrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jAEFLAERLlnYXJ7vH9vlrtT7CE4tTpenfdxjauXKzpk=;
 b=NlSkBjdUxc06SwJ2eLM5TvgjYGnmMvNaqFDMxxm+oDjlwePolVrq/1dPhexSc2o4oRx0C/t8pgQI5fP1QklcyYDABCjL6pd+UEDE+Pf4yfXCrw/sJoObQTuCKrOKB+95+03i7jVi1idbdXDOlmfdrEFPtiZFO4qhQXpghtGcyhNfF54vFYgQ+H6AOBTykoHil9XMUEjAK71nvEA7cuDIuPERG3958ZOeUJ2Yewz7GW+jFM+GrjKz/k0EF+0jP0HjpK7c41V9SePSh4fHO7SiLiefg70Cyj0Cf2NL9nfF3L3oeNsb06zWAIT3v1tZeeJNYkP+9weerxaiWwgu8Qyqeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jAEFLAERLlnYXJ7vH9vlrtT7CE4tTpenfdxjauXKzpk=;
 b=D7qQw8JXDcaCSdrKz0PDssX122210zOfNOD0rtcyCUveHC6RbU8WMcotUo42jMvrIvCEP2+/DXSLyN643sJzUcYLfKKlUy4lYpmLe62VbutjwB1+Tzi9L4GTCfokHZe2Ri5NkROlghe/vCY5WQyXiu/vVkgKM6wJgjoW3UZxEcUSmgiwQgmspPuecq9ZcKXxqU40ZQq9urdhDBRO5UZXNSTLisWWk0OSgD/xrN9k301FuoysonkTn90X6th0iHUSMBVG5zOos/6loKpYIIhlrBFNcz/emVUccB0SW/hgnXLOJFieZarOEhOI6gy1jjgJrZ3xOja4ALjnD9Aey7wDdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS1PR04MB9630.eurprd04.prod.outlook.com (2603:10a6:20b:475::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Tue, 26 Nov
 2024 08:59:36 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 08:59:35 +0000
Message-ID: <43e266a6-411e-488d-a387-873ed874f32a@nxp.com>
Date: Tue, 26 Nov 2024 17:00:06 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [DO NOT MERGE PATCH v4 16/19] arm64: dts: imx8qxp: Add display
 controller subsystem
To: Maxime Ripard <mripard@kernel.org>
Cc: Francesco Dolcini <francesco@dolcini.it>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 p.zabel@pengutronix.de, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 glx@linutronix.de, vkoul@kernel.org, kishon@kernel.org,
 aisheng.dong@nxp.com, agx@sigxcpu.org, frank.li@nxp.com,
 dmitry.baryshkov@linaro.org
References: <20241125093316.2357162-1-victor.liu@nxp.com>
 <20241125093316.2357162-17-victor.liu@nxp.com>
 <Z0RXCYZ_7fBvpcvd@gaggiata.pivistrello.it>
 <d004dfe7-d019-4f53-8373-c8c4e031748c@nxp.com>
 <20241126-overjoyed-futuristic-saluki-cb6cc7@houat>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20241126-overjoyed-futuristic-saluki-cb6cc7@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR06CA0213.apcprd06.prod.outlook.com
 (2603:1096:4:68::21) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS1PR04MB9630:EE_
X-MS-Office365-Filtering-Correlation-Id: e3561cfd-12a5-4d5a-c64b-08dd0df8a6ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UFZDNy9LQ1ZtNmx4N1dFeDhmVngxZkI1cDR2M1JjVkR0blhXVHFhV0ZHY2pk?=
 =?utf-8?B?QzBPd3pEcW14MHN5dlN5bFlQVGtua3hmM2RzYzhEQkZXZFZncHJMSktvUFN1?=
 =?utf-8?B?N0ZUVVRLTUpXd2NURUlwMFRnZjZwSTFyRFlLYjE0eVNIcUJVL1RBYkFGV3Nw?=
 =?utf-8?B?UDkrYy9vNGgrL3FLeS8rajhzaUJTaXZXOUJPbFRaWXYyOFhHQ0djVjFBdkVX?=
 =?utf-8?B?UlpUL1hzT0FNam91dFZvcXBVcXI0STJRS1puZEgxd1JzZUNiR1Q5bW9qQ21s?=
 =?utf-8?B?WlBBN0FWanR1aWIxeG84akJqam9WQzcyUUNvOXJ2dXppOWxlOTVrcE9FRHRq?=
 =?utf-8?B?b1R1aW9ycVhvQ1BkSlNNaWpoYlFBaURMSzRJelBKQk9hZi9vREFhOUhEQ0Y0?=
 =?utf-8?B?MUVmQzlZRmtYNmJtTC9LdUo3MTlzZEwxcHY5M2w2ZU95Uk80M0xJOXRFRjFO?=
 =?utf-8?B?UjlGc2Z3WTF3cDhGc3RENzF5bVN2UmxiSTJkMjFuRDdQb1l6dDVxVWhCSURx?=
 =?utf-8?B?MUQ5ZmxGN1dVU0ZKcXBranBqUVdzSFBpU3hrK3NUSVdUNGJYZys5M1N0QXBP?=
 =?utf-8?B?Qisvc3F2NmQybGducGFhZGU0eld6cVJaazZ6M1M4ZmNsQnl4Sk56TkIwWCtW?=
 =?utf-8?B?cUhZYi9Ia2tlUzJnSk1ET1JkdlhtaEpJazlENHFOZmdZN2xRakIzL1lBNXgz?=
 =?utf-8?B?WnpSYVV5MlYwd2VZV1pRUEV4TmFBQm1LSldNUTFaZzNndHRpdXZnMjhTTjdx?=
 =?utf-8?B?UVJxMlczcU1USjhsbWppb1plWjZJZm1DNlE4YWV2NGxPeGQ2N2M4UFQ1Uml0?=
 =?utf-8?B?NkYrdTlIbUNjcjRtZkYvOFlUTmRVQjhKRGpKck9JYlNBTFBUVUYxREVmdjd0?=
 =?utf-8?B?Tk5RZlFKUjF0aWtpR0grSE9sK1dPWUwydFpmS0poeHM2VkZpTWZNdk5IbTBp?=
 =?utf-8?B?T3ZXMVVmc2ZyZXJuL2V6WnBsL2dDRkU4RVZMd20zdC9lRlF0M2VSSFd1bjBr?=
 =?utf-8?B?bGZadk10RFNzMlpHMWRxbjg5S2dFc0xScVpsNFBINCt6aityNldha2p2RkNO?=
 =?utf-8?B?OGZtaEJaVWNORmYzNWtnUDlSeVJWOEs4WGlhODMrSlFYRHQvNzhLTHZwU2Fo?=
 =?utf-8?B?TGpZNXA3Snd3bnZHcmZSazFTQnFNQm8yWHc2WVdPYzZwYlhEZkpTdkx2S0hs?=
 =?utf-8?B?L1JsMnlmVGFYcTRuaDVHODMyM3pjWXhLRlplYVM5RVJMOHRLL05yYnRpUkFz?=
 =?utf-8?B?cTZxU0lBTHNJMzdjTmt6S0hVUFBmNHc4K1pONnF5dzNLRWdJQ245cXFTTm5h?=
 =?utf-8?B?K0Q0V0FJRmljWTZPUVlURVNrVzNxZW04cENHN3dPTEw3eWVqeTJTekszRWpv?=
 =?utf-8?B?U1B6bWZqMmp5ZHRZdEREMm9pTWtUUC9JQUhrTHBuTm9QQ0g2MlJQbk9XWitW?=
 =?utf-8?B?UDRYWHViRDM1VVBTL2NCUGJ2NlpBdHdpbnRzajZnZnZ4NnZ6TmJSZVRLVHpX?=
 =?utf-8?B?ejNod3VNRDd2d0Q3aWd5TGNEMFNBQVd3QS9ycFNYL21yTnl6WHYxellXS0h4?=
 =?utf-8?B?WGNHcVFOOVllMlV4RzVrRitPUmFzNTdxVG11c2NJSjNZaEw2U1hHZHJkSC81?=
 =?utf-8?B?WVJqUDlpN1VrZlZuSGVQeFpzU1VOK1MycXJLZVNpY0VLVGNmeVBOZDQ1cXFV?=
 =?utf-8?B?OFA3WTMwdEFBSXhncnpYWW05dCtyMkhTeCs0aTIwUEFwVHZqSjg5bE1DZXBn?=
 =?utf-8?B?Vkw0TWlJNUp5Si90ZE9CazFldlU3RElOK1lyWEJibzFQUkloMUIwb3ZrOEVQ?=
 =?utf-8?B?NDNwZVRhL2s0c2NORmJRQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0JCUXlOV1hFNEdhanJJT05ibGtseWdKKzV0ZXNpMVQ1eC9sZG14dVYxa1Nm?=
 =?utf-8?B?dk1vU21LakFrVEhKTkZzL1NMZUVLTk9vTkhmOVJyQ05MM0N3bUFoeEVSRTNY?=
 =?utf-8?B?eXVnbnBWQ0VCVm9HNXR1ejR6U0RVOXptOS8xS1A4cFNHeGtrUkZPaXJxYnVv?=
 =?utf-8?B?UklyeDR6MENxZDczeUR1VGNFZUE5NExPUHROSTl6c2R0ZjIwMllUY3VaN2Yz?=
 =?utf-8?B?bzgxTkN5czd5WDJkblo0RElRZWkzV1ZKYzh4a2JQK051TmplKzI3RTVSM1hZ?=
 =?utf-8?B?UlkzUTdzemRVcmx5VUtmdWVxY3ZXQnFqNWliS3lQRjZZMUhpZHVhM3c4Q2hi?=
 =?utf-8?B?YzJSZ3hLVGFXUTFWeC9vUW1Ga1l4TG1mQ1VmSmxkMVkwck1CSmVUYVpRS0lO?=
 =?utf-8?B?MnZQOVY5cVVWV1htMmVmRHBiV05SUDYvZ2hvZ1oyd1ZDV0g2MjByYW9DcFVz?=
 =?utf-8?B?NndHRDBTLzB4dFNQR1A3UXJ0OWVvWFE5TTY2OHZXVjN3UEJ6WWVBOWJ3bmdY?=
 =?utf-8?B?emR5Zk1TeFpEWnpYTWg1bEZEMGhkdmRNdXhtbGtySlVIS05ZaXJlNFdKaGVk?=
 =?utf-8?B?bmQ3ZDhCd2M5djdyQW05OG9tY1pXMklnaTZrWllrbHpjYWUvVHREZE4vam5W?=
 =?utf-8?B?WTFhNmg4Y1M0ZkcwbDRldks1KzlGMGlGYTBmSllUTlJ4R284TVdJcnhreTla?=
 =?utf-8?B?UVZmSWdkVVNQT0tnR241eWcvVXhUVysySlZnNjEvYjJkQS9IbVdIajdkUTZW?=
 =?utf-8?B?SUxBSDNZS1JzOEZveFRHbU1vMmlrSTBaTTlVMll2VVRzVDY0VFFLbzRyVjZI?=
 =?utf-8?B?NHR1L282ZmNqL1Ria3F6c1dvQkMwbUorcUxlbzRnTE5DS0NqQUZ0Y1U5cjdR?=
 =?utf-8?B?bjE5YllRNFRLMmZ6VGV6dkhucVYyRE1LZ3VWRDB5VC9NUGtkNnd3alZrNkxo?=
 =?utf-8?B?Q0hVc3R0ZEJyZ01kSXBqcS9LUm14Zm13NkZUemtEalpLNnR0TzN4cWtEV1Fx?=
 =?utf-8?B?dmtVWTJmc2k1UE1Gek9pQldYMktRNGFKUVFFN0QwL012bDI2ZzdXc2VTYlZw?=
 =?utf-8?B?UkhqTndLK1ZUL2ozN2FHYnNTN0pwVFB1YkQ3YjFIakQyWkltVTBTOWVEelNr?=
 =?utf-8?B?ZTl0UHFHd0tjQnZoWEpCWml4aW10bXc4bXl1ZnRzUUtJZGRyNHl4WUw2Z3NC?=
 =?utf-8?B?dmwwZms2UU5LQjRSVmZqbzU0azBxZFVwRm9CaFdBdU5aWFg1Z3NrQmVyVlFF?=
 =?utf-8?B?Y2JKdTIzL1g1VklzZmdTUVpMNHo4VXZzTEsyUmRZa2paUktNUlRFR1Njd1Jt?=
 =?utf-8?B?UVdhSlF4bmVYd1pOTVZ4b1hGdWNHcnNPb3ZTdU9OR3hUVStrN3dldHFtelFG?=
 =?utf-8?B?NXM0Z0drWlJESlM0RUhRN1NNdXBObmNXTlhLdml0WnJZdUhpL2Z3VGRJRkFK?=
 =?utf-8?B?SkJmeHBFUlVnLytNbTg5U0tDTWdxRXExNVJGWjVhY2VoSm1KZXY5TXF4Qm54?=
 =?utf-8?B?OFNCeTRZUmJuR1VhWi9TTGY5K0dicjNFa01pYm9oM3h4cnd1ZVd0S2poZ2hT?=
 =?utf-8?B?ZXdnaW9zTmhRYkJkVDBHSFM5NnI5aStBZ041SUlGTlBTZVZ1K1lRM1VRLzVh?=
 =?utf-8?B?RXM3cFJtekpLRDViRk5mSW5QU0RhUXZXNDNWN2lvSitCeVhiV0JuKzdENW5a?=
 =?utf-8?B?TlM0RDdUamY4a25CS3FlV040OU9teWJUcjRoNStkVHY2eXZqOThzMHRPTmRW?=
 =?utf-8?B?QVVibEQyNktUNE1oaklFWGQyeTkrQjVKSldGU2xXMUZZR1B3UVBhOC84Tmps?=
 =?utf-8?B?bWRpa2pmWmpqTlJuNnJSVCtYcHVDZkx5cGcvSzRYekc5MmVjT1NHRGh0MWFN?=
 =?utf-8?B?bit5Qkh0bHJNN3BrNmlNRnlLN1ZBMU9xUEFOTVpFNDV3VmFGZCtrNmNQZzR3?=
 =?utf-8?B?N0JCNnJnbTRJR3lTWHBiTUJFR3V4cUNOd1AzaEk2Y3luK1BQb3g1SERyWjF1?=
 =?utf-8?B?Q0pUZkFKcHgwekhmWjk1NHJiZGxTRHp1eTU5Q3Bjbjl4T1JTUEc3ZVVnbGx3?=
 =?utf-8?B?MzlGd2RpM1hDUWFUNkZvRkNnS3FDL1AzRUxIUjAwQkZveGV5T08yV05QbnNw?=
 =?utf-8?Q?gJoai5tEr9ogPM9y2eXG5mb4M?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3561cfd-12a5-4d5a-c64b-08dd0df8a6ab
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 08:59:35.7661 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rDZDdTZWEXf0ahh82KJbt3wEMs2MEhzRPrH5UQao/sDyIpDy9vBYhsHES7Ydmfz/3G9gYlTViVHQ6/33YSRZpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9630
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

On 11/26/2024, Maxime Ripard wrote:
> On Tue, Nov 26, 2024 at 10:08:26AM +0800, Liu Ying wrote:
>> On 11/25/2024, Francesco Dolcini wrote:
>>> On Mon, Nov 25, 2024 at 05:33:13PM +0800, Liu Ying wrote:
>>>> Add display controller subsystem in i.MX8qxp SoC.
>>>>
>>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>>>
>>> ...
>>>
>>>> diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
>>>> index 05138326f0a5..35cc82cbbcd1 100644
>>>> --- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
>>>> +++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
>>>> @@ -20,6 +20,27 @@ / {
>>>>  	#size-cells = <2>;
>>>>  
>>>>  	aliases {
>>>> +		dc0 = &dc0;
>>>> +		dc0-constframe0 = &dc0_constframe0;
>>>> +		dc0-constframe1 = &dc0_constframe1;
>>>> +		dc0-constframe4 = &dc0_constframe4;
>>>> +		dc0-constframe5 = &dc0_constframe5;
>>>> +		dc0-display-engine0 = &dc0_display_engine0;
>>>> +		dc0-display-engine1 = &dc0_display_engine1;
>>>> +		dc0-extdst0 = &dc0_extdst0;
>>>> +		dc0-extdst1 = &dc0_extdst1;
>>>> +		dc0-extdst4 = &dc0_extdst4;
>>>> +		dc0-extdst5 = &dc0_extdst5;
>>>> +		dc0-fetchlayer0 = &dc0_fetchlayer0;
>>>> +		dc0-fetchwarp2 = &dc0_fetchwarp2;
>>>> +		dc0-framegen0 = &dc0_framegen0;
>>>> +		dc0-framegen1 = &dc0_framegen1;
>>>> +		dc0-layerblend0 = &dc0_layerblend0;
>>>> +		dc0-layerblend1 = &dc0_layerblend1;
>>>> +		dc0-layerblend2 = &dc0_layerblend2;
>>>> +		dc0-layerblend3 = &dc0_layerblend3;
>>>> +		dc0-tcon0 = &dc0_tcon0;
>>>> +		dc0-tcon1 = &dc0_tcon1;
>>>
>>> what would you use those aliases for?
>>
>> They are used to get the instance numbers of display controller
>> and display controller's internal processing units from display
>> driver, e.g., patch 9 & 10 get instance numbers of some display
>> controller's internal processing units.
> 
> AFAIK, it's not listed anywhere in your bindings. Did you get an
> acked-by from a DT maintainer for those aliases as well?

Will document the aliases in DT bindings in next version so that
they can be explicitly acked by DT maintainers.  Thanks.

> 
> Maxime

-- 
Regards,
Liu Ying

