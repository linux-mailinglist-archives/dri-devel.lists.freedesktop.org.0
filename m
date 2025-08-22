Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A79B318BD
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 15:04:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AD3910EB07;
	Fri, 22 Aug 2025 13:04:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="BmCsoI1f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2078.outbound.protection.outlook.com [40.107.93.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B65C610EB06;
 Fri, 22 Aug 2025 13:04:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e7wnQGXJ7LbL+xSx5XtZiDnHn/fWNQWC0G3LfTTEGX9SWq61Oer6tPuB+pR1lS10i6/np6nkg5AyFKrJq4em6Pbg0JLabA/A4JIabLnBqhx3IupDuoiWsXoD2N0eV83XrrftjjYOed1Ecqwn8Dsu1ntFiYWyeP+zA6KxuQZdTwmqB8XOxG07N76SBifymLgNpp169v6XiQJaf5U0FQtBgOLsApWIZRGB2w64uOd2/bfSM612e9O6ODtFYaJTa+OtuFgbD+0DaToq9gkMPOkq9NvZNn7WH5AfjlTHWWpWt25bzlyCyISFgAQT8IuS0rbniA6kD/xUFG1cVAvxBdHDmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eOYqs0EEhC53DQ5IKfppgH+wVW7+hl+SqMi97nllo7I=;
 b=t166lwlLhufZfxyqnir4nbjoRiE2DJRX6smYFOucA/IjUqdGXuWw4OCwqeEipUJNRaRc3aa6fUz1O/sapZT47jreriV/BlavakV7nEZ0cX+NdnGNRMaKbBOaHZ708s1PskTXNhsmzdA+bdwXYgpWvNarrqXqMjbdmSU7AYkyTsmitbcj02IgBzE0S8bAX7OvkHQpdmYXuuXOXPuFnaNWaCpggdU8dggy/HF9CX2Pj7f+7AjSg9yLMsjYzQWLwS2FgFe/6SUAK3WG6m/06In6m3Xe4UdL/qpM9dH9P+1lOIlt1Ztlp+nneHqQixwwE7P9GWtYa3E0pGUNo3IiW/K+7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eOYqs0EEhC53DQ5IKfppgH+wVW7+hl+SqMi97nllo7I=;
 b=BmCsoI1fpa5UiC2V27QCt0gGkbvHnHz6tUnSeR47At4s5TUdeCrvLboUuMsQJyQEt0hVk/KwyeKSXKNLXKpx9t8oXgz/s70oYwKZWT4S+VMx9VFRfKH5R1USQCuiKpX3HEcOCvdAh3nCEnxJKTf8ZMWNzG/2rtDb1AHs8QerkMPwIO5vf8cyNsKSAcDYYtQfT2sQDajalxCq0YtSG17KCMOc7HTSIq7Lhc2MHksxVq7jcdsV2wuSRvahXY5f4JIpAUWpp/8uRvWYjGuCNN/i7HSrpZxT7J6aFI8JgtG9zwzk76nj2ah+j4+UswMBLUS+9rc4QCxvSY6XwP6BbRRgfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS2PR12MB9661.namprd12.prod.outlook.com (2603:10b6:8:27b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Fri, 22 Aug
 2025 13:04:31 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9052.014; Fri, 22 Aug 2025
 13:04:30 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 22 Aug 2025 22:04:27 +0900
Message-Id: <DC8Z7MLH1J7K.176ZEFST32FS4@nvidia.com>
Subject: Re: [PATCH 5/5] gpu: nova-core: firmware: process and prepare the
 GSP firmware
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250822-nova_firmware-v1-0-ff5633679460@nvidia.com>
 <20250822-nova_firmware-v1-5-ff5633679460@nvidia.com>
 <DC8Z2MLOJN7D.3IOSY6SJ7DPVD@kernel.org>
In-Reply-To: <DC8Z2MLOJN7D.3IOSY6SJ7DPVD@kernel.org>
X-ClientProxiedBy: TY2PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:404:e2::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS2PR12MB9661:EE_
X-MS-Office365-Filtering-Correlation-Id: c1248073-092c-4d8c-e55d-08dde17c6ea1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|10070799003|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?enFVYnFxMGFWV05OMTV0VEl2azBtQmJCQnl2UkR2MXVtdzV4d1RMWjlPZzIv?=
 =?utf-8?B?NmFWU1A5NEt2VjV4RTlEd08wTzlsUnJFU0NqS2RzR0J5eDJsemt2WEJpSDhr?=
 =?utf-8?B?YnpRR2RsNzJaWGFaV3ZHYWhMWWh5blRaYVVjdjRwZzR2QS8yOWEyNTU2K05p?=
 =?utf-8?B?VjlyYUNXNVcrU1FJV2V1YWxwYnV6RjhDd3Y2MkRxeVZvYTM1Uno0QlE5aDZ0?=
 =?utf-8?B?UWpnTHA0dW1kRjNJdXhaSlBCbnc4Uk5RR2d2VWkyZWhtUkY1cVN3TzhUZ3I2?=
 =?utf-8?B?VE1JcTUzcTNIcVdmWU5ubnhBSFhQRnRBRldhdFFsaTB3VVk1bUJ5b01zeEdl?=
 =?utf-8?B?ZnhIRGgwcEJwYnZ4OEY0RGtTS0MrOXZyL1BWYTZhUndpaSs0OWNMNFlXS1Nq?=
 =?utf-8?B?SUJkNk9VdEVodkdTYmtnUGxBdVRuN0FQVE5yRG4zOGtSYVh4dXhJTUZBQjVJ?=
 =?utf-8?B?ZzI5bUJMb2I1YU9DT1Foems3REpiQ3hHblMzdjlweEhZQVkwVTYxeGwrR1Ix?=
 =?utf-8?B?NXUzRjE1L3loT0JUOStnNDl2R2pnZVVFWnVRZnh0eWZtclpiWHVoL3hyWnVF?=
 =?utf-8?B?Zy8zMGVDeFFPa2trbUVKZUZ4M0U0SytWV0U3U1M0SUVTRTdFSnVBSXFGUCt3?=
 =?utf-8?B?RzVKa2xXWTIwMnVvSHovbXQxd3ZDdm1BTyt1QXNqb2JZMkY3WjV3V0JIbUh0?=
 =?utf-8?B?YkVXeFg0dUZEdEFrb055aVN6N2pxRjI0TGpJZzFPbXNoVVhRZGlqQTBXOUx2?=
 =?utf-8?B?S3NXR0dIeHJMWERQRjRhU2FNcTQ3K3lPSWxJemdPSFZJRndmWG9GblNhUmw4?=
 =?utf-8?B?YW5PSjZjYTEyMm5NQnVnYWV0SDF1R1gxa09RNUFjRVFtWnVPVWVQZ3hGVjhD?=
 =?utf-8?B?WVFMTFRTRWxMcWdqcHJzZllDWWZoM05GZFZzL2hidTBnR0FpTS9OM09Wc1NF?=
 =?utf-8?B?amo1UU0wUVpRTTlnN3pyOHVDTnpNaDhlcytoUE1reVZwZi9PQ1FHZ2lSZVg5?=
 =?utf-8?B?cWI1ZVVnQVdVR0ZncEZjY29pZVFxV2hUc2t1R0t5WE90SVZtZ0M1a1FWQlMw?=
 =?utf-8?B?bXRXa3ZiQUxyVnNmMExrcEc4S3htb2puWnNZZmRPZEJVWU4xcFVXWFZ1L1hO?=
 =?utf-8?B?NkN2Tm5uang1TUhPd1FpdzZPVHNYTTJVSVptU3dpTFhuRkhMZmtHL0Y1UGVq?=
 =?utf-8?B?TVIwZGpLL2VkZCtuY3RCVkpIWlluUGh0dHA1WFJTYkVsWEtKTVJLUEpUM0s0?=
 =?utf-8?B?ejhQSStFUTh2aG1iUk56RGlmVGlBT3VIT1Y0YzN6ZDdPemNJRXd4VTUrTjR0?=
 =?utf-8?B?eGR3UTJzeHRJOC8vUkNtMGR6WmhIdmltUFFaREs2MWVMVzhwSzByOGZMZHRt?=
 =?utf-8?B?UGRZVGdtc01abndWSDhnTXQyem5OeW4xTEp2ZmxWRnM3L1JTUno5c0dTbmo0?=
 =?utf-8?B?cDZwMGdCb1FSMmJHUTRnWGFlK1NlekNWUW5vL1A5cFo2UDZUOUpJU2xsdUw5?=
 =?utf-8?B?UEc0WE8rdVZSbnJRWGxta0JPcFNJUXhzZGI3YTB0VmtNRnh0TmYrYmVyWTRl?=
 =?utf-8?B?NzBucnpiVklYU1c4UGdoazRNcVd1eE0rTzRBaEVyK1NMTDJFODRqOUpxYXpu?=
 =?utf-8?B?a1pGRDk1Zy92Qlppblh1TkZzQ0hyeVBpQkhrcTZKM1NZd3QyT3hDNlVPRzBQ?=
 =?utf-8?B?NEdQMDI2b2kxUnpxR1FmNDNNVGVHUGpyNDJIaVJURHZuNy9NLzQwVGRuaWto?=
 =?utf-8?B?djM5MnVoa2VpYnpFQ0hZQjA5L3NyR1owWmhCRitjSzBVMFhoMnV1M00zbEE4?=
 =?utf-8?B?Rmh3bnYvUy9YWlYwMk5hU0ZnWmdkc0FnYndnVUVHV3ZRa240WEgyTE1sMUsv?=
 =?utf-8?B?S28vTEkyRlViVnhVeTRyVUtFWHVMOXBRa0ROL1Zyc1dhT1E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(10070799003)(366016)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUU4MURJN3JxMXdIU09DbVFVTmRaRDdndUkvc1FtT3ZQTEE3UVo0RXB5Y2pz?=
 =?utf-8?B?UDVXMXRWZFh1S2N1dEpCRTRWMjJVOW0yWEhDMC9zSUk0elcreVJyTVl5Ti9V?=
 =?utf-8?B?TjcrUmdZeFlGVGQ2QkFmbDR3Ujk2ZWltSnN0YXRxNTVNTzVMOHZPV1UrQkN6?=
 =?utf-8?B?eXpkem1uenNNcFd6MmhCS2IrcUdWM3JiU0tVaDMvMjgxSzdUUzBJTjE0Y3F4?=
 =?utf-8?B?WVk2RE5pek5JVFBQbVduVWlEeUhtM0xyLzFjYTNSUlRiK2FJMlUweUtqTFMv?=
 =?utf-8?B?Z0FPajQvU2lwVC84dFV0S0cxMVZPbXVrZmFBclZLcUlQUU9Bbys0ODRBTVNV?=
 =?utf-8?B?ZG15bFc4VjV0OTJsQVFHYklucncvWGVyNUVJUnlWWkRVY3EwMzBWVWVsNEFE?=
 =?utf-8?B?NTNxTHl6OHpKWmtJV1VrYmpNVGFGdlRsWGlXV1JpNXY5Q05zYU5URHpmYjJs?=
 =?utf-8?B?ZlQvdUZzL2dacVFuWWJLM0ZOWDNpNWJNQnJmaE9GeWJBTVdqMWlIbUxhYkNM?=
 =?utf-8?B?T29uQ0Fjbzl1VmtpRVp5ZjI3Ukl0a0F5YlpjdTVGY2o1WGZnT2s1RTZlRFI5?=
 =?utf-8?B?MVBtcVBnY3pSUHZ2MVMvU1laRWlwM1M2NlBLcFMycEkzMjhiWnAwSEZpMHND?=
 =?utf-8?B?UWNiRlkzZmF1T0hSUS9MdjJUa2MxRmNBYXNBWUZKUC8ra1UvcjJiRUhzNXgv?=
 =?utf-8?B?cm5jbUVvdDRlRUxJUEtqdGIzS3ZpeWl2YW12OXFqWlFNU1RVRWh3Z1ZuMGdv?=
 =?utf-8?B?M3FzcmlJbXFRRStXcFJSUEdnUFhwd1N4Yml2SFNjeStJenQ0aTZxcURoK0JM?=
 =?utf-8?B?UkV6Z2N6S1FUL0hUVGlvZDJJOE5Db1VHYXB0aU5SUHZNVWcvZ2NZQTZVbnJR?=
 =?utf-8?B?TExjOWZZMit0SUpiVDF1MXpNa3ZFVUdLYWVhamZEbHZ4b2Y2cUhwdnlwQzNy?=
 =?utf-8?B?VjBKY0kwNFh4dGNZaVVNeCtYK3IyNThZcGNpeCtIQzZ0TEwvdDQxdXM5d1pS?=
 =?utf-8?B?UlVzTXo2MlpHd0xKekRSSlNWcUc3dFFPNWVSdkNJeHFZUXJpb3YzYlcwZzVh?=
 =?utf-8?B?cGVycmZSSjRKRWN6Vk56OTBwY2NNZFJvSmV1NnN6bzVMMzhXdm4rNDFySlpn?=
 =?utf-8?B?RVFhUDh3YkhDUkZpck9vSWkwVEVtbmR0cHJnMEFOZldtY3R1Rml3VmJ2Rzcy?=
 =?utf-8?B?VHVDU25sOEwxR0h4OVJkYVdWWUZoR2RubUVkSlFibHBWR0FacXkyR1lPSWdP?=
 =?utf-8?B?aVNsL3RSbGxGRktxWlpSdHAzR0FUOGI3R28yVXphbW42eVRLbDdKV0J4TTdS?=
 =?utf-8?B?VkZheHVWWnR6bUlGWXoreTNic2NIQS8xU3djcjlLNmlvVHhWckU3YzBGdXJX?=
 =?utf-8?B?RzdjdzdtUGJTNVFKYktjZWxSdllrTitJaWxHNTd6ZHZkYzF4eStxV3Y5Y2Zx?=
 =?utf-8?B?cTVWQUk1OUZxYXhtNFU0WWZBVVppOWF3QzVoTEJEN1NmRHYwM1QvNytON25E?=
 =?utf-8?B?NVZia3NuZkdBRFVNVnJmTnN5ZkVjOGU0WU1ORkdTdngzTkl5UE9sbXNTUXRL?=
 =?utf-8?B?VWhFbUlVdXhIdm0wV1BrVHJMUGxpaS83VWdYZEJZOGFzTVk4dHpHQjNRMmRa?=
 =?utf-8?B?VmJVUFNMcllDNTdYRW9qc3Rlakt4NlFQU1QzQzM2T1RSbU1ubWlHZlJHT1lv?=
 =?utf-8?B?c2d6eUdIcDFlU1NNNm4wTUxSRUhDR1JWYmYzTkJzdWpkTmxWRnB5T3VjQVFV?=
 =?utf-8?B?b2s4ZC9PTWU0blpVbnRoYXVXWnBrNWVtL0pkUEcyZXI0UE5ndWM4cUZmdlFF?=
 =?utf-8?B?RE5oNVdnV2lwdWw2SUIxWlEyQjE1V1d1bjloZ3dkWGhGcUZydWFxRlBBOXhE?=
 =?utf-8?B?VFFsdDM1YzZaNmFrV05Dd3dYK0Z0MHlMd25GRWw1eFRPNVhjRlp0NTVKMzBK?=
 =?utf-8?B?MkliVE1tMXpaelpPWEh0cjBWTDg5VWd2RmpFa2RoM3RWeGNGQ2JoV2RMM3Bk?=
 =?utf-8?B?VktQZVJ2VXVBcjNsTkF4cjg4Z3RKWWM3UFZZcDlFTnJoZWxkdFZWWEVFME42?=
 =?utf-8?B?c0d3bll2SzNPTnZ4ZkJFT3JxUEhSQUtBSDdtcm1TZ29TZ21yaWNlZnY1WHhl?=
 =?utf-8?B?b1JTeE82MWVvaklOajg2Yk1iekxnMkM5Um9mR0NML1FJK3laR1hTekJoYmdJ?=
 =?utf-8?Q?hadel2HlU+qK+FljudQBil7uzRVBznOQ4EEd7KaWiris?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1248073-092c-4d8c-e55d-08dde17c6ea1
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 13:04:30.6468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ar6bvxBg/DS9M0RTSuTvk6aXOwBrhuf0MfezSjWmtc3llkKCXjfD/bBVrReneH+UM4kTWvPdT0g9CPcO1qQAzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9661
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

On Fri Aug 22, 2025 at 9:57 PM JST, Danilo Krummrich wrote:
> Hi Alex,
>
> not a full review yet, but a few ad-hoc comments from skimming over it.
>
> On Fri Aug 22, 2025 at 2:47 PM CEST, Alexandre Courbot wrote:
>> +/// A device-mapped firmware with a set of (also device-mapped) pages t=
ables mapping the firmware
>> +/// to the start of their own address space.
>> +pub(crate) struct GspFirmware {
>> +    /// The GSP firmware inside a [`VVec`], device-mapped via a SG tabl=
e.
>> +    #[expect(unused)]
>
> Do we expect this to change? Otherwise, just prefix the field name with a=
n
> underscore.

Yes, all the fields marked unused are eventually used in incoming
patches.

>
>> +    fw: Pin<KBox<SGTable<Owned<VVec<u8>>>>>,
>> +    /// The level 2 page table, mapping [`Self::fw`] at its beginning.
>> +    #[expect(unused)]
>> +    lvl2: Pin<KBox<SGTable<Owned<VVec<u8>>>>>,
>> +    /// The level 1 page table, mapping [`Self::lvl2`] at its beginning=
.
>> +    #[expect(unused)]
>> +    lvl1: Pin<KBox<SGTable<Owned<VVec<u8>>>>>,
>
> Instead of creating three allocations, just make struct GspFirmware pin_d=
ata by
> itself. This should even propagate down to struct Gpu, which is pin_data.
>
> So everything can be in one single allocation.

Ah, I was actually wondering - thanks, will try and do that.
