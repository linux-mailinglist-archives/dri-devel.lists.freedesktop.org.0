Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D03B3F599
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 08:35:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 721C610E5A3;
	Tue,  2 Sep 2025 06:35:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lhO/8h89";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2089.outbound.protection.outlook.com [40.107.244.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A185510E5A3
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 06:35:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O6zWk7hx+OltFbvTfnaXc2FWfB8d2YJaA5w430tHYbHFi6CoB7BzpKAon22WTB90pHc+Aqebo8FP0fI8nKAYcO6r9cCpYweXReoUODKW/FHXHeuj+TF1qFDtvKxu/HHNAEKhMri7OD4s1w4/BDu1g1QvBlp1/b23FtwzVdgbTRAfebd9Cd39FaLr/r4T9j3bsCjnOlWAHNRw2VsqNVfjiK+G5HU1OYRWDIaj5frflNmp02m8wzPbhuwLMG1d94QeiYZMnE+fSAHRKJ3+MR+Qa5jJYDQ2qlz6Rv/ihCNCL2oIvlT09V2fOqNVQvcdhNwuo5FfQF7m1GmFLx10HuMD4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1/eEjFrkLJtbT3VNEbaA/rqQzmZfAx+22qDAzD9RfNw=;
 b=pagil+dRqKnfEfn+URk/GzuZkWaKtCuEibxWBIkaYKfBL8q9FmnVqzOP/GHYG7ZW6N+UeyuvBbb0diNmBqP5T/FcfKVN2zh4PtBU5UTWksxGL0AecClZU4FaQ0JJ9LdbiPvEfPaBsA3gfD/gjWwjGylZqnAehra1XjKr9Dczut/cxIcDpYo4jt8sPcQO9seLMTCjDX/MMqvSjxfATiP5nihJiioj2h8Y6/RHCV+oE90eNUBV0ZI2rfaF+UJVoImwGAVO43jRPsv2etmRMNyTBP6B0pdM+6bAZ3a5FcYfpcj1t/0jJ9KR24bnk9gDICGYmtdy64ddNg95vXyYasoYfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1/eEjFrkLJtbT3VNEbaA/rqQzmZfAx+22qDAzD9RfNw=;
 b=lhO/8h897R6NUxTKID9ZkLvQ7y17X2wuZZJMfXv79hnOJvlJdcSgqEiZoxvqMqgel1AP6Y/YbvmFNkXGI6byCwY3jFFn0bkRfpXTp4Rt/jDm4CovO2DcrLCPF3W0vP/p1ODkiwoXPNSjhFsbSVuQIIgtn9ozIGIyWsdxgvN5qj1797opkTvflwM5ENMqXZim6DAOUugfviSD3lYfSnXz7NTfUK02TMdd5x6kkyUw1cjIuXOQC9COOy+6jR3uc3Qn9rQ23tB6K7OS+mmby6zUnbIN6WVnhv4BhkTNSt3OAYsAEgujDlle9s17b+z7sagJaZK/cwEi71yI/8/mVejuJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 SA1PR12MB8120.namprd12.prod.outlook.com (2603:10b6:806:331::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 06:35:24 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 06:35:24 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>, linux-media@vger.kernel.org,
 linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v1 07/19] staging: media: tegra-video: csi: parametrize
 MIPI calibration device presence
Date: Tue, 02 Sep 2025 15:35:20 +0900
Message-ID: <9254009.EvYhyI6sBW@senjougahara>
In-Reply-To: <CAPVz0n2dp7kdCWFLWQjQY+tGO_ayzxGW=zxx3FwX_yeeR9J2Bg@mail.gmail.com>
References: <20250819121631.84280-1-clamor95@gmail.com>
 <6948375.lOV4Wx5bFT@senjougahara>
 <CAPVz0n2dp7kdCWFLWQjQY+tGO_ayzxGW=zxx3FwX_yeeR9J2Bg@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP301CA0015.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::17) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|SA1PR12MB8120:EE_
X-MS-Office365-Filtering-Correlation-Id: 17353b54-5b36-445e-f45d-08dde9eae59c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|10070799003|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UFV6VDhxUGxTZG1CRnFFVkpyR1c4eXVqalRvL2pUVVhqeFIrN1JmdmxoMW14?=
 =?utf-8?B?L1JxTWhRNXVBN2VTcThrWnJRaVNjL1BGZWlZWlU1NzRvODRrbitZK0tMRmN3?=
 =?utf-8?B?QWJxRkJ2aDl6RWZGV1JBRzJWWnJVMjMxMFNaaXU0MGVGR2NFNVpXdGhOM2Ju?=
 =?utf-8?B?MTlrejVFb1lvdTVwWE01V3o2RWREdUxaS05vRHljRks3TS9zdk1oUFQrMmxJ?=
 =?utf-8?B?MG5yUlcxcXZKSk1lUmZRcHNUL3hZODdCL2lzZTE4MHVVN1NYckkrUVNHbXBV?=
 =?utf-8?B?WmVkT0puOVpSNFJTRllRZU0raW9XdElSU1ltbjduanJtQUx1Nm5qRm1TZ0Fi?=
 =?utf-8?B?cnNKSkxQN2lUNEQ5T2xhVVl0b0MrejNKWHVyV0pCL0I5SkdrL3dURTJOY1VP?=
 =?utf-8?B?OVNqanhLNlBLT3Q5aDdLc0UyRTVQclEyOTJXdGx0NzU1V1psQzdsVUxBVml3?=
 =?utf-8?B?b3d6dmNvMXAySUNaZkJiOWFXSHFNdWpZT0Y5L1Nwb280cnhSSnNhQnZOT1cv?=
 =?utf-8?B?Z0M4eVhGc08wblYvcTlFY0M2akZKcHd5aDBTL3U1dlYzQSsyWm1JU2tNK1Iz?=
 =?utf-8?B?bzNONjI1TzgxUnNaMnhuUDVOcU85WmQzZWZ3UUNyM2lIblR4ZHBsMzBHTHda?=
 =?utf-8?B?Yi9LMTB6OERtcGJ3dWhjUlVDMGJVbTlpcGRBWDFZYmlmdytMZ3M1WUVvTncr?=
 =?utf-8?B?Q1BQR1lYTm5rQndweTlEYVB1UjJwMHBtTGZ0Njg3YnEwbjlML3ZOSU5HUXhp?=
 =?utf-8?B?UTVONGFDb3dqcm5FMWR0ckEvcnVxQUZabXpIMzZYeWdpOFZ2eXRXNjUyZUtl?=
 =?utf-8?B?eXllbTVKenZqblpSMTltZVErZEF6WXJUa2JMK0szRFVMbWRpTEY0dFZOdDh4?=
 =?utf-8?B?NHlGeVdqN2NGMml3OG44NkN1MkMxT3FBR2s5U1A2SmVWbEdENk5yVDJTNkJY?=
 =?utf-8?B?RlZaczFKbksrTjNEMHE3VVdmOVVEaUxKS2hNdi9yTWlCdXNHa2F1U0xGa2th?=
 =?utf-8?B?ZlRTK0ljcFVoS1RONFBaQ3FLRzZiaWd1LzBoWko0ZWw3RnVSdTlzQXdDNXVJ?=
 =?utf-8?B?T3lQYVRwakdTMW5GR1lVSW5JY2p5T2R0UDVpL0IyM2VJV2tkSExlSnpTa29r?=
 =?utf-8?B?SEQyM3UyUk4wc2Vja1QrQ2tXZ3dlZzUrbmJ5TzNwN004b2toTUQ4elp5U0dp?=
 =?utf-8?B?aStPOWRXL1VtdEQ2SzhlSVR4V2JBTEMrWEpQcmdnKzNzclhnSTgyWGhSM0dY?=
 =?utf-8?B?ZzR0YXIzdHVXVkszVDgzR1J6N3RBcitrZWdiNTVyNDJSYzN3Vlh1Wnc2QWZY?=
 =?utf-8?B?V1VaK3E3bnNtdUh2cWJyL1R5OUhCWk9iT0xQQVVYek41SDgwUlVYSm5SS1pM?=
 =?utf-8?B?UDBqR3oxVFFtS2RMeDhqbkhIaW1FeVBKVDBWYWV5LzdVZ3ZEMkJjWWxiL3Yx?=
 =?utf-8?B?czArRWFsckNyTHpGYkVzTDhZS2VoMk8yZ0EydTdlMlhJWnhaNW9wKzhFRlFK?=
 =?utf-8?B?c2VOZ0V5NFFEYU9EL1RUUEcvbGZjbkNNSWsxME4vSW96ckpEZVZaVDFtUjJR?=
 =?utf-8?B?OVNrZTk4K0Vlb242N1hxbDBXYU85ak5XaFVnNXFmZTBGL3RnZWFnR3pBQWJJ?=
 =?utf-8?B?L1BhZ1hRS09pWWx5LzUzazdiNjRzNjdpbWN5VGtzSy9zbWs4QmlmZ2Zmb1Av?=
 =?utf-8?B?Tjd6cFFTSGV4S0xFWkgxWGpNZ2grNXpkWTBLN0tFUUs5eWNKc3BqaGtRdVpt?=
 =?utf-8?B?MXhhV0xnVk9MbVFpZlRHQjZFeitLRUg4THNZZkdIMlV5a20zdzBnMGdQOXF2?=
 =?utf-8?B?MEpRcFhLQWdLMlFjdWZUMUJoQVBJRXVuWkhNd0t4Q0xFRmNIMW1TZHowZStX?=
 =?utf-8?B?eC9vdm4rNXQzV2JKRHU4N1h1UUM1eEZlYUNLdHZPRW5nSlpTZ1kybTBUN1Br?=
 =?utf-8?Q?xqaTRHQmtvE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6494.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTFEeFF0VHBjRTl1em1SQzdGU2ROQytqVTRvMTNoNVlzSlF1OEM3T1pGLzBV?=
 =?utf-8?B?eDRMak8yZEJkNWYwcGp3aEdnOTNLQUNLTDFqdU94SmVmM2VkU3BVZW5JK1hU?=
 =?utf-8?B?amsrNmJLa0M4YmtZMVpkR3duR3B3QXJyRHMyeTJoaHVTN2pkQXU2QTB2VGlt?=
 =?utf-8?B?S0VQUmtJa1hzQjhkK05ZTk1GNkRRYzdUUzBEVEUrazdlTmZGbVJuUjZaNTNH?=
 =?utf-8?B?cjUrOHVWVG5GL1hWdGp2akpkL015WGQwb1IreXhzTzVnRmhlSUJhdTcwUHFQ?=
 =?utf-8?B?bGRQZkJ4M1labkpNTmY1RFdqR1pWSndUeGhLS3hkd0dxUktjbm55dlJBRmM2?=
 =?utf-8?B?cFNxd0tEQzNacTBJbmUwUzRWTzF6OFZiaEpLbkU0Vk9xN0tXK2prVHVRK3BL?=
 =?utf-8?B?V2c2ejlhSVR6UmpEYWlqVUZiUG11Qk1QdlpwWjNpRlZhbUhNUGxLbmIwc3hK?=
 =?utf-8?B?UFBGK21oOUM4UnluVy9uQU9QbzRVRm4rYWJ3akprV2VOcXpsMTlnN0phZWJW?=
 =?utf-8?B?ck9HRXZEUjJQV0FzMlpNT0ExZkJKdHBOV1FjQVErVGlHa2dEN1FYT3JmZkZo?=
 =?utf-8?B?b24wNDJrejI3TkJraGFqUnFLVngyT3M3TkF0ZWNEN1hRNGhOaU05WXROMjVv?=
 =?utf-8?B?NG5WcFllanQ1dmtWbHRsSEpPUjNlYlJlZVhkcmVXOUZtbXpCMWxQUUFKNUpN?=
 =?utf-8?B?bDN5SmJZbGZYTjVtM0hiZjNobFJjbU45L2V4cGV2RzYrYjJkR1REdE5UL2No?=
 =?utf-8?B?SlA0M2RvQU1yS0RjNVY4RjZuYWhudmt1MlhFejhvTnJnSGxYT3FyRUFWbklu?=
 =?utf-8?B?RWcxNFdESWFsVzhJOTRGakoyMGppRTNydjBnbUNVWkZXWFFZd2F2VlkwN294?=
 =?utf-8?B?RktOa29qbWVBTGVrRGczSzQ5aVkwZnVlMVVYNngybVl1QzNyQXVnd2lMeVpm?=
 =?utf-8?B?NWJJUkhPcWlIalZOajAwNm1ZUFBaK2FSdHJiUWV6ZTdYV2E5WXlHcENEMkNn?=
 =?utf-8?B?bFBORGF4c1lSMUxXR3c0dlRjMkhONTNlRC9oZDlwMEFGeEFNRThDdVpaUWd5?=
 =?utf-8?B?K3NUZ3Zmb0JoNjhLS2NlUEZ4NnBHWElpZWJld3dGRy84VElRajNmejlPeE52?=
 =?utf-8?B?SUl5WHJLbncyRkwyMWM4TTh0cUlhbWViMlIzU0EvTnZtWjFIV0hTbXZtUGs0?=
 =?utf-8?B?UWhhVGwxUjF3QS9TSExocHR0N081dm8zQU4yR1lXVmpNN2hJUHNFS2poNVNy?=
 =?utf-8?B?QzRPMTRoR2xPcmdyYklpbUJZd1I4RmNtNjJoY3dRV0dEWHhqU3RsUm1taHlP?=
 =?utf-8?B?U2J5NVhPeDlkU1RkMkVvWGZWRkJDOG14VEo2TlN3UTdCMFdsU2xndWYwbWxJ?=
 =?utf-8?B?a1ViWFVMT1lwOGg4UjRKd2lmcmdkUnZudzZCZ25RSkdHalhCcXBzWjBuSG1Q?=
 =?utf-8?B?TjI1Z3E1ZVF4NzNMR093MEw1d3E4aWNyakEvRmNxb1dLM0lPRjBBM3BIOXhs?=
 =?utf-8?B?K3ZxRjJVSjRONUVqbGgwcUhlQzJnL3I0M2Z5d0lYamVDY2NqQ2dsSHhCOEpI?=
 =?utf-8?B?WDlxMU9VSEgzY2lrZEhWTEk1RkdsOTI1ZlhDeTlQR1NaNGRnb3pmTlJ1UnBi?=
 =?utf-8?B?ZlRRTGpKcmZTS2NCT0FrZVJIbHB5dzJnQmEydllRVWxYa3dJMDkxY1hxOVQ5?=
 =?utf-8?B?ZUhQd09LU2dHbE5QKzEvOSs1V1pWZnlFaEFOZ2lUTlFrQUlkT2NYNXg3QWlV?=
 =?utf-8?B?UW85T20zczJkWU0xY1NXczIxbzhZTkVqdGd0c0hWdGUraTY5eUozME85RlNW?=
 =?utf-8?B?RHhhUjkrS2pvcjIwZUo5Rjk0ZThXM2tuZmhvVjYzbHJXd011WmYzQktLVGN2?=
 =?utf-8?B?ZS9weGdydTlSanp6b0pGeW1kTHNvTHJVTFRLa2hqd1BjdFhuTzJhMW5qWlFk?=
 =?utf-8?B?aUY3WkJobGV0L3BnTUx2ZDVMY1FsQS9oVyt4bWx6engxNm5TODJwNlA3ZGZS?=
 =?utf-8?B?Ni81OW1lWjJjNHFwMm1lbEJza2FLSkVZWDBTY0Nkem12eU9lWDl3MEdycm9L?=
 =?utf-8?B?bjFaM0dhUHEyb1Y2S1NOaW0vSkZsc2llclBnWks0aTl4eWJFRE1XNy93a1NH?=
 =?utf-8?B?MFVyVDZFMFdobXltV2xKOGxSQlpXVHpPRFZWenVpUVBvSTBnY24ySThPQWV5?=
 =?utf-8?B?UjFxVmc0YTgwQ3hNaGhoM3NyZHlhaFk4bFVmN1cxeGlockkvaW1SemJtSjRj?=
 =?utf-8?B?b2xsQlVEYkh3ZktCWVZSNVlhZ0JBPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17353b54-5b36-445e-f45d-08dde9eae59c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 06:35:24.2730 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eNMMdFcvtq2mrXjlvIfjPqDZkNprpE9wAyaZ4fGdRaLLMj/AOJ2pZTb7sazW45UpVIbekrMiT5JGuhvXMNpJ6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8120
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

On Tuesday, September 2, 2025 2:05=E2=80=AFPM Svyatoslav Ryhel wrote:
> =D0=B2=D1=82, 2 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 03:47 Mik=
ko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Tuesday, August 19, 2025 9:16=E2=80=AFPM Svyatoslav Ryhel wrote:
> > > Dedicated MIPI calibration block appears only in Tegra114, before Teg=
ra114
> > > all MIPI calibration pads were part of VI block.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  drivers/staging/media/tegra-video/csi.c      | 12 +++++++-----
> > >  drivers/staging/media/tegra-video/csi.h      |  1 +
> > >  drivers/staging/media/tegra-video/tegra210.c |  1 +
> > >  3 files changed, 9 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/staging/media/tegra-video/csi.c
> > > b/drivers/staging/media/tegra-video/csi.c index 74c92db1032f..2f9907a=
20db1
> > > 100644
> > > --- a/drivers/staging/media/tegra-video/csi.c
> > > +++ b/drivers/staging/media/tegra-video/csi.c
> > > @@ -485,11 +485,13 @@ static int tegra_csi_channel_alloc(struct tegra=
_csi
> > > *csi, if (IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
> > >               return 0;
> > >
> > > -     chan->mipi =3D tegra_mipi_request(csi->dev, node);
> > > -     if (IS_ERR(chan->mipi)) {
> > > -             ret =3D PTR_ERR(chan->mipi);
> > > -             chan->mipi =3D NULL;
> > > -             dev_err(csi->dev, "failed to get mipi device: %d\n", re=
t);
> > > +     if (csi->soc->has_mipi_calibration) {
> > > +             chan->mipi =3D tegra_mipi_request(csi->dev, node);
> >
> > The way I would read 'soc->has_mipi_calibration' is that this device (C=
SI)
> > contains the MIPI calibration hardware. I.e. the opposite of here. I wo=
uld
> > invert the logic and optionally call it e.g. 'internal_mipi_calib'.
> >
> > A cleaner way to do this might be to always call tegra_mipi_request et =
al. --
> > on pre-Tegra114 SoCs this would just call back to the VI/CSI driver usi=
ng the
> > callbacks registered in the MIPI driver as we discussed before. That wa=
y the
> > CSI driver won't need separate code paths for SoCs with internal MIPI
> > calibration and SoCs with the external MIPI calibration device.
> >
>=20
> So basically MIPI calibration device for Tegra20/Tegra30 has to be
> created within CSI and when MIPI calibration is requested, CSI phandle
> is used. Question: may I use a dedicated node for MIPI calibration
> within CSI or it has to use CSI node itself? With dedicated node
> configuration should be much simpler and can help avoiding probe of
> entire.

I think it'd better to use the CSI node itself. The calibration registers a=
re somewhat scattered in the address space so it's hard to argue for the MI=
PI calibration to be a subdevice of CSI.

If it's problematic, we can also just call the calibration logic internally=
 within the driver. But in that case also I'd place both the DSI and CSI ca=
libration logic together in one place since AIUI they can interact with eac=
h other.

>=20
> > Cheers,
> > Mikko
> >
> > > +             if (IS_ERR(chan->mipi)) {
> > > +                     ret =3D PTR_ERR(chan->mipi);
> > > +                     chan->mipi =3D NULL;
> > > +                     dev_err(csi->dev, "failed to get mipi device:
> > %d\n", ret);
> > > +             }
> > >       }
> > >
> > >       return ret;
> > > diff --git a/drivers/staging/media/tegra-video/csi.h
> > > b/drivers/staging/media/tegra-video/csi.h index 3ed2dbc73ce9..400b913=
bb1cb
> > > 100644
> > > --- a/drivers/staging/media/tegra-video/csi.h
> > > +++ b/drivers/staging/media/tegra-video/csi.h
> > > @@ -128,6 +128,7 @@ struct tegra_csi_soc {
> > >       unsigned int num_clks;
> > >       const struct tpg_framerate *tpg_frmrate_table;
> > >       unsigned int tpg_frmrate_table_size;
> > > +     bool has_mipi_calibration;
> > >  };
> > >
> > >  /**
> > > diff --git a/drivers/staging/media/tegra-video/tegra210.c
> > > b/drivers/staging/media/tegra-video/tegra210.c index
> > > da99f19a39e7..305472e94af4 100644
> > > --- a/drivers/staging/media/tegra-video/tegra210.c
> > > +++ b/drivers/staging/media/tegra-video/tegra210.c
> > > @@ -1218,4 +1218,5 @@ const struct tegra_csi_soc tegra210_csi_soc =3D=
 {
> > >       .num_clks =3D ARRAY_SIZE(tegra210_csi_cil_clks),
> > >       .tpg_frmrate_table =3D tegra210_tpg_frmrate_table,
> > >       .tpg_frmrate_table_size =3D ARRAY_SIZE(tegra210_tpg_frmrate_tab=
le),
> > > +     .has_mipi_calibration =3D true,
> > >  };
> >
> >
> >
> >




