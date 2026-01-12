Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08029D13712
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 16:06:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B37DC10E0E8;
	Mon, 12 Jan 2026 15:05:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lgXY4nZG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013000.outbound.protection.outlook.com
 [40.107.201.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 761DC10E0E8;
 Mon, 12 Jan 2026 15:05:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qckveTrsGX4m8nDjbBkohw6yb15hT/YWkoQuYstnypI/+nrlqMEVfQhhNbeN26BDC23XO6cRVifOYQji2k7HqMkacp1lwrdWL2SAAJLg6eo6EJJYoSIHaQSbMaXWQ3L8jDvP/OMhKSSuaPwvvsBsCJLeJqA1EKQGvGWYm7MO9FP9Vu87wKLrCbiAttsYnTbmH2ypkmHjy4MKCEPKwUML6TUEysGO0P64Qlzp8V2uiyGRUU20oeSkYi0MMueyAGng/o0U4kp13DSa9wJD18ee81nrLY3pPK1sG1Plk4WdufVHOqrsEKEZOcqBfSopyAk8AE120i9gJjOEaKsE0uQqwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Palenug6X6fa40GrrIycU6TIxwZ90e0ZPZHQfxQvd8=;
 b=xySd+2MJuyBAOTWCgW+BWaeldigLNxjv6vyZYeH+tYp6GFvKB7e2xhL8RWfbHyw8zf4DYT2m16BGIfhNdt0edClFEMXMR7jQpoNwd/7Z9RSEssovgD0ob4N4SmSFyER4u+wM3qFws4UaLojNHhN9KykpoVpLUDApXFwyBa6cK6l1bZfIpGW7oyPKTdMmkera1h6Bib78WDKh5dBOOg6uOEGWD8wRLrOGyDp43zn/vcn3xGcAaNs/o8hNcGnd03Ez2pY9CvfHmmfAvJJIIutlsgRJCEfpxXKSJPU2djkVLNpQWSV/M5ncRqaA65YJxO4yniB4k9g4xHvBL69ykMDxTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Palenug6X6fa40GrrIycU6TIxwZ90e0ZPZHQfxQvd8=;
 b=lgXY4nZG7WYwAEgba8v6hwp3dSVu4OIIV924kGCCnPGOzkQn8FKC0jXEqjbFeT3T7aTXxK9rAfc3IMWCzm/nQNhnqL9dntH9bZc+nrTmtNe2R/Wi2tcbRXvwmSLRLedeGG15LM7wfd1PBZ+DCONKLEBUOSPXYOjijssKWMBO/Os=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA0PR12MB7604.namprd12.prod.outlook.com (2603:10b6:208:438::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 15:05:48 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 15:05:48 +0000
Message-ID: <585ab6cc-d508-4d8a-912e-4d3a530bc224@amd.com>
Date: Mon, 12 Jan 2026 16:05:40 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] drm/amdkfd: Add batch userptr allocation support
To: Honglei Huang <honghuan@amd.com>
Cc: Felix Kuehling <felix.kuehling@amd.com>, dmitry.osipenko@collabora.com,
 airlied@gmail.com, daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, akpm@linux-foundation.org,
 Honglei Huang <honglei1.huang@amd.com>, alexander.deucher@amd.com,
 Ray.Huang@amd.com
References: <20260104072122.3045656-1-honglei1.huang@amd.com>
 <64f0d21c-1217-4f84-b1ce-b65c1f5c2ef1@amd.com>
 <b6004bee-ffef-48ea-ba0d-57b390cb771c@amd.com>
 <76c44385-bcf8-4820-a909-569bd2d36198@amd.com>
 <7ea29163-d6cf-4a4c-91c7-72802dd49018@amd.com>
 <d932d813-f1cf-482c-9697-80199b3b4771@amd.com>
 <3f9028ae-6f34-4fa9-aba6-fb2a6e223725@amd.com>
 <57ce883c-532b-4596-97e0-cb811ecb0c8d@amd.com>
 <c0fe19b7-df1a-442f-9ec9-794b14a81c28@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <c0fe19b7-df1a-442f-9ec9-794b14a81c28@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0176.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA0PR12MB7604:EE_
X-MS-Office365-Filtering-Correlation-Id: 11703c3b-c8f8-42a0-13b0-08de51ec116b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZTRCVnNEUGd5bitsOUVoZmtBRmlUSGxzMHV3czlCQ1FWUElHd2dqNk16NU0y?=
 =?utf-8?B?Rm1zbkdHODRzYWJVZldPeGF1d1pxM1JCSFJqbnMvVXk0ays4R1g0eFFDSXBx?=
 =?utf-8?B?YnY0ejNrdTRURmtUdysyV0JtZVRlb1Y4aHFGVlQ3bEZBV0kzL3VLZ2tDZnA5?=
 =?utf-8?B?RjBHTlNEb3VqbS9MQnFtL3hxdkZLVGZGd1p6ZmRHQmZqTVNyM1c0aURxT095?=
 =?utf-8?B?L3EyZEt2d080bzJNS0FQMUlieU8vMDRpNitaTXF3RGd1S3YwK3E5UExoNVU4?=
 =?utf-8?B?OWZxWXZObi95cVY2Z1ROREZpWFUzMCtQN0hFUjF2RlZhOEw0NjlwSGx2Nk9X?=
 =?utf-8?B?bjUwOTk0WHZWODZjcTFaU0pDcFZ4emFaWW04NndJYkF0bW4ydXMxaFZWbU9S?=
 =?utf-8?B?VTFFQ2g0R1kySlFKN1BnbjJrZWQvbVoyM3ptUCtlWFpmSXVTbnJzQ3J3SENJ?=
 =?utf-8?B?SVY0bC9LREtXQjZDMkx2d2lPcTUyZGdWSGM1S1hFSHptNVFURUNGUUN5Mk5v?=
 =?utf-8?B?bFVaNkYrYUExV0NmVFNLT0xiYXcwaDI0RXY0UlhTOEM2dkNkelk0L1RaQ1hB?=
 =?utf-8?B?dmMydFAzN2hia1JZeVNqQzQwRFU3dGIySFZUaytyRUlvQlI5WUFHNGJyWHc1?=
 =?utf-8?B?V3hmTFVweFBvSlJOcUVXc2NBL2VwdGs1UXRpMGIybEF4ZWxoNXEzMnd0L0NV?=
 =?utf-8?B?a2VmV1VDNVMrWXR0VEVnelZGY3VjRUMzMm1Ib1dQbXNrWkFFcktKcWphcjlV?=
 =?utf-8?B?cjk5VEk2ZTJVTFhDNnZzTmN1OGh3RXh2T3ZudFFTWnlxa3FpU1hZeExXRU03?=
 =?utf-8?B?ZWlaZ216OStaVW45VmNWaVB4TEZ0ZS9USHI3dUpYNWQrYXlwWXBxTWJUMkRE?=
 =?utf-8?B?czJDUkVNc3VTZDVmY1ZDSVZiKzUzMytYLzZJdFF1TytXbGtEeVJaNXBLby9M?=
 =?utf-8?B?NGhMNEtpTGQ0OUxJRThQZ3dMU2RxK1h3WXg3MFdyUlZicXRSOHR0aVZJRitK?=
 =?utf-8?B?aE1kSVlNUkhKWXB1TFZBQndVK1ZuNG1TbFV4SjAzcHF2UjViRC9weTJMTTBw?=
 =?utf-8?B?L2lkV0REM2wvdjBSVnVBaElmYjFndUgweG5PUkFlL1FxZExobHdXUEdBMXMv?=
 =?utf-8?B?WjNVWUkxQzFqOXpra0xPLzdXM2NKaUZJVlZEd3N4b1NyaDVBRGlROHVMODc1?=
 =?utf-8?B?UWNKTmk1RXNPN3FYZ2NzeSt6aERCTVRGa2NHcU5NOXVBRkNRQXRBM05MbG5H?=
 =?utf-8?B?alR0WjdoTHNpb0JWTkpQRHlzdDA2ejkvQWhRNU03MUdXRDZDTHNXRjJHTUlH?=
 =?utf-8?B?eGlieDBxMVRibUFWQW80SmlxNjAxUHpjK005RytlWlg3eGJWSjhzRldha0pE?=
 =?utf-8?B?VEh4anIxeWxua2ZVdlRMWmk5c1F1ZFVhNXFoNmd1akNsWEd0QStXUWFacjBH?=
 =?utf-8?B?NGZKajVmMGlBWC9oSldXbUI5WVFQd1V2UjZyUWg5bFEzYjBHYWlIM1R2YS85?=
 =?utf-8?B?aHA4cWhUODNRUkdhVWY5THJzWmg2MU9zUllsdy8vemQ0QlJrdllrNERyM1hT?=
 =?utf-8?B?U2xiaWtRTjNQdHVuZEVZRDhYQkc4R2RMUmJDY0x1SlFMT2c4MU1MOEsyWktB?=
 =?utf-8?B?ZS90K1JFby9HUlBhK1hvelgxanVpa0RCV2V0Rk5sUkNFK2J3ZWd5aThWdGw1?=
 =?utf-8?B?MmR1dXlOVTZCQ3BJaXd1RlFHL29sZzdrVFo5VVQwMDdsZkozYW1YdEJucXdx?=
 =?utf-8?B?d0RCZ214cE1rVThhelZvQ0YvaFVoUWF0M0tGSUpRRm9qOXpmUVZXY2NsTEVD?=
 =?utf-8?B?YzdJNTltUnBKek9uTE1YekVTSjdpMlpsOWdMcCt0dUcrbmNOYXRGTHJoT2Ny?=
 =?utf-8?B?eThmK2oxZ0tBVG9LdXVYZVV2czBDeDV6Rzl1UXRGMEN6UVlxVWlSWTlackQr?=
 =?utf-8?Q?r3NYjieI9qyBLmKVcWVYFlsyfltf0t/J?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjJETjRtM3JhemlEeUN4Smdsdlkra1JObXozV05lZFYyRGpxSzh4eUhZaXND?=
 =?utf-8?B?RGdRSTRDMXB3TkFlUVh2QXpiRVhxaGV1QXpHN05HSTVaWWVwblpVeWFOMFZh?=
 =?utf-8?B?dWx3L0cvY0p1N1lMWlNNU1RRZ0FQN0c1dnVnZHZ1S2R3V1hyNzB5bmxlOSsz?=
 =?utf-8?B?dFNtUjNjN2lVeUNJUlk3UTJBUE51d1pkNkNFdmt0aU5rRGxGcHp2MmphQjc0?=
 =?utf-8?B?ekh6THc5V0k4Z1lSdkxYMFZMLzk5UW1kVlBFcUtPaHQ3MGtRV1Y1Q0M3UE9E?=
 =?utf-8?B?NGZSZFVXbTIwdTliYks3UXJSMXFSd3dmZ29Wck9iMTU0bUxGZE9XcHhWdUhl?=
 =?utf-8?B?andoWFY2elk2SmxKaE5tL0lvRDh3SlRHR0JlVHd6VzVtN1NLOW9ZN3oweGZE?=
 =?utf-8?B?Ynl2RXVWbkR6ZjF1V2pZMlE1U0xmZUVGWm0zcURQcWIrU3gvVDFCenNlOWJC?=
 =?utf-8?B?VEJhczBqdk9Jc1FoSTNNbDh5M2dHeFRUT3dBY3JCM1FjekpSSE93Zm5nU0ps?=
 =?utf-8?B?N2U3aUhZZFlENDh1cGkxWUY5UmU5Yy9UK2NHNDRXT2JVZ2pVdE03TkZPOEZZ?=
 =?utf-8?B?L0JhMUdHZFVYYi9aWmdwNTZhdVVPN252QTFsb2w2VDNSVUw0aDRrLzR4RzNx?=
 =?utf-8?B?dVpjYWh2UGZrbi83bzhsS1VCOGQ5bG1FUzBsNG5QOU84VC82Q1NBRWdtd0Q4?=
 =?utf-8?B?czdHcFVFeEFSbEVVUTBJRjZCWUl4ZjNBZjd4dkRBV0tFL0dnYmgvSEpINEhn?=
 =?utf-8?B?eHJuQkFPQ0NXOEtYMDd5MDVESm03U3RTcmhwbmFqK1JvV1ZqMnZxRGRiTkM4?=
 =?utf-8?B?Z1hMTThQQmN2V2l6QUt0NXBHQ00va2licXFBNXVlZHg0MGVRQkxKN3k0TTFs?=
 =?utf-8?B?VU1aTDlsT1RBZml2c2hlTCsrRUdEZjRzZE1LWUpQYndGVHVBMnZwV1VnQUtw?=
 =?utf-8?B?MGZwbURBRjhFOWNMUmhmc0FGSmUvSjRXenRNNEJ4R0xTaUlCNHUyeFRUTWlQ?=
 =?utf-8?B?VTBuUncyUk1pNno4WkZFaFFWcm9CQ1ZCcFVidFllSDZ3d09tTW4yOTFoUTQ2?=
 =?utf-8?B?N2N0MWZyVjNVMkxmMndBNlVDaFFXMmEzZ28xWmQvRG11dkIzQ3BUM2luNCtE?=
 =?utf-8?B?QkovNm9EZ3daRXJZZDNvUWNCZE4xeThwajUyQjQ0RUlvdEYyUVNpTVM5MHh4?=
 =?utf-8?B?Sm0rZFFNVStOUWx3UFBaMm4rcW9URituYkVrNjNvQ25Dc1NEdWFnNGxuc0Js?=
 =?utf-8?B?c2Zmc0pzREFKYkxiS3FXMnBlejRoRmVPN1p3TWUxTERaNmY5MXZVb05lbTM4?=
 =?utf-8?B?K09wMVB6VUx3bG5YOWxiVXBKald0R2dyOGlYaTFWQWhFWkltUW5jZndYbnhL?=
 =?utf-8?B?UUQwSlcwREt3ZkxqQlFrZlYweDNuUitZUnhCclUrRlJ2OUgwNVN4a2xmSjln?=
 =?utf-8?B?Q3VvSzQvYWFFb1pCSVNtaEFaTkN6dHUxbkk3QWF3cy8xTGMwTkw1cExWQmgv?=
 =?utf-8?B?S3dZbVNBK2lZWW5ld0JzanRMQTlKZnkzcnhqZUJEdUJ0SkRnYVNFaHo3ekpD?=
 =?utf-8?B?WENybFdGMTRCdzFlZnY0TTlQUTl6SjdYQmRSMHlrR1FTazRDWjk1Ry93U2l6?=
 =?utf-8?B?bFFKb2w2TVorejBkYzJVZk1FcENMQmZpVXV3OHUrY21zZFFVTXFpZHNnT082?=
 =?utf-8?B?OW1tVXczdnlQVGlDMmE5aC80ckJjaEpUZHVESVlUZ0lLTmpXSm1nU2RVQmhP?=
 =?utf-8?B?NmllTnBJNVBoSTRNR09TSlUxQTNCYjdyd1ZuWExCd0RSTmkvT0QxVmdMbHZo?=
 =?utf-8?B?eTFNdlZUWFlVMTVOSFQ1NEJTazdseHk4TDJHV2tPcEkzUlhWVTFwczY2cTJ4?=
 =?utf-8?B?MzkzdzVjWW5CekV1OHBXZnVyaXdyc3pYTEthK1BQNmJ1UkZmelZvbFMrclIx?=
 =?utf-8?B?NVB2MnhoOFYwUFlPN2c0ZUNjQWZRcDhNdGxkaFB4ek9sdG9TeW9rVGN3RURB?=
 =?utf-8?B?dnBRait5QklEbnpnRkdvakN2aTdVTXNjODJ5Nm5IZ1JrUlE5d2dxVis5Q2Ji?=
 =?utf-8?B?aFVWdEJaNkJGTXljRFI3djBTRGN4MkxwRXh0TjJpOGxSQkxBcDhuUkdmUUVV?=
 =?utf-8?B?cFdsRzkyK3NCaWh5WVplNmtwR2w3dDNqdlVBNGwrY1hmMHpoTzJObFlualgw?=
 =?utf-8?B?MGNsK2NuZms4aG9NU3NJWnpMc3JISnMrcDVlZ3RLdWF5M2kxUHlLclpFMVpI?=
 =?utf-8?B?SUhXeHFkZG1oU1RQUFlZdThod3hqZi9FN2E1c3M1TUs2T2FWNHlRZVdlOWNP?=
 =?utf-8?Q?DUCTbb4UVMwDkHEOih?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11703c3b-c8f8-42a0-13b0-08de51ec116b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 15:05:48.3638 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lUAQw+KMkktNxVqbleLHUDlEOCjq74jvNYghmL3rOys48O5L4UEd6uPz0TwLoqbi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7604
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

Hi Honglei,

On 1/12/26 15:14, Honglei Huang wrote:
> 
> Hi Christian,
> 
> Thank you for the `mremap` suggestion!
> 
> I have actually experimented with this approach, but it hits a scalability wall.
> 
> For example, a single Guest userptr can easily correspond to thousands of scattered VMA chunks in QEMU. Stitching them with mremap consumes thousands of map counts per allocation, quickly exhausting vm.max_map_count and making the operation inefficient due to VMA management overhead.

Yeah, I've also feared that this could be a problem.

> After evaluating multiple options, the proposed kernel-side batching is currently the most reasonable and efficient solution found as far as I can see.

As far as I can see that will not work either. Adding that many MMU notifiers has pretty much the same problem.

The only doable way I see is that we have a new userptr IOCTL which creates an userptr BO from an array of VAs but registers the MMU notifier for the full range lowest..highest address.

Can we at least assume that all addresses are in the same VMA?

> I will continue to explore optimized implementations to address your

To avoid work which won't be used please stop doing that until Felix and I had a chance to decide which approach to follow.

Regards,
Christian.

> concerns.
> 
> Regards,
> Honglei
> 
> 
> On 2026/1/12 21:14, Christian König wrote:
>> Hi Honglei,
>>
>> On 1/12/26 13:57, Honglei Huang wrote:
>>>
>>> Yes, you are absolutely correct. The use case is exactly userptr handling in QEMU for KFD SVM support.
>>
>> Well userptr and at least HMM based SVM are two completely different things, but I think your use case is just to import selected pages from the guest as userptr into the driver instance on the host side, correct?
>>
>>>> "What we could potentially do is to create an userptr which is not backed by a range in the user space VA, but rather individual offsets."
>>>
>>> I'm very interested in understanding how to implement this "single object with individual offsets" pattern properly.
>>>
>>> Since standard `mmu_interval_notifier` is designed for contiguous VA ranges, my main question is how to handle invalidation for a set of scattered offsets
>>
>> Yeah exactly that's the point: This is use case is not supported at all by MMU notifiers!
>>
>> MMU notifiers are designed to have a handful of ranges to invalidate, and *not* individual pages. So even the core Linux components can't handle this use case efficiently.
>>
>> We would need to modify the MMU notifiers to do this and that is extremely unlikely to happen.
>>
>> What could maybe work is to avoid the problem from a complete different direction. mremap() can be used in userspace to make scattered VA addresses look linear.
>>
>> See the MREMAP_DONTUNMAP flag to the mremap() system call here: https://www.man7.org/linux/man-pages/man2/mremap.2.html
>>
>> So what could be done is to instead of giving the driver hundreds of different userptr VAs to map into a single buffer map them in userspace into a linear VA and then use that instead.
>>
>>> with a single notifier:
>>>
>>> 1. Notifier Registration: Would we register a single notifier covering the entire min-to-max VA span of all offsets? Or is there a way to make a notifier aware of a non-contiguous list?
>>>
>>> 2. Structure: Should we introduce a new `kgd_mem` variants that holds a scatter-list of `(va, size)` pairs instead of `(start, size)`?
>>
>> Please drop any plan to implement this in the KFD interface. I think both Felix and I agree that this isn't feasible any more.
>>
>> Regards,
>> Christian.
>>
>>>
>>>
>>> Regards,
>>> Honglei
>>>
>>> On 2026/1/12 18:12, Christian König wrote:
>>>> Hi Honglei,
>>>>
>>>> as far as I can see this is only very very trickily doable.
>>>>
>>>> What exactly is the use case for this? Userptr handling in QEMU?
>>>>
>>>> What we could potentially do is to create an userptr which is not backed by a range in the user space VA, but rather individual offsets.
>>>>
>>>> And yes in general you need a single MMU notifier for this, but the notifier mechanism is actually not really made for this use case.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>> On 1/10/26 03:30, Honglei Huang wrote:
>>>>>
>>>>> Hi Christian,
>>>>>
>>>>> Thank you for reviewing the patch. You mentioned the MMU notifier range
>>>>> handling is incorrect - I'd really appreciate your guidance on what the
>>>>> proper approach should be.
>>>>>
>>>>> Specifically, could you help me understand what's wrong with the current
>>>>> implementation:
>>>>>
>>>>> 1. Is the per-range mmu_interval_notifier approach fundamentally flawed?
>>>>> 2. Should multiple ranges be handled with a single notifier instead?
>>>>> 3. Is there a different mechanism I should be using for scattered userptr ranges?
>>>>> 4. Are there locking or synchronization issues I'm missing?
>>>>>
>>>>> I want to understand if this is:
>>>>> - A fixable implementation issue where I can correct the approach and resubmit, or
>>>>> - A fundamentally wrong direction where I should pursue a different solution entirely
>>>>>
>>>>> Either way, I'd value your technical guidance on the correct approach for
>>>>> handling multiple non-contiguous userptr ranges, as the underlying performance
>>>>> problem in virtualized environments is something I need to solve.
>>>>>
>>>>> Thanks for your time,
>>>>>
>>>>> Regards,
>>>>> Honglei Huang
>>>>> On 2026/1/9 17:07, Christian König wrote:
>>>>>> Hi Honglei,
>>>>>>
>>>>>> I have to agree with Felix. Adding such complexity to the KFD API is a clear no-go from my side.
>>>>>>
>>>>>> Just skimming over the patch it's obvious that this isn't correctly implemented. You simply can't the MMU notifier ranges likes this.
>>>>>>
>>>>>> Regards,
>>>>>> Christian.
>>>>>>
>>>>>> On 1/9/26 08:55, Honglei Huang wrote:
>>>>>>>
>>>>>>> Hi Felix,
>>>>>>>
>>>>>>> Thank you for the feedback. I understand your concern about API maintenance.
>>>>>>>
>>>>>>>    From what I can see, KFD is still the core driver for all GPU compute workloads. The entire compute ecosystem is built on KFD's infrastructure and continues to rely on it. While the unification work is ongoing, any transition to DRM render node APIs would naturally take considerable time, and KFD is expected to remain the primary interface for compute for the foreseeable future. This batch allocation issue is affecting performance in some specific computing scenarios.
>>>>>>>
>>>>>>> You're absolutely right about the API proliferation concern. Based on your feedback, I'd like to revise the approach for v3 to minimize impact by reusing the existing ioctl instead of adding a new API:
>>>>>>>
>>>>>>> - Reuse existing AMDKFD_IOC_ALLOC_MEMORY_OF_GPU ioctl
>>>>>>> - Add one flag: KFD_IOC_ALLOC_MEM_FLAGS_USERPTR_BATCH
>>>>>>> - When flag is set, mmap_offset field points to range array
>>>>>>> - No new ioctl command, no new structure
>>>>>>>
>>>>>>> This changes the API surface from adding a new ioctl to adding just one flag.
>>>>>>>
>>>>>>> Actually the implementation modifies DRM's GPU memory management
>>>>>>> infrastructure in amdgpu_amdkfd_gpuvm.c. If DRM render node needs similar functionality later, these functions could be directly reused.
>>>>>>>
>>>>>>> Would you be willing to review v3 with this approach?
>>>>>>>
>>>>>>> Regards,
>>>>>>> Honglei Huang
>>>>>>>
>>>>>>> On 2026/1/9 03:46, Felix Kuehling wrote:
>>>>>>>> I don't have time to review this in detail right now. I am concerned about adding new KFD API, when the trend is moving towards DRM render node APIs. This creates additional burden for ongoing support of these APIs in addition to the inevitable DRM render node duplicates we'll have in the future. Would it be possible to implement this batch userptr allocation in a render node API from the start?
>>>>>>>>
>>>>>>>> Regards,
>>>>>>>>       Felix
>>>>>>>>
>>>>>>>>
>>>>>>>> On 2026-01-04 02:21, Honglei Huang wrote:
>>>>>>>>> From: Honglei Huang <honghuan@amd.com>
>>>>>>>>>
>>>>>>>>> Hi all,
>>>>>>>>>
>>>>>>>>> This is v2 of the patch series to support allocating multiple non- contiguous
>>>>>>>>> CPU virtual address ranges that map to a single contiguous GPU virtual address.
>>>>>>>>>
>>>>>>>>> **Key improvements over v1:**
>>>>>>>>> - NO memory pinning: uses HMM for page tracking, pages can be swapped/ migrated
>>>>>>>>> - NO impact on SVM subsystem: avoids complexity during KFD/KGD unification
>>>>>>>>> - Better approach: userptr's VA remapping design is ideal for scattered VA registration
>>>>>>>>>
>>>>>>>>> Based on community feedback, v2 takes a completely different implementation
>>>>>>>>> approach by leveraging the existing userptr infrastructure rather than
>>>>>>>>> introducing new SVM-based mechanisms that required memory pinning.
>>>>>>>>>
>>>>>>>>> Changes from v1
>>>>>>>>> ===============
>>>>>>>>>
>>>>>>>>> v1 attempted to solve this problem through the SVM subsystem by:
>>>>>>>>> - Adding a new AMDKFD_IOC_SVM_RANGES ioctl for batch SVM range registration
>>>>>>>>> - Introducing KFD_IOCTL_SVM_ATTR_MAPPED attribute for special VMA handling
>>>>>>>>> - Using pin_user_pages_fast() to pin scattered memory ranges
>>>>>>>>> - Registering multiple SVM ranges with pinned pages
>>>>>>>>>
>>>>>>>>> This approach had significant drawbacks:
>>>>>>>>> 1. Memory pinning defeated the purpose of HMM-based SVM's on-demand paging
>>>>>>>>> 2. Added complexity to the SVM subsystem
>>>>>>>>> 3. Prevented memory oversubscription and dynamic migration
>>>>>>>>> 4. Could cause memory pressure due to locked pages
>>>>>>>>> 5. Interfered with NUMA optimization and page migration
>>>>>>>>>
>>>>>>>>> v2 Implementation Approach
>>>>>>>>> ==========================
>>>>>>>>>
>>>>>>>>> 1. **No memory pinning required**
>>>>>>>>>        - Uses HMM (Heterogeneous Memory Management) for page tracking
>>>>>>>>>        - Pages are NOT pinned, can be swapped/migrated when not in use
>>>>>>>>>        - Supports dynamic page eviction and on-demand restore like standard userptr
>>>>>>>>>
>>>>>>>>> 2. **Zero impact on KFD SVM subsystem**
>>>>>>>>>        - Extends ALLOC_MEMORY_OF_GPU path, not SVM
>>>>>>>>>        - New ioctl: AMDKFD_IOC_ALLOC_MEMORY_OF_GPU_BATCH
>>>>>>>>>        - Zero changes to SVM code, limited scope of changes
>>>>>>>>>
>>>>>>>>> 3. **Perfect fit for non-contiguous VA registration**
>>>>>>>>>        - Userptr design naturally supports GPU VA != CPU VA mapping
>>>>>>>>>        - Multiple non-contiguous CPU VA ranges -> single contiguous GPU VA
>>>>>>>>>        - Unlike KFD SVM which maintains VA identity, userptr allows remapping,
>>>>>>>>>          This VA remapping capability makes userptr ideal for scattered allocations
>>>>>>>>>
>>>>>>>>> **Implementation Details:**
>>>>>>>>>        - Each CPU VA range gets its own mmu_interval_notifier for invalidation
>>>>>>>>>        - All ranges validated together and mapped to contiguous GPU VA
>>>>>>>>>        - Single kgd_mem object with array of user_range_info structures
>>>>>>>>>        - Unified eviction/restore path for all ranges in a batch
>>>>>>>>>
>>>>>>>>> Patch Series Overview
>>>>>>>>> =====================
>>>>>>>>>
>>>>>>>>> Patch 1/4: Add AMDKFD_IOC_ALLOC_MEMORY_OF_GPU_BATCH ioctl and data structures
>>>>>>>>>         - New ioctl command and kfd_ioctl_userptr_range structure
>>>>>>>>>         - UAPI for userspace to request batch userptr allocation
>>>>>>>>>
>>>>>>>>> Patch 2/4: Extend kgd_mem for batch userptr support
>>>>>>>>>         - Add user_range_info and associated fields to kgd_mem
>>>>>>>>>         - Data structures for tracking multiple ranges per allocation
>>>>>>>>>
>>>>>>>>> Patch 3/4: Implement batch userptr allocation and management
>>>>>>>>>         - Core functions: init_user_pages_batch(), get_user_pages_batch()
>>>>>>>>>         - Per-range eviction/restore handlers with unified management
>>>>>>>>>         - Integration with existing userptr eviction/validation flows
>>>>>>>>>
>>>>>>>>> Patch 4/4: Wire up batch userptr ioctl handler
>>>>>>>>>         - Ioctl handler with input validation
>>>>>>>>>         - SVM conflict checking for GPU VA and CPU VA ranges
>>>>>>>>>         - Integration with kfd_process and process_device infrastructure
>>>>>>>>>
>>>>>>>>> Performance Comparison
>>>>>>>>> ======================
>>>>>>>>>
>>>>>>>>> Before implementing this patch, we attempted a userspace solution that makes
>>>>>>>>> multiple calls to the existing AMDKFD_IOC_ALLOC_MEMORY_OF_GPU ioctl to
>>>>>>>>> register non-contiguous VA ranges individually. This approach resulted in
>>>>>>>>> severe performance degradation:
>>>>>>>>>
>>>>>>>>> **Userspace Multiple ioctl Approach:**
>>>>>>>>> - Benchmark score: ~80,000 (down from 200,000 on bare metal)
>>>>>>>>> - Performance loss: 60% degradation
>>>>>>>>>
>>>>>>>>> **This Kernel Batch ioctl Approach:**
>>>>>>>>> - Benchmark score: 160,000 - 190,000 (80%-95% of bare metal)
>>>>>>>>> - Performance improvement: 2x-2.4x faster than userspace approach
>>>>>>>>> - Achieves near-native performance in virtualized environments
>>>>>>>>>
>>>>>>>>> The batch registration in kernel avoids the repeated syscall overhead and
>>>>>>>>> enables efficient unified management of scattered VA ranges, recovering most
>>>>>>>>> of the performance lost to virtualization.
>>>>>>>>>
>>>>>>>>> Testing Results
>>>>>>>>> ===============
>>>>>>>>>
>>>>>>>>> The series has been tested with:
>>>>>>>>> - Multiple scattered malloc() allocations (2-4000+ ranges)
>>>>>>>>> - Various allocation sizes (4KB to 1G+ per range)
>>>>>>>>> - GPU compute workloads using the batch-allocated ranges
>>>>>>>>> - Memory pressure scenarios and eviction/restore cycles
>>>>>>>>> - OpenCL CTS in KVM guest environment
>>>>>>>>> - HIP catch tests in KVM guest environment
>>>>>>>>> - AI workloads: Stable Diffusion, ComfyUI in virtualized environments
>>>>>>>>> - Small LLM inference (3B-7B models) using HuggingFace transformers
>>>>>>>>>
>>>>>>>>> Corresponding userspace patche
>>>>>>>>> ================================
>>>>>>>>> Userspace ROCm changes for new ioctl:
>>>>>>>>> - libhsakmt: https://github.com/ROCm/rocm-systems/commit/ ac21716e5d6f68ec524e50eeef10d1d6ad7eae86
>>>>>>>>>
>>>>>>>>> Thank you for your review and waiting for the feedback.
>>>>>>>>>
>>>>>>>>> Best regards,
>>>>>>>>> Honglei Huang
>>>>>>>>>
>>>>>>>>> Honglei Huang (4):
>>>>>>>>>       drm/amdkfd: Add batch userptr allocation UAPI
>>>>>>>>>       drm/amdkfd: Extend kgd_mem for batch userptr support
>>>>>>>>>       drm/amdkfd: Implement batch userptr allocation and management
>>>>>>>>>       drm/amdkfd: Wire up batch userptr ioctl handler
>>>>>>>>>
>>>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  21 +
>>>>>>>>>      .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 543 +++++++++++++++++-
>>>>>>>>>      drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      | 159 +++++
>>>>>>>>>      include/uapi/linux/kfd_ioctl.h                |  37 +-
>>>>>>>>>      4 files changed, 740 insertions(+), 20 deletions(-)
>>>>>>>>>
>>>>>>>
>>>>>>
>>>>>
>>>>
>>>
>>
> 

