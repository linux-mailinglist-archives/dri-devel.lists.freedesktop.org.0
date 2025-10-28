Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C41A8C15553
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 16:07:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD17C10E5E0;
	Tue, 28 Oct 2025 15:07:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="XvxKx5If";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010025.outbound.protection.outlook.com
 [52.101.193.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EA3110E5D8;
 Tue, 28 Oct 2025 15:07:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V52BmR5M3F5B9xkE/NlS2Ewi+tkQO98X62Wb92NoqO6QuEDFgK9QcAcPmoezTWBcyXMJgB+6ojUEdQBRLiLFtjqLAe9LT/mArLTlNO6oJqNlmknIaFPxZ9r7+npU9sDk+e6ZI0BVBazKQa4l/aibNXqXXuUHNmNxg/TmItFjVPPhcpA/O/G6FsfpVAKYBZMv6ivDJlDLXbpa8FZN0yXBYUBjsv7RRilWE+uT/8a+vl726Kbh+oxp/WZRW0iki/GuttX5ypLUQKC4dNQX3IHtiPYH9laagRikF+UW9HKmm/onojCKTfcALgpcer+NELgl89Yf6rvuTK8ujX2ZRaANeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=soAjM86jq+bjP4ZjihZWywB30j+taTOgsQ0APY9COv0=;
 b=aEU/O6lWdghfEqVrakE53ba/MKN7ceV5rdkUww+wdhc5r9Z0OM20nxCG6GuiLaPg+VP5gAkuQOAxdLmtujPrsCKfcEO0JC87WH998MKkg2MUtVMj/bP/CRgVCTNLmFIfiSERglClC5cBr7AFzO65MgsPntUNzqJ8gHfc28OzRzY8/IYP59LmYslNm1FI7DD2vd3sKkRN+iVx+yKSTSdivkesdmvUd1XuUDbgajXCB1p5gS1C2Y57/1b6Se9D11GcBxSi+1pRgNgUo87yJTMhC8RzC1bzv6nC945xBHKMbV8r9YzJLQxdKdBev3Ux97drG8CaGG7ASqjLWNyjOwmExQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=soAjM86jq+bjP4ZjihZWywB30j+taTOgsQ0APY9COv0=;
 b=XvxKx5Ifu5xp+LG+e7+B6o/etqxlrxra5g9ihN+V47xewf5jnX1HnRM+nd9qans2ISR6W8pOLsOfJF6UhFCE0GcZX7cCrv6axwsZVp3aV9GcfoHVufmApqrQjmJ4IY1XegrZQ0jWqKcQoVsC/F7LWw1bjU1dGZotn5uq72VsLX2C8yCTYaPjVaRQtNTao2Or+1G0ni3QoTvcBOG1FapSVGN91DRmPgskEpr48uAejalrCdTmU9UWB1TqtVCFglm06Ie5hLrG8GAOHaiJrITn9wMVEiaEA9wDWNgr7k5ubEGHHapTiTp+H2H8zRJOfqP9y3i9WWkruNb6qZUy9U4/wg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CYYPR12MB8924.namprd12.prod.outlook.com (2603:10b6:930:bd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 28 Oct
 2025 15:07:44 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 15:07:44 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 29 Oct 2025 00:07:36 +0900
Subject: [PATCH 1/5] rust: transmute: add `from_bytes_prefix` family of methods
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-nova-vbios-frombytes-v1-1-ac441ebc1de3@nvidia.com>
References: <20251029-nova-vbios-frombytes-v1-0-ac441ebc1de3@nvidia.com>
In-Reply-To: <20251029-nova-vbios-frombytes-v1-0-ac441ebc1de3@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P301CA0041.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2be::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CYYPR12MB8924:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c549fde-808e-48ae-8068-08de1633bf8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZEtEZnNjeWRseFBZZ1pFMDRmUEVrbk5ZRFR2TmdCR2V4RStsVjlRUklsS0ln?=
 =?utf-8?B?elg1bThCaDdITXQzenh1VzNpVEl6Q1VtNGxVUEFwU3FzZlh4WndpY3YrN0tj?=
 =?utf-8?B?cWNWV0VRWHNJTStLNHB1WENpeWtXRnRzKzQrc1JHSGQraU56d0hwOFZLRlVU?=
 =?utf-8?B?ZjNhV2hXQTEvZ3UwUFNVSVdvb3UyYmhqVFcvUzJBbVhDeFlNNzZscDNGaFds?=
 =?utf-8?B?WlJsRkZrbUxyS3E1eUpTNjVETVRjc2I3eGxtOGNIbng5N2Z0QzJ6cVR1Sm1L?=
 =?utf-8?B?ZG56WUtaUXpQNUVwaTdQWVBuRVJJRm1hK0FKM0o2WDFvRmh3QmNhelEycmEx?=
 =?utf-8?B?dGI1R005RmxZaGEvaXN6UXUrajd0ZUJkUSsxbnNsUWsvcUd2MzRKV3NTOC95?=
 =?utf-8?B?Uk9ubmk0N1ozSWN0NHJkQnIxM0wwaEZpZXljVEVFMk0rUHd6ZFNPVFBja1FU?=
 =?utf-8?B?QU0rblpiREFpSEgxR2M4Ung3UCtlT0xSVE8rdGdqT2ZxTkQzTU5tMlhiT3Z2?=
 =?utf-8?B?a3RlanVvb21yZWJTTjVabUtrbDZRV1NrcTYzaW9SdzBjVTZ6bFlYMTMrSWdp?=
 =?utf-8?B?YThEMm54VExzWk5ETXZ6QTNadi9heEJwQWVFcFhSLzEvYU5xT3dzeDNCQjZT?=
 =?utf-8?B?SEpmMXF6ZFptaUdhYUJlWDkrNEFISXFiMkg5blBCWDYrbXlGdm5EVm9nN3lm?=
 =?utf-8?B?eFI4Yy92SHJUOFJuNmU5L2tLazFBRktkNVoxMGFlMXFxVGROakVRTmtab3V1?=
 =?utf-8?B?amhtOTFZMmxmdzl0VUlVR1laWEdZc0tCQUEwQ08vSmk5QjVhUldzbGRPTXFE?=
 =?utf-8?B?UWczMmQ3WVUvRllPZzBpTEZIZ3B5V01mRi93eVhlRXdMbURwSE01MTA3S1do?=
 =?utf-8?B?OG5TbGRkWTBnYzJHYmZQcDFhanlLZUFNa2JydFo3c2M1OFNaNEJ3NUk2NThG?=
 =?utf-8?B?WVViRmZTM2xFSGEwQ0p1R21JV0dhSy9mTkgrM3ZzeUtnMVV6SUJTaHU2ekI4?=
 =?utf-8?B?MnJPODJOU2pTcTRMMzlIWHhBdm5XdUQyOUhzaU5xL1I2a3FCN29mTHVCUnFT?=
 =?utf-8?B?S1lUam5CbVphYTUwSWtxMlQwNG50cjJRNVhIUUZpUUU0TDlmUmFacjl5NjRG?=
 =?utf-8?B?WUdKNSs3TmV2VzE3a21DTG1iZHBTQ1g4eXBGb0FDOHlhTzFaV2pQUkx5TnBl?=
 =?utf-8?B?cnlFWmNKUHBjRGpxUnhkeHU5bWdIQ3QvS0xiVC9LeFY5cjZtU0tCTGZGUkJE?=
 =?utf-8?B?alF1UUxkNzdkUmRBTmhOMmZWeThWOC9qN2JkUHllbnVHd2xpeCtsMGJDdC96?=
 =?utf-8?B?NExMdWdHdzhFWE1TejB0cFYyUFFDRncvb0toVjdhVzR4MjB2NkQxV1JodEFw?=
 =?utf-8?B?dUFTbzNpcHF6TFJnMlRWSUdZQVRmWDZaeFJIbXJBTDFXcGVZbGF3Y29IT2tW?=
 =?utf-8?B?YWFTdEEzRTBnV25mdTJ3TXE5ODZTREZnaG43bFFneVVXSnBrR252ZE9vMTFa?=
 =?utf-8?B?Z05kdWphTUFJQzdwVFZpcmd4bFgvZmM4R3BGNnN6UC9MNVVFRzZTaGVRV29G?=
 =?utf-8?B?SlpXd1dFVmZhYU9nUlY2QmZqQ05FeEI2SEw2NmNvSGhoSDc1WWpZNUtEeUgy?=
 =?utf-8?B?VmNrZFF1bnRXbndLVWt3d0NuZHpPd3E3aFZPazJockk2dWJWdThlM3lvdHcx?=
 =?utf-8?B?ZG4yOXBHQUExSXFCRHo0ZUtQVDJkNVZtdlBZQUY2U2QrNysvVnJKb29wb1Zz?=
 =?utf-8?B?LzdxM09qWml4ZjBSSm1xaFd4WGtpbDdXL1ozNDJyY1FWcDBURm42c0dsa1Fy?=
 =?utf-8?B?NU9FVHY5VGtZdlZ0TjNEN1Q3QzNBUjRUd3VEUjZ0TkdEOU9MTWtlOFhTWE43?=
 =?utf-8?B?TzZoOUYxclhuQ1VZcktiM1VJVWVYM1YycFNwL3d4T0t5ZVFvajJtVGVEYmZH?=
 =?utf-8?B?WjlLaXNja1M5eTcwK3Ewd3VxNkNaOHFUaCtZMllIN0lIY3ZMcG5INUxLYnlD?=
 =?utf-8?Q?yZfcIoBfEV2qoo79sq/bTtd2N6EuSY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTBCR1RjbDMydGRXRURFelNkOGR3K0JyODdmNkpOdU9GR21FUWRMVlE4UTFQ?=
 =?utf-8?B?clJudkZQbTdDUEl2UkhhQlFvQXdYSmJySlQvTEhsUyt4eHA0RjBRak9sN1lt?=
 =?utf-8?B?SzhhUkJBS0twWitMaThOeUhZUzhGTHhFNU11QUwyVnZWdGwvK2VxYUZxUWVq?=
 =?utf-8?B?SnZYS00xSE9WWU5pVWUrcVRpRGg4TEVTYW9nTWZCNUJWNzdIbjRBb0JnVXdC?=
 =?utf-8?B?MFM2VlU0Q0l0dXdxMnZhOWJvZkJObWN0czE3dFE5emRLdTRLbkM4YUF0Z2pP?=
 =?utf-8?B?MklHK24vRml6MDR4a0lnR0hud1ZRN0ZnRkx2V0lEUlVMQ1kzSlpLWVpKenIv?=
 =?utf-8?B?MGpTTDhFVXJBYXorWFZ6OEZoczNHZWZ2d2djd3hjZlJtRGFmU0lFeW1jSDZr?=
 =?utf-8?B?ZWhla3Ercm1vc0t1KzZnTncwOFRuWUtsQUFpS1lzMitBZFE2aUlMV0N2UzQ4?=
 =?utf-8?B?NTRGV0l1ZFNNaERaZC81cjhvMSs3SExGa1Z0Tlo2YkhiZVFUbjB0SVkxRTJN?=
 =?utf-8?B?b21jMzdZMmh1Rms5blJWMmQ5NDMyUUplcXU5NnUzVnpNWFJodFA0T2pMc3hr?=
 =?utf-8?B?UTVaVjFOazJ6a1lNaURRTXYvRldNMDNUY1lCYmpoWWtnWUNPbmVmZ3AzRkZ0?=
 =?utf-8?B?dVNoTU5BbWxhbW1PZHhPanJMazdPOHVnT1VubjcyNElkSmJIcVJ5WGxtN0NL?=
 =?utf-8?B?SGdiRXozblUwTFBGejFuQjMzRTlOS3N2WHB1S3g4bVRWZmdCMEExbXczNzdw?=
 =?utf-8?B?Q21VVlliTk4rTkxheGhvVnBvQUNQWEw2NVZhcDZ4aWpwUzREdGh0OHphQTJC?=
 =?utf-8?B?ZzVmRVZqakhtaytIS3Z1UDhTZ0dKditpSXNjWkxjcDBXS2s5RzExV0ZsUDRO?=
 =?utf-8?B?UFVqTzhEY2tTWWg5TUkwblBLNmUvaVBaaFJxZVZPOHBhbmZpSUtBVzZRSk9z?=
 =?utf-8?B?TVpnMVl3c1hrZnFDTVNCamhZQUhVdXZDZTNiR09RblBlMTNaSnB4bm4yY3ZS?=
 =?utf-8?B?dS9PRERPMytiVVhVM25QKzRDMStnNnAyRFlXYlZBVm8zemRlczVQd2ZlU2Qr?=
 =?utf-8?B?VVZGb3dVY3FCekpxN3ptS3NNODJyM2dUMHpRTTFxbThJbCs2V2UwUHJqc1Qz?=
 =?utf-8?B?cWdLbzZHQzBFVTZZaWd1ZGM1WHJ6eUQ0OVFkK3hkZk9kbnZYVHF4MUhyQ0g1?=
 =?utf-8?B?S2FFRUZSWDJnQk9JL3NHbnBIZy9xdkp4RjB0M2RPRmNXNWlpeDhWLzBxa0hY?=
 =?utf-8?B?NDFPdjZhNjVDTVVuNjBtNEZpdjUzSWF3aWU0Z2ZYYVZiRnhGdmJ3Z3UzN3Bp?=
 =?utf-8?B?M2VZM0Z3eUthblZFY1NUVFEwendwU21jc3ZVdUJYTnRRUEhKdENGZlRXYmFF?=
 =?utf-8?B?WlJaM25RM0pBblhwajhGSlBOQ1JYK0RGQmQ5dU5YWWk5QlRjUWtXWmI3SDlS?=
 =?utf-8?B?K3EyYm9xcU1iTzRLOE1NN2Qvd1Q4Z2FOakJlUVJCNjIxdTJaZjIxVFhleFdI?=
 =?utf-8?B?RExqOHNmZzVsQnd5RDVKSi9MMVlQdlFuV2p5aG5RTEhpd2lIOG1hcm9uM1VQ?=
 =?utf-8?B?dXM5L0EyL0dTNWZtdUM1WkVrVHVndXlLWnNnZEcyM3lsc1p2cU9ZRU1JdHQ5?=
 =?utf-8?B?Y3h4SXJJQzI2M0o4TW9mR2VZODRDOEZ3SDdRV3pIUkpPbkVlVnZPRlZ5WEY4?=
 =?utf-8?B?eEhkZVBObmdBNkRpWXYwa0Q0dHBGck02NUhER0tmTFFDQ1I0Mmd4allUSTha?=
 =?utf-8?B?dEZwNHVxTjczTUYwMFFWbGVOMVRFU0pDblU1cDBEdFhkWWE1TE9HMVJXQm5i?=
 =?utf-8?B?bml4eGZtb3NzdFVkbkZkbzlXdU5PdDh1a2xqL1NJM1R6aEkrQU1KeEVxNXpZ?=
 =?utf-8?B?bHN3S2lmZGFJdElWWHRFNFZsTThWWXpSRmE2Q29ZS3VWR2ZuczdRMDluWGYr?=
 =?utf-8?B?aWlZUzN4dUxxSVF5cUdFc0FXREpiQXZJdjIzT2MzcU02bFhWcTdnTlBtTzQ5?=
 =?utf-8?B?MkdtSm1uNTJjY2hKc1YraDVTdGM0dGhMVWVSbHJvbXl0eDNnVmpWdHJ6Mk40?=
 =?utf-8?B?VFBvUmtsaE42NlA2bGE5UmxJemY4cWxZZ29UemVTbXRKMDVwcjhZSWJLTnBO?=
 =?utf-8?B?bWhVQlFhd0hUaGF3NmFpNEtYeVZzZ255NytWdHZwV2dza2VjY0JtVFl6T3dv?=
 =?utf-8?Q?+75BZjrogXRrodf8LXpabX0BWMHcU9Y+1Pz7gRQnzsnA?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c549fde-808e-48ae-8068-08de1633bf8b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 15:07:44.7128 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /H/KR0N83VGfS9HbE0h1eBR1+PnlRKYp+rCEJga5Se0F1cZZajLPSZn9X76Ia0kr4L7vbF2OThDvgGVJae477w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8924
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

The `from_bytes*` family of functions expect a slice of the exact same
size as the requested type. This can be sometimes cumbersome for callers
that deal with dynamic stream of data that needs to be manually cut
before each invocation of `from_bytes`.

To simplify such callers, introduce a new `from_bytes*_prefix` family of
methods, which split the input slice at the index required for the
equivalent `from_bytes` method to succeed, and return its result
alongside with the remainder of the slice.

This design is inspired by zerocopy's `try_*_from_prefix` family of
methods.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/transmute.rs | 60 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/rust/kernel/transmute.rs b/rust/kernel/transmute.rs
index cfc37d81adf2..00cd3092c7cc 100644
--- a/rust/kernel/transmute.rs
+++ b/rust/kernel/transmute.rs
@@ -58,6 +58,26 @@ fn from_bytes(bytes: &[u8]) -> Option<&Self>
         }
     }
 
+    /// Converts the beginning of `bytes` to a reference to `Self`.
+    ///
+    /// This method is similar to [`Self::from_bytes`], with the difference that `bytes` does not
+    /// need to be the same size of `Self` - the appropriate portion is cut from the beginning of
+    /// `bytes`, and the remainder returned alongside the result.
+    fn from_bytes_prefix(bytes: &[u8]) -> Option<(&Self, &[u8])>
+    where
+        Self: Sized,
+    {
+        if bytes.len() < size_of::<Self>() {
+            None
+        } else {
+            // We checked that `bytes.len() >= size_of::<Self>`, thus `split_at` cannot panic.
+            // TODO: replace with `split_at_checked` once the MSRV is >= 1.80.
+            let (prefix, remainder) = bytes.split_at(size_of::<Self>());
+
+            Self::from_bytes(prefix).map(|s| (s, remainder))
+        }
+    }
+
     /// Converts a mutable slice of bytes to a reference to `Self`.
     ///
     /// Succeeds if the reference is properly aligned, and the size of `bytes` is equal to that of
@@ -80,6 +100,26 @@ fn from_bytes_mut(bytes: &mut [u8]) -> Option<&mut Self>
         }
     }
 
+    /// Converts the beginning of `bytes` to a mutable reference to `Self`.
+    ///
+    /// This method is similar to [`Self::from_bytes_mut`], with the difference that `bytes` does
+    /// not need to be the same size of `Self` - the appropriate portion is cut from the beginning
+    /// of `bytes`, and the remainder returned alongside the result.
+    fn from_bytes_mut_prefix(bytes: &mut [u8]) -> Option<(&mut Self, &mut [u8])>
+    where
+        Self: AsBytes + Sized,
+    {
+        if bytes.len() < size_of::<Self>() {
+            None
+        } else {
+            // We checked that `bytes.len() >= size_of::<Self>`, thus `split_at_mut` cannot panic.
+            // TODO: replace with `split_at_mut_checked` once the MSRV is >= 1.80.
+            let (prefix, remainder) = bytes.split_at_mut(size_of::<Self>());
+
+            Self::from_bytes_mut(prefix).map(|s| (s, remainder))
+        }
+    }
+
     /// Creates an owned instance of `Self` by copying `bytes`.
     ///
     /// Unlike [`FromBytes::from_bytes`], which requires aligned input, this method can be used on
@@ -97,6 +137,26 @@ fn from_bytes_copy(bytes: &[u8]) -> Option<Self>
             None
         }
     }
+
+    /// Creates an owned instance of `Self` from the beginning of `bytes`.
+    ///
+    /// This method is similar to [`Self::from_bytes_copy`], with the difference that `bytes` does
+    /// not need to be the same size of `Self` - the appropriate portion is cut from the beginning
+    /// of `bytes`, and the remainder returned alongside the result.
+    fn from_bytes_copy_prefix(bytes: &[u8]) -> Option<(Self, &[u8])>
+    where
+        Self: Sized,
+    {
+        if bytes.len() < size_of::<Self>() {
+            None
+        } else {
+            // We checked that `bytes.len() >= size_of::<Self>`, thus `split_at` cannot panic.
+            // TODO: replace with `split_at_checked` once the MSRV is >= 1.80.
+            let (prefix, remainder) = bytes.split_at(size_of::<Self>());
+
+            Self::from_bytes_copy(prefix).map(|s| (s, remainder))
+        }
+    }
 }
 
 macro_rules! impl_frombytes {

-- 
2.51.0

