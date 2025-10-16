Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B111BE1B0B
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 08:23:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33AA810E933;
	Thu, 16 Oct 2025 06:23:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DIHOyBOg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013062.outbound.protection.outlook.com
 [40.93.196.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B199910E933;
 Thu, 16 Oct 2025 06:22:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wJN4ZuEGEBC+aSnwvoxxDXG4E9NVia1TZ313TXqljuF3Ewz5sXj6CJtRVnDJKnCiklGIPK9xk9usX27PGPUPTM0qHe/OZX052iAe7QW6ipS2eT4V8bA+zGoWxcebHoXS0kcXOadulLCQgOMii3bfMaZymrjYK5GCuab2d+I2B0vK5q9rEZp2fmO7krY6YKJliPyZuqsPzSUnpWfP6RJHrEOAGfr0Ho9FO09yTW4oLXdLCcuMySqsR2xpEj1mrl+QVMnM4Zu3D3ymMPy2jzdLbOdWRas8kUjH1otuqgZLnjbBGaI27oHEkmLszpGRLQu1jAmHqsOMPj72IhtKkBJdzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k6VC96+l3jmm66hdWRVRap9a0HhHUIOhCKTZI/0a+eg=;
 b=FXQsCkKxNDsg95xEfo6EG6CMrZI2yTBFFGfJALvWUZWJ5KduKjxZKIGY3KZwCxhzjfbX3zcv6bqP6hSiEGYlp20QcCAiLo9mc0r9p6Dgt/h2jfoe8WPXZwE1cKzJJTA5vz5t3UGe1he9Hac51O67Ux+SbxuulVfU5Xmo7UT1q58IiCKE5/GlIS0aQyCGScWCPZWJNki6CX6q8trXl8nbGdO+4RUrFnZw+PaAVI/1Z40V/mwU8LhJ5a3hUGClNPR+SPyABf1L1fl3+ycFNTUEqJUq1lxxGUyCvLKGCZG+tshTpthj6CeGctcbEPjZkSWyh+un/QIG+30M14sZszUj0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k6VC96+l3jmm66hdWRVRap9a0HhHUIOhCKTZI/0a+eg=;
 b=DIHOyBOg/S0u53TyJJHAYbJxwM7l/6T6rg/cDdRAmStXnHCuT64Fa3tlplgKFKEr9gZcCBmaeNw5sHwpKbIEHMXrYHBEzcKRLf8k4RirOTj7ff/5EbKKhKEcXNfdkcw5yiYIScQ5KScsStDnvx9FGyjEO7rANm1eN18saQNUpe9lEIExJsJtbGK13GXhsdFWo1a0kmROm0bWNePo6Ijgp7vAY587RTOFob21knbMXRKOe67ZdRWpWndVKlfHmBBSDczQBSFyBkGIuSWTPyIq8DIMA/MAfNFzVU+a4LvGBl+1xM/hieeIWyAiAvoXVrQm2A2HnsDWIHqZMHHeguVHkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA0PR12MB7603.namprd12.prod.outlook.com (2603:10b6:208:439::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Thu, 16 Oct
 2025 06:22:52 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 06:22:52 +0000
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Oct 2025 15:22:48 +0900
Message-Id: <DDJJ42I63ERZ.PMLCJQMMK9ZV@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v5 02/14] gpu: nova-core: Create initial Gsp
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alistair Popple" <apopple@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <dakr@kernel.org>, <acourbot@nvidia.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251013062041.1639529-1-apopple@nvidia.com>
 <20251013062041.1639529-3-apopple@nvidia.com>
In-Reply-To: <20251013062041.1639529-3-apopple@nvidia.com>
X-ClientProxiedBy: TYCP286CA0067.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA0PR12MB7603:EE_
X-MS-Office365-Filtering-Correlation-Id: 8168a578-c74a-440b-b9d2-08de0c7c6f61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|1800799024|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dDN1UzlRVjRCRjdkekVBUU9pTUxmNFBvQW9NRkpnSUxwMlpXMFhzQTlHQkw3?=
 =?utf-8?B?UHJMWHVrUWdTbjZtS1Y4eFNkNm80Z2NsUGttdU1aUUVIWDlnVmlFZXgrMjJi?=
 =?utf-8?B?UDhkbGNTTVZsclgrcjhjaytwT09TNStZVWRFMU1OM090Ukh1Z1dOOC9oRDVp?=
 =?utf-8?B?YnBSM00vbVpWSzhURWxaazV1NDVXOW5RMVJkU1NCWThPMWJNQWF1TmNFbmYy?=
 =?utf-8?B?S3JxVmM5YnJZZzk3UzJZYW9lVVBBL25pQStObWF0Wm9Hd3ZEV1hVSWNZV05Y?=
 =?utf-8?B?VWZnQUNpaHJsYlFYNnllNnJoNnM1VTd2cEVObEdISm9ZOGd2dk9KZ2FWZ2tY?=
 =?utf-8?B?ZkYwRXo4ekVncWxOR3ljM1BLNHNLNEwwR0ZuVmxaSjZldERuYzU0N3hLcklO?=
 =?utf-8?B?S2N6V3U2aDdjNHJTbmFpdWJyKzVkUE95OG5pNTRvVzVHOWZMOHZsSk5GNUw0?=
 =?utf-8?B?VC8zZGF6NmQwZHdoalBNUG9TNDVVWWg5QjhzSXZCeUdqRWNibGZFaUJvZ3Bs?=
 =?utf-8?B?YktUU20wWG1GbHdTK1JBb1FpQ1FINUtPVitucStOQUd4YXhGQ1lmYWZBTDJx?=
 =?utf-8?B?VXVLUnZ5aElBQlZzbm0zb01aK2ZjMnQ4dzFnZ3VMelo5UHpGMVY3ZkZHNHFH?=
 =?utf-8?B?cmhBM2h4ZXl6dlNmd0wvRkk1ckNvU2sxU2V0MzNNWmpMYXZJN2ZBdDFtS2NH?=
 =?utf-8?B?Vi8xMWJXZS9NNkg1L1Iva2FwbnB4cGNBVWpxc2lCdnVsUDkvTENlTFBmOXhy?=
 =?utf-8?B?NUJyN2RFalpVNVBHdFpnZnBYS3Y0RmNRS0tYeFQrOWtWKzJic3I0S21nWFpM?=
 =?utf-8?B?TzBmbjFMT0duUkk3WnlWb1lWTmxhT0k5ZXErTUlYRWZSSVptUi9jejV3d0d6?=
 =?utf-8?B?bldkY2d4b2FMQmlTbDJWM2dZVXgrRzk3ZXUyZnM0eCtPTUs4N0JWSHI2L2hw?=
 =?utf-8?B?WTBrbldZYis3UGlVMlJUR3AxY2w2bTR5a3BjN1RpRjJqNFN3TEErSmdIZkxI?=
 =?utf-8?B?elpmbU55clJiRjlraDY3enFILzNZRzVRU3JCVWhaVnR1Y2NXMk1SYTNWMnpY?=
 =?utf-8?B?NVB1cDFUSUVLbThtREsvRWJKTTZvS2pqQy9IeGM1NVRNd3dCa09vMWYyT3ZH?=
 =?utf-8?B?eC92TDZFYm1DU2cxQ2p3R0FhNmd1TS9wajlNckYwbDVoS3JjaHpxcE4zOGFu?=
 =?utf-8?B?bG1obVowWVp6YWp0cnhxRDNsWmllM0h3ZS8xVnErZENpTkRiU084V0RIT3pN?=
 =?utf-8?B?VjF3WkpGcWRpY1JaMWRyd3hqaFpZY3dBbDF3WUFXMGxwYzBqK2Z3SUw2NW9r?=
 =?utf-8?B?UkM5dlp2akJvQ21IdjNYazEydzF0NllIM2NUSlI2cFpLM0NrV1FwOW42ckF2?=
 =?utf-8?B?N3p6YU1VZDQwdmFuOFRYMGJTMGhneHRPRE5pZXlaUFlhNHpFa3grQ29ac2R1?=
 =?utf-8?B?MkJjU3NtSDZJaXAvY1FMNUtPT255a2owNTB5OXhTZ1lNTEdLZHVpcUl1ZmV1?=
 =?utf-8?B?YWFjSEdyaHNPZmdjRTRHWWFhTG5iellzd0tsdVhLZlFqbzluUkdQWlBram8x?=
 =?utf-8?B?L1BmR1RzekJuUDdxM3k3ckowcC9ZZ0lHQ0ZvZ1hsYlZ0TFpKczEvazBOT3Zr?=
 =?utf-8?B?SUszenJ5UEZXbXhLZnh5Q0Iyc1NPNUVaUjlrRWRTbUEyMkZPQXcyVEtUck1S?=
 =?utf-8?B?T2QrUXgwREUreHR0Y1hpd29ncDZsOVhYS1RIdlZiMkdXeXVSMDBscGJPdmRm?=
 =?utf-8?B?SHRYNW04VUdQS093Y3NWRUN3RUd3VkNrak1GQm9HZVNMSVRTWHlDS1BrNkZN?=
 =?utf-8?B?Wm9qSVppUndSeCt4N09Nc24vbDFKaW1XUlJTRVZNcDhOeDJ1NGZGVTQvU3ox?=
 =?utf-8?B?dWNoekc2MDBxRUgxZnNySTA2UG5iYkRPY04zdmllSGM0ckZJUWpqSzlKV2c2?=
 =?utf-8?Q?jNvUIGJ5nrjSZpNE6XK/bE70hyKns0Qp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUxwbitLb0NJZ1hvYmVLd1NpSmliNDJDZzN2RTJTeU9zdC9FcnQ3dGpRKzI1?=
 =?utf-8?B?bGEwUlNNeTg0SzdzTUI3WnNWbURJNlJ2dC8vR2w3Z3l2bmFlZ1VyQ3BCYWww?=
 =?utf-8?B?dUZ3RVZYV2V1Q0ROcnNWMSszcld2d3lzOFI3QXRSNDl6VTBPTUNFaU01YTJN?=
 =?utf-8?B?SUFmVUhad2NWR2lRcmNpazZlQU4zTW1IemRMZFFMRHJkMW5pemh2cHVCZU1V?=
 =?utf-8?B?dE42bStvbjRTSTh6Zk9qa3N4aGJldzZmL2RwTTByRUU2VVBSUTY2ZEE0czhC?=
 =?utf-8?B?QUwwMkswWFI2VnNhU2JKd0xEZnd0RkVYMXp3SmIySHltemZYUFNXWlJFbFFz?=
 =?utf-8?B?MlhRUzhYb2lXWUhMK0xDVVZmZmpCd2JmMDlSVXFQQVpOV2JFaUxWaklPSk8r?=
 =?utf-8?B?NDhVRnZEUkd5eTdjMWE1WFFNVnBRZjFZbXdqeFJjK0dNWkZveE9QQldZdWJ6?=
 =?utf-8?B?ZlpqTDFoQUtJcXM1dzlKTnZGanAvZHl2Qzk0T2tMUE5FU2IzbW1IemUzaUhI?=
 =?utf-8?B?dlExaU1EMmJ0NmlaaTJZR090ZUxhbGZZU1JuQ0QxZDlNTFpxcDFzQVhTbGlZ?=
 =?utf-8?B?YXVkNEF2MHY3T3Y3bnZQdXVCWWltQWxkTXJFSmRKanpSUWlJYWcwYktDN1o5?=
 =?utf-8?B?WEpMZWFNNlQyOGNxZjhEdnMvWng4MlFiTHp0NyszdVdiVElVS0g1Y09nMnZp?=
 =?utf-8?B?VzU5dlJtNFhlMTNHeFB2UXJaZTROaENqQWhOQzc1RG1yK3lVQ21CSG1QT0Zn?=
 =?utf-8?B?cTN2R3EzRHJPLzR5QjFJckM1Wko2dzFKRVB2b3psckFMOTdFVlZFU2Niam5X?=
 =?utf-8?B?YjJ2SmJtb1FpVkhORERnSXFvVkllTWxadFljUWpLYmxINEVYK2pic3ZHVWJz?=
 =?utf-8?B?TkZpU2tleDZrdnJrV0FBcTROdlRDWjFoVEVRZXdaV3Z5dXVLd2xrNVN2TFU2?=
 =?utf-8?B?eHBSY0lGd1NzemdScE1CNzVKR2syUVdONXllYmx0d1FJZHdhWWc3OXVWNDFi?=
 =?utf-8?B?ZVFYY1NKZW1xbnJGb0N1SE94MVY0UE9xQW9XeDNZdjgvOW1FVnFpVVE5OHRT?=
 =?utf-8?B?YmxWNWRiTkZxSTlZamg5NHVHSVJjNFl5aGcxcllmRmtrNUtHUUFlZFU3VFVF?=
 =?utf-8?B?NUZsMU8wTGp4UVUvZVBuWXMvOTNuQm5wQldWa0tKejcvVmdraC9FQ29GaWJL?=
 =?utf-8?B?S3RuMS9KR05DRm9FbGh2OC83TE5ReUpaQmJwK1VtbVpMcU9VSVAyV1hMR3hu?=
 =?utf-8?B?Q3JpSklYVkt0Y0xmWHNUYUJmL3U4bGVVRkYyRWZWOTVnZ2lraVkrd05uajFh?=
 =?utf-8?B?dFo1S1hTbzlhY0pGaFh6NmdUdHNUOEtGeFYzQitsK0FnbTAvbzQxRnN6MjdI?=
 =?utf-8?B?YmZqTDVYbnNHdEJXQWJLSWFKODRvR3RVVmZFeHkxUlNwRlJ6NXE2M1BxYkU1?=
 =?utf-8?B?Yml5L1R0bENQYUhnYk51UU5uYkFodk1TWUo5Z3BQWnRvR0dhY01zT3FJa1BN?=
 =?utf-8?B?bjJYT0tDYVpDblVIdGVMTnVXY3V0clZjbk81MUtycEpwaWdrU3BtU2RSR2Ns?=
 =?utf-8?B?ZHMyRXhTWG9YN2tBR1FwdnYzUHJtTXFSWkhic1A3Qm1BTWV5V2w4bGpaUnlG?=
 =?utf-8?B?WU9VQ1VtMWtTRkhBYUNCZ0h2S2VlQlpRK1VuYklCUTZaQWxrNy82Ti9UUVI5?=
 =?utf-8?B?UEV0b1orVzBvMXRkNDVCbWplanZyNHFHS3VJemQ5SXc0cldYS2NoRmRGRmgr?=
 =?utf-8?B?WFQ0VzhvNjRrQ1A0SGdIL0ovcUNheVBBdGd3TUlGS3dFdmtFdmo4VllGOW0x?=
 =?utf-8?B?K2RuUHJRTjIyZzNiR1ppYm1EMjZkZDlGNlF4L0drU25aeVZxNDlkdHRFREQ2?=
 =?utf-8?B?K0IzYjRHRGowQVpGeEZYN2tsTkdWVUt5SVhvK0FiM1Y4Y0FnL0NTWG80UjEv?=
 =?utf-8?B?Ukk4OGtzVUppTkdhNmQyMnFFU2MwbzJ1bHM2eUFZQk82MWFkZFByKzYvZUFp?=
 =?utf-8?B?dnhvem11TGhBQWtiQ0dnbDBFWU9VVmZqVDEyVnE3TTJ6RU1LVXNHZkFycUZx?=
 =?utf-8?B?c0Y5VHhFcU1rZkhvbmJnb3YvLzV2UTFqSkdhUzhWNGphSkN3aGxKVm9DTWtH?=
 =?utf-8?B?SkNORFNHRXo5N2E2NEdYNkRiaUwzUnRvbmVlSGIwNmJUM0p1YVF5akFna1p2?=
 =?utf-8?Q?YjVKVSK9IBttHOhPaOHIkyrN6Ku9FkS63MgBO7MZC1Mq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8168a578-c74a-440b-b9d2-08de0c7c6f61
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 06:22:51.9277 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZOk614vm1ceznitqhI2fd2Xb1ZPyM6ZfsvGGrkszS7bsL4N/vkgyUsuvcnb6Az53vFtfcLXrg5O19S99A9L70A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7603
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

On Mon Oct 13, 2025 at 3:20 PM JST, Alistair Popple wrote:
> The GSP requires several areas of memory to operate. Each of these have
> their own simple embedded page tables. Set these up and map them for DMA
> to/from GSP using CoherentAllocation's. Return the DMA handle describing
> where each of these regions are for future use when booting GSP.
>
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>
> ---
>
> Changes for v5:
>  - Move GSP_HEAP_ALIGNMENT to gsp/fw.rs and add a comment.
>  - Create a LogBuffer type.
>  - Use checked_add to ensure PTE values don't overflow.
>  - Added some type documentation (shamelessly stolen from Nouveau)
>
> Change for v3:
>  - Clean up the PTE array creation, with much thanks to Alex for doing
>    most it (please let me know if I should put you as co-developer!)
>
> Changes for v2:
>  - Renamed GspMemOjbects to Gsp as that is what they are
>  - Rebased on Alex's latest series
> ---
>  drivers/gpu/nova-core/gpu.rs                  |   2 +-
>  drivers/gpu/nova-core/gsp.rs                  | 106 ++++++++++++++++--
>  drivers/gpu/nova-core/gsp/fw.rs               |  64 ++++++++++-
>  .../gpu/nova-core/gsp/fw/r570_144/bindings.rs |  19 ++++
>  4 files changed, 179 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index ea124d1912e7..c1396775e9b6 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -197,7 +197,7 @@ pub(crate) fn new<'a>(
> =20
>              sec2_falcon: Falcon::new(pdev.as_ref(), spec.chipset, bar, t=
rue)?,
> =20
> -            gsp <- Gsp::new(),
> +            gsp <- Gsp::new(pdev)?,
> =20
>              _: { gsp.boot(pdev, bar, spec.chipset, gsp_falcon, sec2_falc=
on)? },
> =20
> diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
> index 221281da1a45..f1727173bd42 100644
> --- a/drivers/gpu/nova-core/gsp.rs
> +++ b/drivers/gpu/nova-core/gsp.rs
> @@ -2,25 +2,117 @@
> =20
>  mod boot;
> =20
> +use kernel::device;
> +use kernel::dma::CoherentAllocation;
> +use kernel::dma::DmaAddress;
> +use kernel::dma_write;
> +use kernel::pci;
>  use kernel::prelude::*;
> -use kernel::ptr::Alignment;
> +use kernel::transmute::AsBytes;
> =20
>  pub(crate) use fw::{GspFwWprMeta, LibosParams};
> =20
>  mod fw;
> =20
> +use fw::LibosMemoryRegionInitArgument;
> +
>  pub(crate) const GSP_PAGE_SHIFT: usize =3D 12;
>  pub(crate) const GSP_PAGE_SIZE: usize =3D 1 << GSP_PAGE_SHIFT;
> -pub(crate) const GSP_HEAP_ALIGNMENT: Alignment =3D Alignment::new::<{ 1 =
<< 20 }>();
> +
> +/// Number of GSP pages to use in a RM log buffer.
> +const RM_LOG_BUFFER_NUM_PAGES: usize =3D 0x10;
> =20
>  /// GSP runtime data.
> -///
> -/// This is an empty pinned placeholder for now.
>  #[pin_data]
> -pub(crate) struct Gsp {}
> +pub(crate) struct Gsp {
> +    pub(crate) libos: CoherentAllocation<LibosMemoryRegionInitArgument>,
> +    loginit: LogBuffer,
> +    logintr: LogBuffer,
> +    logrm: LogBuffer,
> +}
> +
> +#[repr(C)]
> +struct PteArray<const NUM_ENTRIES: usize>([u64; NUM_ENTRIES]);

I'd just document this structure a bit as it is not obvious what it does
from the name alone.

> +
> +/// SAFETY: arrays of `u64` implement `AsBytes` and we are but a wrapper=
 around it.
> +unsafe impl<const NUM_ENTRIES: usize> AsBytes for PteArray<NUM_ENTRIES> =
{}
> +
> +impl<const NUM_PAGES: usize> PteArray<NUM_PAGES> {
> +    fn new(handle: DmaAddress) -> Result<Self> {
> +        let mut ptes =3D [0u64; NUM_PAGES];
> +        for (i, pte) in ptes.iter_mut().enumerate() {
> +            *pte =3D handle
> +                .checked_add((i as u64) << GSP_PAGE_SHIFT)
> +                .ok_or(EOVERFLOW)?;
> +        }
> +
> +        Ok(Self(ptes))
> +    }
> +}
> +
> +/// The logging buffers are byte queues that contain encoded printf-like
> +/// messages from GSP-RM.  They need to be decoded by a special applicat=
ion
> +/// that can parse the buffers.
> +///
> +/// The 'loginit' buffer contains logs from early GSP-RM init and
> +/// exception dumps.  The 'logrm' buffer contains the subsequent logs. B=
oth are
> +/// written to directly by GSP-RM and can be any multiple of GSP_PAGE_SI=
ZE.
> +///
> +/// The physical address map for the log buffer is stored in the buffer
> +/// itself, starting with offset 1. Offset 0 contains the "put" pointer =
(pp).
> +/// Initially, pp is equal to 0. If the buffer has valid logging data in=
 it,
> +/// then pp points to index into the buffer where the next logging entry=
 will
> +/// be written. Therefore, the logging data is valid if:
> +///   1 <=3D pp < sizeof(buffer)/sizeof(u64)

Maybe we should mention what happens to the address map, namely that it
gets overwritten by the buffer data and is only used for the initial
setup.

> +struct LogBuffer(CoherentAllocation<u8>);
> +
> +impl LogBuffer {
> +    fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
> +        const NUM_PAGES: usize =3D RM_LOG_BUFFER_NUM_PAGES;
> +
> +        let mut obj =3D Self(CoherentAllocation::<u8>::alloc_coherent(
> +            dev,
> +            NUM_PAGES * GSP_PAGE_SIZE,
> +            GFP_KERNEL | __GFP_ZERO,
> +        )?);
> +        let ptes =3D PteArray::<NUM_PAGES>::new(obj.0.dma_handle())?;
> +
> +        // SAFETY: `obj` has just been created and we are its sole user.
> +        unsafe {
> +            // Copy the self-mapping PTE at the expected location.
> +            obj.0
> +                .as_slice_mut(size_of::<u64>(), size_of_val(&ptes))?
> +                .copy_from_slice(ptes.as_bytes())
> +        };
> +
> +        Ok(obj)
> +    }
> +}
> =20
>  impl Gsp {
> -    pub(crate) fn new() -> impl PinInit<Self> {
> -        pin_init!(Self {})
> +    pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> Result<impl =
PinInit<Self, Error>> {
> +        let dev =3D pdev.as_ref();
> +        let libos =3D CoherentAllocation::<LibosMemoryRegionInitArgument=
>::alloc_coherent(
> +            dev,
> +            GSP_PAGE_SIZE / size_of::<LibosMemoryRegionInitArgument>(),
> +            GFP_KERNEL | __GFP_ZERO,
> +        )?;
> +
> +        // Initialise the logging structures. The OpenRM equivalents are=
 in:
> +        // _kgspInitLibosLoggingStructures (allocates memory for buffers=
)
> +        // kgspSetupLibosInitArgs_IMPL (creates pLibosInitArgs[] array)
> +        let loginit =3D LogBuffer::new(dev)?;
> +        dma_write!(libos[0] =3D LibosMemoryRegionInitArgument::new("LOGI=
NIT", &loginit.0)?)?;
> +        let logintr =3D LogBuffer::new(dev)?;
> +        dma_write!(libos[1] =3D LibosMemoryRegionInitArgument::new("LOGI=
NTR", &logintr.0)?)?;
> +        let logrm =3D LogBuffer::new(dev)?;
> +        dma_write!(libos[2] =3D LibosMemoryRegionInitArgument::new("LOGR=
M", &logrm.0)?)?;

Let's maybe add a space before each "let" statement.

> +
> +        Ok(try_pin_init!(Self {
> +            libos,
> +            loginit,
> +            logintr,
> +            logrm,
> +        }))
>      }
>  }
> diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/=
fw.rs
> index 181baa401770..c3bececc29cd 100644
> --- a/drivers/gpu/nova-core/gsp/fw.rs
> +++ b/drivers/gpu/nova-core/gsp/fw.rs
> @@ -7,15 +7,20 @@
> =20
>  use core::ops::Range;
> =20
> -use kernel::ptr::Alignable;
> +use kernel::dma::CoherentAllocation;
> +use kernel::prelude::*;
> +use kernel::ptr::{Alignable, Alignment};
>  use kernel::sizes::SZ_1M;
> +use kernel::transmute::{AsBytes, FromBytes};
> =20
>  use crate::gpu::Chipset;
> -use crate::gsp;
> =20
>  /// Dummy type to group methods related to heap parameters for running t=
he GSP firmware.
>  pub(crate) struct GspFwHeapParams(());
> =20
> +/// Minimum required alignment for the GSP heap.
> +const GSP_HEAP_ALIGNMENT: Alignment =3D Alignment::new::<{ 1 << 20 }>();
> +
>  impl GspFwHeapParams {
>      /// Returns the amount of GSP-RM heap memory used during GSP-RM boot=
 and initialization (up to
>      /// and including the first client subdevice allocation).
> @@ -29,7 +34,7 @@ fn base_rm_size(_chipset: Chipset) -> u64 {
>      /// Returns the amount of heap memory required to support a single c=
hannel allocation.
>      fn client_alloc_size() -> u64 {
>          u64::from(bindings::GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE)
> -            .align_up(gsp::GSP_HEAP_ALIGNMENT)
> +            .align_up(GSP_HEAP_ALIGNMENT)
>              .unwrap_or(u64::MAX)
>      }
> =20
> @@ -40,7 +45,7 @@ fn management_overhead(fb_size: u64) -> u64 {
> =20
>          u64::from(bindings::GSP_FW_HEAP_PARAM_SIZE_PER_GB_FB)
>              .saturating_mul(fb_size_gb)
> -            .align_up(gsp::GSP_HEAP_ALIGNMENT)
> +            .align_up(GSP_HEAP_ALIGNMENT)
>              .unwrap_or(u64::MAX)
>      }
>  }
> @@ -99,3 +104,54 @@ pub(crate) fn wpr_heap_size(&self, chipset: Chipset, =
fb_size: u64) -> u64 {
>  /// addresses of the GSP bootloader and firmware.
>  #[repr(transparent)]
>  pub(crate) struct GspFwWprMeta(bindings::GspFwWprMeta);
> +
> +/// Struct containing the arguments required to pass a memory buffer to =
the GSP
> +/// for use during initialisation.
> +///
> +/// The GSP only understands 4K pages (GSP_PAGE_SIZE), so even if the ke=
rnel is
> +/// configured for a larger page size (e.g. 64K pages), we need to give
> +/// the GSP an array of 4K pages. Since we only create physically contig=
uous
> +/// buffers the math to calculate the addresses is simple.
> +///
> +/// The buffers must be a multiple of GSP_PAGE_SIZE.  GSP-RM also curren=
tly
> +/// ignores the @kind field for LOGINIT, LOGINTR, and LOGRM, but expects=
 the
> +/// buffers to be physically contiguous anyway.
> +///
> +/// The memory allocated for the arguments must remain until the GSP sen=
ds the
> +/// init_done RPC.
> +#[repr(transparent)]
> +pub(crate) struct LibosMemoryRegionInitArgument(bindings::LibosMemoryReg=
ionInitArgument);
> +
> +// SAFETY: Padding is explicit and will not contain uninitialized data.
> +unsafe impl AsBytes for LibosMemoryRegionInitArgument {}
> +
> +// SAFETY: This struct only contains integer types for which all bit pat=
terns
> +// are valid.
> +unsafe impl FromBytes for LibosMemoryRegionInitArgument {}
> +
> +impl LibosMemoryRegionInitArgument {
> +    pub(crate) fn new<A: AsBytes + FromBytes>(
> +        name: &'static str,
> +        obj: &CoherentAllocation<A>,
> +    ) -> Result<Self> {
> +        /// Generates the `ID8` identifier required for some GSP objects=
.
> +        fn id8(name: &str) -> u64 {
> +            let mut bytes =3D [0u8; core::mem::size_of::<u64>()];
> +
> +            for (c, b) in name.bytes().rev().zip(&mut bytes) {
> +                *b =3D c;
> +            }
> +
> +            u64::from_ne_bytes(bytes)
> +        }
> +
> +        Ok(Self(bindings::LibosMemoryRegionInitArgument {
> +            id8: id8(name),
> +            pa: obj.dma_handle(),
> +            size: obj.size() as u64,
> +            kind: bindings::LibosMemoryRegionKind_LIBOS_MEMORY_REGION_CO=
NTIGUOUS.try_into()?,
> +            loc: bindings::LibosMemoryRegionLoc_LIBOS_MEMORY_REGION_LOC_=
SYSMEM.try_into()?,

The unneeded runtime check is a bit unfortunate, and its removal would
allow us to make this method non-fallible, but I cannot find a good
alternative that also doesn't clutter the code. Can't wait for const
traits methods! :)

