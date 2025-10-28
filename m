Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C74E1C13463
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 08:23:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 873B310E05C;
	Tue, 28 Oct 2025 07:23:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MfKmAd71";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013058.outbound.protection.outlook.com
 [40.93.196.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE42210E05C;
 Tue, 28 Oct 2025 07:23:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e2vqLcSCzIF4vBsRHaG17iDV8gmlRE+vibhibKxU2wLH20A7XId0r0IOlek7y/UA6aMnx+GIUdc3AiRwzj1SKjKTcKkFwi0wDbcuu65cEejd74a60AB6sxhWisJEAabnJENIgf/TBVSiWb66MBDKHYYUbPc2sGtIDKmZ4eyEIX5gb1O8MPfI9/tuXpN5T9gY7k+fzAsD+MB6twyUa5m04pLvftQbsolw0KbfbCQVOisJyG6RcD4CScCKtTrkk74vWjH86N3oWzHMim5ibfd6pMYv+AhoVJ5DyEdhUBBTitgFhuHYAmjPfR36O6iNy70gqIQ2jA+P7jeWNyfHEOTEnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QB9nlyoJoOFpZJNtzzNCW0/JYG3FF5T+DJUmB/vEpLk=;
 b=mmAdXGW/G+ZGgO3mzJFdiLpPSThQPPCP2mkmgshT//rOA8RwC1YRc0jr5AQRdSN5aqaNmRZGRpikYT1CkK7KTjzkwaloUhS7YvV9tUYKkIGR2fxZCyqd5xxQApMTMkKu8lZu9ym3071vp2GhPqckTsmZ4LgRsrjGvrj+E/WVGB3UeD0k6jJJAe1ohyOFnx61s1vYaYMP7BXb8eU2AKy0pwYaXKcSxuCcdgcV2aqx6ZN+G+RENiG8g4DMWQxslGehbdtho1OJTE8Lo6GebtNLdedujoY3BtgpVM4UEDcdziZxJlFayiSRGGh0xs6nM3t/IiG0dHh9gMizBLAaslTe3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QB9nlyoJoOFpZJNtzzNCW0/JYG3FF5T+DJUmB/vEpLk=;
 b=MfKmAd71aOMLyKbNc1BhPma8wP4OeQZXx8/YXqOsCZT6/SGaXlvzfazlzc/H/bhb1Z8AZmkUEabkH9ikvH07pPpcgkxLrqfLa8FBHbUoTIskz6q2kC3IVp7TRhzsp600Al+SP0LLZwIhqwcTxbDv28y7KIBBJPlxpthePAOiO2Kby6DB2Q0PSh4xxEcsTV/8t63CxYZrJM2dDinpFD75YzD2hBlOjJ4klBbI8oCQyOOUue4uqB1hKyKbFxJpi8MBYS5hgVvfamfoua2fmLqyXHYAfDzPjh2SIcDwO6ipReKRpTlVQ4XEW8TpOPSEHQK15T3ztfSwSwdGhphTkrDzDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB9196.namprd12.prod.outlook.com (2603:10b6:610:197::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.15; Tue, 28 Oct
 2025 07:23:17 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 07:23:17 +0000
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Oct 2025 16:23:13 +0900
Message-Id: <DDTRWUSQDWJC.1UPRDDOSLXN5F@nvidia.com>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer"
 <epeer@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Danilo Krummrich" <dakr@kernel.org>,
 "Nouveau" <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v2 3/7] gpu: nova-core: vbios: add conversion to u8 for
 BiosImageType
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20251027-nova-as-v2-0-a26bd1d067a4@nvidia.com>
 <20251027-nova-as-v2-3-a26bd1d067a4@nvidia.com>
 <20251027173756.GA3188703@joelbox2>
In-Reply-To: <20251027173756.GA3188703@joelbox2>
X-ClientProxiedBy: SG2PR01CA0151.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::31) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB9196:EE_
X-MS-Office365-Filtering-Correlation-Id: 24b3a0b7-e602-4545-19e8-08de15f2dd51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eWgxNnpnWlFoVVdQTHdOYVpyQnUvZ0NEdDVBdXV4L01GMUF2YU1KTjl2amtm?=
 =?utf-8?B?aDNIV0p5bnRIQkNpbTluZVdsNUVhSEg0aEZDWTdtK2w5QlFLTmFWZDE5WjdS?=
 =?utf-8?B?ZEVTOEhXV0kxdlQzdE41ZlpDNlIxcHdjZlN3UjdtQXpscXN1ckxCaHp3bUh3?=
 =?utf-8?B?WFlFM2xDd3JCZ3BFb3ZVY1ZZTlhEUjBxMEJQRjZSWVhSRkMwRjdreTc5MVBD?=
 =?utf-8?B?cHVEWG9Wc2V1OTFydnNwbUxidlkwNUVMNWJQTEExL0dZNnVaWkJVaEs4VXFF?=
 =?utf-8?B?RXcrRUl4NE5DODJFcWt0RHk0cHhuYTdtbm5QN0QxZ2FSWWhqeEU3Y3p6ZVJH?=
 =?utf-8?B?S1Y4Q3VqcUZoc25VTVUrMG45ZjlyT1ZwR3FsbTdDNkhYa0Jibno0S2pGQ29u?=
 =?utf-8?B?cTJlY1c4bmJjdVdJTk9JYWt0TFY3QWFLNUc0Z0d0VzhzR00zSmx3OC95OGVT?=
 =?utf-8?B?dVJ2K1VtU0NtYTVENDZkQUNrd2VJTkdhWktLRXZHTm5ubWZIZlJKb2JOZkor?=
 =?utf-8?B?b25XaWlrN2R5VFpDY1JTWHUrMFA4ZUVWWjFUOUhaNnZkWVVIbk1LWEswTWlK?=
 =?utf-8?B?QXMzclNOVUVwYVBYTEY4WXJOSEt5VVUxRnZZR25vN2M1Uk52b1R6OUpsYkdY?=
 =?utf-8?B?ZjVjWkNpZnIxdDk5cHEyMFBEQUxDS3kyUnptTTN5ampKaXBMNFhxVWZBU0lN?=
 =?utf-8?B?aHVZa21udlA2dDZnSU5MVVkrOWJlUGRzZWJ0U3JFR0E1VkFTU0l6WXpFWXNZ?=
 =?utf-8?B?bi9RS0kyZlNJV0N6dTJzQUIreE1vYyt0bmlTSWZYVlFJTGgzV05HOHROWFlV?=
 =?utf-8?B?SEV3cVY0SVp4L1dkVmVXVGdmK3dXR1AvdmliSlVEYmllalNtS21vRjg0WlB2?=
 =?utf-8?B?dUZUZ1VFcmZ1cEpyK05GeEdIQ1BJTUNBcDV6S1lTUjNETWtTV1E2OUtCeUtr?=
 =?utf-8?B?K1JtMlRVTm9wOWdaeWk0MUhiVk5LM3NhS1Y0QWFNK01ESThWSHhpRGtDbkZ4?=
 =?utf-8?B?Mjh5RGNVS3M4RjhiY0xzNy94RXBlc3lhQkRrbjJYYTk5QUlOUzV1MFc2SGNn?=
 =?utf-8?B?U3NPc1MrV1d4VUFnUVlDTzBzME43NXNPSGJUVW94UHgwWW1iZThPcENnWmRy?=
 =?utf-8?B?L2FzQkV4RWJ0ZWoyQ1VDRUJxVFkzcy94ZzRPM0pOMnBLRDJSVFY3Y2oxbGk0?=
 =?utf-8?B?dXRlc1U1UEtsekZYUFdmMVRBODFuQmdpT2JLS215SUtSRVZqK3lqMkxsWVYw?=
 =?utf-8?B?N085V01xTW44N3hENnhaclkyM3ZGZHVuZE50R2xlUTRNZERXYWhrU09qWVBS?=
 =?utf-8?B?V29zNlJaNExaT1B6bGg5NHNjTnIxMVJnMWxsZnVWZjl1ZENDQUxMcVAwTGpn?=
 =?utf-8?B?Y2pFbEhJTVJ4ZE94b0srNFp5SWxTbU5ua3preTV3MGs0VXZSenlGMXhxdVNn?=
 =?utf-8?B?emQ4N0xkVGQ5cEVETFNzZkdKTmdiTHlOVk1VZ3VhUWJCd052UGU5UjJ0ekU2?=
 =?utf-8?B?UUdDbkJpUHZxUnBuL01Rdm0rcW92Nlo2YWxSa2kzcnNoYmhjSU04VFVJcjhG?=
 =?utf-8?B?UjI4aHArNmo5QkZOeEdUNTc3TFBvS0Nudm9HbVJwdGFGWVRtUXlPNXZoclll?=
 =?utf-8?B?Ni9WbTZMZThPWkhreXpRM0ZPcXNmNUdUemxnN3ZFeUtrMlNGV1QxZFFQR2Jp?=
 =?utf-8?B?aEQzWjk1L096UEI5cnJ6WjVoelJmTms3ejQyaHliQlhaYjhEMTlVeHFEMi9H?=
 =?utf-8?B?V1NGY2QzQVN5aWdpVWRGNFU3SXlISGZ4d3pNK0ZMbkZNWE93cmw1MEpCOHF0?=
 =?utf-8?B?U1ZHV2hxc0ZiMHd1UnNUSFphT1lub0UwbnZKZ3QyYkI3bjVxWXRyYnd1MWFm?=
 =?utf-8?B?Tmk5UVBmdldFeml1S0dHTklVV3hGa0ZKd25KNHBvRnd0U3R1Mjh0b2FzQXRo?=
 =?utf-8?Q?4i//ig/lF94yb6osi6Mbm7dj1rs0gehG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGtuRWVCdngrYVlsOFRMSENOb201NE5iaFYzSHViN1VkanNZcVZHYXN5OEJk?=
 =?utf-8?B?NTFkdldaVi9BaEZlODJhc2J6QkQwMkl5WkNDWFJ6OE85TVRibklUUTdZbGti?=
 =?utf-8?B?emY5cU5iODVPaFdEZ3Nwa21vVG5aWURBZlVONE8xaHJYZVAzODVzc0pVWmdM?=
 =?utf-8?B?d1FnRFBwbUdvRkV4NlJDY0oxS2EzMlJEaFRYUjVXRTBSWmVtcXdPaE9aU2Zh?=
 =?utf-8?B?YklIQWdVL3BTdm5HcllUUDJCdjl0WGw5amwwbFNjbkNXRjNnR3Ixcjh5NGNi?=
 =?utf-8?B?ZzZRWURZbjlDQUJsLzh2N0ZmWlU3QUl1MEcrMDlXaURGcEl2SnJnZHFpOFJ1?=
 =?utf-8?B?NTlRMmdJbHFNTjhRdW5FVUUyb3ovR2JuSWRJY0Rac0c0NGNLQlQzTG9VNnJJ?=
 =?utf-8?B?dDJsa0dFdlFHOG1yL2hoaVUyZldrby9USmN4SUFBMVZBWGNIM0lqS2lsNHhN?=
 =?utf-8?B?dWpTeFRMcUptWmFaY0o2WURweVFvWnZHMGF5QnpSeTJ4WE5GYWJ6QU56VDlo?=
 =?utf-8?B?UTBKSzNqbVZTaGZMV1VMSnI1RE9INE5sdC9xOXBEN3JHN28xa1NYMmd6S201?=
 =?utf-8?B?MFFQZWZtalJKRzFGSlJOMTJISWEyVk9RUVliWUZsUGJGUEVrK1pId3FyaWk4?=
 =?utf-8?B?U0tLQi9pWEkvb2RCdmhPYktWdmo4Yytra2VFRUZtUGE1WUNUemppR3lsbnpK?=
 =?utf-8?B?cEYyTTloUWFJMEltT3lKRnVzaFN0bDRKYW1VSGxWaVNkQlNxdEw2alkzTjI3?=
 =?utf-8?B?L1FvUUtGUmZYWHZpQkQrRW9YS25FQ1h3NWkzQWJxNjZkb3Y3dTJDajMvbG8z?=
 =?utf-8?B?bXBUdVh5L3FwMndMMmhkeGtYbHhaMUViVm4wa012dGxySmxjaDJybEtWak45?=
 =?utf-8?B?Y25GL1pyZitLUzZkMEM3NnZ6Sk12S1l5QW93d3p4ZENLUDdqdVpBYStpMFlk?=
 =?utf-8?B?eE0yOVBEa3k2aEdrcC8xY0Y4NWhLQWVMeDJFV0Y2bHpDVDZoRW1CWVBlU2xE?=
 =?utf-8?B?dm9TTlZJWSsyRTZacGVWOU5tZzFvWkFhSXhJY0hpVGVnd1JxbXlXb1RPbmEv?=
 =?utf-8?B?QklFcHkyS245aVlMd3hSanJFNVlSUkg3bXNpQXhjUmJtdGx5cHBIRERqTnpT?=
 =?utf-8?B?WW1VYUlwV2Mwd0RkdXhVNllmNHlQVktpeGhsdStpVTRZNFFOc3RqQm14SWc5?=
 =?utf-8?B?RjJUdUdIMk95VkdYdXJweFJLWEM2Z0xtd0UvOVdudTJEOFpBQ3hOeHJ5V0to?=
 =?utf-8?B?OWU3MVhnMEdhclc5MFdyR280U2k2cjJMZ1hYSEpxeXNXWFJLTXlxaVNwNDAy?=
 =?utf-8?B?OFk3cGJjOFl6eGYycmluSzRWSUl1UFRvb1RLeVFDUWNNTmlqUjFlMXY5Slh5?=
 =?utf-8?B?MEpYSTRNZWJlZ3ZUNkJBMGhRN3JhNmtJbEtaRmUxd2liTGFMWXlnb1BsZTZZ?=
 =?utf-8?B?RnBiYXNURmRlV0FiLzZqaHUrVlkybTRVbXAvNFQ2Mzh1aTRMaEl2enlSOVM5?=
 =?utf-8?B?N3JUNEJ2bzVmYldnZEx2UTJQNnI2SUFPV1lMTU9tRmJBVG1LWXhjTjd0a1cy?=
 =?utf-8?B?WmNZMXFVbmxlMkhXUTJMV21CajRMSXc1SHhoSHQzWTlqaUFaZUdaUnkxemh0?=
 =?utf-8?B?dVlkL3E5ZzZteGhxMkdCUEtnN1d0VEdvWUI5ZGx3RmRJNzE1MUpXZ2h4TmhY?=
 =?utf-8?B?MWpDVEpObzdLY3VEaVd5dUM0eXlqVmtPVEVKZ0Y3WHFkUGJOODFuQ01pYTRh?=
 =?utf-8?B?NWxPQ3dKWmpLZnFKODY2aFUvYzd4Qzd4MmtQWEJNOU83R1BrTnBhbGpQYm4z?=
 =?utf-8?B?eGNvVkxENTZFeXp0OHFEUThGT0QzWEhSc3ZmeEZTTFpvTXlpL3NtQ0pwcG9U?=
 =?utf-8?B?MTVlc0tuVmhpMEsrcVRtUXUzNHA1RDhQdWt4RXFvb1dQTDNhTlJTZnk0NkJL?=
 =?utf-8?B?U1J1c2p2bVppMUx4RFpEa0FCbXZWdWxCbnNFbGhVVG1QRE0zWG05RXBsbDVi?=
 =?utf-8?B?NW00R3oxUDdrZ2U4SG9PaVJhUzhSNVpIdGxKNTd4ZHI0amFlZWpuWE9nRjJK?=
 =?utf-8?B?cEtLa3F6b3JGWndkanUzbVpOR082YjlOaEwxYmJjQkdoZ1NKaGJsd1Jvcm9H?=
 =?utf-8?Q?ArW1MqGZLaAGgqtmUmvdn4226?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24b3a0b7-e602-4545-19e8-08de15f2dd51
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 07:23:17.6686 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kD9Y5Xxyh9DsFc1xsqiP0WPqeEt8eGPkeez2GLeH/ZfEoc4k3lWBAHQ8Du9Aq4QdHCEl+0GE79T/SqJlxidEtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9196
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

On Tue Oct 28, 2025 at 2:37 AM JST, Joel Fernandes wrote:
> Hello Alex,
>
> On Mon, Oct 27, 2025 at 09:54:43PM +0900, Alexandre Courbot wrote:
>> Since `BiosImageType` is `repr(u8)`, if can safely be converted into a
>> `u8` but this is not obvious when doing this in the code.
>>=20
>> Instead, implement `From<BiosImageType>` for `u8` so the cast can be
>> done in a single place, with a justifying comment.
>>=20
>> Acked-by: Danilo Krummrich <dakr@kernel.org>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/vbios.rs | 9 ++++++++-
>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbio=
s.rs
>> index dbe0d6e4a015..a521c0a4df0f 100644
>> --- a/drivers/gpu/nova-core/vbios.rs
>> +++ b/drivers/gpu/nova-core/vbios.rs
>> @@ -50,6 +50,13 @@ fn try_from(code: u8) -> Result<Self> {
>>      }
>>  }
>> =20
>> +impl From<BiosImageType> for u8 {
>> +    fn from(value: BiosImageType) -> Self {
>> +        // `BiosImageType` is `repr(u8)` and thus convertible without l=
oss.
>> +        value as u8
>> +    }
>> +}
>> +
>>  // PMU lookup table entry types. Used to locate PMU table entries
>>  // in the Fwsec image, corresponding to falcon ucodes.
>>  #[expect(dead_code)]
>> @@ -711,7 +718,7 @@ fn image_type(&self) -> Result<BiosImageType> {
>>      fn is_last(&self) -> bool {
>>          // For NBSI images (type =3D=3D 0x70), return true as they're
>>          // considered the last image
>> -        if self.pcir.code_type =3D=3D BiosImageType::Nbsi as u8 {
>> +        if self.pcir.code_type =3D=3D BiosImageType::Nbsi.into() {
>
> I strongly prefer u8::from(BiosImageType::Nbsi) here so there is no loss =
of
> readability of the type. Can we please use ::from()?

What benefit do we get from knowing the representing type of
BiosImageType? We are only interested in knowing whether the two values
are equal or not.

But you have a point that `::from()` is generally easier to read, only I
would apply it on the left value:

  if BiosImageType::try_from(self.pcir.code_type) =3D=3D Ok(BiosImageType::=
Nbsi)

or reusing the already existing code:

  if self.image_type() =3D=3D Ok(BiosImageType::Nbsi)

That reads even more naturally imho.
