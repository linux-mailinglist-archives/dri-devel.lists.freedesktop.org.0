Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB1AAA7E56
	for <lists+dri-devel@lfdr.de>; Sat,  3 May 2025 06:08:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44FF410E2E4;
	Sat,  3 May 2025 04:08:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="R0r5xWcG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2077.outbound.protection.outlook.com [40.107.102.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F167110E31F;
 Sat,  3 May 2025 04:08:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L/QXjGDM+PU0QguQHJlJos0BnrMb+TFTJyNzU62Q4KmdXizrxdY8CZbw8qxMfExCt9/adzL//BeaCLCwv2uJKkGK1AfUDBqxOnLz0q9IdWSJ6aj5zEWvLzpqYuozd0p8VECY81Zwfqcldt+8ww33Pw+W3Wt45cYo8BRJ4fohc8phIFMbqXsiIytWcyszxcNm3DrZOLOPgMAL9z9Kkq+e7/7BVy+vdzXfSS8U8Cfq0jaAcSs3dhcscxJzphUSvbLiZWvoiJUXDex7nL5KDqyxXK3rWgxH8mPJ+IIBt5j7be2tjFaxiP7iRrettlVv4dFDLyOgl3MvZesuRgxjDV+SaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qc70Y0Z52EZ3TqA7lQSDoymZPh1CTaawWZyxC6Ffdak=;
 b=ozxMAnbvLkuFz5Xq1ywHQm6stp0AbN+oQPtCsm78HgVvvLUryTYFBJUiagFbxMJAfzglluLGgDNVTDNme+SJBlosUAsExEgptAOw0dTmduIPnTZ3E3SXRCeE6kJmDvNXPMnN92HVGm43KR+07NnGx3gCLS0X6PbabHZf69H+nMx0tAT6MyI6tDnraDnlnX5Qgok3jPeHKV2wV+j3JGVDu4JKeGzYAiOvZul96oIX+BFhoYMYNKlFKEJs614jj2dkQmOgOyeqetr6TP+XtPrp24cDlx++EXYNtidG0Bb8gYwDtV/YLzfJALS65SfG7oznqvM0oI7w70VgZdWG4VtOjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qc70Y0Z52EZ3TqA7lQSDoymZPh1CTaawWZyxC6Ffdak=;
 b=R0r5xWcGtM9zkI3p+dq0AWDm499OWkM1M3FlARkc5hmwjnteUYMxlGtsuOJcybZ0Rod0m+unQ2GHk6VBnUD4qRFbuvS0iNN1df77xYQkag9qcyZd6c1ehOLGVELmuJD3ofXNv6gqOXqgqXudidRh+r0UJ7I4COtprIviYx3tB+sFpGkzv3X/DRM1IncSmGV6fdJaKPhTc+IgErsqWf17COyeTThkwmohSyfBQ2EQswHUs86c9Ns6fzBMdcjtMpshZz5W8M4rBZHOFNYP5IW1ft2Rb5qqyZzB/lWONI2ai2diF6jrRPJUby/J6xE6NEnrhs16W5K/lYRDicNXrdxUdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CH3PR12MB7713.namprd12.prod.outlook.com (2603:10b6:610:14d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Sat, 3 May
 2025 04:08:21 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8699.021; Sat, 3 May 2025
 04:08:21 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alexandre Courbot <acourbot@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>,
 Shirish Baskaran <sbaskaran@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>, rust-for-linux@vger.kernel.org,
 Joel Fernandes <joelagnelf@nvidia.com>, linux-doc@vger.kernel.org
Subject: [PATCH v2 6/7] docs: nova-core: Document basics of the Falcon
Date: Sat,  3 May 2025 00:07:58 -0400
Message-ID: <20250503040802.1411285-7-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250503040802.1411285-1-joelagnelf@nvidia.com>
References: <20250503040802.1411285-1-joelagnelf@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN0PR03CA0001.namprd03.prod.outlook.com
 (2603:10b6:408:e6::6) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CH3PR12MB7713:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fffa790-2df9-4e07-df51-08dd89f8244b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Nk9JaVNPWFdsY3R0RW5oT1JnTk9uMUxQL3FGOTVqUnlaMkw4ZDdyOHVhdFBV?=
 =?utf-8?B?c1BQV0tGTUdRaTVzNk15SjVHRTJPa3VTUFMrdGVPdlQxMzhLYUw0MkpVK0xx?=
 =?utf-8?B?UXl1UmtuVzh3aUdSRzN3ZDZMNCtvRFpGbGRHbXN3a0tpdUdOYmJaMEpsbDZW?=
 =?utf-8?B?M2dONHY3ZjlRaGJjbmhyZk9EWmYyK25lMnVjaUlnQnptU2JsTjByQWZsYVYv?=
 =?utf-8?B?ZU1GbGRpQVY5STBSZDFlMk0zYlgxR1NzRTJRVDdueUhJeGxTQUwzTkltMWF3?=
 =?utf-8?B?VzFrN1BYR1VYRHAvNUd4aDZveUwxbmVwSytnOVBlSEk2T0xmMEFWMmQxd0VK?=
 =?utf-8?B?djF6VHB3L05ubTl1amh4TFdsUHZFNS93R1dkNzg3VWlrOXZVRzZkVzNtYWhX?=
 =?utf-8?B?MFNpMllGSHRvTjFjN2ljNFJZSUs5NTFqMWdCQjJIdWxQMURxeTZZd3ZNOFcr?=
 =?utf-8?B?OTluT2xtM1ZqT1gxcWJkeGpwRDdGRWZFNnJteGhxcnBBZit1YUFlMUp3eGlQ?=
 =?utf-8?B?Q1ErbVE4T0ZOcjVkTXpaTHVac2VLSnZTWmlXU2pDY0R2MGVYcFYwVmFHR3cx?=
 =?utf-8?B?VTNzMUJXSUk5NTNpOWtidG96SkVQZ2xpSDArV3hoZERyajJSM1o2Z2lzbmFl?=
 =?utf-8?B?NmtNdlFWSzJVdHhsemNxdmhEVEtUeWF2Sm9nSjM1S0NrY09lS0N4aU14cklJ?=
 =?utf-8?B?czRGWkxTTDVhNTQwUFZCVlB5K2poVDZGVEtyN0gyRUMvTjdhZlIvaGFZbm5R?=
 =?utf-8?B?WFNmcm1lUVMrZjFjeGNzREE4U3g2S1IrUVlROEVNNVkwc0pEZ0tGem5NUG0v?=
 =?utf-8?B?Z05JV1R2NW8yWldUaDB1ajA5cEd2Q1Fpd1JzY0VhODJEUnBjQ2hYN01QTm9r?=
 =?utf-8?B?RjlyeGtZTmloMjNiRUtZSkZDcklHUkYxWGFxZHBVQ3F6VDJ2eDgzakpDWXBo?=
 =?utf-8?B?ZVBkOVVCeHJLNWFxeGhWd0ZvTmxGY24yZUppdzM3TEtjbnFqTHR4RlBBNjN1?=
 =?utf-8?B?MkI0ZDczMU1zUkRNa0JINzhlQTRwOWFZbEw2bENHelJIOUo0bC9hZmI2a2xZ?=
 =?utf-8?B?YjhsaDJJYmZsdUl3SGFMQldlQ0pCa3g2NGlFV3BKazBYRDNwRng1U1Q0a2VT?=
 =?utf-8?B?NnIrR0lVek51SHIwdGloRTNpamEzWXlEUlgvTGNWYzVxM25aWlhrRjU0S0F1?=
 =?utf-8?B?NUtkbHJFQjBIYWtQeDlaVXpFNmpXOHZrdktkTnJIWllVVjFsb1dNMnBzblIr?=
 =?utf-8?B?bDNJdnZqK2p5SWM5c1htY1JRTlFndXh6R28zRXRjSjBWM3dSeElVaGhpTGxI?=
 =?utf-8?B?ZEp6MnphSmRKbDdrMEZYM0VubTBydjhrYzRqUXpnUnlwZjcxeXkrT3hqb1cv?=
 =?utf-8?B?VURoRHlHREExWFdmS0NXVHY1SkwvVTI4NnJWRWJFYmpGa1JGQUhvOXZwTTJ4?=
 =?utf-8?B?eS82Sk1ybUZXM0ZiWU9EbGEwUGlLMW5lS3dxeDNYSU9pcUFnMUc3Rkt0TkVJ?=
 =?utf-8?B?UDdVZDk5cTlsSmRQZ3NVLzlmc2ZuV0F5WFBNYzRhNDNVRGVUZkloamlydm1H?=
 =?utf-8?B?cFM4Snl3ZE9PbWFQNlpJbmd1U3pLTVVqSlZCcmtJd1Y5Y21OTnRNRElMSHE1?=
 =?utf-8?B?bFNCcWI4ZlhLeU4vcno4WlR1ZXI2TjdqUmxxVlZFdnJKSHVQSC9va1BxL0dZ?=
 =?utf-8?B?eDNBNDlQUVNsYTJtdzh5NmkraVdFZmFqWWZ6Nk1OSUdSU0szNjNqOUkzSG1N?=
 =?utf-8?B?ek8rT0lQaklDUmNLak5sSjZmTFJuTUI4UDVnbWkvMTJEaHdVWXRMT0Ftdkhk?=
 =?utf-8?B?aE1iYjkyeG52ZkdPamxkNXNXUGlzc3FQZklMR1MrWGRCUzR5b1BlMEk3U2xB?=
 =?utf-8?B?YVhleUozdkVEK0lXYk9ack4rRCtlRHBuQnVPc29vbU5oS2UwVllpMzVzWFhr?=
 =?utf-8?Q?F/w/qsrQ69c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHg2d1pvQVJkOGJOWkNpaU9ibjhDNVJYQytmT3BCT21RYkhyUFNPRlZ6V21C?=
 =?utf-8?B?dk8yc1Y2Si93UU5DV2c3WEI0emxlVDFkVGdPWHArS05mN0szVW1OR2kvZ2NV?=
 =?utf-8?B?VTNISldmbmwxVndqQzdBY1ovYVFOZEQyREkzYStaa0NoZkdGOTJJL2FVTXEr?=
 =?utf-8?B?UUwrSGlObmVtZzFSTHpYSmlGV05kbEtVWU5JYSt0WXBSUE5QSUIzeW1xTnB1?=
 =?utf-8?B?TTl1ZHdkNmhvZ3F2VkdyMk1jV1dkZGFXUG9sR0ZpK0dMSS81MWFMUG5SUWJE?=
 =?utf-8?B?ZUpXN1VzRDF6ZGZYZDhjWmdxOEhPclhYcHFOM052ZnFieGs4VzJkZWNReHBT?=
 =?utf-8?B?UHhUOUdyZE03Q0s0NXc1N3NOMUJIbW15K21oa2EvMUQyRURxNUhJVGwzM0Y0?=
 =?utf-8?B?aVNiRldUWSsyT3gwTkNldFY4MGhFMkFnU2swaDRiWm0wS0JxQk1zYlhBVjg1?=
 =?utf-8?B?RnZERHNmNWlrc2VrSTBQNFlrL0tRWkl6RUFNVEdNNVlLTTRueUg0a2NjUm5n?=
 =?utf-8?B?M2xxM2dtMW5nOXB0Y0VkRDYzZW5OelVkaFdxTXcvSXJuR0gzZzl3anhHSHFK?=
 =?utf-8?B?MTRZaXRuQlZLOWQ4V2xmVDVQZkpMN1ZPaHJIckxpK3hTdHRscm5yMkhOV2xx?=
 =?utf-8?B?WlFMRG40M1E3blBwVy9aZkYxTUhvckt0a2JaMU5lRDRDK3lnZXhxclpxNWVv?=
 =?utf-8?B?b1RGVFJ4SmhnbEZhUFcyZ0JHRVIxdU1xNmczRkw3VXBTZ0xiZkU2ZGVyb1lD?=
 =?utf-8?B?d0I3dHpzY1Z1NUphVVZidVFZaWFRaGFqcFkrN0I4SzVSVU5jZlR3dU5oL0Ur?=
 =?utf-8?B?Mm55UFJMdVVlUGJQS3RlWUdGWGJFRXFLdzFvdEZFQjgyQjE0KzZ3czFZZWVQ?=
 =?utf-8?B?RFl6TThSUmtYZjhuSk9KVlR6S0hpcTNRcGMwMnFHeW8rSXprYXUvT3RCdmQy?=
 =?utf-8?B?bW1sQUp4K2ZZQjdISDY2eGFDa0V1SEVJVmJXcDZDdHYzQ2J5bEI1dHNMZWEv?=
 =?utf-8?B?T0hyYlBwTy9aOFZzcThlVVp0T0ZiNG9XRUdFalFnbGNKU2dhS1RGQ09pbmRV?=
 =?utf-8?B?ZXFsNDQxRm1HM0JxTGUrVkF4bEh6ZEFUSnlrVmUxY1NqN0VqQ0JOaGl6TjA0?=
 =?utf-8?B?M3Fxclc5RTFFY3krVGlIYVpONm40cG9NOXJVTTJyWWRWYW9LS0FyYkdFQ1Nl?=
 =?utf-8?B?Ry83UmZXeTMvbXpDRTduR3BqL0p3UUVzSFVxNFp3Uk1TTS9NbW5CdEFyOUZG?=
 =?utf-8?B?Tllremt6aHhEV3cyTTR0Y1ozVktUb01Od2ErWHZXR2QxcVNIK09lUVRZcnlQ?=
 =?utf-8?B?RElLS1krdU02cU5uMTE0Zno4eVpoVDhHc0lsMFlya29DMTRlR3VRRjBwSm14?=
 =?utf-8?B?Z05BUm5HZUhaTy8zb2ViYzB4cll6QjNnTWM3ejBZRmtMRDYyeXZEYWhsaHhH?=
 =?utf-8?B?L1VXUElSa2poQnVTMHFZblIyQUI3SEwrWFBnTlpORzlIeXRrRE1jblFvVE9q?=
 =?utf-8?B?NGdSbHA5VFNXUEZXQ09nS05TY1BxWWROMXgyVVFHd3RMR0hJWHhyckRRN2lj?=
 =?utf-8?B?OTNrKzRJZXZza2JyV1c0WDI1UEJ1WjJXN0MvVWk0emltZWF4cTRLaHBZN0lv?=
 =?utf-8?B?WEl1RVduOFpSczFIMENyamU1RFhUbEd2ZnB0cUVpMlU4Qk1KelNmTUY2UjB0?=
 =?utf-8?B?V1UxN1pJVk9LNHFDWkZYaVRMdENVVk5MQjFaR3RKbTd4S20xc3pzZW5RN1Fl?=
 =?utf-8?B?MUJra0w4R3VlZG9USlJqQnpsYVF2b3RJVDY5U3FITlpTS1dNZTc3YzA4MCtt?=
 =?utf-8?B?Zm9RN2FOcTBkZHJQd2RnWHpyMkxhQVV0bGZwWEJ2OHZhS3p6cjU5bndDdkNT?=
 =?utf-8?B?bUVsZkM3NzlXMXFna3pqVlFqelhZVE91bTZsc1pOcWIwUTNaR21YSmh6MUpF?=
 =?utf-8?B?QW0vUk9IdUhkbmtlbFVBUFlhSE1wR1piM0lQaGQ3bzFXbDZIL1RlWkR3WmtM?=
 =?utf-8?B?NkoxdnZVeXNJN25ub05STUE5RFpvcVE4Ry9acUI1RS8zK1RsZyt6OXVxbFY1?=
 =?utf-8?B?NUgyb3hhUEV0L29aUk5NK3lvZ2YvYnBlWUZpUUFDWEVmVTllS2F1aHp5TzEx?=
 =?utf-8?B?bUpxcWQ4NkdmWno4MjBVa1dxVndTWlA0a1RwNHBKNy9qcXJidVluK2lVNEpK?=
 =?utf-8?B?RFE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fffa790-2df9-4e07-df51-08dd89f8244b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2025 04:08:21.1268 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5dGoX3pIOkAtqoyXmN7nVmEWjLqE7yWvLk+xb8tKfzNyW44ZjFmlSfnggTTn+yf0GIdoL5JiOOoH/9Wtp+mVwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7713
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

Instances of the Falcon microcontroller appear in modern Nvidia GPUs and
are crucial to the GPU boot process. Document some concepts which will
make nova-core boot code easier to digest. All the information is
derived from public sources such as public documents, OpenRM and Nouveau
code.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 Documentation/gpu/nova/core/falcon.rst | 156 +++++++++++++++++++++++++
 Documentation/gpu/nova/index.rst       |   1 +
 2 files changed, 157 insertions(+)
 create mode 100644 Documentation/gpu/nova/core/falcon.rst

diff --git a/Documentation/gpu/nova/core/falcon.rst b/Documentation/gpu/nova/core/falcon.rst
new file mode 100644
index 000000000000..f2b89cc2a159
--- /dev/null
+++ b/Documentation/gpu/nova/core/falcon.rst
@@ -0,0 +1,156 @@
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
+The code running on the Falcons is also called Ucode and will be referred to as
+such in the following sections.
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
+To establish a root of trust, the code running of a Falcon has to be something
+that that cannot be erased and is hardwired into a read-only-memory (ROM). This
+follows industry norms for verification of firmware. This code is called the
+Boot ROM (BROM). The nova-core driver on the CPU communicates with Falcon's Boot
+ROM through various Falcon registers prefixed with "BROM" (see regs.rs).
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
+Thus the root of trust is:
+     Hardware (Boot ROM running on the Falcon) -> HS ucode -> LS/NS ucode.
+
+Example on Ampere GPU, the boot verification flow is:
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
+     the "SEC2-RTOS" ucode at runtime. This presents a problem where there is
+     no one to load the SEC2-RTOS ucode onto the SEC2 (i.e., the CPU is incapable
+     of loading LS code, and GSP-RM has to run LS mode). To overcome this,
+     the GSP is temporarily made to run HS ucode (which is itself loaded by
+     the CPU via the nova-core driver using a "GSP-provided sequencer")
+     which then loads the SEC2-RTOS ucode onto the SEC2 in LS mode. The GSP
+     then resumes running its own GSP-RM LS ucode.
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
+Conceptual diagram (not exact) of the Falcon and its memory subsystem is as follows:
+
+           External Memory (Framebuffer / System DRAM)
+                            ▲  │
+                            │  │
+                            │  ▼
+┏━━━━━━━━━━━━━━━━━━━━━━━━━━━┳━━┻━━━━━━━━━━━━━━━━━━━━━━┓
+┃                           │                         ┃
+┃   ┏━━━━━━━━━━━━━━━┓       │                         ┃
+┃   ┃     FBIF      ┣━━━━━━━┛                         ┃  FALCON
+┃   ┃ (FrameBuffer  ┃   Memory Interface              ┃  PROCESSOR
+┃   ┃  InterFace)   ┃                                 ┃
+┃   ┃  Apertures    ┃                                 ┃
+┃   ┃  Configures   ┃                                 ┃
+┃   ┃  mem access   ┃                                 ┃
+┃   ┗━━━━━━━▲━━━━━━━┛                                 ┃
+┃           │                                         ┃
+┃           │ FBDMA uses configured FBIF apertures    ┃
+┃           │ to access External Memory
+┃           │
+┃   ┏━━━━━━━▼━━━━━━━┓      ┏━━━━━━━━━━━━━━━━┓
+┃   ┃    FBDMA      ┃  cfg ┃     RISC       ┃
+┃   ┃ (FrameBuffer  ┣<────>┫     CORE       ┣─────>. Direct Core Access
+┃   ┃  DMA Engine)  ┃      ┃                ┃      ┃
+┃   ┃ - Master dev. ┃      ┃ (can run both  ┃      ┃
+┃   ┗━━━━━━━▲━━━━━━━┛      ┃ Falcon and     ┃      ┃
+┃           │        cfg-->┃ RISC-V code)   ┃      ┃
+┃           │        /     ┃                ┃      ┃
+┃           │        |     ┗━━━━━━━━━━━━━━━━┛      ┃    ┏━━━━━━━━━━━━┓
+┃           │        │                             ┃    ┃   BROM     ┃
+┃           │        │                             <───>┫ (Boot ROM) ┃
+┃           │       /                              ┃    ┗━━━━━━━━━━━━┛
+┃           │      ▼                               ┃
+┃   ┏━━━━━━━━━━━━━━━┓                              ┃
+┃   ┃    IO-PMP     ┃ Controls access by FBDMA     ┃
+┃   ┃ (IO Physical  ┃ and other IO Masters         ┃
+┃   ┃ Memory Protect)                              ┃
+┃   ┗━━━━━━━▲━━━━━━━┛                              ┃
+┃           │                                      ┃
+┃           │ Protected Access Path for FBDMA      ┃
+┃           ▼                                      ┃
+┃   ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓      ┃
+┃   ┃       Memory                          ┃      ┃
+┃   ┃   ┏━━━━━━━━━━━━━━━┓  ┏━━━━━━━━━━━━━┓  ┃      ┃
+┃   ┃   ┃    IMEM       ┃  ┃    DMEM     ┃  ┃<─────┛
+┃   ┃   ┃ (Instruction  ┃  ┃   (Data     ┃  ┃
+┃   ┃   ┃  Memory)      ┃  ┃   Memory)   ┃  ┃
+┃   ┃   ┗━━━━━━━━━━━━━━━┛  ┗━━━━━━━━━━━━━┛  ┃
+┃   ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
+┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
diff --git a/Documentation/gpu/nova/index.rst b/Documentation/gpu/nova/index.rst
index 301435c5cf67..75a98ab63055 100644
--- a/Documentation/gpu/nova/index.rst
+++ b/Documentation/gpu/nova/index.rst
@@ -28,6 +28,7 @@ vGPU manager VFIO driver and the nova-drm driver.
 
    core/guidelines
    core/vbios
+   core/falcon
    core/fwsec
    core/devinit
    core/todo
-- 
2.43.0

