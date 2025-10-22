Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CB6BFD106
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 18:12:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D25D810E7FF;
	Wed, 22 Oct 2025 16:12:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PQCxKTJ3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011044.outbound.protection.outlook.com [52.101.52.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8E4310E7FA;
 Wed, 22 Oct 2025 16:12:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TBtZpZaXzMCCGrAUL6E+Lq+tIBoLB15mlh89F0Ht8liit+UAHwqwrBZziwfcK+Ht5ET6ywK6PnGhs2u2pNU2DKZmNl3tJYZktIis3DW6dV7jHnKcfSn6c305zl0iK6cIt9R3IfXl5WsnRCGue34B7+hrm0ZIU5ePse58iFJvEiQJNHdSTpjO92qXor55HAJ9nh0Hy8EsHWG+BVJsG+a40Ide3zWgY5VzOal8dY0ZRyrDvc/iSYvzaUlIzUMX39qXEeDx2h8ILuxv2aYDjbmHUOP1YthEHBmut3/yI51wxkY+S6VSXeRFegr8+W2gjRwVLfriMHt2g00e04BHbVLK0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VQ48Vnt9cNZ3Hb2XI5nxFkXX+VpWGmljjghbjtW8at0=;
 b=jU/FrzpDckCHNT31qigB0hYpm0QGhpm+XkH5jpJ8qZLyEi2Et5Rw86bQKYKjSHgJD/JYuRhIv4J6K212UX8ZBpgniSbP4PHbLI5anm6aWllLtzupDxrh4MTwrz+SjigpnUG6WU87m3zUTPBsAXf3E2VQYsoqJ40DAflvUvdkqWkjAf6f0z2u0iqdlX0gqs4QztXbWw/WOwArTM8MmMWuejOUqs0am1i7Th7F00fL70EqH19/2TW6ATylKTHm4dBXVvd8j10NNoQ4o4XRmU/aMmcsieQ/0g0hgiZbDlEmea8DixGy7H+5+ZtChlG1cMmjoF64l1ijkXR5qd3DMFCWYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQ48Vnt9cNZ3Hb2XI5nxFkXX+VpWGmljjghbjtW8at0=;
 b=PQCxKTJ3n+mluU5eADqRceV+dM28zuoN4p5b/hgRHL8+bdGnI2mJyKc5Dd+o7kgqjEwwm/t8rbwC2UVRFaSWJaXJtZU/wiIa4jweyn5Q6yWbTMQbc5UwdyJmGZnhZCAUUBI62ndfCLbmdSIvOs7BaerTVcxnN1DsLQlfRSUgqivUV09n/nqc55dY6wZY79BB6/O0e2ZG1CQkltTTZr51NRDvU0Af7I8cON47u7U25TD6OLhKzm1s6Q24B2Tfqu0qc4yaZKv2uVrsOyCOQ6UiPDa81tVZbtrN4PharDizGQzEK3/AGmV5lxCm8glUCbJjj5+fNdb/17IjDqkTp5PN5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by MW4PR12MB7000.namprd12.prod.outlook.com (2603:10b6:303:208::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 16:12:27 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9228.015; Wed, 22 Oct 2025
 16:12:27 +0000
Message-ID: <46447e7c-5fd6-4e81-b963-b5e1e6afbb1b@nvidia.com>
Date: Wed, 22 Oct 2025 12:12:23 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] gpu: nova-core: bitfield: simplify expression
To: Alexandre Courbot <acourbot@nvidia.com>,
 Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Edwin Peer <epeer@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Timur Tabi <ttabi@nvidia.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20251022-nova-bitfield-v1-0-73bc0988667b@nvidia.com>
 <20251022-nova-bitfield-v1-2-73bc0988667b@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <20251022-nova-bitfield-v1-2-73bc0988667b@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0084.namprd03.prod.outlook.com
 (2603:10b6:a03:331::29) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|MW4PR12MB7000:EE_
X-MS-Office365-Filtering-Correlation-Id: d886676f-f049-4a88-0ae7-08de1185cb38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c09GbEltY3lYRHg0aDIxL0RtN0p3dmMwRVpPVVdMWlRqMmxOSUMxeGNKeU03?=
 =?utf-8?B?TXg1RkpwdmJIbko3WU9WV3RHQUlhQTFyNFFzNFI3QTZZSzFYR0FuOFhOVlNW?=
 =?utf-8?B?cWxNQTZCMHNUVFZGaFdoWVhzbGY2UEV5aG1naFlKL05aditlbkJrZjVDRC9u?=
 =?utf-8?B?c3MwcUN5bG56dlhxL1h1andURmNidlFIUEZCd3l1UkIvWHZiMkU4YTJXaTNC?=
 =?utf-8?B?SDRySUk2dnFHQVprMHJQMmVnT3pjN213d1FYci83Qk5SRDh5T3QwKytac05y?=
 =?utf-8?B?Q1BCcHBEcGZkUUExWTNqOHQzRjBFTE9wbzIyU2ZUTW4xRWxydy9ISHVoNW1u?=
 =?utf-8?B?T25tZmVkS3ZqY0Z6R0d4MlZESzNQdFQ2c0JZM1NJZ1NMMmp3WkhVNTh4NVF5?=
 =?utf-8?B?VTMvdmJuNjFremtmRHBJSlV6VVBKdDBaZ2p2QTl0MTZ1VUQ4bkFSSG9GbGUr?=
 =?utf-8?B?STdKbGVtTlo4cDZhUGI4TFprak4yNmZsZTZ3a1MvaWVDMEc4V1BPTXErSm90?=
 =?utf-8?B?OExuVzFibjRGc3lybXpma3doZ0l3REl2VC9BS0RNZHpObnFucHdwSjE2emdG?=
 =?utf-8?B?RHVsNlJOcS9YWHdCajN5b3QrajVlZVZvaHVFQmg3ak05TTc0dHdhTXBHWEFr?=
 =?utf-8?B?bEpRNjZtYkErNkFQakRsTTk4NWtoQ0RhYUNKZFZ0NzFiSEN3MzlUNzZKNmFS?=
 =?utf-8?B?My9GWU9pZVNycHhtVUxldmRCVGN1NEVneDhxRlFGb2NuMWk1aU5leDAxTk1t?=
 =?utf-8?B?d3RkTGwrOEVNMDBDTDhvOTZVZU9QRkt6RmNSV2RQT3RoY25uMjhpUFI1TTV0?=
 =?utf-8?B?TEljRE1QZ0NnblNlNVJOUTMyN2F4V0l3dG1JUm9XZ0JmRWttZytHVXRsRUFo?=
 =?utf-8?B?czVuN2U0STgyWWpGNFdIQ2VZcUNzQ2R2ZnZVVG1Vb0xGaDdmdXdnNXRXVm9p?=
 =?utf-8?B?cjd3cDVwckprQmVORUFBVHU4bXNFMHZEZk52RjJmMExNc21sWEFFMVkraVRU?=
 =?utf-8?B?MmxYazU3azd1bmF6SFcwTHRPdUkyV1pPOE1zc3k1eW1YSGVKQmpHbE9neWwx?=
 =?utf-8?B?WXBiMnIyTHZsV0FEUkNtY3U2eWo0QkVkb0RwS3FLcmt3OHJpZzFVRWFJMDF0?=
 =?utf-8?B?Y2dqR3JQdFZvYjZ0ZzVzaUU3SUxzQTlLL1ZyYTh6bDFYK3JsNVdJVDZoM0cz?=
 =?utf-8?B?ZWZidURSQzRCVnQ0WjJBOGdlalNkTEsxTjRvTmNLM0R4VCsrc1I2eXJRRXI2?=
 =?utf-8?B?emNKckVObWNaWXRCbXIrNHdOVmxQZnFjcUxoWWl0MmJ2b2ZvbkYxTDJqYjZr?=
 =?utf-8?B?Wk5RKzFRWTRXcmdsN2p2NHRubWY0c3pVS1JDOEdIc29GNjdNTXRmQURmNUN6?=
 =?utf-8?B?Snl4ejhkK3l2dm4rZ01jSGlvdm51ZjNUenlqbW5EeGtRTkJ1bytVd01hWkx6?=
 =?utf-8?B?VzVuOFkrZEYzZHlWbnMvME40czZQYytobmNlZFZseEZkK2FlREhLMzRTN0Zm?=
 =?utf-8?B?eTZJeWcvR0dOWUlTekhDck90alIwUVVmaStEWTl0MWlUVVAwYklWai9Xa0dk?=
 =?utf-8?B?cmFOK05qcE5YM0p5SDBIQjU0a2xRUEJ2VXc4MHJxdm1vS1V0SFFCMVlzdUF0?=
 =?utf-8?B?dk1KRVBzaWRmZHMxYW5IakxtcHhwSWo3K2ZoSFM0TW9DZ21wWXo5TVgxczZ2?=
 =?utf-8?B?RmN2OFl5OTZ1aXRpdWhHRmM2NVdZdXBrNHJnR3d2d3hKcVVjdzlJV0ZlWElq?=
 =?utf-8?B?a2draVBVN083UHNEUG9yOWdzSEc4ZEM1Z1FFeEtIbGk5OWEvbFZnblNmYUVG?=
 =?utf-8?B?TmcvQXFzMWtCVHFjQ3EwWXZVYm5aeXlVZkRGa2luWEtwTExFLzgxN1RkaVZF?=
 =?utf-8?B?NEttVHp6dE9adE5nek1GV2I0VnFPQktJVXFrdmRJTEcrd3RoR2cvb0lqdVU1?=
 =?utf-8?B?UGlhRi9MQ053UE9ZVzVIaS9jbzVRNGZLSzZlTnlXSXBJZCtvc0xLTGxBMDVF?=
 =?utf-8?B?SkhVZjFOd1dBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXpERXBGQ2FQSlNQcTRIU0VhWnJ4OUF1ZEtvK0tGNWh2SFlQa1NMZjFadk16?=
 =?utf-8?B?eG5QNlA0SEJTMnBnR0VzMnNPMkxLbjY2R0djRXRCemNuWFRPdzlEUDZYK2VE?=
 =?utf-8?B?YTdPSm9DWnVETW5sT21LN2ZEMUF1bEwwcmhGRnUwWG1mRmx0THo5cnFHUFQy?=
 =?utf-8?B?aldXb0xQdHZ6bnZNOWQ3V3BnYWhRMWtJT3NiM1FqWWpRQ3RLd05VRGQzQkNB?=
 =?utf-8?B?T3BGRG93c01na29rdFNwdFJRazNMcHdtMEk1Z3NyUGJyRWkrRElyNlU4anBn?=
 =?utf-8?B?TFVSZ3NrVi9oQXhhdHkrTEdYTCtFWmpKVnFSTm5DK2hvdEJXZUFJbDBsQ0lE?=
 =?utf-8?B?VGtZZnovaUxYbkZZVWYxNWFzUTJ6bzlkYmdkK1dvWlB4QXlaM0M1U2QzNE1Y?=
 =?utf-8?B?dEdVc3BjVXl6bFA4L1U5M0UyYllUS1RTdFdoSnRXNk93UnlYbHNTNWNubkt5?=
 =?utf-8?B?dVJwcEN6TE82M0YzWmRyeWtyZzBzUXo2cGFjNDBVb2g5M2srazFSZ0RYVXdr?=
 =?utf-8?B?eWQvdndLM3VvV1pDeTArVXFEN3MrVnY3dHRmdGx3YWFaYm9ReWxsSE1FUjdy?=
 =?utf-8?B?WkkxUU5xMHNSaGlRNTByaTc1ZUZncHBjeS8zZUFRemRhR3hoZXV6a1dlVEFU?=
 =?utf-8?B?dHhnbk45aWtvT0J0dVZHWFNRS3l6NDQ3aDRVdms4a2JaeFVOdVFiejdLSm9K?=
 =?utf-8?B?dXBaS3Rsd2RXNFlvY00weUIxdUIrYnBaWE1JWnVEbU1HQ2hJZThIRHg5T1VZ?=
 =?utf-8?B?YWdPNWY0dUdiN1JFQnBzbHVRb0U3V3BxTXVjVnAyWWlvekNGY3V5WUYvWW1u?=
 =?utf-8?B?VWg2ZkFsNGZhdWJCTmVsRU9HUTQ5N3laa0NLcGR6MUNIOVFMamlmbUZHYkky?=
 =?utf-8?B?bXBUeVJHOE9ZZ3BUUWZxTUJOQU9XMXVYTHE3SkY1SVVMVlpPaW5qcXNWMk1j?=
 =?utf-8?B?YjU4ZlJVRXhjRWZiVDQwUjR1TXJlMzdhQmtWVDI3ZEdwc3c3WjROVHlMQ1Rq?=
 =?utf-8?B?eWRkUlR3TW9vMVZxOVlIQXV3ZTFKUjBRL2t4SzZKRHRmS3FaekpVQXNmT1NJ?=
 =?utf-8?B?WG5SMFdVOVFjNGJBVittZ2J1bUN2WjB5VEdUNU5PbnVXdGY0aHlnckxqWU1h?=
 =?utf-8?B?RXdhZVJ5alRGRXNldlVYS2EwbGVBNS9HRW5jaFFuUm9qUVRBUmlyekc2NVJj?=
 =?utf-8?B?TlBZdHRPR0M3VTVsQkVtSmYxNnNFTVNIb2pJT3NFUTM3TzhCRzI2cFdLRXly?=
 =?utf-8?B?eVpnTVdEMlV2UXNablhIMVV1ZEJVY2tDaUFUZENJUjRHYzRPeStUTmRsREJ2?=
 =?utf-8?B?Qnl3Qm1RYkZ5R0huL0NJaTZwVFJjL1gxNllHak52WUVIcUNJRjNzRUJpa3Bu?=
 =?utf-8?B?VEg3TFBNOG5XaUlNRGFkY3VqNDhXeU9NejUxR3Urcm5KaEIrZWdYdE45Q091?=
 =?utf-8?B?YVNRMko4d3cyVUIwK0hiZGw2TDZHYTVNalZFZURzQjM1VTgraCt3T3U4eWhM?=
 =?utf-8?B?Q3BHUkFCVFBxelE5dnBpUHZSMmdXYnppcUt2ZlpwaVdtVVJnSVoyQnNIYndw?=
 =?utf-8?B?NmREMnVQZnM4dk00b1hQdXpGcEhsemxRZzF4em9UNnlnYXh1WnFmeGk5YVpy?=
 =?utf-8?B?QkEvZWRTRW5ycmk4cnc5MmV4RFdmSG9ONWJsVUJTNEtkTDJkQUpBakptMEhX?=
 =?utf-8?B?U29QSkU3UTdtQzFYN253ZEhPTDRNZDhBWDU4S2FxbDFnSGVVc2pwRTM0N1FU?=
 =?utf-8?B?SVhTN2MzZUpPeHJDMk85bUEwdEd3OHFBdGlmN2huellqejZBRUExOHlyMDJJ?=
 =?utf-8?B?aXZFd1FVdUpVZTJvVTdMVHR2WWZGWjgxTFpMN2pRK1NPU05pVm9FbStjdWRj?=
 =?utf-8?B?enlIUWNuUzNYU015LzlvamNmTFRBRGpWZE9kdlJqRURjREdFMlRHS0h4VnNQ?=
 =?utf-8?B?dkJBTmNoS3Ixa2xHMGNsZzVIaHBlNHpwMmMvaGpYbWhGSjRuamlHTFZTMFJL?=
 =?utf-8?B?Wk1lSzFIeWhkNS9CdU9Ccnp5YjczTE1OWTRPb2tpUGU5NHhERE1qTWUrd1NO?=
 =?utf-8?B?Y2l0cldTdHpucXBWTWx5UFRLYTkzNlZVZVVHNXhPb3phMVlneHNWdU0vdFZy?=
 =?utf-8?B?clZuMlU2bHZnb3NsL080eXFXVDV5dWRTS1IrdmNVRklCL0loOHFkTjhUZjFp?=
 =?utf-8?B?c2c9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d886676f-f049-4a88-0ae7-08de1185cb38
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 16:12:27.3348 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Tg0yy3VBa7zOrqjvGGUR00ErsKcC99rFmKcZzTBPkP81DIjN8MoH9jFbBr9Vga6+UoJdhfYYLcZNGbVI4TyOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7000
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



On 10/22/2025 6:50 AM, Alexandre Courbot wrote:
> The shift is more easily expressed by the index of the lowest bit of the
> field.
> 
> Reported-by: Edwin Peer <epeer@nvidia.com>
> Link: https://lore.kernel.org/rust-for-linux/F3853912-2C1C-4F9B-89B0-3168689F35B3@nvidia.com/
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>

Thanks.
