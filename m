Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AF1AFC336
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 08:50:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0EDC10E59B;
	Tue,  8 Jul 2025 06:50:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="EcmGrWwH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2085.outbound.protection.outlook.com [40.107.223.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC73310E598;
 Tue,  8 Jul 2025 06:50:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WtYDngunMWiXdoBL3OOXjXJS43Nc7jHUe75cBetfkDiiUOGvtSCThpYLy5J3I3Kq9IG2JxLQ1yzsGfTUNikE3x0M5GR5V2iXheSACsHZ444J/Wld8NZGRUDkIleChe8/WXCy6GXXrlWXupW/UPaD/rkv+hzTqFJMRH7PolMUaa6fa67E1aUtvnhbf/R+B5Ut+kEM6wjwglayWvKLjlOZLKlErpPiMAz3KDp4b50AjoXU2pObFmzAZ7B1f8WZMS9AaEcDKUI/Hd7rPXKVkwgThEDtK9i+lqP2lxiRCSX/T0oPzzvpGdVHgoiGU45FF2xX6V9m2cjNNHqguEKVB6n35g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fqqvMGehSSegS97UBu8iWP2iGx638ghw8px5XVVp+E8=;
 b=sNrCJxnvyWmf1vwqjCXzBHsrTYr5uqV/BOobF5/fhQCg8ik7Ol2zuk+R2+KoTzhE86sdDOWVql7qXmp9xpS4MKja4AxQtT1b/n0Sw3dqpv4VG2M4ES/Vhki4GqH83bJT38KdE3JeK/fGGJJxWZJWkVgoWze/9aYnh3RkRxzpg/PxhcVtHZM/iKm5Iw3arIQnzNOI4kUORbe3uz0BSmP8/hwFaCmdmIVz96FVvF/sSJLbRSmXKh65pK5XvwDV2XgglFX1BL4GvZMeyDWup0w9G909OhFUOBseR5baZQ8tGpnBBZgvdAS+c0mwqMi+WZoA8EjgxaAZydS47/Rk6mrxrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fqqvMGehSSegS97UBu8iWP2iGx638ghw8px5XVVp+E8=;
 b=EcmGrWwH/CA3DYSXG2AQXm7K0W5iY2t+ZWImfQ4vxixkKqBuHEKXhdPOyiiVX5vLlWcnfSEoGeN7dBd4xmcSBkhZ0loob/YmeRDf2zgP0aU/w1+1waq6XaQ96lvZzHrLTOsiec0dT3QZOFe/qbeIcWvZtm8uVsj03QCQi15sA4J4GRvWP1HVouHfhvnxfo+utqcXRrlhZszqVYqns9JI8HnxgR9bGiJrl6DXiWAt0J8xbH7VeB0pY+knImFYAmRR7Xy7l++woPzGVcnDLEFnIUlbbSnaBpRkBqXt5kSjC4waRJZteCcGPxiNFTUjMOGKNCJ9JjERDZj4I8gadwEO9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Tue, 8 Jul
 2025 06:50:18 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8901.021; Tue, 8 Jul 2025
 06:50:18 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 08 Jul 2025 15:49:48 +0900
Subject: [PATCH v4 8/8] Documentation: gpu: nova-core: Document basics of
 the Falcon
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-nova-docs-v4-8-9d188772c4c7@nvidia.com>
References: <20250708-nova-docs-v4-0-9d188772c4c7@nvidia.com>
In-Reply-To: <20250708-nova-docs-v4-0-9d188772c4c7@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Joel Fernandes <joelagnelf@nvidia.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 Bagas Sanjaya <bagasdotme@gmail.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0024.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY8PR12MB8412:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ae7b893-dd02-410a-c30e-08ddbdebb3b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UzdlMFYyd1BYb1BvLzU0YXlrVTVmaTJmVGlQaDBpT0RVdjgvMmtIb2ZOK28r?=
 =?utf-8?B?LzJjN002VTYzczBkT2wwSk5sTk5SNHJJRDYxSnpWaENUd3REVnFEVk93RDJj?=
 =?utf-8?B?SFhzb0J1NVIrdFFJRUpHM2x3Q25OWmVERWVVekRhUU00ZmRkd2NiNmZqdWVF?=
 =?utf-8?B?V2N2VXA5cnpkVFVkRE0xSURPbVhRbHpud3diZFRzbWhxSTVLb3p6QWxJWFZa?=
 =?utf-8?B?Sk5LNUtDemRIcmFEQ0J0K3BUbWJGRXJqMlFHZk9tVGtPNkNRWldNY3JackJD?=
 =?utf-8?B?VXR2NkxmZ3BJNTlsV1p3anlVcWFSdnkybFZBc1JKcVUrYmlKcXFwUEZLMXNI?=
 =?utf-8?B?aFJaUk5BWUd1S2xxdEl6VWZHS3RXMHpxQllUKzJRclUrM3lQcHUrbGUxdjh0?=
 =?utf-8?B?TjlqMmp2MmhMYlNsM2pYSnVWOTU0eWVmVGMwWUplUHpiQ2NtSEZIRm90QjFD?=
 =?utf-8?B?WlNHd2ZaTGNvVXZjZjVmUWVYazJlYUhpTXFtM3JidWlFZ2JoanlCZ293Zlhv?=
 =?utf-8?B?dTVtWmFyYlRtd29WWEV3ZGZvYWZDZmxkN053S1hqSGk4NTh0a3oyQlNNaVJV?=
 =?utf-8?B?OUwzWkMxaXk3RGtpS29VN1dvNFYwUkZxWGNQSzNYVGg0ZnBEZnlJOStNYUlz?=
 =?utf-8?B?MnVudWNSUnNDSHQ1TkNrSk9rT2pjVC9DWGluNmRUSURicW1aT2V1T0NGUzl3?=
 =?utf-8?B?MUtTK25kblNqMHJMVGZMaFZBM3BUaUpZeDc3c0NXMjBUV1U3L1VIdXJLN1h6?=
 =?utf-8?B?ekNNWFNLSkhDSTNxMUdLTURzK05vejhwZzBlL205Zis3K2ZMN09wZnJYMHQv?=
 =?utf-8?B?cnJzaWZsVjgxbldTR2EwM1pRV2M3Nm1ESGQ3VGQ1VU41UUNtNVd3N21iWmxj?=
 =?utf-8?B?RmRadXhiT0I5UFlRcUY2cWRERHBIK2ZtZmoyNjkreUNYWmEwVHZMTnNhWFN6?=
 =?utf-8?B?T1JIZWY5OUcrMkthbnkyRTNIdUVMZEVGZy9YK1IxRlJHSFkrczZOZGRQdStU?=
 =?utf-8?B?emFGcVk3RnZxSTMwNmlUVlk3bzNReVhYMmE3ayswcHhzME13SU1vRGMxbG15?=
 =?utf-8?B?REZVcFB2MWVOVHRCZkhLOWxFZlpFY2NZbGJwclE3Zk1jdGg5eDNZaHJVTHc5?=
 =?utf-8?B?Qm9BTmNvTUd5anVJc3p6Qit3eGt6WjRPZXFGYm5teGgxSk84V1U4bFZ0cmlR?=
 =?utf-8?B?a1lXamlEbXRBYWxISmJxbmltOVhjRStXa1BwYW0vRnhsSDN6dEdsZlZlTk4w?=
 =?utf-8?B?ZlhwTDd6KzdBWlkrUXR3c3RkYi9SOGoydnorYldacU1JMEtVSlozWUdrYXJL?=
 =?utf-8?B?NW1yVE1Zc1ZoeEVrOFZmU3RBSk9nSUhZVFA3WEpZTmFVWFlKdVJ3SEc5ZUxC?=
 =?utf-8?B?dzBkbmVJRUp1L2NXRlJSSjBjQnI4SUlsUkpQcmZReUNCNVVCZ1BwY3N1Wlkw?=
 =?utf-8?B?MDlXWHYxMDlCRGpIYnJRcHdaY3ZrVEtLS3lRbXlCQ2VQV3lvcUp6YVJ3NEhY?=
 =?utf-8?B?MnNjelpQdWEzVTB4RDlwZ0hDZGtBenpOQk1tKzUzRFg0VWh1eklWeVl6QXZj?=
 =?utf-8?B?UkJxa0M2bk1MYy9HTnRqWFdEenp6QkloNGlobFc1ZFN2SG0yOVFUcjltK2FX?=
 =?utf-8?B?dlYvdnZra0xtTTRNMWZRcCtOWEtlNEE2VS95UmNNdEw3ZlFPR29nNkU3NW9a?=
 =?utf-8?B?OTQxY2NDeTF0RSt2cWdBbXBIa3dMNndHcml1M1JsbzlaMWJPSHVodk53ZnJk?=
 =?utf-8?B?aWFJQWRuQXE2M01lU1NyZVJ5NytGUGdGbUh3eEY5OWZQcTJtbER3eXhRVGdD?=
 =?utf-8?B?bW1sZ0NKeTdSdFVXSWc0SEtlcVo1ODBvRTNzWkpRQzBwMzROWVVEWFpiUnJD?=
 =?utf-8?B?VkMrSWZpbG9BYjNaQllIR2lGeTA5a01palJTajNhV2Vwc005V3U0bjFLeGhk?=
 =?utf-8?Q?/l/lu/CdpGA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wm5HODUxcU5HdGh0cEpQajJRQ3FJbVFFbGtkNXJTeEtjOStBSGdVWFNjRC9s?=
 =?utf-8?B?a0ZNOTA3NGowVFBzVmRERy9MOVc1d0NWRHpYTk93TDgrcTB1clRLc1VTck9U?=
 =?utf-8?B?QTh6K0UraTlpM1FlT2U2QmU4MlMySGs3OWFMaTRTZDNBOTVLWjN3NUJtWVkw?=
 =?utf-8?B?QXQ1aWcvZHFKWFgxUmpBTmw2N244aFd4ZXVhU1FxRGdYVnoybzNSZzVFaDBk?=
 =?utf-8?B?UGNrVndWNmtXYnZ3UzVHKzhYVmxrWmt5d1dHME40dkUwaHZMQkd3aU1KTE85?=
 =?utf-8?B?MFlDaHBLM01WN0FuMm0xdkgrZ09iM2J2MHcrZWlLejYyL3NvWjc0S2hqb1lm?=
 =?utf-8?B?ZGFIL3dNcUhxNEVidkJJdHRrams4MnJTM2ZNUkx0M3lxeERiT2hGSUgxNnZk?=
 =?utf-8?B?Ky9RWnlyRWVMSzZWdTJ2YnhMLzBCN1BaWmNnOHJsLzRNSWVpc2pTNTNMbFVl?=
 =?utf-8?B?ZVhrVmRMcVlhZmpiMnlmTWtETktsdTg2Y0VMVlBKUnpNQUxrb1RBdzR0RWhs?=
 =?utf-8?B?YVB2QjBmWlV1K1FnOFRNcTdBZ1VMNVJxVWVEcUp3dUlEakNrbFhreG4wUHlh?=
 =?utf-8?B?cEhLZUNQSTN2VmR5Z2tXUm5QaEhxYnVYb0hYUlBvNlR5Unp0YWdxUk5sa0th?=
 =?utf-8?B?dUljL1lGb3hMTUZ3TFlwano1b2dQU0t5NThCbm1TazE4RjBHSlJUWjA3cDdr?=
 =?utf-8?B?STkrQjZLVitqNzhsdm1BdkZJeC9MUmEvQUZvZkJQOHJxN0pQZ2R3WWtsSXIx?=
 =?utf-8?B?bU9IcFVDWlArZFJYMXBHMTVIVjlRZmxZTkc2NjhWWjhrdDZqbDZja29OWVRO?=
 =?utf-8?B?OFFtVnMxaTJZV3A0R0ErWStQNy93TVY1M0tMbjVCZmVoZ1FMbjNQN0tpeFpX?=
 =?utf-8?B?QUV1YSt4ZFhVSUhGdE5QazFlNW1OMVFQTmVIZmdFck11TE9YZzQvU1I2WStY?=
 =?utf-8?B?WXFoT2hNYXkvRDdzWE4zRysrdzR3Yi9BckZZNlVKcjJmanpaRjNNbDRkdGJV?=
 =?utf-8?B?Zks3U1RSN0JzUTl3ZUtmN2dQRzlaVmw0cURKNUl6eEUxTXJLSWRuV204SnJY?=
 =?utf-8?B?MERxSUlneWtraHRiMXRYMDRCeFZFSnU0WVIvS2RLNWEweU03ajJON0I0T3JJ?=
 =?utf-8?B?NnZDTjdyVi81T1FQamNWcG1MN3JzUkxMZW5IeU1qVmJadDlEYm9pKzFGS2w4?=
 =?utf-8?B?bkNKdkUxeDNxVmp0M3NYL1lxQnNZclNzYVF1bVhOQVBHY2JJZWFJNU5kbkFr?=
 =?utf-8?B?bkN6RkpHeTc1TExSSFphZmdXM0ZLdEhIc3YxcDQzMVN0ejdhL3NJYVMzSit1?=
 =?utf-8?B?cjROMi83TUM1d1FxU1Q4Sy9QT1J1eEw5WE1oUkx2SlR4ZDZyQWduQVRoa0Y0?=
 =?utf-8?B?SEpUa0xYbmdES1FKbWp6MWh6YWkwcVVJRnZhaE1tclBKT1F2K2NtMC9GcUMx?=
 =?utf-8?B?VngwS2x6Q0V3RTFSZFpNdm9ONXlySUxwVHFwYWR0aGNWbmc0cytLVnNkRHMz?=
 =?utf-8?B?OC94UGdyYU1ia2J2WFBJWGtuSWZlRmFReG9aSkc2SzlHd01iaTRRM3FOKzIz?=
 =?utf-8?B?eWg5WnFzdUNNNCtrbExrVmNoRGw2Tm5YMWR2bzc0V3hmelFhSG9qT085RmJ4?=
 =?utf-8?B?clVNQjR1S2NadmdIRkMrOFZjU3Q1UVF2ZW1aLzErbFJOUTNuT0hYZlBFZzBM?=
 =?utf-8?B?S2luekVMQnBTMTVUVVJieldRcUtZbkI0NEVFOHcvdUVXMGpBSC8yUm83K3lB?=
 =?utf-8?B?b0FDNVc4eXRuSXZIVEhCQitCUjRvc1VIY0Z1YVJ4R1J4OS9rNEgyaG0xaWQ2?=
 =?utf-8?B?YzRIeGFvMTFoNkplWCtMSjFhVkVsd25uRTQ3THdyVndpM2NVbEt6WW4zVUgy?=
 =?utf-8?B?V3Q4N25tNURkNUx3TmFzZURpMHg1bjVzL3hhZjNYUUZKRmpFWkN5LzA5Qy9Q?=
 =?utf-8?B?SGd0S0kyRVp0REpiQlZXZCt3MGN6SjZBejVONjEvZkZ0cE90L2NlRnVRYWtO?=
 =?utf-8?B?RWhLbXFKd1pzR1VNZ0lKc1hXYTN5cE9JcldxZGdBRFVUZVZyMlBRdEh4S285?=
 =?utf-8?B?TWFidEcwdjBLT01jcVlKYnZ4enlUQTVScjlvTHMyR0RYaW5BOGZXNG92SHJI?=
 =?utf-8?B?bzNJRG9qMTdJQ3dydkZWdDd4Zys5QjBzNVMvc296amd6dUpuR0NyeThNQW9B?=
 =?utf-8?Q?E+rBabqensEz7SAOWdZ7z4SjNNkaXbVBy9Sxj+GFsY2d?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ae7b893-dd02-410a-c30e-08ddbdebb3b4
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 06:50:18.7766 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O+MakmoYhlHnNXWtfCkng7S1np4w5hQnNMfvTnjIRzprwqud0DywBf+4bqKZoMwolGCwja6apmlgVF7R6oyGeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8412
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

From: Joel Fernandes <joelagnelf@nvidia.com>

Instances of the Falcon microcontroller appear in modern Nvidia GPUs and
are crucial to the GPU boot process. Document some concepts which will
make nova-core boot code easier to digest. All the information is
derived from public sources such as public documents, OpenRM and Nouveau
code.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 Documentation/gpu/nova/core/falcon.rst | 158 +++++++++++++++++++++++++++++++++
 Documentation/gpu/nova/index.rst       |   1 +
 2 files changed, 159 insertions(+)

diff --git a/Documentation/gpu/nova/core/falcon.rst b/Documentation/gpu/nova/core/falcon.rst
new file mode 100644
index 0000000000000000000000000000000000000000..33137082eb6c14cecda2fbe6fdb79e63ee9ca2e6
--- /dev/null
+++ b/Documentation/gpu/nova/core/falcon.rst
@@ -0,0 +1,158 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==============================
+Falcon (FAst Logic Controller)
+==============================
+The following sections describe the Falcon core and the ucode running on it.
+The descriptions are based on the Ampere GPU or earlier designs; however, they
+should mostly apply to future designs as well, but everything is subject to
+change. The overview provided here is mainly tailored towards understanding the
+interactions of nova-core driver with the Falcon.
+
+NVIDIA GPUs embed small RISC-like microcontrollers called Falcon cores, which
+handle secure firmware tasks, initialization, and power management. Modern
+NVIDIA GPUs may have multiple such Falcon instances (e.g., GSP (the GPU system
+processor) and SEC2 (the security engine)) and also may integrate a RISC-V core.
+This core is capable of running both RISC-V and Falcon code.
+
+The code running on the Falcon cores is also called 'ucode', and will be
+referred to as such in the following sections.
+
+Falcons have separate instruction and data memories (IMEM/DMEM) and provide a
+small DMA engine (via the FBIF - "Frame Buffer Interface") to load code from
+system memory. The nova-core driver must reset and configure the Falcon, load
+its firmware via DMA, and start its CPU.
+
+Falcon security levels
+======================
+Falcons can run in Non-secure (NS), Light Secure (LS), or Heavy Secure (HS)
+modes.
+
+Heavy Secured (HS) also known as Privilege Level 3 (PL3)
+--------------------------------------------------------
+HS ucode is the most trusted code and has access to pretty much everything on
+the chip. The HS binary includes a signature in it which is verified at boot.
+This signature verification is done by the hardware itself, thus establishing a
+root of trust. For example, the FWSEC-FRTS command (see fwsec.rst) runs on the
+GSP in HS mode. FRTS, which involves setting up and loading content into the WPR
+(Write Protect Region), has to be done by the HS ucode and cannot be done by the
+host CPU or LS ucode.
+
+Light Secured (LS or PL2) and Non Secured (NS or PL0)
+-----------------------------------------------------
+These modes are less secure than HS. Like HS, the LS or NS ucode binary also
+typically includes a signature in it. To load firmware in LS or NS mode onto a
+Falcon, another Falcon needs to be running in HS mode, which also establishes the
+root of trust. For example, in the case of an Ampere GPU, the CPU runs the "Booter"
+ucode in HS mode on the SEC2 Falcon, which then authenticates and runs the
+run-time GSP binary (GSP-RM) in LS mode on the GSP Falcon. Similarly, as an
+example, after reset on an Ampere, FWSEC runs on the GSP which then loads the
+devinit engine onto the PMU in LS mode.
+
+Root of trust establishment
+---------------------------
+To establish a root of trust, the code running on a Falcon must be immutable and
+hardwired into a read-only memory (ROM). This follows industry norms for
+verification of firmware. This code is called the Boot ROM (BROM). The nova-core
+driver on the CPU communicates with Falcon's Boot ROM through various Falcon
+registers prefixed with "BROM" (see regs.rs).
+
+After nova-core driver reads the necessary ucode from VBIOS, it programs the
+BROM and DMA registers to trigger the Falcon to load the HS ucode from the system
+memory into the Falcon's IMEM/DMEM. Once the HS ucode is loaded, it is verified
+by the Falcon's Boot ROM.
+
+Once the verified HS code is running on a Falcon, it can verify and load other
+LS/NS ucode binaries onto other Falcons and start them. The process of signature
+verification is the same as HS; just in this case, the hardware (BROM) doesn't
+compute the signature, but the HS ucode does.
+
+The root of trust is therefore established as follows:
+     Hardware (Boot ROM running on the Falcon) -> HS ucode -> LS/NS ucode.
+
+On an Ampere GPU, for example, the boot verification flow is:
+     Hardware (Boot ROM running on the SEC2) ->
+          HS ucode (Booter running on the SEC2) ->
+               LS ucode (GSP-RM running on the GSP)
+
+.. note::
+     While the CPU can load HS ucode onto a Falcon microcontroller and have it
+     verified by the hardware and run, the CPU itself typically does not load
+     LS or NS ucode and run it. Loading of LS or NS ucode is done mainly by the
+     HS ucode. For example, on an Ampere GPU, after the Booter ucode runs on the
+     SEC2 in HS mode and loads the GSP-RM binary onto the GSP, it needs to run
+     the "SEC2-RTOS" ucode at runtime. This presents a problem: there is no
+     component to load the SEC2-RTOS ucode onto the SEC2. The CPU cannot load
+     LS code, and GSP-RM must run in LS mode. To overcome this, the GSP is
+     temporarily made to run HS ucode (which is itself loaded by the CPU via
+     the nova-core driver using a "GSP-provided sequencer") which then loads
+     the SEC2-RTOS ucode onto the SEC2 in LS mode. The GSP then resumes
+     running its own GSP-RM LS ucode.
+
+Falcon memory subsystem and DMA engine
+======================================
+Falcons have separate instruction and data memories (IMEM/DMEM)
+and contains a small DMA engine called FBDMA (Framebuffer DMA) which does
+DMA transfers to/from the IMEM/DMEM memory inside the Falcon via the FBIF
+(Framebuffer Interface), to external memory.
+
+DMA transfers are possible from the Falcon's memory to both the system memory
+and the framebuffer memory (VRAM).
+
+To perform a DMA via the FBDMA, the FBIF is configured to decide how the memory
+is accessed (also known as aperture type). In the nova-core driver, this is
+determined by the `FalconFbifTarget` enum.
+
+The IO-PMP block (Input/Output Physical Memory Protection) unit in the Falcon
+controls access by the FBDMA to the external memory.
+
+Conceptual diagram (not exact) of the Falcon and its memory subsystem is as follows::
+
+               External Memory (Framebuffer / System DRAM)
+                              ^  |
+                              |  |
+                              |  v
+     +-----------------------------------------------------+
+     |                           |                         |
+     |   +---------------+       |                         |
+     |   |     FBIF      |-------+                         |  FALCON
+     |   | (FrameBuffer  |   Memory Interface              |  PROCESSOR
+     |   |  InterFace)   |                                 |
+     |   |  Apertures    |                                 |
+     |   |  Configures   |                                 |
+     |   |  mem access   |                                 |
+     |   +-------^-------+                                 |
+     |           |                                         |
+     |           | FBDMA uses configured FBIF apertures    |
+     |           | to access External Memory
+     |           |
+     |   +-------v--------+      +---------------+
+     |   |    FBDMA       |  cfg |     RISC      |
+     |   | (FrameBuffer   |<---->|     CORE      |----->. Direct Core Access
+     |   |  DMA Engine)   |      |               |      |
+     |   | - Master dev.  |      | (can run both |      |
+     |   +-------^--------+      | Falcon and    |      |
+     |           |        cfg--->| RISC-V code)  |      |
+     |           |        /      |               |      |
+     |           |        |      +---------------+      |    +------------+
+     |           |        |                             |    |   BROM     |
+     |           |        |                             <--->| (Boot ROM) |
+     |           |       /                              |    +------------+
+     |           |      v                               |
+     |   +---------------+                              |
+     |   |    IO-PMP     | Controls access by FBDMA     |
+     |   | (IO Physical  | and other IO Masters         |
+     |   | Memory Protect)                              |
+     |   +-------^-------+                              |
+     |           |                                      |
+     |           | Protected Access Path for FBDMA      |
+     |           v                                      |
+     |   +---------------------------------------+      |
+     |   |       Memory                          |      |
+     |   |   +---------------+  +------------+   |      |
+     |   |   |    IMEM       |  |    DMEM    |   |<-----+
+     |   |   | (Instruction  |  |   (Data    |   |
+     |   |   |  Memory)      |  |   Memory)  |   |
+     |   |   +---------------+  +------------+   |
+     |   +---------------------------------------+
+     +-----------------------------------------------------+
diff --git a/Documentation/gpu/nova/index.rst b/Documentation/gpu/nova/index.rst
index e3650f53ff53113f31f63f67cf26116b5c070693..e39cb3163581ea4ff5b441b82e9efa4282c946f8 100644
--- a/Documentation/gpu/nova/index.rst
+++ b/Documentation/gpu/nova/index.rst
@@ -31,3 +31,4 @@ vGPU manager VFIO driver and the nova-drm driver.
    core/vbios
    core/devinit
    core/fwsec
+   core/falcon

-- 
2.50.0

