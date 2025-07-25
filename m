Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B824B11F5C
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 15:29:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDB6D10E09A;
	Fri, 25 Jul 2025 13:29:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZUppcE9c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2081.outbound.protection.outlook.com [40.107.92.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51FC010E09A;
 Fri, 25 Jul 2025 13:29:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ktyinlOyiFMrhgxpYnlO2tFDasDvpdYLpnwetu3UcfZQO3VYEmUrZlRHjHbzWn6xPAw6hz6Tn1RW/lFrnvLiEuYZjH0HYSQguy/Bxtyjr3JahK0lxM7CRbtFMrfRdaD1Gf+oj1VXGItiixiGSZlDTw0qRaY7nCepnEa7foViT2kceuqzazOiW2BGDvx7uIRCTKGQlKn/uigLEewb7NN9cbA470/SpzSK+4H701+RYsi0WRe0hQT3BvkV4mgxgYC6c7IiQVH8kF8hr11DUWsGqM/w5SfEZwbEaLkt6SA72WqSTRy+6wsvMubq8MvV4antXmABwcOOGMjs4amMOBWcGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iYcEH19z3dv/wn7vdztu2Au/nxhgZB9kQutEwHmYpqw=;
 b=aZZTvudaxy2vBvWG9dOnQo/yjwqO2eGkPM6iBa3oQoKWSgZ/RMcSt4laZMogZjSwPkET2kUvHnS/Fb548jtnttwtRJXm+7YCSXFhMviHiWubivYd2V54Q6m767UJGoT2YRjtDpa1L2qDrrib8yZ/lpECxvONA0CIGGe1iMk2DP0Tqi5ZPO0/rOxcnvw+OMiayZPhL29+Y9zGMZ/AHVyrEzszvd1ge1kB5G2N1bhoxsvYGuWBRLYbhxXPPbhCULKMUxdaC/Bpe7xeO6Jn5SNXkVRNzYsu7egotJx3qIRT1KUDUYnhyeNU5LAcrvAbaHD8JHLzuuUsa+tSoDGI0OsnuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iYcEH19z3dv/wn7vdztu2Au/nxhgZB9kQutEwHmYpqw=;
 b=ZUppcE9cc5wFAMCBQZfLyDIyQmmedGKooZAgdfbrHHVZNFgc9Q8PH16m6TWMul/GGTYAWlnzrYLPMjLEB/CLxwGKX0w2rE6WOr2017ciQWUXTqPNyo77U2ehAU8rUwgsFgDMfLFiwKY35LJ7icgfYjuTdo6crtsIH2K3RkZYYo559a54oxlU/7OPUQN/f/asL32Mxr2qf1Ud65SjVSkTwUYFfd4RaG81apcZmuaxoHc1SdR7BUrpz1wX89P/d15X66V//h9xnV4X8uuRgaCdsYOVnc6pgICIszwBafxs1DBACzqEAX23bmqc89b5yti+gAbdilCxvX6RtzbO6fBPmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN2PR12MB4110.namprd12.prod.outlook.com (2603:10b6:208:1dd::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Fri, 25 Jul
 2025 13:29:33 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8964.019; Fri, 25 Jul 2025
 13:29:33 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 25 Jul 2025 22:29:29 +0900
Message-Id: <DBL67JFXKRSM.6LAXH8G7ZZEM@nvidia.com>
Cc: <rust-for-linux@vger.kernel.org>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] gpu: nova-core: vbios: use size_of instead of magic
 number
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Rhys Lloyd" <krakow20@gmail.com>, <dakr@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250718073633.194032-1-krakow20@gmail.com>
 <20250718073633.194032-2-krakow20@gmail.com>
In-Reply-To: <20250718073633.194032-2-krakow20@gmail.com>
X-ClientProxiedBy: OSTP286CA0026.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:216::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN2PR12MB4110:EE_
X-MS-Office365-Filtering-Correlation-Id: fde742f4-3456-461e-063f-08ddcb7f4ab3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|10070799003|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dnk1REp4R1IzSGN4YzVhYVkreitOREUrTko4TG91Yy9EdDdTUjRyTkdaT1dI?=
 =?utf-8?B?amg3OWlWWGxRdC96bnZhOXh1UG9BbDBFTWdOQkQyU1J4WW5ZeUIrOFV3ZkhC?=
 =?utf-8?B?NE5heVYzbEJKNVByY0ZoTjdZM1drMDVKRkpZaStmYzVxRTlzbitsWXh1dHBK?=
 =?utf-8?B?U0dWcVBnSEdvS1BlU1BvUTBLU0drbVFhRzZoOEJBeENoZmhUelRHMHVxOURT?=
 =?utf-8?B?ZUlvSTFCdW52OFpvbFoyMEVFb2xVOHBsYnQrR2hreER4SzZZVGRZM1RPcVZS?=
 =?utf-8?B?Qkg3ZldEVjJVbzBFL0FQTHE0THlVSFV5VDF5WGtubURITnAyNnZOYWp1Zjkx?=
 =?utf-8?B?L3pVdUF5NXM5Mk5Sc3VPcEhOWGxTc1dPWUd6dldtTVlYWjhOOHl6eitSeWZR?=
 =?utf-8?B?cnU1S2xCZnpSUVlXYkNsVU5aK1JQSDRaZlFORTZXVEJUYndsc0VCOS93T2g0?=
 =?utf-8?B?NGRPL0FjMUNvamhOWTVtTXB2LzdjUmhjVCtTclQyeHJVSUdBV3ZFR0pMWVRJ?=
 =?utf-8?B?dDNKNEFSazVOZjNtVzFQZVc0NytCbnlLS0VKUThDLzNRL3c1UTJBNWdDNG0r?=
 =?utf-8?B?aUJkbnJ5Sjg5K25qa1JFaG1SNjZCVEZ6V0Y5Z212dXVpYzJXbmdKSFZPZEZY?=
 =?utf-8?B?cXZla0g2aGpnRlRmMTZ3TzRIL2VjNzVUNStCSmxSYkEyRG9CMWY1amlUanRy?=
 =?utf-8?B?eFlzYVBUWXJoUUU1d0RGaXg4L2owendPV05odWVZQnZ3Vjg3eFd4bUkra1NC?=
 =?utf-8?B?SFJSekJWTEY0T3hZMFZ0QzdFYndVQ0ZtdGtPM3M3amN5VU1FVk5Qemp1ZXlZ?=
 =?utf-8?B?N0pRSlErSFpMUGdrV0Nac21xd0FnanhUUGdobUNJRUluY3JrbjNsQnNHem14?=
 =?utf-8?B?N1VNWmRmOXZLUURGbGd2ZktCdExIQjFZY0JpQXdrWnduS1dDcGN1K2NsdEpw?=
 =?utf-8?B?TWNZOUxrSGtZUUNJWUtSRHF6bDEwVXhjTDdCN3NRSW1hdk00eDY4WEFHemRC?=
 =?utf-8?B?V1Q5c3BZQ1RlYmgwNDV6a3h1ajJ3QjRUMVE2U1lGWWVZQ2VtMTVYRkNUNW9S?=
 =?utf-8?B?TG95TEFKa2FoTDUvd2FRSmpkVzhlL00yazdvU1BWVmI2RFVDWUl2c1d5TmJO?=
 =?utf-8?B?RXBjOTZsQWErb2hBWDNKbFc0dWwrcVo1T3B0bjBlaktRQWJDby8rNTdwckdL?=
 =?utf-8?B?UzJCTms2UGFvaUpYWUVmamhyUy80aHVRdjZURTZxaUZrNEJIUExILzViYnRR?=
 =?utf-8?B?UVVhNVFMYjlzUEI2RFVkdFNQa0lnZW9wOFphYVY3Nng3Sm9FK1lkcHBXRURJ?=
 =?utf-8?B?MFVsaEMrLzNUbkpEK2NWVFo2a2pEQmx3RytiOUtleWdoZllaQS9wMzRCOVll?=
 =?utf-8?B?RXRaOE1SQ05KZUZOTG93dWFaOU8xRlh5aFhrZFovVHlxaXB4ZGRXMWtWMVRV?=
 =?utf-8?B?U0Z2V1d5QzFROGNPeWJPS0ZKa1dWVEhjS0xKbHM1NUlQOHBtYmtmOGJ4dS91?=
 =?utf-8?B?N3phK3pibDdOaFlRMHJUUnhUaDlVTGpBNFNlL0hjN2pzZGVZQmZxQ2UrQmdL?=
 =?utf-8?B?cS9aOGVWVDNDRW5iS0tWTjUvQjVyVmRMcnJTcHVXSnZJRGczOTRpaUQ4YllZ?=
 =?utf-8?B?NzJwc1FLTUtqMlo1WkluUDBITEttQklhSnQxekU4bHN5UjNCT3NYUzFlemtv?=
 =?utf-8?B?RzR3dk5aN0JKY05PNTBMV2ZsMGtZRmxXalQrc3RPTk5KTnplOEdnY3NjM2hE?=
 =?utf-8?B?cElrc1RPd1B2Qy9mU0lOODVzb1RJNTNSZFNFQUVhOFJRT2tUTTVtb3NyZXRO?=
 =?utf-8?B?S2dodmNPUHJMSllubnY0N1c0MmRiWkFGcmFFUkREcGk5Z0FVTlVnQS8ydTlq?=
 =?utf-8?B?S2VJZUhxU1hDUjFwV2NQZm1lK0tuaml2WVJWR1hra2crU3c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFp5ZTRVRTFGVXJ0K2pBZm5tb2xXOWRXZFBRb0tPOVhEODhPNG9ldE5aZWRK?=
 =?utf-8?B?WTJ5clF3NXhlYmppVG5KU2oyUW9YN3BHZzB2NmxpNXJVMjZCeWdpN010d2Ru?=
 =?utf-8?B?NkpVdzlOeFArdURVS0d4UEhhSXgvaGwya0dtOVQvQnBVRnpxZWdDaXkrblJP?=
 =?utf-8?B?R3FFSmc5THhqSWJmcFZZcVlIejRsYllXRWswdzlMdllzSEpWa2I4NjFZdExR?=
 =?utf-8?B?U3NVSU9kQ1UwVklTVDUxVzJMbG9FTjVTRkxzVzRDWDdTZll5dWxpWUpvZXZB?=
 =?utf-8?B?THVMdUExU1NyUjVlSmZqdWtUNitreVJ5UVNnVW5FUzdoeDJMZHpoVlVub1NQ?=
 =?utf-8?B?d2h0SlpETSsrNHNkWThXU3lqdFJ5Lzd2Y0FuWkVjWkFFMTIzOXpwdUNNbVN3?=
 =?utf-8?B?MmNRdTJEK1RFNmNXTG02SDk1eTFRa1hGYnhGZGVaQjV2Wkh4NnBMVlBWQSsv?=
 =?utf-8?B?M01kbk5qdHcwNXc0ZkdGdkVCWFJobTkza01hWDZOS1Rad0Y2cldYN3M2UVYx?=
 =?utf-8?B?QUFyWlIwSWxkRHFIdnlGajBjVTVjNVhwSUpYQ20zR09wbHdYblRzQXYxL282?=
 =?utf-8?B?T2l0UFAwTkE5UGxoM2JlNUR3ZjJRaXRrS2F5TEkvVU1oeWd2R3pZQ2dCenZw?=
 =?utf-8?B?SEgweEFlUVJnTnplQnAwenc3SjcwbDJGTnpxdVoxdndRaHJPL2czdXF1WU4r?=
 =?utf-8?B?WGdZMVVzT2tFT0xXYnFRclNWODA4blJYa2Fib0d3MUVQRVJzd3RqanNKUURi?=
 =?utf-8?B?Z2tCM1BVRytlU2F3d1lQT0Fxb2ZGaXlYZXdRRkdqTkpEYU04a3I4MFM1MWtu?=
 =?utf-8?B?Q0xPVXQ4VW5wb1dscjVJd1Q5NXZSMFNUa01za0ttSkhIU2liSE45ZG5lSmR0?=
 =?utf-8?B?OThDZk1zbmVwYWt5UmVEa0YwalVLWVluTnFER3lTV2dPb2N2UTJ3UENYaUU3?=
 =?utf-8?B?MWRaQ0k1RHNsaDh6UHBZaHNDWEtSaGxCVnVBak84Z3EvZHd6Y1NpNzV3YUhs?=
 =?utf-8?B?ek9QMHhPSDlreFpWd0gycjBNdEFrUGFia2JlUWh1aWhBdE90bmVteDQrRzlV?=
 =?utf-8?B?MkI3T1ZhK2dZTEtRY1dralpOaTdERTBLVWJPYzNVb1R3N0x0T1V5SEs2cFpv?=
 =?utf-8?B?U1VLeEZFR1E0d0NseWpoYTJ6ZjdXTEtWT1JMclVCUmNUY216N1hRWmlyRDBs?=
 =?utf-8?B?dlJEa3BKeVhodTdIUzFjTWpMbkE1TXFzWWVvWk00UVQxYWdPK0x6VlN1amRG?=
 =?utf-8?B?S2xNN2FWeVg5Ull6VDhJWGptUnZpbFdEK01ObU0yRndiTC9iWHE3MVM5dlZq?=
 =?utf-8?B?T2g1MUZDZFlKSTJYcStNOVI5T0JVUUoxYWdaVjU3cUpzNEVkcnBVejlpcU01?=
 =?utf-8?B?ME15WW8wTFc5ZFI3Z3ZIOHRwaVVpODNoY09haGFYSlYrU2ZhMC9Fbm5sc01G?=
 =?utf-8?B?WlR3MWxjcVY3WjFhVVBEVkwrdFFZaG9mNnFkSlJsa3FBU0lrT1lGTGx2bkpV?=
 =?utf-8?B?aG56OG5CdlIrS2RhRm94MlBsQ0J3WXBPZ0FyNUtlK1NSN0YyTWYrcGNyUmZ3?=
 =?utf-8?B?c0xOQkpGbS9vbWIyTUl5eVhNeGt4ZVBSRFZWSGdiWkZ1aDI2cDZONmZyRFZF?=
 =?utf-8?B?MFRiYnY2WjVLRnJ6Q1BjZlRNNEVyZEQzRnE1cDJxZnZVRWdPUG1qbkpyQVZN?=
 =?utf-8?B?UUJ0Z1BURlV0QTFyak0wYUdLaUhrUCtZOHlPS3dDTVZOcWlWN29nRGhtQlU1?=
 =?utf-8?B?SDBlZTkySmdQUWl1N0RDWlAvY3ExY3Y1UnN3Z2Z2Qlc3elpIQmR4bnRqMmha?=
 =?utf-8?B?QVRBT3RHWDQweDZIeTBaaGVyc3gxVkpjbzBDRHUwak54aWZqODhlbmNUMldi?=
 =?utf-8?B?djFQT01TN1plUFFIdUZpb0lZc1NQL0NlWFk2blRuWVNvem0rdHZMeTd6QlEv?=
 =?utf-8?B?NGk4d1c4N3R4aVpSdkYvSDloUVdiVlovNFhNRjZBQ3VMSFd6cVJMMVVnQWM3?=
 =?utf-8?B?clJVSmcrZnFKT1lYM041emxQVVIxZExON2dpVi93djB4L1JMNXYzN3FtUVdJ?=
 =?utf-8?B?Wm1NOFpzWUpvY2tNZEtSb0lSR1Nyc2NLT3JEcGlJaGV5YWFlN2c5Nm5ESHov?=
 =?utf-8?B?a2JudnRIN01LREhiVU5MOWhybmErTFYwbUNPK05SUzJFSnJiMnh0RW1VcGZW?=
 =?utf-8?Q?9wzo2f9+ih0OGzStlCje/GzAmCFBtmpHrt1NjxHTKqsU?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fde742f4-3456-461e-063f-08ddcb7f4ab3
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 13:29:33.4106 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1DcNwEwwRt4YmGVJbc8O55u6DeNHviwSUvFyPwncPWTN/KEK6CV/bj2ULiJbyWPqfSpbp9EKOSZOvrlaCZqx6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4110
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

On Fri Jul 18, 2025 at 4:36 PM JST, Rhys Lloyd wrote:
> 12 is identical to the value of `size_of::<BitHeader>()`,
> so use the latter instead.
>
> Signed-off-by: Rhys Lloyd <krakow20@gmail.com>

Looking good - I'll push this to nova-next unless someone complains.
Thanks!
