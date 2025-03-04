Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6133DA4DFD9
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 14:55:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD2B110E37D;
	Tue,  4 Mar 2025 13:55:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="d3rtytCx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2055.outbound.protection.outlook.com [40.107.244.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E65A810E0FA;
 Tue,  4 Mar 2025 13:54:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RluN3+Z4dGJ/NhvEzsKCDnu4DIzK8HvuqzhoDnZ2bjfOyl8WXZvwtD/6PBX1CqxYt8ZEi94ldXgy/z6HQm2tVrQttquH8qZGak6c+snpZpNsYKiv7B1EKtEzGrIifdiBYcXH69enLc1kTrjZmWVk9P00gWGZo6aRI4EO7L0qxelldN43bj3hlxn2/Yqkpy+lRFyDYSsS8bAC8zagxkw7pr3M17XW3GMyrvkrG0XU7fMp0Kcax6SVyDYcIKhMuY60DYcKKn2weiQ2nFN4N52NLBwqqDufXK4QWvo6lP0pwv5i1am2/2YS1Y3T/9op5eHejNG1RSLO6W3uCPWAFtjvjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0tEH+uLjg2fcFEU6XgXZwyWVnS/4TS91LIoizRIz5cc=;
 b=OaMhtK2RrZ5Dn3dHhDcxRt4KIA+2uJkznwumz1JRY25g8GuK4mCvt0EPcCjCz0wbxbvcTQxmYupSeOCC4aQlIqCdCkzdheoFlNeJpPITq87t6JCip0cOQg8NfQkgqbwQlJkXaCbnQPMGsWPiowWYvKyQgvSUZW0MIvd+DqskDDMmLZ5ioF8499I2/AWYVdiW9JEsilFSt9dIbSxxa8jgj2X0A1SDcqh6UAk64QasxBGLjfku41+10m+p98qE/Tw9TdxPHh52iEHbppfwssdcw32P/YlCZbuOv8MIYMQv0JE4nya4O+2lrLotnS1TYtdUgUQAh2aCvx+PwM3nrzvsHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0tEH+uLjg2fcFEU6XgXZwyWVnS/4TS91LIoizRIz5cc=;
 b=d3rtytCxPNWqSHdGZzx2v472us300pPk8pfqxZTQ5zaGvbrDcdm6rU7jUOL0q3lNhMydDN2Dhlf6VHzfhqJNJaKop00BK8hdU65OdKvchboLGTetXA5pQVQtjo4P2pFhK6b0W1+1G/LY9u9X65eCRiM+WVv2scFCkxeDfjN2njlrdUoVyzlwNtxrUzzAL0YyK5dtX/M+LOAakTvFk2RBgG7ZQjbJtmwyK799a4ZIls0kvS0KAweE1SAvv33mbYA5dxLvpbvAQac/sJ5W6L64j3y97iK2yQmnY9UyWeKDCmcORd4/Ef16sB/VCvFHD9dpsVzeH894r1mkmhLnvA5mAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by DS0PR12MB7874.namprd12.prod.outlook.com (2603:10b6:8:141::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Tue, 4 Mar
 2025 13:54:49 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316%6]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 13:54:48 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [RFC PATCH v2 0/5] gpu: nova-core: register definitions and basic
 timer and falcon devices
Date: Tue, 04 Mar 2025 22:53:56 +0900
Message-Id: <20250304-nova_timer-v2-0-8fb13f3f8cff@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPQFx2cC/03MQQrDIBCF4auEWdeiNkbTVe9RQhGdNLOIBg3SE
 nL32kChy//B+zbImAgzXJsNEhbKFEMNeWrATTY8kZGvDZJLxaXoWIjFPlaaMTHX9e2FC9OOqoV
 6WBKO9Dqw+1B7orzG9D7sIr7rj9H/TBGMM22csg6l742+hUKe7NnFGYZ93z8NP0oYpQAAAA==
X-Change-ID: 20250216-nova_timer-c69430184f54
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0086.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|DS0PR12MB7874:EE_
X-MS-Office365-Filtering-Correlation-Id: ceec0699-8ce4-4674-a785-08dd5b24173b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S3JRanpSWks3YzNyeXFvNStLelBnT2lDdVpxS1hYY1d1V0JFdnJDc0lsLzR2?=
 =?utf-8?B?RitmZ0pUUnhkRy9wTm5TZUg1WVFDdGhaN3hQenZsSTdQNlZjb0VEVWNkMllL?=
 =?utf-8?B?d2x6NDNXdnMwc1NHNjZ4RzAxbWorc0ZybXZBM0Evd3hEemlzZlNkQnN6Y0xY?=
 =?utf-8?B?K3lhNm5LTVdPdWtXcUhySEN5RGxnODRGeTdydVYvNlhPY1VwdUx6QVJ5RmNu?=
 =?utf-8?B?dEdLQXovVGY2OGtmRHBtQUgwMk14Q29zTzFFMjlBWkNnRmVqQXNxMThnWS9D?=
 =?utf-8?B?Mkp4N2ltTlVWdHpjRFpQa25KSXQ4c0VlRlFPdjU4Lzh5Y3MvM3M3a3F3cWlR?=
 =?utf-8?B?aDE4dS9wZ0dZYXpCbDdralNONlFHS3hDU1BHZ1N4b2VERG1TaEFFeFE0NXA1?=
 =?utf-8?B?WXhNenBOeklFaGxVVTNtTVg2TWtJSW5adFMwOEFkQjlwNkpleVlnK3hsOExr?=
 =?utf-8?B?Q0F5OHNBSExtMTBqYVR1YkR6SThwL3h5NW5HMklJMitqL3BjMG9CZkNnQWpm?=
 =?utf-8?B?eGpVVFVuazdITXhyd2gwcFJLbWVDemw0SWhib3VOK1F2UjVFM0FoTmJDU3VZ?=
 =?utf-8?B?T3JjckFld3NUV0cxTmpkdE9XZlROeTgwYlJSRHhqNnVhdkYwZHI5ZGhCT3hC?=
 =?utf-8?B?M3A2amxqWkFVNkpJUUNwQ0d4dzc2blNvVk1LazNINUp0OXRsVHJZUjhCcFI1?=
 =?utf-8?B?VTBLTHNjdFdzTXBtUHVOOUtlQ09aNUpqZFZHQjVkeUxhVVdld3ZpTWFZbUl2?=
 =?utf-8?B?V3Z4Rk85RkpUWHFuanhHakxFY1AyVVFNS3dHL2NvMk52a1BqdDhHWW9NSFhO?=
 =?utf-8?B?dlorU3lwZGlOUlYxeldtT1laYkViNitEMTR0UFZ5N2Qwc2pmTUZCdVU2Mi9q?=
 =?utf-8?B?dk5ESjY1Y1V1aFhGaHJXTjM5cU1OcGxQeFA1c1Y3K2tXb3JFclQ1SVpqd3NQ?=
 =?utf-8?B?Y0tpeEozaE5lR2hYdVVRcVRBRXFmL29NdjgzQlNEdHdvWjdOSDlIVnREc09X?=
 =?utf-8?B?b0oxb1lTc0R1M3Erd3lwZEg0NlhHZWQ0d0hmY3pJZ2FETEF4K0FSUFJEb3h5?=
 =?utf-8?B?YXJZY1pTZk5FanJuUE9vNThFQWtSQzNycW1NNmhKSTJhN0l2V25WbndQT216?=
 =?utf-8?B?TFB4QUp3c2c2LzBZMld2cU5McWl3SDlxZmxhQWlqK0F6ckdMRFJWNTVsU1NO?=
 =?utf-8?B?RlU3SEZzcGhKNFpUSGkrS25WU2szcmRSdG1PNEYwaVU5ZGNVaWtXZ3Y4UVhG?=
 =?utf-8?B?UlZPTllSbUR4MUdWM3U2MGVKNk9SaHpiZUZjSWlMZll3a0RBRHZOU1hiTjVB?=
 =?utf-8?B?K3BuS0FaN0VVNzV0c3FTakpmb2hmUzFwNVBSUm9sYkxOQUx5bW0xay9uSTlM?=
 =?utf-8?B?MWowejlIZG0rUXRZaCtXbmFJcERxVnJQc1ozODQwbk9nQW9OWlk5V21TT1Y2?=
 =?utf-8?B?R3NJMmk5Q0ZCZkJrdjlHVFRzcW9rd0tpYk5Ick41TUU1RmpIeElwUGtEcFA5?=
 =?utf-8?B?dnpJcFVaZHp6L090WGplcVc0eXlJbWFpNmdXTld5MUJ0NHZwaWIzRUhXMUV0?=
 =?utf-8?B?bXJuck9FYWdxZUdlUnFseWxJMVBGM1paWk5mNmZPTHpJY2pDT3NNSEM3TGEr?=
 =?utf-8?B?dWsyL1FIU29HaGZqcVFRU3JrVWp0akEzYUliS1E2Qlh4bXc0MXNmRnBtTmZI?=
 =?utf-8?B?elVtaHlzWDNXRDl3eko2TU1nWVpoWnBhcytwMWQ5STRaSExiNnIvczdIdGUr?=
 =?utf-8?B?YmRsWlVLYTd2dzNFcE5SeEx5b2pTNUI1UXBHVEJtU0wvU0ZyWTFVMHJ6T0hO?=
 =?utf-8?B?RGpMMjhHclFxQVlJT1BZb2FUK1pRdXdmSnk4M2ZJR3I4Q2x1TEhoUzM1VUF6?=
 =?utf-8?B?b0NXN1UyYVpoZ3l5ZnVEQXFpdkZiM2FSbFpiMW1DU1FUMU16dHh5alBJc2NL?=
 =?utf-8?Q?SiA915Pi+7g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3997.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjRjTzd6NkE2Z2ZNMmRCaWUwRWF5VzJKV1ZTM1Z3enh2b2tqb0JlL0xwaUZu?=
 =?utf-8?B?ekVoNGxjbVpQV1FXZDNpclV5QVZrL1hiSDEzaWNqRnk4SUV1UTFXZ0xZU21X?=
 =?utf-8?B?M2xXV1NQRzVZZFlGbi9qYS9LQkx4VEVXZ01VbTJZYXdnOXpvbE56UW9rWTFH?=
 =?utf-8?B?bFdJNFh0aVhvTEVMektXRjcybWRFVlQyQXd5MlB0VENGVUdNNGZZVkl3TUs2?=
 =?utf-8?B?VUxKRGZNRm0xV1NUSk96MTRkKzhpR3cwUFZxQnFNTEx0Vk1Gblp4eWpkb2Qw?=
 =?utf-8?B?Wm9wR0lRc2RUL1ZLek9ST3AzUk9xbTk2eE14QXFVNnBTS0pid3gxaWwvSEUr?=
 =?utf-8?B?YXB5VFlnQzZBeHluUEQ1MzVGYit3TGl0RHQ1T0c5QkVsNUFDV25aTUpCb0Fa?=
 =?utf-8?B?UzF6S01vK2FPU1JjVXN2YWpOU2l6OFNNQjRsS1pjd1psSDZMeVQwSnVrRVp1?=
 =?utf-8?B?TEtKQWJEWHlJLzE4UzJ0cnFOOUNlMldJd0J2WEdwVmoyRGQ1UHh0UmRNYmRX?=
 =?utf-8?B?aytrN1pFc1dGM2U0MU41NmNJZ3N5b0gvSmR5WUtuNmRmZHBwSDJOZnFkcVUv?=
 =?utf-8?B?bUVOVm9vQm9pZWNPd21pNVJRZEpQK2c1QmpINEU5emk4VXVHUUp4N3dWS2RX?=
 =?utf-8?B?cFhMeEZwQTRwNDhMYkpLdklDVmJXMmhYY3dpOVhBMis0ei9CTjJJTkM2RnZ2?=
 =?utf-8?B?Nmdhb0Z4T2JLNXJoUnlaUmdWbUg4azhudUNzUjJPRjNQdTlDUGdFOHg2M3RV?=
 =?utf-8?B?YzZJTzhVdXFjdXhtcTR3amRNMnowRVNwWnQ4MFRpa1NNRXRzQ2lJUkZ5MXhS?=
 =?utf-8?B?a3krRW1aZEMrcDNTTTkxMUZ0TC9lb0txR2FVbE9QZlR6dmJvcklkUnhKZUxu?=
 =?utf-8?B?Mk1Gd3Q4c3MyMGlXc2FidW02cEJHVG9vWXRwRU9adUtPNm9WRlVNSitrQjF5?=
 =?utf-8?B?VFFoUGNpQVliaWM3SmxadytYQVlBKzlYVnd4OFQzS1ZYTnA1RjhiRHVsTnkw?=
 =?utf-8?B?aGdNQ2RKSHN3NFBVeE5haDRMb1FOZXhMTEtWYUw3dzB5VmV0bzU0cVBWaEgx?=
 =?utf-8?B?MU1YbEVuL1RjQzlRdXN4VjloYWhjUVQzTHVLOVUybldsakZkYjhEVktycVBj?=
 =?utf-8?B?V0RYdVZkY2VRVHJYOXo2N2taQjRDTFh2TGpKQ1FZaUlaU3hEcFZFY0JPWUwr?=
 =?utf-8?B?a0ZNOEJYc3c2endoUmJpSVBFZWNhQWpCcWlNTmtuTDY0SzdmSUltaFlFaDd1?=
 =?utf-8?B?eCs1UFBBT2lvbUVwbU42YkFOSXIvV1I5dzFkMUR5WmFxVkRLRndDVnRnN0FH?=
 =?utf-8?B?OVpxR3pYN3dVMHJtZ3RsMUdFMVpxZkZadlZtRHNUL3RmcHFiVDlwbjlUc0Y4?=
 =?utf-8?B?R3Q0cVVMNEwrc2FadkFpaGdxVSthWlVmNVROWmJGYTBLTGM0dVlTeWZ5SzZq?=
 =?utf-8?B?VXllWEl1b3lXak12UTJpWkFqdDN4V3gvMHM1ZmFpaTVCOFR4VWhRWDhJRGVB?=
 =?utf-8?B?WmNWS0ZuQW1NMy96bVdWWGYzMnpIZnhKc0hyQlJzVS8xZkJDUkRKUVRMZy9a?=
 =?utf-8?B?Ym92ZjhDR0ZFQlVYQkpGaTNsODY2Z0tJYjFHbG9MNm5RSmd5RkVKdnN5cWdZ?=
 =?utf-8?B?UHAvNUF1ZFlIMnE3MmQ3enk3S29PR1JUUHRjV0pybW5xR09YdjVkTVA2RGVj?=
 =?utf-8?B?QVZPNTNpOVl2bzJYdnRQMFc2Z1ZPdUt2cnZpbmlJWXpIT1VCbWQ3Zm04RVNm?=
 =?utf-8?B?WkFZQ1YwSjNLWjNNaENvb1dpVHh1MGlhUFNqbXh2QzdGaWFBTVNFZ1p2bmRj?=
 =?utf-8?B?VGtoc0JudWZ5a2x1OTJCRFhTYk1EcXcwd0NOMDl1bVVVQkVySWczZkVBV1Rj?=
 =?utf-8?B?aXFTVWJPMWtZcWtoQkFMdlFURU9RK2RlZmVXRWhHb1IyN1NaQXVIN2V1NjFM?=
 =?utf-8?B?ZitsZVJ6eWQwaUZkMEtnUXF6SWxaVlFVOWdaK0swcUg3S1RnWm9TdWJ0bFd0?=
 =?utf-8?B?RTg2QmE5OGM5NGpoZ2p3ZDdVbDYvOG9KQWN5eHFJT0JYK2l0ekhoaVBKTExl?=
 =?utf-8?B?Z2QxTDhTWnRwaFhSc3llKzJMY0xobUtzSGJMZkF0NmNmUVZITWhjekFNQ2wr?=
 =?utf-8?B?WDliVjVCdVZTbFNscm13ZVg1UEVhR2x0YlA0WC9rZEcxSEFxcHBPbVBPNmpJ?=
 =?utf-8?Q?pi53NydaIzkg1ouQmItqfV82sO4UT19z6Bc5yHkJLpiN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ceec0699-8ce4-4674-a785-08dd5b24173b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 13:54:48.7553 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +BYQSBn9LghilzmOCkwecWVuADrYgC2A+0yROq/6Fd416XRR6ftDvOCcPSOIehrKIeUi1ZXatojvRd+TLkv0Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7874
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

Hi everyone,

This RFC is based on top of Danilo's initial driver stub series
v4 [1] and adds very basic support for the Timer and Falcon devices, in
order to see and "feel" the proposed register access abstractions and
discuss them before moving forward with GSP initialization.

It is kept simple and short on purpose, to avoid bumping into a wall
with much more device code because my assumptions were incorrect.

The main addition is the nv_reg!() register definition macro, which aims
at providing safe and convenient access to all useful registers and
their fields. I elaborate on its definition in the patch that introduces
it ; it is also probably better to look at all the register definitions
to understand how it can be used, and the services it provides. Right
now it provides accessors and builders for all the fields of a register.
It will probably need to be extended with more operations as we deem
them useful.

The timer device has not changed much from v1, with the exception of
having its own Timestamp type to easily obtain Durations between two
samples.

The falcon implementation is still super incomplete, and just designed
to illustrate how the register macros can be used. I have more progress
in a private branch, but want to keep the focus on the nv_reg!() macro
for this review since the rest will ultimately depend on it.

It would be charitable to say that my Rust macro skills are lacking ; so
please point out any deficiency in its definition. I am also not
entirely sure about the syntax for register definition - I would like to
keep things simple and close to OpenRM (notably for the mask
definitions) to make it easier to port definition from it into Nova.

[1] https://lore.kernel.org/nouveau/20250226175552.29381-1-dakr@kernel.org/T/

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Changes in v2:
- Don't hold the Bar guard in methods that can sleep.
- Added a Timestamp type for Timer to safely and easily get durations
  between two measurements.
- Added a macro to make register definitions easier.
- Added a very basic falcon implementation to define more registers and
  exercise the register definition macro.
- Link to v1: https://lore.kernel.org/r/20250217-nova_timer-v1-0-78c5ace2d987@nvidia.com

---
Alexandre Courbot (5):
      rust: add useful ops for u64
      rust: make ETIMEDOUT error available
      gpu: nova-core: add register definition macro
      gpu: nova-core: add basic timer device
      gpu: nova-core: add falcon register definitions and probe code

 drivers/gpu/nova-core/driver.rs    |   4 +-
 drivers/gpu/nova-core/falcon.rs    | 124 +++++++++++++++
 drivers/gpu/nova-core/gpu.rs       |  70 ++++++++-
 drivers/gpu/nova-core/nova_core.rs |   2 +
 drivers/gpu/nova-core/regs.rs      | 311 ++++++++++++++++++++++++++++++++-----
 drivers/gpu/nova-core/timer.rs     | 124 +++++++++++++++
 rust/kernel/error.rs               |   1 +
 rust/kernel/lib.rs                 |   1 +
 rust/kernel/num.rs                 |  43 +++++
 9 files changed, 639 insertions(+), 41 deletions(-)
---
base-commit: 3ac10b625b709d59556cd2c1bf8a009c2bfdbefc
change-id: 20250216-nova_timer-c69430184f54

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

