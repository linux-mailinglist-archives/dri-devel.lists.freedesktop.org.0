Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A96ACC83A
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 15:48:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B5210E5F2;
	Tue,  3 Jun 2025 13:48:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="B3PzIHnI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2048.outbound.protection.outlook.com [40.107.237.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1740310E5F2;
 Tue,  3 Jun 2025 13:48:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aUkXmZ3dzhHVkonuNpRZvTYXfWymXB639V8AVouSUKTeQ/nlooTexffi7j9E9zyFhWLoLGJX0oPoKiTr0qEURNEtbBvChyuTGHB0eM9wykKTqZ3tcqlZyTa8ae0JZAwerR6UG9Tfy0fKFM2EXt9f+bqZkbp2OoRzHfIzlfjr6ShEQTIpcRspfl7hk9GaIfdjRTeJ46V5JbaM4aJ8o8cZaoKF79l8F0dtDeGjuqOzAt4p92hsKbeuz0XWGvo/mrSh1Cl6dWeQotoTp8M0IEe4F+WWDLKXzKamaqKcRWIE55jjHuVj23gglSxKbSum+l9VcjuloaDZRmahTiMeyq9dQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bLya/jV1EVJAFlMFwK2WCcxRAkWD5sP4a/Onl1y3Bbw=;
 b=UHC33/e1dT810bDaP05O+KlVF2/o2SMfrt+8OUlzbmJPRC93mFQ5RGCC2aXrZvHy+17V2KHohZn/TljY5afc3NZHb4G5qjE8UUQl1jCnbhPmxblk0R6QRRN8Ej+zlLGaQykwvlQ4jz1nVHYIThYmsEWChI40YASzL0azbMSido57MCC6EiWCtslyYr3/m8V7ku2a++YYw+VMFdDuETV59X+b6N7237sg+OZsUG26QsoiA7rWDAQYMJVAAuKWoHhpmzPQnPXpFbjaKRgJfB0G7TjzZaMfNdWiLFTNSejXu0dc7KlLSb587uW69BASyev40kzTKWGo/VBkctp44qJMdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bLya/jV1EVJAFlMFwK2WCcxRAkWD5sP4a/Onl1y3Bbw=;
 b=B3PzIHnIfgDOwDDYnUv2b6aPvtgQfIFyDCEnCkRmyCtbRVnnSbe9wRN0djsJl8tx7a0dTNZrvdR3gEOs0sca2WCV9dqdWKODpfmgsPvINFbM3OU+N9amhL9hibkIH2xcmp5G/vchMDoXj8BOOn66JKQfsfp7Z8PS8lk1axob6Ol5wq+M31eq1OWxwpiS+gnoQLLFa8NeeOCIara+xXFYm+RbmE2u7zLLCbovPuatb4YhakhhWdew0DM5pGqVJ20UAlgNCwgNeibnv5Hazs47QPWeQB0amJhuJQs/kQ/AcC2+sy/PvgHMXpUYvCxSVguWPr20DLEYhwaG8B2Qi8cLmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS0PR12MB8563.namprd12.prod.outlook.com (2603:10b6:8:165::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 13:47:56 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8769.025; Tue, 3 Jun 2025
 13:47:55 +0000
Message-ID: <2f03e11d-3621-4314-a232-611a5fd9ffcb@nvidia.com>
Date: Tue, 3 Jun 2025 09:47:52 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 16/20] nova-core: Add support for VBIOS ucode
 extraction for boot
To: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Shirish Baskaran <sbaskaran@nvidia.com>
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-16-05dfd4f39479@nvidia.com> <aD2oROKpaU8Bmyj-@pollux>
 <20250602151506.GA779285@joelnvbox> <DACQW908WCLA.2JHRLQ3V18FPD@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DACQW908WCLA.2JHRLQ3V18FPD@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN0PR02CA0015.namprd02.prod.outlook.com
 (2603:10b6:408:e4::20) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS0PR12MB8563:EE_
X-MS-Office365-Filtering-Correlation-Id: fff92e27-17da-47bb-2088-08dda2a53e5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dFVrbU5qVHlDSFp1d3k2ZkFlL3gxNCtkT1pmdjJCb0tpRC9iWU5rRHN0Z3NT?=
 =?utf-8?B?MzF6Z2M3ZEJZVFoxbnREb3lBaUUrREc2Q1g3Sjd4QWdybDdMZlFxY0pMS3hK?=
 =?utf-8?B?ZG1MNFBmU0dXeldsNXk3S2lIMzMyQVdPU00wZFlwS01OclNQaEw2WThCWXJ4?=
 =?utf-8?B?SU0xU3RvS0t4WitLODRrT2l3eUpMc3pVQTdVWWNLQk9haWlLZXFoQi91VmFt?=
 =?utf-8?B?cjhVSEVITkpKQ3c1cGpVcWdRaDBSVmY5cHNzbG1ySVpTVWt6QldzWXpMNWJZ?=
 =?utf-8?B?eFlmbjdBT29NL2NIQlJmZFgvd3lmWTVNYVlBZnFNWUNrUjgyTGdzVktoRklJ?=
 =?utf-8?B?WmlRU1VWdmJ0UkQwUjU5SE1EQ0d2KzNMSCt4ZE9MczZma2x0aHdTTUVhTlYw?=
 =?utf-8?B?RzRqWm9heXNPUVVEZlczVldiMFljM1dnQm5YS2phb1RVRHNOLzlBbjViTFFJ?=
 =?utf-8?B?dzVtNmZiSVpES3BleVQ2VlpRdndiZkx4RTVRWFBaYUZMMlBDUUkwbWt0MWZx?=
 =?utf-8?B?cnByaFJxSUN5MzQ5RWhqekZaVCtZcGpXMFZpb1ZjTmJXVWpQR3NZbitQbWFH?=
 =?utf-8?B?Z09mM245VUdOZXRXSHdTMTB1Q2t2YkQyNVozVER3M3ltLzhmQ0xpd3lsRkVM?=
 =?utf-8?B?bHA1dVpDejZqQXRqQjIvZjRSWWVpU1Y3dExSSUVFTGJ5aFlST3ZYaWszRmtW?=
 =?utf-8?B?MktVem5GOFlYVUJRYUg5QWRlYnVIUkRoSDg2M3FMWGVlUDFpYUhIZGQyeDdl?=
 =?utf-8?B?eWxpQ25sbjZMUzN5QUZ2cXp3RDlOcXZ1T0hMR053eVA4dXJUMkJqYjdaVFRr?=
 =?utf-8?B?NHpBU1hXZEhZM3I5b2xOQTVTelFudHdJUmhhN2pOYmhia2Z0OWF2cmVBY1RP?=
 =?utf-8?B?ck5mdXRpN3E0WkpwY2JMMWpvZ2dnME5KQUwzUDY4UWU4OS91ZmxnRDhyVFpx?=
 =?utf-8?B?Z2ZadlVSVW5EREdEN2tES2xtaEQ3SS8rdVMzVTUwbU5yaHgzS1o4N2UwNEto?=
 =?utf-8?B?VDlLMVQ0SzZzN2t0anMxdFl6aDRCTjBlOW5YTVFCREpGY1M1N242M3I3cXNz?=
 =?utf-8?B?VDZZaHdwaVdRT1QxSjA4VHNBV0xvcHQxWm9Qb3FzZnFyMllNdU85dnBjR1VF?=
 =?utf-8?B?RWhNOHBMaUViUUQyVm1IMUFhVWJnZ2V4TWx1WXgwWmpvZXM2cERIVDFpZDJF?=
 =?utf-8?B?MjZ6R0FlREQyOGNKZDBvK2t6ZGRteE1Ud0JvQVBvY1J5bUVIU0QvQWt2WE5D?=
 =?utf-8?B?eGJMdS8zS3czNGpFd1VmWWxoOFZreFNKVGZ2L0QzQWdmVXlYSkJsUW9ZMG10?=
 =?utf-8?B?ZzcvNDBPQ0Y1b2tBcFBMaDNLZ1ZRL2I3Yy9aRTBGQkRyaW5aNjZWL1R1eVMw?=
 =?utf-8?B?ZVZ5S3VTZnkrV2NncDdsMkRlWkEraFdHWXc3QUZrMm5IUGErYmZhcGVLd0FL?=
 =?utf-8?B?d0o1aUZCdGdqTWEwb3FMcVQ2TnJZbWpOUWIxRmkyVWZyb3ZtUFRzcXVYVHI3?=
 =?utf-8?B?enhCWDY2QUNyQzZxckh2bWo0eEVDU2Q4U3E4eE5HWm9oNCtCa3JCYUZuZzJr?=
 =?utf-8?B?RG9STWhsb21vTzVzbTN0VDVKcDgxTSt2YkxUbU1PQUFQZ1d0K2ZSTG4vcVg4?=
 =?utf-8?B?R1FUVXJLTmR0NnlxaWkrSzFEM3ZLUDZBMkc0ZkM0eUx0NzlMWWpxeWNQY3Ri?=
 =?utf-8?B?VFpQSUl6RXBqTXh0RDBJejdKekVmMHk4MC9xNzY4eGh1K3Jrby9BbXRFcFRY?=
 =?utf-8?B?MXBUWStQSkp0WlM0MWRvelZBVVBLUEczUkwvMlFqRzJKKzQrcjBYUHhsL3p6?=
 =?utf-8?B?RWtoMnF2Sm5BMmhTNjV4aG93cTUwNks4YjBpZmlKOEFkVmdiRXBjamhXQjJl?=
 =?utf-8?B?OVcrbDJLNXoyQllLLytyRDVhckp4VzZLOVBROS9VWGRiekN0TjZwUTVxQ2p4?=
 =?utf-8?Q?7TobmbwO6MU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cS9CbDNycks2ZmsyL2p0M3U5OTI0ZFpUZGZtNDk4TWFzczVGS0ZrWE81QXQr?=
 =?utf-8?B?bEFtSzR2MXJRN2cyZ2Q5dHlmcksza0JYU2hjbzh6SFR3ZDRQbDNxSFhROE9B?=
 =?utf-8?B?cktpeEN6UzFpbGptdzJWbFd4UlZKWXY2eFNqeVhrS2V0VndXK0RTaW9iTnQ4?=
 =?utf-8?B?NGRaRG4wUGcxSUF4Tm05ZVFNbVVXdXJ2T09iQ3BYMmlYNG9pNk01UEFhYS9J?=
 =?utf-8?B?bERmUkRUT2gxdWZEcDM2SVF0VWtLa2oxeHZraGRUQU1NSFRxK2YrcDQ4bzFZ?=
 =?utf-8?B?UFA4S0RJTVhhbW1wQWNFeDFFeGIvVC9tL21PRjQvYjN2WVo1K3NsQk1nRmN2?=
 =?utf-8?B?Q042MTRuL0t6TDk1TTNWQk5vR1Bac2ZXdkRvREVGLzRwR3E4anlEN01OVURU?=
 =?utf-8?B?V1R6bE1xTFlOcnNqWXlKa0k3ZVcrMzBSSCtqdVB5ci83OXd5ckpaSDlCSzFq?=
 =?utf-8?B?dVJkRUdCZW5nYk1TSis0S0dpZHdDMkJnWiszVGEvOVlpNlp1bURzMDhUMGZN?=
 =?utf-8?B?Z3hTYWl0T09Cd0J5M21Hdnpja1VaZnYwQkJuU05Qd21vRFMzU0NlVGYxYlNx?=
 =?utf-8?B?WE1mdGVWVXRYREdDcVZBN1V5M3JXUnJSWUo3WXFJRGUxOFMwZTJXNlFqMnNn?=
 =?utf-8?B?dTByYUhmT2QxcGludFI0aElnSG1WMExFTy9aMWhRK3FNRk9ENzNuSUdNSXhy?=
 =?utf-8?B?aDE5dHpaSTZVRUFYaktNcW11TWVFZDIzTVFVc2ZPekZsUExKK3U0elVFVkhm?=
 =?utf-8?B?NXRhSmdVVFRPUmF4eS85OTArTzdIUXdQWDBCdnR0VlR4SjRMcm5kQkZiYnFE?=
 =?utf-8?B?ZVpEaFcxcXRFVW9FS0R0dlFIUk9SOTdja1ZwekNlUk5ZbXFiQzdGbmJLT0Va?=
 =?utf-8?B?dzArazNQbXg2a1RNQ2hyWk1iYjlNei9mQ2JCdkRVd2ZLNmI2SU1EbnVJRi9I?=
 =?utf-8?B?YlQySGxQbVdtVHNqalVhdU42OFVzTmk2V0p5TlBINXdzU2Z0TzVpSXlMU1ZX?=
 =?utf-8?B?OXdzc3pjdFM5aE9JRjM3VXJrcDB6c0hKM0NUR3hWR3lIRXc2SVBzZDdKNnRZ?=
 =?utf-8?B?Y1NwOEdzOGo5OXlpUFVSR3ZhMi9qMmJnZDRUWDBNKzhaeDlBWDV6TU1FV0N6?=
 =?utf-8?B?S25MWE85MFpLRy9la2hJVkc5bDZmdkxNZFlyelJ5dTRBcmpwZnhscFBFa3BP?=
 =?utf-8?B?VHV5aXd3RjBZZkl1SzNYWjRrRU41TkxDbkhZQkpnWFpYMElXdXhHWTdlamxh?=
 =?utf-8?B?KzB6MXJob3R5YTVTclZBaVFRekVmei9XcVJpQVAyVm9FaHM2UDNUakg0U3hL?=
 =?utf-8?B?NC9ueFkvS2FWVlJYMDdYbWJHbjVJbXRDcnRRWGVXV1VYeTVqTksvRUp5VDhX?=
 =?utf-8?B?aG9mVmV0ZSt2dkY0VW44bHJxdDdSczlxQnBrQTU4Sk0yZlcwVFVCbEVwcERv?=
 =?utf-8?B?alJkRWhKRi9XQ1pWYnJyTnp2SmNFMUJYR0pGa3pITm5rYklFT1RuMmIzSHNX?=
 =?utf-8?B?Vll0ZkJKUU9jbzBCNVVpbVo2RzQ0dHVhQ1Y2cHJCamp3YjA0Rlc3TXhldnFi?=
 =?utf-8?B?a3YyQnRYZlhIUlZDdUZlaDNQMXpaSjhIWDU1OVdVZHNMMXl6eWtYcTNMNnR5?=
 =?utf-8?B?M1NRbCtRU0src0RxM0lqRURkVnNLTTRjUGF2T240bDNET2FLYXVaS2UxR1cw?=
 =?utf-8?B?T3I4aDNnR3NVVWU3d2RaZGRhYTZDZld5dnZQZWtPV1ZGNTRhdmtPOHp2bG53?=
 =?utf-8?B?VnVaam9xdERzMzBNbzFJZ1lTbFAvZlBJSTJveGFXdjZ3NU51UU5YWUo5N3Zj?=
 =?utf-8?B?UWZZV1RXelAzVXdhSWlLT0RRZEF1YytZN2N2OUVOQUs1WVZ2QW1pYVk5Um0x?=
 =?utf-8?B?cG55cklnMW9MbHNSaG5oTkwvQVRyVVpGWDNrT216dXdCSHVzUE1aQTN4VkhN?=
 =?utf-8?B?dXVvQmdmU09vUW5YYXZxY3VmRkhBeTZadVFLMm9lU3pxRG5ZS3h6QnZEbXFl?=
 =?utf-8?B?ZDQrcGkwUXBWTTFwQU9xb09JSUVWNEh5aTAvaGpxaWxUMWxNdWZuNFY2Zlh6?=
 =?utf-8?B?RnVZTFZ5MVZ3NVdkL00zSlNmdHlJRjMvQm5LTXRDNTg1R0xCaWVIU05FdUFM?=
 =?utf-8?B?b0xxbk1HSjRpdE41QXZRN1hVZ3JLZjZTbjJsT040b3lmY2FvYkJTZUlVYmRl?=
 =?utf-8?B?VHc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fff92e27-17da-47bb-2088-08dda2a53e5b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 13:47:55.7711 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 11GIuKz9n3e8k6JYGFt/C/95X8PbQXTkmjfM4UA2wfgjctOVvaqZ1KD/SlTW+IJ1XgsP1lb1daPtF0fjGxTyYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8563
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



On 6/3/2025 4:12 AM, Alexandre Courbot wrote:
> On Tue Jun 3, 2025 at 12:15 AM JST, Joel Fernandes wrote:
>> On Mon, Jun 02, 2025 at 03:33:56PM +0200, Danilo Krummrich wrote:
>>> On Wed, May 21, 2025 at 03:45:11PM +0900, Alexandre Courbot wrote:
>>>> +impl Vbios {
>>>
>>> <snip>
>>>
>>>> +    pub(crate) fn fwsec_header(&self, pdev: &device::Device) -> Result<&FalconUCodeDescV3> {
>>>> +        self.fwsec_image.fwsec_header(pdev)
>>>> +    }
>>>> +
>>>> +    pub(crate) fn fwsec_ucode(&self, pdev: &device::Device) -> Result<&[u8]> {
>>>> +        self.fwsec_image.fwsec_ucode(pdev, self.fwsec_header(pdev)?)
>>>> +    }
>>>> +
>>>> +    pub(crate) fn fwsec_sigs(&self, pdev: &device::Device) -> Result<&[u8]> {
>>>> +        self.fwsec_image.fwsec_sigs(pdev, self.fwsec_header(pdev)?)
>>>> +    }
>>>
>>> Can't we just implement Deref here? Why do we need this indirection?
>>
>> We could, but it seems weird to deref a Vbios struct to an FwsecBiosImage
>> struct. Conceptually a Vbios is a collection of things and it could have
>> future extensions to its struct.
> 
> Would it then make sense to make `FwSecBiosImage` public, add an `fn
> fwsec_image(&self) -> &FwSecBiosImage` method and have the caller call
> its methods directly (maybe renamed to `header`, `ucode` and `sigs`)?

Yeah, that seems better. Danilo, you're good with that idea too?

If yes, I can just do it that way (with suggestion attribution to Alex).

Thanks.


