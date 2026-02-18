Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJq7NF4nlmkvbgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 21:55:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D128159A0B
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 21:55:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A183A10E641;
	Wed, 18 Feb 2026 20:55:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uk4mY8Bj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012049.outbound.protection.outlook.com [52.101.43.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 636A510E639;
 Wed, 18 Feb 2026 20:55:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vaJ5oKq9zGAmDNX3v8W6Fw2cVv63mJ3F4JJlF4o8D/GXmnzxtoasbKOw5KfdJr3PBcQX2nGvNxbq8rUMLg9eUtpcr/DVq5n/navvS3xoPBIWgqLM9F8NPFdJyrRUAFdvP7RUAxg9mQ+q7PCFPzfLZEUFSWznR52Fb+6099sr2A4zbXBiiQXiCZ4pa/TF4MiFlgAnwSJH80qswEbFQqorDIBlF38gFVflmsu2O5YSFL5akgXp3sluHvS6NbGj6Q+HIi8PELkiVscpQs5Q+OjLglCfNf60XENsrnADZd/nOm7jUnAi9VmPPrZhI2TTEGutTiYQ95w3udRVUh+zqc3RUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QitZCSds41f305Yoe2EZt3iUz62k6Lt1ya6zmGk5VIA=;
 b=ijYGAGZZf4PMJlAF0GqwvckAlNG6QyuFSmW7JGFiPJ4o8pyGIDMDJvH/dQ2nqYFagIZqtWcJug154dvOUv/8gLLsmfm9QqdLgx0pNU5uK3x+5QwVqSUwKir+p5NFUk7wuinOGQEsKTOQvM/E00SPxU4VF25U+ySzKf8ZCdntf3433QJLEOjLcS+okxyO4uQVf4xVqObfiE1qn9spWQshYUpDvpKBi/hLoBZQsys0d+aNeI/yHbF5CnmNzG4rOXA1zT/ToSgJCO8ugAFkdV/1/jGQkyZYbC8Pbb+UhGGlOBy7AfBva9E5fwvoq6dn1e17M1KkAN/QQ+ZihlGtmCPoMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QitZCSds41f305Yoe2EZt3iUz62k6Lt1ya6zmGk5VIA=;
 b=uk4mY8Bj6rq3cem6K79VayDtzB7UlGLiO4pTUhphkCPeD3/ChgL+0E/kYfHJSCJ1LTvtuRLe1ymqBbfKyBPbVd3Tj4aZz3ZMbo9p60c5Wn0058hxPddT3KdbivwRQCbrKe/CvhNmBKP14m/HhdwjkNvlbWgCovtmiQYMRgtN/ZooHAokoBmo/nJf+HIrEkWHAdCizgwPCYndUNwr2fyZKPtQOnGwgZi2f2SvdV9m8BYYoLcsBs+206L7n8exTSwVTAkI3L44jY7JphjzVFyTu9+sjrhvpyUHvExEYpSo2EQyPRo3RyaBOlHD12rrKZ1ymId8zdityHq/qXT7udXQVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH0PR12MB8031.namprd12.prod.outlook.com (2603:10b6:510:28e::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.14; Wed, 18 Feb 2026 20:55:51 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 20:55:51 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>
Cc: Dave Airlie <airlied@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Nikola Djukic <ndjukic@nvidia.com>
Subject: [PATCH v10 5/8] rust: clist: Add support to interface with C linked
 lists
Date: Wed, 18 Feb 2026 15:55:03 -0500
Message-Id: <20260218205507.689429-6-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260218205507.689429-1-joelagnelf@nvidia.com>
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN0P222CA0019.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:531::25) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH0PR12MB8031:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cccc97c-b0c7-444c-34ae-08de6f3019b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lkX/AFRCbOJq6/JlaJ7rEtFaWQXL3fawygrCnU0WUOQWIyAL/zSiu7RsiMBI?=
 =?us-ascii?Q?+JAoA7I+euM4/7jt5niHXwpjhiYumz/MDSAJUqE59Y1V126/ttTazvxaP0kV?=
 =?us-ascii?Q?bY7U5+7/e8ZAEkjHBXAZHt6PXGMDR+7odLsdEkGuYu8kfqRNUDH0YMMUjx/U?=
 =?us-ascii?Q?C9h5hChDj6LDd1PjPxl16PwaySYTUg7knrrpcn3ptzeqQksqw7V+vFePWeI/?=
 =?us-ascii?Q?iHCkXYcuYSBWb8qWSFJDJRHvVjJ/+MbYxa4jN5F3hcwRgJhIQCYkO/GcIh7+?=
 =?us-ascii?Q?l3YUEBmxxx6q5RrobFi96tqLmby7bSBC6mQCFfhm8AQKMowHTIjoFU/6qKgl?=
 =?us-ascii?Q?I8WaMcZ1S4lnH8tyh50M3ULaLhXGhBqP+cpC5/PaoGZThByuK61ajf9ch9dh?=
 =?us-ascii?Q?PzCAp1fa17lNzAG+K4OMOFrCM9ujd8a0nStkjKZGbcWPHMmDmIxXkitF2T7h?=
 =?us-ascii?Q?mAz2a+6/sjXyeHBY32utLX6uqx8/+Q4xM0px60O6ujibvna3H6nZyrRsKStT?=
 =?us-ascii?Q?Ci9AIdIH0utQaHpbj+K980GSuT5pLs2PdgGNPl+9r8Il8qFAXHcemYzGpNqV?=
 =?us-ascii?Q?zOk5lYtlgJzvSrm48hUzej258Lj05tvaIFPEzHRbgdcu1tNBtOoak9GmDXIx?=
 =?us-ascii?Q?pACkmXImlIvTTKasHJIvG8lEBqEOCTbXblE5YNttYxgCdx+cGdlyXqoyVyeI?=
 =?us-ascii?Q?Lal5SPf5QOdpKgXSVXUy79VR6h6zcY4arv5sOtag6Krb9pHQOYOtNtF7P9tY?=
 =?us-ascii?Q?SRsCNvD8GZyelZCBwkRMVmAgFwSH5sumnDP44csZqAMc8pAya/Sc0/44g3dh?=
 =?us-ascii?Q?g1Mp25Flx+9svKedDULFj/vR2AcPZM4wGN3b03C4zidjAU8Z4MT7DAHT5E5V?=
 =?us-ascii?Q?UMf9BsSLDf104OXRCn5hHdJtj86fTYcqpqdvEt1W4l2uD9XRoYX6FtDE+ikA?=
 =?us-ascii?Q?CfyyzScwo0vIKzG1IEipIGsseihp+96jV+YcM2gDKLGqy0468VKQ84ZT6PNW?=
 =?us-ascii?Q?p2gYvnxGgoG2tGAowzmFyUOGdp1Yk/3qv5Pq5W+0n40NnNkPVn7fogacN7Cy?=
 =?us-ascii?Q?MbTy9vPLiT2l3m/ESFOhEuwlz1FzppMpVTXXrCjvwI0QDlpVswm+a9eVuyGd?=
 =?us-ascii?Q?tQiVK0poUdZi/jQf06lX4GkTrdE/Yijg5/E5mf5+1sut2YwyTRlGpkBYoisA?=
 =?us-ascii?Q?bnWQW7iGJtv+oLQb76GDDeGM11I61pyfRfuuPof+DFoeet3l8tlHN9+XJuuQ?=
 =?us-ascii?Q?Y7/ibcotGFTBVlmjDcL86jMYNgNOfjmiNF661qvLS2S5CWzsqSFd0Bedj3qw?=
 =?us-ascii?Q?AUOmv98XqFmsEw6E4GpuJpLQzS/1kGlhlmSkd7ueYXWdpoDTuZrDFzwLotuP?=
 =?us-ascii?Q?1nYDHMbKalizN71YLoPFYRUzE1Tw8MXrRxUjxHCK9rd1+HYTTxZqxPdQ50cx?=
 =?us-ascii?Q?7kqk+L1uJRRicIeOKPqmtRJQMfCptJSTboLzDqDmKfkVsBMQKliReS48mAEH?=
 =?us-ascii?Q?mb8IjlwmDZdzWrS+dqpHg3axog1IB5N3SCmnts2KOWWb/a4LdJWlsW7vEd3z?=
 =?us-ascii?Q?UBMJdq4roWQmnYm2nbs48x7vE8c/A0UpSB2XB0HVY+Um2jjZotCo5nplhDkr?=
 =?us-ascii?Q?oA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w3i2YGL808AL/drO+PNG85OCZgYKHEops/sVbICgOv2Omufs/ttweXbl1mVy?=
 =?us-ascii?Q?BJfxPQ8M0YumRogdhma8DgRv8EFJFtSCxuHw3SD4OsTKIIxqVOoHVSLUfC6X?=
 =?us-ascii?Q?vTK73N5kr9bo7D27HH/UzUBHcNp+JTPfokHxE6njpfC42+qX+dcRU4BXtqBI?=
 =?us-ascii?Q?E06UrHGcgM/fPl98hcy8TVMo+rxe5o9PzwsthJdBDtIjpNMDRM9k8BAeU13s?=
 =?us-ascii?Q?Fjsp4ZuHSgrodAFt7WHLD67ETMspBObcBpTGIyGvBquNR9ayUpKEfCU5b1jC?=
 =?us-ascii?Q?4QZqj18KmVvDRS90VYkbcyQUYK8C/a4f81HHC0u7ziU3SQhp7eyIFNKud/lT?=
 =?us-ascii?Q?5ztIR/Mn9X8Iio9YA+BxaU5YwN0G2CwyBKlC9drp69arFxJZMnEkH1cF4uQk?=
 =?us-ascii?Q?RTuv9CvLsHF6MMMwX1SqG+QTv/ng61+f8sMtBVscudPco7TiFIdtzrG+q95E?=
 =?us-ascii?Q?CLnXhHcEqd3W8gVRqtT/IvbqnMd+6RH586gqwxILy50ua7KKXuCYV2L3s+NR?=
 =?us-ascii?Q?Js/JpPl85u8dUUuMPyqUWw+uhi/yeyf5CRF0AUaA+Oaz3ZpMtTwyqabb0S2Z?=
 =?us-ascii?Q?VCWF/OKDJj0dmvsrjoOi0ZaVQ81dcRyP1ENW3vau7Y32fFn9r1/uiusKd76z?=
 =?us-ascii?Q?lB0/Wjt1YdLgbwSCllXcMIlzimeckPOaPMN2j0zY6eTjAttwANRcSmX5x+1O?=
 =?us-ascii?Q?66IVJ5Fl6fO6NhmTa2znjQDv2lWgwvNTwtpHAd3ZRsl+HytRnE8zpFEZVoct?=
 =?us-ascii?Q?jz4EiEmtVWggdL3cHh1QqCt7mbRW8WkbV+a1PBWsOjW8HRIj2ITbGuAL9Ga9?=
 =?us-ascii?Q?Xv6BrDNCaXM+GB5iIi0w/SL55m3LmLtcNfPqe3tHb1TguY/NRrMMzpY+q7be?=
 =?us-ascii?Q?KdjHADzMiKKFRDPpVGeJubk1c1D+mCF/lwe+eddLzxDmmxnljJeUueCbgw/X?=
 =?us-ascii?Q?ZUwqjFDSmYng9CDQHRrod/BbuDXwYVv3I40MwYYmJHTUxPyIw33J4qYna+rU?=
 =?us-ascii?Q?FOqh5kXFaSo0Fywuo9go+FPUBFVBUIFH9mOpEGtDbQa7hU5oDxeZvJGPxQV9?=
 =?us-ascii?Q?udx7PDpW6NlbN5RN9vCqHWv8OdxATHLJbSEHOrng/3JGTq5CLkFcmDj1Z90d?=
 =?us-ascii?Q?Z1DbNZZ4vmColDS9/9LlqSOTeigzSY6nl8FTck1ewR7puC7SzKUXxxdmvVw9?=
 =?us-ascii?Q?8IL47cn4e+xIkc5xKQPWoeyHzRPoiJqXWh7Mm2H6bLiO6Ll8WnRw+IBRAQ+i?=
 =?us-ascii?Q?aMRlMJZ1q97P20KEWZPyZapma+34kP5OaUE7662H8A4wfywMKp7ZP57J+u6n?=
 =?us-ascii?Q?bpz8zclIMX5Gk9rnWYtU0HMiN2NishfkRq+4oXvigPXCuRh/WuvzeQDnJNf/?=
 =?us-ascii?Q?rSIGoAAUV0NA7FW83w3RpbDPamBE/xYV28SwYtt5f+OYhg+jWOCsgJXAD5iR?=
 =?us-ascii?Q?kFUzPsxnW+wACbbHcQAvFcy/Od3Hpp7/7K8RsQQViM+RI4kEffjWrESeF/C/?=
 =?us-ascii?Q?YbQhDgHegQRZ5O7R0kIKy0Q1ZH50MGbARuIn7vLjNNwsH/AP1B9M1BU56F2e?=
 =?us-ascii?Q?FiBATL1ue8fZSRW9GhN8yMAGcVPRGrs+acMIEStSy5k09vc4o6ggt0SHfFLa?=
 =?us-ascii?Q?H9txh5xN2NCaCDC08TRoTad9rHpYd+N1t/nOR9Avab8KnsCpMP9reLrM+4uK?=
 =?us-ascii?Q?M3KiyctRqqIWvsEpp7+90Say9T5TsD2vQLoW+Q9gsC4yYHoV5rB82vGygrCO?=
 =?us-ascii?Q?roOmd4lWLw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cccc97c-b0c7-444c-34ae-08de6f3019b6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 20:55:51.6502 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DsqeRUeLfd2V66PqXf5m6yB6XiPOeghTTM4Ttv5La69/GtIZKiQiIWk6hsMsJ4K5ftgg0FW47AGwhFbHqUXclQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8031
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[vger.kernel.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,nvidia.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim,garyguo.net:email]
X-Rspamd-Queue-Id: 5D128159A0B
X-Rspamd-Action: no action

Add a new module `clist` for working with C's doubly circular linked
lists. Provide low-level iteration over list nodes.

Typed iteration over actual items is provided with a `clist_create`
macro to assist in creation of the `CList` type.

Cc: Nikola Djukic <ndjukic@nvidia.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Acked-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 MAINTAINERS              |   7 +
 rust/helpers/helpers.c   |   1 +
 rust/helpers/list.c      |  17 ++
 rust/kernel/ffi/clist.rs | 327 +++++++++++++++++++++++++++++++++++++++
 rust/kernel/ffi/mod.rs   |   2 +
 5 files changed, 354 insertions(+)
 create mode 100644 rust/helpers/list.c
 create mode 100644 rust/kernel/ffi/clist.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index 14b4f9af0e36..4647f4601038 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23213,6 +23213,13 @@ S:	Maintained
 T:	git https://github.com/Rust-for-Linux/linux.git rust-analyzer-next
 F:	scripts/generate_rust_analyzer.py
 
+RUST TO C LIST INTERFACES
+M:	Joel Fernandes <joelagnelf@nvidia.com>
+M:	Alexandre Courbot <acourbot@nvidia.com>
+L:	rust-for-linux@vger.kernel.org
+S:	Maintained
+F:	rust/kernel/ffi/clist.rs
+
 RXRPC SOCKETS (AF_RXRPC)
 M:	David Howells <dhowells@redhat.com>
 M:	Marc Dionne <marc.dionne@auristor.com>
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index a3c42e51f00a..724fcb8240ac 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -35,6 +35,7 @@
 #include "io.c"
 #include "jump_label.c"
 #include "kunit.c"
+#include "list.c"
 #include "maple_tree.c"
 #include "mm.c"
 #include "mutex.c"
diff --git a/rust/helpers/list.c b/rust/helpers/list.c
new file mode 100644
index 000000000000..4c1f9c111ec8
--- /dev/null
+++ b/rust/helpers/list.c
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Helpers for C Circular doubly linked list implementation.
+ */
+
+#include <linux/list.h>
+
+__rust_helper void rust_helper_INIT_LIST_HEAD(struct list_head *list)
+{
+	INIT_LIST_HEAD(list);
+}
+
+__rust_helper void rust_helper_list_add_tail(struct list_head *new, struct list_head *head)
+{
+	list_add_tail(new, head);
+}
diff --git a/rust/kernel/ffi/clist.rs b/rust/kernel/ffi/clist.rs
new file mode 100644
index 000000000000..a84f395875dc
--- /dev/null
+++ b/rust/kernel/ffi/clist.rs
@@ -0,0 +1,327 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! FFI interface for C doubly circular intrusive linked lists.
+//!
+//! This module provides Rust abstractions for iterating over C `list_head`-based
+//! linked lists. It is intended for FFI use-cases where a C subsystem manages a
+//! circular linked list that Rust code needs to read. This is generally required
+//! only for special cases and should be avoided by drivers.
+//!
+//! # Examples
+//!
+//! ```
+//! use kernel::{
+//!     bindings,
+//!     clist_create,
+//!     types::Opaque, //
+//! };
+//! # // Create test list with values (0, 10, 20) - normally done by C code but it is
+//! # // emulated here for doctests using the C bindings.
+//! # use core::mem::MaybeUninit;
+//! #
+//! # /// C struct with embedded `list_head` (typically will be allocated by C code).
+//! # #[repr(C)]
+//! # pub struct SampleItemC {
+//! #     pub value: i32,
+//! #     pub link: bindings::list_head,
+//! # }
+//! #
+//! # let mut head = MaybeUninit::<bindings::list_head>::uninit();
+//! #
+//! # let head = head.as_mut_ptr();
+//! # // SAFETY: head and all the items are test objects allocated in this scope.
+//! # unsafe { bindings::INIT_LIST_HEAD(head) };
+//! #
+//! # let mut items = [
+//! #     MaybeUninit::<SampleItemC>::uninit(),
+//! #     MaybeUninit::<SampleItemC>::uninit(),
+//! #     MaybeUninit::<SampleItemC>::uninit(),
+//! # ];
+//! #
+//! # for (i, item) in items.iter_mut().enumerate() {
+//! #     let ptr = item.as_mut_ptr();
+//! #     // SAFETY: pointers are to allocated test objects with a list_head field.
+//! #     unsafe {
+//! #         (*ptr).value = i as i32 * 10;
+//! #         // &raw mut computes address of link directly as link is uninitialized.
+//! #         bindings::INIT_LIST_HEAD(&raw mut (*ptr).link);
+//! #         bindings::list_add_tail(&mut (*ptr).link, head);
+//! #     }
+//! # }
+//!
+//! // Rust wrapper for the C struct.
+//! // The list item struct in this example is defined in C code as:
+//! //   struct SampleItemC {
+//! //       int value;
+//! //       struct list_head link;
+//! //   };
+//! //
+//! #[repr(transparent)]
+//! pub struct Item(Opaque<SampleItemC>);
+//!
+//! impl Item {
+//!     pub fn value(&self) -> i32 {
+//!         // SAFETY: [`Item`] has same layout as [`SampleItemC`].
+//!         unsafe { (*self.0.get()).value }
+//!     }
+//! }
+//!
+//! // Create typed [`CList`] from sentinel head.
+//! // SAFETY: head is valid, items are [`SampleItemC`] with embedded `link` field.
+//! let list = unsafe { clist_create!(head, Item, SampleItemC, link) };
+//!
+//! // Iterate directly over typed items.
+//! let mut found_0 = false;
+//! let mut found_10 = false;
+//! let mut found_20 = false;
+//!
+//! for item in list.iter() {
+//!     let val = item.value();
+//!     if val == 0 { found_0 = true; }
+//!     if val == 10 { found_10 = true; }
+//!     if val == 20 { found_20 = true; }
+//! }
+//!
+//! assert!(found_0 && found_10 && found_20);
+//! ```
+
+use core::{
+    iter::FusedIterator,
+    marker::PhantomData, //
+};
+
+use crate::{
+    bindings,
+    types::Opaque, //
+};
+
+use pin_init::{
+    pin_data,
+    pin_init,
+    PinInit //
+};
+
+/// FFI wrapper for a C `list_head` object used in intrusive linked lists.
+///
+/// # Invariants
+///
+/// - [`CListHead`] represents an allocated and valid `list_head` structure.
+#[pin_data]
+#[repr(transparent)]
+pub struct CListHead {
+    #[pin]
+    inner: Opaque<bindings::list_head>,
+}
+
+impl CListHead {
+    /// Create a `&CListHead` reference from a raw `list_head` pointer.
+    ///
+    /// # Safety
+    ///
+    /// - `ptr` must be a valid pointer to an allocated and initialized `list_head` structure.
+    /// - `ptr` must remain valid and unmodified for the lifetime `'a`.
+    /// - The list and all linked `list_head` nodes must not be modified by non-Rust code
+    ///   for the lifetime `'a`.
+    #[inline]
+    pub unsafe fn from_raw<'a>(ptr: *mut bindings::list_head) -> &'a Self {
+        // SAFETY:
+        // - [`CListHead`] has same layout as `list_head`.
+        // - `ptr` is valid and unmodified for 'a per caller guarantees.
+        unsafe { &*ptr.cast() }
+    }
+
+    /// Get the raw `list_head` pointer.
+    #[inline]
+    pub fn as_raw(&self) -> *mut bindings::list_head {
+        self.inner.get()
+    }
+
+    /// Get the next [`CListHead`] in the list.
+    #[inline]
+    pub fn next(&self) -> &Self {
+        let raw = self.as_raw();
+        // SAFETY:
+        // - `self.as_raw()` is valid per type invariants.
+        // - The `next` pointer is guaranteed to be non-NULL.
+        unsafe { Self::from_raw((*raw).next) }
+    }
+
+    /// Check if this node is linked in a list (not isolated).
+    #[inline]
+    pub fn is_linked(&self) -> bool {
+        let raw = self.as_raw();
+        // SAFETY: self.as_raw() is valid per type invariants.
+        unsafe { (*raw).next != raw && (*raw).prev != raw }
+    }
+
+    /// Pin-initializer that initializes the list head.
+    pub fn new() -> impl PinInit<Self> {
+        pin_init!(Self {
+            // SAFETY: `INIT_LIST_HEAD` initializes `slot` to a valid empty list.
+            inner <- Opaque::ffi_init(|slot| unsafe { bindings::INIT_LIST_HEAD(slot) }),
+        })
+    }
+}
+
+// SAFETY: [`CListHead`] can be sent to any thread.
+unsafe impl Send for CListHead {}
+
+// SAFETY: [`CListHead`] can be shared among threads as it is not modified
+// by non-Rust code per safety requirements of [`CListHead::from_raw`].
+unsafe impl Sync for CListHead {}
+
+impl PartialEq for CListHead {
+    #[inline]
+    fn eq(&self, other: &Self) -> bool {
+        core::ptr::eq(self, other)
+    }
+}
+
+impl Eq for CListHead {}
+
+/// Low-level iterator over `list_head` nodes.
+///
+/// An iterator used to iterate over a C intrusive linked list (`list_head`). Caller has to
+/// perform conversion of returned [`CListHead`] to an item (using `container_of` macro or similar).
+///
+/// # Invariants
+///
+/// [`CListHeadIter`] is iterating over an allocated, initialized and valid list.
+struct CListHeadIter<'a> {
+    /// Current position in the list.
+    current: &'a CListHead,
+    /// The sentinel head (used to detect end of iteration).
+    sentinel: &'a CListHead,
+}
+
+impl<'a> Iterator for CListHeadIter<'a> {
+    type Item = &'a CListHead;
+
+    #[inline]
+    fn next(&mut self) -> Option<Self::Item> {
+        // Check if we've reached the sentinel (end of list).
+        if self.current == self.sentinel {
+            return None;
+        }
+
+        let item = self.current;
+        self.current = item.next();
+        Some(item)
+    }
+}
+
+impl<'a> FusedIterator for CListHeadIter<'a> {}
+
+/// A typed C linked list with a sentinel head intended for FFI use-cases where
+/// C subsystem manages a linked list that Rust code needs to read. Generally
+/// required only for special cases.
+///
+/// A sentinel head [`ClistHead`] represents the entire linked list and can be used
+/// for iteration over items of type `T`, it is not associated with a specific item.
+///
+/// The const generic `OFFSET` specifies the byte offset of the `list_head` field within
+/// the struct that `T` wraps.
+///
+/// # Invariants
+///
+/// - The [`CListHead`] is an allocated and valid sentinel C `list_head` structure.
+/// - `OFFSET` is the byte offset of the `list_head` field within the struct that `T` wraps.
+/// - All the list's `list_head` nodes are allocated and have valid next/prev pointers.
+#[repr(transparent)]
+pub struct CList<T, const OFFSET: usize>(CListHead, PhantomData<T>);
+
+impl<T, const OFFSET: usize> CList<T, OFFSET> {
+    /// Create a typed [`CList`] reference from a raw sentinel `list_head` pointer.
+    ///
+    /// # Safety
+    ///
+    /// - `ptr` must be a valid pointer to an allocated and initialized `list_head` structure
+    ///   representing a list sentinel.
+    /// - `ptr` must remain valid and unmodified for the lifetime `'a`.
+    /// - The list must contain items where the `list_head` field is at byte offset `OFFSET`.
+    /// - `T` must be `#[repr(transparent)]` over the C struct.
+    #[inline]
+    pub unsafe fn from_raw<'a>(ptr: *mut bindings::list_head) -> &'a Self {
+        // SAFETY:
+        // - [`CList`] has same layout as [`CListHead`] due to repr(transparent).
+        // - Caller guarantees `ptr` is a valid, sentinel `list_head` object.
+        unsafe { &*ptr.cast() }
+    }
+
+    /// Check if the list is empty.
+    #[inline]
+    pub fn is_empty(&self) -> bool {
+        !self.0.is_linked()
+    }
+
+    /// Create an iterator over typed items.
+    #[inline]
+    pub fn iter(&self) -> CListIter<'_, T, OFFSET> {
+        let head = &self.0;
+        CListIter {
+            head_iter: CListHeadIter {
+                current: head.next(),
+                sentinel: head,
+            },
+            _phantom: PhantomData,
+        }
+    }
+}
+
+/// High-level iterator over typed list items.
+pub struct CListIter<'a, T, const OFFSET: usize> {
+    head_iter: CListHeadIter<'a>,
+    _phantom: PhantomData<&'a T>,
+}
+
+impl<'a, T, const OFFSET: usize> Iterator for CListIter<'a, T, OFFSET> {
+    type Item = &'a T;
+
+    fn next(&mut self) -> Option<Self::Item> {
+        let head = self.head_iter.next()?;
+
+        // Convert to item using OFFSET.
+        // SAFETY: `item_ptr` calculation from `OFFSET` (calculated using offset_of!)
+        // is valid per invariants.
+        Some(unsafe { &*head.as_raw().byte_sub(OFFSET).cast::<T>() })
+    }
+}
+
+impl<'a, T, const OFFSET: usize> FusedIterator for CListIter<'a, T, OFFSET> {}
+
+/// Create a C doubly-circular linked list interface `CList` from a raw `list_head` pointer.
+///
+/// This macro creates a `CList<T, OFFSET>` that can iterate over items of type `$rust_type`
+/// linked via the `$field` field in the underlying C struct `$c_type`.
+///
+/// # Arguments
+///
+/// - `$head`: Raw pointer to the sentinel `list_head` object (`*mut bindings::list_head`).
+/// - `$rust_type`: Each item's rust wrapper type.
+/// - `$c_type`: Each item's C struct type that contains the embedded `list_head`.
+/// - `$field`: The name of the `list_head` field within the C struct.
+///
+/// # Safety
+///
+/// This is an unsafe macro. The caller must ensure:
+///
+/// - `$head` is a valid, initialized sentinel `list_head` pointing to a list that remains
+///   unmodified for the lifetime of the rust `CList`.
+/// - The list contains items of type `$c_type` linked via an embedded `$field`.
+/// - `$rust_type` is `#[repr(transparent)]` over `$c_type` or has compatible layout.
+///
+/// # Examples
+///
+/// Refer to the examples in this module's documentation.
+#[macro_export]
+macro_rules! clist_create {
+    ($head:expr, $rust_type:ty, $c_type:ty, $($field:tt).+) => {{
+        // Compile-time check that field path is a list_head.
+        let _: fn(*const $c_type) -> *const $crate::bindings::list_head =
+            |p| &raw const (*p).$($field).+;
+
+        // Calculate offset and create `CList`.
+        const OFFSET: usize = ::core::mem::offset_of!($c_type, $($field).+);
+        $crate::ffi::clist::CList::<$rust_type, OFFSET>::from_raw($head)
+    }};
+}
diff --git a/rust/kernel/ffi/mod.rs b/rust/kernel/ffi/mod.rs
index 7d844e9cb339..8c235ca0d1e3 100644
--- a/rust/kernel/ffi/mod.rs
+++ b/rust/kernel/ffi/mod.rs
@@ -5,3 +5,5 @@
 // Re-export C type definitions from the `ffi` crate so that existing
 // `kernel::ffi::c_int` etc. paths continue to work.
 pub use ::ffi::*;
+
+pub mod clist;
-- 
2.34.1

