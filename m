Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 287F3AD8287
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 07:31:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC2010E42E;
	Fri, 13 Jun 2025 05:31:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Fy213PbZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2086.outbound.protection.outlook.com [40.107.94.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5815110E1CC;
 Fri, 13 Jun 2025 05:31:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cjod+CPTx9KNl7QRywLZUNDdki9c6bfc/735kXL666Hl6w+7I/aivmO9v5gZyrOFvSx0fnnnWvT/Ngt77DgUTE8xfzWKf20IkPF6tEpEmJpk4dtX8d7qFOccr1kfOILFihDvhbU1o5x5M9U0HPbXbRsmcTug6aQD8SZB6RVRoWzUvTgC30YV1923tNQiAXa6cyxcdmhhA6GN/eD8gPZL3ZuKVe6nsjO+qSmCu7hfiww9lTT7JKF2AluU+a8ydAei/lCnA8IVorAcSEiuZYbwyFdOal7BdYVOq8j6Nf/tUvYiBc9X0q1/5yP3WzAG/sqNEH5Kk+xJWV47AbHH3x+8pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AO7YvfEH9cBylA6U42q5U1nx2XDEBRBmbJnQOr2Uvcg=;
 b=FTVUccrY5gXxSiHR5SUjFVwLCqUotsWs19oZ6ONpIbSbZyissOFDEGcCe5NMebeRPtuBe06xNfGh0/DnHfVyBmJRSCPGli+oV9vDWdwx7oEzNqgDH96AK71MYm0G4TK8BJ68JE9DVXIpIg7rsjmIsMtxtvfFwtJHgvhr7Et4uyh3PFHZBeb/Is3VcKZotqv6mRChSN5Spsa76W5g46OXBGM6lDriytouX95+KOQkTYQOGFyYoerZG1vX0NCdBVgRuzLoXulVp2Z3Oe7WjBukDFvxFqPm8T1QQB4vDr81sN5/W/qjA1PhIXFwGpvLQSkFTkjAlT59ZwAa/PI+7F9qjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AO7YvfEH9cBylA6U42q5U1nx2XDEBRBmbJnQOr2Uvcg=;
 b=Fy213PbZVFawyah6XQUfaPOGiNm4xlnfKxzSajvGyXkNtYSDOlahqwwW4m9MzAXF5FseDRmBYI1g7mpmIFdU3w7e9lbp7VVWMw3fs3XBhXJJs2EZWDo6RQgmcQLzhtBW67oz47HRg5RQEaV6wrjSLOYEW3iAYz6LLinU+8Z19wSThPoW6nozFKhUu0L1N5O99pag6iVnQP6KXVOk0qSrCUXTkXS/jJzls+uxv8lqnI89PeSD4X4i/ilv3F8QSjXU82xtOCStzk032v5g5JF++F2BWtEniZJE9K7z8FgFz6fySKxjYOuTIHmzc5hniE7g0XFG6WvtHdVcnYQ5s6zwEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH0PR12MB8551.namprd12.prod.outlook.com (2603:10b6:610:186::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Fri, 13 Jun
 2025 05:31:06 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 05:31:06 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Jun 2025 14:31:02 +0900
Message-Id: <DAL5QC6RHXQB.GDEGYBUJJAJO@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Ben Skeggs" <bskeggs@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 04/20] rust: add new `num` module with useful integer
 operations
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Benno Lossin" <lossin@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-4-05dfd4f39479@nvidia.com>
 <DA82KFLNAOG7.R7YT4BHCLNZQ@kernel.org>
 <DA88YHU4AZT7.B8JGZHW9P9L9@nvidia.com>
 <DA8GTD7LT7KO.1A3LBQGEQTCEW@kernel.org>
 <DAC2L6ZKR6U2.WOMERUJIOENK@nvidia.com>
 <DAD9TNUBUGPN.1ED519FYR29U4@kernel.org>
 <DADB6892Z31G.12LB1BVSGTEAQ@nvidia.com>
 <DADKDQ1KGJJP.3T20P9V1D2PO1@kernel.org>
 <DAKL0KOWUB1G.1DSJPRWFYC43O@nvidia.com>
 <DAKL8NQBUGH5.Y8YJIAYDWL3F@nvidia.com>
 <DAKMZL839IBG.1D43UR9NNWZSM@kernel.org>
In-Reply-To: <DAKMZL839IBG.1D43UR9NNWZSM@kernel.org>
X-ClientProxiedBy: TYCP286CA0089.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH0PR12MB8551:EE_
X-MS-Office365-Filtering-Correlation-Id: 65298d28-5037-4b4b-29f2-08ddaa3b7e67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bVZiRXRmd3RZellPb0VaRHA2ZzQydmxIcVRJNzU1YXR1a0NPeVEvYWxkRnl2?=
 =?utf-8?B?K044TFk3bUMwTU9GU0lwRUhyRkplRjNPWEJDQnVScDFkV21iK3ZiOWVreHdR?=
 =?utf-8?B?enJiVi8wNnRJVGljUldMMzVCVWhBQWRZc2htQXViTnFWNUdTbnB0SjdQQjVK?=
 =?utf-8?B?emp0TzdzV2phS0IvUWlyWXgwbnZSSkkzQ2ZGRU84QUI5cUw2QVJHKzhRdmVs?=
 =?utf-8?B?NFN5ZE9NM25uSnV0a3VsSXAyKzNMeEg0alN5VU82SUxvZ1RXY1NnT3Q5MHVk?=
 =?utf-8?B?b2kwcERRQko2aXNMS3ZPa3hxU0xRaHJkNUVaSW5pSWwvMkhmcDcyZi9FZ25m?=
 =?utf-8?B?RUJoeC9rVmc0RWJNVFd0Q21va2wrK0JjZlc4T2lud2kydVF0a285UWxINmU2?=
 =?utf-8?B?NXdvZkNpaHpUeU10Y2xVMGt3Uk9LUFhUSzZFSHN0RWl4dEo0MFgzY2d3TSt0?=
 =?utf-8?B?dG9BbWtDZ3ZCTjdyVVFML2ZqMTQ1M3RoR3NVVFVSdGRNT2srZmtNT3pMMzBT?=
 =?utf-8?B?ZmtvdVZ0RjRKdlpGMFkxRlF1K3luUGVXd3ZuNUtZdkRUd0Z1TGovM001K1RY?=
 =?utf-8?B?VkhjWk5kb3gvb09idHNjbmpDMGtKY0loNHk3OEtaZm12WnY2WWxnM0lIMXQ2?=
 =?utf-8?B?MmltMlNMTjl5SkZrOVF6VkpBdmxlVkJsTTZCc0dFTkIrUXcybXR4ZGp5Q2Fz?=
 =?utf-8?B?cUJpR2I0K0JSUmdyc1prUHZEeEhHTDVwZXJUaDFnTXhFLzV2ZzBzYmFiMjZB?=
 =?utf-8?B?TmJ4amxzTGxBVlZHZGttN25TWlF1MEhQS2FyNkdkTkxJalBqQWdZY1JRalJu?=
 =?utf-8?B?WUFVQjd5dm5JakpsZmFVeHU2cWdtY3QwZmsrVlZyZlpjUS9aWGVyOUlwa3ZV?=
 =?utf-8?B?TjQ0MjgrYmhFRTlVZE9NMTQ0OERiRlAvTmlCTjZZcXBQbFVGQ2NBc0QrK0VN?=
 =?utf-8?B?TEYvRDN0QzlzaUoyOFNyR2hqanVJSU1UNjNkcXBTVUU2bVZRV3h6WjVsNDBu?=
 =?utf-8?B?Z3F4TTZpaVdoMWxIcWpqbldQSE5kczQxMTRtVXQzclBJZGh0bkNEaCtmaHRU?=
 =?utf-8?B?RU00UkloMk5iMUJ5bjJtc3h1R094dksvb1BWQUdRWS9HNThXa0x1aStobTB3?=
 =?utf-8?B?azlrRWJPM0UwVVVrSGE5SytiZEdpVHArYjhhMm5BeVE5TXFRL25ublA4aCt1?=
 =?utf-8?B?Y2NWeEw1NERNMlZFemFuejhyVnV2TitxbTVBMjRFNXZHbUZQa0U4UUNXL3Vj?=
 =?utf-8?B?UHA0VkNkL1JUemFLSHdwZklxRUVQYW9kbUU0Rm5zb3hJaDdLcDdtejRPMTNE?=
 =?utf-8?B?MlpUQ25RUFdQRkVKVHBMa3VFUkx1V01qWHhGSGZmakZXOWFMd3NacEpYRU43?=
 =?utf-8?B?MVVwbFFJNzRWZ0FmZnhKRmRCbmNWNGVMNGJkbmM5WU1IUTg4OEthdUhveHVT?=
 =?utf-8?B?RnBEK0d1TGpGcWFsSGVwbmVoOFRRRzBla1JTdXA0N1UzVElVOXdLdjlUZ2d4?=
 =?utf-8?B?M3ZPWkR4WmRKZVlJM3FEeUZVRGdsaWFQeUxETFdKVXlkOHVkWGc1ZjlVR0Ra?=
 =?utf-8?B?RHlsUmthMzdaODRESldadE1SNWJlNmdidnFuTElGWTNMSEhJTUhPdmxzby95?=
 =?utf-8?B?eFU1UW5jMmo5YVE1NjdTYzdQSzNXa2s4QmtqZ2RtenNjZFJpb0UrdlFwMEx2?=
 =?utf-8?B?T1ludW03MytMNStabmtRUDFCOWNTbjVacmlmdkpjbGNhMlpKVUg3NW1qUzhS?=
 =?utf-8?B?V2FVc1FSUEFYRDA4eTFZVTlKNzdNcGZxbGpaelhlSEErRS9UWjNXQjVKOW1o?=
 =?utf-8?B?cy8zUTdWdURkam1mSXRqZ2g0dnZRaUJiYkRJM3htcXp6OWllM2Z2WmZMckJv?=
 =?utf-8?B?b3NmMGpWTExKK2FhMzZWUFZOdThuL1Nub3RZZS9WcE5VQVRCV0d5QWM3cy9H?=
 =?utf-8?B?Q2FqTm53dzZYT2xtSytqS1c3ZUY1dmR2NytXT0k2aFQ2UVRRbmR2clNxU1FY?=
 =?utf-8?B?eTdxSGVKd0V3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEdwWVNGZTR1cXFQZUxyWXVhME5CYWxaUHpHR3hoRUFJRjREK3BTRXFydStr?=
 =?utf-8?B?MzJ6dGF1WXpUK1hlc3JBM0thVlRYcG41enAvVmVmanEwQVRqSjFhSFFsYmVz?=
 =?utf-8?B?RyszaTFsbis2TjF0aTh6ME1mMkpKSDBRRHc1ZXVMVmNZUTJmYVpBMGxKN2dL?=
 =?utf-8?B?TGM1Q1B3d1ZSeGVwK2tTSWx4cldwd3JLcm9IOFlkeXQyVWdxSk1kOTBub2Rq?=
 =?utf-8?B?bXVuRnJrNEczSGRpTVdycndxWWdSVWlWQ25JV3lVYVE5aWY2K1lHOC8xQm5H?=
 =?utf-8?B?VmdMOGl1dzVVWU9zSm1Vb29nWitmSzMyZDdsOUN1a1lkMjNyc0ZnLzJkbC9n?=
 =?utf-8?B?RkpZYVphT3JhTURoRGpBT0F0MlFWcDJDTUE3L24xakRWTm5EQzFTQ0crVE15?=
 =?utf-8?B?TkpZckladVdsREdpYXhlVEhVdmlFL0l0cVZYcEVwYXJCVnRVMlp3NWtubHVx?=
 =?utf-8?B?VjNza0ZoaEwrSzRNaDBwQ0lZaXdKc3JVQXJKenRRMzZzN3dQL09kWGpTNFNa?=
 =?utf-8?B?bC9QVnJkWnNpZDlxL0tnRm55UFdQNUoxaDE0RFNGNU1TeEg2MTdwSTRlbDEx?=
 =?utf-8?B?VlphV0Q4bmViQ3NRb2JTS2RtYjRzSGQ4TGVweE9Kd2E5aUd4a1U5bmd5b1NU?=
 =?utf-8?B?Z21mTGFIUlVLaVA1L0tVVWwxazFyenpsQVdvUnFEWmdMbXBveVZJcEJsUXdu?=
 =?utf-8?B?SFZrSW1Qb2pOZm1xb3JZWUNTWlF5N0NUL08vemxqZFl6Yis0WjF2ZHhhMWND?=
 =?utf-8?B?ajVIY21LZFpEdkZhMXNIUjhGVnhTMUFYUmhkUGw4Sm5sZHI5OXllaFgzZldP?=
 =?utf-8?B?Qmk1R1dKMHZNbkt5UVhBN3FmS1RRdkZJaEprb215eUhjaUtrNUxEWm92Qmp6?=
 =?utf-8?B?a2tVZE9TdkZTQVpha3lOWVdDeVgyeEJDVUtOd1VhbUxKdFZxQTVjWGFEM0VX?=
 =?utf-8?B?a1h5UEViOTI5OEtVRjJVYWJESmc0NXhiTHN5UGw4RlJIb3VGeTh0cmZ4UU4y?=
 =?utf-8?B?RmE2RzNHRjczQ0Nqdm5IM0JVKzF3ejdCYTgrS3hpekM4MDcwUGtEQ3FDSWF1?=
 =?utf-8?B?OGthSkd6TU9PKzlhclVsZktoVVBLbkdTM085c1I1SzFhQnJwdlJHUUtXVFZm?=
 =?utf-8?B?MnpXVEg1WXJ1SmM1OFFVcTZ2emIrcmlOeElWUkEwRzVCVWFyK0ZDYU4zTnQ4?=
 =?utf-8?B?bWxpWGJ0QUxhdVBKQjFkNVVST1dtRFBybUE3aDRaY2xzZXpJeng4SEwwK0di?=
 =?utf-8?B?dEdFRVBqSkJvNG03VlpSMHNCd3RxUVRGUk1kejlaa01WSTBzT1RlUlVhWlhW?=
 =?utf-8?B?OVpEMlpxR0V6WGhZaEFDYTIraERwb20yRk56NUIrektxSU5TZEVkSlljN3NX?=
 =?utf-8?B?MmNPY1hrQnBWc0c3K2F4R0FuZ0ZyR1ZTQ2F4MEo0SzNCaCt2NUI5U1M4aHpT?=
 =?utf-8?B?V1hMOXpqdmNnTy9qSUNuZklnLzcyZS9xOXJxUmVST0pZK0VseWc4LzlEaTd6?=
 =?utf-8?B?cHBaYlBhZ3BDRUNLWktBenY5QXVVbHJ5SUZtRmdPd0hSZ1pTMHY1RHNLZTk0?=
 =?utf-8?B?Q0cxZ29nL3IzSEI2bGxiclU4azNvY1h0SEFWVE9rTm1jbDgxc1g3VHAvVnlq?=
 =?utf-8?B?NHJLWEhvRFVsWXNEc1B5eDRQUEpkdWdBbjNFWktQNE85OU9DRGJlSVVMU0tJ?=
 =?utf-8?B?V3NpbmQrQlhvWUtYRGJOeDJvN0lBVUE5ck8vQW9MVm5CcTBLSmVKRUFEQXFh?=
 =?utf-8?B?eUQrQXhFR2lhN2RvTGVRT1dXaUdDZWNBUFJHRllwOElENko3d0plaENvSWhI?=
 =?utf-8?B?UlRvTFFPZmQrblNiN0pzU0N1bHhMS3pPQnVSYlJaT3hML1BPeDY2OVZDMDVO?=
 =?utf-8?B?Mk5oRHo2elY4Zk5mTTk0WHl3YlpGQ1N4dGFON1FMUmIvei9iUCtrRlB4eWRo?=
 =?utf-8?B?QUkzQjI3alE3WUlqejFoSjZvRkZEMHNseUZMZ0F1YlRCR3grNC92dEZFejZ4?=
 =?utf-8?B?eWZMVXp6QlpMemNCS3RaOFdLc3QvcnRta3VOTHhKcmlUZmJlb0NQVWlCVEtB?=
 =?utf-8?B?WFp1SllHZDFxVnpqL01UWEpGcU5BYjN6S3p2REc0WDVRUzFITndESkhPdmFn?=
 =?utf-8?B?NDRWRFFYeCtDUHBzUWZKc0pQZzN3SXVNYTFzV0ZDRWl0MllLdmd4SThvQm8w?=
 =?utf-8?Q?PRCbM94GORd0DwXmCwwWPTWw8jnNAzyM1Ym39TUv1FoP?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65298d28-5037-4b4b-29f2-08ddaa3b7e67
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 05:31:05.9097 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yLy1LrqcGEv3pH99jngNSGqEN4F1m93TTYO9cQczvBgfO1PED4bxKBnsOLzY/sLG94dgc1SofmoeOtPLDMktZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8551
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

On Thu Jun 12, 2025 at 11:49 PM JST, Benno Lossin wrote:
> On Thu Jun 12, 2025 at 3:27 PM CEST, Alexandre Courbot wrote:
>> On Thu Jun 12, 2025 at 10:17 PM JST, Alexandre Courbot wrote:
>>> On Wed Jun 4, 2025 at 4:18 PM JST, Benno Lossin wrote:
>>>> On Wed Jun 4, 2025 at 2:05 AM CEST, Alexandre Courbot wrote:
>>>>> On Wed Jun 4, 2025 at 8:02 AM JST, Benno Lossin wrote:
>>>>>> On Mon Jun 2, 2025 at 3:09 PM CEST, Alexandre Courbot wrote:
>>>>>>> On Thu May 29, 2025 at 4:27 PM JST, Benno Lossin wrote:
>>>>>>>> On Thu May 29, 2025 at 3:18 AM CEST, Alexandre Courbot wrote:
>>>>>>>>> On Thu May 29, 2025 at 5:17 AM JST, Benno Lossin wrote:
>>>>>>>>>> On Wed May 21, 2025 at 8:44 AM CEST, Alexandre Courbot wrote:
>>>>>>>>>>> +    /// Align `self` up to `alignment`.
>>>>>>>>>>> +    ///
>>>>>>>>>>> +    /// `alignment` must be a power of 2 for accurate results.
>>>>>>>>>>> +    ///
>>>>>>>>>>> +    /// Wraps around to `0` if the requested alignment pushes =
the result above the type's limits.
>>>>>>>>>>> +    ///
>>>>>>>>>>> +    /// # Examples
>>>>>>>>>>> +    ///
>>>>>>>>>>> +    /// ```
>>>>>>>>>>> +    /// use kernel::num::NumExt;
>>>>>>>>>>> +    ///
>>>>>>>>>>> +    /// assert_eq!(0x4fffu32.align_up(0x1000), 0x5000);
>>>>>>>>>>> +    /// assert_eq!(0x4000u32.align_up(0x1000), 0x4000);
>>>>>>>>>>> +    /// assert_eq!(0x0u32.align_up(0x1000), 0x0);
>>>>>>>>>>> +    /// assert_eq!(0xffffu16.align_up(0x100), 0x0);
>>>>>>>>>>> +    /// assert_eq!(0x4fffu32.align_up(0x0), 0x0);
>>>>>>>>>>> +    /// ```
>>>>>>>>>>> +    fn align_up(self, alignment: Self) -> Self;
>>>>>>>>>>
>>>>>>>>>> Isn't this `next_multiple_of` [1] (it also allows non power of 2
>>>>>>>>>> inputs).
>>>>>>>>>>
>>>>>>>>>> [1]: https://doc.rust-lang.org/std/primitive.u32.html#method.nex=
t_multiple_of
>>>>>>>>>
>>>>>>>>> It is, however the fact that `next_multiple_of` works with non po=
wers of
>>>>>>>>> two also means it needs to perform a modulo operation. That opera=
tion
>>>>>>>>> might well be optimized away by the compiler, but ACAICT we have =
no way
>>>>>>>>> of proving it will always be the case, hence the always-optimal
>>>>>>>>> implementation here.
>>>>>>>>
>>>>>>>> When you use a power of 2 constant, then I'm very sure that it wil=
l get
>>>>>>>> optimized [1]. Even with non-powers of 2, you don't get a division=
 [2].
>>>>>>>> If you find some code that is not optimized, then sure add a custo=
m
>>>>>>>> function.
>>>>>>>>
>>>>>>>> [1]: https://godbolt.org/z/57M9e36T3
>>>>>>>> [2]: https://godbolt.org/z/9P4P8zExh
>>>>>>>
>>>>>>> That's impressive and would definitely work well with a constant. B=
ut
>>>>>>> when the value is not known at compile-time, the division does occu=
r
>>>>>>> unfortunately: https://godbolt.org/z/WK1bPMeEx
>>>>>>>
>>>>>>> So I think we will still need a kernel-optimized version of these
>>>>>>> alignment functions.
>>>>>>
>>>>>> Hmm what exactly is the use-case for a variable align amount? Could =
you
>>>>>> store it in const generics?
>>>>>
>>>>> Say you have an IOMMU with support for different pages sizes, the siz=
e
>>>>> of a particular page can be decided at runtime.
>>>>>
>>>>>>
>>>>>> If not, there are also these two variants that are more efficient:
>>>>>>
>>>>>> * option: https://godbolt.org/z/ecnb19zaM
>>>>>> * unsafe: https://godbolt.org/z/EqTaGov71
>>>>>>
>>>>>> So if the compiler can infer it from context it still optimizes it :=
)
>>>>>
>>>>> I think the `Option` (and subsequent `unwrap`) is something we want t=
o
>>>>> avoid on such a common operation.
>>>>
>>>> Makes sense.
>>>>
>>>>>> But yeah to be extra sure, you need your version. By the way, what
>>>>>> happens if `align` is not a power of 2 in your version?
>>>>>
>>>>> It will just return `(self + (self - 1)) & (alignment - 1)`, which wi=
ll
>>>>> likely be a value you don't want.
>>>>
>>>> So wouldn't it be better to make users validate that they gave a
>>>> power-of-2 alignment?
>>>>
>>>>> So yes, for this particular operation we would prefer to only use pow=
ers
>>>>> of 2 as inputs - if we can ensure that then it solves most of our
>>>>> problems (can use `next_multiple_of`, no `Option`, etc).
>>>>>
>>>>> Maybe we can introduce a new integer type that, similarly to `NonZero=
`,
>>>>> guarantees that the value it stores is a power of 2? Users with const
>>>>> values (90+% of uses) won't see any difference, and if working with a
>>>>> runtime-generated value we will want to validate it anyway...
>>>>
>>>> I like this idea. But it will mean that we have to have a custom
>>>> function that is either standalone and const or in an extension trait =
:(
>>>> But for this one we can use the name `align_up` :)
>>>>
>>>> Here is a cool idea for the implementation: https://godbolt.org/z/x6na=
vM5WK
>>>
>>> Yeah that's close to what I had in mind. Actually, we can also define
>>> `align_up` and `align_down` within this new type, and these methods can
>>> now be const since they are not implemented via a trait!
>
> That sounds like a good idea.
>
>> ... with one difference though: I would like to avoid the use of
>> `unsafe` for something so basic, so the implementation is close to the C
>> one (using masks and logical operations). I think it's a great
>> demonstration of the compiler's abilities that we can generate an
>> always-optimized version of `next_multiple_of`, but for our use-case it
>> feels like jumping through hoops just to show that we can jump through
>> these hoops. I'll reconsider if there is pushback on v5 though. :)
>
> It's always a balance when to use `unsafe` vs when not to. For me using
> `hint::unreachable` & `next_multiple_of` is much easier to read than=20
>
>     self.wrapping_add(alignment.wrapping_sub(1)).align_down(alignment)
>
> given that `align_down` is
>
>     self & !alignment.wrapping_sub(1)
>
> But that is totally due to my lack of experience with raw bit
> operations. I also looked at the resulting assembly again and it seems
> like (not an assembly expert at all :) your safe version produces better
> code: https://godbolt.org/z/qhMbG7Mqd

Thanks for checking it! My x86 assembly literacy dates from a time when
32-bit registers were considered fancy, but it indeed seems to be
slightly more compact and faster. I guess alongside the lack of unsafe
block this makes me favor this version for now.
