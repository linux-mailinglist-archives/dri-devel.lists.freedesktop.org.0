Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97333C4D97C
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 13:08:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59B1C10E55D;
	Tue, 11 Nov 2025 12:08:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="MoT7B67S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010067.outbound.protection.outlook.com [52.101.85.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17D9910E069;
 Tue, 11 Nov 2025 12:08:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rw4lPbAnvf8xbbQ15TSUJicpTil2B9E0bXrn0ejbyJSLrNqQ3SG1jnxHgACSfS4KRdh6Eq451doEXHvw/A3fDHMiWSjxOUKCopO0Fz/+TfWNyj5ZNK/v3HJMYh9O6WhuwkyNpq9cF2ARzG+8lfWYEoL1c0YkLqZdu+1DOUjNhS8TB7nOXmYFOGvQhTPHIxWj/JjDkPAKFwisMuwuZp2ib1zFkNUQ8ARKz5ZMcTjVoC5o+C9ISjpBqMzu5A6iOn+E91d5hJNH1Ul5tGFzYGhBacQZICYJ4Pvxd1/deVtGWvvXKwz91ALKCKzLnVi5BkPBhR3GRrXF0mKd5/ENeUqYoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5/uDxdwHIcGxNJB46SxuHiA+wPtJcKlj82jiY5WAbYk=;
 b=KmZYgq4IX4dyUTdSq/eHucwLAAzsbBNUM7c5hGtzwzwU6aCRbV48H7hzqutOi2iLpiqb1wYPBd2yZCuyFVXEffOauDS1crhhALN0xDiKnu3j5PRc/1j500zoiFOZB9sOV6nukjkvrTI98tIgbp8xaRAGS5K5NMbHwmYjhy3JQNkZTKofRMe+df2Rm6iILyFDPf0HtR9aLAIlfF9t4i38jnTQIjWbLPRci6egKerv5lgVXQxY8SeHrzExgPdToXcTvYf0+cFDo0R7iQgnMP2YY1k2Yg82qbadCi3hYwmhFH+7JkW3kUfQojwMXAshLBuo7bpzHrVaWcYKo2iqOIKMXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5/uDxdwHIcGxNJB46SxuHiA+wPtJcKlj82jiY5WAbYk=;
 b=MoT7B67SJqiJH7uKFf86KbKtI47IC+kqEkuPsMuZjqnPxegkRfwUdHRZL8jbYoCHKOTgA7HWNXqO8GAZvtrfmtrKwh6ioiIMdvG8u9buVlEfktlR4Im6nKrhvQr2euP15mPGiHPGMyYHyGTGd2d0KBv7k4k622UV/KZ6Vqv+8es=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by IA1PR12MB6529.namprd12.prod.outlook.com (2603:10b6:208:3a6::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 12:08:25 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062%4]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 12:08:25 +0000
Message-ID: <fd7fdf61-cb08-4dfc-ba7a-a8a5b7eb9fda@amd.com>
Date: Tue, 11 Nov 2025 13:08:17 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] drm/amdgpu: Remove driver side BAR release before
 resize
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Simon Richter <Simon.Richter@hogyros.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 Bjorn Helgaas <bhelgaas@google.com>, David Airlie <airlied@gmail.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 linux-pci@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tursulin@ursulin.net>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 LKML <linux-kernel@vger.kernel.org>
References: <20251028173551.22578-1-ilpo.jarvinen@linux.intel.com>
 <20251028173551.22578-9-ilpo.jarvinen@linux.intel.com>
 <c90f155f-44fe-4144-af68-309531392d22@amd.com>
 <aaaf27cf-5de0-c4ef-0758-59849878a99f@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aaaf27cf-5de0-c4ef-0758-59849878a99f@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0259.namprd03.prod.outlook.com
 (2603:10b6:408:ff::24) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|IA1PR12MB6529:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d435e41-3148-4870-aad8-08de211b0425
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ajlIUFNOdWZXZWRDQjRJSFV3d3Jlb3pVNk1JazMydkx6SE9FUytSZVZEV21W?=
 =?utf-8?B?NUhMYnJWcTdxN3FWeHorMkRLTGFhWWNGMlh6NzBNSDN6cFJBbnJ6dE91Mk9R?=
 =?utf-8?B?MHhCRTJnclN3aVUwUDF3NkRrNkNxeWhTOHhGR2g5emE2Y0lldnhkVi9lUVBk?=
 =?utf-8?B?TVFzRGdHQmVtVVRXY0JWOVRPVU5QSlZTRkJHNFA0TkNXQVJoVnh4NmNmY1Fw?=
 =?utf-8?B?dEQyZy9mVHFVVzl6aGtNTHc3UURnWU5HTjVaZUc3dlB4cTBUbWhaS29ZMUU5?=
 =?utf-8?B?dGMrMXUwWW5PRjgyNjR2S2RIbWFUbUF4QW5EYUR5MklJS2pVeEdJeUpNOTE4?=
 =?utf-8?B?MUpTUDVhcStPa0pTQWNEbFZYVkM1WmErZUNmS3NRblRlL0wvalEvWmkvREpr?=
 =?utf-8?B?QU9ISVVkMGMwMzFpQ0pPdUV6ZkIrMHU5bFJCMmV0QWxad2tSblY3aVArUElh?=
 =?utf-8?B?VEVCZUdrY1ZqTUVhRjB2RGI5QytWUE1hUENGdzRMYlFxd3gwcWtXczZ2Qkwx?=
 =?utf-8?B?dmY1OEJldjEwR3k2V3h5Y040TjhjajJIc0lkRHVDSUFISFM1N1ZaZnlVWW90?=
 =?utf-8?B?eVZFb1cvT0tqOTkvNG5SQXdsd05sOWQ3bjNnNGpJLzVyMVBEQ3l2TkhzR0lR?=
 =?utf-8?B?UUl3TnhoZDFpdkpTS29TYkRUeGpNL3V0V3FhMkJqN3IxTlF0YkR3SmpCRlJW?=
 =?utf-8?B?VEVKYmFYalhLdU40T2JTU0d6MUhkeU4rQVFoTXNCTE5obkNtUVB6RDRqb2pq?=
 =?utf-8?B?SnYxQXJHVGlzTXo0czlOWlVzZHk1TWE1bVMrRkZWem9mSU9qUkM1RTBrRGV1?=
 =?utf-8?B?VUxnajVRYkpQTXo4ZzZYYUVMWlBDVUlFelRPbmp5cW1EVVpFWWw3aGxIM0Rw?=
 =?utf-8?B?My9MRUdiM0RtV29OR05SK3BZU1k1NDFNK0twZjgzOU05bld2S3BLdFJ4Tmxt?=
 =?utf-8?B?ano5U0JHUk04by80ZjlWcXFpWGE5SEVyMWtORHJqNlloRFFFelpjNTRndGNJ?=
 =?utf-8?B?MHhNSndiUTZkMWs2bjRjVzdHeWZTVkMzOWJYWmpqU3dhNzc0YjloNXdwWEI2?=
 =?utf-8?B?Mkgzc01EZWxLMllvUXFmUE1wVTZ3VFhCTGEyb1hzb2xad0w4NmRHSU5lWmp1?=
 =?utf-8?B?ZFBORzk5bW41alozcVU4OFd6anB3UzE4cElWazRMMjBaaTA4R0l6anBGa2Ex?=
 =?utf-8?B?ajRERHk5eEpOZElQRlJwK1I2WkNxRy9lWFlla1hvRHZJMGJFS0JnZXZORHNH?=
 =?utf-8?B?ZXA0UnF5alpXamhRVEVwRCtuVWFHM1RSeHI1TWRxdEFCcGNFSEIyRHcwZVBl?=
 =?utf-8?B?b0o2UGZSdTFZa1dpQ2hLZGd1WlBSSUdNTmltWGlkSTFqclg0cmRKSGRkTjBa?=
 =?utf-8?B?bFMwNGtmV280dnVFSlFLTkEyeG9zdGQxSk5sWXBjM09Oc3pQL3hFN1BlTWp4?=
 =?utf-8?B?dEd3ay9WOC81Y2tXa29nZDFlbXF4aW5WUVFRNWFFZURKQlR2OEduQ08vWkI3?=
 =?utf-8?B?Ui81bFJPbmdaQTVPaWh2R3NoeExjRytVVzdXVWROdkU2Yy9NNVVuRDNDemdG?=
 =?utf-8?B?WmdFVHJNQ3hmc3lzSW9qZFdWS1RCbElSdlYxUS9wREMyWFVSV2NGMWtGOG1F?=
 =?utf-8?B?N0lPZFYxemVrM0xqczNkZkZsVlM3WWZlYXFtSGlkUkx4WkdLR3FFb2VWNE90?=
 =?utf-8?B?VGtEdlBSZ0ZvdUpEWmxIMURNa2dVZnRCbzN3dEZ2YlRvU1daUjdYRm5rK3Bh?=
 =?utf-8?B?cTJaaVZSK3MzbHhDU09ySzBKNTJVSVVZNzgrejJONlN1d1R1SldNTFlSZW5O?=
 =?utf-8?B?dmI5RGdmaFBxc2VCcW9SajNRSFA1c2ozSEdYZVZ2R3R1MU9keDZpSWNaSlpo?=
 =?utf-8?B?WDQ5aUNVSWdqNi9ob2dXQnVrYjRoaDFkUkUzZmVHVnhUNjJpZUY5QkxTc1ZK?=
 =?utf-8?Q?E7i8Sl8yd7EwXjcfUed4d7fncJ9oFR8P?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVplcnRLZDFnNGFlRUloTFdOOTBBaDlMQ3JWZ1FldTkzRUtkTklpbWk4QlpO?=
 =?utf-8?B?YTRqNEZOWTByeDVoeFJNUUZoUndHN3l5VkE5QzhMcUlDOXh2UDRqa3BOaHU1?=
 =?utf-8?B?SDAwR254QXVZaU5wR2pFTTNmcGZuNDZwcTRHVmh1UTRkQS9tRCtYNkw0Vysy?=
 =?utf-8?B?OTVUcWpmVXV3SkQwd0gvb1FOZDhCWFBZNjF6d3o4b09IRUMyTE11blNZdHNu?=
 =?utf-8?B?MDFMOW04Ykd3TEVob09SQ1o5VVNXMGMzUURpNk54QS9aVWs3aU9QYWQwL1p1?=
 =?utf-8?B?N3BWWE5PQVRCV2dza241dTU1aFN4ZmRuRDZqUWdpQXNndC9ENzBxSjhTUHV3?=
 =?utf-8?B?Q1dBSFRBNVhlcXNXYndDa2VYS0pxdTdTc1JWREtwcUpBeGJrMk8xMm5XcTlN?=
 =?utf-8?B?MkFzSnpKZHBmdkF1VExHSFpZdnBpcTc2Z0RXUExsVFUzeDZiZjVObzhvcnkx?=
 =?utf-8?B?YllDbFppdmcxblZWMVMrR29KRWIxS2ZnYTgvUkZqd0hZdTlnQ1Q2TzdKUmMy?=
 =?utf-8?B?UTlUc3AxcjdKZFREbVd2MTBWSkV0bHJmT2hiQS9xZXAwWVM2Y1BSbFNQdStx?=
 =?utf-8?B?bnV3S2p4Nk1JNmNVb3FVUXBzUjFqTnlnYU9YVW0yYzdwYndHbURMUVcvY2lk?=
 =?utf-8?B?MGl2cHlnV2E2RlVpNytoK2FhelArUXJ2ZjFhVXhZNjNFRkhPVDRuam1QckxO?=
 =?utf-8?B?OGl5d1prQzNHZUVXeXdzb2JpM0hDaEhDdEgwUCtEMlBXU05HSExmU1dPWXR6?=
 =?utf-8?B?dGFjUERKOFZLb3UxUlpselhpb2E3aFl3THZENllCdktyaUtyc1o3aXVScGFk?=
 =?utf-8?B?N0hoSXJuZGgyM3BjMXJvTm1YYTJoTjNLRmtmdGl1dEEvTCtvcnpYbTBmR01w?=
 =?utf-8?B?eWRpT05rOWtGWUdpNm9NZGxCZkRsRm1kakJoRnF3M2VPWFRFS29iTEY4dzR5?=
 =?utf-8?B?bll2aXhVdUZrREdKUTVKL3RYT1EwMWlqRWtGT0IwaDZmUy9BWFJpU0FGeXlU?=
 =?utf-8?B?V1o0c2l0aENBUnVUaWpwb1BYTVVPN1p6Mmc0UXdheFJsZkJDcGlXOUpNekg5?=
 =?utf-8?B?bkVDeG1KeEY4ckxHbE50cVM5eGI4U3doV3lCcG5LcGJTWFJ0QUtSY3BIbnB6?=
 =?utf-8?B?VmpndEpJb3NKb0U2emZ0RCthWE9LTXNwRG5OdVlodFhJVjErUTdpL3Q3Q2s5?=
 =?utf-8?B?ZEJWcitxbUhwZ0dGdnFlZDFMNTNkZkRiZ1M2ditmZk9pVDhiK05lejQxVW1q?=
 =?utf-8?B?dy9EYWd6UXlyMWpQbDdpWC9RaG9SV0hDR0dpdmxvR0NoL1ExMjRxR1M5b2cy?=
 =?utf-8?B?SC96c3k4WGR6bnBhOVMvZUVnc1lNMWRVNXZNZ1FiMy9Yd1JwMW5ic1pNSWJV?=
 =?utf-8?B?akpoMlovNXVoNkRJWithaWx2L3d5enpqNFQxOG1qWVZaZkRTRkl2Z0IvUFI2?=
 =?utf-8?B?QzAySEZFTncrbndlNklTNENGUWR4QmhvTE03VDhjZnNXbTFLaDJKc0Q2dlh1?=
 =?utf-8?B?RmlLMGZmcDZJR1BaWnp5ZUlmUS8rd3lySU9teUVxNW1yRDJVamsyQUdDeFl4?=
 =?utf-8?B?MFFuTjh4dWI3UmZwaFlyS1NaRXBtek01eU5aYlB2bnl0OUo5ZlpzYnk4ejhI?=
 =?utf-8?B?UFYxYUkvS2ZGRTh6K1ErQ0xqQTZWdGNrSWFvYmU2MXBqMG5xSUQ3UmI5ZEdl?=
 =?utf-8?B?b2xSVGJhdFY3RUQ5L0ZtbDNnK1U0Z2NxVnJuUld0WXJhSHNNMjZWZWxvTFVC?=
 =?utf-8?B?Yi9wTnp4cjFsdVNtRk5LVGw2Z1ZHM2RXdlpSRnRVZWUzMGZML1ZSSmtNbERO?=
 =?utf-8?B?K0xZYzlwTjF4aW9ZWjU0Z3ljcDQxdmRBS1lPZ1g5NUlRd3FDNTRVZkpuK1R0?=
 =?utf-8?B?MjZzMFhnY2cxVzdVbENNYVVwd0NSVzc2c2ZOVWI0WUw3Q3pkR2UzZ05mK2pX?=
 =?utf-8?B?ZVB6S3Z0czB1OFdEVHc0dmNJMDU3azhqaXZuTnlvZ0lFWnhWckhIRjd3WHUv?=
 =?utf-8?B?Tk5yZTNPWWY0TWJFcTBNMG5JWmRjZnVudDBXdWNmK0Q4cHhCeWZqRGNSandq?=
 =?utf-8?B?MnpkbllQMm1CcDRkcUo2cWVrNFdITTRxMkhuVHE4SVlZMmVqRjljaUtqMkxo?=
 =?utf-8?Q?mYpWl8Y0xQ+fa2mwLX6jh7xRC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d435e41-3148-4870-aad8-08de211b0425
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 12:08:25.2946 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /4XRslBzRtlGQfuBrWmNiKeE45GSW5g1lHzK5pvhuVksnJjUB7FQISHvYgdHmby8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6529
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

On 11/11/25 12:08, Ilpo Järvinen wrote:
> On Tue, 11 Nov 2025, Christian König wrote:
> 
>> Sorry for the late reply I'm really busy at the moment.
>>
>> On 10/28/25 18:35, Ilpo Järvinen wrote:
>>> PCI core handles releasing device's resources and their rollback in
>>> case of failure of a BAR resizing operation. Releasing resource prior
>>> to calling pci_resize_resource() prevents PCI core from restoring the
>>> BARs as they were.
>>
>> I've intentionally didn't do it this way because at least on AMD HW we 
>> could only release the VRAM and doorbell BAR (both 64bit), but not the 
>> register BAR (32bit only).
>>
>> This patch set looks like the right thing in general, but which BARs are 
>> now released by pci_resize_resource()?
>>
>> If we avoid releasing the 32bit BAR as well then that should work, 
>> otherwise we will probably cause problems.
> 
> After these changes, pci_resize_resource() releases BARs that share the 
> bridge window with the BAR to be resized. So the answer depends on the 
> upstream bridge.
> 
> However, amdgpu_device_resize_fb_bar() also checks that root bus has a
> resource with a 64-bit address. That won't tell what the nearest bridge 
> has though. Maybe that check should be converted to check the resources of 
> the nearest bus instead? It would make it impossible to have the 
> 32-bit resource share the bridge window with the 64-bit resources so the 
> resize would be safe.

Mhm, I don't think that will work.


I've added the check for the root bus to avoid a couple of issues during resize, but checking the nearest bridge would block a whole bunch of use cases and isn't even 100% save.

See one use case of this is that all the BARs of the device start in the same 32bit bridge window (or a mixture of 64bit and 32bit window).

What we have is that BAR 0 and 2 are 64bit BARs which can (after some preparation) move around freely. But IIRC BAR 4 are the legacy I/O ports and BAR 5 is the 32bit MMIO registers (don't nail me on that, could be just the other way around).

Especially that 32bit MMIO BAR *can't* move! Not only because it is 32bit, but also because the amdgpu driver as well as the HW itself through the VGA emulation, as well as the EFI/VESA/VBIOS code might reference its absolute address.


Could we give pci_resize_resource() a mask of BARs which are save to release? Or maybe a flag to indicate that it can only free up 64bit BARs?

Regards,
Christian.

> 
> Thanks a lot for checking this out!
> 

