Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A180C27851
	for <lists+dri-devel@lfdr.de>; Sat, 01 Nov 2025 06:09:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D30C910E097;
	Sat,  1 Nov 2025 05:09:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="izRA2gHH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013065.outbound.protection.outlook.com
 [40.93.196.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A085C10E097;
 Sat,  1 Nov 2025 05:09:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TVTR4yVxMrb8yMEYpFPiq6FtFtfkZTJvmL2kSzkw84oeND8ZqGHQtXt8R0ydUlr+BoLTrwUKLL5Ogii7DD0g6hs5ynky42OEJCQgrT23fVTFDg2/qbaGNgZSTvFrSSJezr6oqWvW+O/pLMaAX66argTCx6vbgx67q9+ghorIyEeH0V8GAPZTtN6tIDUi4Js42jMRxQyPLpT1ljB/Xs1rp/VBOGmpa1kugssm1aNqZLyn+Afw4j8D4hb8xnIsHySR7R6pmzaB6oVuXIEzVbtWnCif1+00WLvqAOnuSIS0RaP7qsYoRGyelHMLdsz18TlEg9rk10jJvSJkEgtHCNrIXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WpppkZgNDbyB8/XbmhfgMQhZE6JhcjSvL4IuxV/lPxs=;
 b=ouO4WPdHK2KlddmdAPj5po4cOMVrVygNly7zippVjwvGVR0QKGWDmkyIRAkd4rc81w9CIaBJQGudoxSZ897v+Y8yaCA3tCr3b6K71lFRVjwZLZCvSuTOqb4hw9il2sWWvjUCosY1aWUWLWnCPCEVRLZa+xzyeIDBasT2uUMprRWr5pqp0cS9UWPxWlx1tGqnJUV/uvA2avtw7cmx8BhwgiadPxOyK+/d4eOJ98z0CJGSh4WkPBcM4VRB2jzlZkFwg0FRoMgaHp7hjUE0pTSLimvksiZ6ep1S4s1NGpCmTDz1HHqFJebgVEdzxyvyRqhR90+i8bMT4YLMlSb6/CVaHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WpppkZgNDbyB8/XbmhfgMQhZE6JhcjSvL4IuxV/lPxs=;
 b=izRA2gHH8i2ywpC1xw5oh74ggCDQvrAJvBAj2bPt50B5n9FrZilmBEYVZn/A79xBjmgGy3nLA2yGLxzIUf7xBuuM8lZhBgeICxsYKOzHBWrVgRhErZEKD0hunbAeKEYq8ki7mEpPiD29KHgM42vNZ4Ync57MCfUpJoh9LPCBFiqzDNTc2F4PqrxkQntpQTfGlLUcfuhOrNeiVrk4rTHVxP0zpFbgdikp4T5NzdAPdYbiUqbPtaI6H4j5Xlnr26Z0HFK2ifIPv76hwgeKeWP21R6csJt39EEsClgvsBfuUEn3ftNA3STWovzzEvYDlKVZkHSrTToReDllg3UlP2N1nQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS5PPFEAC589ED8.namprd12.prod.outlook.com (2603:10b6:f:fc00::667)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Sat, 1 Nov
 2025 05:09:01 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9275.013; Sat, 1 Nov 2025
 05:09:00 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 01 Nov 2025 14:08:56 +0900
Message-Id: <DDX3K8BNA4DW.12U3WTKDD5GCF@nvidia.com>
Cc: <acourbot@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Simona Vetter" <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "John
 Hubbard" <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Andrea Righi"
 <arighi@nvidia.com>, "Philipp Stanner" <phasta@kernel.org>,
 <nouveau@lists.freedesktop.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH RFC 3/4] rust: drm: Add DRM buddy allocator bindings
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <dakr@kernel.org>, "David Airlie"
 <airlied@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251030190613.1224287-1-joelagnelf@nvidia.com>
 <20251030190613.1224287-4-joelagnelf@nvidia.com>
In-Reply-To: <20251030190613.1224287-4-joelagnelf@nvidia.com>
X-ClientProxiedBy: TYCP301CA0069.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS5PPFEAC589ED8:EE_
X-MS-Office365-Filtering-Correlation-Id: 893cac32-aeca-4c39-d5b7-08de1904c4b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aitidVprSk52cy8rMmZsK1VFbWRpd0phSVBsaXE0bGc5QUs5d0d3NE9IQ0ZK?=
 =?utf-8?B?MXg3QnRnbk9GZ1VjTjZsWHhaOGozdGQrNWtHK0c1K20rL09tWC9iMThHWGNk?=
 =?utf-8?B?OWUvbTlsYkkrVWZrM3hCcHkzRVFUYmJieFM3N2tjbGlETzdZclp0TXZBK1V3?=
 =?utf-8?B?TWJYSUJJYjNYc1N5TVhXcEVvaHE3cHNWRGZ1RXhPaHRCdFlaSGlvYW80d3Jv?=
 =?utf-8?B?blFSZ2xFYkJxUzBZR0twTllzQlIvQXBHeW1sMU5SWWlsM1JsRCtjcVByUzha?=
 =?utf-8?B?aC9HbEdBVDJvbC96SUpUNUtQRkE0aUpOck9FSk5VVUZiQzlHb2I2TDYzQWZY?=
 =?utf-8?B?UlFPTFNkZzkySUhDNHBMcTQvSCtFdURtc0FIcTZ2RWRNVjRlMjhJelNpMjJN?=
 =?utf-8?B?Tk8vbnJZS1g5ZCthTmNmdXpXOFlvZk1vWFpXS1QvRm1icGsxWm1GcTVRNUgx?=
 =?utf-8?B?VDkvSlR2d2p5WUIwbVp4RjBWUnZwVXNpMDVZb05Eb0RUMm1IMzdZWjJKK3V4?=
 =?utf-8?B?TFcrcSt4K2VkcjcySDRHS0hkVTIzZFMwcjI2V3AyN1lDK3pISEpRazVxTE5M?=
 =?utf-8?B?cTdoL3dqRkpBME1qbmFuNFRjbi9mL3JJbjJFYVlSRXliZUZLaGoyNlpsNldk?=
 =?utf-8?B?OVJYdVkzWGZsWkRkV1pFUUdCVGp6ejVtTFJlb0tLYTFEQjdVWmY3T21BMVJD?=
 =?utf-8?B?a2kyZUoraGdHZUttSnRHcEQxSHp0cCs2aUUxNE1NNm1uK0hjWTZsQVplTVRl?=
 =?utf-8?B?WTJqdmlyU2JMQWZaRFczbDdFS0JzMGRkc2Y2bWNITUVvdVE1U3NWZWcvQ01x?=
 =?utf-8?B?NjVqaHNTeTVEOGRuWWJtWE83NmYxQWZBZ29tOEpDd2ZudmM3WlZ2QkNRV2NF?=
 =?utf-8?B?WmpLNGYycXFWUFdkeElxZktteWFWZXhURVV2OWZjRGwwaWE1dXJIMnZWMGpZ?=
 =?utf-8?B?ZUU4aG9OYURIVVBDcWdXUTFUNEFvSUhoVW0rL0FtdFM3N055ODJJdGVEUmJa?=
 =?utf-8?B?eGYwVUtOQjh6bC8zRnJuVWhNNTlVdks4a3pVUDBZV2ZPMmNaT1BMRkUvVXRo?=
 =?utf-8?B?OGlrZmhXeGkwYm8rOExpbWVldnpidGRQb1dVNEpycTA5MTBUSWZNdTdRbXU0?=
 =?utf-8?B?SzNJdVdnWFg3Z2M2U3JBdUIzQ3pKNGRXaTNGbGYxZE1WeGloTktZNFA4OEZy?=
 =?utf-8?B?Zk9jQXBITkVUSGZkZGxtbXQyM2I1ajJvM0FMS2UvWDhIMWRNbzc3bDhueTlv?=
 =?utf-8?B?TFNYRlZWanZpQ0l5OEl6NldTcWVkZzdRRHJKOHA3c2I3em44WHhTQ1FGM2JG?=
 =?utf-8?B?dThSdW0vNUZwa0JRbGVaS2RWdC80SFRVaWR1aHljNHF3WjdRdC9pTEp0NEY2?=
 =?utf-8?B?Zlc4T0Zha083c2dZWVRYS3ZYczVrTHdpaWVWRkpWN2VpUDJZV3k2N3h3Mm5r?=
 =?utf-8?B?TjVORFZ2UEhxYklxWllrZVdGYUtwZW5pNm15NWs3dm5iVVp0Q053NUZwUU5Z?=
 =?utf-8?B?aDdnMlFqMXF3bVRYaUJhZzVCK0JIYm1adVJzUUNkbzZYeDJqY0JGTE94STR3?=
 =?utf-8?B?c1FTcTJTOEkvRXNvdCtJbFhtZ1Z3MEtoUktYU0xDOVFvT2dnY0djNzFUNmta?=
 =?utf-8?B?ZWdGcjF5UlJ4YTBuV0IwUTR4TWVobUxoa3VzQjJwVXBEYk5OTU5OdlI1cjZq?=
 =?utf-8?B?MXhGa0RvMVRHU0MrWlJpRkJmcFgvTklXQTEzYyt0K0JUSGxCWFFWeWkwQTlT?=
 =?utf-8?B?TU1GL09UVHVvM2I5SktlOGhNNnkram00TkorRTF3TXRxWEE2V1NsZzVJdHc2?=
 =?utf-8?B?T0tVSzY3dnJrV05VYUxHM09GMUNSVVlHQVRURmtCMVlrRkZHSE5SQU9GQTdp?=
 =?utf-8?B?dHlHcjVveXp5bWlnVERlb28rZmdNZnA5RGZUQjVJU2tGd0VramN3MWl6bGtL?=
 =?utf-8?Q?dOSu/Uby7IPfHCjZ8UEesFQl1ROUea6B?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVNMNCtBN1ZqTTN4dHU1UDVZSEdPZEppQVhWK1JxM0JCaVBWQkhxUHRMd2ly?=
 =?utf-8?B?MFA2bVQyeDBiRWZpdFFSOWhyNGQ2TE1KUjBvVncxYzJJbWNGbHViL08rb0g2?=
 =?utf-8?B?UjVJeWlBLzlac0pNSkI0RmRwVWR3V1ZyckVHVUQyQ25vTUFNL25OS2RmNjFJ?=
 =?utf-8?B?aHJXbGZPRTJOM2lHOHYxc0VpbTIxMVpiS2x2Sm1RT043RkVNVUxxU0E4eTZU?=
 =?utf-8?B?WGc4RC8yaE9NQ2xPcGZ3TUx1MnRTYmlHWG5BUU9oamdHbGdEQVAxT054K1Iy?=
 =?utf-8?B?THFxS09wU0F1WVdnRnUrZHNEaFVkNzkxaDZUVWZwYkl4MG1YeXNTZWM0RVY0?=
 =?utf-8?B?bDBRaGR3U2UxMnFFNVQ2VGlRTzBOU3hSTG16OHZEaXVCb2U5SXhVdHIxQUdN?=
 =?utf-8?B?SE93RlZxMVlSMEozOEZGMkxsblJEVFc2ejEwZmFNQjRVQTFaWU9GLzc1dSsv?=
 =?utf-8?B?S0FlSUFGczRFUHBYZXFkK2dLMWhNb3BMVkdZelJSdHF6MFh3NmJZQVMydFBE?=
 =?utf-8?B?eUlzSmxmK09Ba1dNcWZvS0htaHBUZVdOVnpnd3p5Z3I2azNCTm1LRXF2NW53?=
 =?utf-8?B?T3VOcmlmSHkvdzIvK3U1ME5tTmxhWENyNjZOTzFZKzJqQmJua2JqWFpWY0Yv?=
 =?utf-8?B?SEhsR1dBUXc1d3g5eC9VQnpzdDRCU0Q0bkhIbE9KVnNtM211R1Bsbm5CcU9u?=
 =?utf-8?B?dktVZWdjNmRtbWhBVFljUnRUQVhsRzlWSUhEMlJOVjdYL09SaSt4L0g2QmdG?=
 =?utf-8?B?K2o0bmp3VzY1S2Y5WTUxL215L3JlaFFsWFVHM2NBQTl2NzNpS3VOemF1SVBT?=
 =?utf-8?B?M2VvQWs0SlV6MVU3M09VMENjUzlJQ01CVGFYYUJWKzk0empSTlZZN1JkcUtt?=
 =?utf-8?B?czdocFl3MHhaSXg1aCt0cXJ2dVh3UTA2VlR2ZWVOQ0ZWMlJhYlE4R3pkc3FF?=
 =?utf-8?B?NnRjL2dOdjQ1ZUtHQmJSRG54ekRnWjFXZWFxM3FydllHZEgxVmx4Wjhqd0NZ?=
 =?utf-8?B?ZWdBajJNNHVVSDVLdVRMSFpVcmMrbFBYRXVMaFJaekRLNWdjZDIvTElRdEhs?=
 =?utf-8?B?WGhrbGlISkt1QTk4ZjNtSW5PekFqRkdjckpUMVJwMFFVUTVzN3BrcHo0NkJo?=
 =?utf-8?B?K3puQmNMZllRSFZQZDl0eGM2ZFErcDI2L2hhZHoyK2ZFcTRKNExObThkcC9O?=
 =?utf-8?B?TVVqbU5kYVlqNDN0a0JUcktTQnJXZ2JqTHRQVm94SGsyQWxFTk1pVHFnUmU2?=
 =?utf-8?B?UDNVdnRtSy9veU5CUi8wU1dCQXArb0RyY3RoVDRxT2lNRmxNK1lzdU5HVUQw?=
 =?utf-8?B?NkVKYWtGRWdDc0NUZ2tZS0lKdGZ0Ny9CdG9iKy9DdDRRdFMwRGU3cXRMUGlh?=
 =?utf-8?B?Z1VtZ0d1cWFHUmRma2xaS0pvMHl3ZGJYaWIrbHZ1ekJUazI3VXlnemR6TDkr?=
 =?utf-8?B?T0lWSmY0dE9UZUQxOUdGRlNoVGRkQXFIVzFaYmhVYjZEdkJNdFpOSC9ycFBF?=
 =?utf-8?B?elN6NSthVEh5V2w4YXFQRnpDMGljWVI1cUJrcllwRkd0V1IxS2t5QVpLNVVq?=
 =?utf-8?B?YW4ya2VXaXBCVmtnWXpnNk0wck5yeFJ4QlR2elRwYmF1K2JldE5QS0dTZnVr?=
 =?utf-8?B?a0l1cUxUVk9EekZOa0xLUFM3Q0dMUXl1b3Z5QVBQSFc2YThBdStEcXY3aHF4?=
 =?utf-8?B?V1RQM21qb1BtQmZ3VUZMcTk5aDBEUTNwV2lrNG1HbDJnTW9XMmdva0pSUkJm?=
 =?utf-8?B?THpHVjVIVHlHVkFsT1JDRWVmNXpjT1NqWVZpOGE1VDljdTZEdTdtbEZUY25T?=
 =?utf-8?B?U1B3ZksyUGttbWlOMjJDMThKeFZseEhQUFM2eEpkZzAzUGVWV3JKWW1oOHp6?=
 =?utf-8?B?aWR0OGxRWUJ2ODhLQmMxRnh5UldPbkF1cGs4em0yYUl1UjhXbXFZVm1xQ2VB?=
 =?utf-8?B?ZzJOTS9pTkxJcmxBeUZuWEZTSTRBSlZmZi92UWM4T1VmUVZ3b3RYaUdIb2ht?=
 =?utf-8?B?cGtmcHdrWFhuSDgzY0xBTStuU29SR0NEL1hNdHlaOXVkUE1rVUtlaDhJZmRK?=
 =?utf-8?B?Z3A3TUNaQXVGMFVvQ04wSCtmOUpDaWcyWUlrYUlNUmRTZDkxbjl4YzBMSTh1?=
 =?utf-8?B?V3hXUndzd2UzS25JbFFXWUQ0SExoZXlJSmxLbVg1TGo0anpZd0hqYW1RSTQz?=
 =?utf-8?Q?trCa+f4bTpSXQAQKRCmrFnZf5wFm1Ow7Ajtv7CuO9xFL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 893cac32-aeca-4c39-d5b7-08de1904c4b5
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2025 05:09:00.6745 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K7uQKRF4loUA70RSk15zm6DrKpkc1njMREJI3cfkydQ5LSKxCuTQTfUh35597nAwjZa1O/0WuAq6v0Ykmg9TXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFEAC589ED8
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

On Fri Oct 31, 2025 at 4:06 AM JST, Joel Fernandes wrote:
<snip>
> +/// DRM buddy allocator instance.
> +///
> +/// This structure wraps the C `drm_buddy` allocator.
> +///
> +/// # Safety
> +///
> +/// Not thread-safe. Concurrent alloc/free operations require external
> +/// synchronization (e.g., wrapping in `Arc<Mutex<DrmBuddy>>`).
> +///
> +/// # Invariants
> +///
> +/// - `mm` is initialized via `drm_buddy_init()` and remains valid until=
 Drop.
> +pub struct DrmBuddy {
> +    mm: Opaque<bindings::drm_buddy>,
> +}

not a big deal, but usually such wrapping structures are defined as
follows:

pub struct DrmBuddy(Opaque<bindings::drm_buddy>);

> +
> +impl DrmBuddy {
> +    /// Create a new buddy allocator.
> +    ///
> +    /// Creates a buddy allocator that manages a contiguous address spac=
e of the given
> +    /// size, with the specified minimum allocation unit (chunk_size mus=
t be at least 4KB).
> +    ///
> +    /// # Examples
> +    ///
> +    /// See the complete example in the documentation comments for [`All=
ocatedBlocks`].
> +    pub fn new(size: usize, chunk_size: usize) -> Result<Self> {
> +        // Create buddy allocator with zeroed memory.
> +        let buddy =3D Self {
> +            mm: Opaque::zeroed(),

Isn't `Opaque::uninit` more appropriate here, since `drm_buddy_init`
below will overwrite the data?

<snip>
> +// SAFETY: DrmBuddy can be sent between threads. Caller is responsible f=
or
> +// ensuring thread-safe access if needed (e.g., via Mutex).
> +unsafe impl Send for DrmBuddy {}
> +
> +/// Allocated blocks from the buddy allocator with automatic cleanup.
> +///
> +/// This structure owns a list of allocated blocks and ensures they are
> +/// automatically freed when dropped. Blocks may be iterated over and ar=
e
> +/// read-only after allocation (iteration via [`IntoIterator`] and
> +/// automatic cleanup via [`Drop`] only). To share across threads, wrap
> +/// in `Arc<AllocatedBlocks>`. Rust owns the head list head of the
> +/// allocated blocks; C allocates blocks and links them to the head
> +/// list head. Clean up of the allocated blocks is handled by C code.
> +///
> +/// # Invariants
> +///
> +/// - `list_head` is an owned, valid, initialized list_head.
> +/// - `buddy` points to a valid, initialized [`DrmBuddy`].
> +pub struct AllocatedBlocks<'a> {
> +    list_head: KBox<bindings::list_head>,
> +    buddy: &'a DrmBuddy,
> +}

Isn't the lifetime going to severely restrict how this can be used?

For instance, after allocating a list of blocks I suppose you will want
to store it somewhere, do some other business, and free it much later in
a completely different code path. The lifetime is going to make this
very difficult.

For instance, try and adapt the unit test in the following patch to
allocate some driver object on the heap (representing a bound device),
and store both the `DrmBuddy` and the allocated blocks into it. I don't
think the borrow checker will let you do that.

I think this calls for a reference-counted design instead - this will
move lifetime management to runtime, and solve the issue.

> +
> +impl Drop for AllocatedBlocks<'_> {
> +    fn drop(&mut self) {
> +        // Free all blocks automatically when dropped.
> +        // SAFETY: list_head is a valid list of blocks per the type's in=
variants.
> +        unsafe {
> +            bindings::drm_buddy_free_list(self.buddy.as_raw(), &mut *sel=
f.list_head as *mut _, 0);
> +        }
> +    }
> +}
> +
> +impl<'a> AllocatedBlocks<'a> {
> +    /// Check if the block list is empty.
> +    pub fn is_empty(&self) -> bool {
> +        // SAFETY: list_head is a valid list of blocks per the type's in=
variants.
> +        unsafe { clist::list_empty(&*self.list_head as *const _) }
> +    }
> +
> +    /// Iterate over allocated blocks.
> +    pub fn iter(&self) -> clist::ClistIter<'_, Block> {
> +        // SAFETY: list_head is a valid list of blocks per the type's in=
variants.
> +        clist::iter_list_head::<Block>(&*self.list_head)
> +    }
> +}
> +
> +/// Iteration support for allocated blocks.
> +///
> +/// # Examples
> +///
> +/// ```ignore
> +/// for block in &allocated_blocks {
> +///     // Use block.
> +/// }
> +/// ```
> +impl<'a> IntoIterator for &'a AllocatedBlocks<'_> {
> +    type Item =3D Block;
> +    type IntoIter =3D clist::ClistIter<'a, Block>;
> +
> +    fn into_iter(self) -> Self::IntoIter {
> +        self.iter()
> +    }
> +}
> +
> +/// A DRM buddy block.
> +///
> +/// Wraps a pointer to a C `drm_buddy_block` structure. This is returned
> +/// from allocation operations and used to free blocks.
> +///
> +/// # Invariants
> +///
> +/// `drm_buddy_block_ptr` points to a valid `drm_buddy_block` managed by=
 the buddy allocator.
> +pub struct Block {
> +    drm_buddy_block_ptr: NonNull<bindings::drm_buddy_block>,
> +}

This also looks like a good change to use a transparent struct with an
opaque. I guess once you adapt the CList design as suggested it will
come to this naturally.

