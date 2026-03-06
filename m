Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0H69NN8yqmm8NAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 02:50:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B2C21A5CD
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 02:50:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40F3310E2AC;
	Fri,  6 Mar 2026 01:50:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MNtTQNyB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012055.outbound.protection.outlook.com
 [40.107.200.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A784610E2AC;
 Fri,  6 Mar 2026 01:50:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hvCBA9n5oGQTYq0h5lVy3Sy2B5z5MnluZzPPJYNgsRrRgaYaklbZ0YqdcCL0qlVP6rbPRyW4iiSUU/WdC991Ia4anD6NLEdPSrjghn4KvQjoG74N25i6Cwyn88nlMdw5IbvTk2Ji1TJDkGPl2+Rm2LC5H2n1NFRHuDz3y7+5x9u6sw1Z+HZkemQmKaOt8medhxcJ6g0pGoDzbdQX1YidPS8gsRJjIUBYz9XKvjYkslKyvbRnt/dLBzv5W5/scrjuofBMtlb/iYu8YJh6hgcJ1uT+jDJAeGL9+3Qthr99ApUYWq8YazVTMw0Zg3uFxxkEnkt/mdIVwmxshSugfs0JGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VqLuzLLaBFt7hSKbK4c0DFUnAp3WNjiFgSJBcASVufs=;
 b=uyLhnJvTuEHCuw2dNoPX97EWibcPA6eJdcO8Vis7K1St7MERiEWhovnCF3Uho8o/3yMhaodpTg+7II1WAjoGSTVfqAT6oLZWu3rcES8dYjWvdaHfePPQN1TVXhY1i1AIkH9ljRteB9h+B2+zV0tYXmbDYPooTnQBu7/TE3/YDlirpCrEZ5tVP6ZPW7ZkrVHWyBHkxQLtAgxeMxnO9P3k/QFZ947jpkO9jw69n8yzFmtA0AkI5UrMbuc1cJ/0u9024L4+phHe5fceTg0PJgPKkw8MSyAkmmm00qd9bLEHuT5hGrzm2+u6THPEwOBUp2LNsG91Z2OPCTkd008ha1+8Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VqLuzLLaBFt7hSKbK4c0DFUnAp3WNjiFgSJBcASVufs=;
 b=MNtTQNyBQobayORZtD8c+YYycGAKHn5/dv9QnjkFJ7Lnw+ZGbDiGU7p8OVgqDmg287gimf+DsS4wjVs7sQKPh8G+2tctnLzxQ5Fg998W+jOvs6YVBcRTpCiaRgf5SvYtXpkRgwV/La+TSaXuTh3MPxtpWMiCZALqfPpJkGWhiJgGv8Ei5KU0tA2LjGCsXejgTxVvHtVlVW6PbQk4/4XiIEsCiLVyBy6J4hxIX8slPy8NzvlnlUbJpW34BgF9ka73bt0jwZN1bFBPzaAd/KbYhPiZU3ez6xqnerx4qUjLs9QKpMzwSH8OjrHl/S+vSn4zy9Rc65LWqHw+7zxM5RxSjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by SN7PR12MB7856.namprd12.prod.outlook.com (2603:10b6:806:340::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 01:50:16 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.022; Fri, 6 Mar 2026
 01:50:16 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Mar 2026 10:50:12 +0900
Message-Id: <DGVBM5OHJ79Z.3QYD6KE036MLD@nvidia.com>
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v10 05/10] gpu: nova-core: falcon: remove unwarranted
 safety check in dma_load
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260301-turing_prep-v10-0-dde5ee437c60@nvidia.com>
 <20260301-turing_prep-v10-5-dde5ee437c60@nvidia.com>
In-Reply-To: <20260301-turing_prep-v10-5-dde5ee437c60@nvidia.com>
X-ClientProxiedBy: TY4P286CA0133.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37f::16) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|SN7PR12MB7856:EE_
X-MS-Office365-Filtering-Correlation-Id: 62426a78-a2e8-4962-9aef-08de7b22b6d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: z+av3vDqucmXvWRGP7M9so4j4k0u/ecGJEzruz4bxQEPPLC3B2rBdeM+jNReHzlKo4nDJ+17nf0e9RjY38UG/gV43vJKgkbuLnFL+F+SzOGYksfMsQBquI+VTjh4zg44EKldXO3fF0q+QdG7IVRcrOKAW6Jrpsp/MKIUTy7h3/6gC7O9jQg2UfRPzjGRuoZsX9hhF5nrq7Ra66Ea2te02e8nStkgGbR4NMyDp18CANjGtRsqRkUFVwgwqTHisRrBfTTXI8mlguHMfLeaGLwYzoMwalB2NJ7iRxg0pTvc/TUPX4px2fBIUyPCBSUbCnBzePAqb/0K1pzc0Mn5qUQjfLbTXZHisII3C7V7GYl1sUV8y/2jvEJqtnwhIehCfHEamwdjTaY3deocuWjpC31g4AH3fyaGg/gFa956oFfF2VtS8qTSDJQ4jxpGZlqdZ4Pn4u/AOBmcZu8kG58bs3I5zQVtJIvcfN6rS/8LsTbu9ILZxZy6nkZIRMVN3jBKGOYZXXoRXsF/Adz8C9nF0RSFEFYRK2x2P3DrWKIuqIot36oXKa9O/QoidO4tWk2wXm08BYUIXbFTwA5v3W7tjSt9q4M3Pnn2nnBy796/bDYdgaRYn7BZgToSJwTr8WopMRciIUZFO5/hjAfsg0mjCyAu+GmkSHpWZv+K2jNxlL54gdtB/de9At+dSh/8aO4A37wdUhRtfaiEILu8HZK7ci2YO6Gdo1dWa8mCOQd6IAxyCnA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlViMEhwNEhYRGpldVlOZkdNa3lrVUFrNjZRTmp2UWtqQWd6Yk5Ldko0ckow?=
 =?utf-8?B?MHhWOGM0SmlWN1hEaUpqdXNQOTR1RldDSjYxVXJkQmZFdUg1ZERsdnEvdEVs?=
 =?utf-8?B?em5iZmN4cUpSS2FRcW5ncVNaUURPb28zYndkV3NIc3p1a1JQNStzRXRSZmJS?=
 =?utf-8?B?SWxocVRCaVdmYjFuTnhvVUpCYXpPaUtYUmhkbkpLY2dFRjQyN0htZWxEUzRE?=
 =?utf-8?B?UXZFZ1JHbTlYWGdPVlVwQzRNZ0QvMER1YW5Oci94bjZaRkVIbDdhWFQ3QzRh?=
 =?utf-8?B?d3FzOU5yZkwxM3dnSWl1VWdtRjl1aGVzcjBEMXc4d0pXRWp1RjMvcmg0bXd4?=
 =?utf-8?B?aFFNOFVTTGNkSVZnRlFhajM2U0ZaZVNlNnpmemp1eWU4aklsZXI1QnlETTR4?=
 =?utf-8?B?R1ptVnFFZ3h0RWdiTUc5VTI5MW5uVWxBNkYwYWdxVkhjc3dkWDByQzNHVmE0?=
 =?utf-8?B?WmhDQ2pCcDJqeE5XSEJ4UGZsTzFteEZYWkxJZ2NMS29saHV1bGVtaHNXSEg0?=
 =?utf-8?B?VGlBTGFXM054WmhvdFQvQmhYdUFoT2FXM2cwYVJYenVCaDZNdUVFZGRZaHpS?=
 =?utf-8?B?WW9Hd2pUQnp6ZUtOaVJabHVEMzk1dVllMU9xUzZLR2tFbXlUVUIvbWMyQmZi?=
 =?utf-8?B?RlU5ckpCLzBtQS9uUnlKbjVKUFg3YTlBa1BnTVlONEZaNVhhdFJZb1p4ZHhw?=
 =?utf-8?B?ZWp1bk55QXdLSlFSa1d3MCtRblVSZVorOXB2Vy9SSk9tRXZLMmFESzI4RGNS?=
 =?utf-8?B?RWs1ZWVVSlZqelA0b0VFOExVZHFaNWdzK1IyMFgwTjdQdzJqN3pTeEJTMU5v?=
 =?utf-8?B?ZnNLQ3hmSW1Ob2JYbE1Vc2IrKzMrVERSWWR5SG9FVVVOZjdTQkVrdmFMZERz?=
 =?utf-8?B?dys4WS94Y1lFNktHVUNha0VTYXNVUjVXOUtGVGkyRnpkQXc0K05FazNEMll4?=
 =?utf-8?B?S2ZSaE0va2RQQmdpYjExV1ZKS2tpMHFBZlRNN1VRMkpRNmE2QzdwZ0dSbFlZ?=
 =?utf-8?B?UVRyVFdwY3RzYzFVb3pvVFlvOFR5dmJpOS9mWmxrOXRiU21IZzMwUE5US3hm?=
 =?utf-8?B?dm9iakNIM1BnaGJiOTlST21kRTkrZlhTc1l2NFVaWUdmNHJXWGpEVndzalNh?=
 =?utf-8?B?WVNiNU9JZmRLQVBKRmRmNzFnb2RQRTVtYlJ2S3VLa3RiYlMxeloxRU56NWxQ?=
 =?utf-8?B?WVl6Um80RDVBL29mR0ZkRUdtTGY2V2lxNEpBTGVPcWtWcEw5REltdzdvMTdw?=
 =?utf-8?B?LytXNVJ6dWFvSmtsRlBOTVlPQzhaQkVRbERjdFRldU84bGZoZU5yN21DMjR3?=
 =?utf-8?B?VGNNL3p6Q1ZyK1dadUJTbThGVjBzRGdkdjNhWUpvUU9LSUY3bnZlQ1dQQ3ZE?=
 =?utf-8?B?MURPVG53aExGVzJQZTBqZDNKbzZ5SXJCTERncXZmSU5Pa0NBb2F6MFVEVlpG?=
 =?utf-8?B?UXJOYWNZcDh6a3ZuNWQ4dktUa3FjQWcxL291dk5XWm1VdGMwNjY4a3A0TllJ?=
 =?utf-8?B?VFh5bVN3emkxKzdhK3hjN2dxZmNaS2tyTFdGMTdKNnJaa0xabUZnN2I3L0NO?=
 =?utf-8?B?Z0tHUmxJWCtxWEkrRnJEcENGYVNvVXFseXR1ZjRUUHhsWkRTN3N1OW9CdXgx?=
 =?utf-8?B?R1Z0bmpQMHFySVNhSlVzOEJkOTNReFpHK2NSaWpaWXdwREJ2cXdVa2c3Slh4?=
 =?utf-8?B?QWQzdlZrNXp0VFdHZTNBcE93SGNMaG5Ta1VjbVVZRU9HTFE5eFlpOEJYTUxq?=
 =?utf-8?B?ZWJxQTZNWkw2S0NnbGFoVlNFSkVKT1hzMWp2eG1EQ2FNeDVFSytoSlRMQkdw?=
 =?utf-8?B?V0E2WUd3TEY5R1JnVnJ3MWVRcXZ5dURXV2pLcVpXTFlPd2w3QU5veFIzQTJU?=
 =?utf-8?B?RzhMcFdzSDZjV1VtVWgyYXErU0FmajA1L1FnRUZNQ0xvZTRuOHhwTlZSU3Bu?=
 =?utf-8?B?MjVpQnNkbkk2ekRQeHJpNkkzYnFBK3kxWGZsbXBJc2lHNE42R3ZnTlczazV5?=
 =?utf-8?B?cDJCZm05TjQxbUtBM0lPeFNNZUdMbjRQWEpQeit3NG5mbllsN294bDlwcVQw?=
 =?utf-8?B?Z0c5d2MrU0ZycEo5T21ib0NYLzVBR3ZKQTYzQ0R6dnlDRm0rbndEQjRCdG9R?=
 =?utf-8?B?blNsT3NIbXpCSXJNRDRiSVUrb0lUL01YNldNU3I5VXZtV2dFWWZoa0xrVVkv?=
 =?utf-8?B?b3VlRW5KVjNJYk53aVQyQlFVMGJ3YlpRVGVPZkNleUV4WlhlaDgzNUd0dHZk?=
 =?utf-8?B?SjNBSlhONGRJcHFQRkpubHkxem9saXNPYWF0NGpkVFM1b2ZRVmlXTGlQdW1O?=
 =?utf-8?B?bUh2cmM3YmlwTWxzQ3lvalkveSt2YXVwcWl5UE1ySXRuQ095eWQ2MVV6SlUr?=
 =?utf-8?Q?DdAzVckUBJqEztYxMoMb/4KYvXITa+5SEhAOrbNTcfg3t?=
X-MS-Exchange-AntiSpam-MessageData-1: YLlpiIwSX8iDww==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62426a78-a2e8-4962-9aef-08de7b22b6d8
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 01:50:16.2569 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QqJ3NLLVtCzpWWlWfYKKeoEQLuQ47hRznS9MQ5s7Db7pBsrkPWSTrw2ong/2rwSohwg6v5Qya7rkaBMjGo4nAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7856
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
X-Rspamd-Queue-Id: 49B2C21A5CD
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
	FREEMAIL_TO(0.00)[nvidia.com,kernel.org,google.com,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Action: no action

On Sun Mar 1, 2026 at 11:03 PM JST, Alexandre Courbot wrote:
> This safety check was an assumption based on the firmwares we work with
> - it is not based on an actual hardware limitation. Thus, remove it.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/falcon.rs | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falc=
on.rs
> index 450431804e1c..c02b73b1cfe6 100644
> --- a/drivers/gpu/nova-core/falcon.rs
> +++ b/drivers/gpu/nova-core/falcon.rs
> @@ -527,13 +527,6 @@ fn dma_load<F: FalconFirmware<Target =3D E> + Falcon=
DmaLoadable>(
>          bar: &Bar0,
>          fw: &F,
>      ) -> Result {
> -        // The Non-Secure section only exists on firmware used by Turing=
 and GA100, and
> -        // those platforms do not use DMA.
> -        if fw.imem_ns_load_params().is_some() {
> -            debug_assert!(false);
> -            return Err(EINVAL);
> -        }
> -
>          // Create DMA object with firmware content as the source of the =
DMA engine.
>          let dma_obj =3D DmaObject::from_data(dev, fw.as_slice())?;
> =20

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
