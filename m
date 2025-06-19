Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E27AE06F9
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 15:24:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3AF510EA34;
	Thu, 19 Jun 2025 13:24:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mOdaclLK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2066.outbound.protection.outlook.com [40.107.102.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6334A10EA34;
 Thu, 19 Jun 2025 13:24:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QXWNNwLqgeJDI+aYflQXWSEa/zqWsrOdPItFhF9w0cSAxI6Twf4ubgT51oZbWwjJCTW8iWnIclKln1ykuC6Y7qZ173FtSMru4l130Nal7PraFnw+Pf/y/g/fxTLB7Q7C96RLdfy40tQSYsEcqZQClUvGyZy8ovLJy37oycU6Sgspd9HFjUv2+LaCP99FwAkfaIn5uGDuo3LubN7/sapUy+OhWLNNPzIsEE0udavIu01q/uSWLR01Octk/HXY9uL6+lzezfP1S+tFXGy2lHlv4Qqz6Eht1l9edve44c+QMNwPRV8R9jTlB0QLj0I09xeK3MFuYAHANDCuePx+jbWzBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o+m6LprzilaHKfMW1rL0H4AEVNOA3syo9b23mYEnXGo=;
 b=S1zxkblXy+4Fh/vS8dwEAYiFmlZ8OpcyFrNwCG3buwhSjayJIOZrN7a9Vn5qYWBUQZtcfG7Sbl7tOI/FNkPlgYR8vCss8b9a+oky+9oM+MYHH5tnzcXK+PLl/TFullvMT4JbLCs5Gv9TsOJY4ZgxhydQqXX/aamhiDheftdd76bWK9pwAhBssvIOwlU5Ul1YaLpt/NjxSaoscV7L/DGZQO4sa85pP5F7cd2knCjePsZ/9sBCmQ1agKZ8FLvl9XUxx25yIyD79/36AyP+yxBHmv9i00zkniG2Bt+TQYdhU6IhqUZE7WugKL1hQWVObzk1E88budvCpRWB1RmF/QIVZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o+m6LprzilaHKfMW1rL0H4AEVNOA3syo9b23mYEnXGo=;
 b=mOdaclLKj80MiHKfzPZvackhovndjoStCNVUd8Oovmb/JWXuv7Hl7tVdH+hxHfZMZ/A6mNbn2S7jZUwDsJFrehUhHOkNkcARgB12p7OkCxSdXGvSf2u3yk3Kn3mgxUfZpyu/RPAhPHhJ8xv0yE55Fzy5tr9eFX5kze1wHAJsqnglqkJxYqP/AWhpxsj5bd4M4qNqo/LQfZO7Phl9sCxDOdvrsW3Bbv5z2qDaBcuH/GPuegio40XV29XzNJVKeDr9ZjN7ZMBQliftszpqV/67SpVlaew0tmQ97h8yHUM+mhNALjI7kYLERnQ+VrrFMx/Zm4hbESvZiOldi0thQnzFNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB8122.namprd12.prod.outlook.com (2603:10b6:510:2b7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Thu, 19 Jun
 2025 13:24:42 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 13:24:42 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 19 Jun 2025 22:23:49 +0900
Subject: [PATCH v6 05/24] rust: sizes: add constants up to SZ_2G
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-nova-frts-v6-5-ecf41ef99252@nvidia.com>
References: <20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com>
In-Reply-To: <20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Benno Lossin <lossin@kernel.org>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP301CA0061.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB8122:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f4a316f-ddfe-440f-4b83-08ddaf34a635
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NHQ4cTNSMUlXL0xIaEJrZm5TNnhjLzlXei9melhyTnNHYWZTVkd0ejZBd3dB?=
 =?utf-8?B?dFdqVDhSdjU2YmxtRTdZM2xTOFk3TjdNZmpIeThBcysxQXNTd0l1YlBGblJO?=
 =?utf-8?B?VUFOVWd3YjJiYW1FMnJVb0lMUzZ2MHErbTNpNld6aDFkQzhXRDE4c1QyZy92?=
 =?utf-8?B?KzA1Q1RFZDdEMGVZSlVxNDRxQkREajVvWjFGNlc4Vm1kMXRtNGtLLzhUdDd6?=
 =?utf-8?B?eFBYUkNqVWltTVhoTGVId0puRzhhTVdHUThaYUVrVERlQVROSnRkaURWUFVr?=
 =?utf-8?B?ZXJiTUpuWSs1YzRoL3MvK2p5aSs3eU5nUmNyeUlyaDN1Sk4rdkJBbUNFTkc3?=
 =?utf-8?B?U0RxUmlSUFhFWmJaSUpnNUVsSFhFUDJ2L1JPZkZUMDcvZ2h4bHBtOWNBZzNX?=
 =?utf-8?B?SVhHSk14eXVHU29kOUpYbDlSRUphMTlFRGM4ZlJ3TG1kWVhORmVjZW1iYWJF?=
 =?utf-8?B?ZXpHczMrKzVBQ3FyN0M5dFpRZUY0Tm9PMzZRSFhkQmM5WWgybDdoTnRNTk4r?=
 =?utf-8?B?TWY0YnF0SWwzK0Y2M2RaKy9EUnlHQXRlQWpuanRRR1lrUWJaRmMrTk1WNDRp?=
 =?utf-8?B?cUpLdm5Nd1BMWEttYTUzdHJEbVplQTN6QnZOaFhwcDkvaFFiMmhqWjU2ZTRK?=
 =?utf-8?B?MGxZa2RvbWhlakJrdkhYTkhJSXIzMFprQy83bC94bGZ5YmpRME9BQ090enlG?=
 =?utf-8?B?cHozUDBPSEpCTU50dVZLK2VLdW5CUmVETWN1VFdVVTlRKzRXR2hXUmpuVFVZ?=
 =?utf-8?B?cHplb1l3T0dyczVwZkI4ZmhZMlZSS3lZeUhGeUxhNityeW16d25NUGVBMjF5?=
 =?utf-8?B?S1YyQ3pwRDU2dUJFOXB6cUNYbUZYSHhCeWpVWnR5SlhJenBuNkN0ditxZEVO?=
 =?utf-8?B?WmZTOXNHU2dlV2tnR3hacDQ1S3oxa0hwZlZPZ3RremNaamhZVk5PTzcvS2lY?=
 =?utf-8?B?N0c5YmZYaHRUeE9WdUh5QlN4OWlsU2tnS0VzY01BaDg1YjM3U0FURUhnZEhU?=
 =?utf-8?B?TVd2VGZVem9EZ0dKQW5lL0VRYm85Rjh4VlgyRWhCZGRuK3piWFFSY0NQN2sz?=
 =?utf-8?B?VDdjREdjZFIvdHJ1NnlabDdzazBnWmJ1SjJHQ2VyYjFqU2NlanRJS1dYSGd2?=
 =?utf-8?B?Y0RWTW5RTDg2T2lpbzVjMjliWkwwWi8wbTB3Y1c5dGtsY3hrc3FyUWkwR3ZK?=
 =?utf-8?B?aDduY1VvclUzZThPcUNXanRpaVVIV3BYQzJEdndrclVRbVppSXZqcVJzWlhN?=
 =?utf-8?B?WVI2VjEyOHlkckVuWTQxL3lNUVlFcGhVYmlqTzBCUGlhVDBqdWJRZElLSkVD?=
 =?utf-8?B?MUFpM0FNME9OVVMvR0xBaCs2VUlrRHV1dzJCTkNjN2JrSGw3UEwyNyt0TTZv?=
 =?utf-8?B?ZjJNVTRtUmRaempYWWVKeUl1eXZRZmpIc1kwV2l3QzlnSm9qenNKdkp3QWRC?=
 =?utf-8?B?YUdYSHNxREZJVFl5SXMzSWVMbVYyUUVEZUFrUU9EQzZtbjFTSVltVTk2bTZS?=
 =?utf-8?B?azRqdzErVlhhb0l3Yk9Zb2ttV1hzT3BMR2pNZktyR2xIdUJrRjVBcWY3Rktu?=
 =?utf-8?B?V0Fwb1NseUlseHhUd01Balo4TXlySFRsT0dGWGtrU09rajF5ZEZWUWwva2Uw?=
 =?utf-8?B?cnhoZDk1SXYwYmllTXpERUY4S0tsaWF5SHZIU3hxSHpuNVVYZHdBUzE4VG1w?=
 =?utf-8?B?akkvdVVSelVMb01wVTQxYWYxUWo1LzZGNE45cUFkOWlRbWNwZTJQUWYzQThR?=
 =?utf-8?B?d1cxMjc4L0toTHZWNi9RMkhaUVlKenVZVnZhRVgvK291RlM5ZlRhUlg4em5u?=
 =?utf-8?B?aE5aY3R3VWxUQmN0SWk0Y3FMU0Z2ZURhTkxUZlp0bU1wMmd3dXZHaGIzVTJE?=
 =?utf-8?B?WUFBSjg0QzJNVy9LWEJoTHoxWFhuQW1hdlI3Y3IzWmN1UENmbitZckR1OFph?=
 =?utf-8?B?MWEzWTc1aXZla2JJZW02TXlaQnNCcjRweTB5QTJoRlp6aUEzWlp3ZUw4VDRx?=
 =?utf-8?B?SWN0U3FtWFBnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWhpOWVFbkdkb3ZMK1MzL2hRL0dzNjJ6QW9WbFl0cUhlZUU4MURSc0FpRERp?=
 =?utf-8?B?SDZadXc4T0dCMUQ5SnpHL0gyRkpyVXJrb3E4Y0VvaTBleVVoZ1g2c0ZrMlhn?=
 =?utf-8?B?eUFaSkhsVWQvbmZEWUJVckR5VTJFeitoL0k4dUd2N1p4SGJpQ0l2NDh4WnQw?=
 =?utf-8?B?V2VuQWRweHNuaXBsYWdXaGpZZXhqemJYSjJPMG1sTEJsNE5JaHRoeXZJZmxs?=
 =?utf-8?B?bUlGZGVwdmUxTXBJM1RiYkoxS1JyNTlIRXlUSEhUOURtQ2tjdWk2ZXVVY0tS?=
 =?utf-8?B?ZVlvYmI3S2tSeDI5SHhrZ01hK1o4bEdiZW9PK1YxT0VPcXJ3NjVlVUxuZmg5?=
 =?utf-8?B?L3JxeGxSaVVDdTJ5WnBHVXJmM0pWdEFadkM3QzFCaUsxZEtYKzhmOWNUSzFV?=
 =?utf-8?B?TXp0NFAvSm5RakdRNzFUVjhYSHJDeEVhbGdGWExJdXJZaDNjbVRjaTlQaS95?=
 =?utf-8?B?Ti9aVC96SkFCQU5TK3FDbTVua2ZlZzNsd3RGYnZsMmRkQWR0cC9weVdSSTBa?=
 =?utf-8?B?bmd6SGE1dk9uWUxLMTFvK1ZsZDNjd29LOExJM2lUejdhdkZhTzlDTExuZGJB?=
 =?utf-8?B?T1BvWUdoS0RmakhpblpjRTVwYVIwQ0pkQ1VBa0xIQ3RMOUFxcGJjYTFSMkc0?=
 =?utf-8?B?b3h0T2ZtNGdhSEJIZ0hXenN6NGN1aTNRWlJZc29YbGFpaGhkZ051cldsWTlB?=
 =?utf-8?B?TSt5Q01VcTlPL051Y2dHMWFCVWozQ0JHUDFiekxveVFkVzFZaXBKc2c3U1Z1?=
 =?utf-8?B?QzlJTlBGaWRVcDgyeER2bzJza0VWdENWNkNzYUtGSG1TWWVxSDkrQ3JOcUxu?=
 =?utf-8?B?cFFVMVBCMVdSZyswQUhEUUxKb1ZzeGNDVXhveWowTHFtdTBTSjdWSFNGeG5Q?=
 =?utf-8?B?aVZJekczTmZzUy9hQXpMZmgyRWNVUHRjTHRURUZSK0dJcnY5blc4SmVZbjF2?=
 =?utf-8?B?WmM0ZFRJTEJURnJNeWJhTU5tVmFkVFV1ay9HTjMySjZpeVY1WmdMZ0FPenpo?=
 =?utf-8?B?TGVTOWxWT0I5Q083VEJtSW9zOG55M2tFZi9nK2JuWWErM1FoRGhRcnR1SGZ4?=
 =?utf-8?B?eHdvUitvL3ozUE1PdWtDYUJNUEpXWTA2WWVDTHZORlQrTEgvbzVCUHJJSnpq?=
 =?utf-8?B?a2FxdnNMZ2hsN3lXbm9XWDNVandQYWN6ZmlBZG15bFB6bnI0S3ZnU2tSYUdp?=
 =?utf-8?B?cDZoeTlQbHZab1lQZiszNHVBNUx2eHRFZTZoeEIvSG1naHdmTURIMzBrdklC?=
 =?utf-8?B?MFlCWUpKNkhSV3NuWXp2dWxyWERyMHkvVW9TWm8veCt2N0Q1VVZEUXBoOEYy?=
 =?utf-8?B?QW01TXZJTFRrREo0TC9WUktDRWJIdWhHeDN2bllNRnFKTnpPMFNFZEtZbzdt?=
 =?utf-8?B?aFdKZjJrZFBJMkhXelhzUk5QNGR4ZG9yaTFwajRRRUZpNi9PQU1qUlJ2dUdt?=
 =?utf-8?B?YldTQ25GczFTeENnZm1qdUFkNVA2OCtCQ09rNnhnQ3BhU2FwTW9mZTlnYVlS?=
 =?utf-8?B?OHA0TTYvRTZ1Nldva0t5cHdWaXlIeUIxWlNpQ0JMMW13aGV6RTQ0ZHZ1VjJ5?=
 =?utf-8?B?RkNFOXdSdDBGZjd1bUp0TUFPK0ZMV0x6OU4ra2xYTFZzLzNhTmFjZnJZVDNt?=
 =?utf-8?B?VlNhV1Qza1ZXVWFMVUZ4OUZCRGt2K3JzNDZkbDNBVzc4YVhwSE04ay93NWZz?=
 =?utf-8?B?aUZDQWRldkJOc2FJTk96UEo0MldIYnZUSnhTc29iQkRlb1Y2ZWd0aE53dnVU?=
 =?utf-8?B?NkM2MnRyaXVkekNxUGV2cEwwMDVFUGtKU0l6ZnRPSGh2OUt1aFJzZS93dkZy?=
 =?utf-8?B?ZGN3K3B4UnhrL3BXOXowNDVNRjNVTU53T3ZXV3g0RHFWME8wNVQ1dUpjUzlR?=
 =?utf-8?B?dWpSb0IzSWE1L0Q2Y2hEZXZZZVM0T0JEcm94NTYvb3F1Zm0wT1V1Vkpuaytz?=
 =?utf-8?B?WE5OVDdQcE11cmh0bUhLeFZjcVQ4RFNKeDRhVkwxREhxTE5iSEp6SlVmeDNW?=
 =?utf-8?B?TnR5R1lqelQyWWZlU2NFRzFTT0RpdWtwM3BvRkhrRVFTQmNsM3gwNXNsUk43?=
 =?utf-8?B?S2ZtYmF3ZDJ6Vy9mZ1ZUTGp5MldRQlV1M0JCK2MxMlVCa1NqZ2VSbWs0bWht?=
 =?utf-8?B?MS9CYSt2TitkVmgwc2JxelZhdkFWdXR1dC83OUZQSURxL0VsOXFKaUlFSTFI?=
 =?utf-8?Q?qq+ka6Tjq+CMaJJsXp24OVhAdj9EH/AJhtHqjMx+wimw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f4a316f-ddfe-440f-4b83-08ddaf34a635
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 13:24:41.9670 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /1z83u4scvTi5VodCiaKroVVUkhKWjN7BSDmn0tJ099nCERTmEossYnBiqnGfZblI8wXnR3lttptc9oHVUC7Bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8122
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

nova-core will need to use SZ_1M, so make the remaining constants
available.

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/sizes.rs | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/rust/kernel/sizes.rs b/rust/kernel/sizes.rs
index 834c343e4170f507821b870e77afd08e2392911f..661e680d9330616478513a19fe2f87f9521516d7 100644
--- a/rust/kernel/sizes.rs
+++ b/rust/kernel/sizes.rs
@@ -24,3 +24,27 @@
 pub const SZ_256K: usize = bindings::SZ_256K as usize;
 /// 0x00080000
 pub const SZ_512K: usize = bindings::SZ_512K as usize;
+/// 0x00100000
+pub const SZ_1M: usize = bindings::SZ_1M as usize;
+/// 0x00200000
+pub const SZ_2M: usize = bindings::SZ_2M as usize;
+/// 0x00400000
+pub const SZ_4M: usize = bindings::SZ_4M as usize;
+/// 0x00800000
+pub const SZ_8M: usize = bindings::SZ_8M as usize;
+/// 0x01000000
+pub const SZ_16M: usize = bindings::SZ_16M as usize;
+/// 0x02000000
+pub const SZ_32M: usize = bindings::SZ_32M as usize;
+/// 0x04000000
+pub const SZ_64M: usize = bindings::SZ_64M as usize;
+/// 0x08000000
+pub const SZ_128M: usize = bindings::SZ_128M as usize;
+/// 0x10000000
+pub const SZ_256M: usize = bindings::SZ_256M as usize;
+/// 0x20000000
+pub const SZ_512M: usize = bindings::SZ_512M as usize;
+/// 0x40000000
+pub const SZ_1G: usize = bindings::SZ_1G as usize;
+/// 0x80000000
+pub const SZ_2G: usize = bindings::SZ_2G as usize;

-- 
2.49.0

