Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AE9A77944
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 13:03:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4632489FA7;
	Tue,  1 Apr 2025 11:03:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UxTFPNTe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2042.outbound.protection.outlook.com [40.107.223.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8795110E2C2
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 11:03:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KwtoeOcWPGgAcWVMfozNVDEe5ObpHXuYhsSpDK+xubPMVqjrTdzsVMQpslK6Z/UFEIRCTg/VGHlG5ayJvowbnqrDsNL12T21UeeTO/7VEO8L+7rw10tUAZ8oey0z7P7UtAgFcnrDzllXbMDaxpXn7oJZQjSlYKBXpRC1YZqrfCCgw1K4NtAa/UJmLA7rjKDKbPre+RlAmVZ+evXbwp8yd6A/vuGqdurtA1CvZ1NdUdyQWOfAC+OOEuRt+VxiTHhMkiBghFqlI6v3OW+84kzZ700VA3FL2i5IVOatEIMmqT319m9IGRcJKfIU2XCp/iVtyxr45Dtg5WS1LNvTy6fvSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n0jdkrSUxkbvzJ4eiEo3Se/YQpwiF3vG/Bcp+ZAVlmc=;
 b=xoHbUwAewsRA095zlrKwi8X9pil9bMLMULz1i639EdroIYFft2VRbR+JPEonxfCp3WUczsdRqTY6f0vKE/lrsH2P4fq8XFS9IwMzcE5j/XZO03DSeN/1idWua2yO/PRnHM5FF2/ZLuxfuwVBN2GImDnqTkGRXccfstgIwrVL3bFwtiTrHXFHHSd9HuW/x2ubEwnKXGtjKEY4Rnjq1USAVeGluiwWjypDEKWKPX/MBAppqsWvTAlMe4/zuN1POMjSGrFM8Yih96hlu20IMUGsxVfPZYyRK1NtdfXMxktxHL67V+dX+Yafnm0QnW2gt1dJHSUkeLzGQ0mCip/BF1Zbkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n0jdkrSUxkbvzJ4eiEo3Se/YQpwiF3vG/Bcp+ZAVlmc=;
 b=UxTFPNTeKTx5NVhkYWtUJ/7AOpkwxzmwkABJ4GNh7n0x92vmsPj4yLr/kZqQlCCTqRxwazRpXw5k1c/VQ9HGVc7uQNMSLuUpfb5a0fTZMq5CgwMK15FvI75+4tE4nJkFt/emLQqQk6SxwTECqsXjuMJ1qK/OP/NjPhGU+eVRP0s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB6351.namprd12.prod.outlook.com (2603:10b6:8:a2::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.44; Tue, 1 Apr 2025 11:03:43 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8534.043; Tue, 1 Apr 2025
 11:03:42 +0000
Message-ID: <e08f10da-b0cd-444b-8e0b-11009b05b161@amd.com>
Date: Tue, 1 Apr 2025 13:03:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 00/12] dma: Enable dmem cgroup tracking
To: Dave Airlie <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Tomasz Figa <tfiga@chromium.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Ben Woodard <woodard@redhat.com>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20250310-dmem-cgroups-v1-0-2984c1bc9312@kernel.org>
 <f5fdc666-dd72-4a4f-9270-b539a3179382@amd.com>
 <20250310-eccentric-wonderful-puffin-ddbb26@houat>
 <CAPM=9tzkLXOz=-3eujUbbjMHunR+_5JZ4oQaqNmbrWWF9WZJ0w@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAPM=9tzkLXOz=-3eujUbbjMHunR+_5JZ4oQaqNmbrWWF9WZJ0w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB6351:EE_
X-MS-Office365-Filtering-Correlation-Id: 37874360-f8aa-4bf1-57a5-08dd710cdd75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cHo5WjdZZzYwbGZpdFpwb1F6Vm5HMjBBeGRFNSs4OVBlRzdac3dXWGRDL3RQ?=
 =?utf-8?B?dXpSbDhXTGtlUG9qdHJyd3dYZWp2NFRCQk1DVWNqRklqSGJIOWIzRktTczFR?=
 =?utf-8?B?V1RLQjIxSS9MeFZycEg0OWlmYW5OdUdlOWthbjV0WTl6QUE0U1FOWC9zdjN4?=
 =?utf-8?B?NVhQVzNNWXNJT1NJRWdlQUY5SVY5RWkyd3hxamdoY2d4d0NmOHI5Njd2cTRi?=
 =?utf-8?B?eUxMQTJsbTlYamJobWhTaXF4ajFYM29Ya3FyNDkzd0JpZ1NFRmZydzd0OHN5?=
 =?utf-8?B?SXIyZlRiWDlOVUhXRkhYblVqWDhwNVAvWTJiaWhjRU1VMlJMbnQ3b3UyN0RQ?=
 =?utf-8?B?N2FzUlZ1SGdIb3daTzRObTZpRkpYRktRT2h6Y2F3eTFzR1A0S1Zhc1UyVDAr?=
 =?utf-8?B?Z0dTVE5qVFpQY1JxN3NaMjdMdkxPU3gwc09zNHJIQXY2SEZYclNGMS90dXRI?=
 =?utf-8?B?YjA5cWpVd1BsWmxqQkIwK0dKQmRtbXdmcmY3Yms3Z3phejVpa0dVWU53djdQ?=
 =?utf-8?B?Y0tlenVibnZrdUFHREhoZitJQUc4OHcxUHpwVkxobTlPOUhtS0doVk53eFZS?=
 =?utf-8?B?ZlJpZk00bXl6bVpkYWZLZS91UjB1eUxFWWppN1NjUHlaYU9DVVJST2E5SHlS?=
 =?utf-8?B?UmFzSC9vUTZub295R0tWNFZ6OG9nMXNjeWZYajVrNjhERGpiajBqTmJzeE1O?=
 =?utf-8?B?SEx1c3kxT0ZubWlOZVJHK0NLdWxvZFVNbEM3UmFFbkMwdnhhRUNoOTdwbkRO?=
 =?utf-8?B?djJSUU52UkdrKyswemZWZy9qZGNOaFh3bmtTRTB0cXQ0VEFzUitJb3JYamtv?=
 =?utf-8?B?ampCZ0lncmh3K2FFQnprZVh2TWtycVFPZUFjS2w3YU9vV2UrK3Z6V01DM0hD?=
 =?utf-8?B?aEI0Z2thSTBXRUpNUERVdkhXWWxtT0JzbWhHQXU0bXloOWlRZ0xQVW16Qi9I?=
 =?utf-8?B?UW9lbWhBQ0VlZGxFeUxlWnR6YTJlM1gvaWhRTUp5dHBKOG9YRVZ3NW1FNG1E?=
 =?utf-8?B?TXNSUXVrQlRkWnZ5MnlBQi8wWXlFTVY3MCtmeVZBbUFLb1Z0Ymo1RWZ4dTBj?=
 =?utf-8?B?OE9NazZaTURPNjlZSEgwK1JRb2doK3FyQ0NOY1hqcy9UY2t0K0hBU2VuRzhE?=
 =?utf-8?B?bndRMzBmVmRtUHFPUWtnNC9ZUzEvT0FiVGF3RGh5YXpJNk5HOFJtRkdnMUxr?=
 =?utf-8?B?MkFHZVlkeHZGOXArS1o0a1NCcmJZSWpienNmcUNaQW1NMmhwNzlGNEtPQjln?=
 =?utf-8?B?RmJVWVZrK0VhN3FXV0kwOG9YSXJMbERHOGpXRGpXNyt2NWhSMDEzUCtTREpj?=
 =?utf-8?B?ZENIMVpGN3NaVzZ0blNtQ3ptUnE0dUROWFZFcmZ5bVhtZnFOVG9FVnR2MzJB?=
 =?utf-8?B?eTI2bEdjaVNCOGhLRHdnYURXaEpCbndUNVVJWG9vUW0zM2hhRDB0aVNWLzhy?=
 =?utf-8?B?OXYvNlNBMnFJSytpMUtxeFJCckhHTGNZQktybU9UZWdRWWwwdXBJUVM3cEZt?=
 =?utf-8?B?Ykw0WlRhS3lqKzhZaU5yZ1B1aGZsNTcvVWhXNXN2c2h2azlOcUo3THUyeVgy?=
 =?utf-8?B?dlZoQWpyeTAzUnp0M1M4M2lYUzdXK0tsbGZaaXhNVG9hYWIxT3lLMDl1UXJU?=
 =?utf-8?B?RjhHT243dCtDbGNDQjVTVXZINU5zc2VtTW5KZTVtakIvZGNqQTlLWGR0Q3FC?=
 =?utf-8?B?Q2puQmZJbmVTWmtHVGJPcGFuMjRRLytkRHpBRmJJVnRkN0RGek82cDArVHJG?=
 =?utf-8?B?eGY0cGtyR1hHNkVUUk9mdTd6a3VuS1VtWEJ6VmpWWGVjZ1gwa0VzWEs1Y1lQ?=
 =?utf-8?B?RGE4S2pMN2ZqTGFnUW1hcVVMUG4yS09KbFY3K1JWR1Bsa2prWGRoNzFuQTBo?=
 =?utf-8?B?Rnltb0VnNmtESTc2a3ZhZWE3aDJpN2xQMkxiMzEzbEtVUjBzMWR1cW11Z0tx?=
 =?utf-8?Q?wNDCpm1XqEY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkJvQS9WZ1V6Z015alNUZzdWbGovRGJHS2dCR3ZPZlIrT2gzZ05nc0o1VTlN?=
 =?utf-8?B?c1BRWC93aXpxYlZZMjA3V2lNVlJhcFhSR0pibzkvbXBGaEp3eGY1YzJuSEFl?=
 =?utf-8?B?UWZCR0ZsQWpZZ1p4bFNDbFdzeFZaSDQ0UVZrK0VwTDJDdHd0Mk92d21Ld2Ny?=
 =?utf-8?B?NC8rTG1KRWJaN0p6SEp4Y0NCNUhKUkFKWTBrYzF5WjkrbFVXa0xCTWpDUXdO?=
 =?utf-8?B?UjBncHFZODB6UzYyR2gzc295azA4MldkM1ZxT0poUEpBRmwxV2Y4SUxsbGQr?=
 =?utf-8?B?Z2RUQ21hQlQyelhqQW12QXBrNTkyb1Zib0NETmRLSWorSnZWWDZveEhLZDd1?=
 =?utf-8?B?WHRWZnY1bHFmYzd1WjVUYVhZRVRsTnV2NGxSbFNzSC9RZkkybE9hZ3pteHF3?=
 =?utf-8?B?OGExTml6SEFiZmc3MXM0dFdWTkdCbFVFUDFoRnUzS2ZlckJFc0s5YWF4YTVT?=
 =?utf-8?B?ODhXdndvZnNjU042b0hVTUZNbXgyNVNOM0syTEhQQklOdUdwZ21IRkJwbnpL?=
 =?utf-8?B?VFdYblBHeVpsZTR1SU9rSTR2d1Erb0VqbC9KaGV0bGlDRmFlSHZ6MXkrMVo0?=
 =?utf-8?B?QitrM2hZS05Lb25ETi9nWW0zdlZGOExubVA4UFo3SEl2RGh6V2hONHNFRXFD?=
 =?utf-8?B?bzJUZW0xQitxS1pyakZ0cTRjR0gyU1FCM0xGVFAybkR4cHB4UHJtNy9hSWNQ?=
 =?utf-8?B?b3I2T3Z4WUlnamxLMnRubjZwZ2UvWFJmRC9RRDh3QmxLT094cXF5dXFSTW8r?=
 =?utf-8?B?N0JIVzFUWGx2RnlXUSsyUGtCUWVEY0t2UUpyZmhILzNuNmRoNnNsSmw5ZVV3?=
 =?utf-8?B?ZWlYZW9CZ1hKMDhGTitueWs1SDNwZ2pkc2dXYk5BRGVFcWRnTkV0b1dneEht?=
 =?utf-8?B?QnEzWWxGWUFWaC93d1FjakFOV0s5ejYxbWZ4OUd1cEVMeXNpWkVzSVdqODBs?=
 =?utf-8?B?amhzLzhGT0x2clNway9ncEhVbFZiR2tSQWNjU2xvMFBlSFN3R2Q3Z0dNUjVZ?=
 =?utf-8?B?TDJndUZnOGZ1UmZieFY1UjY3ZnpYQnpseUJuS3p3UzB2MDdsajNKZEJEck5J?=
 =?utf-8?B?UlUyQm5qREZpSkFEaDBIam1iZVZWRlpxVjRmMXVwLzg3d3QxSml0MlZNczV1?=
 =?utf-8?B?ZE01SUJ1Ui9QL0MweHkxS0NFcEJETG8reTNJeXNZaDY1UnFHcHR6MlhxVm5t?=
 =?utf-8?B?OUx1eDJQT29SYTYwOTlVeWN1bzFKVEh6Wi84cEcyNEdubDl1SGhVeU1GeHlX?=
 =?utf-8?B?blEveGZJd0xWMWdONDV5dlIyS244RFp3and1TlNhUXJEMFNWN3hhNjQvR0tt?=
 =?utf-8?B?eEZwbHZvTDFVTUxodmp6QlhnUUNJdm5Yc24vWm9MbGE2L05FWHlyT3lxUGxo?=
 =?utf-8?B?QW8xY1Y0QlZ3Sks5UUZVNlptbHJDQlRjcFdRZzEyZGczV3V0Zmp6ZjdFejRx?=
 =?utf-8?B?ZVhqN0grTStpbXp3SVlrZmFPRUt5RlZ3a2NuRzdLTXNEUktXaWVPVDFBZW5V?=
 =?utf-8?B?cmtCaVE3MEhjaHVsL3h1QTV0WEcrZmliK0N1MHdhWVgrRTZ2NTRuN1RkdHJi?=
 =?utf-8?B?dGdLc2kyUFFPNDk5dnZJbEhzR0hveGQrVUxGaWtwd2EvbnlpY1ZCRjBpeVV5?=
 =?utf-8?B?RGtFQWxVM2RUcVZ5SGRsd2VLRzJ5S1JCcTZLUERVa04xTEZDc01TOFhSRkhv?=
 =?utf-8?B?eWtNVk5IclBsdjErOEhJVDZqQWRrSjlMOUUvdFRSOXhVaW1reHkwZGplU3RV?=
 =?utf-8?B?VS9pOG9EdFlTMTg3QlFKYktwbzNTOTJFdjJWeGhEZU9vU0YyS1hKWmJVdTRC?=
 =?utf-8?B?d20yT0hPN1MvY29VNUNDSHVveWxsdnBzanZxZ3hyM3R5cGZzVTVSYjhMeXNu?=
 =?utf-8?B?cXY0NUZBM0FPZ0FHM3FXVHErclh0WFBEb1BjMm44WFJVejlpUU1nVkVwakpG?=
 =?utf-8?B?R2JlWkxyMXlqaTdheXBiV3Zzb2ViVTU2Y2VwWU5pN25CZVUxMEdXR1FKM1Ev?=
 =?utf-8?B?bkNJbU5Xb2VvZ2E1UVNibEJMUnhXVGRQanRCaW9yWndleEcxajZUaVhFcGpT?=
 =?utf-8?B?Wm1hV1l5TXZnKzNRbTc0YzhPdVoyWU0rWEFPMHJQMC9Oelc2eDhxUFlEb25I?=
 =?utf-8?Q?e+i5vgfD1idAayX+0KNqTzisI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37874360-f8aa-4bf1-57a5-08dd710cdd75
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 11:03:42.8668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Al4+liSQfiTTxF1+AAq7XZP+D5Sw7YW/m3U4hiIwIf0hj7XwrLgyETYit2WaCtmT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6351
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

Am 31.03.25 um 22:43 schrieb Dave Airlie:
> On Tue, 11 Mar 2025 at 00:26, Maxime Ripard <mripard@kernel.org> wrote:
>> Hi,
>>
>> On Mon, Mar 10, 2025 at 03:16:53PM +0100, Christian König wrote:
>>> [Adding Ben since we are currently in the middle of a discussion
>>> regarding exactly that problem]
>>>
>>> Just for my understanding before I deep dive into the code: This uses
>>> a separate dmem cgroup and does not account against memcg, don't it?
>> Yes. The main rationale being that it doesn't always make sense to
>> register against memcg: a lot of devices are going to allocate from
>> dedicated chunks of memory that are either carved out from the main
>> memory allocator, or not under Linux supervision at all.
>>
>> And if there's no way to make it consistent across drivers, it's not the
>> right tool.
>>
> While I agree on that, if a user can cause a device driver to allocate
> memory that is also memory that memcg accounts, then we have to
> interface with memcg to account that memory.

This assumes that memcg should be in control of device driver allocated memory. Which in some cases is intentionally not done.

E.g. a server application which allocates buffers on behalves of clients gets a nice deny of service problem if we suddenly start to account those buffers.

That was one of the reasons why my OOM killer improvement patches never landed (e.g. you could trivially kill X/Wayland or systemd with that).

> The pathological case would be a single application wanting to use 90%
> of RAM for device allocations, freeing it all, then using 90% of RAM
> for normal usage. How to create a policy that would allow that with
> dmem and memcg is difficult, since if you say you can do 90% on both
> then the user can easily OOM the system.

Yeah, completely agree.

That's why the GTT size limit we already have per device and the global 50% TTM limit doesn't work as expected. People also didn't liked those limits and because of that we even have flags to circumvent them, see AMDGPU_GEM_CREATE_PREEMPTIBLE and  TTM_TT_FLAG_EXTERNAL.

Another problem is when and to which process we account things when eviction happens? For example process A wants to use VRAM that process B currently occupies. In this case we would give both processes a mix of VRAM and system memory, but how do we account that?

If we account to process B then it can be that process A fails because of process Bs memcg limit. This creates a situation which is absolutely not traceable for a system administrator.

But process A never asked for system memory in the first place, so we can't account the memory to it either or otherwise we make the process responsible for things it didn't do.

There are good argument for all solutions and there are a couple of blocks which rule out one solution or another for a certain use case. To summarize I think the whole situation is a complete mess.

Maybe there is not this one solution and we need to make it somehow configurable?

Regards,
Christian.

>
> Dave.
>> Maxime

