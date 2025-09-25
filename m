Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F0BB9DC55
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 09:06:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 170B410E85B;
	Thu, 25 Sep 2025 07:06:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ORVxiOAZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012034.outbound.protection.outlook.com
 [40.107.200.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AED110E85A;
 Thu, 25 Sep 2025 07:06:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zV3gsmF0f2hIWcTUSHQBwhUkFvdvRFN7pNhhGaJ22dLpUaIFRKU3+WMq0Mq+Fkt+63BzbdboHiVY4R5faHwDsQEPdnD/roGjyBZMEvi3hGuQraliWRlDTeo3KWw8PN8uD/GCO/GBEguBDJmGxaNkb8Ko0pt73Rt0PQ/Nmq9U7Dcy231YmZVcF55CugPG074EuWD/7TktDdFP4BRCiXWMG7aD5ndEEcoSgeEDZqeMDz442v3oLGnwvsOr3eSNqvj+2Q5XmuI5GG3gkHnaIfIQEWLSM147lc/5I5TkaSX95gSFHW+WXF2nmqrEurZ0xZZzTrQUEp28rVZnWvZS1NHuGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vfjTRjHbvP/QNAAXBsW9vfeopZbcwzM/Rmxki+VfQns=;
 b=kt3SJOTBZ9s3GGfxUpJ23CozCm1GwSanUuYWhTvp7RTMSubRbYJOSr0qC2ZmNnG1ueZBDdt1LHT2bBdG2i0CQ/Cudj6mWEZr9uP4qVftDfJBo+WpA99CsAN5E3f/zArbx81l9rnGHZZ558A5LMoMRlcV3fRkXD0bmq9/2BqJ0AEYQDEm00wVZhR4LKGPY/bVsFgiH6bNTaCeLDm1ZpwGNQZcIi5Hr7HCtvi+MmaJk8WomkF9B45yVj7Uqggy/NQOY0uWnzr2Til/+G0DY6XgYPkOaWr692+ft3EnD0d47h8BcugkNMIh7XDYWRwZCt0iRRgG2iaWVRBHTmIMH1xNVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vfjTRjHbvP/QNAAXBsW9vfeopZbcwzM/Rmxki+VfQns=;
 b=ORVxiOAZ49wtUk2/ztiOonrXBGOMeDkL0xLNOZKmbg6krfCKAmXpOCNPECog6xoNjDM2ALpqQq1rYO3nr9Nw+5xOUivu6/1bu6y01RESg2r4FXLqDsRKY1rS4OXYm+M/Di7LORfaqfj2YeDjj2ni+LJ2ORzZedg54Wm4/6LvxQDOHLlQ8qIO+hNhZl1wr26o63U6xhkWu5h91IQq23Z9JZR05+wm3sWkM5ie81/wRfTK6uGePQhI50Ho9YObdNgTstR2UAv/KoXE/B0l7t9RtDocOMESQ3phsUucqs7IVg9zgcsFgX1eerl44cB9nLr6aYN+LiFELEfq6jXccyhoFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CH1PPF946CC24FA.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::61c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 25 Sep
 2025 07:05:59 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9137.018; Thu, 25 Sep 2025
 07:05:59 +0000
Message-ID: <2e001ee7-6713-4867-8b81-3955327ebe18@nvidia.com>
Date: Thu, 25 Sep 2025 09:05:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/6] nova-core: bitfield: Move bitfield-specific code
 from register! into new macro
To: Elle Rhumsaa <elle@weathered-steel.dev>, Yury Norov
 <yury.norov@gmail.com>, Greg KH <gregkh@linuxfoundation.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, acourbot@nvidia.com,
 Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org
References: <20250920182232.2095101-1-joelagnelf@nvidia.com>
 <20250920182232.2095101-2-joelagnelf@nvidia.com>
 <2025092157-pauper-snap-aad1@gregkh> <DCYHCLM67KRZ.366VS9PDKLYKY@kernel.org>
 <2025092125-urban-muppet-1c2f@gregkh> <DCYIX8URVIWM.2ZK3GHH3J82XQ@kernel.org>
 <2025092432-entrust-citizen-0232@gregkh> <aNQCVslEIHHSm8f5@yury>
 <2979b6b8-ebdb-43cf-ba3a-5d428101f74b@nvidia.com>
 <d61820e5-ee8b-4c25-8c25-81921d3a7071@weathered-steel.dev>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <d61820e5-ee8b-4c25-8c25-81921d3a7071@weathered-steel.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3PR09CA0018.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::23) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CH1PPF946CC24FA:EE_
X-MS-Office365-Filtering-Correlation-Id: b558b3c1-5e71-4c97-480c-08ddfc01fb1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UW1LTjEvdWE3YkJ6eTdmU0VPZHVhM1hseWlvWUNOVTB2QTVMbmRoK1daVXFS?=
 =?utf-8?B?OC93ODl1NDMrSm9sVHFxTi90RmVtM1A1NHNwVzJ4YW55NWw3bnRJaGk2YlJX?=
 =?utf-8?B?SWszUW5sam85U1Vmam9XSTJFazV6UWk2c0tub1lTWlRtRVRxRkZ4Uy9aZkVr?=
 =?utf-8?B?K2t3QzNXMG9lN3JKZWpQbGFTZXNMWTI5RU94OWduRVRmYmxsMWgxb3VlNk11?=
 =?utf-8?B?T1YyMmxmaXJhRXlnVE94ci9hQ0UvVGtNMmx3NkQzNHhVVGVtL3IvdWtmYWcy?=
 =?utf-8?B?N0ZUcDM1THFCZ3V6VFh0ZG13Rm5jUTVhZXZNaWtNLzRLelBnYVF4Zkp3aUdI?=
 =?utf-8?B?L1AyWURzNExKYUJQSXdVOEJONkhxRm90SXJ0SVdYekE0VlROdUlNZzMrdE9x?=
 =?utf-8?B?UlJrMDBTa2Q3NkRiZ1FNcXdUdDZQekw3STVOSGh1YzcrQXkweHN6Zm1IS0Js?=
 =?utf-8?B?Qm9kUWRNeGo3V0RPdVpoQThSc2VUMDJMRFYreEM3cHVTZzNGQkkvUDRhbVI3?=
 =?utf-8?B?eWRvVTVuOVdhVU5NbTFhQVROOGxpeCtTTDlEWkhJSVFRMkVPQWlEYzh0MGVX?=
 =?utf-8?B?cUo0dGZXbkpnd3BHaE04VWhUQ210RVdEN0kxb3R0VFdIME9DNGZkZEE1ZTEw?=
 =?utf-8?B?dm8xUVFWUlA2OHE1ZmR2UjV6dzlOS3FoUWpBSXFpc3gwaHd4VFB4aGc1a3By?=
 =?utf-8?B?aEhOR1oyM3lLaHhXQ29tUmVPeEZLNkVzaFVBNlpIS3BRYnI5UGVpZWFpV0Vo?=
 =?utf-8?B?L3NHdFEwOS94NWtSTTIvRkZaRVFTUkhhUC9qSVVCeUE3RzRKOGt3UDlKbjlO?=
 =?utf-8?B?V01nZUErei9uc1ZwR1NPR1pnTTR3cE1xQTNZZ215cEFQQVpENUhGUEluY3Nk?=
 =?utf-8?B?Qk1XUmhuNmFTUFlGbnEwWG9uVmlUd0YvM0I0cU95bkt4MXZMQi83VVVheWF1?=
 =?utf-8?B?ekh5VWhYb3dSbnFna3hYK2xMRTFCQnEwRk1JSzNVV2E0OU5mN1NiWnhxVWlQ?=
 =?utf-8?B?MWVMWm40aVExVFI2eEwzdllBVUxCd0ZNbThMcDV5bVNuVDdRa05BSXkyN3ps?=
 =?utf-8?B?dzNQbHk2Mm5TcGIrQXhIenFBV3hKaUdmSTF6SHZOWWpDbktxTmRqYmZrb2ZU?=
 =?utf-8?B?OHlhZUNmYlN5TmNEbFdiVlNiSjk4RHJZTFh2Nk9IcXJHZGtoYWVFNmczckhD?=
 =?utf-8?B?WFFUYndiZDBmUDFGL21RdkhheDEwSWRXdFhnRjJQWGVyRXJmTnNieGVLaUh2?=
 =?utf-8?B?RGJBejV5RFVoREszeS94eEJzbGdYVVh6YXg5ZGRaNVJtSloyemEyb0FLTXl1?=
 =?utf-8?B?Y00vbmJmcUZpVS83ci9GZytRcmxvcFhycjFlaWZ3SVlnS0Z5dExsQU1JODA1?=
 =?utf-8?B?Sm1zaC9qVEhERjVIMWt3bHNPanNxdWpqeExOOG5NVlNTZGFLa3ZEMWNyQjFw?=
 =?utf-8?B?bzhBcTYwVURGTVF0RDhkY29pbytwYXRlVXAvRkpiRm53Nzdzd0JJK0wyTG9N?=
 =?utf-8?B?ZXZZYVVCLzBYalJ0QTBkOTFUY1VyWVdiRk9KaFMyd1p5QnpEbjcxUDQvamJx?=
 =?utf-8?B?NGhDS2hWbDhWcHJMaitTdDgydTJsK3hBWHNaMTFBaG81WFdqbmRSVC9MRzVB?=
 =?utf-8?B?Y3B4M1poQStoWWRRYlVYQVdWUDlGTVdybjMrV2wxTmNrQURIbHI3eU1Neksr?=
 =?utf-8?B?aTBta1EwZXpjenlWZHEvU2FGUitNaGNPL1FqdURLSy9Qa201akMxTUFmc01k?=
 =?utf-8?B?STFZWndIS2VqTW5ROURzbWtoeTBSVjNFQmtjN0UralR2NDdydVVQV3NDcDJs?=
 =?utf-8?B?S2xsbHk2czM1UWx2MkFWYkZlSTVEUXBLOG9FWUhsRGhqWFBRSW1pb2plK2lh?=
 =?utf-8?B?VFFuS2xBUHhEeVVVVFlsV1h1UjlnTW0vVlViSHd5UFVXTldTS2o2REs2TERt?=
 =?utf-8?Q?oca4Hdsr7wE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2NWdjBLMmgxSkhhY3k1TE5Ib2NoWWFzODV6SmdXWCticGp6b3B2YkNnQVN4?=
 =?utf-8?B?MDZlOCt1eXVlRlFaQno0THZFL0wrMDQ1dmdEaVB0SWFnVU9yT0hTMXFieWhT?=
 =?utf-8?B?d3Jpd0Mvay92NUtLSFlwcFhtcXYwZXlIdFptZWpLd2MwRUNKSGF3dFA2YzR2?=
 =?utf-8?B?TmpxQTlYcm15V1pzdDFyQnZqVW9nUVFZMy9oeWFFWmlsTEk0VHNITlBGeW9x?=
 =?utf-8?B?UDlnNHlTazVrSFZscC83L3dhZ0t6K25NdEVyYVNPUnRITlQ3OHE2blBubStv?=
 =?utf-8?B?bFQvdzZvMnBOc2NNd0FjNldDYjJmSUtvNkNrYlgrdnpvUy9abmN4dEl6Si8x?=
 =?utf-8?B?RFB5VUYyeDNPOXVpc0NWSjZVNmJrcm1Va3RWbHJSbkFFN0Uxa3NaLzJEdGVI?=
 =?utf-8?B?YXB4RXEzU1ZCZ2lBOUNqQjBaWlcrYWJzRUNWbDR5NC91WldaOW1OY1Z3VjhE?=
 =?utf-8?B?R2IyZnd6Sk9YMndtSGt1NGY2TEFISzBUVHhGUURlRHR3Slk4NFdtUlFjbDJE?=
 =?utf-8?B?Tno3eVM5cmZZQjFjM3ZOTVFJQ3BnWERCVUZLU1NQcjRMRjFHcTMxczNmMUFq?=
 =?utf-8?B?MmtUVUFtYlJmM1JYbHhCTndad09TVDNPNzZHTkNjaUNkZXg0dW9PVCt3RnB4?=
 =?utf-8?B?bjB2cmY5OW9qRFlDQkpkQUlqRzJ3NUdhaEMxM3NIbHNhQ0llZUVIREtrd3hO?=
 =?utf-8?B?Z2VVd0RESzFMMHNrbGUrQ1FOYXhiT01nZ0FuWGl5K1YzeVFWcUk2N2Z6cE1y?=
 =?utf-8?B?L2Uva0UwZnZkTEkyV21VM2F4ZXF3bDdlTElJRUJkMnZwa2pGa25JcFJtblBO?=
 =?utf-8?B?anZRaXBKT0ZqS1JoSUIyWlNGSDg5em5uVlorNWN3UkkyUTJ4cW1pc1M5WDVE?=
 =?utf-8?B?NEdPY1ozTUU0OFBnUVhCdVVxcFVKRFFCYnp4TWJuREJCTWN3R3REcUV1VXcz?=
 =?utf-8?B?MmZpSmYza280enorZXh0UTRreENpRWFpa2VidG9uKzVLWFhwUG9jMXM1VzBo?=
 =?utf-8?B?YnBSL2VBeWdheGRkcXVYZGFneGlHMTYyYU9mMEgxSUdreHJuSzJxT3FzWkRP?=
 =?utf-8?B?QkVJYms1ajBRWDNFalpIRW0wTURwWk5SSjh0M1NqZkVVb1cyUlpBTWduT3Rm?=
 =?utf-8?B?dGFWQ0JKUjdnb1U1eWRNQmNndGVwV0tVQnVValJiRjNlaEZyUVh1NHlIYmdC?=
 =?utf-8?B?ZXdlUGhqSFdIVlNMQlh1d280alkxQjVyV1VxamF2dkdFeDZiVGt3Wkd0Z0pC?=
 =?utf-8?B?QysrQk5zaE95WW9vMnlEWFBLRUlIaStVN3FUN0RLaXJvb1FhWXVjQ2d3RWEr?=
 =?utf-8?B?Vjg1S0tsMDB1U24wdDMwUkN0Y0F5MVFyQUpBeFJYbnVxcTRFb0NHdy85RnU5?=
 =?utf-8?B?cVZJRmlOU0o2cmFxYUJuTlhZK2F1RUJDWHc2TGpjSk8yV3V1clRjQ3prRHVX?=
 =?utf-8?B?aWFnaWVIRDRUWXZQSk5IdC9BV0VBWE9FYmo4bmdvUkcyMUFzN3NEZjhpOWpj?=
 =?utf-8?B?SzEzekYrL1Z3QVdUQVc3UjRzUzR1MGxydkh1MTlmRDlNVk42UTNtckdEd2RP?=
 =?utf-8?B?Q3VUd0ZIYVVXd1RqQTZoT0pKbG1kR0FCOGU3TTNtMmpiYjQ1UTYybXE0U2xC?=
 =?utf-8?B?QXVwYWtqQkVVMVJjOW4zb3VvU25USmIwK3I0bjRXSUdldUJVQk9MOTR1M3Zh?=
 =?utf-8?B?UHVWWUhTMWRnRTdlOHVwVGlVZWJPYkpRbU5tVmJzT1NtUHk3NTBuSGFTMUVr?=
 =?utf-8?B?YWlybWRNUlMyMUNRcDRvcGc0TXlabmtoRmhhK0dqbnVqbUc2WURIKzU0c21j?=
 =?utf-8?B?ZHczbEZsOVZkNE9WZm5ZWlMzZWU4TXFyVVdhMFZDTkQrMW45d3V6NTBNbkoy?=
 =?utf-8?B?U1czNWk0OExqNnF0OUgxTVVrRCt6RTB4RGNqR0NXSWxpV0JYcXBjb3RKeWZs?=
 =?utf-8?B?bHNZU3lFVWdYMitSVE9pZmdDUXoyaDBQem5qVVdsQXU3SW4wVnI3TFkvTXpO?=
 =?utf-8?B?L05zbU5vWWFJRUNCNmZScFlleEhUK2tFaHd1ZDljM1J3NWg2QkxoUDJLTmJ2?=
 =?utf-8?B?UmR3YnRxcDVFblpYL3p4USs3TElkZlR3bG96aStNV3c0Ti9NMjRwbFk5dW5u?=
 =?utf-8?Q?dZCwTaw5ORHp1vH/NQOJOnVa7?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b558b3c1-5e71-4c97-480c-08ddfc01fb1b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 07:05:59.7234 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HxCk7Clo3ixZuE2LODiysZiu2f1ZYsmppdmivvHT+UWvmIQ2xQy1VyRdfL2KElLnptjDgIml6pzkJl/fJg88KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF946CC24FA
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



On 9/24/2025 10:01 PM, Elle Rhumsaa wrote:
> 
>>
>> On 9/24/2025 4:38 PM, Yury Norov wrote:
>>> On Wed, Sep 24, 2025 at 12:52:41PM +0200, Greg KH wrote:
>>>> On Sun, Sep 21, 2025 at 03:47:55PM +0200, Danilo Krummrich wrote:
>>>>> On Sun Sep 21, 2025 at 2:45 PM CEST, Greg KH wrote:
>>>>>> Again, regmap handles this all just fine, why not just make bindings to
>>>>>> that api here instead?
>>>>> The idea is to use this for the register!() macro, e.g.
>>>>>
>>>>>     register!(NV_PMC_BOOT_0 @ 0x00000000, "Basic revision information about
>>>>> the GPU" {
>>>>>         28:24   architecture_0 as u8, "Lower bits of the architecture";
>>>>>         23:20   implementation as u8, "Implementation version of the
>>>>> architecture";
>>>>>         8:8     architecture_1 as u8, "MSB of the architecture";
>>>>>         7:4     major_revision as u8, "Major revision of the chip";
>>>>>         3:0     minor_revision as u8, "Minor revision of the chip";
>>>>>     });
>>>>>
>>>>> (More examples in [1].)
>>>> Wonderful, but I fail to see where the endian-ness of this is set
>>>> anywhere.  Am I just missing that?  The regmap api enforces this idea,
>>>> and so the
>>>>
>>>>> This generates a structure with the relevant accessors; we can also implement
>>>>> additional logic, such as:
>>>>>
>>>>>     impl NV_PMC_BOOT_0 {
>>>>>         /// Combines `architecture_0` and `architecture_1` to obtain the
>>>>> architecture of the chip.
>>>>>         pub(crate) fn architecture(self) -> Result<Architecture> {
>>>>>             Architecture::try_from(
>>>>>                 self.architecture_0() | (self.architecture_1() <<
>>>>> Self::ARCHITECTURE_0_RANGE.len()),
>>>>>             )
>>>>>         }
>>>>>     
>>>>>         /// Combines `architecture` and `implementation` to obtain a code
>>>>> unique to the chipset.
>>>>>         pub(crate) fn chipset(self) -> Result<Chipset> {
>>>>>             self.architecture()
>>>>>                 .map(|arch| {
>>>>>                     ((arch as u32) << Self::IMPLEMENTATION_RANGE.len())
>>>>>                         | u32::from(self.implementation())
>>>>>                 })
>>>>>                 .and_then(Chipset::try_from)
>>>>>         }
>>>>>     }
>>>>>
>>>>> This conviniently allows us to read the register with
>>>>>
>>>>>     let boot0 = regs::NV_PMC_BOOT_0::read(bar);
>>>>>
>>>>> and obtain an instance of the entire Chipset structure with
>>>>>
>>>>>     let chipset = boot0.chipset()?;
>>>>>
>>>>> or pass it to a constructor that creates a Revision instance
>>>>>
>>>>>     let rev = Revision::from_boot0(boot0);
>>>>>
>>>>> Analogously it allows us to modify and write registers without having to mess
>>>>> with error prone shifts, masks and casts, because that code is generated by
>>>>> the
>>>>> register!() macro. (Of course, unless we have more complicated cases where
>>>>> multiple fields have to be combined as illustrated above.)
>>>>>
>>>>> Note that bar is of type pci::Bar<BAR0_SIZE> where BAR0_SIZE in our case is
>>>>> SZ_16M.
>>>>>
>>>>> However, the type required by read() as generated by the register!() macro
>>>>> actually only requires something that implements an I/O backend, i.e
>>>>> kernel::io::Io<SIZE>.
>>>>>
>>>>> pci::Bar is a specific implementation of kernel::io::Io.
>>>>>
>>>>> With this we can let the actual I/O backend handle the endianness of the bus.
>>>> Ok, great, but right now it's not doing that from what I am seeing when
>>>> reading the code.  Shouldn't IoMem::new() take that as an argument?
>>>>
>>>> But, that feels odd as our current iomem api in C doesn't care about
>>>> endian issues at all because it "assumes" that the caller has already
>>>> handle this properly and all that the caller "wants" is to write/read to
>>>> some memory chunk and not twiddle bits.
>>>>
>>>>> (Actually, we could even implement an I/O backend that uses regmap.)
>>>> That would probably be best to do eventually as most platform drivers
>>>> use regmap today as it's the sanest api we have at the moment.
>>>>
>>>>> So, I think the register!() stuff is rather orthogonal.
>>>> I think it's very relevant as people seem to just be "assuming" that all
>>>> the world (hardware and cpus) are little-endian, while in reality, they
>>>> are anything but.  As proof, the code that uses this register!() logic
>>>> today totally ignores endian issues and just assumes that it is both
>>>> running on a little-endian system, AND the hardware is little-endian.
>>>>
>>>> As a crazy example, look at the USB host controllers that at runtime,
>>>> have to be queried to determine what endian they are running on and the
>>>> kernel drivers have to handle this "on the fly".  Yes, one can argue
>>>> that the hardware developers who came up with that should be forced to
>>>> write the drivers as penance for such sins, but in the end, it's us that
>>>> has to deal with it...
>>>>
>>>> So ignoring it will get us quite a ways forward with controlling sane
>>>> hardware on sane systems, but when s390 finally realizes they can be
>>>> writing their drivers in rust, we are going to have to have these
>>>> conversations again :)
>>> Hi Greg, all,
>>>
>>> Endianess is not the only problem when dealing with registers mapped
>>> to the memory, right?
>>>
>>> I recall some built-in 12-bit ADCs in 8-bit AVR microcontrollers. That
>>> required to read 4-bit LO register before 8-bit HI, if you didn't want to
>>> loose those 4 bits.
>>>
>>> Bitfields don't address that issue as well. In my understanding, it's
>>> done on purpose: bitfields encapsulate shifts and masks, and don't
>>> pretend that they are suitable for direct access to a hardware.
>>>
>>> Notice another rust bitfield project. It tries to account for endianess
>>> and everything else:
>>>
>>> https://docs.rs/bitfield-struct/latest/bitfield_struct/
>>>
>>> I didn't ask explicitly, and maybe it's a good time to ask now: Joel,
>>> Danilo and everyone, have you considered adopting this project in
>>> kernel?
>>>
>>> The bitfield_struct builds everything into the structure:
>>>
>>>          use bitfield_struct::bitfield;
>>>                   #[bitfield(u8, order = Msb)]
>>>          struct MyMsbByte {
>>>              /// The first field occupies the *most* significant bits
>>>              #[bits(4)]
>>>              kind: usize,
>>>              system: bool,
>>>              #[bits(2)]
>>>              level: usize,
>>>              present: bool
>>>          }
>> Thanks for raising this. The syntax seems quite different from what we need, in
>> particular since register! macro is based on our bitfield! macro, this syntax is
>> incompatible with the need to specify bit ranges, not just the number of bits.
>> In other words, it appears the out-of-crate does not satisfy the requirement.
>> They have to specific 'order' property mainly because they don't have the notion
>> of bitfield index, just number of bits.
>>
>> Regarding endianness in that crate, it appears to be configurable based on
>> user's requirement so we can make it such if needed for any kernel usecases. But
>> the default in that crate is native-endianness just like our implementation
>> right?
>>
>> Thanks.
>>
> You might be interested in an implementation that we worked on that just uses
> `macro_rules`: https://docs.rs/bitfielder/latest/bitfielder/
> 
> It's not the same syntax as what you use, but you might be able to find some
> inspiration in how we dealt with endianness. We also have implementations for
> reading bitfields from byte arrays, if you're interested.

Looks similar. About the additional features, in time we can certainly add
support for it if it makes sense. I am sure we will improve support for
additional use cases after it is merged.

> 
> Either way, thanks for your continued work on this patch series.

Of course! Will have the v5 out soon, but I am also traveling international to
get back home at the moment :).

 - Joel

