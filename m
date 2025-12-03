Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7865C9F0F5
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 14:07:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1868910E7B4;
	Wed,  3 Dec 2025 13:07:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Dv8NkPlJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010013.outbound.protection.outlook.com [52.101.56.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A3A410E7B4;
 Wed,  3 Dec 2025 13:07:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tr+IHS8PwEwN9uCJGbvgFLY3Xfu7MaEt811oMQOtZ14yuJ4/CHZCHXz1PoePWotHewtWqSjMjVGslagG88+v/65ECVYWmnRwGd1fQtszilvSJR+ys+TQvX1T7ORQO2WRlAhGIwYk8K9ZXlX/OOJe3CN14kaFlvm6yoSbseS3AqKky0rbDP3yfXNbjG9bAYkX2g7FXhzM72E3SfcBfJISh6aX45BFy5VQaikcJWZR1dkwXWfEg968aP+W0v3pyxJg+Uq4/6saTAYkuKWvTvPojbvVpYZVD6tOylCxABRSL64iDJHGovNKT9qlgYFlj7RAMdCC9ROwElC+Jvp8UC8zvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WcurJPy3y1CS4ckgNZy+B0Y1B5tHtjBL3fBKcOvvvWk=;
 b=YWz4PPwZgn5TMdvp8lc/GyAZRClOLxRhmg2IP17cZSeIp4CgsmFXlhLYG3IXKMvJo4Rmm3WxySif6D1oZK/w8KBGWD52EU0s6DIht39t08fR6lxiJHcKrFP9v5Go4Kw89xHSZWzJSDVtMl86HZHSTCUEhV8HzJbdmjNh2KbMyY6z/EPmTmiIRNbWbPlRzJ6cAtLKGyLNq/eYvVFcUf8CbcTz1eHQZakdPLi24JPBb200dwedzj1zljv5rPtQ7MgpLJS4vFAZ+Mm1r3dpRSyrQgoH6E1MM5JPq5zBbutS0tSnC3RLD5gm49vWngqnD/fwLLmjyQUZXOScM0w29TTUfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WcurJPy3y1CS4ckgNZy+B0Y1B5tHtjBL3fBKcOvvvWk=;
 b=Dv8NkPlJ2BUY88vXvSowiRgmWzd3ojMk64QMV992K+tdozemSQ1ZjhicD5tZS/WcdfI1wboczXXAZu2phH3B2cZ+LsddwBolhbM8SRV/petyWrHFSoZWggMn/WT35o9Zt5yw8BvHO4iaWZYQFcOaVGvWc+87LLyMqPvidQpvmuPSaASQWmP2MI4FueIrsfecLmuo9poERGh+uvtG0UhsEdZ+vai2rP7A7l3xckE5uDBW6Krm2ZpCC0SgFduXOJp8LVZuuUzo+mncU3OCQSSYci/vWkww+oL2PJEVux7+zhKCNHyMHD7AJ0NIDiy0AdYBacybYq2ePEFWHmwvKteycw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV8PR12MB9082.namprd12.prod.outlook.com (2603:10b6:408:180::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 13:06:56 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 13:06:56 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Dec 2025 22:06:52 +0900
Message-Id: <DEOLRLCZQMBG.1WHBR4YL8SKYR@nvidia.com>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Simona
 Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Joel Fernandes"
 <joel@joelfernandes.org>, "Lyude Paul" <elle@weathered-steel.dev>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Andrea Righi"
 <arighi@nvidia.com>, "Philipp Stanner" <phasta@kernel.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v3] rust: clist: Add support to interface with C linked
 lists
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>, "Danilo
 Krummrich" <dakr@kernel.org>, "Dave Airlie" <airlied@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251129213056.4021375-1-joelagnelf@nvidia.com>
In-Reply-To: <20251129213056.4021375-1-joelagnelf@nvidia.com>
X-ClientProxiedBy: TY4P286CA0049.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV8PR12MB9082:EE_
X-MS-Office365-Filtering-Correlation-Id: b0081118-4e65-4abf-dae3-08de326cd5b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|10070799003|376014|1800799024|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q0V5bllEMHNFOXNXRUNCdFh4bCtKZlovWlp4c1JWdUEwMUdLVGh2amxhTE9Q?=
 =?utf-8?B?SWNlMGJMUEhnNkRGZExzcGltZzNaNlY4eDhLczJtZGNEZitZTVRQQ0FuNTJC?=
 =?utf-8?B?ZWJXNWxMTHNIa2lTNkQvU3hndXVqWGNtQzJib1hVMk1Id09nNUg5VVZpTUhM?=
 =?utf-8?B?M3hrOWVVUGtIZm5KT3Y1UW04MWRrYjVSZEFhdTVxT090QWlQS29iSFNyazM4?=
 =?utf-8?B?QUxIUDVJbXV4eWY3VU9BYUxDOS9udjVpUWdOQVJTQjJBbzlpS0R2UytNdWph?=
 =?utf-8?B?SisrZE05NWQ0Qmt0aElwanAxN0Z5QUtFVE5RN1lwVVpMeUIxeit2NDFrcUcz?=
 =?utf-8?B?UzVHYmMveitvV09rdC9rQUJjZUlSWEc3NWFSWCtYNDlhVkpvM1FnZDhaMitm?=
 =?utf-8?B?MjJPRVl4VXlJOTFscExzNGZNNVRsRS90UlZpN2owMzB0eHpYd1g1MUVrU0pH?=
 =?utf-8?B?bm5CakxTNk1tZ0hGSjViVDluUWQ5WmoycUg5aGxSd0M0Nkp2bG5rWDJzOXFX?=
 =?utf-8?B?azA5TTkyUC9LUkJuVWF4T2EwYVNGUURQc2swRWZIYVpSTG11QzJPdGlxeTlT?=
 =?utf-8?B?K0YwU1h1YkNxaGNKMzVMME9KcTh6WGo1bjFqQ3o3WnNlNTdlL2tqcjNVMzJ3?=
 =?utf-8?B?UjVSa3Z1VkRrdStHT1RiY2E4a25RREJnSTZIZGFKWlo3bHQ0enpXeU42YkFx?=
 =?utf-8?B?NDRZT1pCemsrWEcwbzh1SVJ1aGFtSHRmSmtzbUQ1Umh3RHVNTll5eHEzSjlp?=
 =?utf-8?B?M3J6WDVXaTY2N0ZYajBSV2tCd2FQdTBPdWZERzhKdm51QVBuWiswRU1UNXNu?=
 =?utf-8?B?RUc2eUh2NTdwdTJDUUkxZnk0THdQMEtISEE2KzRnNVJxdExpeXd3a0VNd1Nz?=
 =?utf-8?B?N3BWWVhkS3pKbmlSZUYxMFM3OHFNK2VIeGo4bzdvZmlXOUdRZXc4R0NjbW5m?=
 =?utf-8?B?dXQvT2IzUG01YjZ0dlFSNzF2d2kyTWJva0NzVnljbDMxd0FNcTVmdW9UT2cy?=
 =?utf-8?B?R2hWbjhxQ2lLSUNXRWlhelhvMEU3djY3OWlScEEza1lwOTNiOFF3dnROekht?=
 =?utf-8?B?NFg3MGdFSlNNdDl1RWUvdFJmRjZHL0FQSzVEWVcxL1RkMVV4dms1Y2VBcENi?=
 =?utf-8?B?bzZkMWNCcGZXUlkwUmVYTk9Zay93b3I5azBwOXpEbmZ2a0pzTkFxOXVxeUZC?=
 =?utf-8?B?RTlqMlkzWEx4eG8reGxsc2pGa2Q3Y1llaWdEVnc5WTNCY1hpdlJ1c1N3Ylln?=
 =?utf-8?B?MjhCV00xSFBxWk5MRkJuQmdPWGhhOGpOZW55NTYyUGhWdGhuWXcrazMrNEVm?=
 =?utf-8?B?L1J6TG40bTlVei8xaC9pTlNyM25lMDZXK0krbHhxcitHTmpFbzFRdnNZVnJo?=
 =?utf-8?B?UTZWN2tNZDRGcXRHc0VvVlIvOFh3Q1RjemJmdlVOUmY0R242ZUhaL0JCblN5?=
 =?utf-8?B?SzFzZGtXL2FleHhRYmNtOUZ4MStxaXBWcXRxQjJ5c1ZuMWRWL3E3dWxzNG1O?=
 =?utf-8?B?VmNjQXBPOVFJQmZEc3VhYjZmUnE3ZU05WjlIUmVLMXNTZjBVeXMyWVV6UXVm?=
 =?utf-8?B?aitna0xQeEEyaERpcTJXdXpFYjcrTWVCOTJjUDI4R0g5K1NqQXp2ZUI3M2dN?=
 =?utf-8?B?TDZyOXRWKzBmdlBEYklwTlI0NUErOEhRUWphSWFrY0tTV2UxSUpXSmRZa3Vo?=
 =?utf-8?B?OWVrS2NhUHhuVTQ5dEdmTEtuS1dSOG9nT0c2aVFnR3BPUHkvSmQ2cjk3NkJr?=
 =?utf-8?B?NXE5dmwwYi93cEpVdGdvVkt2VnkvL1JzeVY2NGF1aDBPR1kyMCtkK1VvT3Qx?=
 =?utf-8?B?UUtIUkJmbWZZNjBGU1hDdEdtZDM1YjhhblJuaEg1U2JheW9EbnNQSkNNaTRi?=
 =?utf-8?B?NFR0WHJVbHpudWVYbHp2YkxyZ3JncGRxYm03MjJYZitMeTNoTXoxRWJYaTM4?=
 =?utf-8?Q?yW4CL7I8nfj6EfHZwVcBGct4aQdTej+o?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(10070799003)(376014)(1800799024)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWh6anB4ZWR0cHpqZ2ZHSURJVVJXTzM3a1R3UVFoQWV0b0JvVmw1bEVDT29s?=
 =?utf-8?B?RHdWSUNVY0NQeldGYUZTNEMxY2R6SUtwVVNpNG1VOFgwMmYzR3ZOY2l1KzYy?=
 =?utf-8?B?VURYc1pYaXRVMDlkYzNkc1h0S3poWVY0S09KK3NVN0RTSG4ybjVoM3Rodmdr?=
 =?utf-8?B?bzJEdlFjQkhzcHVXVzhyK1V4R3BGWXdtTUFLS0h2MXJabSs5bjRNWGt0bmU1?=
 =?utf-8?B?SUNMN05iVWZoZjFsbDJMd1psU2Jva2hRQlBBN3BpLzM2U09LemN6cmZveXAx?=
 =?utf-8?B?VEQ5U0xERTN5YVNsc1RwdmR0S1A4dWE2TWJXWVdhTG5tVzhtdDJyaS9xcmJq?=
 =?utf-8?B?MjVYdkFEMDdiN2tZblBtL3dKZmZ6elZqQklUZ3lSOUcrWVNia2hFc05oSGRt?=
 =?utf-8?B?QUF0d0t6UkxJYjh2cmdZQ3VUa0U4UUY1MzhlRnBxVGFMMVg5T0MyZDJDWHBF?=
 =?utf-8?B?OU01Ykp5WUZUVnpqM3NvWmNXbkwxYkZERTZQWE9zcWw5STJhcDRwY1RxbUF0?=
 =?utf-8?B?RTNKY2xHWlptYkV4VElLcVlmTTVKelNOc3Z3Qk9pSkllbXpCUTFOcHpLR2Vs?=
 =?utf-8?B?ZnhqOWVWZklGMSs4QTE0R1R4RmlsaXZ0eHV1RGsxcGZlbC8xNHIrZEw4SlYy?=
 =?utf-8?B?UmVpenZSbndpV1ZPb0x5YTc4bEcyN0VjeTFRN1AwYjhFcDBwQ1R4THdMWVYw?=
 =?utf-8?B?Mk9kVmJSb1cxYzFEcG5nNHYrbm92RTA0YXBXS2VpVkkzSlFkWHFJMk5adFFY?=
 =?utf-8?B?SXE5M3pKQzlsLzBiRWZZMWVoeG1DbGhNQko5eU1laWNiVW5RcTFRNnptc2Q5?=
 =?utf-8?B?QmxEQmVzV3pZaDBQdSs3cyt6cnd6KzdVYzRWU0VFbUtOQnc1ZUJBNGNYNmhy?=
 =?utf-8?B?ekw2MUVMMUJ2M2RHaGtnY2tnRmVycXFxdjNLZ3FlbkwreVRGSmxsK0k1S0Vw?=
 =?utf-8?B?dHRkM2d4OEQ3Z3NYOHZJTCtZTXEvVXFodktzU05ZRXV5L3M0MXAxSStRV25v?=
 =?utf-8?B?SzRMOU9CYlRVck40Q3QxendqQlpPZVZlWmk3VFFrRUk5OG5IbUZra1ZBYWU3?=
 =?utf-8?B?MDZEblB5c1ZaRjFETzAyUkRvS3lHV0c3TUtldE1Ec1J4M3ZTSS9pZlY4SG1G?=
 =?utf-8?B?Z0dVckNad1hhUERzbHpHb0JuN0hicnBZczZ2Vmx4SVdvVXdPRGJGNDl2NVh3?=
 =?utf-8?B?L1Arc21qMmxPVDVEUUFSTFVrdngvbHljdmtTQ3Z0a0tMTjB6WEpoRGYwTkhx?=
 =?utf-8?B?RmV4dEQzMDc0b1hsTjBoK0I3WXJnVXNhbTFQcHpyTFFuL2RFMDZHUWxpKzRv?=
 =?utf-8?B?dzlaMEhTTTFtS0dvVmx5b2JocWxaMzFlUVNzdjZUcm1pbktOek1QdUpxd24z?=
 =?utf-8?B?UHBYaGI1RzV3cGw5cHc0NUtTNlpOcjZ3M1ovZ252OHZxSmdmN2sydC9LSCtB?=
 =?utf-8?B?Qml4OEg0ZkJ3ZE01RC9Jd0dBZ1JRaTl0M2hNcXlBb2pQcjJqOVRFZ1J5b2tt?=
 =?utf-8?B?a2ZlamxIdHRDWnBuTXprS1Bud21vMVcxcXlWa2JvcmNGaXJJdE1zYmF0K3o0?=
 =?utf-8?B?dkQrZGRIdlZGSU1FNzRJcHd3SzUzczJOZXYzWHovUmtvVFMrNUQyQzdGTWJq?=
 =?utf-8?B?amJjWHJsVytZVTFxbEdvYWQrM3M0Q3dMYXM3dEFzWTc3cTJ3UU9mVFdUQ0Vy?=
 =?utf-8?B?dEhXbWlCR0ZzSWN5YXRIVTJWOXluSDh2QmVCZXJ0dGZrcXB6ZVQrcStqakpo?=
 =?utf-8?B?UlV6Z0VxcERIdkNMdnJtNjhJQlo1VU1laXNZdWR1RlZxcHFjWG1hUktJVDZs?=
 =?utf-8?B?VHJwOUZBaUlZWHRmdzFkZndaMTVFOXV4cUU0cjZkb1h1ZUJGTWMyc1pDalhU?=
 =?utf-8?B?SHBKYUV2cGlXUjhtMkVuSVBtbG1hU2JQU3d2YjRTVDg2bXBmYUozVEVDUVFu?=
 =?utf-8?B?TGVBT3cxZUdPVjVoTEh2OFVmVExPbmphcHl4dlpFNWpDSXdjbmVzbFM1YjFl?=
 =?utf-8?B?MmJ4NlJGdnFPWm44aDNPQzJxb0ttV0pHRWJqQmlTVW42U1BLcTlIZTRraGtS?=
 =?utf-8?B?a3YxUmdlOTJGN3cyZFFSRHNpYXVGbFdQNmdlcFJxYkVZNjh2L0NSbjJnbzhD?=
 =?utf-8?B?Y04vclNSR0J3RUxLcjdJaUQ4cEdKd1ZHUW52T0NkMyttbXZyODZYeFlDZlJj?=
 =?utf-8?Q?sm0LRT3wd2LdCovbwhs+Ux9zzF4vvH2xCUUPn0zl9X3t?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0081118-4e65-4abf-dae3-08de326cd5b8
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 13:06:55.9382 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kKJ6XjIrB7zc6E80a3xqY+8WM4dyINcnVYvDxZArYvzQYzHlkibqxkUvMMyodx1CiMDiqSw7VzkVXIOTVQ29oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9082
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

On Sun Nov 30, 2025 at 6:30 AM JST, Joel Fernandes wrote:
<snip>
> +/// Low-level iterator over `list_head` nodes.
> +///
> +/// An iterator used to iterate over a C intrusive linked list (`list_he=
ad`). Caller has to
> +/// perform conversion of returned `ClistHead` to an item (using `contai=
ner_of` macro or similar).
> +///
> +/// # Invariants
> +///
> +/// `ClistHeadIter` is iterating over an allocated, initialized and vali=
d list.
> +struct ClistHeadIter<'a> {
> +    current_head: &'a ClistHead,
> +    list_head: &'a ClistHead,
> +    exhausted: bool,

Mmm, I suspect `exhausted` is not needed at all - please see below.

> +}
> +
> +impl<'a> Iterator for ClistHeadIter<'a> {
> +    type Item =3D &'a ClistHead;
> +
> +    #[inline]
> +    fn next(&mut self) -> Option<Self::Item> {
> +        if self.exhausted {
> +            return None;
> +        }
> +
> +        // Advance to next node.
> +        self.current_head =3D self.current_head.next();
> +
> +        // Check if we've circled back to the sentinel head.
> +        if self.current_head =3D=3D self.list_head {
> +            self.exhausted =3D true;
> +            return None;
> +        }
> +
> +        Some(self.current_head)
> +    }

IIUC you could just rewrite this as

    let next =3D self.current_head.next();
    if next =3D=3D self.list_head {
        None
    } else {
        self.current_head =3D next;
        Some(self.current_head)
    }

and drop `exhausted` altogether.

> +}
> +
> +impl<'a> FusedIterator for ClistHeadIter<'a> {}

Is there a reason for not implementing `DoubleEndedIterator` as well?

> +
> +/// A typed C linked list with a sentinel head.
> +///
> +/// A sentinel head represents the entire linked list and can be used fo=
r
> +/// iteration over items of type `T`, it is not associated with a specif=
ic item.
> +///
> +/// # Invariants
> +///
> +/// - `head` is an allocated and valid C `list_head` structure that is t=
he list's sentinel.
> +/// - `offset` is the byte offset of the `list_head` field within the C =
struct that `T` wraps.
> +///
> +/// # Safety
> +///
> +/// - All the list's `list_head` nodes must be allocated and have valid =
next/prev pointers.
> +/// - The underlying `list_head` (and entire list) must not be modified =
by C for the
> +///   lifetime 'a of `Clist`.
> +pub struct Clist<'a, T> {
> +    head: &'a ClistHead,
> +    offset: usize,

Joining the chorus suggesting to move `offset` to a const generic. Not
only will it make the struct smaller, it is also better because now
every single C `list_head` becomes its own `Clist` type, allowing you to
discriminate between them in the type system! Not that we will ever make
use of that, but still! :)

In my review of v2 I also suggested to use a closure as the generic
argument, and that the offset case could be a specialization, but
looking at this version I realize this was overengineered - just using
the offset should be enough for all cases, and is much more elegant, so
that looks like the right call indeed.

> +    _phantom: PhantomData<&'a T>,
> +}
> +
> +impl<'a, T> Clist<'a, T> {
> +    /// Create a typed `Clist` from a raw sentinel `list_head` pointer.
> +    ///
> +    /// The const generic `OFFSET` specifies the byte offset of the `lis=
t_head` field within
> +    /// the C struct that `T` wraps.
> +    ///
> +    /// # Safety
> +    ///
> +    /// - `ptr` must be a valid pointer to an allocated and initialized =
`list_head` structure
> +    ///   representing a list sentinel.
> +    /// - `ptr` must remain valid and unmodified for the lifetime `'a`.
> +    /// - The list must contain items where the `list_head` field is at =
byte offset `OFFSET`.
> +    /// - `T` must be `#[repr(transparent)]` over the C struct.
> +    #[inline]
> +    pub unsafe fn from_raw_and_offset<const OFFSET: usize>(ptr: *mut bin=
dings::list_head) -> Self {
> +        Self {
> +            // SAFETY: Caller guarantees `ptr` is a valid, sentinel `lis=
t_head` object.
> +            head: unsafe { ClistHead::from_raw(ptr) },
> +            offset: OFFSET,
> +            _phantom: PhantomData,
> +        }
> +    }
> +
> +    /// Get the raw sentinel `list_head` pointer.
> +    #[inline]
> +    pub fn as_raw(&self) -> *mut bindings::list_head {
> +        self.head.as_raw()
> +    }
> +
> +    /// Check if the list is empty.
> +    #[inline]
> +    pub fn is_empty(&self) -> bool {
> +        let raw =3D self.as_raw();
> +        // SAFETY: self.as_raw() is valid per type invariants.
> +        unsafe { (*raw).next =3D=3D raw }
> +    }
> +
> +    /// Create an iterator over typed items.
> +    #[inline]
> +    pub fn iter(&self) -> ClistIter<'a, T> {
> +        ClistIter {
> +            head_iter: ClistHeadIter {
> +                current_head: self.head,
> +                list_head: self.head,
> +                exhausted: false,
> +            },
> +            offset: self.offset,
> +            _phantom: PhantomData,
> +        }
> +    }
> +}
> +
> +/// High-level iterator over typed list items.
> +pub struct ClistIter<'a, T> {
> +    head_iter: ClistHeadIter<'a>,
> +    offset: usize,

Now that Clist's offset has moved to a const generic, let's do the same
here as well.

Overall I think this version looks pretty clean! A nice,
easy to understand wrapper over the C API.
