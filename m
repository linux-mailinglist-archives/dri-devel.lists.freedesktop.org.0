Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C027C38778
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 01:26:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1730010E7D5;
	Thu,  6 Nov 2025 00:26:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="EwsAW4ce";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012053.outbound.protection.outlook.com [52.101.48.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF83910E7D5;
 Thu,  6 Nov 2025 00:26:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ytVDC50D36Pvt7qghBrZP0KWQMMzRjfcjWkIWcTnM91bOrgiTg4IqBKBGHpjE4SZJWWVBAlU+Tt1O8bAf3gUHWa7jD6rr38XMqmQVneAopnrGssE2ri0aK9VaSRrBNpTWCmABp8NiK7lWTWG6DwS7leh8QpOFi7FFFmwTBeA+mW2+ZkZ3XVDDva22qB3+FPnbcOuQuxWTic7PVHtaPopgEL4JNIgxGrFU7hN42R56AJFEVwu4pHi9GZXi3bEhTMgp6Lm7sycHtfavS1v6gcbERH3XNwpiD9LMgnfrDS1lUVr5O1Z5uehpK8WrjmwgPygTAXgA9ruoB+diGhi/xS9gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DFe/F96PftlRh1tvRlA4Vy3OZ9sMBqIlcfrZEPr44v4=;
 b=lHCH77Qyx2Oxx3+8yTfEKO4P1Nes2jcOMf7HUGjfU7bvjuCI3Bj2QjYtqE/Hu01FWSeUcEu9HjOwr3BFcIqHxZJcg3czSmlGn/V4rnSmWaSkCLL94k3eCES/ZDq2iiwnAtm2NLARuJNrptjaJ2g0HB61R31fAKQka8xTXI0JN7aUz2h32fKBJuVmIcw4ZJSlJO/NarVFapEyJgbmdhoy2uYZ7CR8jgIGw7fZL5iBy7O1W9Ltf0npkP2ZN/QisfIwPBREdFUcNTUQcBiXkL3KXRyzsKegLWKEUo97W5bDDD/UenIEYRS/WrfMp9S45UjYfPRxYwIXd26sv2xLdHh6vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DFe/F96PftlRh1tvRlA4Vy3OZ9sMBqIlcfrZEPr44v4=;
 b=EwsAW4ceK2lZhxh3PvHlDg9G8K1yBq2CKC24GJcjFsF/huUeWETwZs80kkmwxR0Ajour+IpXqLHKIYY1tyWyAHSidIfO2A6GyOuK646T1AbqmaLvwFQlNh+stOoJF0vnk7N0IgnTgwJbHWhpVbasgKK9W4+uOBj2sgkNP3BTf7fRVlQ+9reFG3N0LKZgfbLahcNLPyVLrBZYXG2hWyqahroIIw9UZp4YqsM3GjI74Sr/Hfz+6PVJBIJKD2RyGMKvBIJ7MJlZcFDbuRK1eIYU0VDOF34rvpi4Hwis+iBUC4B/HReO+bhz/ZgXJ9lhH+4yPog4jpAZvHWVjt+n/RrKZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ2PR12MB7848.namprd12.prod.outlook.com (2603:10b6:a03:4ca::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Thu, 6 Nov
 2025 00:26:08 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 00:26:08 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 06 Nov 2025 09:26:03 +0900
Message-Id: <DE16OCTBYT7G.3FMDZ8CPMGJKM@nvidia.com>
Cc: "Alistair Popple" <apopple@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, <nouveau@lists.freedesktop.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v2 05/12] nova-core: gsp: Add support for checking if
 GSP reloaded
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Lyude Paul" <lyude@redhat.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <dakr@kernel.org>, <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251102235920.3784592-1-joelagnelf@nvidia.com>
 <20251102235920.3784592-6-joelagnelf@nvidia.com>
 <8cc10b6ec1fce03aa41eae76dc48a6a27a58d7d9.camel@redhat.com>
In-Reply-To: <8cc10b6ec1fce03aa41eae76dc48a6a27a58d7d9.camel@redhat.com>
X-ClientProxiedBy: TYCP286CA0299.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ2PR12MB7848:EE_
X-MS-Office365-Filtering-Correlation-Id: fdd5900f-7b3e-4a6b-d4fb-08de1ccb14ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cXhJZEV0YUVaTEszY0JHRnpSdTFFZ2NuL2RPR2JYQk5ZWTlaY0tVWHoyV0U4?=
 =?utf-8?B?cGV3anErcjNUZzl3eHV3bk4wR014YzB6VXB6Tm81QlhNQUtnL0Q0NFQxQmVn?=
 =?utf-8?B?TlRKREZPNzIzam5jYkxHNkM2eHRXRWV6UTFhdWpXeXpPN3VhdUpDalpWdUdw?=
 =?utf-8?B?aHRma0FaMW5kL2ZNRzhFZUlwcXZ5NVkxaWJVVklCV2FZdy9ZYW9HYlBTbmFS?=
 =?utf-8?B?WDVNdHdUYXJETEtYQ0xweHhFR0hiUmZJVHM2N1RpUndCN3lLUkVvdlBFNG1K?=
 =?utf-8?B?WXMvVVp0MHlCWVMxUmkzbmdVOU9wQzBhRG9YbFlmSVA0bkxqZDI2bnZMb1Vo?=
 =?utf-8?B?eFlOaldqb0tzV0VWcHdKN3I2MVk5ckdjMnYrRi9xbGk2MDNhMjIzZ1JIMGtK?=
 =?utf-8?B?T1JHQkVSNkVuOEpxbXV3OWVKY0JkSGhVTW8zVk9JR0FBNWRHc3REZm9hNWE3?=
 =?utf-8?B?QzF2VGQ0c3Q0bzFwdXc0ME4wOThndjRjNkRoSTgxOVlwNzkxV2trUlBWWDU1?=
 =?utf-8?B?Y1dpQ2M3M1I4VTh1V0phWVlWZUR0QlNmS2M1R0FKQ1BGTnl3T1pQY25WTGU2?=
 =?utf-8?B?VWVXWmw4QlhJOEIyZTZSNDdOcXAwcVZTandCcVFaVUtzRmhYbnU5b00vMUkw?=
 =?utf-8?B?NEZqL1ZYdWpmR2w0UGxxd2l1OU9KUVJhR2x1WnRpNHdyVmV4MThuK2FFRU9Y?=
 =?utf-8?B?V2Z0WFROMzQ1UlNERzUxU1hVYytFYkRFMDI5TThyTExER0RwMGl3MUVDV0c4?=
 =?utf-8?B?TGdQeXYxTnc2eGZ6TGYybHdFaDVuUDMwU3BwZzhuazBndEI3M28wWFhabkNW?=
 =?utf-8?B?bjUyRmRRZm50cnlNb2NSWmEydHJXRVNVakhLN2Vqa1RGVWh0NjhtRXNmai9Y?=
 =?utf-8?B?NG0zMy9LVW9kM1F0L3QzSjAxOXdQY09qOGVLdFYxR0JXS2k5WWFyT3BLYy95?=
 =?utf-8?B?WFFXR2Ztd1EyaVNIeTdwczJiUURyMHB1SFVvRWNKd1owaHZTSHkrN0hvTndH?=
 =?utf-8?B?aVliVkY4b2RxTHJDai82QXlEa3BuQVJCeEFMR0wrWkpkd1IzVy9LcUoxQU5h?=
 =?utf-8?B?Q2IwUnIrVjRkZXNLaDlBTFdrTFNSbGdlNXFuMXNHVWJ1SE9FVkNpNCtDbjlS?=
 =?utf-8?B?aWJxN0ZBb2Z6bzBZYmFqU2NlczBFMUJiWmhiV2F2ei94bWsxd1RxQk1IbzFz?=
 =?utf-8?B?NzBSZjdFUzF0Wk92d1pKd0pkUDcwSldhMXF6d1hneTFPQ2g2YzVTVkJuQndx?=
 =?utf-8?B?ZHM4M1JlVGdLQU9nb0NLZXhhMUNPaThKaVNJOGs5bzA1S1NrU1ZEVFRCeGVJ?=
 =?utf-8?B?WHQ0ak1qUk9ITTk0emI2REJwTUJDVjRZL0QxMklETTZWZHJmSko0QVBqL2lC?=
 =?utf-8?B?ZGlJNFRKSjA4TnV3bFdrTFMzM0M0bENhYUdPNjhyTTR0NTdhNTFZNnNzUzFL?=
 =?utf-8?B?WStDeThOKzQwS2NyQmJmakhSNVcyKzBhSzlnVkNWZmF4NkFYTEsvSnlTcmFE?=
 =?utf-8?B?K1NXbFRPcVE1UlZWOWdWbWZYaWNmR0hnOVhsc01pRUZUNFNiNlVMQldoWEl0?=
 =?utf-8?B?cVBQQXNObXdmYStXTnVYQWZITUJmR3hPayt0VGxZUFI4MEhxTW5adi94Z0xN?=
 =?utf-8?B?aTFGSEw5R2tBS0syMENZMlY2UzJkZlpWVTlzUk5YWlhKcnlJeVRJTHNOWnBh?=
 =?utf-8?B?Y1JpUDcxSHNOeFFGN0JJNVM5OUpPa2FkT1pnWVU1dFVRWWpDRTNHV0FkRmtt?=
 =?utf-8?B?TisrRW9nSWlhckVDRFRwVHNSNDFHZzdlSy92MW5hWVJLKzJ2TXdZSUxtMWk1?=
 =?utf-8?B?ZmpJQjhnMVYyRDk2WUJHbHNYN2hFU1E2YXRBRXRNVVJySTZPYnYxRTlya3FB?=
 =?utf-8?B?eFd4OElkSHNoWHRYRXBLTjMzUGZIUzhCeVNZSFhRT3JHaHFOd29LTG9tTmI2?=
 =?utf-8?Q?TRe0op93fqEEfhiZJqY/PbIyIOMZEaYx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTVtTTU0YWRpYUV1TzIyUjBjaGU0ZzhQK2VuTDIvVEJyOXFBa0NCVG5DY1hK?=
 =?utf-8?B?N0VOZURKNXBXVmNsV2lyb3R3SUVZQjZSem1MRkNhb0lrUTBXT1pPYjRoSFBD?=
 =?utf-8?B?bmpMbjltbmVYNHRORThoTG9hbWVsMXVxbFdVdEptUXpzMnMzQWF5STlUeUZ6?=
 =?utf-8?B?T05hRDRHaGZkS0lYWVhHMk02Yk8xT1JQZHlTd0xiZWxoYlBkb0xTZWlaR0tV?=
 =?utf-8?B?bVhFYTcvRHcrZ3NHcjRwK25XdjZmWjAwSURabTAxWjFPK1Q0eFhYZVI4QW9K?=
 =?utf-8?B?Y2lmcm9LOWJrd0tqUktSZ1g4RDRkdDF2V2pMczhqejFXbzk5NE1jME56dWVM?=
 =?utf-8?B?UWZTb3RIWkFPRlRXMWw3ZWhqYUx2V3czQlVlOHhRTDdBUmZoYk9ZQVFjOEFa?=
 =?utf-8?B?N05wUitOekxqcDl3WTFqSEVaNENYYUtmTWd0MHFPTjBTcGxWV3hrNGRMUE96?=
 =?utf-8?B?U2ptcTRyNTZpMXpUZHdkOHg5cHg0QUhFUnNxM204MnRHREc1bFcyQUhTMEVU?=
 =?utf-8?B?d2t1TkJFRnVaN2tFZlFhSDZ0UzcrQWZQUXNSQmhpbmJVK2kwTmFlWTNxVzl6?=
 =?utf-8?B?SGpPSXU3N1RibGdxdkMyNGtLNXJtY1g5cWtVbWpmWjJ6RWR2d0c4SDBiMUF3?=
 =?utf-8?B?MC82cExMRnZEamI2RmpnMUlZaTlpcEdUdzdGVG42NnljSE5kNjltRFpXMG1r?=
 =?utf-8?B?WlN3aThTZis3R1B3Qms3TlpQV0wrdDFGcDk2NWRhVmJndEtSTWlUZEVBNUN6?=
 =?utf-8?B?dDZuaWhyWnFwaG11OXcvZk45WTVZM1VqUUVzM1Zua25CR3FBR1pYQ1FJK1ZO?=
 =?utf-8?B?KzhDT1djV01zOThBUWpxRkNQMXF1MkhwM3JCMkhiZWp6OHozTDhoNUJOd3dV?=
 =?utf-8?B?QUtJNkcwVnpEWDVMQ1NBUExZYzNpaXZYNSthQi9NTjFOR040UWhyLzFWaUZC?=
 =?utf-8?B?cVFCWmpSWU9QeWI2NXhla1p4RjBsSjhpa1lmVUxEWDRFaUhVZk5PVHcyb2pN?=
 =?utf-8?B?VUVtUEs5WFkvQnVyWFcvQU15R2o3QkNubXg4a2R3eXM4SDdrNGpXVURpM3k5?=
 =?utf-8?B?b1RmaENaT0drcWZ5cHgwTDlSRStxNE92cHJua3paWmVWOEx2RVEvZnFTUjkz?=
 =?utf-8?B?Qzl1M09iRnNXUnE2SVFoa3R3cXI5VjJnSDNQb1R4aHdIZzUxNXlBdTJyaU45?=
 =?utf-8?B?RmhjdHhOV2VNbFdWbmI2U3Nad0p4eGwwdmhyZnFYQXRDaFU1cnlBNWRaUUdR?=
 =?utf-8?B?V3ZjVG1BM2FtRyt6ZWdoWGkzc3pnQ0x5MVBSZkVLQW9zSjdaMExqTWV1cjJr?=
 =?utf-8?B?anVLS1BsRCtGSHdQRWo3Q2FUQXlOVWxCMHNnUFpGL0tFSFdYM2ZvTGUrbVdH?=
 =?utf-8?B?VmNIYXZ4NWpXY3VnVlhzUVBMRkNJUWtFK1BNQWwzTG92ekdmWG9hcG5BWUtn?=
 =?utf-8?B?NHlCYW93Y3lFTGZuWk8xZkVCcURHVUxkbkFtR1NpL0dWQUVQRkNPb2xXVmp0?=
 =?utf-8?B?T0ExTXFPL01ocXpkT1J5ZW5hMWlvSGRla1pISnpuaDRqaFUvOWFueVZIZjY4?=
 =?utf-8?B?NTYwdjVHRHlrWHFTbENucTA2OENrUXBXUW50NmsrUkhOQ3JUMW90SUF5Y1hu?=
 =?utf-8?B?ODYrcUdtaFhHYkJwL21JQjBielBESFNYUzVCQllva0V3TlJXMHh3U3ZrdDZ0?=
 =?utf-8?B?blEzUStITkxSSDNIVkVraGFQSG1WbFdqaFFlTUlVUHlxT3Jnd0h3aU8yOWRI?=
 =?utf-8?B?YVNmb2xtT2R3dUp6Y2xBdTBhMU9qUHp5MVFvTG9NMndnaWxJa0xHWmNhMFdY?=
 =?utf-8?B?T1QrUkI0Z3lTdXBHcXFuc2duN1VmcWJrczB5VHVzMHlQOSticHV4OG1hSHhB?=
 =?utf-8?B?U1lDZjNadDRhZnRjWUlLcENkT0FWM0VpT09nSWdFbU9aWTJvYzByTHUrcEVa?=
 =?utf-8?B?cVJaSDMzTSt2aWw0aHhDNFRNUWVrRHM2WGswV1o1VVEweUZ0cnJNdHFRMzZX?=
 =?utf-8?B?MEh1ZWg2cWN3NGRjNVMzbGhDOHhROTdkQUQrVkUwckpveTBzd3Jyem1scjc0?=
 =?utf-8?B?VFhoV2NJNURiKy9Qd1JQWnp3M1VsaVdvSXlMbVQ3ODBwYnJWVHhmNjlHTGNt?=
 =?utf-8?B?b2tDK1EvcWNJZEd2ZGQ2RXdDK1A2Yzl2OCs2T3ZCMVF3WjFWWFdzN2NZYm12?=
 =?utf-8?Q?/g9HvQSMQAQHUwknsrWCpaMg4dSS4zh47DKCVEW3pQ0B?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdd5900f-7b3e-4a6b-d4fb-08de1ccb14ad
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 00:26:08.6987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U65k1qt+Pd6iHvKSxlJmS056Jf7AH7MNDdgM5KlupYHfIhut9oBd75RA9O3KcPoSf0p1/qGFfC6QJs5icxjmkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7848
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

On Thu Nov 6, 2025 at 8:18 AM JST, Lyude Paul wrote:
> Minor comments:
>
> On Sun, 2025-11-02 at 18:59 -0500, Joel Fernandes wrote:
>> During the sequencer process, we need to check if GSP was successfully
>> reloaded. Add functionality to check for the same.
>>=20
>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/falcon/gsp.rs | 18 ++++++++++++++++++
>>  drivers/gpu/nova-core/regs.rs       |  6 ++++++
>>  2 files changed, 24 insertions(+)
>>=20
>> diff --git a/drivers/gpu/nova-core/falcon/gsp.rs b/drivers/gpu/nova-core=
/falcon/gsp.rs
>> index f17599cb49fa..e0c0b18ec5bf 100644
>> --- a/drivers/gpu/nova-core/falcon/gsp.rs
>> +++ b/drivers/gpu/nova-core/falcon/gsp.rs
>> @@ -1,5 +1,11 @@
>>  // SPDX-License-Identifier: GPL-2.0
>> =20
>> +use kernel::{
>> +    io::poll::read_poll_timeout,
>> +    prelude::*,
>> +    time::Delta, //
>
> Looks like a wild // got loose!

It's a bit confusing at first but this is to conform with the new rules
for imports. :)

https://docs.kernel.org/rust/coding-guidelines.html#imports

Thanks for the reviews!
