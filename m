Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCF1B09C77
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 09:27:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E69B10E90C;
	Fri, 18 Jul 2025 07:27:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="QecnNZdr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2063.outbound.protection.outlook.com [40.107.95.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D551010E909;
 Fri, 18 Jul 2025 07:27:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WntOvflaOqGwH8ap+05L9r4nrZKetkxUI4r+vyd35yRGg63fwT8fHUi194bypzLM6Gf2XwqhLupFQZoYZSd1GnGMmaR9MfnpBDduw/D8Bu4MaNAhY9bgzunnTAcVx8rdaArUzqfL5Du9Pk54uFBZATZ5CRyLAoCLp3paA8GFZtyZwiDwTQ4hF1S1hU5TN5yikeUeHZDobmE04wQx82DdEirlgD5bA4ktCEOnpxSvI9VNWYlK5aX6qkGfo8bTFeXynFGVtMrpeN7JRk+1OXMF5SEDocEyRN0ByDbvpszqaTbJaiwwRJtEXKMpgZFcWD4mPrZe+J1J2z3BOQ2N+ndYMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pVSFlvxkoSQu9wDxOuGfO4ypERtxLmES0MK0d4pI5Ao=;
 b=REe0B6n2L4SaW+NIgSnNAAR6/n5xAYpWXuSt2Nvi77jtGzqqp+tennwtQhcN4xOsX+dxOd6xr8iz8Niorodq7lOoPSkQx/kEBfHUwHNs7u7eH/nJFsoJFwYwxoEvFbHdiJ+rO+Ri50c4WZM2jNsbE27o8Fgadyu/DoQIFBk71LqFFAhMvSTUGTP3ffRZmfGw5/UuuFw9QxV/JKq2zyvFXlT+aZ7fRyl4BByGVBwLVBnhbzWNL4422h3iu0b6/TcTGINqCMVcy+orZN0uhD8UhV9yj5zneHL07N0Sr9jDNVeCDhoHnfYv2nUw6SzXBUSH1DmVZY6A5AL5qUWEB/6lpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pVSFlvxkoSQu9wDxOuGfO4ypERtxLmES0MK0d4pI5Ao=;
 b=QecnNZdrKMUBzFWijjkUf82bLH3BY5IxkHC4yCbivZrzDPWObW1TaMJrMF9hRwqZaoSrT/9ZEAMHQf4z+zChgYaZUNhTWPODwf9sujiT3q/1Ab570mLIkQW0r/UdfmTB4u0YX5vM/lFWpVOwjLoC+p93ENZGLgRTRl0i2GGSpFIK/f6HFdV9Q+21n449Xx0nTz7ZZbbyC0tCuIX6C3hrBuk5R2Yf4PLjr9FEh7GsFtASjs/8n7jeWm8d2J2ksXiKMYWgF1veweaC1uu82FnKB5e782LW6PMM+yWwZXlfq8ppqzslRlQYN8GjV6EILZMbvEu6T2up8e5tvVzhGQIZgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW3PR12MB4427.namprd12.prod.outlook.com (2603:10b6:303:52::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Fri, 18 Jul
 2025 07:27:08 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 07:27:07 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 18 Jul 2025 16:26:19 +0900
Subject: [PATCH v2 14/19] gpu: nova-core: register: use #[inline(always)]
 for all methods
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-nova-regs-v2-14-7b6a762aa1cd@nvidia.com>
References: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
In-Reply-To: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, 
 Beata Michalska <beata.michalska@arm.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0055.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW3PR12MB4427:EE_
X-MS-Office365-Filtering-Correlation-Id: 33568b46-c74f-45c9-c41c-08ddc5cc809a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGVlUWhKNjVGaWtrN3A5UElrR0tYSXJpS2p3cUR4YnppeERRQ243QmM3cUQ2?=
 =?utf-8?B?WmRuV20xZXZEamlScHpXWXgzUnA0QjJsRVdQcHV2bks4SVc1Y3RaaXlvNGhs?=
 =?utf-8?B?d29ZSzZycXJDcFFoZEs2YnBPNkRDbFZGdWR0TG5obCtOUXhuWDA1ZFU5aW56?=
 =?utf-8?B?VXIwb01NTXlDYXBpSmVxM2FkQy9ubEZwRTNiRXl2eUp6NVNpcEd3ZkhUZlIx?=
 =?utf-8?B?UytWNTJBcWZ6MktlREkzRHZhRzlyNGUycFVDbzFDTGRMcXBWb0lySTFYWmp6?=
 =?utf-8?B?V25nRnBPUHdXRHpTUXRVVVN3cnRXWVloL1FmekhCbmx1eFM3bGxwQ0FlSHNk?=
 =?utf-8?B?UTY0cmhGQ1I0WDVRTXRralJyYktRdmNRRUU3eGpaK2xkL2pSZzFhUE9iTGRq?=
 =?utf-8?B?K0l3aXZQM0xOa1ZkbUZXa3JyVVR2S3YwT1AvcDJRTzByelZqZWJUSHdHL2ph?=
 =?utf-8?B?ZEFGMHplTldsZjhCR0FTZ0hPOXpkeklMMFQ3K0JIM1dHYTcxbDFoZzhFT3Ny?=
 =?utf-8?B?ckxlcFZhTzBlVWRibk9IcVRsTlZPbVA1KytxaGR2MDBEQTk5NThDQ2dwRFJ1?=
 =?utf-8?B?TndSQXlUZzFhK0pjRUFTRnRxR242OEZtRE45a1I1YkhzNkIzY1hHd3VJNTQx?=
 =?utf-8?B?RVNxcnlpa2tCaFZXRWVXWmNDSEFqejIxUGFub1VjOG9CcEJ0ZkNPV0FGRDd3?=
 =?utf-8?B?ZEFtRit5TFp1ZjdLazZyVDVFQmFTaDhOUnJvRC8zNEhzOThrN0NFcStzZEJ0?=
 =?utf-8?B?MGZmUE95SXJsa05QNHlFL09SZVRTWUtrMlVZODRUYTZQaDI5R3BuVlc2WGtt?=
 =?utf-8?B?S3k4R01aMUQ5bEVsSzVOZ2kvbFoyRDJqaVJ6VFpHb0l4c05iLzhxZm9Bd2ZZ?=
 =?utf-8?B?dEJKYkFra3M5Q01pbC9pd3d4MWNyd1Y2VlRnUXlQeXROelBEQVJYWm5Lcm45?=
 =?utf-8?B?ZUw5dEJIQjZaZjZhMVRqTnczRmtRbHd0RHgwMGJlcDgvb0VqS2FXT2RVZ0N2?=
 =?utf-8?B?eFhFZXZRZFYycGdwenZ2WHlkeFJjdC9iZEZRdC9WOWcvSUNXTzIrQW5yZ1hT?=
 =?utf-8?B?Y25yVFFXa0cybm1KQm9WR2ozNWNmMFo2RTYyblJWSnFIdDhBbEQxT2tmdWNr?=
 =?utf-8?B?ODdjUmE3SExwT210US82cWlRYzN2bjg0bFVod2Q2U0hETFd6SFBvRmNheUF3?=
 =?utf-8?B?aWI3ZUtzYXhnd3VXVkpGVWNiRzExbnZaRVp4T3BBN3VLT2Z0SUlzQXhmeUxi?=
 =?utf-8?B?dEI0aGpIajh6d3c1THdIN1VaOUgxL09qU2ErMnBEVWdTRHZtc0ZaMldqeHMr?=
 =?utf-8?B?bWczc1Z2djUydDdoQ1A4SFRudzhvWThHVXFmL05vcnpHRnV6TmZiR0x1ZjNG?=
 =?utf-8?B?YkJaK2pSZEZWMXV1YXd3RXRLNTc0QjA3SUhGQ3RCc0ozTVRmeTNWZ1RpeThZ?=
 =?utf-8?B?bEIzM05IUk1EeE5NTWdOK0dKUisxK1JuRXZ6R0ZWMm03a21ua0xTNjlaSTIw?=
 =?utf-8?B?YVhPWG9DUjhYYU9YWGFnKzM4djhubEZlWVpBS2doYWVSMFUxWmhTOUF1aHA3?=
 =?utf-8?B?bEVOcFphamU4dkxNOFZKaWZmUzRpTkNtVUxsK2pEZWxFSk1jbzBnOCtmWVdE?=
 =?utf-8?B?UGIzaVFaUm1QUUtDTS9NTVJ4Q2U1NUV5cXFPUVY1bXkyOHBkM1JnVzlZbFBQ?=
 =?utf-8?B?bmxmUkZIU2ovK294Vkc5bnpXNjhUSy8ra3c5dE0xKzdwZWNDdi9pNUx0YWlv?=
 =?utf-8?B?MTg4U3VyV3F3RUVQTDNZd1lndWtiTHFobStPRnBCQ1BHVG56bURtcExpV2ZG?=
 =?utf-8?B?b1Y1aEtTekZpRVQyK25HSC92aUVPS0xvaWlZR1ZFd20yYmNKemxGZGY1ZllE?=
 =?utf-8?B?aWdFenQ0QWIzb29HMm5QRHlOZlZKUlFmSzN3M3pteFczNU1zU2VsVFZtanI1?=
 =?utf-8?Q?9ailMtJDb/I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkV5c1dBbDhBY2RoeW51OGJmaFFtTmoyR0lseElnMDl5UkxydDY0U0tHaC8r?=
 =?utf-8?B?ZlVYaXlwblZzM3BYbDFHekNjb0dvdnhTSXFXVm5GbDVOekU5SVZaNkJraC9T?=
 =?utf-8?B?QjJzbGhVYkkySGZhbHQ2dlE1SnFaZUZvaVVuMnhlbkxZUFdaVHd4TlFubkt0?=
 =?utf-8?B?RWQyaXlQNmNPeGx5UzRucVFQOCt6M1JoMzhkVHNaOWpYRGFxSEx6TGsyVzB2?=
 =?utf-8?B?STd0TzFTZnZybjZjZS8vcHpWbXdPWE1WUnROVGRrSExxZGNPTERITXlpL2RE?=
 =?utf-8?B?UFowYk16OGh1ODJnZ3JwVTlhRGRtOVBHazMzV1VOR0VjTCttVlQ3VnM0all0?=
 =?utf-8?B?aDFodkRwQ09FZWdIcDNkbGgxczBWb0Mwc2l0MVY1cjk0YkVmVjExQ09iR0to?=
 =?utf-8?B?akVLTS90Y3dLanFVa1Fsbk9NcnFNTmhWMGRtVjRNekxWTEl3ZjAyaDBxNkJL?=
 =?utf-8?B?ZjFYVk9QQ3ZHN05BbWV5bFRiUTZDYUhkNUJTMys1ZEc3WXc2dVZxYmZuWS9B?=
 =?utf-8?B?QXJhZFlybVJXNmRPaXpEMzh3c1BTRkFhTHUrd0U4Z2lsbHh5K2U1eDdndWRZ?=
 =?utf-8?B?NFptOHB2Yml4RTFIN0xCcHl3cWVDZk1UVkRoM0xwSHRJb25nRFV5WG5zY3FP?=
 =?utf-8?B?c1VWTEh4L3VEd1B0a21BZFVldE9mOFNKaHZwczdJVUw0bGxSM3BPY2FXelRH?=
 =?utf-8?B?NFZKVmNJM3ZrYzR3WlF3NGFPVDVZRzlhSEpOSmxqT3Q3c0ZqUUlmRDRGQ0dt?=
 =?utf-8?B?NjB6Q2tENEdscU9CblFWZElhT2ZlQzJlNXdqNjBzNk1DSUswQ0ViV0dkYUdr?=
 =?utf-8?B?US9EdGZLeHE3UFVpdUphYnI0aFpDY2lpK29RTGJiN2hpYW42RXl0MzFDUTc2?=
 =?utf-8?B?VnpXQTkrc3p0aGdUT2FmS1hkdms5WndjdDVKTE8xQlg1RjFmYVN1TURKR1RH?=
 =?utf-8?B?bmQ2SW1hL0Y1bXJqdmwzbXp4RFZFSW5LN0YwMmdMdmwxWVcxWTE2R3FXckpZ?=
 =?utf-8?B?Z1I4MDgxRWtXWm5ybXNMcys5SGhrQ083Y25nWGxpOUtmbitQR3JpSks0YlB2?=
 =?utf-8?B?MTJ2Rzc4M3RXY1FGdGxlWFo0S0c2cDh1UEpUeFIzdFNnU0lMNWdNRTl2YXMv?=
 =?utf-8?B?eGJnY2tUb3BDZC94VVRtakE2bzMzOWJyQTB0NHZMckVhdE50eWsrZ3JNdTFQ?=
 =?utf-8?B?azFJNmtyRGRQT1lJeDA3UzcrdXdzd2tkdi9rQ29ZaXR2dTJ1VnNoVVB6Rmda?=
 =?utf-8?B?MkduZkxLWURXQy9RTlUyUVpwYnpxYlNtWTUzalRDMU5RVHZRa0NKczhCWWJT?=
 =?utf-8?B?eENwcjRrSnU5OER2VWc1VmdERms4L3pSaFJyaFZaYmRacDZRRjFmeFVPaEdv?=
 =?utf-8?B?OEF6ZExRWUVKaWtnNytnOGx1Ti9Bd0pvN2w1bUNpV0haeEpDQ08yTEc0SVFL?=
 =?utf-8?B?ekRma2tFUGlTUnZoNjhkUU9LczRtWmovako0TWxWNzlrZStTa2VOYkVobmNl?=
 =?utf-8?B?ZmVQWStlRWdYZlhEMkwvV0U5WHgwYlR4RGVZNFFJUEFvWG1aQ2lwRi9kYi9B?=
 =?utf-8?B?eTZyemVpTFA0akJnRFRFRW9rL0lEQitpaW9JMXI4aDRYenV2bDVYMnBSOWtr?=
 =?utf-8?B?V2x6ZEwwQnlVeHVzSXdwSUZGYVRLa0tHTnFlcGRCTWdkb3BvUitjMGxuc0t4?=
 =?utf-8?B?bW9VRmpkV0JBZzdHWVlPV1pvc0pUWVlRWFEvK0RpdFViUlVxdzkzOXhGMi9a?=
 =?utf-8?B?QkpPeDlPTTJVSGtmMld3OHVwU1lBUkpTTFRsTzh3QWhDRW4vR0JBZFNXNDBJ?=
 =?utf-8?B?Ri9HWmh2Q0FyVy9yMk9aOCthVEo3WmlOTmJOK01qcHNZdXIwZ3Rnd0pRQWpS?=
 =?utf-8?B?MmNGQnRsZTlaMjBFTC9aNm9ZNEMzS29nd2djUVAvOXZUWGk0QThHVUNzcG5Y?=
 =?utf-8?B?bXg2bElqd3dUajJqemFzZWF5QWFGVjRCcCsyRmxEaCtIQjhZYUVRRStHeWFu?=
 =?utf-8?B?NldZRlliL3hJYVhQVFNKMWdYVnNNVHdsMlVSSjVoNlRxSGZnVEk4R1dXTUR2?=
 =?utf-8?B?cWtOQ3ZMRms0ZEYxdzVobDdkRDVTbVM0djZZQUxQakZ4Q05DNEYxTHNVOHVV?=
 =?utf-8?B?SkJEbTdrM01OcFhNZmJvRWZJbG80ZjJLZk13VWZxQ0lPdjlQR1pBNnNjYW1k?=
 =?utf-8?Q?KSfi7Ys11Gp5lhs8GjHJDLH4bmXi6yf1laHbtplhFiwi?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33568b46-c74f-45c9-c41c-08ddc5cc809a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 07:27:07.9091 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IjqOxlBDi34SMFH7KmXvU01LT7uDKXCvw+/eybyHTJXaK2kNxGX6fTMJntjgpTWmtG5lsJSb22JjNKhNz6WArQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4427
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

These methods should always be inlined, so use the strongest compiler
hint that exists to maximize the chance they will indeed be.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/regs/macros.rs | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index bfa0220050d4ba03c9fcd75c9be1ed8dbaa4f290..a9f754056c3521b2a288f34bf3d78ec56db53451 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -280,7 +280,7 @@ impl $name {
         #[doc="Returns the value of this field:"]
         #[doc=$comment]
         )?
-        #[inline]
+        #[inline(always)]
         pub(crate) fn $field(self) -> $res_type {
             ::kernel::macros::paste!(
             const MASK: u32 = $name::[<$field:upper _MASK>];
@@ -296,7 +296,7 @@ pub(crate) fn $field(self) -> $res_type {
         #[doc="Sets the value of this field:"]
         #[doc=$comment]
         )?
-        #[inline]
+        #[inline(always)]
         pub(crate) fn [<set_ $field>](mut self, value: $to_type) -> Self {
             const MASK: u32 = $name::[<$field:upper _MASK>];
             const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
@@ -348,7 +348,7 @@ impl $name {
             pub(crate) const OFFSET: usize = $offset;
 
             /// Read the register from its address in `io`.
-            #[inline]
+            #[inline(always)]
             pub(crate) fn read<const SIZE: usize, T>(io: &T) -> Self where
                 T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
             {
@@ -356,7 +356,7 @@ pub(crate) fn read<const SIZE: usize, T>(io: &T) -> Self where
             }
 
             /// Write the value contained in `self` to the register address in `io`.
-            #[inline]
+            #[inline(always)]
             pub(crate) fn write<const SIZE: usize, T>(self, io: &T) where
                 T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
             {
@@ -365,7 +365,7 @@ pub(crate) fn write<const SIZE: usize, T>(self, io: &T) where
 
             /// Read the register from its address in `io` and run `f` on its value to obtain a new
             /// value to write back.
-            #[inline]
+            #[inline(always)]
             pub(crate) fn alter<const SIZE: usize, T, F>(
                 io: &T,
                 f: F,
@@ -385,7 +385,7 @@ pub(crate) fn alter<const SIZE: usize, T, F>(
         impl $name {
             pub(crate) const OFFSET: usize = $offset;
 
-            #[inline]
+            #[inline(always)]
             pub(crate) fn read<const SIZE: usize, T>(
                 io: &T,
                 base: usize,
@@ -395,7 +395,7 @@ pub(crate) fn read<const SIZE: usize, T>(
                 Self(io.read32(base + $offset))
             }
 
-            #[inline]
+            #[inline(always)]
             pub(crate) fn write<const SIZE: usize, T>(
                 self,
                 io: &T,
@@ -406,7 +406,7 @@ pub(crate) fn write<const SIZE: usize, T>(
                 io.write32(self.0, base + $offset)
             }
 
-            #[inline]
+            #[inline(always)]
             pub(crate) fn alter<const SIZE: usize, T, F>(
                 io: &T,
                 base: usize,

-- 
2.50.1

