Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OH9BDBU6p2mofwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 20:44:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 794841F644D
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 20:44:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9219689119;
	Tue,  3 Mar 2026 19:44:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="eb3ZZOTb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013047.outbound.protection.outlook.com
 [40.93.201.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAFC510E8AC;
 Tue,  3 Mar 2026 19:44:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tL+7gjb54ka7wvvuSA+F0loVKqy2o60yUEQ0kO+2kbnoHXcQgikiStvWNpbotblUX6qJhGiN33KsN/Z5QE6uhaod31Dy/k1/xbWJSN5eupWBJZDtkNkbeNFkrqacm485VdoJ9mmtYt8hD3flRCdJUIKUREmY/kj0+bqf4VBWwtk6FTPZHnrc5g3L2tN2/VTOuh014wqBgAwQqZtY2kgxUQctcgpzNiKMopFd++H908n9GTj5aetxBWJDdUKAMNIBGT0ZL+aU973hFaH2O9rA6hcIrtGyhBjYT9U3vDL4h9kYa50yn/I8jBSqJ/VfeleZI5ZafQ4uGe2/8UcxCbrmJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9uks4LlUVJ6lWKm12K7dD6TPGuILbjjYzHJ1St0vw64=;
 b=ivlxPckmFBClkqPER3XtpiwblK0qFmdikPRgmIjlOd3UCpYim1UrPIgMfC8IDd2+CRoUkwqzw8TkZkg41WIqOayWSiqdha1LGxldQW2ZKuIUDA/P06LmgSsL82VmYuzJfwFxVHGWfAs+hdnhYP/gd2f2sR2E4Fqt177u4Jciw5wHJdV/hmimhKT3NeLaucKiVoTb/RKz70AqU0wftz1n2yOe4mpYMZx3PvRZlPzkZGdTskUJWlzrJ37EX7LSyMJRcRqfIJE3z3yopRUF1GS0p81ksagmD/LdW7WbB6TN6LJq3W1P3eE/8mMNIsRPUtN4eg96Xpo00ZR8AsNGH8NSnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9uks4LlUVJ6lWKm12K7dD6TPGuILbjjYzHJ1St0vw64=;
 b=eb3ZZOTbGX9TocjvW3zCP9PQO3kV+ONkLTyIcJePZc4NsradJ5MlID/+j5cx5kcrnWu6CzD3zQDgMb9WarjkH6B206UoNhURr06LYUAibSiCS6IrYzQ1Eg8ObTWc8EYnh9VZInlFp17SLDv1PJ87nfTLEIb3x6tlxWbIniXKwDryTRPHSbzxglYqMV/mN2TDhgdg8nBeKjP57YBi0XtGIaquUpt90oXBdhhKDidFtyFTZalsf1psHPjQLZntEaRFXb9ueIqkNl7qtNFFx4KwNwRPDig6MC0Hox88hn0+IXdYtY0T6FAod4x69pUsnHmEZEdx8Fijz7D3gZDhjcsd+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 MW4PR12MB6828.namprd12.prod.outlook.com (2603:10b6:303:209::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 19:44:07 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 19:44:07 +0000
Message-ID: <e9ac37f5-f23f-4ea3-81dc-32d96e5b2041@nvidia.com>
Date: Tue, 3 Mar 2026 14:44:03 -0500
User-Agent: Mozilla Thunderbird
From: Joel Fernandes <joelagnelf@nvidia.com>
Subject: Re: [PATCH v8 06/25] gpu: nova-core: mm: Add support to use PRAMIN
 windows to write to VRAM
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Nikola Djukic <ndjukic@nvidia.com>,
 joel@joelfernandes.org
References: <DGSA1N4M1PUM.29JML8EK3SKWA@nvidia.com>
Content-Language: en-US
In-Reply-To: <DGSA1N4M1PUM.29JML8EK3SKWA@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CYXP220CA0002.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:930:ee::12) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|MW4PR12MB6828:EE_
X-MS-Office365-Filtering-Correlation-Id: 37e7a617-fa2e-47d3-335f-08de795d3b0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: yxLlAMNmqM/O/GERom5dAOs1T96MeFupGg4TUGsKGr178L8WX3yVo+UjFyQhJ4x5povWWgrFep6w6BkuiBhaxb+JBtYmr0xvKtfWlmBtjyr0wwF7tt1Xwp5m3b6FVyHG/mMgAPHpam4ZevmceipKrok1Zr1ufxbJVb42+Xs3c3ogYNqJ3YbW6NteAnkioigxONMWZCHE1DCs/T/2ymsqyit579OBQ/gH5inojl9vzYkM0D2dYXvp1miJoRDYd6BNrwWYKSXYKwlgk2Le2UTiedYRPXeXfJLNnzKyD1VWNrKfprAj6U3qUqC/sTrXnz7Wc9Bs66Dpv33mkeCQFpgxrub9le8KqLLErz5IOHGtW1zsPM3MBzk9NeEaG8/+06PCf0rgF2is3mNAtXEc1ywwejI61R1KRQy5dCdedCW39gyfWmvq0Ky09aaaJ9eIrf+qgBNZsWzzereXclaEUMWI+A9A7BO5NyP+zhyHNA0co/TDLreureH8DO5FGsI3C7oONFNbkgFUXiym2UTxhNPehWBOpOwafMqY2HZYKHsGy/vS9XFvu/azsG1b1xyZVGcl6n1dChkB5fCZu0ar1E3A6ihmS7fF7C46YBG0LEZ4X/0OZcnQGWGpsiX3gQ9zHPfZt+hxot5IMDAeuauc+ov+teBSJUGNLE+E95pGjIyy9Bqk5xfPPtNTMea5hwKecBs6volDsceI8eTVslN0uCpg0zQvu/20HcF4AVtH8J1P03g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnlidCtIN24vQzlDN1Y2RDdIVTJTaWlUcVRJbW5DYVBOTk5ZNjJ4YkhEN0lX?=
 =?utf-8?B?Y2kwZlBidmM0OG1vL0FDS25aVjhVampibTRvZDJFL0hTZEIrK0ZXdGxSR0V2?=
 =?utf-8?B?enRhaGVVcWI3MkhQQnBIZW5uNWJTaXVKeWtHaDBMdmYrVS9qcU90eUZDTC9u?=
 =?utf-8?B?WWJLOWZsZ3pESXV2NDRHUEc1ZzUrMWM4UlBIRjU2czJyampOK1FPZWtERmd3?=
 =?utf-8?B?eTl2T29JUWc4ajUwVllpa0VVOHpjT0ZtQlVQa3BCWDE3TllJZ1FOdWFlNjdC?=
 =?utf-8?B?QVFmUVZCQnFzZWNTT1VuVlJteXM1Z2hGYnp2SkpOVG5USXRXenN0dWRTWEFl?=
 =?utf-8?B?WElQUStSVms0eDZIOGJkd21XZHJ2cDd5V2FXQ1hoVlhkSGhHelo4VytZLzZ0?=
 =?utf-8?B?dW1QdmVadUhuU0dxL0t2N3FYeUtKN0xESXVXVGtWajJYUlB6TEZ6a0FmOUFp?=
 =?utf-8?B?VURGamVpM1B2SU5FbkJTU3R0VCtISVR3LzdFcjJRTjJBbTJyNkV6WXBrUGEr?=
 =?utf-8?B?LzVzcmROWlZpZVR3a004eGpYbjlxdG5ITzdUaEcyZzBFMFUwU1g0VCt5cVlN?=
 =?utf-8?B?RXRFNjJ1MlR1TTVhSXVGQThpazRiTTVqTU9wSFNJc3U3VjlKeWFnL0hpb3pa?=
 =?utf-8?B?S1dUdTBGVUFsZ2dreXJqZXpLRkdUQ0NOSUhFQzZHTk42UnZLV3VlUGRPdVpl?=
 =?utf-8?B?ZzRjc2ErUmN4c1QyS3NYVnNTUWNsK1hBSWV6cldmWThkc3ZSSFpHdFVrdjZu?=
 =?utf-8?B?ZVBLd29VckF3NCs0c3BITzk1WUVkTTNDNHhNeGNrUmxiMHdpRXhOY2RQTFJk?=
 =?utf-8?B?RkFzSXY1MzJlSWpsdlJ3OHhNRkd4eFZJd2NRT3crOFc1ZExac1JYSE45NU5E?=
 =?utf-8?B?LzB1THF6SjdnK1ZCSldXOGdFS0xNNTVrY0w0MXdDcDRlQ3NlRVo3bmZpb1h2?=
 =?utf-8?B?aksvTVJsdnZkNjRabHVrZ3BVK0c0NytoSVlCeklETlhUOXVPOGFsUVUzMU5R?=
 =?utf-8?B?RUIxYzZwUlhGYzE5MUpyQ0liSGZMQ2ppdGExQy9Gd1RRbFNFYk9ZVkNodEU5?=
 =?utf-8?B?L1Q3bUhVWlc5UHdhMUVLNjFiT1Y2Ly9POWRrbmlSR3NvTHNMcXVvendKZDd0?=
 =?utf-8?B?OTVhU0RYMlQvV3c0WmoxU0tQSENZMDlqRjlJWmswdWdNa3lEK3dnSzNjYjF5?=
 =?utf-8?B?T2lMcDNZMDRDMXhRaXhwMFg5bmN1ZEJHbVhXT204STlOOVI4dFpSS1hOODVv?=
 =?utf-8?B?TTBGNndiYUh1bzdTWk9tOU5YWHRObk54MXFVRXJyNVB0Tnloa2pqcHZ3a0tH?=
 =?utf-8?B?Y05HMysxaENDOWJJUzJqTW9RQ2NRdWN6b3prSEFoSWxNVlU2TjJnQXgwbXpo?=
 =?utf-8?B?Ui92MCtQSWpLQzhFNmRMaXhwYWRad1BuMzlON3NsbTZWbHJQK3pnQUhWV0pi?=
 =?utf-8?B?WFc3UUFXN3VDQUJiKzltQkFEb0p4YTZYVUdxSnlHV2orT3ZNUkJxdXhmL1VF?=
 =?utf-8?B?QmVnRWQyeTFDenJ4SWRsVTc5Mm9wZ2Z5K2lKaW41dVhscnUwNmlpcURCc2Qv?=
 =?utf-8?B?dm1NMm9PN2doVFpJRnd5WmlZbEU4b09DK0NVRzlUNTFPaG9zWTlOUVRPRW1Q?=
 =?utf-8?B?VlhBTjZjWjZxYm1ybzR6VUN5dndJcmRSc28rYTVFamtiSy8vek1pZkozbjhR?=
 =?utf-8?B?dlZJempaZnlCS1gyeEMwTnljaDQ2c2U1QWMrUlhDc0F1YjFwU2Jja20yQTRN?=
 =?utf-8?B?SzVza3lPd3VrTGZmQVRCMnFwWGJncVNNaG1RUHhsc1hzalZ4alBBQzkya1JG?=
 =?utf-8?B?cG9CeG1LTjhNdGg0aUowMi9HTzV0VWlwWUF1RWpOM3dxVzVEUGNhNGZ4MGJX?=
 =?utf-8?B?NEVwTWJkZDE0cHY5MDVvc1MzS1hLQmZnTmVaY3k2dzVWWjZqNFR5V1Bld043?=
 =?utf-8?B?eW41MlhmZVBOejhVZ0VDV2xKZFNXU2RkOXdVQkRuSFo2NVdobS9DTEdqcTJW?=
 =?utf-8?B?WTFWblFQbWJpTEVSQjNyYlVUYlMxbEhGb2RDcjFPZTJobEZPVWdHQU5xZnpN?=
 =?utf-8?B?aXlrZ0lZTEJmeGZFZStGVVJvOTg2R1NaZHRXQ09jL3NZL0NpdUx3c0ExUXJR?=
 =?utf-8?B?RnlMcVJ0UTVSRzZ6Mytza05FbU5WWWcraEhjWVE3Q2luRnpVVUNPRlpYM0Jp?=
 =?utf-8?B?VTJoeEVESDNhTTFaZDUxVUVDRU1BRXd4dEJZanVCWjhVZ0VqcnMzaWdwL3h6?=
 =?utf-8?B?NEp5WlZKUTdnM0hMcjFHVVJ1L1hubVRjOGZ2dmJ2azVaKzdxc0tDbHpWWFNu?=
 =?utf-8?B?YlQ1aDYxdVNhWjhtRlZSVEt1UHdRQndrMXRWUHBRSGo1a0J1QW40Zz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37e7a617-fa2e-47d3-335f-08de795d3b0f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 19:44:06.9627 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C5HPptWu1Bzgsx41aM6w/Y30HvMKCGNTGvMYDOfkrNw86VQLOOyOgl6sj9aN2Tb6I+NvIS+YjN8ETWq29OmSWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6828
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
X-Rspamd-Queue-Id: 794841F644D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 08:58:23PM +0900, Alexandre Courbot wrote:
> > +//! controlled by the `NV_PBUS_BAR0_WINDOW` register and must be 64KB aligned.
>
> s/must be/is - it's not like that hardware is giving us a choice anyway
> since we cannot even express a non-aligned value in the window register.

Done.

> > +            let bar = self.bar.try_access().ok_or(ENODEV)?;
>
> Ouch, we are calling `try_access` for every single read or write
> operation.

> > +    bar: Arc<Devres<Bar0>>,
>
> Cloning the `Arc` is what forces us to do a `try_access` on every
> read/write operation. [...] you can just call `try_access` in `window`
> and store that. This turns `bar` into:
>
>     bar: RevocableGuard<'a, Bar0>,

Agreed, this is a lot better and has fewer lines of code too. I have
made the change.

> > +struct PraminState {
> > +    current_base: usize,
> > +}
>
> This has only one member and no impl block of its own - shall we inline
> it?

Agreed. Inlined to Mutex<usize>.

> > +    /// This lock is acquired during the DMA fence signalling critical path.
>
> nit: s/signalling/signaling

Done.

> > +    pub(crate) fn window(&self) -> Result<PraminWindow<'_>> {
>
> The name of this method is strange - we don't pass the base of any
> window area. It looks more like it is actually acquiring the `Pramin`
> for exclusive access.

How about `get_window()`? Open to other suggestions too.

> Also fun question: what happens if we try to access an area above (or
> below) the available VRAM?

Good catch, I added further hardening to check for that in next spin.  And
as a result, I can also drop this check now "Validate within hardware
addressable range (40-bit address space)" since it will be covered by the
VRAM region check.

Also I was doing unnecessary window repositioning: we were computing a new
base for every 64KB boundary crossing, fixed now.


> > +    fn try_read_window_base(bar: &Bar0) -> Result<usize> {
> > +        let shifted = base.checked_shl(16).ok_or(EOVERFLOW)?;
> > +        shifted.try_into().map_err(|_| EOVERFLOW)
>
> This function is actually infallible. [...] For now can you use a regular
> shift operation with a TODO to convert to `Bounded`?

Done. Renamed to read_window_base(), uses plain shift and u64_as_usize.
Added TODO for Bounded.

> > +    saved_base: usize,
>
> What is the point of saving and restoring the original position?

> > impl Drop for PraminWindow<'_> { ...
>
> Let's drop this alongside the original window base restoration, which
> doesn't serve any purpose.

I was trying to avoid side effects for other users of PRAMIN, but you
are right, that is too defensive with handling this. Will simplify.

> > +    state: MutexGuard<'a, PraminState>,
>
> I'm wondering whether we should remove the `Mutex` from `Pramin` and
> make its methods take `&mut self`.

Actually I would like not to do that because it complicates the design -
`&mut self` on Pramin then requires `&mut GpuMm` everywhere, cascading
through all callers. I had tried that path initially but ended up with
the internal Mutex approach and concluded it is cleaner. I think we can
start with this and refine as needed - let me know if you're okay with
that. Similar reasoning for the buddy allocator, where I implemented
internal locking there after trying the mutable reference path.

> > +    fn write_window_base(bar: &Bar0, base: usize) {
>
> `base` should be the native type of the GPU, i.e. `u64`.

Makes sense. I changed it throughout the file to be that way. Btw, I left
the BAR0 offsets (bar_offset, offset_in_window) remain usize since those
are host MMIO offsets. We could argue that is 'an offset into VRAM though
which is GPU addresses' but I guess we have to draw the line somewhere :)

> > +        // CAST:
> > +        // - We have guaranteed that the base is within the addressable range (40-bits).
>
> This function does not guarantee anything of the sort - even the caller
> doesn't, this actually relies on the behavior of `compute_window`.

Fixed. Reworded to: "The caller (compute_window) validates that base is
within the VRAM region which is always <= 40 bits. After >> 16, a 40-bit
base becomes 24 bits, which fits in u32."

> > +        if end_offset > MAX_VRAM_OFFSET + 1 {
>
> If we are going to use `MAX_VRAM_OFFSET` like this, let's define it as
> `1 << 40` and turn this into `if end_offset > MAX_VRAM_OFFSET`.

Removed entirely - the 40-bit hardware check is now redundant since
compute_window validates against the actual vram_region (which is
always <= 40 bits) as per above.

> > +        if offset_in_window + access_size > PRAMIN_SIZE {
>
> Here `offset_in_window` cannot be larger than 64K because of the line
> before - this check is effectively dead code.

This was true with the old code that aligned to 64KB on every access.
With the repositioning fix (we now check if the access fits in the
current 1MB window first), offset_in_window can be up to ~1MB, so this
check is now live and needed.

> > +    25:24   target as u8, "Target memory (0=VRAM, 1=SYS_MEM_COH, 2=SYS_MEM_NONCOH)";
>
> This should be converted to an enum. [...] a single-variant enum will
> document that fact and force us to set the correct value.

Done. Added Bar0WindowTarget enum with a single variant.

thanks,

--
Joel Fernandes

