Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMeSJAWAoWkUtgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 12:29:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F412B1B68FB
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 12:29:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ECDF10E163;
	Fri, 27 Feb 2026 11:29:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="OpKbj/h8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011043.outbound.protection.outlook.com [40.107.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F55D10E163;
 Fri, 27 Feb 2026 11:29:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Aw3MnL+FWU43bIAfOHBXU6Bo2ktxbncFXJxNa8Hq7DZLCbkgzGSvcoldniev7glNsZh3cOQcTr7aLIUkaWPWDxVkEhWfP4PSCrrxFVOPam/jXIW77z78R1AS8Yplj8tXmOMEN4DKp4wFnhL1AzLCmpePLDHSIekl1XZj4qZrChPt1jvCQShXw1hYyta9r2xiXRPqPfhtPYOBXMDXtaMwnrD+dIVkcuHqp+/GjRZX/TLAA13TebibPrMarAvZtFF6MmrjnRiWC7lqbPmTanetyOkWZ0h1L5N8FzQAm+ORcSq/b9qh6GVJLjxouA9heJ75nrGuBwYAiY8+WwPjnEDFiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2+00wOULhLk/Ea+tTPXTvLfZRRF/TtzEztaxNjYczSI=;
 b=CSs2eU0IdYwKPjMtCCtHyyqDB/fqmdKzN2fsZQBQtP5TvyxP0oPQLqxdAetJ7EV+S0WVkBVqJmjaGfMgrWRIQULm2xYCWS7WMKaW87LemP1d3mMYAFGucca4hWTyraFiNcXl+X+hziedybP2Eu9UP42KDpevMh0vy/tNJLBy6cDX0YFvHTQ/KlOGnaUrPRTrSZVMg8ujbVvhDWAuWWix5QJLGsnqF5cv2cPafFLjUHaQortNTinYYuzl2PoyGh2xFrBaRdjgGCKUFkpdqGcf+MI+TDnGWM8er5KtGsTYRxhUP0GdDSmN+As4oMBXPC9kPL8viomc2DUAcLi/HC1Gsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2+00wOULhLk/Ea+tTPXTvLfZRRF/TtzEztaxNjYczSI=;
 b=OpKbj/h8KgppRxD563JoJFPMKIUXZD7xaRW73I3CZfP42QoEWaskee/Y03Z/NlA2++BVJY+UQknxB2FsTRBo8VAgN4o+Jab55PzVAKQOPsUDwiJZdFmUgPc7b90u0SVZxP/FUt/KTyNFKG5ZddTwKdA7G+erDJX0463jRCCiSGuv0sGHnuD8f/qQkpsmguJ+cHAQJBLlRYTLt+6OxQk/X7l6S4G7lciuFqDKUY/BOviHwhL5Vxc+tjaQCRzGgQeT+0OPBwWODpL452AWHAlQp6Y//IaOnW5vS4AVDMwOPS5JzD7iY6vdlzjCLEryBYhCsRVnTDVWZznuARlS1l+Pzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ0PR12MB7460.namprd12.prod.outlook.com (2603:10b6:a03:48d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Fri, 27 Feb
 2026 11:29:01 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 11:29:01 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 20:28:57 +0900
Message-Id: <DGPPJGV28ORE.153NNIZ75WY9P@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Zhi Wang" <zhiw@nvidia.com>
Subject: Re: [PATCH v3 8/9] gpu: nova-core: gsp: support large RPCs via
 continuation record
References: <20260226-cmdq-continuation-v3-0-572ab9916766@nvidia.com>
 <20260226-cmdq-continuation-v3-8-572ab9916766@nvidia.com>
In-Reply-To: <20260226-cmdq-continuation-v3-8-572ab9916766@nvidia.com>
X-ClientProxiedBy: TYCP286CA0112.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ0PR12MB7460:EE_
X-MS-Office365-Filtering-Correlation-Id: ffd1a77c-b0a4-492c-3138-08de75f367a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|10070799003; 
X-Microsoft-Antispam-Message-Info: 3QZzqxqZJf1/RYO0P0aV4MpwDOIXlXj1nkTZ8ueOGE0+ng+l1FkuIMwSZftQ6rsC3+ljjqkXCxJesB4YU8OzuuurbnIU8E2UHeGhQVRYkIX/n5B0kbyri4OnlbnIco6HFoWuPdPTOJgOeffJefW8No9GbyuPzIamsGTgbnPS9Ltn1fTxrorD2kaJGtGclzu1o3UeEezuxpiZ9id3gc9TzVQLp8Gr3S3pC7vs4KohVzOi+KFwL+DmZ+gn60t6zkfCeIyAHFKljFDnDwawpmgdcw1Alja2SzGUhBf+UJtHecBMj+LskDzf663vel90D15vPOInSY0BRQz6T6HjzBySKPYC0BkjgHm/VdluqY9ecLNQuRwjc7b+K7NJGMsp4VUQcujrLX8b7pVpCMg/R22b+6kwjDMXvZLnxpAtIvhBflZ5kzoRpWtoO2QpwtBE7g3S1XhKJeuzAFyu5PVQ0Cs3NBEagw0XsLQwiw4EicL+UN6SyCtDE2H2SOIzd758C6WtZVL2/STSR4yxSfLzOwIz2NRimEKaS6fvFfMor3cezUl+H6nkMqh0Y5Iueig2+DNOyI3g1ZvInfSDMkCMDPUSFaRUti7eJNcpjCIslOFDiNHKzsJJZRqLwooTtk3r5rWGl2Nead4xsA2pPp368AfmCRLzg59J6gw4ztUQ7Rrg2+FAkH0M1Vz8Lz1A/WjugwFOt70+2k5GEQFH08VzIA74nz63n7jQX1as87u/MOCPt1g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bm5mTVdYNmY3WlE2MkMyNXhCSUFDT0JmMmJSUktISmNvUzVScENtbjRoazFu?=
 =?utf-8?B?MkFXeVlSOU9QbnQ2RTN4Tk1wZ2p0dGk4UGxJOU5URDhGY3UycGhPZlBGbUs4?=
 =?utf-8?B?NEZyaThQQURBRmlPLzNLK1dJSlBNZFFJc3NwWjU1MmdqS29iNUVCWjhOWCtO?=
 =?utf-8?B?OWJNOEcxd29XaER4M3UzZUN5YTV0a1ZhNWdsVHBoeE5vK3lMbDNlYm1xSm5w?=
 =?utf-8?B?Q01mS0JNUFRIMXBIT2ZwT2lpLzVVTlhHbjNHeVpXbnVxV0N3ajBtZkdvUGlM?=
 =?utf-8?B?SVVNZkc1cUdFME1kVE55ekRzVXFMMTVZeEppbFdxZi80NnZNb1NnUVVSZXBY?=
 =?utf-8?B?YXBPMWlCYUU3dkdEcU4wS2t6aGdBc0tBb0pzOUpGSjJjNXFTa3FUYlVPZ2RP?=
 =?utf-8?B?dzlIaHJzbTcvdWptZWl4SVVNZGU1dER0b1o1c1J4ZzMrNVVjWFNlOG82Snp4?=
 =?utf-8?B?R25jSThVSUdrWTBLTmpCSGhaaUFueWFQMjRGdGlOZXNIMlJBK0tzLzk2aWZm?=
 =?utf-8?B?RXZZT2FaTkQ2RjlJZ3lSUTJDdlRqSVI1aUNldU05ajVPcGRjQ0RvcEFsNXJn?=
 =?utf-8?B?MVlZRzl0RmQrT2VBUlNFZTRMSU03SHNWOTZnbXMvQ09Rb3diSGVuUnlseE9x?=
 =?utf-8?B?QVI0aE0yUSs2ZWZuRmZtWm1qN2MwV1Q3Nmk3cU9jZzhSbzU5SFFSS0RFOUQ5?=
 =?utf-8?B?RHB3azBZS0JPU0NrbGZVUDcrWWN0cEVHSUE5WGNYL0hZT0FzYUFibFY2VGJY?=
 =?utf-8?B?cUcvUFA5Nk1RR1hhM21aZXF3eTVNTEhyd2dxekNtTnEzRGNVQUNuL21vQXNq?=
 =?utf-8?B?TmJXclV3WUJoYjF4SEF0SHFBYmhSWlBIZTV1ZUV3VndORW1WUWhMeHdSQXlF?=
 =?utf-8?B?ZndaNThnTlhvYjRPZDdhSzN1WUdBMmlmVzJyRHpncjBPUUxWZGptTlNNUWtQ?=
 =?utf-8?B?U2Rrc0k2MjZJeFVSdEZYcHM2TzBtejBJRFdvREIwa0J4bzlaaXgyUjY2Sjkw?=
 =?utf-8?B?YTdpYzFGa29YM1VCbVBkb0E1SWQwZFJVYTd5M295Y2JtMGFEYURIUWdhbzdP?=
 =?utf-8?B?cnBLMlJVQ2Q5ZzNUTHFrME9xM2J6WS8yTE93SGtLVXRlTjcwZjJKMVMrTm5R?=
 =?utf-8?B?cXJpZ3dpVlZMVnVYWWVPcFpjU0pBMnJ1ZlA2cDA1bXRJWFFOUmNxUFR5NkZU?=
 =?utf-8?B?QU92T04yU21vSlhtOThwVzhXYXFTSWsxSU94NkVScVBpM2xTNUc3UkZGeXBw?=
 =?utf-8?B?RmhlWC90Q0Y5TXQ5UFFocEVqcGhmQlFUS01POEpwS25telVxQWNic2JSU3dQ?=
 =?utf-8?B?UTY1M0pyU0pFZkM0Z2hzTG5GU2h0dXBtQTVMMVh5ZDlHaENPQTVuNTVGcG1Q?=
 =?utf-8?B?MnBmZ3Rsck0zQ2hheHh6bVV6T1dJakQ0WlBtRUkyQ2IxUlhEWGZTMlpUUEk3?=
 =?utf-8?B?dGtLRlNadmRPL0ZOd0pnT3M5TjJ1TWQ0ZGJnWEpsNGRqQ1l5VUNVaFFBdjlJ?=
 =?utf-8?B?VWl4Um1WM29hRDZ1YnJJRG1FM1FYVlF3anE4VjNEcE5QTnFLQVdsdnNrdTdx?=
 =?utf-8?B?NDVlSzhOMDVwY25UYnFBMDJqbkN6dmx1R1BZZG0xOXF1a0dJOTBGL1k2T2RX?=
 =?utf-8?B?dHJOMExVV2ZBN1JGWDVRYm5iaDh0NWRuWDVXYmFoamJDOWVpZUtTdGRyTkZO?=
 =?utf-8?B?c1lxT0hLRk5yLy84eGFUSXc5Znh5L3c0eEhiUFpBeEhteElCYTR3Tkx4QWx6?=
 =?utf-8?B?THpIV3E3YnUybXRPUXM0UThpd0VmQm84VEg5ZU1qRW1iZUdVMnVPWmxVcVl4?=
 =?utf-8?B?K0pNZUU0b3ArQ0hMV040MDhWbWw1RmZIOHN4ODl5OTVvYkVZeGVDVTRsVWgz?=
 =?utf-8?B?U04wWEpFYmtLRnh3clF5ZGduV0VMVENWNVNrWHdpR21JakNVdE4rVDdVQnRl?=
 =?utf-8?B?cVJ2M1huMHUyNjdyd05qZVZ3UldSM3RpbU9Rdk9aMUtnd3B5UDdmTXYzdnRt?=
 =?utf-8?B?M3B6cFFFZllOOFVDL3hGUGpGVGxRN2NielZCUC92bi9JN3hJUFl3YWRmWG1l?=
 =?utf-8?B?SEhWNzZSb1hlcHZvTW5NdmV5OEpHVWY0cHpGaHBvWGJxMUh1eEJxbnVYWmtH?=
 =?utf-8?B?dXNDaFMxT3dubmtXakFtRmZUS3d4QzBrdnBkS0NvZzhjdnZwOU9DL1Zzd2lz?=
 =?utf-8?B?N2lUNFEyZ2hkdE93UGNiYXYzRzkwVzVnR25sUjQ4NGdBMnJqcWNQMkU4akhs?=
 =?utf-8?B?TXQ5THBDck1DWG53M2tRa0EvRVArZUlSd3JrVVhIS0lhY0NLRWF3SDFjY3lI?=
 =?utf-8?B?S0pMa09IVGI3cHdjb25XMHBNc3V1cmdiVGM4ZzI3YkkwdkdoQndzRUNHb2N0?=
 =?utf-8?Q?8PTBmbQ2654phE/snvMNqSFxv356spZergyIYnPHYvW6h?=
X-MS-Exchange-AntiSpam-MessageData-1: WqG3TAtXvMyXiQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffd1a77c-b0a4-492c-3138-08de75f367a2
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 11:29:01.1412 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WGQUg30Tev2+tbCTD1S3MXCR2MA+v7y8q5ita7k1MNufNONCdSajAPQpHmEi3ATLlfYtFyI2T+vUDDmoEOX0/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7460
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,ffwll.ch,garyguo.net,protonmail.com,umich.edu,lists.freedesktop.org,vger.kernel.org,nvidia.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: F412B1B68FB
X-Rspamd-Action: no action

Hi Eliot,

On Thu Feb 26, 2026 at 8:45 PM JST, Eliot Courtney wrote:
<snip>
> @@ -588,6 +592,39 @@ pub(crate) fn send_command<M>(&mut self, bar: &Bar0,=
 command: M) -> Result
>          Ok(())
>      }
> =20
> +    /// Sends `command` to the GSP.
> +    ///
> +    /// The command may be split into multiple messages if it is large.
> +    ///
> +    /// # Errors
> +    ///
> +    /// - `ETIMEDOUT` if space does not become available within the time=
out.
> +    /// - `EIO` if the variable payload requested by the command has not=
 been entirely
> +    ///   written to by its [`CommandToGsp::init_variable_payload`] meth=
od.
> +    ///
> +    /// Error codes returned by the command initializers are propagated =
as-is.
> +    pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> =
Result
> +    where
> +        M: CommandToGsp,
> +        Error: From<M::InitError>,
> +    {
> +        let mut state =3D SplitState::new(&command)?;
> +
> +        self.send_single_command(bar, state.command(command))?;

As we discussed offline these two lines were bothering me a bit, because
we pass `command` twice and there is a possibility (although purely
hypothetical) of API misuse. I think I found a way around it: we turn
`SplitState` into an enum with a `Single` variant, that contains the
original command, and a `Split` one, which contains the truncated
initial command and its continuation records.

This simple change cascades into more simplifications in the new types
introduced by this patch: `SplitCommand` is not an enum anymore, but the
original command with a shorter payload. And the continuation records
are their own self-contained type. This is achieved by allocating two
`KVVec`s when we split, and taking advantage of the `SBuffer` we
conveniently have at hand to fill them both.

I have pushed a branch with this idea implemented on top of yours in [1]
- please check it, but I think it brings a nice (if small) incremental
improvement. It removes the API misuse potential, makes every type
purely single-purpose, and doesn't need `PhantomData` or lifetimes,
making it simpler overall IMHO.

[1] https://github.com/Gnurou/linux/tree/review/continuations

> +
> +        while let Some(continuation) =3D state.next_continuation_record(=
) {
> +            dev_dbg!(
> +                &self.dev,
> +                "GSP RPC: send continuation: size=3D0x{:x}\n",
> +                command_size(&continuation),
> +            );

`send_single_command` should already print the command, so I don't think
we need this additional debug print?

> +            // Turbofish needed because the compiler cannot infer M here=
.
> +            self.send_single_command::<ContinuationRecord<'_>>(bar, cont=
inuation)?;
> +        }
> +
> +        Ok(())
> +    }
> +
>      /// Wait for a message to become available on the message queue.
>      ///
>      /// This works purely at the transport layer and does not interpret =
or validate the message
> diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-cor=
e/gsp/commands.rs
> index 8f270eca33be..6ffd0b9cbf05 100644
> --- a/drivers/gpu/nova-core/gsp/commands.rs
> +++ b/drivers/gpu/nova-core/gsp/commands.rs
> @@ -4,6 +4,7 @@
>      array,
>      convert::Infallible,
>      ffi::FromBytesUntilNulError,
> +    marker::PhantomData,
>      str::Utf8Error, //
>  };
> =20
> @@ -22,13 +23,16 @@
>      driver::Bar0,
>      gsp::{
>          cmdq::{
> +            command_size,
>              Cmdq,
>              CommandToGsp,
>              MessageFromGsp, //
>          },
>          fw::{
>              commands::*,
> -            MsgFunction, //
> +            GspMsgElement,
> +            MsgFunction,
> +            GSP_MSG_QUEUE_ELEMENT_SIZE_MAX, //
>          },
>      },
>      sbuffer::SBufferIter,
> @@ -242,3 +246,141 @@ pub(crate) fn get_gsp_info(cmdq: &mut Cmdq, bar: &B=
ar0) -> Result<GetGspStaticIn
>          }
>      }
>  }
> +
> +/// The `ContinuationRecord` command.
> +pub(crate) struct ContinuationRecord<'a> {

These new types are to be used by the command queue, and we don't want
to use them elsewhere, so `pub(super)` seems more appropriate to me.

And actually, since they are more command queue infrastructure than pure
"commands" that fulfill a given purpose, I'd suggest moving them into
their own sub-module of `gsp` (named `continuation` or `split` maybe?).
That way they don't get in the way of readers who just want to learn
about GSP commands.
