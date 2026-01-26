Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +H0dJtmyd2l2kQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 19:30:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACCF8C1AE
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 19:30:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6862410E463;
	Mon, 26 Jan 2026 18:30:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="Wrt+Aji9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from LO0P265CU003.outbound.protection.outlook.com
 (mail-uksouthazon11022128.outbound.protection.outlook.com [52.101.96.128])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02B1810E464;
 Mon, 26 Jan 2026 18:30:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I97sGKuumOSxLZK39wXv6Mh83dPg2eZyy2CrcLBfFVx31/pdVlR9noPpyuQzzux+sjFA49ESv4rT8eZhbrtCBvihsYSiUbZLU6iclM8M1GxIRrJAUH9/7D4ZX96TPi+uKMOlq0HbP5nqPfp2xR0lm//1oDLG/td8+XGTf4zciRPmPFJZOmgHcEtouHZjCSgtdl/tlSKzQWLHJelqqFjWa/LelJox5X2EHntEBLYM3SzFB55EUuUglmabjQ9fnUMBOnwJECOdw0o9Xr0kNY1D0s+FVU0WBynR0oPKuBE2yoja32lvjN+jw+ocPqlE/t4RNE/fIbZwc/71FI+hiabglw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hF4ReY9Ax/3vOkK1SI4jzjNeumIW5P3JsogIJA676g0=;
 b=JzShyZzFXE2elJDp6NemLHy8cE7VhqXZ3ZB0ymsN7abNsriaBT50imJsdCqOGzSU1cb+cq1bYztMns07VwD8aLDacET1I0ZVyK9mq1dyQ7w3vG4HYqezQ7ZfKeMou5DzuX+HiZAIfNUWPaw+slaSLkG9brna7vkJVOiYMw1sX8cUf+RNj6VaVVR6EkxUjmT7oWYzSbfne7O02Xzh0sKtUInzQqZJrvv7bKw7sqhHfY/31MdzvS1zz+D3WQANQ/IWb+N5d5DELs6ZFZSmk0P2wBZXp+iCQKPqHz/sXB3Kdl6ZkXFN7wTdHGBbnklRtWHu2bBiYDkRzAlx8ug4FVqjXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hF4ReY9Ax/3vOkK1SI4jzjNeumIW5P3JsogIJA676g0=;
 b=Wrt+Aji977D5K4XimaHhZ9Qx3WTTbA5dId+nWUVpBX99S26P3dneJI+fH0u27w0ddbvNMtAM+TJwfMfTw99kOFuZLZXHIbzl5zEekbm2UZBgEpYftkO5fV2xTXHGd8i11HUmrgUxz5GdwRNHYCj5TTC2NLAz3yEBOMqVW+EpsS0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::13)
 by LO2P265MB3405.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:19d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.12; Mon, 26 Jan
 2026 18:30:41 +0000
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995]) by CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995%6]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 18:30:41 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 18:30:40 +0000
Message-Id: <DFYQGXHPBZP7.O34DZ6RTDGU0@garyguo.net>
To: "Eliot Courtney" <ecourtney@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Alistair Popple" <apopple@nvidia.com>
Cc: <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/4] gpu: nova-core: gsp: fix improper indexing in
 driver_read_area
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260123-nova-core-cmdq1-v2-0-e797ec1b714c@nvidia.com>
 <20260123-nova-core-cmdq1-v2-4-e797ec1b714c@nvidia.com>
In-Reply-To: <20260123-nova-core-cmdq1-v2-4-e797ec1b714c@nvidia.com>
X-ClientProxiedBy: LO4P123CA0598.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::22) To CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:27c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CW1P265MB8877:EE_|LO2P265MB3405:EE_
X-MS-Office365-Filtering-Correlation-Id: c46b7529-c6d2-4f16-0bb6-08de5d090281
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R1c2TUtBa1ZXS0RxbGhCbFNLT3ZCYWlqdkliWGFCUnhlaHFyMGJQWTFwM3h6?=
 =?utf-8?B?dGUvcWtNblhHcmphRUZ6SkhsQnFEQkhmdzRJMGsyUDF6c3NWYTJTQWFKTTV5?=
 =?utf-8?B?YmlPd0haUmhMdzJwTGNQUDEwRVZyNlpPWFNYWW1BcVdIYzVJdDZLcWIwVmVH?=
 =?utf-8?B?SlhXWEU3R1YydlFkL0k2NVZwUHA1MDhCbDJnZGtjWUxwZzRZczQ5bGo1TUYw?=
 =?utf-8?B?UU9jVXpPTUtxM1lldWdsZUJrRXNDWUFDTjB4bGxzQkY1b1dFTTlLak8xZjdJ?=
 =?utf-8?B?d3JKSUF2bUg5TzZDR3lRMHRNMnJsYUlXYm9uYmdiWDUrMEZKZ3I0REhmUjNF?=
 =?utf-8?B?RnRzVW5DTGtIOGp1OU9POUw2eFFRVmd4R3lZVXZuR0lYeWZwdmwzQWRvQzlS?=
 =?utf-8?B?WFdkU0lOOTU1SjhwbkU3NXNhYVZhdVNxcG1ld0RKeHhPUENqZ0QyMWdXQWZk?=
 =?utf-8?B?bjJvUXVQUGZ0ZjB6dDE0SGdrTlN6eFRaejd3TFY3VFFnNUVJVEZwZitsTktY?=
 =?utf-8?B?dm51Q3NQeDhDQ0owakNOUzRTRjdzeDhBMkZVbjQwcGdKeVhCOHRONWJYTGY0?=
 =?utf-8?B?djJ6Y0lKdjE1Q1B3VGNxWCt0QnVFUHM4VmNqWFJNSGM3bGJkYTJjaDQ0NjVW?=
 =?utf-8?B?a2UzbVlpbDNKNWl2a1VIMnAzVXFXMUlHNE45cG1QNWpVWGZwVlRVWG41UXc2?=
 =?utf-8?B?L1d5WndTMWtwWG1iNVF1OWh3RFVlTFIxRDN5dW9uNUVXY3ZqUkI1VmxJYzIz?=
 =?utf-8?B?SFMrMHgwcW1icGlmQjdBR0ZxQTA0UjlWYTlsOEIrY2M3YVFPZmtRbHdOaXdG?=
 =?utf-8?B?cHFyR3llU1dKQnE4SVF6UTloSXhNV0k0OWgyazdBN3pGRFZQSEx2SC91Q05X?=
 =?utf-8?B?TmpCUkxIa1lrR1RyOUJzWk8xU21kMk9yVXhGTDAxYWpkaXYzWG85MlJseEww?=
 =?utf-8?B?ckoxQ0h2UkRZcWo4TWIvTEFhVDkva3dJVTZtT3ZkT1IxWnBQN2IxS0tITURV?=
 =?utf-8?B?RjFqL0FyVDR3aG5vUFMrUXVSS1ord01uZk1QUytTTFp6Wk9kUk1ydmZSZUlv?=
 =?utf-8?B?bFN2dVhlaktHbVIwM0FMbzIwVnQ1MThROUtCazVXWEtmZE5kT244RmFtMk5t?=
 =?utf-8?B?OUNteUF1ZG5UdFdsUHRKQko3bDk1T3E0RTkzcm4xVy9DNExudXpOZXVjRVFj?=
 =?utf-8?B?NklzWWd0RWVOY0trdGMrRjBFaUNBUW82dHBQR2xlSFMwZHFDakU5U0pRRUxV?=
 =?utf-8?B?SkpxM29yUEdta1dJbnZrREhWS1hxTzNDbjQwRU1BRjBuUmZEczJRQlBuRm04?=
 =?utf-8?B?b1lIMG1SamNJcE5TT0JnMmdCMWNlVEd6cHpYcENsc0NaTHhFblJZa1NFN0t4?=
 =?utf-8?B?ZThUUzZ0U1o3TmFHellHSjVyWE9qYW9PYnQzYlhOUnZkMDdVcm02RDJHdmJ5?=
 =?utf-8?B?TUtmNzM2Nnh0eUNyNGRFRmNXKytjUEVXTVMrcVNjWi9EeTZJV2ZYWDJFS2d3?=
 =?utf-8?B?S3NhR29hcHFvTlkyakh2dnhJZnI5L0VBelpnSDYwblgvenZ6cDN0ejMrV1o2?=
 =?utf-8?B?dmRaejZVTmxIdzlaMWpoU0t0UFUxTVN0Snh1TStDbTZnZEd3dFFucnlYaGNN?=
 =?utf-8?B?aUVFVjdjMkpWdDk1ckNDTVl3TmdSN2VBTjlWN2duRWxTeW9uWktRd01Xa003?=
 =?utf-8?B?VHRjOHFrRFkwRWRFdmxpWFhmUzBIbm5yT2dENHRlR0tQdDdMWmJJN0tWdmFK?=
 =?utf-8?B?RVczRDA3NGFyZWFFZVRJcURzODRYQjVTZmJLSG9Bam1mTXJ3bVluYThQZHpl?=
 =?utf-8?B?T0JrQVZLNVdrVUVwY3BpbTdpYWpXUk9XZWRWQmJWZXROQkRVWWVHTGVQY1FK?=
 =?utf-8?B?VHA0NzE1WTFnZmxPOVNsQTgzVFo0Y0MvSXVkYXNvM3NQNWJwRWp6SWI3Z0o4?=
 =?utf-8?B?R3MzR2pOU21XaFFPa2lBWWNBbzdGL1g2cUI1NE93dGNEak10YkY4TXV1ZGdC?=
 =?utf-8?B?THJqdndnRDdvYkhyRTVvZ21jTzNSbFZNSjZrTUJnQWJFR09xd3JlWjVrbk1x?=
 =?utf-8?B?NUlWbkh5UXRnWUplVVBaSm5LWFlxLzVpWWx3c01RZ0NjckRlbzlzQ213M3Uz?=
 =?utf-8?Q?vuw0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1p2ZFl0djIxVmlRQlV2eUhIdEthK1VDMmkwMS9WZC9WTGlKY0FPWFo3QXpp?=
 =?utf-8?B?Z1ExQmNpY1lwUjNveCt5N3FSNkxUVTVIaG5lUHlBVkRzTlAyTDdzV1lMbGhN?=
 =?utf-8?B?WmttaEd0MUcxWXppL2w3cGRJRXZnRHM3dklzMWd6KzJnWlBHb1ppRUpIQnJJ?=
 =?utf-8?B?c3N1amtuaE5lSURnb2gvYnQ1MHU2aHMwamJCK0ZGU2tXRnk2aEd3U3daNGhj?=
 =?utf-8?B?eXo1eHVlR1FjUHR1bEhyMEp4RXhRTUNpcTJrNEkrWE0xb0tXaXVRU3BELzB0?=
 =?utf-8?B?eEZuWmNoQmFZSCtyOWxVN2hkVVBDSUtkc0V6M1A1Zms2RXkvTzVBekRvSkxt?=
 =?utf-8?B?a0luQldYeWZxZ0dlNHA3SGVaNTVDdm4xYUkvRjc4WWgyNTk4YnJIWHplZnA1?=
 =?utf-8?B?RWxQVGI2U0ZkRERBMVZrbTZVTzl1K1RYbWZWeE15UjAwTUJRcDZTNmtsRFNP?=
 =?utf-8?B?ZUc2ODRZbmpDeS9ETHZPS3RtSG0zczFXSW5lRzBUL0FPdk04aGkrd05tRm5o?=
 =?utf-8?B?YzNWOWxaNEVXWVE0MWJ4VWhMTjV3UmdqdWJxeWg5U3dqVFJpa1FmMFdNZzJv?=
 =?utf-8?B?N2ZRTDNHblhSSU1JWFJ2V3ZyQzB0OE50WDRsc1BtZHNpOWlMOHFjQk8zb0Vz?=
 =?utf-8?B?aVhtUzhJQXF2NW9jZGVUbVpHTDI2eGhHczJGOWdZWGtUcDBBSjZ3anFMTnBs?=
 =?utf-8?B?S0c3LzgxWFFWdTJaK1l2Vy9VQ054VTdqWWJsSGFmU21xUnJSREhwVTcwOG93?=
 =?utf-8?B?V0dMZ3Y5bXVpS0UyVXNIZnl1eTdab09TeGtrdU5nL0FhYlhQYXE3RTV0Z0pj?=
 =?utf-8?B?V0FTNC9DbVd4N2VWKy9rV21iQmRoVjBYcnNQL1ZveHdKWGNNSUJXUkpON1J4?=
 =?utf-8?B?QnhMSUtnSWhid2pzYTRIRy94d2Fya3hRaHA4VXBQWlhyQStHYjQzR0gzK3g2?=
 =?utf-8?B?SmV6VXhGZzJWTDhVVEhoOG5wVlpFSlUxMllqV0hiR1JwNkg1cWhyZUdUeTMy?=
 =?utf-8?B?Y1U5TGRwazhkWlJUSDNOMlF3R2JSaEVQa2RNdmFZbVRTbFZJb1BJUDNhQVNz?=
 =?utf-8?B?dDM2dE5QNnVSbU5IRUw4aUMwa0NiK1RxWmRGR3A4aVlZSDNzb25rV0VTcmk1?=
 =?utf-8?B?MExaS2Q1Vm9qSlhOK2k1ZjUybHl4RXJULzVoNktZVm9TWG02ZUJsZWs3WXlp?=
 =?utf-8?B?VVVheStObzlHeDVZNm01dTJXUDVlcVpPRWJIalVLQy9TWmU5RXVHYmlsVys3?=
 =?utf-8?B?WHU3TUo5bTBZODhzaTgydzBzUmFDOXo4SXV6Ym1pQnA0Yk9xSlRKc252VWdE?=
 =?utf-8?B?azZWdGJiN1d6V2UrcDd5YjNKT3F2YWFOeHkrR0lUeVg1c3RYTXcvMzlxMGdi?=
 =?utf-8?B?RnYrU2tFMitUdXNHNTYzMGZQOTgxSUNySGtYZ25GSSs0Ukszb1VpVjBRZGM3?=
 =?utf-8?B?U2NiZ3lRUCs2Rnptbm9aNVQ0ZlhQc0EzUk9MamY3QUZNNTBBUXZ4L3A0Q0Zu?=
 =?utf-8?B?WWhadkx6T0QvbmgrUE94NzlDMnlxM1BsTGlkeThCZGtjSzdpaEVCM2E5TTBQ?=
 =?utf-8?B?MGo0OW04anNzM0VIVUh0WkJQQ0krN1BsbjFGSitTcERzN29GaU1nMGE1TGVX?=
 =?utf-8?B?WExBdmFnR3I0dmNQNG5LdmFGcis2QTZvK0NOTEo1bjM2T2FzYkZVbnlBalY4?=
 =?utf-8?B?R1RLOUZoNWZWSDd3YUR4bTl3dW1vdWs0T2lETXgrY3R2TSt6eCsydnJ3bDlY?=
 =?utf-8?B?RlRDMU9pV1dkeitsRVdvTW1LTUpqZ0FCU0tWQjZiVzBWNjQ1eERXUmhVTHZ4?=
 =?utf-8?B?d1cvR2wwa1FLaUo0UWhtZGNxNnlPRXY5RkZiNFhRSkx3KzJJYzcrOWY1UFEx?=
 =?utf-8?B?cU1xcVU4aG5wTXEzUkxhdnplblBoRkFoYzVUV3BLZGhZOCtrNmV6SGd3VTBJ?=
 =?utf-8?B?S2RIeE9lUXRRbjJKMTdkc0ZTeC96aHNDYS8vcVg2bmIwdWFWcjlDRkh4aVdu?=
 =?utf-8?B?ZHdUZkdtajhzUzErTXBZZzBnblNCVWtHcDFZK2Q1T1MrZUNTa1ViMkQ0dkUw?=
 =?utf-8?B?U1dkMXg4bkMyZUdHZzhVb3Jxa0xrWUk2eUMwOHZyNFhXNytiNVZXcnhPRHN5?=
 =?utf-8?B?dmdVSm1VdlZJYVR2M0t3bzBxWkZlQ3IwemtveS9XSzhIbEFRSVlsbytnNktL?=
 =?utf-8?B?RUh4VWwxR0VUVi96UjUweU11eFh2STVZMXZsb2Zlclp0dVhWUnhJOVg5dWhG?=
 =?utf-8?B?cm1KUHp3SnRqWU5xNjdRUWlMbUhTSUtrYkVNWUFPd1NqMk1RK2prMzZZR2VG?=
 =?utf-8?B?VitDUG1PRGFsem9wTDQyTHd2ZWl0R3A1L3VVY0JUczF4TGxsdE15UT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c46b7529-c6d2-4f16-0bb6-08de5d090281
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 18:30:41.1889 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CTG5zJaO+Ge8jQaASXV5spFS9EbS9o2iOihpgYb2rgaCxpjxnTlvZvlwZFHcNVAwsGZQhr0fdXynVmJeceBl1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB3405
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[nvidia.com,kernel.org,google.com,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:mid,garyguo.net:dkim,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 1ACCF8C1AE
X-Rspamd-Action: no action

On Fri Jan 23, 2026 at 12:12 PM GMT, Eliot Courtney wrote:
> The current code indexes into `after_rx` using `tx` which is an index
> for the whole buffer, not the split buffer `after_rx`.
>
> Also add more rigorous no-panic proofs.
>
> Fixes: 75f6b1de8133 ("gpu: nova-core: gsp: Add GSP command queue bindings=
 and handling")
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/cmdq.rs | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gs=
p/cmdq.rs
> index aa8758fc7723..c26396fda29c 100644
> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -1,7 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
> =20
>  use core::{
> -    cmp,
>      mem,
>      sync::atomic::{
>          fence,
> @@ -267,10 +266,20 @@ fn new(dev: &device::Device<device::Bound>) -> Resu=
lt<Self> {
>          // PANIC: per the invariant of `cpu_read_ptr`, `rx` is `< MSGQ_N=
UM_PAGES`.
>          let (before_rx, after_rx) =3D gsp_mem.gspq.msgq.data.split_at(rx=
);

This code doesn't need splitting as it doesn't have the uniqueness issue th=
at
mutable references have. While you're at it, probably it's chance to simpli=
fy
the code.

> =20
> -        match tx.cmp(&rx) {
> -            cmp::Ordering::Equal =3D> (&after_rx[0..0], &after_rx[0..0])=
,
> -            cmp::Ordering::Greater =3D> (&after_rx[..tx], &before_rx[0..=
0]),
> -            cmp::Ordering::Less =3D> (after_rx, &before_rx[..tx]),
> +        // The area starting at `rx` and ending at `tx - 1` modulo MSGQ_=
NUM_PAGES, inclusive,
> +        // belongs to the driver for reading.
> +        if rx <=3D tx {
> +            // The area is contiguous.
> +            // PANIC:
> +            // - The index `tx - rx` is non-negative because `rx <=3D tx=
` in this branch.
> +            // - The index does not exceed `after_rx.len()` (which is `M=
SGQ_NUM_PAGES - rx`)
> +            //   because `tx < MSGQ_NUM_PAGES` by the `gsp_write_ptr` in=
variant.
> +            (&after_rx[..(tx - rx)], &after_rx[0..0])

This can be just `(&data[rx..tx], &[])` without the split.

> +        } else {
> +            // The area is discontiguous.
> +            // PANIC: `tx` does not exceed `before_rx.len()` (which equa=
ls `rx`) because
> +            //   `tx < rx` in this branch.
> +            (after_rx, &before_rx[..tx])

This can be just `(&data[rx..], &data[..tx])` without the split.

Best,
Gary


>          }
>      }
> =20

