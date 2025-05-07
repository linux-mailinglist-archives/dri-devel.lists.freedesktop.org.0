Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5603AAAE153
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 15:53:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A52E10E7D7;
	Wed,  7 May 2025 13:52:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="GHuj8qf9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2050.outbound.protection.outlook.com [40.107.244.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 096C210E7D2;
 Wed,  7 May 2025 13:52:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KTSm60iedl/ikSdBv71kAGGqplEX1A6WQeyR+Ei01eeP59549XKV8H0cWlGUBmFnyn3STZiA0xct2aQjfSKxhX3iIYm0lbJXgXe5XQgBZrb+9F9pWWYzzDvdLmM1EVSAZpC516GjAt7bnmEeSJ5JlYSmqYDVjPA632vTbJjaX/x0XwB2fv8xYascHiAoB9VmGLbqDi2pZp6wf2nbUOhiU9jxsUgfEu5oToYJj589Z5IZw99C9LTpwlw9TPh0aHMWGn379NWadv7eeavm7lZud35boODos3CAHSwX6EU/ed9aJ5lOth60dfYg0w6KQ/asH1wNe10ahj8CRlNF9sgJFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XmWSj57R3v+UIceJhRruaNFfPcJL96GvOx+Ep5xc3PM=;
 b=Cv/f/r2joTHBTiUcMg7HbEupEIzsZPUqTXWyqroPy5s1LPreMIgFjMiAXlIUy5UZQQhvH3B3ljR9w0ZI3zY9BIkCrz7mKklXqDAXCYpJ5Z/WRioK5fRNeZ1IKz/IHLbdlMOO9K8ndEzjRMWzp0yU6evO7/JA+9LYdjcKK6a9D6MLxFvdt+zmiIBNmxRgoJ6Ymfyajim+s9UeuLDqk+eAqi0eMg5N3FOIr6teTdlh++jpRxWlxws8IcI2oq50rWRmGY0FufBwUd5WbgOeQex6AmLju9ilB73glIgOKKYWj43DNbwOJn1Nc4b3ZYAV8CnUQsvLA7tgmgORJzA6Lu+SMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XmWSj57R3v+UIceJhRruaNFfPcJL96GvOx+Ep5xc3PM=;
 b=GHuj8qf9cpHSVm/QHtjhVu6rdZUHO9kmIQ2q/w76o/jtoH7hIDi7m7r1rOO7Bii/ODd/Sj+d771L+7Cm9j7Yn/04hzK+WD665mkoZQCujpTOb9TEtGfHTAjiQmN6QYWd87p87a8Lh86OSj+aVyqqYX+xn6KQ07ntnymqJEb9UwtCC/65e9RnWjZOAgmx4gqpZxXcSQ6cUcx5/eWPeF8iTAVuvU6tHtsVv+l/5aYRrlOvUWXKRl2FERqBy9fAfcsUgwxn5wl2Jfd0YfbY6hnpC5gzIQ0SyhHRwgZhzex519TDJ4nSjunausdVLoELo6vTfplLJDKhdRru0XKVHHaaeA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB6761.namprd12.prod.outlook.com (2603:10b6:510:1ab::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 13:52:53 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 13:52:53 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 07 May 2025 22:52:30 +0900
Subject: [PATCH v3 03/19] gpu: nova-core: add missing GA100 definition
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-nova-frts-v3-3-fcb02749754d@nvidia.com>
References: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
In-Reply-To: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: OSTP286CA0084.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:227::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB6761:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f23137b-a3a5-4f2a-2380-08dd8d6e765f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|376014|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c01sZGxEVStJblEvYk9IMHlHRTg5WENpaXlWN2RLTVc2b0hxTk1KY1RORU5C?=
 =?utf-8?B?U3duUTRxMnZWK2t2akJXOXNpcjE1WDJ6OFRXekZTZ29HendTQTQzQzZqTlF5?=
 =?utf-8?B?eHlFMXBDcU5EdUdQbldYMXpTbEN4eU1rSGFOZG8zYmhweEcya0FqeFo5bDRY?=
 =?utf-8?B?L204KzdhbjVoeW9VM1lKR2FqZGRZT3hiMlBaVWFRSkI3QzVxclYxMXVGT0gy?=
 =?utf-8?B?ZERTZEdjcll6SXJWQzFuL09kdE9Qd1RMamdEMHRWemY1cFpjeTBiTU5oZ3FM?=
 =?utf-8?B?SmI3WW9rUWgrV3Z4eCttS1pzY0J3Zm5TYmE3OFdBcWpCQWZQeDV6OGd6SVUw?=
 =?utf-8?B?WGV0MjFmZ1F4OXZqbjZlaERBbDVGaVJGaVRzZUk5WnVoejFFUyt2b0pVdTlL?=
 =?utf-8?B?cmhwWnF3ODdOcmFoa1U5UjRhdjd2OTlBdm85UUJaaWU2Zld4RTJJZ0FZV0pZ?=
 =?utf-8?B?Z0lIYTFPeGV3QVFkM1hJY2dnK0tDUThaZFVoRUwzalN5blJLWkFGN1lwNHQ3?=
 =?utf-8?B?YVNac0hlOUZYWTA3alltMlZBOEwraFZMQ1QrQnVKQ2JBaXdMRmhXM292OFlq?=
 =?utf-8?B?L0dEU3lrS2RGRm9pNmd5SVdhTEdKTDVCMXVqbVM0OUlWeHQ0c3VFUXloTWJx?=
 =?utf-8?B?RnMyb0VkemFUQU1mYnRsV3NnM045VGl5RDlvQVFYM3NRUTNBZzFuT3RISG5h?=
 =?utf-8?B?blJQMkZLTW9LOC9DYVdTbkhRS1FaZjRuMXpSVXV5UHRuVU8vRElqWUFKY2xM?=
 =?utf-8?B?ZFRyUTZuTzJGeDR2OHpoRk1YWGttU3Uydk8rb3FRbEQ3VzlRdnRDREhES1g2?=
 =?utf-8?B?MTcrOHJUNk5Lc0xSMXFFNjhQVEt1S1JYbURZeG9BMG5jUEcrbFg3SGNjUys2?=
 =?utf-8?B?ZDF1em1SY2xTZE5JME5IZnVpbk1jK21PZmZPNEpjamsyZFpzZXkvTTArVkJO?=
 =?utf-8?B?bDJHdFFEdTJ6b0FZeDl5OW9UQUdTZ0VySWVRREN3a0Z3N2VDc2tZT29keEk2?=
 =?utf-8?B?dm4zdlp0K1AvT2I0YlRoYm5SNWhzMTZSN3hIcXk3c3pSUmNyN29aUEJIeTN3?=
 =?utf-8?B?WG9hMklNcVhLZHRIb1lDTW5aSHlQUjRjSVZBVG44ekhNUXZpVjRGNGlNK1VZ?=
 =?utf-8?B?bUxYS2w5M2ZaSk5taDFRWXJkcmR2NU9tUzhmSVNvbnVFK3o1VzBsZkpDZ2hv?=
 =?utf-8?B?Q0F1QTNBSjE2WlVjNTNvWTRSUnZGcm5ZcGRUOW9PS1k1aXlvbFdHbTgwTWkr?=
 =?utf-8?B?Q1RZcTBFYXlMMlRmbTlUOHlpZ3crMFYwMVRZMEhlN0FIMktISENQbnBQQnRl?=
 =?utf-8?B?STUrWW5zSU9xazNPV1hNejdaR2szNzdLY1N6L1l5Rlk3b3luY0hnU1E4TElv?=
 =?utf-8?B?bGRoblMwV1VQME5WSjgrZ0k4R0JHcmE3dE1WZXk3N3M5SWw4S1I2WU1wdGUz?=
 =?utf-8?B?SVFQVnlpMUFMUWlMUjJZaWhWcUt1d09wYXY3dWFLWlU2RU5HRTJnSVNxUEdJ?=
 =?utf-8?B?ak4reXJCZ3Rmd3N0WHg4WnhTbVpDN0tNTkNBS1g3VCtUZXkwU2l2Z1pxVTBI?=
 =?utf-8?B?OWQrVG1NdmRXcFMwK2FNUnZ6eERiNDJJRjh2WDJqSUkzOE03WE82a0VnZTZN?=
 =?utf-8?B?Mkl5WTRtOURYcU12R3V4ZjJHbEVUVzRRakVaZ1FMR3BNRFFralYzaUZjVEJv?=
 =?utf-8?B?Y3hYR2ZZVXFoeFpXTFdQOHlvdk5VQ2NvOFBFa2RrRHIxWGhUa0l0N0EyOGto?=
 =?utf-8?B?blBNaWVuNUdEb24yYkY2V3I1ZTBwRG1sYXgzRFpJY2NONFJHM1QyTUU3Zzc3?=
 =?utf-8?B?ZEZUUVFTcUNwQWJ3cXdTeEtUNUxHeTVkUEY3TVl6dlRrTy9XWlN6Z2pCK01a?=
 =?utf-8?B?TzR3bVIxOGZxdTZ3dVdXQlFYdDZubVh4SGFtbUZBb29INldsSW5ORjBnOTFF?=
 =?utf-8?B?R3JsUnh0bHcrVzZhdFgvb1Q1VkFjK3haaDFVejB1MUZWVkczSUpTdzVTbWhN?=
 =?utf-8?B?NE9TaTBoVUZBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(376014)(7416014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZklYdlFCR3Vhb0I2QVNXZzRKa2pISzNIZXlISGhzenpkaWlxMFJpQ0QrZlFy?=
 =?utf-8?B?eHNSenZ4WjJiMmNCOHlwZEdESXFUVHNuR2VaMk1uVmMwdkdibjdOWFZtMmVJ?=
 =?utf-8?B?cDZDSHJnMVVmTHpsY2JvS05LYnVaM0F4d29HaElmUTJFczdzOXBKQnB1Mm5E?=
 =?utf-8?B?cTBDclZhM24wUUlGL1hwMTMwakRwTml6eE96ZkhOK01uNzlaL2NJbVpnbkcz?=
 =?utf-8?B?SjQ3eWx0S0RHWjQ0UDdmSE80K0IwY3lURTJkZUoyU2FUNkZHbFVzOXcvSitk?=
 =?utf-8?B?Yys3c0szVlUxbWZWSVlsQjBCSVhrbHd0S0VQbDZBZjJMaUo0QXBWenZEVVg4?=
 =?utf-8?B?dHh1eHlYdUxzVnVJSkhUZXFhNXYyeWdjamFlUGdhSm51SGxuVnJNTm5xZWVC?=
 =?utf-8?B?bnQ5VW5PdHp2eVRCNVRtQVczWVd1RVpWM1NrM01uS2VBSU9lZWpxYkVQSGV0?=
 =?utf-8?B?Y1JsWDBRWE1FSWhlRWRGUTA4bUUySlFQUy9sTUpNSWxBWk15eEt4QVlMSFdN?=
 =?utf-8?B?R0dwUVlkakNPNjk1M0NJMHlVRjNmWWhDT2pqbVVnbUphYWttN1g5b0RuSlhZ?=
 =?utf-8?B?YkprS0RYcnl0RTluNS84T2dyTERvdDVuMUhGTnBlbW51SFNHS1BwUjNwYStD?=
 =?utf-8?B?TTVMb0tiYUZQN0dLRGJmbkszVnlVV1dtTXFNczVQK1ZzSjVqNHlrN3M5VHY4?=
 =?utf-8?B?NTB5bHovcS9FQ1dSY3lFdDd1Q3lRNzRWQWlUTjFEckl5bTNRdVhRODRtZnpv?=
 =?utf-8?B?OHJPSlNTK2dOalJrL1MrUmhtbVN1Qy9RSnVKKy9ETDJyaitPb0p3K1JZQW5l?=
 =?utf-8?B?Vk1SdlFpdlNOVjZHT2hidCt5Q0JnVmhjYktiQlhDd0Y0TzlTNithNkNEZjNs?=
 =?utf-8?B?aTgrenN5Yy9wRk5MUDlGd2psNzVVTHFkOFdQNGVjQSttTXVzSzcwOEZ5M3Bo?=
 =?utf-8?B?VCtDblBFRVNPSkEvU2xtSkEzSXlneHplUXlad0lKaHNIVUE1V3A4YVJ0NHda?=
 =?utf-8?B?MlAxTlhFSzhCWS9wbUE1UlVVYy94bWRjSTdiMGVNK0JLbDllZHZOd0VEbTlT?=
 =?utf-8?B?eWZXT0VnMEo4aFNnSFYzaFJ3SXlXTEtubTV3dTRrSmxwTnNnbWR4cmJreFNP?=
 =?utf-8?B?V2MxUlJCaUNyR2pxTDhVQmFwS2JBZGdBZHZRZlkvUit5cWhRNWl6REkxRjBJ?=
 =?utf-8?B?a1YwVUczTzhKeURYWlBJK3d1WkJnaHZPbURHZnc0RHh1dXVFeGJ3OHBtYVhz?=
 =?utf-8?B?enRlRDEvNU1IbkRLL2R1QmplTUpiN0x5dFJ4alZDVk1lUjhOUktUMVBiRTVN?=
 =?utf-8?B?ZzJOY2VjV2RWVkN0TjNmV1NjdVo1MmFLRVJWZGFZZUdjMGlXQ1Bka3REamoz?=
 =?utf-8?B?SFgrODFLMS90dFdqRUEvUWNReVdWaVpzcW1INzZsN0UybGh0RTA2QWRidyto?=
 =?utf-8?B?R3VLR3hrbDRXbkZJdktzM0RKd1NMTFN6cnVZTzluQ2xGMlFJNmRqS000ZG93?=
 =?utf-8?B?TVZtWTZTZTBsSXkrSDY0VmpncVVCZ2JvMkw2SGtTMHZoWjZkYkRoaUZJUXdq?=
 =?utf-8?B?aEZQaHRhRXpiaTdyT3E4d2RkM0k1VmFQQXFRRW51RVpWVkxYQTBCdG0yYjcv?=
 =?utf-8?B?cEx0VGpnM2Zid0t2dVFWS1d5K2ZuelRKdGJrSkNOWTRBZ1pZaDZOUEtWbVZi?=
 =?utf-8?B?TjMzWFY5QlpUUFZsb1BQYUlhWTdqWUc5NGUxMkhUKy93aTZQalJXMFBMTlpO?=
 =?utf-8?B?cWRhb1R1U0NIOHBxMjdVNDBuV28vMHVXNDl4U0I3WlBTTDVaOWc4N0VDeklO?=
 =?utf-8?B?dWhmYWxxbWg4K05rM3M4ek0wbWI5dW5xT2xobENoM05JNndvWmNIQnQvTG5k?=
 =?utf-8?B?Rlhqa05ZY2ZmdHVvRXU2NlNTUmdBbDA4bm9kbVJIcUJYRUtwbmt1T01CS0lV?=
 =?utf-8?B?Q0ZjMHdGd2VGZmJtaWFwWVJxWE9XRHoyeUJpMmNNSXRackdCUkhCSFlZOGpo?=
 =?utf-8?B?YTRJUG5LZlBySXVEUkl3a0V4T21SYnM5YldDeFdWSGhrSWJkR1pielFSVWg5?=
 =?utf-8?B?eWtsMDFOei9VVFU1UU5Mcys2NFpBVm9CN29XYXhUSFhMZXBkank3Q25BU3ky?=
 =?utf-8?B?bUZnRjFIRFVxVW1DSEtFYkpaSUQzTGhxbldXQXBEZGhRa1A1N09Bbk9ZK1N2?=
 =?utf-8?Q?adaR3N9ux2KCbWV18+qzQsuBaq2NRwRPNiY/ONaOucvp?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f23137b-a3a5-4f2a-2380-08dd8d6e765f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 13:52:52.9673 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JE+7zWVSj5mFCMXYLGZ/NhZfuytiWAy0Ld0pIY2QMqJc+ooeg7WmFUMzSV9wfqwKvr9+jXk2EXcmO26StQkiEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6761
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

linux-firmware contains a directory for GA100, and it is a defined
chipset in Nouveau.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 4de67a2dc16302c00530026156d7264cbc7e5b32..9fe6aedaa9563799c2624d461d4e37ee9b094909 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -54,6 +54,7 @@ fn try_from(value: u32) -> Result<Self, Self::Error> {
     TU117 = 0x167,
     TU116 = 0x168,
     // Ampere
+    GA100 = 0x170,
     GA102 = 0x172,
     GA103 = 0x173,
     GA104 = 0x174,
@@ -73,7 +74,7 @@ pub(crate) fn arch(&self) -> Architecture {
             Self::TU102 | Self::TU104 | Self::TU106 | Self::TU117 | Self::TU116 => {
                 Architecture::Turing
             }
-            Self::GA102 | Self::GA103 | Self::GA104 | Self::GA106 | Self::GA107 => {
+            Self::GA100 | Self::GA102 | Self::GA103 | Self::GA104 | Self::GA106 | Self::GA107 => {
                 Architecture::Ampere
             }
             Self::AD102 | Self::AD103 | Self::AD104 | Self::AD106 | Self::AD107 => {

-- 
2.49.0

