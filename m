Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FBEB3182D
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 14:47:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5293510E0FB;
	Fri, 22 Aug 2025 12:47:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VbKGdRyh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2088.outbound.protection.outlook.com [40.107.243.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24F4510E0FB;
 Fri, 22 Aug 2025 12:47:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bnjqV7emad7NXQtbwBx6xbdTYcMQiPbV/Khp+Hxh4YNZCTlqUDBmlAd8RtH1tBj/seohlejKQaHFCy3HzJEvLLKs16rThtu6KrrI07XYNFLrf1eeJPPLZsiYsSsxUlX1+uL0WsK9KaeOmRsuSEw6RFHpJkkwiyZNuXhnXJyDov3GZ4Hs+ddOFpy6I6v4bGzjQUSlw3kieJl9IV2rPdXS1UVcCP+wypRWbDYQB0pBlFe1tgXNkwYQqCV96rZ9F5h2CgEOFTL9u8FUlnAhOqNsPeJ/orQbq53TTSPb6ibdg/bxshDb2anEpTfkQfEliZpKeMpaZ2khyVOTRTas0T+RWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lb17zIBTsQ7wdg+qXHjaGn9OpBqsq026cSmJOfD+Sio=;
 b=oHUsxTTkbVZbqps/IqgxyInW++x5lHJ45zoyt2PciL9qWlp2zZzLn2QS9z9gDS4gyv9QZJKCfIldbCAX1bk2DkYz3pu9WIBlYAX3Mugm92YBcVhnWg94yyeiOJO2lLmt5pqCcGQhPjCPihBUwKl2qnblTTQUonOgpyblKEhB8FWHecZbzVW7AozmQ1RX1ZuqHDiyuRoAzOpYor234dWOoQRqtMEQlMXNi3bRSvUaCLvSa2AcVRbsTJJsSdg+d3q8e0S7YX/NUNky0/7Nv2JEjrFaWXpTKS4eRpeCEJEPtVmlVPYrz9tde4A78+l+SHYV8Wb/oszUYsQwdNw0/upYug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lb17zIBTsQ7wdg+qXHjaGn9OpBqsq026cSmJOfD+Sio=;
 b=VbKGdRyhklrToXT5rN5Tws5WmUCEFtuY1h/8fhYx+NbqjwQULSvmQANXTEm6oc8BcP9W1cQ8xzNFi39/JgQNIH+bzzdItbQJler9u5kqL4UM1NGVC+pQczH/kCOplol84vdJXOBn9Aar+YkYSArhDr8wkFsej0R3Vd8HlGg/tfWRnPWKadYNAs29Dd6EP0j/fYTWfz+pbyQCFySrkqAoWjRoOPGXRjHHSfjIgKJienf3rDgj+rBdbBBk2Cb5Xngxhs7MW5GjCySUnLve03N0KWG6xdwuVX76dELLztPC3EsbtOEIVQW784hPEJafuPtsOVbPwsv13v7Awa+ABWGp8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by LV2PR12MB5823.namprd12.prod.outlook.com (2603:10b6:408:178::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Fri, 22 Aug
 2025 12:47:34 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316%5]) with mapi id 15.20.9031.023; Fri, 22 Aug 2025
 12:47:33 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH 0/5] gpu: nova-core: process and prepare more firmwares to
 boot GSP
Date: Fri, 22 Aug 2025 21:47:15 +0900
Message-Id: <20250822-nova_firmware-v1-0-ff5633679460@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANRmqGgC/5WQ0W6DMAxFfwXleUFxMBBQNfU/pmoywdCoTdgS2
 k2q+u/L6LS3PezxWjrH176JxNFxEn1xE5GvLrkl5ABPhbBHCjNLN+YstNK1MlrLsFzpdXLRf1B
 kyWqaBuz0QFUtMvMWeXKfm+/l8MiR3y9Zuz6GYqDE0i7eu7UvqgqsRm4sG0CaNE0tDmQbNCOQh
 VYZ01bc2W+155Ro69MXu586CrDGCssOW6wlyJFOcX/iGPhcLnF+/ptrMgdl3gDdP0AADZWpoWz
 qBjFz9hhdWh2FRGFd0tl50rCfPblzmY/cPL9/7IvN0mglw8XLDnM0YJW2bX9FcbjfvwCD6z49j
 wEAAA==
X-Change-ID: 20250822-nova_firmware-e0ffb492ba35
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TY2PR01CA0014.jpnprd01.prod.outlook.com
 (2603:1096:404:a::26) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|LV2PR12MB5823:EE_
X-MS-Office365-Filtering-Correlation-Id: b3d796be-3bfd-4771-52c8-08dde17a1079
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QTFtKzFaYzYybVVjU2x3d09jVWZ1aHloL1hENHU1TGxXVE5XaFZxbVZPYUU0?=
 =?utf-8?B?WnF4dmpzL25nMFVUYlZVK2hzV2ppTnNZWE5uNjhjV0xJUEd0UXBhcm9nc2p2?=
 =?utf-8?B?bnRYNnJtTytwMFE3U25sNWhBN0NGOXZmSTNJM0JTMFlZcnpQOHdIQ09YUXU5?=
 =?utf-8?B?Yyt6eEtXS1VGc0pDTmFyb2pUQU5lY2phSVljZGNNQ0tMTTE1aWtzQlFjcjE0?=
 =?utf-8?B?Um02d3VqdEJVQ3RCVmZsdHpEVXhTNFEybHFsei9NWlRsN0psSUoxUlBFd2Za?=
 =?utf-8?B?ZGluU21Lb291MHYrVDZPa01zVlI4emV1YW15cjJ3dGhoenF3Y0VIQjNNQjRI?=
 =?utf-8?B?T0htRTdFcGZSSzdSZ2JNdVZKRmp5Z0JqakM5TVppd2U5WUU3WGs2bUpBVm5h?=
 =?utf-8?B?VUhzazVTR1ZhaDIvajh2dzZ1R2ZPSG1QM3YvZVRkSG84UUtYTk9rMUpQRVBk?=
 =?utf-8?B?RnRmeDZjL0ZKMVV3QmczTXRIeVA0bWFuKys5Ri9kN2pzTXNPbkRKcXQrTnJa?=
 =?utf-8?B?MmRiaGpaZUNqNE5zVWF2a2xDOFJreWY3V0J6ZVYrc0dGSjBsRnI3N2VrZ0dr?=
 =?utf-8?B?K3VUM2ZVVUtMZ2lPa0Vjdy9xUHl1REVOQUtWdHB3QWN1YWxSOE1yTnFheFFz?=
 =?utf-8?B?OHRWSWJoTzYyWXJYSE1yMFlFVlhQWE9LMjBLN0lMMkh1aFhoNGpBZEZzdy93?=
 =?utf-8?B?K1N5MDdlalhLWDMrMGtzbEpYdmZmN3REVS9iaTd0Qzk4SjVta2ZzWnpyVk9j?=
 =?utf-8?B?YkwzT0lvSmtlYlRiTVViV3BqRnNUbDk1Y2NXWFBXdkxWT1JOMjF4T0JnbjZ6?=
 =?utf-8?B?cDVWSUcrQjhZR3d4MWMxd3M1bzc2ZHhNc0NWSEJRanIxSGtTQkxzODZaZ0FV?=
 =?utf-8?B?Y1JZTkwrRFRaYzlkcktrOFlYazRzcU5hYjU0b0g4aTNjRCtnV1JacTA4MFBI?=
 =?utf-8?B?a2JwZEJxS282NnRubWFXVCtpRk9hT1VuaDY3ZkY4MUZJZnZTSXprRHg3L1da?=
 =?utf-8?B?bTVicjAwVGQvczBEeGNjTXVvTHkvLzEyemlCajFwRnRWZGdnQlQ5OS9aRDlq?=
 =?utf-8?B?K1Y4WENoa1dMcXhaWll1ZDc3VDZGZnZISlY5U25DR2R2UlByTTJ1c3cyV1lr?=
 =?utf-8?B?K2h3dyt0TTdhNXN5L005d3daUGIxU2ZKdWhSN1ZZMVdmYmxqcHVrSlN4WmlC?=
 =?utf-8?B?ckpxWWVGTFZCZFFTUldjNVRrQVZic1NmYXZqSUVvT0xKdDZ0Y3NRUVliVFpC?=
 =?utf-8?B?TFNGYkZuRkxtaWY2dE80ak5Vd1lVajVrZFg1RWpwbkNWdjBpalRrUHZoRGUr?=
 =?utf-8?B?UkdKdGF4Z2NqNFhmbXN0eitML3ZhZkx5NzZqcVdWbklhL2NhdUcxMytneW41?=
 =?utf-8?B?NHcvV2dTS043d080TFpsWExydDhXRnI4bFVJcUhiSlIwcHdqOTB0bXpwTWww?=
 =?utf-8?B?ZzV1ZCtSM0RmK3d0a0lHVFdveWQyL2pWb21mSEx2MG9nbzYzbG1lTDFTYVRL?=
 =?utf-8?B?a0t1eWQyOWZ5aGUvWEVaOHdmY2plMkVVUDVMdlpjQmdQbXdkVDUyL0FmWjRH?=
 =?utf-8?B?RUdlTHloU0pnVFlUdzZIZ0xZa3hhTTJaYmRHSmFRTm1mdEprMnNQQzBnN0RB?=
 =?utf-8?B?UHNoUGRNUmNMUEZSYVl4VTQyMFlWRlZJdmx1d1FWYXlVSENKajlwbWlqcTll?=
 =?utf-8?B?cnRPT3VKcEdLMGcyQ0VRbEpQUHE1dmNoeU9Dcnd6ZjdrL3ZqTzVOeTdIME9T?=
 =?utf-8?B?b3ZTaXFaSndPcUZDUkxob2VKMVViY2tJSkVLTGlvS3h3Rzk4anJsMkNaNFp2?=
 =?utf-8?B?bmtGdVM4ZjNmS3lka3FQd1dVZUpWUjBGblhrZzRVRGNIQ1NLc3VweEpRcmVU?=
 =?utf-8?B?VDhyN0FPcGYwc2wxNnFoV2tDUHZiNVk2UzI4OGRreHlHNFJhdVkrOVJtWXBI?=
 =?utf-8?B?bUdUS2lkOUlUbkVuZk56aWRkYmQ4cGd0eVhOTXNNQlNwMmcvZGp6TTZjb2Zs?=
 =?utf-8?Q?tcUE1xzxgJ2CYDcUHZpMZ4TzJHJsSA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3997.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1ZJSkNPTmp1TkVMY0J5MVVSUWw2VitsMjZxMmJ5WjhmNUd4akRZY1dLRXRw?=
 =?utf-8?B?WnhYNFk2R05JWEdFTzRnbUx5R0dCaUIyU1cwTGc4cGtHS0MvOExGNGRrd1Rw?=
 =?utf-8?B?OHJiaXN0cVVLeThJVVdoMGRidWhtY09VcHovSzFBS1E4M0haaXVPMU9wZlI3?=
 =?utf-8?B?Q0pid0NqVUNFMVh6NUw2T0pyczI0a04waVg5cCtjcDduL1V2eWsrQ042d2FO?=
 =?utf-8?B?UUc2NkxBdnZYcGJQUjlrN0NuUmx0U28valV0RmxKZUI4aVBjUFpZUGZXUnFn?=
 =?utf-8?B?djlmVzhDU28zT0M3Q0tYMFVVMDZ3WHBGT0VrLytjamZBRHpENVBRbnJrSE05?=
 =?utf-8?B?dm9ZUmZ5U1hCMi9XVkVBMlVBNlNUNGdVVEtKVnAycVFZWmJiSjdvM3pjd2RD?=
 =?utf-8?B?Zk84aURqVC9pVWZwNERCS2hoUldURVNKVEhvaWZkck1KVjFIdWd5TktmTG1r?=
 =?utf-8?B?WHppdUNCYWFQNTUrbiszd2RDZlJROUZ0MUxZOGoxT0p0VTNKNk1aMlZwSUZX?=
 =?utf-8?B?V1FzRC9YaHpDY1NzU2s0OXh1WFA0Y3JkeDhTQ1ozL0M5MU41ZjJaWlpuQURl?=
 =?utf-8?B?ZEdsMllOakFUbDJjMm5pckRBOERlc0pWcjdDMjJPYmVGNnZaVkovdW90VTE1?=
 =?utf-8?B?NjZhd2VRckMrN24xaDRZaUN0aC8zM1ltVVBIUUxMSnRZeE1VK3czeGR3VWda?=
 =?utf-8?B?WWIwaXRXTXJmUUdJWmVHRm9kR2Z2T29iSGJMZ0R0TWtHRitYUVBDZy9lRVRs?=
 =?utf-8?B?b1YwRCtQWkpGcUJGN0p4NnN2OW1TeEtZR3ppR2RCanluRnlxVTdpakJXRDdG?=
 =?utf-8?B?N2lVQ3ZDeFhOakZINkM5ODlZNkNxUUIyT1VvUXFMTCtrTCt0Q3RBQ2sxUHhx?=
 =?utf-8?B?SnVQN0RNY2ROSDg3am5rK2svby91ZnRUWmJlOEdvbEJFY2liQkMreXg1MFpu?=
 =?utf-8?B?Q3ZTNW5HcVR4MmFtL1ZTRzJld3A4NUw0WUhiaWh2Z1lSY3ZQdXBad1VmVklQ?=
 =?utf-8?B?YWhFeUpnTU9jYkxqbHVOejI1MXdIQ05MSHcrcjY4OEh2dXdUdXVxVGw0dmNX?=
 =?utf-8?B?TEtUKzgxS0QrSHVYdG1teWF2RXYxNkFhMWJ1VEVobDVQVmc2dDNzSTFrMDlm?=
 =?utf-8?B?OEZOR1JnWjg1RVJFZWFPVGZyVXdLR0F0SWNFdEVSekc3dUJqRnBtbGVQQ0ta?=
 =?utf-8?B?RmZZczFrd3FSNi9JWVgyRU1qSUppT3hJTHoycVRtaE1yUVdYQ2ZWN1dQM1B2?=
 =?utf-8?B?c3pxRStRVjR2YTFVMGtkUEVoUm5qdW5TMjNSbUhwZEJ4d3hUSkU3cnFqVllu?=
 =?utf-8?B?OEpNcjUyKys5alZnZFBxVHZhRVFxVENMclVUUlphR2NMUzRKMFliN01CU2Zy?=
 =?utf-8?B?VEN3dEZ0TWd6b0l4eGl5QjBQR01RQjFqcFUzb2xnK2JzbWpLUkNhdDZWQVFI?=
 =?utf-8?B?S3NoS0hkOGc4K3dvaWpRSHg2eUR6RWUwMnNBSDFRT0JkdGN0TWwwNDJEczY5?=
 =?utf-8?B?eFYybUpzUEFWMFYrRllEOGJPWkJJN3MwZ214QVB3VHI1cWZQQWlmSGpIellL?=
 =?utf-8?B?WEhjUEpreXgrR1NSMHpJVzFMUnhlZ2NGVUViMmZ1LzBFUHg1ZWhmcFNLK3JM?=
 =?utf-8?B?ZU9rSllQaE5WVVdXT3ZHMVFzd0cvZDcyaW5sV01DbVlkWDc0d3l4QlVkRjE5?=
 =?utf-8?B?L252N3RWVHVMQkg0V2wwbVkxaDJlLzZ5elROSDkvbDFwTjZreVZtdDl3SHh3?=
 =?utf-8?B?eDlxWE9ESFZ5NHR2K1Zxa0t2dlZKUmwva2NqM0hFaXNzQmtZZXlqc3BaNUhO?=
 =?utf-8?B?QUxTR0Q2RG5ncFRTTzZkbWhwNW5haWtSa1oveW93cFE3WDNkUTJLOEpORVl4?=
 =?utf-8?B?OVhVVS9pOTVLdEIweGxBaDd0TG9tL25MY1ZWdFhSY0tCRzBPZDFHYTNpcmtO?=
 =?utf-8?B?VWpwQisyODV1ZGZmd3h4MHMwbWpDQUZIeFNmRjQ4VG9LWEtHS0tXb1orYVpw?=
 =?utf-8?B?bVh0L1I0YTIrdStWTUwydDZ4NVlqalJyOGxyMEhkV0NMVGhmMVZucTBJOEMw?=
 =?utf-8?B?bTlub2JZcWdMRkJuWGtPYXFOVmVSamRXRFdWSFV5LzhOMEJCZ0JFWE9RVHJm?=
 =?utf-8?B?N20yTFVuL2FWQ25uMDh0cTdHM2FxS1BNQy9rejF1OWQvNWo5YlgvQlRRU0FT?=
 =?utf-8?Q?aSEQqHtVYV253DnI2X4swHe8B2jhPYGyciM5+Lh4DvNI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3d796be-3bfd-4771-52c8-08dde17a1079
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 12:47:33.8038 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OqgDQ3A7uKaSppjBhGKUjJom1ViOzIjfgKhp3YG3TzTDwiZJx8egEgB1eTRpKdH//JAYiDsIKsu0kIYV0r8BcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5823
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

This series makes more progress on the GSP boot process for Ampere GPUs.
While it does not contain everything I wanted to include, the part I am
sending now looks ready to me so I didn't want to delay it any further.
However, expect the inevitable v2 to include a couple more (hopefully
short and simple :)) patches.

At the end of the previous series [1], we were left with a WPR memory
region created by the FRTS firmware, but still far from the GSP running.
This series brings us closer to that goal by preparing 3 firmware
packages:

* The Booter firmware, which the driver loads and runs on the SEC2
  falcon;
* The GSP bootloader, which is loaded by Booter onto the GSP RISC-V
  core;
* The GSP firmware itself, which is verified and loaded by the GSP
  bootloader.

It is a rather complex dance that is made necessary by limitations
regarding the level of privilege required to load code onto the GSP
(this requires a Heavy Secured signed firmware, which is the role
fulfilled by Booter).

The first patch is an addition to `FromBytes` that makes it able to
process the unaligned headers contained in the firmware files by
performing a copy. Second patch adds support for a header commonly used
in NVIDIA firmware files.

The third patch parses the Booter firmware file, queries the hardware
for the right signature to use, and patch it into the firmware blob.
This makes Booter ready to load and run.

Fourth patch takes care of preparing the GSP bootloader for execution
and fifth one does the same for the GSP firmware, which needs to come
with its own device-mapped page table.

None of these firmwares are run by this series yet, as we still need to
build the data structure that Booter uses to load the bootloader. This
part should come soon, in its own series.

The base of this series is today's nova-next, but there a few more
unmerged dependencies:

- BorrowedPage, AsPageIter and VmallocPageIter [2]
- Rust infrastructure for sg_table and scatterlist [3]
- FromBytes [4] (although the current code is based on a modified
  version)
- The Alignment series [5]

[1] https://lore.kernel.org/all/20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com/
[2] https://lore.kernel.org/rust-for-linux/20250820145434.94745-1-dakr@kernel.org/
[3] https://lore.kernel.org/all/20250820165431.170195-1-dakr@kernel.org/
[4] https://lore.kernel.org/rust-for-linux/20250811213851.65644-1-christiansantoslima21@gmail.com/
[5] https://lore.kernel.org/rust-for-linux/20250821-num-v4-0-1f3a425d7244@nvidia.com/

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Alexandre Courbot (5):
      rust: transmute: add `from_bytes_copy` method to `FromBytes` trait
      gpu: nova-core: firmware: add support for common firmware header
      gpu: nova-core: firmware: process Booter and patch its signature
      gpu: nova-core: firmware: process the GSP bootloader
      gpu: nova-core: firmware: process and prepare the GSP firmware

 Documentation/gpu/nova/core/todo.rst     |  17 --
 drivers/gpu/nova-core/falcon.rs          |   4 +-
 drivers/gpu/nova-core/firmware.rs        | 200 ++++++++++++++++-
 drivers/gpu/nova-core/firmware/booter.rs | 356 +++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/firmware/gsp.rs    | 116 ++++++++++
 drivers/gpu/nova-core/firmware/riscv.rs  |  89 ++++++++
 drivers/gpu/nova-core/gpu.rs             |  11 +-
 drivers/gpu/nova-core/gsp.rs             |   4 +
 drivers/gpu/nova-core/nova_core.rs       |   1 +
 rust/kernel/transmute.rs                 |  17 ++
 10 files changed, 784 insertions(+), 31 deletions(-)
---
base-commit: 331c24e6ce814af2af74bac648d1ac1708873e9c
change-id: 20250822-nova_firmware-e0ffb492ba35
prerequisite-message-id: <20250820145434.94745-1-dakr@kernel.org>
prerequisite-patch-id: 0e1b1f9a665317ff569a37df6ff49cd1880b04f8
prerequisite-patch-id: 178b864e6d1b88ee299dcc05d1a7a4c89ec7ed51
prerequisite-patch-id: 7f72c4bfd0e5f50b6d2f8ce96751782894a3ba81
prerequisite-patch-id: 62fa6de7d3ae99dc54c092087bd716e6749545fd
prerequisite-patch-id: 3d14d56ca93b0831837aa26b802100a250adeac6
prerequisite-patch-id: 7a12f4b0e7588874ce589b41b70671dc261b9468
prerequisite-patch-id: c44763ec35c4e4431e769df088b98424cbddf7df
prerequisite-message-id: <20250820165431.170195-1-dakr@kernel.org>
prerequisite-patch-id: f2d7df375d86161cebc32792ff68022d11aaaab6
prerequisite-patch-id: 363279599349e5efc7069a63b3f0574639e25418
prerequisite-patch-id: 3497e36edecb861f7d256eb1757549de9b0a8ace
prerequisite-patch-id: 0be42023d4aad663964b239089399b497b59903c
prerequisite-patch-id: 24833689bdecd3fc7a604e13bfe203ccd2fca6f0
prerequisite-message-id: <20250811213851.65644-1-christiansantoslima21@gmail.com>
prerequisite-patch-id: 9448855f52cb137ad246ae5fde9eab12eac5da94
prerequisite-change-id: 20250620-num-9420281c02c7:v4
prerequisite-patch-id: 50077433250cad1cf60eb8f85c78e532ac91852e
prerequisite-patch-id: 021a41cd35f09790ec383521ecc9b4c167868732
prerequisite-patch-id: a1ec5698a198d4aad45432b50d42f401e3db6452
prerequisite-patch-id: 8565b054c432bcc9a3a0d0121a934c74ef36d535
prerequisite-patch-id: 19d008deabb88beb441d2398f120ecb426fbdb43
prerequisite-patch-id: 3bc0d2be065a900d224ff8c1bc4450abfe9eb2cc
prerequisite-patch-id: 5b4eb0f71fa2ccf662594819fa79fd932f4f164f
prerequisite-patch-id: 9058ca08cd149444b5f910e4bb4494a890d1a733
prerequisite-patch-id: 8804806f7cc605feddded0804eec8b8362d7b965
prerequisite-patch-id: f999cabde51824432a1bf60817518d1ce189eb76
prerequisite-patch-id: 49e15538e142f2e7dd4f1ba0cf2fd891bd265d36
prerequisite-patch-id: 2ecf9b1e26b5203065bfac4ccf74301b3bb4fbe6
prerequisite-patch-id: 1af6ec7c2ce8503fe476985f59949dcd150ee6bf
prerequisite-patch-id: ac72e72b3affece504bff76b60b88769ff200a2f
prerequisite-patch-id: 7dc0a6da8c9727d27250cf730f8aaf6dd8b3d8c7
prerequisite-patch-id: 31a0a2469de9ac965186098072753dcc749b40fe
prerequisite-patch-id: 7e6d1fc7cf910decf481d135a19b0add38da2b2a
prerequisite-patch-id: c72ab11e9346de71eabfe0e6466636d5ab15a5ba
prerequisite-patch-id: 3f236fdea8c4b33620d0f863fea573b46ab0ded6
prerequisite-patch-id: a8ab42d0c9c3c837bb4cacb02cef585ef163a27e
prerequisite-patch-id: 930a1f26364ed67e0d6b85c96251028fda43c80a
prerequisite-patch-id: f1bc1fd46145a66235ab7475463584e1803882a3
prerequisite-patch-id: 4a2fd7bd8d13dc2feaf68e0dc681546ce2ab3e40
prerequisite-patch-id: dd0df8d299dc0615a88cc0019f38bc09cee31ed7
prerequisite-patch-id: 56a45978f7b956c94ec66eecd4b438706d5174ce
prerequisite-patch-id: e9bceff31bbf653d2641194b97eb1c4e5d8b93ee

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

