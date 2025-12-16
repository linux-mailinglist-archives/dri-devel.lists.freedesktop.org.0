Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE95FCC0E47
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 05:27:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30F4310E6BB;
	Tue, 16 Dec 2025 04:27:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FKB6JPh7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010007.outbound.protection.outlook.com
 [52.101.193.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C4C10E695;
 Tue, 16 Dec 2025 04:27:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wt9HTxWNiS10K4T3C23ULafmOM8FN0ECBhvQ/WyAkvcWMzoWxE5Uxla6/+xvX/IagzTJOIsO4pjyO1X8+jbaO7Y5amATgNWqnQ1H0h1NqKfzGrj8jx6dZXqwYctNTdweMcX3NS43EPg0lD4FYomJQZuvjY1LH6dfF5lpVyy8bOvI1fvH+4kRbuQ5FCDDo1NaELQ9Pf5E+SSm2nnnIc0BzaWBbT9YNvZZyST+RGeTDGUsNjR4XHA/U8qlseBpA+PI3htBPtb72XpXk1FbcDeQNWim0TeMT3ce4DMVlagZSDDXw+/LP79SpJZJ0D/5YAZJlNhyPLAWIcx9FtNuLmHQ8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gtwREWFtnUaWtfxP+f1uXK0T4RBnxMQvCEmt5X247bE=;
 b=LHx7Nl7dhaPJzIbSV/y3bUCSyQ3Y5X8EcuQJafaQOj3/eDluhQLz0CPOMI9yaqGQUPgyu3qBK9deTzwxG9/7cup8tTI0P/KILnBJpX8LUVdLs7AF0lH4aiYjNsW8ecN0ypzpS/BnqkttgTq9Bk1QZcUM0Ydujm1wId5jkopqnCK7ASTG90tpZSdxPYiQEhse9k5mL+pYzzT4iP/fAZ7Xb6TYXsY80cSY0/rg9OA6w+noiZaC0IUZU0/p9muLcDyeKkeaDeR1qdnf+Ls3cC1TZZtCpG/UMYzueyOPtkbCu3Y6c6vXVMToKM39bf5DhkMjtoR3f0fvcf56aCgzrnPmOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gtwREWFtnUaWtfxP+f1uXK0T4RBnxMQvCEmt5X247bE=;
 b=FKB6JPh7Da0sSDi6xlmVhE+4SbhkakacahKfvg+gPmCLJnMpSf+lUEByPTzuRdj8wbK6mZUsz6be9b7/MkxL/rVOL1SAer9uaU0kLLwPRoA9o5uZAbLMkOyedm1kAh4vqDhOwB/mpGBcjESg/uH1JheF2TlYnrpHFz2643XslzMcRvxUQ04wPEPwtaMJUNufcU3mCIRF4B18omHu3Et2alA3f6du8FRqKslr7Zj92QrzHoQl6JZG4XYSkASj/k3JVw3IeEc+Er1CqEOMU7rwwLqw4hUWh8/TxUn8dZBhPNLNCWOgZ+784OsSI+FCbkhkgO4W6cA3EZ5Unt0to85oBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8754.namprd12.prod.outlook.com (2603:10b6:610:170::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 04:27:54 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 04:27:54 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 16 Dec 2025 13:27:28 +0900
Subject: [PATCH v2 08/10] gpu: nova-core: use core library's CStr instead
 of kernel one
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-nova-misc-v2-8-dc7b42586c04@nvidia.com>
References: <20251216-nova-misc-v2-0-dc7b42586c04@nvidia.com>
In-Reply-To: <20251216-nova-misc-v2-0-dc7b42586c04@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>, Lyude Paul <lyude@redhat.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P301CA0023.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8754:EE_
X-MS-Office365-Filtering-Correlation-Id: c22e1764-1078-4ee2-4e3c-08de3c5b7b62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|10070799003|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QWU4Yi93c05MeFNlUFJRQTVBd01OaDQrZER5VVM5SC9ybjNWUkdQZEtwNTlB?=
 =?utf-8?B?VnJBNU5uQ3o1NmhtVjRhSGNjU1RXQVZGUk1pdjU4bHFYek9KNFVSS3I3RmZo?=
 =?utf-8?B?QVl4U0dVRDVDRklEOVJadmQ3Nzl6VDB1b1gzWlBFdmRIOERjL3NhVHJKcTZo?=
 =?utf-8?B?dTlZRW0wWmYyTW1TSGpjU1k0Zll4b2E4MkZsUjNwZWdBUytyK1liVFE0SElw?=
 =?utf-8?B?QUplM2doMm9YNkFRMVZnOHRSQjE5MlBXanExMVpIV2pIMkh4T2JKZ09XcG0r?=
 =?utf-8?B?dDROWlZQU2diYnlHRGxQeUFiQmRxZUI1UkxrRlNvTWdKK2RaWCtINkZoVGx3?=
 =?utf-8?B?eHF6b0ZMT3dpaFNOTDExZGJ6WGhMRGpNQ1N2WjFrWU5MNHA5WTZUbU9oN1FK?=
 =?utf-8?B?TWVJVjlBNEN3TEM0aWFyWS9Oak1YeXN0RlhsNWxPSVNiUk0yMVZsaVRjVGFF?=
 =?utf-8?B?bHllaG4xeE40L3FBb0s3QVVmbVFLYm4rcjA4Wkh5K0pDR09sZ083SnhBZjE3?=
 =?utf-8?B?cVFuaHU4alJWYldVdnFRSGJoeWxuY0Y1L3JLWnhzVEVURXNvcHdmb1E5bVUv?=
 =?utf-8?B?Sll0ZGM1UmdqeFVnL080UHBCNUIvWVJnanp4T2Z0dC8wQkwzdVhBZmNCRC9i?=
 =?utf-8?B?QkkrTTgzTm85TFJEVXF5Um1mcTJIcEFEUU1mL0tGTnZORTI1Yk1XMGdrRGJQ?=
 =?utf-8?B?cDNXWTVnZHYzSEVkNnI1OHVkSGc4ZTJpUjYyam5tVmYrWmM5REYxR3F1WjVu?=
 =?utf-8?B?aW9sQ3pjUjF5NjdicmoxMWdER3VHODhqYnJGUEJRVExoWDVyN1hvcmNEaGFv?=
 =?utf-8?B?T0RjY1IrUm9tc0JBUW9leEtKakU1ZjdtREJXbWVxWUVzSURGZjFlR0FnM2Ru?=
 =?utf-8?B?Z2p3MnhDZjlSd3NjempmTFlOQnBrb1lmdU5Ud3FsTWluSklVaVRDdmN6L3VR?=
 =?utf-8?B?ZEhacVpmRW5kY3ZJUWxiMC8xUDBNbXc4Q0Q4T0N1OTUweWV4cEhSQ2FQR3Vr?=
 =?utf-8?B?OHJXVGJDdlZmd0RBaGk5VmNiaW9xcFRsWEUwN01ZdDFxRjZnbjRsQXRtSXlF?=
 =?utf-8?B?L0dqZ0pxNHJISkRVMGIzd0lXcUNuOWhwZG5wTm96Zm45MVoxeGxLanVmQnh0?=
 =?utf-8?B?elBYd2V4L1VMRUxtSDhUUGZqbExuZlRCSlJwREZCdlRoa2gzcUhvVE8xaTha?=
 =?utf-8?B?REp4QXZvVFRCY3V1QkY2dGxvU1N4RUZneUYvQ2picjJ4OEZqbzBkdnlBRzVx?=
 =?utf-8?B?MzlVTmRFdndUei83V09rSmw0UTZrWm9JSzZYdDVBRmRwdmt4Vk1xOGVXUElC?=
 =?utf-8?B?VkxtQitmNGN3Y3RHSU9HWUZCaGltWGJEN2RRQXZRaUp5WCtNVWNjWTFudDhq?=
 =?utf-8?B?TmttTHhBUmZNZnRxZHJLak5NbzlOaXZjYTg0N212S0VZZldwOFY3TzhBWGto?=
 =?utf-8?B?d0FCZTlweDRDcU1tSnBHdEZEWXJvWnMya0lCNE92UkpKeWFsTHd5RXA2YmJs?=
 =?utf-8?B?a2ZaNDlBT3Y1Tkpjd2drSGd6WHlMNEdtQXB3L1hvZHJJUGNVZWsvRWZ6TC85?=
 =?utf-8?B?QVZ1cmdLb3JEUWlLTGNsa1NmQ0ZwZG10K3NXWFdyUXgxQUFIN1FvRkVrREN1?=
 =?utf-8?B?NEhNQWRjcENNUEs2RjVnUFRZZmNVQVlPQm1rbGRaNUNETjZEZlBWM3Uxamp3?=
 =?utf-8?B?S3NQZUxCc1dDTGRmTzg1d3R2M2ZQZk1sOUJvQzRQaWMwdVJ3cXRIMWxyMnNP?=
 =?utf-8?B?d1BIQzRpSXU3N0pSN3REa08xYldZMFFlYnRiS2FTcVA3MDErSm05WTlPMWhP?=
 =?utf-8?B?N1F0QnUvTWJQR3NDVnZ1TW92MDg1NXB2WlVQR3lSbWZwOG9ieFdHREVjU0wr?=
 =?utf-8?B?ZlFsZVQrZnJ1VzBpdnZFemNtb3NXQ0w0MWVZckp3ZFJRU3Z1SUhMc29wWWJE?=
 =?utf-8?Q?gk7OAuNFM4qmV57tTwPMM8tL8vZMJupm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0w2UnJoeHVTYkY1a2VITjh4YUhuNG9YTk9ObG1BZlpvZWFqZUdRL2N4UWts?=
 =?utf-8?B?cVNybHFCOHlKamgxUWQ0YVd5TXE4VjgzV0oxS1JNeE9rZ21ZZnRWaVgwYWw4?=
 =?utf-8?B?bVg3WmF1RjZvczQ0eTZtbEg3RTdpczZYaWhxNHpjRmh6VGF4SGtEMkVEWHls?=
 =?utf-8?B?dlNwMjdhZjZhcGd2VVdiUnZlUXJHbExQS25zaHRYQ21TdzJOTFJickF4NWpl?=
 =?utf-8?B?d1lIUDQ1TGQxY3ROR0Zyc3ZrYTZqNmR0SVlFblI3QzNwRjJZQ3QzOHpMSkI3?=
 =?utf-8?B?UjBPUTdGSjJEaW5QQkRWTFRMVnZpRDVBaWpIM0ZXVGdsWDc2SEdaZUhCa0I2?=
 =?utf-8?B?d01ia3JLNGEvTGIxOTljaUJ3VEV4R2dSdlZvR2ZzS1ZVMEQza2FkRXJDdU1F?=
 =?utf-8?B?Wk85K1hLajFDa0N5MHZIYkdHMUlyV3liVlU1Y0U1dE5iR21OdDR4NEExK1NJ?=
 =?utf-8?B?YjkrK3lqM003c2VEOHB1RHVQYnR2VGRUbGhFRGt4WElkS1o3NDB3Mm1CMytn?=
 =?utf-8?B?QzZHR1h5UzBhTit5Y3Npc2crWEVGVTQ0MGdlTGNyWGNHS3hKSzJDU2h6KzNU?=
 =?utf-8?B?aTQxT24yQlF1NzBuTkVoN0QvUE5ZcHRYdm5WQlJrZ1YreUxJZDJqNmJDSXV5?=
 =?utf-8?B?eERSUDdseDFyU1lQbzViMDU3a1hydHcxa2lPMXQxSC92T21JVk9UOGFRZXYr?=
 =?utf-8?B?bktLeG9tcFpFNzdSazU5UEh1dTloTExBZm5LRVU2cHF6dG9XcktSOUx3VmNF?=
 =?utf-8?B?aUcxU21KeC9vT1VuRTlOaG42eUtqa05NK0lkS0RTUlZFZ2s5RzV6UXdiRDMr?=
 =?utf-8?B?MWVqbDdueDFpSUZQZzJGbnU1anZiOXFnVk9ZbEhhYVMyL000cTFEUkpYMmlV?=
 =?utf-8?B?NGNoelgyRkllTTBCbnVWU1lGL2hQSDgwK3JEOTBGNWxUcUNuQ3ZJUE10ejZE?=
 =?utf-8?B?VjRYZ3EyUnlNVWJxcXdyRjBEN3Z3ZWVFL1h4Y2EvbVFia1M4aFRPaFdkWDdW?=
 =?utf-8?B?NktGdk1hUmh2dUQzYzV5OTRmaUhGSHJ3STRZZzJHNDVCdmFXTTN1S1NDL2tQ?=
 =?utf-8?B?STNPWDFLaUY0aVVTUnVZVjA2UkRsUEpOZjB5YTkyYlVhMmpzNHNQUlBCdGM4?=
 =?utf-8?B?NGNZdjM4QUNadzBkY0F0bmk0d3dhc0VDUEtFbVJXRFpiVnk1THl3R1B0ZlNZ?=
 =?utf-8?B?NW5YODdidU5kMk11bDFRUElITURFcVdWY3owaU9NdmFvbWcyQStKYlZGTjlI?=
 =?utf-8?B?OHVNWWpkckIwZG5BNVhMaFBEWXF0SEhDMXA1OHM2UjJxRG93UXMxWGhlMzc2?=
 =?utf-8?B?SHV4UzdNdSttOEd5elUxby9nWFlFKytkRUNyL2tIMUVBcWE3M0ZaM1JjaElR?=
 =?utf-8?B?anptRFJXZU1rM3NjbENyWTcxKy9RbVRFUmlCR0FHSGJZRmhFaVIwS0VXeGw3?=
 =?utf-8?B?S2cxb0xLY0FOcStRcGI4QWpON3EzdmJleDBPMFlMV3ZIREt3MmhDa21lVG11?=
 =?utf-8?B?ZHI1K0FFN2hmekNYdGEyQ1V2LytwaVNHMlFHVnBQVm1XQjQwWGswTmltTG5h?=
 =?utf-8?B?a1dXeHdUTGNaQzVNZ0JGOEh5RWZMdVBrV1ZyTDRmaU1VK051OTdRdVZPbWJU?=
 =?utf-8?B?QlNVNmtJZHJpdjNXNFFmSkJSWnRPS3VnOFN3TW5tZHlrSUNEN2ZvTGlLV08y?=
 =?utf-8?B?SlFLSmtFUSsvSTRPdlp6NXlZNzJOaUduRHJjVEEvbldDM29mRHpHNUVreW5Q?=
 =?utf-8?B?QmI0SHlKWlhMYXJwampuUC82UFlIWXByTTJhcmNVRisrSEtlVzh2U2NjbkdW?=
 =?utf-8?B?VGZxV1pPaDNHSXVlVllOdjV0UlhEbmNGekIvbGVhL080SHdXUXkvblpnMC9u?=
 =?utf-8?B?TGVCUUx1QlhCNDBKZXFnREdvKy9QdWxpTUVmMU5LTEliVmZsQUt2eG1jc2Rs?=
 =?utf-8?B?ZUFSaHRrVTQ5L2dOWDVKekJjL2lrODdCUW4zVkpJK0xYQ0dLNXdwazZFb1du?=
 =?utf-8?B?eHdJY0psZUN4R01kTjFQRVZqTGI0VEJCQkxnRTE4M0ZTbTZSdzFUMSsvNG9M?=
 =?utf-8?B?K1RBbjFQTXFSd1Q5VjVZSXYrMWMrWU1Ka3NVeXZUTXRxNUljWHFkNXEybFB2?=
 =?utf-8?B?QkRjRTc2c0U3QndKb0VMUTRBOUU4QnBpeW8zd3F5dEFWS0dELzVHdW93UlU2?=
 =?utf-8?Q?CTQCgIMbn9fbtsYLhpJgqC2s6KxAeuaZjhqohb7kC2hV?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c22e1764-1078-4ee2-4e3c-08de3c5b7b62
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 04:27:54.5566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wTUfERx1onCP0aM+ey4bw+sTW9Mtg0VjBPXD1LG5IMbRQZ/xrZM9Iom7gvzDKTmM2kJR/8/it6tEjAroXWWMeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8754
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

The kernel's own CStr type has been replaced by the one in the core
library, and is now an alias to the latter. Change our imports to
directly reference the actual type.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs     | 2 +-
 drivers/gpu/nova-core/firmware/gsp.rs | 6 ++++--
 drivers/gpu/nova-core/nova_core.rs    | 2 +-
 drivers/gpu/nova-core/util.rs         | 4 ++--
 4 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 2d2008b33fb4..672f6cd24d4b 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -229,7 +229,7 @@ const fn make_entry_chipset(self, chipset: &str) -> Self {
     }
 
     pub(crate) const fn create(
-        module_name: &'static kernel::str::CStr,
+        module_name: &'static core::ffi::CStr,
     ) -> firmware::ModInfoBuilder<N> {
         let mut this = Self(firmware::ModInfoBuilder::new(module_name));
         let mut i = 0;
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 0549805282ab..53fdbf1de27e 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -34,10 +34,12 @@
 /// that scheme before nova-core becomes stable, which means this module will eventually be
 /// removed.
 mod elf {
-    use core::mem::size_of;
+    use core::{
+        ffi::CStr,
+        mem::size_of, //
+    };
 
     use kernel::bindings;
-    use kernel::str::CStr;
     use kernel::transmute::FromBytes;
 
     /// Newtype to provide a [`FromBytes`] implementation.
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index b98a1c03f13d..3c26cf0b7c6e 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -19,7 +19,7 @@
 mod util;
 mod vbios;
 
-pub(crate) const MODULE_NAME: &kernel::str::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
+pub(crate) const MODULE_NAME: &core::ffi::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
 
 kernel::module_pci_driver! {
     type: driver::NovaCore,
diff --git a/drivers/gpu/nova-core/util.rs b/drivers/gpu/nova-core/util.rs
index 4b503249a3ef..8b2a4b99c55b 100644
--- a/drivers/gpu/nova-core/util.rs
+++ b/drivers/gpu/nova-core/util.rs
@@ -3,10 +3,10 @@
 /// Converts a null-terminated byte slice to a string, or `None` if the array does not
 /// contains any null byte or contains invalid characters.
 ///
-/// Contrary to [`kernel::str::CStr::from_bytes_with_nul`], the null byte can be anywhere in the
+/// Contrary to [`core::ffi::CStr::from_bytes_with_nul`], the null byte can be anywhere in the
 /// slice, and not only in the last position.
 pub(crate) fn str_from_null_terminated(bytes: &[u8]) -> Option<&str> {
-    use kernel::str::CStr;
+    use core::ffi::CStr;
 
     bytes
         .iter()

-- 
2.52.0

