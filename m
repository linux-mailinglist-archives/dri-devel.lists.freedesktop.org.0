Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F2DAF895E
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 09:26:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDEE710E964;
	Fri,  4 Jul 2025 07:26:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="I9vn8Z9j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2077.outbound.protection.outlook.com [40.107.92.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDF5B10E962;
 Fri,  4 Jul 2025 07:26:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vHOpFIJhtcHJSTC5CJC5uG6C4Wx/xDZqBDAUrj9y2HxtWgOHb/3J80Wa9HqLMbIt+DHw4x77CX4RJc/n5v+m5JutMJHVg838V1laWOiEPDoRoOEosL3vSLz8etTC4IwrtRH2T1vkag3ugtT2ro+rD6LxPqYy9YWI+pl16oZFwKg0FH+XwAafiBz7XSAw79awuOFzV9iQultKcFqS/kjD1mBd9LLgl+0HHre3m3BRIJAWEgKIQp035059h6LxJ0rWfIzw4I8AJT81ddwE6BBkmhyN1N68apfy06WGh40qQDqk6403Z+jqp2IO+OpryB3LWSst9xRJb/vw+8FK4WA5Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9GPxIYGe62pdczfulLfV/VbN18MHZYT5Wj/oiQEYQ4o=;
 b=X+MknDmkGyA5ZCFkozn0CzDdDtDHz9frKtk1y9Gull0EQsqHitPb71JGNOrZWQB8lOz87ZEKciKxgSamzpxN2V0AHjUakli3HJryVRLKalBgxtewLxm47dMuzdhFzugbMVJLqzrz6Fx78x+EHHLr/Tp/Xi9g1P0Wa8qB3DDhBQR3oZzRSVfYtFEWF4FHTm7sfjIghtw8Oldyc/6RwsPy02Ff062YTAtxCUJpIj8evOwfbeqKofLU9sODmaET22gCS+pBks5Lx4JYYSKEiN5xXstn0AH7Y17Bb9zwg+JzBFQkhIqV2g3fllFFEurUp4d8s4pUIkk8xUn9eSFSx+wwzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9GPxIYGe62pdczfulLfV/VbN18MHZYT5Wj/oiQEYQ4o=;
 b=I9vn8Z9joBBliRnxSmVoSg53MBcuvIFFpkb6t5q0Ag5DNCQuWOkY2OBGzerG9s4M1j7UudbjXpShqI79UmlYjQ5sF3EQBa6VQGW2cHXp8X0qry7yeZ5722QzizjJY37DFd90NXB0GpULT4KKsEEyBAdhKsAmejQMWJ9QR0skRyfbPiwCIeqZCW2e15owdV6lfRua5+UAbvRgFCKlUOpaBPbpdTpZK6dQGwGpBQeQjmOQx8gsGGls+sb921YTstkoVW7KD4y1R6ARoQZJlDzCR00pMfJRkFcFjd1KLcTd5MK7fFJMv0bUm+clyyThUHxsy1/EBzUmraECbU717Vtqzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN0PR12MB6341.namprd12.prod.outlook.com (2603:10b6:208:3c2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Fri, 4 Jul
 2025 07:26:17 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8901.018; Fri, 4 Jul 2025
 07:26:17 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 04 Jul 2025 16:25:17 +0900
Subject: [PATCH 16/18] gpu: nova-core: register: add support for register
 arrays
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-nova-regs-v1-16-f88d028781a4@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0263.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN0PR12MB6341:EE_
X-MS-Office365-Filtering-Correlation-Id: ebcb8330-41ef-40c1-28cd-08ddbacc10f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?amVUMUNJTjYyR0FyOHVORDZ5eUZRSnhJclFueERiMmRDa0huSmc1U3llSFhV?=
 =?utf-8?B?cll1NjVEQXhqSzQxY1BmYXlvdW1hbDMxeUlwNFlnVHVUTEswek5ZV1BLOUR3?=
 =?utf-8?B?cDZkMmZHU21vZUZhekJUZUY3ZXFOZEcrUmNwWXcxNGtIR3h6d2xBY0lyd2lx?=
 =?utf-8?B?aWRaRm56UmkvNHhrakg4S0p5TUVNYmhmUWRld3Npa1V5WGtCTmIvc1ZKRGtl?=
 =?utf-8?B?WTg5NksySjZRZUdCMkdBcjMzbjZORmlZYi9BSG84MmZoSUtDMnFDcmJ0T0tj?=
 =?utf-8?B?S1JBbjNYeUozQWgxMDhzYzN1aXlOdzBJQUhFbFpUM05GejBjTTJCdDhjNVhh?=
 =?utf-8?B?cW9BcWM4RXVVeVhLYlk5S2VxT1RKWEhxVi9yeVdBREcxd0Znb2MyRnVCNGk3?=
 =?utf-8?B?UDhvZDBQcU95N0FHRytUU0NmY2ZLSU02bG1PRGo3VWJhL0hPNmJSTVN6QlVS?=
 =?utf-8?B?V3FDZXJHSjEyeE5LbEtTREtaM1daemNDUk52cWQ4YjAzMWd1RllWMXZ6V1Zp?=
 =?utf-8?B?RlkxNzRYTTluSFdLdFRpMjBzNFBrenhDRytQN3g1TTNPSUQveHFmYUU2WGxz?=
 =?utf-8?B?bXkrTTl2MU5oT1ptMXBOZ1lUc1AwOFZCLzZlMVp0MFI4ZU5pRVBhOHN6SkE0?=
 =?utf-8?B?V1BOWWY0NXZ2K01BcmRnYXVzOUpsUkY1TndUUE5sOHdUVVNLSGpQSmdxT1dj?=
 =?utf-8?B?L3dySXk1Zk1UYldHSHBhR1dQSzA4TUNzTDNKYktYNmkwaVZ5K3RWbFcwME16?=
 =?utf-8?B?MC9rSkpEWEIyNGJxUE1Yc0U5dnpVdThNKzBNUkZSNHcvZ3M5M3NKT1dyRzFE?=
 =?utf-8?B?RTkxdUVxU0d2cDlGOWUxVE9SMlNMNkRlYWlKejZiTFRhbGFFZHludjNYWW9l?=
 =?utf-8?B?VmtHcHI5c0VtZmVkRVJ6Ri8zRHk1S1RCMGswMkw0SmRuYUdadVFoTlRQTmJY?=
 =?utf-8?B?K2hJelhiQndGL2NiSkZ2UTdXZ2JpeWcwdUppUEJYU25hMHAzcnNpOWNIU3BE?=
 =?utf-8?B?SG1aUGJ6YzJvcVhTbFBLMk1VTjczWG1objhWUVpqRGlnMHVLOXJJOS8rWFVW?=
 =?utf-8?B?SzFZcjQ2aS9FL2FjMk03b2dOOWJtSlc3RzZyK2dPMVkvSWs4a3pvVjJSUDdS?=
 =?utf-8?B?azhjSkpzYXpZN1BJOHVidjU4NUtJVUd6MlNLYUpBby9XZitKdnYyS0M0VlRS?=
 =?utf-8?B?N1Q3OVlzSzhaZXhkVWlOcENLZkMra3NWb3dHYU05S0JxTTFuUmRMOVd2UXhB?=
 =?utf-8?B?RUlBb3A0QmZUTU5MT0VCcTBwaGQvbzNKeXliTWE4ZGdBbEd2UUQraWVZVHdI?=
 =?utf-8?B?anVIMXZUcEJlMUM0SzIzYlJVU1M2eG5oZXp0SHRiY21yT1VwZ0lPYm5wVnVT?=
 =?utf-8?B?ekFBLzQvT0RJZU1TRXl4c0k4Q3ZNWFliNEEzbnByaVJwQWY1VklnYlM1VVFh?=
 =?utf-8?B?U2VpVlRldlJrU0o0ZVBSK0dSVjZjMnByTVdZakJEeUF3angyM1YwMFFMOUxG?=
 =?utf-8?B?eER2ZFRWN25reE5PN0RRZHVxM1V3ekQyaEhPTERsODF6UkJjNkIrWDBZZm1M?=
 =?utf-8?B?VkJXZEgxbXBZb25vYTEyeGJJVG54T093Z1lZYUp1RWE4TXoxc2VYYU9BUEM4?=
 =?utf-8?B?a2sxanBNUWtyQ1AwU1ExN3BKVWJLMkkvWDIxaVlGMDVjYS9qUWtNRDhhSlRn?=
 =?utf-8?B?ek0vbzNFendTRG85N3l4YjVDMjcyREpRczk3blJxMWhqZGdCTWtDZEUwZW1q?=
 =?utf-8?B?SFRMVlNqanVOTjB3bVBydzFZenhYb256OXRiT1J4L3RkVWc3SGV0TXVlT2ZU?=
 =?utf-8?B?UzNvckx3VE82T2xxV2ZVdnQvTVVoUnM1TEZYN003M29MMkNoYmtpWVBGM2g4?=
 =?utf-8?B?RzlNYVQ4UGVMemg3aE84OG1sejNsdFJVZ2tSMFZ5T1BUblpMQ08zQ2hSN2pj?=
 =?utf-8?Q?caC1DoP1ee8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alVBUGZQSkt2SzRJcmlNcTJZb3p6aHcrSmYvQmV6b1NCQk1pSjEveEFKQUV2?=
 =?utf-8?B?bHUyL3gvRkpJc0NJUEdGZGlEU0FmcEExcWNqUWljRlNrK1VTSW9PdW5PNm93?=
 =?utf-8?B?NUJ4YmpTamV1UVgremhySGcxbTF2cm04cVBmT3pkeTdqZTR2aGM1UndWVFJF?=
 =?utf-8?B?QkFGajZkUFNTOTVQcTd5WHVRS1VQMDFKN0lUcjMwV2dmdWlKNFpDQjkxTm1D?=
 =?utf-8?B?a0FuT0xmc0R2ZG5BcDRBTUovZGVDY0NQbHVYT1VZd3hZTGpNVXBFQ3dGdWNu?=
 =?utf-8?B?SHR1ZkxnQkRIM0IrYktQY0E1TXB4MHJ1c1JDelUyR0tnc0FlTitVT0UybTBN?=
 =?utf-8?B?YkVLR0tKZk5mYlQxa0VXNXAxU09pK0tEWDdDdkFRR01QeklaaE95TE9CQVoz?=
 =?utf-8?B?Vmx1YzN2STY4K0RQZTRPMkxGdUphZytrV21UN2tFcisrM2tJTTU5QlZJM2lP?=
 =?utf-8?B?TU9SZlN5bk9wRVdGWCttcTVtZE94bzJFeU5lZ01ENDMrN1VPV1dNS2RGR3lP?=
 =?utf-8?B?Z3RITFpjeGUzSlFKbkIzOUpmRmZpbEc5VFFlb1FNTzFzcnRuTHM0SU40ZFNy?=
 =?utf-8?B?MjJ4aWVFWnd2d1JPNW5Na0ZheStndWk3RlhpenkyUDI3dXp5cDhyelp0Z2l2?=
 =?utf-8?B?eU41K2VjMW5MWFZQUlhGSUVETlNHTDVtV1dTc1dLK0VEL0JrME5TaUd1Y0d2?=
 =?utf-8?B?M2tiQWhzMlNvRnZqVFh5L1M2MG4rWW5uMkFGdnlSenFIODAxbVFPNWRHdUZR?=
 =?utf-8?B?SjRySmVmempENnQvTlhMSUpoNFZZWWRVWWMvSXBwSEQvQWROTG8yU3RyamlH?=
 =?utf-8?B?dmtiTjdNQzc5REVUdWJIcWMrSE9ZdjZiNHdqdllWVVFMTmtEN1hIYXVFZEdo?=
 =?utf-8?B?a0g1ZUFUdVNMcGx2akpRd3Rjbkw5VEpxZitPZU1kYnRML09PZHlNUzM4MStE?=
 =?utf-8?B?dmc2MGdLM2lNd3VEQlRBdVNuaXlEakZ5bFJJSWpHVlhubmJYSmZ4QlBwY3VM?=
 =?utf-8?B?b0RuYUh3V2xsNE9SSEJDN2theG5qbFFtRjczQnc1T0R4NzBYRlpRT3dZeHpE?=
 =?utf-8?B?L1htblJ4cHh2bEZnM0Q1ZzFMN0dhOVZHU2RIeHlMR1k3RTBMdGxvd0FMMFll?=
 =?utf-8?B?VlQwTmN5ZVN2cmhIN095LzdYdjFibyszMVUxMEdSN1dLdTA4Q05KelN5YWxx?=
 =?utf-8?B?WDloYTkzdzFtcWVHQXdJdE5ERC8vdGJYeUpSTGYzV3JsTVhYMGUwS21pc2pw?=
 =?utf-8?B?T2lTR2NGVGR2cXY5V05wdmxSeng1MURhUkt5b3dsNzlPZUtiVktISXdFOGRx?=
 =?utf-8?B?NnBJWnB0aXZtcm5FS0NZNk9EcW1JTzBtMEdEOXFtVE5USFZ3L1dKaDBhMHNO?=
 =?utf-8?B?SU4xRHE5dE5DQUxPVDN3ZlVIY2Z6L3NheU04bjRzZ3BJZ3VrQlVQSHBHeWZP?=
 =?utf-8?B?eVJwRmdxTFpjanJOQ2FIVW9XNlV6c0VFbG40R0RGcTVBb3pPeC9WS2FiTG43?=
 =?utf-8?B?VWpYc3VPL0ExWXp2U0ZldkduSzh4TFh5WmsveXl3RXJrbmludlBTUzJqalJi?=
 =?utf-8?B?NDZ6eW80T0l0bmhrRk1uWnNNREtCQ0VBdWRlR2pZVS9zYUljNDNDMC9id2dD?=
 =?utf-8?B?SUxkaHhGdEY1eDgzbEs2WFZYNVlKd2dXejkvRnduSHBubDZ3RWZmUG9QSDdT?=
 =?utf-8?B?U1l2Rmd3ZWNhY2JRam0vdnFGY1BMNlhwa2Z3ZHlrZkFvQzYxYUZyUDRIOHNv?=
 =?utf-8?B?TVdWblBkTkVXK04yRk1vSlY4dVhGaXRpYTM0UW9BYlp0eUdVMXlHcnhOdjdX?=
 =?utf-8?B?M2dING04WEtUSnBmY0VIcW4vRDhhK3ZOOTF3YU55VHFGcmVzUDBnODdZMWMv?=
 =?utf-8?B?ZTIyZi92MGhKQ3VwaGh4N0VQMFpCYi9jRXFyV3h2WTJJR3RQZW1teGVrTkVC?=
 =?utf-8?B?Q0pyVFJZQjM0V1lhUUFPeDY1c3g5cnp4MTF5K0cxOTVDNE8rRFljRGMxczJX?=
 =?utf-8?B?ZEk3TU5vQ1N2cklhclI2TWQ2QmV1R1BocmRtK3FMVlhTVy9IVEQ5dmlPQlJC?=
 =?utf-8?B?Y2pFL3JUQklRYk9NMzBjZjlZTVlkelRydy9JUFVrUWxlRklvL0RIdjBBSHZN?=
 =?utf-8?B?aDlaa1J4VytOMDA2VVZRbVNqa0xoZ2E0VndiVFQ1dlBoSTNub09lMXFRRk9J?=
 =?utf-8?Q?77ihNKK6zrI3DR76wma+BxcxHerfW/nlUb6LpLFldySG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebcb8330-41ef-40c1-28cd-08ddbacc10f5
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 07:26:17.8124 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FT/gCCimlLxnUxZasgUZ18MFADARXTLwYlK21X74aiuyWVJMn6TfzUAEP7fYIu8rQ/dmK9hPGh1QBKKvPofrSw==
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

Having registers that can be interpreted identically in a contiguous I/O
area (or at least, following a given stride) is a common way to organize
registers, and is used by NVIDIA hardware. Thus, add a way to simply and
safely declare such a layout using the register!() macro.

Build-time bound-checking is effective for array accesses performed with
a constant. For cases where the index cannot be known at compile time,
`try_` variants of the accessors are also made available that return
`EINVAL` if the access is out-of-bounds.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs         |   2 +-
 drivers/gpu/nova-core/regs.rs        |  15 +--
 drivers/gpu/nova-core/regs/macros.rs | 191 +++++++++++++++++++++++++++++++++++
 3 files changed, 200 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 8e32af16b669ca773e63e184d34c3e0427bc9b76..d4a0dc2e9a6a3cef368e2f577271f659f0f2c71b 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -221,7 +221,7 @@ fn run_fwsec_frts(
         fwsec_frts.run(dev, falcon, bar)?;
 
         // SCRATCH_E contains the error code for FWSEC-FRTS.
-        let frts_status = regs::NV_PBUS_SW_SCRATCH_0E::read(bar).frts_err_code();
+        let frts_status = regs::NV_PBUS_SW_SCRATCH_0E_FRTS_ERR::read(bar).frts_err_code();
         if frts_status != 0 {
             dev_err!(
                 dev,
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index e6382c116adf699ab24de097c15ddca08017b36d..95b2c0d6b88f3b04af96f07c055c539870649937 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -44,8 +44,10 @@ pub(crate) fn chipset(self) -> Result<Chipset> {
 
 /* PBUS */
 
-// TODO[REGA]: this is an array of registers.
-register!(NV_PBUS_SW_SCRATCH_0E@0x00001438  {
+register!(NV_PBUS_SW_SCRATCH @ 0x00001400[64]  {});
+
+register!(NV_PBUS_SW_SCRATCH_0E_FRTS_ERR => NV_PBUS_SW_SCRATCH[0xe],
+    "scratch register 0xe used as FRTS firmware error code" {
     31:16   frts_err_code as u16;
 });
 
@@ -110,13 +112,12 @@ pub(crate) fn higher_bound(self) -> u64 {
     0:0     read_protection_level0 as bool, "Set after FWSEC lowers its protection level";
 });
 
-// TODO[REGA]: This is an array of registers.
-register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05 @ 0x00118234 {
-    31:0    value as u32;
-});
+// OpenRM defines this as a register array, but doesn't specify its size and only uses its first
+// element. Be conservative until we know the actual size or need to use more registers.
+register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05 @ 0x00118234[1] {});
 
 register!(
-    NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_0_GFW_BOOT => NV_PGC6_AON_SECURE_SCRATCH_GROUP_05,
+    NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_0_GFW_BOOT => NV_PGC6_AON_SECURE_SCRATCH_GROUP_05[0],
     "Scratch group 05 register 0 used as GFW boot progress indicator" {
         7:0    progress as u8, "Progress of GFW boot (0xff means completed)";
     }
diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index 1f0375d20b5f4328d496a14120eea8a54123f8cc..af432f0535d2944fa4609f4a44c98a0b1394a2c0 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -132,6 +132,53 @@ pub(crate) trait RegisterBase<T> {
 /// // Start the aliased `CPU0`.
 /// CPU_CTL_ALIAS::alter(bar, &CPU0, |r| r.set_alias_start(true));
 /// ```
+///
+/// ## Arrays of registers
+///
+/// Some I/O areas contain consecutive values that can be interpreted in the same way. These areas
+/// can be defined as an array of identical registers, allowing them to be accessed by index with
+/// compile-time or runtime bound checking. Simply define their address as `Address[Size]`, and add
+/// an `idx` parameter to their `read`, `write` and `alter` methods:
+///
+/// ```no_run
+/// # fn no_run() -> Result<(), Error> {
+/// # fn get_scratch_idx() -> usize {
+/// #   0x15
+/// # }
+/// register!(SCRATCH @ 0x00000c00[64], "Scratch registers" {
+///     31:0    value as u32;
+/// });
+///
+/// let scratch_0 = SCRATCH::read(bar, 0).value();
+/// let scratch_15 = SCRATCH::read(bar, 15).value();
+/// // This won't build.
+/// // let scratch_128 = SCRATCH::read(bar, 128).value();
+///
+/// // Runtime-obtained array index.
+/// let scratch_idx = get_scratch_idx();
+/// // Access on a runtime index returns an error if it is out-of-bounds.
+/// let some_scratch = SCRATCH::try_read(bar, scratch_idx)?.value();
+///
+/// // Alias to a particular register in an array.
+/// // `SCRATCH[8]` is used to convey the firmware exit code.
+/// register!(FIRMWARE_STATUS => SCRATCH[8], "Firmware exit status code" {
+///     7:0     status as u8;
+/// });
+///
+/// let status = FIRMWARE_STATUS::read(bar).status();
+///
+/// // Non-contiguous register arrays can be defined by adding a stride parameter.
+/// // Here, each of the 16 registers of the array are separated by 8 bytes, meaning that the
+/// // registers of the two declarations below are interleaved.
+/// register!(SCRATCH_INTERLEAVED_0 @ 0x00000d00[16 ; 8], "Scratch registers bank 0" {
+///     31:0    value as u32;
+/// });
+/// register!(SCRATCH_INTERLEAVED_1 @ 0x00000d04[16 ; 8], "Scratch registers bank 1" {
+///     31:0    value as u32;
+/// });
+/// # Ok(())
+/// # }
+/// ```
 macro_rules! register {
     // Creates a register at a fixed offset of the MMIO space.
     ($name:ident @ $offset:literal $(, $comment:literal)? { $($fields:tt)* } ) => {
@@ -157,6 +204,35 @@ macro_rules! register {
         register!(@io_relative $name @ $base [ $alias::OFFSET ]);
     };
 
+    // Creates an array of registers at a fixed offset of the MMIO space.
+    (
+        $name:ident @ $offset:literal [ $size:expr ; $stride:expr ] $(, $comment:literal)? {
+            $($fields:tt)*
+        }
+    ) => {
+        static_assert!(::core::mem::size_of::<u32>() <= $stride);
+        register!(@core $name $(, $comment)? { $($fields)* } );
+        register!(@io_array $name @ $offset [ $size ; $stride ]);
+    };
+
+    // Shortcut for contiguous array of registers (stride == size of element).
+    (
+        $name:ident @ $offset:literal [ $size:expr ] $(, $comment:literal)? {
+            $($fields:tt)*
+        }
+    ) => {
+        register!($name @ $offset [ $size ; ::core::mem::size_of::<u32>() ] $(, $comment)? {
+            $($fields)*
+        } );
+    };
+
+    // Creates an alias of register `idx` of array of registers `alias` with its own fields.
+    ($name:ident => $alias:ident [ $idx:expr ] $(, $comment:literal)? { $($fields:tt)* }) => {
+        static_assert!($idx < $alias::SIZE);
+        register!(@core $name $(, $comment)? { $($fields)* } );
+        register!(@io_fixed $name @ $alias::OFFSET + $idx * $alias::STRIDE );
+    };
+
     // All rules below are helpers.
 
     // Defines the wrapper `$name` type, as well as its relevant implementations (`Debug`,
@@ -490,4 +566,119 @@ pub(crate) fn alter<const SIZE: usize, T, B, F>(
             }
         }
     };
+
+    // Generates the IO accessors for an array of registers.
+    (@io_array $name:ident @ $offset:literal [ $size:expr ; $stride:expr ]) => {
+        #[allow(dead_code)]
+        impl $name {
+            pub(crate) const OFFSET: usize = $offset;
+            pub(crate) const SIZE: usize = $size;
+            pub(crate) const STRIDE: usize = $stride;
+
+            /// Read the array register at index `idx` from its address in `io`.
+            #[inline(always)]
+            pub(crate) fn read<const SIZE: usize, T>(
+                io: &T,
+                idx: usize,
+            ) -> Self where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+            {
+                build_assert!(idx < Self::SIZE);
+
+                let offset = Self::OFFSET + (idx * Self::STRIDE);
+                let value = io.read32(offset);
+
+                Self(value)
+            }
+
+            /// Write the value contained in `self` to the array register with index `idx` in `io`.
+            #[inline(always)]
+            pub(crate) fn write<const SIZE: usize, T>(
+                self,
+                io: &T,
+                idx: usize
+            ) where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+            {
+                build_assert!(idx < Self::SIZE);
+
+                let offset = Self::OFFSET + (idx * Self::STRIDE);
+
+                io.write32(self.0, offset);
+            }
+
+            /// Read the array register at index `idx` in `io` and run `f` on its value to obtain a
+            /// new value to write back.
+            #[inline(always)]
+            pub(crate) fn alter<const SIZE: usize, T, F>(
+                io: &T,
+                idx: usize,
+                f: F,
+            ) where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+                F: ::core::ops::FnOnce(Self) -> Self,
+            {
+                let reg = f(Self::read(io, idx));
+                reg.write(io, idx);
+            }
+
+            /// Read the array register at index `idx` from its address in `io`.
+            ///
+            /// The validity of `idx` is checked at run-time, and `EINVAL` is returned is the
+            /// access was out-of-bounds.
+            #[inline(always)]
+            pub(crate) fn try_read<const SIZE: usize, T>(
+                io: &T,
+                idx: usize,
+            ) -> ::kernel::error::Result<Self> where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+            {
+                if idx < Self::SIZE {
+                    Ok(Self::read(io, idx))
+                } else {
+                    Err(EINVAL)
+                }
+            }
+
+            /// Write the value contained in `self` to the array register with index `idx` in `io`.
+            ///
+            /// The validity of `idx` is checked at run-time, and `EINVAL` is returned is the
+            /// access was out-of-bounds.
+            #[inline(always)]
+            pub(crate) fn try_write<const SIZE: usize, T>(
+                self,
+                io: &T,
+                idx: usize,
+            ) -> ::kernel::error::Result where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+            {
+                if idx < Self::SIZE {
+                    Ok(self.write(io, idx))
+                } else {
+                    Err(EINVAL)
+                }
+            }
+
+            /// Read the array register at index `idx` in `io` and run `f` on its value to obtain a
+            /// new value to write back.
+            ///
+            /// The validity of `idx` is checked at run-time, and `EINVAL` is returned is the
+            /// access was out-of-bounds.
+            #[inline(always)]
+            pub(crate) fn try_alter<const SIZE: usize, T, F>(
+                io: &T,
+                idx: usize,
+                f: F,
+            ) -> ::kernel::error::Result where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+                F: ::core::ops::FnOnce(Self) -> Self,
+            {
+                if idx < Self::SIZE {
+                    Ok(Self::alter(io, idx, f))
+                } else {
+                    Err(EINVAL)
+                }
+            }
+        }
+    };
 }

-- 
2.50.0

