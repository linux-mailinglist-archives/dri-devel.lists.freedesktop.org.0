Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F722A5432E
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 08:01:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9629910E8F1;
	Thu,  6 Mar 2025 07:01:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Eu/y4Xe0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2064.outbound.protection.outlook.com [40.107.249.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D68E10E8F1
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 07:01:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P+5cc7e/99Y18VZX40S/aM9IVxBuckYQO2A0LC3+Zc0xBVMRdjOiou/xaJ3xS7h5Y7leucVRl7pI3yqNyhQfRn3kfHV7+bkmpxwiclEYBWzUArQYxIy6ZiTOkOlS0P3Y0urcazPv2RGN6tpPNdJGCSMcngNJdPAFdfeiuo7FQtRmnd29zVxZyTyR2XslbotnDzSPUxK6dmlMvTsiib1frFuRZ+KLqr5NMhWLNkbHKsBL3fQX58iZWl8ytPuiG1/42ffHDPyEqXNFoq1DAqsuqJGQ9/LJ+w42yjez41CrGVa4o6Wo0Q3z8jqO17S6UOrb3fC+VdYuclrSE7BYORN1/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W9/UpD9T1Rcyv7GXufVhrwh/y2oPj75HiCc8tPDnj1I=;
 b=tjrTekVIarRvG071RuUwX+nIctyqgcu53zqDxcHVZmc+fTPPCrhLVHh4ywCr6MVow80HE/nnF/Qpi369RLaGAHBOoe5GEM9uey3dtqfvNKkgZ0g/+68YLjz+8imrcceg3d82yzHYnnLClnnLMXGY1jZlsmCOt6zoVnlFfyfEvNb3nLxMwfOBUQGotETmikl4eRvdVRXO/SxIo4AVO7zIKcvazX3h793gPjlUX5QG1fe91w1YMKsLjkgyH9YfbxFkxbvKn3Y65+L+/e6xnKgzxzA3WBBeuKYiGfwQ4S77jQUEx+DmWLkyZxZeWc2FnugmViC/ZCqCoSc7xFEujF97KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W9/UpD9T1Rcyv7GXufVhrwh/y2oPj75HiCc8tPDnj1I=;
 b=Eu/y4Xe0OFqMlf3UzP3RQC6Q9X4icKOT8ILUA2yWESt2Ab0tzcQv8PTlZMOdS0NGStymhC3Eo1Ma82MyFib0vORvob5e1YKTqV/c8NAcJwqfvZengoGUBe6ChUgFAvZVMHeh8Vbr4v0VVnB6WSP6Sz+cF+O4tKWwcF9xRLGy5+maRVpAEaN4C2isahRcODic3o14QtbAOe4ACycsalSYK3LJ2sXDapAu6xbxAatgvZiRRulI5yBACEsiNrnkHuO/kIrzF7U7M9g4IV9s6uzLr3R8mBkkT5tGNFGsKoch8IgJSYjGDLAiRk7VQzG4F/omc3Roo6kEDjEPwxeWVSWu5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DU4PR04MB10863.eurprd04.prod.outlook.com (2603:10a6:10:588::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Thu, 6 Mar
 2025 07:01:29 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 07:01:29 +0000
Message-ID: <7d98163d-10c8-457d-92e7-6a1d6e379beb@nxp.com>
Date: Thu, 6 Mar 2025 15:02:41 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] dt-bindings: display: simple-bridge: Document DPI
 color encoder
To: Rob Herring <robh@kernel.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
References: <20250304101530.969920-1-victor.liu@nxp.com>
 <20250304101530.969920-4-victor.liu@nxp.com>
 <20250304152320.GA2630063-robh@kernel.org> <1891036.atdPhlSkOF@steina-w>
 <20250305163805.GA2071011-robh@kernel.org>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250305163805.GA2071011-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0041.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::18) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DU4PR04MB10863:EE_
X-MS-Office365-Filtering-Correlation-Id: 88d7f74a-2c49-4bec-30cc-08dd5c7cb7d0
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y1BWWHdmejFzVDRBb2h5cU02azZ1SjRJeDJ2RGE5eWRBek1vTThXYzh4Wll6?=
 =?utf-8?B?R2Ftd0w2dDNLNW1GVHhZRnRZOWdweGx4c2ljTU9lWlR3cXhlQTJpbGpnd0Mw?=
 =?utf-8?B?Y1U3Y2F1SEt4NGJJUGtCb3FHbWExM2dRa1prenJzZS95TjByUUdMemFGTDc5?=
 =?utf-8?B?KzBZQVJJV0kzNzBPUFBWdVAwZWxBM2p1alE3ZlI5MUVUZ1l0RDRqejVteDNm?=
 =?utf-8?B?ZjBaYWxvOW4xY1FmazNkMkQzOVZ5VVNaLzE4M2RDQUZFYkVNbStJdHUzdzVH?=
 =?utf-8?B?WUo1ME9KUzFqUEl3eUpoZkwvTlArQks4QU9lT21tN2RwUVBMZHNMZ3pINnk2?=
 =?utf-8?B?d3hmUUN2eUZ2VVVDTkkvUzUrelBxa3puMkFNa2JpSG5RaXlQYTBML2lVSG5P?=
 =?utf-8?B?R3h2VmFBb3E0ZktZWXBrak1yZVA5SGczMmxBSU5QakJGNlZGOHd3ZnRERG91?=
 =?utf-8?B?N3lsKzg2OGRyK05vUFhQZWt3a3RMOE5nNnp4dk56UTJWcmRueFkwcHpWY3B1?=
 =?utf-8?B?YUVaUTVnWUZPY1F2M2NqTUtYcjdhOXA5TDlwTk01Q0x0WWw0a2pEVXVtRk9G?=
 =?utf-8?B?VEFYWmNJS0d4TjVRREc2SG5FVTBkNmRmR1pKTjRJdWppd2NmNGx4UDlsZGtu?=
 =?utf-8?B?UjJRdFN2TnFEMUJWYjlQR2NDdVpFYkQ4OFpXM0tVeFR3SHF1OTZhNlBkQmhh?=
 =?utf-8?B?QW8xYy9VaGs2VnhWRmdDR3JTbXFmMm8yaUNuZkx6ZEhBem1BM3ZCVUQ0YVhr?=
 =?utf-8?B?czZQc3hZUkIzVlE1d3hQd1NJbTFWUFRUanhIR0x3aDBGeTVsWG9pZE5wOE9y?=
 =?utf-8?B?TFEyck52RWFYanJqWGRRRGkzYytXaHltKzl1L3Y1eWx6YW5ickZWWkVadmd2?=
 =?utf-8?B?ZGw4dzljSmRNdXIwRENLVjdFdW45OVlZN2hVZFg0Z1dpbjI2TUF5WUNyU3RN?=
 =?utf-8?B?Tmh2WGk1UmNOSmNpNzU1MHFzaDgyWWIyY3oyaFM3QnNMTFRtV0Y0L05SK0Jw?=
 =?utf-8?B?R2JORVJSSGxCU0lGR2NFU1gvK1l2OVVDZGh6cWFvY2QzQmpMMlkwRGJsc1hj?=
 =?utf-8?B?bkpLN0pSWDQvendiS1JCd3JoZ29Sajg0Tkhmb0NQWlcrSVpLT1NNc3d0OVRO?=
 =?utf-8?B?VDZJQVc3a0NKdlV3eTJzV3ExajRvNHliVTlLYW5KOTg3QzlwaXd3clJnK3Fv?=
 =?utf-8?B?RFhSRjZEMlZhazgvWExZOTJQUjVCYlJURktoWFMwbTVkRXdXVWxEdmxlQnRa?=
 =?utf-8?B?b2RFaXdmVDRkVHFpOVRKTU5LOXBucHFYY25CZ2hLUE42VXhvVFFUcUVQVVA0?=
 =?utf-8?B?RW0zTDJkM1h4cUFRSjFkSFNqV3pUWDdIR2Fncll6TEU2MS9tZlJVZXpWZGR2?=
 =?utf-8?B?WlBGbVJPWm4vV09xYUhUVGtSMmZTU3Z5TVhBc1poSVhFM2RtRklxYnlRSTNJ?=
 =?utf-8?B?Z0VkSUVqWlRaU3p6dFpkTlNab1dsdUswenZKbmVYOHd3NTBhRndld25yY2xw?=
 =?utf-8?B?a3BOWmcvdXoxNDVsMmJrWVBtTjBRZ0w4QjA4TzViUkhoVTNGSHg4cU1ETnN6?=
 =?utf-8?B?V1V4bUdqanVzR1Z6L1FuY2tmeTVLRkxtd1ZDaHU4MzhrdHFGWlVUYjBrYk9j?=
 =?utf-8?B?b0pkNmhMMko3VytJTEF3VGdLc3cxbTQxU2NaakV1NFUyRjF4NlRKeGI1cXdS?=
 =?utf-8?B?d3d5WUxTQnBITUczdGJTK1h3aGYyU3hxNFpvanE1VDFISHBEeHllZ2F5enBr?=
 =?utf-8?B?V3pmV2ppcmVhNHdzRXFKNUNHNE4zZ2o1TUdwZ2VuVGMwaWF3b2Rwck5Pc2lW?=
 =?utf-8?B?SGhBdXN5QUNvdTBJNWZnZGZlMmtGZys2cmp5aERWaUJaeEpzbDMrdE9aV1gv?=
 =?utf-8?Q?LMPn6IHuh2w/d?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0hXSkxSdzBrVmJpSXd5d0VnMTg5c1BVaHZZL3dyelBRcy9HcStKNFBqbW1T?=
 =?utf-8?B?d2NvN09zTDdndldwb3FJMjFzUnFETGFiQVNVTjBuNnNFY0VraUpDaFRLUitk?=
 =?utf-8?B?ako3TllUWVhOMEpJYk02SVRicjdGTmxFWUJleUd0NTJGNUcvUWZMMGpVTGU2?=
 =?utf-8?B?dy85N0IyWkU3TTMweWIrMXN2NmFnSzB1YTJaTFdPVkdrZzltdHVBZE0yMzl5?=
 =?utf-8?B?c3F3bWFyWDlxUWR4ZWxLeDl0YVBXWWowbmcwWEUwN3dTY0g1Rm9laWRvKzUz?=
 =?utf-8?B?eXk2UTE3QnIwTTQ1Sko5bTdNcnNISlN2ZU1sRHB6enZBMUZIWmkyVm1nYmU4?=
 =?utf-8?B?azk5YVlqaCtZL2ZsWEwvMWtVMS9vYU96T0JMRXdpVnV3andCVmhLRGJLSFFI?=
 =?utf-8?B?TS9CYlRucGlTbG0xOXlhUDBqV0dCa25yMzY5VlprYzQ2b2djWEI1bVUwcWMw?=
 =?utf-8?B?TzVDblV2WWpqWWNqOHlsbHB4aGttWUw0c3owV3dyNTJtMXEvWWVnQUorcUpt?=
 =?utf-8?B?a2RFRDlzM3l4RUlUUmhWVmF4eU95Wlk4bXhpSG1uencyaVIrbytEOHlNUUhL?=
 =?utf-8?B?dEYvVkc4RUlBSFZWUnhUQVZneXNnUFE2V2xuM2JwTVNoeU9COVN4SW96MlVv?=
 =?utf-8?B?cUFIYUw5QXZGUDV6dzZ4SXo3cXlvcFdNaFNReEg1Sk01OWhaWTU5Y01SaE4x?=
 =?utf-8?B?SC8waXhNTFhmZ21CUjI5cWRibHYzdWFrOXJRb3Ziem9HYUFVVG4zUVMrQ1Ir?=
 =?utf-8?B?NGFWVzRsUG1KWWoyWEI0ZjNiZHl2MnZCcDdlN3NObkxmQ3BhbFlnbW5jUm12?=
 =?utf-8?B?dnRtZTFqbVBoVlhYSnRYZVNrQXFNb1cvbG9HRkpMQTByQkRLS0xQZklkWmJu?=
 =?utf-8?B?RTBCNllobUhKWWc3L0YrcytKc0lKRlhwV2dRM1lOZjZFMU9xaG5QVk01c255?=
 =?utf-8?B?YXNnbm9EWEhydUFKTXo3S29penFFSmRmMnNtVytadGlhN3htNDhkU05aelIz?=
 =?utf-8?B?ZUd3d0VsOHdkTFZNWFViclVUbythbDJyVnlvZWJFQnZxTHZXS2JWK3B1RUJx?=
 =?utf-8?B?YjJUbzlhUVM1WEd6N01Oa2tLa3ZvQW1wbHY1YjNHSTJTSDByUnBMSFBUMnVl?=
 =?utf-8?B?YXdQUTF2QmdscHpVMUFHREk1K3Y1K090MllQRzZyZzZnVkVsRWpnZmNjT0du?=
 =?utf-8?B?SWgrR2lKa2RWYXI4ZUpVaWJWa1NxeEh0ZDR2ZklsVThjWk91WFJSSHBrY3dB?=
 =?utf-8?B?UnpJRktWaGVrSHdrQmlqbHc3UmplYW56NXQyMWhDclRtMG14cjJ4VUU0ODRS?=
 =?utf-8?B?TmUrWkp0THVRemVtb2p0d1d6WTJYOEU0WThuNy8yaDdZVjMwUk11c0NjRndU?=
 =?utf-8?B?blFMTHd0aUw3SnNBTzBLUkw5UmxjVGR2cGp2ZGdPZ3BUa0hrTG9Qc0IwSVd2?=
 =?utf-8?B?dlg5Ly9ZTVU0dG5WaHF2dmpjY2lJWllOTStPRnV5RHZrT1VrZXQvZ1pyajJj?=
 =?utf-8?B?Nm41NnRKN3VLYmRIN2UveUtxUEdJTFhEZHZXalFtQ0NsUFJzNWg2WHQzTHBv?=
 =?utf-8?B?KzdnSm0vaWhHYnJrK28vUGh3eUpOTlBXbVJQdzZKV1lIbno5WFNCV3haVWxy?=
 =?utf-8?B?aDFaNjNjbnM2KzFBanpxNnlWTklBWWRwdE1od1NzQUNQYlVDVU5rRGE1cW5X?=
 =?utf-8?B?M0VJWkFKdEhEdk1YczAyVHpsN3IvckRLRE4yOUdLdE9LaXFXd2l1SHNySlpz?=
 =?utf-8?B?Z0NnS0J6MUsxWnJJRUtoTkZJckwwMWxrUlRScndiL1Ezd1cycm1zR1FIbjVu?=
 =?utf-8?B?WHBjODhzQlk1b2d5TXpCeTBXK1lGb3RmM0pHRUQveDE4d1AvdDVTNTdUZHN3?=
 =?utf-8?B?YjVGcWxrQUdDZHlCYWlybnZlRE9ySEtSMWpIWDNPVk5weWcxem5JalJOSE5x?=
 =?utf-8?B?UHlaZTllckc4d2FZekxkWWFKVkJVbEhtakFCaGc2S3IwU3hWY3lhTVlwL0Jz?=
 =?utf-8?B?RFJtZjhFdks2S0M2YmhNTmtFSVNkRG1sQm5tYzdtdXFlVWQyNVZ1d2pyZk4r?=
 =?utf-8?B?MnBJZnBER1BYUHl0d3Awc2I3T1kyYTNKK09pbXByOVZ1eFBET21GdUdDRGV4?=
 =?utf-8?Q?6yzQ8wNRlLkyNmeIwdKoKGfX7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88d7f74a-2c49-4bec-30cc-08dd5c7cb7d0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 07:01:29.0138 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bnt+c1J956efYm9LfNBA06Xs+Hqcqz1maARnnvaHaf8skO0WCSW6xSvCUEl0UFpBKwYtGODwA+Ozhn1xyMU/wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10863
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

On 03/06/2025, Rob Herring wrote:
> On Wed, Mar 05, 2025 at 10:35:26AM +0100, Alexander Stein wrote:
>> Hi,
>>
>> Am Dienstag, 4. März 2025, 16:23:20 CET schrieb Rob Herring:
>>> On Tue, Mar 04, 2025 at 06:15:28PM +0800, Liu Ying wrote:
>>>> A DPI color encoder, as a simple display bridge, converts input DPI color
>>>> coding to output DPI color coding, like Adafruit Kippah DPI hat[1] which
>>>> converts input 18-bit pixel data to 24-bit pixel data(with 2 low padding
>>>> bits in every color component though). Document the DPI color encoder.
>>>
>>> Why do we need a node for this? Isn't this just wired how it is wired 
>>> and there's nothing for s/w to see or do? I suppose if you are trying to 
>>> resolve the mode with 24-bit on one end and 18-bit on the other end, you 
>>> need to allow that and not require an exact match. You still might need 
>>> to figure out which pins the 18-bit data comes out on, but you have that 
>>> problem with an 18-bit panel too. IOW, how is this any different if you 
>>> have an 18-bit panel versus 24-bit panel?
>>
>> Especially panel-simple.c has a fixed configuration for each display, such as:
>>> .bus_format = MEDIA_BUS_FMT_RGB666_1X18
>>
>> How would you allow or even know it should be addressed as
>> MEDIA_BUS_FMT_RGB888_1X24 instead? I see different ways:
>> 1. Create a new display setting/compatible
>> 2. Add an overwrite property to the displays
>> 3. Use a (transparent) bridge (this series)
>>
>> Number 1 is IMHO out of question. 
> 
> Agreed.
> 
>> I personally don't like number 2 as this
>> feels like adding quirks to displays, which they don't have.
> 
> This is what I would do except apply it to the controller side. We know 
> the panel side already. This is a board variation, so a property makes 
> sense. I don't think you need any more than knowing what's on each end. 

With option 2, no matter putting a property in source side or sink side,
impacted display drivers and DT bindings need to be changed, once a board
manipulates the DPI color coding.  This adds burdens and introduces new
versions of those DT bindings.  Is this what we want?

> 
>> Number 3 actually describe the hardware connection. The only impact for
>> software is to know which bus format it should use.
> 
> I'm not opposed to this, but only if it provides *something* that option 
> 2 does not. I'm not seeing what that is.

Option 3 provides an intermediate bridge for both DT and OSes.  It makes
the DPI color coding manipulation transparent to source side and sink side.

> 
> Node or not, either case needs a format property. We already have a 
> variety of bus/pixel format related properties. I've rejected new ones 
> because we need something common here that's flexible enough to handle 
> any situation. That's either something that can describe any bit layout 
> or something enumerating the formats (as MEDIA_BUS_FMT_* does). The 
> former is hard to get right and there's always something else you can't 
> handle. I'm not opposed to just reusing MEDIA_BUS_FMT_ if that works.

Agree that the former is hard to get right.

Since this is all about DPI and we have that MIPI DPI standard document
which specifies color codings, maybe it's fine to start with those limited
color codings.

BTW, I'd admit that the artificial paddings are not described by this patch
set, though maybe no one cares about that.  The paddings could be floating/
low/high/other component bits.

> 
> Rob

-- 
Regards,
Liu Ying
