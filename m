Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E6FB4FEC5
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 16:07:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A65610E773;
	Tue,  9 Sep 2025 14:07:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cy00GiQK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2059.outbound.protection.outlook.com [40.107.237.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D3F210E773;
 Tue,  9 Sep 2025 14:07:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sKHhGylpXYem+SitbJXkcPRdIXkTlCK9iGYVwARIryhqizCHd8jm+V5VgVydPSnMCOXvJclFr13sbcbAh5N8BiyzQdfnfffpQfLEPyLzMfn+q4iAchlMlH807GC20NctUlylN//iNlheYKM0htQwHvcQLbIX8RNj3pJ7/JWup8C433m/e2FDZ/gHtQMbSs1H9br/ZfufrhtHwro4Z8wmY4xXBJsGWTBJkjBq6KoXSlLSR4WeMKrkwQ0aHfR+5I9dwjDh9X7FGRnzwH+drD4mOb5Wud4Iot2+8sbKG5Gx/OAHeG664HqVe7FUSK+rzeMdA1/yYsVTRZGkE1dUQqR4XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hU5br8WCHySVbxomD+20xNQ48S0n6Fbv2sbrIDydCro=;
 b=QX+GgoSlWpHI3+3pY2a75zQwnDvSzA0WrlDhH+8gsSVu8wwE6JPRs0RiVBGVricJLJy90Gz2+UfhePg1rQ8F0aaHbFn3xzLZXsltf8TCYiLUhwwqqE2lLGyvBcMcpxRZPyVn/3BQmmbi70ZdNSw6eZQP5UxRv9Lig5siCHT6XiQaZ5jehOqYN1Nvys5jSvUeS8SgyjLFy3oNIHGvnWTGlf1IgykCsTF0Ke0hNlqgZAwkqS5XLgA6ndkQnQ5EGdNQAAQepmBIb7DQanYB0yC6F3k37X5S3R22XU7CTsDtchpFNHEvjGvTG8rxlXiamcr9EH8TQlnNCSxknWZT1NWrHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hU5br8WCHySVbxomD+20xNQ48S0n6Fbv2sbrIDydCro=;
 b=cy00GiQKB14qyh6+j9xSdex0e8D5l18sl3ewsUGC9SjG0xyegKfBA+lZhM8jALQ3lSm/M8kgC5ocUqzWlvD01pk13W8etYcpVfkf6bdkGmk8wilW41U5ZRcQTs6ntwE7F7SoZDwcbmtAdMSQGCjLNS8vjvvpwUUJudTMDhikOQS3R+V4bnOsxRICrnYi7x8vOW/pqRmb7++Kal77WzDBj1L+ocoGL6dIKCAzavtGDzLHHvQGLAJgRFDiOh9zpuNB3p98WDDfxqJ/Bix0AXpkhkY4ws717ZmePOFYIoGangNoyom3ZNVljKdwZwpPxhxrrNCNBJBiJ5kG+9xllXIeoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB7978.namprd12.prod.outlook.com (2603:10b6:806:34b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 14:07:01 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 14:07:01 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 09 Sep 2025 23:06:40 +0900
Subject: [PATCH v4 04/11] gpu: nova-core: firmware: move firmware request
 code into a function
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-nova_firmware-v4-4-4dcb433d5fee@nvidia.com>
References: <20250909-nova_firmware-v4-0-4dcb433d5fee@nvidia.com>
In-Reply-To: <20250909-nova_firmware-v4-0-4dcb433d5fee@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYWPR01CA0038.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB7978:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a0f0d06-4e0c-4306-c13b-08ddefaa25c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c1AybmtMWXJxajRWN1k0M0M4SGpEN1Z5ZHNqWlo4WitUdk91ZmtTR3NBMEIv?=
 =?utf-8?B?UEZOVVN1LzNhWjh0clVNM3gxajUxK29Jb3lJbEdpWlBoaVNLdVVRSXJWSlAr?=
 =?utf-8?B?L2EydHc5aE9lMjhjZ0kxS0pMUUdOK0FtWmtBK0V3VFh1Ym1Ua0pobUNPM25j?=
 =?utf-8?B?QmtKQTBjOHo0R3k5TlBpRUZSdS9hNm81ZGlQTGNkS3U4dUR2NXVQTUNqZkJX?=
 =?utf-8?B?NFhSQmVuL0lYZ1lCeTJrejlBSmhOZW9WTExCMjllR3pGcDNGeHRubDBtRCt1?=
 =?utf-8?B?ZWVuYmJZamF2bHNVcmJLcUhNdUNKNGZ4aEZ6cEZSY0taeWluNURyemI4bFNE?=
 =?utf-8?B?N1VnSDB4cUxRdlBGQWFiMVBibGJTTkVsUVF0UVBKNmxqOGlFZU1kUFhiOFh4?=
 =?utf-8?B?d3Fxakd6b2FXOE1tWWd1aEVzalZhYUNldWdJQzQ0MG1DQnA1aHV6ZUNlbjc2?=
 =?utf-8?B?VkE1TldhdU5IcXZrNlh4NStLRjh1M3l5MHlZWE1KbjFwMmxsTGdrMlptUnNU?=
 =?utf-8?B?dCs3QmtWa050aGdaRnhMS09DSEx3WVMyb1YvMzh5RGJnVmx0eCtrZ1RpZFBW?=
 =?utf-8?B?a0pLSHhaMHZRNHB6YXdMYStjTG9kUHhUeWNJMUFGTXRSNUtqeTc5VlNTemJZ?=
 =?utf-8?B?ZmlvYXU4RkYvbmxWc2NRV05hcFFpV21JR0xnTi9PRHdoV3lLanNvd21LNVBi?=
 =?utf-8?B?bG9jaFZQSTZnZHI5dS9vS0RyMzRPczBhYkZrTmJmeWQvVU5RbEdLQWFOOXFm?=
 =?utf-8?B?VDcvWUFFaWZmN01vRlZoUkV1eXA3SG5nS0Iwdis1TGhGQkpka0czVmlMRFF1?=
 =?utf-8?B?TWNpR0JIMExHaHFWL25UTlBUdDloYm8xWDUyWm9GNGJoR25zRy9yMmR4N3hB?=
 =?utf-8?B?aG5PL0VKbW1LVzlIRkIycFVZZDcrYXVscW5KdFJlc1hwSUd3Z2RsUmFNU1ZD?=
 =?utf-8?B?ak1ycUlNZ2FZbnZyb2pFajhyMURhZDVaVllpZHdzMEVoRFBZZ2FyK0pyRmln?=
 =?utf-8?B?RXEzQ3JkckdWTXFoaEZ6SGdpWTlEcGRyR0VoR0ozRXNiRENzZ3lTbHloVE5D?=
 =?utf-8?B?V3EzUWw0cVdkc2VRMWpGM0VkemV5NUgxcWtVbHpyaTBIS1FIVFRINjhsL05X?=
 =?utf-8?B?Mm5KaEdKVXZNeUxoOWdqR0tUcGE1SmJnZnNHOStHRHV1QUpXU3M0cENSSVQ1?=
 =?utf-8?B?b3VLbUNiQ0p6YXhhZFRzMHE4NEE2SUEzakx0VzNvTFNvT3J6SnZQMkxBVkUw?=
 =?utf-8?B?dEVTa0ZPTWtIWGxUbG9sSXJkRzhJK2hQcW1SZHlrOURhMVU4RGFSdlc0clJt?=
 =?utf-8?B?L0FNOTlOcHVmZGs1eG9RbWpYZEFyNS9PTmRvbE5LYVZvYzNCYzJ4MlB2ajFW?=
 =?utf-8?B?R3drL0g4M3YwbVAvTU55d0pxVzF4enFyUFlITUpzTEJyVVl4Y24xU1IxL2pz?=
 =?utf-8?B?aHpOY3h6anZpNGhBcFp1UkQvSm5HSUZjeHd4YTBOZk5KRk45SmROOUtPWXBz?=
 =?utf-8?B?UFdOY21FMVpOVkJiVWpKc253N01UUjhZZm1GS25FaUhYUU8xemJSTllYejcz?=
 =?utf-8?B?RDh2MHRhTFJRN2VjaE01aWc5SWdaeElUMUptYVFJZm1zSWFpSDd1MnhvektD?=
 =?utf-8?B?ZDl1ZlVIOEhGL1REVjZkMjE0eE16bjhGRUVWMU1mVWJXT3FIVVdMb2Q2dkpZ?=
 =?utf-8?B?K0N1RkNJQVFMRFEzYlFlVnZXTE1OcktCQ2tFYXhDLzNtMVhreWxGVTBsNjlW?=
 =?utf-8?B?VXNnZVZha1UyTVNMc2NaelgzdTlVZzRiNkl6aStKTzUzOXlPNjVDaHBtQXZX?=
 =?utf-8?B?VXpEb25aUGhEb2UrTHpTU3FOOE5JQ1hDUmNnNEY5TXVvcU9HRjJDVFBYSTVQ?=
 =?utf-8?B?V0M1Rks5Ry9wdlZUS1NjbGtoSUUyWHdvYnkya2x3L0huaXRZRXB6L0JYb2lB?=
 =?utf-8?B?c1lYTmNFM2VIMGRHZ1ZtaCtSNW0zWHU2UE9yMEJ3LzJrUDdNWWxQNHVjbkwx?=
 =?utf-8?B?bnRheFM0M0l3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVZmQ2tTZjE3K0xzOFdaL05yTklFaGN0QkpUTmp5MXVIVElsRC9lOGRxT1RS?=
 =?utf-8?B?R0Y2VWduaklqK1E4SU5IR3VVS2tzYlNua3pvSG50ZExSM2hKaDBlcWoycFJY?=
 =?utf-8?B?dGZnK3dldWdmSVBUc2VhNy8xUGJ1WGo4cmswbXVJVHR6cHJPNks0bVc5S25G?=
 =?utf-8?B?aXEzY0F6STBzNkZRSUdDOUNmZWFKMWJRVEFuOWJORUIrK0tVdmZCZlRNa3Na?=
 =?utf-8?B?V0VyUGUrYVNPS2xwQTRZR09iUnhtZzk5V1psNzdCWTZ4L3c2bVhycWlxc3hz?=
 =?utf-8?B?UGN6eStwSlByLzdHRXp6dU5pRXlCV1RVVll0RjIrcUoxUkpST2xlWmUzcjdE?=
 =?utf-8?B?N0tEbXJiZG8rSnRzMkVCZFBVcHdQbU5nRjV0SHo4ZXBCZ0t4dEphU3JNbU5G?=
 =?utf-8?B?NU12SHJOeGFNd1d4N3g2RE5OOTlNTnl0WmdJU2cxdmE2NzljWkcyUktsMzVI?=
 =?utf-8?B?eE9pcGFNd0hQSzdwR0k0ZWpHWU9PWFlRRHF5d0ZQNWtENWx0MHVjaEdTU2Qz?=
 =?utf-8?B?UUNwazFNcG8xRzRXZ1EyOGdUQ0s5V3pUU0h2OG9UKzlSN2l6NHdjZTloQkF5?=
 =?utf-8?B?WVlab1RzOFJLR2NWSllGVGNHQ21nZExTamxPdHd5K2hmakk3RzcvWituV0dJ?=
 =?utf-8?B?azFaTU5YQTQ1WWZyLzJIR2IwQ0pnOXhmSlpYZTdkTnBPOXZVVUVzR3pSWEZX?=
 =?utf-8?B?dEFSckw4aHhVSlE4aTZqL0JuaDlMMng1QkJBZ0lWSlNRMUtkUWpDSmlsbENo?=
 =?utf-8?B?d3hCMkh1NjVENHp6aHk1c3M3SHBqZ2h0T1p4WDgveWFkYXJYMW1Idk1rSlNH?=
 =?utf-8?B?dlhNekJUU25vUU11cG5uRjBBN2dSWFJtWkp6blBTcGRrR3FGU09VQWpOeXVX?=
 =?utf-8?B?cE5ucGo1amhWQXF2THBtNFg4WEtIaEZuOU9UYSttdW5ZSzZESy9za3hvUDAw?=
 =?utf-8?B?ckVHSXduQTd4NktvVjJ6bWVraVFHb3YwMVpBY1RzOCtsc1diY0FaZnpkUkZK?=
 =?utf-8?B?VlJ3azdZd2xYcitsd1JMUUloREJSMzdyZlhUSFhCVnN3eWJYR003akVkSWRH?=
 =?utf-8?B?S05JWmM2UXFEMUt6NVJWTEhCZ1pNSVJkOFhoRGVYY1dHQVJnRDZaRkZSVzFU?=
 =?utf-8?B?MzY3K0trNmlGaGRwc0VLVEpsQkRRWWRETUpSeVBSQXhxQ04xTTZ5VHFLVnJJ?=
 =?utf-8?B?NXBvaHRGVmlIeGhDZlpWeTVXOTJHYmMyZHgzWi9ZKzJjejdtZy9CbVVvVE5x?=
 =?utf-8?B?MnR5b2N2cXZUOE1Zcisvajd6SkhZYUc3eWtRc25jelpqY0ZudGR6b0E0Qjc1?=
 =?utf-8?B?am9odzdJZHpBZkNWc0JUSndBSVh3SnJxblVxSFdBRnJKWjlMSzU5dHZ4UEd1?=
 =?utf-8?B?ZVFpRERzWGo4Z3NXRnhMZnlaR0R3c1VFTzJxVm1xS21mZEpyS080bFZxa2Z1?=
 =?utf-8?B?czZaUTdqcFVNNlVCSlhtWVJTdFdwUEdTeStuSTRGU3ArRHBqYVlTUVhBVHNS?=
 =?utf-8?B?TXY4RStkRW9Kc2k3VHBNck9rSDRkRWxFKzZkeWlpbzhQWXBHd0N1c1hlSnM2?=
 =?utf-8?B?RENQWGxXaFNuSThEN0xMMEpFZU90aC9RaUJjckZFQURrSDVxWm5YL0U5L0ZN?=
 =?utf-8?B?OEFLMjkyQ05HaDgrdnFRZVlSWk5vazRTc0I0Qlh0dmZjdkNoY1NLNHNPWlFm?=
 =?utf-8?B?MDdlT2VVc0VXVlROczRxa2czR0hBWFJDM3E2T3BHVFErWUFQZElKWDd0UmhZ?=
 =?utf-8?B?NHR6N3N5emVmN0RHSnJNTEZ2akhlZ2kwWEpqR0ViNHYreWlTMGFlcCtZdmla?=
 =?utf-8?B?UitUa05OS093WUtkdHJJQ0ZEc3JndWh4ak15OTVkKythaG5wM1RralRnWm5a?=
 =?utf-8?B?ZDlnWWdjRHliM1BiRWJlRGZoZDJFWVo1VzVTTHBUbjNqakpORUdJNkppQjJv?=
 =?utf-8?B?NlhIemFXaThpK0VOcXY0d1lhanJwOUwwMGwwRm5LekNRYlpNc01XWDBNaFlX?=
 =?utf-8?B?UE9ZV2d4RXZxaUE3aWx4YmYvQkszZmZKVTQ2RGZZTEpic0VndTNudXRRc0pD?=
 =?utf-8?B?L01COEJVZjhDQ1ptSk41WTBMNFdhVVVxejd1V0tGWmRqYWpXWC9HbnpORDNW?=
 =?utf-8?B?YWFJWTZ1M1Zva2F5VkZCS2Znb1Z2bDRmbC9QYzVJZk9oTkxUbTBscDN5bGk2?=
 =?utf-8?Q?++zMSqHX5aN4XIsA2P74G4g6WlM1FKHYYOPK0/rRWKLs?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a0f0d06-4e0c-4306-c13b-08ddefaa25c1
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 14:07:01.4535 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bOf/PZmrhvgRY9FcKsRiq2HsKsFbPs4QVUAImqaT5F/RnhIInDLZcQMqOvGQhIZ404+yZRNf9Azi0u+/z65gEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7978
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

When all the firmware files are loaded from `Firmware::new`, it makes
sense to have the firmware request code into a closure. However, as we
eventually want each individual firmware constructor to request its own
file (and get rid of `Firmware` altogether), move this code into a
dedicated function that can be called by individual firmware types.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 213d4506a53f83e7474861f6f81f033a9760fb61..4e8654d294a2205ac6f0b05b6da8d959a415ced1 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -19,6 +19,19 @@
 
 pub(crate) const FIRMWARE_VERSION: &str = "535.113.01";
 
+/// Requests the GPU firmware `name` suitable for `chipset`, with version `ver`.
+fn request_nv_firmware(
+    dev: &device::Device,
+    chipset: gpu::Chipset,
+    name: &str,
+    ver: &str,
+) -> Result<firmware::Firmware> {
+    let chip_name = chipset.name();
+
+    CString::try_from_fmt(fmt!("nvidia/{chip_name}/gsp/{name}-{ver}.bin"))
+        .and_then(|path| firmware::Firmware::request(&path, dev))
+}
+
 /// Structure encapsulating the firmware blobs required for the GPU to operate.
 #[expect(dead_code)]
 pub(crate) struct Firmware {
@@ -30,12 +43,7 @@ pub(crate) struct Firmware {
 
 impl Firmware {
     pub(crate) fn new(dev: &device::Device, chipset: Chipset, ver: &str) -> Result<Firmware> {
-        let chip_name = chipset.name();
-
-        let request = |name_| {
-            CString::try_from_fmt(fmt!("nvidia/{chip_name}/gsp/{name_}-{ver}.bin"))
-                .and_then(|path| firmware::Firmware::request(&path, dev))
-        };
+        let request = |name| request_nv_firmware(dev, chipset, name, ver);
 
         Ok(Firmware {
             booter_load: request("booter_load")?,

-- 
2.51.0

