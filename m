Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 666AEC46EE1
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 14:35:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 295E710E3B1;
	Mon, 10 Nov 2025 13:35:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="N8oajYTE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010053.outbound.protection.outlook.com
 [52.101.193.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E6310E3AA;
 Mon, 10 Nov 2025 13:35:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tfeJJNnL68EAhZoCvYfMVzfs/ZgWm198N595Xd8MrnQ63YI+HtqnRyobd2UHJlH9Gn0rXQGyTS6xPqxmpFx/UFGxvT9NM7223O1Ryjk5TiE7qe9IK9uFLLxk4/L756IcRhLfVsyuVXIdmhXI7lcE0ix3QG5FgTUX/x/9xdY4F93yqrwU9023GC0fEzEU7nCH5GgT2zsZmXUHO/E84j+HEEqbunhk11E7pXEswhSq8ChMRy/hKXAYcnPoHt6hz9yzxJx/xuG4gOi5bd8yNW3uF0BcNAJNW6Qh2cnf9BbRuOGhyk5uXjmovPN1jtCBCJySlwHOFbBSeqxwdUByJjyDbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LkWvJp5H7rUCX6PpGPy20kqqu0OiBPYbaZd6AD7P64c=;
 b=MuMBAboRvXLyIlImEAenL1R5pa0Ahwtn3/2w1k+bd2upHhfyNvh9VbdIUxjX8PhcW46nYrPs2uvWqDbRT0tdAn63Qpn7RvLuEC1WqBr5zHNhtF7KtXIsoc9ts6+sHyFHYDe80F+GlKx1Q0ltfnb6oSBw315OudRTqLkfCc0FBVYrGYwGYD9yb4P4f8R6dALktEjUQ7DOfUKN+8FvP2fK2x1+VmY6m67t5RTgd6hdJvbFAPODMPS2bnX/IJxV2g4JHHw7L3HUv/H0VTAde0Qky5f9gKD5L+Ia0qKxblcqWRhRrH2swloh7bnNcg9rc0gdSNmyR5PRFsABw2m8q0qnLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LkWvJp5H7rUCX6PpGPy20kqqu0OiBPYbaZd6AD7P64c=;
 b=N8oajYTEHRbiaKmCRFXhFRFiw5kMj26aANjXeN1YrG4KkDJuGIIF9f3nvM0qqDv5RH/rE/MmvpKJwgdXSoJBNoMJf7bk0hoFCsF1J0XjZnQxZXQxaLjY785MX0pZaVb2DFDHtDkZHRATgFPF+Rz4vV8FTxxMuxuc4dQhPvoBwArPARIooktpvGOuN3NGhbqaDg61dhNqN27dghMBPoZu7/mMoy3n27PigIhewllYbZC04bYOFywp8UeLwlyCgg+UPfbFLhX59rwf51CGF6XmQxzzglDKsILNh7IE0iGmn6CYoZ0tq9Kg10UFhlNcCtp492SQhy2gQbzsp6sGwjeQCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH2PR12MB4055.namprd12.prod.outlook.com (2603:10b6:610:78::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 13:35:05 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 13:35:05 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 10 Nov 2025 22:34:20 +0900
Subject: [PATCH v9 12/15] gpu: nova-core: gsp: Add SetRegistry command
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-gsp_boot-v9-12-8ae4058e3c0e@nvidia.com>
References: <20251110-gsp_boot-v9-0-8ae4058e3c0e@nvidia.com>
In-Reply-To: <20251110-gsp_boot-v9-0-8ae4058e3c0e@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4PR01CA0061.jpnprd01.prod.outlook.com
 (2603:1096:405:370::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH2PR12MB4055:EE_
X-MS-Office365-Filtering-Correlation-Id: d6484c5d-e158-4e49-07f5-08de205df50f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SER3UzB1MjdpQUZZSFZRNU9EeWZUOUFodS9YS01WeC9HRFFyckU1d290MFpH?=
 =?utf-8?B?ZWw0ZTltUGY1ajRFcGJsbHBYWGVNeWJ1aWxBYmNHbVQrNk5SS0VqVlNpMFRx?=
 =?utf-8?B?UXFpbGRqUVNYRDRjbWd3UUZxbzlZZG9wTWhWRmZvSTZoWjRtOGdTbnB0Q0Ry?=
 =?utf-8?B?U2U3VjRUaE9rc2NpSzRrajFYVHhzMXlLVHZPOGFMYlRXdytUT1V1Sk5yYnpk?=
 =?utf-8?B?U1RGS2I4bDRTdVQ1QUQvS250UllqcXduVElBbWdSVTBIYU5PTktMTDRweWho?=
 =?utf-8?B?OWRYRXBML0ViL0l5Tk5pYVltaTQyelpGbTFmbnVyNXRQTS96ajJnSno3Z1pk?=
 =?utf-8?B?ek9QZDNCbjdiUkpZS3I2dXAyZ0NCb0xNbW80dXFZa2h3ODZCMEp3c0xhVUZw?=
 =?utf-8?B?V2x1aENFRWhwZ20zTnlJTXBjRklDUldxSUpDMGdjc2taN0hBK1p2NXJLMEF6?=
 =?utf-8?B?Sm1jV29Lbnc5emtOU0kwMTlUVklOTW93cDQ2ZVdHVm1qazNHbzN2QnlBTVhJ?=
 =?utf-8?B?YWtqajV1RHpsd2F1dW41bmdTenk2TXVCS045cWZvMUJ5bjVjazFNOHU0VTVB?=
 =?utf-8?B?WnFNYlBMbHlPdkJhYkYyQ2g3akZadG5jOWVNWS92eHZFZmNUb1NGMnBIU05U?=
 =?utf-8?B?eCtXR2NPZnBheTluYml2Q2JscWh1SGRCTmlBWlU0eDAxZ0FHUk1KVEs4Q3FG?=
 =?utf-8?B?R20xMEhPTEpIZlc0V3ZTN1I4amg2ZDA2aEtuMGpNQ2lZbWhIaExBK29zUEpo?=
 =?utf-8?B?bnpVbnpoMjF2cEYwQUlOZGZveDVtYVFKWXVsQ0NPbDZOS3Bwd1JKRFpxdS9v?=
 =?utf-8?B?VWJXZmRVNytqaGNsMEdENitKOVdLWUhBSS9sbzZqcXBRWk1pazhyRHJSWXFh?=
 =?utf-8?B?TFMrVWgvS3Myd1VMYlNXeVBxN3dEcWZWWW1tRUU2cCtHRXNFY01USWhBTVEw?=
 =?utf-8?B?SlVJRnJFTlg2eWxxUGtpMll2U0VlKzYrMjJXZDBzMzR0L2Vkb0Q5SEQwYXIz?=
 =?utf-8?B?SlMzc2RjN2NVcjRYRitIZUJsbm5yLzBtQzNBUmVVdTFaRDNtakorWlYvRG93?=
 =?utf-8?B?T3BXTDZkZkxnWEhUeHJUaDVGblZFamNoZDBjQjJpTHhVTzNkVjczMDcrcUR3?=
 =?utf-8?B?WGhvN25XSWJqdzVad3hzR2MybHlaUDhrRFdQTUZuWkZQK3B2UlFaWlBodk1Z?=
 =?utf-8?B?UkJ5QTZvZnc3RjZGUVkrYlVDV0lwd2c1RDIwbXAya3R4S0ZtM0p3TktMWGpZ?=
 =?utf-8?B?NU4ybDlEdk96dkcvaGFPNCt3Nmdsd2Fob25BQWUwWjRHdkxtMkoyWnFxUVN1?=
 =?utf-8?B?TFJicWJBS294VkxnVXlTUFF6OXI1SDJIQlJSYnc5Y3lHbnk2YmJLbzVLYVo0?=
 =?utf-8?B?TExBOHVEZVUxWnoreFR2Z2J6U1FVMjZ0RDViYVFWYUcwQXdWZk54Y3RCWS9m?=
 =?utf-8?B?UDBLOUlqc2xQRWQyYWhXNkpmQjZqczFDYzlyMEFKTUE4TXFoNGJGQkpneGpV?=
 =?utf-8?B?cTEwVTdDSmh6bm9wZjRwdktDVUNNQWlnR0lCMTRjM2JtZkFBV0c3UVhxWlNJ?=
 =?utf-8?B?TGF2U3laaUsvYlZ6a3B6OEE1UlZxclhVeDFwazl6b2phV21zcWZoRGhhcFVk?=
 =?utf-8?B?dDhOemt5R2JyTW1OcU1oOWtTbjBUWS9iV3pkQ3U5dWFSelFDdS9OU0dOdXFr?=
 =?utf-8?B?aWpXZ05sR0l6bjhsazJhMVdhWmdUdmgxcThqZlY0b3E2K2I4ZGNxMXlZY1pD?=
 =?utf-8?B?NXNWdU9EUDBla0JYMkp0b2RZVEN0RGlUV3R3am5jRTBYNjhZVXBJNkROUHdl?=
 =?utf-8?B?Y1c4T29aS3dOdExrYzhiaDBhOFBqNGlESnBSQW80RlU4MkJ5UGhCaWFmVzVX?=
 =?utf-8?B?QnZOQTFybkx6SXdDWldOODkvb0FnS0RONnVjVzB3b2IyYng3WkJFV1RpV1FR?=
 =?utf-8?B?VHY0U0cxRFFiVkJEc2NycFhnTzFRUnFUMk5RRzhscExwTlFrUWV3dE8vU252?=
 =?utf-8?Q?H7+YcBnIgFs6v8U/Fd0rQXi5LfJJss=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2ROeUM3U1ZibktRcTJBTDRsTWFqSEpLQlR2K1VTY3NQUGNUUzN2ZFE1UEZW?=
 =?utf-8?B?UWo5ZUdqMk04ejJuenRoQ3JlQUtmeE1hNHVNL1RCZHBkSkN6TWpYT2RTQnky?=
 =?utf-8?B?bXVuMUk5MUpjdVBWa2lsZXlxajZIYk1ZVUxmWm0yajd4OGlreGpOZDIrOURu?=
 =?utf-8?B?Y3BQb3BNMmNHZkYvY0RtYjZsL2ZXdkRXa1NRNC83T3pOcGtTOUFiYXIyWHp2?=
 =?utf-8?B?NGVDY29jYmIzM2MyZThOZE0vYVNYUmF5d0JwYXFlY3AvUjhsbzViUHZLNHZH?=
 =?utf-8?B?MTlrS0t4cUxRMldOWnFBTEtpRW1MYzlkb3dnSmlqT2FIbFlIYzBPRkpoYndP?=
 =?utf-8?B?QXlMMmttSVZTWkk3Uis3WjNYaUFrT0wweVRkb2JMejRPSmplM3hMSTQ3a3pz?=
 =?utf-8?B?UlovMGF0OW5Ra0ZtdzRFaVhJVzZxa1RJSFplMUU0MWZXa0xEU0xwNndXK0lY?=
 =?utf-8?B?dTM0TGhJUkNhOTJjUGM1aHNtNWhLYURBMFhsK0ZrSzRWMXFwek02enhkYXlk?=
 =?utf-8?B?U3cyRTlvRE5nVlNqOWZYaVQvVk53SnhmN2U5YWU2RHN4bDN0UVFZWWFxU2pK?=
 =?utf-8?B?eVNHVDUxUTNsNWZybXFBbmlSUzZwYmNYbjFEcG5kZDk2S2lGcklhM1lYcEMv?=
 =?utf-8?B?VTNnb25qdGFURWJqUUxNbE80ZmZxQWl6cEJWbllWS2JEVDBEM3gvUFQwV0ZY?=
 =?utf-8?B?SmhrWFozSHN3RU1ZUFV6TW5kT1VPVmVQbER3NDJyV0gwcGx6RlVXMTFmNUxq?=
 =?utf-8?B?YnV1MnJiSTZRZmVGbXp2WG5vWjY2ejRaK0puY2hrRFA2Z1FlUk9Yd3NyVDFE?=
 =?utf-8?B?SVA3RVRhVUFvN1poT1R5V21QRVpxRUY4cWtsY1dBM25QeTRQTDN4MmIyTkxF?=
 =?utf-8?B?aElWTnhhYkV2OTF5dkJ2bk5JOFh4azZZRWlUSmJITVB3V0lPQW5DVHVBVUZm?=
 =?utf-8?B?U2p6OWc4SWJtSUp2dFhoa0VjNXgxTDZvSzlVRHk0SmdaZ296S1RJZ09kTUJQ?=
 =?utf-8?B?T3g0WnNUeGw2U21WRzFsZ2FaN1crVXEraEdCY1F6M0RyWk9keHUrT1g4Nk93?=
 =?utf-8?B?bjJoUFhYU0JLSFJLNWFaQkhBK1lRRTBJdXp3QkdYUTdkSm81eEt5eS9WZ3NE?=
 =?utf-8?B?UDYzbE03MWZwN1MvK3dFazM1TFJmaE83NUlQeGVSL2p1cEtEUzE2dTNnVWZy?=
 =?utf-8?B?aXMwZkZEMTJJSk53VVB6TjdvMkx0dHVENWVmam1pR0ZiYUh4cG1KY3BJdThh?=
 =?utf-8?B?anpFbk1tdmJyb3NlZFNHWVNzRVZZbE41OUpPdmxESi9IT1ErU1ZWS2NIcU90?=
 =?utf-8?B?SWVVYjF1TXE4MWFHY1RVdEFZZzVIUUFzSW9qL09UbGtaMjJaZnRIemx0RC9Y?=
 =?utf-8?B?M1BrWVpsTU9qS2Qybk9IaVVnTEw5a01aZHJ1Tm1ONFNXQXVKWGZlNXFFRzBr?=
 =?utf-8?B?Y1hBUUswSVZsQ0RlV2Q2VXZIbThLdTRuaHAwWnpMWitKa1BxeGVwa3A5S3R2?=
 =?utf-8?B?ckZVMnVkaER6RDhCNGRBdFB5aFRBdU40VUpTRi9EYm9hM3cvenBuY1lOUjZC?=
 =?utf-8?B?MUdWWnBrcEdGOUkvOEk3eExBSWxYWmlSeUVVUEVvc1dyc0hGSVkxcnM2c0N3?=
 =?utf-8?B?b2VUZzUrTldrejh1TC9mYW9Xbk1ieUkza2gvR1Q2cmxBdzBYL01QcE9vWFA3?=
 =?utf-8?B?NHYvRFNhd1g4RVE5WjFGczQxTTFCUGM1elIvTFZlaHFQdUd1eXlYWmtHWURH?=
 =?utf-8?B?L09mdlBlaHFiTzhscllwbUhlOUJsRjZBcXpCd1N3RldBSXo5NnRHanZyU2ZW?=
 =?utf-8?B?bllyemFDMmEwWGxNaCtRWnM3MVFIb3gvTWlhQ01YTExtSDRKZEsyVG9La0t0?=
 =?utf-8?B?Q3dxYWlQaFpaMTZDdklnbXBOb01uamtURXh3aWNCa1MxTnd3S1hudnNqUWFs?=
 =?utf-8?B?V05lZjZYQ3RzY2Z1Vmhwc0JqTnRWNmpkRFhlUmd5QnFVYkNNRElaTlVveTBp?=
 =?utf-8?B?MFhWQjZBV3phYmlSbndkRUhmdWl2RHVhdEZ3UU5sUzdhT3Z3Y2VRaDU3TlhL?=
 =?utf-8?B?TmM4ay94N2p0Vml0NXIza3dZS2dDVzkwSFphakhkNUlFN2N5NWdQU3lWUVpx?=
 =?utf-8?B?UjdQK2FFakh0SHhHME5ITjFqUk0wVlFzUVpTSlpVaDBLaE5sQXhsZ0lkblpk?=
 =?utf-8?Q?BV29t+ReOx0Zy8f7c0uKSn9f/BO5eoJXz7mLB31B3hkp?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6484c5d-e158-4e49-07f5-08de205df50f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 13:35:05.0548 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FFe76L5zVbUE0AJ4J5HbvIr2zWI4UaXBq0nSAAslTI7J4iCUZKtSnVy/ecQPPrjcL24HdfxZC2k7/DO59AMaxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4055
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

From: Alistair Popple <apopple@nvidia.com>

Add support for sending the SetRegistry command, which is critical to
GSP initialization.

The RM registry is serialized into a packed format and sent via the
command queue. For now only three parameters which are required to boot
GSP are hardcoded. In the future a kernel module parameter will be added
to enable other parameters to be added.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
[acourbot@nvidia.com: split into its own patch.]
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs                 |   1 +
 drivers/gpu/nova-core/gsp/commands.rs             | 104 ++++++++++++++++++++--
 drivers/gpu/nova-core/gsp/fw/commands.rs          |  50 +++++++++++
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs |  16 ++++
 drivers/gpu/nova-core/sbuffer.rs                  |   1 -
 5 files changed, 165 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 56c9950b742c..770731c3eb89 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -158,6 +158,7 @@ pub(crate) fn boot(
 
         self.cmdq
             .send_command(bar, commands::SetSystemInfo::new(pdev))?;
+        self.cmdq.send_command(bar, commands::SetRegistry::new())?;
 
         Ok(())
     }
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 305045e25693..d5be3bf10684 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -1,17 +1,23 @@
 // SPDX-License-Identifier: GPL-2.0
 
+use core::convert::Infallible;
+
 use kernel::{
     device,
     pci,
-    prelude::*, //
+    prelude::*,
+    transmute::AsBytes, //
 };
 
-use crate::gsp::{
-    cmdq::CommandToGsp,
-    fw::{
-        commands::GspSetSystemInfo,
-        MsgFunction, //
+use crate::{
+    gsp::{
+        cmdq::CommandToGsp,
+        fw::{
+            commands::*,
+            MsgFunction, //
+        },
     },
+    sbuffer::SBufferIter,
 };
 
 /// The `GspSetSystemInfo` command.
@@ -35,3 +41,89 @@ fn init(&self) -> impl Init<Self::Command, Self::InitError> {
         GspSetSystemInfo::init(self.pdev)
     }
 }
+
+struct RegistryEntry {
+    key: &'static str,
+    value: u32,
+}
+
+/// The `SetRegistry` command.
+pub(crate) struct SetRegistry {
+    entries: [RegistryEntry; Self::NUM_ENTRIES],
+}
+
+impl SetRegistry {
+    // For now we hard-code the registry entries. Future work will allow others to
+    // be added as module parameters.
+    const NUM_ENTRIES: usize = 3;
+
+    /// Creates a new `SetRegistry` command, using a set of hardcoded entries.
+    pub(crate) fn new() -> Self {
+        Self {
+            entries: [
+                // RMSecBusResetEnable - enables PCI secondary bus reset
+                RegistryEntry {
+                    key: "RMSecBusResetEnable",
+                    value: 1,
+                },
+                // RMForcePcieConfigSave - forces GSP-RM to preserve PCI configuration registers on
+                // any PCI reset.
+                RegistryEntry {
+                    key: "RMForcePcieConfigSave",
+                    value: 1,
+                },
+                // RMDevidCheckIgnore - allows GSP-RM to boot even if the PCI dev ID is not found
+                // in the internal product name database.
+                RegistryEntry {
+                    key: "RMDevidCheckIgnore",
+                    value: 1,
+                },
+            ],
+        }
+    }
+}
+
+impl CommandToGsp for SetRegistry {
+    const FUNCTION: MsgFunction = MsgFunction::SetRegistry;
+    type Command = PackedRegistryTable;
+    type InitError = Infallible;
+
+    fn init(&self) -> impl Init<Self::Command, Self::InitError> {
+        PackedRegistryTable::init(Self::NUM_ENTRIES as u32, self.variable_payload_len() as u32)
+    }
+
+    fn variable_payload_len(&self) -> usize {
+        let mut key_size = 0;
+        for i in 0..Self::NUM_ENTRIES {
+            key_size += self.entries[i].key.len() + 1; // +1 for NULL terminator
+        }
+        Self::NUM_ENTRIES * size_of::<PackedRegistryEntry>() + key_size
+    }
+
+    fn init_variable_payload(
+        &self,
+        dst: &mut SBufferIter<core::array::IntoIter<&mut [u8], 2>>,
+    ) -> Result {
+        let string_data_start_offset =
+            size_of::<PackedRegistryTable>() + Self::NUM_ENTRIES * size_of::<PackedRegistryEntry>();
+
+        // Array for string data.
+        let mut string_data = KVec::new();
+
+        for entry in self.entries.iter().take(Self::NUM_ENTRIES) {
+            dst.write_all(
+                PackedRegistryEntry::new(
+                    (string_data_start_offset + string_data.len()) as u32,
+                    entry.value,
+                )
+                .as_bytes(),
+            )?;
+
+            let key_bytes = entry.key.as_bytes();
+            string_data.extend_from_slice(key_bytes, GFP_KERNEL)?;
+            string_data.push(0, GFP_KERNEL)?;
+        }
+
+        dst.write_all(string_data.as_slice())
+    }
+}
diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
index 0d3c46f793dd..e5aab4032175 100644
--- a/drivers/gpu/nova-core/gsp/fw/commands.rs
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -54,3 +54,53 @@ unsafe impl AsBytes for GspSetSystemInfo {}
 // SAFETY: These structs don't meet the no-padding requirements of FromBytes but
 //         that is not a problem because they are not used outside the kernel.
 unsafe impl FromBytes for GspSetSystemInfo {}
+
+#[repr(transparent)]
+pub(crate) struct PackedRegistryEntry(bindings::PACKED_REGISTRY_ENTRY);
+
+impl PackedRegistryEntry {
+    pub(crate) fn new(offset: u32, value: u32) -> Self {
+        Self({
+            bindings::PACKED_REGISTRY_ENTRY {
+                nameOffset: offset,
+
+                // We only support DWORD types for now. Support for other types
+                // will come later if required.
+                type_: bindings::REGISTRY_TABLE_ENTRY_TYPE_DWORD as u8,
+                __bindgen_padding_0: Default::default(),
+                data: value,
+                length: 0,
+            }
+        })
+    }
+}
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for PackedRegistryEntry {}
+
+/// Payload of the `SetRegistry` command.
+#[repr(transparent)]
+pub(crate) struct PackedRegistryTable {
+    inner: bindings::PACKED_REGISTRY_TABLE,
+}
+
+impl PackedRegistryTable {
+    #[allow(non_snake_case)]
+    pub(crate) fn init(num_entries: u32, size: u32) -> impl Init<Self> {
+        type InnerPackedRegistryTable = bindings::PACKED_REGISTRY_TABLE;
+        let init_inner = init!(InnerPackedRegistryTable {
+            numEntries: num_entries,
+            size,
+            entries: Default::default()
+        });
+
+        init!(PackedRegistryTable { inner <- init_inner })
+    }
+}
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for PackedRegistryTable {}
+
+// SAFETY: This struct only contains integer types for which all bit patterns
+// are valid.
+unsafe impl FromBytes for PackedRegistryTable {}
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index 1251b0c313ce..32933874ff97 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -649,6 +649,22 @@ pub struct LibosMemoryRegionInitArgument {
     pub __bindgen_padding_0: [u8; 6usize],
 }
 #[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct PACKED_REGISTRY_ENTRY {
+    pub nameOffset: u32_,
+    pub type_: u8_,
+    pub __bindgen_padding_0: [u8; 3usize],
+    pub data: u32_,
+    pub length: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Default)]
+pub struct PACKED_REGISTRY_TABLE {
+    pub size: u32_,
+    pub numEntries: u32_,
+    pub entries: __IncompleteArrayField<PACKED_REGISTRY_ENTRY>,
+}
+#[repr(C)]
 #[derive(Debug, Default, Copy, Clone, Zeroable)]
 pub struct msgqTxHeader {
     pub version: u32_,
diff --git a/drivers/gpu/nova-core/sbuffer.rs b/drivers/gpu/nova-core/sbuffer.rs
index 25e3ad665cac..7a5947b8be19 100644
--- a/drivers/gpu/nova-core/sbuffer.rs
+++ b/drivers/gpu/nova-core/sbuffer.rs
@@ -199,7 +199,6 @@ fn get_slice_mut(&mut self, len: usize) -> Option<&'a mut [u8]> {
 
     /// Ideally we would implement [`Write`], but it is not available in `core`.
     /// So mimic `std::io::Write::write_all`.
-    #[expect(unused)]
     pub(crate) fn write_all(&mut self, mut src: &[u8]) -> Result {
         while !src.is_empty() {
             match self.get_slice_mut(src.len()) {

-- 
2.51.2

