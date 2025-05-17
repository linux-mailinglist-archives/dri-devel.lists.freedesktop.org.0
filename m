Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF59FABAA75
	for <lists+dri-devel@lfdr.de>; Sat, 17 May 2025 15:42:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FFC110E189;
	Sat, 17 May 2025 13:42:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="O8lJZ5xO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2085.outbound.protection.outlook.com [40.107.243.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ED4610E189;
 Sat, 17 May 2025 13:42:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y5QUXi3AfbnD2kDxhcckmRLF/saPEEeMOBmCe3oPhZIW92viafDeSGkGlgq3C6gsyeyY+0nKzMo7UP5GP2Ww36jNK7c9u1SVHFb+7bupPFZ3zB8CivlYdpBDwa8c4zoRB7zqz9a0mYECALxB+bbvpH+kZ9RgDqTdVtmB3BPLL5x6iW2zL9I8PlKHKD58nqa9H5EsShgHmyWPRgQjl2sHVdQMQwsinBQsauD98kE1/zky72MnRf/nY5LuPqJTj6yo/XbC8tZPw/IbclqzdaN3mumfNhDJ3laWN7H5EzW/iQLRA8y0uPsjnfzTv6kS4w3cP1P1cxx9+YxPtuXTDku3DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=etfLUkUvE3dYB6VJwrOYWDlSfFQIqGxsE8vufjFznf0=;
 b=Wu+HT4OsVpfwGLlLQYInFHBRfZ+DUCdd/m+t1YZmhZ2XjhoLNbu0cLKVOjGP8hROnppIJt5X+80yUJ4MLcdZurSO0x4en2ohk2LYHT900NaPJEh2YnE/hzSTNc2xjAODduSGnA9auLIT2RHj9lpeE7SE1bweCKc87wGwEWQlOOyQIkYgTkf4cHujCqrZh45fxGODMm75BlR0Cjd9GRsjh4EH6t87cDLcrV13MkodNOniVPP1o6fWoH7WpfgbmihtEtwQPPGng9VIBSSo0L5mSDEs/Qg41Yws9vHxZufTgBZirJPyg3imweygJH9Vpxh8jc+ynMt9quPOw96QFZ+C3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=etfLUkUvE3dYB6VJwrOYWDlSfFQIqGxsE8vufjFznf0=;
 b=O8lJZ5xOZrG4PV2+kvTAl5SZhNyN3ZLfCLn/aAON+vHp4hAjl0oz1Ucyr28xkDvJk/7Y2BXD4XiQP2xX1MggIluIG1rcUsFVjutu/noNVgXEx6EquvX3DZeclsXWk7EZJrrRj+DuHDWPFFseJBLckFsK7+j9qWMleelUMTv4474A09wAd+RkptA8urTlJXxNfTbyez1KvwLKQpcpnQXWAYG6fUr96p9fLDIKDv8AAnV+h12qBMWESq9txSMTAlMS0+b9RIGLfrqfh2SBN+h0iQ1xnJz1cWlPV9TNOKrblGOy+f/efBctGDX8bSNni4FE22QQAhsZhBKqRrEfSyfelg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS7PR12MB6118.namprd12.prod.outlook.com (2603:10b6:8:9a::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.28; Sat, 17 May 2025 13:42:28 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8722.031; Sat, 17 May 2025
 13:42:28 +0000
Content-Type: text/plain; charset=UTF-8
Date: Sat, 17 May 2025 22:42:24 +0900
Message-Id: <D9YH9UG67QJT.1D3LFMT4FAK4V@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Jonathan Corbet"
 <corbet@lwn.net>, "John Hubbard" <jhubbard@nvidia.com>, "Ben Skeggs"
 <bskeggs@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 17/19] gpu: nova-core: compute layout of the FRTS region
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
 <20250507-nova-frts-v3-17-fcb02749754d@nvidia.com>
 <aCN2VIIKYGcVtctN@pollux>
In-Reply-To: <aCN2VIIKYGcVtctN@pollux>
X-ClientProxiedBy: TYCP286CA0191.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS7PR12MB6118:EE_
X-MS-Office365-Filtering-Correlation-Id: b175491c-c689-40ac-0b72-08dd9548a9f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OTYyUE04dEpGcXptMW5YQU9kNk9Ec3ZTaWZYTENhSTYvcE1oODFVMm1pRDVB?=
 =?utf-8?B?MlJsZ2hrc0hWaEhnbHBHMW9HeXVSdytoODI1Ti9GelFHZGFaSXh5R1lpNDZH?=
 =?utf-8?B?SFJySUtDUjAyakhDajVldy9zTzF6S1RSS2cxYXV6a3l1b1lLeGI3a3V0MUZz?=
 =?utf-8?B?WlQ4dUgxTzNQUy9XUndzbWxQTWlMTzBBeWNYb1FUWW5ua3h1Yk4xdFc3YXF3?=
 =?utf-8?B?V1VrYi8wcmR3Y2VPK2IvWGRDOXZMUyt0TVRQY2tZdDNFd0t2aC9veG5XSVc4?=
 =?utf-8?B?alVURE1aMWdSUUhXanFqekQ2OHRFRmdmcEE1STNBeG95ZjgyS3liNm53bWlN?=
 =?utf-8?B?UVRoQzZVTlkzUWJJVGlhT3hreWNMZ2lJYlF2V21BeC85QzZ1d3lmblhpMGo0?=
 =?utf-8?B?Q1hXY3lRVDlvZ09XOGpFQjBWd2t6dThYZVk0OWlqWWlMTngwbi92OEFEK0d4?=
 =?utf-8?B?M0RoVXdUbHU3czdqSDFCSnRxSjcwZU0zM3Z5ZjIrdWdZSmtOZ2VSZXVLOUVO?=
 =?utf-8?B?WUVESlpnbExycU1waEd3aC9MeEk1VWM1TEw5V2lGcm55a1RJNW9FTlZCMDU4?=
 =?utf-8?B?blVXOGZramsxb0xRdzJRZnFoeVhkN01Bb0I1UURabUNYK2o0bGNZbWZSdnBl?=
 =?utf-8?B?Q0d0MitobW1oOUl3Z1JCdlBSREtOZ0ZKbG12ZUpPcVlOT2xjUEJaNzh3S2Zl?=
 =?utf-8?B?ZU9oMkE4RGxVNGkyTFplV2Z0YlhGNVVFR0psWkhsTmFPcUNLRlhBZFRPOSs4?=
 =?utf-8?B?dnJrQWlvOVhPZEx2bllJcWpQNUlOWWtqakRvVGRKOUI3Nnl2R2ZpN0drczRJ?=
 =?utf-8?B?KzZHRFdKYUtOSmJBb0NOY2FMbzlBalBoeHhrSVh4YXVSV2lXeVorVlVIRlpF?=
 =?utf-8?B?c1V4NUc4QlVPOS9tRmdsVU43NlA5bWhmb1dTWVg3dktpUmpqdTZtcHYwbitJ?=
 =?utf-8?B?SWpLMiswUzM2dG5YdDFKOFZOdEJwUGJNbGE4emloSFNRSVl3ZUtwaDFqM1ZC?=
 =?utf-8?B?cHJhbnFqQm8yWVpUSWRlWjc0dlloRXJJbHB4SU01bnlvMnJkZ2xZNk9QUmlG?=
 =?utf-8?B?UDJKS1loMldQMkJEdlhvM1ZsSUhQS1V2b2xWVTFueDU1ZUhzZ2xNVzF4SUZQ?=
 =?utf-8?B?OTE5ZW1LcjM3Vkczd1lLYThRK2FHNENNanVqSkIwbkdPVGZvZnpVVytqY1pD?=
 =?utf-8?B?RnJyS21GQTZScGtkU3AzcXh5Qm05UWNIUW1yNUN0b2JHNS9QdUZjS0FLbm43?=
 =?utf-8?B?Qk5pbUVkekluSGhObkhyempZQXl1aGVFVDVGYnA3SndoZndMNmlTd05BTVkw?=
 =?utf-8?B?bUVkYTRlWDU3aWU2cHRmYWV1bHZkRkR5QS9FaU10NTExelJHSXp2ZldiNXFx?=
 =?utf-8?B?aER2d2NDS052RzNGeTlBSkI4blVwN3MxbklYUUVCZ2dvNXNvOXNuS1loNUFm?=
 =?utf-8?B?czFKMk0rMVlQdVhhbEovaGtHNTh0WHZpU2ZOYXd1YytIR2Rhdm1NVkw2RVRH?=
 =?utf-8?B?bCt6alpKM0U0cUZjUGduUzZYczdIYUEyVzlYYmdmODJobU8yU3dweklqaG9J?=
 =?utf-8?B?YjlkY1FDVWYxVCtCckNUMStjRDFEemszU0Q0Mnk2RE8rUzlKanMwMHJwMEda?=
 =?utf-8?B?WkNMa05RMlVNZnB4d1BheGVJRFVSYTFabHk3OGtsWDhjRnJycWhBZTY3cUxp?=
 =?utf-8?B?ckFXTmNPZTBRbFRXOXd0MXlwVzJTWGdJZlRRNzU2OGpsTzFUV0wyMUdxQUpF?=
 =?utf-8?B?UzZhdU9kOXBpYWNydGRrUk13RWw0R0RZMWY5Withb3FvdUgxc1Urczk3Wm9O?=
 =?utf-8?B?V2xqQ21zWGJEWEY4eVY0M3c2MUpGQzRSK0J0enlHL2o0Q2FYdzJ6Q3J4dnFH?=
 =?utf-8?B?bFdEMGZUS0pYUUtWRktEUVhtTmNFSXNYb0NCR1F6d3VDRldHWXFkS0tkYXU5?=
 =?utf-8?Q?gMGh3GTDet0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2xXQnlzbDYybGplc2ZSOEgyYWdLbmRMQmxjc09kOG50dU5TNDdwYWMvY1pj?=
 =?utf-8?B?RTAvQTZ6RFpYM29ncDZRR1RLMlJzS1FSMGk4QmRsZE9pV2ZiWjhDUkVVSDBQ?=
 =?utf-8?B?Vnd4VTdVWTUvbHZTVERLdlQ5Sk1Tem1wQ2Q4MElHU2tMcnBzeEJ4SXdta2Zj?=
 =?utf-8?B?bXN1WWI2THJHaXhBb09lWnZKTVFRUjI1b2wxQyt1UkRHUGcxRng2cjM0b2gr?=
 =?utf-8?B?bjBXNEdmMGRDOVlQdmV4clRSU05RU3JwMGlveWF3aEJRckt2NC9PSkJmNmJv?=
 =?utf-8?B?RjBZdk9VR05USlhNWVhSNW5IS0JhRkF4NXVqU1pFNmZyNU5Hb0dSV2Z1NDB3?=
 =?utf-8?B?MFkrTlJMYS9xM2NlVDVqOEhPTjA3dmNib1VKOUptMHUvaGRXR3JtMzZZSzhH?=
 =?utf-8?B?SzhaVVBZTC9JMHF4S3R2QVlscEQ3Y1oyQTRoc2lUR0ZoM1h3SHRQb09EL09h?=
 =?utf-8?B?QzRXbkFPVEE5SWlSZytrbm5IcGtseHpHVTZuMjUvT0dOcFppeDYrRHlWQlFD?=
 =?utf-8?B?OERtL3FmY0dLcFRjYTAvd3NYa3RLQm5aUEV1Z21yNTJoOXNTTmxyYWlRdkJT?=
 =?utf-8?B?TEpEK09wcnkyRzFXYUZzeGJJdzJnekkxTjVkVy9EQlhtR2ZLQ2E2M3ZPaTI5?=
 =?utf-8?B?TGVJdGxoWkNPUWtTSzVNaEREOGpDM0F6am9PTy9GTDNDaEsrNmppYUhSNytq?=
 =?utf-8?B?blQ5Rm1STVNkS3BZMWtVSmRGczI3UmZYQXF2UkpMVWRGTFNGMUhqUEFuaHo3?=
 =?utf-8?B?OCtpLzFoOVBlWXl1enZ2L3NDRzBTRW10aG1vM2wrVUQ2NGR3U3JIR001MXh4?=
 =?utf-8?B?aHdVd3RGanNDSjEzdkcxYTlGRnNFdEY2ZURNY0tNWE5yY1lYRWZJWTUvVUI5?=
 =?utf-8?B?K2N0Z0k5aU93am50NHhzaXlZRzQwclE2eWptTDByc3lRMUpKeGx6bEFBZi9n?=
 =?utf-8?B?bDJ6S1VmREVjZkpNcko2ci9CZFJtM3o2NTdjUGE2eE1DYVh6UHdEWTVoVGFC?=
 =?utf-8?B?RjZsWHhtRkRsVVNVSDU1ZC80Zko2R3JXR2cvOUh1ZityRHhoZ0ltekFobVBu?=
 =?utf-8?B?UjNRY0R4VzgvcStzN0dBWjBUaUswNXVYalhiUnJ3Q2dVNkhGTGZUUEVmVVl0?=
 =?utf-8?B?bGxqc2poaytpMWdCdUQrWlRLQ2xvSUVuSm1oaC9QYzIzdWtPNDluSGo4WWo5?=
 =?utf-8?B?MG9Zdm9iZ0tXL2hxQk1oK2dZTks0TGw0VDNpL09XSUJvV0RYMW9lWVJOdWVU?=
 =?utf-8?B?OExKellmQndXWlJLWURQbDE2VDZzL015RldwQmZUVnhPS3pNcmZwMzA1R082?=
 =?utf-8?B?SVRqTGtXZXQ3QjRGVGZRQlBFWlM4VUNvSnZ5MlFPRXNaWHFJckVSbUdhY3Ny?=
 =?utf-8?B?UE5wMHYraEJnZUVuR1ltekhGclpBNSs5dm5OUWFjUTBHdUJKMk9MM1p2R1Q4?=
 =?utf-8?B?S1NtZmxqMWloUlB6NkZUQXo0a2xEMlRWMEhORHdRNWVEK3Q1L2tzMjZnRXVG?=
 =?utf-8?B?YUxhbnh0d2hjQW1kbHJqdmdYcVNYRHI5SlQwNWk3eXA3MVNsNjBlNi9GQnJi?=
 =?utf-8?B?ZGhZQzFLbUJoUm9FT1FJMUVVZXduaXlCY1JUU1NHOEsyVkdPZ2RKendQanNF?=
 =?utf-8?B?Ynl6SmNyU0FmMXhreEU5Y3ZXYnBXakVmaEU1ZkhXbmlQVElGZTFtamIyWGNo?=
 =?utf-8?B?U3VNSW55Z3loVVVGUEYvSS9lOGVISzRzRHk1OS8ySnNwRUtEclUrZy9SQTM5?=
 =?utf-8?B?Rlhla0pYV0VNWFZSNlIvOWp6aGtpZ2EvZ0tSQnRQSG9zemgwK2ZNZWVtblpi?=
 =?utf-8?B?RnVuMEk3OXplMTU0bG5IVXJYNGJZWVNrdFVFcytzVGlLanF1WlFwZzlMaDlr?=
 =?utf-8?B?SXhSVC8wQnpvSE56cEZUOE41RUtzTGlUNm1GM3lnc1Nzc2tDbFpWbnBsZndj?=
 =?utf-8?B?eGIxbDM1VmtCdWlkL3VlYnV2OU8vbzhzNk5YVHFFWnBVaG5haUVPRHBxQzkz?=
 =?utf-8?B?MzhxcnZnczYvVm9yVjJhU0E2SWlSK1A4WHJkWjlSVUR0UEUrRHlRa1ZBOFVm?=
 =?utf-8?B?Snl5VGE5dEdDeGxyN0NMMEdmNVBFMGViKy8yOGFjKzJMRWh3clk4WGw5SUFa?=
 =?utf-8?B?aW1VVkxWT2N0UzhiZWp3UlhqVENvYUZBM0lEYVU0TlpsQmhBZEN0YXJwbkVL?=
 =?utf-8?Q?MIYjh7hUJmCfEHQQQaPsg65Fn1TxSFfqIZku9HvUSVAZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b175491c-c689-40ac-0b72-08dd9548a9f0
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 13:42:28.0442 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ULUCCaRlE0udlPP7Oc3zZgD+4ImTAIbs6q5DSNR/cmw/t/G37lcvHrTTwosRMm+roAbKiLH5xThKT9dzg/5hkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6118
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

On Wed May 14, 2025 at 1:41 AM JST, Danilo Krummrich wrote:
<snip>
>> diff --git a/drivers/gpu/nova-core/gsp/fb.rs b/drivers/gpu/nova-core/gsp=
/fb.rs
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..f28ded59469d52daf39e5d19=
c09efd7bf08fee92
>> --- /dev/null
>> +++ b/drivers/gpu/nova-core/gsp/fb.rs
>> @@ -0,0 +1,108 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +use core::ops::Range;
>> +
>> +use kernel::prelude::*;
>> +
>> +use crate::driver::Bar0;
>> +use crate::gpu::Chipset;
>> +use crate::regs;
>> +
>> +fn align_down(value: u64, align: u64) -> u64 {
>> +    value & !(align - 1)
>> +}
>
> Can this go in the previous patch, i.e. "rust: num: Add an upward alignme=
nt
> helper for usize"?

Yes, let me try to consolidate things around the `num` module. Not sure
why it didn't occur to me to add that one there.

>
>> +
>> +/// Layout of the GPU framebuffer memory.
>> +///
>> +/// Contains ranges of GPU memory reserved for a given purpose during t=
he GSP bootup process.
>> +#[derive(Debug)]
>> +#[expect(dead_code)]
>> +pub(crate) struct FbLayout {
>> +    pub fb: Range<u64>,
>> +
>> +    pub vga_workspace: Range<u64>,
>> +    pub bios: Range<u64>,
>> +
>> +    pub frts: Range<u64>,
>
> Please remove the empty lines.
>
>> +}
>> +
>> +impl FbLayout {
>> +    pub(crate) fn new(chipset: Chipset, bar: &Bar0) -> Result<Self> {
>> +        let fb =3D {
>> +            let fb_size =3D vidmem_size(bar, chipset);
>> +
>> +            0..fb_size
>> +        };
>> +        let fb_len =3D fb.end - fb.start;
>
> Isn't this the same as fb_size? Why not just write it as
>
> 	let fb_size =3D vidmem_size(bar, chipset);
> 	let fb =3D 0..fb_size;

It is the same indeed, and fb_size and fb_len are semantically the same
thing so no need to have both.

>
>> +
>> +        let vga_workspace =3D {
>> +            let vga_base =3D vga_workspace_addr(bar, fb_len, chipset);
>> +
>> +            vga_base..fb.end
>> +        };
>> +
>> +        let bios =3D vga_workspace.clone();
>
> Why? And why store the same thing twice in FbLayout? If it's really neede=
d,
> clone it in the constructor below and add a comment why it's the same.

The bios field does not seem to be used at the moment anyway, so let me
remove it.

>
>> +
>> +        let frts =3D {
>> +            const FRTS_DOWN_ALIGN: u64 =3D 0x20000;
>> +            const FRTS_SIZE: u64 =3D 0x100000;
>> +            let frts_base =3D align_down(vga_workspace.start, FRTS_DOWN=
_ALIGN) - FRTS_SIZE;
>> +
>> +            frts_base..frts_base + FRTS_SIZE
>> +        };
>> +
>> +        Ok(Self {
>> +            fb,
>> +            vga_workspace,
>> +            bios,
>> +            frts,
>> +        })
>> +    }
>> +}
>
> I'd probably wrap those helpers below in
>
> 	mod hal { ... }
>
> or even a new file fb/hal.rs to make their purpose obvious.

Do we want a module here? I'm fine with it, but these methods are
already private anyway and putting them under a module would require
them to have `pub(super)` visibility.

... or maybe we should have an actual HAL here with dynamic dispatch,
similar to what we have in the falcon module. That's what OpenRM does
actually. Let me look into that.

>
>> +/// Returns `true` if the display is disabled.
>> +fn display_disabled(bar: &Bar0, chipset: Chipset) -> bool {
>> +    if chipset >=3D Chipset::GA100 {
>> +        regs::NV_FUSE_STATUS_OPT_DISPLAY_MAXWELL::read(bar).display_dis=
abled()
>> +    } else {
>> +        regs::NV_FUSE_STATUS_OPT_DISPLAY_AMPERE::read(bar).display_disa=
bled()
>> +    }
>> +}
>> +
>> +/// Returns the video memory size in bytes.
>> +fn vidmem_size(bar: &Bar0, chipset: Chipset) -> u64 {
>> +    if chipset >=3D Chipset::GA102 {
>
> Is GA102 intentional or should this also be GA100?

After double-checking with OpenRM GA102 is indeed correct.

>
>> +        (regs::NV_PGC6_AON_SECURE_SCRATCH_GROUP_42::read(bar).value() a=
s u64) << 20
>
> Why isn't this shift part of the register abstraction?

This value came from a scratch register, which interpretation depends on
context so I did not abstract the values. But OpenRM does, so let me add
a way to create alias registers so we can get adequate definitions here
as well.

>
>> +    } else {
>> +        let local_mem_range =3D regs::NV_PFB_PRI_MMU_LOCAL_MEMORY_RANGE=
::read(bar);
>> +        let size =3D
>> +            (local_mem_range.lower_mag() as u64) << ((local_mem_range.l=
ower_scale() as u64) + 20);
>
> Same here. Please make this part of the register abstraction as it is don=
e in
> previous patches.

Ack.

>
>> +
>> +        if local_mem_range.ecc_mode_enabled() {
>> +            size / 16 * 15
>> +        } else {
>> +            size
>> +        }
>> +    }
>> +}
>> +
>> +/// Returns the vga workspace address.
>> +fn vga_workspace_addr(bar: &Bar0, fb_size: u64, chipset: Chipset) -> u6=
4 {
>> +    let base =3D fb_size - 0x100000;
>
> What's this offset? How do you guarantee that this never underflows?

Looked it up in OpenRM, it is the size of PRAMIN. I'll add a constant.

>
>> +    let vga_workspace_base =3D if display_disabled(bar, chipset) {
>> +        regs::NV_PDISP_VGA_WORKSPACE_BASE::read(bar)
>> +    } else {
>> +        return base;
>> +    };
>> +
>> +    if !vga_workspace_base.status_valid() {
>> +        return base;
>> +    }
>> +
>> +    let addr =3D (vga_workspace_base.addr() as u64) << 16;
>
> Where does this shift come from? Shouldn't this be part of the register
> abstraction?

Yes. Also added documentation in the field to explain that the field's
lowest 16 bits are truncated.

>
>> +    if addr < base {
>> +        fb_size - 0x20000
>
> What's this offset? Can this ever underflow?

This one is also defined as a constant in OpenRM. Let me replicate it
here.

