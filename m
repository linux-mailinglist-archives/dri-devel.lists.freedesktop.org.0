Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id u9TzEJhRpmkbOAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 04:12:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9729A1E858C
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 04:12:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F8C110E058;
	Tue,  3 Mar 2026 03:12:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MyA79C1l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013060.outbound.protection.outlook.com
 [40.107.201.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EA7710E058;
 Tue,  3 Mar 2026 03:12:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fxj72XiOA1chEiZHZxUQCrCfBG+Mes1SvHxpDXJXuQv8xMHuQSA5zcDOh5lhoJ5AdtNGPR68/CZql41SrpPeXy0190ROG/FUC3IRzIMVr0zbb0+e+Vi4oDeMI9h/9oRkAkKUVlcIAi8J1FSYS0352x3kii2+2g7VV7O+cqYGjzUf6nlrVGwG/6gJo8bcqS4EjkIMaJnIwdaGpPwXwCx+Z15gOIjtwuamS3Qh7O0ISSOvreW4Kdqw0fwtrIBdHBPSbvOOMRLHbTO1xdga6NkP69G891M77f/epyAahoGcRPBA95JJTYCVUfUn1sRS2D8g8T7O4b7cnhUbYhORGMpSVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dwSyqF2tZYlu0zAcInQTLx4ItpntWb0x1E4mHG6xmJc=;
 b=OAXpMovjQkP9/G7INn/BC8ifqKR0TpFWongm2uzKYS5okbzTm1D+hb1xXXFpnE2MFly0yMet58+ks1UukUXi5Xd4cFKvAl9KeqZTLRNiT/nC9XxsG/RZthmTOj62klnjlV58mbCFJIDU5gxhmGhBB+V8F2Rl81uCrnNglNmH40eQxwPZLsFIXtT5KMIwDzLmdpzOlXQRPZ9umOIjB5eSe/WQ2xXGpBU/4EXI0YeZbE5W7+1YAVOpEieRJsstNevEGN4gh1rsGAgvyPKbaHvKVcEhBITzPZWrQZ/5iY2gDsmOf/tNP9jhLrkCcTXhvR553Yua2NA8SnhXe2OpHOFZCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dwSyqF2tZYlu0zAcInQTLx4ItpntWb0x1E4mHG6xmJc=;
 b=MyA79C1lUYaB3oI9HIWnRmThuZBI9mBcqveGp5oXgEJX1CaILpYkLRA19N5Iu263jJ6HyvebQie4vlYo0fXLfcSsA2epnInjQesfvc8/LgGGNiVPbgvnrQwVNpgiX3dtY6cCeEbqtqQqBbedszcTuRGb4MUzxNXUm39ETWeT9tJKlU/qjJtGhoTaXDxVVdKFExLs04GD+AfP9qOe4fFQyVzFT/V4dLwWkga+ja/yDezw79TctDY8APPOFx1Ns0SegIc83DLExKvHUMTMBmKeo015kEJATauOD5+YP31GV48Kg+ue3lLaZECWomoibbzL63CswoXO2RnFjICHslYemg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by CY8PR12MB8067.namprd12.prod.outlook.com (2603:10b6:930:74::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Tue, 3 Mar
 2026 03:12:12 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.015; Tue, 3 Mar 2026
 03:12:12 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 12:12:09 +0900
Message-Id: <DGSTH9S846KJ.3TOQUG7TP1U0U@nvidia.com>
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>
Cc: "Zhi Wang" <zhiw@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v4 7/9] gpu: nova-core: gsp: add command_size helper
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260302-cmdq-continuation-v4-0-c011f15aad58@nvidia.com>
 <20260302-cmdq-continuation-v4-7-c011f15aad58@nvidia.com>
 <DGSD3NICC14Q.9NRO7N4YCRAH@garyguo.net>
In-Reply-To: <DGSD3NICC14Q.9NRO7N4YCRAH@garyguo.net>
X-ClientProxiedBy: BYAPR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::24) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|CY8PR12MB8067:EE_
X-MS-Office365-Filtering-Correlation-Id: ff31e3f8-bff9-4c11-3bf4-08de78d2aa0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: 0oIPwBiWfh4+2EZTdBZmLabGonZaVVNv+JXWeYPXPuI63Z249nFuLqSPr/DetaV8CH9edAZXnk7a0GlsGBI4jXvikRjVGpv3FNtK5357HPlU9GYGpUhh0NJBNDXphdKP/WZe3CLvJABMcTr7mNdCPPkIoU+UH9H0q/hpbyNCTG6Dsgc8CsKmpok7ApdQNEyyi4agRtjLZcNAPvvfNQGSnElj3QZFLTK1joVpoY5QwO0youIUUl8DF5K4wQODVSS4cSTkX9oSVVi1Dy3jS14UsaWLdhHwXsble/Ev4vtAw6lPcPg6L1Etg92OOdItyAMDMEvCw1oEjQQRJHZYIsu+ffr+MOW8XxHam6uYB9LejUDLW04lzNXpcjybEFhpEcHupNOGDqGrZiZMz2qfMiLLuG0SGgcFyvGqmBYBjjbA8Wc23dHCPNG+Vffy+vuCBK8TMr121MuxygpeFV7agyXCSHsILzpteFSkUgwx2J+oBGTKRtYGvHMGt1XqXANrmKyaRUZZ21uZqr/BChVV99PYPNqAgkSsBHLXPug5VHbpTb7ILIvgYczB9Ajg9q+fiGSA0FPYUalkmxxu15EmhqkMwRFdFR6ZApZ+27yemJyR19GBUdl7IgPew32CKXp9V3tU601IAIqINhDg/PN8Xodhsp0WhMDXu/iNE/mcgY+rX6UjYt9ZTRF/uCncZWo0Svny5aLHZ5fRU2/plST6beoNVfGUtwl1Dm1UEi7JI3BW12UCDP1N0Lo/0T0EJi3O9TOF/0ksTtCrhwYBSsKfT6BxuDx0g8W3POMmceGI9B3z1b4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SlhpNU4rMDFDZ01sdUlhb1pxMDBOekI1U0wxdDFGQXA0RU9LQ3gveCt6L1RG?=
 =?utf-8?B?czVqa2pxb0lPY0o0Ni9GMzhZSi9tTUdmcGZPbmFRc01PcVl0dld6aTVrZ3VZ?=
 =?utf-8?B?ZjRLUWN3NlBzYkRkcy8vcVNGRjNuWU1WYlJJcUowSzVyS3ZHdWhwWEhYS01w?=
 =?utf-8?B?VGdIUitrM1ZyUFdSb1FVZ1JjZ0pIMkxoSG1DcTE0VVhWMmc1WFVQbnl1bUE1?=
 =?utf-8?B?cHRQUjZtcU4zbzFGKzByREZCZVozT0R2TVlmYVk1a2VLakdjeXYwZ2t3WnBG?=
 =?utf-8?B?Uy9wRDBVRUNqY0lLK2d1NU9vbzMrY3FIQVNsMmNxQzB5bDBENEErNVZ3NE9R?=
 =?utf-8?B?UldUYzY1Y2Q1SjZlT05LVEZKYVoyNFFkTDYzWWo0TzczdjhlVUlhaDNlQVc0?=
 =?utf-8?B?eEo3em9Sc1lubnJrMG1SaDJJb0x1S3lQcnkzS2FqSlpGZkFYcmZMdktnMzNh?=
 =?utf-8?B?Z0pUd25qeG0rT1kyM0NmNmxYZTN3YTdmUzBhcnRLcHI0N04zWlVLZGg4QU5x?=
 =?utf-8?B?UTFSTWlkSzZCNXZ5VjRHQ1F2bkJ3NURYcDdjOG5NbEVxdFU4ck9oZ0pteUd5?=
 =?utf-8?B?ZGF1ZE51K2xlem5zVkNweXBvZDRoNVprOEZpZi9Pdklnaklrc3E3U0pXSUtG?=
 =?utf-8?B?MEFVY2dUSGNGT2JMb1ZpNjZRS292ZGxtNWp5VzV3a0ZjTUJxL1dqYVJZZ0tJ?=
 =?utf-8?B?Wjc4cmFjRDRPOGIxTVpGV0ZsdCs4YjV1U3ZyWUFGMlRyMkRXM2VxZk42b3Fp?=
 =?utf-8?B?Qk9icDhZK0EwM0RjcnFYTFVPZmtXbVdoWWt5U2dyNDRYSUVJNGw0K2QzaHoy?=
 =?utf-8?B?aXcxVmxHcTZBVTZVVkxsL2FjQS9GMnF3eDlCdFd2NkxYT3pkSEM4WW1Fei9w?=
 =?utf-8?B?MW5xemtML0xwZHNSMjJDODVUaEhCTEE1QlFkQzhSOURHQmtNeW15S3A4Z1F3?=
 =?utf-8?B?ZGM4ZHphaGMvZGgxMWlpNkhVbVJlSjZiZlRQUEh5Y2xhSXU1UDgyV0tSc0Y3?=
 =?utf-8?B?WEtXWDNzdEUrRk82RGVoZU1vU1IxZytobUxadHQxSHpVK214MDdKa0xveWdo?=
 =?utf-8?B?TnE5cWFQTTZYMm51Wjd3Q3luSnZXUzRRTnVuQnhQY3p1WTNHTW1sbVI1R3Bh?=
 =?utf-8?B?Q2h0by93SGpiTWFQeTZwVHpybTBpaHB6NEhKaFBKWG1PNmZ1YzlOeXdROHFw?=
 =?utf-8?B?ZXNKUCtiQm8yYzNZSWUzQVhvT0xMemt1MzBzWmRBL0pVZjRsZld2dk9vc3Qr?=
 =?utf-8?B?R2ExU0praTRMWUhuQzg0UnF0eDdwK2c4MExzUmxZRWpFWHR1VHR5dHp6Rmpo?=
 =?utf-8?B?eCt0TXQzNCsvU1JMaDAxekRHN2V6cHFqdVArZlZUL1RDdlZUUWhMOVhHN1kx?=
 =?utf-8?B?RWxSbS9XQm5uODBsM3YyQ0s3WFBqQ2c1WkJuMHh1ZUJERWtGMUpuWE4wK1hB?=
 =?utf-8?B?SUlZc3JpQzZzRDR5RUsxamMwRld2cmtkZmdxVWwrOUhXT3BGVTNoK3BNc09D?=
 =?utf-8?B?cFVmTUJOdXBrY213Wm12SjEvK3V5YnBXcldFNVI3ZVNQbjdkWDFxbGR5MDFm?=
 =?utf-8?B?bHFZVndaYk03djJsYXpXNUt5RDBWMS9CaVJXbk84WUNLcndBZExxaUw1NHFZ?=
 =?utf-8?B?bUdZK0V1MmpFekpMK2drKzRzZ0c4b21XZDdSbG1BdC85Q1lBSGZKRldPdjRN?=
 =?utf-8?B?R3k3ZWtvMjAzWlNyaWlSdGpLZithQ2lRZ3FQalRyZGhOOWZrVWU3cUdSRVpR?=
 =?utf-8?B?TGZYWEQyYlBoZjVuczlHZW1pZ1pIc2dQSWJTalRONWYwNWIwSU45RjdPMGhM?=
 =?utf-8?B?UFViTW5MelZmeW9KSnY4ZWJvSjVhVEZpTW1CN1NRNEUvaWFXWnVNQXVXaWsw?=
 =?utf-8?B?SGhqbVlLVC91UmRQM1QrWE5OeFllTlIxdVU3Q1Y3NXlwNHJmNWg4QjZXNEVh?=
 =?utf-8?B?OHE0TUJ2bUI5Z0dWM2ZrMFhhTzJ3aG1HK2MyYXEreVdwQU9iVjh3YmhtczQ1?=
 =?utf-8?B?ZHEwSlU3OUlpNkpsMzFjQ2w4NHJQZk9lS2Fyc05MTU1sSGxHeFV5N3VsbDZr?=
 =?utf-8?B?SkpBSVJFcmFTSnQzMDN1c2d2UzVSMDF1WmI4NXJQVlRRVUVTbjRGajdOYWdh?=
 =?utf-8?B?WFVPSXdLb1dzd0JTSXhmQkpGMXFFN1I0anZEWGV3MEkyOWZtdFJGbnRZcGpq?=
 =?utf-8?B?NDdGSjBySC85WDBqK0RTUW1teWtZaW9BendaamQyZ1BJR1lZTThYQVhMRE1v?=
 =?utf-8?B?NFBRU1JDZ1V6YTlHREtuUGZoVFh3QmZYdkExdys1ODVaMUlQMWFYalFQM2F1?=
 =?utf-8?B?cmhNVmh5aVNqeGp0K2lFbzNreVZpdUwzVzBRNWc0d0R6TUF5WHlLbmpJc2N1?=
 =?utf-8?Q?XPVX4qAxZt4gS0W3sL+qCc31AAjh/yY/tErC90oskSqM0?=
X-MS-Exchange-AntiSpam-MessageData-1: p8RVfhym2BXkYg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff31e3f8-bff9-4c11-3bf4-08de78d2aa0a
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 03:12:12.5701 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sLN9dmYuJnamuWRs1M/RML691gjoiBmlE1W2pI56TsGaKxrdSqJ7RF2vNV4FC02SI4Dp9PI2Ub+cSpO9p41mdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8067
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
X-Rspamd-Queue-Id: 9729A1E858C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[garyguo.net,nvidia.com,kernel.org,google.com,gmail.com,ffwll.ch,protonmail.com,umich.edu];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Action: no action

On Mon Mar 2, 2026 at 11:22 PM JST, Gary Guo wrote:
> On Mon Mar 2, 2026 at 11:42 AM GMT, Eliot Courtney wrote:
>> Add a helper function which computes the size of a command.
>>
>> Tested-by: Zhi Wang <zhiw@nvidia.com>
>> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/gsp/cmdq.rs | 11 ++++++++++-
>>  1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/g=
sp/cmdq.rs
>> index 9f74f0898d90..4a663a5b3437 100644
>> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
>> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
>> @@ -450,6 +450,15 @@ struct GspMessage<'a> {
>>      contents: (&'a [u8], &'a [u8]),
>>  }
>> =20
>> +/// Computes the total size of the command (including its variable-leng=
th payload) without the
>> +/// [`GspMsgElement`] header.
>> +fn command_size<M>(command: &M) -> usize
>> +where
>> +    M: CommandToGsp,
>> +{
>> +    size_of::<M::Command>() + command.variable_payload_len()
>> +}
>> +
>
> This could just a provided method on `CommandToGsp`?

I discussed this with Alex before[1] and my idea was that it's odd to
add it as a default trait method since implementors could override it
when they really shouldn't be able to, since it needs to agree with the
size of the command and the variable payload length.

WDYT? Is there a clear convention of doing this over the kernel? It just
feels odd to me although I agree it's useful. Would be perfect if there
was an easy way to prevent it from being overridden.

[1]: https://lore.kernel.org/all/DGHSGO2E0U9F.2M8MOSKBNA9JY@nvidia.com

