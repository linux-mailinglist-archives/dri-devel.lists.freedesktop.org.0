Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mAGbB7fshWlvIQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 14:29:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B70FE1FD
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 14:29:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F9810E668;
	Fri,  6 Feb 2026 13:29:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qgOZHvd1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012070.outbound.protection.outlook.com [52.101.48.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E301A10E668;
 Fri,  6 Feb 2026 13:29:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UtUVCL2jMmCQgcEnQdrelQb1QBpX6CvaQrY3qqiPCNvIdnZrd5bEmCrHIbqiGpmcyL4muhlOSXzjI0XVeWrRadRH+ueA3UHXlTNLU8EpxVjX1EdLnqZV/gYoKj9zOdaRlx9aSGpY5QQ0nD2Ag/dEp3YWwOawkPV5LTdRYYZupk5MsmOoXkbAg40OkIyuHbbIVjpx2FguZ22DLtIpHwSzJQDmuuk8QKoIMlzlnk+7Qz/Gfho/RR5ILoJ9NCu/R8Yj+6lVJTS5X23RmYVzmTu3w+fcNIRuw2PQCDncJheYoorlxrT3HfO+paKUjJpuyzkMAiQPFcAhWx43XINSwtHriA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nfqv+FCZigTynQwFhxXg4ofD3xvzDTpofbzG8hzoqlo=;
 b=bErcm6XAYC0IhPAFXYkNsloFmUYcxWQmcn9uchgav6jDi4u1TeJDJTZ1b9IKW7i1eFMK6+a4UG1FE2XYDXenPYzdCXkH+YP8M5oluJSOky9OHUEVeh1AueoLa6E1+3EZdJL8l7yRftGYnRwN2I/nS/FTPtN5IcR4IuIgupfQRxRP6FQYd7BpB0oNjxjRERXXu+d7cTcrHOP0Ko9Kb201J2z6/6KSw+6MX+TuaGW7Zvrjs29bezwtpZZDJv2r5swASLtv9UNofC4P6/HCqqawXDyHEaquZ69dhB7ZfribQVjwddeXQ/W9bCDjkwEoumgF8+Vc118xqAfy9J6axUhliw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nfqv+FCZigTynQwFhxXg4ofD3xvzDTpofbzG8hzoqlo=;
 b=qgOZHvd1pZBVG5/DLXwTm9Edsm76uLsmYloa2zfxghzGC46/VDFPfPx+Joq/LLM02G6zdvHvuO/uVcp5nCsQ/7yV6VMhzhvc1ufZnPp/PMOpxK9aF7etAl84nQFMbw3l9bG8AjVUjOPpaPWmzdyibJv159tmu5esYrsPySeH0QQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH8PR12MB6961.namprd12.prod.outlook.com (2603:10b6:510:1bc::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Fri, 6 Feb
 2026 13:29:21 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 13:29:21 +0000
Message-ID: <15979898-873c-415e-9d3f-9ef751b2f4be@amd.com>
Date: Fri, 6 Feb 2026 14:29:17 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Accelerator/GPU top
To: Tvrtko Ursulin <tursulin@ursulin.net>,
 Alex Deucher <alexdeucher@gmail.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 David Francis <David.Francis@amd.com>
References: <CADnq5_MTX8CifP25UvE5kdMbCYxgK+A+KGdd-_Ef1m4VYv+WRQ@mail.gmail.com>
 <a56b7e43-f499-4b52-bee1-15f7087057e0@ursulin.net>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <a56b7e43-f499-4b52-bee1-15f7087057e0@ursulin.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN1PR12CA0026.namprd12.prod.outlook.com
 (2603:10b6:408:e1::31) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH8PR12MB6961:EE_
X-MS-Office365-Filtering-Correlation-Id: 124751b6-afe5-4394-72ba-08de6583bc8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Qi9lUnV2aFp6RlR2ZktBZXV6bnNwd04xYVlJaURFa3B1cGM3NTVTODZjVnNF?=
 =?utf-8?B?ZFMzS0R5RmdycERjcDdpdVJjRzdzeEJKdUZCdXlTZUpScldnc3Z6R3gyeTRJ?=
 =?utf-8?B?MWNhc2xXdnNGVzlSUXhUMmRROUIvdHY4SHZkZm9OUlZUb0t3Q1pVOEUrY25R?=
 =?utf-8?B?ZjZrYStIT0ZjVG5oL09HRnRMOU9seVNpUWJzRU5XTVFqRWx2VXVRaFdZTzVE?=
 =?utf-8?B?RDFiZElXVUtzSkNwcnBEaGlrRjBjeWcrK3BQVHQ2KzA3RzcvZENwL01teGMr?=
 =?utf-8?B?YWVyZEVFZThOS2x3a0NTbUNjR1g0UHV1NG10WkhudzZoclA1Qkl0Mjc5b0Vq?=
 =?utf-8?B?bmN2Z3dzUWJiTEgwV2pOYWlnc2pQWHBldFB6TnFtNkdnNWRrT1l0cU9XUDlN?=
 =?utf-8?B?Q3ZQbWZEQ1p1akZ5dVQyRGo1Zy9UNDQ2cktzV2U0a2gyRnpzRi9tSEVhdzha?=
 =?utf-8?B?ZEJ5Nnh2ckdWakxQbmRNSThMU1dmd2puU095V1Y5N0d3QlYrcGhjOUw0d3Fn?=
 =?utf-8?B?a2Uvb1dHWUhTM2xqZHFhREJhL1VQR3VleFpjWHVzZmdLeWxRWlUzQTlCZHpt?=
 =?utf-8?B?WHJSVWtTajd4YmdyWkVxV1N3QWRCRE4rRW90QnMvdVN6U2NLOEwwb2VXKytk?=
 =?utf-8?B?cmFWVmxNVldzK3padFJRZ2txbjIvU01sWGN3MEZ5czFsOWpJNmhqQm1VTTN0?=
 =?utf-8?B?MUN0WVB6MVlsbHllSmZGNW1vUGN1UmpYaloyNlplbGU5RjFoWlViU0xJNHha?=
 =?utf-8?B?TjhKWnY3TzIwTFB5d0lTM1NLU2d4M3VWcndyM05ZMG8xR2JpUGJYNGRxdzBK?=
 =?utf-8?B?cm1LNW9QRWRDekFWOUt0eDFwVWVDT1d2ZHhEUVVJalMvU04xUktSKzQ4Znc2?=
 =?utf-8?B?WXZYVHhVREpSa1lwZEFxek1lWjc3T1RqWlpoUklFMjJKbWhMRHVaT0tJWStF?=
 =?utf-8?B?cW42eGZxWWRka2theWJWeGdKTGxPVVhwUlRpZnVGb1RnSXhGSWNZbGpZVy9S?=
 =?utf-8?B?dytXOWh2dzdrUHBDVEw2K1JLM1Q0bXNxSDFjMWp5d0ptQlVZQkFBVTJnWFhL?=
 =?utf-8?B?Y1ZBdUdlWGFWcWtUKzRRYXp0MFRUa1BPb0dCRDhZVmZzR3UwTHlBSGJqL1dP?=
 =?utf-8?B?OVBvbEFER0FaQzM3OVdaRTcyUjBtSHVMTlhvK1Z2SWR5V01XZlBDUFhtOUto?=
 =?utf-8?B?NWo2cnZKYTdscW92ek5VQ1h0NUNpMVdKVmgwM2daandCZ011NG1nNC9heHlW?=
 =?utf-8?B?R2pzUUZ3WkpqbCsxNkZLajJIUzk4ekNVS1hROFBTeFN1Wnp1MWVLbVp3Wldv?=
 =?utf-8?B?T3FPNGxtdFdvdktZV0l2L3dLdlk3MnB0QTdyeVFDQUt4RzRLdnMvN0EvK2hK?=
 =?utf-8?B?SnZSdVpaNlQzelRaenM4ZFEwZG5RRk1TVXJVYnpsbktSMVQyRHZDOEVISFd1?=
 =?utf-8?B?eUhJZ09KdjNibmhoY1lrVFh2U0FzWnJzdVR1M1c2NXNyUDlIUEc1M09yUVNn?=
 =?utf-8?B?V3RCTzNKQTJaVGlhZ2Y4UmY2M0VtUVdVaWVtUWJmODloYkR3VTBNVGVEcStj?=
 =?utf-8?B?c0oyeWhvQi9rUE5SbnNDVUlFbVZ0NjRtMFZwRFl4Tmc4Q203VjRnZ2x2V0xX?=
 =?utf-8?B?eVVxWUxVbk51dFVDQkFUWnY1c2tMWGhXVjBaNmpkc2dGdThRN2hoWFRJdTBt?=
 =?utf-8?B?aHAzWmNmUWtWVDMvcWcrK0lVbUNNbGt5KzJ3emV3Ny9BUlAyWFZZMCs1a3hB?=
 =?utf-8?B?SHlvY3o5Ymg3KytrVnJ4VGtnN3hBZFl1MzZtRU55cDkyWTI4cFArM25DbDNC?=
 =?utf-8?B?TlB4RmdFSGZmOFJ4YnVZNDlNMUlSRUJhdzR2dHJSbm9GQXFYWk11alRYNmJ2?=
 =?utf-8?B?cUx3bTc1Vmhhbmdya1BNQXFTME1oRW5ETFBERmMyT3RmNmtBcy81VmtkY2ZH?=
 =?utf-8?B?TTVyY3RMcDVLanNENkpOOWQzdk1pa2Y4Z1B3cTNVeGNad3NHdjlDZklzMGtX?=
 =?utf-8?B?OFlnNzZSV1VQTjZHbTVURWZTVGNYaldubURTUHJTSitnbXQvUUo1OVZHYmFl?=
 =?utf-8?B?TVVINmRsa0NYNUZsRkFkMEJQNmlCMlhjNTQ5S1c0d2NXc3V6NHAwOFR1TnRW?=
 =?utf-8?Q?9SzJGVf89BHCZIaC7IWZotASe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDBmWHlPUWNSdTNCam5TTG5NZzZ2QmJMS0U4R2FCd2dFdFBkNS83Rmt5SDg2?=
 =?utf-8?B?V1ZDeDFSMkdpWHVZbWpmRHBxd0hoNTNUYXpEY2FWNy9CTVc4K0lIeS8xMDdh?=
 =?utf-8?B?RkdBTklaSG9oNmlpZ3I0S3poSk9WU2ZnOHBTR1pvNGZkZjdqdmdyZzRaT2Z5?=
 =?utf-8?B?TUh3bzhTU0VWNzZsWWVERUoyUHVYbGxrYU9OVC9ZRm5SUU1KREUxOHU3Nkx3?=
 =?utf-8?B?N2NDeWFaa0w4ZWdyeXNvc1RNZi9vSUN1MitodS9KUnB5c0ExNGZmMDBSTTJ5?=
 =?utf-8?B?aXBvbVZNNlEzNXdwaDNROGlJWjBJYm5wZERPR3A0SWFDWXAzVVRsT1BsVDFJ?=
 =?utf-8?B?eXBPbVZyVzJXQzBTaXdBYlo0MER5SXc1amlPWEViL1U4TnNxcGJKekhabUd4?=
 =?utf-8?B?OGlrdmR5Q2JlbnpYYVArMmI3YWY0OUd3aW1mMUxNWUpVcVRua1FlZXFUV3N6?=
 =?utf-8?B?cS9jSDlKbmZFQUw1bDNGdXEzSHY4NVlaY3BkYWhKRnRvaHlDa1JuZzd6MUNs?=
 =?utf-8?B?MXQxNjlpa0FwZG4wNGEzYW44MkkwaTRFVWZiL2JkY1U5NEpla2Z4dktxQnJF?=
 =?utf-8?B?aGtlWGJsaDM3dlJNdW5ranpsYWUvYjJzdkt5Z20veVc4Z3lwTWYvRzArdmpo?=
 =?utf-8?B?S25wc0xnV0FyS0V1Mk5ESHVCaXpyVGVLT0lLbkg0TWcraDJHTDd5eC92a0xU?=
 =?utf-8?B?ZEI0UEJuc3NUMm10Sk15WEV3djJsUGN4UnRoOGU2Tkg4N3dPbkRabm5OOVpa?=
 =?utf-8?B?c1NiNmhUUVRZb3B1RFRMelhHb2FwUzFBdjRab0JZOHNqU0xlaEFlSEs2Nk1z?=
 =?utf-8?B?UStxNEJTK3cyTFZiSnUycE9HUWlNSTlSRExlU0lJWUcxaTRiaDFWRjlMUzZ2?=
 =?utf-8?B?dTExMWlMZG0ySWdBV1M3MlJTVzAzd1AwUFg3Tm9HSEtmTk5KaVFWb3M3YUs3?=
 =?utf-8?B?RDBwTXF0R201TXlqTk15OFBEQnoxZGNCVGdENGtUbFRPYXp5NnNGTW9HUjZo?=
 =?utf-8?B?SGxRVjBBMXIxSUl4c0RubURSY0hjUzZzQ3BNSHZoeS9xS0JmeDkya25KNEFD?=
 =?utf-8?B?K0Z6OVpCUmdEMG1kSTN0ZEYvTnE2VS90Q0U3dHVtU3crNW5HM2VxcjgyczNr?=
 =?utf-8?B?aDR4dXJhVnM0MWc5d3NnQktBUTlhNWtuS3ZCbzRSVWVqM244Q3o5NmFsNnpT?=
 =?utf-8?B?UTQxRTJOcU14aHZ0NzhjQ2NGci9LelYvSWVjTkFVRTRNV3ZvbnhVSXN4aWNI?=
 =?utf-8?B?Mlk1bG1DYjJFamFxU09xVjNYMm9QLzM0U2FOcjE3TEk3NDU0bzRhTnF0ZUFR?=
 =?utf-8?B?Y0IwYjcwZWZQZmx0dzNMMWtya3dZaWN2QVhrNkliK1o5ODg0NWlqQjdFd2Zh?=
 =?utf-8?B?TFg3T3BYanhEdjNaUkFiNW8vZ2xsMWVFNVFlbzFuK2x3Z0puamU5cVAybUll?=
 =?utf-8?B?ZkxMV08xZ2o1cmkwYU15VFFrU2dDa2R4ZDF4aWdrQUJWTmtJYXl3VGpXUjRQ?=
 =?utf-8?B?YW5rcFE1YTRpcHc3L1BsSTZtRVlEcFVmTFBzR1FyUEVSQUtoWStzM2lDSUhh?=
 =?utf-8?B?TFJjbEtNWWxvTlErS0RqWUhZcVZJZVgxelBPYTRZTXkwN0lCMXI3L3l0MXlu?=
 =?utf-8?B?SFlPVTkzY0tyVnlRZWMrZEZHMzUrSnROcHJUU08ybVJiVExRcko3dVdVRGVy?=
 =?utf-8?B?NmY3amI2NDhxa1AxVnJRM2hPZmkxUUhnMk5DRlpqRjU3dEZ5RjJwK0JveEdS?=
 =?utf-8?B?VG9kbHVST2ZpWnRGaFRGQWVNQjl2bXNoa2V3MnZ5bTEwak1LZ1JLVHZ3OW8v?=
 =?utf-8?B?VDNzMUJrMXRDSW9PYnpaV01VSFhjK2Q4dVQwRlVjbEw3YnEwQ2prb2NMTDR0?=
 =?utf-8?B?VVp1SGFPNFFwclBXYW1Kc0hlQ3oxZ1JnUi8vUWtEZlY2bXRBK3AwenEwQzRn?=
 =?utf-8?B?RnMwZ2ljanlIbFRWaGRsUFpVeWxkVnJhaUpycWUweTBKelFFWlJNRTdEOVFz?=
 =?utf-8?B?ZWdNbTNPOS8vbFN1TWd2RUhjMHBsNkpGUlBXcEZBdEJWY09yMnRJdG5TTnZV?=
 =?utf-8?B?eGttTDcrM0dkMFhJcndHUHVydENqZ0NoQzlLTXlZRFdMK1hEWG9TTi9iZHZt?=
 =?utf-8?B?SVc3V3RqUGhwcEdQVlJ6Qmh6aThYTHJrbHpUaDFCakQyaWt2TEQrbG1nM1hW?=
 =?utf-8?B?U2xDYWtlNURGMG10VnRSMXVtUGFYaW5lTE91Z25lMVVXZXpLNnVTNys3TnFZ?=
 =?utf-8?B?ZmJUTEJKaSsyMWNiZG1mMWRwbmtMN2JOajdQUTJ6dkZQa1BlUFhST2FmTmZx?=
 =?utf-8?Q?ZB2tm8ePGxukqjB3Nv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 124751b6-afe5-4394-72ba-08de6583bc8d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 13:29:21.3636 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hoLKWQEW/AvZzPtpikZghQKEnQjIidRObt5sjhN9CC+0AaQ0Rb+zXXsq1xjFiyGk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6961
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
X-Spamd-Result: default: False [-1.60 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MIXED_CHARSET(0.71)[subject];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[ursulin.net,gmail.com,lists.freedesktop.org,ffwll.ch];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: 98B70FE1FD
X-Rspamd-Action: no action

On 2/6/26 10:58, Tvrtko Ursulin wrote:
> 
> On 05/02/2026 18:58, Alex Deucher wrote:
>> Has anyone given any thought on how to support something like top for
>> accelerators or GPUs?  We have fdinfo, but using fdinfo requires extra
>> privileges (CAP_SYS_PTRACE) and there is not a particularly efficient
>> way to even discover what processes are using the GPU.  There is the
>> clients list in debugfs, but that is also admin only.  Tools like ps
>> and top use /proc/<pid>/stat and statm.  Do you think there would be
>> an appetite for something like /proc/<pid>/drm/stat, statm, etc.?
>> This would duplicate much of what is in fdinfo, but would be available
>> to regular users.
> 
> In short yes, the inefficiency of the client discovery bugged me since the start of fdinfo and it was discussed a few times how to improve it.
> 
> AFAIR in those discussions a lists of clients outside of debugfs was mentioned, since that would allow the cost of discovery to not scale by the number of irrelevant processes. Something in proc was also mentioned but I guess for both no one had a strong enough drive to actually do it.

The fundamental problem is that Linux only tracks in one direction who has which file open, but not the reverse. In other words even an lsof /dev/dri/render* does nothing else than going over /proc and seeing who has opened what.

We can expose the list of open DRM connections and which process was the last user of each in sysfs (for example), but that is probably not accurate and might also expose information not every process should know about.

Regards,
Christian.

> 
> Challenge will be finding the threads to see if there were any interesting conclusions... The only one I can remember at the moment was this:
> 
> https://lore.kernel.org/dri-devel/20240403182951.724488-1-adrian.larumbe@collabora.com/
> 
> It looks this attempt died out due proposing a binary interface in sysfs.
> 
> In any case, I'd say it makes sense to do something.
> 
> Regards,
> 
> Tvrtko
> 
> P.S.
> Just in a case you did not see it, a generic tool exists as gputop in IGT but as you say, you can only see data for processes the user running the tool can read fdinfo stats of. And there some nicer tools feeding of the same data.
> 

