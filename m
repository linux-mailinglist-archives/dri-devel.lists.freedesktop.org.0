Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKOoHBA/qGl6rQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 15:17:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1042012C9
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 15:17:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ECE410EA06;
	Wed,  4 Mar 2026 14:17:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="W/5OGGf3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012017.outbound.protection.outlook.com [52.101.48.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0521810EA06;
 Wed,  4 Mar 2026 14:17:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fWsmxDg68HZlMjqfRUx7twAmR7jvmhCEW+8w00Dn5QURH7VfhKVfgtzoGKuMlPd1jcl5mmCUH2lHtpp4xHRhN+hypry5iv2zcd7txTjRjBbUSFusI/e5IZm9n1RUBfBPqsIQawhsD94ZNWHDEdTJDbAzU1hevdaXx8+LvncYI7Kc7kKZE97+IkMuEAwpIYps9mqkm+wQWXDd2QWpEYYBd2hZnApH7kD1MKFxDIH0KfSsLS3xMX086geCvqiLhPAx4Dm0TUTWcJxWv08Dwd77tL9eN4AbLoHCgbBtbodNc95DV60/GUq/zbwtHRt878T4VcUJPS+NAdfFmGqWIJs5jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XFHh43O+KANyonXoL78gasaj0IXy782aGNb91TUzpmU=;
 b=pDgm3U8HzhvpFGbzT0cF2M+U3gW85sKSV9PLlVQ9WZJzsO9U8ngRvGu0USEKPBda/Tfmg6Kk98IjPZvjOKZLBTmFEhJOzQYjLhOyd+5oZ/bEd1eg0NsnAY20wuqvNq4O7Djg0KXzSgG8Ia0Gpk0uMxJruLNGsDSviM9DlMsfq0pW/W0OqTSoU2/RCiMwHMU0IVwvMscA87ocl0YoDTlUeSbUg/L2uNgmoaWT64Uq5EDSJcay+E5TQUK9y5hrIvb6w80+TkEHbMjScQoU2gi3biiWFVVd0Aiy29Kn9z0pa2S8nQCA2kZJbUE/HWd5S/sSmlhEH6bfFeauvYrIcB5G0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XFHh43O+KANyonXoL78gasaj0IXy782aGNb91TUzpmU=;
 b=W/5OGGf3n4o+EdaPHisCThSzaq6TAj46UcuUPyKIvtnrOa+WFZsa4iIgS2x9Eu7pd2OiGIsbFx4h5J46mGkxnItmlhTiIyHQAZQZcGZ8bbxGkJcwxc+PvL1vIYZPlOv2hn4IYYH4ZJ9NWHdtX4N8xzfybkHQdamdx3/1A08zDz/HRA0hbLDrpQY/wS6fM2hQtCVMTWxow99GA+9HoBD4mr6pjKpsSdDBcAdck0WQRL8tFz67SAUk0Hx901KFvP/nudrEY8AXJQLgMoeqFwy6Xv3210gYdTCIZ3TfLUxJ3Ci40xUgp8xjVMv5MIaCVmZef1BC4EMl4rL2cnIVWfQc1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB6857.namprd12.prod.outlook.com (2603:10b6:510:1af::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 14:17:42 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 14:17:42 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Mar 2026 23:17:38 +0900
Message-Id: <DGU29CRUS8BB.3N1UAT96X34YZ@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Benno Lossin" <lossin@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Zhi Wang" <zhiw@nvidia.com>
Subject: Re: [PATCH v3 3/5] gpu: nova-core: gsp: add reply/no-reply info to
 `CommandToGsp`
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
References: <20260304-cmdq-locking-v3-0-a6314b708850@nvidia.com>
 <20260304-cmdq-locking-v3-3-a6314b708850@nvidia.com>
In-Reply-To: <20260304-cmdq-locking-v3-3-a6314b708850@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0111.jpnprd01.prod.outlook.com
 (2603:1096:405:378::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB6857:EE_
X-MS-Office365-Filtering-Correlation-Id: b9ace1b4-1e3c-4c59-04d2-08de79f8cc25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|10070799003|1800799024; 
X-Microsoft-Antispam-Message-Info: 46iWqMRi2S1EvKZIthS4IcVzgcBXHEM9EmICvLsDgqf3rNrU95C96uzkCvjlj7hfMjcf5LpPaMP5wzRg15Zsvw/g4GMaYDcfMfDyrYNSVtXxH/zGDeqy+kX38iak8Is2VVmmsLdIDyrMvJ3eg/7CvIoTkQVlfLocwEvOUPM5sG2u4UAjF6pIygHMbfZBSCXudu767YzMzE9PNd7/M7fiVTTKICpt6MVhnPnH7pBQ5SioJx++jkUdGaeRelqsKGwIvVy6yCapInJF/VCp1QDkUSBUkUIBhWR77CGJCh2Wq/+O0jDjScviY+gOu7SZNDT8x/LNB5UmrKfMimgVQueRJT5AbhMPnOKtPKMjPnVWjibaRw8dvn2Dt/X4Ctf5mQiLGJEXBdFWq8WSWWBgJXW/21fzP7k4NFe2NoPeGnZt2j5HBGoxj5L16W5e5GtG8G+WdDSdyfya0NVEhOeMoWS/+sz/sE3JVB+H2iZVTJoaCDMXOWnWcRWrH+JeqWCTj+HY3qpjGN0mCzWR3mxwj9lpO5YX886JfxuS0C4puD31Qnt3c5045lJg23Qe8LIXiejJ0xShca9xPgE5AaTkKhG/axoCbmyiVqGLAgJFIAiSou+sBvVrzL+a76zxMfJRA7xOVh9Mq7K7oFK9SgNaRlyhDoMJKSrMmfcA0xOAkuDyfkAF61ItJFBdvYOm5OuOXtKdQlHukDfEUAil31x5p7FD9zuHTaNj4xUXtcFsOV2Bdag=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(10070799003)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1c1VWUwSzR4SldvWjJ5RC9zRmNUTVVsOVVieXhSMjAzZVFQU1BEQ3ZDZFNn?=
 =?utf-8?B?ZjJNN3AvbXlsaFUrUWk2Uy9iNTBCSHhTbTJLOFlqTGFnMmt0dEVRRlIvSXNM?=
 =?utf-8?B?WjlPUFM5dTNhSkw4RXNIZUtRdEF6WURmS0VJTm9oV1VpSkJqSHVVN082YzRN?=
 =?utf-8?B?OWlwMHQycWkvMFU5d0ZZSEY5NXhaSzc1SC8vWGVOVjUwbzVodjRaSXZIMVYz?=
 =?utf-8?B?R0Z0eWNRU0tKaXIvdmdyUnVoYXhHQkEvR1ZvSlVUZk9RSGlFOG9ZUy8wOWxn?=
 =?utf-8?B?emcvczN5YitFRFJvalBaYlRiRnRSd0k4SWMxQkNydXVsQXY0RklNMXM5Ukha?=
 =?utf-8?B?L1hrQmhVL3ZnbkVlazB1Uk9KQWtYRGtBTk1iMUh2UXRzdGxDRGdIVUJOZXFx?=
 =?utf-8?B?VE5pUXAvay9uSXR1QXNVVUUvUFJKN0dFVG1keWNIcTZIWkVKenI0bWZFZFBp?=
 =?utf-8?B?Q29EckRhSzhiYkZBUUFkc1NOVThJRStDdHNOWXNZSEVONEFnRjZNUjNyYzc3?=
 =?utf-8?B?bGNCTlJ1K01zSDkwT1VmRUNYbjF1TlJIb3NvOWV0Y0JBNVRuWEdWYzFSbkNL?=
 =?utf-8?B?S2pielBLZ1R5Um5sSWxLL3RidlNobERJUkpSdVZvSnhZSndzMmc1dmFGSUpN?=
 =?utf-8?B?VllVT0o2OWEvWXNxNk1TdmNMRVY0M0FmZFdmZm40bmx5YW5MajRvQk9MZHBS?=
 =?utf-8?B?OTZmZmhqd2lmM0JYcitoMExYYXc5Y1dFc0N4RE9sRm1zUjJ2RGZkdE5DY1VC?=
 =?utf-8?B?MVh4Q0pGUE9nTVFDR3Baak1iWjlmMUtveEQ3V0o0dFF3cnk2UU9xeWcvWnVa?=
 =?utf-8?B?cDBlOGZFMlZNblNERDNjTmZnK3dPWExoVjhzdnVqdTNqNG5mODZWYWxUWXBn?=
 =?utf-8?B?Y3N6VCtpRFVoVGtqWFVGZkY3NCtmVi9LYWgwMkdVa0lUaUNWUHZKVnVvUnN1?=
 =?utf-8?B?U3M0U0NMZ3V2NVNBRGpnZkpjT1JHSnlRUUQ1TUZlQm1FZmlscGNTNXBrV3hP?=
 =?utf-8?B?UU92NjgyV3c3MGdZQTQvUmczd29uVENPUWpoNC9MWmV1OEduYWVyUllCOERx?=
 =?utf-8?B?NXYwNVVOand4RUI5VHVJZUFzdjA0bGEydUpnUUdsT2xqNmNFN25SZnhSZjJa?=
 =?utf-8?B?UjJrYU9DWUcrK0IvZHdLaGZHb09MSU41cENFaE1zblVnYUZlMEErcFR3Uy8v?=
 =?utf-8?B?ZUR2MFpsVmNWN3ZPT1g0NUJDaHkvSlRoUlpjOU1GR2JqUmhqQTRJZ0o0d21J?=
 =?utf-8?B?YWtlVCtxVTlWZ1RWb1paZlpkeUNjaTM4Y0toc0I4RlFMUGlXTEhBTmlXeHg4?=
 =?utf-8?B?WHE5R01YdUNrK3prQ0JyakcvNGc5c21mMHBsL01mRFp2ejcwbktabnpkNkRV?=
 =?utf-8?B?QllNMS8xdlNQYkhvSm5LS1Awd2ZBVUVwRW0vdDlyQ3JrVmcwWkhablhGdGNC?=
 =?utf-8?B?cElIc2JqZVZxV05HWU15eDlxQ1R6S3gveGgvT3UyT2VabklIT1lHajRGT1hC?=
 =?utf-8?B?d2lFL0ZoYm9rdVJMUm1MNDM3WXdYcmQ3cEljL0V2TmhCRjk5eXJseFB2d2dC?=
 =?utf-8?B?RjROOHFrVGt2V0I3dkZHVUhuR0FOamg2U2R4MmU3b1FFcTU0VzB6SEdiMXNX?=
 =?utf-8?B?SnMrUW03NXoyNXNhR0lzY215clVRVHV5aW9hcXEwNnpEWHl2UmwvbWFZeS9D?=
 =?utf-8?B?dzFiSG43Tko3cWdNSEloWnczdHRadGlocXV2Q1phVFBGajFWMHR5MkdKUTZ0?=
 =?utf-8?B?NmlGaE50ZWZPdkorUXdpeVpkN3lZSUZndXlLL2p3OUdaQ0dhVzZKKzlHcmEw?=
 =?utf-8?B?dVFVSVhVV1cxSEMweWo5VWJNNlRGbndET2hoaDRNVitYdGVqVzhaSDR4ZGV2?=
 =?utf-8?B?QVV1UmtRdEhCR2M4NjZBNkhxT1FxbVVEOXQyYXRiWHJzUVJrUGNjMVk0UHhL?=
 =?utf-8?B?VUN4NnJrTlAwWVlsVlJSYWhHWWNSdnlZU2M4ckJSdVZvT1l0YmJpNGNRNHVz?=
 =?utf-8?B?b09zaEFFelgyV3VKN0VodFJUUHMxSUp5dnFFb3pUQ1U4M1R4c3dWT1pOV3gr?=
 =?utf-8?B?VWFsOXhKaEpyY21BK3dldGRRcEhjUmV6RXBxRUVHTWxZWXVyYzRIUnRLUk1Q?=
 =?utf-8?B?TXVZRmxZQmttWElzRmxhemM3Q0N3aDlmWlAyK2ViN3kwM3lqTnM3NmFNUklY?=
 =?utf-8?B?SHA0c2t6ZXlPamNPeVdGdFdRY3UyZlVaVCsvQy9HZCtYcDJGYmd6ak1WWE9m?=
 =?utf-8?B?R1lVNHljaG4vNnlDelVXNTJybWJXemlLcXdzb3E2dUp0c1JxaFJmeVJob2ZN?=
 =?utf-8?B?eUdPYkJwUHBaTmdwdzNxZ2FROUtBWG1DcWE1Ull2NDBrZ3ZFQjZ5YjNyTm5Z?=
 =?utf-8?Q?qXqUJlecqQ7ljaBKNAW9x1sg3mvQioyWAiCQjR62qv7ae?=
X-MS-Exchange-AntiSpam-MessageData-1: /9rIuHpiLvzh/w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9ace1b4-1e3c-4c59-04d2-08de79f8cc25
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 14:17:41.9933 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Bq0Uvbwid+pffsz4iD5RaNFLCpJhQJ1sxokKoa2GBP3kFGQBco3IB0ZIk2rEdud1SwNN/4ukBypEVYpBiSqiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6857
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
X-Rspamd-Queue-Id: CF1042012C9
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
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,ffwll.ch,garyguo.net,nvidia.com,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,Nvidia.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Wed Mar 4, 2026 at 11:46 AM JST, Eliot Courtney wrote:
<snip>
>  /// Send the [`GetGspInfo`] command and awaits for its reply.
>  pub(crate) fn get_gsp_info(cmdq: &mut Cmdq, bar: &Bar0) -> Result<GetGsp=
StaticInfoReply> {
> -    cmdq.send_command(bar, GetGspStaticInfo)?;
> -
> -    loop {
> -        match cmdq.receive_msg::<GetGspStaticInfoReply>(Cmdq::RECEIVE_TI=
MEOUT) {
> -            Ok(info) =3D> return Ok(info),
> -            Err(ERANGE) =3D> continue,
> -            Err(e) =3D> return Err(e),
> -        }
> -    }
> +    cmdq.send_command(bar, GetGspStaticInfo)

Also noticed something cool while rebasing the unload series on top of
this one: all these command helpers become one-liners and are not really
needed anymore! Here we can just make `GetGspStaticInfo` public and call
`cmdq.send_command` on it directly in `boot`. It removes a layer of
black magic and makes it easier to understand what is going on.

