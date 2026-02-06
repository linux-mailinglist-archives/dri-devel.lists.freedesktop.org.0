Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKDtG6uhhWlKEAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 09:09:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 225ABFB45B
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 09:09:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B98E610E4C3;
	Fri,  6 Feb 2026 08:09:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wJeqMnit";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010015.outbound.protection.outlook.com [52.101.85.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7198210E4C3;
 Fri,  6 Feb 2026 08:09:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n4lKshvjLgQIZmCimBeUQa3oSR7EWFzUHBlVrWbONteEpmaJJ2cfXeBeBj/soWaU1/SHdVCSfw254EBzIkQjnu3jfwiiiqAHGSylUk02DigBh6Bc5kvSON7Lc+3flpk8dSzI7TR69HOCNs/y03bM4chgNUNTkau2SUI2DnirM9eIVwE3rFYzMtrabdY6bEuBx/8QeqyOkJSEEDsFEb4xfP0WCDBPAAdm5LMGD7Scm/oLdAsTZ5ECE0tzClF8YCR8rVekswqojUr8oLsiOiKwalmPq3aEd3esYY8PySZlrjCtpr9ukbFrSTX3CUUv2Mu9+WXB17882RRrIx3ZiVyrJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uElepliSNJ1OM7eyHKzM/jehiPnTst25rEzkjnXOfIY=;
 b=g0zA/uXCYQ5HzP3NicZLYkusnuACshmiiUhhU+xG5udtVlKCq9emQDNSEv6lq4ubQ/3Nj7gPlP4oHiHowBxyWcVLkQgssOGcJ09dwPmw7apvCRZx93o1snHveyZwtIkNiMlLhi6TQvBJ2cV0s39xzEul5tQ66E1qHJsv0/kVGt8SuSF0JU3buFAjJDbNjNqxX1OlIBqJzarGFHPCSvOrBL3a8OtVQvNoTn0v4VHWN0xUqcAA4GdkVorq1EhZehB7IhN9te17se74z554dfnKxnseaVLuzXEugPYgmeDA+dvpATQGI73+VbCLj8y1/gFF0352Lz4vgeSQ2Y3aI79nMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uElepliSNJ1OM7eyHKzM/jehiPnTst25rEzkjnXOfIY=;
 b=wJeqMnitgRNI+LvqDzHuHBa+/IuAIY8+iBGldJJRB1RGQWB9ueYhkI40mFzFzNaQgow6X/jOgOfptiG8ZxPm/MvoGpK9Yqw4Qwq6DyQRCIDqo96VNH8XuyBfOVQrxB7xP0Nko5yoCZ/QL8+Ec2JKc6W95fJOVIfoio6zes6TbNA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS5PPF884E1ABEC.namprd12.prod.outlook.com (2603:10b6:f:fc00::658)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.15; Fri, 6 Feb
 2026 08:09:07 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 08:09:07 +0000
Message-ID: <321402ae-bb5f-44e5-b7ac-a775c5cf0ab4@amd.com>
Date: Fri, 6 Feb 2026 09:09:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] drm/gem: Make drm_gem_objects_lookup() self-cleaning
 on failure v5
To: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20260205154215.1460845-1-srinivasan.shanmugam@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260205154215.1460845-1-srinivasan.shanmugam@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0435.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS5PPF884E1ABEC:EE_
X-MS-Office365-Filtering-Correlation-Id: d8dba815-5715-4083-da85-08de65570019
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UHZDSi9TaFk5Z2RNUXE4M1NZUk1oT0ZtajhhYzdQQVBRQ1ZuWVMvTER4dDVx?=
 =?utf-8?B?WWhnQWNjclk0eTFONEdTclZpdThxcnc5MCtqZmU2RUl6cC9DckRnaXI3OFRG?=
 =?utf-8?B?NGtKNGFsNDVOTFVla3E4eWdkV1FvNXRnSlhTYnYycXhHclo1ODBsNklSbThs?=
 =?utf-8?B?OW03WDBwdVRhNHlqL0dIblNVd0NNclN4aEt0V3BWNnNGbUlXamN4SWRTNXlK?=
 =?utf-8?B?aXRBYU9jeTFSQ3l3NldqSWlhaWtJdGl6ZjA5NVkyTHhzNTltSURpWUFUdW5U?=
 =?utf-8?B?RXNsOFpXaHFIMzFBZGpjOXNieXJxYmVNbk9aNFpIOWxEeVN1NjR5Q3pEN1BI?=
 =?utf-8?B?cGpRQXBwWkVkanRsMElQU1hMWFRaN2xJOUxvSEsyNmo5UXhkY0lGSWMzTU5G?=
 =?utf-8?B?eW54R2ZqQWhkYzFzVWZNUFJzY2UxWVB5TkcwRUZEaUsyd0xZNDFUWW1oMGhz?=
 =?utf-8?B?NHF2NTlWVUg0aU1xbHMvYVBFUzI4dnkvb0Z4VUlZQ25YUlRrMmV1UDJXaWJV?=
 =?utf-8?B?UENiZlBsMUxDNVl1Y1lZdERHNmJVOW5IMEYzUUlvbFlUekoyckhFTG9FOTU5?=
 =?utf-8?B?eDQwQm1FeXk5QXVJcmNqY3dIY29rWmFCMzRTYnlSUlVTRlVwV2J6QXhWWVZ3?=
 =?utf-8?B?UWN1bEQ0bk9wakVVcS9zcGxXYXM5QUMzdEEwU3IvYXRCcHlJRlVReDY1WEpx?=
 =?utf-8?B?YlNQdWpwODZ1STFGZndGOTVHNUxpdGU5SUN2NGJQT0YwM0xHNkZCaEtNQ0ha?=
 =?utf-8?B?QmxjZU5FeXdhbkNUbHdxK3hPWWF1aUE0WHo1K1M0azJFUko5dnRpYmtaNGdM?=
 =?utf-8?B?S0twYTFNL0REWDh5U2xpVmg1QTN2MGY1SmdwT2ZJYmxLN0NLbjNxMVFzOVh5?=
 =?utf-8?B?Wmpta2FnV3ExWjlSYW95NnVVaDRrOVM3N1ltQjZENXZmaWZqY05KVVdWTE5S?=
 =?utf-8?B?U05FRDc0TnRJWk00RzU0V0VueFNsYW9IODd5Sjl6eDhFcVM5a0RFek1CUUo1?=
 =?utf-8?B?NGRDNXRvZytLYiswK3RIWVNVQ3NQdlQrVUpWY0RUV043VFJQWFlleVFxckRO?=
 =?utf-8?B?QXp4K0Jtc3IyUVYrZ2U1TEZja3hDNVZ6TDNidnJLTHdPNE50NExZeUwxaW5l?=
 =?utf-8?B?a3JqU1M3blR0amlJQ0JpM21XSzdCQkhFSkxOVHJpTzYvYmVsTXNRa0NvaGpx?=
 =?utf-8?B?TE9tVWZTUTZOUHZDZWgyRHNXR3loaVNRZnZnWmVhZjVSdzdkVVhNOTltclh0?=
 =?utf-8?B?d3ZjSmpXLytmNzdnc1hqRWpPL1hMd2d3cTdoaDB2T05aYUtTclJtc01IUUs5?=
 =?utf-8?B?MUFzcFdDcUt1ZWdvNHgxbG9hbTAxaTEzZWc3eXlqVytNVGNzRlR0YzVOVVVk?=
 =?utf-8?B?YmVORWpBNFJpdHJxN3VxcnhUZVFtcFlYSnBtTkdjNC9HaTZsb1dObTNVcG40?=
 =?utf-8?B?MTV2MXJmclVuWlEwQmJPMmhKMmkyV0cxWDdVdUJaV1VwcmRYVk8yNG5nNTFU?=
 =?utf-8?B?U3ZiMWNhSWFFd2pWQmQ3NERhenR5M214UzV3Njh3ODJDUkhVcnhwVUhWbFRD?=
 =?utf-8?B?ampaUkNuYS9UOU9tU1VLaHVWa1ZFeGY5YlNmaXpFN29pckhpb1JyQWFGVVl4?=
 =?utf-8?B?N2RLOTU2c1QzTDdKeHVBNEROcGpHMi9keGovM3JiZXRkTkJrQzFBTFYzUGN3?=
 =?utf-8?B?WklUcVZpd2VwRmFPaWp5a2EyTVcvV0g2MEdwTmpVeWdRa2ovdzVTQUFOTitI?=
 =?utf-8?B?RllZUVdUZjlOUTB6eTEwL2c4U2d2VHJnVzYzUzlmN0VnaDJlV3JkdjdocHJp?=
 =?utf-8?B?VzFkUm9EWmExanpkT1JHUXBzNXFFMnhOR3NNL0xha1R6dllDbE5wOTZpZGU5?=
 =?utf-8?B?cjFQbENUckVWZVpsVGlaTUpoZVEzWDhoMTFsOTBrUHFUQWVXdEJYM3Zkbmhh?=
 =?utf-8?B?Z3ZSYWxseTdxNlpkdWJyOEpTSk5FcEhBNzJaN1pqWmdwR1N6dzl2b3F6dkFi?=
 =?utf-8?B?VXFUOEtVNlQ2Mnh1WGZYTmw0SldyRWkzZm9xMkNieXkyNktVU3FTYWZ3c0RC?=
 =?utf-8?B?OGpRaVVNUEJHRGZXK0xJSWVqNHVuNVcvMlVHM0JKYzhVMmRZOEgvcW5uQndm?=
 =?utf-8?Q?S3LU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3BPcXNPYnFwaHJmZ1JZZmdPOE10VityNldSdUlsdFYwK2RnbFVoZFNDdS9T?=
 =?utf-8?B?MlJ3cmlxYjNXbUVFWGwvUm1JV0ZzUW9qdmFHUi9QZkpVdVB2QmtYK3RyUlQ4?=
 =?utf-8?B?TjJCbHZ6WkYxVHAxeFZ6YUtvSHd0TFRMU1dteTloNkRFd3JUQ3hna2Y0ZnB5?=
 =?utf-8?B?aTVzWjJHS0dTMFBlNG5hV0ROUlhWMmlGRFpWRkFWWkViekRZWmxzbXBMRnhz?=
 =?utf-8?B?YytjaEhEd3ppZFR0WGMwNzlycmVNdzM1dFNBRi9Va0Q3UjRwRTVXMjhoNXVH?=
 =?utf-8?B?ZXljZmt6Ty9vcE45QXVoVmVMVzRkTkczV1kzUmNPWmlTV2Z5QkxXdGNYN0NV?=
 =?utf-8?B?d0k3VDVRRU1KWlllbVdVeFhzdDBIZkdMWllZZ01oeG1SMHZYN1NDYUtKTFJE?=
 =?utf-8?B?Z2lXNHYyTGhkK0FJMm91NGtzZ01ZeWVDazhlejczdy82SnpVaE8zd3lGOVF0?=
 =?utf-8?B?Zm4zZ3h6TVFzUUxaanZPYWFKQ0dENHlYYVF1NWZ6bU80VlAxNUNMWS9wYTlr?=
 =?utf-8?B?VVdxRXluSU1uREkyTXFaT0NFSGlveGhaY3ViMWpWZ1lTTkUvdUdTTXRxQi9x?=
 =?utf-8?B?V29HWjNCMTJsUjNnaWhYN0U3Y2tGUjR0b2xWUDBEcjVmK2pHTEdyYitoWlpL?=
 =?utf-8?B?MXZrektweHVzTmFvR3FyN1NaeUx2MzlpMHkxajFsS0ZMSjlNZ0IrTlp4ZXRS?=
 =?utf-8?B?NGZxajFEeU53T0RCbHI1WlNEdXYxZGV2aThORjNDVlpRbVVqMklkZUQxSWZx?=
 =?utf-8?B?ekZENmlNejc0V2plT09qU1dMUHlMdCtoU1hRcFlwdkdHN2VlU2FQaGpxeEZL?=
 =?utf-8?B?dU5uVkxGSmZ6M2xvT1k5dTJOVmpEY2E3dEp6V3ZwSlhPVHZFR1dsZXFtSDRk?=
 =?utf-8?B?bFdxcFFxSVFzdUV2ZUhIRXJrR1JDa2NIM0M5djV2ODdZOEhqRVoycERZWWdX?=
 =?utf-8?B?V21lUy9Lc3ZQb0RvR0ZWcFJnM3Y3ZHVKcXA3Rmk5aG9jZHhVZkZ2YXpxWlE5?=
 =?utf-8?B?WE1DYmd2Nldha2hNVjlRR25XWTd1aEJ4TzVEZzQ1MHIwVnduSmdWQStLdEM5?=
 =?utf-8?B?eDNia0dLbWtPMWVLTHJHdHMzeGFyZmFKTGhZR2luTnhObklQRDN0VGs2Nko3?=
 =?utf-8?B?cVducTkrVXpMUFFNZTVJZUZOT05aUEd2RFM2OHBSRHZMZ0lwZmFidll2VXRo?=
 =?utf-8?B?TFJScFhIYldZa0IxbXNFMDJLOEYvamVwdUZHZU9aWG5RVWhGQSt1cmxpNTFu?=
 =?utf-8?B?WnV6QWxpa1kyNnQzRG5LSUcxWDZWOGNOM2ppT0E2YlFZSllIWmFjd053d3dK?=
 =?utf-8?B?Z3VYSmlMbTlxenRTMmU5V3hRMGxJREdBUXk1S2wzbFFWTGVHSFRwQ1ZsWDBQ?=
 =?utf-8?B?RHZENDNUeEdVYVBGRUJwanhyaVZsZDNzR2I3MVRaWFBUQ3dGZHZvdVFET3Mx?=
 =?utf-8?B?T2llZWdmeEhLeTZPVXl2M1pnZ1VLQU5KcmxVeklWbFllS3d6RGpSb256eVVF?=
 =?utf-8?B?WjljUFBQR29DM2p5b0lTK2tsK1BpZUZmSG1Sd05JYVQ5K2VRUTlNUE1yTTZn?=
 =?utf-8?B?dkVuNGtXMzd2dUQwd0ZHaTJOaVdGMjR6UXRJRDUrU21HK21ZVTJ0RFo3d0Rt?=
 =?utf-8?B?bDhQMUpQdTZVVzltUWowNTE2bWttN2h0bTFQcG8zampwaCtmQ2VKSkZ1UFAx?=
 =?utf-8?B?ZmlVblVjZXN6RlZUUHlHYlRjU09OQ0twRmVDc3plMlhVcm9kc1FCeXJrb29K?=
 =?utf-8?B?MWh4Tm5wNjlKWHRrQkNSOTZMTDAvbGlDaktIaEpyL25oYUdWM2JWZ1o4QVA0?=
 =?utf-8?B?Ulk0NXVTMnBYQ2VSWXhZZy9tMWsxZ0JXcjhJYTRUZmxPSlhUamxoZ2pBUkJ2?=
 =?utf-8?B?clNBWWVRclIramZlZGhubnRZYi9xOUw5WlpWeURBQStEWjJEQTM5VHJLOXFO?=
 =?utf-8?B?dkVVaGRwUWZrQ0gzTVZsTExXeG1NMzdRdEJoTitEd1VoWnF2RDFvYS9GWUV2?=
 =?utf-8?B?V2F6L1ZEd3VNQUVGWjlndFNrV1hRYzg5ZGlEQWlKeEFOTkpBWFhGTldXeDNq?=
 =?utf-8?B?TkFPa1RBMDdWK29RZ2RoZVBFTjBsdGJXT29oU1ovdm9RZ2JtaEdmbVNQRTFQ?=
 =?utf-8?B?ZTU3aFIxQzFlLzd6bWxhZFRqcTdsOGFJSDFjNDY2V25sT3pXcThLUGZjWXda?=
 =?utf-8?B?WmNqTHpTbEFGQkNLREwxdi91K0JBOFdBbS9hTXZObHZydzVHNHNKRWR5aldo?=
 =?utf-8?B?R25KT0xsdUFDTlBKVG9jNVYvd0YzYUQ2NlpUNnRIME9tdlcrZ3AwbklSZWhH?=
 =?utf-8?Q?qId7FVmNBi2c+Nfo5A?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8dba815-5715-4083-da85-08de65570019
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 08:09:07.3171 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UQGHmUva8etWaMJOzcXQBw1u9uOiAbXxiUdT62XycdhESDeIxYjMK79hkTYgR+zN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF884E1ABEC
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,ursulin.net:email];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Queue-Id: 225ABFB45B
X-Rspamd-Action: no action

On 2/5/26 16:42, Srinivasan Shanmugam wrote:
> drm_gem_objects_lookup() can allocate the output array and take
> references on GEM objects before it fails.
> 
> If an error happens part-way through, callers previously had to clean up
> partially created results themselves. This relied on subtle and
> undocumented behavior and was easy to get wrong.
> 
> Make drm_gem_objects_lookup() clean up on failure. The function now
> drops any references it already took, frees the array, and sets
> *objs_out to NULL before returning an error.
> 
> On success, behavior is unchanged. Existing callers remain correct and
> their error cleanup paths simply do nothing when *objs_out is NULL.
> 
> v3: Move partial-lookup cleanup into objects_lookup(), perform reference
> dropping outside the lock, and remove reliance on __GFP_ZERO or implicit
> NULL handling. (Christian)
> 
> v4: Use goto-style error handling in objects_lookup(), drop partial
> references outside the lock, and simplify drm_gem_objects_lookup()
> cleanup by routing failures through err_free_handles as suggested.
> (Christian)
> 
> v5: Rebase on drm-misc-next, drop the ret local variable. (Christian)
> 
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Suggested-by: Christian König <christian.koenig@amd.com>
> Suggested-by: Tvrtko Ursulin <tursulin@ursulin.net>
> Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>

One little nit pick below, apart from that:

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/drm_gem.c | 45 +++++++++++++++++++++++++++------------
>  1 file changed, 31 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 7ff6b7bbeb73..5895ae09c27d 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -783,7 +783,7 @@ EXPORT_SYMBOL(drm_gem_put_pages);
>  static int objects_lookup(struct drm_file *filp, u32 *handle, int count,
>  			  struct drm_gem_object **objs)
>  {
> -	int i, ret = 0;
> +	int i;
>  	struct drm_gem_object *obj;
>  
>  	spin_lock(&filp->table_lock);
> @@ -791,16 +791,23 @@ static int objects_lookup(struct drm_file *filp, u32 *handle, int count,
>  	for (i = 0; i < count; i++) {
>  		/* Check if we currently have a reference on the object */
>  		obj = idr_find(&filp->object_idr, handle[i]);
> -		if (!obj) {
> -			ret = -ENOENT;
> -			break;
> -		}
> +		if (!obj)
> +			goto err;
> +
>  		drm_gem_object_get(obj);
>  		objs[i] = obj;
>  	}
> +
>  	spin_unlock(&filp->table_lock);
> +	return 0;
>  
> -	return ret;
> +err:
> +	spin_unlock(&filp->table_lock);
> +
> +	while (i--)
> +		drm_gem_object_put(objs[i]);
> +
> +	return -ENOENT;
>  }
>  
>  /**
> @@ -825,27 +832,37 @@ int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
>  			   int count, struct drm_gem_object ***objs_out)
>  {
>  	struct drm_gem_object **objs;
> -	u32 *handles;
> +	u32 *handles = NULL;

I might be missing something but setting handles to NULL looks superfluous to me and we now have static checkers warning about superfluous initialization.

Regards,
Christian.

>  	int ret;
>  
> +	*objs_out = NULL;
> +
>  	if (!count)
>  		return 0;
>  
> -	objs = kvmalloc_array(count, sizeof(struct drm_gem_object *),
> -			     GFP_KERNEL | __GFP_ZERO);
> +	objs = kvmalloc_array(count, sizeof(*objs), GFP_KERNEL);
>  	if (!objs)
>  		return -ENOMEM;
>  
> -	*objs_out = objs;
> -
>  	handles = vmemdup_array_user(bo_handles, count, sizeof(u32));
> -	if (IS_ERR(handles))
> -		return PTR_ERR(handles);
> +	if (IS_ERR(handles)) {
> +		ret = PTR_ERR(handles);
> +		goto err_free_objs;
> +	}
>  
>  	ret = objects_lookup(filp, handles, count, objs);
> +	if (ret)
> +		goto err_free_handles;
> +
>  	kvfree(handles);
> -	return ret;
> +	*objs_out = objs;
> +	return 0;
>  
> +err_free_handles:
> +	kvfree(handles);
> +err_free_objs:
> +	kvfree(objs);
> +	return ret;
>  }
>  EXPORT_SYMBOL(drm_gem_objects_lookup);
>  

