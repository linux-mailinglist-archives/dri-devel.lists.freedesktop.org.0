Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id BC7ZAY75pGlIxQUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 03:44:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 549261D2820
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 03:44:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CA0E10E0CC;
	Mon,  2 Mar 2026 02:44:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="bZocQ6eK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011064.outbound.protection.outlook.com
 [40.93.194.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CCF310E0CC;
 Mon,  2 Mar 2026 02:44:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VJqAThG8WvfjZvgvfcdx5BUQNkHD3gKXj3KNCvoTKP2JjFfuEP7iedv8Bwk/IgXyNx8oRYPzq4OSimbaypgWfKVCFcZRDxTIqda1MfbL7HTHJS90MN2QMhDYqhJbcjNXy59Jo5J5VBq1sWRFUoHTpswgSFa//FjZOtQtHQ/tHoaI8oFxAX30KhwezTaV8MzFI8hq0qBtDA6/OfMVVYBNAhGLzJMDCqOyr6c/9IkDWLBZERAb/y5iYjXvF5/m0L3jtLsB8htaGFJJqwv/uvzzvnu2OuMGcWFRS7kI5+5IK07zbqeK17IE6saZ4Xtcq8mhQDDm3rtyxmsYilGZ4TfbCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Evly31gEtMz7KNNliEn9fyiqZuX12C2wZzNUWi6vxs4=;
 b=KqbehOSCYwHsA37sf4UWOAFygSZGqFHTl3dXtXO2yxYbeUvz9HWqYNLTrqYzTM8cXB3R5Tb6/AL9K8Ebjr+App4Rphrc5UuRqwtPYwUjMqCS3Ol4n0pqma1xsbbBbGQmRzeJy0j+iBkuexgivpJOZx5IlZvXsdfVuDAo5SgiDbW8hxHK3GsgQXtAMQPdK6qn05zyRB9J4o42XmkNbBCFU7a5qgk33DQEQKyjzBrlM7GfwIcxXgff4GA2ZaC125fciYtLpk4iK3Slhrpu1JDyZ17/K5j8fYXO1RhGoH77K0NaBwk4/7iQGoQQQZSnRqGjF8C5noFEYkhBkXn5tUKMqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Evly31gEtMz7KNNliEn9fyiqZuX12C2wZzNUWi6vxs4=;
 b=bZocQ6eKkNNBdmVqdDU5GRGFgAgUnNnU6adhei1/BJkTVXNz+FA8y3YZbBIyWyfqzS2f6IUrVmGyRqNNftzWFjaY7j2hJoO5oKX3cC+QhLaueHrKq1pZ53oPqKrgjcBJM/hxLHfgeUB128IPoYKn4ShvPhMyd+r2nFLPOsJXmJUJ7BfnuIFw0qf5TG+L8gEMGn6aLdDd/ldroOTYZWQ+WQdmVzTDhSaMnQHKgNtCSgl9/YEbsWFutVJx2w7gB40zTvuRO1ZkFpzxJWTBnUwfGZ8ep9Q3bS5Z1uZzhhUVKiEtYcDWyVyPonxFJRGY3se+5XR2UvhmLMHCe+e7EtiK7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA1PR12MB6089.namprd12.prod.outlook.com (2603:10b6:208:3ef::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.21; Mon, 2 Mar 2026 02:44:19 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 02:44:19 +0000
Message-ID: <f0429b19-937e-4dcd-a0ac-7e795014651a@nvidia.com>
Date: Sun, 1 Mar 2026 18:44:05 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] gpu: nova-core: gsp: add sync and async command
 queue API to `Cmdq`
To: Eliot Courtney <ecourtney@nvidia.com>, Danilo Krummrich
 <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Benno Lossin <lossin@kernel.org>,
 Gary Guo <gary@garyguo.net>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel <dri-devel-bounces@lists.freedesktop.org>
References: <20260226-cmdq-locking-v2-0-c7e16a6d5885@nvidia.com>
 <20260226-cmdq-locking-v2-2-c7e16a6d5885@nvidia.com>
 <a3b7a5c3-9689-4700-981e-d94bd2b5091d@nvidia.com>
 <DGRXSDSDMUOI.31863U05DR3VA@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DGRXSDSDMUOI.31863U05DR3VA@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0172.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::27) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA1PR12MB6089:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b683a85-5cc1-4a2b-b88d-08de78059a3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|10070799003|1800799024; 
X-Microsoft-Antispam-Message-Info: 88DoYJPfyCO+jS0Fl9hykPdbCNRjsL/rEIApQh1naQJNT4CuAVhoL8SkmejCugq8++Fc+eq2l9leA1I/0bz0XYwwWtVitIsOPDEV1tZShxJT8kcQ7B21N1ee8LHaX1++UwvcdIn1SA1OtYJVu3/xZoyOP1MQN5f3zSPDwcf7wF38aEg0PxJOxrjYPcdrMWyEQPHXtfy7kX4MN+ZSqvItGzq2h3FuCmowhTI8hXMCi870jAeiydk+XB50V/VngstjcNKQ1I3nNLPbyF5+AxvawM61G8TcjJwpG0B1lsZK+bR2OgkshTD8n6nmQ5B1PE2Sy1KDTJDbl5RVMAI9IM0b22NyCpJjexW2N7ycCz3qMdJapZA1vCHzDakujwYICfkWoteEOhijQv13BNOJZak6ObiETgfHXA82QeqIqXwSXUuoxZbBjPOT0G7Bi5T/mt0h0XhDM718WGdUnFxvoCqcnZ3PxSXSFU/GrOnxkQvkjC1lzls9/PoZ/wlNzBqFi//Le3DUsmN5uGxmtScc7uZsNOon9br4L8Ean1LSePUhQC6M/G7q3GlgZ8i+zexjqKfOJDwMDqccoiZfnXFLg6U7T/9J5w9GAHwvrrUYy5+CcR7tB76Ml0SO39ec24Lj65PQeo1BNX6olWLEP93E87bMvfcLNnLh51WUTU0E3Kt3nDrSHTbksmkMJm4Gsf440qfnxtL6UqlC11dNxif+It0F6KiqpiKunv9+a69RYFoLBd4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXgzOWN3YW5OdUZZV3Bta29JeGpLUDJsN2I0ZnlJVGhHWU80T0pGeHNsZlhG?=
 =?utf-8?B?aE03SlBkUE5kdTJML1IxMTZjMnBUeGsvdDNIdUswS1A4UndXMHYyclZEWVV2?=
 =?utf-8?B?MWo0S2xTeVltRlBKSzBVRTZrMTZaZFF2MXkzbk1aRTcwNExBNXhIa0RXdUZ5?=
 =?utf-8?B?WEdIWmFsbkg4d3hSV004QUR1bDVoMkd6SVAwdEFlYUxUVGxqYmg0Q2xLLzRl?=
 =?utf-8?B?WWgxUjc2ckxPdGdmenZXQTE2WFVKNTZnamJySUlhUW8ram9NTVZqU3A4OTFS?=
 =?utf-8?B?S0ZyeUJWM29xQXRoZDJKWXJCZlVLS1hjR2kzVUlrNm81dGVTb0xJRlpvcms0?=
 =?utf-8?B?bHltT01ILzhnVW41dWQ5U0lMYVNpQUVnaWQwU0xxTitCaFY0ajgzT1BhWm1V?=
 =?utf-8?B?bEJLZ3NUVGFua3c1VXd1aXNqb2hRZzRieG15U0xGc3BZYkFZWERQUU9wSHcz?=
 =?utf-8?B?R2NKb2h2UWg0NFNGMU5Zd1puZlpHamVsU2RMQWxOZTloM2RYeWd6RGlLRWZq?=
 =?utf-8?B?RCt5S0JzVUNTTm5PU28zc2FETXVpdExEVDBQSldMcE9vU3preEt6TW5MdmFK?=
 =?utf-8?B?RndCNjdXRFpyYTVhVkoxYzBYcDZzS1FvTVFHOERWRnBvMGRpQ2hhN3hRQXU3?=
 =?utf-8?B?L3JETEdrZFU0M0pVQVNOY3ZXTjFkaDdTSzlPV01aWTRWREtWTlhBbFVsZlJt?=
 =?utf-8?B?YndaVUFNditDcnNzeWU4RFdCS2k0NTJyU2NlSVR4ZTJxZkhRMTgyQklmTzFh?=
 =?utf-8?B?Ymp6Vmd1TDQxdW50VlVSQzdoVkFmSmJUVDdrMktBS0FnVUdiN0Q5WmxpaDgy?=
 =?utf-8?B?aHBvZHpkZFkwd1hBc1ZMRnhSZGx6R2FKc2FtTnhRNnBBUXJBeDZBSUJ3UnFu?=
 =?utf-8?B?Ky9JWVI3TXJlb2tXaUFnRU5uZXlZWGZKckp6VkJQQVpnL0FURWxGbkVLNFVL?=
 =?utf-8?B?V1BxZ2g3Y1gxYmc2Qk5VczdVcXBWUEM3bkxhckxnOVdtS04rdm56b2NyckRH?=
 =?utf-8?B?eGN3RllvLytmcGd0WnVNSm9KTFhPYkk0cnFDZzNDV0wrK3g3U0lUbkk0VENC?=
 =?utf-8?B?dlBWenE3amkyUklyK0QrcWNXSnU0M0ZmTVB1SnFXWmozRlZtVG9xQ2V1TVNq?=
 =?utf-8?B?dUhKMFRIbk5WbDNtVFBBdTJXNDBJbGV3bXMwOXlxMHRUbVNCK3NnMEprRGMw?=
 =?utf-8?B?ZXhOaldBUmN1MGFYcHBydUp6K0hkT3pUdC85djB5Y3hXY0o2MytNZWZzNy9H?=
 =?utf-8?B?WkdSK1ZBTzNibWhEUVEwWFFtdzNLdzdJdDcwMkJsSnFqOUtxeXlWNmZuTy9H?=
 =?utf-8?B?NStWUGc2OXNTYVNSSmYzbS82eWQ1NEk5UWxiendIVWpFNmxMVU1Jd0dRM0xV?=
 =?utf-8?B?Q0dlemt0TDRXUm9XSmJSL21rcnZvaFdTZ2l2b2w3bWdTRjRERzV2bWx4UUhX?=
 =?utf-8?B?M0FqVmZKWUVIdkY1ZVNqaDdXY1ZvSEd3d05HQkUxNVRSbFB1V0JxOTJLd28z?=
 =?utf-8?B?bENFS3JUSC9SM3A3WGdFL2Z5MTJOV05NZUU0ZHBkZ05rMnRQcWl1SG12SmhP?=
 =?utf-8?B?RGFRNlRRT2xDRFZ3K3gzZndGZkJFc3pOSFdLTWpMTGhoWXdSRFlKakREay9R?=
 =?utf-8?B?V2RpcWN5c2JBM1BsQnBmSUFHWENWZ0RVWEZnMHVpeWlvVmxjelRoTkhYdW51?=
 =?utf-8?B?YlRIOTRxZ1Y2MU5EN0h0N3VCaTRsUW10SnR2MTMrR2xITkdrZ0huUXJlQmho?=
 =?utf-8?B?TFRodDhkQWVGZmpqMDFOZnZpWkhyZzI1RHdMUnJRNzREWkhqNUtCbFdUNUpp?=
 =?utf-8?B?UFk2S0tVS3Rqbm5DTnExbUNJRlVLZzMwU2tnY0htNHduSlc1UEZLUVozQ0xL?=
 =?utf-8?B?cGVrL0lCZ0VsSXErbllOV2E5eEEyaGc2Y3RFZmV5Uk8rQmt3eWlsWmdkaVg2?=
 =?utf-8?B?TXBEamFUbXhac1ArNEx2VnRaQkp6Z3NIdy9NcHRDRzlnYVZUWWZkVGcxVzR3?=
 =?utf-8?B?OVpnRTlMWU9LdnpJd0Q2NkxIclNFMmluQm1Fd1NMTFNiQ2xXRWc3bVVpeG9O?=
 =?utf-8?B?STBDNjY2KzBodFNOWU1XNElkZm8xL2RISDUxOStmS1hBWGtydDI2UDljME8x?=
 =?utf-8?B?KzBpQVhzWHd3VXlFZlBSNGNRZ05RblZUOWNwdWVlTWJwQjFVNmZMTHU5bHAx?=
 =?utf-8?B?T2tMWHVRdDhGMStnRllPRUlYSUFaWXRpNlR5bXZJcFptbFpjNjNlVmNGUS82?=
 =?utf-8?B?S1BIM1NqWll1cFIwR3l4V09qL0ZQY2htWThFcmJNdmhXMG8ydkIrclpFcHds?=
 =?utf-8?B?UDlFcFVMRXo3Um5YRGRVcVdwcXRvbTc0QitwcVdnR2NnQ2RvOTUvZmVaV3Qr?=
 =?utf-8?Q?2c7xA+5uLEABIpQ0=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b683a85-5cc1-4a2b-b88d-08de78059a3d
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 02:44:19.2870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yep83zKQgiCZcFNsjvVdgdLgrGyPt29WC4v9msnFi8sW5MDLU7GfKadcTALP9UYW0c+TqAcUSCXbE+t+WTnLSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6089
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
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FROM_NEQ_ENVFROM(0.00)[jhubbard@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,cmdq.rs:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 549261D2820
X-Rspamd-Action: no action

On 3/1/26 6:22 PM, Eliot Courtney wrote:
> On Sat Feb 28, 2026 at 3:11 PM JST, John Hubbard wrote:
>> On 2/26/26 7:50 AM, Eliot Courtney wrote:
>>> Add sync and async command queue API and the type infrastructure to know
>>> what reply is expected from each `CommandToGsp`.
>>>
>>> Use a marker type `NoReply` which does not implement `MessageFromGsp` to
>>> mark async commands which don't expect a response.
>>>
>> ...
> Hi John,
> 
> I totally agree and was hoping that someone would have a good suggestion
> for this. I discussed this exact thing with Alex before posting this
> too. So if you have any naming suggestions would love to hear them.
> 
> As you say, sync and async are orthogonal to reply vs no reply. I think
> we have several ideas here actually:
> - blocking vs non-blocking
> - reply vs no-reply
> - wait for reply vs don't wait for reply (practically equivalent to
>    blocking vs non-blocking here, but conceptually the send could also be
>    blocking vs non-blocking)
> 
> We should also be careful with conflating waiting for the reply vs not
> having a reply. So `send_without_waiting_for_reply` is definitely
> confusing to me, because there may be a reply that we just don't wait
> for.
> 
> Some ideas:
> - send_command_with_reply + send_command_without_reply
>    - Maybe non-obvious that this blocks for send_command_with_reply.
> - send_and_wait_for_reply + send_no_reply
>    - More obvious that it blocks and gets the reply.
>    - Should be obvious from context that you are sending a command
>      anyway.
> 
> Personally I think it's nice to keep a convention of keeping it
> mostly obvious which functions block/wait. (e.g. we already have
> wait_for_msg in cmdq.rs).
> 
> For lack of a better idea  i suggest send_and_wait_for_reply +
> send_no_reply for now.

That sounds great, I'd love to start with that. Simple and clear.

One thing: "send no reply" sounds a lot like "do not send a reply". :)
So maybe:

     send_and_wait_for_reply()
     send_without_waiting_for_reply()

? Or something along those lines? It's really verbose I know...

thanks,
-- 
John Hubbard

