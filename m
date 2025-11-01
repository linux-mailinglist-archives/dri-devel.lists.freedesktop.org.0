Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EE2C27CF5
	for <lists+dri-devel@lfdr.de>; Sat, 01 Nov 2025 12:47:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7775910E0C8;
	Sat,  1 Nov 2025 11:47:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="KQC4pgSi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012057.outbound.protection.outlook.com [52.101.48.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EADB010E048;
 Sat,  1 Nov 2025 11:47:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c4UOWqs1fX1rPCTn0nPM7uJwLd/n+IcT3sW+MhIiKf4D0z6zL9szpAJfL6jN6g/ENlZSB2EO/Bc4FyWxwlOndEWBdJf6uFJ+Xh0fzdcnuAldtOk25uvaeS4Yxsum+l5iFbTSMQK5vMzkgC4ZnjdlaliaDa4aFcpwdPqZ90p0fnEATS6hTDZ7jBt7Ol7/5RHmGPkDyYHX2AyX4tQ8emt7/RF0sLMBj0UCXC7V+GNkC+LMGxCRJzqgNgKegaadtpRSpWlpmgeQBsktpFf+rFvxNSo932PUM35fH/xHqtnV5SmmBb4tFwLeE42Bsl5f7EnZvWLjhlGwD09u4o5VcaOvwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Sxkj9tw0++IuILYBB83kJ2RSt1T2ExPffmx8FCaqG4=;
 b=s0WE6bc6grAvUufZLEbZ1VVE+gr8ayuf1NxQrI2sTJ6rHFFuQW7K/b+W3De0nSuffA2VPuavjnL0EkP5XBeiL0Aa/zHOgXHaHOKGFJihOS1qjmDDmsxuzEb85WIz6chQKu4mTeO3WhNnUS0qXk9RmsNAZC/0sjxUiW4bDwv24Kygkg7qvHL3La5bnrRdmZ1Yogc5PBw0svL9tFfhUzUxz0PYRraq/zbn49zB3MXlx9iLQSY76S1U37zq5nwfd4xiQXld4Ss0YuxmkHo57U/kHD42c5t1+qtpRUPIu635wbOkPzDoMOjmzxC5MiYoRrYVjfnebjvlmgPLYRe9T+2ZFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Sxkj9tw0++IuILYBB83kJ2RSt1T2ExPffmx8FCaqG4=;
 b=KQC4pgSie2rP5KE5oS25caJdFmfsy4uDEsAvvfgnsUIcZ7jKPwmccdzRm3pQ/8Owj0J6vhBB2VjrmRHWdlMamYv/oXkS8Ep0bRssC6LugiBTiqggGgaUkz0iynMMSIVgc6fy3xNIt3DIsG3waYQe5mzIsWbR42UWt+nqBnW5GzXllfXCS5F4J1Y6DvsmzLH49B8jy2mlnlvg8ZcexBQH1Ub3M9OGPPGkZgzoeF4noOcVccxLmpHDS5+IBoe28epqUJ0jwFfnP1X5/yhZIEXPv43cpbmSx15oqD21Zy/c24AqgPj7cDlJtlYemf+vePJLHQu1kkiULgAuHjTX23jVHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM3PR12MB9287.namprd12.prod.outlook.com (2603:10b6:8:1ac::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Sat, 1 Nov
 2025 11:47:00 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9275.013; Sat, 1 Nov 2025
 11:46:59 +0000
Content-Type: text/plain; charset=UTF-8
Date: Sat, 01 Nov 2025 20:46:56 +0900
Message-Id: <DDXC0YKKJJT4.18JQ1MJQ7I31Y@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Daniel del Castillo" <delcastillodelarosadaniel@gmail.com>, "Danilo
 Krummrich" <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>
Cc: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/3] nova-core: Simplify `DmaObject::from_data` in
 nova-core/dma.rs
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251023205146.196042-1-delcastillodelarosadaniel@gmail.com>
 <20251023205146.196042-2-delcastillodelarosadaniel@gmail.com>
In-Reply-To: <20251023205146.196042-2-delcastillodelarosadaniel@gmail.com>
X-ClientProxiedBy: TY4P301CA0016.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM3PR12MB9287:EE_
X-MS-Office365-Filtering-Correlation-Id: 83486172-fac8-4e2f-59f0-08de193c5dcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|7416014|376014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QUU1b3RhL0ZFekZsbkRsb1FrSjVqNEtFRjZsazBZaTFvSlJHQndCbndKbFI5?=
 =?utf-8?B?MGoydk9GWmU4dk14UUJlRWwxSTZxSnFBQkZ3NGhnTGdmV3FwUnoxNGUraC9q?=
 =?utf-8?B?TXBOL1FFR1ZBOWZUaFlONFJoV1hhcFdnSFh1eEg4b3JxTWR1R2w0TUIvY2Qy?=
 =?utf-8?B?YmpWd0tVRS9mUm1VZDlHMkpYWlNJMUZMcEZqN3pRS2NFUkU1emRWSmFRUWlF?=
 =?utf-8?B?VVFRU2VjSE0wTTZFMmJSUlg2c05VWmFXOGtZVEZtYUgwWElPQW9LU29COGtW?=
 =?utf-8?B?UkRBb2dHeU1FK0R6Zjh6WUt3V2NZR21TOWtKUVVkQjFaR2tCenNxWVQxbmN2?=
 =?utf-8?B?WVV5K25Pcmo1YkRyRmRwOXREYlNCdXBvUzVCNi9QM1lZR2FpTkhGV1RXVXd3?=
 =?utf-8?B?WlRtcVNGSTJlZGt2aTllbzBJZnM0ZG1wTXNRRDZJeXN4aVZmdXFFdWthVDlW?=
 =?utf-8?B?bURRK3VuZFk1VEN6cEZYMmpNVmJMa1doUHN5K3BURHZYVnM4cnJtMjRNazho?=
 =?utf-8?B?NHovY0g3bG5XY21SZFU5aWk1cm9jWTFnVTJkeHdLSllWWGd3MTJCNnR3QTUv?=
 =?utf-8?B?NnhSaldvYk5KbDVPM2JLS1VTUzFPOUlDR0QwRElJYjRVV1YyTVhibm5lTm5K?=
 =?utf-8?B?a3pDcmorb0krRlBtT3NwZUwxczBjcjIyYzhKYjlsK2dDVGNKemZSWDRlTjJn?=
 =?utf-8?B?LzFtb1JxUERnZk1qZXBYcXVyWHAyVmowQ0YzM05yZ0JaSm9QY0hGeEJkVkl2?=
 =?utf-8?B?SmE3SVNWVXROQVVyZjBvVnRZZEFES0tSMDVZWHliOXdldVFFTXRjKy9GT3Ir?=
 =?utf-8?B?UXVyYjljSHBmUnFINHFXZ3o2UC9PQjRQakY1dGpRQUNEVXVyM3lpUWRDbDJF?=
 =?utf-8?B?MWVBa01WcWw2bC9LQ2NWTENtR0xmcVFQTmN3VlVDaXB4dnVPZEthV3lTS01o?=
 =?utf-8?B?NUtUbnBjNEpyUFoydkNLaXNYYVVibFpqK3pId3FkQ3IrcTU1Y3BYNlphbENl?=
 =?utf-8?B?WkNYU2xsU0FHYkJ1WFNvOHJ5Z0NZajMxL05rV2d6aCthL1NxeTY4cGQ2Q05F?=
 =?utf-8?B?eTJsMXljN3dadlFrVjBwVDNwdjFrRXYvZHg4NDBGVVdqYitXUlZMRUZGRjls?=
 =?utf-8?B?VU9ZeG44Q1Z6a1dUYU0yUCtRUE5TYS9nNmY2cWV6TE9xd29FbFlYSzNBOWYr?=
 =?utf-8?B?ZkZ2YXlhdGxOb0JxUm11VkJ0cE84ZjlBcUQ0eGt3TTg3OG12UHdZSnA2Ym95?=
 =?utf-8?B?L3dnL0J2TkNCbkJ3YkNoUFQzUk16a24yN2RMWk5ITENnMVhkdnk5ZGgxTzZq?=
 =?utf-8?B?OWRYY2pUWHB1TmlxMXk3bnFucjg3Q1dKbDBJWi9sZVRCV1JsL1h1REtnWW1K?=
 =?utf-8?B?dFlLcDlFeW8zZi8wK3J2QWRiTHh0WWMzWEtzKytmYXRyeTlXRm1xUUJGN0F3?=
 =?utf-8?B?eXVzeGVGYlZzNGg2Z1FKZlJlK040UXBJclJueTBqVnlPTTZ1d1FQZ0I0OWlz?=
 =?utf-8?B?bVhUYVpPbGFVTVJkbXFoODEyZG9lcWhpS0pRWDVOZ3RqVjJhNWppZTFtQkJR?=
 =?utf-8?B?MVlmTktaUFRpWjFQTjVXNlQ0ajlFN1dpR2ZaZlhWWmhGSEg4MG5mT2FtQzJL?=
 =?utf-8?B?elJCdGtodnc2YVNNVXVRZ1Q3cE45VnpUa0NJM3R3U2xGRzZlZUxyTXZiOSsw?=
 =?utf-8?B?c0FVaUtvSHNhLzNGdGdXeTJmUDY4N0gyTXNObHI3aTR6UTFzK3B2Y1dpeHgz?=
 =?utf-8?B?bEdOV1p3aHd5TitRcVJZR2p4Vmh1aHQ3bVRreWlLaG5qMUQ0NG4vVXpRNjJh?=
 =?utf-8?B?QUJqdkoxd0ovRUFHa0dob0ViSXZGQTZHeTZ2SEhhYmlJZFFCNnJ1TEUzWmpk?=
 =?utf-8?B?R0RuUmZldVVDUU1ScjV4bDY0ZGhaZlAxQlZYU3Q2OFRPZXorbUI1Zm1sM3hx?=
 =?utf-8?Q?gK6+rJ4ndiabMIyROVyaaBKLqhyWLk1a?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(7416014)(376014)(1800799024)(366016)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1YvNzNoSDhCb2NMM2t6QlYycVlWa3NvaEhnZm1yY0tBa2hjM0hJT3UwWFQ2?=
 =?utf-8?B?T2JyejhwNkZTM0JvUDJrTVpMTVhzMXBFekZOaWhQTGI2Mm9XMWRGZHZIS2xp?=
 =?utf-8?B?bmRTNG44aUhFU0xwTnF2TCtJZTVUM1lGaGNMcUNsWE44M2dKZlllMWdQWnA5?=
 =?utf-8?B?Yk5TbHVBTHFGSlhvYjYzSGtiNDQ2VUR5QVczU2ExUGp6aUFkakdVaFlsb3Jx?=
 =?utf-8?B?dng4Vi9ZcjgyWDhET3FCbk1QRXlhTnF6UWw0NFBBL3lmUmRoaXRkVzE0ajda?=
 =?utf-8?B?YnZRNEI3QVIyNmJENzgvV3hvL01raWJKLzMvUzhxc1hXRkVaWHRGbWxaMWhC?=
 =?utf-8?B?Y2tRekhyS0dMcmUyQzd5R1QyTW5SKzlzanB2S21NUWIvajNiekFJSlpBUU9F?=
 =?utf-8?B?VTB3L3g0VjV6d1V4VTk5SE5xSWNaUWd6cXRjWXVsU1YzTHBSRGsvbjJJZ0FO?=
 =?utf-8?B?aER4UzE2RTF3ZVRyM0VmQ3I1YVdGNHEvM2hGU2lCVlJYaFZlWkxxbWdFK3Ru?=
 =?utf-8?B?SWJMUGxmQnhUR3BMQU1SdEVoejdrTDNUOWoyUXpUeTJxT1FNcEtMZ0ZZaHo5?=
 =?utf-8?B?Qm0yRWlTSURyK2FQZjNRZmtRRERZVnkwVzlsbk04MkNZMi9SaXB2NUl5M3E5?=
 =?utf-8?B?SkFOMld6TFF3Z2dGWEJ3eXVIK20rWkJPYm03cWp6bTVsdzJyaU03NHVrZDA3?=
 =?utf-8?B?am1lSVk1UlVhL1d1Y2JZWVBNZ2xyQjl5NnpuOERUeVJsWUEvWW51RnJqOU5V?=
 =?utf-8?B?K2xRZDhUUC9ib01kM0FCamFILzVKRWJETnVDc3QvZTJFU0E1c2tYZ3RyWUNV?=
 =?utf-8?B?Y3BKK2hDbnpQSHUveFhkT1Nic0lpZDJxL0dmOXFyYlM0Q1ArQnZqWWY0bGhP?=
 =?utf-8?B?WmJ5QnpmcU9iSE5EZHRPTncrak1HQWc4alJDZVRZU2xVVkJQRjJxK1l3MDJR?=
 =?utf-8?B?NVh3UExzQUpiMHUvRU82dlVmOHdnbE9TckFiVzNkR2YzOFAreitNQlZSQ3lP?=
 =?utf-8?B?SWNTMjFGeEViNTdsSlZFVzlLUnh1RnI4NXQ1VXB5K3RLTzUyZTRhUm9XOHg1?=
 =?utf-8?B?SHRET0JiaGY1SFhiS1Z0aFBuSENYM29GeUpRNnRvcHA2WTNNVHhLQ1NScFdH?=
 =?utf-8?B?OVd5bzZEZVc3TENFcmpWZzVySHlOMVpGT3N2RmFpQmtVUW1jYUUrcW9KSzl6?=
 =?utf-8?B?OW9RbDJ3aEpFblZUZHBqWE5Wa3NHVjBvcTAxaHBDWjVQSGdlRlRTZ1hxUEJN?=
 =?utf-8?B?cjF4R2RXWTRmT2FFQXcwYWViRU9tNWdQTWZpczZkMHBma0pVMXJPc25GWEh4?=
 =?utf-8?B?NGY2S0p5UlQrMjAzbnFnZUNjbzJDRHZ0NW04TURNZzlCYjZEYjdTUVhkaVBQ?=
 =?utf-8?B?b2FlemREZ3JNL2R1VmtvTjBEelk5ckFCbWFPNjBxWGtKOG5lT1kwdkRKR25W?=
 =?utf-8?B?SGc2eUdlVmJwS0RtV0QzN2ZScWVlMkF1ZmZrTTdXWkdkbCtFVGxJbjdWWm04?=
 =?utf-8?B?MGRHRXduSmozNjJTMWJlaHJFRWhka2tNRjNkdExxYTdaSUpRRlRyNWlZWUdq?=
 =?utf-8?B?RTRxL2E4aFNvaWpCNHhlN00wL2d3TFB1enN2VkthKzZmcFdEZElDRFlrUENr?=
 =?utf-8?B?bFFldEk5WDE4TzVGeVI1bENiYkNWZjhsV2R0K1VOZ01uRjlKVzU0QjlXa3BB?=
 =?utf-8?B?WnJXWDI4TDZmdnBNY3ZGRXRPZ0hTanM0aUl5K1ZnSW95dFU0LzBaMmtXYVYy?=
 =?utf-8?B?YXZDY21lVVJyZXF6YUZJWXAvYUxINXVzZmFoUmloVGZRT0lYWlFGMytkU2tB?=
 =?utf-8?B?UVdTRm1TcFlUUk9BS1ArbThLazlmM1RrZWtKQkVTWXdNdU9zcVRQN2Q2M0VO?=
 =?utf-8?B?d2NLeU5pbHdjYjVJODlQMUNnM1p2VFQxMVI3eWx6cHhiVlpEbUFiK2o5THA2?=
 =?utf-8?B?d1czVDdGcGFTSHhuRVArL1lyYzNSbnJHTXRBWWwyVzBGcmp6OGZOL0dGTW1E?=
 =?utf-8?B?UzJFVGdyT1BJeHFsRlg3ZHNBc1ZhWFNHa3lCd0FhMEhZTDUvUnFOaEhVaGF2?=
 =?utf-8?B?ZjRRdjNTaEw4ZGR0RjVpUVZMZTJCMmpPb2FRQWdETEZKK3Y1alprdzNzQ2pZ?=
 =?utf-8?B?aERwMWhOMVRXOHc5WktVaWx2QWJzdWoreHptTHlNS0lLMjhVbFgzd05IRElH?=
 =?utf-8?Q?3RVKwHgG+NUCyuUQKz1rAZ6W0V3H3PQJOJAsei9IHx6/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83486172-fac8-4e2f-59f0-08de193c5dcd
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2025 11:46:59.8143 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oTvxwDYqZ9CPTftogbTcG8HeDMo5bq4jrtpwT6LOBiQ3vA1Iv5a+lH63k0y/YY3x6zOAr+Eaz0Lx2J1eb3vD3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9287
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

On Fri Oct 24, 2025 at 5:51 AM JST, Daniel del Castillo wrote:
> This patch solves one of the existing mentions of COHA, a task
> in the Nova task list about improving the `CoherentAllocation` API.
> It uses the `write` method from `CoherentAllocation`.
>
> Signed-off-by: Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
>
> ---
>
> V1 -> V2: Split previous patch into two. One per reference to COHA.
>           Added more details in Safety comment. Let me know your thoughts
>           Kept the original map to avoid a temporary variable
> ---
>  drivers/gpu/nova-core/dma.rs | 15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/dma.rs b/drivers/gpu/nova-core/dma.rs
> index 94f44bcfd748..620d31078858 100644
> --- a/drivers/gpu/nova-core/dma.rs
> +++ b/drivers/gpu/nova-core/dma.rs
> @@ -26,18 +26,9 @@ pub(crate) fn new(dev: &device::Device<device::Bound>,=
 len: usize) -> Result<Sel
> =20
>      pub(crate) fn from_data(dev: &device::Device<device::Bound>, data: &=
[u8]) -> Result<Self> {
>          Self::new(dev, data.len()).map(|mut dma_obj| {
> -            // TODO[COHA]: replace with `CoherentAllocation::write()` on=
ce available.
> -            // SAFETY:
> -            // - `dma_obj`'s size is at least `data.len()`.
> -            // - We have just created this object and there is no other =
user at this stage.
> -            unsafe {
> -                core::ptr::copy_nonoverlapping(
> -                    data.as_ptr(),
> -                    dma_obj.dma.start_ptr_mut(),
> -                    data.len(),
> -                );
> -            }
> -
> +            // SAFETY: We have just allocated the DMA memory, we are the=
 only users and
> +            // we haven't made the device aware of the handle yet.
> +            unsafe { dma_obj.write(data, 0)? }

This doesn't build for me:

    error[E0277]: the `?` operator can only be used in a closure that retur=
ns `Result` or `Option` (or another type that implements `core::ops::FromRe=
sidual`)
      --> ../drivers/gpu/nova-core/dma.rs:31:44
      |
    28 |         Self::new(dev, data.len()).map(|mut dma_obj| {
      |                                        ------------- this function =
should return `Result` or `Option` to accept `?`
    ...
    31 |             unsafe { dma_obj.write(data, 0)? }
      |                                            ^ cannot use the `?` ope=
rator in a closure that returns `dma::DmaObject`

Could you double-check? I guess you will need to change the `map` into
`and_then`.
