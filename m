Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0BDA99DFA
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 03:19:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 043FA10E438;
	Thu, 24 Apr 2025 01:19:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CigWBuZw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2049.outbound.protection.outlook.com [40.107.236.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50BBB10E438;
 Thu, 24 Apr 2025 01:18:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=keZateqOVrxkHw9SVFnqC3jf+PAArATm1LAq8TwQ/bUaiKpl5oEi73jxGN7aD3tuUaW5V0g3HOauAbbA0vG6ZIEreg/uTp4uVwjqpsDzS09jkrbuQO2bMCgJa9DUJSesy/Hw4UaW17JnwTGM6bgMRchFdvnwCmwKXaNSJODQfrEqqXZB/fh+qu2Mjj1F+Oer6RY73rvoPmty0h48JLQ24IG5FMkX9DTPYOfsq7OhN6deymDKZfSHAsQ98iB8tQj3esAyZ1TYsum6x0jBcHPeihfmoSV4Jx0kf7GYBzhlje0U6UtvRON5dFn8LtMnAqMDpHeB09IqtLrMBzaaJKACTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qyJV35QlWGLofd7SoVgQUs2BsQpPM0+7hMsiKMOqkAI=;
 b=Nlc14y+J3b0SL+p3ytm4PufL4hU0s7AiZqTab7wI95wJeufDJ7By/mrvCUInqUDISO5V4ULISLnLOlYM9CpLjGNbSqvHuLb++aqw6GEuJN5eA31E145bkKayL9UFfK6GfoMtIhYIxc5UnLhyOSrtxKVgrt+mDdlFAMWRgb0lKtKzXusWG338O+c1/w75rXJdtVWLRES6oFgtguhJ2yNmYHhrIKfzj04APHBTvh5ebt3uIgo9rbYZ93S4PyOJ+kCDjexT2+rTOEHmwsLt5wBpbsuLHzDEC+Si6F7jI3OVHNn+HaebhzRRCASiYkeV4VouJHQXaxTu1tK9rMhXaVC1sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qyJV35QlWGLofd7SoVgQUs2BsQpPM0+7hMsiKMOqkAI=;
 b=CigWBuZwNqzogEGMxr6e5lRPySO0XkTKtGsKwLe/8Vyp34yL98IUBNqrzIp3BTdHN5eDjeUE2BdlcTgm+a+p6B4qmyBNWbVxpXszYeFboO3L1eStyUZWTtOXurGR6MQAJ+iMCCUCZK5f804gYUM2ptvmkZH4j2ULjJISRF/4hWtc/ctClBPhlOLdfgd8BwYYy9jov39cj4e+BCER9JQu39DHpEGuz0AU+KrDtI1nYdZCW89GqmauCvA3qBIWvzE3ySuUFyhTAkNijhmsTOCQ04Ucw63VVph/5f/9n9GK0gGyWzkYEyM2cqL9Q2pIj6LV9TypEpQZoZkiiBwvkruYPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH2PR12MB9517.namprd12.prod.outlook.com (2603:10b6:610:27f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Thu, 24 Apr
 2025 01:18:47 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8655.033; Thu, 24 Apr 2025
 01:18:47 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 24 Apr 2025 10:18:44 +0900
Message-Id: <D9EH1WXQOIO7.3RHFKYSFPBXE4@nvidia.com>
Cc: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 "John Hubbard" <jhubbard@nvidia.com>, "Shirish Baskaran"
 <sbaskaran@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Ben Skeggs" <bskeggs@nvidia.com>
Subject: Re: [PATCH 5/6] gpu: nova-core: Clarify fields in FalconAppifHdrV1
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, "Danilo Krummrich" <dakr@kernel.org>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250423225405.139613-1-joelagnelf@nvidia.com>
 <20250423225405.139613-6-joelagnelf@nvidia.com>
In-Reply-To: <20250423225405.139613-6-joelagnelf@nvidia.com>
X-ClientProxiedBy: TYCP286CA0206.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH2PR12MB9517:EE_
X-MS-Office365-Filtering-Correlation-Id: 52710a21-fecd-4e69-f2a1-08dd82cdf680
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|10070799003|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L3Y4Vmp2R1RnWG9SengrSk5vN2VvWVA1OWUyaU1PVXJqUytONUIrMzZVYTNs?=
 =?utf-8?B?Q2pjcHhwQmRVS05oS1BaMVFOd2tFditUL3ZsSDFoNG5rajNXeVp0NVloRWJH?=
 =?utf-8?B?ZkJ3SE5GTzFyRTVRdERrOWF0VXBGWmpocGJvaGlPM1EyaklSTSt0bm5pV0xF?=
 =?utf-8?B?dWE2Q3A0SjJ0Nm5FRnp2QWJIa3dMQkpqcDcyM2Ura09FMTBmWERGK2VMZEs4?=
 =?utf-8?B?TXpKQ2Vkc2MvMEV3WFZ5NzJZbzExOFJYazRxTGlGdTB4WWdFUzBsdndVdVZh?=
 =?utf-8?B?WTFRWWc2ZldDSzJxRzJWMkg1cmNubWNEZU44NGhVVkFNaU1LN1hkdGRXbHJt?=
 =?utf-8?B?QnNWS20xY00rV2JFUGo2MU9NUGd2RUE2dEZnZWpaZC8wN0V3S0FldzhETlMw?=
 =?utf-8?B?dEY4VUZJUmQ5cEV0SjV3czFqSERpOHpycWVqZVlQL0RDMExmdnliWFJabGxQ?=
 =?utf-8?B?YzhDM2tSQ2hQbGpDZklJZTZwcHBkV3lwVjJVN1B5MWN5M0tWUS9DNXh0WmZ1?=
 =?utf-8?B?RzNub29BRXFGNXU1Ri9yYWFtVGhTUXFralZrTklEekNxcWxjbUJzUnJpdVEx?=
 =?utf-8?B?aEkzTnpVTUlTMVpPL1c2Qm9UTDJpd0EycldINFpwNHFrMGhjd21MNkZwZVFJ?=
 =?utf-8?B?S09MZUlCdFdiTkRnY0c2T0dsOFZNWFZGR2VTYlc3c3preGQ1S2FLVE9sYkE5?=
 =?utf-8?B?TnlOM2E3ZC81elFTN3dhdW9zNktSRHo3cC93aUhFNytuTVZxS3ZtTG1QSFJL?=
 =?utf-8?B?TUlXc2VnOG5ZMnEyL2JVZ0pOK09sbFlWMmpuc3IwSnJYTFhLdG5xS3l0K0VW?=
 =?utf-8?B?a2pPOUpic2gxa2pMOURyL08xYVdTYjBkUldjYlNFSTJ6dVdjQnhONlgzTmRJ?=
 =?utf-8?B?NDliMW9PQzVMdU5rK29DajhhRklTUmFEY0ZrWE0rcWNibDZVZFpCOVpKc1RS?=
 =?utf-8?B?NXRQQUtDazYyWkVkeW9rdElySHlkQUhwMEUwZnRUSVVVcjRwR3MvTlFRM0tI?=
 =?utf-8?B?Umg3K3hQUG9LMEcxS3oyaUNRWUFFR1FrRXVyMDBHWWZYeS9FbVhVZE1sTDUr?=
 =?utf-8?B?anFlNnpLUFFQaDlYbElvWmFldGZlT3d3ZEpQZTI0bEs5WjE1SmxUWXBhVFJj?=
 =?utf-8?B?WDdkcEsrbmR6aEpleXkyekptTzJDeE5VNm9sKzM5S1Y1ZjN1UFd1MFVNWkhG?=
 =?utf-8?B?WmRxVkFsWllkNFNUeGpKbmY4blVKblRZM3NUZjBoajE2NmRvcXd0WEg2YkJM?=
 =?utf-8?B?RnppaHR0c3liRldXUjF1ZEo2S1pNZzV0RkV3OW1aQkVvc3RSTHNPZGpjOHFD?=
 =?utf-8?B?VmtWanJRT3pwY1pXdlBlQjB2ZmxzbGNLeWNXNkYzQ3RQdlpxOXFFL2g0d3lR?=
 =?utf-8?B?ZUpGWm5FdjF6WWY4ems0Y3lxTzdGR01la0RMaFdNRFA4U1ZhWHV1R1BHc2dO?=
 =?utf-8?B?bGNQSTdwRFpWWi93RWl5OHZaWVpzaWVKVmszd09JVnhPNFk3Qkpsd25CWFNG?=
 =?utf-8?B?a3VoTG5sL25uZDlKSXIrQmpXSTAwTEk3WEVNbUxmeVY2Tmt3UFUvNGx0cFcr?=
 =?utf-8?B?OFVXZHdUS2FsQlZ3SUxxVzhoSlNON0RhMnRTclJvWTB0anNhY0J5S0ZIbUlI?=
 =?utf-8?B?UVRYWGw1WXdKVnpPd1YwTEwwQmdSUWY4THF6eExRNmc2MThGWVNKUlN2ODll?=
 =?utf-8?B?RHBUZHRyYUtKS0g3ZWZHQXV2OFhSbXJuSTBqcUl4eXRSVjJ6eXhPbEJ3Q3JD?=
 =?utf-8?B?YXd0eHo3SEZDUmhXOEZhZWNVcjNNSGR6MDFwVjF3TjFYOEp1c1N3L3c0RVFx?=
 =?utf-8?B?MjBNdXhmNzBXcDUzNFpJeGdMamJXWWxaWDBSbnZaRnV4MVZTV3gwUExHNStZ?=
 =?utf-8?B?TXpsNWlLRXl1UTcxMm1hUXRJWHhlU29GNnZEekllK3pGQVFrSzJVOEpCNHNM?=
 =?utf-8?Q?lL3OdRtoZSo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(10070799003)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RE9jWFFOdFdJTGVrOTNqK3hQWW1sbDQva2s3d2F3ejIvR0tobjN6ems2emF2?=
 =?utf-8?B?QmM1SEtSVUZta1UzYTgrcmxRdWlkeG1QT0RMSXlhMkJMKzlXL2xCOUtVV0RE?=
 =?utf-8?B?a2RodTlDYldzcVN1Z0J2ZjAzUXNqRFRQdlN5azVVRWtTSHY1Vko1MStnNG4y?=
 =?utf-8?B?VTNHNDZLOE5HSlNtd0ZTYW0yMVZ6OVV4NXhTUFZzWGh6bWh1eFlybitPMWVz?=
 =?utf-8?B?MktZZjBPVkxQWU5OVHd2MFNVVWcyd2lTSVNVNDdnY1dzRnJONVhTUDh3WVFE?=
 =?utf-8?B?b3JEeGVVaHNmbmFvaUdJWkJjOGlLWVlQNVJPVWw4TlUrV0RWVFVrb2V6elE4?=
 =?utf-8?B?UTBkazhJemRVRTV3bW5kbkxPeGF1bDRBaVBoOGVRQnIvSDFIUlZnc2hHODgx?=
 =?utf-8?B?Q29SNDJhT3lZa1QxR2lEd1dqcDVQWHJLNGdtUUMzZ2ZleHlOTWRpZFozNXFB?=
 =?utf-8?B?TWhZWjRsc0F0Nkp4MWtFc2d6M0ExYlNZQWRkbUFqbHpCSkttVFBKb2NnbDlL?=
 =?utf-8?B?Rk8yTStIVWsrbTdpWHNaMDhqQ050UmV0UXZMalB2c3drL0VEaURmcmpVbVh6?=
 =?utf-8?B?WkNyS3ZWbE8yNjZzMFhsbTBkVzRhNm9ZNHIxcFoyNithQUVSYXVuVXZ6bTFP?=
 =?utf-8?B?TEhLYlh2MGd2eUpqb3NRdGRDTjZMdUgrbkQ3QzMxVnBnQThCQitaVVZpcFZK?=
 =?utf-8?B?c1VFRjZKdG9kNEdmdUZVaFJKaWwrY2F2V2pQRTRKcEJNYjBKOEVNZzFINW04?=
 =?utf-8?B?NU5oS1ltN0JlUmwxODVxejlpWnUxd2ViSmkwOUF0dmFtNzhSdmV3ekNSQWwv?=
 =?utf-8?B?dHU2T3JwZEt6UWdTYm9wa2RoODF2eEsrdUxyTjZGYWJkVHUxV0hhYUYxMmRY?=
 =?utf-8?B?M3VmMEN6WGNybXFwd2V4NnY4QmN0cnVvRWEzbVJYUHBodGtSN0lTQWhRS283?=
 =?utf-8?B?RVEvcmgvODQ1bmpSSGJIaXh3TkRVVERoSkVXMC8xaXVaK2JIVHc2dDRrSTFE?=
 =?utf-8?B?WXQ1TmpRYWFRZ09lS2JLRVE2TkF4MzRRRjY0MDMyY3AxaWdxU09iSSsyM1p1?=
 =?utf-8?B?Rm1SZUlMa2ZRU2w1bThjMWdwWHVCTW5KdzNnZWFINlBlNThiYkhnZEY3NTlr?=
 =?utf-8?B?QndQNHc3N3l5WWI4eWgwU1NCZWRjVHJPL1Frd3ByZVRtWmhLRHJyTFN0SCtC?=
 =?utf-8?B?Q3V0RGZZU3FHZk4wQjRzU3RJdU9oS05SYldTZGVIWVZORmV5S0F0QUxnWjlX?=
 =?utf-8?B?c1FGNUVjQjlSeDJHQUF0U2JUNlRlZ013ZWRhVmdpSlpubHY3Q3N2UnJsVnJH?=
 =?utf-8?B?SXRYWENrTDh0YzRXM1I1RjEzTmNONmJhYXMxYSswQnZTTHBjT00zSUx4alNz?=
 =?utf-8?B?RjEwMzVqUk1oWVhUL1VuWmRZTWhPK0RhRVRzVURkYVJ5U1ViQmM2VkVPMGRS?=
 =?utf-8?B?SlR6SkM4SGcweVNkT3huQXJQdTVvL2ZqMXZEV0R5amE4dnVyNmo0amQ4ek1N?=
 =?utf-8?B?T1JtSHhxb2xhbm1oZkwvZmk2blFZQ25sNmpNQVZXK0wvM2tzM050OWJTb1hN?=
 =?utf-8?B?TU9leXlvSUZacjJPNldKZFBqUGxxbjNoMXFMdEFzZnRrVHpHeHJYL2ZWOENp?=
 =?utf-8?B?dFRUOUxzN3VyajdUbTdwKytLSEozZ2ZYSXpSOTJ2VytLS1JmMTZuYWhoU0Fu?=
 =?utf-8?B?aDhRK0FHa2hTdHE2cHRmaWNPcGlnRjlrWFQzWlVMSjdmNkxkUzIyT3ZWbXB3?=
 =?utf-8?B?Q3krTWlEeFQ5eStxMHZLSzQ5Si9RMWVsSEMzcUQvTHpZeWVSanJCWDVOQXNi?=
 =?utf-8?B?SnBmd1AzandXOHgvZXEvam1ZNDk1WjBWeEVNWUMyQS9HSDVUYWJ3TEVBTW1o?=
 =?utf-8?B?dUUzRmxwMWp6SGVGWWxyUk5HT2ZDL21kaWdtZWx1OEcxODdJS0Y0S2hiaUJx?=
 =?utf-8?B?MFF0V3EwT0lsMHJHbjdybzlJSnNQa0xjYWlMSEwvMjhyeEY4RjlSbmV5Zm82?=
 =?utf-8?B?bHI5L2hza0FGSnBDbldUSVJjVHVZTFRCSllEdlVzOUVsUlYvNFNOYjd5M2NH?=
 =?utf-8?B?cHZsUjNkbWh6MGNUT3pGMDVQanFYNkk3b2ZBampyN0RnYk0vdEFaS3pWdmRI?=
 =?utf-8?B?Vy9VN0xWMzhLa3d2SU92Tmk1NkdmQXhXMmh1WnFMNUlTQU9TK3BwZWx0ZWVQ?=
 =?utf-8?Q?OkvTZU438/MM6KJTd20hUTn+Ur0OheQ3Jh0rcgobIHQ4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52710a21-fecd-4e69-f2a1-08dd82cdf680
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 01:18:47.4674 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9EOy14gXyM502BHxohQo++Aa2oGUU/js/hC6wRHEH34VTtBKuBzBsfxb6bP+GWg8EGjATfTnb7lPU+tPNsTU1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9517
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

Since this just renames fields, would you be ok if I squashed this one
into the relevant patch of my series, alongside a

[joelagnelf@nvidia.com: give better names to FalconAppifHdrV1's fields]

?

On Thu Apr 24, 2025 at 7:54 AM JST, Joel Fernandes wrote:
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware/fwsec.rs | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-c=
ore/firmware/fwsec.rs
> index 664319d1d31c..79c21db9d89d 100644
> --- a/drivers/gpu/nova-core/firmware/fwsec.rs
> +++ b/drivers/gpu/nova-core/firmware/fwsec.rs
> @@ -29,11 +29,14 @@
> =20
>  #[repr(C)]
>  #[derive(Debug)]
> +
> +/// The header of the Application Interface table, used
> +/// to locate the DMEMMAPPER section in the DMEM (see fwsec.rst).
>  struct FalconAppifHdrV1 {
> -    ver: u8,
> -    hdr: u8,
> -    len: u8,
> -    cnt: u8,
> +    version: u8,
> +    header_size: u8,
> +    entry_size: u8,
> +    entry_count: u8,
>  }
>  // SAFETY: any byte sequence is valid for this struct.
>  unsafe impl FromBytes for FalconAppifHdrV1 {}
> @@ -169,14 +172,14 @@ fn patch_command(fw: &mut DmaObject, v3_desc: &Falc=
onUCodeDescV3, cmd: FwsecComm
>      let hdr_offset =3D (v3_desc.imem_load_size + v3_desc.interface_offse=
t) as usize;
>      let hdr: &FalconAppifHdrV1 =3D unsafe { transmute(fw, hdr_offset) }?=
;
> =20
> -    if hdr.ver !=3D 1 {
> +    if hdr.version !=3D 1 {
>          return Err(EINVAL);
>      }
> =20
>      // Find the DMEM mapper section in the firmware.
> -    for i in 0..hdr.cnt as usize {
> +    for i in 0..hdr.entry_count as usize {
>          let app: &FalconAppifV1 =3D
> -            unsafe { transmute(fw, hdr_offset + hdr.hdr as usize + i * h=
dr.len as usize) }?;
> +            unsafe { transmute(fw, hdr_offset + hdr.header_size as usize=
 + i * hdr.entry_size as usize) }?;
> =20
>          if app.id !=3D NVFW_FALCON_APPIF_ID_DMEMMAPPER {
>              continue;

