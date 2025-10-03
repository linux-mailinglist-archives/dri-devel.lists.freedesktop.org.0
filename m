Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C35FBB5B0B
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 02:56:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8628310E865;
	Fri,  3 Oct 2025 00:56:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="icg/2HPv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013012.outbound.protection.outlook.com
 [40.93.201.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3863B10E864;
 Fri,  3 Oct 2025 00:56:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gJkJn9zYJJxYNWaEP0sC0EGH4OJqMZCdCU8uW0w2HXK8Ns7G3k07q91s9Pncw39IWntGwmz+AvVoE8NL+anQ2eRSh5JPhChqlHhRx3OkRAXsrWDwHo+tdUQslRi8X+jxP/jCI3UuKcuc9nDxVk21kNCOXUV3iWUrGQiCKvVNszNq6PsBuVak2AhlsS8/8xAnyB/aafcHePGxNz+Ze4umcxJBGvpHp5ge5YxxquDBGSqL+D+CA0YNWmUwXAzdpUp1shD4frUzk+DsMPEfHS3xsMWXo13349R+uJa13E6HmO90PWYjix7ySqrLFjpMoqKVU6EvcUkPJJvFCM3ZIuZw8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=03NiR0d6vwVM0P/HaeDCPsIr7kcbTdykSB5805eIheA=;
 b=FYNtDUqmhPJn5GIcHOtbs0jJxnGjOUzBAMT3L2xcfjBUoQQGnfOHZXRvm8MiRHWbgwTfN9TcGNJWbLBodd7jhzULW/djoTkV6KYB3amnw4OPrE4Y2Zqma0Kh+hlXwfGh7Yq8WXhIr5KPm/Rzsu7m0FTDe2UqCAxlSwRei6f9N7P6G8JsYHr1m7KXSqOqq6MDadkWWUNnc/3vaiab4JQbhTLI24c86oibvcwcpOLTHRxGcz50v8D5rckGjXZxL7hes6zS3hFuYlIKu+UM77GP/eiiIdjefSilNy1T+8N+epODGEBqJqEEjj5EcXBF9yxWrf2mzHNMdvecZpw6rVdcZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=03NiR0d6vwVM0P/HaeDCPsIr7kcbTdykSB5805eIheA=;
 b=icg/2HPvQAMQ+4KIMD/1RBH8lQC1gMaYeso5EexWlGMjKocTBdUZKq6QjUCfWJCdFV1nM5egH6HL2xd0g2UpxnDb48BgbzbKOxBPS+o5+vEhtdg0c1Udq1qJzKzgfuVnJOfNmiUwbX6zB2k3/I8fKDmiBUXd6o1io7An9VxngjmAeqVy/RqjUUrkbzYJUGy/214lP249iAHw6HaSeLQK35G/SJgX5oShBvsewDt1d6/UFVKHHW8UU/iUsIC5YEpmY6lvA/4zzAfoFeTM+7/MSQsq+EKdM1t8L/q0nbu79TtsVra0kbETsx0T1qSRuMIzmNV5qy4pFqEqpQf/zIGdzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB7654.namprd12.prod.outlook.com (2603:10b6:8:11d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Fri, 3 Oct
 2025 00:56:28 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9160.017; Fri, 3 Oct 2025
 00:56:27 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Oct 2025 09:56:22 +0900
Message-Id: <DD8A11VBDFPO.3AP88V5D63JR5@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alistair Popple" <apopple@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>
Cc: "Benno Lossin" <lossin@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <dakr@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v3 08/13] gpu: nova-core: Add bindings and accessors for
 GspSystemInfo
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250930131648.411720-1-apopple@nvidia.com>
 <20250930131648.411720-9-apopple@nvidia.com>
 <DD7VU4239GS2.2MKVFPBFEY1R4@nvidia.com>
 <pv7bhr5tsbszgql2zoisz4bwanzs75y4wu4lorc3bzgwahhbzk@f22lcgcnqbdj>
In-Reply-To: <pv7bhr5tsbszgql2zoisz4bwanzs75y4wu4lorc3bzgwahhbzk@f22lcgcnqbdj>
X-ClientProxiedBy: TYCP286CA0283.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB7654:EE_
X-MS-Office365-Filtering-Correlation-Id: 0052cf3d-325e-4054-3850-08de0217aeb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TU81VFE3ZEpSMm5oTVp2bnVkTUZnZytSWFFvdmZFN0JjbmFuakU3TnNzN2hO?=
 =?utf-8?B?ZzJQY0Y4YkUzcHR3bWpuaUxsa2NreFQyQU9KQk1HdTdlMmN2c1VjbkFsckll?=
 =?utf-8?B?M1o2SGZQRHJpUE1qV0I2ZTc0b21vZmwvWkExeUkybklxTVNYeXlreERjQ1J3?=
 =?utf-8?B?b2tObnpLazAwWW15R3pHVWZLNTh1VFVaRllkUVd4Q2FWU2FxSCtvRCtqK09K?=
 =?utf-8?B?V2JOYmlzaXVtcTNZOFlkc1lPaSs5UkVyMTc1bVllOWMzRlI5M0EyNG8rbWhH?=
 =?utf-8?B?QlhpaWdQTU5WUnlGTHEzMHNCMXZSN0pwdWUyUTlFNWF1Qm5wVHo2YlNLazA3?=
 =?utf-8?B?M21BWGhWTElJWFBwTHIrMjEwYUJKMW5wWXpTUkFkbGVDTVVxZFdhMTJaOWtM?=
 =?utf-8?B?RGp0UjB3cFhqVnFBYzlhQzQrV3BWWEF2TVJ1eUY5ZlhEWmE0VHY3Q1dnTVFF?=
 =?utf-8?B?UUVPbEgySkM1eXVLVXBiQVY3cVJwcytwcDZRcTJHZTFNc0RBZWNvWkVSenpF?=
 =?utf-8?B?WkdWeWVIaVVlWEVPd2xtNDErU0tJR2RmeVJ1Qkp5TVdjYzBuV2g5dkd4Vk5Q?=
 =?utf-8?B?Uis3MytybUQxUThJQUFPeVRYd2R0aDkvY1pxZlpaYW9UVjVFZGhYcWdwQzdr?=
 =?utf-8?B?TXJzK3NDRUMvdU1rRkpob0czQW1NRm9JUE1wSVlYTzAxK3FPVEZmMEE4MXFS?=
 =?utf-8?B?eXp3ZVh0MHFqOTFObU04R21jQTRRM0JjZ00va0VONHF1TzdZQnJhdEtHSkhk?=
 =?utf-8?B?SVBlOWtrMGh3Qy9yb3MzSTJqTEJodENCaDh4dWhKS0tmUGkzcWgreEpOSkZE?=
 =?utf-8?B?czhCVmc3L1F0dHdwREY1b1BzN3oxTGZaM3I5STVJQS9wTkJELy9Ja3hkNHNv?=
 =?utf-8?B?L2w5WVZpSHFGQkczV3pJNTE2UUg1T0RiSlUyc2VmL01mcGViQ1hOK2x6SGlw?=
 =?utf-8?B?ZE5MenlUZGFkWitYaFNOQVZMK1UyUWhQNVBIL2lkSVlMUjl6L0JVeS9WMjR4?=
 =?utf-8?B?WE1VRUd1b2FZUUxjS2U4S1llYmhEUEVuVDBsdEFZTG95MWZKWWFvMEQxVldr?=
 =?utf-8?B?aTA2eDN1NFh4NXZkeEtRMW5qT3pYU1kxbzg3d2pnNjNyTVorM25LTW5kdTh3?=
 =?utf-8?B?Tk5uN0QySjVtWC9UL2VmdW5XY01VcFVJQlVrSHlpSTJFK3AxWjBvUmdTSElu?=
 =?utf-8?B?S0xKT1dTSWx0Nm51aTJQUnJIVHlOS1poL2hsMUx4ejkwZVhKcDdqdklqSDF3?=
 =?utf-8?B?NnljR1ZMVzUrNWxDcWx6OUp5TWwxUUYvdFU2amJyR3BNVTlwUmZ4dlJuSnJk?=
 =?utf-8?B?OG81VFBEWTBSYTQzaHNuR3B5WDEzRHJUMGNrRG1OSTFER2dlcm4zNFdFUm5w?=
 =?utf-8?B?Yy9OV2ZTOHB5Z2pUR0RUWWZCVHB4YlJYMGNKU3NwSldxdXhkUWhMTDVwYXBE?=
 =?utf-8?B?cUF4b2dCVmVFWkRqei9wSDZ2anFiMzdlcGpEMzhBTXArL3AvcnBKZU9ldnFV?=
 =?utf-8?B?UGoxUnVOMmN1Qi9kcld4cHZZVEJEaG1mVGlSTmVnTVZIa3Y2S3lvY2piV3k5?=
 =?utf-8?B?OXdYNmtPam4rb1pHOWZoWWNGQzJ5T1ZIeFBoSHQ0MzQxYzFXMnFueVo5Q0lr?=
 =?utf-8?B?SWdZclMxL3FCdVN1VDFOSE01YUdzZnZtTExVdWdRTWo2SWZXQzdSK3hZazN6?=
 =?utf-8?B?Z0taTW9nTnZpaStQMFR1dkN6c2JBcnRGek5YUWdqS3pOQ1JFNXlMRmhNekt3?=
 =?utf-8?B?b09WRUNsTjN2ZDdiY1VKUGZFSnNWb0NCMkkvTXJrZ1lleEsrWW4xVnlBZks5?=
 =?utf-8?B?M3NVRXNRWk1JN0M1MmM5THVUVFhibDBMQzdXZHE2Sm8rYllmVmZIVlh3Z0hw?=
 =?utf-8?B?Y0krdjQraks2anpINXBZc3R4UVNoVFR2RmNiV2kwbXVhTkJlUk5kZ3NyQ0Fz?=
 =?utf-8?Q?dWmLCE37pZDgbTNpBnBjNKShy3sSTDg2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGd3dGpRSWZKNFdwUzdHNElVWkthTW13WXJCZDNleXhUVy9LajFOSGFXNVVn?=
 =?utf-8?B?SGJkcDZhbDRGTTF1NGV1UmZXbVJ1VjJJditkeWxabjUwZ3FESERKa2NZZ0lH?=
 =?utf-8?B?MndrRzJUaEMzekl5d1ZjNlowWFp3anlHSXJGOHVoelBVc3JhWmFHRjIzbzJj?=
 =?utf-8?B?UCtEcjdMMkRncmJ2WjF4RTRiQjdJc3JwR2R0M0hFZDV5SlUzbHp1c0hPS2ZL?=
 =?utf-8?B?Z2hZbjZyd09yYmdSTUpaai9halRNSmo5ZTg3SWJoTktUMnU5eWZvTjJLWlF2?=
 =?utf-8?B?ejlBcURlZWw3NUlBYTU0dUxJRUlzSWcwMzFQcmt5RnZvNGxobEMyN0NRMk56?=
 =?utf-8?B?alR1VlhvaTFkL3FCYUN6MkxRaEFHSHRacUF4aDBrUjVBL2Y2RnRWMjFtM1Zi?=
 =?utf-8?B?TTNkVXA1S3BqUEQ3dVExYjU4RWwxVFk0YmdPcUFjOWM3UGt1MnIrM29MRlIz?=
 =?utf-8?B?Qk05YWcxdmFVY0o5WWtUaHdpbXFMeVhMYXpvdnd1ZXdhVDRoSEF3ZWk0UXZQ?=
 =?utf-8?B?Z1pRa2ZiU2hQVWFzSWZkZmFnSzh3a3Vab3FuR216dHM1eGRFeUF1WVluSkd4?=
 =?utf-8?B?alhUNGswZ2dOT0E5cThrWHhCbWFmU3hlQ0tSSWVMcFNjU0k1eUl4T054ODVS?=
 =?utf-8?B?L1VremU3NG5RTnVoRFRZNyswNEV2OFlLUklNKzBSN2xsN1k5MHV1dVE4Kzk2?=
 =?utf-8?B?eDRlTTNacFRBT2ZrWlZObG5XYWdzUkxwSW5OTmw1NnlYRm44bDdaN2xCQ0hL?=
 =?utf-8?B?dWw2UDJab0I3UHAyaFZDdzJBcDlMUERUS0piaFNHcFRTUm1mclVTbmo2SDNr?=
 =?utf-8?B?Zy9ZQ2kzKzNmcFgzVnZkaVVrcHVpb21tRHhudHNiTW04NkNNTnJaSFVKSUNF?=
 =?utf-8?B?Um5WNHRqSkJzaDlUa0RnSVk3SGJ0czZqRzhEbXVRaXBpZVZMZ0lKWU1uWEw0?=
 =?utf-8?B?MWlaamNESmNNZnNOb092WFZ3NjZPeTh6em9nTG13cnBnQUx2Z2tYT2E5MVA0?=
 =?utf-8?B?ZUJaOFNvN2JuS2l4dXluQ3padTJhS3dtcERrUlZkWUl5QzVBTUhSMnM4MHlp?=
 =?utf-8?B?eGh5ZFgrdVdDN1RNcTlnaEFPV1U1SEZCd2w0M0hZRGxaTlZ5UVRCbzdHRXNx?=
 =?utf-8?B?R2VBcWY3RG53bTRXOTViSkdXcGpkdCswRklaVHo0YlJncE5pM1p0a2MzZG1C?=
 =?utf-8?B?TllnRXh3c2ROLytLd0FmSCtWT25OVzZYcDJEem5RWUtUbEVZeXZuVk83ampO?=
 =?utf-8?B?bjlrYTFuVFJUTWl0M253UTNmTHVQazBGdTQ3RXI3alBFN05oSHpkbGdad3Vv?=
 =?utf-8?B?bzJpdmpad056MkNIczFjOVk3VW1rYUJaTHF5M0VQcTBWSmsrQjFDYVlmRng5?=
 =?utf-8?B?VzNoQUpxZTFKWHBnTDZRMUJoQitOd0d4MHVHdU1mV2o2eW1mQWRnSi9UNXlI?=
 =?utf-8?B?NU92NWxNbTV5WE8zUVJXbjl4WDhlUVpjSTRwRHM1UC9scGFvSGFET2svaGpo?=
 =?utf-8?B?T3Rud2l5aTUwL1hoM1Iyc2pvK0lkbTJxNzBGY1NPeDc0Y3l6Q1RyVTY4TUho?=
 =?utf-8?B?NjNGZXFEUHZCczhDZ1hBRzBGaGsvZ3BkbGxSL2dqZUMvZlRuZEhqTit6T2Y4?=
 =?utf-8?B?M21sTDZNTFlSMG5PTjR2ZHMzamFoYUJiQjlSTEEySlZCMlNVZGp2ejhoTWdH?=
 =?utf-8?B?Y2hBbXhYaVUrTStDWUs3cnVIU1pXdkVnWnRmRjFvajZmV3BTWTVwUjVPQ2xF?=
 =?utf-8?B?dzUxcE5wdWJPZGNOa2xsVmxLOTJtek1zODV0aG1sam04YTVRbkNUeG1FYndC?=
 =?utf-8?B?dnZvaHQ5UHNVQzJhVElQbllRTUFVSjFYem1lUEx6WUxWWVA1bkI2TXZ1Rytw?=
 =?utf-8?B?Z3M1bkpaSWdqRVg0VjZESzdFcmwzTUtETE1VdTVUeWlVK0ZtOHZNY1VzeU1J?=
 =?utf-8?B?NXRuUVRvRjQ4SGFHa2ZsNnVJdjFWZFZXWkE4SWQyNVUxdklsSnV3MzNFcnZG?=
 =?utf-8?B?Q0NSSnA0c2RCWEVnN3JHV0xGaEFaTVV1Sldrcy9qeHNyNkJvandvNFJiVmdz?=
 =?utf-8?B?d002RGJJZHM2ZzFFRStOQW91eVhjZmN0RTN4OTBhQnR1UjdwNytOcEtwZzhy?=
 =?utf-8?B?TExkQ2NOdGdOaHdDYzhOZmFxNEhCODk1MVZJS0NDQXdiOXkrQVNXbnlsY3Fk?=
 =?utf-8?Q?jQGtDA2VKB8PkVA7q57tpY7NTCP/J8uzpvZBkKUIm7TE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0052cf3d-325e-4054-3850-08de0217aeb0
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 00:56:27.7651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /eOcc5KATr6aFKrSnyv9GIRXEQ1HEtT9ue2cXvd9EEv9T6+TmoCl61vbSayiDDcPEXPM2eq2iMHVvb9ayG/ItA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7654
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

On Fri Oct 3, 2025 at 8:38 AM JST, Alistair Popple wrote:
> On 2025-10-02 at 23:49 +1000, Alexandre Courbot <acourbot@nvidia.com> wro=
te...
>> Hi Alistair, (+Benno as this concerns the `init!` macros)
>>=20
>> On Tue Sep 30, 2025 at 10:16 PM JST, Alistair Popple wrote:
>> > Adds bindings and an in-place initialiser for the GspSystemInfo struct=
.
>> >
>> > Signed-off-by: Alistair Popple <apopple@nvidia.com>
>> >
>> > ---
>> >
>> > It would be good to move to using the `init!` macros at some point, bu=
t
>> > I couldn't figure out how to make that work to initialise an enum rath=
er
>> > than a struct as is required for the transparent representation.
>>=20
>> Indeed we have to jump through a few (minor) hoops.
>>=20
>> First the `init!` macros do not seem to support tuple structs. They
>> match a `{` after the type name, which is not present in
>> `GspSystemInfo`. By turning it into a regular struct with a single
>> field, we can overcome this, and it doesn't affect the layout the
>> `#[repr(transparent)]` can still be used.
>
> I was thinking we should fix the `init!` macro to support tuple structs. =
Is
> there some fundamental reason `init!` couldn't be modified to support tup=
le
> structs? It seems like it would be nicer to fix that limitation rather th=
an work
> around it here.

I took a look at it and quickly got lost in the macros's internals. :)
Let's see what Benno has to say about this. In the meantime, using a
single member is just as valid a constructs as a tuple struct for us.
