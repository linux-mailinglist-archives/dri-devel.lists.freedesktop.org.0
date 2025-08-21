Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A155B2ED33
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 06:49:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC13610E2CE;
	Thu, 21 Aug 2025 04:49:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hYHZvP1L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2086.outbound.protection.outlook.com [40.107.100.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2480F10E2CE;
 Thu, 21 Aug 2025 04:49:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wv51CEA1H0J4R08CuNTFQdFJ6/bVjlLYNeqJ24la5u94Qi8Rn+WFC0uGnqOd9zvYQAnmMZ7fIN2/CT4JwfSbK/bXC70i09pr47dKUHO1iubss2uXdvaBWWtkGcOkL3h06CZFm0NTE2TaJtLmMscxu9uSksj0/+LF3o77BuHviS+UsdtJPtDCyXSuH/RB2rFagM4ctG4bPCMpQnx69cN9X3ClDX3yZw64lIoQUFSCFz8fwB3GWr51ARCJTmqu8ktA+HvK9qeRyKZwphRhUvLM46NXYr0TG3nbvv/ubJ6B7cuYHXglv11HA3/u6oIv8aBsXzHUdoJ2VqSMEq5emVF9EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yCCLTvcOu0+kDB3C5rLZPeBjiwpKAHsSig9hBnUSeZ8=;
 b=QAxOem0/pq8vwhFlysSgDFYccaoeJZsbZ8HO7xGpZx+XaVQOrOoA4lkqEUcHwhapmFznLEoHW7T+EkIdDgnZGKwi+tPR0+OO9DzNMNZL+Xn+9ntOcjwuxkZF9iOwj+IsbxO+UfFxCvVWUpfLmU5cL2B7fafPO0aICIdkgHTitYerxTnv7fIf6i53pUYvSzVI2gYGfCCh5qROwdizzl7R0vftFJ1SeBYa7a1ZMJckR7u4vH68cl8bbZYvOEQvZvfqApe6i9AO0K+HKGQyH9snTu+by4xKCpEcBkCcL4Mc0PZE0aVusS5mB9/iJHLv1vOPMkiB7uVnqmxfNDOjWi7pRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yCCLTvcOu0+kDB3C5rLZPeBjiwpKAHsSig9hBnUSeZ8=;
 b=hYHZvP1L8Lk+moXICpBKOxL3rk0Yo9a0lxbJGzKBTYFSD5YHwbUl/ExSgS1NlWSHfcsuM2g74elmnBTbwCzDvZ8mIS7bBvjVn5JSdQkN//aidx9RP4qIiEj9wA28dHb0DYhda+ye1GiJwKbTeIXIrKUGtwxtXcKRBi5+BTGf5AO7nXbNo/ZC5SAaLTw0lp4FjQQ02fY/5Y5eulX4jVBe3D6BIGgSLO1AGz/RiPoy1tMJ+5zOdcH4MdJ0H0pc/UvzqbMt06S5FPQT4J32SjH2lUqFDX3sWUDa65GhNDjqPukadOHQ5sarPxY7GjxrcRfv6OQfv72KFpb7Jq7G4o/KUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB9126.namprd12.prod.outlook.com (2603:10b6:510:2f0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 04:49:46 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9031.023; Thu, 21 Aug 2025
 04:49:45 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 21 Aug 2025 13:49:32 +0900
Subject: [PATCH v2] gpu: nova-core: falcon: align DMA transfers to 256
 bytes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-falcondma_256b-v2-1-83e8647a24b5@nvidia.com>
X-B4-Tracking: v=1; b=H4sIAFulpmgC/3WMQQrCMBBFr1JmbaQJRlNX3kOKpMmMHbCJJBKUk
 rsbu5e/eh/eWyFjYsxw7lZIWDhzDA3UrgM323BHwb4xqF7p3vRGkH24GPxib0ofJ6FpMlYZ9Op
 0gCY9ExK/t+B1bDxzfsX02fpF/t6/qSJFm6ZBSm8GIn8JhT3bvYsLjLXWL4yBrIatAAAA
X-Change-ID: 20250808-falcondma_256b-5fb8a28ed274
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCPR01CA0176.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB9126:EE_
X-MS-Office365-Filtering-Correlation-Id: eada7c04-9824-4ab8-c229-08dde06e266b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c3RxYWhzN0JMU3ZGTG1PVkJVaG1scDFPdjkyQmJ0RjlVd01kMUM5NS9yZytQ?=
 =?utf-8?B?dHEwTVA0c3F1WHNXeFV2ajZLbDI1b1BNc2JkSnROV09tdy9hL0lFVkp4REI5?=
 =?utf-8?B?Uy9iaFNraDlCU1pSZC9nUGVYN21XOUozY043aGtPb05YOHFMSHgvc0pRY0Zh?=
 =?utf-8?B?dG82RzdVTy9DSzlxRlQxTUZrd28wL1dSK1BkcWoyM21VWkNJcExRTlJ3dyt3?=
 =?utf-8?B?cUFXT1NtSjhUTVhGU1lwRkxNbklrdnZCRUNIV2hQODlIR29lMDE1dktCN2pY?=
 =?utf-8?B?dk9YN3lSRnBpd0JMR0NNQnE2eWdsOHVyVXpuTFAxbURKVklITmJwRTBjVjV5?=
 =?utf-8?B?MHBYSGdXVzhVQmR0U3ZueGF2M0tzOUtVK0JycU1xdzV1Z3FobGJLZ0ZKeVk5?=
 =?utf-8?B?b3JaTE9UNXpMeUJ3bzRrOGYxWGtYL3A1RU9oUXRaK2FSRGJ6TE9GVVJkMXpZ?=
 =?utf-8?B?eG12SGRsL2k1UFZZb2ttNEpXVjZZWXZhRlg1WEFsTW14a0twb3hTRUZlWFly?=
 =?utf-8?B?eUxkN2g0ZDJOUk91Z3FYdFNmZGRsL0RRTnBlYzlRem9ZSzVxR3gzbk1lYnN3?=
 =?utf-8?B?eVo5SDZoRUt2UEpFcFBUSERMVmk5cFY3dHR0UTlEUVpzdmVmOEhZNStiSDYv?=
 =?utf-8?B?MlBZYzZDbnkyZmZXTGV0cjVVUVZBelhXbjJFMWJzSTZVRzVSUkJDVzd3Tllq?=
 =?utf-8?B?enBSWElnbVM0VitkeDNYUkR4by8xU0VkRUF3eEZZbStaREs3WGJ3UWFERzNl?=
 =?utf-8?B?Ym1pUk1QTGt4b0l3b0ZnZVJRcW52c2dRYk1ZSFJNYUkzWkVtYlNBclBMcmsw?=
 =?utf-8?B?NlJEQ2tSN0FZYXg5NWdPdzEzd2RzREVzdFdGYUhUc0xkTFlOaE0xcEhWbFV2?=
 =?utf-8?B?YXhKci9wQ1ZBNjFiZmR5WlRwekdxRzNJOHVWZzdrbmRxWnBLV1RnaURwTkF5?=
 =?utf-8?B?akliV2RKREFianpQYU1yVEFvb2NQQ3M1N01xTGNhMGx4aGw4Y2FKSStYQWRx?=
 =?utf-8?B?bXdXMnc1MkRYdjJWS3pEdEUvUm1XRmI2Ym5PUjBuWURCRHd6WGN4UVVDZjF5?=
 =?utf-8?B?eVVqV0U3Z0FCbFp5R0Rna2RCVmV5RExuTFNTa3hYNzhGZDhEeDY2WnJBTStJ?=
 =?utf-8?B?QnpIb1IvWjlGYUMxdnEreUlhZDFiTlh5L3BKOExmbnNmYmJNUE1GazVPRkUz?=
 =?utf-8?B?dzVqQ214NlZaWjRZUXIvY3JKSVdhalFkbGVqOWRua0hVMjJJc0I4aEtpRVp4?=
 =?utf-8?B?N015ZkkyR2pKbld1KzZJenN3dGg5SXhjd003bm9sTE4rT2NZVk5OcElFQVNK?=
 =?utf-8?B?cEppRlY4cndVRFFma0QybTQ1MmRQMFhDYjcrQmZNaGkwWm0vaXdMSTFlRUlR?=
 =?utf-8?B?UzhoWVVwUFJzbE8vc3Jwck5namd3RUdGVUVET0ZxeXBRSm04eEs1bnZ1ZEND?=
 =?utf-8?B?MlZiemJpczhOQTF4MC9xZHFhMWNTTGRCMWlZcGs1dE42UzBGWEZnVSswYVE2?=
 =?utf-8?B?QVFobUZScURoakppWGk0WG9sRldscTRDRE9wVFVLYVdreStwM3hJaW40UlVH?=
 =?utf-8?B?b1lhNTBQWmFvSkpHdXRKNDJObzF0TGhDblYxeTk0Uzdqc1ZrNGFxSGhHK3V3?=
 =?utf-8?B?NHpUKzNrdmNXRUlBdXV4bk9SVnc3VFpkV01Wbm9HQ2NjSDZMSHcrazRjVFZp?=
 =?utf-8?B?eitsbFpUTmN4ejYzSnFxV1JkdXpVL3l3MXBTeEFDMENuTDMzNFNIT3k4TUZI?=
 =?utf-8?B?QmQyOVArSE5EU0tvaFBjaG9XYVJpekFiWVRKT0NEWWQ5UUtBU2xDcno2MXda?=
 =?utf-8?B?a2xGZUFzczVkY2l2TE9pT25OUkxSc3VEN0tsWnl2RVByWGRLQnR4L3Q5M3h1?=
 =?utf-8?B?d2NFUFJKOWJoZW8xSElGaGxRVWlRYnNyVWx4TzlCR2VSUko0dWJMNkRmUUJS?=
 =?utf-8?Q?ec30yBS1+C0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmhDRmNPVjQwSkQvaWtwbURySTBUY3RTbTFhN2gvTEZ4ZUZ1emJKY1oxak9j?=
 =?utf-8?B?TTM1dzNZcjQ1K3ZtMEJhYTMzai8xdnhhMUNrZWhUZy9qWUZLNnIyVU5zRTMv?=
 =?utf-8?B?TFlZQ0FBTDlSMnRaZFUyYVJiUU0zNFVmRlhITk5EdGdjdUR2VTJvWkg0U245?=
 =?utf-8?B?N3pjWWV6Z1R0Y2k2cVE5SEZnZ29udXlMUXZxTW9mWlh0bVZhSTFRZkFDZHVK?=
 =?utf-8?B?WkJ3dUo3NEZkVWQzVmhweXZEWEd3cEJpaHYrVU96Mk5LaFA4YVRTSFZUL1hR?=
 =?utf-8?B?UlY2d2VGNXBPak1hVCtFVVdzQ2QrNXE3Vnh1UzhoVStvNXNnem10blF5Qzl2?=
 =?utf-8?B?UnR3M2lxajAwcU9iQ2JsTWk3K0V5dkpKSnpGRkVGNFpTelZzbmdyN2lMVXZr?=
 =?utf-8?B?dExIMkljNE1Sd0plTmllWDJoSlpWZmxoSjlkb2U3NjM1VmxiOURYK3A2RWVR?=
 =?utf-8?B?TUtucE1NRGNJVTl2Nk9KUFJBTHR3SXlCeVZIU0RtYnpoQm9KNU4wVUZZSlN4?=
 =?utf-8?B?V1A1dVo1N3ZTdGllU1pUQkRvTzNVdUl0OHhlYkpGWFgrUXlBUFZqL2p1RDJl?=
 =?utf-8?B?bXFwdHdaMnJKUTlnQ3NBTFZJZ0tjTTFvR1UvVy8rK1hPcnhzd2FvZmlUY1I0?=
 =?utf-8?B?aktPQnExVHhibjhOcXEyNklmWUJNKzVGZnJMa09tVzNGR2I2SFVOL2NHMlhX?=
 =?utf-8?B?WjRLNjMzYlNVZlBiWDhCbW1HTTVEbkhGUndEMjF4UU13WTlLV3lhYWx6ZVVr?=
 =?utf-8?B?K1RYRmpkaks0bW5vQkxkY1h3a1pjK2pPdWhJQWV5S3R4WVhIdmpHNUJyc1Bt?=
 =?utf-8?B?SWZiQ2QyV0hJV1lWazZTUnhCSW5qb0pHc0lSZ1lRVTBmVTgxdmV0V1d0ZzBI?=
 =?utf-8?B?d1NxN1k5RFUwRmx1WEg4b1Z0Ui84V3hOOVgyVkRHTnpWL1Y4MGY4RG0yUFR5?=
 =?utf-8?B?UW5uVEFEYndmU0dDVm1SdFNwR3pXeHl3KzVPUXpEZHhDQUZLSFU0WUF5dlIw?=
 =?utf-8?B?cHMrU251ZmRYaWQ3WHhQOVZPVGhBNU5HbDNrRXhzaHB5S3k5UjlkZTlGZHpN?=
 =?utf-8?B?UFY4MU9qd040Z2UrUnRseXJlKy9zcStkUkpEOXlzTENHbjJ5UGZhd3Z3c1Bp?=
 =?utf-8?B?MW5Db1BwWWFNaUVxZFZpM2E0SHdpaCs1WlUrOXZ1MXdTK0xYZzd5aHB2NCsr?=
 =?utf-8?B?emoycFVCRjhRMlBnTnVldVAyOWg0MTFpaGVoYXQ2ZEdwUEpTcE1BMzJYRkNY?=
 =?utf-8?B?ako0THVMWEd1MFVVM3E3Y0JoKzRUZms0bEE3bnlrV0R3TVA5bEZtTGY4RzdZ?=
 =?utf-8?B?ODQ1V0pqYWh5YjdtM09CZFpCN284Q01JaUM2aWxPUDlMUzBEL0ExQmo5aVRV?=
 =?utf-8?B?K3JLOXA2RCsxQ2VGSW9UWVZYb0FrZ3BpTzlEQitwZk5PSlRTbmNaZFp4RlJi?=
 =?utf-8?B?S2FOK2ozTWpVcE1BUGc2VjcxalBzL3NyT0d5WkVmazVkSis0UTZyQmVCbFhT?=
 =?utf-8?B?R3hFN1BmOFRzQTRJdXE1Z1BsVkp4RENqYjdIQzVKMndheFlCN0w1ejM5MndD?=
 =?utf-8?B?WUpMYys1OVpwWHRHdE5tTEhIaWs5S29rOS9vY1g4MExueFhPQUNzb1lWdzlp?=
 =?utf-8?B?bkRMQXZvcVRhY2hRTUNsUXg1c2crcXY1emhxSzVSd0FKN2tqQWJsT3hXOVRH?=
 =?utf-8?B?Q2t0WTAvbStSV0g2UjExem54ODFxOUp5S29kS09RVHNMNU9OK1FKcWN4b2Vo?=
 =?utf-8?B?WE8vZUU2Umw2K0pkUndEWUVwS1Q5cG5JVTFERU1Mb0FSQ2R4QVkwcE0wb1N6?=
 =?utf-8?B?clZteS9KenlxZEtnYXZIWnpoK0N0RmZqZlQ1YWp6U1J6Lytpem9mR3ZpbmlW?=
 =?utf-8?B?aXd4YStLeDBlTDBLNUUzTFN2VTRBbjRsSmJqUFdXZHRGeCtBTlFRengxV3o5?=
 =?utf-8?B?YmtwTXZSUjFoSFQ1Y1E5SXhIZ2cyY2pIV2tROGZRWGJpWGtsUlhiMFQ0dFVv?=
 =?utf-8?B?Rk1LZmxRMDFyb3JxalphYS9Vd0Z5eDRzVHdoTkVnWnFZYUhpRW1wRncvTEcx?=
 =?utf-8?B?bHJRVUZ0ajBJQ1JjY210WisvYzZ6YW43c3lka0ptK2dCM29acEdFYWFPb1hZ?=
 =?utf-8?B?dzhVS1dPK0EvY2tBWFY3SzZ6M1lSZVVESGpEamMwRC8rcE84dDVLWTg1S0pR?=
 =?utf-8?Q?upsj8L0EAlEohoCIgii5nEiiuVi1jjsvGtEDnn2H6Aqz?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eada7c04-9824-4ab8-c229-08dde06e266b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 04:49:45.3797 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hzS4COnUnQBBnm8Y1UMMhVglHZhWEHluJ4tt4kh3PbU9+LEwt8nHMtCg+dohVVV1PQzkiFBZ+0I5ezVFRgc2Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9126
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

Falcon DMA transfers are done in 256 bytes increments, and the method
responsible for initiating the transfer checked that the required length
was indeed a multiple of 256. While correct, this also requires callers
to specifically account for this limitation of DMA transfers, and we had
for instance the fwsec code performing a seemingly arbitrary (and
potentially overflowing) upwards alignment of the DMEM load size to
match this requirement.

Let's move that alignment into the loading code itself instead: since it
is working in terms of number of transfers, we can turn this upwards
alignment into a non-overflowing operation, and check that the requested
transfer remains into the limits of the DMA object. This also allows us
to remove a DMA-specific constant in the fwsec code.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
This came up as I was writing the next iteration of the `Alignment`
patchset: the alignment operation done in `fwsec.rs` would have required
an unsightly unwrap, so let's fix it beforehand.
---
Changes in v2:
- Remove `unsafe` block by checking transfer bounds ourselves.
- Link to v1: https://lore.kernel.org/r/20250808-falcondma_256b-v1-1-15f911d89ffd@nvidia.com
---
 drivers/gpu/nova-core/falcon.rs         | 31 ++++++++++++++++++++++---------
 drivers/gpu/nova-core/firmware/fwsec.rs |  9 +--------
 2 files changed, 23 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index d235a6f9efca452cc46e2d13c61789eb00252de2..c71c1cb4144200a612cc6bd615ccc5d13192a209 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -463,14 +463,27 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
             );
             return Err(EINVAL);
         }
-        if load_offsets.len % DMA_LEN > 0 {
-            dev_err!(
-                self.dev,
-                "DMA transfer length must be a multiple of {}",
-                DMA_LEN
-            );
-            return Err(EINVAL);
-        }
+
+        // DMA transfers can only be done in units of 256 bytes. Compute how many such transfers we
+        // need to perform.
+        let num_transfers = load_offsets.len.div_ceil(DMA_LEN);
+
+        // Check that the area we are about to transfer is within the bounds of the DMA object.
+        // Upper limit of transfer is `(num_transfers * DMA_LEN) + load_offsets.src_start`.
+        match num_transfers
+            .checked_mul(DMA_LEN)
+            .and_then(|size| size.checked_add(load_offsets.src_start))
+        {
+            None => {
+                dev_err!(self.dev, "DMA transfer length overflow");
+                return Err(EOVERFLOW);
+            }
+            Some(upper_bound) if upper_bound as usize > fw.size() => {
+                dev_err!(self.dev, "DMA transfer goes beyond range of DMA object");
+                return Err(EINVAL);
+            }
+            Some(_) => (),
+        };
 
         // Set up the base source DMA address.
 
@@ -486,7 +499,7 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
             .set_imem(target_mem == FalconMem::Imem)
             .set_sec(if sec { 1 } else { 0 });
 
-        for pos in (0..load_offsets.len).step_by(DMA_LEN as usize) {
+        for pos in (0..num_transfers).map(|i| i * DMA_LEN) {
             // Perform a transfer of size `DMA_LEN`.
             regs::NV_PFALCON_FALCON_DMATRFMOFFS::default()
                 .set_offs(load_offsets.dst_start + pos)
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index 0dff3cfa90afee0cd4c3348023c8bfd7edccdb29..47f5e4524072888cc3f89520ff4beea766071958 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -202,9 +202,6 @@ pub(crate) struct FwsecFirmware {
     ucode: FirmwareDmaObject<Self, Signed>,
 }
 
-// We need to load full DMEM pages.
-const DMEM_LOAD_SIZE_ALIGN: u32 = 256;
-
 impl FalconLoadParams for FwsecFirmware {
     fn imem_load_params(&self) -> FalconLoadTarget {
         FalconLoadTarget {
@@ -218,11 +215,7 @@ fn dmem_load_params(&self) -> FalconLoadTarget {
         FalconLoadTarget {
             src_start: self.desc.imem_load_size,
             dst_start: self.desc.dmem_phys_base,
-            // TODO[NUMM]: replace with `align_up` once it lands.
-            len: self
-                .desc
-                .dmem_load_size
-                .next_multiple_of(DMEM_LOAD_SIZE_ALIGN),
+            len: self.desc.dmem_load_size,
         }
     }
 

---
base-commit: 0988099646cfc6c72a4448cad39d4ee22ad457a7
change-id: 20250808-falcondma_256b-5fb8a28ed274

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

