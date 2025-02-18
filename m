Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0864A39D25
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 14:17:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FF0110E6C6;
	Tue, 18 Feb 2025 13:17:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Mc2ADXR4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061.outbound.protection.outlook.com [40.107.93.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B75610E6BA;
 Tue, 18 Feb 2025 13:17:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NkQflM9/4TKtVYD0dc9BGHziZ7syHstookP+Gdyl0oMIx68BwuKJT+nR6Ta7Kon++TjLDsY3726xU5gEC8oDsYYK772QSRoOT1sxWA0+5HupbMaCip6DhZcib0ZN5Ba90wgvM/YsFY1vm75u7hpUhUSYlmcxV5NTQ9QCW8F2New712gYQ90rHzm02thuGbMCbvZ7mMWBmTrPlzMAxQmQewL98E1LmlE+lhx+m6R2X/Av3ElZrOiMhRkeARZoJTu8AiuxQuzn+BKwrJQ8wdsCrB+BTQrZNvxopilPpLfoB//QdGOrrCED0dzx31eAqPP0HCjKDqot/1kXN+dDJlhbBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=irZbGh+UD9EExwMmaI+SwDwHqjt94Wr3evqRSIYwYA4=;
 b=rxFH2p2D8ZWmVplIcO9b1nOLfe/acCFRaYW7/VwBAgXCT2+VOK1PZmF4n/jjUjdrY8jeQJ+bWtGVdDjsmBSl5WZmX1liWdL3OdXnChxO7/Q9smUxKQM/VkYPgxRx4KpBh2cyNolZrhHSjjQC0xNchI88XfMPUoSzaRzG8ilWrWLRPLmrb2/p82ewqZx2AgKUQyoE4rR685BfMSdHo4YLwz6JmNDNHr12IGhh1LVtW1ZPIZBW53ECTKIExX2t21MqxbHtU5EUkw2RBPmtQKHHowJCEVArn/s9AF5gBxpeyhykTSf4pPmfNAmL37UEs/FJKJ68b6vb8rhz/9lAt0nS/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=irZbGh+UD9EExwMmaI+SwDwHqjt94Wr3evqRSIYwYA4=;
 b=Mc2ADXR4hkc5HSI1FGek7t4yLOUxHfz/j8qI8RhiF67gKR+ROKr8JVXN+QbDoauO/Tay8yGre5n537bUiKlmZ8kQVzl969058JPyhvE8QQv3zQv+2apPCLTCLygR1/73+NXDl+O0dPlxfZ4Wj7c5SYCjynvEnl681UtlDvHc3ev2i2A0876WLur4MzNTi+f3xE82HVa3H3uTPxVUh5WM/jBVk+Wy0fDlNxVjXvXz8Hwxiu8LwdkkEKSnuVECtYJUPBdqWGubVvyFhMkIm+P+PzrUvKpMjJDHubd0CgrKn71LBMI05zCDjT3Q36rWeO+lBD14DiEooPtEUKIOji1mcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB8453.namprd12.prod.outlook.com (2603:10b6:8:157::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Tue, 18 Feb
 2025 13:16:57 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%6]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 13:16:57 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 18 Feb 2025 22:16:53 +0900
Message-Id: <D7VLMD31YB0V.OKHDSVUPAZTE@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "David Airlie"
 <airlied@gmail.com>, "John Hubbard" <jhubbard@nvidia.com>, "Ben Skeggs"
 <bskeggs@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH RFC 1/3] rust: add useful ops for u64
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Daniel Almeida" <daniel.almeida@collabora.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250217-nova_timer-v1-0-78c5ace2d987@nvidia.com>
 <20250217-nova_timer-v1-1-78c5ace2d987@nvidia.com>
 <C1FF4314-C013-4AE1-A94E-444AFACDB4AC@collabora.com>
In-Reply-To: <C1FF4314-C013-4AE1-A94E-444AFACDB4AC@collabora.com>
X-ClientProxiedBy: TY1PR01CA0195.jpnprd01.prod.outlook.com (2603:1096:403::25)
 To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB8453:EE_
X-MS-Office365-Filtering-Correlation-Id: e3004fb2-c01d-4603-6252-08dd501e8507
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|1800799024|10070799003|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bjdIYjh4alFJUU85ZWROQXBjSUZHZ3VDTUQ4aWF0Undrai9rSjA4UWF2NmZy?=
 =?utf-8?B?Um9SVTVkTGlTYndEQjlLMllORlAveTB5cmFMVUQycFcyM1ZUS3dnUkxidVNM?=
 =?utf-8?B?cXZmSnVoeVhMZnl5UXVFRXZQc3BmV1pTSUNadmpDek10V1N0MnVCNkc3cE1w?=
 =?utf-8?B?NTJhV1l0cm1XSDk0NGloQ2gyaEVZZWVVTTFGYU96MWV1Q3Y5V0JLQUF0M0M4?=
 =?utf-8?B?REJDWnI4RUV1NVMxN2V0S25hMXBPSENiY1dBR0xIQmhIZ3lsM3o4OE5GQmRL?=
 =?utf-8?B?VjJFeFpHRk5vYU56NVNQL0hwTzhEOEhBK0k1SFh1R3ZVWmZUbHB4aU40N2h3?=
 =?utf-8?B?TlVIWkZ2bWVGV2ZYTjdhOVlkbFRqWkhtb1ROcDdtY3p4cnVtYjlvRVNLQXEz?=
 =?utf-8?B?bzNvZXMzZkh6dkhWc1p3N3pWZDlEQUFJQk9HUGNNNkhDODYraEZnT1R1MVI4?=
 =?utf-8?B?eFJaV0hCV3FhcnFLY293OVZ0anZXKytrdGhHYUphSlhtREx2cURVNS8xNUpG?=
 =?utf-8?B?eGt2S0hjOVdDR1J6NkJvenNNbG5EOHp1aWZ4K01PWGd2SmdxdWpFY3VJNkxh?=
 =?utf-8?B?MDNiTWc4YTc3RzFWT3UxdjlMZm83RG9HSlVDNVFtS2ZuM0NYVDV6d1ZmY1Zq?=
 =?utf-8?B?YXBLN2hjdmlIck5OdStkVnZTb09YLzlXWkJoREwxS0czSmlha3pOczlBcUpw?=
 =?utf-8?B?VFF2ZDl1Qm5RTUdxcmFhSGZObHB5bDNBSWFMOGx5UTZWQmJac0lXcjJ5b3lU?=
 =?utf-8?B?Z0tXSUMyRXczWTBQVVRWMndCZ2RyeUpqSDRPZ2FTam5VL0N2d2gvMm9rdzR0?=
 =?utf-8?B?c3ljUEZyTjVNcXpibXdUK29mOTNnaGcvdExsQm02ZndRNTJsVThBK0VCUXhS?=
 =?utf-8?B?Y1A5WElBcUhoMkNCamN4K3dkN1d3RHIvT3A5aGU0RnNtRVRmaTJnRzNzSUpW?=
 =?utf-8?B?L3gzeFhVTjJUY0pBTmFROFU2TzdwdDdnTEhoeEM5RE5Ub2ZVelllRzBDQ2dV?=
 =?utf-8?B?ejVVV3FqTXhxaWMwN2pZRGpDSHpMcitiS25EVFVJYUh5aEdEenZkNGwrdUF2?=
 =?utf-8?B?dTJlNStxNzJZUWppOFRwbDRaRkZDK214ZGszZmUrcjVUZ29XTTl3Y0MrUStl?=
 =?utf-8?B?ZkJYaTkrak40K2h2a3d6alVqU01vWnFIdmdhVksrallYTmd0QjV2dDQ3bEFS?=
 =?utf-8?B?RTJtc0tmUCtRbkwzdjhsUnp3UVZHdituTnFRT2w4ZGx0RjM4ZlBmSlJLZmdM?=
 =?utf-8?B?QzNiakdjcVk3anJoTHVZbG1vUmxISnJmTVFjNjFUeXNUZWVVM3BkeGs5ODh4?=
 =?utf-8?B?aElSekhicndQOEpUZFVoNmlXWmZJUVFESDBFZXVDTmJqeHoyVVdOVlNySk5u?=
 =?utf-8?B?L1drK1pGdk5GY0JTekE4YWM1MlhQN3NmbnpkVVZKSW1OanZ2MXJiSWo5Vndl?=
 =?utf-8?B?UUlPeHF1TlRnVkh1QlVTQW4xR3hGSjN6VEpBdDZFTmZEb2JCY0lBMTk5Q1Vm?=
 =?utf-8?B?MnI1dTdWRnZUNTJmdExIVnlRT0FSYjQ2WFMyYlFWeEdiOGJGUXNia2tZRlQ4?=
 =?utf-8?B?SENQQWYwei8xNDd0Q0RXOXlqbUsraG5HOVovR3YyNDh4MXVQRHJRRW15UzZ3?=
 =?utf-8?B?ellPVHZrOVJrZzh4UGxHTWpPRTdlSXE0MnZOL0RCaDdCOWd5S0p0MzFFMitQ?=
 =?utf-8?B?V3lnTTlkS2g3S0FVRnhxYStDZmpxSXBBbTlVZ2wxNmZmZ3EzaDFyUDhUOVNT?=
 =?utf-8?B?eVNmREFYZnpBeG94UmIwRmFkS3BUcEwwdzRDRkg0Z1FFUTdTa2dlL2hJRE51?=
 =?utf-8?B?aWpoOHBoeHJrU2lMYitnbi9QVm5aR0RuNUVxaGJ0ZVN3TEEyZVNVQlRXQ2xu?=
 =?utf-8?Q?yOiBTC/43STHf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(10070799003)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1RyUXN6RUF0Qk1mdy9SUldLdlhuRTZmMWdQRmhMbVBsWnpqaVNOZGR4NFJB?=
 =?utf-8?B?M1Q2VzczK1NSU0tXZlRWeFdrQ0l5a0hEN0lSNEt1QWZJR1p5a1o1b0k3T2xI?=
 =?utf-8?B?dW9aVkRxaTlWOUxKejZJNFB0MTU3WkxSaWRvSVhHRTJYaW9OcWNSZ3RZekJP?=
 =?utf-8?B?bWpiMjNGTmdhR0VJYWhTazhtZ1ltVERFUDNPU0JvUzQ0Ui9wc1hVWDY0cFQx?=
 =?utf-8?B?UmpmVDRac1dBMlgzTnN0MlNKRW9SMmZpV0dmRG55WDNDVk40WFI2cStHR3Fl?=
 =?utf-8?B?K3VwNE1VMXNERHdNdWNXMTRMb2MxMGZETTU1bldDVzh1TDc5T2NBdFNrSngy?=
 =?utf-8?B?UmpaZDBISGhnODFOQ24zeXJHbzR6Y2F1b0JtbWc0NWFyVEV2aEE3QndZZ0lx?=
 =?utf-8?B?ZC9vbS92bjEzTVdzUHIwSHRkUkpVS1RQd1RKaEpCcGpvUXVPUzBBZWwvbjRw?=
 =?utf-8?B?a0hObSs0cVJ0bisvQTU4V2Npd3RMTjhQcnpyM1RDRStFZFdNTnRSUjBaMFYr?=
 =?utf-8?B?cHI0TG43TFBlY002azVobkkzK1pMdW1nWGowbFZiWUEvZzI4S2dJOHdtb2RC?=
 =?utf-8?B?MzdTeEJYaVhKaFlOeFU4ZU4rVTdRU3hrR1A5SUIxS3VkZEQ4ajJRUE84UU1k?=
 =?utf-8?B?QVAxeVliQ3o2Zko4S3Y2aVFkQ3dZRUlrV0JudCtXL3hCUzZ1Z2dVcFJ4MG9n?=
 =?utf-8?B?NTNqZytWN0xCREhLYnFtZGIySmNKOGo2blZnbkw0dmsydm1MYW9aQU5nandV?=
 =?utf-8?B?SldQb0t1aHE3aEFnWTZKREE0NE1UZXpQSnFIcllvTXJaYTFrYnk5U3NERDUr?=
 =?utf-8?B?YUVBQkNPL0llcExJMWRSQm1HMGZkbi80T2tQRE8wWHZXRnk4NGxpazBLK0NZ?=
 =?utf-8?B?YzU1RHYycHdneGN5ai9ZMHF0Vk5hNU5maHk3OTVmbUhjVjkxY3RmN0pHOUFo?=
 =?utf-8?B?K2FLZnRCQWQ4R1pSU3puSHluZ25rVnMzanl1QUxsNzNXN3lLUTVKRnRXNjN4?=
 =?utf-8?B?NlMvRGtDN1dJRXI5ZEc0d3BNQitmTkRRUXAyYWdGKy9NRTBoUGl2eitPZk5o?=
 =?utf-8?B?dmk4N0R1aC9xOXMrcEwwSGdPRjdyZHNLdStKa3RwSmNNc1VScUFSL2Q4Q0RH?=
 =?utf-8?B?M2N4RzNabTlRUVJoUFFoZStWRHhWaUJDTW9jQk1XVUNZeVVDQlZyK1VZQlFX?=
 =?utf-8?B?VG1MQ2FySW5EMzNqYTNwRDFWb0k5eFhlUVFZdmtQWXdGSEg3QU9KUXN1SDlB?=
 =?utf-8?B?QlU4aDNKYktzQTNLODhoK28wVWlQVG5HYTNCRytCSmM5VXFuWjBhbkFWaUZy?=
 =?utf-8?B?dnlaNGdMU0lSSUNab2lNdE90bVdVWmFaakN4QlpYV215aTRla2hPS2VBcGs0?=
 =?utf-8?B?N29vVlF3VWFnTGprSFpSMXpwMi9VUVNlMUZSVWZPNFp3MmdrZW95anVNalE2?=
 =?utf-8?B?bS9hTTNwL09meThVOGQzWE1Ddmltbm1OMjU5b1o5L0FrQm5vMkhqZmZwWUls?=
 =?utf-8?B?dmJ1THptVWdQZXlVaVVWUXFZMjZNNGI1YUpOM0Zpejl1MXhhekpYVlFKaEIx?=
 =?utf-8?B?L0JmTUY0UXU4ZlFvVVVHenNsTWtoQUdFVnJnYUZlNWZYZ21jQ0k4MjlCelZX?=
 =?utf-8?B?ZHZGWm03MVpiLzdaM3ZjSjVXdmg5TStJWXAzcHJxZG8vOUxCN2hDdW9KMEZ2?=
 =?utf-8?B?Y29lTFZ1YTFPcTc5aDN5TVoyOWRKa3puMnZWeFVHcmZLVmNYME9TMXJxRFA5?=
 =?utf-8?B?OHI5dzN6MC9CcXNqUXl4RlQyK21lUFl5MlpXYWswcEVoOEZiaVFZU3NiSllY?=
 =?utf-8?B?UWFWeDRYUXlDUEthdFJZTmZDNndkNzBSVUdIQ1NRMFhTR0JSYUdhZmthcTVY?=
 =?utf-8?B?dkl6RnA2V21BWHRVMHJtRE1NdE1BbTk3UjltSFhQRXpva1NjbEdoeUxoVGJH?=
 =?utf-8?B?SmRlSnRIckp4WnJxSDBVVjB6TWFVTXN0bmRFU2xIOGR6aE9POWhYc3hsVSsx?=
 =?utf-8?B?SkYvQnptb1BGQzFXQm9VaFp1emVKQkJvZEJRQXFmS0JsVU1nZWlpcjZ4cUh6?=
 =?utf-8?B?bHFNNWRwS1FzeGM2MnlxR1NQOTJ6OE53K3l3S1N0dm9XMWxEN1JNOTQrMjYy?=
 =?utf-8?B?aDNxekEwaTFHLzlvTjZ0V2tyaFM3S2JyTVk0bUVPM2VPOVVUam9rbGg1Ry9y?=
 =?utf-8?Q?gstXlg1+uFbKIJWVoyIFC+DleSEQcNp8X4QJGDiufLTP?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3004fb2-c01d-4603-6252-08dd501e8507
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 13:16:56.8874 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cPJ/xkVHeSo7xa7FH+IwvlyZNN+z+/kAjUTEUZsIk7aOyn9yf2DIF4NYLnIr+8eIwMlGxmBt3POjImgebilC7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8453
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

Hi Daniel!

On Tue Feb 18, 2025 at 6:10 AM JST, Daniel Almeida wrote:
> Hi Alex,=20
>
>> On 17 Feb 2025, at 11:04, Alexandre Courbot <acourbot@nvidia.com> wrote:
>>=20
>> It is common to build a u64 from its high and low parts obtained from
>> two 32-bit registers. Conversely, it is also common to split a u64 into
>> two u32s to write them into registers. Add an extension trait for u64
>> that implement these methods in a new `num` module.
>
> Thank you for working on that. I find myself doing this manually extremel=
y often indeed.

Are you aware of existing upstream code that could benefit from this?
This would allow me to split that patch out of this series.

>
>
>>=20
>> It is expected that this trait will be extended with other useful
>> operations, and similar extension traits implemented for other types.
>>=20
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>> rust/kernel/lib.rs |  1 +
>> rust/kernel/num.rs | 32 ++++++++++++++++++++++++++++++++
>> 2 files changed, 33 insertions(+)
>>=20
>> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
>> index 496ed32b0911a9fdbce5d26738b9cf7ef910b269..8c0c7c20a16aa96e3d3e444b=
e3e03878650ddf77 100644
>> --- a/rust/kernel/lib.rs
>> +++ b/rust/kernel/lib.rs
>> @@ -59,6 +59,7 @@
>> pub mod miscdevice;
>> #[cfg(CONFIG_NET)]
>> pub mod net;
>> +pub mod num;
>> pub mod of;
>> pub mod page;
>> #[cfg(CONFIG_PCI)]
>> diff --git a/rust/kernel/num.rs b/rust/kernel/num.rs
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..5e714cbda4575b8d74f50660=
580dc4c5683f8c2b
>> --- /dev/null
>> +++ b/rust/kernel/num.rs
>> @@ -0,0 +1,32 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! Numerical and binary utilities for primitive types.
>> +
>> +/// Useful operations for `u64`.
>> +pub trait U64Ext {
>> +    /// Build a `u64` by combining its `high` and `low` parts.
>> +    ///
>> +    /// ```
>> +    /// use kernel::num::U64Ext;
>> +    /// assert_eq!(u64::from_u32s(0x01234567, 0x89abcdef), 0x01234567_8=
9abcdef);
>> +    /// ```
>> +    fn from_u32s(high: u32, low: u32) -> Self;
>> +
>> +    /// Returns the `(high, low)` u32s that constitute `self`.
>> +    ///
>> +    /// ```
>> +    /// use kernel::num::U64Ext;
>> +    /// assert_eq!(u64::into_u32s(0x01234567_89abcdef), (0x1234567, 0x8=
9abcdef));
>> +    /// ```
>> +    fn into_u32s(self) -> (u32, u32);
>> +}
>> +
>> +impl U64Ext for u64 {
>> +    fn from_u32s(high: u32, low: u32) -> Self {
>> +        ((high as u64) << u32::BITS) | low as u64
>> +    }
>> +
>> +    fn into_u32s(self) -> (u32, u32) {
>
> I wonder if a struct would make more sense here.
>
> Just recently I had to debug an issue where I forgot the
> right order for code I had just written. Something like:
>
> let (pgcount, pgsize) =3D foo(); where the function actually
> returned (pgsize, pgcount).
>
> A proper struct with `high` and `low` might be more verbose, but
> it rules out this issue.

Mmm indeed, so we would have client code looking like:

  let SplitU64 { high, low } =3D some_u64.into_u32();

instead of=20

  let (high, low) =3D some_u64.into_u32();

which is correct, and

  let (low, high) =3D some_u64.into_u32();

which is incorrect, but is likely to not be caught.

Since the point of these methods is to avoid potential errors in what
otherwise appears to be trivial code, I agree it would be better to
avoid introducing a new trap because the elements of the returned tuple
are not clearly named. Not sure which is more idiomatic here.
