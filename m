Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOR+IFn0pGmcwgUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 03:22:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D25891D2732
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 03:22:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88D4710E1A2;
	Mon,  2 Mar 2026 02:22:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="A0QVXOLJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010024.outbound.protection.outlook.com [52.101.61.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2FFA10E1A2;
 Mon,  2 Mar 2026 02:22:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nrA/izxsGihY+5CKeLUh2IJidjhSt0U996/S868La8qhXGRPGnZnb6dABa31ELDAU0gi5t1XHeyQaLSN/OqUEZotm4JrrJpdFrhPzZERYNysdb3XydJjElBhCoGTbhczJEcz1Jce0iyrmUSaEOqU97f9U0iZ7R9B5pX0FdaUOGWJyoo9UQuSfTrMxySLufciB1QVmMdDdm6hv7KfE7U0aI4hY+iGuE7N/e3fMkEl54elnCBk2PIRGozagiBnjNMQEkIuI+MJd6PRjarEB312Tpk1yXUSAOaTIZ3Z9uU2i1TAl6meyILgzSQ/5YCvPKsaEIcNblL77ic1zbLIpvUO2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oOOevatXhK/ImlyJz9NemYZCNrZFhV10lk3ZBMYDauM=;
 b=wKMknUpCIPNutF62ph46jeGmSxzIhrWxlus6Enk+0xVHtOd8Ksq5PUiGgA7z1EDtyANr2e05C0+k6fyNRrrQyGlb/FJJPOmRCPbGgPyz+Dg33RhqegVRy7mKSdwpyiqnR0CF9b48/q4yj6SK6nhiLHiBXJjGHwOg7QTF34wfVtG8/zmo/R7TAPy2S/1AuHBz89wWVoK8yNPjqbUfHl0hbgWLkeUjQxGe+FREEBemZ+lWzzi7eFUzrxQfX2Ar3naLgF2AXhWxaBbZ+XScBSEB6LaNE7xHc9pTupiXVp3cKHXlX8a2InfetzPs9LN2tmdb92I4ji8ycHx6e+2nENsX7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oOOevatXhK/ImlyJz9NemYZCNrZFhV10lk3ZBMYDauM=;
 b=A0QVXOLJPW1c6d3srf7WoXpXflaW3bF2d3cjZRSKY72nxgkgY78lokixM3EtRwAIMMvK4t+eS5LFkKoyruIA7JE/OfMI+rXAkmO1AkvXBw643P+o/CVlns7Re9Sq6Rl49OhfHdrOhkpGxc6V3hUoMvO6ZpdVZbSSgPSZw+uRNWr81HbkfLsNnWFhqNrAmfjMJhfvmXgJnjqiq0vESpN5kDNwClTjBQ+l4GkPjFIadvzJycR/poC5lQ/ENFBRZRif8+x33K5C45+Kbw9OSW5xCCI0Wokddf5TDN4qUKCR3WIpeFdoqvbu+pH7fDw813wEdadIgcqORjPTGHaep61/0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by SA1PR12MB9469.namprd12.prod.outlook.com (2603:10b6:806:45a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 02:22:08 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.015; Mon, 2 Mar 2026
 02:22:08 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 11:22:04 +0900
Message-Id: <DGRXSDSDMUOI.31863U05DR3VA@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Alexandre Courbot" <acourbot@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Benno
 Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>
Cc: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/4] gpu: nova-core: gsp: add sync and async command
 queue API to `Cmdq`
From: "Eliot Courtney" <ecourtney@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260226-cmdq-locking-v2-0-c7e16a6d5885@nvidia.com>
 <20260226-cmdq-locking-v2-2-c7e16a6d5885@nvidia.com>
 <a3b7a5c3-9689-4700-981e-d94bd2b5091d@nvidia.com>
In-Reply-To: <a3b7a5c3-9689-4700-981e-d94bd2b5091d@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0046.jpnprd01.prod.outlook.com
 (2603:1096:405:372::18) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|SA1PR12MB9469:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ad2ae64-adde-4a5c-5e4a-08de78028124
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|7416014|376014|366016; 
X-Microsoft-Antispam-Message-Info: CgAR9yk59Tyi1j2MG0HNQ/SjRNT5VIvjQIEll3FWMAwQJMF0+gs0kvBzrjPC7X3JR/c+xkHBOZxIjJsgk5MmKELu1PZ+8k2tf1v0vVjTPPUwd3aULREK/Fjkfs53VBIBMs7kCxzlR0+/DYQJZaw6gm/eAnpcv5QFMzHTG874RxQ7aLnts8abPVIEF3+orln63g8qmoh3ZTzrKvptqlNzYIYKsqg/0AQa3V9Oz3ykfFDX0gVtlS+4s6Kn3RXeuvOgJ4cPNshPxZ/0rjvklxKjtO49TqQURKYZ8M3QLVWGLwhTNnaj36M0DqN/CGBivHaSng6HX8ElHLVdkw/ZJ2iZkcSBiB9HAZI0UAQunMgneiglTkstWVKOjvkZgZ9nCRq8VdclfjGrqBc7F9YOGcZNo9DsSOo/PGZamMIzipndlMiqlPJQ0viiJb4j6KHL9mkm1dhLzsVqlMR8Lss25JitDibGNT0b1AqlBCyhOh06u+adFXVqcVWbmU7kVMFG2HgzHCmpDuH94fCmUdPbikAwTGNbhYCQDFUA66lCGjhjwbrhk2v5NIZR8VZH1WnikgiTMxJ4qTM7hX2xLxcDZTcd+zrBj0Oj3Uth17VaV1MjQ6+j20lcPu5hgb4FAZZt6dOR8dmj7PJiLLLnkD3Q3unMPNlviPx9bhEKhmuSrvo1JbmGM00tD8ZIWbtTTw6ihIW9G8d51Wxhi16DAn+axmRpC3vnBn+lj4iYUMou9Z79EXA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVlFblYyTkcyUGhqaEdLMnB0bjlHa0ZDNHhlY1JoMHRNVThqcDdUZnVueGxs?=
 =?utf-8?B?RlA4M0Y5QmZDRVdPVGxDSHJjYzloMWdUbkdGZmh1dEZVcHQxOXdoQ0srbHpZ?=
 =?utf-8?B?cC9tQnd6cmRjTTRhWUNZYmRWQm9IL3dMZTVIejMraWt1UlpCYW4rQXQvYmFJ?=
 =?utf-8?B?SkN5Z0ZJQzVtM2VjeDhXOVlzeDFhWWhvLytpZ3ZvbUc3NlhMUEp2cmpNQlRL?=
 =?utf-8?B?cmRFa1hKZ2dVcURGc2pNTC9rc21YWnUvSkw5clgyVUtaSzcwbHFha1ZmNGI5?=
 =?utf-8?B?WUp1L2JtajN2QVByM01LTmFFNTNOT2ExbGx3QUxMWmJPYjZFOHVRTFdvZWZ0?=
 =?utf-8?B?bFBnbVppbTFtcitzMlJoMDhFbk5YbVU3L2ZLdFF0MUZCQUozYzNsdGc3eHp0?=
 =?utf-8?B?SlZhaURzR0tTTndIQlJ6VTBITGpQeDk4OUp1bFlBWU5nZnUwR2dYMGhCa01h?=
 =?utf-8?B?UTFnTlJyd0lhaFl3SHZiZUIrUm5ZRkN5QmpEV3F6eWZ4Q25yL1p0R0JkWW5o?=
 =?utf-8?B?RkhncHlUSVJRSDVraGxZSGIzRjloTzRIc0JLWVdYVVk3d2FRdGlFZzJVbjdF?=
 =?utf-8?B?cGkwSzA4K0paekpTRGQ2V0YwWXhSZEQ2M3dneHRvbElYZXI3S0ZLaXU2K1FX?=
 =?utf-8?B?Q1RIQ0N5c2taK3F2L1RXb2V6THlGUFA3MUtKL0FiYzJkb0R4cC9Vb2svKytR?=
 =?utf-8?B?SFMvdEJjUG1RUHUzVUYxT09kbnQ4Syt1cTRHaDE5WE02QjNaVFJwejJNTXlC?=
 =?utf-8?B?cjBFYXhyOXErcHQzOTJ1NjVYRzkxd0wzaTlZWDFVUWpTMUZCOEdKUnI4anJq?=
 =?utf-8?B?aFRwVFF5RzF1SGRYY3ZQM1hZR0JaUTA4VHRBT0xaRCtDNDJkQWM4OUpHdGN3?=
 =?utf-8?B?MmFUZmtGalJSZDNWelhRcU9YNEdjSDNZTXRJcGdTM0N0MEp5SFlBQ0dPYzBu?=
 =?utf-8?B?bHpXRUVtZ1o5OGYwSUZrZ3RhclpoMGtTNnN1SUVpaGFnNlkrOWdkcGg4Q3Z2?=
 =?utf-8?B?eGQ2dmNOUUhTd2RUazc3a0NoS0tOaGFLWXNZVFArcE4zc0RrZ2RnSVBuSUFs?=
 =?utf-8?B?ei9qcUIvZnZyTEtuNnprQk9DbkxHK3pRWHhoamsvODFuRHdEMk1ZQ1kvL0VH?=
 =?utf-8?B?MmF5WXAyK09keHA3RHd2WWFxWm9TZFcyb215em5nc3hmekdmWUhKaEZxdENP?=
 =?utf-8?B?ZjNzbkVIb1d4NzBiR3VhMW5wZE4vRUxEMkhYd0duTHlJY25kNm9wTHAvejND?=
 =?utf-8?B?UkNhUkt2QVZpdmNsbG9mTTJ2MG1BTE5tVjRxc3hxemZjbUUxQXhnR2E0dFVT?=
 =?utf-8?B?Q0x5RU5SU1hCRG84VjQ4WUU5cnBJQ053WnV2b0w5TEVVOEh1SEhWSHlwdCt0?=
 =?utf-8?B?TEwrUHNSRi8vbXIzUVBseG8wbS9sdURuVyt1WnF0N3l1cnNmTENJMkUwR1Yy?=
 =?utf-8?B?YXV5eW9ENHdoeHBQR3JUNTFZWG00c09KVlo5Nm84UmZDbkpuNld1MzFQTngx?=
 =?utf-8?B?Ri9yTWNqUTAwVFp2aHc3UmdLc0JjT01ucThmL3NsSm12QVhxTWJoeDg2SWhk?=
 =?utf-8?B?QTFkckRpV0tQZmUrVFBFeEkvUU9JZ3BWUUxXR1B1S2dVMnFpaG9oRURTcjBN?=
 =?utf-8?B?dmtUMkRIWWJwNytwaFJCNzVVZ29aQjlFSXU4NFlPWDk2bkorRlNrcCt0Um1Q?=
 =?utf-8?B?M2RFZ1J0Nng2aGR2T21XN0RyVHJJek5ROGhVMzFZVkVBMVgwSHd0UjRGY2NP?=
 =?utf-8?B?Zk11Ym9vOWl2bVNEbUV4NlBoV01POVdYcWxkb1I3cWNwamdBU3o2SXNhNjhY?=
 =?utf-8?B?M0VCbXNaeVY1MHllbVlTMzlxK1d6SUlnZ0RrSlM1a0NyYVZldFFDMlpUdW9i?=
 =?utf-8?B?ajVRMzMxbUMvZ0hTSXlLS2YyREtIM0w3M1ZjWXdyZXROWFpFTU8yZXQrV0Z0?=
 =?utf-8?B?MEpmeHVlUjNsdmhTbHR1Yk1zeG9TUDBLa1NIQ1JCaXVxaGwwdWp0aVhVNFpv?=
 =?utf-8?B?UUdNcmhUYzlvcmsvU1RHQlVGcVFWbERNU2hOV2x1UG9DKzhOUHBTM0tTRXR1?=
 =?utf-8?B?V2swZWRyVlRBSHZZajA0dm1BbE8yRGFDVkpDa1J6bU5WMUxucHdpd2tUM1c4?=
 =?utf-8?B?c2pVb0Q4d3VWM3BDUmc5bzQ4NXlEK20vY3U2RnJrSzBEaDJOWUVJZFBPMmkw?=
 =?utf-8?B?dzZwMFU1dUhVMGY2VHVOS3JBMnJyOE1IMmlocmZ2eDJuOTdkWGhFYVJ3SUYv?=
 =?utf-8?B?MHcwQ2YxRjNudFg1UldjMkVkbG1ZYVIvQS85TXYrcEhpVHp2VGZSbjdUUXNL?=
 =?utf-8?B?VVhJWCs4MDIxcXZJdjJycWJkNk92OWZ6SGJ2ZitsWFpZTVFDekhwRHFSN3Bq?=
 =?utf-8?Q?gFMz7K76hCSB6ld8Gp4WDvxqZs/UMlpPfcP9rEqynFAqZ?=
X-MS-Exchange-AntiSpam-MessageData-1: OBCZe1YBXcmiWg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ad2ae64-adde-4a5c-5e4a-08de78028124
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 02:22:08.6186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IjymIPOM0keVTPP40K85b3exzbKNozMV6SUC5Yr8JEWytt7gqaC/mXfQJRp3J9FIoGwYoyY/G79KyZJbr0v/fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9469
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[nvidia.com,kernel.org,google.com,gmail.com,ffwll.ch,garyguo.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid]
X-Rspamd-Queue-Id: D25891D2732
X-Rspamd-Action: no action

On Sat Feb 28, 2026 at 3:11 PM JST, John Hubbard wrote:
> On 2/26/26 7:50 AM, Eliot Courtney wrote:
>> Add sync and async command queue API and the type infrastructure to know
>> what reply is expected from each `CommandToGsp`.
>>=20
>> Use a marker type `NoReply` which does not implement `MessageFromGsp` to
>> mark async commands which don't expect a response.
>>=20
> ...
>> +    /// Type of the reply expected from the GSP, or [`NoReply`] for asy=
nc commands.
>
> Hi Eliot,
>
> The following does not need to hold up your patchset, but I want
> to bring it up somewhere just to work through it.
>
> The sync/async naming that GSP RM uses is a little bit "off". I
> spent some time discussing it with them, and the problem is that
> sync/async is a concept that is somewhat independent of whether
> a reply is expected. Usually, sync means a blocking wait for a
> response, which is not necessarily required in all case with
> GSP RM calls.
>
> The naming would be better here if it reflected simply that
> a response is expected, or not. I don't have great names for
> that, but "fire and forget" works well for what we have so
> far called "async". So we could do create a convention in which
> no annotation means that the API has a response that will come
> back, and some abbreviated for of "fire and forget" or "one way"
> added to the function name would mean that no response is
> expected.
>
> Again, I don't think this has to happen here, because we can
> go through and rename later, no problem there. But when I saw
> the sync/asynch and remembered the very recent discussion, I
> figured I'd better post something about it.
>
> And yes, I started us off in the wrong direction with the
> IS_ASYNCH thing! haha
>
> thanks,

Hi John,

I totally agree and was hoping that someone would have a good suggestion
for this. I discussed this exact thing with Alex before posting this
too. So if you have any naming suggestions would love to hear them.

As you say, sync and async are orthogonal to reply vs no reply. I think
we have several ideas here actually:
- blocking vs non-blocking
- reply vs no-reply
- wait for reply vs don't wait for reply (practically equivalent to
  blocking vs non-blocking here, but conceptually the send could also be
  blocking vs non-blocking)

We should also be careful with conflating waiting for the reply vs not
having a reply. So `send_without_waiting_for_reply` is definitely
confusing to me, because there may be a reply that we just don't wait
for.

Some ideas:
- send_command_with_reply + send_command_without_reply
  - Maybe non-obvious that this blocks for send_command_with_reply.
- send_and_wait_for_reply + send_no_reply
  - More obvious that it blocks and gets the reply.
  - Should be obvious from context that you are sending a command
    anyway.

Personally I think it's nice to keep a convention of keeping it
mostly obvious which functions block/wait. (e.g. we already have
wait_for_msg in cmdq.rs).

For lack of a better idea  i suggest send_and_wait_for_reply +
send_no_reply for now.
