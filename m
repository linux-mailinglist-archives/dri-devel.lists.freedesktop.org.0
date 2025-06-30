Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 121BEAEDB1C
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 13:33:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A787210E414;
	Mon, 30 Jun 2025 11:33:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PZA1CiYn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2059.outbound.protection.outlook.com [40.107.96.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A02010E413;
 Mon, 30 Jun 2025 11:33:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pCx8DfbQ23EcJr09Yf5fbPJCWRWZ+zXqyw/eD099yjPAgr9RT3h0EQ+scC5y0Y1NDsyaT718vKTrCqkwafBH/GBUNF9eysF/CjF0QxFB6AG5xzXvpnN4/inve2L/HBxmhfR7HoqG4sxyJE4ZqvcpQb74YwVlfKVk+hEat3ieB2H+/wevwhsyoe0AAC1yVv2GmkUQU3CiMAr/mlP3lUzK5ZHVWmhJjX7+YTPACUzG68VxcFrlapUl5POeNbqVpTCeMG4mDx2tC4Bq+wbQo7z2faWx613c1Rzqks8w4nRXDXNlBX4zp6060yKiXhP1UXErvp4NjDAqH0f80FEurhhdEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZllMjbvY9sRwfFsDbvqygNGTMGo4d0LU4J520YRfgT4=;
 b=HRozm+HbPKWmXLlzI1rgs/nBhW7FgFp1oQZh58JIGHs54fpjNBGcTX9osJvzOaLLcxhkUELE8VGOTvgRjEDi5Nxy7A6LsH5Nc6M9QdnaxOhtDE3bauFnHqN5k7ie+WPC+7aD7mky6cVnsWQmu4iLpgGUQfvg74vCmW1Z84R0A0HHvsq9k+CQxl5UdBb6yrfytraUVvH0r0VneYYRjD+aRpRq8uqpRLeoD5EHPKqhY9mz2333DO53ZAuVw2QQdAId8tUCrcGP6HSWs+XifFwIXOTI60NGq0QDdgwULld8PxZyS9Gjo2fIVAUtDrXy9FHsqpnwu7WOLDJvO3RuP0XR5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZllMjbvY9sRwfFsDbvqygNGTMGo4d0LU4J520YRfgT4=;
 b=PZA1CiYnwSqUMwPZPd289zdpy9Hc6onu0eOVrjlM04yXcknaDNkE/oIalE3Cbt9UuQ+0d2GBDDralfeedXtKCOYkd9EPyEeJqc99/6LfDQTyxKi64j7c2xPJAjcya+t5ssybIwtgcfk3zCVCOjIzqZLysEnVn1ov1B9hlU5UjYWFTpiD4R8gO/mYgC93RS3n8qRexMuGs7xTaeZnPWVUTGS+8kX8sZTc5+rlOxOJRjgGlL6al1us5Mnk1C/64d4HOJov5qVZTJs5abqmU/dCEbDpAXvTFPSQYuPk8GaqHXx1mZgjFYKFHAkaXxvRAtSufmU0dEgVK1OMgBalsY1WRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ0PR12MB5634.namprd12.prod.outlook.com (2603:10b6:a03:429::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Mon, 30 Jun
 2025 11:33:24 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8880.021; Mon, 30 Jun 2025
 11:33:24 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 30 Jun 2025 20:33:20 +0900
Message-Id: <DAZU2ZTI8Q5D.2LA67A3B2PHNT@nvidia.com>
Cc: <linux-kernel@vger.kernel.org>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, "John Hubbard" <jhubbard@nvidia.com>,
 "Shirish Baskaran" <sbaskaran@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Ben Skeggs"
 <bskeggs@nvidia.com>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 0/7] Documentation for nova-core
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, "Joel Fernandes"
 <joelagnelf@nvidia.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250503040802.1411285-1-joelagnelf@nvidia.com>
 <36b59175-87ef-459b-9b9d-f7de716f0be5@kernel.org>
In-Reply-To: <36b59175-87ef-459b-9b9d-f7de716f0be5@kernel.org>
X-ClientProxiedBy: TY2PR06CA0047.apcprd06.prod.outlook.com
 (2603:1096:404:2e::35) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ0PR12MB5634:EE_
X-MS-Office365-Filtering-Correlation-Id: 9906c596-f8d8-4853-4c0b-08ddb7c9eca8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?anJVSjFzVzBSakQyVVVSbXJjYSs5VHhHcElNM1YxdHp2OW5Cb21GQTRLNUJu?=
 =?utf-8?B?MnpKZ0k4Ris2b3FJbExZUVhpOEZlK1gvZ0JJWkw2dzZHU0ZLOHg4T0U5djR4?=
 =?utf-8?B?OFJja3QyMm0yU1p4emw2Ym9NeWk5Q3BJbm5CdWJNVTRub3ExSmpJbm9Paito?=
 =?utf-8?B?b1ZrQ0Rid3kxWDVOR0hjV2U4SXZrd1VEbWorZGlyUXU1OVZvNnptSVo5SlM5?=
 =?utf-8?B?V2tXU2JqK25jVWY0YkdadnVBYlJzakpDcWxqZjhpOVpwSWlwbkdid3o5VFBr?=
 =?utf-8?B?dDZMRDRwUDlyVzl5UWtJTnlaUitlbktickJEQmxLOFdyeHJoQXNCa3kxNFlF?=
 =?utf-8?B?L1prc0I2RzZoZkE5cWZGZkJmNlVTU2V4bTYxMXZVU1FTVS9GWS9GUkwrL29p?=
 =?utf-8?B?cHluUytWSGtFWE1ERWlZcGZERXI3YW9tS1NkYVBZaVVVNHJtUnJqR2gwMnBn?=
 =?utf-8?B?YmdjT2dsRUIwSUl3MFN5aVJmU1lUTnFOWlQ0LytjMHRyLzJlYTJUeklmL1VO?=
 =?utf-8?B?WlB1S3R1SW5WUWtkdmE2bTBTV29HdzBRaDBBQldORk9paTZmU0p0a0NzekdR?=
 =?utf-8?B?M3NRWlEyOGRvT051eUNmOFJ2M1JDNG5NQ1BFUDI1Vk1NL2s2NnJsdWR2dmJv?=
 =?utf-8?B?SG1JUW91Y0VtS0NNZkhEVnVwN0JYeVFGYjdzdHRwb2o1cTFsWHlpMUJucWFp?=
 =?utf-8?B?TjZXT2NLZE9JMUFadUxQUGtOUndiQWx3RTIrT0xvZlg0Y01LN3dNUXZOZWR2?=
 =?utf-8?B?Wi9MeGpZTXo1Yi9DVFVHdmZjOXUxbDEyS2s5aFlaQlg1UG55UzBDb0Z6Rk5p?=
 =?utf-8?B?RjFFWERVVjhXYzZKM2ZBZ3hkaDVmNVpmeWhjcFcrb1dXc3NZemtYYlhCMmhk?=
 =?utf-8?B?VURTNUN2Z1BwSHhKTkJ3cmRXL2ZjczNzTkRrblpkMkNDQmJHUzRPdGdVQ2Q4?=
 =?utf-8?B?bENLSEtrY3JpODF5TXhHOHB5cFhxNFFJc3hhUnJCd0xtdUVSa3BITTdtQUJZ?=
 =?utf-8?B?ZWZqVFpPdmNFbkc0TUk5THVDOWdqajFja29PTXlLVkd0MzVocS9VQlVCaDVl?=
 =?utf-8?B?NjJ2dkJ4WU5uT3FtV2lDemVYR01JeUFMQVNkVG9qajRaWUxDYnM3YUk4QkZi?=
 =?utf-8?B?Q2pGa3BXVng5UFNTQnF5ak1nSVN1czRFa1N6dGZKNEJockhkWktNTTdIVldZ?=
 =?utf-8?B?SlVsTGZERmtBQWF1bU16ZDVFMFY2aU1ySlhqOTFnTVYySEhKRXdRK2FqNWR1?=
 =?utf-8?B?SzdjNHhYZEZaQkE5aFZ2aUVVeDR5MW5MM0loVnpnZkpaSWZuanVhNVd6a0Vz?=
 =?utf-8?B?VUg3LzlseVBsWERlR0d2d0V4V0l4VTJsSWxEcjFHMFVnaHAzN2FhOFhhUDhs?=
 =?utf-8?B?aVZndFpOd0grNWE3WHJGSUM1SkdKRUdSU2Vaa21BeTJBOUNsSGZiOWM5TTlI?=
 =?utf-8?B?NlRyL0hxVWlveUFQNlZnMm9SRTFEclJkM0t6bytwR0Uya21OWWVZL1lqYzNG?=
 =?utf-8?B?TlMwYi9QOG81QUU5M1FVOVJDbHlZZEZLbzYzcGVLOGxtdmpuK0NOR1FkLzZq?=
 =?utf-8?B?V2I0MUhyaFNqRXNxbWg2Um9VdUhJdWZUNGFOUUY3dUQ4WVhRUzRoRlVKYldM?=
 =?utf-8?B?b2JURnNlL1UzOE5RWFE5dXNJdVdhKy9yVGs0OUJJUDFtc210YVNPdWk5MjEx?=
 =?utf-8?B?Smg0T2I3aExtZUYwVitDWDJVak9BLzNIZk9OK2duaGRxS3l5RDkwS2lnTkdV?=
 =?utf-8?B?NHlLTFlxbmlvVWZGaXVuTUZJL1V5Ym9meHU4dUhNMkgyYVlIdC9OcUtlS3ZM?=
 =?utf-8?B?MzhtRCtQeHNnbUJpSk1ZS0gyYWc5YXJNQ1hUaGZpaHJhcytiam1lNUZ4bWNh?=
 =?utf-8?B?QzFFMFhVbUxSRVk3WTVPRHJxVFVmUjZyNDB0UE0xcThVOWc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFRVVjNyd0lCdkozbnhMWWFWN0ozSGZzdkZ6UXZxMVI2enh4N0Y1WE9MK21t?=
 =?utf-8?B?eThPVGp0Y29iVUFqem1SdEJsbjk5eTdENXl4TkJVY3Z3L0NodWZEYW1TSnlE?=
 =?utf-8?B?KzRlakNNYXNTWjZhazZSM0w1enhMNzBCTFF0TldHbmlrVUxDMDZqQTFZbGpE?=
 =?utf-8?B?dldwbWlsNjJyR3BzcTVPcVl0RWVnYTMxemw3dUF2Mk5lbDVSRElpRDVIczdN?=
 =?utf-8?B?TUk1dGZRYnZyeWhrdEJLUVBMQlpUcDY4ZGlQKy9DaFdwa2JUbDVabm5sY2Iv?=
 =?utf-8?B?NnBiUnJiQjAwekR0Tnd5bW45Lyttb0JEZ0tpV05nRFJZaVl0c2p4V05NVEw0?=
 =?utf-8?B?a3RqMjVqNnZQYlFPZ3dnQVZ4OXNjSU9DT21zaGtkTm5CR1pTUkl2L3lIUEpU?=
 =?utf-8?B?SmttWVpMRTN1TUJUUVhqRldHUjRncEdQcHZBYkxqVjFpcFkxUWd2OCtlYVpS?=
 =?utf-8?B?KzhQSUZlZG5za2szUXk2ekovSU11SFB2SmwwNGg5MGgyTFR5N0QvU0gzV3BP?=
 =?utf-8?B?YVpSRzl3VXpFWE5XSEQrc1NCQTJDNE9OdUp5NVNvUTdVTXVMOUc0c1IzWHpm?=
 =?utf-8?B?UGRNN0ZkdFl5RUNzUVloU0FzN0FiQU9LS2psVHJsUDBGcGtQTEdQRHdOblFs?=
 =?utf-8?B?YzYzUS9KYzEvWk5mcjNsS1JqcWV4NHMrME1kSmhzSEpmRWRscFpybmlIcVpl?=
 =?utf-8?B?RzJ1SkxoUWFpTGVIYXRORXJXL2doS2RrV2paYXpPKytkU3BYRWJWSXdibGR3?=
 =?utf-8?B?UGRXYXZId1VMazQxRGY3UmVoZHdjTXRWc3pmczJSTGdsajFuYW1mSFZyVXBs?=
 =?utf-8?B?K2VaK0tUSU5tbWQ1Ly90dHRJYkd6TFBBZ096N3htV0VFcFgzLzVxRzc0T2VR?=
 =?utf-8?B?bStydDNYNEMvWVFSeVNPQ1lybEVkbXlheHZGbDJqZkJ2RUZYK3hPZkl2Y2hu?=
 =?utf-8?B?SS9zdnlaVXZLMEtxS2JLd0FkK2lCaGl1bFNnTHNieHJya0FKM3d0QURtU1pY?=
 =?utf-8?B?OHFYUUpyajZEMHNpLzY0VWxObkNvOXd4V1VMQ0JYT2Z5SitkdUFpYTJPNzZm?=
 =?utf-8?B?QzdtZ3ZsZGF3WGJ5RXAvMStZZHZVNURsRWFxTHRMWEVmbTVUcG5HZGNPWlIv?=
 =?utf-8?B?UDFXYWo2ZERUYXpLa2NkWHVoZmJVczJ1OHh1bEV1RVkrWUNoL1E4ZTNtM1Ns?=
 =?utf-8?B?WENTM3lHSGhYeGxtRWc4ejlWaDNFblVXczdGdjcyUWxxU2Z0VXU5Z3Q5Q1E4?=
 =?utf-8?B?MnVTOExxRjQ2bWtFY2pHclBWQWFDWExiNnpkL3E1UFRHVmMvLzBZbWxmYUk0?=
 =?utf-8?B?UllJWk1yQnkrYk5XeDZFQVduQ0o0UG5sMUtENUZMbjNEMVY1MHdzeU1TQXVs?=
 =?utf-8?B?Wk8vLzhYMk1hTGZYbEZKVHUyNSt1WnI1TkRPdElTdXFzVVh5UDI0alowTytz?=
 =?utf-8?B?NVdDVC85M2VvWGxYM0tqcFdSaVlkZUFYZ0VVem80TlJGMWVEUjlVMFU2cExB?=
 =?utf-8?B?ZGhsRHFqWEVKYnY4Y29ZUmd3MXE4R0svMnVnMWRERGxpTTVHanVVeUU3OERU?=
 =?utf-8?B?M1F2K29wNHBIVEZYbGdiaWs5Ny9YeHZkaGxUYXEwaUovaVhwSWpkL29UNENz?=
 =?utf-8?B?bGdwdkZpQzk5S0NiaTJkUkFQTm9GQXV4aFdGVEtGbUMzTTJPZ3ZmR1lBUlZT?=
 =?utf-8?B?THR6cnkvcDRrcEsza2VqVFZLL3BXRnhaSTAvczdsczdDZ2JaV1JMM3FFNE5s?=
 =?utf-8?B?c0IrcDBrdlRTSTdYVnVVNDNONWlOZlBRQ1AvcXh3dmQ3c2psb1dPcno3VUNn?=
 =?utf-8?B?VkVsVWpEZmhsdHZPNkZoVHorZUZyRUl3ZkZIMlJaTWp1Y2s3RkJvU1M0UXRY?=
 =?utf-8?B?TGVZeE1neWF0NEtjMmpxTnFZRWN0RlU3K2tsc3Q2ZmtNY0NVZXZMRlhKVXlw?=
 =?utf-8?B?alZWaG93T1oyblJPcXV6cyswbmpibDllZUx0Zk1QYys2R1Fnc0ZLQkNtbWdt?=
 =?utf-8?B?RXh6VU1RUmxFWnN1eGxHY1FFMk1TYVp2Qjk1cGhkWjBleVJ5M1R2Vm9VVTZv?=
 =?utf-8?B?SWNyQjUvWWlhU3h3Y3JxTnpDUHdWYmVPNmN5cFJUSFJXbEYvQi8xeWJlRmVz?=
 =?utf-8?B?elB0RmRPSTkzSEp5SXRaZm9meHk1ZTZrRlFYelhwU2g2b25RTUxnWlFMOFI4?=
 =?utf-8?Q?I69/4YXNliqz8JNsY6K6Zdua0O9otUb/k5aXD+Ri4W7e?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9906c596-f8d8-4853-4c0b-08ddb7c9eca8
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 11:33:24.5111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JEWaYXE/+e1MkBV4Ty8VFt5UMtr1Md6T7GCRbS8X37oQCo86/+Ra8wjYCAz2RC6FJBvhL/5dOoS9/VOiFuObZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5634
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

On Mon Jun 30, 2025 at 7:37 PM JST, Danilo Krummrich wrote:
> On 5/3/25 6:07 AM, Joel Fernandes wrote:
>> Hello,
>>=20
>> Please find attached initial documentation for nova-core mainly about th=
e vbios
>> and boot process. It helps build an understanding of the boot code. All =
the
>> information is derived from publicly available code and sources.
>
> Has there been a follow-up on the series? I think it'd be great to apply,=
 now
> that we landed the FWSEC-FRTS series.

We are precisely discussing this with Joel. :) Expect a follow-up soon.
