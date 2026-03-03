Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOMuLxhMp2l2ggAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 22:01:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DED61F70B6
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 22:01:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E86310E046;
	Tue,  3 Mar 2026 21:01:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mwn9M/sF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010048.outbound.protection.outlook.com
 [40.93.198.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BB9010E046;
 Tue,  3 Mar 2026 21:01:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D1TS3W2C7UAJJ0QuJGXE1ghDASUFX849rI9pnzUE5NTehLQMKNkH4O0vi+vaNvGnfsxYByjtiI0GYQ4TUlcKE/SAV4rSClSKskrMlHdFJjZWNt/GRanC+uY00mFNTgDoY4FdVyMU6sOM/GFZC/OWEEAX4+/V1EQkHwCrADB0O5IBsDXAvwVl7X2J2zUqMIwOO83afT9dHMAebi5AJ7aYnJ3RCcjJb/HGP5elpTVnm31DYoTNipDAw7e8rZVv6phW5whup/CiIU7N2rg3UPrsmSzrrGNJH/FOTT9fDfgct37EuUWKDLYksatTKiTwK99h/UHUn1pV0dZps1sQNN6hqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rjKKuRLAEf0WSCRufxUzrDqVqUkQQMCS2xwa01+LroM=;
 b=OQy0aTA6xWbcJTiSEgSpmhBlhUbcyUnui1Cxrsvwtw4hIYd4D6YB1qn2QM9+7hsjh01S1a/z/WLZ9/uwNlZUrMjQ1c6DTMxXklFbwYZuxkaFE1iTk90VWTKgTSr2ELJ4IWejAE7054VxhL3qmqdQq0fS/yGLBWhRPJnEtfLq+90yQNdmoaDjfQQG0xAj+utoVqycc++VE0ek/kd85+7Je8Sxx3pFovII6lnsSYhYwIszuvWugAEN+eNKSD5Ee1HNS5zdUdRKik7UmMv9zSxmSWkRNW/WCgukGIjPz6/Q9KIvrnZAvjtT5+yc5CjFnOavJcgMGz1N0dOJdRduIabUJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rjKKuRLAEf0WSCRufxUzrDqVqUkQQMCS2xwa01+LroM=;
 b=mwn9M/sF0sIdJqk4S6ahvCJ8lso5bQNx0XsxcHs5acBe+Ibxov9TBwp3XOOMkynl5pHoHi0qxNyQKj1EUZIx+wryJ6GPEw9C1DcKOvX2Xx0KVP5iwjmDMZs4Vn4lh2W8F1NEuTwSAFOksj1ieM5HyUxW1E+cOOqmw8TgcmvSzM5sgJNa0ZmXF/EZ3XSh0olCUHyXnNeeNjlvctADK/evWH16OcTP2E29yIoz3FkiSwz/LAXFfNoA27gWG7kWknNH6QRImAyvcFY8ZL7Z8raWIWlukiidxTJRBiN6KfnnzgD3E2wdDuQBp+oNB55vUOzV+Izmbk9dnfLtZtjc28xRPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SA0PR12MB4367.namprd12.prod.outlook.com (2603:10b6:806:94::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.14; Tue, 3 Mar 2026 21:01:04 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 21:01:04 +0000
Message-ID: <333e10b6-4560-4439-9a91-043a0d713d4c@nvidia.com>
Date: Tue, 3 Mar 2026 16:01:02 -0500
User-Agent: Mozilla Thunderbird
From: Joel Fernandes <joelagnelf@nvidia.com>
Subject: Re: [PATCH v8 06/25] gpu: nova-core: mm: Add support to use PRAMIN
 windows to write to VRAM
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Zhi Wang <zhiw@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Gary Guo <gary@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Nikola Djukic <ndjukic@nvidia.com>,
 joel@joelfernandes.org
References: <DGSAL1J55O3B.2LYEQ5VAIEM62@nvidia.com>
Content-Language: en-US
In-Reply-To: <DGSAL1J55O3B.2LYEQ5VAIEM62@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CY5P221CA0142.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:930:6a::17) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SA0PR12MB4367:EE_
X-MS-Office365-Filtering-Correlation-Id: cacfa7fd-25ad-4fad-ef7c-08de7967fb7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: uy4iHf/yqws8yglkyFJHjcTaXIcJx1KkXNbc5E8AoQrOips9J8TNA5IGk7+7NyeocPW09X4BsiMc7Em41If/je33XK1gmFVyIJWZfkBjhx0lmq3gkRmkfWM/FEaLeO0ruHE4kSvvmq2wcH5rszTOKpBpv0ap/4KV5e+r1M5p9RL4qR3a29fyWTyYDqp2U1XOimpTzSVz9B/XBk81YD1Dx1eN2pIPwPo/u5GlSKvBzr+AG0Czn1p+n1uDZeL6L+ghs6tkUoZGjwbypaNA5e+MnD8oY1gqR2uOJqcmbW0zFlL6FmfmNHfzycvjpR+Zsi1EF2o74LLf5EN3sD8l5iAojRto7hHBlrxc8jGUG6NidX1S/ieVPGMjflnY7V2MKaQgRNtq5K/T0pv4gEd2eSADH6ZSuuQetxJA7rmCCCUkBo3NaXnLyb8R+vOdULCI2kAnEmFJTqgyO1koAoM7Lu/9Te5QYzsS8Gdfua1Eh28rbDScH1NKouy+HtgCtLNXDyhFhIloQ0k+jY9VoLrqDkWUhzMwjKoqxhMR0kiXnLAAqvGSpw6bCZeVkQf8lxsjWFHeIh4mZJw99fRWckV5l/jgO1RNUabKuUY7pWL+mo1KlVbA6s1gL5oViAEDCtca6OL0y/zrzq9dawRme+6pvS3PqXpshM0ePQcrAPSFDZXiiMm/dANZTm1FNbltj9AOMD9ehQVrAhz5shc9deJ8VooPjSu+kx50XTC7yBhjVd7Lj4Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUxtcHR6YVlpRW1VTi9qTVI3dlNUR25lTkk4cjQ5Nkp3M2hudEVBNmhRZGNS?=
 =?utf-8?B?cVFnNFJaVWR0UjdpWUVsckhtS0dRcWQ3TUs2TWtiYzBzY3JmQkp1TzltT0Yw?=
 =?utf-8?B?R3JlbmRwLzBZUm5YMHd5SFBFbHhGaFVEUGZ3ekoxczgrc1hXbThqQ3YxN0JZ?=
 =?utf-8?B?NjNNa1FJa0ZnR0lmalJueFA2VU53UHFNVGZjK1lSL1ZaUWNvRTVNei9oMmth?=
 =?utf-8?B?d2FKd2hjTldGV210ZG43RytvSWpmMnhsVFg3dlpNOXhHU2RrQ21JTDYrRk1a?=
 =?utf-8?B?ODE4YW84K3pPSkNJdU13VWMyRmd4Mi9ONDFVSDhLM3M1SEtWRm1pNmk1ZFgy?=
 =?utf-8?B?cGpyZXc2WWtPcWhYYkNzbkZwbnJOZzJQempiMzdpNjVSNStRa1NOVVJBcFlC?=
 =?utf-8?B?VFgvaDZvME9GUHV6UHM4aEdlR2FxR2lJMHVjN3J3QVdVZHpxNmtQRFhMZld6?=
 =?utf-8?B?dWRqRnF0NVFpZ3JQNFg3MUVPNldqd0tvSkQ5MnliYkFKaHV0MkJ3R0o5aFF2?=
 =?utf-8?B?R0N1bWJhbnBWVmxJU1lpa2RiRzRxbUFrbmRSY0dLWlFaeE5Lc3RKQU14YVht?=
 =?utf-8?B?Q2ExRWtvcUtmMGp3MXFld1lKY2lSVzEvTjJSQnlUL0h6eFBHbXJ2RXo5OGRF?=
 =?utf-8?B?UlV4bDFNV2s0bkhyUi9kYmJ1N3NvZHhTT1QxTVdnQzI1azd4N1BaNDB2UTM2?=
 =?utf-8?B?SUJnelFtQlBhcjArZUc0YUEyZDFla2ZHSDRFdXdTc1ovd3BpaklQQ084Sy9x?=
 =?utf-8?B?dHZmSkgzUTF4WEVvTXBTVnpHVmQyOVl1a0VHaHFoSWR3RFNaK0RxZnV4NzJS?=
 =?utf-8?B?cEVrdWMycEkvRFB4bDkySDVranJzV3BtV2VhaHFMcjU2NWtIU3dpcUVYZ1Vi?=
 =?utf-8?B?ZlRrRkVodFdtVVBheG9HNHI2S25rOUE1cmNJQzljYnJINGNLNmtpNzc3dDZ5?=
 =?utf-8?B?ejBjVkVPZnU5WjQ2a0psdk9VTWFBUEZ5V1M2Y2tyeTBLV3J5VSszVDh5c1VL?=
 =?utf-8?B?OUhmZGdOSXlWQmFpRWQxK29KMlAraHorQXFEVm42RTRncHdKOTFrd1h1a0JU?=
 =?utf-8?B?OGh2RVFjZ0drb1ZHb2kxd2wvV21STXhwMytscG82cS9UL2E0bjlJZFg2VStW?=
 =?utf-8?B?dkRtSGRDci91SW1nZ0w1cHpxOHBUOVBKOU1qL2tteTlGS2phMVVPd25ITkxp?=
 =?utf-8?B?aThTdHV4QVJ0VVJMbk1jdmlqcXRHVmJqT29KZVpnaVZuRjZEem15L1M2aFhF?=
 =?utf-8?B?VlFYTnI2VzNUVnpLSFBkQXhadTNDSllFYkVMMjM5L21pWkp0UjBEa25EbEds?=
 =?utf-8?B?c2ZULy9FVUhLM25mSk9NblRXK3Y1MEFoUXNoZjZTc3phbnMyNkNqZ1JLdnli?=
 =?utf-8?B?NlNVM2FZTzZibGZuWDJzS0tleE9yNWUvTXNOcWRremFZc2ZhejZ0SG44ekV4?=
 =?utf-8?B?MVB5U2xUNUxheXNvL3pURGlORUJMRlRVQmdMRkhFdHIxK0NaQ3N1ZTJ1Y0la?=
 =?utf-8?B?Y3ZmWVhnUWFmZEpiQ09rWFFkeHo1L2k2WlIwMU4xQkp2Z01lR3J4RzJDcFpB?=
 =?utf-8?B?dmIwelNCZE1aYVNJWlJ5SWloSU5ZaDUwS0xNaDZnSnVlZkM3bWF1WHpkTDZs?=
 =?utf-8?B?aUVOOFpwTmI5UzhKWmhKZWZUMlJvQ2RFK1FOMnZ4dXBYbGFTc2NiMiszRERV?=
 =?utf-8?B?Tzh4eTluNDhpT1NzNGxhT3pyYjUwSjNPM3VLUUlvMU5hK085T3hmTGU3NWZS?=
 =?utf-8?B?WGRMYlBNQWhEZkN5UklJdCtoSjhXSEZFcU03b0c0R1V0UjNuWHc3Wm1wbDBx?=
 =?utf-8?B?YzJ1VXBIOG1ZcC9MbmdCeUZMcFNmajVnc2F4TUh5K0w5RHRNVEtWU294dkhn?=
 =?utf-8?B?cFpjN004SVEzM1o5elo2NndRaFJWTXBXRFpPTWJ0TEhnajQ4ZXJBc1pwNjlM?=
 =?utf-8?B?N1F3UUNKY3hoZ0JsZWNtWlRLS3dIblpFMEloTjRWMDVmNmdHUWswdXV5eFJ2?=
 =?utf-8?B?YXBFYTI2QXU0aVkvMTc2aWpWbStqdTF2R1Nvc2VVbTlYem54TnFDZlR5ZXdX?=
 =?utf-8?B?dUN3d3doOWh0RDFIcDFUc0gwQ2o4M051OVNudFlwck1rbVJLaXhSRnRpOER0?=
 =?utf-8?B?ZDl0ZXdYVlpuME9ZbkZzOUNERWM1cmozcHc1UVU4UE12Z0ZDdnZLQnJGWnNl?=
 =?utf-8?B?M0xOSHlyNEFDajRXUm5MQnNJY1ZQY0xJZXdYVUV6TlJyemJjdk1YNlZiWXVr?=
 =?utf-8?B?cENTS3lyNlJJOG1OUXQ0cUowT2taTlZrNTlsWFg2SUJlWUh1aG5KTFQycTRK?=
 =?utf-8?B?WDJPWFRadnAvekZLd1hHbzBPRnA0cnM1cXlmOU1zK0dCSllacEVlQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cacfa7fd-25ad-4fad-ef7c-08de7967fb7e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 21:01:04.4760 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WNo6PFuZiug6Yk/s+bLo/0+YGivubf8naGiRaawo7DPOeqhesEP5HvU4r0f/wcHPV1iItd+LmsXQlX4tjDc4Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4367
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
X-Rspamd-Queue-Id: 1DED61F70B6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nvidia.com:mid,Nvidia.com:dkim];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Action: no action

Hi Alex,

On Mon, Mar 02, 2026 at 09:23:43PM +0900, Alexandre Courbot wrote:
> Basically this feature is a prime candidate for an `Io` implementation.
> It maps onto the BAR, has a fixed 1MB size, and needs to be accessed
> using various sizes. It is also used to fill structured values, which
> the I/O projection work will also allow us to do.

Agreed, PRAMIN maps naturally onto the Io abstraction and I had thought
about this.

> The current design doesn't allow the user to explicitly set the start of
> the sliding window - this results in a sub-optimal usage of the hardware
> and more complex code in this module. At this level, we just want
> something that exposes the hardware as it is, i.e. "give me a view of
> the 1MB of VRAM starting from this 64K-aligned address".

I reduced the complexity quite a bit. I think we can further simplify,
but for now I think it makes sense to keep it this way - I am happy with
all the usage sites as well. It properly abstracts the internals without
having the user worry about alignment or window size, so I think it
simplifies things for the user quite a bit. I have tried the alternative
before and the caller side became complicated. Not saying we should not
simplify it further but we can do it piecemeal. The current code works
and is easy to understand. Hope that's okay with you.

> Then on top of that we can implement another type that handles the
> window automatically if we want, but I don't think we will actually need
> it. The page table code will most likely want to set the window to the
> start of its structure, project it, and access it using compile-time
> checked offsets.
>
> If that turns out to be insufficient, we can always compose something
> more complex from this basic piece - but the base `Pramin` should stay
> simple and truthful to the underlying hardware IMHO.

This is a great future improvement if it makes sense. One issue I can see
is for large page tables where the burden of moving the window would fall
on the user. I don't want to box us into those constraints right now
(especially since we also already know that MMU v3's PRAM mechanism is
different and likely needs a HAL). If we want more APIs for fixed window
sizes that can never be moved, we can always add that in the future, but
for now I prefer to keep this as is (let us see if you like the v9, I think
you will :)). Adding to this, auto repositioning does not really
trigger if there is no need, and the current API removes the burden of
managing the window from the user. I already took two passes to simplify
the code since the posting last year so right now in my opinion it is quite
simple and even further less lines of code. It should be acceptable as a
first pass IMO.

One more point on this is, we don't yet have BAR2 support so PRAMIN is the
main way to directly write to VRAM, and instance memory is much larger than
the window size. So PRAMIN is our primary mechanism for bootstrap (our
spoke to HW experts, and they said this is acceptables).

One other thing to note: the Io trait uses `usize` for offsets, while I
just changed VRAM addresses to `u64` per your feedback on the other PRAMIN
thread. So implementing Io for PRAMIN would require u64-to-usize
conversions at the interface boundary. Not a blocker since offsets within
the 1MB window are always small, but worth considering. Also it is still
not clear to me about how to deal with Io trait's "offsets" if they are
VRAM addresses". Even if we convert it to usize to satisfy Io trait, does
it make sense in the Io trait itself to have them as usize?

thanks,

--
Joel Fernandes

