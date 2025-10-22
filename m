Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE401BFA4DB
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 08:47:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D587C10E6BF;
	Wed, 22 Oct 2025 06:47:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IKSlH+Eg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010026.outbound.protection.outlook.com
 [40.93.198.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8B2010E6B7;
 Wed, 22 Oct 2025 06:47:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H96JvugBkLnhUnIy+0Lww+dm0fkvc2dSqkOJnNCglnfvXYCnU5eXQZMDNEyIte/oE/YuuT/YAhAWdppKXeWiRzVfGuzn4+sR7/5aR6LDH6WIzyjTBcyPa17Q4jqG6ZrHlExUsCyegcdHtL19/MUK8Hu35Z4c5CvB4telZoczXWS78Ed0Xutr7Lp2VvKFwrbyr/uuArOxnfjHl7VhXEct8hsKr3i2MYrV2ALvb05HVSzka502pcIWuXkJ3HG8N1xJrclJAxHqGcbzAUvX4HAt/hvo2jg+Z+8RTvC/uCq3XIwCDWoB89G6p+Yigg8Z5AHheL0l65PhP0k5ABPYsVRzWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qW3KXD88zf2XNu/VFTgoA6GPHSYuQFTazjKcd5YRJ2Q=;
 b=JPTjwfrxgHihjF8JWy9YbTN5zx6UDWOvjJOEaqd9vgUsO9U9Eh8ghqR3VD3GcaqwAWjqX6F53YBbpeTI3X/glUKmK/yGp8l5GZRxsHn4EmxWDrxQ0QRWwy4gbqUAt97lU+mzT6W8bmp23It28xGHEcbOev/39cAj5ha/KvE570D/C6FkWwhMqr39AeZf1TToMda/bq0iNWhNCrYFEwg1TR96xjbrz4fHp6LH2RrcoYFC49oP/1bkcjxRcbc1jbG59lCVRZ7xueCrTV7Pjxl3cWcz8LOYmdmkk6HtUThIsR/8aT95MbfCrVD7ipxtTpKDbWjUYFwgYGufMSsYqNL6AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qW3KXD88zf2XNu/VFTgoA6GPHSYuQFTazjKcd5YRJ2Q=;
 b=IKSlH+EgxclndpkrGxxsCeTa7GqsNaUJgzjGrcYTpIOmWnw5XO4WD286w754ZBrObK9xAFVQzggo0wIOBni4fVaWTR1MGRHijcVSnhQuAFLNcn499n0zfFcnkvY/+ikM0cHm6+D/5vcyc7jBpRxPonsw9o1nfTjBnS0m/YAWmkfDGD46WsWTuqjmGXizSqLQ9en2GXeXFtBPTHx0h7XaC94DsgclHlhmhyc1VdXeOzZ50+z1xTOUVaER/fhqaUNI/Co/e4tgjdN49j5evhSnaimdYBaiMH7QBujxg5ZOFgFGrQTYOtoXWNvA1/6gQZtpIEfQQrsA5m1kuyE/F30sqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV8PR12MB9408.namprd12.prod.outlook.com (2603:10b6:408:208::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Wed, 22 Oct
 2025 06:47:34 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 06:47:34 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 Oct 2025 15:47:30 +0900
Message-Id: <DDONE8QZTV0X.29VK3OOYFGAHT@nvidia.com>
Cc: "Alistair Popple" <apopple@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>,
 "Daniel Almeida" <daniel.almeida@collabora.com>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH 5/7] gpu: nova-core: Add support for managing GSP falcon
 interrupts
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <dakr@kernel.org>, <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251020185539.49986-1-joelagnelf@nvidia.com>
 <20251020185539.49986-6-joelagnelf@nvidia.com>
In-Reply-To: <20251020185539.49986-6-joelagnelf@nvidia.com>
X-ClientProxiedBy: TYWPR01CA0022.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV8PR12MB9408:EE_
X-MS-Office365-Filtering-Correlation-Id: 87a183a7-2494-4bae-5577-08de1136e12d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|7416014|376014|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cDRxNFh3K3J2SGpsM1FJVm9ISEtDaHhSR0N1a2IyUk5ySCtoaWNkWVRSTHkx?=
 =?utf-8?B?RTRNb2JkM0RxYTFHYmVhZjdFWlo3NS9ZUVlMaHpDVzh1c0RqclN6WVBRQW91?=
 =?utf-8?B?dzNFUE9xWHREMVppUXliS3RXeCtOWXhCaUNrcS9ocmxTQXFEMlg5YU9mWXp0?=
 =?utf-8?B?OWtyV1RrMFR4QTVLLzd0dGwwTWE5MzZSUjhLeWw4UUtQU0d3L2greDR5YVBo?=
 =?utf-8?B?emF6TWI0dFRqOWY1b1dMa241YWNNWGdFMHBjVVRzSktnd1NtaUlRQmoyTGZI?=
 =?utf-8?B?VVM4ejhldGZyQW9manB3Q2MrSXZJb0VWdjVyRmVNTUllNk4rby9KYzBwVkcv?=
 =?utf-8?B?UVBPcHMrQTNNNXZ2dS82czZkMGx1STc3OVU0b1h1aCtJU1lsc1JaU2ZyMGdt?=
 =?utf-8?B?dzhNREtqT25sb3NOZ3YvQ21VYnVWWnNIWjZvd0JLYzhuMzkvM1Nhem1nNlFK?=
 =?utf-8?B?WG01ZjR1ZmR4cUJWQUkyY0FNVzFRY3ZKdG02dU5tM2p6NjM3Z24xcGRPZTIy?=
 =?utf-8?B?cFNMWUIxQ0QrSEo2enFqU0xpSFNwU21mZnJlbmNvTVBhN2Q0b2JoYitxeVRt?=
 =?utf-8?B?dUUxOFRwM2o2SjRIbEFiSm5RVll1NENVYXlodUtDbGt4MThoL0p6dzd6SDlE?=
 =?utf-8?B?YW9PY0IzdFNaTXJ2MnJLa2dvb08rS0M0NGJMRGhrWnoxcXFVTk9uRFJmVE9v?=
 =?utf-8?B?TjYwU1RxTG1zTkVRYW1yNkMvRkZ1SkhwZWl5UmNZSHM5ZnJ1ZmMvQmZ0NzRB?=
 =?utf-8?B?RGRkbjUxWitPR2EzTXZ3eXNFUkduaEs0a0J4T0hVZ1ZMREltT1VlTThHMitB?=
 =?utf-8?B?dVdFbnd6aytRMER6OTRnb3JtQWtLY29yY1ZYMWo3Q1c2eHgzY0JFKy9VUVR4?=
 =?utf-8?B?M2F2S2VwWFFLbjd6U3JHK21VdDJsd1JvK3Fzb01udGQxZEJLbjBRd1FSVHFm?=
 =?utf-8?B?RmRQWmdmWHplNGp1dnk2RWxoZmQ2T3pYWGl4dC9QMXNXYlA5VHQrb0lONERH?=
 =?utf-8?B?ZmNMbFVaQzJYUzh3cnJoU2NUZVhreW9Ka2lRdEpTbnMxU2lBenhveDIxalhl?=
 =?utf-8?B?a3NIbWYzNzU3VUlGMHZSU3M4dFYwSzRyUmpFMUdJRWZRVmtMZlY5dUVmdWw3?=
 =?utf-8?B?Y2ErUjF3YXhLR0Q1eTc2TkNrcklUU2dndnM0bkhxV0VUY2pOTlY2VTdONFYx?=
 =?utf-8?B?RSsvaWZVdS9SR3dpNDRQQjF2TklINEVKeHB6RkswK1ZvRy8rOFF1djI4Z0RC?=
 =?utf-8?B?TE5ZK1lnbUZSQ3dVb1NZRnZ4SzBUYllackd0YzI2VUpwSHpvQkVXUXhUb1ds?=
 =?utf-8?B?eXVuY3lPeHJ0WkRIQldoNEVwZUdiU3Z3bC9SUVlrWS8rSjByOW52QUdVOEV4?=
 =?utf-8?B?VVZKK0ZqSGtNUklQR2l2OFJhdlF6akhOckhHNitrQnpiZEppN3FUOGNZY0pW?=
 =?utf-8?B?dXhRRENFMFJzWFNMbWFaZzhWR3kyY2tBK0xYeStWU0ZCay9yQnRHOTBBNHFJ?=
 =?utf-8?B?TFlmZi9UZDF2b2dONE12ZEF4M1FWS3h6YmdUYUhSczRZelJNbzFvV1BMNHJM?=
 =?utf-8?B?eS8vRm42VEZIMXJTV3ZvbjFoRXVFUFNyV25iQmVEZnVWZi9DYm5YSThGeE5u?=
 =?utf-8?B?RUR0K3c2ZEZ6LzJpLytBNFE0S1ZyZnU0WlJnOWhKUWoweGFLOEtXc2VNZHVV?=
 =?utf-8?B?MXl2L0JaNENtMkhOSTFwVW83NVB3Z0dpK2lqODlUQmVqdURrVnRCWXIxeC9I?=
 =?utf-8?B?ZE91ZzU2U09JQ0RrbFczU011bTQvRmxjSzBONTlEN2JZY2xyQVFTenQ4RzVQ?=
 =?utf-8?B?M0xlbitGSVZBUEVka0VEWUdCdmtYTlBleU05NUZaRkdnd25KQlpGdXZSQ2hC?=
 =?utf-8?B?d09xNE5HZmZiUktHNGRBdm0rdlNoVFllMlNVSWVkMCtBeTBleURmZlBQOWlK?=
 =?utf-8?Q?Q2LqMNM7FNkIS6UGB9KwhSvQw350t40j?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(7416014)(376014)(366016)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THBXMnZZMkh1cXdVa25QSHFHR2srUXpzT3Z1ZVhKWnRUS3ZGeUVwL09ab0s3?=
 =?utf-8?B?ekkxVXpaTmtqZkhUVGNuZnZpaE9veVNxMlhHdDNyY2pwR08zRmYxQS9lZ3Aw?=
 =?utf-8?B?OElsQm9rT1VPN0lNNkFKdVZjMkxjT2t4RGY1bjhmSFBJakVwM3YrdlU5YUc2?=
 =?utf-8?B?NXkwcURheEpRcGsrNEJ0V2lvWTQ4UStTblovMzJEOWU3WjJSaGFEQWQ1NEdp?=
 =?utf-8?B?SzNMRWdaUGVvcVpWeW4wc0oxUFVIbVlteUtXWVN6bWgrbmFPN0VzUHBCQ0Za?=
 =?utf-8?B?WmFyNDdMak43K1l3WktOQ1k4WTNmRGNadGNVdTg0b0lkZGFoT3ptakR6RFNP?=
 =?utf-8?B?dkZqd3dPZGF2eXNuenc0OHhOQmx6dGJTSkdvN2NNV2JQaFlTaW1LWXl2SFBM?=
 =?utf-8?B?S09mSHRTTmJLSE9kK2YrcVd3bUJqVXV6amtWVlF0M0lKMnhuWTFYMTQvSmcz?=
 =?utf-8?B?aE1jT0JqSUh6Z3FxcUdLR2ZtODdOSmRWZ0RwQjExNG1URnFGQXQ3YnJzWlZ5?=
 =?utf-8?B?eDBZd1Yva3hSTGRxZzg5Y2dsNGxndmdVbWh5QXFuZjhjV3U5ODFrVmZBdzlz?=
 =?utf-8?B?U3hVdVFrakMzczdGUFhNOFhURGFBS0RGenpsWTZ6STVTNEZ5dEdYdlZ5eEdm?=
 =?utf-8?B?OVBTL2FWV1Rjc0VUQjhyZTJFLzdXMXpYY2lNZmVNRUNkeU1uVU5GaTROcHRl?=
 =?utf-8?B?YVdrS1JWczJVSWt5UzFrQWpESDF3enZZa0dOZ2lHVzloaUFUcHVFNk9KZXR6?=
 =?utf-8?B?eDZyMXlpWTZBR3JKeSsrekZFaEpNdk5sOEszMmNxMStnSDRFV0lnVm15WlJw?=
 =?utf-8?B?MWN5WUd3djRlZzUxN2pWTTJsSnB5M3UyeUxacEhsd1hBcEc5RVJMTzRSN2Z1?=
 =?utf-8?B?Q3lLTFdORnpZa1RXSkxzUUluRkFkQmVNRkozQmtCMVVFSGJRTG9BYmI2T0pP?=
 =?utf-8?B?MWZJTllnRDRiU3A1V3orWlpMZWxjVWd1Q0M2SlJuZEdSRTZ1QnNGUUd5MThN?=
 =?utf-8?B?M0FiWllGSk4za0VGWXA0VjhvS2UxckVmck11WXYyN25veElvYUVpRyt6UnFE?=
 =?utf-8?B?N0czVTJjVlYwcXYxTGxxNzB4cTZsWkUrNEJqVHZWck9Xb2lGVytDRkU4MGFO?=
 =?utf-8?B?RVZ3azZjU05XZFhrS2RNZ0ZER21od3htZ2hsL0kxdlczQUJCaEZoK1JNYUpQ?=
 =?utf-8?B?NDFtZTFDdDBRVnJVRzdFMCtwdVNtM0c5b0Nra1M3MjdCSTB6cEJoMk43a2Q1?=
 =?utf-8?B?UUtVY2lSbm02d2NuaExSVFJPeVY0ZUt6c3FrMm9rZ0x6MWJ1c2IrSGpYejRR?=
 =?utf-8?B?WExCdUdRWk90OVdsMnl4SnFDKzNzT2RHVFlNZzRnWGFEbmovcUMvQzk5Q2hm?=
 =?utf-8?B?UTZIN0xxK3hVL2dqSlUyc3VId1hPVHJVL0dZWENjQXJMTW9TcGRnSjMxVUdB?=
 =?utf-8?B?NGpScUllU2xybktlQ09YUFpDSzRsSzU5OU9Hc24xYUt4bnV6MERoQ05IMGh6?=
 =?utf-8?B?Z3NTU3VrWEFPNVhyeCtwaWFFOWd3WklkQ1dWZnA1Nm41UVV4bFZiNzhVNDBu?=
 =?utf-8?B?eG5pZ2MyS01WUHFBYTVRazRpZTFmTzR0T0M4UEFHQWUwSFV4NndreTFnL05i?=
 =?utf-8?B?VlBPNjBHOVNETjBJazZVQzQ0NTd3YzlweWFCd1p3N0phR09XcW9ZQk93WlV4?=
 =?utf-8?B?aXV3bEs2S3pvbTM1Ull6Sk9mU1dHdjcxTFNlUSt6ajRmSE9jVlgrSmRpSHQw?=
 =?utf-8?B?TW1nNGhaY1hYblNBc01KTUJ2WC9ZOXVuRzNaRmJ4ZnBHNDUyTzJZZEw3dGlR?=
 =?utf-8?B?K0Vua0hIZC9lQ1FvTFhtbHR0ZER5QUt0TkVzQlcxWEZuWGRVTGFITUZlTG1B?=
 =?utf-8?B?eHlLZm5rUGpUQkY1b05JbnQvelc5VkN0TENNZ3pMUnM2MkxvR3FwSmZOdjAx?=
 =?utf-8?B?N2RmellWZFZWMXN0YWVwa2F0T2FpL0l6LytYdjBOYVlyNFFZWncvNEhyU094?=
 =?utf-8?B?eUZWdXhMTzVMeVJmK0FkaXFheW9uSXNPdm95MXpHcmRQRytWYTloY2VqMUs1?=
 =?utf-8?B?RCthaEl1czZXSUdVcklUaW1EWURRL3hvTDdtVGNUeEJWT1N5b1NIS2ZlVDZh?=
 =?utf-8?B?YmZPMnA0NWxpbHJNNWpaV2pzdEp0TXdyOGFuTmVhWEJwdFBDMytCZ0N3cGYv?=
 =?utf-8?Q?vhc0CTyM2y4KbEt0FurF+PMLPHcPA1Vy6MGku2RUseRv?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87a183a7-2494-4bae-5577-08de1136e12d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 06:47:34.0548 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 40qX2GeAKkPOq6s07O/8Nt2vHGwyvZLSZirM2WDDhE+rB1XVe9aQz+q4/7OBrFXoY8TydWJBYqaU3E4KhBpfKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9408
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

On Tue Oct 21, 2025 at 3:55 AM JST, Joel Fernandes wrote:
> Add support for managing GSP falcon interrupts. These are required for
> GSP message queue interrupt handling.
>
> Also rename clear_swgen0_intr() to enable_msq_interrupt() for
> readability.

Let's make this "also" its own patch as it is a different thing.

>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>  drivers/gpu/nova-core/falcon/gsp.rs | 26 +++++++++++++++++++++++---
>  drivers/gpu/nova-core/gpu.rs        |  2 +-
>  drivers/gpu/nova-core/regs.rs       | 10 ++++++++++
>  3 files changed, 34 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/falcon/gsp.rs b/drivers/gpu/nova-core/=
falcon/gsp.rs
> index f17599cb49fa..6da63823996b 100644
> --- a/drivers/gpu/nova-core/falcon/gsp.rs
> +++ b/drivers/gpu/nova-core/falcon/gsp.rs
> @@ -22,11 +22,31 @@ impl FalconEngine for Gsp {
>  }
> =20
>  impl Falcon<Gsp> {
> -    /// Clears the SWGEN0 bit in the Falcon's IRQ status clear register =
to
> -    /// allow GSP to signal CPU for processing new messages in message q=
ueue.
> -    pub(crate) fn clear_swgen0_intr(&self, bar: &Bar0) {
> +    /// Enable the GSP Falcon message queue interrupt (SWGEN0 interrupt)=
.
> +    #[expect(dead_code)]
> +    pub(crate) fn enable_msgq_interrupt(&self, bar: &Bar0) {
> +        regs::NV_PFALCON_FALCON_IRQMASK::alter(bar, &Gsp::ID, |r| r.set_=
swgen0(true));
> +    }
> +
> +    /// Check if the message queue interrupt is pending.
> +    #[expect(dead_code)]
> +    pub(crate) fn has_msgq_interrupt(&self, bar: &Bar0) -> bool {
> +        regs::NV_PFALCON_FALCON_IRQSTAT::read(bar, &Gsp::ID).swgen0()
> +    }
> +
> +    /// Clears the message queue interrupt to allow GSP to signal CPU
> +    /// for processing new messages.
> +    pub(crate) fn clear_msgq_interrupt(&self, bar: &Bar0) {
>          regs::NV_PFALCON_FALCON_IRQSCLR::default()
>              .set_swgen0(true)
>              .write(bar, &Gsp::ID);
>      }
> +
> +    /// Acknowledge all pending GSP interrupts.
> +    #[expect(dead_code)]
> +    pub(crate) fn ack_all_interrupts(&self, bar: &Bar0) {
> +        // Read status and write the raw value to IRQSCLR to clear all p=
ending interrupts.
> +        let status =3D regs::NV_PFALCON_FALCON_IRQSTAT::read(bar, &Gsp::=
ID);
> +        regs::NV_PFALCON_FALCON_IRQSCLR::from(u32::from(status)).write(b=
ar, &Gsp::ID);
> +    }

I think this can be a bit more generic than that: all interrupts for all
falcons are handled the same way, so we shouldn't need to write
`enable`, `clear`, and other methods for each.

So the first step should probably be a generic `impl<E> Falcon<E>` block
that provides base methods for specialized blocks to reuse. It could
work with just the index of the bit corresponding to the interrupt to
enable/clear, but if we want to involve the type system we could also
define a `FalconInterrupt` trait with an associated type for the engine
on which this interrupt is valid, and its bit index as an associated
const.

But I suspect that the set of interrupts is going to be pretty standard,
so maybe we can use the standard nomenclature for the generic methods
(i.e. SWGEN0), and have dedicated methods for specialized units where
relevant.
