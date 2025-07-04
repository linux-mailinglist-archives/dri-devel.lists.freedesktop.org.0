Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7654FAF8940
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 09:25:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7EAC10E948;
	Fri,  4 Jul 2025 07:25:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="bXDNnTLR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2057.outbound.protection.outlook.com [40.107.93.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73AEC10E944;
 Fri,  4 Jul 2025 07:25:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jbhhVkrMfFR7Qv4RgVK2y/YIvDzuoNF0GBIEeBAHqSyBTrqV7HdunIy5s3AynB3aCWPSDOrySW9uU+MtYJCsw1DJh2YAWLqsfELFrwkv7bmmKVnXvpVszv8bndAKW3oc02GUxF37uQddTnDxw9gUvv8PrToOsg73KwCYyyqK6Ks1xcSWQtmzudm/ssG+7faHyCmxktOJ3ZnKTCXw7OnY8+YCauJr0W6ewirGh1vq7S8lrkkFXXKoUguszjcu65/H+/Cw7vstjpya2Tl5pUdGhbeRReq4joZvypnnPu1DJCMNXDSPFRXc+yfEFftSx3Jv2U875X9gau1yDrIK5sZseQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eoG6FV/X5R6wVxlgqjGI+0c/sYuYEi8MIaEZ3FPP+TM=;
 b=wuAxyp/nVyNTbyFOF9VlvT5zVfWFuJaEXu2t04oLq1gwr0wNFG263YNtZ15zhpbcfUheOh5gLKjULZS4ECNTf9+HQWSg7/zvlgOA+SOPDjY4GgxB9UxxaM4uCLlo5+DoKgmCBUkNnnLKzmPS9q7KQMgddv4rQOhG+NRRjJzXFbjwrVRNHircqbyWHuP43ceexOe4TMruWWpFEclJICNloogROx9l/NA1LHALMa2GDRLKPhdjSP8wyU+i27gM8WQnssT3hgHucasJZ5V8ar9KnZle7x2QdG+WmiFUUH+i+N4pFonmnUTxRMyubAjaU1Q4Gflfmv2ZyeU0YobF0E51kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eoG6FV/X5R6wVxlgqjGI+0c/sYuYEi8MIaEZ3FPP+TM=;
 b=bXDNnTLRqBU7sgAeUWXSyAhjKfgobmFLT4KLyHSKEUesHZLyLjhRCUzLnZqOMN6+jCjhTSLsT8ipvpOYMMWe7vHxuxbu6QicsFI/V3uu+xRp9wSjF/vW7iCEeYqhUkf3gfHwqfA5mQUK6Gb+gAlkaV459MiRD5ycd5jr5uJYb47Mo5Oh3H1xB8tkUl9rhTu46XNWUe00KYWLUDdz6ZPkRZCJRw5TQRKkiLsp+n29vAhy3GC6zYKiXxdmAMElshYQeykkDKuvs8nH5zFcx0HD2HJw/QB97uITHeiwmSefPJ61jwWHWlfOiY5PI2L8qepBUchbVik7UN0OK7plos/0ig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN0PR12MB6341.namprd12.prod.outlook.com (2603:10b6:208:3c2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Fri, 4 Jul
 2025 07:25:29 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8901.018; Fri, 4 Jul 2025
 07:25:29 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 04 Jul 2025 16:25:03 +0900
Subject: [PATCH 02/18] gpu: nova-core: register: fix typo
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-nova-regs-v1-2-f88d028781a4@nvidia.com>
References: <20250704-nova-regs-v1-0-f88d028781a4@nvidia.com>
In-Reply-To: <20250704-nova-regs-v1-0-f88d028781a4@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, 
 Beata Michalska <beata.michalska@arm.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYAPR01CA0053.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN0PR12MB6341:EE_
X-MS-Office365-Filtering-Correlation-Id: afa0851e-4d62-4c50-5747-08ddbacbf447
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SW4wQzNoSHpqekJIRjE3aHM3YXl4TVlRcE1UY1RFaWxCSkdQaWtETCtJaHVj?=
 =?utf-8?B?bzdScjYraTVlMjJadTdUYW5ORk1Ub1RYQjQvV3NaVHZFdGdhR21jalc5UlAw?=
 =?utf-8?B?c2w1R2pWNTUxQi9zWGgrSmpSc3hoczk4NkVIM3RWSVZ4cWNKdTBEcTZjZXhW?=
 =?utf-8?B?YmROQnhKT2UvcEVEQkVBV3NRczlHSzhWcmhFY09JU3R3Qm1WRmdlaXE5NkRU?=
 =?utf-8?B?eGh4Y1R6VUt5cmdFRG82NlVtbXBVRGNxc0s3WE55VWVnYm03azh5aVlVQmNw?=
 =?utf-8?B?VlphejlWUE94NUs5SGdrL1lhNStqM3pVRjJ6KzE1ZkZscm9hMURzS093SXFo?=
 =?utf-8?B?bUtBMGZNWk9FaUZGVDIzbHd3cFVtNkl5NlEzeUhuZHdHVG1DMEZvVXFCUm5S?=
 =?utf-8?B?UklheTRmenBPN3loVUs0ZWpORGtYSVI1WGxHOU95VUcwcWNWVUVxTVZhZGZa?=
 =?utf-8?B?NDRPRWp5WlFuUFFidGRHYmJUWmpxMS9hOVVuVFJkUGZGTEVPNUtDZTlIcEMr?=
 =?utf-8?B?MS9uTHZpZEU5U1BLaWhTNnRsNG5uR2QrVHJEK01VU3RkM2FXRmNMQkZRRy9D?=
 =?utf-8?B?QmVncEt5VWpTSGNoZW1wdkx3NGlyY0FiYjdpNW1OdWNGRzNGT2FJZFhtT0Nu?=
 =?utf-8?B?Vk01b2dyLzVvK25vY3BsZmRSNFVnQ1ZqWTJqTUlQL3h5YmJsYVQwRWVsc2d0?=
 =?utf-8?B?SlpWa3g1bUswVk01ZWFPYTdKYkRLcjBwUjg3SXkvSVVacjlVQXNuL3g0V2U4?=
 =?utf-8?B?RSszb1NSNmRpUnNYaFQwNldkY0tKdDRCSllxc3dJU055Qy9hZ1l6ZXRqMnZ6?=
 =?utf-8?B?enhQZ1FJQy9pb1RxRFZXTEJ5bVpidVRUZUNOUzA5UW9wZXdxVnRhRWpobzg1?=
 =?utf-8?B?N3FBNmRLZ2Q2eE42SXVwcVlraEszRElRaThkd1NYQTd0S3BiU3o0QWh1ejNT?=
 =?utf-8?B?VGFtQkdRT1lpZU9RZ3VRQmRwR1ZyNUoyZzdHUUhjZHAwR0kwc3FqS1pSZHRO?=
 =?utf-8?B?QWF2ZGFJeFhWd3AvL0FaUWJzVWJDRVA2MzB0VlFxU1duUG9Kd3FsQ0JlNlcw?=
 =?utf-8?B?L3hMVWJwUDVEbkMxR3VoRDZjV1doU2hVUXp2YjJUaXRwQm54ZkEzUTRQOHZp?=
 =?utf-8?B?VXVCTVRtQW5jMlZib01iTUpranR5Q3Frc2QxS29JZzZMd09DVlhFRy9lZ2dl?=
 =?utf-8?B?cStIcUtXaFhIYmF5Vm5qTkIrdFF0aVoydlJjZ1dYd3AzQ3NVSjZiTTM3bXl6?=
 =?utf-8?B?TW5GdEs1emlqYkNLcFNJZkRxZHR1Zm9uNS85UHRBcE8rbWNXVlpIaTY5TW55?=
 =?utf-8?B?YWFVWjdRcXpaV1crQzJQU2hkVnBJbGEzc1B4VTl5VlQxN3RVT0FabGVmbHl3?=
 =?utf-8?B?OEFFK3JxVGtVUXZsenB4YjRhenlIZ2ZkWnN1VGpCMkVuUzIzdlFpaXFVRW9T?=
 =?utf-8?B?OTd4bEw5ZDAwZHBKUzRYNWRKYnNhYUpzb1M4WXNBQmVudlJxeHdjcEFocm9q?=
 =?utf-8?B?eHNIYzJpS2ovZ1pjVTMxNE5jZzl3eS8wTmpxNFdUUnNyTGlSUnZFRGNIL2I0?=
 =?utf-8?B?R29OamR5REFabjJRMWZzTzFWRndLQXhLVEhRNDNiOGdvSmdtaS9qSGV3NFpC?=
 =?utf-8?B?ckZLSlVwM2VzV05QVnZtZE1JVUYzUDIzTlZFOFlMY2hFalY0MlJPaEw2Q2dX?=
 =?utf-8?B?czd0K3RlaEhjMjVaMGVyYjEvRjdzTTlzTnVVbTQ3ZDE3TTMxMVNtVGt0cWUy?=
 =?utf-8?B?bGM0VDdjalBEVGI3NkNOTEs4eW1WR3NkR05mTG0zUlR4YTU0dkt1eXlOdGFi?=
 =?utf-8?B?VG5Jd3NVbE0yL0pvMjZnd1AyQnhBUXpmcnBrNjdYTTc0ZTlHcVF5aWJXdEtu?=
 =?utf-8?B?RkNtQWNBcGdTSXNpajBYcURoVDQwTy9abC9JWHFrOVExN1VxY0QvNVpMdytu?=
 =?utf-8?Q?sF6F7ODM/9I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YksyZHprd200S1lNSVJSeVJMUVlFelRRMlY1cGxSQWJHenRaUmhHWmhCVDla?=
 =?utf-8?B?TVlYT2EyL015YjJWR3V3bXgvSEhpWjZOdEIwcGVPU3plWTRFYVVTTGoxbVMw?=
 =?utf-8?B?RG5BOUNhdW9VWmpLME0xMHNLM3hXa25mdVNPT3NEYTMwMDhSVHJJd2ZFTUFt?=
 =?utf-8?B?ZUdmOThnNVpZdUI5TnQrbXNWUktycTV2Q1F5Z3h2REZRVkFDMzhETk4wUm1C?=
 =?utf-8?B?MGM0cG5kb0ova2hXalFIQmUwTjF1Znd2VXRUazNjc3V6YlZ3WVpUOXJ2OExk?=
 =?utf-8?B?dDBwRlA1OHVPTUg1eHlMNXZQZlR0RGt1bVBDZkNRL0RCTHVhRFRURGNuTTRl?=
 =?utf-8?B?TTVaczE1Y2dFM2Z2WHMxM09qcEN0VC9PbEt1QzhKQUY1RnZSWmpaQzF6MmF4?=
 =?utf-8?B?bmNmeWRheGp3VndzZktpRUZvZi95STNGVjF5VzRpbFZFbldxSHVaaXRWZWVt?=
 =?utf-8?B?SjFZS25VcjJGc2NhY1lSTDdSSGhCODJvT1A4WUZHSXVtTDBEbTQ1OXhGdmJq?=
 =?utf-8?B?ZWgxOFN3VEtKY1BTakZmbWhkUkpUVGNEdTladHowcWFUTmNDVVdmVGVvdmlj?=
 =?utf-8?B?ekdBdDhNZVQ4MjdEeCtXVVNjVVVEVFEwU1BZVkFoSGk3NTZsVnd6WklTeWRl?=
 =?utf-8?B?VHFVQzRNd0ZjZHpVdHY4c21XWThCbWFPaG83R2h3TEhOa29NYSszRU5KeEJl?=
 =?utf-8?B?UnhwV0tPYWFGWnFDcFBMc2FyMXhyLzd1dGFpdDJMa200Wmw0ZUNuR2REOXhu?=
 =?utf-8?B?Zk1YUGlFaG42QXBhTkdoa21FZStzMHR1VXlJbmtTcFlkdzlnZXhIV1A2amVM?=
 =?utf-8?B?QzlMeGpnOWhlb05NcEkwSHRBYnB1MTFhVElMb2E0N2pSTVpZZ0thQzZCWGI4?=
 =?utf-8?B?TkNsaU8yOGxOcUxSOVlOOXBrdDVXVlR3b25HN05sYWg4STRkK2owUG5ITXlK?=
 =?utf-8?B?TlJ2OGJvZ09lNGNOc1k4U3NIaEJFVGR3eVZqdnIzRFl0YUxGeHlQRE5qd2dy?=
 =?utf-8?B?MzJJeU9EcTFRRVRRR3dJMkVTdklHaXY2Z01hVmJ3VjRRRVU0bUw3S1c0L2Nk?=
 =?utf-8?B?STIwSlF6dk1lWksxRHNIUWxyRDZMSVBVNVppSjRGcEpkQUdUL0hkTG1rcmsx?=
 =?utf-8?B?dDBYbGgwbTJSWjJJNXF5UTFCbG5MYks1VjdzeXdXbThHN2hhL1pTbEdxdUVL?=
 =?utf-8?B?NlNTY2VybWNkaFVUZFJUQ3crUkduMGpOWS9nYzFnVFlaN3NuVjJvSEw5bjYw?=
 =?utf-8?B?aklNOExWaXVKY2pNN3dCSi9tSnJvUmlVbkdxSmExK1N2M0YxSzY2L2lhSVl5?=
 =?utf-8?B?dEhtTkFNeWNKZGZMTU1kbnZmTjM2MExzVGdRVDBULzJ4MjV0UkJFME1RVzhO?=
 =?utf-8?B?ZEJIS3NWenpZa3VsWS9ZdkRZWG12ZVA3cDYvL1U1cktzb3c3NWtXY29saExT?=
 =?utf-8?B?SUlzZ2JCM1JVd09JeUdOMlRFbkE1bkZvM2JvZlFtSUFoRU1adm02R0dqMzNn?=
 =?utf-8?B?Vzl5SzdIMVBrT1VmYk1MQys5aithL05zR1R0TUNIa3hYOTBqQ1FORU4rQ0pQ?=
 =?utf-8?B?cWZYK0ExZENEbllUSE5zZWw1bFp6SklwcUE2bG1Jc0R2ME1UUVNLYUo2c240?=
 =?utf-8?B?NER5bWVBUTZaVVNUMVBjU3JrTDUyN0VUUkdORmlNUjJMR05ydEVaMk54UHhZ?=
 =?utf-8?B?S0NRdXBPQmJDTDk3R2I1NUFiTWQyNmR1SlI1WTUxTWpDZ1RsQzY5ZkdUN090?=
 =?utf-8?B?SXJmM2pCK0pqZFdPcloydzV2UDZ3U3pnTkJxNzNMYVRSRlFKWUFDRjZVekdW?=
 =?utf-8?B?YjlIaWpqR3J4THJvTDEzV3paWUhZdWJ3SWhRb0dxM3dtMm5OR0d5Z05ibkRH?=
 =?utf-8?B?U21tVm1YSmtXckJha3g3bnF6Nzh4ZG9GWFZjZ0s4dGY1VVhMR096UW1FQTg4?=
 =?utf-8?B?di9oaXh5b0sxck5VcFFFbHV5MnAvMGFDVGlVUzExcFhUZkUyNXh4QWQ4cDd5?=
 =?utf-8?B?SjFzb1FsOWFpMXZTODZTckFBZ0FyUEhGNEEvMkhOTWhWVEtWVjRaTTZUSStl?=
 =?utf-8?B?STVWN0k3NjdlK2ZLNkpRV2RpZGhnN2p6Lzg0N25ZNXBlNUpYbTZ4aGtBaWRH?=
 =?utf-8?B?bTRpb1luM2t4YjA5dCtZZ0FVUWMybnJvNUphTHpZRXlhSmNQd2lSaWFJcGhn?=
 =?utf-8?Q?244tqX25PfI3mhKXH+o9rUm7ecaxH/l6hEcNhThrVujy?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afa0851e-4d62-4c50-5747-08ddbacbf447
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 07:25:29.7134 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lQLHuEvriHU7ToCFdNHE6dR4Inq8ctTqUokAeaIWW87iaPIjZggOjxxGaWoGpXU+nwj1FKV8YAiQLRRPsQ52lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6341
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

A space was missing between arguments in this invocation.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/regs/macros.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index 864d1e83bed2979f5661e038f4c9fd87d33f69a7..93e9055d5ebd5f78ea534aafd44d884da0fce345 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -116,7 +116,7 @@ macro_rules! register {
     ) => {
         register!(@common $name @ $offset $(, $comment)?);
         register!(@field_accessors $name { $($fields)* });
-        register!(@io$name @ + $offset);
+        register!(@io $name @ + $offset);
     };
 
     // Creates a alias register of relative offset register `alias` with its own fields.

-- 
2.50.0

