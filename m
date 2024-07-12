Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DCA92F95D
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2024 13:12:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54AE310ECA6;
	Fri, 12 Jul 2024 11:12:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="J6klnqzW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2058.outbound.protection.outlook.com [40.107.215.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9786D10ECA6
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2024 11:12:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rnV8M2kYSPGXAEBwzd0lYbqZyzQIcSBEjkRrYqr50lpxchgv8IZUQsOxQp86E3nqv0fZtVSCy2Ng1o059qMqeUIhrneH8+tWoW6drOiJLVwpgwHefPRruq8lEvXGIA1cKKVXWSRE2esTfvdlFf+kDfB/GmZ8/0Q8QzLO5e7a0IvemjW74ak6nj/AqLu3Q2t6EbnuFYRljphImUBAi9oIYZsy3vyF/VToOonLJ8DVv0+9T7TdglqWa58Qq9kjsMI7sglf7yX+SGpu4fveViEFlGt+cH4pOF51znR7H9Jtg6BWZjBgk20yoPsEC9/SDD+isf0QOUUGdwB9x12cl/dU7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T0S2KkNucggtLevqbnpLvmLCKFifXUzjOsRdiGZX+I4=;
 b=btfL9puQsMAZVHUZi1qGDQ+sFEsIoL1wLVkHsDqgNQ9DBSFBaLiXYX4x9AI8OcyGE9tItmUiXRIUGYtgyc+oK5TNKkA9C+vZJRffZwre0KJwrRM+hQHPxBZ3p32P1M40UGZKkdTekb4vc+qqg+oTvDKCIRa8O9ueJ+z5lGSS1P7MWB4jt8CBEL1662989zVKHW40ICfG0kaHVBxR4vsk917kbCDZugFcF3RDJTXCBzD5J90bqrAaDPEHYfL7AZcQzIx/5xCWEUYLBjhAJ7cy9fL360gjSUTKkocIihO+GTEpSq7vW5wKIV/DmI6r+qA7wt4KozKP2KRdUR5LztCP1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T0S2KkNucggtLevqbnpLvmLCKFifXUzjOsRdiGZX+I4=;
 b=J6klnqzWb3+1qKh3oORxuwRL/nvxSRPfmuCq1yPIy48gvyaP1luLIxOzSOKjlqWDzdhj6vczU2hLhnRBY0c5fEXUrAw1CetSxsgYdX57K+O3/69UhRVdQT7zyKZB/novYntmEV6kZVOE1zts4zKDXulRcSLoWdK3H8eW89CTA4aUI58ccp3o3mhpaEoYIZzt32JqzFHtoJKWR4E81zlSwjpNFUARkNlwwYwdWCMqlpCW9rCqR9SJOreZf+A4dDnScUopRqDhBmcLXYIIM/NUFheMDFagHerCAF1/7mqm+KztEVBmiZ3Tw6XiZHgs8mzef6RRGhyjcWe4BbJWTxYvJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by JH0PR06MB6632.apcprd06.prod.outlook.com (2603:1096:990:3f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23; Fri, 12 Jul
 2024 11:12:06 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.7741.030; Fri, 12 Jul 2024
 11:12:05 +0000
Message-ID: <10607b3c-03e7-4a78-ad43-05e11408ef00@vivo.com>
Date: Fri, 12 Jul 2024 19:12:02 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dma-buf: heaps: DMA_HEAP_IOCTL_ALLOC_READ_FILE
 framework
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
References: <20240711074221.459589-1-link@vivo.com>
 <20240711074221.459589-2-link@vivo.com>
 <5ccbe705-883c-4651-9e66-6b452c414c74@amd.com>
 <a95dece8-b530-4add-a664-ebab81f8b5d5@vivo.com>
 <63189ac3-7725-4ad7-966a-4ca679a25d12@amd.com>
 <72cfdad2-ba33-4b90-acfa-7e50b8d9ec51@vivo.com>
 <ea841c1c-fd7f-4958-add1-d3e96f68a11b@vivo.com>
 <df605c4a-56a4-44cb-9b7c-d466f9cc80ae@amd.com>
 <80426e64-d334-4e61-8870-a3da08705f9d@vivo.com>
 <6d18c552-37e0-4566-8b63-b0095239bad9@amd.com>
 <54d2d0c0-a620-450d-9d16-6d106ab62414@vivo.com>
 <9b70db2e-e562-4771-be6b-1fa8df19e356@amd.com>
From: Huan Yang <link@vivo.com>
In-Reply-To: <9b70db2e-e562-4771-be6b-1fa8df19e356@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0030.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::15) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|JH0PR06MB6632:EE_
X-MS-Office365-Filtering-Correlation-Id: 727d453e-ef06-4dfb-0c58-08dca26376bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NTM3WGtvWkpoR0ZFTDQzRFFjUHI4eUlLQjFsZnA1V1FGdWQ3UllOQ29maXN6?=
 =?utf-8?B?dzBDUlAydTJaSldmOXhZYkFRbGZmK1gvMUdLN0ZIRzBCYUxXNi9ZRTArMTNY?=
 =?utf-8?B?a1BEdnVHaVB2M29BYlcyVTBHV1ZOMWJwWU0rSXJyTXhjMHlCRjRkV3YrREgv?=
 =?utf-8?B?SE9LUURJL1g0UVk4ZDVwajVLdUpYYlpScnZWckZHWGNMSC9QeGNBTHNEWDYy?=
 =?utf-8?B?OGRpeDVUR09XOU5mNHlOTy91dGJNSmFLZ1lXRS9DTDZsajQ0MlBrRE14ZnE2?=
 =?utf-8?B?VDZSSkVCMDhFN0dvL2hNRUJPV0Q3Ui9SRlczWjRMa3FjMjI0WllyUndsZWJR?=
 =?utf-8?B?YzdYSzZCY0d4OWhqVmxLSENraDFFNDBXZVplS0dkSjkrOXA5eVp2QTJISUZR?=
 =?utf-8?B?aURxTVlOUWxYZXVXMTBnV3dlUFo4cSttWktxYWlzYVQ1VzN5UG5GSkpoODYv?=
 =?utf-8?B?UElqbmJvaFBHRHRVV256anN0dk95dGVKbUlUb25WQ00vMTk0bXVvTHdQK2pX?=
 =?utf-8?B?bTRRMzlVMnMxazNYMnVGb3dVbStzQ2lnMjVic3poMFpsek5wM3MxcWQyTjNW?=
 =?utf-8?B?ZVRVT0ZZenVSOWpETzRRTDFpRmkvM3VRbFZIUFp6dTRoOGc0bjk1cmJaZlBo?=
 =?utf-8?B?emlxaUZzVlg0VUYvOGNkMHI4RUM1NnQ4dThUeGp3TjVKWFMwM1F5OFQ1QzIv?=
 =?utf-8?B?VTY3M3UxZm5zRzBBWWVQYXB1UXZJZzZuUkI5MnI4eHJ5Mm90SmlFSTNqbzl0?=
 =?utf-8?B?aHJwOUVSVVNjejZnSzlmY1k4RENmRlc0TytxQTRMUExMSnJTOHo1NDVtK2tu?=
 =?utf-8?B?QkpNWGR3NTcvdEFFUjY4a05IZXF4MW5hMS9lQ25TdmNtL1NXY2lIZmRNNFFE?=
 =?utf-8?B?OVFEZy82bnBGNTY5Qm1neGxxUDZQTXB0aUxCemZIMXQwUVM3YWFySE15Sitq?=
 =?utf-8?B?QU82NzVaZ0tJdTFpSEdLRjRMMHJnTEh1eGZCREFvNnEyTHpBUUliZ29jTWVh?=
 =?utf-8?B?UDBacFFaQ09HeWk5R014QzlIMVlJYmlYMTc0M0crSTBIUDNVcmpEVWZtTms1?=
 =?utf-8?B?VFBFSGVEblVMd201NFpFdDlsWElCUDlraE9GVyt3enAxcCs0eVlvMGdVUVg4?=
 =?utf-8?B?SGVpYzB0eTY1b3hRdVRxWWNqMDFQZ0VuMEFibGM5aUVHZTRFUHJLTWwwWUJv?=
 =?utf-8?B?ZHI1TkpRakdCZVJlOVovL2xMYkJ5dkppWGNuc2xteU0yUTlzbHlQcm1uYmZ6?=
 =?utf-8?B?UDJmTHU4bFB2Wk9Tdyt5MVRIMjdtTmNhUklFZVhidHJmeVBkcmtFajJQYm1P?=
 =?utf-8?B?K08rRmRRbmsxaUdoaVZueXpwL1RjMEN4RFBCam5zcDErUCtTSkJBc0JVclAx?=
 =?utf-8?B?djUzWGxsNWRJb3ZWdFhNeGpkMVRrbTErL3FiL0Q3YnFKU3I0S3ZyaVgxdXFM?=
 =?utf-8?B?b09JUEtUMDZhWjJydVpKSk9mMFFGNjRpeEprREtlSEdMcVhIalVSWVZTaGdC?=
 =?utf-8?B?K0M3dytHWnVTci9OVkZCamplMmVNRWhiT2k1ZmNXeXNYMUcrSzJ5dW4wQkFR?=
 =?utf-8?B?NldMekJoanhZbTczeFBqMktteXZtemxlNzJ3VFNrUU4xc3VRRGUwUHhQdnJx?=
 =?utf-8?B?WVUvTUVLQXpxYnZ4cWFmOUJCbXhlK0NYZForNUp6MGVZWERDT0JlWGQ0YTkz?=
 =?utf-8?B?WENBbmpZZjZiejFORzhNcXdsOTljMy9vMXFJY0FYZ2d3YmVOTE9CUVhDbWZB?=
 =?utf-8?B?ZkhvcnEvT2xyak40QVpRcHo4MnpCQVJ1bXR4NlEvZ3g1cFBSRTRBYjRtaGsz?=
 =?utf-8?B?ZmszQjZNTDg2U0M3enBwYWhlZFFiUmozU3NEbW9xWFVDVmZHRHRvUjlycmNV?=
 =?utf-8?Q?YziFePXe8frly?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmEzaHdLWTlMcFBoWE1Tcmp2a2dHb0RQYU1Jd29hUmlIMG1CRFpOVGFpOWRG?=
 =?utf-8?B?bTdzbG50T0dIb2xwQUtCYkNaODVNSWkvYlVuemFPREwycE1BREJyVEd4amJE?=
 =?utf-8?B?dXRRbUYybWtSM0JXbGQ2YWxoeUROaGpLY0E3OFpMbGxtYXpQN0pqR0RBc2NL?=
 =?utf-8?B?cUZ1RWFLd2xTaHo0NTkxV0c0TDVhNXNJOGJyTDZLL0I3b2tFMEU5RjlOYU1z?=
 =?utf-8?B?bXBkMlg5dm5qbitkQ0dIVEFCOVV4Y1JvQjB0TW1pSmYvL1dhRFh0Rlp5djY2?=
 =?utf-8?B?U1Z5TDhhYldYcGk4R29nWHdkby9qTWRXblVDNHpsME1HYTloQXFzUjBuTDdJ?=
 =?utf-8?B?Sm9YYnh1dC9lZmt2TzgvR3BFVXBROEp3YnNLVmgvclpReTJBMWlRYk95d1Ey?=
 =?utf-8?B?V05QZlFJUlp6dnpIYXhxVkZuU2ZIQStKeDB6WTh2eVlvWThQakljQVhxc2lx?=
 =?utf-8?B?U21IU2RDOWhjMDFmSVk0dG5raTdhQXpjYm1HNzQraTdXOXRHU2ZkR3BsWmg4?=
 =?utf-8?B?Zlc1eVAweGVWdFJZK0lCaVJSQUJYQUdWaHJLZ0hGaTlaSzA3TUpEUXVyVTI5?=
 =?utf-8?B?VzVYYlVQRlM0NXlSMnQzYTQ5OUZHVHFuNkxXUnF4amRLTnhaU3hkMG9tbnQ0?=
 =?utf-8?B?dTVmVzhsQm1jV1hvVlNpSVp3a0RRMUh3RmIwVzVRdGlPZFdRNU9wTTNYMVph?=
 =?utf-8?B?R01USlBpejBtQXlleUFCY09hdTlVODZweDlibmJ6dVpocjVsNFVCL2oxekRu?=
 =?utf-8?B?TWxxNWMwTGlFcXRmZUl5SGNZLzVpeHVteEVRTTMvWGpTTk54QzNzWlVvZ09G?=
 =?utf-8?B?cjJJKzcvQzVEUG14b2pzcERBOUZrZ3VrRDFQMHYxNXdoaExJb3lNQisrWkpX?=
 =?utf-8?B?L1BvZmEzY3Nlb0R6VmpZWWpTcTVxUFcxZjY3eUpEMUJiY0NXc2JORjA1T3Bk?=
 =?utf-8?B?M0hQYWQ2UHpPZVNwMkprenVvY3lQdlJuc0FvOXNIcnNNd3k4TnZqRjFyUCt0?=
 =?utf-8?B?Z3BubFlJRHQ4ak5oVVBvdm5yZ3E5bWlDQ2FaTnlqaFZOTHhsWEpmVllIUzhw?=
 =?utf-8?B?U3k0dnBOR3pmRGZDVURMTGxWalgxVjRUdVZ0L3NUT1Z2NnF1VElTaDNady9k?=
 =?utf-8?B?MUpPTmNuaTE0ckExck9IS0FKV3VqUEVlYUp2aTNremE2alVlL2pQdnh5d1c3?=
 =?utf-8?B?RGJhcVhkVURONnFDUmZJUWhvTVVFSzZOSEtSczFLbkhiaHp1Q3ViRExtbm8v?=
 =?utf-8?B?Z1J6SmpSWTlxRG1pWGxMckZjSFgrMWlFWGVCZnRlQUxuVEVROXIyNzMzb245?=
 =?utf-8?B?cGY3blNPNXlTSXF5QVphSkZQQjF3enRpdVU5aUxvSzNabDZtRzRRem84enNY?=
 =?utf-8?B?a2hIK0FDaEJidXhOaHY2Q0svR05RL05YWm9sWVUwTW54c1NwdjNjckJxZTRV?=
 =?utf-8?B?b0NGbWY0M29NYWVuTWk2UXVJUUE4MGpqMURibks1WU8xc09SZjkwQ3RXYUtP?=
 =?utf-8?B?dkhYa1hiWFVtRGFkb1VrWm9GazRqcUdkOUpFMXRHL05xK2ZXblVNV3BHUDU4?=
 =?utf-8?B?TFA5YXJDbHZyM2dQalBabUcyM0MxeGJHZURvdHVGcVY5SWJFWWc2QkF2SDVl?=
 =?utf-8?B?cHVJTTk0OFRWSS9hVkJTOGFnanNmWVN2NlI2YitNaDVkNkd2emo3WnpseVBm?=
 =?utf-8?B?VkxsRGpnbEFPWG9ScTlpcVRlZkllYXBXSXlCRWdkQnVQcnp6a21JY2pDU0di?=
 =?utf-8?B?TjRyZXFmWnpoVTBTYVlDUzd1ME5ZRmdsSnpNWWRoVWhPaW5RRHloOFF5Tlc0?=
 =?utf-8?B?MW1QQTdTOG5MdmdsaHdySURrYTJjZjFoT0tKZG1wUE9rdTJmT2NSOFF4ZE1D?=
 =?utf-8?B?amUzcXZ5TTR4RnMyMk0yMFp2aDR4bTFZT0ZnRU5tZk1vUzBRMk55TGJ4N1F4?=
 =?utf-8?B?R0N2Z1hvRXYwVm9oZjdsL1JNUVAyOXdtU3FMalQyMkltNENvd0V2dUlCUm5h?=
 =?utf-8?B?eVM1SU5ZNEhwbGdRT1Z6NFZjakVpMFRPdHdUbWIySHJuTXZHVkRtblhtcWY1?=
 =?utf-8?B?MW4yVXdBbGQ2Yy9kL2NkYmFjSEM4dXJyR3JOeUdrZks3VEc5YkdnWmlrQ01O?=
 =?utf-8?Q?EGvbfUQGjSiBle70gbCCWsPcu?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 727d453e-ef06-4dfb-0c58-08dca26376bf
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 11:12:05.9126 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 09p/Y5i/GaLVPriLsIqtzGN7qmLrGhzEH4iLU4AAzisWpVF3b03DEY7b1Pkd2dlbdC9fAyPWgbl0Nov05omZ6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6632
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


在 2024/7/12 18:59, Christian König 写道:
> Am 12.07.24 um 09:52 schrieb Huan Yang:
>>
>> 在 2024/7/12 15:41, Christian König 写道:
>>> Am 12.07.24 um 09:29 schrieb Huan Yang:
>>>> Hi Christian,
>>>>
>>>> 在 2024/7/12 15:10, Christian König 写道:
>>>>> Am 12.07.24 um 04:14 schrieb Huan Yang:
>>>>>> 在 2024/7/12 9:59, Huan Yang 写道:
>>>>>>> Hi Christian,
>>>>>>>
>>>>>>> 在 2024/7/11 19:39, Christian König 写道:
>>>>>>>> Am 11.07.24 um 11:18 schrieb Huan Yang:
>>>>>>>>> Hi Christian,
>>>>>>>>>
>>>>>>>>> Thanks for your reply.
>>>>>>>>>
>>>>>>>>> 在 2024/7/11 17:00, Christian König 写道:
>>>>>>>>>> Am 11.07.24 um 09:42 schrieb Huan Yang:
>>>>>>>>>>> Some user may need load file into dma-buf, current
>>>>>>>>>>> way is:
>>>>>>>>>>>    1. allocate a dma-buf, get dma-buf fd
>>>>>>>>>>>    2. mmap dma-buf fd into vaddr
>>>>>>>>>>>    3. read(file_fd, vaddr, fsz)
>>>>>>>>>>> This is too heavy if fsz reached to GB.
>>>>>>>>>>
>>>>>>>>>> You need to describe a bit more why that is to heavy. I can 
>>>>>>>>>> only assume you need to save memory bandwidth and avoid the 
>>>>>>>>>> extra copy with the CPU.
>>>>>>>>>
>>>>>>>>> Sorry for the oversimplified explanation. But, yes, you're 
>>>>>>>>> right, we want to avoid this.
>>>>>>>>>
>>>>>>>>> As we are dealing with embedded devices, the available memory 
>>>>>>>>> and computing power for users are usually limited.(The maximum 
>>>>>>>>> available memory is currently
>>>>>>>>>
>>>>>>>>> 24GB, typically ranging from 8-12GB. )
>>>>>>>>>
>>>>>>>>> Also, the CPU computing power is also usually in short supply, 
>>>>>>>>> due to limited battery capacity and limited heat dissipation 
>>>>>>>>> capabilities.
>>>>>>>>>
>>>>>>>>> So, we hope to avoid ineffective paths as much as possible.
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>> This patch implement a feature called 
>>>>>>>>>>> DMA_HEAP_IOCTL_ALLOC_READ_FILE.
>>>>>>>>>>> User need to offer a file_fd which you want to load into 
>>>>>>>>>>> dma-buf, then,
>>>>>>>>>>> it promise if you got a dma-buf fd, it will contains the 
>>>>>>>>>>> file content.
>>>>>>>>>>
>>>>>>>>>> Interesting idea, that has at least more potential than 
>>>>>>>>>> trying to enable direct I/O on mmap()ed DMA-bufs.
>>>>>>>>>>
>>>>>>>>>> The approach with the new IOCTL might not work because it is 
>>>>>>>>>> a very specialized use case.
>>>>>>>>>
>>>>>>>>> Thank you for your advice. maybe the "read file" behavior can 
>>>>>>>>> be attached to an existing allocation?
>>>>>>>>
>>>>>>>> The point is there are already system calls to do something 
>>>>>>>> like that.
>>>>>>>>
>>>>>>>> See copy_file_range() 
>>>>>>>> (https://man7.org/linux/man-pages/man2/copy_file_range.2.html) 
>>>>>>>> and send_file() 
>>>>>>>> (https://man7.org/linux/man-pages/man2/sendfile.2.html).
>>>>>>>
>>>>>>> That's helpfull to learn it, thanks.
>>>>>>>
>>>>>>> In terms of only DMA-BUF supporting direct I/O, 
>>>>>>> copy_file_range/send_file may help to achieve this functionality.
>>>>>>>
>>>>>>> However, my patchset also aims to achieve parallel copying of 
>>>>>>> file contents while allocating the DMA-BUF, which is something 
>>>>>>> that the current set of calls may not be able to accomplish.
>>>>>
>>>>> And exactly that is a no-go. Use the existing IOCTLs and system 
>>>>> calls instead they should have similar performance when done right.
>>>>
>>>> Get it, but In my testing process, even without memory pressure, it 
>>>> takes about 60ms to allocate a 3GB DMA-BUF. When there is 
>>>> significant memory pressure, the allocation time for a 3GB
>>>
>>> Well exactly that doesn't make sense. Even if you read the content 
>>> of the DMA-buf from a file you still need to allocate it first.
>>
>> Yes, need allocate first, but in kernelspace, no need to wait all 
>> memory allocated done and then trigger file load.
>
> That doesn't really make sense. Allocating a large bunch of memory is 
> more efficient than allocating less multiple times because of cache 
> locality for example.
No, this patchset not change `the alloc behavior`, heap can goon alloc, 
but we will in a second it meet batch, then map the batch page(it 
alloced) into vmalloc area, then trigger IO.
>
> You could of course hide latency caused by operations to reduce memory 
> pressure when you have a specific use case, but you don't need to use 
> an in kernel implementation for that.
>
> Question is do you have clear on allocation or clear on free enabled?
We have a free clear, so, alloc and load file is OK.
>
>> This patchset use `batch` to done(default 128MB), ever 128MB 
>> allocated, vmap and get vaddr, then trigger this vaddr load file's 
>> target pos content.
>
> Again that sounds really not ideal to me. Creating the vmap alone is 
> complete unnecessary overhead.
Hmmm, maybe you can give a try, I offered the test program also in 
cover-letter?
>
>>> So the question is why should reading and allocating it at the same 
>>> time be better in any way?
>>
>> Memory pressure will trigger reclaim, it must to wait.(ms) Asume I 
>> already allocated 512MB(need 3G) without enter slowpath,
>>
>> Even I need to enter slowpath to allocated remain memory, the already 
>> allocated memory is using load file content.(Save time compare to 
>> allocated done and read)
>>
>> The time difference between them can be expressed by the formula:
>>
>> 1. Allocate dmabuf time + file load time -- for original
>>
>> 2. first prepare batch time + Max(file load time, allocate remain 
>> dma-buf time) + latest batch prepare time -- for new
>>
>>  When the file reaches the gigabyte level, the significant difference 
>> between the two can be clearly observed.
>
> I have strong doubts about that. The method you describe above is 
> actually really inefficient.

Also, maybe you can test? dd a large file, then compare?

All of it I test in my phone and archlinux PC both show some improve.

>
> First of all you create a memory mapping just to load data, that is 
> superfluous and TLB flushes are usually extremely costly. Both for 
> userspace as well as kernel.
>
> I strongly suggest to try to use copy_file_range() instead. But could 
> be that copy_file_range() doesn't even work right now because of some 
> restrictions, never tried that on a DMA-buf.
I agree, I'm start this research.
>
> When that works as far as I can see what could still be saved on 
> overhead is the following:
>
> 1. Clearing of memory on allocation. That could potentially be done 
> with delayed allocation or clear on free instead.
>
> 2. CPU copy between the I/O target buffer and the DMA-buf backing 
> pages. In theory it should be possible to avoid that by implementing 
> the copy_file_range() callback, but I'm not 100% sure.
All you mentioned above is make sense. :)
>
> Regards,
> Christian.
>
>>
>>>
>>> Regards,
>>> Christian.
>>>
>>>>
>>>>
>>>> DMA-BUF can increase to 300ms-1s. (The above test times can also 
>>>> demonstrate the difference.)
>>>>
>>>> But, talk is cheap, I agree to research use existing way to 
>>>> implements it and give a test.
>>>>
>>>> I'll show this if I done .
>>>>
>>>> Thanks for your suggestions.
>>>>
>>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>>
>>>>>> You can see cover-letter, here are the normal test and this 
>>>>>> IOCTL's compare in memory pressure, even if buffered I/O in this 
>>>>>> ioctl can have 50% improve by parallel.
>>>>>>
>>>>>> dd a 3GB file for test, 12G RAM phone, UFS4.0, stressapptest 4G 
>>>>>> memory pressure.
>>>>>>
>>>>>> 1. original
>>>>>> ```shel
>>>>>> # create a model file
>>>>>> dd if=/dev/zero of=./model.txt bs=1M count=3072
>>>>>> # drop page cache
>>>>>> echo 3 > /proc/sys/vm/drop_caches
>>>>>> ./dmabuf-heap-file-read mtk_mm-uncached normal
>>>>>>
>>>>>>> result is total cost 13087213847ns
>>>>>>
>>>>>> ```
>>>>>>
>>>>>> 2.DMA_HEAP_IOCTL_ALLOC_AND_READ O_DIRECT
>>>>>> ```shel
>>>>>> # create a model file
>>>>>> dd if=/dev/zero of=./model.txt bs=1M count=3072
>>>>>> # drop page cache
>>>>>> echo 3 > /proc/sys/vm/drop_caches
>>>>>> ./dmabuf-heap-file-read mtk_mm-uncached direct_io
>>>>>>
>>>>>>> result is total cost 2902386846ns
>>>>>>
>>>>>> # use direct_io_check can check the content if is same to file.
>>>>>> ```
>>>>>>
>>>>>> 3. DMA_HEAP_IOCTL_ALLOC_AND_READ BUFFER I/O
>>>>>> ```shel
>>>>>> # create a model file
>>>>>> dd if=/dev/zero of=./model.txt bs=1M count=3072
>>>>>> # drop page cache
>>>>>> echo 3 > /proc/sys/vm/drop_caches
>>>>>> ./dmabuf-heap-file-read mtk_mm-uncached normal_io
>>>>>>
>>>>>>> result is total cost 5735579385ns
>>>>>>
>>>>>> ```
>>>>>>
>>>>>>>
>>>>>>> Perhaps simply returning the DMA-BUF file descriptor and then 
>>>>>>> implementing copy_file_range, while populating the memory and 
>>>>>>> content during the copy process, could achieve this? At present, 
>>>>>>> it seems that it will be quite complex - We need to ensure that 
>>>>>>> only the returned DMA-BUF file descriptor will fail in case of 
>>>>>>> memory not fill, like mmap, vmap, attach, and so on.
>>>>>>>
>>>>>>>>
>>>>>>>> What we probably could do is to internally optimize those.
>>>>>>>>
>>>>>>>>> I am currently creating a new ioctl to remind the user that 
>>>>>>>>> memory is being allocated and read, and I am also unsure
>>>>>>>>>
>>>>>>>>> whether it is appropriate to add additional parameters to the 
>>>>>>>>> existing allocate behavior.
>>>>>>>>>
>>>>>>>>> Please, give me more suggestion. Thanks.
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> But IIRC there was a copy_file_range callback in the 
>>>>>>>>>> file_operations structure you could use for that. I'm just 
>>>>>>>>>> not sure when and how that's used with the copy_file_range() 
>>>>>>>>>> system call.
>>>>>>>>>
>>>>>>>>> Sorry, I'm not familiar with this, but I will look into it. 
>>>>>>>>> However, this type of callback function is not currently 
>>>>>>>>> implemented when exporting
>>>>>>>>>
>>>>>>>>> the dma_buf file, which means that I need to implement the 
>>>>>>>>> callback for it?
>>>>>>>>
>>>>>>>> If I'm not completely mistaken the copy_file_range, splice_read 
>>>>>>>> and splice_write callbacks on the struct file_operations 
>>>>>>>> (https://elixir.bootlin.com/linux/v6.10-rc7/source/include/linux/fs.h#L1999).
>>>>>>>>
>>>>>>>> Can be used to implement what you want to do.
>>>>>>> Yes.
>>>>>>>>
>>>>>>>> Regards,
>>>>>>>> Christian.
>>>>>>>>
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Regards,
>>>>>>>>>> Christian.
>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> Notice, file_fd depends on user how to open this file. So, 
>>>>>>>>>>> both buffer
>>>>>>>>>>> I/O and Direct I/O is supported.
>>>>>>>>>>>
>>>>>>>>>>> Signed-off-by: Huan Yang <link@vivo.com>
>>>>>>>>>>> ---
>>>>>>>>>>>   drivers/dma-buf/dma-heap.c    | 525 
>>>>>>>>>>> +++++++++++++++++++++++++++++++++-
>>>>>>>>>>>   include/linux/dma-heap.h      |  57 +++-
>>>>>>>>>>>   include/uapi/linux/dma-heap.h |  32 +++
>>>>>>>>>>>   3 files changed, 611 insertions(+), 3 deletions(-)
>>>>>>>>>>>
>>>>>>>>>>> diff --git a/drivers/dma-buf/dma-heap.c 
>>>>>>>>>>> b/drivers/dma-buf/dma-heap.c
>>>>>>>>>>> index 2298ca5e112e..abe17281adb8 100644
>>>>>>>>>>> --- a/drivers/dma-buf/dma-heap.c
>>>>>>>>>>> +++ b/drivers/dma-buf/dma-heap.c
>>>>>>>>>>> @@ -15,9 +15,11 @@
>>>>>>>>>>>   #include <linux/list.h>
>>>>>>>>>>>   #include <linux/slab.h>
>>>>>>>>>>>   #include <linux/nospec.h>
>>>>>>>>>>> +#include <linux/highmem.h>
>>>>>>>>>>>   #include <linux/uaccess.h>
>>>>>>>>>>>   #include <linux/syscalls.h>
>>>>>>>>>>>   #include <linux/dma-heap.h>
>>>>>>>>>>> +#include <linux/vmalloc.h>
>>>>>>>>>>>   #include <uapi/linux/dma-heap.h>
>>>>>>>>>>>     #define DEVNAME "dma_heap"
>>>>>>>>>>> @@ -43,12 +45,462 @@ struct dma_heap {
>>>>>>>>>>>       struct cdev heap_cdev;
>>>>>>>>>>>   };
>>>>>>>>>>>   +/**
>>>>>>>>>>> + * struct dma_heap_file - wrap the file, read task for 
>>>>>>>>>>> dma_heap allocate use.
>>>>>>>>>>> + * @file:        file to read from.
>>>>>>>>>>> + *
>>>>>>>>>>> + * @cred:        kthread use, user cred copy to use for the 
>>>>>>>>>>> read.
>>>>>>>>>>> + *
>>>>>>>>>>> + * @max_batch:        maximum batch size to read, if 
>>>>>>>>>>> collect match batch,
>>>>>>>>>>> + *            trigger read, default 128MB, must below file 
>>>>>>>>>>> size.
>>>>>>>>>>> + *
>>>>>>>>>>> + * @fsz:        file size.
>>>>>>>>>>> + *
>>>>>>>>>>> + * @direct:        use direct IO?
>>>>>>>>>>> + */
>>>>>>>>>>> +struct dma_heap_file {
>>>>>>>>>>> +    struct file *file;
>>>>>>>>>>> +    struct cred *cred;
>>>>>>>>>>> +    size_t max_batch;
>>>>>>>>>>> +    size_t fsz;
>>>>>>>>>>> +    bool direct;
>>>>>>>>>>> +};
>>>>>>>>>>> +
>>>>>>>>>>> +/**
>>>>>>>>>>> + * struct dma_heap_file_work - represents a dma_heap file 
>>>>>>>>>>> read real work.
>>>>>>>>>>> + * @vaddr:        contigous virtual address alloc by vmap, 
>>>>>>>>>>> file read need.
>>>>>>>>>>> + *
>>>>>>>>>>> + * @start_size:        file read start offset, same to 
>>>>>>>>>>> @dma_heap_file_task->roffset.
>>>>>>>>>>> + *
>>>>>>>>>>> + * @need_size:        file read need size, same to 
>>>>>>>>>>> @dma_heap_file_task->rsize.
>>>>>>>>>>> + *
>>>>>>>>>>> + * @heap_file:        file wrapper.
>>>>>>>>>>> + *
>>>>>>>>>>> + * @list:        child node of @dma_heap_file_control->works.
>>>>>>>>>>> + *
>>>>>>>>>>> + * @refp:        same @dma_heap_file_task->ref, if end of 
>>>>>>>>>>> read, put ref.
>>>>>>>>>>> + *
>>>>>>>>>>> + * @failp:        if any work io failed, set it true, 
>>>>>>>>>>> pointp @dma_heap_file_task->fail.
>>>>>>>>>>> + */
>>>>>>>>>>> +struct dma_heap_file_work {
>>>>>>>>>>> +    void *vaddr;
>>>>>>>>>>> +    ssize_t start_size;
>>>>>>>>>>> +    ssize_t need_size;
>>>>>>>>>>> +    struct dma_heap_file *heap_file;
>>>>>>>>>>> +    struct list_head list;
>>>>>>>>>>> +    atomic_t *refp;
>>>>>>>>>>> +    bool *failp;
>>>>>>>>>>> +};
>>>>>>>>>>> +
>>>>>>>>>>> +/**
>>>>>>>>>>> + * struct dma_heap_file_task - represents a dma_heap file 
>>>>>>>>>>> read process
>>>>>>>>>>> + * @ref:        current file work counter, if zero, 
>>>>>>>>>>> allocate and read
>>>>>>>>>>> + *            done.
>>>>>>>>>>> + *
>>>>>>>>>>> + * @roffset:        last read offset, current prepared 
>>>>>>>>>>> work' begin file
>>>>>>>>>>> + *            start offset.
>>>>>>>>>>> + *
>>>>>>>>>>> + * @rsize:        current allocated page size use to read, 
>>>>>>>>>>> if reach rbatch,
>>>>>>>>>>> + *            trigger commit.
>>>>>>>>>>> + *
>>>>>>>>>>> + * @rbatch:        current prepared work's batch, below 
>>>>>>>>>>> @dma_heap_file's
>>>>>>>>>>> + *            batch.
>>>>>>>>>>> + *
>>>>>>>>>>> + * @heap_file:        current dma_heap_file
>>>>>>>>>>> + *
>>>>>>>>>>> + * @parray:        used for vmap, size is @dma_heap_file's 
>>>>>>>>>>> batch's number
>>>>>>>>>>> + *            pages.(this is maximum). Due to single thread 
>>>>>>>>>>> file read,
>>>>>>>>>>> + *            one page array reuse each work prepare is OK.
>>>>>>>>>>> + *            Each index in parray is PAGE_SIZE.(vmap need)
>>>>>>>>>>> + *
>>>>>>>>>>> + * @pindex:        current allocated page filled in 
>>>>>>>>>>> @parray's index.
>>>>>>>>>>> + *
>>>>>>>>>>> + * @fail:        any work failed when file read?
>>>>>>>>>>> + *
>>>>>>>>>>> + * dma_heap_file_task is the production of file read, will 
>>>>>>>>>>> prepare each work
>>>>>>>>>>> + * during allocate dma_buf pages, if match current batch, 
>>>>>>>>>>> then trigger commit
>>>>>>>>>>> + * and prepare next work. After all batch queued, user 
>>>>>>>>>>> going on prepare dma_buf
>>>>>>>>>>> + * and so on, but before return dma_buf fd, need to wait 
>>>>>>>>>>> file read end and
>>>>>>>>>>> + * check read result.
>>>>>>>>>>> + */
>>>>>>>>>>> +struct dma_heap_file_task {
>>>>>>>>>>> +    atomic_t ref;
>>>>>>>>>>> +    size_t roffset;
>>>>>>>>>>> +    size_t rsize;
>>>>>>>>>>> +    size_t rbatch;
>>>>>>>>>>> +    struct dma_heap_file *heap_file;
>>>>>>>>>>> +    struct page **parray;
>>>>>>>>>>> +    unsigned int pindex;
>>>>>>>>>>> +    bool fail;
>>>>>>>>>>> +};
>>>>>>>>>>> +
>>>>>>>>>>> +/**
>>>>>>>>>>> + * struct dma_heap_file_control - global control of 
>>>>>>>>>>> dma_heap file read.
>>>>>>>>>>> + * @works:        @dma_heap_file_work's list head.
>>>>>>>>>>> + *
>>>>>>>>>>> + * @lock:        only lock for @works.
>>>>>>>>>>> + *
>>>>>>>>>>> + * @threadwq:        wait queue for @work_thread, if commit 
>>>>>>>>>>> work, @work_thread
>>>>>>>>>>> + *            wakeup and read this work's file contains.
>>>>>>>>>>> + *
>>>>>>>>>>> + * @workwq:        used for main thread wait for file read 
>>>>>>>>>>> end, if allocation
>>>>>>>>>>> + *            end before file read. @dma_heap_file_task ref 
>>>>>>>>>>> effect this.
>>>>>>>>>>> + *
>>>>>>>>>>> + * @work_thread:    file read kthread. the 
>>>>>>>>>>> dma_heap_file_task work's consumer.
>>>>>>>>>>> + *
>>>>>>>>>>> + * @heap_fwork_cachep: @dma_heap_file_work's cachep, it's 
>>>>>>>>>>> alloc/free frequently.
>>>>>>>>>>> + *
>>>>>>>>>>> + * @nr_work:        global number of how many work committed.
>>>>>>>>>>> + */
>>>>>>>>>>> +struct dma_heap_file_control {
>>>>>>>>>>> +    struct list_head works;
>>>>>>>>>>> +    spinlock_t lock;
>>>>>>>>>>> +    wait_queue_head_t threadwq;
>>>>>>>>>>> +    wait_queue_head_t workwq;
>>>>>>>>>>> +    struct task_struct *work_thread;
>>>>>>>>>>> +    struct kmem_cache *heap_fwork_cachep;
>>>>>>>>>>> +    atomic_t nr_work;
>>>>>>>>>>> +};
>>>>>>>>>>> +
>>>>>>>>>>> +static struct dma_heap_file_control *heap_fctl;
>>>>>>>>>>>   static LIST_HEAD(heap_list);
>>>>>>>>>>>   static DEFINE_MUTEX(heap_list_lock);
>>>>>>>>>>>   static dev_t dma_heap_devt;
>>>>>>>>>>>   static struct class *dma_heap_class;
>>>>>>>>>>>   static DEFINE_XARRAY_ALLOC(dma_heap_minors);
>>>>>>>>>>>   +/**
>>>>>>>>>>> + * map_pages_to_vaddr - map each scatter page into 
>>>>>>>>>>> contiguous virtual address.
>>>>>>>>>>> + * @heap_ftask:        prepared and need to commit's work.
>>>>>>>>>>> + *
>>>>>>>>>>> + * Cached pages need to trigger file read, this function 
>>>>>>>>>>> map each scatter page
>>>>>>>>>>> + * into contiguous virtual address, so that file read can 
>>>>>>>>>>> easy use.
>>>>>>>>>>> + * Now that we get vaddr page, cached pages can return to 
>>>>>>>>>>> original user, so we
>>>>>>>>>>> + * will not effect dma-buf export even if file read not end.
>>>>>>>>>>> + */
>>>>>>>>>>> +static void *map_pages_to_vaddr(struct dma_heap_file_task 
>>>>>>>>>>> *heap_ftask)
>>>>>>>>>>> +{
>>>>>>>>>>> +    return vmap(heap_ftask->parray, heap_ftask->pindex, 
>>>>>>>>>>> VM_MAP,
>>>>>>>>>>> +            PAGE_KERNEL);
>>>>>>>>>>> +}
>>>>>>>>>>> +
>>>>>>>>>>> +bool dma_heap_prepare_file_read(struct dma_heap_file_task 
>>>>>>>>>>> *heap_ftask,
>>>>>>>>>>> +                struct page *page)
>>>>>>>>>>> +{
>>>>>>>>>>> +    struct page **array = heap_ftask->parray;
>>>>>>>>>>> +    int index = heap_ftask->pindex;
>>>>>>>>>>> +    int num = compound_nr(page), i;
>>>>>>>>>>> +    unsigned long sz = page_size(page);
>>>>>>>>>>> +
>>>>>>>>>>> +    heap_ftask->rsize += sz;
>>>>>>>>>>> +    for (i = 0; i < num; ++i)
>>>>>>>>>>> +        array[index++] = &page[i];
>>>>>>>>>>> +    heap_ftask->pindex = index;
>>>>>>>>>>> +
>>>>>>>>>>> +    return heap_ftask->rsize >= heap_ftask->rbatch;
>>>>>>>>>>> +}
>>>>>>>>>>> +
>>>>>>>>>>> +static struct dma_heap_file_work *
>>>>>>>>>>> +init_file_work(struct dma_heap_file_task *heap_ftask)
>>>>>>>>>>> +{
>>>>>>>>>>> +    struct dma_heap_file_work *heap_fwork;
>>>>>>>>>>> +    struct dma_heap_file *heap_file = heap_ftask->heap_file;
>>>>>>>>>>> +
>>>>>>>>>>> +    if (READ_ONCE(heap_ftask->fail))
>>>>>>>>>>> +        return NULL;
>>>>>>>>>>> +
>>>>>>>>>>> +    heap_fwork = 
>>>>>>>>>>> kmem_cache_alloc(heap_fctl->heap_fwork_cachep, GFP_KERNEL);
>>>>>>>>>>> +    if (unlikely(!heap_fwork))
>>>>>>>>>>> +        return NULL;
>>>>>>>>>>> +
>>>>>>>>>>> +    heap_fwork->vaddr = map_pages_to_vaddr(heap_ftask);
>>>>>>>>>>> +    if (unlikely(!heap_fwork->vaddr)) {
>>>>>>>>>>> + kmem_cache_free(heap_fctl->heap_fwork_cachep, heap_fwork);
>>>>>>>>>>> +        return NULL;
>>>>>>>>>>> +    }
>>>>>>>>>>> +
>>>>>>>>>>> +    heap_fwork->heap_file = heap_file;
>>>>>>>>>>> +    heap_fwork->start_size = heap_ftask->roffset;
>>>>>>>>>>> +    heap_fwork->need_size = heap_ftask->rsize;
>>>>>>>>>>> +    heap_fwork->refp = &heap_ftask->ref;
>>>>>>>>>>> +    heap_fwork->failp = &heap_ftask->fail;
>>>>>>>>>>> +    atomic_inc(&heap_ftask->ref);
>>>>>>>>>>> +    return heap_fwork;
>>>>>>>>>>> +}
>>>>>>>>>>> +
>>>>>>>>>>> +static void destroy_file_work(struct dma_heap_file_work 
>>>>>>>>>>> *heap_fwork)
>>>>>>>>>>> +{
>>>>>>>>>>> +    vunmap(heap_fwork->vaddr);
>>>>>>>>>>> +    atomic_dec(heap_fwork->refp);
>>>>>>>>>>> +    wake_up(&heap_fctl->workwq);
>>>>>>>>>>> +
>>>>>>>>>>> + kmem_cache_free(heap_fctl->heap_fwork_cachep, heap_fwork);
>>>>>>>>>>> +}
>>>>>>>>>>> +
>>>>>>>>>>> +int dma_heap_submit_file_read(struct dma_heap_file_task 
>>>>>>>>>>> *heap_ftask)
>>>>>>>>>>> +{
>>>>>>>>>>> +    struct dma_heap_file_work *heap_fwork = 
>>>>>>>>>>> init_file_work(heap_ftask);
>>>>>>>>>>> +    struct page *last = NULL;
>>>>>>>>>>> +    struct dma_heap_file *heap_file = heap_ftask->heap_file;
>>>>>>>>>>> +    size_t start = heap_ftask->roffset;
>>>>>>>>>>> +    struct file *file = heap_file->file;
>>>>>>>>>>> +    size_t fsz = heap_file->fsz;
>>>>>>>>>>> +
>>>>>>>>>>> +    if (unlikely(!heap_fwork))
>>>>>>>>>>> +        return -ENOMEM;
>>>>>>>>>>> +
>>>>>>>>>>> +    /**
>>>>>>>>>>> +     * If file size is not page aligned, direct io can't 
>>>>>>>>>>> process the tail.
>>>>>>>>>>> +     * So, if reach to tail, remain the last page use 
>>>>>>>>>>> buffer read.
>>>>>>>>>>> +     */
>>>>>>>>>>> +    if (heap_file->direct && start + heap_ftask->rsize > 
>>>>>>>>>>> fsz) {
>>>>>>>>>>> +        heap_fwork->need_size -= PAGE_SIZE;
>>>>>>>>>>> +        last = heap_ftask->parray[heap_ftask->pindex - 1];
>>>>>>>>>>> +    }
>>>>>>>>>>> +
>>>>>>>>>>> +    spin_lock(&heap_fctl->lock);
>>>>>>>>>>> +    list_add_tail(&heap_fwork->list, &heap_fctl->works);
>>>>>>>>>>> +    spin_unlock(&heap_fctl->lock);
>>>>>>>>>>> +    atomic_inc(&heap_fctl->nr_work);
>>>>>>>>>>> +
>>>>>>>>>>> +    wake_up(&heap_fctl->threadwq);
>>>>>>>>>>> +
>>>>>>>>>>> +    if (last) {
>>>>>>>>>>> +        char *buf, *pathp;
>>>>>>>>>>> +        ssize_t err;
>>>>>>>>>>> +        void *buffer;
>>>>>>>>>>> +
>>>>>>>>>>> +        buf = kmalloc(PATH_MAX, GFP_KERNEL);
>>>>>>>>>>> +        if (unlikely(!buf))
>>>>>>>>>>> +            return -ENOMEM;
>>>>>>>>>>> +
>>>>>>>>>>> +        start = PAGE_ALIGN_DOWN(fsz);
>>>>>>>>>>> +
>>>>>>>>>>> +        pathp = file_path(file, buf, PATH_MAX);
>>>>>>>>>>> +        if (IS_ERR(pathp)) {
>>>>>>>>>>> +            kfree(buf);
>>>>>>>>>>> +            return PTR_ERR(pathp);
>>>>>>>>>>> +        }
>>>>>>>>>>> +
>>>>>>>>>>> +        buffer = kmap_local_page(last); // use page's kaddr.
>>>>>>>>>>> +        err = kernel_read_file_from_path(pathp, start, 
>>>>>>>>>>> &buffer,
>>>>>>>>>>> +                         fsz - start, &fsz,
>>>>>>>>>>> +                         READING_POLICY);
>>>>>>>>>>> +        kunmap_local(buffer);
>>>>>>>>>>> +        kfree(buf);
>>>>>>>>>>> +        if (err < 0) {
>>>>>>>>>>> +            pr_err("failed to use buffer kernel_read_file 
>>>>>>>>>>> %s, err=%ld, [%ld, %ld], f_sz=%ld\n",
>>>>>>>>>>> +                   pathp, err, start, fsz, fsz);
>>>>>>>>>>> +
>>>>>>>>>>> +            return err;
>>>>>>>>>>> +        }
>>>>>>>>>>> +    }
>>>>>>>>>>> +
>>>>>>>>>>> +    heap_ftask->roffset += heap_ftask->rsize;
>>>>>>>>>>> +    heap_ftask->rsize = 0;
>>>>>>>>>>> +    heap_ftask->pindex = 0;
>>>>>>>>>>> +    heap_ftask->rbatch = min_t(size_t,
>>>>>>>>>>> +                   PAGE_ALIGN(fsz) - heap_ftask->roffset,
>>>>>>>>>>> +                   heap_ftask->rbatch);
>>>>>>>>>>> +    return 0;
>>>>>>>>>>> +}
>>>>>>>>>>> +
>>>>>>>>>>> +bool dma_heap_wait_for_file_read(struct dma_heap_file_task 
>>>>>>>>>>> *heap_ftask)
>>>>>>>>>>> +{
>>>>>>>>>>> + wait_event_freezable(heap_fctl->workwq,
>>>>>>>>>>> + atomic_read(&heap_ftask->ref) == 0);
>>>>>>>>>>> +    return heap_ftask->fail;
>>>>>>>>>>> +}
>>>>>>>>>>> +
>>>>>>>>>>> +bool dma_heap_destroy_file_read(struct dma_heap_file_task 
>>>>>>>>>>> *heap_ftask)
>>>>>>>>>>> +{
>>>>>>>>>>> +    bool fail;
>>>>>>>>>>> +
>>>>>>>>>>> +    dma_heap_wait_for_file_read(heap_ftask);
>>>>>>>>>>> +    fail = heap_ftask->fail;
>>>>>>>>>>> +    kvfree(heap_ftask->parray);
>>>>>>>>>>> +    kfree(heap_ftask);
>>>>>>>>>>> +    return fail;
>>>>>>>>>>> +}
>>>>>>>>>>> +
>>>>>>>>>>> +struct dma_heap_file_task *
>>>>>>>>>>> +dma_heap_declare_file_read(struct dma_heap_file *heap_file)
>>>>>>>>>>> +{
>>>>>>>>>>> +    struct dma_heap_file_task *heap_ftask =
>>>>>>>>>>> +        kzalloc(sizeof(*heap_ftask), GFP_KERNEL);
>>>>>>>>>>> +    if (unlikely(!heap_ftask))
>>>>>>>>>>> +        return NULL;
>>>>>>>>>>> +
>>>>>>>>>>> +    /**
>>>>>>>>>>> +     * Batch is the maximum size which we prepare work will 
>>>>>>>>>>> meet.
>>>>>>>>>>> +     * So, direct alloc this number's page array is OK.
>>>>>>>>>>> +     */
>>>>>>>>>>> +    heap_ftask->parray = 
>>>>>>>>>>> kvmalloc_array(heap_file->max_batch >> PAGE_SHIFT,
>>>>>>>>>>> +                        sizeof(struct page *), GFP_KERNEL);
>>>>>>>>>>> +    if (unlikely(!heap_ftask->parray))
>>>>>>>>>>> +        goto put;
>>>>>>>>>>> +
>>>>>>>>>>> +    heap_ftask->heap_file = heap_file;
>>>>>>>>>>> +    heap_ftask->rbatch = heap_file->max_batch;
>>>>>>>>>>> +    return heap_ftask;
>>>>>>>>>>> +put:
>>>>>>>>>>> +    kfree(heap_ftask);
>>>>>>>>>>> +    return NULL;
>>>>>>>>>>> +}
>>>>>>>>>>> +
>>>>>>>>>>> +static void __work_this_io(struct dma_heap_file_work 
>>>>>>>>>>> *heap_fwork)
>>>>>>>>>>> +{
>>>>>>>>>>> +    struct dma_heap_file *heap_file = heap_fwork->heap_file;
>>>>>>>>>>> +    struct file *file = heap_file->file;
>>>>>>>>>>> +    ssize_t start = heap_fwork->start_size;
>>>>>>>>>>> +    ssize_t size = heap_fwork->need_size;
>>>>>>>>>>> +    void *buffer = heap_fwork->vaddr;
>>>>>>>>>>> +    const struct cred *old_cred;
>>>>>>>>>>> +    ssize_t err;
>>>>>>>>>>> +
>>>>>>>>>>> +    // use real task's cred to read this file.
>>>>>>>>>>> +    old_cred = override_creds(heap_file->cred);
>>>>>>>>>>> +    err = kernel_read_file(file, start, &buffer, size, 
>>>>>>>>>>> &heap_file->fsz,
>>>>>>>>>>> +                   READING_POLICY);
>>>>>>>>>>> +    if (err < 0) {
>>>>>>>>>>> +        pr_err("use kernel_read_file, err=%ld, [%ld, %ld], 
>>>>>>>>>>> f_sz=%ld\n",
>>>>>>>>>>> +               err, start, (start + size), heap_file->fsz);
>>>>>>>>>>> +        WRITE_ONCE(*heap_fwork->failp, true);
>>>>>>>>>>> +    }
>>>>>>>>>>> +    // recovery to my cred.
>>>>>>>>>>> +    revert_creds(old_cred);
>>>>>>>>>>> +}
>>>>>>>>>>> +
>>>>>>>>>>> +static int dma_heap_file_control_thread(void *data)
>>>>>>>>>>> +{
>>>>>>>>>>> +    struct dma_heap_file_control *heap_fctl =
>>>>>>>>>>> +        (struct dma_heap_file_control *)data;
>>>>>>>>>>> +    struct dma_heap_file_work *worker, *tmp;
>>>>>>>>>>> +    int nr_work;
>>>>>>>>>>> +
>>>>>>>>>>> +    LIST_HEAD(pages);
>>>>>>>>>>> +    LIST_HEAD(workers);
>>>>>>>>>>> +
>>>>>>>>>>> +    while (true) {
>>>>>>>>>>> + wait_event_freezable(heap_fctl->threadwq,
>>>>>>>>>>> + atomic_read(&heap_fctl->nr_work) > 0);
>>>>>>>>>>> +recheck:
>>>>>>>>>>> +        spin_lock(&heap_fctl->lock);
>>>>>>>>>>> + list_splice_init(&heap_fctl->works, &workers);
>>>>>>>>>>> +        spin_unlock(&heap_fctl->lock);
>>>>>>>>>>> +
>>>>>>>>>>> +        if (unlikely(kthread_should_stop())) {
>>>>>>>>>>> +            list_for_each_entry_safe(worker, tmp, &workers, 
>>>>>>>>>>> list) {
>>>>>>>>>>> + list_del(&worker->list);
>>>>>>>>>>> +                destroy_file_work(worker);
>>>>>>>>>>> +            }
>>>>>>>>>>> +            break;
>>>>>>>>>>> +        }
>>>>>>>>>>> +
>>>>>>>>>>> +        nr_work = 0;
>>>>>>>>>>> +        list_for_each_entry_safe(worker, tmp, &workers, 
>>>>>>>>>>> list) {
>>>>>>>>>>> +            ++nr_work;
>>>>>>>>>>> +            list_del(&worker->list);
>>>>>>>>>>> +            __work_this_io(worker);
>>>>>>>>>>> +
>>>>>>>>>>> +            destroy_file_work(worker);
>>>>>>>>>>> +        }
>>>>>>>>>>> +        atomic_sub(nr_work, &heap_fctl->nr_work);
>>>>>>>>>>> +
>>>>>>>>>>> +        if (atomic_read(&heap_fctl->nr_work) > 0)
>>>>>>>>>>> +            goto recheck;
>>>>>>>>>>> +    }
>>>>>>>>>>> +    return 0;
>>>>>>>>>>> +}
>>>>>>>>>>> +
>>>>>>>>>>> +size_t dma_heap_file_size(struct dma_heap_file *heap_file)
>>>>>>>>>>> +{
>>>>>>>>>>> +    return heap_file->fsz;
>>>>>>>>>>> +}
>>>>>>>>>>> +
>>>>>>>>>>> +static int prepare_dma_heap_file(struct dma_heap_file 
>>>>>>>>>>> *heap_file, int file_fd,
>>>>>>>>>>> +                 size_t batch)
>>>>>>>>>>> +{
>>>>>>>>>>> +    struct file *file;
>>>>>>>>>>> +    size_t fsz;
>>>>>>>>>>> +    int ret;
>>>>>>>>>>> +
>>>>>>>>>>> +    file = fget(file_fd);
>>>>>>>>>>> +    if (!file)
>>>>>>>>>>> +        return -EINVAL;
>>>>>>>>>>> +
>>>>>>>>>>> +    fsz = i_size_read(file_inode(file));
>>>>>>>>>>> +    if (fsz < batch) {
>>>>>>>>>>> +        ret = -EINVAL;
>>>>>>>>>>> +        goto err;
>>>>>>>>>>> +    }
>>>>>>>>>>> +
>>>>>>>>>>> +    /**
>>>>>>>>>>> +     * Selinux block our read, but actually we are reading 
>>>>>>>>>>> the stand-in
>>>>>>>>>>> +     * for this file.
>>>>>>>>>>> +     * So save current's cred and when going to read, 
>>>>>>>>>>> override mine, and
>>>>>>>>>>> +     * end of read, revert.
>>>>>>>>>>> +     */
>>>>>>>>>>> +    heap_file->cred = prepare_kernel_cred(current);
>>>>>>>>>>> +    if (unlikely(!heap_file->cred)) {
>>>>>>>>>>> +        ret = -ENOMEM;
>>>>>>>>>>> +        goto err;
>>>>>>>>>>> +    }
>>>>>>>>>>> +
>>>>>>>>>>> +    heap_file->file = file;
>>>>>>>>>>> +    heap_file->max_batch = batch;
>>>>>>>>>>> +    heap_file->fsz = fsz;
>>>>>>>>>>> +
>>>>>>>>>>> +    heap_file->direct = file->f_flags & O_DIRECT;
>>>>>>>>>>> +
>>>>>>>>>>> +#define DMA_HEAP_SUGGEST_DIRECT_IO_SIZE (1UL << 30)
>>>>>>>>>>> +    if (!heap_file->direct && fsz >= 
>>>>>>>>>>> DMA_HEAP_SUGGEST_DIRECT_IO_SIZE)
>>>>>>>>>>> +        pr_warn("alloc read file better to use O_DIRECT to 
>>>>>>>>>>> read larget file\n");
>>>>>>>>>>> +
>>>>>>>>>>> +    return 0;
>>>>>>>>>>> +
>>>>>>>>>>> +err:
>>>>>>>>>>> +    fput(file);
>>>>>>>>>>> +    return ret;
>>>>>>>>>>> +}
>>>>>>>>>>> +
>>>>>>>>>>> +static void destroy_dma_heap_file(struct dma_heap_file 
>>>>>>>>>>> *heap_file)
>>>>>>>>>>> +{
>>>>>>>>>>> +    fput(heap_file->file);
>>>>>>>>>>> +    put_cred(heap_file->cred);
>>>>>>>>>>> +}
>>>>>>>>>>> +
>>>>>>>>>>> +static int dma_heap_buffer_alloc_read_file(struct dma_heap 
>>>>>>>>>>> *heap, int file_fd,
>>>>>>>>>>> +                       size_t batch, unsigned int fd_flags,
>>>>>>>>>>> +                       unsigned int heap_flags)
>>>>>>>>>>> +{
>>>>>>>>>>> +    struct dma_buf *dmabuf;
>>>>>>>>>>> +    int fd;
>>>>>>>>>>> +    struct dma_heap_file heap_file;
>>>>>>>>>>> +
>>>>>>>>>>> +    fd = prepare_dma_heap_file(&heap_file, file_fd, batch);
>>>>>>>>>>> +    if (fd)
>>>>>>>>>>> +        goto error_file;
>>>>>>>>>>> +
>>>>>>>>>>> +    dmabuf = heap->ops->allocate_read_file(heap, 
>>>>>>>>>>> &heap_file, fd_flags,
>>>>>>>>>>> +                           heap_flags);
>>>>>>>>>>> +    if (IS_ERR(dmabuf)) {
>>>>>>>>>>> +        fd = PTR_ERR(dmabuf);
>>>>>>>>>>> +        goto error;
>>>>>>>>>>> +    }
>>>>>>>>>>> +
>>>>>>>>>>> +    fd = dma_buf_fd(dmabuf, fd_flags);
>>>>>>>>>>> +    if (fd < 0) {
>>>>>>>>>>> +        dma_buf_put(dmabuf);
>>>>>>>>>>> +        /* just return, as put will call release and that 
>>>>>>>>>>> will free */
>>>>>>>>>>> +    }
>>>>>>>>>>> +
>>>>>>>>>>> +error:
>>>>>>>>>>> +    destroy_dma_heap_file(&heap_file);
>>>>>>>>>>> +error_file:
>>>>>>>>>>> +    return fd;
>>>>>>>>>>> +}
>>>>>>>>>>> +
>>>>>>>>>>>   static int dma_heap_buffer_alloc(struct dma_heap *heap, 
>>>>>>>>>>> size_t len,
>>>>>>>>>>>                    u32 fd_flags,
>>>>>>>>>>>                    u64 heap_flags)
>>>>>>>>>>> @@ -93,6 +545,38 @@ static int dma_heap_open(struct inode 
>>>>>>>>>>> *inode, struct file *file)
>>>>>>>>>>>       return 0;
>>>>>>>>>>>   }
>>>>>>>>>>>   +static long dma_heap_ioctl_allocate_read_file(struct file 
>>>>>>>>>>> *file, void *data)
>>>>>>>>>>> +{
>>>>>>>>>>> +    struct dma_heap_allocation_file_data 
>>>>>>>>>>> *heap_allocation_file = data;
>>>>>>>>>>> +    struct dma_heap *heap = file->private_data;
>>>>>>>>>>> +    int fd;
>>>>>>>>>>> +
>>>>>>>>>>> +    if (heap_allocation_file->fd || 
>>>>>>>>>>> !heap_allocation_file->file_fd)
>>>>>>>>>>> +        return -EINVAL;
>>>>>>>>>>> +
>>>>>>>>>>> +    if (heap_allocation_file->fd_flags & 
>>>>>>>>>>> ~DMA_HEAP_VALID_FD_FLAGS)
>>>>>>>>>>> +        return -EINVAL;
>>>>>>>>>>> +
>>>>>>>>>>> +    if (heap_allocation_file->heap_flags & 
>>>>>>>>>>> ~DMA_HEAP_VALID_HEAP_FLAGS)
>>>>>>>>>>> +        return -EINVAL;
>>>>>>>>>>> +
>>>>>>>>>>> +    if (!heap->ops->allocate_read_file)
>>>>>>>>>>> +        return -EINVAL;
>>>>>>>>>>> +
>>>>>>>>>>> +    fd = dma_heap_buffer_alloc_read_file(
>>>>>>>>>>> +        heap, heap_allocation_file->file_fd,
>>>>>>>>>>> +        heap_allocation_file->batch ?
>>>>>>>>>>> + PAGE_ALIGN(heap_allocation_file->batch) :
>>>>>>>>>>> +            DEFAULT_ADI_BATCH,
>>>>>>>>>>> +        heap_allocation_file->fd_flags,
>>>>>>>>>>> +        heap_allocation_file->heap_flags);
>>>>>>>>>>> +    if (fd < 0)
>>>>>>>>>>> +        return fd;
>>>>>>>>>>> +
>>>>>>>>>>> +    heap_allocation_file->fd = fd;
>>>>>>>>>>> +    return 0;
>>>>>>>>>>> +}
>>>>>>>>>>> +
>>>>>>>>>>>   static long dma_heap_ioctl_allocate(struct file *file, 
>>>>>>>>>>> void *data)
>>>>>>>>>>>   {
>>>>>>>>>>>       struct dma_heap_allocation_data *heap_allocation = data;
>>>>>>>>>>> @@ -121,6 +605,7 @@ static long 
>>>>>>>>>>> dma_heap_ioctl_allocate(struct file *file, void *data)
>>>>>>>>>>>     static unsigned int dma_heap_ioctl_cmds[] = {
>>>>>>>>>>>       DMA_HEAP_IOCTL_ALLOC,
>>>>>>>>>>> +    DMA_HEAP_IOCTL_ALLOC_AND_READ,
>>>>>>>>>>>   };
>>>>>>>>>>>     static long dma_heap_ioctl(struct file *file, unsigned 
>>>>>>>>>>> int ucmd,
>>>>>>>>>>> @@ -170,6 +655,9 @@ static long dma_heap_ioctl(struct file 
>>>>>>>>>>> *file, unsigned int ucmd,
>>>>>>>>>>>       case DMA_HEAP_IOCTL_ALLOC:
>>>>>>>>>>>           ret = dma_heap_ioctl_allocate(file, kdata);
>>>>>>>>>>>           break;
>>>>>>>>>>> +    case DMA_HEAP_IOCTL_ALLOC_AND_READ:
>>>>>>>>>>> +        ret = dma_heap_ioctl_allocate_read_file(file, kdata);
>>>>>>>>>>> +        break;
>>>>>>>>>>>       default:
>>>>>>>>>>>           ret = -ENOTTY;
>>>>>>>>>>>           goto err;
>>>>>>>>>>> @@ -316,11 +804,44 @@ static int dma_heap_init(void)
>>>>>>>>>>>         dma_heap_class = class_create(DEVNAME);
>>>>>>>>>>>       if (IS_ERR(dma_heap_class)) {
>>>>>>>>>>> - unregister_chrdev_region(dma_heap_devt, NUM_HEAP_MINORS);
>>>>>>>>>>> -        return PTR_ERR(dma_heap_class);
>>>>>>>>>>> +        ret = PTR_ERR(dma_heap_class);
>>>>>>>>>>> +        goto fail_class;
>>>>>>>>>>>       }
>>>>>>>>>>>       dma_heap_class->devnode = dma_heap_devnode;
>>>>>>>>>>>   +    heap_fctl = kzalloc(sizeof(*heap_fctl), GFP_KERNEL);
>>>>>>>>>>> +    if (unlikely(!heap_fctl)) {
>>>>>>>>>>> +        ret =  -ENOMEM;
>>>>>>>>>>> +        goto fail_alloc;
>>>>>>>>>>> +    }
>>>>>>>>>>> +
>>>>>>>>>>> +    INIT_LIST_HEAD(&heap_fctl->works);
>>>>>>>>>>> + init_waitqueue_head(&heap_fctl->threadwq);
>>>>>>>>>>> + init_waitqueue_head(&heap_fctl->workwq);
>>>>>>>>>>> +
>>>>>>>>>>> +    heap_fctl->work_thread = 
>>>>>>>>>>> kthread_run(dma_heap_file_control_thread,
>>>>>>>>>>> +                         heap_fctl, "heap_fwork_t");
>>>>>>>>>>> +    if (IS_ERR(heap_fctl->work_thread)) {
>>>>>>>>>>> +        ret = -ENOMEM;
>>>>>>>>>>> +        goto fail_thread;
>>>>>>>>>>> +    }
>>>>>>>>>>> +
>>>>>>>>>>> +    heap_fctl->heap_fwork_cachep = 
>>>>>>>>>>> KMEM_CACHE(dma_heap_file_work, 0);
>>>>>>>>>>> +    if (unlikely(!heap_fctl->heap_fwork_cachep)) {
>>>>>>>>>>> +        ret = -ENOMEM;
>>>>>>>>>>> +        goto fail_cache;
>>>>>>>>>>> +    }
>>>>>>>>>>> +
>>>>>>>>>>>       return 0;
>>>>>>>>>>> +
>>>>>>>>>>> +fail_cache:
>>>>>>>>>>> +    kthread_stop(heap_fctl->work_thread);
>>>>>>>>>>> +fail_thread:
>>>>>>>>>>> +    kfree(heap_fctl);
>>>>>>>>>>> +fail_alloc:
>>>>>>>>>>> +    class_destroy(dma_heap_class);
>>>>>>>>>>> +fail_class:
>>>>>>>>>>> +    unregister_chrdev_region(dma_heap_devt, NUM_HEAP_MINORS);
>>>>>>>>>>> +    return ret;
>>>>>>>>>>>   }
>>>>>>>>>>>   subsys_initcall(dma_heap_init);
>>>>>>>>>>> diff --git a/include/linux/dma-heap.h 
>>>>>>>>>>> b/include/linux/dma-heap.h
>>>>>>>>>>> index 064bad725061..9c25383f816c 100644
>>>>>>>>>>> --- a/include/linux/dma-heap.h
>>>>>>>>>>> +++ b/include/linux/dma-heap.h
>>>>>>>>>>> @@ -12,12 +12,17 @@
>>>>>>>>>>>   #include <linux/cdev.h>
>>>>>>>>>>>   #include <linux/types.h>
>>>>>>>>>>>   +#define DEFAULT_ADI_BATCH (128 << 20)
>>>>>>>>>>> +
>>>>>>>>>>>   struct dma_heap;
>>>>>>>>>>> +struct dma_heap_file_task;
>>>>>>>>>>> +struct dma_heap_file;
>>>>>>>>>>>     /**
>>>>>>>>>>>    * struct dma_heap_ops - ops to operate on a given heap
>>>>>>>>>>>    * @allocate:        allocate dmabuf and return struct 
>>>>>>>>>>> dma_buf ptr
>>>>>>>>>>> - *
>>>>>>>>>>> + * @allocate_read_file: allocate dmabuf and read file, then 
>>>>>>>>>>> return struct
>>>>>>>>>>> + * dma_buf ptr.
>>>>>>>>>>>    * allocate returns dmabuf on success, ERR_PTR(-errno) on 
>>>>>>>>>>> error.
>>>>>>>>>>>    */
>>>>>>>>>>>   struct dma_heap_ops {
>>>>>>>>>>> @@ -25,6 +30,11 @@ struct dma_heap_ops {
>>>>>>>>>>>                       unsigned long len,
>>>>>>>>>>>                       u32 fd_flags,
>>>>>>>>>>>                       u64 heap_flags);
>>>>>>>>>>> +
>>>>>>>>>>> +    struct dma_buf *(*allocate_read_file)(struct dma_heap 
>>>>>>>>>>> *heap,
>>>>>>>>>>> +                          struct dma_heap_file *heap_file,
>>>>>>>>>>> +                          u32 fd_flags,
>>>>>>>>>>> +                          u64 heap_flags);
>>>>>>>>>>>   };
>>>>>>>>>>>     /**
>>>>>>>>>>> @@ -65,4 +75,49 @@ const char *dma_heap_get_name(struct 
>>>>>>>>>>> dma_heap *heap);
>>>>>>>>>>>    */
>>>>>>>>>>>   struct dma_heap *dma_heap_add(const struct 
>>>>>>>>>>> dma_heap_export_info *exp_info);
>>>>>>>>>>>   +/**
>>>>>>>>>>> + * dma_heap_destroy_file_read - waits for a file read to 
>>>>>>>>>>> complete then destroy it
>>>>>>>>>>> + * Returns: true if the file read failed, false otherwise
>>>>>>>>>>> + */
>>>>>>>>>>> +bool dma_heap_destroy_file_read(struct dma_heap_file_task 
>>>>>>>>>>> *heap_ftask);
>>>>>>>>>>> +
>>>>>>>>>>> +/**
>>>>>>>>>>> + * dma_heap_wait_for_file_read - waits for a file read to 
>>>>>>>>>>> complete
>>>>>>>>>>> + * Returns: true if the file read failed, false otherwise
>>>>>>>>>>> + */
>>>>>>>>>>> +bool dma_heap_wait_for_file_read(struct dma_heap_file_task 
>>>>>>>>>>> *heap_ftask);
>>>>>>>>>>> +
>>>>>>>>>>> +/**
>>>>>>>>>>> + * dma_heap_alloc_file_read - Declare a task to read file 
>>>>>>>>>>> when allocate pages.
>>>>>>>>>>> + * @heap_file:        target file to read
>>>>>>>>>>> + *
>>>>>>>>>>> + * Return NULL if failed, otherwise return a struct pointer.
>>>>>>>>>>> + */
>>>>>>>>>>> +struct dma_heap_file_task *
>>>>>>>>>>> +dma_heap_declare_file_read(struct dma_heap_file *heap_file);
>>>>>>>>>>> +
>>>>>>>>>>> +/**
>>>>>>>>>>> + * dma_heap_prepare_file_read - cache each allocated page 
>>>>>>>>>>> until we meet this batch.
>>>>>>>>>>> + * @heap_ftask:        prepared and need to commit's work.
>>>>>>>>>>> + * @page:        current allocated page. don't care which 
>>>>>>>>>>> order.
>>>>>>>>>>> + *
>>>>>>>>>>> + * Returns true if reach to batch, false so go on prepare.
>>>>>>>>>>> + */
>>>>>>>>>>> +bool dma_heap_prepare_file_read(struct dma_heap_file_task 
>>>>>>>>>>> *heap_ftask,
>>>>>>>>>>> +                struct page *page);
>>>>>>>>>>> +
>>>>>>>>>>> +/**
>>>>>>>>>>> + * dma_heap_commit_file_read -  prepare collect enough 
>>>>>>>>>>> memory, going to trigger IO
>>>>>>>>>>> + * @heap_ftask:            info that current IO needs
>>>>>>>>>>> + *
>>>>>>>>>>> + * This commit will also check if reach to tail read.
>>>>>>>>>>> + * For direct I/O submissions, it is necessary to pay 
>>>>>>>>>>> attention to file reads
>>>>>>>>>>> + * that are not page-aligned. For the unaligned portion of 
>>>>>>>>>>> the read, buffer IO
>>>>>>>>>>> + * needs to be triggered.
>>>>>>>>>>> + * Returns:
>>>>>>>>>>> + *   0 if all right, -errno if something wrong
>>>>>>>>>>> + */
>>>>>>>>>>> +int dma_heap_submit_file_read(struct dma_heap_file_task 
>>>>>>>>>>> *heap_ftask);
>>>>>>>>>>> +size_t dma_heap_file_size(struct dma_heap_file *heap_file);
>>>>>>>>>>> +
>>>>>>>>>>>   #endif /* _DMA_HEAPS_H */
>>>>>>>>>>> diff --git a/include/uapi/linux/dma-heap.h 
>>>>>>>>>>> b/include/uapi/linux/dma-heap.h
>>>>>>>>>>> index a4cf716a49fa..8c20e8b74eed 100644
>>>>>>>>>>> --- a/include/uapi/linux/dma-heap.h
>>>>>>>>>>> +++ b/include/uapi/linux/dma-heap.h
>>>>>>>>>>> @@ -39,6 +39,27 @@ struct dma_heap_allocation_data {
>>>>>>>>>>>       __u64 heap_flags;
>>>>>>>>>>>   };
>>>>>>>>>>>   +/**
>>>>>>>>>>> + * struct dma_heap_allocation_file_data - metadata passed 
>>>>>>>>>>> from userspace for
>>>>>>>>>>> + * allocations and read file
>>>>>>>>>>> + * @fd:            will be populated with a fd which 
>>>>>>>>>>> provides the
>>>>>>>>>>> + *     ��      handle to the allocated dma-buf
>>>>>>>>>>> + * @file_fd:        file descriptor to read from(suggested 
>>>>>>>>>>> to use O_DIRECT open file)
>>>>>>>>>>> + * @batch:        how many memory alloced then file 
>>>>>>>>>>> read(bytes), default 128MB
>>>>>>>>>>> + *            will auto aligned to PAGE_SIZE
>>>>>>>>>>> + * @fd_flags:        file descriptor flags used when 
>>>>>>>>>>> allocating
>>>>>>>>>>> + * @heap_flags:        flags passed to heap
>>>>>>>>>>> + *
>>>>>>>>>>> + * Provided by userspace as an argument to the ioctl
>>>>>>>>>>> + */
>>>>>>>>>>> +struct dma_heap_allocation_file_data {
>>>>>>>>>>> +    __u32 fd;
>>>>>>>>>>> +    __u32 file_fd;
>>>>>>>>>>> +    __u32 batch;
>>>>>>>>>>> +    __u32 fd_flags;
>>>>>>>>>>> +    __u64 heap_flags;
>>>>>>>>>>> +};
>>>>>>>>>>> +
>>>>>>>>>>>   #define DMA_HEAP_IOC_MAGIC        'H'
>>>>>>>>>>>     /**
>>>>>>>>>>> @@ -50,4 +71,15 @@ struct dma_heap_allocation_data {
>>>>>>>>>>>   #define DMA_HEAP_IOCTL_ALLOC _IOWR(DMA_HEAP_IOC_MAGIC, 0x0,\
>>>>>>>>>>>                         struct dma_heap_allocation_data)
>>>>>>>>>>>   +/**
>>>>>>>>>>> + * DOC: DMA_HEAP_IOCTL_ALLOC_AND_READ - allocate memory 
>>>>>>>>>>> from pool and both
>>>>>>>>>>> + *                    read file when allocate memory.
>>>>>>>>>>> + *
>>>>>>>>>>> + * Takes a dma_heap_allocation_file_data struct and returns 
>>>>>>>>>>> it with the fd field
>>>>>>>>>>> + * populated with the dmabuf handle of the allocation. When 
>>>>>>>>>>> return, the dma-buf
>>>>>>>>>>> + * content is read from file.
>>>>>>>>>>> + */
>>>>>>>>>>> +#define DMA_HEAP_IOCTL_ALLOC_AND_READ \
>>>>>>>>>>> +    _IOWR(DMA_HEAP_IOC_MAGIC, 0x1, struct 
>>>>>>>>>>> dma_heap_allocation_file_data)
>>>>>>>>>>> +
>>>>>>>>>>>   #endif /* _UAPI_LINUX_DMABUF_POOL_H */
>>>>>>>>>>
>>>>>>>>
>>>>>
>>>
>
