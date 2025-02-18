Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E03A39DE2
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 14:47:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D801510E6CA;
	Tue, 18 Feb 2025 13:47:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kyvM9Odf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061.outbound.protection.outlook.com [40.107.237.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F00DA10E6C5;
 Tue, 18 Feb 2025 13:47:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bjr/imw3OrGXMh3n6v4LgaorrPZJgJNX3sx8xOXukIy4i2pcWHI9zhLYJUBBWYZh7PkME/xEf11rS6d/qber1M56vhlB20pSR8/goYGMyzJSoLIyKVKEBiv3z905zxLUqljFLYGNsCtF45DmH6rb37M75fC5i0RdAhw50KEvCRnjq35n+qmq55cmke1izVSL3monGyzTLnSBtd2ypJ+BiaT8IrtnZinrJ/rfYW5T+Lq/Y7t8su9sVj0VlUv9pveSXtZTsHFU26MkwYCehBOOmBX2OTz8b2DY6DppuFZsPt4/rRkqPBBP+FpqCIafE28l5o79eqnsQkOsS7qSZcJ//Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VbGVIDHjzNH1PW1JOTuuiR9shfQah7qgZqId2oALaa0=;
 b=Yuwb7zGgZjlqN+8RP33b3UBVqm+f6oaQqJqQKfskd00qgogdqRTbouPQghc4nDZOTJ2hHRIO7nRt3OtOmk/EBMa04PKs+M58J6Azep8FethOIGTEwT29nZzRVAMp9dbcpQ6UqFFc91zJxA9GK9oKFdc5EtMcyeQ+qjiDc9LGoGwFOOLacmxBvstE0yNmh90V0TGl7UoYuT1vE/nVzlMxsxUWmOq1/9/BYMGj3+7XpoooN22/6Sk7juFEBWes5/peNs7tb6Ujm0xOUsdV3EdIzx4neAtlmVvHIsVLWIT6qwduO0Pm3IuS+mPMaL6m0dsp5QGNhJrH94quDKUpBLxTng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VbGVIDHjzNH1PW1JOTuuiR9shfQah7qgZqId2oALaa0=;
 b=kyvM9OdfMn53aGDdu0ADzUrJ/MCI4dmy5fL30Yd+FOMbLdmjeoKYd4H0j50vaM6A5iwrKOMCHS9i6nxZaA4ftEDcfdVywRxFWIhQuyTDj5SH7ZScvhMCrEEt5EACEIWaE8UfQBGjiFB5u4wN+Zh7pK6XpGJT/wpkz68J3gAfZYvzYMJO1s1DcOB8AaaMtZKDQGh80bestcWhkuzu8ZYAxneCArh9RHXb3UymkDp06KG2vbffjAmIK6vVyvxGOY5J5J2OUJPDrQeC8e7Gm55P97RWzFSk0Eqm/NYQqSFfZf8XtV12g5IfQyUNW3tRqBLmnJhzXYhOrDOi3wAp3pKEqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB6750.namprd12.prod.outlook.com (2603:10b6:806:257::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Tue, 18 Feb
 2025 13:47:25 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%6]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 13:47:24 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 18 Feb 2025 22:47:21 +0900
Message-Id: <D7VM9OSG4PT8.MZOGCKO1HTM@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Dave Airlie" <airlied@gmail.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "John Hubbard"
 <jhubbard@nvidia.com>, "Ben Skeggs" <bskeggs@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250217-nova_timer-v1-0-78c5ace2d987@nvidia.com>
 <CAPM=9typO2VQYDmn8LE+aEfsymqUjQZLrY60mJ30_oujyDD9ig@mail.gmail.com>
In-Reply-To: <CAPM=9typO2VQYDmn8LE+aEfsymqUjQZLrY60mJ30_oujyDD9ig@mail.gmail.com>
X-ClientProxiedBy: OS7PR01CA0003.jpnprd01.prod.outlook.com
 (2603:1096:604:251::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB6750:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ff5a39b-d18c-42fe-4edc-08dd5022c69b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eHcyaEJwU1RuZTB2ZW9CN1BPMmN0QWM2aVBLY05FM0ZMdGJKcDk0dkNNeW9F?=
 =?utf-8?B?UjFicDR4SFFIVlJKeENrcDNvTm5zN0JMNExhZUJZMVZyNWpSazVSNXQ5bGN1?=
 =?utf-8?B?aVJzUXpBZS95NFpTUTUrL29rekVaMldSbjBUazNWejl2MFM5dDl5bzRsVXgx?=
 =?utf-8?B?Ym9qbktYYWY2SGxsSDhKNHVUYzVoTnN2Vk1WUHYrR3pPblRoZk1tN2NUaU5R?=
 =?utf-8?B?Q1c3Y3lpUGkxMjlRaFVxZ1lGaVN3dC9EOTdYeWwxZmljUGlKc2dUV1FCSm1O?=
 =?utf-8?B?ckFEeXh5cmZlWldCNDEwQjgwODJmQnQ2T3BWMDJuVHQwTFVFZDg5OWRYZEw3?=
 =?utf-8?B?MkdvcHh0RUFPNUtmV3Vsb1I1Y0NJalFqbVFueUZ3anBleFYwM2lTbUNXa2tX?=
 =?utf-8?B?eHZKTnZRWE5Va3BEcVRROVNhNUdMMXdmeXFDaDE1UHE1cXVLeEFWd0doL1B6?=
 =?utf-8?B?QXA5UktqRVNHWW1MUUw4bW5PVGFrWDV4bUtRSjFvZzlZVXR5R2EwSFZkdkRy?=
 =?utf-8?B?TzYrS0xNSXptQStxTHIzNzlYZkhQRVR2Q0p2clNmME5FQy9LSmFLS2VnSDdX?=
 =?utf-8?B?cTVaS0RTQ2hXNWdKV01vajFIU09OWG5vcXJDSmhpR0owWlRmYWxtNmI4MHlE?=
 =?utf-8?B?Z1RTeUp2U1VRWXJzQWxCckgwM3ZtazY2VGtocnVpZitOUzNtSU1XMkZLakR0?=
 =?utf-8?B?OHozdzZkaFBwSUpadTNDMURNMGdYNEJCbE5PR1JKdUZ3Z0YrRkJTcktUMnRE?=
 =?utf-8?B?MjN3enlWakJTSERvK1dEUEcwTWZ0OE5iN1hXeVVsMmRWcWlVQjJJcnVQSmpi?=
 =?utf-8?B?RWE2LzZaM1lYaXQvb1Zycm5qQVd2b3l2ZmJodFRkb2MxRThIQ2FncmNDL0lu?=
 =?utf-8?B?NElmV1BWUUZFUEJoNWtRcUdUSGRoaEZFU3VtNXZ2OVBXejRuZ3RUUXNGTzZo?=
 =?utf-8?B?ekJlWUFzUHp2MTI4b2VVc2pwK0FJS0ZNcHFzSzhBd0VxNDEzK09xTVk0dFZT?=
 =?utf-8?B?a01PMmxIUkJWUlBXY0xGRkJHZXVuRHBhVkk4N2hkVjJTLzBiSnNBTTJkVFFu?=
 =?utf-8?B?KytLOGx5bVA3WWYyNTJoQkVUcWQ1SkU1aWtBdE1zNUg5ZzFYRXppLzJmdWNF?=
 =?utf-8?B?cEZFbzJCalVjcFVjb2xEU040KzFkMElZcU1RdDc1d2k1dHU0bUlya0dVcGZl?=
 =?utf-8?B?RkdKcTV0VE1adXlVdHNGbjVJY25PaW1WWHQyRlJGWlN3SWU5T2JoTWtCbWIz?=
 =?utf-8?B?L1dPbmY0K1V2Q3dlMGR6VkZKQmUvNGhzV2g1NkYwVkhxcm4wZUdpTEdka3pG?=
 =?utf-8?B?U3hycy81a0ZEblhIZ3NQK3BnbU9nUjlkQUpNaTNwekFmaG13MkVsNjh3Y0pN?=
 =?utf-8?B?NmpwdHMxamJIeEQxZFNEYzZUSDBsUjhLNVdkM2JuQjJibDJFNHliR0hvU1I4?=
 =?utf-8?B?c2twNFlGT25QakQveXpVQ3hKQ3ZxTTRxR29tRFBqbllZRVB2NTZGMkZIekhp?=
 =?utf-8?B?SEVrNjQ1bHp6VW5scmxNMnFRaEtvMWpqbHdJUWRqOTJrc1NlbFhCeU9tN1JN?=
 =?utf-8?B?WWVnM2ZVS1dPY3lKTEVoTUZESTZ2Qjh5dHF6bDBvMFhHdW0zNG1ZSDJMT3ha?=
 =?utf-8?B?M3daSVU0K0VpczJlR3ByMThLbkJtUDdjWTc3WUZMbkJ2Mnk3VVlPTnY3OFlh?=
 =?utf-8?B?b2ZMQmhxbTFwL2lKL0dYZmlXbm5VQ3JZaDYxVmxZUE1uTlJJelpPNzFjYVFC?=
 =?utf-8?B?bUp0WHljR3BwT2FQMWpocHpqeFhMZEc1TkhuZ1BCRnYxNFpiS3FiNFkzeFh0?=
 =?utf-8?B?cmdKbHBobDZINjFOS1dVci9KVitDRitweXp5cFBOcHk3NmNaYmdsMmVHVUpR?=
 =?utf-8?Q?9mvBCv4EO0uyp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(10070799003)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0JYZjFNRTBFaVRKN0hucm5IK2FVWFZhaUdOSFpVaSsyTHZaeUlodkdvYkZv?=
 =?utf-8?B?MTdqWG1rWDhYZnVMTDN1Vkt2NDFPT1ZRY21LOURBZVFac3V6L3pQaFU5TWg5?=
 =?utf-8?B?V05RbE9mWTNwV3BNTnRYL08xQVAxKzhRckdVOXNLNUY1c1hNZDJxREVEYXpz?=
 =?utf-8?B?cjFBVFlWc0N5WGlMWXRMUXpKOWtqdzBsSHFWTmVsNldGK2tzM0NENExYTzRa?=
 =?utf-8?B?VFdVcWF1akloQ0NJaGVDeVBPTWsxcXRKbnJpcWxGdm1ZTmpKMk1qbkZ2UjVo?=
 =?utf-8?B?MURkcEw4MU4yRzN1K21kTDl2L0JCNFdHVE9ac25ZdG83SXZOYlJzRzN1RWJR?=
 =?utf-8?B?RWRDVkZ5YmVVdDMwZkpYUlp3T1JwS0c3MmIyZThYSjVHQ01oSHJqYy9jZ3Qx?=
 =?utf-8?B?SjNuZ3l6MlVhKytQRU00OVB0L0JORXZ4aVpPY0FLdzhpa1hZT3YxTjhCTTA3?=
 =?utf-8?B?bmNvN0c1NTZ4Kzg5Z25tMnFsaFZBMlJ3RndUaGQ0cG5wclVZZXMxQWJxU0Rl?=
 =?utf-8?B?V2EwZHc2TFlmNnZRQ2JONHdaVzdaWEcyaTk4U1IrVGRQKzh6TUtzSlNQSmhS?=
 =?utf-8?B?c1VTWkIyM2xQNkY1bGNVOEJFTk9yYmR4ZW44N2cyQlFPcGJCVnBGbjhTbE5k?=
 =?utf-8?B?bEhYZ09GRlRzQmM4VVJJdjZzNWQzYWNEMURVT1dsNmdoc0dURWRkSGpwUmNk?=
 =?utf-8?B?OGVGbUtkc2ZBTGl2KzhBMTY1QmFzNUtPOHhMRW1xN0dyRWJGai9oVVRuTDFo?=
 =?utf-8?B?TXE1dGZHNEhUSWJZSjlDb053d1VEcDAxS1hjQlZlZjEwbTVSQ2N1d0dCZEFO?=
 =?utf-8?B?ejgza3pUVmYxbmFIYmx2RHpYYzhjZ2J1U2p5Q051RU92MEVnZlZndENaSTZw?=
 =?utf-8?B?UEVOdEQvY0ZKd2hvWW1VanVvd09DNzVUMDcwbjVsTklYWG1sV290VG16MTF5?=
 =?utf-8?B?N1lYUS9DekJCb0NVZDNVMkZRNzdWVEtpSFVDT1F0QzdpSXE2ZGJZWnZHbmNB?=
 =?utf-8?B?WFd2RGUwaFFiYW1ISTFHalNZVkFrUCt4NWxLc002NGV3QUNQUzVicWhoRWhJ?=
 =?utf-8?B?L0JFdTA0SitqQ0ZPR3VXOWh3UkR2TmJYYVlNdytzbDg5MmZoT0JVT3dRcFE0?=
 =?utf-8?B?T2ptWGU5K09QcEN5M0IwaVVwQWltRXk5eTk0SFhoTTkrYUVmdkZQQU4ydVdk?=
 =?utf-8?B?NThQaVB1MzcvWTg1bXdvZ2wvbUhMMlFwMnVkQS9jSWE4OTUwcVpWN1Z2bGFP?=
 =?utf-8?B?c2ZIKy9qKzlUeVhYZGpmMUhzYTZ5Y2xncG81bXh4aUF0UXdkK3V3allNclBV?=
 =?utf-8?B?cklCWGg0WXAxck1rUGhLZXpuQ05vbkVZZVViL0M5TDJqUWYwSXB2dU1wK1Zx?=
 =?utf-8?B?SGZGN2YvblJFUVRmSXZNWlVEN1gxN21yV2xGY0Nna2VaTDgrS3ZCREIvYjl6?=
 =?utf-8?B?R0lIUDc0TjFJZERaUC9ZZkg2ajY1OWR4MEl3eWtCdzc1SGY0ZElPRDF3Zmhv?=
 =?utf-8?B?V09TcFYyOEprODg1cDdWeWt3cGF5TzJjN2pjOFdTbnp4dGtSYWRuSzdSUHA4?=
 =?utf-8?B?SUMwOTBsN1QxRW4rL2IzY01IRDZVZHJuV2N6K2cvdDRXRjNBQXhIMFVGVFd4?=
 =?utf-8?B?UE0rR2UvRXZwVm5OcWEzVEFiQ01IN2xqMnMvR1hoMTFqNkZqRno1UTJCNUNE?=
 =?utf-8?B?NVF5NW9xYWsvSXYyU084TGZ3cm03MnVsMWtRYlFpRVJDanV0RXZNelUyYW5z?=
 =?utf-8?B?RW5GUG9YRG9vMC9GNHdNdnVTeDBkNmREYTNoYkc3Q3ZJWDFqSkxkck0wR2hM?=
 =?utf-8?B?bG8wdW1DbUV6b24rQW9SN3RITXpKV2QxQWpCazFqblRPbmtsNWtaNmJnY2g1?=
 =?utf-8?B?N0dTdmllWnZYdlVvSUlKM0xxbFIyZzlVSjJiK3FLLzJBZks5WUJlTWh2U1pv?=
 =?utf-8?B?UGoyclBJM0E4WlR4RVlKajhDZFRqaXEreVkwNmh2ZjlYeFkxakljdEpQZ1pa?=
 =?utf-8?B?Sk9PSXhNNkxVS2JlVUM5OEppV2o2SXVlbS9QU2FQSVJSbVZPNG0vcVJ6QVhx?=
 =?utf-8?B?SzRhMDI2NFpaZDBScmEwRmtVTkdXa01SSUI4VzR3Y3BKNUcyRFhWWnYyOXc5?=
 =?utf-8?B?YlJ4OUxTOXhrdFBDcW5SMUdFVXlhQzVrdmE1ZUlvUmNVbmZBUkxYdHpkS2oy?=
 =?utf-8?Q?sQyZZb1xR+6VX2WeiA5RtSM11ILX3aQUDeMT6B3dZuyc?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ff5a39b-d18c-42fe-4edc-08dd5022c69b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 13:47:24.9117 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Eh6WZDJdXyh6eDN7w1ddiPP2s/Ptf47b1C3l9RZ17XQETM9guI+ifZMs9QEyHBL21JqwGdWZHXDI8r1fn4/CJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6750
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

Hi Dave,

On Tue Feb 18, 2025 at 10:42 AM JST, Dave Airlie wrote:
> On Tue, 18 Feb 2025 at 00:04, Alexandre Courbot <acourbot@nvidia.com> wro=
te:
>>
>> Hi everyone,
>>
>> This short RFC is based on top of Danilo's initial driver stub series
>> [1] and has for goal to initiate discussions and hopefully some design
>> decisions using the simplest subdevice of the GPU (the timer) as an
>> example, before implementing more devices allowing the GPU
>> initialization sequence to progress (Falcon being the logical next step
>> so we can get the GSP rolling).
>>
>> It is kept simple and short for that purpose, and to avoid bumping into
>> a wall with much more device code because my assumptions were incorrect.
>>
>> This is my first time trying to write Rust kernel code, and some of my
>> questions below are probably due to me not understanding yet how to use
>> the core kernel interfaces. So before going further I thought it would
>> make sense to raise the most obvious questions that came to my mind
>> while writing this draft:
>>
>> - Where and how to store subdevices. The timer device is currently a
>>   direct member of the GPU structure. It might work for GSP devices
>>   which are IIUC supposed to have at least a few fixed devices required
>>   to bring the GSP up ; but as a general rule this probably won't scale
>>   as not all subdevices are present on all GPU variants, or in the same
>>   numbers. So we will probably need to find an equivalent to the
>>   `subdev` linked list in Nouveau.
>
> I deliberately avoided doing this.
>
> My reasoning is this isn't like nouveau, where we control a bunch of
> devices, we have one mission, bring up GSP, if that entails a bunch of
> fixed function blocks being setup in a particular order then let's
> just deal with that.
>
> If things become optional later we can move to Option<> or just have a
> completely new path. But in those cases I'd make the Option
> <TuringGSPBootDevices> rather than Option<Sec2>, Option<NVDEC>, etc,
> but I think we need to look at the boot requirements on other GSP
> devices to know.
>
> I just don't see any case where we need to iterate over the subdevices
> in any form of list that makes sense and doesn't lead to the nouveau
> design which is a pain in the ass to tease out any sense of ordering
> or hierarchy.
>
> Just be explicit, boot the devices you need in the order you need to
> get GSP up and running.

Right, I was looking too far ahead and lost track of the fact that our
main purpose is to get the GSP to run. For that a fixed set of devices
should do the job just fine.

I still suspect that at some point we will need to keep some kernel-side
state for the functions supported by the GSP thus will have to introduce
more flexibility, but let's think about it when we arrive there. Core
GSP boot + communication is fixed.

>
>>
>> - BAR sharing between subdevices. Right now each subdevice gets access
>>   to the full BAR range. I am wondering whether we could not split it
>>   into the relevant slices for each-subdevice, and transfer ownership of
>>   each slice to the device that is supposed to use it. That way each
>>   register would have a single owner, which is arguably safer - but
>>   maybe not as flexible as we will need down the road?
>
> This could be useful, again the mission is mostly not to be hitting
> registers since GSP will deal with it, the only case I know that it
> won't work is, the GSP CPU sequencer code gets a script from the
> device, the script tells you to directly hit registers, with no real
> bounds checking, so I don't know if this is practical.
>
>>
>> - On a related note, since the BAR is behind a Devres its availability
>>   must first be secured before any hardware access using try_access().
>>   Doing this on a per-register or per-operation basis looks overkill, so
>>   all methods that access the BAR take a reference to it, allowing to
>>   call try_access() from the highest-level caller and thus reducing the
>>   number of times this needs to be performed. Doing so comes at the cost
>>   of an extra argument to most subdevice methods ; but also with the
>>   benefit that we don't need to put the BAR behind another Arc and share
>>   it across all subdevices. I don't know which design is better here,
>>   and input would be very welcome.
>
> We can't pass down the bar, because it takes a devres lock and it
> interferes with lockdep ordering, even hanging onto devres too long
> caused me lockdep issues.
>
> We should only be doing try access on registers that are runtime
> sized, is this a lot of them? Do we expect to be hitting a lot of
> registers in an actual fast path?

For this particular driver, I don't think we do. But other drivers will
probably also have this issue, and the challenge for them will to be
find the right granularity at which to invoke try_access(). My worry
being that this can explode down the road without warning if invoked at
the wrong place, which is the kind of behavior we are trying to avoid by
introducing Rust.

>
>> - We will probably need sometime like a `Subdevice` trait or something
>>   down the road, but I'll wait until we have more than one subdevice to
>>   think about it.
>
> Again I'm kinda opposed to this idea, I don't think it buys anything,
> with GSP we just want to boot, after that we never touch most of the
> subdevices ever again.

Yep, it's definitely not the thing we need to worry at the moment.
Minimal static set of devices, and let's get the GSP running. :)

Thanks,
Alex.

