Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGRYJnEeqGnyoAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 12:58:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 065831FF6B5
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 12:58:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 423A110E9D0;
	Wed,  4 Mar 2026 11:58:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="reTITURL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010002.outbound.protection.outlook.com [52.101.61.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E4F310E9D0;
 Wed,  4 Mar 2026 11:58:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c/u0/PZvg6JepBPZzQ3MCSDEAhriv5iLS8s2F13E4NE/8xu+o4wDYlI6yiT8NabhZ/64Ns47/jafRCjHvky3JGTtDZXBzo84UvOINgWMBKxyrNiubGUphAjnKUSKxSG7ZMU7JHS8lQ+ahkqWSedif6Hy7xVSchjyaSwMmFemZWbcXwLvwwORXDFe0HXSpK9EZ37gWrs//Qcu6Z1ywfioVaUnwQo9oVPy5nJugQu4NQsPqf5Hmo9/UsqVEdmLISGBFB53XYQu8Bdf0OPRX0Bcic5wPWdc68o1cu8HkTpR6IYCt4x9hKB8FIJynDLPInYwueKKYZOYM1TevKGYHfeGCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8PMMbm842BCilyUGhbx/ISlWmMFwe1kIvCZp8szx+no=;
 b=IOz4uLkTYl9IGFss3Ph9Z1kG35qKyKeuPu33RS2LTN00dc5US4DwqCE25Zj+F/vgLb3OLCzXAJw29q1CZlCm12KoPC72eR7otryFU4V3Af56eIZ1+qhatqEntFfoFdxqyx7D7bJ2gLsLTWBAhCT9UsU/ppYdY5au0LTRhndeICggqsu8Bn/TQwEpLe84OjeURFKPIslXKIcEY4nLWmZbLnz4dDuvUKcowbN1PVhm4+BcPddLVKe6cTzw4BQhO//+50jeugxXJ9nHE5LAv8FB3m9tozPZ050NxDoFMzJaMOBavs6V0R5Q1OUGzeGEOjx4cHf0UttZtSOmsWVuwXf3GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8PMMbm842BCilyUGhbx/ISlWmMFwe1kIvCZp8szx+no=;
 b=reTITURLFN7EYFJDQz4DEblNPnzmgj89PN72VZrDo2qv5Ifvda+vOZoR7+XjR1b5xekSH/TFLiOYc0E4ceGNWtUZe9vZkuNTwl8N/WdnDDvLgYrkRYuXdAVRwZVflffHQeGsrNLJmswJEx1VbSpg8cj39xJHWZLcZN0lM6hmiqzasTnYjAt7A+ClzJ4XSZG5hN0264VxKqAx/46if5QFmqv0iS8KNVt5X6ZBtnsHpPEoD6OlH4XbO0771PNXyRoFBVtbmZpGNCWIPZRP7qM37oZnYJe8AIkrj1UEFCBSVkDeryAyWqOhYIDJLGDMtGXioWSEM5PbOBtaAMY5z508KQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB6389.namprd12.prod.outlook.com (2603:10b6:8:cf::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.17; Wed, 4 Mar 2026 11:58:34 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 11:58:34 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Mar 2026 20:58:31 +0900
Message-Id: <DGTZATU21WV2.1YRBLUAXFHMVJ@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Benno Lossin" <lossin@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Zhi Wang" <zhiw@nvidia.com>
Subject: Re: [PATCH v3 0/5] gpu: nova-core: gsp: add locking to Cmdq
From: "Alexandre Courbot" <acourbot@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260304-cmdq-locking-v3-0-a6314b708850@nvidia.com>
In-Reply-To: <20260304-cmdq-locking-v3-0-a6314b708850@nvidia.com>
X-ClientProxiedBy: TYCP286CA0033.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB6389:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f975af8-ca69-407d-ac21-08de79e55cea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|7416014|376014; 
X-Microsoft-Antispam-Message-Info: yrg8tqQDzjY7wjuARB0IaFtAp176lY7RNFqV2fjBaPioebZXtVAB/BDNmqxzspBkdieDpM9uI+jcJ2dZpx4UHOBRKZTRaPYHYXXdYjMV0M3Te2mpxcG5874GfqlLAF5YBQQyoLlDDGFfz+gVJK54x0YH3tlE8Da1E8J8BhCrXBJIOXz8x05k5fdHipmij1KcHOpqBI2OvTjB/wXhJqDUSzWDF/cLphhFEpoISd4GhuNOoqaK/9OGHkG779RZi/VUCenwe7wzNN2m8/XEOpN/nlXbjHr8Lf+y5ymPHMrDxYpd0xeuSUKwzDt6J2gFc8Wz9LnK2mLdz5+6yuFRr2cSzOSvMIRvHEjnlqX+C4lP5Km7mFyTNGD6xzZgFwhsGFVLrUxqQvKwp/wtlD9Ehzpscpk5magsbw5tMCffyQs6UmKQcg31eaQJ57idjVkpVJsQZqkilYflW6yB0xYwxAAIcBdkYOxpV11DjeGL/m386wgWW2Mgnwh//LvC+gcgvETB3BLkECBdHPsxvfmzy/CWWG59GYtTefSuT5PdwfFD8tSxSbrskStugtLqlEOa9AsAE4ziu2ZHW/Yv/MRMnEJPvTQQpEFZBhj+CrX8CiCHMh3PFlSKzh63uXcUip9nRIQnBBN3bmBzTDEUy3BcNR+H67dFK5KT1nT0m+hCdyXCZznxqOQH8Mpsm8qxJ0HFc5DiWCu6W1QKurqjjKk10HE/ctNRZOnes+sd22d1NlR4D/g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHBKUDlSSlVWNGVUSFJhYkJHeEVBQ0hzbW5yZy9CbTljeWplRGtaVmdQRDgy?=
 =?utf-8?B?TDV0RExVeGo4RmVRbFoydFUrR3lXeTE0Q0RFejZUNHY4TkNnd2xwUUp5a01u?=
 =?utf-8?B?SEgvUXFxS3A5S2tnaGR0dDlWb3R5Z2RWbGlXR2w1UjFsNTI2a3ZBKy9LUEJ4?=
 =?utf-8?B?dStFc2xGV1lwaHlKRVhlR1JuYWVHd05ucWNmeEk0aU1NTmpLNnlFVllmaDlu?=
 =?utf-8?B?T1RyS2JEK1JDWXBpMzhyYVBlVjNQQmxRSE13amFud0dsMHREY3lLMkkvTmk2?=
 =?utf-8?B?bndsT1A2VjFxNEM3dmx0SEovVXlORkViMXlhbm5wTXdienNVSDFDSiszVXFK?=
 =?utf-8?B?RWdDTUpVZlV4ZVcrVUw5K3p1NlR3YURLWmxzWjZ2TS9raW5zeEhBZjZCazM4?=
 =?utf-8?B?QU1QK2s4MHNFNEpDcEl4Zlo5VU5SeW9zZENVVkFDWFZOK0dOK2dpWUc2UkRy?=
 =?utf-8?B?WFBIV0NWRiswbE9JaC9SU3FwaG5hZlBsc0RzUVNpODF6MGRpZ085OGlmSDhN?=
 =?utf-8?B?elNHWmFtQmtBeTRpRE5NdEtZalFqSjh5N1BHRFNKSWswaFR3TFFaMlNDUExm?=
 =?utf-8?B?WkkrQVJKb2NSNXd3clRnMFN0N1B0SWh5RGsrb3BSNXVOalIydUFocHRVZWtm?=
 =?utf-8?B?MEhlNkErdkJCWW45WmdFT1YwR1IvbHFGaVdiSmxGOTFsdW9lOGt2R2pJYkJn?=
 =?utf-8?B?NVFFclpHd0VEVUx4cmNaVWlyeXpsRnJZTW10aXZzL2IxZmFRTVRhY3RyRGZX?=
 =?utf-8?B?eHZZc1pZays0bFpaNmNCeHZ0NTc5bjlmL1E2MU4veTh5eHUvT2dnb0NzZFVh?=
 =?utf-8?B?YTF1MXIwY0VPU0tXUVEvTmRQYmpreElRWXVMSXBJK0ZaVlVIU1RsVWZiU05x?=
 =?utf-8?B?QnZHRzhqMXBOUi9YTlpuSzZnaUdOdzlHSWNVcHNEUnFSa3crREJQN2wyZFVV?=
 =?utf-8?B?MGtSWGZHcG1PVzEzYVdoYVhjbHcwL0RLWkNHR1VScUduVzhHMTV6TlRvM3c3?=
 =?utf-8?B?YkxnUUxLTWhENTRvRnd1TXlqNG9Tdkg5amxRQzFseGo2c2xuMi9DeEYyR0dW?=
 =?utf-8?B?U2w3ZDhqOVFDQTIxSzh2Z3FqN0xrSmhmaER5RWhTTkhRbDRoTVo1WGF0MzFq?=
 =?utf-8?B?RFhSZnNpTjhTeUQ4Wm9uMEVSdHBoUjVDNi9DNkgzVkpZU1htZlduTHkvUnov?=
 =?utf-8?B?azExSEtxNk1yWERJNWxBN2lvMU03V1l1Zk5OQ0hWSnlXRGNwNDhwMnhaOXAx?=
 =?utf-8?B?NUZHSVQ0dHZkeERraytDSkh1TzNhWnpZODJOcnV1V2FJMG4wc1ozYUFPdXNJ?=
 =?utf-8?B?ckRIV2h2dW5kRUQveitBeGxxODVGTzNmYmx2VjYwMjg0S3d2c2htZzhxakhV?=
 =?utf-8?B?YmpIZWFiT0NpcTExaGNwSlR5ZFFneHNoa013blpnRCtPMDgvVzdLckpwaHVW?=
 =?utf-8?B?bUgxMGV4S1ZvWDlJY0RTaHA3ZVV1UnRKZ1dOaXcwb2dwdkptYkJZN29wU0RU?=
 =?utf-8?B?RUZPUGJBdmJMSWdqK1Fab2RnU2poQVlqV0wrejVTckcxVTl2UXkwdCtnRnhT?=
 =?utf-8?B?RGU3dnFZRXcrbDVJTjZHTzRWTWVTRjkvS3VPTjFxTHF0Y1Rqbk4wdU1tTGlN?=
 =?utf-8?B?VWZZRmUzTWc4OHZpV1JQRHlmSWFNa3krN2JFcVdrYzBMQllnQlJQcy92QURP?=
 =?utf-8?B?elRFeXl4UXR1ZHpFRVRLS3ZJbDVkaDVVMnhGK3dKdm5hQlJJN01lOTI0R1pZ?=
 =?utf-8?B?cUFBeWdoLzZ5SWY2U0FxUmEwUUJkSThlS1hpQjZIYUJCand6SDR3T2VPclYw?=
 =?utf-8?B?STRTbk9BcngyTHZIRGxJSkNQK2p5Y01jVkZDSjY1djJoS1JTVUo3NnZEY1l4?=
 =?utf-8?B?eldvSHFUdmRGZFBycFhoVTVFR1gvRCtSejJRUXc1UGRrSWdJc2w4UE5qWjlz?=
 =?utf-8?B?eWh6RTcyTXRuSTBwTmp4Y3hjUW5Sby9IOWdkWU9wRUE1STk4NE1xY1pqUmc1?=
 =?utf-8?B?UjFpTFJ3RW0vUWZYMnFZeHRhMXR0UlROdGZaV0djWi9OcVdQemNiYVQ1dG11?=
 =?utf-8?B?cDdoSUE4dlJueGpMc3BIWFVRQ3JXbHJXczRORlJpWFowbnNtbWdEejAvZWlH?=
 =?utf-8?B?S1IxSEcwbDJMOVBIMm1TMnJOdTREcHNHcFFObUlDQVozOVZtT0w2R2xSSEsz?=
 =?utf-8?B?YnZOQTR4WWJtNUtaSzJqbjZjUTZoNEErNjNpbFZoTm1INjhYeSs5b2paNmlN?=
 =?utf-8?B?cW5GK1o0djhSTDI1QkRDZStLdjRtbUFEVDJtOVIrYkxGdHhvRldvRzJmdkEw?=
 =?utf-8?B?Qk9VcWppdkhUZnJGK2xhczNZSmZ2VUx6Y1BuWDVLNDQxOWw3NUpQOGxsamxL?=
 =?utf-8?Q?+S7ejWFR3i9rQalgaKQkJc4AEJ1IvMtu7XPGCWByAHpH4?=
X-MS-Exchange-AntiSpam-MessageData-1: xWhckDCoft1AEw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f975af8-ca69-407d-ac21-08de79e55cea
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 11:58:34.8004 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vtjOxtbVzKlnBwvvGUlYgb79Vn4plGuAad0BCpxOrZcFLVaQjfgU6hjBphk0irtXM1FesA7Q97/iHkIbZZJXnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6389
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
X-Rspamd-Queue-Id: 065831FF6B5
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Wed Mar 4, 2026 at 11:46 AM JST, Eliot Courtney wrote:
> Add locking to Cmdq. This is required e.g. for unloading the driver,
> which needs to send the UnloadingGuestDriver via the command queue
> on unbind which may be on a different thread.
>
> We have commands that need a reply and commands that don't. For
> commands with a reply we want to make sure that they don't get
> the reply of a different command back. The approach this patch series
> takes is by making those commands block until they get a response. For
> now this should be ok, and we expect GSP to be fast anyway.
>
> To do this, we need to know which commands expect a reply and which
> don't. John's existing series[1] adds IS_ASYNC which solves part of the
> problem, but we need to know a bit more. So instead, add an
> associated type called Reply which tells us what the reply is.
>
> An alternative would be to define traits inheriting CommandToGsp, e.g.
> CommandWithReply and CommandWithoutReply, instead of using the
> associated type. I implemented the associated type version because it
> feels more compositional rather than inherity so seemed a bit better
> to me. But both of these approaches work and are fine, IMO.

The associated type seems to work just fine. I was wondering whether we
could mess with it by using other types that do not implement
`MessageFromGsp`, but in that case we cannot call any of the
`send_command` methods so this approach looks good to me.
