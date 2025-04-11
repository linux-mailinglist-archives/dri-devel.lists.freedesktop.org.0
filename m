Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C92A85E28
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 15:06:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A92710EBB3;
	Fri, 11 Apr 2025 13:06:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rhsqe5+q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2063.outbound.protection.outlook.com [40.107.94.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D57510EBB1;
 Fri, 11 Apr 2025 13:06:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U+BPeQHvxEVFnVu4lHdVlRj4Y18hZGj9cFSR5MpK4/PMDcL5aWQRNnoTR4lppc0GUVc3bgwsHMZtvelqGMb2qKy+TtM3PFLBDPH43FHbg8O3L8QPVPgfsITsWcnCnPVjlxbJ+LMRoP5Jy9TvhHi3++p/Oa2YVT7i7hO00zfdEzhlg0aasuhmXKO4mP1RSRwStOJWXzsod5N4vSrezNhnH1brraCA4EFiO6CoLItk6wIgWKYJFdFPkmYWXCF4xyXHOx5oZWy9aOuyrSwkrIREYZSg7fTuyMgWa80kL+9AlDyZFgcPvX9ix7qoN+NT4LIqNsK2/z9PoqyEJx4g/kSBgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aTMb7VnqWoHTDoqZbbtsVA5rIQLqQrii6NRN8mfueZA=;
 b=yIy7rWHYbcGcWl3EuIqKoxne07ry6Cher89JuDifs28C17SoCQlh+jiCEi2HNnntj/mTa0r1A3VzXDbs/9YzxeaIXZpS7namgN1Gi5jT38JSriVI/SGcxP9KykkP/XBbPql+CXeHjrAKbxFt+/W/i1U18v9Dyx2hSj1FQfizSevlb1edm2k71WdU3pYiZkebNPyN2Fle2kT2l5dZ0w4NRCOdZiFZP7dYjJJIVgWbDVnA6yrEaAH8HaXHwmd0srNZ4zHjPw+p/+qg+ZlcR84BZTCezwaJgWuP42IZ3P8X3T6YRCKt97HDmecETV675rItjOXqF1SPhhGidOSXZfdbiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aTMb7VnqWoHTDoqZbbtsVA5rIQLqQrii6NRN8mfueZA=;
 b=rhsqe5+qbZiP/nj2he+hqkmi1ezT0Z0/IKmUGsNTHz9DSbwRbz7uxJ6ljxyRoD2azNYlqR60AqpGgBV/EQSleb2r0OPgR0PW+Y1D4wiXJKFCbdbIv+15PSeSH7UmFK/R1Rw714MmFXD3+dktyYEw60glAcMAyixvaOk8OyR38qM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB6258.namprd12.prod.outlook.com (2603:10b6:208:3e6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Fri, 11 Apr
 2025 13:06:48 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8632.021; Fri, 11 Apr 2025
 13:06:48 +0000
Message-ID: <45d66ca4-5390-42e9-869a-f5f9125d05b6@amd.com>
Date: Fri, 11 Apr 2025 15:06:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/nouveau: Prevent signaled fences in pending list
To: phasta@kernel.org, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sabrina Dubroca <sd@queasysnail.net>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 stable@vger.kernel.org
References: <20250410092418.135258-2-phasta@kernel.org>
 <20250410092418.135258-3-phasta@kernel.org>
 <8583665a-6886-4245-be49-fd8839cfe212@amd.com>
 <c737c89c7ce9174e349c61ab4e5712eee8946f13.camel@mailbox.org>
 <50c9530d-e274-4f89-8620-16afe0981239@amd.com>
 <1a73e5fe4350d6ee4b7d807612264eb637c4f2a9.camel@mailbox.org>
 <d3dee321cd6b70d6ca98768fbcf6f1e6134c43a1.camel@mailbox.org>
 <81a70ba6-94b1-4bb3-a0b2-9e8890f90b33@amd.com>
 <aca00cb25b813da4fd2f215829f02337f05642f3.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aca00cb25b813da4fd2f215829f02337f05642f3.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0149.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB6258:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c400ddb-93c9-4066-461b-08dd78f9b7ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WHJxaWVzc0tqSDdHVWJEbnZMTmNieWNMN2haQWpOV09nbENQcnBtSU94UHph?=
 =?utf-8?B?MTVIUTF4OUNHYnlVZWtVSmZSdnBIZVJnd3FBZ0xmWEpqazRnYUUrS3FjODA3?=
 =?utf-8?B?eUpvZFZGT1A5UVFpM2tXNlAyS0NrTTA5MmtpYllRZFAvVzdZZHFaamZQMi95?=
 =?utf-8?B?NVRvOU1nZ1RiUEVucGh3bkx4QkdhamJXazRMUkcyOG0zWUYrd0lUa1M5NUwz?=
 =?utf-8?B?b2ZmVEFOcXl5MUtEblY2ZU1zMkVVUkJYeFVBQWtIbFRVazdMamgwS2dFZFc5?=
 =?utf-8?B?Z01rdGJmaEp0eVprN0hETDZPTi9QbHZqK0tjNTdrUGg3bG5tcDNFR3NMOGFE?=
 =?utf-8?B?YldJdmE0Ui9tWFI1c1lZUUhmd1YvR0JnN1orNE5HcjNYMTllQ0VSSE5rSytM?=
 =?utf-8?B?V2RseWVyb3VBZlBub3YrV1JmR3JUYkkzcUR6TEplcC9RMDlNTHk4NFJFUFk1?=
 =?utf-8?B?ZklMbmhxZkZ6eGxsNWU5Q3ZjeVdvY09BQ2VxTnp1L2tUWjQ4NzZmQzREZmR3?=
 =?utf-8?B?d2lXbEdQeUJQTmY2dXNKejJyZ0VMQ1Azak5DZHZFRTZ6TjBTRUhDRUR4WDZx?=
 =?utf-8?B?Q08zeVIzT0habmQ2anM5NTQ2S0FmQS9zUlBuZXZIL0tSNFozcHROZDBzeE9U?=
 =?utf-8?B?dnE3NXE4cFcwejVMY0tVdWZ3ZUhHalRZMkNMckpXd2liSTNBSHc1TTJ5Njdk?=
 =?utf-8?B?VlNVMllwb3lpTkJsa2c4ekIxQnNBNSt1Tk42aXJQY3l5QnZIbkwyQ09tR2lI?=
 =?utf-8?B?S3g2YjREMnlnZ1hTTkY5NDJVR1Y2T2d6MWtVMFJwYzIxZTBWN0pHUCtMZ3BP?=
 =?utf-8?B?MThOV1JtSlppME5td0o4RnQvcGJ4SHlWcjVKVmZUUGJhUVNtZzBmR0JYbUxq?=
 =?utf-8?B?bnd2dnJPdmtmSVhERnRHOVBCUmJRbUMwSElZM3Q2UWk4Qy9aL1NtS2d4TE9v?=
 =?utf-8?B?ZEZLckJyYVlmZWJ4aGJFV0xkcUdxazZRdUVjUjNFVXc3ME8yUjZUdlhYRStr?=
 =?utf-8?B?M0NJSU9OaUV0b3liREE2WDJmUUJLaEt5ZENpQ0lmK0t6c3ZmWXRFU2NkbTBa?=
 =?utf-8?B?VDlwWERIcWlsbWlOV05lYVl2UUE4Uy8rb3FHcmlod0h1MExpSUhJZko5Y01h?=
 =?utf-8?B?V0kvQ2xvN0QzN0x5bXpDUGJTZUtQTHRqdEJOcWthcnN2UnczZjF1UnJ1QmNC?=
 =?utf-8?B?Yis3cXA2UnN2QXRQdWNYY2o3eTZMTURTbUVvTXIyeHIyZDhMWFJXUVowdWN1?=
 =?utf-8?B?eTU5UlZKanBGM3BLT3ZTcHM0WWxTNzhtWnh0c3NzNGJiUGQ5Z2JLQ3U5eE1E?=
 =?utf-8?B?VHhHQUJhb2dYeGdLSTVmTmI1cUEyT1NaaGdXUkRXR1FoVGhPRG9yN2JmU0Yv?=
 =?utf-8?B?c0JjdWFlZUFjS3g4UkgwMEdNUXM5WkpKK0RLUVVPZHpzeXlOZkZJcjRhUC9y?=
 =?utf-8?B?cW5ZYzM0cEJJMnZ3bDc1SHpnUEhxRGg4ZDVJZ2lFeldWR0RjTko5S3ZlYmtl?=
 =?utf-8?B?eDF0amN3NmVSSG1MUWQ2c3dsN2ZyclRTUzR6YVRyYTA0Z29WSXZ1WE9oeFBa?=
 =?utf-8?B?RW0vcG9LRTZVbnMvdksyd3ZSMkRLWFUwbmYxY3hrdFdKYWlYV0xnQUcxL2lI?=
 =?utf-8?B?L3RPMUJFeWNxTGRzbDk5MHNIQXVwaVdtUVNzeWIwb1hnd3VDSWhZOUZGN1FM?=
 =?utf-8?B?VUZnOTE2cEJZWk1JRUN0TzZlTFVmcHA5M0ZrU3Vmem9SWUQ5STJlSERJWXEz?=
 =?utf-8?B?eU44UHFoamYvaVp6Mk9Bck1ETjlKdmxhRnhpYmJhWkx4K3Y2dUlCNm9jVjJE?=
 =?utf-8?B?aTZQNGRaWmM4TDhrVm1oR1BDTFY1cFhxc2xMZURrYXJJakFQZWZpTW1NY0Fk?=
 =?utf-8?B?aWJtaGFCSEJjUXF3MFEyOU43Z1NxaUJNb3lSa3dNbDRGM0lnN3ZmY1liY3Ju?=
 =?utf-8?Q?4mrc0qgd8QU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2p5TDlBM1YwZ2pUYWV5YUJEd1l0RDJ2b2Y3eG10ZS9kdkkwWS9FcDM1bFA3?=
 =?utf-8?B?ZXVrcktEaWsxdzc2RHNPVWkzRkJqTXFwVlE5dHRTVDQ3K2N6VnRyUDBFMVBV?=
 =?utf-8?B?aWhjTmNkSjFLak5ZRS96Y3kwbkRMdkJiT01mU0pSajROendwa2hNbUJlZEhu?=
 =?utf-8?B?YWtCYVNEYWxDek1CNjdTeHNaYnJDc3BhWXQ2WWh2ZmtPeEJsSWFzTDZodEZE?=
 =?utf-8?B?OEdRU1daRnhKaVJPTXZteTNqOGNDczl1RzJOakVmZklCQmhGd2JVWG5qMmNl?=
 =?utf-8?B?N1M4QWNSUG1wTDJuU1VkSGJhMVlnNHpENHhsMnZYenVYTmYwRC8wT2JBZHpU?=
 =?utf-8?B?WXNmMXRIWExPSUhHdW5IWHdsc0YzdTlmS1B5bGxRU1NLSEJxL1FVOEdnaThD?=
 =?utf-8?B?a01CclM5b0RQVklnbU9penNDRzdXLzh3TGZ5QnpEYTd1T1V4K21XRW1iQXAr?=
 =?utf-8?B?WlptUWdJcEJnMjV6UTJQZmtZSUFHeVRZbE5zbklEUUZZWVBqMXdQSEZvd1pU?=
 =?utf-8?B?a1hxdTZjSFk0SUdHaWljS05HazZlM1V3MlpjaXJHTTlxZERvNFJWUXIyUWNy?=
 =?utf-8?B?czRvNVdyRERyVzlKZWMwWmNUV0txd1VKUDgvdDdndHpqVlR5MEJlWU50dVd4?=
 =?utf-8?B?U1BBWXZkTXZNRjlubFUva0Y4Q3ViWTlhZEpzaTdoeHpDaVhmSXRCdHM2L0Nr?=
 =?utf-8?B?ZnI0K2dJZldKNEpZeFNad2NTR2dYNlY1azhIVVRrc29HbWN5MmNkeXl5QVJX?=
 =?utf-8?B?VFV1ZFhaS2sxUXM3VVdORFRqNEpRWlhEOFZ5bFQvMU9POFVXS2JBd21Zb1dm?=
 =?utf-8?B?OFRhbTJRRkdiT2l3cDQ3WnJkOW5lekJSMmljRVZteGpyK2lsdDJPZzkrUFY4?=
 =?utf-8?B?dzBDVVp6b09nRWNEZkJkNnhVSEo4RVp5WHFRRTVKaSt6S2ZOM3J0WFdyWS8v?=
 =?utf-8?B?Vk9wNjlsUW9yRk4zb2NSVmhMR3pqdGVrV3h0L2RmN1Ryc2tzQlJZYnpTVnJV?=
 =?utf-8?B?VEpNdzVWOUdjSU45TXE1SE5HWSsvcHJZMi9aYlh1eW1YMDNSdjh6ZGdCWW1t?=
 =?utf-8?B?MDVPRVErYXNZTkM2K0QrQm4vejdTcDBSbUhIQjlyVG9rM2xEWjAyMW9MSmx0?=
 =?utf-8?B?T2E1WHRmaTU0Y2hlcmZKdHR6QVVKTGFJTm5KdXVrN2M5K2hoalFxVzZ6KzJw?=
 =?utf-8?B?NUtWU1RwNWRZVXpMVTlOQmFiYWIwZGFBV0Z3bUlKTGFkMXNxekhnTUZXSVFq?=
 =?utf-8?B?a3U2eEVrUmhpekwxb3VRNDd3VVpGLytVUzgxUjk1eFBsbnlXVEhEemFKL1FU?=
 =?utf-8?B?bitEakZubUEyazlHcy9kTk5SUWE2a1F1WEkxUWxkS3p3STU0RUR0c2Q5WUxm?=
 =?utf-8?B?TVNDNmVZVWRRcm5BRlpoeGlQY0gzR2Qzd2dkUGZJUEJwSzNuV0FzdWs5TnRm?=
 =?utf-8?B?YWFsQXQxMFFvK21kdUZnM05UMWc0YXAwbFhJc09uM2VyZXA5cndjNi9EcG5z?=
 =?utf-8?B?SitwQXBISDVmWW1XRDBOWnQ4QlFuY2tmUkNhTTRQZDRrTXU1ZWovSEw1d1la?=
 =?utf-8?B?SXhIUGRRKzc0WXlBM3h6RmlNSWlDWUFha1g5WFBYN252cEhvbGVycGxhL2Z4?=
 =?utf-8?B?ZlpuQzh0NWZmaHZsZ2dtZlRkbU42VloyeUt0aGxrR3d5SkgySGI3VmtCeVcr?=
 =?utf-8?B?RTFGQWxocmowbDJ3SmlaNkxEOXBSd1ZUSDJIdTRlMFZSN09xa3lZTy9KSFI4?=
 =?utf-8?B?d3FCdjh0cWNCMVo4ajFRV3poakN2bmk3UG1oSFlFQjZsWjdWUThaYzE4SVJj?=
 =?utf-8?B?N0JHaS9tREJhclI2OXpPVGFlVExocXQrSk9OYTRZeTZ6Y2pvS2dkdUl1ZzRQ?=
 =?utf-8?B?QlI1TTRuVVVhQUNCM3Y2MzU3YVhvMXhTU1RiRG5BZGwzdmhpVnRUYiszMmp6?=
 =?utf-8?B?MXZDTExPQ1I5VlJYT2J4Tll6c3N2SmtxR3N5Wmk5bjkzSUJzVCtYWENzRjJi?=
 =?utf-8?B?VFg2MkxjeVVXeUd1eFY5ZmJzS2Q0emp1SDZQWEdCQnhTamx5YlF5RWxiaWdi?=
 =?utf-8?B?UVFQWnZONHhjbUxtK0syQlpRVm1yT05QSVoxK24vQXh6N01peEJvdDhVUVVs?=
 =?utf-8?Q?8XfcSqgPhpV9ueO8Lzczm+vqT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c400ddb-93c9-4066-461b-08dd78f9b7ed
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 13:06:48.7239 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C2O9m6EPjyCbvim/gWfhC4I+FirD3ZRhbP4J0XK4X2cDcKC0CchQ2uatSMSaRct9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6258
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

Am 11.04.25 um 14:44 schrieb Philipp Stanner:
> On Fri, 2025-04-11 at 13:05 +0200, Christian König wrote:
>>  Am 11.04.25 um 11:29 schrieb Philipp Stanner:
>>  
>>> [SNIP]
>>>  
>>> It could be, however, that at the same moment
>>> nouveau_fence_signal() is
>>> removing that entry, holding the appropriate lock.
>>>
>>> So we have a race. Again.
>>>  
>>  
>>  Ah, yes of course. If signaled is called with or without the lock is
>> actually undetermined.
>>  
>>  
>>>  
>>> You see, fixing things in Nouveau is difficult :)
>>> It gets more difficult if you want to clean it up "properly", so it
>>> conforms to rules such as those from dma_fence.
>>>
>>> I have now provided two fixes that both work, but you are not
>>> satisfied
>>> with from the dma_fence-maintainer's perspective. I understand
>>> that,
>>> but please also understand that it's actually not my primary task
>>> to
>>> work on Nouveau. I just have to fix this bug to move on with my
>>> scheduler work.
>>>  
>>  
>>  Well I'm happy with whatever solution as long as it works, but as
>> far as I can see the approach with the callback simply doesn't.
>>  
>>  You just can't drop the fence reference for the list from the
>> callback.
>>  
>>  
>>>  
>>> So if you have another idea, feel free to share it. But I'd like to
>>> know how we can go on here.
>>>  
>>  
>>  Well the fence code actually works, doesn't it? The problem is
>> rather that setting the error throws a warning because it doesn't
>> expect signaled fences on the pending list.
>>  
>>  Maybe we should fix that instead.
> The fence code works as the author intended, but I would be happy if it
> were more explicitly documented.
>
> Regarding the WARN_ON: It occurs in dma_fence_set_error() because there
> is an attempt to set an error code on a signaled fence. I don't think
> that should be "fixed", it works as intended: You must not set an error
> code of a fence that was already signaled.
>
> The reason seems to be that once a fence is signaled, a third party
> might evaluate the error code.

Yeah, more or less correct. The idea is you can't declare an operation as having an error after the operation has already completed.

Because everyone will just wait for the completion and nobody checks the status again after that.

>
> But I think this wasn't wat you meant with "fix".

The idea was to avoid calling dma_fence_set_error() on already signaled fences. Something like this:

@@ -90,7 +90,7 @@ nouveau_fence_context_kill(struct nouveau_fence_chan *fctx, int error)
        while (!list_empty(&fctx->pending)) {
                fence = list_entry(fctx->pending.next, typeof(*fence), head);
 
-               if (error)
+               if (error & !dma_fence_is_signaled_locked(&fence->base))
                        dma_fence_set_error(&fence->base, error);
 
                if (nouveau_fence_signal(fence))

That would also improve the handling quite a bit since we now don't set errors on fences which are already completed even if we haven't realized that they are already completed yet.

> In any case, there must not be signaled fences in nouveau's pending-
> list. They must be removed immediately once they signal, and this must
> not race.

Why actually? As far as I can see the pending list is not for the unsignaled fences, but rather the pending interrupt processing.

So having signaled fences on the pending list is perfectly possible.

Regards,
Christian.

>
>>  
>>  
>>>  
>>> I'm running out of ideas. What I'm wondering if we couldn't just
>>> remove
>>> performance hacky fastpath functions such as
>>> nouveau_fence_is_signaled() completely. It seems redundant to me.
>>>  
>>  
>>  That would work for me as well.
> I'll test this approach. Seems a bit like the nuclear approach, but if
> it works we'd at least clean up a lot of this mess.
>
>
> P.
>
>
>>  
>>  
>>>  
>>>
>>> Or we might add locking to it, but IDK what was achieved with RCU
>>> here.
>>> In any case it's definitely bad that Nouveau has so many redundant
>>> and
>>> half-redundant mechanisms.
>>>  
>>  
>>  Yeah, agree messing with the locks even more won't help us here.
>>  
>>  Regards,
>>  Christian.
>>  
>>  
>>>  
>>>
>>>
>>> P.
>>>
>>>  
>>>>  
>>>>
>>>> P.
>>>>
>>>>  
>>>>>  
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>  
>>>>>>  
>>>>>> P.
>>>>>>
>>>>>>
>>>>>>
>>>>>>  
>>>>>>>  
>>>>>>> Regards,
>>>>>>> Christian.
>>>>>>>
>>>>>>>  
>>>>>>>>  
>>>>>>>> Replace the call to dma_fence_is_signaled() with
>>>>>>>> nouveau_fence_base_is_signaled().
>>>>>>>>
>>>>>>>> Cc: <stable@vger.kernel.org> # 4.10+, precise commit not
>>>>>>>> to
>>>>>>>> be
>>>>>>>> determined
>>>>>>>> Signed-off-by: Philipp Stanner <phasta@kernel.org>
>>>>>>>> ---
>>>>>>>>  drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
>>>>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c
>>>>>>>> b/drivers/gpu/drm/nouveau/nouveau_fence.c
>>>>>>>> index 7cc84472cece..33535987d8ed 100644
>>>>>>>> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
>>>>>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
>>>>>>>> @@ -274,7 +274,7 @@ nouveau_fence_done(struct
>>>>>>>> nouveau_fence
>>>>>>>> *fence)
>>>>>>>>  			nvif_event_block(&fctx->event);
>>>>>>>>  		spin_unlock_irqrestore(&fctx->lock,
>>>>>>>> flags);
>>>>>>>>  	}
>>>>>>>> -	return dma_fence_is_signaled(&fence->base);
>>>>>>>> +	return test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
>>>>>>>> &fence-
>>>>>>>>  
>>>>>>>>>  
>>>>>>>>> base.flags);
>>>>>>>>>  
>>>>>>>>  
>>>>>>>>  }
>>>>>>>>  
>>>>>>>>  static long
>>>>>>>>  
>>>>>>>  
>>>>>>  
>>>>>  
>>>>   
>>>   
>>  
>>  

