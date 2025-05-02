Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5510EAA69F3
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 06:58:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A91310E8B2;
	Fri,  2 May 2025 04:58:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cSxgYKEn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2087.outbound.protection.outlook.com [40.107.100.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A411910E8AE;
 Fri,  2 May 2025 04:57:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=llSQb72crNMIXw0Fzqxy8UF1AyP5QXIGKCmPcu2AJQAc+vm+TpbaVKoiJKX9EYcEtT2UcMY8NOmGFPx8Dtpnt+mENGLUWtOyPfaBEeCpdNnxK1Q3S+EFcpOYW6PMDr8DN5kZHOtxefQMvLAulGBibMbcQHPs8krc9Zdk9/vo4MBxQaCW5ktM7jZDLDzOgwQKuFtrAq3RDOViTTaxS3Mjfv25NQ54EDR2QRjb0X0WRuhBv3J+b1Ll00l4UEDcKjtmWCDg4DsJMYPICI4u9foHGmh5TGep7yi6EOP8SM32iP9gSFVcSNCZfzlVSU61yvftURWV8/QjHcgbgXr6YSvC1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T5bQfOH29AKQnQUu5TN+6QKVOOkwBXbrziqIwOn6Tro=;
 b=wpirll8JNCksC8Zk0rfOI8Si6bCRGpcpxD3kfehNyUiYgsccCAyfu51stD3VSJGo0SaWqRQSVZh+jw/hcrI4zRk+DxOjr0VT3OOoFWwW8WLzRY16VuXVxLIlZaAZ02M7zX9MAWxcMJNIT1J5bFUfgC2O4LItK13i1KXPSq2Ho/7vu2Ye1/kcacgREbu76ZcpQ0fC//2PRyAbKfCVULpXhEP+xH84y3DPdzlyEpO8YOJueJdtt0zOJoOJEEdhJtFV4KY6ftXK3OOox7ntJaKt6riFqOdqfvGHAbIEipqdQEnXGSqw5WkPoIb7S2+msCDOLxgjsDi8kFVunQrDidw4Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T5bQfOH29AKQnQUu5TN+6QKVOOkwBXbrziqIwOn6Tro=;
 b=cSxgYKEnOW5V8lDjZpQFlND6qoIimsYthw6bbG2+kIXpKy5CpaYLZ8jvgF+GT5wNjXS+rkHtwicQH2POy5ghBPrMowYCYiK7s1cpzU04D4kSCvT54LHiwBkSZ0gXF6U92moBEu0VV5+XuftUkpV+RFygh9nqy0DZtcYwSLIVMseDVoaxUmFHIJ1OhmVK7YymDWLGrsjMithNPjNDqGPR9EtubGdpx2nUyJ+RVS608xY6Eg9mrDBvy+5bSS1MT5GTVTHzNecPYNUhy3Z65Nht4Nb6EQJyL2oC00XEamKcoROpYTE9KD5SO0HoLipGa9IoXwkJU7wsZtAkGaWig8monQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8936.namprd12.prod.outlook.com (2603:10b6:610:179::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Fri, 2 May
 2025 04:57:55 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8699.012; Fri, 2 May 2025
 04:57:55 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 May 2025 13:57:52 +0900
Message-Id: <D9LEQ1U1PLO8.3N22GRY380ZM3@nvidia.com>
Subject: Re: [PATCH v2 17/21] rust: num: Add an upward alignment helper for
 usize
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Jonathan Corbet"
 <corbet@lwn.net>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Ben Skeggs" <bskeggs@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250501-nova-frts-v2-0-b4a137175337@nvidia.com>
 <20250501-nova-frts-v2-17-b4a137175337@nvidia.com>
In-Reply-To: <20250501-nova-frts-v2-17-b4a137175337@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0210.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8936:EE_
X-MS-Office365-Filtering-Correlation-Id: 1788cc18-ed18-42a6-c913-08dd8935e67f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WXNubHpGSlJpS0RJZE1wSFlJcXRnbG1SaVU2bkMxclFraC9BRENyNHJtY3hZ?=
 =?utf-8?B?MVFKUXAwN3J6RUI4N21tbjRnYk5uMkVVZm9SZ0NGcHFBUENXdk90T1luZDc1?=
 =?utf-8?B?dXN1MWM2aG4xdStqMkNkbWx4czBPVHVKNm5RQ1YrWHFZQ0xaVWFZeEhQUnA3?=
 =?utf-8?B?aHdRMmdRbFN1VFN2dmJ6R3RMWEJNaHQrK1h0cWJLcm5iRkpqK3AwcytnQzBB?=
 =?utf-8?B?UjlJbG4xamM3VUtFWlh3cU03ZVhwS25rSklWRHhRRFdCU2J6LzV0a3BNVng4?=
 =?utf-8?B?Mkh5S2ZlWERhQ1NMSjZRdTQ1cGRIcWtkRnd3Ym80cnA4QVlOUVR6em90aW5s?=
 =?utf-8?B?OGhBRStpUnBUYjk5T2RqcDhLdk5BbEVWUnllWmt3b0M2bWFUbU5iZkxjVGVR?=
 =?utf-8?B?dExGVmxQcVYwRGxBczNvOHVZbzJOWGpHMWJZUkpEQnBqV29PM29ld0FMbEpX?=
 =?utf-8?B?VWNvRXJac3djdG1hdUE5bUJERjdwVXNJL2ZOT3JMdG9obEN4OGFBUzh2c2h5?=
 =?utf-8?B?UTVmbzFiV2U0dVV1YWZoRktSMzh5ZFRsODBmTlc5SHJWc1UxMFRHanAwbHJ2?=
 =?utf-8?B?dlNJNmE3ZEZmcUVnTHFJNktobnNSK09Fd3l0WGFMWm9hQ2hneVBjMjhCM3B2?=
 =?utf-8?B?U1lURXJFazVldDM1eTFBNW14WGwvdlhxYmo3cTMrclpUdXM1S0hYYld3aGRU?=
 =?utf-8?B?UnVqdktwNWpwajlSMytPUHlXUzZKR0FTcDk0Z3M4NXZycDhsaEZGTERaMGp2?=
 =?utf-8?B?Y2JMSmNxYXpPeVczb3AwT0ZPcGhyNGlCd3F5RGVyR053WkpCZHc0UExZaTFy?=
 =?utf-8?B?bXFDTEhoT2dPWGZoT29zRnllMzhvZmp6SnVUek9aUUJXaGFVUXlnRWN2aWpT?=
 =?utf-8?B?b1owRjZ5WXBwcUpITjY4aUppZUVCMUk1L0R6bm50dUsrOWIvRjBmZWpXUVgy?=
 =?utf-8?B?czZxVWs2LzRQN1ZmeGtRdC85d0FERzFUVXprSEltdDFOcFFOeWtXeUJjaWpB?=
 =?utf-8?B?b2d0c2NjeXBEdWYwMEpadDVua2dzUXlXekRnZzRtM1ZSalhkWklYaGljUVNW?=
 =?utf-8?B?VVpjd09LYmVlTWRiKzlyU1FjRGp3Nld3TTJBZG1jTlVuZEppamJFYWwvaWJU?=
 =?utf-8?B?SkpzU1BPbGVZVWhHQUlYN2dhNmJ0WjBLa2VSZTl0YWRwTElaSExuY2V2RHR2?=
 =?utf-8?B?VGJUTmgwU2IwbThoZWtNZEJaVXZHNGtCTWI3WWJuMEt0c1pTNEZ3UDRZL1ZR?=
 =?utf-8?B?aEZPYzQrV1FjdytlbnR2cGxYcEw2NHYxemJPc1RxUHVqbzZ0WE5GdTFoUDZk?=
 =?utf-8?B?UGwwU0ZodzZBRHkzQUFueW5HZ3lFZklKQWVJZUdHU3dra29DcVpYdGVURFps?=
 =?utf-8?B?WTU0Tnd5aWNMTEhzMGgyWGF1YnZqVU9wMEljRVJNRWcyenYydCt4YVJJM1V5?=
 =?utf-8?B?YXRyR0RpMkJVb3I5RjN4b0EzT1BvSjBQZG5aTzNRcHN3eFc3WXFzZU1lK00w?=
 =?utf-8?B?a09TZnJrdFJnUEVNUmVrYUdmYkI5N09zMno4dFNtVjl0azFFMmdaSXF5NXhG?=
 =?utf-8?B?S1ZPeEdvOWlON2RBZUwwODZaa241c0QrVXR3Ly9ROFVEOURKODYxRVpRVDN3?=
 =?utf-8?B?WWxJRExDbDkvVGdaYXcwMUZtZFF2MVJmZ1RrTGVaL2ljK3dQWVkzQVdpT29Y?=
 =?utf-8?B?bHhQL3E1bC9oSE9mbGJmNlIybHdlNE5ocGxCZ1F0Z2F2ZkJUc05lYW0zVnFt?=
 =?utf-8?B?QkNCalVWQ2FmRHBxRFFnVEdqUE5ac2krZTZ3M0JNZmpyUkRUNEE4dm9sR3pX?=
 =?utf-8?B?ZDMwVXZhYlUzNXFEajRLM0lNbzkwaFNmWFpvRWVsQmlqMmZhWEVPdnVHbEs0?=
 =?utf-8?B?eDVLUVNhQVVMS01LSGdZMVkyMHhyTm1IOEgzZTBzelhWNUtzTWZiZFVpU29u?=
 =?utf-8?B?eThaY3ArdnNScHhIOXZOaFUvazM4T082Y0UyOFBvelJ4bUk3VGlzV2hwWHZX?=
 =?utf-8?B?UWNiYWJ5L1dnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZU9LRkhGMkxQdWNQcDFhMmxwaWJyRVpML0pWTkRHeXlTWUlaMmluRWxaT290?=
 =?utf-8?B?dUxHRHgxY3NTdWY0NnJ1dVVISnZCWDRjN04zM0RjR0ZFc2VlWWtyemt4VG1Z?=
 =?utf-8?B?NDV2UUNSK3pXcFRUSjJqYXcxSDBIaTh5a3ZsQ1FQNXZIT3pES1VMUXcvUkI5?=
 =?utf-8?B?OW5LTy8veVRBMlQ3ek9McEFSaDJQT2FyOW1BSmtDcno5RDVjS0RSWlhIMG1S?=
 =?utf-8?B?bVQwWVVMS01oamdwUGNPNVZHY2lvdTh1QzB6TTF0VUxzMUN3TXRCY2RQdng1?=
 =?utf-8?B?cTFIby84ZW8yc2lONnJuWjc2STAwMEEvWUx2YnliYjZFMDFZbzNFOVNBYnNN?=
 =?utf-8?B?NG90YWRkT3JyWWIzcDRZWmtxTytUa2FmenFlK2o5ZjdyQ0dhaHlQTVZ5czVJ?=
 =?utf-8?B?dFBLYi9UUEpXZWpvVWpYWjMwK3g4cldseFN0SnM2dDhXVlpBdU9EdmlMRnpL?=
 =?utf-8?B?dEY4Y28zWU9IK0YxYVE1SkNtdkQzUEtyNU1pOWE3YnBCRzNwNyt4WEFreWF6?=
 =?utf-8?B?MHRRSHIzWnRsSEtYbGdYU1NWWTZHN1M5cmlaUGJpVXpvTXhBWno2UUxmMENF?=
 =?utf-8?B?NkxYYkRMQmZBT3JKK2dkUXIwelFxM3RQVEZuQVdqMUJEdHlweW9JRkdSNmpu?=
 =?utf-8?B?Qys1N2dWYko2ZVYrUmdVdmdUSVZEU1pUUHRZRG00NjBZUmFCbllpcDEyYkJN?=
 =?utf-8?B?YzhpQ05wa2llVXBqSC9lTkdDYXBoNVNaTGd6U1lQTzlqSFVRT2NieHlYTjRZ?=
 =?utf-8?B?SWhGVnNJQzh3OWNjZU5YK2RxTVlDYUwwVFFwSUM3ODQwZ0Q3em9ZYjl3Sk5p?=
 =?utf-8?B?d0lqcEdRQms5Q1FKK0NMMXhPaFIxdHJWVTZuaVhEUXhyWWwyamlIWEp1bWdT?=
 =?utf-8?B?UzRkNGt3VDBWbE5JWVhaWSs2bXBWejJBNE1KRW5va2cxeDFYRTl4MmlocDJ1?=
 =?utf-8?B?UXg5cU5odHlaaVVCUHg2OVNOS0Irajd2ZmVENnhOVU1laldJdUt2MzA0SC9a?=
 =?utf-8?B?SEFBL0dxeGxKczc3UEVoeW5vZGRjNHlTeGYvay9Xam52Si9RaVhDbjk3c2hl?=
 =?utf-8?B?cHhGaW5NQjI1Y0hlMUY3SUlkN1J0N2NIaElYRW1Iakordklwd00va0h0MkMv?=
 =?utf-8?B?Zm1pcVA5TmgvM1JqVityUGRUYVRjM25rWE9yUGlsZ1lSd0l6SmhTUzlzY0lW?=
 =?utf-8?B?dGtzQW5YblZ3MGpORkx1dmVZVEdXRVd2ZEFPbng1cktIcm52Tlg0MklMeWcx?=
 =?utf-8?B?ZXBJYmREQ3laSTBOVGFXT1BBaGxja2I2OVdHWFNBdHZITTVXMUlnNHkrdlBo?=
 =?utf-8?B?aFB5UmxuOVMxWTFjWDlrUzhmTERDaytWWXBBQng0OTBZWktpV0c5SlFEMUJa?=
 =?utf-8?B?eFFlWkNHaFhPR1plRE00MWpadVhJRUFaYUVHZDVTVXhOalFLQ0EyVDQ3VFY1?=
 =?utf-8?B?aEFickVMUXNQNTZITFErc1dKNUNZZ3hCRWlYbkVmUGZ3bFowR2lDT0lUOWhF?=
 =?utf-8?B?MjRsWDdnU0owM0srdlFQdmNJT2VrL3FzMjBIRTg4aDhrc29RU3hwcFVrOFdm?=
 =?utf-8?B?blF1U2JQYkIvcFZwVUg0dk5ZT29GSkszL0N5Ky95Z1h6ZGFUemNWR0sxZkt2?=
 =?utf-8?B?MlVrSnFyOW1weTVBRlNmRWpkMVR5V1Z4STlad0g3K251MVNzTHRvSDRGeW9j?=
 =?utf-8?B?VUsyTERsbXpBRGRPYlFpcHBLR2w3bUpsYUg0eWROWDl4R3grN0xuaHgyYndl?=
 =?utf-8?B?OFlmVWlSVzMwUWNERERVcFQ1NnZKQXJqc21rT0pTdCtYQVAydktkZmRwT0Vw?=
 =?utf-8?B?anVXd3BVbmtyUEh0ZG8yWHBpNEV1RllHRzlDNFhtNnppWnYvVGxBd3JqL0Yz?=
 =?utf-8?B?YTNKSkJiZGJIVENRMVlXUHk4bWlqTDF3Q01saGZrZEx2N0JoVWU3Y1AvNElJ?=
 =?utf-8?B?azZxdlVSdjBWeW9teHowNXdXa1p2eEFYOGNCN09qS3c4RFVRMTNJaW5VMVZO?=
 =?utf-8?B?UWhIcVR6cmYvL3UvWGJMc2Y1b2VQWXluZ3FWVDlGODlUQWZMRUg3MkdyZDZF?=
 =?utf-8?B?aHJLOGRPS21UZzNWdG9XaTJQL1hVbzY3eVZhWW9pdWx0ZGRKK2dmM2dHcExO?=
 =?utf-8?B?S3VuUFFrQmltQ2hEczZKd2NrSlk2bUpqVjRyN3J1b1FlNmxENTZKb29rV2Uy?=
 =?utf-8?Q?6fWTTs5RqoH6KX045XoUQRkQAGgiAcOXRYeV/NIzy1ci?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1788cc18-ed18-42a6-c913-08dd8935e67f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 04:57:55.2875 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 32LrNneBVkkZ3Iw/VX0Mx8103RhzrmLxtOo4tqteDjpGLfFyM5GnHTkkfyYyqO2zTe1t+hMrX/+YcU8Z5g6JrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8936
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

On Thu May 1, 2025 at 9:58 PM JST, Alexandre Courbot wrote:
> From: Joel Fernandes <joelagnelf@nvidia.com>
>
> This will be used in the nova-core driver where we need to upward-align
> the image size to get to the next image in the VBIOS ROM.
>
> [acourbot@nvidia.com: handled conflicts due to removal of patch creating
> num.rs]
>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  rust/kernel/lib.rs |  1 +
>  rust/kernel/num.rs | 21 +++++++++++++++++++++
>  2 files changed, 22 insertions(+)
>
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index ab0286857061d2de1be0279cbd2cd3490e5a48c3..be75b196aa7a29cf3eed7c902=
ed8fb98689bbb50 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -67,6 +67,7 @@
>  pub mod miscdevice;
>  #[cfg(CONFIG_NET)]
>  pub mod net;
> +pub mod num;
>  pub mod of;
>  pub mod page;
>  #[cfg(CONFIG_PCI)]
> diff --git a/rust/kernel/num.rs b/rust/kernel/num.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..953c6ab012601efb3c9387b4b=
299e22233670c4b
> --- /dev/null
> +++ b/rust/kernel/num.rs
> @@ -0,0 +1,21 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Numerical and binary utilities for primitive types.
> +
> +/// A trait providing alignment operations for `usize`.
> +pub trait UsizeAlign {
> +    /// Aligns `self` upwards to the nearest multiple of `align`.
> +    fn align_up(self, align: usize) -> usize;
> +}

As it turns out I will also need the same functionality for u64 in a
future patch. :) Could we turn this into a more generic trait? E.g:

    /// A trait providing alignment operations for `usize`.
    pub trait Align {
        /// Aligns `self` upwards to the nearest multiple of `align`.
        fn align_up(self, align: Self) -> Self;
    }

That way it can be implemented for all basic types. I'd suggest having a lo=
cal
macro that takes an arbitrary number of arguments and generates the impl bl=
ocks
for each of them, which would be invoked as:

    impl_align!(i8, u8, i16, u16, ...);

> +impl UsizeAlign for usize {
> +    fn align_up(mut self, align: usize) -> usize {
> +        self =3D (self + align - 1) & !(align - 1);
> +        self
> +    }
> +}

Note that there is no need to mutate `self`, the body can just be:

    (self + align - 1) & !(align - 1)

This operation can trigger overflows/underflows, so I guess for safety it
should return a `Result` and use `checked_add` and `checked_sub`, after mov=
ing
`align - 1` into a local variable to avoid checking it twice.

There is also the interesting question of, what if `align` is not a power o=
f 2.
We should probably document the fact that it is expected to be.

> +/// Aligns `val` upwards to the nearest multiple of `align`.
> +pub const fn usize_align_up(val: usize, align: usize) -> usize {
> +    (val + align - 1) & !(align - 1)
> +}

Let's add a statement in the documentation saying that this exists for use =
in
`const` contexts. The `impl` version can maybe call this one directly to av=
oid
repeating the same operation twice.

Actually I'm not sure whether we want the `impl` block at all since this
provides the same functionality, albeit in a slightly less cosmetic way. Ca=
n
core R4L folks provide guidance about that?

Cheers,
Alex.

