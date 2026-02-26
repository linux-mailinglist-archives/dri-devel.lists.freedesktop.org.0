Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EydL1jSn2mSeAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 05:55:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A9E1A0EF2
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 05:55:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CF1110E109;
	Thu, 26 Feb 2026 04:55:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hcqdD/SN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013042.outbound.protection.outlook.com
 [40.93.196.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D620810E109;
 Thu, 26 Feb 2026 04:55:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M890bf7qG0AwzQ5wHxczSbL89w9x1YeDH8vd7RY94tGJwGOWt+mek65Myxi7D5nENmIpEEYUGewZg5rNrqSx8xvxt4ShC4uwYPejbkM5/d3C7JLbG82IelLa0ON5v6vDk/nejScAbhgI4b3LXmJIFzeroQJXMD1UVyQgwBCi+N6u2HraKS8NzgV65d25aPJR0YKb5tGfG3v0cO9CyFkhuAeDLxvJOhvLUKAsQ4kat1yOdd0FxL9aEoLhN+5I6Md3DGATtXCUz7M/u/KChfDmqxPrwcLcGThH99cCtUwLk/DDcwQiowp4yqmFaAu2c7t8KrWi1/YSe1GgXkYq/ANLMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pg4HgQbt/L8898p4vYq9fSHmhQRQW+7OxJRFjU7RcKg=;
 b=TqgrNgmqNkXLPmVxmc2XSGtRa1XpnhO+MKTWJkHKb5aqcplloOrMvVSPRhzh1AANSIU3txhjwmMNVZjDi+9hkv2jjJOhHrp4vZj9ptuLAf1YCtraK2raV4P5SCLTLkcjFGiczsJr8gvtzypYXlRrrV9IlB9VXp1AVS8fz0JjDNuF2GMzxU5R+yl97u9jQC0ZZM/iYABPt54k0xNCm5jH8DwHtGFmUdJFPfB8YfjqcQkxcKch1MmUDfjMzcn0M2PEzGgCnzt5eYxowPW4RBgCl1ymScNo8wDI9c3pobyhyw1pHrfOawpx/bFGNN3d2xiREehEu+VdCnSB8Sq5suc8TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pg4HgQbt/L8898p4vYq9fSHmhQRQW+7OxJRFjU7RcKg=;
 b=hcqdD/SNIg7pe1fsqekhhQRjU5qyg7e+9nskxj6badhN5S0AFt2kVu3kx8DnkIVOYDPf9wOAeMB9JDqw0urkN4zzSzIB1tTztJKUeWTyti0fLK9zWpxOuETbUriY9Md+AIHyUkE1SeaPDD8Ps/EwHDF/F5r51SIz5UQqDUTpG3J84kSBK/LAtKU/mtteeWP/Q7IpCmKSI+sGcHJRoA3MYNAeTVVQQSZmT2m2pX+Z3e3ggpR4Qsvss8MZ+FRtvg8i2fI7God3BqAM9blTXbgWfqFHmderWHWkEWzh4uTnqXjnJAL/UX5pHlCe4qRoB1lLFX8iM9eeKryplzj2rk8gdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY5PR12MB6406.namprd12.prod.outlook.com (2603:10b6:930:3d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Thu, 26 Feb
 2026 04:55:44 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 04:55:44 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Feb 2026 13:55:40 +0900
Message-Id: <DGOMJT8DYZ7D.30XKO5TKTLQ2F@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 8/9] gpu: nova-core: gsp: support large RPCs via
 continuation record
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
References: <20260219-cmdq-continuation-v2-0-2e8b7615536f@nvidia.com>
 <20260219-cmdq-continuation-v2-8-2e8b7615536f@nvidia.com>
 <DGOM862L9PPN.2YFCJYJFZY7D0@nvidia.com>
In-Reply-To: <DGOM862L9PPN.2YFCJYJFZY7D0@nvidia.com>
X-ClientProxiedBy: OS0PR01CA0051.jpnprd01.prod.outlook.com
 (2603:1096:604:98::22) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY5PR12MB6406:EE_
X-MS-Office365-Filtering-Correlation-Id: f91c9711-0910-4606-0590-08de74f34ca0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|10070799003; 
X-Microsoft-Antispam-Message-Info: jzXkKCNbH/9m858q+4QDOGYv096786SYfNeob1zoBhLaD5DqD/SPdaMfbmN9+IzQSLyPFnsuhvQsHMauJ5HwWjfH1eTW6CL8Ned1nw8hGum2/9jORxl2wh4QzI4cNS33nee9+/OSiRCqhZksy1Rh8VKwj79JQ5IFYOkTLlo89MNXxBZAC3eRxq2G1MVZDmnLrDKtQtOVRIt+xUcMdpsN4g9BWzXqDzzRd3iQSJlO9K5HGQyrEqeQIlwS4r2Aj4BKUJNxDNqgkOE+J7HULmq7SssdXzoBEG1m2TygaLSl1fr6FiJAZzp/397AeI2WovZuwbEFP66wtaNPhzkCSwPj50pfWFJVKWvo8ibEyC3itgijTxQ8i7Yr3nZWgTxRdsAQQJ2+CDnouY0mOWyFobmj3CMOyoNlHJNT0v64q1Nn1d75sj3Njt+iqTkNIwSZ71AUsqXj++wAns27TvWmNEpDWajfURavDlH37latY6p1vMifLTApTpT6ZthZGFwjZx1h/Ob1bdMO6XRBw0XVsz4D8SvBTjvoVMreRlDYjg3wU/pF0iRmLOW8JrVC0Cfw/yiOw4/EVmsnEncDnNUWZ1gjGKdelIojqElLAi0au2RWFvWprJmNUEIGcHDtdb6plF8cORvD1W78jpt6JDH8H20y7rEII1yDX84Oqsk6SozZGeCBjpyoQgkISlcblwQOAnVCEdnwoE/yHp9U07NAyI0QUknDKMR4QdinOVUAL/FaWW0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czNDMWdxUWYrYWpzMTNvSWxHMWpObDZ4TzNxTGtTSGJBQUlUcTZWZDZOcDRl?=
 =?utf-8?B?Q3lkNkdFRWlxUWVmeXFjc25XTFNWcUVrRXRrWmJobmExTldRVE5SM2RqZzN5?=
 =?utf-8?B?Q1NTZ040UW1LajcrMVdrTkxiTWRYNmVCOVgzS3UrZnNGQWlqNisySTZKbjdF?=
 =?utf-8?B?QUUxbVo5ZWtVelg5em9TejBlNjRodWY1YWlERWgwcyttemVtVmhGcGI2eFIx?=
 =?utf-8?B?blpBVWpxaFQ2emZsVk16WDR1MThJYlpZTnVkQXRHVWhhRHlhZnlFQkU5K2Na?=
 =?utf-8?B?RmxCWTZreU1nOWxvSGswTFVGdForK09wYXZ5RWNkQ3l4aTJlZG1mZFhFcDE4?=
 =?utf-8?B?U0hHaUs5ejFBbE8rSmNlUy92WWtBdE83RHNTUGJzZWJ0Uk9hdmtsQms1cmJC?=
 =?utf-8?B?cjNrYndzNHh0Ull3czhURG5JTFMvQUU1aDlmbHBmLytGajR6dytIRFAyTFFn?=
 =?utf-8?B?bHRPMDVLdVB3YXJsZ2Z6aEZiZDA2ZWxQeitiaDJxV3pMWU9BQjVOb2dEY3Zy?=
 =?utf-8?B?Sk9OUUNtY3ZzYU5BOEZFa1F1U1AwZFV2c0pjOVdOa1FVOWdjeGNLeElvN1M3?=
 =?utf-8?B?YWp5WHpvN3llenhtcXVkR0FxaTczKzVKZGtUV0ZtaWd1OXVEanljbWNSZDJ4?=
 =?utf-8?B?bzdzUTNQNFVTV01PajBSWERaeUF6R3NqWkp2K2UvajRqTDcvM051aFhBWTQ0?=
 =?utf-8?B?cXExRzQwdTF3M3cxNGVmVzkrMk5pNHZqYlZDUUt4VFBGYzRZRHFvVVBzb29U?=
 =?utf-8?B?Z3h5aVZGQ2YrQTNQczl5NGF0V0lCdG5CNlo2UXhFTjd3eXNVMkQyd1h0UlNI?=
 =?utf-8?B?eFRhN0hBTmVOVHVMUUVyM2FhTThCVE1BUmxjdk1iZCsxcCtyTXRyeTVkYTlv?=
 =?utf-8?B?R0p3K2RodXNqN05jblZ3MlErVEhESTBEVFBYemFsMmlQMitVN3ZLUDRsR2da?=
 =?utf-8?B?cmxISlRZV0ZLYjdrTlF4djUxVnlHN0ZsbjZkSHBRUHczTTZFdGduRmNzRlZN?=
 =?utf-8?B?TEQ3T1VCT05QRGdvZlBHdWhKVy95c3ZHdkY1ZnFVclhvM2Q2b2oySXdwaTdD?=
 =?utf-8?B?ZytYajAySzFqK25uNklPcGZNb2JxeE9aMFNHdUtzOHJhNFh6Mk1tOGtOTHVq?=
 =?utf-8?B?OGt1RXM2VitQYllNUEJvNmFPUEp3NFZ3cnAzRVc5WkJ0MXgxRUQrSE51VUlB?=
 =?utf-8?B?SHNGQU5iYnE5b3VOTDhiRVJlZUo3QnZFalpHVjZXRDNkRXJLY0NmenptL1hZ?=
 =?utf-8?B?dnlnRFo1Sk56WFEzN2tCaHM2a3pVTWthM1IvL3RKTjVYTUtXT2FkWUN0d0pw?=
 =?utf-8?B?amtoNGV0ZG5qUUtiK0lxQUVmSi9ZWHAwanpHeWRNUFpZWHNaMnh4Zk53MmFq?=
 =?utf-8?B?a1pzUVFCKzEwYXJkMnlrR3J3YjZBcDNNSWVBaG1lV3BubW1lZlB3a2ZpU3Jj?=
 =?utf-8?B?YWpFdjllUTRXdnA1bUtYTStKbkNoOGxMaDNqTFB5Y25nNHRnTTh6cnVCV005?=
 =?utf-8?B?aEpaMHdLRnpndTdGeS9JTHFyWWZITFFhNDlFY0tpZ2hLWk5aT0ExbGtJRVMx?=
 =?utf-8?B?WGZVK29NVlFSV3YyWkhqTFV2aU5RdUdDNE4rLzlqVEpsYlVZZ1pPRDdnVTBT?=
 =?utf-8?B?UzhRVlZpejNwNEd5em9iZ2g2RFNMVlpRZFhybHVDRk5mUnllV1R4WE5rZCtF?=
 =?utf-8?B?cHFmVXBqMHlnMFhva0hUbWNmNUVhelNUYUZYSUFTWUUyUVRCYVJaZHNqNVdl?=
 =?utf-8?B?U2c5b09uY1gyU1lXWkNtOHpCRm1vQ0VTRFpObUp4S1JqT241dEd5ZW56MUVr?=
 =?utf-8?B?d3l4R1dPV2M1Y3lZN01Sc2hwZytidFB3Q2ZoeFRkck9tem1oTzlOWTNBODRm?=
 =?utf-8?B?a04vMmxERnRKOFRrK0xjc2x2S0IwWGdxVGxMYkR0Mm9va0l4dG1Wd0k5RXhs?=
 =?utf-8?B?emphQ2R0UHlvVW5YdEYydmRSMzRXUitJdFpzYXJ0ckx2cjBKd0RuREtiSWw1?=
 =?utf-8?B?alQrQlpwakV2cjVRUEh1RE5Ua2VEOHh6bUFtQk9OMkVoc3d6Zk1Qdnk4cVdK?=
 =?utf-8?B?dW9jbjV4SHpKQUZhQ1p3NWtsNDcwVVk1aEZkSjNxVWZQYzRhOHpoTk9ZODhH?=
 =?utf-8?B?SzFvYW1jV04vWjNrRkRqaG1KNjJudzQ5TWdPTE0vQ1ZwaVZBODVYSkJJcitm?=
 =?utf-8?B?bTVpRXd0cUk1NXFsTTlVU2RySG5zQ1R1RWRNRjBkQlMyeElScmxqNm9xejRD?=
 =?utf-8?B?RWpKbkpHZzZqdDZtSkdwcmVIbkx0MndtMlFEM1g0bXBKdWpQQ0kyQXpacDl2?=
 =?utf-8?B?K0dJT0kzUHBEaW40ZkRYSUpBalZGdWZhaHlMbkxNblVWSTZtUFZKM0hmWU92?=
 =?utf-8?Q?3RPXZIE32qv1wTQvIVsnigjJO0mQuw32kQbyLGin8DV01?=
X-MS-Exchange-AntiSpam-MessageData-1: i4G/lmBP0G9SUw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f91c9711-0910-4606-0590-08de74f34ca0
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 04:55:44.5767 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7F5DqoBNDWhdnrqqGM4JR7GliZ3rJCrtMW8wzV+mtaOFKi9Nrehz/KCbW7E+QFEc/ODhDFvZjx93iIz8N7mz+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6406
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
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,ffwll.ch,garyguo.net,protonmail.com,umich.edu,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid]
X-Rspamd-Queue-Id: 39A9E1A0EF2
X-Rspamd-Action: no action

On Thu Feb 26, 2026 at 1:40 PM JST, Alexandre Courbot wrote:
> On Thu Feb 19, 2026 at 4:30 PM JST, Eliot Courtney wrote:
> <snip>
>> @@ -575,6 +579,39 @@ pub(crate) fn send_command<M>(&mut self, bar: &Bar0=
, command: M) -> Result
>>          Ok(())
>>      }
>> =20
>> +    /// Sends `command` to the GSP.
>> +    ///
>> +    /// The command may be split into multiple messages if it is large.
>> +    ///
>> +    /// # Errors
>> +    ///
>> +    /// - `ETIMEDOUT` if space does not become available within the tim=
eout.
>> +    /// - `EIO` if the variable payload requested by the command has no=
t been entirely
>> +    ///   written to by its [`CommandToGsp::init_variable_payload`] met=
hod.
>> +    ///
>> +    /// Error codes returned by the command initializers are propagated=
 as-is.
>> +    pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) ->=
 Result
>> +    where
>> +        M: CommandToGsp,
>> +        Error: From<M::InitError>,
>> +    {
>> +        let mut state =3D SplitState::new(&command)?;
>> +
>> +        self.send_single_command(bar, state.command(command))?;
>
> I think it would be nice to send the actual command (and not the
> `SplitCommand`) when commands don't need to be split. Split commands are
> supposed to be the exception, but the current code makes us use them
> unconditionally.
>
> So something like:
>
>     if command_size(&command) <=3D MAX_CMD_SIZE {
>           self.send_single_command(bar, command)
>       } else {
>       // Split and send the parts
>       ...
>       }
>
> would read better IMHO. You can have a
> `SplitCommand::command_needs_splitting` method if you want to avoid
> comparing against the const in `send_command`, but honestly I think this
> is self-documenting already - you split the command because it is larger
> than the maximum supported size of the queue.
>
> It also would have the benefit of simplifying `SplitState` and
> `SplitCommand` since they wouldn't have to handle the non-split case at
> all. Actually you could just have a method that consumes the command and
> returns a tuple with the `SplitCommand` wrapping it, and its
> continuation records. That way I suspect you also remove the need to
> pass `command` twice.

Mmm or maybe it's not that simple. I'll experiment on the rebased v3
once it it sent, please ignore this comment for now.

