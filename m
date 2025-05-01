Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA3CAA5ECD
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 14:59:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B0AD10E844;
	Thu,  1 May 2025 12:59:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Wu3elCVA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2064.outbound.protection.outlook.com [40.107.236.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0F3D10E845;
 Thu,  1 May 2025 12:59:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uv+1GOkeYBBvlbfLV0V/zYIlHi3TWZO13gq8Mbgqz9uG/Q/V3hAmf5VKDcSquwV67L840QT8Xyvm4V7C8xM0NQ9mqF9W+/qHTm699+vHaFk95Dra3T89iHIwLO3ki9WytYBo8ecrN3uABY2qQ7JfehAJ2tgoE51gkU9nUWDhrio9H6V8zGFQ0Uj8Mz1IsxJyfqMVCgSVCrzkrfbpmuO98CRMNbCpjY0ynRdmGOAux/eGTiUTLB8X2suNc5YOgQ+H77lzZ6npmdmvy2ZgrBQPFh9u4dzl2sAxXnjuyckol2RRjmggGxzDcpzUkHsC65UxnbewHkJ9tIYXSrlDI63Aww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sn7YAf0dFUP9a6F5kqkqxt+OLyKHrlVeCiqy7FMvIa8=;
 b=W2E7/WkcSjZ25bAjGh8yrTHqJ4ZvEeZhKye0liVcj/bFv0YKhL1cdEFINhkoyh/hbSTayCcGA9+ZdjaHkFFTyeqvM/NrnvkAmJ/7qd/rFocMf1sTfrO2BRmk9xgiYOk1UokLh0PfKlGBx+tcxQNJvAHoW2/gvY+eipJdXkQ44jrXPhSLEy34n3FwGw+XDKnnMIXoUEWGDBOpP/EAPWdB9VLjV+XlVyLaKF2iNBpz4W5BT8/RjW1kTrUjaXZ8Je3qrcf6KsOBDCl8yKmpeKrgEfAL7c6QtzhWfvF6xWSAHYyUPCUsq/bj0XJI+ROxPQaDWIM6/39SDH1dJ9UY67GH4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sn7YAf0dFUP9a6F5kqkqxt+OLyKHrlVeCiqy7FMvIa8=;
 b=Wu3elCVAXQcbmARYiRwnh5WUHsvHV760oOSQuC4GL9xlxI0g9dbMuxCHsfT1JOye3vzjQx3bTR17P64dcWjVNpJ/P2BAfxvnmAyUfRhcfssj3s+VV26XAhql0gn98NsYezfF6hAw7vgEPSG+mbLcTkLm0J5RUwLX0v+6DCyyS40CShBp37O8me3Hbori0NGBGVYP++xpFgxv5IROL6wMc2vJbN6QgA7B3E1y1nad+PtjS8n0xDNvRJwGb1Gw9NVTribPTDgjSQL51as67dMRPjW7+aBmCeptRe6L+ae934YTcIAkKROstP/dojN5o4HIHKptwuY0oq64zhtRBZLYFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB6442.namprd12.prod.outlook.com (2603:10b6:510:1fa::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Thu, 1 May
 2025 12:59:34 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8699.012; Thu, 1 May 2025
 12:59:34 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 01 May 2025 21:58:32 +0900
Subject: [PATCH v2 14/21] gpu: nova-core: add helper function to wait on
 condition
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-nova-frts-v2-14-b4a137175337@nvidia.com>
References: <20250501-nova-frts-v2-0-b4a137175337@nvidia.com>
In-Reply-To: <20250501-nova-frts-v2-0-b4a137175337@nvidia.com>
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
X-ClientProxiedBy: TYXPR01CA0063.jpnprd01.prod.outlook.com
 (2603:1096:403:a::33) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB6442:EE_
X-MS-Office365-Filtering-Correlation-Id: a89af159-d770-4781-38da-08dd88b005a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7416014|10070799003|13003099007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d3RidlhZVmFaaUVzTlVTTEpqMVoycldpeHZuUE9WWCtPMUpYdkE1bjI4M0J5?=
 =?utf-8?B?cFlycCtmV0NFSFdEUGZ2RlZVTXhIOE55OU5aYzZKNjhORWNjdnJDcE4wTVFM?=
 =?utf-8?B?eDN2cjA1ZVRMYXFSQmVzMkFnMVlyQzJ1NS9SbjlMbWI1akJUWmhwWVpGWUFG?=
 =?utf-8?B?OFlzS2VYZDFjNUlzOVhiVXpZZU5nUk92d252L0dXWW5ubUF0cHVhem50Ung3?=
 =?utf-8?B?cWtDWGJna0JnVmhjUUplU0gxUUJPVXpXcTFzVUl6b3BwRWFNeHh1VjhrUHN3?=
 =?utf-8?B?cVVyYzN3VnZRQ3ZrNUJ1Y0NjWUk3dlB2aWR1QzBXVDQyM0hwMTdDRnNiNjVD?=
 =?utf-8?B?d0tCc3UxbEZXZ2R3dGJoL2tvdmVYc25BR0hITWZWcHhudVlUTjFtOXVuK0FW?=
 =?utf-8?B?amVBck1rSHRaUElnTU50Q2J3WHZxTW1LNEZZTTVhRmcxdWZkcjhmaFREQ2h5?=
 =?utf-8?B?SFY5MStGR2JGNS9BcmMveDVybnR0cDdHOWYxM2o0QjJCNWVyM3pVR2ViSUgr?=
 =?utf-8?B?MWxKWkp6Q2ptcWJscHJ5aXZzUWQ1YlVpaWRHVDBwa1ZFc1pKUEptb1AwMXVh?=
 =?utf-8?B?dTRjUVlMUjJMNFpTRC9yM2kvV2lhRDFTdDd2ZlNsSGJFWkl0NjdndFpGdTVs?=
 =?utf-8?B?Wm51Zk93MjR4OHFReFc2U0M5alg5UUdWQjdYTmxqT01NVy9RRERUc2lJUDF4?=
 =?utf-8?B?anFHSG5yMVZnUVlpT25sQmFyWFRWdVBUNUFESWFaQkZmRmpGUUdFNFVmbHhx?=
 =?utf-8?B?dzI3c1lFUjMxOGE0SzRuOExFNkFFS1BPTG1tcHZURjFmRktXQ1lmVmdtbVRr?=
 =?utf-8?B?SjV2TXhaaUUwRTdPSURWdk9ubmdxeWx0L1Vnb3lSa0pvWm0wM1NwazhCV0NM?=
 =?utf-8?B?MWpkb28yOU5pWUU4cHhVUUE4WXlJVEVxWXVZNlRqWE9sMzNUSlkvV2IvY0dr?=
 =?utf-8?B?V1lJcDl1bUJ5K2tLVm5oMDdRalJjNFo5VnBKcVJRdlRVSUMzVktJNEc4citM?=
 =?utf-8?B?THdNTFovaGt5V0ZLRi9oYVRyRnQ3Z2wxTjNubkVnTkpacmdxUnAyTTlxVmlu?=
 =?utf-8?B?dy9TQWc3MVFqcTlsTlhIUDRkWjFaN0dLbTJHbDBVYm1VWlZ6ZGJ2MEhuaXE5?=
 =?utf-8?B?dVh4OFBKRDB2ekhPSXNiNWRPQ2svZFhUWGF6OXIza0UrKzUzbStwMEpJbFpq?=
 =?utf-8?B?MU5VVW9xZWVSaVZtU0hQenk4STRHRllZOU41YTZ3WWJERkNUQlhJSlBBUVpl?=
 =?utf-8?B?RjY4ZUlyUFVtZHMzUmtraHJUUk40NW9HYkZES0pPVWZ5Y0hTVzJnOHhhU2lj?=
 =?utf-8?B?ZkJNQWZ5SXhkTHROeFhwNkEzQlczR2NGcGpFZUhyT2gxRnhnWjRVQjVWL0pq?=
 =?utf-8?B?ZU5UQjBWRlpVcUN3QmpvR3ZIRlVjd3h1dEV3Rk1nMldOdFdTTU53RzVla3hB?=
 =?utf-8?B?Vk0vUXJWcDhITGtBZWhreVFvN0VMaFIwREs4UFhkNFJtaU5KblpFWDQyaWxo?=
 =?utf-8?B?SWpOOGl4dHlobGp1OWNvSVJoQlA5VGFKTmd3d04wdjlLM2pkOE4zTlgwbTFh?=
 =?utf-8?B?azNqamN6Nm1OcExSQ1JNd2JwcnpVa3FxTUM1bUhnR1NkRTIyUEJpWURoWjI1?=
 =?utf-8?B?K29JTHMvRERGWGt4ZGx3eGpGbmJ5VG9Va3FmV2w4b0gwOEVwNis4UG1ZTjZ4?=
 =?utf-8?B?WGpwQis2ckhxenZiNlJvOUphU20yOFRiN1lLTDdhVm9iTmNlVFRQYWgxcFpp?=
 =?utf-8?B?R2J1d2pSSjE3TFIwL2hRS2M4YUdLYzV6MTB5bm1oQXY1NXpDVEdQVDFra2tp?=
 =?utf-8?B?L2puWWdjQ2d4dFcwS0ZsZDQ3dnBJV3ZXaDFSTW9oVFJYWnFNQkZkSVE4djRq?=
 =?utf-8?B?WW9iMXkwUXZIOVFPMEVDN2IxN2FaVmVoYS9lbkRjVVFxNTZJUTBLZ0FCQlR0?=
 =?utf-8?B?dDlhQytObm9WeWlpM0ZoazY3OVJyRnhhb1lmcU1oTWJHMi9mMjc4MmxJR0xz?=
 =?utf-8?B?c1pFUHRhK0FRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7416014)(10070799003)(13003099007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmFBTGk0NGhoK2dDcjdpQ0hBOWdXUUVwaFIxWVBJZXVkdE1sYXlDVERzalJG?=
 =?utf-8?B?RTFrWHlZWlNkNjN4MG1jWHJmU0F5UWs4Y2UxbEJ5b0o0ZlNpVDI5Q3g0SlJR?=
 =?utf-8?B?VHlFakxnUFhncHpZUW5rNzZGYU9pNCtkWEZZTGtHVzNkWDNQaUhRUEZqL3BU?=
 =?utf-8?B?aHRFaGV5REQwSWxSejlxcUNCZHVTWkhxZytJZjV2cFArL3J3MDZhbG1oeE5L?=
 =?utf-8?B?VG5xKzUyZ2RnTWFlak9aYVMyR3lqa0ZFV0JSYW5mTk56U0NCV0FpckNHczll?=
 =?utf-8?B?cFFmQk1keFBkb01iayt3RlhxbzFkcnAyOVJnUy9Tb2tRZWdmd2txWjM3SFpV?=
 =?utf-8?B?ME5nSEhRZXpwT2pIWCtKbGdxMU5Kc05seXFYQlV6WVp2T0NuRkh5UGxWWkl4?=
 =?utf-8?B?OHhZRFY1ZmVuTm5mcnZvSzh5Sk9tZjVqZlNFUWZKcU92ekUxWE1VQWZPTmxV?=
 =?utf-8?B?cTZYdE5Hb2IvSW1EVGxBazY3ZjRkbjFUb1lOYzdZVEFaUm5KQTNURE9HUnpX?=
 =?utf-8?B?dXdTSDgwRmtwZTIyNHJaOU5pMExCRjBTbWNpT3RoT3FQTWp1aHhKNTAvVFFS?=
 =?utf-8?B?NDdDL2RjQTlYaWJUQmZDV1JwR1RvOFNac0ZQTkNKSHU4VHpmWFFTdERNbFlW?=
 =?utf-8?B?WC85SzRuMzhIQVl6M3N2UHV1UlVxYWF5VFI4Q0d2RTFGWG56WnVDVXB0S3VY?=
 =?utf-8?B?VkJaUXBmZkNMNUVKNzE4V1NhVk9QSjgzK1hHbkJtaHFtalN5YmxOZEpsQmNo?=
 =?utf-8?B?aGc0alpqVEZWcW9pY2tSeFhFY3VNeUo4YjQ0QXZlYm41TVZrREtEQXVQc0xD?=
 =?utf-8?B?RnZMU1NRSDNlQ2FoUk10c09uQldPTmt1a3BYbUxrTmdYUTJ4UTQwWmFOZFNI?=
 =?utf-8?B?bHB5U0xBNk9FajkzR090Nmxka1lBWUVZeW9vZFhhdTdIZ0NWMGJDL2MrVEVB?=
 =?utf-8?B?R2ZoWnBsOVIvd3prOUs2MUtEcWxpYU8xNVpSWFNvMFNaNm52bWZyZzB2T2t1?=
 =?utf-8?B?dUdubzBLY1p0TEFzVUdaQzJtY3MzSEtTd2pIa3pEaVlEeGMyaVpKTGg2Vzhs?=
 =?utf-8?B?SEo5T2JUQnl5aWkxUFJzeGlhbzVERnp2eHN0MlgwRU5ZL25qRXhtTEg5QmRU?=
 =?utf-8?B?cUFQZHI1b0J1dlhVZUpEM3BkQnRJdkJaczBiY1JBbGdMcGhjZStjbHpmd2N1?=
 =?utf-8?B?WHdXZ2hyelIyc3E3MzQyVnl4bFZ5dFdlQUNZNHZwL0JOR1hTZGtWRW9RVGx6?=
 =?utf-8?B?Zy9LeWNTVFIzWFhwSkpidFp3UVk0eTd0S2t1RFdTVXNwRzJkUEtDSWg1cnF5?=
 =?utf-8?B?Vm05S05LUkR5M0o2WnVOWVpHSVN6YXFLcVpRRDdrT3VRSHA5dGlSdTM0a1VU?=
 =?utf-8?B?VnloM20wS1hXTmRBcU1HQ3lBWnZ5T0doRjBqdVJFZHJ6WG8vUWtXbzZvWjAr?=
 =?utf-8?B?aXpTc0JPMWR0WW9HSFVrM3JoTmhDT1FIQXJxZFhhZ3hWYWM0TEl1emtvVFlo?=
 =?utf-8?B?eGhGeGcxYnB2R0xMdktzcEp2Vy94SXNOS1p5NzJxbENiU3d5bmJGci82bVNO?=
 =?utf-8?B?VFJPajhNRVFONmdYVXR2VURWME8rMW05bnU5SGZEQko2NUJRTXRIemY4cTds?=
 =?utf-8?B?OFlvYUszanVsVk9DTWxqcFJmRDJBQ0NpSUUyWCthUEVZYm82a1oyZkdTTU95?=
 =?utf-8?B?anJnMkQ1UDFNb3QzTGEzZVJJTjlORERRbXh6NmFSWWMxSFBzZFRzbHVORFZT?=
 =?utf-8?B?d3JDUnhldC9vMTl2Q3c4ajN0SFVHTUpqd3M4RU5XYnR2VVpsK1gvRTJtTHpr?=
 =?utf-8?B?MldRWGJuTzhERlV0ZUtBa0dtdGYyeHV4Y2xxTFNIMVkxOTgyL2NOaTdHRGI2?=
 =?utf-8?B?VTR6N3c3RUpDeElaYjhGZk9HOW5ybGhVaHVFZGEyYktTemdoMEZXODVheWl0?=
 =?utf-8?B?OUsxSk5QYnhJVWJzWldBYUNkcTNXZERTRStPbGpmSzA1R3ZwN2JzWEZjdEYw?=
 =?utf-8?B?VWd1UDRCTW5pY3hsNXhqak5TZmR6SE9mMG1OU3dHV0s3dm02VFUxSWNXOWFT?=
 =?utf-8?B?Y09Hc0M0QUw3MGVhSG1ad25pYmtmbm1reVdrZDkzeXIzT3dNeks2Sjl3QmVV?=
 =?utf-8?B?a1BUb0s0QWlsaE5PdXNLK0xjVmxuYkVCSFRDMkFiejdTaW45dDA1MVd1SFdw?=
 =?utf-8?Q?En+Ai6qAItca33ATAO5eKeV6lxbRdOMtaQGRIRsSaFzs?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a89af159-d770-4781-38da-08dd88b005a1
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 12:59:34.7619 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GYP5mGA/Fn8LFAefgHQBxXBvNq4lKKzO2WMz+m9jWTfLLKxETpwriCIr8/UxZuAjWPi2XBhWYQL659dSxJpE9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6442
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

While programming the hardware, we frequently need to busy-wait until
a condition (like a given bit of a register to switch value) happens.

Add a basic `wait_on` helper function to wait on such conditions
expressed as a closure, with a timeout argument.

This is temporary as we will switch to `read_poll_timeout` [1] once it
is available.

[1] https://lore.kernel.org/lkml/20250220070611.214262-8-fujita.tomonori@gmail.com/

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/util.rs | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/gpu/nova-core/util.rs b/drivers/gpu/nova-core/util.rs
index 332a64cfc6a9d7d787fbdc228887c0be53a97160..afb525228431a2645afe7bb34988e9537757b1d7 100644
--- a/drivers/gpu/nova-core/util.rs
+++ b/drivers/gpu/nova-core/util.rs
@@ -1,5 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0
 
+use core::time::Duration;
+
+use kernel::prelude::*;
+use kernel::time::Ktime;
+
 pub(crate) const fn to_lowercase_bytes<const N: usize>(s: &str) -> [u8; N] {
     let src = s.as_bytes();
     let mut dst = [0; N];
@@ -19,3 +24,28 @@ pub(crate) const fn const_bytes_to_str(bytes: &[u8]) -> &str {
         Err(_) => kernel::build_error!("Bytes are not valid UTF-8."),
     }
 }
+
+/// Wait until `cond` is true or `timeout` elapsed.
+///
+/// When `cond` evaluates to `Some`, its return value is returned.
+///
+/// `Err(ETIMEDOUT)` is returned if `timeout` has been reached without `cond` evaluating to
+/// `Some`.
+///
+/// TODO: replace with `read_poll_timeout` once it is available.
+/// (https://lore.kernel.org/lkml/20250220070611.214262-8-fujita.tomonori@gmail.com/)
+#[expect(dead_code)]
+pub(crate) fn wait_on<R, F: Fn() -> Option<R>>(timeout: Duration, cond: F) -> Result<R> {
+    let start_time = Ktime::ktime_get();
+
+    loop {
+        if let Some(ret) = cond() {
+            return Ok(ret);
+        }
+
+        let cur_time = Ktime::ktime_get();
+        if (cur_time - start_time).to_ns() > timeout.as_nanos() as i64 {
+            return Err(ETIMEDOUT);
+        }
+    }
+}

-- 
2.49.0

