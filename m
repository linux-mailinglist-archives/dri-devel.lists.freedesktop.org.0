Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79302AC7566
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 03:35:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C21910E6D7;
	Thu, 29 May 2025 01:35:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Gl/+ON54";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2041.outbound.protection.outlook.com [40.107.95.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5FD110E204;
 Thu, 29 May 2025 01:35:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FJdQ5WGZWUiQB7i1y1EiOxQXK5XnjLgI9IA+kRw9urrTA8Gw5YTmAIg+hUikGYwN4nuCvqt4yHS2fHvIl9zUFOmd5kL6jbugyHK7+tZSZR15h6UmSOk+TQ6yGTTKqzlWC6Kwukoq3JKWj5ADizhzSZ87BuCL286Wn4W7sU5fd153Jub5linBK2qJX5/StXdyQIH+OuTbvQpWa4MgvseYmB0LGHE9AkzY9Yf9fztISPthgjVTb2whzRPDJ1wV0M7N21NzyrNJN//mFXx0ILSGeFijm9zi4CBxYScmQcYECP9ydL/eTrroex1hIST2NLzISgtfckAO1zBgx/QC/jhyDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dj1XSYw0ygodd8FlwF9V5CveliOQ6picMIOKqRTpBj0=;
 b=fIogXiEemguJ9yfkJBdQo6CdA9wX5hvz9ZQkSNOlVljlYy2cjCxU6oloR7VIugXo5WxhAXqj+NYM/owg7b/WGMQcxBNTsTZPF7fDPxk1JxzgZelOQMC0K4HzmNhe43PQqTE34aH492Xjt+FzmjzF9OCr7U7Hk6rGr4YbeNs6ENXDd1Tr7ca6/sPvKWFZtTFVpY8Okp7kLKsZHnisAveBJYUDaTkWxZOLnTaGi9yeoirX8cucmczFWEmpk4RD9r935R2iD11wILvsGo9ASD4AiFak1BM4z33JyGM+HWXKM5P5NmNNKjQjL5oGXnQgfHZvUxfmamk2xj+/eZhyXP+jgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dj1XSYw0ygodd8FlwF9V5CveliOQ6picMIOKqRTpBj0=;
 b=Gl/+ON54+8AubwYiYeJg2WkWH3tdhWXzncK8IIIGqtTvhCc1rFeGEdBZDTbPDNo07sDcR599emsWEe3TlP0ZUl6ZTqx+Dq8wiYyA7wb2Aau81gXS0pfAsttJJpE+CQcz1y0JbdwtzwtxODRZxGH30ail2apcBXGXgy07t1fAbGbZO56ZTmet4J7b4XCjrsN4p0nGPjfpjX5b930lkKh6iy5zDYYzoRRXHQgYPRCISuwO12l2yalzABo8sgblOOnH5RZBFUhvdBV1XJ77RGVHT1r+6b6BDtinhXUvxyLeFG4+fgOUqvHCIjL5rwenTMSeE7T5NAWjwHMwNOLGDuIKgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN0PR12MB5857.namprd12.prod.outlook.com (2603:10b6:208:378::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Thu, 29 May
 2025 01:35:06 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8769.025; Thu, 29 May 2025
 01:35:06 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 May 2025 10:35:02 +0900
Message-Id: <DA89BGOZ43SA.10E6OKKJ71GZG@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor Gross"
 <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Ben Skeggs" <bskeggs@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 04/20] rust: add new `num` module with useful integer
 operations
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alice Ryhl" <aliceryhl@google.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-4-05dfd4f39479@nvidia.com>
 <CAH5fLgg6s2JM3HtzR3jimUnjLY0BBBpnNLuBUdrsOYCqmx+8pg@mail.gmail.com>
In-Reply-To: <CAH5fLgg6s2JM3HtzR3jimUnjLY0BBBpnNLuBUdrsOYCqmx+8pg@mail.gmail.com>
X-ClientProxiedBy: TYCP301CA0079.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN0PR12MB5857:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fcf2a23-f360-4921-0968-08dd9e510a5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MlczUW5WV3Y1eDhvTSs3VTR5WmMrTXg5VGdHam15U0FBd1UycWFZbG90WVU2?=
 =?utf-8?B?VE82NUtqTDI0MmZ3ektyUFZwOS9ZTmNrYTNwbk1iYUV1TW5kMmVWUWY4eVVt?=
 =?utf-8?B?SVVGY0lmbk8vcmtXcmsyVEFEMUczVklCUXRWUk4zWXJ0dkpmWmNucStURFoy?=
 =?utf-8?B?OVlBR0NJbDdUK3JjdjlNTjJvMis3SG4zbzNHUUFiTUQrOEQ3Yk1NaGpKY1lj?=
 =?utf-8?B?VGVkNzY0bDJWaU9WeEtnTHRmemh6TjZTQndPQTJoWjJ2N1JDc2lYT0d0bmlZ?=
 =?utf-8?B?b3ptL3JOeW5MbStTZmVhaFVLeUw3WEpXV2FkMVNhUkxxUGtwU2gyYzNBNXBI?=
 =?utf-8?B?MkpPQksvcEN4dmVkeEF4c0prSzIrdHZDVEQ4MHI5eUNxNG15OUFrK2tWOTJT?=
 =?utf-8?B?TUhZVzlsZXF0UUg2SHVZbnBXci9ua01nL0R6N0FGSEkwNzErT1JMbDRWVWRx?=
 =?utf-8?B?VGlhNytSR0NoYXpvUFh3L29yMjYrWjJRTkFlTmVkRXhxajZmTXRNRCs2MzIy?=
 =?utf-8?B?ZmRPR2lFd2Z4MW9DT0Jnc1hIazJJVmhIeStoRnkxd2t4cEVaSk5TQzFSZGk0?=
 =?utf-8?B?NGZ3WCs0aFNRQUtKMWhxKzh5QzdLVWNBUHpBSEVvNms0aUlRRGwyUVhEM2Fr?=
 =?utf-8?B?VVpWRXN0QkFqUUloZGQvczllSGQ5Q1NWZTEwT0QrQjRSdHYxaUc1OWpIK3FM?=
 =?utf-8?B?eTBMQ1h0M1I2TlZZOE8xL1MwOEdkV0E1ZU1ncE5PYm4xQXIzbU9ydXdhWU56?=
 =?utf-8?B?MmNmNi9aMEMrelFielp2YWtUbHhMWk1kOVQxS2JkbXhZT0dOZTdGaUlyakNU?=
 =?utf-8?B?aWN3dk1FdFdwdEZHOGtVUzR1SUh1U3kvQXg1MXI5d2RMcThYSElrZlFicXBy?=
 =?utf-8?B?UGR2OHpUWjQ2V3g2dkN6eURhS3JkZ28xbStIMlpGNGcyanViWDNZbTRzK3NZ?=
 =?utf-8?B?dE0vd25IVjc2KzFUaTJ3RVBZZi9TVlBLVkVHTEl6c3pKanRET09XY1I0cndx?=
 =?utf-8?B?V2RhME9HYSttZ1NGSzRHMEdwdm5maEtTY1E3Sm15ZU5jZktKdEdHTkFFaVlE?=
 =?utf-8?B?SHVYOWIyTTRrNmhPaDJzeUxSTEVVT1JWTHQzYVVISlAyV25IV0tFMjNJc01S?=
 =?utf-8?B?RXZ3THk5SFJqWmtibE9rTEZ3bk52dmdTenBBWXIxcVEveldOMk5uNlllMkRw?=
 =?utf-8?B?SHVzNngxam54WUE5MktobXphOTVuZmdMdjZKbWpQaTlXTS9kbVVSR1ViNzNP?=
 =?utf-8?B?enA5dmNERFJGMWVVYkxBejJkVWVmWUlra0ZrNm5OMzlrd3J3U1NiaE9tVGt1?=
 =?utf-8?B?MjdMTGYvSjdCYk91VU5QTmZUNFAxWTZoYmJBL2VkeVpRS0did0laSWUzcjdL?=
 =?utf-8?B?MHVpN0h4L3BSVXNQWDFZZWRsbmVRNnRPRXYyNlQ0Z0tUM1k4aVRFaGpRZ2tX?=
 =?utf-8?B?T2JOa1gzVDdMTUtaYThIakRCakhSSEVhUDBDSlRUQU0wMmVsNEFpTlpBWGhp?=
 =?utf-8?B?eXhkUEZFVmdpcVd4MXg5K05CaFArMW1JSFA1aTB4ZENLUVRGZHpIQ0M3OC80?=
 =?utf-8?B?L3cxVnVKMXRFZjMvWVRCZkhsQm9aajhHdUVxZEhHd3RURDZnWjZyRjVheU5Q?=
 =?utf-8?B?eWp6WmVSZEhGb0k5N0krQkRvYzU5YkRqdi9NZ0RaaEpEK1BYVnp3U1V0UnFt?=
 =?utf-8?B?SGg4U0lkZFJuSmVQaldXMEZxV0Fwci9GT3NyeDQvc2xTQlFpb1RnRittWlR3?=
 =?utf-8?B?TjlQOFF3RnVVaCswK2RPeG9vZ2FkMUhoSm5GRlBGelo5WnRhQlJlaUZEVHMy?=
 =?utf-8?B?UllKYUNwR3VRelp6TFllMm93dG5RQkp6N2hQcmdlOUpyNzE5bzVUMmtHMlpF?=
 =?utf-8?B?R3F0OVllZW96NzZRYXNnNFR1ZEpEY09NODF6S3hzbDBuNElXc0VZd2lObElt?=
 =?utf-8?Q?AQlyPBgw5PU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTdtUnJhZVp1K0pqNkxiM2dCdHltbU1jWXI0OGVGMkQ4b0VXWGRmdi9xb251?=
 =?utf-8?B?Z25hVVJIL2pjV2QvN3l4UUdOdndlMGttdUhDV3pxVjJUSkljcGpnOGM2SUFl?=
 =?utf-8?B?L2RPcGpxeFpiZDZqUnFyZDhqL2NCM0x5MkR6NFJSYzBhcFVYbGZoZHRTTlVV?=
 =?utf-8?B?OGZEY0x3dVIrNjEzaEdTRzI5RmpZT2taeTR6U3BUZE53TnA2cGVueHl0UUk0?=
 =?utf-8?B?NWU4QzlHL1ZuV1NreGc1ZWd4L3BSVkZiMUZWYktoRjk0VFpZcjY5U20ySEZl?=
 =?utf-8?B?Y0w2dk5vYjd4ODd6d2dGaE9HVEp3RElnY04vYTgvaDkxMDBkOVNyRDJKSElm?=
 =?utf-8?B?bVBOczhSNmY1OXIzL1c1WGRQaktpWi9MMCt2Uml1TGJzaDJYMGpyTmY5QU9j?=
 =?utf-8?B?OXJyTW0vdEdBYjhHSDhUUy9rUnZ6S2xpTDVoc0V3RlVIQ1dBa1ovTVN2TGxh?=
 =?utf-8?B?TXRPRlQ3cDYzRFoxa1BzbkJCWFJSVWppdUpWMWpiQ0d3Q253WVlWSEVaSHZI?=
 =?utf-8?B?Tnd0UURHNzFkQ00ya2JEVHdHTGNwZXlwQ0ZaditxaVdaZWRsSndmTW1US3Zq?=
 =?utf-8?B?cTdDZFNoK0ptUFNwYjl0ZVo0aE1HWDU2MXM3R094Y2o5dkE4T2h4Y0xpcE9o?=
 =?utf-8?B?OWFjdVBiKzZDZm00S0orb1hXcjgxOExHR3l1dlRQZ0wyVXdFb0EwaGlRMEZV?=
 =?utf-8?B?STBxL1hOMlowdmdjQkpRR05CREhFTFZyQ2pQYWNjZEttNEJRM1N3QTBpWU5D?=
 =?utf-8?B?Slo0MHROWmZTWW1aWlFydHJ4allHR1J2empOT0xTbzl4cnliTG9JR1ZkVDJi?=
 =?utf-8?B?N3VJc1NZN0hTczFlMG83U0s5b2FTRkJwbTJpWUFiQStZU3NVSUp1QzVjbUg1?=
 =?utf-8?B?Q00yMzNlNVZWYTJrYmlXVVlQODVhYVdtamhPQWZCbmYvcHBPT2hseWhiNUJK?=
 =?utf-8?B?QzdPdlFuekh1K3U3T09FckRKYklhUWdHK2JiRjdaV2NyL2lRVWlBNytMWmlv?=
 =?utf-8?B?U3dSb2krK3VvazZoUFlXWHVmU3VSSTZkNGhmYTZoNFlha1JpcE5hMDNoQUxi?=
 =?utf-8?B?TGJLQzBITzd6VmZjaWZkNDlPNEptTXRhaVNEYWdWVXg2RUNjbklWQzJSSDNk?=
 =?utf-8?B?NnRpNmRHYmMyeFhBd0lzdVlpS0VmdCtTcGZPb0JwTERucnZ4UUFRb1d5QVM5?=
 =?utf-8?B?ejhvc1BPZTZ4bDhKbTd0eGZKTkFyOHBRS09QRVViQzNBOW1pWUd6TDZzU0Q3?=
 =?utf-8?B?VkdWSGV5c0p5NU9tQVg3YWgzS3hEbStYODQ1MFcxajdsNm1tSU1lTGRUaEZZ?=
 =?utf-8?B?dU1TN1hmUERYV3RKRTVIdkw4L2l1eEVXVUFaZk9nRWVRbmpkMm9MQk9VV2Jt?=
 =?utf-8?B?K1hSU2x3aTB2ZEdRUUM1Q2hvdkMxZ24xNHErQlhrWEYxUVVsOTEySTQrQVNB?=
 =?utf-8?B?OTRJUW8vRnRmckgvOWV0UitocDBHMGZ2MlZxYWVHQzhmdFE5bTd3U1l2Zzdw?=
 =?utf-8?B?TUpGNnh0dHdYeTQ0bFBualo2K0IvUk5ZaEN0eGhObnVFUW5kcklzeDE1Z3JU?=
 =?utf-8?B?U2FCc0o4eUEwd3IyMUhmbjc3clljZ2ZFeFovSlZZWWhYYXBDNzR2Ni9aVXVk?=
 =?utf-8?B?b2Q1dmYrUm05M05rZEFhd1hRcnRPS1dVVEp6YUpqajdKejVnQk5tbkJVeGdL?=
 =?utf-8?B?ZVZUVkh4SnF2SUw0czcrQUFOWnBNTDl3Y241b1hCWlJ1VDczcllTZFZRdjlM?=
 =?utf-8?B?QnRwSUpzRlQ3MkRYVDgzNHU2U3MrVXRkMXpWV3pMSnBWQkpqcmUvOWhuVURm?=
 =?utf-8?B?UGdPSDNhN05hQ2NhN2MyajFlSjEraUQ2WjB1WGRDaUJrcmRNb25NOEI5aWpK?=
 =?utf-8?B?SUlsZFNFcXhRNFAxRkV0QVlEMS8vbUJFTnJqVkFGd3AydzMzTWo0V2lJZFEv?=
 =?utf-8?B?SkdVMUJRVlhObzFLYkRvV0FzQy8yL0FVb2RJb2dBSWs4bjJtazRMenZMeXFy?=
 =?utf-8?B?eDZlZnpkQzJhendWV0tBd2hOQ0NOeGUvTERwN0xCT0R4VTloZ1hUL29PK0J2?=
 =?utf-8?B?VEpYS2c4STlkMWZxdEpESEw3Mk43L2xMT24zS0w4THRDS0xJZi8zbnRsYmNm?=
 =?utf-8?Q?d+2JBKNny8aRQECyzcxgooK2d?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fcf2a23-f360-4921-0968-08dd9e510a5c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 01:35:06.4630 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d/8NCE9VETEekBkUm2kYe3IPcrZLYdZk86HHQ2bc+wZyEaOiCoD2K2FgK+//Jd2qmFUaFRc8gzhFtgkYrqmaMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5857
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

Hi Alice,

On Thu May 29, 2025 at 4:56 AM JST, Alice Ryhl wrote:
> On Wed, May 21, 2025 at 8:45=E2=80=AFAM Alexandre Courbot <acourbot@nvidi=
a.com> wrote:
>>
>> Introduce the `num` module, featuring the `NumExt` extension trait
>> that expands unsigned integers with useful operations for the kernel.
>>
>> These are to be used by the nova-core driver, but they are so ubiquitous
>> that other drivers should be able to take advantage of them as well.
>>
>> The currently implemented operations are:
>>
>> - align_down()
>> - align_up()
>> - fls()
>>
>> But this trait is expected to be expanded further.
>>
>> `NumExt` is on unsigned types using a macro. An approach using another
>> trait constrained by the operator traits that we need (`Add`, `Sub`,
>> etc) was also considered, but had to be dropped as we need to use
>> wrapping operations, which are not provided by any trait.
>>
>> Co-developed-by: Joel Fernandes <joelagnelf@nvidia.com>
>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  rust/kernel/lib.rs |  1 +
>>  rust/kernel/num.rs | 82 +++++++++++++++++++++++++++++++++++++++++++++++=
+++++++
>>  2 files changed, 83 insertions(+)
>>
>> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
>> index ab0286857061d2de1be0279cbd2cd3490e5a48c3..be75b196aa7a29cf3eed7c90=
2ed8fb98689bbb50 100644
>> --- a/rust/kernel/lib.rs
>> +++ b/rust/kernel/lib.rs
>> @@ -67,6 +67,7 @@
>>  pub mod miscdevice;
>>  #[cfg(CONFIG_NET)]
>>  pub mod net;
>> +pub mod num;
>>  pub mod of;
>>  pub mod page;
>>  #[cfg(CONFIG_PCI)]
>> diff --git a/rust/kernel/num.rs b/rust/kernel/num.rs
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..05d45b59313d830876c1a7b4=
52827689a6dd5400
>> --- /dev/null
>> +++ b/rust/kernel/num.rs
>> @@ -0,0 +1,82 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! Numerical and binary utilities for primitive types.
>> +
>> +/// Extension trait providing useful methods for the kernel on integers=
.
>> +pub trait NumExt {
>
> I wonder if these should just be standalone methods instead of an
> extension trait?

Standalone methods would need to have different names depending on the
type (e.g. `align_down_u8`, `align_down_u16`, etc.) as I don't think
they can be all made generic (there is for instance no trait for
`wrapping_add`). I thought an extension trait would be cleaner in that
respect.

>
>> +    /// Align `self` down to `alignment`.
>> +    ///
>> +    /// `alignment` must be a power of 2 for accurate results.
>> +    ///
>> +    /// # Examples
>> +    ///
>> +    /// ```
>> +    /// use kernel::num::NumExt;
>> +    ///
>> +    /// assert_eq!(0x4fffu32.align_down(0x1000), 0x4000);
>> +    /// assert_eq!(0x4fffu32.align_down(0x0), 0x0);
>> +    /// ```
>> +    fn align_down(self, alignment: Self) -> Self;
>> +
>> +    /// Align `self` up to `alignment`.
>> +    ///
>> +    /// `alignment` must be a power of 2 for accurate results.
>> +    ///
>> +    /// Wraps around to `0` if the requested alignment pushes the resul=
t above the type's limits.
>> +    ///
>> +    /// # Examples
>> +    ///
>> +    /// ```
>> +    /// use kernel::num::NumExt;
>> +    ///
>> +    /// assert_eq!(0x4fffu32.align_up(0x1000), 0x5000);
>> +    /// assert_eq!(0x4000u32.align_up(0x1000), 0x4000);
>> +    /// assert_eq!(0x0u32.align_up(0x1000), 0x0);
>> +    /// assert_eq!(0xffffu16.align_up(0x100), 0x0);
>> +    /// assert_eq!(0x4fffu32.align_up(0x0), 0x0);
>> +    /// ```
>> +    fn align_up(self, alignment: Self) -> Self;
>
> I would probably make alignment into a const parameter.
>
> fn align_up<ALIGN: usize>(value: usize) -> usize {
>     const { assert!(ALIGN.is_power_of_two()) };
>     self.wrapping_add(ALIGN.wrapping_sub(1)).align_down(ALIGN)
> }
>
> Here the check for power-of-two happens at compile time. Unless you
> have cases where the alignment is a dynamic parameter?

It's very tempting, and I agree that in 99% of the cases the alignment
parameter is a clear constant. There might be the odd case where e.g. a
particular device supports different page sizes for its DMA mappings,
but even there the sizes would come from a limited list.

Worst case, providing two versions, or having the user fall back to
`next_multiple_of` is also an option.
