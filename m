Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDhVFyj/pGmpyAUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 04:08:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D5E1D29DC
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 04:08:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA04210E41D;
	Mon,  2 Mar 2026 03:08:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="BZ/keoCl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011032.outbound.protection.outlook.com [40.107.208.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A20010E41D;
 Mon,  2 Mar 2026 03:08:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zri4PA1Nay7a2UnyKGXWVfgq37zYf6sW5jT7Tl1bKNJKUu5JHEd6QyeWDtCnj1RbH/VqPj7aa/jigJZqCw7P43WsDAuF7/9VdIR/NaFVzXiiWRwUVsOH6QtpL90zDB0XqTHqwv4tzEqrbNqdf67nhNcbtgsIkG8MB1b/usUkBepEffHEp+0Kr+e5Ayerui41sRoH96HcABqW//8tYpjlHeKyFqzhgHHYkc1uUtIODWmMXVRKGH4P5mVtMlL/53Bf1+MrK/HTbbaXEQ5unLg+y6kUx7EL5vsKoA6poZPDGJ8OgNuurV0d4ShT0OGNhWR8kwSm8Bm4MeuXjOa/Ofzl/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vWf16+J4bPKY7NhoItIzl6OloCv94U/d5CokDJmQqFI=;
 b=kTXxZI8VKfytFpVJMqwNC70dnrF4QyOqhcsgd2xTHPzh9weKnLeGNe7syceK7b3yejYXGmpRtRbp5tyRVaVaDvl3w6pt/eGY8+e7jxYZ9vgHLAnIkmw1c+vezCy+PhML/vApAvrEVgaqf4I061fzy+H8ws14wwFl7Hk5ljDyU359WWpdIxUEUtxPrmcF/i923ZEsoU8OecpQUkxthoxrWOwYW6nR7B9vycow8xWvi7H5ttrehbOdEQP8HOyspXJsw2Gn8YzZ3R+p1CA/3uU7brUhS3hFlqM289lgb5rz6ep84wfbmYRd+SHrSAvaqVwa0RgjiCIFSq5TCMLr2g5XbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vWf16+J4bPKY7NhoItIzl6OloCv94U/d5CokDJmQqFI=;
 b=BZ/keoClMN4MkKeIYG4ev9jmP/g7p8dRacFzrqapMljtVG1sd0H32tnBCeV3LeQsJKSQhXfsLphIVAKV/DijdqhS4VUFsoVIsKHKngWzXwwCyIvQjxKWbRBQHHto6Bxsedt8FjRn+/1XDuZ6CdfQ5BxNhRKUqH6LSk5ssZ90OSJml/tB4jMKlXxNE3B+S6kLYdhv4BYCi91F+12XkzmXGb+KlzQvYDf6D0EWRw/vHR4+4Zka0zUqXkc2YsVrwdBf8mobw/chtAbGB12XtHO0LXhd1LeD6qdA2O41gfErUbxzM7E7UgKkGYfewxd1NHtq0oF55nc7slRhXccVaHgVsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA3PR12MB7784.namprd12.prod.outlook.com (2603:10b6:806:317::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 03:08:15 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 03:08:15 +0000
Message-ID: <0f53c0e3-e745-48d9-9576-ce8402b7593d@nvidia.com>
Date: Sun, 1 Mar 2026 19:08:13 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] gpu: nova-core: gsp: add sync and async command
 queue API to `Cmdq`
To: Alexandre Courbot <acourbot@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel <dri-devel-bounces@lists.freedesktop.org>
References: <20260226-cmdq-locking-v2-0-c7e16a6d5885@nvidia.com>
 <20260226-cmdq-locking-v2-2-c7e16a6d5885@nvidia.com>
 <a3b7a5c3-9689-4700-981e-d94bd2b5091d@nvidia.com>
 <DGRXSDSDMUOI.31863U05DR3VA@nvidia.com>
 <DGRYNXISKYQR.2V6CH8PKCLUDY@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DGRYNXISKYQR.2V6CH8PKCLUDY@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0P220CA0023.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::21) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA3PR12MB7784:EE_
X-MS-Office365-Filtering-Correlation-Id: 03307e0d-38d9-439d-62bd-08de7808f234
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|7416014|376014; 
X-Microsoft-Antispam-Message-Info: LpQvbyVyVGNB5YgsufNzs6SH0EDALdoIp+i9TVijWdIcj445DsgcFdZHFKZHUTIGbb3cG/QZNsv/VpyBoJPbVMPLGUKOzkz2AZ/u4CzRqebmMh5jhBFZQ0EZl6YM5lc47W0dMksBiRcVmlAFUUFfNGBpS7Qhqm1pSAzB98+GnRrZlfgX56hzwLKWG/CWkxFv2WTE/n+1YfT5obDgP/Ferlhg6FnfwzbK3SvO79+EOudDVGxTZSQ1uXBcX4Vo9PcUJ2RCImB6T8KMADWQwWxpMUHYNoEsvv6BZSl3WyPpJzIi5WXRHOdgX4Xyjfwcpsks9y8aQVDQ6o1H3OUHK7ZXNH0NE0yPxgQ/kdprR3/zZ5Nq/QPa62WsYtwQlaWziZ8LHk5ekBiycizqNjohbwTM4aHRx4ROnVE65mddDh9RubeqJVUIsd3RjRmxbAj41OwXpzuoo04wINuLNlWhUGGYdpbLAmpY5EyE/YETFYqOTwMLQhmQLAIQ4kgKZ+P5oUA9vRiU1nTeaO5i1CKkBYEdx8ml8y2vhXeafcod524UF93x9E4+TYKejwp0y0M6hVfH3V6lH+DmyHMM6R455M6Qu7YnnxmBADetJBsD2Tq37mt9l9rpzRq0lnJNfVNqMgL9YEI4q5bzUYisjgA6trduMln0wKN165B+31DYPgVmDX7+YO7gbgAYqmQHUYQwM6/0xVyMoOplgz5pGoNzOY/te7vgUs/QvxvV1R+EwP8x/Fk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTNQQlZzQ3dGZURmcE96N3VXdWNwNTVsbGZlcEhET3RoUmQ0K091ZVQ4YStm?=
 =?utf-8?B?L1VWdGpCOU5HdGdYVi9tbkZ3NitGTE95cmZtYjVOM0l4eWIrVjFKSXBRbEpD?=
 =?utf-8?B?QWNXejNOa2lzYSs4R3lZNmNSZVNtUFZUaU5YQ1lMVUJKRWF0bTNIR05pUW9w?=
 =?utf-8?B?eVA0SDd4SFNCc0RiN2JLWEg3WUpzSmtGMi85dVRuc0lBMVpiMFQvNEZ1OVM2?=
 =?utf-8?B?NHBMb0dyQnlaYmczZHVEOWtqMFdaUUZHSzhCRXVtZWJSa1JQVmEwK2RBNWN5?=
 =?utf-8?B?T013NVQrc3l3TDRNVGRjMFRTMktHT3FsYks0eTBnOVBRdFFrL2V3V2xiOHhs?=
 =?utf-8?B?LzM3Q014eEd4cUo2K0d6YmRxYjNpMmFObUFSY0lKS3hTdWNaZXVidjBybjVv?=
 =?utf-8?B?YWxNSjJQbzhxNWlSY0NwUDQweHJFRzJrUXNMTFYwdDBXUzlSelI5cVdRSDZM?=
 =?utf-8?B?a0NRUVRmT0VheGZNc1lTemlNY3lYanBzNTFldGdLZy9ESW1LcEY2aDJYYXV3?=
 =?utf-8?B?cTJRWTJHUGhzb2k0clJlNGhiZWxGR3JSVjhFSThLOFN1aXQrQWl5bDAzRWls?=
 =?utf-8?B?VE1KOXJSVTExZkFhNi9KcFIwWGZzOTMyWnltemMyeDV6K1Y5ZG0xR2xjQ3N3?=
 =?utf-8?B?ZTRVNzEyMzRmTndIOWxVN2tLN0JwUEt0MmRndWJ6Q3krdXAzbXNPM3BTRFNq?=
 =?utf-8?B?QjB6V0pMUFpBeXFtcGw1b0UzTEFUNnhuV0ZzSzhtV1B6aUpnUzFER2E0UUJL?=
 =?utf-8?B?ZWIyMHZzbGtMOHJNcXVwSUsvb0RqYThxNENHeHBQSTJRUVUyS0FwbHE5YW8y?=
 =?utf-8?B?eHFrTDJrZldvcEdrdGRqbXh4T1ROYmdhRnY5RnhSbXdHZ2N3N0JuSStBSjNu?=
 =?utf-8?B?L3gwRWxoOUJpMlFSV3cxVk1WWk9HbXdCaVpzN3lwMGI3RG16a2MvUnZBYjJ1?=
 =?utf-8?B?MFIyWmtDb1pwc0dXTzNwZjVCR0lkYTZZY1JZQlhoOU92V0VNeFhEcmdPZDd6?=
 =?utf-8?B?RTdRMHFXK2dMK0hiSnEvUEgzWHNjcUJCd2VGMUxudmRKVERTSk5KQnRQWkp4?=
 =?utf-8?B?MGhyd2pEZHhwNE0yS1ByU0Z4ZXFmMHZwNkRKdVlINzFNREhMK05hWm9TQXRB?=
 =?utf-8?B?QktoNVJuVWFQalROL0R2OGYwZTZubTVLVXBOZi9MbHR4UE5OeDU0WEtxc0Vm?=
 =?utf-8?B?d3ZRd2tkRjNPM2ZuTithdFFlaG0yWks3U2JsdzZFZEJlck5NeWNESytwM3Rv?=
 =?utf-8?B?ZnZ2R0tFU2FicmlUMlZXN3VuY0JUS2VZRDhmeTIrcmdRdXlGVENPUjBoMWJr?=
 =?utf-8?B?azRyMUErbVJGL2Iyc0NodlM1S0Q1d3BVMXpmQTNteVBVTCtRenBnZzJwSWhh?=
 =?utf-8?B?NGFEa0lncHpuZXRPTDJwSUV6dXBxdk9ocUp4SlhrVE9vYmFLaEVFNVREaklU?=
 =?utf-8?B?dE04TVBsdGVjWlJTUXRJRWtvNmpWMlNhdXh5cXk3Ti8rSXNzNDlDck1iZWpz?=
 =?utf-8?B?WEFuWjFKOW16SEx0QnJlellVRkVoMzJPSjZnTDZ4RURPNUpzL2IvYlQ4ZUFU?=
 =?utf-8?B?R2p1NWRYekE5TVpEY3M3RHlNZjRRV0ZPRkRWUnZCNVFCM3dtbXNRSHZnc24z?=
 =?utf-8?B?QnJHUkxEUkRQaUp2cjRtZFZkbHR1SDJ4V21rb1V5bHdQZzhEclp4cVYzdzlH?=
 =?utf-8?B?RmhoUTJmc09NbkY2NDlsQTdFYTY3cTJtSUhPOHZYcFV1ZXhWbmxaMU1qQnVu?=
 =?utf-8?B?emc4UUdab0hPRnJXeE1rVjhWVmgyMlBJTlFSaVZYMkMxck9qNzRadEZITDdy?=
 =?utf-8?B?dkg3S29GSDNyWDk2SDB5SlJyYWdtb21PdDF4UlVNdkg1VnFoMmJmUUNvc2hZ?=
 =?utf-8?B?djJsdHRVUDgxWURCOWJubEQzVU8vQ083QnFOYnlFRi9iMFB3eTdrb05Xc20y?=
 =?utf-8?B?dFJvTTJtaTRSOGhlb1ZzWDdwaEsveitkTTBackV2bXJzdkF0RHJnWXNPWU4x?=
 =?utf-8?B?LzFJV0JqaEg3SHpRSUtnUC8zT0dHdTBoTHJqTG5IbWR1RXB2OVBpS1k3TjY3?=
 =?utf-8?B?SDNCQisxWXJpUDRyRzdTUUdBbFZYL3IzcHJUbDdBVG1JcklKdWdCaVFKVFJE?=
 =?utf-8?B?dFRJTUU4eFFndjhUUmdWZHl4djdKbnoyc1huWSt2REczaHhQQ0pVSGIyVUFC?=
 =?utf-8?B?Nlh4UW9uNkdQLysyWHRjY0Z3ZHlqM05JTjUzMjE4cDFLb1AwWGJMcGFsajgr?=
 =?utf-8?B?V1ErcEJoTmJkaURKTWtzUGpoTVdmUWVtQ2RWekIzVnowdGRqYnpKdzJwM3NM?=
 =?utf-8?B?NlA2MU43ZnpaR3ZpWVAvSDN0eS9meWNxaUJWbGlXKytUZjczWVhFRmxpMDhX?=
 =?utf-8?Q?w8Ubp3A0t9J3wP24=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03307e0d-38d9-439d-62bd-08de7808f234
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 03:08:15.3345 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Zh2RXyPF5gb+/gqE+g+4zwH+WRoSmE2PGMkH21z/TILx73rCSmTlgRHgYS9BJu4Sk5zDkhx90gkuoTkn2HJrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7784
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
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,ffwll.ch,garyguo.net,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FROM_NEQ_ENVFROM(0.00)[jhubbard@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim]
X-Rspamd-Queue-Id: E3D5E1D29DC
X-Rspamd-Action: no action

On 3/1/26 7:03 PM, Alexandre Courbot wrote:
> On Mon Mar 2, 2026 at 11:22 AM JST, Eliot Courtney wrote:
>> On Sat Feb 28, 2026 at 3:11 PM JST, John Hubbard wrote:
>>> On 2/26/26 7:50 AM, Eliot Courtney wrote:
>>>> Add sync and async command queue API and the type infrastructure to know
>>>> what reply is expected from each `CommandToGsp`.
...
>> For lack of a better idea  i suggest send_and_wait_for_reply +
>> send_no_reply for now.
> 
> One important detail IMHO is that the API cannot be misused, i.e. you
> cannot call the fire-and-forget send method on a command that expects a
> reply. So the risk is mostly when adding support for a new command - but
> if that step is done properly, users will be directed to the right
> method by the compiler.

Naming is not *just* about risk of someone misusing it. It's about
being able to read things on the screen and having a good chance of
understanding it.

> 
> This, I think, allows us to tolerate more ambiguity in the method names,
> as long as their documentation makes up for it. We all agree that

Really, no. Let's do our best on naming, *in addition* to the documentation
and having Rust help lock things down.

> `async` and `sync` are not a good fit, but `send`/`send_noreply` should
> be tolerable (I'd like to keep the names short if possible)
> 
> Or maybe we can use a variant of the trick mentioned by Gary in [1] and
> have a single `send_command` method?
> 
> [1] https://lore.kernel.org/all/DGRJJA3068FV.3CE7J7SKLTN8O@garyguo.net/

thanks,
-- 
John Hubbard

