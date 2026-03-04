Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id jNzzD6qip2m4iwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 04:10:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 988A31FA37C
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 04:10:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CC4110E0DE;
	Wed,  4 Mar 2026 03:10:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="QSRJEGxD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011042.outbound.protection.outlook.com [52.101.57.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79BBD10E0DE;
 Wed,  4 Mar 2026 03:10:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q5koqflrXR0DhHs+3sQu20fTRkrwidssN3cIvMVLIdMma3hFIYdlg7Qu8poxNjTLCfVOgEcdinDTDofgqz50aDqUj0I6zq36Ey9JngZim9hs5wQrQTSD1VHzavRoAXfq7yF15YcyPAa2scHX20IyC7ciN77K/W4cfp3GsRMW1aD0RZ0qc4pjjWQ0xH0NV09STohtK5RPk5bc6Q7xKD52fPEz2GxfuboauDwG0MC2TTvasA8edTsEAr0jXCLludUg6deW2G2kghns2PF4JGtVdxeky5RSeyajFTk4619CgPUrvblGufjSCO7vpF9KU661tBXqWLRncisphQ+ZU4BW+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DqoNz3abuTG70pQr00srstsF0Jc3y7QiCCDniVEY3/g=;
 b=VWVqWMgVE09zuKCPre55rZReTK4kqnh4M+77YXECug0el1bOl6j7OJurJ3WlnKzMYArxuGjzQDMzAi5zBqimPQgSJt1pJWYx3PoOCoOBmTNZJCXqbK+iYzGZjwvrXZoVl4TlR2UlWHDYQvoXj0w9/1YdLIb1T2t003triCPJqhdVZtnGBLSj4m71YBDP+wkokjLiW509WWJ/3/7zRBYi59h0WlhOCoGhiqEzKpHATRlzI0JZAMsPh1TetlakPTqNDL12VO3h6paHOUQzbZFEbdXON92RGclcNWqfRAUkWj8Bk1yG4ehqJQsrSxSfLJnH+9kdbXzn8E5zzAYJBV55FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DqoNz3abuTG70pQr00srstsF0Jc3y7QiCCDniVEY3/g=;
 b=QSRJEGxD/qz6GlykCr77v70p+s/OPIW+zbyfZ5mKDT387dCqLg4emIhEHl4PWFDc0ZNyd0Jf9P6y4eBKdUSZ04Ffpa+tK9Xzd67n3z4xa5JkhmERYmgqGSNXR1htlvpSlq7DbXfS+CCd49HiPjaHlfWhD0oODjS9mODeVn2CyroDG/6Qg20HSMgBB0diXHf2pJXBuTe92DQHJYlr+1w2XNlgMH8ZTZDJ5OrzgKZdPPLI9CM8z5375+bNpL5o72JOHF809MxFY7RFuOuSxv3XERbav/jJPyf4iS+cMI3qkMmxIRbp2cedttN+aiO81YQLXu/lEQjWuBqHEFX8n6Glvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by CH3PR12MB8354.namprd12.prod.outlook.com (2603:10b6:610:12f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 03:10:22 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 03:10:22 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Mar 2026 12:10:18 +0900
Message-Id: <DGTO2EIVVL2C.26IA2WATTEA9U@nvidia.com>
Subject: Re: [PATCH v5 7/9] gpu: nova-core: gsp: add `size_in_bytes` helper
 to `CommandToGsp`
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Zhi Wang" <zhiw@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260304-cmdq-continuation-v5-0-3f19d759ed93@nvidia.com>
 <20260304-cmdq-continuation-v5-7-3f19d759ed93@nvidia.com>
 <DGTNPPB7GUP0.KDZGQ9AHPOG2@nvidia.com>
In-Reply-To: <DGTNPPB7GUP0.KDZGQ9AHPOG2@nvidia.com>
X-ClientProxiedBy: TYCP286CA0103.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::16) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|CH3PR12MB8354:EE_
X-MS-Office365-Filtering-Correlation-Id: 7942f4df-91d3-4d47-23a7-08de799b92c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|10070799003|366016; 
X-Microsoft-Antispam-Message-Info: F8WDqXUaEXLeN7Hhd1g3vLu3YViydREPM8nnLHwRsRHl97rIS63lKm1xJZTq4Onyu+xkvnDZ6gngcfr3disxUAPLuBitlXtIq6eBi38QblnRxU4cPYdy36ieWi3sq2rw7sTssGEhsgyCwUebhQV8p3yKxjbj9cssGA7L2GsaBV2joN+28WowCH6eWX003j/fvrM60ENLiooXZ1SEKyQyItE8k6jQg8pY62yLQIVyZeKoUXOyu9jE4UXQyg9CAYFJrz3lWhI52j9brltuTGwHrewTC/wt+qa2y+5ZXa21Vj+auA6+kviZYUZ5hiaoOI1kSnq9WqBHmjd1/DoNucaPpMGpV9asCTutJWBFB50DIxFpIrbeDvilMy/tBU3ovTTlFCxTM/KHCKHYAIT/SVY3KZTB3v24oxBGP4eHsjZPoEb5PHO+BkU+z8DZ7kEnmXCyLzYpRm0kzX3dBIQ/EMyfJHW60HxG2jGNeS5ITX543R46g42SVVACdp+UQ0TWds0WYIkcE40AZGy2tLqp5W5PCDzZTk7Vymv2kAHyNrt1Wlfjsv34UF47t7U0nAVCRJUxvaKE4p9JeG4jKIcqjTYvtUSyvxhI/72xYgxF5qgOyl63k1dhEMVeaWrpcT+qH76LuGhRctbRunMKg6DMbjWcAitUljpFw45Qr/SLHoSAEsifigtNHzujOlSbIIdN9pR0D92oCE4s9DGnyuIHKf+cKfV9C2IfeIS61rZYuDWCYIg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(10070799003)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWxnVmwzT05yajlDT3FtbUNtUXp3U0VqekFjUHE5c0dPdFdWaFdHNE05cU5j?=
 =?utf-8?B?bko3dzlBbXhZWGNSNTUvNWVmMHZRSVFWSnBxTVYrbTJSd3pwNVVHNm0vaVky?=
 =?utf-8?B?SWZaQzJHK0F4ZXBWRE4zQlJlem9ycVdTU1FnT3JraXZyYkI4U05PSW9IbGhF?=
 =?utf-8?B?YXZ6T0NNUG1mY1lYRk95a3dVWXRISFd3cXJ4alhtNXdSZElsZVFpdXp6TXlQ?=
 =?utf-8?B?RzRTMHJnbGc4WlZoRU9rUXFIc21wdWRFQ3JRZzRYbkVTbXc5RmU3cTl0MTJH?=
 =?utf-8?B?NzRPTVJTY3E0bE8xZTRVSlRwYnJWS3k2bUFTbHFKYXhVSFplbktwM21kbVhB?=
 =?utf-8?B?QUR2VTI1TDh2SFFHVEpXbHB2NzhiWHZjSU0zNnZMY3ZJeHc0Rmgza3o5NDFz?=
 =?utf-8?B?NmxqM3cya1pkRUF2M29wMEhVa3N4ZmM5ZXJ2c1gwK1AzeFN6d0Z5NEJpWmVp?=
 =?utf-8?B?Z3plRFN5S1ZPdkNSTG1XeFMwVktxNzhvaFRsMkQ1RjJsekdtRGFIcUJBTEFk?=
 =?utf-8?B?RVJ3K052ZHdaclpMVi96RXU0SHdKekszU2lDTXFQa05PN3dmOVVKSWtteDhv?=
 =?utf-8?B?UldhczQrVEFhQldiWW1Dc1Zkb0JJQWZMcmNrY1A4TnZWaFVMZEpXMGZTa2Mv?=
 =?utf-8?B?VzE3QzQybE1jRHp6L1RmTkkvZlpFWURUR3hKcDJUZloyc1FxY0YwM20rWG5h?=
 =?utf-8?B?WTgzQlZjYXVxdmh1WHc1akR6WUZ0eG1wblJSUU1hVVVvdFhYTFdMbExHdjQw?=
 =?utf-8?B?MFNUSnQzV0g5dC90SUpVekNZNjRycGVwbk9HSTVPRGcyZSthbmNBMzIxd3dw?=
 =?utf-8?B?NzNjOGRWN2wxSzQvMXpnT3p4bW5YRm01T1BuRUJ6SUlIRjJiano4SkJGdys0?=
 =?utf-8?B?MWZ6L3Fic2JrdFZlcWhyWFlJVFNLdkk1VXhxSXVKWkdIMVlWdWsyYmRHaWhF?=
 =?utf-8?B?ZWdSdVdDZFY3cjRTdHovcU8yT2RDdEpYUDhNeGc5RkIvazBKR0VrUXlKVlJS?=
 =?utf-8?B?NDE4RnRzVU9BenVQMHMwY05YclVSUC9oUnI4clJYM3ozQlBMVmVuUnhLNFF6?=
 =?utf-8?B?a0RmV2YrbHduT3U0aUJudGZjUnl6VEJIZk8yMEYrTzBYU1VFcytqUlI1TWFm?=
 =?utf-8?B?M3o2UUhjc2p6Ukt5U29GRDNTdkxRQjQyYnNEWHd4dmVNSjVDekZ6VXZSNWR6?=
 =?utf-8?B?RXAwYkR5VEh5NWhKTXVGRG5EbSthTzRIS1JUaVUzTDQzWHdpaEdScFNYZHFs?=
 =?utf-8?B?eXBjUXczL3ByekROQlBRdWxBYkozakZ0SS9ueWVma3hlT0dDaTlqQmNwSnlt?=
 =?utf-8?B?MGZQZlNFZm8xZFlBcXQ0Zy9uSlEzTjJyeDNwNEpjMVVhV2NwUFdkazFsSTc0?=
 =?utf-8?B?MFNHc3hKMlhnUk11Kzl4WDFKL0p0ZkpBajlUVDh6aGFNVmIxcnF4QW5PeXVh?=
 =?utf-8?B?anhZZlo3T3Zxbm0xcUMzbSs2UXlOSmRxa0trZHRJbUNPTlVRTHptZ0J0RUk5?=
 =?utf-8?B?TzFtME5aMUgxZTFWRVJIcm9aek4xajdmR2hKRGUveVdLUUhKNFp5SUJZVGdQ?=
 =?utf-8?B?WkQwYmJjUkhyVCsvbGdaRWpNUkVUbk1CSmRKTGZrNndXR3NOdzV2ZUdUZEhH?=
 =?utf-8?B?aGhNT0ZnREJ4RXF4MTQyUE4wM3F1aC9iNUJKNzZkSHlwUFEvTlFRUzFubmhU?=
 =?utf-8?B?b3BZWEZVK3RaeWNnWHlZWUxOTElza1R3K08yaEx2ZW5RazR6UnQ5aUt4ZnNC?=
 =?utf-8?B?S204SGZGQ2Z2OXdOdGlNMkQzMCtYZ0FNM05USzJ6WU0wWFRocEI4TWhsWHQv?=
 =?utf-8?B?U3ZHcnAwdmR4NEZTY0JjM2I1MDlQQnZONHU5aEVyWmZOekNKL0pFRUlxSkcy?=
 =?utf-8?B?UDM0SlZvSTRpVTRyTk55Z1REd3hSdGlkbFlJRWtJKzVBb0VTaFBod3psamIr?=
 =?utf-8?B?eHVVZlZLbkhqdFlxS242enZGN2dKd1F1V1VQNCsvYWh1emhSamhJRklzRTE3?=
 =?utf-8?B?Ui9JTUR5ZGRiSkJpOUNMYThjWG5ERjVidWFSMElrKzl6ZzJQNjQ2OVN6ODcx?=
 =?utf-8?B?R2xEVmdUNTZuMHZQVTRrOTJZS3F0R09sWElHNXdqaEhrV3lqMExjVFdRalhp?=
 =?utf-8?B?cElLVllYWERIY1VGSXBLQkt2V3VVa1VCaVRWRW00N1FUMmN4L1krOW1YbEVj?=
 =?utf-8?B?Yi80aEFZTWpHbFg5TDUyRWZ4MEZ3SlpFZlJCaVVjZ2RPTVRHNFhWNUpTd1ZZ?=
 =?utf-8?B?aVRwdytobjI4VWRZTlFVRDJPcGlucUlQVmhzVytXbWtmWTlLY1FCenloMmVB?=
 =?utf-8?B?anBwSi83Tm1OMkpoNHY2Q1cyWThJbUpBTGNXUmYzdFptVmVpeGpEZVhsaEs0?=
 =?utf-8?Q?e5oXZcUZdhekaFtIEQxqcZ/AYqHMlXLyFFism4c2Ct2VO?=
X-MS-Exchange-AntiSpam-MessageData-1: 6xQ/aYureh84zQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7942f4df-91d3-4d47-23a7-08de799b92c5
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 03:10:22.3365 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xOhVGW/2EXuxP7LVJUOBjU3VxMn7+S+yLGFhbchc39HNVJEKsbGFk8l7qKhBB7tBFM+U3UjtUGydL5ARpzwZvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8354
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
X-Rspamd-Queue-Id: 988A31FA37C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,ffwll.ch,garyguo.net,protonmail.com,umich.edu,nvidia.com,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Wed Mar 4, 2026 at 11:53 AM JST, Alexandre Courbot wrote:
> On Wed Mar 4, 2026 at 10:42 AM JST, Eliot Courtney wrote:
>> Add a default method to `CommandToGsp` which computes the size of a
>> command.
>>
>> Tested-by: Zhi Wang <zhiw@nvidia.com>
>> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/gsp/cmdq.rs | 12 +++++++++---
>>  1 file changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/g=
sp/cmdq.rs
>> index 48cf28b41f39..3424be4e15f8 100644
>> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
>> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
>> @@ -94,6 +94,12 @@ fn init_variable_payload(
>>      ) -> Result {
>>          Ok(())
>>      }
>> +
>> +    /// Total size of the command (including its variable-length payloa=
d) without the
>> +    /// [`GspMsgElement`] header.
>> +    fn size_in_bytes(&self) -> usize {
>
> We usually don't specify the unit in the method name (the doccomment is
> a better place for that). I can fix this when applying.

Thanks, I will make a note of this so I don't make this mistake again. I
wanted to clarify this since size for a command could mean a few things.

