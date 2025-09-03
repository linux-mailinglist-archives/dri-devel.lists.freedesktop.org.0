Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D581FB42861
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 19:55:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A881310E09A;
	Wed,  3 Sep 2025 17:55:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VZswPj5N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2069.outbound.protection.outlook.com [40.107.92.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A82B10E09A;
 Wed,  3 Sep 2025 17:55:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bShNIoAqP5BqeGVwWJXNSkbCE3jIkEsQAGJ+lDswpfwzFpYiajuGfCZ7/m+KbfxH4q44OKlHEjD0omCAYruDPIJqHEOaUMA11771/MMO73qHVkMz44jTQzQGk4fdqLrQklqzIYVNsVE270XAZ0JATFFND2GVjJzBtCuoxNzdkHsxwzPR1ipBZRFLbwh6vFj2NgLZfOh+5QkVgBMVKWF86Dpsp92z3JMyI6OREatkBZBULg9P2emGZZ5cgXQUGl7PjiS5bazqnJ25Y2pQm4AUmdSyRHjDtUDfQ+VcVtDDT7w896SZFHKJNyCcEQkWmO1brPf7gb5no/KZtedoSGmXlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iKoLylk4Re4jmw02P5CcUKuUcr9OqLwfnJpAfBh2Zc8=;
 b=iQGmUPErCXXrzbtDcxsz38LMMr46rKR8DXp9MI0JFvPU4I8glG/8gqW8ZVWmmnYXIhtEUVDUvY+wuZmHQY2LuqyKIcyXAmk5zErUvjJYkJD232BK0OqNXGd0/qsHCNdmZ5NZgz6TAryWVQFSfa4yb/d/NgGKqEa37J3ySH4abGU4MNramg8Yz1JJD8nBeavqO3pOMzbkchY/cRtwLHnMcseTCkE+zE9BR+hP15icXx1IYFP8NevId+S7ArtTtHT2WpOTJZRwvpUKUnvtfs4jCGVj5khcNo3ZlNWsdDIdFBoLZt0zYXNruQgqbioLQDAvtQbWWzJuhSj2d1JqrPETQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iKoLylk4Re4jmw02P5CcUKuUcr9OqLwfnJpAfBh2Zc8=;
 b=VZswPj5NSeMYlNo0m0iFJ+/Dz7MM/nORuW2tktEqZ7tofEeuijHJ5ZfKXN3LO1lbfIoxXOW8ZjJBDzLLCkZLy11ZU1b5sK3hA6q62ReW0Avx9i696ayLJgF5AFpav0SgUF4ijBmzjqQbjJCDiw5K6sWCNhYHYjD/vv3obF3/+5TiS1onpNnm27tOyDZ3xCR82bWVQE7rd571s8bo7y0R2P7eRY1l2t/6446kgUutFvpK9xvA6qYvubD7VJMq07yib+6K6pH/o22oEsBFTzL0CJ65TYIfx+lrS0CeEuosI/Xx77ymU8ziTVPaJ9WPDL8SR6ZYtgtO5yCceAHppIUCNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SJ5PPF4D350AC80.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::993) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 17:54:55 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9073.021; Wed, 3 Sep 2025
 17:54:54 +0000
Message-ID: <5067c4fb-718c-4362-85d0-68a2ba53ea4f@nvidia.com>
Date: Wed, 3 Sep 2025 13:54:51 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] nova-core: Add a library for bitfields in Rust structs
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
References: <20250824135954.2243774-1-joelagnelf@nvidia.com>
 <D0E4757B-B26C-49AE-9076-267C0CBC2577@collabora.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <D0E4757B-B26C-49AE-9076-267C0CBC2577@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR0102CA0031.prod.exchangelabs.com
 (2603:10b6:207:18::44) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SJ5PPF4D350AC80:EE_
X-MS-Office365-Filtering-Correlation-Id: 86b570a0-a3a9-4fad-f929-08ddeb12fcb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M054THlpYVhUcGxHdkFCU1pMUnpWZUNTbzhqYXNpVzNMS1J1Yy9xYzZVZUVz?=
 =?utf-8?B?a0Jid1Z3a01rZVlzTTAzdHptaDBDWTU0ZG5DaGczSUltbWFLem5TODkyWjZP?=
 =?utf-8?B?RkllZGp0MjQzdlpvMXZVR29WMzBXenMrT0Vqa0pkNlB0NWV6UVlXTkdid0xw?=
 =?utf-8?B?Q2dxL01FMm9WRFNSOCtBRGV3QjNmVkIzeTNqQjNLOTBSZXJTMlBkUVJpVE5i?=
 =?utf-8?B?aU9reWl6R05GWnFidndYc1JJWVlqcTFLYTVNSUJMSE5YSnJnVlNEcXBzb0Rp?=
 =?utf-8?B?Qy9lUDJNcDR6b3R4N0xPTkpBb1MrVWFVZWpIVW1zUFlBbTlaYzNzSjRkWFlx?=
 =?utf-8?B?eEhxZUF6SWFZSHBueVJhZjcvVERnTEUwYlFjVEpWR1orWlZVMlZTKzlvRFJM?=
 =?utf-8?B?enZxZXBHYmErQityOVJySytObjM2anBYbk9rTGpUd2FtK2JZbDlsR0pwU2V6?=
 =?utf-8?B?SktHeFR6cnc3MEtNOENONEJ3ME1RWkJzRGhJTy91SEdDd2N2SEpkRGU4RVRR?=
 =?utf-8?B?Y09Mc21ZTXcvRkMxblZZUmY1ZTVyc1NkZkJONXlCcFJXZnh6RndSQ0IxOEVm?=
 =?utf-8?B?SUphYjVkNGVjQ0NpbTI3QVBsOVRNZk9xY2VNVnJ4TWJRQWNDSCszYkxoME1y?=
 =?utf-8?B?c2RqTWNDV21GN1JSRVB5b1lnSUxRd0syaFVOV2l1TzBSZFUvRWZ2WGdiWWZH?=
 =?utf-8?B?b0dNNkFSZG9rNXl3NXBXY3gxNHY2OTZBUytWeXBmaVcrem0wSU0vY0xCczBI?=
 =?utf-8?B?YzNZRXRoZGZhWTgxNWkySlVjV0lhbnF3Qi92dkVnYkdMQUJZVktIQWZUUS93?=
 =?utf-8?B?VitOTm1xOW52MHZ3bDJBZFFia2o3NjNzK2p1RUhJbjNQWkVLVnNpU3VRUGow?=
 =?utf-8?B?eWhBcENuaFdhRG5laU4wanRsNVZvYXVMclRtMGFCV2ZtQXJwd1VKdHR4dERX?=
 =?utf-8?B?VXRaN0oxZnBCenExbm5LZ1BZSndlbU5UcUQzTi9ZaE1ybnNEQkx6K1ZLRFVk?=
 =?utf-8?B?NjF4dGFWT3hJaytQa3NjUlkxNE1uL2grNW03UnVlV3kvbnV1UFBvV1lrNGtY?=
 =?utf-8?B?U2VhMVVGU01SRDhUaWNBOHp5YitUeUR5eFFlbUUxQ2RWTjN0dGM0SStGZmJm?=
 =?utf-8?B?SnRSVEtoNVFjendMNkhQNFQwWkJva1lhb21EVnV1NldkVG8zUjE4Z0k1c2ZS?=
 =?utf-8?B?ZDRReE9kVlZPUWE0eTJBTVpDUDFGZEFxMnVaM25xY2JsRkludmFYVXlsQU95?=
 =?utf-8?B?NjF1dndPWlpKaTA0RzZ1ZHhmSWk1SEhLWkhQNXNiWCtQeFpLOFdLK2xrcE9i?=
 =?utf-8?B?MUpKQUtVaGk1WkRZeCtnbWEyTTZhQ21Fd2hQNmx3cjY1bEpDemkzdzhuK0dj?=
 =?utf-8?B?N3dCT3V1QU9Pa3A0ZVpHUU9lZFR5T0dJRVQya0JhOHFmaXVrLzNpcXRHTHNZ?=
 =?utf-8?B?TGlBQW5vWWFud0dkQlNockFvSjA1SGVZMUt5OGsyaUtKTEdxZkZLaXFPaElB?=
 =?utf-8?B?dVhOT2ZaUXpUeWJCOXI3UkFFMW00LzZyd1F5SG0yVEppTUo4N2RqNHpOcjg3?=
 =?utf-8?B?UjkrNU9hUGc3dWlYQ3RYd21tWUo1QjBJeEgyUzdidGhTaWp2OFo2aFZmMEhX?=
 =?utf-8?B?eUt2UFZqMFFHTHhkL2Y0SEoyU0tLQXZJWlFuQXFXQkRNUytsRmhUOVpGY1Nq?=
 =?utf-8?B?Z0kraEZ1dnNSTnVXNGlrdmYvZEd0SERNc0ZySWlqMVNmMFd3ZTRVbzRFaUtF?=
 =?utf-8?B?VTRHTC80U1lFTFUzZTQ3YTFNZElTSFkwdWxXSmxmbVBtcjg1RjhGV29LeEVI?=
 =?utf-8?B?eVZrQTRMNTZudnphbS8wdDd3QmZMdlBTbHZ2UGptTEJFSWdEVHFhaEF0Y1pk?=
 =?utf-8?B?ZGltcC9Obm1velZuTEhBNUdvc1FLaDgwUjVvUHhoTVFhQ1E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1dVVWd4U0xHRHZibThyR3RkaTBRNVNzTFp6REhVb01vZ3ZBczNVZWZ2aXRI?=
 =?utf-8?B?UlZWSFNVZVFibGNOL2VwNFJEMjAvWW0rTjl3Nld2SFo1MFBjSlZCdDNYcGJC?=
 =?utf-8?B?YS9sWmhqekFheXhueFQ1ZnN0V0FndnRIWGpQaEpmMXdjcHlHZlJOQXFnUXpI?=
 =?utf-8?B?VUJCZFdsU1drVEUwTmphTGwxV0VicTRLZUZ3QkZTWHpkcUNIWTQ2RFB2cGxW?=
 =?utf-8?B?aWpQQU1RelJkS3QzTlg1NDdRalBJajVlNWsrNkc0cTV1bWVycVhHTlBXaTl4?=
 =?utf-8?B?Y3VPS2VkNUx0QWRNamVScUVzRFpXQXRXc21BK3JUVDhWL2drR3J0TS9zaTNX?=
 =?utf-8?B?Mk9yWUVRdUdNdFdpQnZRdnJac2xvWEtOblFoODlRcURhSm5KU3BNbTZyRE1G?=
 =?utf-8?B?emNIQmVKQjZvL0VlaGdIcDR1ZlMzaEoxaVhhZlcxdWVIM1hJbjMvUUYxOXor?=
 =?utf-8?B?MTY0QkduV2ZNdWY0Q0IrVElEQUxGZTNNcE1ITjdsSzZsdXphYW5lN28rdHF6?=
 =?utf-8?B?SHowRGoxU1dpM3RkeDgzNTVpdjUyL1Z3eEY2d0hHcitOT05wVmZZVE4wV25h?=
 =?utf-8?B?YzczWU1VS1lzSm1BRGJ4a1MzWUNETk1mK1JUU0dwcDAzdlZoU011Q21rU3dn?=
 =?utf-8?B?MlVlYVl5dUpISmpYeXdlSHdyczZQR1FoRVVDeEJDS2w1N3VzRGNWQU5zeTdK?=
 =?utf-8?B?cUhka0M1VXRIamhtaXhpVWJHWDltSjZXaVYvU2ZxUThwV3JBaHozVzdzdm56?=
 =?utf-8?B?UXlQaUpQUkJvTTg4RkcvRzVFMUpJNlg3aWE2U1JuZ0lGQnVGV00vYWpiMEtU?=
 =?utf-8?B?YTU0UXVUUnE4R3EwcmdCaUJSQW4wbmJWaHV6dVlDVHV4V21UYnc2YlozbytH?=
 =?utf-8?B?a2tsVHNGM2t1b3VPZEJoMGtiNjBBOGFIaFFubTZMa21NbGlFQXFKc0EzWUdP?=
 =?utf-8?B?Z2N2R2tiRmpYdHdmZkY0aFcraWRhSlZHZi9EeitpOGs4eXdnVWZkamVBbGV2?=
 =?utf-8?B?TnZNYjd6OG0vQXhsL3gyUkZZeDdPTWJiTHBCUFZPS04xOVNaa1FEd2daL2M4?=
 =?utf-8?B?dC9XU21yYktvY25ETGEwM2MzUitQYzFERHZDY2x2SCtFbndNZXV1OUhhSDJD?=
 =?utf-8?B?Q2JwYXdSYitWam9MOW5xSlMrNzZwVWF4eGF1QU80NzdDQWVmQVUveXFBbjJ1?=
 =?utf-8?B?L3JmSkUzQTB1NVlUdFdXYnlkdFM5N1NCQXE4eHc5Y2c1c0txK1p5cUV0YWxO?=
 =?utf-8?B?ajl3QnU5Z1JSSUJscUVDa0tyYmFBWTNZZjc5L2wwQjZHUW9VV1hJQ2RIOVg0?=
 =?utf-8?B?Q3QxamJWSmp3a3cyeTZXTGtZbjlkcjJ2dldQNmxlV1Myc3R4dWRDRUc0dkFs?=
 =?utf-8?B?VTFubVE2eUVHZnRmRXlWell5ck50N0RSdUZkK3BKK3U1K2dJSzVGR0E4RzJV?=
 =?utf-8?B?ajZ3WVBISDlkSFU5czFTSUZIYm41ZHpFR0JMN0hLdG51TzZQR0lCcS9kaFhE?=
 =?utf-8?B?ZmIzWktqT0pUeFRpOWhxcFl5amFHanJxWm1vS2ZNWFd5U3dVYjFqNk93U080?=
 =?utf-8?B?NmhPRFhIT2R3OVp1MTRDeTRyTDZBbG05MWxXNmsrME9mNlJxSjQwZjFuSXd4?=
 =?utf-8?B?eGdlM1dyVGVBUGJuNXhsejNCSmFpQWRwNE9CQXFETW4ybmxkS1hudHppby9M?=
 =?utf-8?B?TDJlQktkNmdRYWVURGsxL1JERVo1b3V2NjlIa2lzWUlxb253am5lRHdpbE1I?=
 =?utf-8?B?WnlMblNqQnVyaW1Rd2FKSGNycEhMUTRwVStIczlHSjkzc3NkeWJIeHMyUERQ?=
 =?utf-8?B?eHIwaGZNamlSVG9wanpValJmTFFTamp0dDlWNkhFeTVtTHNyalB3SkkzL0Nw?=
 =?utf-8?B?WEF3clM4MnlxR0xsVGZjUnRreFM3ditXbUlNbGNQWnR4dlpFSE51ekJoZjEv?=
 =?utf-8?B?cW9UbGQyS1lIUzhGeHptSlVLL1ZaLzZFaHM5d2JYQmJlNlp6d2RYL1NFREd2?=
 =?utf-8?B?Q01MY21VRnkreERHZ3RYTk82VGhCQUhTZjdsRzRMcGlaVTNxa2NmRklJRThq?=
 =?utf-8?B?NG9JcXhZSEl5SUdocjR2cWc4L1IrS1B3R1cvT2pYTDBjbmlHY3V0L2hJNXZK?=
 =?utf-8?Q?6R9UvFvZmJbLS102/3GR6o4DL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86b570a0-a3a9-4fad-f929-08ddeb12fcb2
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 17:54:54.0159 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qioiqovf2Pbcsy6S5dEN4aa1hHc159dzQh2sXD9obJ2T9boPzlpB08eDVWin9z5S4yDp2urDr8L3mB+b7WbXTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF4D350AC80
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



On 9/3/2025 9:29 AM, Daniel Almeida wrote:
> Hi Joel,
> 
>> On 24 Aug 2025, at 10:59, Joel Fernandes <joelagnelf@nvidia.com> wrote:
>>
>> Add a minimal bitfield library for defining in Rust structures (called
>> bitstruct), similar in concept to bit fields in C structs. This will be used
>> for defining page table entries and other structures in nova-core.
>>
>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
>> ---
>> drivers/gpu/nova-core/bitstruct.rs | 149 +++++++++++++++++++++++++++++
>> drivers/gpu/nova-core/nova_core.rs |   1 +
>> 2 files changed, 150 insertions(+)
>> create mode 100644 drivers/gpu/nova-core/bitstruct.rs
>>
>> diff --git a/drivers/gpu/nova-core/bitstruct.rs b/drivers/gpu/nova-core/bitstruct.rs
>> new file mode 100644
>> index 000000000000..661a75da0a9c
>> --- /dev/null
>> +++ b/drivers/gpu/nova-core/bitstruct.rs
>> @@ -0,0 +1,149 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +//
>> +// bitstruct.rs — C-style library for bitfield-packed Rust structures
>> +//
>> +// A library that provides support for defining bit fields in Rust
>> +// structures to circumvent lack of native language support for this.
>> +//
>> +// Similar usage syntax to the register! macro.
>> +
>> +use kernel::prelude::*;
>> +
>> +/// Macro for defining bitfield-packed structures in Rust.
>> +/// The size of the underlying storage type is specified with #[repr(TYPE)].
>> +///
>> +/// # Example (just for illustration)
>> +/// ```rust
>> +/// bitstruct! {
>> +///     #[repr(u64)]
>> +///     pub struct PageTableEntry {
>> +///         0:0       present     as bool,
>> +///         1:1       writable    as bool,
>> +///         11:9      available   as u8,
>> +///         51:12     pfn         as u64,
>> +///         62:52     available2  as u16,
>> +///         63:63     nx          as bool,
>> +///     }
>> +/// }
>> +/// ```
>> +///
>> +/// This generates a struct with methods:
>> +/// - Constructor: `default()` sets all bits to zero.
>> +/// - Field accessors: `present()`, `pfn()`, etc.
>> +/// - Field setters: `set_present()`, `set_pfn()`, etc.
>> +/// - Builder methods: `with_present()`, `with_pfn()`, etc.
> 
> I think this could use a short example highlighting the builder pattern. It may
> be initially unclear that the methods can be chained, even though the word
> “builder” is being used.

Sure, added, thanks!

> 
>> +/// - Raw conversion: `from_raw()`, `into_raw()`
>> +#[allow(unused_macros)]
>> +macro_rules! bitstruct {
>> +    (
>> +        #[repr($storage:ty)]
>> +        $vis:vis struct $name:ident {
>> +            $(
>> +                $hi:literal : $lo:literal $field:ident as $field_type:tt
>> +            ),* $(,)?
>> +        }
>> +    ) => {
>> +        #[repr(transparent)]
>> +        #[derive(Copy, Clone, Default)]
>> +        $vis struct $name($storage);
>> +
>> +        impl $name {
>> +            /// Create from raw value
>> +            #[inline(always)]
>> +            $vis const fn from_raw(val: $storage) -> Self {
>> +                Self(val)
>> +            }
>> +
>> +            /// Get raw value
>> +            #[inline(always)]
>> +            $vis const fn into_raw(self) -> $storage {
>> +                self.0
>> +            }
>> +        }
>> +
>> +        impl core::fmt::Debug for $name {
>> +            fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
>> +                write!(f, "{}({:#x})", stringify!($name), self.0)
>> +            }
>> +        }
>> +
>> +        // Generate all field methods
>> +        $(
>> +            bitstruct_field_impl!($vis, $name, $storage, $hi, $lo, $field as $field_type);
>> +        )*
>> +    };
>> +}
>> +
>> +/// Helper to calculate mask for bit fields
>> +#[allow(unused_macros)]
>> +macro_rules! bitstruct_mask {
>> +    ($hi:literal, $lo:literal, $storage:ty) => {{
>> +        let width = ($hi - $lo + 1) as usize;
>> +        let storage_bits = 8 * core::mem::size_of::<$storage>();
>> +        if width >= storage_bits {
>> +            <$storage>::MAX
>> +        } else {
>> +            ((1 as $storage) << width) - 1
> 
> Can’t we have a build_assert here instead?

Good idea, will change.

>> +    }};
>> +}
>> +
>> +#[allow(unused_macros)]
>> +macro_rules! bitstruct_field_impl {
>> +    ($vis:vis, $struct_name:ident, $storage:ty, $hi:literal, $lo:literal, $field:ident as $field_type:tt) => {
>> +        impl $struct_name {
>> +            #[inline(always)]
>> +            $vis const fn $field(&self) -> $field_type {
>> +                let field_val = (self.0 >> $lo) & bitstruct_mask!($hi, $lo, $storage);
>> +                bitstruct_cast_value!(field_val, $field_type)
>> +            }
>> +        }
>> +        bitstruct_make_setters!($vis, $struct_name, $storage, $hi, $lo, $field, $field_type);
>> +    };
>> +}
>> +
>> +/// Helper macro to convert extracted value to target type
>> +///
>> +/// Special handling for bool types is required because the `as` keyword
>> +/// cannot be used to convert to bool in Rust. For bool fields, we check
>> +/// if the extracted value is non-zero. For all other types, we use the
>> +/// standard `as` conversion.
>> +#[allow(unused_macros)]
>> +macro_rules! bitstruct_cast_value {
>> +    ($field_val:expr, bool) => {
>> +        $field_val != 0
>> +    };
>> +    ($field_val:expr, $field_type:tt) => {
>> +        $field_val as $field_type
>> +    };
>> +}
>> +
>> +#[allow(unused_macros)]
>> +macro_rules! bitstruct_write_bits {
>> +    ($raw:expr, $hi:literal, $lo:literal, $val:expr, $storage:ty) => {{
>> +        let mask = bitstruct_mask!($hi, $lo, $storage);
>> +        ($raw & !(mask << $lo)) | ((($val as $storage) & mask) << $lo)
>> +    }};
>> +}
>> +
>> +#[allow(unused_macros)]
>> +macro_rules! bitstruct_make_setters {
> 
>> +    ($vis:vis, $struct_name:ident, $storage:ty, $hi:literal, $lo:literal, $field:ident, $field_type:tt) => {
>> +        ::kernel::macros::paste! {
>> +            impl $struct_name {
>> +                #[inline(always)]
>> +                #[allow(dead_code)]
>> +                $vis fn [<set_ $field>](&mut self, val: $field_type) {
>> +                    self.0 = bitstruct_write_bits!(self.0, $hi, $lo, val, $storage);
>> +                }
>> +
>> +                #[inline(always)]
>> +                #[allow(dead_code)]
>> +                $vis const fn [<with_ $field>](mut self, val: $field_type) -> Self {
>> +                    self.0 = bitstruct_write_bits!(self.0, $hi, $lo, val, $storage);
>> +                    self
>> +                }
>> +            }
>> +        }
>> +    };
>> +}
>> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
>> index cb2bbb30cba1..54505cad4a73 100644
>> --- a/drivers/gpu/nova-core/nova_core.rs
>> +++ b/drivers/gpu/nova-core/nova_core.rs
>> @@ -2,6 +2,7 @@
>>
>> //! Nova Core GPU Driver
>>
>> +mod bitstruct;
>> mod dma;
>> mod driver;
>> mod falcon;
>> -- 
>> 2.34.1
>>
>>
> 
> The code itself looks good. Thanks for doing this work, it will be useful for Tyr :)

Glad to hear! I will send a v2 out today or tomorrow, thanks.

 - Joel

