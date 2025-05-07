Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C14F1AAE16E
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 15:53:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBE8810E061;
	Wed,  7 May 2025 13:53:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="JMhDzi93";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2059.outbound.protection.outlook.com [40.107.244.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6683B10E7DD;
 Wed,  7 May 2025 13:53:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ns9CMPVOui/w+P1vMm7hD/tOxuBWJ3DJALJRfR4c2o4n6CZhLWLkU1PWv3c1kNTMzuB2mvCiKrGGVl1EmxGoSmhq7/UDYLOLr4xGqIdtNXw2rjX05TbmmCQt/EijjCLTx7bpzEzNFIhGg1nOBl2lyMaYDy6zly03RDdNrBrWny3kYqYqCzOA1J+X5qhqKiLmtsQR5bJaUqeSjC5NohsAzie693fFqmRPl4TrrN42PK8pHz/FfmhzMJK34nElYO811o2ILChi98qvsipmIS+VlRtOdP3QQOmCso8sr8zueC+MHAOzsWuTwd2Zq98le0NU/esXdEabgzsOeZiw24D+lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XG2JBDLJoiDPNJhaAyFT4ObCxkxiJK3WPlaZxFgjz/s=;
 b=xhmv+o8PxoG7UFAQVujl+aDzozTrfjBqaHXxfgJq6IN28CGzGKKJLU7ejYXVaBhvvu1BN3QhRoDAv+jL/fWXnxX+Bo+uKo5GZQ0Kpi+gm1yC9FNPi6chliBne0HosAiM/vyHHtYW86eN2krAhh/oPN0bdcuAsavTRFWCqtpMpcTgYfvpAD6dOI68ggFl5vMY13+5jndrKbf7GFG4omMTjANm6ke+snu7ClAJKfQVnrgNkrBpjV2VCRdIPrBlVrUXVklIsQwSiqOz2G3S5q1XieupnDTgokbQshs49dJaDc6TObNt9fQlFUrqiFNoj0AUAIx1k1YfOeDFVqLS40G1ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XG2JBDLJoiDPNJhaAyFT4ObCxkxiJK3WPlaZxFgjz/s=;
 b=JMhDzi93RNHXpfwoGtknHtDFMYv1aOyUCM/o3f4yoFuA32rXGzTsFASzC0n/WxVwcLTFVAKC4vImVsB2uLiFIKZBfrK6IvpT0DIfwXZ0XbvRu2RepWxLIabr7g/9/rAsLx8C24lln7fHUDam1IJIInOziGAj/y3HNG3l7gsV6gMa+qsfQrvxUssDOLCX7sQz3butW2FXyY9TVwdH4TmMuI18IoLHYEcqdNxb4ycH5qt1yj8Bz3bh0Yp9O/hdFsNyZcd52LdgfyM8PQBc+chVMDSt+t5ySr8AD6bC1T1026e8rLAIzLnyaj+ok55OE/cjMQ5cUkDXIeY/CgIhq/LY3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB6761.namprd12.prod.outlook.com (2603:10b6:510:1ab::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 13:53:33 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 13:53:33 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 07 May 2025 22:52:41 +0900
Subject: [PATCH v3 14/19] gpu: nova-core: firmware: add ucode descriptor
 used by FWSEC-FRTS
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-nova-frts-v3-14-fcb02749754d@nvidia.com>
References: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
In-Reply-To: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: OS7P301CA0015.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:604:26e::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB6761:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f13cc6a-a5d7-4763-a960-08dd8d6e8e5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|376014|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QkN1NnhGcUo5eWpJSmlXdHBoZFNJZjgya1JYVjJ6cVpGVVR5cDg2VlFGcG1T?=
 =?utf-8?B?MUJRUzN3Q3RMN3pqRmlDUUxvTHZlQ295dlhlRCtQRFA3N1ptakVFZVhwNXBw?=
 =?utf-8?B?U25nUWI0emlPaGRidHF3c1BoLy9tZ3gzZlZGeHNOdkFhTUZIKzBDd3NyL1g5?=
 =?utf-8?B?RXAyS0MrbXJQNms3OUg1S25CYXJXUmZYOU5HMk1MZ1B0TXlObXN5S0ErMXBB?=
 =?utf-8?B?enZqVy9OMjlKZXpKRVNHZmg4cXVhR2JKd2x4VmVCV0l3Uk10UFZvMENhaDZG?=
 =?utf-8?B?cjFsV2NwY2ZiQUxTRFgvT2NaSFJ1UWVtbDVFRHczV213cUhFOThXd3k4ajZv?=
 =?utf-8?B?UTVjZy8vS2w0cmVOUXNBNDR0b0ZUK054ZnJLbm1lSDFGeUd1NThwczc1UE1y?=
 =?utf-8?B?c0xvSXFybVNXTHBhYWhOc1lnOWZCQUt4Nks0WDZFYTFFNVJMbTlwMGJmT0Vl?=
 =?utf-8?B?WkV0RTkvU3Evbk5KSlR0aXlFSTIrT0xDUXlxa2JTeHZTLzFzTDNzZ1lCdWxo?=
 =?utf-8?B?ZUhMcXlyR05qZFVYR3NtcUFMVXlSZGUrZlEyVWxDekxycWh6MHgzS0F5WjZB?=
 =?utf-8?B?emI4Q1lmdlp6NjN6bEtOZ3M5bXYwSzJJRUdlWGFEbjZVYUJpaXVZWGczNzdt?=
 =?utf-8?B?bjVmV1pWZy9LemJHUThxc2hEdDFaSzJVa05KMkszbTlOTjROeHFDUTE4V3FS?=
 =?utf-8?B?V0RGRkZENGFZaUhxY2NnVFl1d3pqR3RBbzhkOWxZbi8vTmV4c2I5OVVYbi9X?=
 =?utf-8?B?WW5Oelp6ajV2VWdxK0JCOEhEVVNhcTUyZW41S0t6VEJ1WUFVQTNhUWFhTEpW?=
 =?utf-8?B?RVpSejJPWVFOVHd5Q2dDcUtURGxyTVl2WHIwTzRDaWN5b0c0UXd4dURYeEdP?=
 =?utf-8?B?MjFwMUdJZUQ5TEZrdWhxYWQzdHk4cGZ6NmhBOTFTSGFzd1gzeHFSZ0J1a0VB?=
 =?utf-8?B?TmI3SEJLcC94ZVpmQVNVejkxcUNBb0V5cTdOREl1YUZwRFg1b1g0V3Z1ZGh2?=
 =?utf-8?B?WWhLUkVUejM0dXdNaHJtQ1NXb3NwdUhxaytsdE5yNVVoVHhteUJmWk4wZnNO?=
 =?utf-8?B?N3lHSkh1cUxESHM2QXcxNnZ2ZkR6MCtyU0RUR0FXa1dXY3B0YjNyM1ErNCtk?=
 =?utf-8?B?MnV1Uk1qNE9HN0NEQU8xQUtQMnV0eFRacUd5ajFmbHVFV2NCN2pNOHZsbnc5?=
 =?utf-8?B?bTVBbklHS0VDSll6WVoyTytZdmJ3akV5ZThtdEFDWE1sVDQ0Zm4rZVpmZlN0?=
 =?utf-8?B?cHllN1FTUjJSRGZGYmk0d2ZvUk9QWU5ia21oUFBXakYwM1VkeTUwNHQwTTFh?=
 =?utf-8?B?U2Z2NHMyL29vZkY0eVVFY0FxU25TMWR5QW1JenVmZW50bGxnZnJaU3VCcTBv?=
 =?utf-8?B?VDkzQlE5OUpQdG02Nm9vREk3alEvRFVPNVFnMVBDdUYzaFNmS3hla3NFaS81?=
 =?utf-8?B?cFJQZWo5eTZ5cTNQaGRsdUhjbkoza2o1UFdMYkpZYzMzZm9IczdxS0JielF1?=
 =?utf-8?B?SzRISXkvMDZlZkFCL0kvdERodGRkM3hTZktNcUZhVTYzYUhsc0l3NTRoRENJ?=
 =?utf-8?B?amtLSzlZY1NKYnV5Uk5hcnBQMmp4VTdkVWxFQmhmWFUyY3JtNWVHMXR1VUpO?=
 =?utf-8?B?bVJXcDhUdEtpT3Yvb1RueUhseW1PM05zMjhLc0tKZXdzdWdKLzRxaDJxVytl?=
 =?utf-8?B?RERVbjhPUTlRVnNUNGk0eE81RGRFNE93bmF6WmcxU3h4R2xDbyt4bE1iVFBh?=
 =?utf-8?B?cUJ1a1B6Q0duWXV5OHo3dE5pUXZNSnJQM2p5K3pSTUUyRW1xVEkwZVdBSk9z?=
 =?utf-8?B?dzQvY0diZVZocFpmcjAxd0VKbkVkUHFsYitpdEk0VU5WODh3anNBUThjTVBW?=
 =?utf-8?B?cGdLK1ZmYkJyM1YrblBoSGJtVmhrWm15SnB0RnR6OUpJRDZtNTcwVHNKbG56?=
 =?utf-8?B?M1FMbzZQaHNjWGpCMXpSVHIyZnFhcmFxR08wNGZ6MXR2aGZqbmdIQ054OTlS?=
 =?utf-8?B?amt4TUZrSFl3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(376014)(7416014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXY4QUgxWFBVNXllc1NMN2VyMUVLZE5NTGthMmhML0xsRmtXZmhVNjhBK2VC?=
 =?utf-8?B?MkRLbTlIWXpIdjRDMXRpbEM4U2tGR0hFV1NwV3MxSjNSeHVwdko5SFFNdG42?=
 =?utf-8?B?SnlWQ1g2bG1FdTl6VXl5WWt3cVFyM2xhT0U2M1owVE0rd295WXFyWGRVY1lD?=
 =?utf-8?B?ZlZsa2VXcmdkWEorOFd0YXNRYnVoT3VMS1ZoYlpCVjcyRHgyOXBDbnA5eGgz?=
 =?utf-8?B?aE9yWkhiSHlQK0NNMThCTkhjalRVRnNrR3lSSXVWaXBPOGJaZnhGN1ltNmFX?=
 =?utf-8?B?QWJRSEpnS2U4Z1ZiZFlUYVFhd1NWMzhSZWtCVVFSV29VSjJIQ09mMU9QbzVQ?=
 =?utf-8?B?OWZGWEtWR29mbDhIdStlWUdDRXkwdDNvZWxlZFF6TWE5bUo2TTAxS2pCQmJk?=
 =?utf-8?B?eWlYbTAyTUU5d2twZE5XajZ4ZXBGQjVoQ3l2cUdlQnF3V2d1dE82RVFhNXpn?=
 =?utf-8?B?TEVrelF5YlBEMFJzZmpJaWwxaVBtRG1lc011MlQ5VUJVSzAxTS9pK2dSamE1?=
 =?utf-8?B?Nm81eHJMQ1RpT004QjZsV2NkWHptQy8xWTViRzVGMmtMQnZETTAxOTZaQUhr?=
 =?utf-8?B?aDFSVERTS0M2K3ZMR1JacDVSbGowNFVlQW1tK0VoTGhkbWFHOHY2ck5CWDFL?=
 =?utf-8?B?d3JZRk55ajlaVDhrTlhpSkNudmowTERJZ2tlNDVUMEdsQ3UyZWtMNnlBY1pm?=
 =?utf-8?B?dCtabFVFemx6UlE1Qkg1TjEwb0ZidEY1a2twTGkzUEs0b0xtclpCT0tBakpp?=
 =?utf-8?B?WkhkcUVJMGdzVXJMQUNzZVVzMkFZUUlsZDVFdENYTUREQzV3SjFMS3VVZmlr?=
 =?utf-8?B?emdHQk9UdDNCanF2SEw4dXpsYjlBRjB2UWVPVVRURU00bEx5NWZPR2UrVFNa?=
 =?utf-8?B?VWxNZVFhNEtPcFpnSmo2Y1EwVTFkSFNFQmNxa3FMYjFVQ1k1TGhHaWFXV2Yw?=
 =?utf-8?B?cFNVZW1oOCtQZkFHNDBWQjlaUS9JY3RXUHpUaWVpQTB0Y1RGNVRvM0NEQkUy?=
 =?utf-8?B?VG4yR3dFaDRLZ0pIN1BreGZIMTNtWmg3VDB6Y3p0ZWhFUHNKamx3bDVtb1VT?=
 =?utf-8?B?cVVxWmQzTHlld3pHTlZWRk1jRURyRmMzdWZxWGlLTUFjT3lTQkpOVmNKYk5w?=
 =?utf-8?B?MFR5eVF1aXRBTFZ4NVpvNG1VT3NpMkIyNHl1aGtJOTJRRVhzOGNyQ0VjT08v?=
 =?utf-8?B?Y2VkTGVBTkxOcXpaUUNCa3FWVklueVVMSFRsSThNZEQ1UTNIRzNnS2hmeGsz?=
 =?utf-8?B?S1lVNHlDM0tYYzkxS0ZzejQwMEUyaXJjMlRDaTJrUzUxeGZsNTgvWU9YcG50?=
 =?utf-8?B?TGMvSHZwNnlrTUdXeUM0KzcwT0xNN0IwN2lTQURyYjNGWXZSY1JLSElLaHAw?=
 =?utf-8?B?KzJGUFk5RVlEQVZ4UDRxTUMxbE85akx4dmY4c1dXd1B2UDUvQmhTQnY2RTBS?=
 =?utf-8?B?akt0bGZna1NOZWpSZmVWaThmU2U4U0Z2RVdQbkJZb05DbVRxeTlZMERmNFox?=
 =?utf-8?B?ZHExZXQrdEhIVzROd1F0VFpYWGorNmdWU1JtS3FNeHI3YjNNTzc3Ly9rWUdU?=
 =?utf-8?B?M2c3eEFnSUxTVmwzdGlTM1MyOWNxZkNmR2cwTU51YmFxbFk4NkxvRmF2aGtV?=
 =?utf-8?B?TFpka0FOcStDWmRMOEhoL0RLR1VtR0pHN21aQitzQmU4ZXpyUlFQLzlsYVhw?=
 =?utf-8?B?d3o4WkRTT2lnZDFLQ3dLSkZPU2ZzczkzNHFHS3NwTTRJbWFrS2tEZlloK2FZ?=
 =?utf-8?B?OS8rTnNYdUZZSWFvTWhTK2ZTVkQvd1RlTGxIYkVuOHJqc3AzTHVuVS8zeStp?=
 =?utf-8?B?N2pWV1dXd0NVYUVWc2prUjJGUEdvMVphUUlwdWphbkltZ2tHK0pMeGwra3dT?=
 =?utf-8?B?RzVKMS9PdVNSbWgvZ3M2VVc4clVWa0pyck9WejhyazFRbWFxaFYzSDJlTkQz?=
 =?utf-8?B?ejlId2hqSWI4RHR0bFppMUxZNzc1UExsQ2hPNjhLNGViNGJQYWtHMUdJU0RH?=
 =?utf-8?B?VVdhRVBJbEpLRFVvOWZJaHFuaVpiajhCa0FkL3h6V0lyU0VndTlCVjZiZUNv?=
 =?utf-8?B?OElSeXRTMnBDU2JWY0lMWmJPN0NJQ05BUEdLcklDQ1FwZm8xM2NSOUJ0YWVq?=
 =?utf-8?B?Qm4wcS9QSG96S2kxZ3NTNzQzMTd6amd6K0ZnZWtpZFVVMjBJK28rTkdNdytK?=
 =?utf-8?Q?nvRtT4tILgsVd166fl/9EnZt8Nn4VxOXdC+0IsQqOiNb?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f13cc6a-a5d7-4763-a960-08dd8d6e8e5b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 13:53:33.3451 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VsV9hOLMOk1/9LKmYdyPpE+Ji+Zh5EKWXZLiMTUNjb05QsEfrIWG4n7Rph8EKzkJvJeLJCgoGQYmhfBMoybfug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6761
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

FWSEC-FRTS is the first firmware we need to run on the GSP falcon in
order to initiate the GSP boot process. Introduce the structure that
describes it.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 43 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index cb79d039948858e657c9a23a62ed27ff780ac169..1eb216307cd01d975b3d5beda1dc516f34b4b3f2 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -45,6 +45,49 @@ pub(crate) fn new(
     }
 }
 
+/// Structure used to describe some firmwares, notably FWSEC-FRTS.
+#[repr(C)]
+#[derive(Debug, Clone)]
+pub(crate) struct FalconUCodeDescV3 {
+    /// Header defined by `NV_BIT_FALCON_UCODE_DESC_HEADER_VDESC*` in OpenRM.
+    ///
+    /// Bits `31:16` contain the size of the header, after which the actual ucode data starts.
+    hdr: u32,
+    /// Stored size of the ucode after the header.
+    stored_size: u32,
+    /// Offset in `DMEM` at which the signature is expected to be found.
+    pub(crate) pkc_data_offset: u32,
+    /// Offset after the code segment at which the app headers are located.
+    pub(crate) interface_offset: u32,
+    /// Base address at which to load the code segment into `IMEM`.
+    pub(crate) imem_phys_base: u32,
+    /// Size in bytes of the code to copy into `IMEM`.
+    pub(crate) imem_load_size: u32,
+    /// Virtual `IMEM` address (i.e. `tag`) at which the code should start.
+    pub(crate) imem_virt_base: u32,
+    /// Base address at which to load the data segment into `DMEM`.
+    pub(crate) dmem_phys_base: u32,
+    /// Size in bytes of the data to copy into `DMEM`.
+    pub(crate) dmem_load_size: u32,
+    /// Mask of the falcon engines on which this firmware can run.
+    pub(crate) engine_id_mask: u16,
+    /// ID of the ucode used to infer a fuse register to validate the signature.
+    pub(crate) ucode_id: u8,
+    /// Number of signatures in this firmware.
+    pub(crate) signature_count: u8,
+    /// Versions of the signatures, used to infer a valid signature to use.
+    pub(crate) signature_versions: u16,
+    _reserved: u16,
+}
+
+// To be removed once that code is used.
+#[expect(dead_code)]
+impl FalconUCodeDescV3 {
+    pub(crate) fn size(&self) -> usize {
+        ((self.hdr & 0xffff0000) >> 16) as usize
+    }
+}
+
 pub(crate) struct ModInfoBuilder<const N: usize>(firmware::ModInfoBuilder<N>);
 
 impl<const N: usize> ModInfoBuilder<N> {

-- 
2.49.0

