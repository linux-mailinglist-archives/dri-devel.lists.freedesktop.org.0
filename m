Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7351CAA5EDE
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 15:00:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4E7E10E832;
	Thu,  1 May 2025 13:00:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="OBo+hJua";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2067.outbound.protection.outlook.com [40.107.92.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B155F10E858;
 Thu,  1 May 2025 13:00:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cNE9omqSLkeUDQpgY7zzHSp2rSYVP6z2+NHm+WfknkFhreoF4wztOeGqvGnHSaBp4hIS0csIJnZLuiefWQK+hezwGzcjIFwH54VZjHV+Wop7VwG1e/ofAJtZ8Xto4hlITgevh2MrxKNs92ndcG+zbwyCaYQr8/V+GH/7+2yH2MzIklNKqHOzxMzd1bXWpKrqcaUG5rUDwET/DB1LBow34t8/UGHLg4+4ZqniyuainVndUThPS32nxATO7DfdzgNGk8v9Zsolbej+a0MIs9q9f+/uSg0eOlszvR817pZOOvTv3FgbYMLJcYDs2AUW08wHrx5KXNgEswNzKKqvFgZSmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IJAmVrEBWuW0txu4zteKWCBDroHKCRL6uZxscrFRH5Y=;
 b=ZeRNPi0SBusLElA0ZwIFgTd8wjCHyBSEqOshQxqp6ZJ9r/F9fLe1PPar0seZpOKmDlqWMOtbf9QMIWCzl2Kd0ceUlXX7lDetqXhaP6GFnEfpixVoNLPtRaKhv4e608hsgqDpvafH5OhZHy0GwRUySqA0C7WGKVi951utastp/pKgccl4XSaYPbDz9AVoFM9vYl8Z0isXjvgws0RPLFvRh3X5IGc5z6LZhI8bzGnXWmvDUZCd5wD1WLVBwTMSP+A0sKu1sIlagRziwLuKPvKsAklP1WmG9dhwBKdqi+WWEDQTPMLbALeYqKSQpamn633+txAQf4hQrXqOB8s4gUrtYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IJAmVrEBWuW0txu4zteKWCBDroHKCRL6uZxscrFRH5Y=;
 b=OBo+hJuaQNQXiA4t3g5/PkRlMp0nZjSrFi64HaQJNz7yujJnuBFM69RIpRW1mKQ8vRe34yY6sU8ldr3v2FEg+nXLKz/m0KKxl0zAa4G71PIU/0xP+xxayceGpEKzNOPOvwYiu87AMDnoFBzo92akeNmeoMg7HPdf2/ZdyfcCdz+Vic28BAaTFKEL9qaAKW/6PmbvClrA0yk2u9VFJ+W4SHaqmV0s4pN2OKIm79f1V3EWQ4irSABENqYj77UzL4q7H2P3fZksI2DVHf/isgL3I7jUoriOq4aV4Q7i7rp0/h+KJelnAasdIaY44g9QmjClAhyY/rbj+WclPfBMPiqkTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV2PR12MB5919.namprd12.prod.outlook.com (2603:10b6:408:173::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Thu, 1 May
 2025 12:59:59 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8699.012; Thu, 1 May 2025
 12:59:59 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 01 May 2025 21:58:39 +0900
Subject: [PATCH v2 21/21] gpu: nova-core: load and run FWSEC-FRTS
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-nova-frts-v2-21-b4a137175337@nvidia.com>
References: <20250501-nova-frts-v2-0-b4a137175337@nvidia.com>
In-Reply-To: <20250501-nova-frts-v2-0-b4a137175337@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0225.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV2PR12MB5919:EE_
X-MS-Office365-Filtering-Correlation-Id: d2cfb11f-c4f3-42d7-e7f4-08dd88b013f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|10070799003|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VmE4a01rN1NVc29sSS9zSjVhK0RQczYwRlFhYndEeHgzOGx0NkRvUlovbXNh?=
 =?utf-8?B?THovdXVYMHM0ZlVicGttNFpsUElOZW11YzdNYjNpSWZJTU9teTVHcUllRnZt?=
 =?utf-8?B?Y1FwcFZ2Tk9iQWZ1T0c3RWRsQjNEb2VTM0ZKZXV2RmNLUzdOTWlLY04zYi95?=
 =?utf-8?B?QWdxNU9EdHJZeWhMbDZzdkdvRWVaaE1yMnl3S1JCNFJyUERCTjllOTZxMVVG?=
 =?utf-8?B?SG4yNFA2WUtaQ3VGVWVFTzJYSVExODZoK05uVmJ0Q1ZBbHZmbytEZk1jSE9i?=
 =?utf-8?B?ODRJZldSWGV6ZzViMGlFb3dvcGUxRzhRbEVvVVFxQXViTUVEUmRjbG5PekVk?=
 =?utf-8?B?U0FHS0VpTDVZRUdybTZ1K2ZhRDFDenVleHZwZWVBS3BXUXc1SVFyOUJJbnVn?=
 =?utf-8?B?R2dvKytsMUJ6YUJRMEI2bElqTWo4VXc4ckVPYmhxQW0vL0t6V2JqQjdaNllz?=
 =?utf-8?B?NFllQXlzQkhyUEZySys4Tk5zQkdQUDJoYTh3UHFIaitTcHRRVkxFY08wTWgx?=
 =?utf-8?B?WHFtdW1kM1g5OWdvRHBPTUM4MTZ5YWRlL3ZDbHRTWk4yTEFzdkZyT1V2SUlN?=
 =?utf-8?B?b1FsdFJudUdQQ2tDblhQekZWVW5uNGZrRWFLeHc5b3ZRRFJFcFo3S2NFUEwy?=
 =?utf-8?B?Sy9VcFpydXN3OWV6NS9nQnkyYlVkeWc3ZSthUkptcXY4bmdzSlAyUHZxY0ha?=
 =?utf-8?B?ZDZuTlhrY21UdUJKTlJUMmk5YVg5ams3blVZbDhGeVR6a0h3WFJwN1c4ZnNh?=
 =?utf-8?B?R3NkdWUrcVl6T2dNR3RwM0YrSjdvNENKNTVsRUlreS9jV2Qwb0FqRGdvZWZ0?=
 =?utf-8?B?TWo1ZHdhTS9KS0cydkRjdUZ4M3NKNCszaDVIb2lLamUycVhnZHZ0bDBVOHdT?=
 =?utf-8?B?aVFTb0pmNDE0dktvNHZtaCtubG5QOUhjRmlscklZNVRBMWhNSE91Ymk1S09H?=
 =?utf-8?B?VFMvQXQ4cTNYcklObElDY210ZUk2dGxBRTdEODZXOFR4d2lHYmE3SmpDUXBJ?=
 =?utf-8?B?MFo2RHVucU9tZFR5S253YktUVFgrY1lNa1FJWldvYTFaa0FmL0NvSUQrcnI2?=
 =?utf-8?B?MnMxdWdvbEJYT3Fvd3AyMGNqZUx4T0lUd1haZVkrTU1xS25JZ2twUFhJcnlm?=
 =?utf-8?B?V0N6YTlKYjNNK1BORkZqVVFXNDlyaUIrTUlLOUpyeGw1cytrVFlEQ3pEdmlu?=
 =?utf-8?B?ZndTOTJyQThmeThobHFpS1YzOVJvT3dQSFlUQ1VaNGxWNmFmYWt2Y210UWNv?=
 =?utf-8?B?ekM1c1ByWEhFa0F0RVR4V3hHZmZpNVhoSkJjZkhhNE5jQUlLV3dFTGdjYmxw?=
 =?utf-8?B?Smt5eS9Wa2U3cVJLeEZyN1FSOUQ4VGJJOGdjbCtYS1FzT3JDZmsvS0VuMTRl?=
 =?utf-8?B?WURpZm9lNkVBc1hWUkEreGU3bWNVai8wUnB4YzM1RkNhcEYwWjRjSGY0THVJ?=
 =?utf-8?B?UXkzVGMxMXFaQzc4emphNVZ2M2JON0VnVGlLMXA3cnhub0dpclVTNHJNWllF?=
 =?utf-8?B?R04ya1RjRHMzVEk3dDdOOThadEdaNGpoQUJ4UFNQL1haOGdpdHJBWTg1MzlW?=
 =?utf-8?B?ZlVzMkdUNU1xSGZQeUZCcTJFSXprc1hoWkhyT09YOFRrcjMvZ2x6SE1yOHRJ?=
 =?utf-8?B?ZkFZWlF5b1RpOWN6WjMvajU0elM1Z2JMclhFVFh2b3JDZmxxUG5XblRoK1E4?=
 =?utf-8?B?L0ozNnFBemJXdElWWGsvQ08vVGRnVUI1TWFPajJXL3gzU2VwSTArV0NSbTM3?=
 =?utf-8?B?ZERLYlAvNi9NYmtYZUUxajVQZGJRZXF3VVJUaVF4VERHalZJMmxWT2tMQTFt?=
 =?utf-8?B?Tk00b2FCWUtvQXBodjUyYVYrTi9GcjhCNVVyUjJId1V6MnM0Q1NiYVdKZmdx?=
 =?utf-8?B?Y3hmQ1A0U0RYSzR1YlQ0ZkFUcXFsa1JYOExUNlFKR08vaC9oZnRqY2VCSHYy?=
 =?utf-8?B?akhrTitLMEhoNXhKTHhqbCtGUnM1RXNrcU0wVUEvaENDQ3JLcG1SdFRHaHZ5?=
 =?utf-8?B?eWVKdTRudm5RPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(10070799003)(366016)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T09oUEZvbTdSNjEybFhIT1l3UmxGUVllSll2ZnlLSE9MMmVoM2EyeG9zQmV1?=
 =?utf-8?B?OXVqZjZadlViNHNzdkQ3M08rN3l2U3VNZWliVi9FWnlmdVBSUFBaYXlzZGNv?=
 =?utf-8?B?Rlp2L3RGcjdCdjhIUGcrbzZHcnNzT1FhYTJuby9BL3QxRmM2MjBOdWx0Q0JG?=
 =?utf-8?B?VllXaE43Z1V6RG5yUU5JTENveURSUnZSOFNLMFRQVlp6R0ZzWnA2WXpXWXVS?=
 =?utf-8?B?RVZTU2pRMW9xUGJmdFVHU2RlcGt2YTNWaWFqQTFTOERPZVpLSS9mb0dHRDA4?=
 =?utf-8?B?dThCVm45SzJLZHZuL3B3VDd1NnBIVS9EaUZVOXR1cUdLeXdmSU1JTXk2eUdt?=
 =?utf-8?B?MmEvdlBMZm5Xc0g2RmVmT1Z3NlQ2S3hldUZpNVdzbzl1RFpNK2ZidFNKOVNM?=
 =?utf-8?B?M2czeXN5a01BQmQ2RnV4L3A2MXNBZU5sZzNkcHpHM0tRblNmdWlJRlU4ZXh4?=
 =?utf-8?B?cDhPeVpiUExmNUU1aTVuMzdKdndwN1VEUkJYc25RakV0bG9GUC9CTmpOdFVi?=
 =?utf-8?B?bmZnT2dsVEQvbXFxV3NWSjY4NjNVdnI3S3dnL3psOGxLYnVmWDZkVDR4K3Zx?=
 =?utf-8?B?UUVlVVZwdFEwZlpPdGR1dmFTbjNzeUFUMXNLb3gvMjM3NTFGTmRqZS9kYWRP?=
 =?utf-8?B?U29JckZRaVNFeCtSWlVGL0dzc2w2bjJPT1AzQkpiOVdyeEk2YWFHOW1EVXFR?=
 =?utf-8?B?bWVidTZPcXJPVFdLY2I4bFRIa1NHUmF4N0MwdUlGUjZEclJ3UkVzVEpFUUtH?=
 =?utf-8?B?UldlelpYK1VCOVp5ZFZGb3NieTlFcUdxM040S2hub1RHZHE4OEVYN29pd04w?=
 =?utf-8?B?U2QvWmRiZi9aa1c5QzU3VnhieGxKbU1RR2tLZnhKOWFrdzFkK1lSMHZGRHFv?=
 =?utf-8?B?WjRqWnpML0Z6Q3ljWEpKRmZQYkpzWVp0K2pEMEo5OHBIT3ZxYUlYU3V0ZDVn?=
 =?utf-8?B?VGNKYVNyOSs5SFB5bDBjbENUVEFhNXo0ZDhBamRHeWkwRkZQVVZjREtCQjBv?=
 =?utf-8?B?Ny9XZDJYRWI4c205QnZYOEhCYnhET0Y5bTBxcXVTRFNaS3puZVl1SnZoU2ll?=
 =?utf-8?B?UU1PVFkxNm5RNVl0Y2FnS1NpcXRxYlJIY2FtNlF0bWdqYy96ZERBYVJFQ1Bz?=
 =?utf-8?B?RC94NVBCdDBZSXZvdy9EM3QwVWovUlZrYTBCTkdTbWJaVSs5MmRlSHJjcEJT?=
 =?utf-8?B?d3IrYkpRTElRLzFpM1h6QXNFZjlvcG95UW95UzFWMUZFVFdrWkNLV215OGo3?=
 =?utf-8?B?VEhvOExxV25KMlN5WUlKNmQ4Nkp5Ui9LS0hpM1c4WWJRRkZIa0JmY0kvUWEr?=
 =?utf-8?B?YTZBMzRFMko4L3g3SVZWS0FXajQ5TFZwUHJwN2JJRjlRRWlIVGhBbnMxNXBp?=
 =?utf-8?B?c1UvM09rQlBvc0NCbEpKYXhCR3YrWExYdldjTW1hOHZVVjZqdndHTDFha2pP?=
 =?utf-8?B?YTQwdHE1VEpQV2VkVEZtUlMwYWZKUXBNbHBoZUNaZ21qelBIc3dMWHhXVVBL?=
 =?utf-8?B?S1Y5MjVGWk9hMGxaRExyekRXWmdYVDFHWXBUMEU0ME50RU1EQi9VWDZld2tD?=
 =?utf-8?B?RHlwZzRiZUlteksxZ25MTWw5UHYyak5SZDVhMG52R1hNZXRQZ2xVVDl3Qm14?=
 =?utf-8?B?SGNtaHpMaFJ0eCtGQUFpaUcwNWdUY2pCT3lob0U4cERocCtpazBHM3pXQ0dk?=
 =?utf-8?B?MndGa2svQ3FZQ3lYcWhlM3lrUkx3OGtVaTc4MGI2UTFHNkhLQS9nR2NrMkUz?=
 =?utf-8?B?OVlzb0dvakF3cVVjY1FMMk4zYU5MUnpSSWdlU1Zpb0dqN0FBVkpnQW84MFlj?=
 =?utf-8?B?ZXc0YVdYWDJrWUZYTWMrVXlQYWYrdjVoOVF3R0RpUHM1S2FRR2xmYXNwOGxE?=
 =?utf-8?B?dmNNbitKZVExRFpDdVVLWGxTN2NpU2hVSlVTTFk5Qmp5bGVHclVCNEpURDJJ?=
 =?utf-8?B?Snc0VW1OS1BOM0RwViszTzdzOHdndEN6eE1hYkUxZmhNTm5IUXdFbW41ekRh?=
 =?utf-8?B?dHowNE50aVZiZkhzWDY4ODZNU2haODZESldaWlgyTWNCaU05cHlEcnc3dDBk?=
 =?utf-8?B?RlZGZ3JIeXo3MFZJZ0JMdTNvTStIRndiZXh3MTVsclBQbHBDemlQZjdFcHVN?=
 =?utf-8?B?a3BKWWlUVG52NGpUUDZ6ajFTNnVYVnZ5UjFwQnYyVVp6UzhzYjIxbVlqZ0FZ?=
 =?utf-8?Q?lluRFDH1l5SJvU5TGbFDrzMtfRiyi8ztQrlxi4m9hrZG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2cfb11f-c4f3-42d7-e7f4-08dd88b013f5
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 12:59:58.8690 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sP8vsoSDLqZWvvMWWuYOJADOpQD7a17CNAMJJgiXIpH2fKNEytEHHl8LG3aJa7UKEFFp0STOxVqMks8CMOXJtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5919
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

With all the required pieces in place, load FWSEC-FRTS onto the GSP
falcon, run it, and check that it completed successfully by carving out
the WPR2 region out of framebuffer memory.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs |  3 ---
 drivers/gpu/nova-core/gpu.rs    | 60 ++++++++++++++++++++++++++++++++++++++++-
 drivers/gpu/nova-core/regs.rs   | 15 +++++++++++
 3 files changed, 74 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 7cae45645e548bab5b85cb53880898cedbae778a..e9ee0c83dfc521db4d48dd92f963daa9fbae0cb2 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -2,9 +2,6 @@
 
 //! Falcon microprocessor base support
 
-// To be removed when all code is used.
-#![expect(dead_code)]
-
 use core::time::Duration;
 use hal::FalconHal;
 use kernel::bindings;
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index f5ff319db39521cd8ea331bedc27536f7562a5f7..a46768d18ac35158292c3bc2d25c8aca82833391 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -251,7 +251,7 @@ pub(crate) fn new(
 
         let bios = Vbios::new(pdev, &bar)?;
 
-        let _fwsec_frts = FwsecFirmware::new(
+        let fwsec_frts = FwsecFirmware::new(
             &gsp_falcon,
             pdev.as_ref(),
             &bar,
@@ -262,6 +262,64 @@ pub(crate) fn new(
             },
         )?;
 
+        // Check that the WPR2 region does not already exists - if it does, the GPU needs to be
+        // reset.
+        if with_bar!(bar, |b| regs::NV_PFB_PRI_MMU_WPR2_ADDR_HI::read(b).hi_val())? != 0 {
+            dev_err!(
+                pdev.as_ref(),
+                "WPR2 region already exists - GPU needs to be reset to proceed\n"
+            );
+            return Err(EBUSY);
+        }
+
+        // Reset falcon, load FWSEC-FRTS, and run it.
+        gsp_falcon.reset(&bar)?;
+        gsp_falcon.dma_load(&bar, &fwsec_frts)?;
+        let (mbox0, _) = gsp_falcon.boot(&bar, Some(0), None)?;
+        if mbox0 != 0 {
+            dev_err!(pdev.as_ref(), "FWSEC firmware returned error {}\n", mbox0);
+            return Err(EINVAL);
+        }
+
+        // SCRATCH_E contains FWSEC-FRTS' error code, if any.
+        let frts_status = with_bar!(bar, |b| regs::NV_PBUS_SW_SCRATCH_0E::read(b)
+            .frts_err_code())?;
+        if frts_status != 0 {
+            dev_err!(
+                pdev.as_ref(),
+                "FWSEC-FRTS returned with error code {:#x}",
+                frts_status
+            );
+            return Err(EINVAL);
+        }
+
+        // Check the WPR2 has been created as we requested.
+        let (wpr2_lo, wpr2_hi) = with_bar!(bar, |b| {
+            (
+                (regs::NV_PFB_PRI_MMU_WPR2_ADDR_LO::read(b).lo_val() as u64) << 12,
+                (regs::NV_PFB_PRI_MMU_WPR2_ADDR_HI::read(b).hi_val() as u64) << 12,
+            )
+        })?;
+        if wpr2_hi == 0 {
+            dev_err!(
+                pdev.as_ref(),
+                "WPR2 region not created after running FWSEC-FRTS\n"
+            );
+
+            return Err(ENOTTY);
+        } else if wpr2_lo != fb_layout.frts.start {
+            dev_err!(
+                pdev.as_ref(),
+                "WPR2 region created at unexpected address {:#x} ; expected {:#x}\n",
+                wpr2_lo,
+                fb_layout.frts.start,
+            );
+            return Err(EINVAL);
+        }
+
+        dev_info!(pdev.as_ref(), "WPR2: {:#x}-{:#x}\n", wpr2_lo, wpr2_hi);
+        dev_info!(pdev.as_ref(), "GPU instance built\n");
+
         Ok(pin_init!(Self {
             spec,
             bar,
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 15ec9b7e69694ff198b5353d562fc1aff5eefd3f..3acec36f2d5701af4a752808e86d71d5f200359b 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -43,6 +43,13 @@ pub(crate) fn chipset(self) -> Result<Chipset, Error> {
     }
 }
 
+/* PBUS */
+
+// TODO: this is an array of registers.
+register!(NV_PBUS_SW_SCRATCH_0E@0x00001438  {
+    31:16   frts_err_code as u16;
+});
+
 /* PFB */
 
 register!(NV_PFB_NISO_FLUSH_SYSMEM_ADDR @ 0x00100c10 {
@@ -59,6 +66,14 @@ pub(crate) fn chipset(self) -> Result<Chipset, Error> {
     30:30   ecc_mode_enabled as bool;
 });
 
+register!(NV_PFB_PRI_MMU_WPR2_ADDR_LO@0x001fa824  {
+    31:4    lo_val as u32;
+});
+
+register!(NV_PFB_PRI_MMU_WPR2_ADDR_HI@0x001fa828  {
+    31:4    hi_val as u32;
+});
+
 /* PGC6 */
 
 register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK @ 0x00118128 {

-- 
2.49.0

