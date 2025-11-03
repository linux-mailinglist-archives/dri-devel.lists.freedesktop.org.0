Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C727C2DE99
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 20:35:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8B9B10E474;
	Mon,  3 Nov 2025 19:35:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="T3Txt9ln";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011012.outbound.protection.outlook.com
 [40.93.194.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A58610E45B;
 Mon,  3 Nov 2025 19:35:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GZT8xrI4Xh5yIKqUpnJL2txDNDiMSBsx3XlzCZXjxixHpn9I+h1D/OP+zGBHM0bnfXxm5dr1SZrWka0QCcH3IjQfWdnWaJLdOokMC7ZhTMEGp+C6dvbiFXo8DozByb8h0lBe/05b/G+1RLQb7JJrRwwsew7nmNuRpChTBmqNN98PG+im4F/FIPurvwTrad7o3byVuI1G4GTBMrQVtQR6JGhMLOccevMeNVnNVvIlNuJd8jbk17kb4p56dh0IVOUJO9Hdad8oUP3FXbyRY+6mGl8/0xUtrNAuirsZ8soVmLkzGpY+AI+DM5B+9TL8ppOfxEol8UpWzGdPvEL6S2nMHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=srUA7iaVkMmNpz9nRpHyFPGWBqzhkYg44bgZ/ky4eac=;
 b=tFxDVoi91MPef2AESPxtN6YxYpaLOzoE+gN+ilLQ0awZL/KifNmrOKjSi6TBOmiklwuAgNL7OgjFyWU4Ejrc/vbazQJ9OAkqZ0FXYACRDxBHrJOlTcjJxUjroTEMSiWT8xcHNKoviTxj2Ji3iOgdM8T6NenlVxsKVyz8uYHcB6SraE+9ZZUfPJO8n+jE2rn4ejpccPS1rq7QHu3yMXtr6S8iSSyHRZNbd6sdWXO+zQFo2+kxExgrakokH4onqGPHBKDGPa3boLlYSzHB4IkXgdpBM8oxP0I7QY4c7PAamaaPC8cp5X7jmVj/j4K6vbgriUhwT9PodeN7xygoR81sNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=srUA7iaVkMmNpz9nRpHyFPGWBqzhkYg44bgZ/ky4eac=;
 b=T3Txt9lnJtrPLd+x+tLYiDvclb/yImaoTLN4EDTzJVfRb99TgA9Yh9XgW/prDpOP/eK1MkCrNnK4NjhHv+OIxy18wT/lB8/m3zqll9P8IqYQoIsiRbrN8VNzj1WUHv94dSq2OUm5sdlxNXVxqJWy376FYy7LtkPstMut/PvBpIZp2n3znwotwAjzF9DhLwdFcUP/Vz6hYgk1WUfhmPDXrIcBLmNhzkyDUWDAvif8CW1t9giU1yLXmVumKtcnpIzEsuhs2UzXVl5+fYxCBeBtJsBhtqjr9z6bUf4lg+NY/1rL3b03SR3KpT5Fdue25RWZyeCrgI0o/8FVvN6OaXIR4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by PH7PR12MB6936.namprd12.prod.outlook.com (2603:10b6:510:1ba::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 19:35:08 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 19:35:08 +0000
Message-ID: <f76f61df-8412-461f-8d85-b9ba0fa92df0@nvidia.com>
Date: Mon, 3 Nov 2025 14:35:01 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/12] nova-core: Complete GSP boot and begin RPC
 communication
To: Timur Tabi <ttabi@nvidia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Cc: "joel@joelfernandes.org" <joel@joelfernandes.org>,
 "lossin@kernel.org" <lossin@kernel.org>, "ojeda@kernel.org"
 <ojeda@kernel.org>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "tmgross@umich.edu"
 <tmgross@umich.edu>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 John Hubbard <jhubbard@nvidia.com>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>,
 "gary@garyguo.net" <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>
References: <20251102235920.3784592-1-joelagnelf@nvidia.com>
 <3b0d776e50fc81797dec2e5d81c86390af78f848.camel@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <3b0d776e50fc81797dec2e5d81c86390af78f848.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR01CA0058.prod.exchangelabs.com (2603:10b6:a03:94::35)
 To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|PH7PR12MB6936:EE_
X-MS-Office365-Filtering-Correlation-Id: b2da72d1-082a-43d7-2a5e-08de1b101893
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RXZ0TGFZNC9JUExGWUJhaUxNNTB5TzJyWldCL3p0dWlyQjI5dS9zcTBBWnRZ?=
 =?utf-8?B?YzNnR2dPT2pSbGdCWkF0SjkvMkVLV3diNWU1bXlNKy9TcWkybGhRbm5MVysr?=
 =?utf-8?B?akNGNzlyRGllcDh2cS9iN3pNRUZXTmV5NTNmaUxsTzY3WWRnQm9xN1d3ZytT?=
 =?utf-8?B?bHFRMkhydWx3cGtIY3BNUkJGcnRFRy9Ma2xJU1VzWXBuMnB4RW9CZnlKV0wv?=
 =?utf-8?B?bmVHMitCWTl1QTduUnRQOUFHakduYnQ3YVBLeFZUVVNhSGo1Ym4rODlIai91?=
 =?utf-8?B?S2R1eXJ0VzhqNm42VjhFNEhXeEVrUDl2VlBuRzUva2wva0NRMkhWcDRvbFRU?=
 =?utf-8?B?M3JIUXBQeFJsa2tFY1BZSEsvWlRrdmt6RlM0VzVlejBrdUp2RGIxb3pIT0dz?=
 =?utf-8?B?czVQNFV1aWNxcGhrUEdHZlJmNjBGSi9QbXBiKy9iOFd1WnF4cXhtUkhJeGZM?=
 =?utf-8?B?ZUczTi9oei8vQWtWVmV1UUpiaHZWaU5rSy9YREs1RWRQMWNWczdKZ2FvNTVZ?=
 =?utf-8?B?SWFORmdzcDNrSDd2d2ZRdWx6VXlOdHg4YjJHck1JMFQ0aTJxTXNvajlIUTlo?=
 =?utf-8?B?aXVEaXNLdTFIOGpPTDNKRUlvdXJjUGNiOFNKRW50STVnZFpZK1d3eFZ0VVZN?=
 =?utf-8?B?ZlRxYjUyZ0FsWm5lSzZraHowalJhOERTNkFKOFNoVEJDZlI3aEVVc2tYbjEw?=
 =?utf-8?B?cHRuN3lYRXptVWQ0YzdMejNDVEI5RW94SmNVVEpBcjFnVWRnR2dhek5PYmd4?=
 =?utf-8?B?TDFqRVc5VTJWSHMvci9aNEM0ZGlEdElMQ3BQbEQySC9QTVB2U2c0QUJKRzlr?=
 =?utf-8?B?SVNrZkVFaUtyS2pYTDRERmZ4SjIwRFJHR3hTSnRKSW4xMUtWQThvQ3BkQ3M5?=
 =?utf-8?B?aHlEWVFHK0hKWUVWUE5COFMxS3prWE43dHVISjFYZHYvWWhTVTV1QWV5NzdU?=
 =?utf-8?B?Rm54eGIyanN4R3ZpK2hMQi8wWGdtek1la1pvZEQreVhQcHpJV0tUNDdFUUJH?=
 =?utf-8?B?NVc5Q040ZTN2eS94R1Y4UGdLVm1VZ1c5NkV1Mk42TGkvOFV4WlBCMC9aYmRn?=
 =?utf-8?B?Z29xUld2S0xwNDMwZkFCNWN2bWdzUURxYm5YWk8wd1BDYi9ndHZSMExpUnBs?=
 =?utf-8?B?cHAzZGxnTVcwcHRVOTAremZZWEJ0OTlyUDNYVHEyclJ2VEIvUndMRVp0RElm?=
 =?utf-8?B?djI2ZndCSFIxdSs5cU1NbE1HeHR5dWk1UG9yUmlndnpjME50MVJ5RmR2ZWhS?=
 =?utf-8?B?K2JGRTZzZ0djeFBuWVRQUnRtbml0am5KOUZPUElOTU53ZWRHOGk1dUV6MFlv?=
 =?utf-8?B?UGFWZVVEYUxSK0hMVTdCQXpoY1V3b2IydURiQis1OW9ZdmdqSjVGTitsWWg2?=
 =?utf-8?B?OEJ5aGl4Qm8waDNGbmZLZTlEUHhZWnpFVzl4cVNPeU55c05SMEMveS96b3FN?=
 =?utf-8?B?Z0w2Umg2cW40Q1liTFZVYTNmSExNSlIrb3UrajhHRmsvTlJKckNQY29CQitt?=
 =?utf-8?B?TFlPbkpjdnU1YVpoejRVbkxEZklsNTFKVkd2QU5IWVJRWDk1T2t6aUFoQ1lo?=
 =?utf-8?B?NmhXTE5qNjNXS1VCdXhBd3RIendjOGZqdUVUUWkybkhXZ0EwZ2pwajM1ZUk0?=
 =?utf-8?B?V2dJdDJSVU1UeFJJcDdrV0llOXlJRXlUWUpwRTZuZnpET2d5RzNwSzRGQmx5?=
 =?utf-8?B?Zm45UkhoZXRMMks1UUR6ZzRhRjYzV2JiOHF5VVZFLytEZzdCNTFTWU1taVpY?=
 =?utf-8?B?dnRDc2dSdFNsaFFRMXNVZURzdVJQMkg5WlRtSit2Um9ZZEhqbUxiQi9HdENV?=
 =?utf-8?B?SThZWHVrWDFwL3pBUm9PdnY0QVp4Y0dSRlpVNTBWVUhqUzBCM2hiY0dYNFZK?=
 =?utf-8?B?TUhTc0E0UitFKzRyNnpMSW5FL25rZHZjczJTa21FOWExMUpTaXUxOUhOenlv?=
 =?utf-8?Q?t5JqYqeS7fdvQMvV4EKJkbfDjWQQfY+g?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RE1QelpXcmpzYjJrTWtNVTZ4VnlWcmE4b2J2QVFXcDJyQWJJR1BrNU1YUmFM?=
 =?utf-8?B?cjFRK3cwZ0RtZW01a005UEx1OVI1YW5FUUxVMWdJRWVNVWJqYkZiWG04V3pK?=
 =?utf-8?B?N3dnYVpyNHFUbGxJT0VscUxuQVBzdGw2aXZ2SHhjb1FQcmI0WWtTMFBMeVBW?=
 =?utf-8?B?a2dFbFFwTzVJV29xbUtoa0VvdlNHSkwyUGh5MFFycUh5YnRMTHIyZmxIdzBu?=
 =?utf-8?B?djFoSzYwYlBVdEVoY1IvQUJ3bFpLWFh6M0RaSitrRldBLzUyeEk4ZmR2c1NG?=
 =?utf-8?B?Yy9uMjhiemlBck9xdlhjbkJWZmQ2UzhoeG9Lc3dSTTI0bG4zRWtLWnVDV3Er?=
 =?utf-8?B?dHlNZXFucXJsZno2Z3k4UkJxMHppd3NpL2I5TzRlcG1TUGpUb0tHQUtwODVm?=
 =?utf-8?B?VEdvMFp2OFpObjZjMU4vWEFwRGd3RE1DUVpVRzZYTmZiZkN4cWJHeDhUZjgy?=
 =?utf-8?B?ZTRmM1h2MjIxcm1ab2k3MDJuMkFVTXU0TEtkRSs0L2EyamZrTVZFOGdxYnZx?=
 =?utf-8?B?NnI3TncyS1ZXMjNWMzJ4Wjh6aW1xcW9HeERsZk9RbFh6Wm02WmsyWUY1MTBv?=
 =?utf-8?B?b2xmejM2TlQreFlkQ0xnNUtvNkJZL1BKVkFCWFNBU08wbFhwQ1Bkbk1BY1ZM?=
 =?utf-8?B?RC9Qcjh0NVJtc2d0Z3BOZGhycWVlZGluTDQ2VDBranVMM2pxSHJ6U1VvbHBR?=
 =?utf-8?B?QzVsMVN5TVRyMk5WemlENnFza0lsT2lxMGtZUnZjY1ZLTUxhL2dlRzFrLy8z?=
 =?utf-8?B?QkZGRlh3MTNEUEF1U2N2MWdYSXZub3Rtd3ROaFoxc3lNaFNxMGtSdEJZMnRu?=
 =?utf-8?B?Wlhzb3YwL1crdlVrYVNOOG9JcTRWUEErY0VKZkxCOTBkUUI0bER6YVZQLzFo?=
 =?utf-8?B?Ty9SNytoSVQwQjUxLzZkQ1EzOTNub1pMaGJXd3l4dFF2MDNXWmtsVjlPbXIy?=
 =?utf-8?B?aGorVVZTeEY2NmNrRnN1L0ZUU3FZTGNzUmxBckVLWVU4U0hRYmhIM3NxeDFk?=
 =?utf-8?B?ZXpUWXh5ZHM3U2RGdVpHVXo1Y1VMQ3lFMHdwNTlqVHhsbDJka1FhbE9wRER0?=
 =?utf-8?B?UmV3SlJNT2czM1VpQTQxQzYzWFVYU25PUU9qRWRpVGUvWUpBdWhKbitTMmxN?=
 =?utf-8?B?SUJyZFRUOUxET2pxYnVSUXhPaXpVMVI1aGw5Q3FLK08yTlZ4U3YrUExmeGhj?=
 =?utf-8?B?MmxBWWp1QjFVaHRhTmFsS2VwM0h6T1hpTFFjcGgxSjBEVXFuWEdqVmZRUjFn?=
 =?utf-8?B?S0tyNnpNbkZibit2VmRwYW9MRTNSblp6RWRUSm1ZSThjUFVkSmp2ekpuNS9t?=
 =?utf-8?B?cEtpTHpKUmZaSzY1UEhuQndkazhzUmVsOG91cDdkczBJbHVzalhQQ0ZCbktp?=
 =?utf-8?B?bFdCZTV2ZkVSM2xSbDN4RkJBVFcxZ1ptUFdmSUhhU3J4ZTRBdGFuTHd2QUky?=
 =?utf-8?B?NURTTmk3VEpiMnRFMEtzZzlQOTF3NXFhWENVdTEwRHAvQXNSRjQ5YVAxR053?=
 =?utf-8?B?SEFuOGhkSjM5ZTVHYWhyNGhwM2o4ZTZ5em1QbmhsY1BHUFNwQ2xNU21MYWVY?=
 =?utf-8?B?V1M2S2VzYzZCU0JQUFhEODBrNHdhbm5NdzZ3Qy9rTnY2VytPMXpabytHS0pG?=
 =?utf-8?B?akNOdVVDWnZmVjF2eXJiUnhEdzFRUGpYVzMvR0U4VUluUTIzQjBQNVgxYWkx?=
 =?utf-8?B?WlB4Mk81VmJJZDdkbGdvZjhhemJyaGZhbUJzaWRxZkMwMGZRdW13UlR1aUNR?=
 =?utf-8?B?dG5kK3FpZWcrZ24yeXNTTnlwN00xaUJZcXZXWG5yYU1vQzhDQ09DOTB3NFAy?=
 =?utf-8?B?N0h1enk2Y29uVWEzdkFlTmFMSEIxRWM1Q00wQzNsMGtsS1VCOTFMV0NQOEYv?=
 =?utf-8?B?YjJvdkF6bklHcktIU3YvR09nbjB1TVM3RU1XSUQzMVlYS0p3eHhwdzZaejJ6?=
 =?utf-8?B?TGMvNERHMGxZeEJQSCt0RVVndXE3RWFYTlFMQUZPZFNobXpucFFJSjdxelIr?=
 =?utf-8?B?WW9ITVZlSGdLN25Eb2d4SGdXMU5kdnVwZWZpQTE3cm8xTE9CYm80RVd5WTBD?=
 =?utf-8?B?c1BvQkVTMTE3QU9HTTAvSmtBZFg2SzJ0azlEdmRrd2tUNkY0TEFlOEZDQTVN?=
 =?utf-8?B?azNrRS9sbjh3VHpaOG1PUGRuMU1rWXJlbG01MTNmSDh4TUl4NllyTkVEc0tD?=
 =?utf-8?B?TVE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2da72d1-082a-43d7-2a5e-08de1b101893
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 19:35:08.0503 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EmdxnjDLOUhehR0/jSUsVD/RXd07BSDdr6Ss0CpeI1JfjBeAU6tCjOgAUPLtulQfchOqLRqlnNw4H+iDFLpSBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6936
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



On 11/3/2025 2:12 PM, Timur Tabi wrote:
> On Sun, 2025-11-02 at 18:59 -0500, Joel Fernandes wrote:
>> Hello!
>> These patches a refresh of the series adding support for final stages of the
>> GSP boot process where a sequencer which inteprets firmware instructions needs
>> to run to boot the GSP processor, followed by waiting for an INIT_DONE message
>> from the GSP.
>>
>> The patches are based on Alex's github branch which have several prerequisites:
>> Repo: https://github.com/Gnurou/linux.git Branch: b4/gsp_boot
>>
>> I also dropped several patches (mainly from John that have already been
>> applied).  Tested on Ampere GA102. We also need the "gpu: nova-core: Add
>> get_gsp_info() command" patch which I dropped since it needs to be reworked,
>> and it is not needed for GSP boot on Ampere (but John mentioned it is needed
>> for Blackwell so we could include it in the Blackwell series or I can try to
>> include it in this series if I'm respinning).
> 
> I applied your patches on top of Alex's tree, and when I boot on a GA102 I get this:
> 
> [  376.316679] NovaCore 0000:65:00.0: NVIDIA (Chipset: GA102, Architecture: Ampere, Revision: a.1)
> [  377.188060] NovaCore 0000:65:00.0: GSP RPC: send: seq# 0, function=Ok(GspSetSystemInfo),
> length=0x3f0
> [  377.188070] NovaCore 0000:65:00.0: GSP RPC: send: seq# 1, function=Ok(SetRegistry), length=0xc5
> [  378.315960] NovaCore 0000:65:00.0: GSP RPC: receive: seq# 0, function=NOCAT, length=0x50c
> [  378.319875] NovaCore 0000:65:00.0: probe with driver NovaCore failed with error -34
> 
> Are you sure there are no other patches?  The RPC patches can't depend on INIT_DONE being the first
> response.  Getting a NOCAT RPC first is not uncommon.

It works on my end. Do you have "the wait for init done" patch (the 12th patch?)
You can also boot my tree which has all the patches, i.e. this series + Alex's
b4/gsp_boot branch:
https://web.git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/log/?h=nova-seq-init-done-submitted-v2

[    4.672205] virtme-ng-init: initialization done
[   25.745799] NovaCore 0000:00:07.0: NVIDIA (Chipset: GA102, Architecture:
Ampere, Revision: a.1)
[   26.364343] NovaCore 0000:00:07.0: GSP RPC: send: seq# 0,
function=Ok(GspSetSystemInfo), length=0x3f0
[   26.364634] NovaCore 0000:00:07.0: GSP RPC: send: seq# 1,
function=Ok(SetRegistry), length=0xc5
[   27.561186] NovaCore 0000:00:07.0: GSP RPC: receive: seq# 0,
function=RUN_CPU_SEQUENCER, length=0x18e8
[   27.635180] NovaCore 0000:00:07.0: GSP RPC: receive: seq# 0, function=NOCAT,
length=0x50c
[   27.635529] NovaCore 0000:00:07.0: GSP RPC: receive: seq# 0,
function=LIBOS_PRINT, length=0x68
[   27.635795] NovaCore 0000:00:07.0: GSP RPC: receive: seq# 0,
function=LIBOS_PRINT, length=0x70
[   27.790175] NovaCore 0000:00:07.0: GSP RPC: receive: seq# 0,
function=INIT_DONE, length=0x50
