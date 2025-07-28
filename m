Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA580B13A01
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 13:43:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A961710E4EA;
	Mon, 28 Jul 2025 11:43:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="rFVw6bzk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2079.outbound.protection.outlook.com [40.107.93.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A99AC10E4E1;
 Mon, 28 Jul 2025 11:43:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oI4lxKNyeji58hBUVsxXqm5Ydu61n4AIi1DJn9fa1PO8TT4KrI/uuJdWN+ElINhH2lUNYQMw72DYv9q746NyxDQ4+PfuPFocGNF0gKEk5jOF+mMC/rPCnNrhhDMIicCglZ3+kogOdQbnuFvVHTdZHFudIjLHBhZn6WbarHPDiGBDjBEfeHmh3H3cMFL6c1mjl9GIrzqedY0NaH8xqcUw6JWO3C2NZGspuQt3DtZ1IU73AM7RtCtt1fwmzuAgiDdzx//5LSKorKW4yluOeGrljaBqqG+ma5hIb93wLoLA7LLiPwGLZfMtW3iNvRK6ptG3d5ua3Ot3fPOU4uIKAU5mQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yHIkTCldkHwAJofBWijoK4Gf4ESfBdxVZB3iuHd7Ijk=;
 b=ItqtpU2KBVKxnRRrEYKDeXe2hJ+4zO3bxlNbUpZtWlBgT99MdpO5Td0JevsQLwYizXCl1jCMuWu8mMif0u4BJMcXK+8Bjyu9v55qVLR5xO6IYcTdll13bpvuk1HeuNxyggHoDMqqjpVE3WPYe/axYZH4v5RH+PiZ2uSnTDv3QNfNsX2Pgjex8cLdRt4+A7Cns7N8LcsSoRqDr3L1DIbbPpLV4kuoeiVT42EwElWS3EngenQBYt7h4EjbizCVllyRk5xddGMNIteSS3yAF/H4ucN+nu36W8z3obKdZUOwqqE0EIXdt0ATXg0YkduTJJQlXrxzR8dn3BZlfdlRsUWkbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yHIkTCldkHwAJofBWijoK4Gf4ESfBdxVZB3iuHd7Ijk=;
 b=rFVw6bzkGEubSumG61Q+Yu5ANI3D6zmj1+dLqQpIl7Bp5362f2f2KIZgKlBX7R43b/9R4VqamgtQy+SNgx2CLMVOR9OhP3o54of67F2AE5v7OQmdv4K352LCeloyIlnhEcqwsdap5f1l5xkRUccMFYp5lvb2giU5iOj/APbOQDFfdHp6K+uOyqd/fSX4pyZut/Y9klpPwNFotj/U5Q6q9ritBqRaU/j6sudtOLQs7iwGmfaBeIyUsPgntVTPtQi+zNPkLy13QUpNsEXTMSkiQchtzI+B5w4VSLLSG3UGbA/1K6BsaTxlKjpQDZpGOGqf6dKiixAuS7tG/0Ok9+1sRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV3PR12MB9118.namprd12.prod.outlook.com (2603:10b6:408:1a1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.27; Mon, 28 Jul
 2025 11:43:20 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8964.026; Mon, 28 Jul 2025
 11:43:19 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Jul 2025 20:43:15 +0900
Message-Id: <DBNNTU14VH90.25AZCJSVT4JDR@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Beata Michalska"
 <beata.michalska@arm.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "John Hubbard" <jhubbard@nvidia.com>,
 "Nouveau" <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v2 01/19] gpu: nova-core: register: minor grammar and
 spelling fixes
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Steven Price" <steven.price@arm.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
 <20250718-nova-regs-v2-1-7b6a762aa1cd@nvidia.com>
 <B1AA6359-7854-4284-B533-F5CA3C18AF34@collabora.com>
 <DBNF8SZWLI79.1NRX9AMW5QW45@nvidia.com>
 <d0ffb55b-690a-4a65-98b5-b83adebfd88b@arm.com>
In-Reply-To: <d0ffb55b-690a-4a65-98b5-b83adebfd88b@arm.com>
X-ClientProxiedBy: TYCPR01CA0038.jpnprd01.prod.outlook.com
 (2603:1096:405:1::26) To BY5PR12MB3986.namprd12.prod.outlook.com
 (2603:10b6:a03:195::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV3PR12MB9118:EE_
X-MS-Office365-Filtering-Correlation-Id: 9070399d-4360-4b23-6dd1-08ddcdcbf1f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|7416014|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SCtLLzBSTXh4SDl6dFd4bFoyd3RIMFRzenljaGd2b2ZPVmtmZVBrUjdoaUJK?=
 =?utf-8?B?WW5NeEt5ODBlQ1VMck9oc3pFRWlBZVFyRU8zNUtBWitwZE5oVDRYckt1MGZp?=
 =?utf-8?B?RHE2YW9kVTVlRjlzdGFOT0xtL2FteFBMSHVaUWQ3TCt0OXQ0cGxxMlF2eGls?=
 =?utf-8?B?dzBBK2E5Rzc4Y2Q0SXhBYlUyaDV0dWN1YjJCVFRjZmpmSVNmaU9ZRXVUNE9J?=
 =?utf-8?B?MUNMQ2FBN1lnWk1adnpxTC9RbEx3K1VaQXF2dGxLenJscUV1UlZ4OUIwaVRk?=
 =?utf-8?B?eXp6UkttS3dVeXk3UHIwWmlYaWJ5OWEwL0ZDaGJHY2NXWnFxekR6SlNZRXlR?=
 =?utf-8?B?TFozbk0vRmRmQ2ozNExKUHliL2VjYWR2NVlYS2dsN0FyQ1h5S0NoY0tOZjVT?=
 =?utf-8?B?U0g3bktFaThGcGVXS2pWODk2dE9VMk5XMGJLRzdscld4Z3RXV1cwc3Vlb0hW?=
 =?utf-8?B?WTBSTk84L0VXQ1Z1OCthNkVtRy84TFRyaUNyWVMxQTgyeVpXRTN5bDE1bTQr?=
 =?utf-8?B?VGhHSnMxdTgrSEdtOE50SnY2SVZKbUs2ZjRmQ3BhYjc2WVZlUnRybkJrTFJx?=
 =?utf-8?B?bDVSRWtOeDZ0SkVUcmV4eitUM29CUjE0bElrYlM5ZUFaVGtxcVg4ZExBaWZi?=
 =?utf-8?B?YmtSKzlMbFlJWWo4RnFRa0tBdkRyM0Z1YnMyMlBhQmFRd0JzRzRReVNtam1q?=
 =?utf-8?B?eFZHL3VmSnZaeUlVVis3WWhGYTh4eWVrbnhZS0JOZHNrRzd3ZUczQmluUml0?=
 =?utf-8?B?L3grM1FtWWlZamQvN1dUOVZ2RzdSUEZ4NHpwYnZBeEtjUXhMMXIrOEdleTBM?=
 =?utf-8?B?SFBaK2tlOWo5d3NqNUVlOW05WHhZU3o0dlUxbzVvM3JDbHMxV3dqRklxV1M0?=
 =?utf-8?B?WHRVL1Z4alZ2VWRJWGdZYXIvMGJneWFtZXR0NldLcWt0eE5zUURDa243blhC?=
 =?utf-8?B?czFVYXBjaVNpT25abDU5M21qS3p6eFdML21aWm5lMDZKL3U2Q0I0WDF2MUVS?=
 =?utf-8?B?SmdCOEhleEkwaFZsTWtQZk9LbHA4TUVJL1NTczJ1Vlp0Mi8vMWRMWnBiYWQr?=
 =?utf-8?B?MUxQSGNEQmpkbVczOWJuQitOZU0xSTZEOVJteFdZaEZuQlhkYlh5amNHeUhW?=
 =?utf-8?B?MjZiQVBKSnRQNDI0a3ZDb09LMnV3UHhBNXBvM1NOSDhQaHF4MGZGdjVITDRN?=
 =?utf-8?B?L0dPTUlhUHhvYkJtTlllL3IyWWFmMTQ0NnVoelJhVHZERU1sd0xVeDBCMlNZ?=
 =?utf-8?B?NGRlSWVSeXZQNVFEaDB2Z0d6aGtRcG80VUZJN2hxZkx3UUJLTzhKS1l3Nisy?=
 =?utf-8?B?MDZaQVhyTFRORG14aGdCS2tISG1FWS9aKzZEUlMzMmlBUFRycnZGSTRWV2lO?=
 =?utf-8?B?ekYxZXV0dVR2ZWd4QmNmMFAwWXFWNWNLV29xM1p0dThpVHg2NGhJM2RSemx2?=
 =?utf-8?B?ZndRQlZpOGtzWGdLdlpWYy9xQnc3OVQybnZkVWFzM3hvU0hyK0k0S2IwRGZ5?=
 =?utf-8?B?RHNyazFhaHhBRkI2eVJGaStsNmVtK2JrWDB2SkViZFovU0IwZ1hYeHVpK0ww?=
 =?utf-8?B?RE9ST214T2h5SGg5YWd3Rk9IU2hvZmdlQzJVRUxyUXdBL1g2U2JxaVEvWlBC?=
 =?utf-8?B?WWRDOGZ0WEVJZ0JVVFFaejA5R1o0K3dUNHZrNG1uMHhLeE5YbndRU25YcVBW?=
 =?utf-8?B?NlZSNHVKY1NGUVdXYmpha1pUaGNuNWJDdmk3TXBUZGdLYkw4VHFHMEtoSURJ?=
 =?utf-8?B?NU1qSU11cFkzSmhnVkdMVm01WTVhYmx6aWhCa0tRR1NmOVJzbGQ0S2RTbXJY?=
 =?utf-8?B?VGNTNVRwUW45RzdXUktHRWRPbWlqMFdaTzMydmVoc1k3OHVXYVZLbm1JbEFF?=
 =?utf-8?B?NEwvSjV0M1BCV25ucFM0dzhDbjNOK2haeTczS3RZemU3bXdyNG1NNTJCbkx6?=
 =?utf-8?Q?D1ZiSj0hhbA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(7416014)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UExUaG9ad0JuZ2NPN0JMZTM3OGFlRkpXMzFldDJaVTJNK1UvdHZzUkU4bklJ?=
 =?utf-8?B?eHM3Yi9xbVFhckxzeU1id1RpaWpwanJHZzJOZUNJLzV0b2RxYnZNRVV5NFlX?=
 =?utf-8?B?eVlnZFJhKzVOQ1NNdFVCOEo1eTlya0loWWI1N0J3Z3h6UFYrQnBFeEFRUmQ3?=
 =?utf-8?B?bmZCdnQ5eXhTZnBvSFhvQUZzTGh3aE85NWtNOUYxR2J1UnVFTEtiWmtLYTZa?=
 =?utf-8?B?anBvTGZwWUF2ZlhwR0ZDK1d6ak9BelkvbjVOc0c4ekZubnZrNmtyN1N0dVJK?=
 =?utf-8?B?ZzdoTTB4NzRYT1V2djNKSVcwazYrR242U0JUZjZlRUQ5R0dneURSRnc5UFVz?=
 =?utf-8?B?WnF1QnlkaXBEZ09PcHdJR1ZxeTdCcCtwbmR5eVlVZXcwQzk2bWVSTFh3TFFS?=
 =?utf-8?B?WXZmMDJuK21Uck5NVUpYakdyL1ZHc1pDT0I4eGIwY3JxUmNzZFhWTCt5N25L?=
 =?utf-8?B?ZzNuSFIyTCtQS0NNZE5aZTVhQS9lUGRjejZERFQweS9tanVISkllWE84UXk2?=
 =?utf-8?B?MkxRdnllc1N5ZVlubnZveFhUQ0hyZlNxa3dCRytPVXNIWlRpWFZzZk90NEdE?=
 =?utf-8?B?VjNQRkErWHY2Qk5uWjB2SkR5TlZjZC96dTRFYjIzL1BaWFB4TS9jRUVwVUxF?=
 =?utf-8?B?Qzg0b3VjWmU1T3pTU1RyVUZPY2FuK2wwalZZMlRDdkhacG04RThWaWZUMlpr?=
 =?utf-8?B?dlpkenU2bER4WFdUdU9yZ2VRNWNYaXpZVDJ0Y2J4VVpJdW5VbjJ4a0ZNeWFC?=
 =?utf-8?B?Qng4eEk4YldyNjVmNmROREZySnhKcnJ5ZEJSbStuNHh6Um9wam1veC9LNVY3?=
 =?utf-8?B?WnNZOXI1UUEzUHdQekl4ZS9CNEVUbFVKUGV4RklqVWR5UXhJOGtpMFlFOHh1?=
 =?utf-8?B?RlFkZ3RLbUVGY1lFUS9tQy9ucnNwV0V6cElsc2N6ODVTbVJ3NmFHckxwNzIy?=
 =?utf-8?B?d2VOQkI2cmZGcDZNRUNnbFBUZ1REZVBMNktNMFRTb2lZQkN3Snp0UkRvOHNn?=
 =?utf-8?B?R3NDb1NnM29tdnZjRXF0OHFCMzZnUlpncVdzaWU0Qi9LMHZHdFgyU0lFZUhM?=
 =?utf-8?B?clRWOURWZWVlUVBQdWVML2t5T0dFNEhQQmxYd1ppbzlIaGtUbFc2SXpsWGE4?=
 =?utf-8?B?Vi9QS0ZEZmRBQUpmQVZxdkVycitON0NXQTFsdDlub2w4MUNrVGlKWnRFVkxz?=
 =?utf-8?B?K0RRZkdvZWpZZEh2dXZ0czRUWEQ5UG5lazZLdXloSDUwWHh5eGFFVnNJNENS?=
 =?utf-8?B?clYwQjNvK1VUcjBYckFxenZuNHZqakwxQ2NQRnVoUVMvRXFpMjFQQ2prRlg4?=
 =?utf-8?B?d2VnVnZ4aTlFbWdRUEFFM1JTdXdRVWlEOWI4cGFSY29nTVlBaGdsZHZtREl2?=
 =?utf-8?B?V3ZWaU9uTjdmUVlBWS9WVEtDTTVvSkt0ekd6UjBlV2VsRGIwOHhmT1gvcUtF?=
 =?utf-8?B?eW9YT1l1aGpaSnZhRlRXeVorQzFJeU9vZStqcDlxMWFBUk5hcTE5c3dxL0xi?=
 =?utf-8?B?NW9pdVJNQUZPTWJqVlFBZEoxUndhNXVpL3VmcGpVL05KSjJFSVh4WklCT3pr?=
 =?utf-8?B?KzJkQlN4K1M4SE5OaUlzT2x5dGV0b0pBSzBKb3FaL3gyVlZENkFGZnJDQWdD?=
 =?utf-8?B?N2hSbVdWK1pkRnJaamVNZTRmL3lsUlRoa1pzdmxtYVpMUWt6WVczZzR6RXRX?=
 =?utf-8?B?R1hPMUx1cjhiekdIekYxWU1UY1c0dkNGWTg4cUZZcXhjQURtS0F6eUp6UW80?=
 =?utf-8?B?bVJBaE9qVFdDeGFrdWllZjFGdmpOdVQ5aDFRTlZMdFd0Q1ZjT29rTkpwNUpP?=
 =?utf-8?B?UUthVEZ6b3k0U2dka1E2VlBWUE04dkV1bHRic09BWk8xc2ZScWYra1BYVGFJ?=
 =?utf-8?B?T0lkalZBZ1NXd2F2ck5TdTJPWGZqYXlFc2p3MzBQVVRuRzJ1UTZWamVOTGdl?=
 =?utf-8?B?MzMwSHRrYi9sdjZhdko5ajNpRXFpMlY2c1hmNktxQ2lXUW05QnJodGxzWE9l?=
 =?utf-8?B?OWo4dDQyMUhUQVVFNmF3a3lnVDNvL0xkSTdxSkx4VlBJb1JTUmV6WFJYNzBD?=
 =?utf-8?B?emNPK3lJNjNEZGRIbHN3RkpxUUlGLytvYytRYjkyVlhjL1FtQjNrOFVDdzBG?=
 =?utf-8?B?K1lYdUtNWmYwN0JiVFZ6OWNyZHFnQVVLWUJucGJGMkRrSGFoMUNnSUVSSkYw?=
 =?utf-8?Q?spGbcXaIIcFWGr+ftKsYwXyGJeki9nGwScyEEd47Hgsf?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9070399d-4360-4b23-6dd1-08ddcdcbf1f2
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3986.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 11:43:19.5366 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bp/rmOEpbU89cra5B8hMNfkaccBhXmlfz+B6EB0ZIULUU1+WUt9L90X7C/UW2MBbQjK2M8kna4lCCYuKz6klSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9118
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

On Mon Jul 28, 2025 at 4:51 PM JST, Steven Price wrote:
> On 28/07/2025 05:59, Alexandre Courbot wrote:
>> Hi Daniel, thanks for the review!
>>=20
>> On Sat Jul 26, 2025 at 1:14 AM JST, Daniel Almeida wrote:
>>> Hi Alex. Thank you and John for working on this in general. It will be =
useful
>>> for the whole ecosystem! :)=20
>>>
>>>> On 18 Jul 2025, at 04:26, Alexandre Courbot <acourbot@nvidia.com> wrot=
e:
>>>>
>>>> From: John Hubbard <jhubbard@nvidia.com>
>>>>
>>>> There is only one top-level macro in this file at the moment, but the
>>>> "macros.rs" file name allows for more. Change the wording so that it
>>>> will remain valid even if additional macros are added to the file.
>>>>
>>>> Fix a couple of spelling errors and grammatical errors, and break up a
>>>> run-on sentence, for clarity.
>>>>
>>>> Cc: Alexandre Courbot <acourbot@nvidia.com>
>>>> Cc: Danilo Krummrich <dakr@kernel.org>
>>>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>>>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>>>> ---
>>>> drivers/gpu/nova-core/regs/macros.rs | 14 +++++++-------
>>>> 1 file changed, 7 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-c=
ore/regs/macros.rs
>>>> index cdf668073480ed703c89ffa8628f5c9de6494687..864d1e83bed2979f5661e0=
38f4c9fd87d33f69a7 100644
>>>> --- a/drivers/gpu/nova-core/regs/macros.rs
>>>> +++ b/drivers/gpu/nova-core/regs/macros.rs
>>>> @@ -1,17 +1,17 @@
>>>> // SPDX-License-Identifier: GPL-2.0
>>>>
>>>> -//! Macro to define register layout and accessors.
>>>> +//! `register!` macro to define register layout and accessors.
>>>
>>> I would have kept this line as-is. Users will most likely know the name=
 of the
>>> macro already. At this point, they will be looking for what it does, so
>>> mentioning "register" here is a bit redundant IMHO.
>>>
>>>> //!
>>>> //! A single register typically includes several fields, which are acc=
essed through a combination
>>>> //! of bit-shift and mask operations that introduce a class of potenti=
al mistakes, notably because
>>>> //! not all possible field values are necessarily valid.
>>>> //!
>>>> -//! The macro in this module allow to define, using an intruitive and=
 readable syntax, a dedicated
>>>> -//! type for each register with its own field accessors that can retu=
rn an error is a field's value
>>>> -//! is invalid.
>>>> +//! The `register!` macro in this module provides an intuitive and re=
adable syntax for defining a
>>>> +//! dedicated type for each register. Each such type comes with its o=
wn field accessors that can
>>>> +//! return an error if a field's value is invalid.
>>>>
>>>> -/// Defines a dedicated type for a register with an absolute offset, =
alongside with getter and
>>>> -/// setter methods for its fields and methods to read and write it fr=
om an `Io` region.
>>>> +/// Defines a dedicated type for a register with an absolute offset, =
including getter and setter
>>>> +/// methods for its fields and methods to read and write it from an `=
Io` region.
>>>
>>> +cc Steven Price,
>>>
>>> Sorry for hijacking this patch, but I think that we should be more flex=
ible and
>>> allow for non-literal offsets in the macro.
>>>
>>> In Tyr, for example, some of the offsets need to be computed at runtime=
, i.e.:
>>>
>>> +pub(crate) struct AsRegister(usize);
>>> +
>>> +impl AsRegister {
>>> +    fn new(as_nr: usize, offset: usize) -> Result<Self> {
>>> +        if as_nr >=3D 32 {
>>> +            Err(EINVAL)
>>> +        } else {
>>> +            Ok(AsRegister(mmu_as(as_nr) + offset))
>>> +        }
>>> +    }
>>>
>>> Or:
>>>
>>> +pub(crate) struct Doorbell(usize);
>>> +
>>> +impl Doorbell {
>>> +    pub(crate) fn new(doorbell_id: usize) -> Self {
>>> +        Doorbell(0x80000 + (doorbell_id * 0x10000))
>>> +    }
>>>
>>> I don't think this will work with the current macro, JFYI.
>>=20
>> IIUC from the comments on the next patches, your need is covered with
>> the relative and array registers definitions, is that correct?
>
> My Rust is somewhat shaky, but I believe "non-contiguous register=20
> arrays" will do what we want. Although I'll admit it would be neater for=
=20
> the likes of the AS registers if there was a way to define a "block" of=20
> registers and then use an array of blocks. Something vaguely like this=20
> (excuse the poor Rust):
>
> register_block!(MMU_AS_CONTROL @ 0x2400[16 ; 64], "MMU Address Space regi=
sters" {
> 	register!(TRANSTAB @ 0x0000, "Translation table base address" {
> 		31:0	base as u32;
> 	});
> 	register!(MEMATTR @ 0x0008, "Memory attributes" {
> 		7:0	attr0 as u8;
> 		7:0	attr1 as u8;
> 		// ...
> 	});
> 	// More registers
> });

I can think of two ways to achieve something similar using the current
patchset:

- As you mentioned, a set of non-contiguous register arrays. This should
  work rather well, as you could just do
  `MMU_AS_CONTROL_MEMATTR::read(bar, 4)` to read the `MMU_AS_CONTROL_MEMATT=
R`
  register of the 5th instance, with compile-time bound validation. It's
  not what register arrays are for originally, but it does the job.

- As a set of relative offset registers sharing the same group. This is
  more in line with the idea of a register block, but it also means that
  each instance needs to have its own type declared, which is a bit
  cumbersome but can be mitigated with a macro. More inconvenient if the
  fact that you cannot address using a simple number anymore...

The idea of register blocks is interesting. I wonder how that would
translate in terms of access to invididual registers, i.e. does the
block end up just being a prefix into the full register name, or is it
something else? From your example declaration I picture that accesses
would look something like `MMU_AS_CONTROL[4]::MEMATTR::read(bar)`, which
ngl looks great, but I also cannot think of a construct that would allow
such a syntax... Happy to think more about it though.
