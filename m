Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 947A5B482DA
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 05:26:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B5A410E0AB;
	Mon,  8 Sep 2025 03:26:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZjfL+mYB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2067.outbound.protection.outlook.com [40.107.94.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3112510E0AB;
 Mon,  8 Sep 2025 03:26:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rIIzAKoTsPPE6fJwy1EIMkrbaeOjlnJnirNg+9DeY6VLhUpa4uCyuH9Ar03G/BCoSdcOHzV/UtD7b/weZRXTIgj/MhMmQVgzIQvROx4ce4Oy5O1cOPr6IBiQT4XlfnQQEDFW7uOHIdy3LFd9rdvm6sPHxv4Us/S2rdNXyZ63ovwoWNrfFp1ySEn7WP4Z2x31tMw58I3YYYWhaDNck0m2dM6rVhzcLc7cRcOm2pSNVfU9XPQMpodS2YPltMsgqjuW7yZDk6jAqHfYEJrYdHE5PubZbLZstTVJq+81Ch8aGkMjoedfIKXvRptxpqXAMmSn0ucc00jMCqTpKhk12U4ZCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pPGGYgn0fg9OCPHlDxdpZM4T9z/qAgn7U7gFsYxCBqw=;
 b=NjrMEqmHTouUyQTEhTH2o9AFCsPJx++PJ7Qwjn0JR12RbfXONivjegXdFjbqU1KcN8TUeIcNk5eO8TmNQoMKrxF5f21kpj73ZCecy+rkbdJ1Ag5mNoSycGCV9xqVizFzWxIHsh/uamDWIuBkL34u/8rLNDLYCCfRPFOsAm/rLYcd+AFSPI6vt9TBLm5G8tt6JNk1NeCOW+8q4Qqh2gO/B0TXh3IgX9vyYS9N7ZU5iDm6OkWZDKqKIDAobPrShsWnd66ieZYqTcpYVY8G/+P55PH756mTO4Tf8j+QVwLcWL603hf3UD9mu7kN6ssYMRj/5yU8P+hLH1CzO91t37q62w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pPGGYgn0fg9OCPHlDxdpZM4T9z/qAgn7U7gFsYxCBqw=;
 b=ZjfL+mYB0DxSon3lmRDFWnglTzhHvWcgK9qIVcbDxeUd6cM4Wvh8iW1Vj9GJwUXn1S1vm3UR+I4FmBoMPbABCZ6aIniMW2D4K6qi76+F8vuSTMeRAX4JN+Ribo0BbfiBwP6DVBB7/eyqWwj0x/XJeCiJ4ESLmUPC0dS6nEQXdCzancszJ8AUfyEK6PFucBevzrxGDWO/x+gYa0BP7jVKj/VkXPjWYpt0D2IfX9uQMYTzPL+aRPBFRHE1yBtK5OaaifgX7TLv3PT5EwHjKFkubdEoSP2D65uocVj4TRddIXe/JoFl1WAUTnoKSiDFUQnrvEoYkJ7y9DvF++LdelLZIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8852.namprd12.prod.outlook.com (2603:10b6:610:17d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Mon, 8 Sep
 2025 03:26:47 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 03:26:47 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Sep 2025 12:26:43 +0900
Message-Id: <DCN3KJSVTTEJ.3W07PK2E85XO3@nvidia.com>
Cc: "Alistair Popple" <apopple@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>,
 "Daniel Almeida" <daniel.almeida@collabora.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 2/4] nova-core: bitstruct: Add support for different
 storage widths
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <dakr@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250903215428.1296517-1-joelagnelf@nvidia.com>
 <20250903215428.1296517-3-joelagnelf@nvidia.com>
In-Reply-To: <20250903215428.1296517-3-joelagnelf@nvidia.com>
X-ClientProxiedBy: TYCP286CA0296.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8852:EE_
X-MS-Office365-Filtering-Correlation-Id: e38de6a6-34ab-4c42-ef94-08ddee878a81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|10070799003|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VzhGNnRPaFVCQms4U1B6WU1TdjMxaUt0RzNJRW5HNXdsUTdOUVNTMW1RYWR1?=
 =?utf-8?B?UWIyNDhnKzZZY0pyM0ZYcXVSY2VpbVdza05OS0JwV1RRYjRSckk3Mk9XdlA5?=
 =?utf-8?B?WHduMVVvMm13YUg2d1F5bHhodWlPcEF1RElzS2Y4QkhIQXNqL28zQThWSHpn?=
 =?utf-8?B?VVUzaWRucGJxUmRSazExMjg4MHJRaVEveHdiNWRCT3BMMThONWRDQThEU1Zu?=
 =?utf-8?B?MXVKQlBMSzlldUxqY3JneUNMS2tVOFFFN0JuYmFBK25qUXY5K3pPbURNcjUy?=
 =?utf-8?B?TzdCSmR4MTJDZTFlU2wrSWM2VFB3NXNiS1BVZ2J4bTUwaWhqTm5MYnB3Ni9v?=
 =?utf-8?B?QU5tdDYySmpPY0h5S21NQnVaYjNRMGFtQ1FWU3lTSHIxRWFZb01yTWFaZ1Uz?=
 =?utf-8?B?b2NZKzlXRW1lSUVSbENSaDZNdk5nS1BKSmVrOHhDZUxlcE5BdUNiM1hyRWZS?=
 =?utf-8?B?RWVLSlI4cU9vSml0ZHJrenhMNEw5Z1Qya1FsT3R3eXM5K3pIVTNlQThFRkNW?=
 =?utf-8?B?M05nNnhMVDVmNkgxaUdoQVI1RmIvTlA2MVRDVGd5aktGNHh4bG9yUCtXVWFh?=
 =?utf-8?B?ZkNtTkw2cEZxekhUc3IzTk04THhkN2Nsb0lPb1JOK0EvZEFCYWpTcWp3SkJB?=
 =?utf-8?B?YVZLeFRtSDQ4dkxZYkdVelhTUUZrT3E3d1Nsb2s4YnlySFhlSnhBWnZtbWpW?=
 =?utf-8?B?cFNEQWRKNmJvbmM1ZDhlQU9CS3laRElJbzRnQmkyT1JLOW8vaC9Yb0F5dTNK?=
 =?utf-8?B?UE5zaUVkQnZBcndBME5kNVMzSG1aVCt2czBsMTl6dCtOZFhzMkNYU01QcWZM?=
 =?utf-8?B?NGxjVDY1cVJhZ1FzaHRoV3VlNlhXUFA5M1lGOUYremVpSjZ1VUxESjU3T0FN?=
 =?utf-8?B?Y2F5THZGMFU3cklTN21mcERoY3dCTDdJZEhNUDhwZEh6VW5iTDFaMGVXRE5p?=
 =?utf-8?B?b3ZVMFYyY0V4N2VoMnZDbjhIUzc2eHo2dGtDdml0Qk5RUTBJeTdpZ3EyL1Vx?=
 =?utf-8?B?Sk94Z0h3aDBTRUgwRlRvQ1VveCtQSkU5ek1QNmFXc2xjL3lTT25XR0RQT2Ex?=
 =?utf-8?B?UytJQnllMFA0dDdzUWRtV1RpdDkzWm1Qd0x0ME82VFhDYld2UkNXVENwK1p0?=
 =?utf-8?B?WTR5RjZoa0VSSGRwQnROZUdvakFCeXRBeGN1QS9EQW8xeHBEMU5DczlkTXJj?=
 =?utf-8?B?Q2ZURnpLYmlPZVB1MTdIU0ExRlVzSmFUWFB5OFpHKzVYQmpyUWZOQmN4dzdJ?=
 =?utf-8?B?K0F1UTZ2ZUZYRFg4am8vSWlQaVhiQkMvUFd2UDVXZXFzdWw5dXRuUGN4VytV?=
 =?utf-8?B?akxTUWtrNnBsSTBJZlE1cHJrOWlHTUx3Z2RvMkR5MTMzUmxtL0IzN2tSV1Z6?=
 =?utf-8?B?cjlhWWV4STVqbGhOVFJrN2podjVFZkdmTlZZSFdlWFlydnlzajN1YTRxQlVq?=
 =?utf-8?B?MmJDOCtiTllZbXM1cVFtc0lKRndmNGFhKzd0djZibEtZNjhjRHhpZk0ySWI2?=
 =?utf-8?B?TTNmeVBXOFMrQnhqOHRUM0lDSHEyY1VYMFRrWm9SS2QwUFlWeU9WbkFyMGUy?=
 =?utf-8?B?MmJGVnJ3UnZBT2ZFU2NQSmUxekxCNzd6VW04WlI4RnEvL055ODZmbGxDV0Zr?=
 =?utf-8?B?WXZPV1QyZUVMWWY5MzJmcVRFQ0FrT2JPRE80Tm9SN3dSVFpOK01xNkNuZ3lK?=
 =?utf-8?B?ZytXMFVlWVNxWlBRbHQ0SWNybFlLcUJGdXV1a2N0OUZ1a0NqbXEzcWJwSExM?=
 =?utf-8?B?TUFyUEwwUVhCNW5YclFYaktWdklCUU5oNXRmam1va0dQdGwycWVSWUNEc3Nn?=
 =?utf-8?B?eXViMHFwSkV3MzZiMUFJaE1nNlRNMzZJSis0ZVFRREN6TmI4Wjkwc1JXbGIv?=
 =?utf-8?B?OFdPNkNOazZtS0FORTBlL3BvMnNsZklUN2RuZTJPdExFQTF5ZGMxMjhmc2k3?=
 =?utf-8?Q?8h7jScT1OP8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGhqNVA1TVBhaDVHem1mZ3dGQnlOcVNUc24vVDVDeFZFN1NjaHNjblY3amlZ?=
 =?utf-8?B?RXkwZjVzZFppMldlcks1dDRRRTdEUGc1MFJoNjRLU0xJK0FOYlZjOXBhV0ZJ?=
 =?utf-8?B?U2U5WmJFMGJpSW0yYURJbHRBbGR6WkV3bVhhNFh4Nm4rV21aV2pOSnpFYnI2?=
 =?utf-8?B?OXloVWlYVXlPR3grN1BndTcwUjVCaWVvcndxTjhaQnVKbnJPMW5abkN0VEVB?=
 =?utf-8?B?V2lFM1E4dGRvblQ1cUJUOU1xbU9HZWdkMFVVRXE3S0krc1lkZmFuR1JNYlVL?=
 =?utf-8?B?ZVZEVjVSdnhKTUc0TnBpdUYyYVNSVGZuWGVQeU9OZi9KSWpER2lIYkFIcDUz?=
 =?utf-8?B?ZUJuckhyN2lGTlNKSk9sWGd6emZmNXkyenBoNDEwdExCbUFPczUyS2hKenk1?=
 =?utf-8?B?dDU5TXdCRHFVV1VPM2c0YjlXQzJIYkR4ZXA3VHc4alFETkY2eVFGczl6SVV4?=
 =?utf-8?B?cU1lOTkyVzZkMTlyZ3pFMTYyUFlEMUlsWUQzTCtac0xFZ1lkQUhDbjhuTWxT?=
 =?utf-8?B?WFdvcDZhK0wwdDhwcGVjQWExOHQ1YVJ4c2FFcDZyaFlQeVQrcVQ2b0hNcXdD?=
 =?utf-8?B?REtoQXZST1JTWVBoRjlXdDBtTGxwUHVtVFJVZUFPQVo3cEZ1Q1ByNWIwdW84?=
 =?utf-8?B?K2N5YlF2UWFiRS9ETjFxNkdQS0QxWkNEckpPZE1jc3pVdC90YW8xcFNnanBj?=
 =?utf-8?B?Q3hCTDRPZnNoakk3QkhzallIN0lwNXZFbXBZOWlKWDJGOEFYZ3NtU2x3ckdK?=
 =?utf-8?B?c2YxWHIwSlUybUUvRklkeHVkNGcxakgxem83U0dkSFZ1Y2JEV0ExdWljYTRM?=
 =?utf-8?B?V0ZlNXBEKzliTjAwc2NzSHZEcnRqajJqSm5EWEdvL3lYRVk3NDV5cGRDUmJt?=
 =?utf-8?B?ODFVWU8xVzJVMHFSUEhjVjZFTVViL3JqNEFOdlI5U0lQK3h4RnlOOXplTENy?=
 =?utf-8?B?dE5ncGg1VXJseUIwZzQ1cWthMTkydURCak93OTRLYndWOS92Q3hBQVluQ0FC?=
 =?utf-8?B?Vy9ocGdhRmdUUy9ZVHhpODVoa0R6R2FLMmNhRGoyak1EdSsvbk5ORENMNHBs?=
 =?utf-8?B?Qmd1VVRQcHMxQTFKUE53d0V6cnZ6cmt1UjBpNXZlTzFTYmN4LzJ2QkRScmRC?=
 =?utf-8?B?QXhsOEh5WUZNb2RGNUdtN3BYcXRQc09uY3BKYlRnNzNyZStqTzIrVWtZZkd6?=
 =?utf-8?B?MngvZ2czTEpQS055NDNqeThZOVpZQURxTWl4Q29mMWh4WTRvcjloZFJ3MWFv?=
 =?utf-8?B?OVNWRE45OUV3cVNFTlI5c2ZxMzdjcW5yS2YzNXJaTThjTmI0WURZWEl4WWZP?=
 =?utf-8?B?VXlBeGVnTlVJSFh0OGhzbHN3SjNnbCtMOXlrdE5kV0E0QXEwNVpKOHNBbUIx?=
 =?utf-8?B?SmVXL2NtWHNlQXovclJBaGtKb2VWWWtFK2k5eGZDbktXOFhMNS94bW1SYlZ5?=
 =?utf-8?B?TEpnUHpjNDFRK3FMSGU0QWFhem5Db1diVjVsdUpRc0tRNEpsNXd0aGtuS0R2?=
 =?utf-8?B?MW95SzI4cHRXakJZaDkvUW1SZE5qOENaT3gxM1RRQmVYQUhRWXlhYitacHpO?=
 =?utf-8?B?UXRYVi9JbUNMdHloQzZGVkVkQkVSNVpKWDIwdmFhaVpxbEpjakNFU0dxVExM?=
 =?utf-8?B?L0VVa0xhVnQzZm1aK3dpWnJtb3Y3QUlEbGIyVU43MjVFSmN6ZmROMGo4QU5x?=
 =?utf-8?B?SmhaU0c1WldLNnNsUEJIOXZVWVVmOGI3cUZISElZSFpQUURDTDM3SlcrS2hG?=
 =?utf-8?B?cW5LYm5qVUlKa1hSbU0yMGErc0VxcUZXTHRCengyMGgreHZHZkJXd1duQ3dL?=
 =?utf-8?B?cG0xMVBVVTV6b1BFUUI2a0pYQlBuNWRETk15OGE2YlY2RGNnWmQ0MFE5UTBD?=
 =?utf-8?B?SndwWVFYTjN2RWlyWmpnOEpjSEo1TGttdWhrRG8xNzJTVCtPYTR5d0luK3pJ?=
 =?utf-8?B?bzNEc0dWaExVQk1YQjFNM08yTzhTVFJLQmR4UmpLZGljcDIrdGViWDlMVTJz?=
 =?utf-8?B?MFMyUkVRQ0RocnBFWVY5ZHlLL1BHelRJOWlYMEpqOVVKa3VoOTF4dlNXYmVU?=
 =?utf-8?B?Ujl1TlhqU1lIQmR5WllRcWRCakpCS3JGN29DdGhhaWJIK3F4Rm1ZT3lqRVA1?=
 =?utf-8?B?eWVBUFFKNGlMOHhzcWxiQjhMSUVGV2VWNVBmcnFWNzBEZU1JVzlkRnVWcUp3?=
 =?utf-8?Q?GL05fvx74G9Hj6/Z7TfqQ8bYQpsEpbzGeD50CRBQq25F?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e38de6a6-34ab-4c42-ef94-08ddee878a81
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 03:26:47.0550 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ldrWMTFXTm+MFLXRMDhx+Hy+Su8QxdnRCsGqnefjLT8UKnMcivBRkrvbHkaJiPzettolSf9a3hZMF+HQsNMu4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8852
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

On Thu Sep 4, 2025 at 6:54 AM JST, Joel Fernandes wrote:
> Previously, bitstructs were hardcoded to use u32 as the underlying
> storage type.  Add support for different storage types (u8, u16, u32,
> u64) to the bitstruct macro.
>
> New syntax is: struct Name: <type ex., u32> { ... }
>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
<snip>
>      // Generates the accessor methods for a single field.
>      (
> -        @leaf_accessor $name:ident $hi:tt:$lo:tt $field:ident
> +        @leaf_accessor $name:ident $storage:ty, $hi:tt:$lo:tt $field:ide=
nt
>              { $process:expr } $to_type:ty =3D> $res_type:ty $(, $comment=
:literal)?;
>      ) =3D> {
>          ::kernel::macros::paste!(
>          const [<$field:upper _RANGE>]: ::core::ops::RangeInclusive<u8> =
=3D $lo..=3D$hi;
> -        const [<$field:upper _MASK>]: u32 =3D ((((1 << $hi) - 1) << 1) +=
 1) - ((1 << $lo) - 1);
> +        const [<$field:upper _MASK>]: $storage =3D {
> +            // Generate mask for shifting
> +            match ::core::mem::size_of::<$storage>() {
> +                1 =3D> ::kernel::bits::genmask_u8($lo..=3D$hi) as $stora=
ge,
> +                2 =3D> ::kernel::bits::genmask_u16($lo..=3D$hi) as $stor=
age,
> +                4 =3D> ::kernel::bits::genmask_u32($lo..=3D$hi) as $stor=
age,
> +                8 =3D> ::kernel::bits::genmask_u64($lo..=3D$hi) as $stor=
age,
> +                _ =3D> <$storage>::MAX

Since this is a const expression, you can use `build_error!` to make
compilation fail in the unlikely event the `_` is taken due to bug in
the code.=20

> +            }
> +        };
>          const [<$field:upper _SHIFT>]: u32 =3D Self::[<$field:upper _MAS=
K>].trailing_zeros();
>          );
> =20
> @@ -211,7 +220,7 @@ impl $name {
>          #[inline(always)]
>          pub(crate) fn $field(self) -> $res_type {
>              ::kernel::macros::paste!(
> -            const MASK: u32 =3D $name::[<$field:upper _MASK>];
> +            const MASK: $storage =3D $name::[<$field:upper _MASK>];
>              const SHIFT: u32 =3D $name::[<$field:upper _SHIFT>];
>              );
>              let field =3D ((self.0 & MASK) >> SHIFT);
> @@ -226,9 +235,9 @@ pub(crate) fn $field(self) -> $res_type {
>          )?
>          #[inline(always)]
>          pub(crate) fn [<set_ $field>](mut self, value: $to_type) -> Self=
 {
> -            const MASK: u32 =3D $name::[<$field:upper _MASK>];
> +            const MASK: $storage =3D $name::[<$field:upper _MASK>];
>              const SHIFT: u32 =3D $name::[<$field:upper _SHIFT>];
> -            let value =3D (u32::from(value) << SHIFT) & MASK;
> +            let value =3D (<$storage>::from(value) << SHIFT) & MASK;
>              self.0 =3D (self.0 & !MASK) | value;
> =20
>              self
> @@ -237,7 +246,7 @@ pub(crate) fn [<set_ $field>](mut self, value: $to_ty=
pe) -> Self {
>      };
> =20
>      // Generates the `Debug` implementation for `$name`.
> -    (@debug $name:ident { $($field:ident;)* }) =3D> {
> +    (@debug $name:ident $storage:ty { $($field:ident;)* }) =3D> {

This rule doesn't make use of the `$storage` argument.

>          impl ::core::fmt::Debug for $name {
>              fn fmt(&self, f: &mut ::core::fmt::Formatter<'_>) -> ::core:=
:fmt::Result {
>                  f.debug_struct(stringify!($name))
> @@ -251,7 +260,7 @@ fn fmt(&self, f: &mut ::core::fmt::Formatter<'_>) -> =
::core::fmt::Result {
>      };
> =20
>      // Generates the `Default` implementation for `$name`.
> -    (@default $name:ident { $($field:ident;)* }) =3D> {
> +    (@default $name:ident $storage:ty { $($field:ident;)* }) =3D> {

Neither does this one.

