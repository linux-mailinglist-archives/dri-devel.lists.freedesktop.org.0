Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKLrFVdTdWnoDwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 00:18:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B82BA7F33D
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 00:18:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EDB510E22E;
	Sat, 24 Jan 2026 23:18:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FbOzmmsI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010066.outbound.protection.outlook.com [52.101.56.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E034B10E144;
 Sat, 24 Jan 2026 23:18:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iqWOYu+cluhIWcD7lyX2Avll2VtLM9oXuHMvkGbdfKLqo1B7LemUQp+ohaAJIPJYr/SQR1vZxfOS0fTF1bcyInnaGZ9OIoIog/OJA30JnebTqJ3gQB4gvxWVaX3f1HC9Tw9WGQTDPuMs58Op27/ItiEDG3OfUs3HHnQj1AanPy81OnQ39a7pPMdKqdh7x8p5WfVkLFtGyEdmKlZJlHCUodMEo7H1tEtN86kXfDpR5TBhBT/s8hA5iXYYwtLxJf6LVEjPr7BI4A248f5qCAGTX9ucIFRtKC1I6Gftd+C1aMWH5c4SLl3KbBMqvbL6XKUNXO46pTwkB9vNOnJxRcOZ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aVTh+Dk4DADi/5QT5h74TE1SuZopp487aNVm3AXhMxM=;
 b=ud0f4VAVrAkD7UP1puanrdMI2PfpQVtGbl1WlHwJH4cP27X25QyPrCLeB1X84Qm63xBxm9Rh2AGWGhSMRe+JxKRYunIo2vRURVIIvXclkV9TGwGj/hMoT/CaQGXhG12AfJ0ULxehd5JP4C8A/u5QlVJDTAV3GOC/PVlQIXUqtsHDBHDHwPTCgimO5Tt8n8UE5xyCrYwkUEZJaBR7y5X68EvG5XttoU7dREAehZ6IlUFI407JkdSq5PSnfqm24IxLcWnnZTDq1OUJgWZYJfeUnIqJzKtkkiuvxT/jxsdfxtaaco+NxNKbqAqTZxc11JQ4D6Zu+b6v16wCwTxhTKP0jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aVTh+Dk4DADi/5QT5h74TE1SuZopp487aNVm3AXhMxM=;
 b=FbOzmmsIJOMaoGfsFxJGGhKVXaYjUBlIwhMvKAFjm/lgoMqAx6mTT9WNM2vBHnOBKxkOZgVSibhXwsd4Vac/UfO9zWWFw4R0V1VyWLz5TjwpRC/0sQfFr+rJeuS18zSJteX+PhcLslpy2v0DqvetNL8/UiSiVXxVxuGnzIt/mSn7dinDUVNR1aswZCXLKdDbFtNtnq84N6DmGsupn3hSTUVYj87pyfvdnDu+olsMAT5M0HcYFHJO3WmVrmqkb4Sup3CzFTi7dkKOkLZ8a4ytGdMoSfEU9JCcL6TiH02g6AwD7Vt61uQq4QHlfwuM5ofnRTtALSTP/rxBZBqCY87UKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH7PR12MB5734.namprd12.prod.outlook.com (2603:10b6:510:1e1::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.14; Sat, 24 Jan 2026 23:18:37 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.010; Sat, 24 Jan 2026
 23:18:37 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH v1 2/5] gpu: nova-core: use checked arithmetic in Booter
 signature parsing
Date: Sat, 24 Jan 2026 18:18:27 -0500
Message-Id: <20260124231830.3088323-3-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260124231830.3088323-1-joelagnelf@nvidia.com>
References: <20260124231830.3088323-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR07CA0016.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::26) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH7PR12MB5734:EE_
X-MS-Office365-Filtering-Correlation-Id: c398a821-d298-479d-76eb-08de5b9ee72f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jSDUlb1D/z4uP4jVW/pd+8/UfK9VBRPttyM6tR8HWwL/zEzr7RcRh9eThzNH?=
 =?us-ascii?Q?QXw8ClUfXvG3xaRtN3eZ+AhVk6HGDwSAQ1Zx2fABtZkFzAJ/zNgRzzm4W5Ea?=
 =?us-ascii?Q?hLGhCnZSRr5pQXXv+sE4EHPCmxP8sgmGUCMY2m0AQJdeMCW8nEBTSciIHr82?=
 =?us-ascii?Q?/K1/qKbeg06tHunBmwm6h3q9VPhstbpy4yW7UTbok7QylMY4BN3y8tjxEjFi?=
 =?us-ascii?Q?7wAdtR8fD6ifpcoOyyeiY8nZlvOi87Wj90r576iX4STNS1kMLBOxPmG5nn0/?=
 =?us-ascii?Q?vPWYGM9IZdI9kHgXIOUaszgZkjiheWbZvoSgTdTo5IXJblLbnkmllc2qQqHe?=
 =?us-ascii?Q?oiJCaysmbsvzDnL8sEmnDvxH6g5U4MOy5cWffwPE9AygF+6MjTn0k7FFostd?=
 =?us-ascii?Q?bQ2pC2lFy8zSTAZhlyjNdiUS7L3O35dm5fMympOdo/qWOMQDIx+wLCBxvfii?=
 =?us-ascii?Q?a51L17+UMmn1JaefvYICeihPgWe43eYS89Q/y+sJsOegUyP9jnV0SFjWgV2/?=
 =?us-ascii?Q?5r8QMSI/dSr7BQYyNNHod3txxJcrohejRPb825B06FfzqEluu3kPE0N21HSI?=
 =?us-ascii?Q?W6Qkzs7YMfHQAJdLVth+cGD88iPH7AN2noeuwJggUUuIqxPyBFgmVuT1cIBM?=
 =?us-ascii?Q?52Nitee/U4h0pcvR/eGL8UDcZAq8FguvsEcslCFKv0fSwaNp9CVPlNzhnWrc?=
 =?us-ascii?Q?jMr21fAplt/2DZKexTVomEY08MXSPYG26gyMdc9g6dmNNFYgUBXOaBDGZ64F?=
 =?us-ascii?Q?79Vqq528XxkBqOOtajLrL24NrQ+1HNA1XEuERc6tNWy04NggKeQjahVTTBnt?=
 =?us-ascii?Q?WHtVgXQOLFGOd1j8PPnX64JsNYfcyMktvclwW6OmN8mcdRh5o3U3Z8B0U1py?=
 =?us-ascii?Q?8A6YaSOAavtqy+Nf4izgMedLMkuzjc8zMkrd6u2A4Z4raKWStg8xtb4CiCpu?=
 =?us-ascii?Q?Z3nMdSB142ptpZXhSSD/u6EoGgjM3Q2h7sPmzHYFWBdqn+zzZSxUo0DWxrAu?=
 =?us-ascii?Q?g2n9M2NWNmRn8RQmVy+cKYW2Hml4++/PGF23PI4atc80hF7ZkecVazRl3Iqq?=
 =?us-ascii?Q?hgZqap+mpBZLDFFt82o7vJM7o6d75tpKLjCnfcvsmm0QqFC2KBOF38AyRFaR?=
 =?us-ascii?Q?bcLgALAY6MgDuiAc5c1mhDdxAJzfddGXyV9koPr5B49dEvahgsKZ7SE3cjEt?=
 =?us-ascii?Q?aPNe5MdDmhRW1+B3w5I1g/WGz0oT+XXHeSDGDDf3y0lXSSIhHOgGkEc7QmIm?=
 =?us-ascii?Q?zaWWzzOaGW9M6YDrxpvveOwM3rQPozwh/lNclwdxjRyvKQ6kdLWhk+CN/dQ5?=
 =?us-ascii?Q?C/wIBscUn0h2wxz8WK82lPzWh/Ch76ugvcMTLNQoA0fBpYpKOfIPa7AGHcuN?=
 =?us-ascii?Q?OeU3XpjkcuUnZTtOPlpgSLdeE//i4nu1xv91R7Eq6+9e5kKuqkK7SvAKgubb?=
 =?us-ascii?Q?Aksao8MaTut7UAUBd/o6n/55yDuDA3fcAY1vpBeCjX7tx/QsXlM/1Vvl74Ph?=
 =?us-ascii?Q?kDtnHmCC9uKlvZb0sWVqCwnxoAzDuc4EcR8ywftKc6DtkTMFAjypJakNkgAz?=
 =?us-ascii?Q?9GXdoU9PB2vIR2DweYc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TVdqvH4Yjuj64HkQnvlZaCs6Qcs+AJ8gtvajjv8w4qFaB0r0ZY5UihXaPh1V?=
 =?us-ascii?Q?y1GeaXVqskoPMHr+JSx4+0hrGXmCKzVaYZOdg57O0InaObFg70j8wEzJCKmU?=
 =?us-ascii?Q?jDEqZ+1nVd+Ez6M70stM8BiQI/TMEcVCoPvSo1ec/ZwcBS9uu3ri3ZBb//nI?=
 =?us-ascii?Q?W5F5mztlBRbcWzSg6ZUtZ6fhyBazIrrOzsjNYIo7xYcGCrHT79NmUwgpLT4A?=
 =?us-ascii?Q?exS1m3TX9AcsrYRd4Xmu2+ZnmMmJUT0Ia0orNxobz+opESMjjsNdt+D9XNWm?=
 =?us-ascii?Q?+bV+n9AWkb+dLU8+PLbYM7/Ja1WZKxGbjoPHBrP6EynMKFzeh1YN3f4j/IjL?=
 =?us-ascii?Q?PUGiRw/OeEsR2XC7UoQbXfmUNqFUOPxziKpwfjHC7HWB+YrI11i+dMuh5j2V?=
 =?us-ascii?Q?6fQ7DgICJ1MA1HBQxMkxf6052kSSeimn1DqwtmQZY64DipLIYwi4kw15JbN3?=
 =?us-ascii?Q?qDJKH/Pboc8MgoR5EkmXWriSR6rIMTtUoOBDEIJFzVCWELTv4RLotEGaLOyo?=
 =?us-ascii?Q?lSkdJem+9f7w/jXAp67kRUtjArEOQSmsEwhZMCfpXK88dcyBX+NDVpv8cxy1?=
 =?us-ascii?Q?GsPwv1t8ki+m25cYUBYTuhHWjCXgY7qI3y/7b1OI4VKyDns+av49XLcrrsha?=
 =?us-ascii?Q?xopwlJgXi4ink2Kfihn/JAphpEcQTSIhNSJvN3BbJwj0ExrPGIWD57GPswN4?=
 =?us-ascii?Q?9bmAwa2zKdoYDYskDUPT00BzZ7WUhxbPgjGQ0Xt6gE3vqWykT7B+HpetiGu8?=
 =?us-ascii?Q?n1QfiRB54/DYRlpgnvyfuutGdUXzEmttog46pxkLrEPBsUBPRcQeEGLPZCJC?=
 =?us-ascii?Q?S3c6/6CM+QSYO5iRpvvrevZcA4UtgcPrmbZO1FHXhuV3SbKZcfq3284dSzNN?=
 =?us-ascii?Q?4co0PwnPSiemdYRrW6/kd0NFf068fUHfpWB3hhWokV+TgD0S/KFgx3LBzU0d?=
 =?us-ascii?Q?Xin7bXLJe0pK2/hr+ri1alAxcL/zNyer21HFgQeGh0YoMUA01M34q5uC4HdA?=
 =?us-ascii?Q?3Zdp0LgnRAdsl1WSyXjNby+IE4XRaWE8tELwOU5BsRPizNprcG6XBbDFmEFz?=
 =?us-ascii?Q?o0Nt5VyMJdDSTltvkL1ebKO8/qrRTrEQdLnHl0y4tKxPQiFgT9nVLCjET1BF?=
 =?us-ascii?Q?Y0Wlb1CU7Qu8Ati9PEOVu9HUHTfknqbnBnDP7Ha4/Oomq6bRPrvHj2Xz8zt2?=
 =?us-ascii?Q?PPM2jERspuWefeLjMQJTeqTqktZSR5s/HrWnwXxHC3ppl+c5znWRO1JFiYy2?=
 =?us-ascii?Q?p0GvBWjHlWY/Qfm+lIyEMHNYSmtYetu6ZLKvjTib83hAjURz4Q9vl1sIIPZK?=
 =?us-ascii?Q?2EC7vc0WTvTKMPOYzl5Ascym+sKciG3NsORm6J+9CQsUa/NrVcRLgAO/VMNG?=
 =?us-ascii?Q?zyM7Jl6VZ09k1rwup1vplb2oRgiO5PgZdVxJ0ptmrifgyzWbjbQSSHrVkT+y?=
 =?us-ascii?Q?O5Y9uatNFQfgmFUHwJ/lt7Z2p2Pd9kS8l+unMhP6bT5fPTMUykIX9ge5dHh/?=
 =?us-ascii?Q?qVS3kqF1llQomQweoQuHISZl8hUiSva/oRSoNVyuYqQ/9DwNLrHxiiRsVtcn?=
 =?us-ascii?Q?XtqLpAYLeL/pd287Zz6hKDyab6PMVRnWGPWC7pp+/A3jWo+PzJRFn2TJjdbn?=
 =?us-ascii?Q?9MxFOr6vO3/Heutb/s59XuAccCcu2gO62HiU5PC477ouu23iBVEsM3BgFQ5X?=
 =?us-ascii?Q?Q3AK+53Q4udd5vA3gEkQ/M9C1pWGAW0VArL63gTaHc06IQ/3uUUc15lGdR9W?=
 =?us-ascii?Q?+ezL8AM7ew=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c398a821-d298-479d-76eb-08de5b9ee72f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2026 23:18:37.5760 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wAx6gwwglFgPuFqyYI1ILf0Kf46diSzyTUJ/WWBAMpf51nRWYmMh536Ur3FiEvsoOz/nI+kRqDbwn3nWY+NFIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5734
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[vger.kernel.org,kernel.org,nvidia.com,google.com,gmail.com,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_CC(0.00)[nvidia.com,google.com,kernel.org,gmail.com,garyguo.net,protonmail.com,umich.edu,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: B82BA7F33D
X-Rspamd-Action: no action

Use checked_add() when computing signature offsets from firmware-
provided values in signatures_iter().

Without checked arithmetic, overflow could wrap to a small plausible
offset that points to entirely wrong data.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/firmware/booter.rs | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-core/firmware/booter.rs
index 86556cee8e67..f5ad619dc055 100644
--- a/drivers/gpu/nova-core/firmware/booter.rs
+++ b/drivers/gpu/nova-core/firmware/booter.rs
@@ -119,14 +119,23 @@ fn signatures_iter(&'a self) -> Result<impl Iterator<Item = BooterSignature<'a>>
             Some(sig_size) => {
                 let patch_sig =
                     frombytes_at::<u32>(self.fw, self.hdr.patch_sig_offset.into_safe_cast())?;
-                let signatures_start = usize::from_safe_cast(self.hdr.sig_prod_offset + patch_sig);
+
+                // Compute signatures_start = hdr.sig_prod_offset + patch_sig.
+                let signatures_start = self
+                    .hdr
+                    .sig_prod_offset
+                    .checked_add(patch_sig)
+                    .map(usize::from_safe_cast)
+                    .ok_or(EINVAL)?;
+
+                // Compute signatures_end = signatures_start + hdr.sig_prod_size.
+                let signatures_end = signatures_start
+                    .checked_add(usize::from_safe_cast(self.hdr.sig_prod_size))
+                    .ok_or(EINVAL)?;
 
                 self.fw
                     // Get signatures range.
-                    .get(
-                        signatures_start
-                            ..signatures_start + usize::from_safe_cast(self.hdr.sig_prod_size),
-                    )
+                    .get(signatures_start..signatures_end)
                     .ok_or(EINVAL)?
                     .chunks_exact(sig_size.into_safe_cast())
             }
-- 
2.34.1

