Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yL0mHN4xqmlvNAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 02:46:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D9321A500
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 02:46:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED4C10E07A;
	Fri,  6 Mar 2026 01:46:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fGs40ZcB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010033.outbound.protection.outlook.com [52.101.201.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91E0C10E07A;
 Fri,  6 Mar 2026 01:46:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OpCVIU+GTPjIRCelz7YjJRVK5MNEHNJcTmfjAsDeTX/0zy6rKkCjsI2+64sHCpYGXEmztLWddp932RBAyJXrYUheBbzoMdXF+xPZzXAOXxx+FD6zndlEKNQjd0ESyVrd1QX3UP9DlSqsmgZ8JulHwmhxlQTvVyM+1MwkC29V8GCNe2ww9QsRVH+e+lb8s+WbknSVbehL+IBephHsH37Pu9yViFffkjLt2gSPmbRpWGBaYbYhoomSFAyo+YLkqMZYNM2EbFGieOt+98roG6oPj0xuGs2F5eHXeoQQr7otHtxhkR7gu73jtdEieHsXPLbYIqGS2emH+WUr9e352y0BXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CJYBPzM7C0WmMBavxFpo6bVeR2B2JYGIaLXTI3pnviQ=;
 b=tsrHCYC9pwRxY6Z3mAKOKmdlwA1vXcE4SBrgbTRVJUWu5UD6obpSZtnupJ4BcCe9Cj4LqJPlIUHniuZLi7354yxR0aAXpdDgLhCQ3+X7qxnK+OHVwYHRUYRrJZQYq3DAgv4CofJFW4EWhKtx70vgfio3Bi8sCi4rHxvp7SFdKcdzZ8adtTKxhD0yuml1CM2+zNwcPSCFr3I0YRqmBAnX8z1rpC3nExY2PxHXJ4mgvlbcHr8TazhBKNUcbQEm/igGQkTgg5CmCR6bI9rHsYWZ9A5+WgIoEFU70jLJOzZB2YgMVJCWkqVBgLPp3a4vMEmeo/hgi3woYAiITcSrJx8tPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CJYBPzM7C0WmMBavxFpo6bVeR2B2JYGIaLXTI3pnviQ=;
 b=fGs40ZcBZzmrse1bWuamOqRE4ywvpvqrK58t2+eX3nLyFFsnyngrKWtUoushhPmZWXUlxS0CMtOL0+q0uSDAVAeLb4gMWlriE7WE799nV4kFHf+7+ae9qvtqBFp+ZXPrRVED4PB+TX6eNNYSRaC92SKr9rKZUyMldqlyBJlb7q4a70QgxoBC6Du5aYO3WBsXROqvYRsDd0wPERXWkpADQ2nzTPIbiGzdUeAh2sl9NOd0ldGlZmMRqa9iGcMJNufxrPQVha/yid4CPTpMe8VTNSRdE6n48HsZkQ00iYeUBaa/XkJmyUxk6LcCkAsVdFrLUSa1NX177ASRFu1t6hp6+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by SN7PR12MB7856.namprd12.prod.outlook.com (2603:10b6:806:340::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 01:45:58 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.022; Fri, 6 Mar 2026
 01:45:57 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Mar 2026 10:45:54 +0900
Message-Id: <DGVBIV4CZ491.1T8XO3CMD5ZFG@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v10 04/10] gpu: nova-core: falcon: remove
 FalconFirmware's dependency on FalconDmaLoadable
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260301-turing_prep-v10-0-dde5ee437c60@nvidia.com>
 <20260301-turing_prep-v10-4-dde5ee437c60@nvidia.com>
In-Reply-To: <20260301-turing_prep-v10-4-dde5ee437c60@nvidia.com>
X-ClientProxiedBy: TYCP286CA0165.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::11) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|SN7PR12MB7856:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f33e28c-29d3-490f-9890-08de7b221c79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: Cx2JZi2B4U1v6+Kr/yLAFNGIX73RthFkzuX9BslxpMiFpIAOq0jgg/7Ryv6NQY0bU3t1ZC3Gz5hywqTWSSOvmISAiNWDQurpCI1GvDgybBACjirlCeaiMbgwu3oiLDn6MRAZdAB3lrxiTTZBdFRFcubly+t2qx2kUmzrWVwKnnMRoPieSxCpomCRJg3k+OVaUS/H/g8Ns/ecudxo75fA9Kh/3nMjL5naQyVh+F8t02I50WvnLZ3UYQkTcs/dGqCyru1peBv+ZFd4HBDK5Kc9elu+xgJieIkjcOOSsk77yeOCdc5ZG3sQxTFR85aac/999Sf3P6gJu4pMI36ZZBEa5d5ZDdZbjaj9XBo6UjR4QfL29jt9joMMdULJUWG20AwvYu2RmmJySCp23P6euPoo5MfuQxATFADqWeXQNqy+qJN+kAIs1IJTt78h9ugPJ923i3rlF6AifLG4ixXneNHDdCaG8aqNfny8in3dlvuk+ZM+8Cyvuycz4tkxwmvDcJQx4r2Gt9Ifp5fIKpDfAIsU/MCKa94S0PMwVpcOU297ZeDb0Woz7m+Ldne9PAX5/kozqUL1KAqn4iIky+BE3YwjLXLtvQ7SXZNPZdqmH5pkLT3FVz0Umoq4VB6iRh7X4Eh+ntyku897ppZpXVpGrU8spaCX+vx2fChPofeip2AOxSqnqzSLLKknOEXubjGMJtZBEUgDi1m/RSM90SBYfby8Md/iUmUGQoHVIIFc9vkaDKM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWdOS1YySHFpdXF3R2tVYndPTU5jWWlGMGxVcGh5VDdOeUNreGZkSU13OS9N?=
 =?utf-8?B?ekJvTXlBS2VkdTg5QzR3aXZLT2ducDRkbHQrZ292anFsTkNTTTNOUm1HNFhF?=
 =?utf-8?B?NmM4aUlxMFZMU1RaNjFnSVIveDhXbE1kMlJwZm9xSVJYS1AyU05oVEdaNElH?=
 =?utf-8?B?SE9oUlVpNzZJcmU4V1hlMys2MzhDL1B6cVNORVh0TkJ6SlVGUW1QRnRxeW5Z?=
 =?utf-8?B?cFJ1SXppS0lVNUJYSlVUK0FjL29RQTEreXFUUjQ4dUpaMFFJdDJtMHBORkRl?=
 =?utf-8?B?SEJoZ2FBZGlTZ2IwbXdDUUdoOW92Y3dib2tHekNKNnVMQjM0Y2xlRXNXNlJj?=
 =?utf-8?B?cUNsYzVOK2dMYTBram5ML3BDank0VU5LZktjR0YwcDFYdDBzQnBCZm94aU9R?=
 =?utf-8?B?bUtvUysyTE9kWVZJUlMvd2tiRFo4WVdaSldweVE0UlcyZlpTa1ljQkdRck9h?=
 =?utf-8?B?STRCOGg5WnBJK2tmZ24rRXRWc2dBK1VLZEFuMVI2UzdDdjd3VktBaEtyS3lU?=
 =?utf-8?B?V2VEYU5KbndwZ0F2bWF0eW1qRkEvN1Vudmo4NTVheTJKcS9PS2lxblJiVVJz?=
 =?utf-8?B?UG9hTHFUbFRLY25DTGh2aW1kMjY2YTBrNG9HNERySGdWK0hUeGlkRnlsMVlP?=
 =?utf-8?B?TFdRWHg0WXVuR1Y1dHF0dzE5anR3ajZPcGN3cHp5eHlyQWNsOWIxajlKK0pZ?=
 =?utf-8?B?bWt0eGlnQ050RFc5bE5mVnNGblY3V1JqS2JrVzNzWTE4aHhZc0FhVmlNcDdO?=
 =?utf-8?B?R2NUT3JKcFFPV0MyQ3lCaEhncmZhcEdIWlBvR0FDWDhaT296aGd4Wk9zNWY5?=
 =?utf-8?B?aURDMlhRL1lnYk1Ha0JqRGM2d1k1QXcvZkV1R21rcjZ4ZVRJYXplbEc2WlN2?=
 =?utf-8?B?clJZZ2YwYXVYRkkwRUlMQnNETFpsbHdUNVF0VEpFYzI3SHdyVmdhNnczNzBB?=
 =?utf-8?B?b1NSZmtmYjVyaVRZbm85WjRlamhNUnRzL0Y0V2k2SU1EK2JlWVg3T2hZYVJr?=
 =?utf-8?B?bWtYcnhJTVZCbEpaWG04SUFRaklDTzRtNGlvNjVvQ0tobFhybnFBQnkwSUZx?=
 =?utf-8?B?aWRObkpPTlRKVktmVUlqTkR1WXQzcWdQTFcwRVRPUnhKME0zYTE3RFFUVklq?=
 =?utf-8?B?bi9naW5vb3VDZVdMUUxOSTNRL1NRMUpmQXNLb2FoVkxhTGJtbXo4c2ZpQlFR?=
 =?utf-8?B?QnhON1NTaWpQOWM2amRqdEZjZENlQUdJSUQ4RG0zbExKbmxZaDVabjRWbnZw?=
 =?utf-8?B?SlNobjd5YXZUZ0Mxd0FuVEtKbGU2ZGtQbXJuT08xdnc3YWRWcUhQT3VkOFNt?=
 =?utf-8?B?SFFXN3FjaERJd1lBUGdNd2V2SUY2cHMyYlVXU2Ywb2JLekkwN0J5S0ZRVk5y?=
 =?utf-8?B?SHBXRzZYYjlKb0JvUXF4bVBCN2ZoN3p2bVl5eUhoeGlCZDFBWEhaQWwzZWM4?=
 =?utf-8?B?L3hLMy9aNGF5SEFLNTVDRC93R2p6bGxJd1dnU2lCdWl2ZW5vblZueitqdjJ0?=
 =?utf-8?B?NXhuOEkvL1V2cnR6cEJtbjEwSER3Mmt3aENaTDdlU1NBeUdRTC9scWxGLzM2?=
 =?utf-8?B?eFZEVCtrdlFxdzhiSHpXYVM1ZEtUbHRrUkp1VmlZQjQ1ZGsvK050bFRKMzE3?=
 =?utf-8?B?R1UvazhNeDFaRHc2Y1RxRHltTWlOU1Y1ZTVPaW9GbE1GWmxsZHhPaFhZR21T?=
 =?utf-8?B?K3dKd2ZObTJpVTM1M2ZlK1NVOGQ0R2pia29oYllKZUpYUDA3TnkrUUlicDdi?=
 =?utf-8?B?Tzk4ZENobDVScjlIVHJxODhkUjAwMWRBb0Z1NlhNNjFTKzIxdjBwUFo1Nklv?=
 =?utf-8?B?WlZJNjhQa0IzT2pZWmZnUTFSRU1XYXBScVg2QXFGdG1FRXBvazdZbnVjMG1a?=
 =?utf-8?B?eEtRQTNqejREbkRMNjZZaDZWMVV0eW40SmFqTjA3eFVKS0Y4VjRUeDBlem5r?=
 =?utf-8?B?aHZPRlJERGtaczRwQ0xPM2l6U1NWZ3NMbk9oOFNOZVoyeUdYLy84b1VWU2ZX?=
 =?utf-8?B?NHJ0czlvSXlqbFdlMHZ4NDJ3MmhzR2Q1S3NMZXl1R0tYbmtUZFdSUGNiVkRB?=
 =?utf-8?B?d3IrSmNuSEZ5Sno1eVFUNVN2VVJEM0dTdFBxRGdCejZxbjlqaXA4N1EzelJk?=
 =?utf-8?B?NmpwTTFaQXVGNU5EL0d5UzY2Z2o2aityZlJoa1dCcmQ3cklMbU9LQWpZSVJu?=
 =?utf-8?B?dWFCeitlTXEzSTBrZG9uUWg5YUp1alVjVTZYbUZQSnFVVURvT2NDdkJ6MVQ3?=
 =?utf-8?B?R051eHgyM291eUNPU0htY0U3OTlmeHhVUVF3UWx3ZFg1TEdmdEExZUsza1Rw?=
 =?utf-8?B?bVRqcXk2MGNaRDZhUXlzcHg4M0ZDTkVUam4yN3BRUGZoeUo4eFl3cVBHcFBS?=
 =?utf-8?Q?3+vNze0nqP0wgweFNjZumu/u/6KlrGmeKhvUJqhnRewwe?=
X-MS-Exchange-AntiSpam-MessageData-1: cTm68bdFoDBf+Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f33e28c-29d3-490f-9890-08de7b221c79
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 01:45:57.0982 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WxpWOXdIyKJ5JOKvaVxH4BApaUqE3PSvyNE7+wpn4Auv2BG3VYEFVMDkhxDH8aRFGcmj2nYT5Obu/3/PzJjyVA==
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
X-Rspamd-Queue-Id: A7D9321A500
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Sun Mar 1, 2026 at 11:03 PM JST, Alexandre Courbot wrote:
> Not all firmware is necessarily loaded by DMA. Remove the requirement
> for `FalconFirmware` to implement `FalconDmaLoadable`, and adapt
> `Falcon`'s methods constraints accordingly.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/falcon.rs | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falc=
on.rs
> index 9eb827477e5e..450431804e1c 100644
> --- a/drivers/gpu/nova-core/falcon.rs
> +++ b/drivers/gpu/nova-core/falcon.rs
> @@ -378,7 +378,7 @@ pub(crate) trait FalconDmaLoadable {
>  /// Trait for a falcon firmware.
>  ///
>  /// A falcon firmware can be loaded on a given engine.
> -pub(crate) trait FalconFirmware: FalconDmaLoadable {
> +pub(crate) trait FalconFirmware {
>      /// Engine on which this firmware is to be loaded.
>      type Target: FalconEngine;
>  }
> @@ -521,7 +521,7 @@ fn dma_wr(
>      }
> =20
>      /// Perform a DMA load into `IMEM` and `DMEM` of `fw`, and prepare t=
he falcon to run it.
> -    fn dma_load<F: FalconFirmware<Target =3D E>>(
> +    fn dma_load<F: FalconFirmware<Target =3D E> + FalconDmaLoadable>(
>          &self,
>          dev: &Device<device::Bound>,
>          bar: &Bar0,
> @@ -660,7 +660,7 @@ pub(crate) fn is_riscv_active(&self, bar: &Bar0) -> b=
ool {
>      }
> =20
>      // Load a firmware image into Falcon memory
> -    pub(crate) fn load<F: FalconFirmware<Target =3D E>>(
> +    pub(crate) fn load<F: FalconFirmware<Target =3D E> + FalconDmaLoadab=
le>(
>          &self,
>          dev: &Device<device::Bound>,
>          bar: &Bar0,

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>

