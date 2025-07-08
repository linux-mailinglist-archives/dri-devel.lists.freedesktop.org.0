Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A28AFC326
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 08:50:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A7F210E584;
	Tue,  8 Jul 2025 06:49:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NHnla2x2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2086.outbound.protection.outlook.com [40.107.236.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C7BA10E138;
 Tue,  8 Jul 2025 06:49:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ksP50VjwInbHXYcWgjLug1ahSHIrjxwABxdvZIU7GRC/dJioIZ0dkb2tr9VXpXMhQx6ZbUMb/HpZ2ZxhMHYHHUERswGEm7r1pYU/VScqgie9v4q4yvpINAY+anf29fn+46w50eZGRUIT68B5FnL6iQKnNqBGXPwo845Wofj5Ipr4GIBFH1MuNaufC/MTERkEuZHiXiNItnFriGe9IwLAoJNUX/lMV4QEo05vlsxr6Gt++pcl3AfuEzAWBbklYcAckPAbN9QDZDbJaJrTaXk310SqL3LEGrGozS0ATUVFN7RStAVyRKVsUPMpDh7aCRhOEsDz9e5MBaM6+KqC3eP6wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=42jWaFbui+L9VAbkJ8FAxaSrtahsfYBgdm+8wHX7y30=;
 b=rkpz/vihivPCWtV0K8FJEsDneq9P+m7plO7dDfa7QM35nxbs3auzFkKbSIjcAVkFu+o4YmWCKpf0qJT9XlUNP+ZYuoZfhBl1a3gXDEK+qU0Fa2nvEkcskHIKdsMaXA5l+Fg78fbI/PGdSjvUuIwtVTYkKOG+5t6e1YW6pThf9t25Yv/f6cwzXTMUbr0TzD3n3M8RksLZPR86M+LkESoKHS2D1goI7UKVlRUlKlHbrbVsLVz9n+qkVr2YevhDOc/Cm4YUAJBxOQtgt1y4iISrf5TvFSfFW//VgNBgjs66VusgdcxQ8p/diOUWsiG1CrJK4AN/cTdUI4J8d8mFAr65PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=42jWaFbui+L9VAbkJ8FAxaSrtahsfYBgdm+8wHX7y30=;
 b=NHnla2x2oSG7AjO6KJFxrG60X3d6xVGvEod+uRVRIWMWmdlK7KuYXjLKA8v+18SCZJdE8QElTp0IteGtRn1olUPlsVzo5jne2PnEmysE00dmFvQFKth7MsnckZVbJHo0eMPrQlP3I3HfIjQJv2XUd7t1fmRyCV5v+8rhZeTqsR8vDeHFR9c30AkTmEWtmkYHdmdGTfV4meQVF9bDe/ZgeqTj2DmrKNVwB7uwD7d8jstl8oVEUJA8sM3OBskVDp+3bwvDIVUHLl9KbVs6EQUw5tXQVcFzJAYgwXriy32bpLb8XSIZFrkRhUbYdRrIxX6W8JxypXwJGCyuNPKx62W8rg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Tue, 8 Jul
 2025 06:49:52 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8901.021; Tue, 8 Jul 2025
 06:49:51 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v4 0/8] Documentation for nova-core
Date: Tue, 08 Jul 2025 15:49:40 +0900
Message-Id: <20250708-nova-docs-v4-0-9d188772c4c7@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIS/bGgC/23MQQ7CIBCF4as0s3bMCFKtK+9huqAwtbMQDBiia
 bi72LXL/+XlWyFzEs5w6VZIXCRLDC2Ouw7cYsOdUXxrUKQMnUhhiMWijy7jNAxEngyZyUD7PxP
 P8t6s29h6kfyK6bPRRf/Wf0rRSDjrXqmezgfN6hqKeLF7Fx8w1lq/JP4oWKMAAAA=
X-Change-ID: 20250702-nova-docs-b9900d0505b5
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
X-ClientProxiedBy: TY2PR06CA0004.apcprd06.prod.outlook.com
 (2603:1096:404:42::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY8PR12MB8412:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a916ec0-4768-4e34-a972-08ddbdeba337
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K09wWmpZY3ljMjBpYjZUMXJIekkralpFNEl6ZEhDOHVlVDNreVFGSVZWaVZx?=
 =?utf-8?B?amtGanlpUFM3ejBaQzBzcU1TV1cxWk5kM00zV3FnTkVSQ0dMUUJhNFhrQk44?=
 =?utf-8?B?TzM0ZklOcCtpQnVzYzR3MVJtU25tSjBTeHJ3Q1VZZU1PLzFTSXZNSHM0ZFg5?=
 =?utf-8?B?RUZXZzMvd0c5UkFyUDRReG9kcUNxQ0ljSDNxR0xYNVp2Y1liV1JqY1BuOUhv?=
 =?utf-8?B?MU8rWkZrTlQyY3dpZzQrU0JyTU5Ha0hFZVJkTXkwYXAvNUppWlFCZkJ1WU5j?=
 =?utf-8?B?MGZvTGtSb2lWbDRpd2h5Q2YyQjZyVWxJcERPMXVyaGZyQlE0TnRxb0h6YUpw?=
 =?utf-8?B?ek5FamI5OGtwVUFWYkh2eFp2Nyt0NnJmakkvZk1oNjdtLzVQNzN5VFk4SnRR?=
 =?utf-8?B?SkZmUjJvOW5nUW4rT3JNNllrUHhTekFzZCtlY3pEVW5OSmNwV1RxT09Od0F5?=
 =?utf-8?B?Nzk2VmV2aU9nRGt0TTV6OUZUS21ZUEg2QUNPL0pSK3FQc1hVQVJQRHZDUEdE?=
 =?utf-8?B?a0xyYlVYZzJqT2FWZU1EeVQyU1dsSHhRVEV5bllxcGc2UWtmd0JoRzkrOGkr?=
 =?utf-8?B?WVNOc3dFSG9OUjdjSWJCOXdJWWwxRUp6RFhSTGJsbWdqZkZnTUtXVTZ6ODdx?=
 =?utf-8?B?RFVwMDl1eG41MmNFQ3lmMXV1cmVFdmNUSlE5cy9rd3pyUnErK1NTdU0zbUNU?=
 =?utf-8?B?QmUzY0tPa3lxeGdua1kyNDRCRkFIUWpEZXVzb2JDZ3h6YlJTOHhadnc1Y1BO?=
 =?utf-8?B?MFA0dDNhREw3b3F3UnVkYlJUQ3REdWUzTWpQdEVjOUZUTFpVazZhbDNxZTZt?=
 =?utf-8?B?Ry9kdHFLWGdRcTROZWRmTWhHUG9xTjA1QUhvRzZjaHM1ZW15WTBiU2p5ZTFX?=
 =?utf-8?B?NkdOcHRRSXlDaWZVcnR5ZTdkTHdSejBuVkFPMXh4S1huK2JXaDFpY3FoVWVh?=
 =?utf-8?B?SjJpeGU3dEg4dlpuRmE3OXRHM1pHMzByUVlob01ZMnhhMCtUYzd3ajdsVXJH?=
 =?utf-8?B?cmR1WUpEbVhhaWdHejI0N29mMGlOMXpWenk0UzZnMjVXUTVtbmpVeDFFT3ZY?=
 =?utf-8?B?SmtGUjU2SnVodUYyaUhhd3BoVFJaM05LK21rU0dZWktXdFlVVEliOHU3R205?=
 =?utf-8?B?MURJcEtZeW1QdWZYOVllWW03UlJCRlIzQy9nWWhidE1YYk9iamp0ekNMbFYr?=
 =?utf-8?B?SW5CVzJObXU3Y0RuMlNUcjdTSXFoSTNPaGFIdnJ1aUJScG1vek8zY1loQjVz?=
 =?utf-8?B?RFlQNlhPQkJKR1M3ekF5ZDlSdUpudmdkclhLMUJ3dGR5UUpUOEVnRm1nQ0Jl?=
 =?utf-8?B?ckxaaDNjYnBaS2g2MXpGMS9OYW40azZpS0JJc0QwMVFnNG9XM2RMRmxWellM?=
 =?utf-8?B?V3BpQVpzTXJLV2RhV2swY3Nzb2NpYUpNdjh0anNkcUg3bHB5MktUMHp2SU5y?=
 =?utf-8?B?b1ZGekQyZ1VGOSt0ZmFCQ1FHY0hUWlVlLzFidmRKcnZBSUNRd2dUTGx2Nkxw?=
 =?utf-8?B?cEkrNkgrZkplZ1dNMlRWazJMVHRudCs0NTg3UE9wRmRQMld4VDdaZ08xV2JC?=
 =?utf-8?B?Y0c1V3RTQzl4ajRQNGxucVFyZGFMWW4rZUxqY1RxVm5ZdWZoUE5DQktIbFBB?=
 =?utf-8?B?UDI2U3ovZ09EZGljWUZYdUNMNWVHTnc4TllGTzlaUC9mQUVlQ3RNeXBkZURp?=
 =?utf-8?B?aE5jVGo5eVM0NUUrT1V0M0l5MS9lSE10STgxVTlESVpSdm1XVDJwdkw1bVVT?=
 =?utf-8?B?WEdqNW9KM0FzU0VqbGwybVBEL0RNUzNjaHlwWjVJT1dWWjNpY0YzMmhjWnMx?=
 =?utf-8?B?YUdkYi9Bb2wvUVZDWnU0anJNNU5ldXZPS09DTFgzQnpyTUIrSDc5N2ZyYWFC?=
 =?utf-8?B?MmtjREVYMW9XekFBUDUxUzAzYWxVZWZrRXpqVitaMlpaRHZSQSt4SWRRL1lz?=
 =?utf-8?Q?N0kX18SdwCI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0tiUisrVEgxbjA3R1N2Q0Z5TUg3MmRpZ2dxZjd4TmpmM1RQbVFoMUVoanhy?=
 =?utf-8?B?Yjl4UTJ1MmFyNEpoWnJ5cEltWjlkOXVMOVRiZG5RbzQzcWJ0TzA0ZWVwellZ?=
 =?utf-8?B?MlMxN2M0d1pQQ1ZEVjBrbWZwRGNXTFNlSWRSVDdQbUxETmFVbDNpS0dIVmFV?=
 =?utf-8?B?TGQ3dFYra25pRENRVDBZRmFneTI1LzRibUFTbTgyVmRHcUhrcTMyQzZ2ZVpl?=
 =?utf-8?B?VzRnOWg3NkpWQjArTjQxeVJKM0M3TGlMZkFyQVB0MlpKREFPRXkzZ3puZEpS?=
 =?utf-8?B?Q2hrcmIxTWs4L01aUldTNVlWSXMxWVVOTng4YThLRkV5ajVMUmtCRWs5NmNY?=
 =?utf-8?B?OVdTRFZQbndEdjl2N2NRanVTTXZXNzJQVTlTeHVIWXR2MWI2VGV0VDU1UTV4?=
 =?utf-8?B?UU5rTlVrRjRqbXBZMlZQOFpTck1LQzlMUTZORGhPQU1YOXlOdExDY0ZiMGpF?=
 =?utf-8?B?VXRkUWhES0IwWGwwMjlCMlRnOTdldGtNRUVUV2pGNGRwMVQ4TXZMR0N5K1Z1?=
 =?utf-8?B?VWNsTVgzSGdBSFpUaWdDSnFVbGdFdE9XYUFWd3RGUDhCVjBZdWxDMW9HRDk0?=
 =?utf-8?B?VThwN0dtaWFKT0NJdGZVb3I4TVRObUE4R3VGVlN4Z1k5bGhFMStad2NwVVJ1?=
 =?utf-8?B?S2c2VmpqRjhXazMrUGFZQ3pqMGc3NEgzNkhKU0lyRTRSU0FnUFNuQS9oYUx1?=
 =?utf-8?B?ZzZhSmczU3RNMDlaOFQzdUZYSUpxM2dmd213YzhHYkRRM1ovNGRRU1QvMTk1?=
 =?utf-8?B?dkFWaW9tU1NlK0w5UkdEaHIyRlVhM1lQTmVrMFJSVjUvSjFiNHdTTUdUL1Z0?=
 =?utf-8?B?clRuOXBoNC9WTW9RWk5BTDhod3RzeEpYRkFNMVJ1MTcvYVRKYTRDc3FyZko0?=
 =?utf-8?B?aUU5VUcvUmllaWVpWU1RMCt1MGNGd1dRYkZYcHRiVml0Vzg5bm9vS0NKSjlS?=
 =?utf-8?B?eWJ5ZVY2cTNoYjFNUFlYMzYyTmF5aTNHanVTWWM0czJJVXBmQW1ad0s2NGVn?=
 =?utf-8?B?WXFMVUpXdFZTNHEzT1FkamliQ2lwYlBXd2QwYitCQ3RaTHF3dW1IQ05hL2pJ?=
 =?utf-8?B?WFhrcEIvSnFkcjNQZ0M4NG51STBXTEpjZnE5SVJ5VGVDREt5ZG5nUlJWQ2JD?=
 =?utf-8?B?aVFuakpMRDgxM0NHZHJSUFFuV2dveHYwMThHZ1Rnb0NGUEVKM0tmTEViVGJz?=
 =?utf-8?B?T1RGZUJJZDI4amVLSFlLZElmbTl1WnQyb3M3ckp0enJjRjRkSitMS1VMTGI5?=
 =?utf-8?B?Rkh0V3BxQWRoa2NMUm0xaFhvaVVNRFFEM01EYmY4NEp4Q3IyL3hMWkFUMStv?=
 =?utf-8?B?VU9Mc21McXhrV1JKbm44VVJaTkd0ajlFbUZHMVA1YURTRzdIclFzVkVnYlgv?=
 =?utf-8?B?MU1hWDl4cUJNTThGemFVRml5Y1cxbUh5SGI4MUNSMEQzRytqM3kwaDVNU1U5?=
 =?utf-8?B?UGpvVEVuUjhhUmVZakloRjM3bVM1MTNmeHg3ZTVPVktqNWNQbkhReHNTM0lM?=
 =?utf-8?B?M2xjRkJMaEpYdVRXN0plWEdsOW5wRU8vVGxxMFZyVU9aT20rby82N3BxblRU?=
 =?utf-8?B?SnVkQzNVMUlzc1h1YldBTHcxQjJaTVhJYThXWFhrOEZzNzdBRVFFa2NHaHQ1?=
 =?utf-8?B?cGd3QnJoYjJrWCtVbkg0Sks1OGdYWXRSZ0FrWEh4cUpLQUwwT01hOGI2WFA4?=
 =?utf-8?B?eDhGTHdhUXdBdTU3SHZhaG1RZjVBbENURXhZUHlBOWJYM3c5VUI0YWJpVjEr?=
 =?utf-8?B?dDFLZnJ2MHRKV0wrMWpsZjFHWFRNVlQ5YU5FK09HZi9hZEJXRWVNTXJjbUxG?=
 =?utf-8?B?cTdFZjZPWGpTWGxqTXFsa1hjNjB4TXlySUM3TlJ3T1NxY2JjWVBlb0lyUEx0?=
 =?utf-8?B?N0JheFZodnZCUmF3ckFkZnpWblF3Q1JuVThWSHcxMHlZYXFjSWZKaXM0em9Q?=
 =?utf-8?B?UFNQL0lYWTEzN1Y3bmdOYjN6UzFDWC9QcnpqaFl4UFlITzA3Rm5tc0hSaXY3?=
 =?utf-8?B?Ri8xQVdWMk9jMFk1TG1oczRTc3lUSnFnT2J6RzF0ckNkR1VxUlIzd1Z0TUMv?=
 =?utf-8?B?RzlWa2xydy9KM25jWURKUnJaWWJwY1dOTGt1QjBJYU5oUzJiRURpMWo3YUk1?=
 =?utf-8?B?K3hFYkxWWmVaS0tzdHJDTms1enhPWE13SFVSVS9NQnVRdm1QeHB5NVBKM2gw?=
 =?utf-8?Q?QNbzx5bIvJkKNA8M2XedUyIlVxTRA+0ZTTGKz5ActryT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a916ec0-4768-4e34-a972-08ddbdeba337
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 06:49:51.2647 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U1jzP9ofQaBJ1I2w2TTbvP1fmECaWyintf8TDxU1DU8X+SrZfEX9Wxth4hiiamUayuQXAlZoy6an0QSuWmhRUg==
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

This series adds some documentation that was relevant to the FWSEC-FRTS
[1] series, but wasn't sent alongside it as it was worked on in
parallel.

It notably introduces a lot of HTMLdocs that adds key explanations to
understand and work on the GSP boot process.

[1] https://lore.kernel.org/all/DB0I8WAH970B.25D3S59AYF85P@nvidia.com/

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Changes in v4:
- Convert `/*` comments into `//`.
- Fix missing slashes in doccomments and minor typos.
- Move some less-important paragraphs to notes in the RST files.
- Link to v3: https://lore.kernel.org/r/20250702-nova-docs-v3-0-f362260813e2@nvidia.com

Changes in v3:
- Rebase on top of latest nova-next.
- Reorganize patches a bit and use standard prefixes.
- Convert diagrams to only use ASCII characters (thanks Bagas!).
- Move sysmembar documentation to the new `SysmemFlush` type.
- Reword things a bit here and there.
- Reorganize order of `index.rst` for a more natural flow.
- Link to v2: https://lore.kernel.org/rust-for-linux/20250503040802.1411285-1-joelagnelf@nvidia.com/

---
Alexandre Courbot (1):
      gpu: nova-core: convert `/*` comments to `//`

Joel Fernandes (7):
      gpu: nova-core: Add code comments related to devinit
      gpu: nova-core: Clarify sysmembar operations
      gpu: nova-core: Clarify falcon code
      Documentation: gpu: nova-core: Document vbios layout
      Documentation: gpu: nova-core: Document devinit process
      Documentation: gpu: nova-core: Document fwsec operation and layout
      Documentation: gpu: nova-core: Document basics of the Falcon

 Documentation/gpu/nova/core/devinit.rst |  61 +++++++++++
 Documentation/gpu/nova/core/falcon.rst  | 158 ++++++++++++++++++++++++++++
 Documentation/gpu/nova/core/fwsec.rst   | 181 ++++++++++++++++++++++++++++++++
 Documentation/gpu/nova/core/vbios.rst   | 181 ++++++++++++++++++++++++++++++++
 Documentation/gpu/nova/index.rst        |   4 +
 drivers/gpu/nova-core/falcon.rs         |  29 +++--
 drivers/gpu/nova-core/fb.rs             |  10 ++
 drivers/gpu/nova-core/gfw.rs            |  39 ++++++-
 drivers/gpu/nova-core/gpu.rs            |   3 +-
 drivers/gpu/nova-core/regs.rs           |  35 ++++--
 10 files changed, 677 insertions(+), 24 deletions(-)
---
base-commit: 4092e1b41202ff39aad75a40a03ac1d318443670
change-id: 20250702-nova-docs-b9900d0505b5

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

